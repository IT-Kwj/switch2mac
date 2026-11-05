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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_64 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_88 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_98 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 m_82 [[user(locn13)]];
    float4 m_78 [[user(locn14)]];
    float4 m_96 [[user(locn15)]];
    float4 m_92 [[user(locn16)]];
    float4 m_94 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_80 [[attribute(0)]];
    float4 m_70 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_62 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3525 = false;
    bool _391 = false;
    bool _241 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_46.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (!_121)
    {
        out.m_49.x = 0.0;
    }
    int _127 = 0;
    if (!_121)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3829 = as_type<float>(_131);
        out.gl_Position.z = _3829;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_51.w;
    float _137 = float(_117);
    float _139 = -_135;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_135);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    bool _153 = _141 >= _137;
    bool _155 = !_151;
    bool _157 = _153 || _155;
    float _159 = 1.0 / _137;
    float _161 = _135;
    float _163 = _141;
    if (_157)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _161;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    float _167 = _141 * _159;
    float _169 = _167;
    if (_157)
    {
        float _171 = _165 * 5.0;
        _133 = as_type<int>(_171);
    }
    int _173 = _133;
    out.m_53.x = _167;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3902 = as_type<float>(_173);
        out.gl_Position.z = _3902;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_58.x;
    float _179 = in.m_58.y;
    float _181 = in.m_58.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _201 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _205 = !_189;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _199);
    float _211 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _201);
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _203);
    bool _215 = !_185;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_191;
    float _221 = _211;
    float _239;
    if (!_219)
    {
        float _223 = in.m_60.x;
        float _225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _231 = _229 * _225;
        float _233 = floor(_231);
        float _235 = -_233;
        float _237 = _231 + _235;
        _239 = _237;
        _241 = true;
    }
    else
    {
        _239 = _167;
    }
    _241 = false;
    float _243 = _239;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _243 + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _261 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _263 = isnan(_243);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = in.m_62.x;
    float _275 = in.m_62.y;
    bool _277 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _279 = isnan(_243);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = 1.0 / _259;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = -_271;
    float _295 = _293 + 1.0;
    float _297 = 1.0 / _255;
    float _299 = _251 * _289;
    float _301 = _247 * _297;
    bool _303 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_243);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _319;
    float _323 = -_313;
    float _325 = _323 + 1.0;
    float _327 = fma(_317, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _329 = fma(_321, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _331 = _313 * _295;
    float _333 = _287 * _325;
    float _335 = -_287;
    float _337 = _335 + 1.0;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _347 = _327 * _333;
    float _349 = _329 * _333;
    float _351 = fma(_341, _299, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _353 = fma(_345, _299, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _355 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].x, _347);
    float _357 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].y, _349);
    float _359 = fma(_351, _331, _355);
    float _361 = fma(_353, _331, _357);
    float _363 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[145].x, _359);
    float _365 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[145].y, _361);
    float _367 = _363 * _273;
    float _369 = _365 * _275;
    bool _371 = !_291;
    float _389;
    if (!_371)
    {
        float _373 = in.m_60.x;
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _377 = _373 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        _389 = _167;
    }
    _391 = false;
    float _393 = _389;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _397 = _393 + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _403 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _405 = isnan(_393);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _423 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _425 = isnan(_393);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = 1.0 / _401;
    float _437 = -_413;
    float _439 = _437 + 1.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _441;
    bool _445 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _447 = isnan(_393);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = _433 * _439;
    float _459 = -_433;
    float _461 = _459 + 1.0;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _465 = 1.0 / _417;
    float _467 = _455 * _461;
    float _469 = -_455;
    float _471 = _469 + 1.0;
    float _473 = 1.0 / _421;
    float _475 = _443 * _435;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _481 = fma(_475, _397, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _483 = _479 * _465;
    bool _485 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _487 = isnan(_393);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _497;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _503 = _393 + _501;
    float _505 = _481 * _467;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _509 = _393 + _507;
    float _511 = -_495;
    float _513 = _511 + 1.0;
    float _515 = fma(_483, _503, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _517 = _499 * _473;
    float _519 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[115].x, _505);
    float _521 = _413 * _513;
    float _523 = fma(_517, _509, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _525 = fma(_515, _457, _519);
    float _527 = fma(_523, _521, _525);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _535 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[118].x, _527);
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _537;
    out.m_64.y = _539;
    out.m_64.z = _541;
    out.m_64.w = _543;
    bool _545 = !_463;
    float _547 = _413;
    if (!_545)
    {
        float _549 = in.m_60.x;
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _553 = _549 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _169 = _563;
    }
    float _565 = _169;
    float _567 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _569 = int(_567);
    float _571 = in.m_60.x;
    float _573 = in.m_60.y;
    float _575 = _159 * _141;
    float _577 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _581 = _579 != 0;
    float _583 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _585 = int(_583);
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _589 = float(_569);
    float _591 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _593 = int(_591);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_581)
    {
        _547 = 1.0;
    }
    float _599 = _547;
    float _601 = _599;
    if (!_581)
    {
        _601 = 7.345489978790283203125;
    }
    float _603 = _601;
    float _605 = float(_585);
    float _607 = 1.0 / _589;
    float _609 = _603 * _571;
    float _611 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _613 = int(_611);
    float _615 = float(uint(_593));
    bool _617 = _593 == 0;
    float _619 = 1.0 / _605;
    float _621 = _607 * _141;
    float _623 = 1.0 / _615;
    float _625 = float(uint(_613));
    int _627 = ~_613;
    int _629 = _627 + 1;
    float _631 = trunc(_621);
    int _633 = int(_631);
    float _635 = _619 * _141;
    int _637 = ~_593;
    int _639 = _637 + 1;
    float _641 = 1.0 / _625;
    int _643 = as_type<int>(_623) + (-2);
    float _645 = trunc(_635);
    int _647 = int(_645);
    float _649 = float(uint(_633));
    float _651 = as_type<float>(_643) * _649;
    int _653 = as_type<int>(_641) + (-2);
    float _655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _657 = ~_613;
    int _659 = _657 + 1;
    float _661 = float(uint(_647));
    float _663 = trunc(_651);
    float _665 = precise::max(_663, 0.0);
    uint _668 = uint(_665);
    float _670 = as_type<float>(_653) * _661;
    float _672 = trunc(_670);
    float _674 = precise::max(_672, 0.0);
    uint _676 = uint(_674);
    float _678 = _655 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _680 = _639 * int(_668);
    int _682 = _680 + _633;
    float _684 = floor(_609);
    float _686 = float(uint(_682));
    int _688 = _659 * int(_676);
    int _690 = _688 + _647;
    float _692 = as_type<float>(_643) * _686;
    float _694 = _686;
    if (_581)
    {
        _694 = 1.0;
    }
    float _696 = _694;
    float _698 = float(uint(_690));
    float _700 = trunc(_692);
    float _702 = precise::max(_700, 0.0);
    uint _704 = uint(_702);
    float _706 = _696;
    float _708 = _698;
    if (!_581)
    {
        _706 = 1.2345600128173828125;
    }
    float _710 = _706;
    float _712 = -_684;
    float _714 = _609 + _712;
    float _716 = as_type<float>(_653) * _698;
    if (_581)
    {
        _708 = _571;
    }
    float _718 = _708;
    float _720 = _718;
    if (!_581)
    {
        _720 = _573;
    }
    float _722 = _720;
    float _724 = trunc(_716);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    float _730 = _710 * _722;
    int _732 = ~_593;
    int _734 = _732 + 1;
    int _736 = int(_668) + int(_704);
    float _738 = floor(_730);
    float _740 = float(_593);
    float _742 = float(_633);
    int _744 = _734 * _736;
    int _746 = _744 + _633;
    int _748 = int(_676) + int(_728);
    float _750 = _714 * _740;
    float _752 = _740 * _575;
    bool _754 = _742 >= _740;
    bool _756 = isnan(_742);
    bool _758 = _754 || _756;
    bool _760 = isnan(_740);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    bool _766 = uint(_746) >= uint(_593);
    int _768 = _629 * _748;
    int _770 = _768 + _647;
    float _772 = -_738;
    float _774 = _730 + _772;
    float _776 = trunc(_764);
    int _778 = int(_776);
    bool _780 = !_766;
    int _782 = _780 ? 0 : (-1);
    bool _784 = uint(_770) >= uint(_613);
    float _786 = in.m_60.z;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _790 = _788 != 0;
    int _792 = ~_736;
    int _794 = _792 + _782;
    int _796 = _794 + 1;
    float _798 = trunc(_750);
    int _800 = int(_798);
    bool _802 = !_790;
    int _804 = _802 ? 0 : 1;
    float _806 = float(_613);
    int _808 = abs(_804);
    int _810 = _593 * _796;
    int _812 = _810 + _633;
    float _814 = float(_647);
    float _816 = _806 * _575;
    int _818 = ~_778;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    bool _824 = !_784;
    int _826 = _824 ? 0 : (-1);
    bool _828 = !_617;
    int _830 = _828 ? _812 : (-1);
    float _832 = trunc(_816);
    int _834 = int(_832);
    bool _836 = _814 >= _806;
    bool _838 = isnan(_814);
    bool _840 = _836 || _838;
    bool _842 = isnan(_806);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = _774 * _806;
    bool _850 = _573 > 0.5;
    int _852 = _830 * _822;
    int _854 = ~_748;
    int _856 = _854 + _826;
    int _858 = _856 + 1;
    int _860 = _800 * _808;
    int _862 = _860 + _633;
    bool _864 = _786 > 0.5;
    float _866 = trunc(_848);
    int _868 = int(_866);
    float _870 = -_217;
    int _872 = _850 ? as_type<int>(_870) : as_type<int>(_217);
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _876 = _874 != 0;
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _880 = _878 != 0;
    float _882 = -_207;
    int _884 = _864 ? as_type<int>(_882) : as_type<int>(_207);
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _888 = _886 != 0;
    float _890 = trunc(_846);
    int _892 = int(_890);
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _896 = _894 != 0;
    bool _898 = !_876;
    float _900 = _898 ? _217 : as_type<float>(_872);
    bool _902 = !_880;
    float _904 = _902 ? _207 : as_type<float>(_884);
    bool _906 = !_888;
    int _908 = _906 ? 0 : 1;
    float _910 = trunc(_752);
    int _912 = int(_910);
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _924 = _922 != 0;
    float _926 = _900 + 0.5;
    int _928 = abs(_908);
    int _930 = _593 + (-1);
    bool _932 = !_920;
    int _934 = _932 ? 0 : 1;
    bool _936 = !_896;
    int _938 = _936 ? 0 : 1;
    int _940 = _778 * _930;
    int _942 = _940 + _852;
    bool _944 = !_916;
    int _946 = _944 ? 0 : 1;
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _950 = _948 != 0;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _954 = _952 != 0;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _958 = _956 != 0;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _962 = _960 != 0;
    int _964 = abs(_934);
    int _966 = _868 * _928;
    int _968 = _966 + _647;
    int _970 = abs(_946);
    int _972 = _613 * _858;
    int _974 = _972 + _647;
    bool _976 = !_924;
    int _978 = _976 ? 0 : 1;
    bool _980 = !_954;
    int _982 = _980 ? 0 : 1;
    bool _984 = _613 == 0;
    int _986 = abs(_978);
    int _988 = _942 * _964;
    int _990 = ~_892;
    int _992 = _990 + 1;
    int _994 = _992 + 1;
    bool _996 = !_984;
    int _998 = _996 ? _974 : (-1);
    int _1000 = _912 * _970;
    int _1002 = _1000 + _988;
    int _1004 = _613 + (-1);
    int _1006 = _998 * _994;
    int _1008 = abs(_938);
    int _1010 = _862 * _986;
    int _1012 = _1010 + _1002;
    int _1014 = abs(_982);
    int _1016 = _892 * _1004;
    int _1018 = _1016 + _1006;
    bool _1020 = !_950;
    int _1022 = _1020 ? 0 : 1;
    int _1024 = _800 * _1008;
    int _1026 = _1024 + _1012;
    bool _1028 = !_958;
    int _1030 = _1028 ? 0 : 1;
    int _1032 = abs(_1022);
    bool _1034 = !_962;
    int _1036 = _1034 ? 0 : 1;
    int _1038 = abs(_1030);
    int _1040 = _1018 * _1014;
    float _1042 = float(uint(_1026));
    int _1044 = abs(_1036);
    int _1046 = _834 * _1032;
    int _1048 = _1046 + _1040;
    float _1050 = as_type<float>(_643) * _1042;
    int _1052 = ~_593;
    int _1054 = _1052 + 1;
    int _1056 = _968 * _1038;
    int _1058 = _1056 + _1048;
    bool _1060 = _593 == 0;
    float _1062 = trunc(_1050);
    float _1064 = precise::max(_1062, 0.0);
    uint _1066 = uint(_1064);
    int _1068 = _868 * _1044;
    int _1070 = _1068 + _1058;
    int _1072 = ~_593;
    int _1074 = _1072 + 1;
    int _1076 = ~_613;
    int _1078 = _1076 + 1;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1082 = float(uint(_1070));
    float _1084 = float(uint(_862));
    float _1086 = as_type<float>(_653) * _1082;
    float _1088 = as_type<float>(_643) * _1084;
    int _1090 = _1074 * int(_1066);
    int _1092 = _1090 + _1026;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1098 = trunc(_1086);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    float _1104 = float(uint(_1092));
    float _1106 = as_type<float>(_643) * _1104;
    float _1108 = trunc(_1088);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    int _1114 = _1078 * int(_1102);
    int _1116 = _1114 + _1070;
    float _1118 = trunc(_1106);
    float _1120 = precise::max(_1118, 0.0);
    uint _1122 = uint(_1120);
    float _1124 = _573 * 2.0;
    float _1126 = float(uint(_1116));
    float _1128 = floor(_1124);
    float _1130 = as_type<float>(_653) * _1126;
    int _1132 = ~_613;
    int _1134 = _1132 + 1;
    int _1136 = int(_1066) + int(_1122);
    float _1138 = trunc(_1130);
    float _1140 = precise::max(_1138, 0.0);
    uint _1142 = uint(_1140);
    int _1144 = _1054 * _1136;
    int _1146 = _1144 + _1026;
    float _1148 = 1.0 / _1096;
    bool _1150 = uint(_1146) >= uint(_593);
    bool _1152 = !_1150;
    int _1154 = _1152 ? 0 : (-1);
    int _1156 = ~_1136;
    int _1158 = _1156 + _1154;
    int _1160 = _1158 + 1;
    float _1162 = _786 * 2.0;
    int _1164 = int(_1102) + int(_1142);
    float _1166 = float(uint(_968));
    int _1168 = _593 * _1160;
    int _1170 = _1168 + _1026;
    float _1172 = _573 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1174 = _1134 * _1164;
    int _1176 = _1174 + _1070;
    float _1178 = floor(_1162);
    float _1180 = as_type<float>(_653) * _1166;
    bool _1182 = !_1060;
    int _1184 = _1182 ? _1170 : (-1);
    float _1186 = fma(_1172, -2.0, _1080);
    bool _1188 = uint(_1176) >= uint(_613);
    int _1190 = _1184 & 3;
    bool _1192 = _1190 != 0;
    int _1194 = _1184 & 3;
    bool _1196 = _1194 != 0;
    float _1198 = trunc(_1180);
    float _1200 = precise::max(_1198, 0.0);
    uint _1202 = uint(_1200);
    bool _1204 = !_1188;
    int _1206 = _1204 ? 0 : (-1);
    int _1208 = _1192 ? 0 : 1;
    bool _1210 = uint(_1194) >= 2u;
    bool _1212 = uint(_1194) > 1u;
    int _1214 = ~_1164;
    int _1216 = _1214 + _1206;
    int _1218 = _1216 + 1;
    int _1220 = _1210 ? 0 : 1;
    bool _1222 = _1194 != 3;
    int _1224 = _613 * _1218;
    int _1226 = _1224 + _1070;
    int _1228 = ~_1208;
    int _1230 = _1228 + 1;
    int _1232 = _1230 + 1;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1236 = _1234 != 0;
    bool _1238 = !_984;
    int _1240 = _1238 ? _1226 : (-1);
    int _1242 = _1232;
    float _1244 = as_type<float>(_862);
    if (!_1212)
    {
        int _1246 = ~_1208;
        int _1248 = _1246 + 1;
        _1242 = _1248;
    }
    int _1250 = _1242;
    int _1252 = _1240 & 3;
    bool _1254 = _1252 != 0;
    int _1256 = ~_1220;
    int _1258 = _1256 + 1;
    int _1260 = _1258 + 1;
    int _1262 = _1260;
    if (_1222)
    {
        int _1264 = ~_1220;
        int _1266 = _1264 + 1;
        _1262 = _1266;
    }
    int _1268 = _1262;
    bool _1270 = uint(_1252) > 1u;
    float _1272 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1274 = log2(_1272);
    int _1276 = _1240 & 3;
    bool _1278 = _1276 != 0;
    if (_1236)
    {
        _597 = 0;
    }
    int _1280 = _597;
    int _1282 = _1278 ? 0 : 1;
    int _1284 = _1280;
    if (!_1236)
    {
        _1284 = 2;
    }
    int _1286 = _1284;
    int _1288 = ~_1282;
    int _1290 = _1288 + 1;
    int _1292 = _1290 + 1;
    bool _1294 = _573 > 0.5;
    int _1296 = _1292;
    if (!_1270)
    {
        int _1298 = ~_1282;
        int _1300 = _1298 + 1;
        _1296 = _1300;
    }
    int _1302 = _1296;
    float _1304 = _571 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1306 = _1274 * _141;
    bool _1308 = _1252 != 3;
    bool _1310 = _1286 != 2;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1314 = -_207;
    float _1316 = _1294 ? _1314 : _207;
    float _1318 = exp2(_1306);
    bool _1320 = uint(_1252) >= 2u;
    float _1322 = -_1312;
    float _1324 = fma(_1304, 2.0, _1322);
    float _1326 = _571 * 2.0;
    float _1328 = _1320 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1330 = floor(_1326);
    int _1332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1334 = _1332 != 0;
    int _1336 = ~as_type<int>(_1328);
    int _1338 = _1336 + 1;
    int _1340 = _1338 + 1;
    int _1342 = _1340;
    float _1344 = _1328;
    float _1346 = _1316;
    if (_1308)
    {
        int _1348 = ~as_type<int>(_1328);
        int _1350 = _1348 + 1;
        _1342 = _1350;
    }
    int _1352 = _1342;
    if (_1310)
    {
        _1344 = _571;
    }
    float _1354 = _1344;
    float _1356 = _1354;
    if (!_1310)
    {
        _1356 = _786;
    }
    float _1358 = _1356;
    bool _1360 = !_1334;
    int _1362 = _1360 ? 0 : 1;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1366 = _1364 != 0;
    float _1368 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1370 = _571 > 0.5;
    float _1372 = -_1318;
    float _1374 = _1372 + 1.0;
    bool _1376 = !_1366;
    float _1378 = _1376 ? _207 : _1316;
    float _1380 = -_587;
    float _1382 = fma(_1368, 2.0, _1380);
    int _1384 = ~_593;
    int _1386 = _1384 + 1;
    float _1388 = -_217;
    int _1390 = _1370 ? as_type<int>(_1388) : as_type<int>(_217);
    float _1392 = -_141;
    float _1394 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1382);
    bool _1396 = _1330 > 0.0;
    int _1398 = _1386 * int(_1112);
    int _1400 = _1398 + _862;
    bool _1402 = _1330 >= 0.0;
    bool _1404 = isnan(_1330);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan(0.0);
    bool _1410 = _1406 || _1408;
    float _1412 = fma(_678, _926, _1394);
    int _1414 = ~_613;
    int _1416 = _1414 + 1;
    if (_1310)
    {
        _1346 = _573;
    }
    float _1418 = _1346;
    float _1420 = _1418;
    if (!_1310)
    {
        _1420 = _571;
    }
    float _1422 = _1420;
    int _1424 = _1416 * int(_1202);
    int _1426 = _1424 + _968;
    float _1428 = float(uint(_1400));
    bool _1430 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1432 = isnan(0.0);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1438 = _1434 || _1436;
    float _1440 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1442 = float(uint(_1426));
    float _1444 = as_type<float>(_643) * _1428;
    float _1446 = _1438 ? _1374 : 0.0;
    float _1448 = fma(_1440, -2.0, _595);
    bool _1450 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1452 = isnan(1.0);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1458 = _1454 || _1456;
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1462 = 1.0 + _1460;
    float _1464 = as_type<float>(_653) * _1442;
    float _1466 = trunc(_1444);
    float _1468 = precise::max(_1466, 0.0);
    uint _1470 = uint(_1468);
    float _1472 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1448);
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1476 = 1.0 / _1462;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1482 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1474);
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1486 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1478);
    float _1488 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1480);
    float _1490 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1482);
    float _1492 = trunc(_1464);
    float _1494 = precise::max(_1492, 0.0);
    uint _1496 = uint(_1494);
    float _1498 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1484);
    float _1500 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1186);
    float _1502 = -_141;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1324);
    float _1506 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1486);
    float _1508 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1488);
    float _1510 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1498);
    int _1512 = int(_1112) + int(_1470);
    if (_1458)
    {
        float _1514 = _1446 * _1476;
        _163 = _1514;
    }
    float _1516 = _163;
    int _1518 = ~_593;
    int _1520 = _1518 + 1;
    float _1522 = in.m_46.x;
    float _1524 = in.m_46.y;
    float _1526 = in.m_46.z;
    int _1528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1530 = _1528 != 0;
    float _1532 = _1378 + (-0.5);
    int _1534 = ~_613;
    int _1536 = _1534 + 1;
    int _1538 = _1520 * _1512;
    int _1540 = _1538 + _862;
    int _1542 = _1410 ? 0 : 1;
    float _1544 = -_1490;
    float _1546 = _1544 + 1.0;
    bool _1548 = !_1530;
    float _1550 = _1548 ? _217 : as_type<float>(_1390);
    float _1552 = -_1532;
    float _1554 = -_1500;
    float _1556 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1554);
    bool _1558 = _1128 > 0.0;
    float _1560 = -_1506;
    float _1562 = _1560 + 1.0;
    bool _1564 = _1128 >= 0.0;
    bool _1566 = isnan(_1128);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan(0.0);
    bool _1572 = _1568 || _1570;
    float _1574 = -_1508;
    float _1576 = _1574 + 1.0;
    int _1578 = int(_1202) + int(_1496);
    int _1580 = ~_1542;
    int _1582 = _1580 + 1;
    int _1584 = _1582 + 1;
    int _1586 = _1584;
    if (!_1396)
    {
        int _1588 = ~_1542;
        int _1590 = _1588 + 1;
        _1586 = _1590;
    }
    int _1592 = _1586;
    bool _1594 = uint(_1540) >= uint(_593);
    int _1596 = _1536 * _1578;
    int _1598 = _1596 + _968;
    float _1600 = _1524 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1602 = _1572 ? 0 : 1;
    float _1604 = _1524 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1606 = !_1594;
    int _1608 = _1606 ? 0 : (-1);
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1610;
    bool _1614 = uint(_1598) >= uint(_613);
    float _1616 = fma(_1522, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1600);
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1620 = _1618 != 0;
    float _1622 = _1612 * _1148;
    bool _1624 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1626 = isnan(_565);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1632 = _1628 || _1630;
    float _1634 = float(_1632);
    float _1636 = fma(_1522, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1604);
    int _1638 = ~_1602;
    int _1640 = _1638 + 1;
    int _1642 = _1640 + 1;
    int _1644 = _1642;
    if (!_1558)
    {
        int _1646 = ~_1602;
        int _1648 = _1646 + 1;
        _1644 = _1648;
    }
    int _1650 = _1644;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1654 = _565 + _1652;
    bool _1656 = !_1614;
    int _1658 = _1656 ? 0 : (-1);
    float _1660 = -_1634;
    float _1662 = _1660 + 1.0;
    int _1664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1666 = _1664 != 0;
    int _1668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1670 = _1668 != 0;
    int _1672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1674 = _1672 != 0;
    float _1676 = _1524 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1678 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1680 = isnan(_565);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1686 = _1682 || _1684;
    float _1688 = float(_1686);
    bool _1690 = !_1196;
    int _1692 = _1690 ? 0 : 1;
    float _1694 = fma(_1522, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1676);
    float _1696 = fma(_1622, _1654, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1698 = _1688 * _1662;
    float _1700 = _1550 + 0.5;
    float _1702 = fma(_1526, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1694);
    bool _1704 = _1178 >= 0.0;
    bool _1706 = isnan(_1178);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan(0.0);
    bool _1712 = _1708 || _1710;
    float _1714 = _1696 * _1698;
    float _1716 = fma(_1700, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1504);
    float _1718 = -_1688;
    float _1720 = _1718 + 1.0;
    int _1722 = _1712 ? 0 : 1;
    bool _1724 = _1178 > 0.0;
    float _1726 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1714);
    float _1728 = -_1546;
    float _1730 = fma(_1550, _1728, _1716);
    float _1732 = fma(_1378, _1562, _1556);
    float _1734 = fma(_1526, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1616);
    float _1736 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1726);
    float _1738 = _1702 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1740 = _1184 >> 31;
    float _1742 = _573 + _571;
    int _1744 = _1240 >> 31;
    float _1746 = fma(_1526, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1636);
    float _1748 = _1734 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1752 = _1738 + _1750;
    int _1754 = _1740 & 3;
    float _1756 = _1742 + (-1.0);
    float _1758 = _1746 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1760 = _1744 & 3;
    float _1762 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1764 = _1748 + _1762;
    float _1766 = _1752 * _1752;
    int _1768 = _1184 + _1754;
    out.m_66.x = _1730;
    out.m_66.y = _1732;
    float _1770 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1772 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1774 = _1758 + _1772;
    float _1776 = fma(_1764, _1764, _1766);
    int _1778 = _1768 >> 2;
    float _1780 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1782 = !_1254;
    int _1784 = _1782 ? 0 : 1;
    float _1786 = fma(_1774, _1774, _1776);
    int _1788 = _1778 << 4;
    int _1790 = _1788 + 368;
    float _1792 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1780);
    int _1794 = _1240 + _1760;
    float _1796 = _577 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1798 = _1194 != 3;
    float _1800 = rsqrt(_1786);
    int _1802 = _1794 >> 2;
    float _1804 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1792);
    int _1806 = ~_1722;
    int _1808 = _1806 + 1;
    int _1810 = _1808 + 1;
    float _1812 = _1736 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1814 = _1802 << 4;
    int _1816 = _1814 + 512;
    uint _1818 = uint(int(uint(_1790) >> uint(2)));
    uint _1820 = uint(int(uint(int(_1818)) >> uint(2)));
    int _1822 = int(_1818) & 3;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[int(_1820)][_1822];
    int _1826 = int(_1818) + 1;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    int _1830 = _1826 & 3;
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[int(_1828)][_1830];
    int _1834 = _1810;
    float _1836 = _1758;
    if (!_1724)
    {
        int _1838 = ~_1722;
        int _1840 = _1838 + 1;
        _1834 = _1840;
    }
    int _1842 = _1834;
    float _1844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1846 = !_1798;
    int _1848 = _1846 ? 0 : (-1);
    out.m_68.w = _1812;
    bool _1850 = _1252 != 3;
    int _1852 = abs(_1268);
    uint _1854 = uint(int(uint(_1816) >> uint(2)));
    uint _1856 = uint(int(uint(int(_1854)) >> uint(2)));
    int _1858 = int(_1854) & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    int _1862 = int(_1854) + 1;
    uint _1864 = uint(int(uint(_1862) >> uint(2)));
    int _1866 = _1862 & 3;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[int(_1864)][_1866];
    bool _1870 = !_1850;
    int _1872 = _1870 ? 0 : (-1);
    bool _1874 = _1804 >= 0.0;
    float _1876 = _1796 * _1800;
    int _1878 = abs(_1352);
    int _1880 = abs(_1362);
    int _1882 = _1790 + 8;
    uint _1884 = uint(int(uint(_1882) >> uint(2)));
    uint _1886 = uint(int(uint(int(_1884)) >> uint(2)));
    int _1888 = int(_1884) & 3;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[int(_1886)][_1888];
    int _1892 = int(_1884) + 1;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    int _1896 = _1892 & 3;
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[int(_1894)][_1896];
    float _1900 = _1752 * _1876;
    float _1902 = _1764 * _1876;
    float _1904 = _1774 * _1876;
    float _1906 = _1844 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1908 = -_1900;
    float _1910 = _1752 + _1908;
    float _1912 = -_1902;
    float _1914 = _1764 + _1912;
    float _1916 = -_1904;
    float _1918 = _1774 + _1916;
    int _1920 = _1816 + 8;
    uint _1922 = uint(int(uint(_1920) >> uint(2)));
    uint _1924 = uint(int(uint(int(_1922)) >> uint(2)));
    int _1926 = int(_1922) & 3;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[int(_1924)][_1926];
    int _1930 = int(_1922) + 1;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    int _1934 = _1930 & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    float _1938 = _1910 * _1910;
    float _1940 = _904 + (-0.5);
    bool _1942 = !_1666;
    int _1944 = _1942 ? 0 : 1;
    float _1946 = _1902;
    if (_1874)
    {
        out.m_49.x = 0.0;
    }
    float _1948 = fma(_1914, _1914, _1938);
    float _1950 = -_1906;
    float _1952 = -_1472;
    float _1954 = fma(_1950, _1940, _1952);
    int _1956 = abs(_1302);
    float _1958 = -_1576;
    float _1960 = fma(_900, _1958, _1412);
    float _1962 = fma(_1918, _1918, _1948);
    int _1964 = abs(_1250);
    float _1966 = _571 + (-0.5);
    int _1968 = abs(_1692);
    int _1970 = ~_1964;
    int _1972 = _1970 + 1;
    int _1974 = _1972 + 1;
    int _1976 = ~_1956;
    int _1978 = _1976 + 1;
    int _1980 = _1978 + 1;
    int _1982 = ~_1968;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    int _1988 = abs(_1784);
    int _1990 = ~_1512;
    int _1992 = _1990 + _1608;
    int _1994 = _1992 + 1;
    int _1996 = _1974 * as_type<int>(_1832);
    int _1998 = ~_1852;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    int _2004 = ~_1578;
    int _2006 = _2004 + _1658;
    int _2008 = _2006 + 1;
    int _2010 = _1986 * as_type<int>(_1824);
    int _2012 = _2010 + _1996;
    int _2014 = abs(_1848);
    int _2016 = _593 * _1994;
    int _2018 = _2016 + _862;
    int _2020 = abs(_1944);
    int _2022 = _1980 * as_type<int>(_1868);
    int _2024 = ~_1988;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = _613 * _2008;
    int _2032 = _2030 + _968;
    bool _2034 = _593 == 0;
    float _2036 = float(_1842);
    int _2038 = _2028 * as_type<int>(_1860);
    int _2040 = _2038 + _2022;
    int _2042 = _2002 * as_type<int>(_1890);
    int _2044 = _2042 + _2012;
    bool _2046 = !_1620;
    int _2048 = _2046 ? 0 : 1;
    int _2050 = abs(_1872);
    int _2052 = abs(_2048);
    int _2054 = ~_2014;
    int _2056 = _2054 + 1;
    int _2058 = _2056 + 1;
    int _2060 = ~_1878;
    int _2062 = _2060 + 1;
    int _2064 = _2062 + 1;
    int _2066 = ~_2050;
    int _2068 = _2066 + 1;
    int _2070 = _2068 + 1;
    int _2072 = _2058 * as_type<int>(_1898);
    int _2074 = _2072 + _2044;
    float _2076 = float(_2020);
    int _2078 = _2064 * as_type<int>(_1928);
    int _2080 = _2078 + _2040;
    float _2082 = in.m_70.x;
    float _2084 = in.m_70.y;
    float _2086 = in.m_70.z;
    int _2088 = _2070 * as_type<int>(_1936);
    int _2090 = _2088 + _2080;
    float _2092 = sqrt(_1962);
    int _2094 = ~_1880;
    int _2096 = _2094 + 1;
    int _2098 = _2096 + 1;
    float _2100 = -_1510;
    float _2102 = _2100 + 1.0;
    int _2104 = ~_2052;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    float _2110 = _2076 * _2036;
    bool _2112 = !_2034;
    int _2114 = _2112 ? _2018 : (-1);
    int _2116 = _2074 * _2098;
    bool _2118 = !_984;
    int _2120 = _2118 ? _2032 : (-1);
    int _2122 = _2090 * _2108;
    float _2124 = fma(_904, _2102, _1954);
    int _2126 = _2114 * _1880;
    int _2128 = _2126 + _2116;
    if (_1874)
    {
        _1244 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2130 = _1244;
    float _2132 = _2110 * (-2.0);
    int _2134 = _2120 * _2052;
    int _2136 = _2134 + _2122;
    bool _2138 = !_1670;
    int _2140 = _2138 ? 0 : 1;
    out.m_72.x = _1960;
    out.m_72.y = _2124;
    float _2142 = _1800 * _2092;
    int _2144 = as_type<int>(_2130);
    if (_1874)
    {
        float _2146 = _2130 * 5.0;
        _2144 = as_type<int>(_2146);
    }
    int _2148 = _2144;
    float _2150 = float(_2128);
    float _2152 = fma(_2132, _2082, _2082);
    float _2154 = float(_2136);
    float _2156 = _577 * _2142;
    if (_1874)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6797 = as_type<float>(_2148);
        out.gl_Position.z = _6797;
    }
    float _2158 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2152);
    float _2160 = _573 + _786;
    float _2162 = float(_1592);
    out.m_74.x = _2150;
    out.m_74.y = _2154;
    float _2164 = fma(_1770, _2132, _1770);
    float _2166 = _2160 + (-1.0);
    out.m_76.x = _2156;
    bool _2168 = !_1674;
    int _2170 = _2168 ? 0 : 1;
    int _2172 = abs(_2140);
    if (_1874)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2174 = -_1900;
    float _2176 = _1738 + _2174;
    int _2178 = abs(_2170);
    float _2180 = -_1902;
    float _2182 = _1748 + _2180;
    float _2184 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2186 = _2176 + _2184;
    float _2188 = -_1904;
    float _2190 = _1758 + _2188;
    float _2192 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2194 = _2182 + _2192;
    float _2196 = float(_2172);
    float _2198 = _2186 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2200 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2202 = _2190 + _2200;
    float _2204 = float(_1650);
    float _2206 = fma(_2166, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2208 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2198);
    float _2210 = _2196 * _2162;
    float _2212 = float(_2178);
    float _2214 = _573 + (-0.5);
    float _2216 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2208);
    float _2218 = _2210 * (-2.0);
    float _2220 = _786 + _571;
    float _2222 = _2212 * _2204;
    float _2224 = fma(_2164, _1516, _2158);
    bool _2226 = _2216 >= 0.0;
    float _2228 = fma(_2218, _2084, _2084);
    float _2230 = fma(_2206, _2218, _2206);
    float _2232 = _2220 + (-1.0);
    float _2234 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2228);
    float _2236 = _2222 * (-2.0);
    float _2238 = _2224 * 0.15915493667125701904296875;
    float _2240 = fma(_2232, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2242 = fma(_2230, _1516, _2234);
    float _2244 = fma(_2236, _2086, _2086);
    float _2246 = _786 + (-0.5);
    float _2248 = _2238 * 6.283185482025146484375;
    float _2250 = sin(_2248);
    float _2252 = _2242 * 0.15915493667125701904296875;
    float _2254 = _2206;
    float _2256 = _2194;
    float _2258 = _2202;
    if (_2226)
    {
        _2254 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2260 = _2254;
    float _2262 = fma(_2240, _2236, _2240);
    float _2264 = fma(_2246, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2244);
    int _2266 = as_type<int>(_2260);
    if (_2226)
    {
        out.m_49.x = 0.0;
    }
    if (_2226)
    {
        float _2268 = _2260 * 5.0;
        _2266 = as_type<int>(_2268);
    }
    int _2270 = _2266;
    float _2272 = _2238 * 6.283185482025146484375;
    float _2274 = cos(_2272);
    float _2276 = fma(_2262, _1516, _2264);
    if (_2226)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7000 = as_type<float>(_2270);
        out.gl_Position.z = _7000;
    }
    float _2278 = _2276 * 0.15915493667125701904296875;
    float _2280 = _2252 * 6.283185482025146484375;
    float _2282 = sin(_2280);
    float _2284 = _2252 * 6.283185482025146484375;
    float _2286 = cos(_2284);
    if (_2226)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2288 = _2278 * 6.283185482025146484375;
    float _2290 = cos(_2288);
    float _2292 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2294 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2296 = _2250 * _2282;
    float _2298 = _2274 * _2286;
    float _2300 = _2292 * _2142;
    float _2302 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2304 = _2250 * _2286;
    float _2306 = _2278 * 6.283185482025146484375;
    float _2308 = sin(_2306);
    float _2310 = _2300 * _2294;
    float _2312 = _2274 * _2282;
    float _2314 = _2142 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2316 = _2314 * 0.5;
    float _2318 = _2274 * _2290;
    float _2320 = _2286 * _2290;
    float _2322 = _2250 * _2290;
    float _2324 = _2282 * _2290;
    float _2326 = _2156 * _2302;
    float _2328 = _2318 * _2310;
    float _2330 = fma(_2308, _2298, _2296);
    float _2332 = -_2304;
    float _2334 = fma(_2308, _2312, _2332);
    float _2336 = -_2310;
    float _2338 = _2308 * _2336;
    float _2340 = -_2312;
    float _2342 = fma(_2308, _2304, _2340);
    float _2344 = fma(_2330, _2326, _2328);
    float _2346 = _2322 * _2310;
    float _2348 = fma(_2320, _2326, _2338);
    float _2350 = fma(_2334, _2316, _2344);
    float _2352 = fma(_2308, _2296, _2298);
    float _2354 = fma(_2342, _2326, _2346);
    float _2356 = fma(_2324, _2316, _2348);
    float _2358 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2360 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2362 = fma(_2352, _2316, _2354);
    float _2364 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2358);
    float _2366 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2360);
    float _2368 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2364);
    float _2370 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2366);
    float _2372 = _2368 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2374 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2376 = _1758 + _2372;
    float _2378 = _1748 + _2374;
    float _2380 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2382 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2386 = _2376 + _2384;
    float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2390 = _2378 + _2388;
    float _2392 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2380);
    float _2394 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2382);
    float _2396 = _2386 * _2386;
    float _2398 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2392);
    float _2400 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2394);
    float _2402 = fma(_2390, _2390, _2396);
    float _2404 = _2398 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2406 = sqrt(_2402);
    float _2408 = _1738 + _2404;
    bool _2410 = _2406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2412 = _2398;
    float _2414 = _2404;
    float _2416 = _2382;
    float _2418 = _2326;
    if (!_2410)
    {
        _2412 = _2378;
    }
    float _2420 = _2412;
    float _2422 = _2420;
    if (!_2410)
    {
        _2414 = _2376;
    }
    float _2424 = _2414;
    float _2426 = _2424;
    if (!_2410)
    {
        _2416 = _2408;
    }
    float _2428 = _2416;
    bool _2430 = !_2410;
    float _2432 = _2428;
    if (!_2430)
    {
        float _2434 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2438 = _2406 + _2436;
        float _2440 = rsqrt(_2402);
        float _2442 = _2438 * _2434;
        float _2444 = _2408 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2446 = _2442 * 0.15915493667125701904296875;
        float _2448 = _2446 * 6.283185482025146484375;
        float _2450 = cos(_2448);
        float _2452 = _2446 * 6.283185482025146484375;
        float _2454 = sin(_2452);
        float _2456 = _2450 + (-1.0);
        float _2458 = fma(_2454, _2444, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2460 = _2456 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2462 = _2440 * _2458;
        float _2464 = fma(_2408, _2450, _2460);
        float _2466 = fma(_2390, _2462, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2468 = fma(_2386, _2462, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2432 = _2464;
        _2422 = _2466;
        _2426 = _2468;
        _2418 = _2446;
    }
    float _2470 = _2432;
    float _2472 = _2422;
    float _2474 = _2426;
    float _2476 = _2418;
    float _2478 = -_1738;
    float _2480 = _2478 + _2470;
    float _2482 = -_1748;
    float _2484 = _2482 + _2472;
    float _2486 = -_1758;
    float _2488 = _2486 + _2474;
    float _2490 = _2400 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2492 = _2480 * _2480;
    float _2494 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2496 = 1.0 / _2490;
    float _2498 = fma(_2484, _2484, _2492);
    float _2500 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2494);
    bool _2502 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2504 = isnan(0.5);
    bool _2506 = _2502 || _2504;
    bool _2508 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2510 = _2506 || _2508;
    float _2512 = fma(_2488, _2488, _2498);
    float _2514 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2500);
    bool _2516 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2518 = isnan(0.5);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2524 = _2520 || _2522;
    float _2526 = sqrt(_2512);
    float _2528 = _2514 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2530 = _2528 + _2490;
    float _2532 = _2530 * _2496;
    float _2534 = _2532 * 0.5;
    bool _2536 = _2526 > 0.0;
    float _2538 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2540 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2538);
    float _2542 = 1.0 / _2540;
    float _2544 = _2534;
    float _2546 = _2496;
    float _2548 = _2476;
    if (!_2536)
    {
        _2544 = _2472;
    }
    float _2550 = _2544;
    float _2552 = _2550;
    if (!_2536)
    {
        _2546 = _2470;
    }
    float _2554 = _2546;
    float _2556 = _2554;
    if (!_2536)
    {
        _2548 = _2474;
    }
    float _2558 = _2548;
    bool _2560 = !_2536;
    float _2562 = _2558;
    float _2564 = _2558;
    if (!_2560)
    {
        float _2566 = _211 * _211;
        float _2568 = fma(_209, _209, _2566);
        float _2570 = rsqrt(_2512);
        float _2572 = fma(_213, _213, _2568);
        float _2574 = sqrt(_2572);
        float _2576 = _2484 * _2570;
        float _2578 = _2480 * _2570;
        float _2580 = _2488 * _2570;
        bool _2582 = _2574 > 0.0;
        float _2584 = _2570;
        float _2586 = _2574;
        if (!_2582)
        {
            _2584 = _2472;
        }
        float _2588 = _2584;
        _2552 = _2588;
        if (!_2582)
        {
            _2586 = _2470;
        }
        float _2590 = _2586;
        _2556 = _2590;
        if (!_2582)
        {
            _2562 = _2474;
        }
        float _2592 = _2562;
        bool _2594 = !_2582;
        _2564 = _2592;
        if (!_2594)
        {
            float _2596 = rsqrt(_2572);
            float _2598 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2600 = _211 * _2596;
            float _2602 = _209 * _2596;
            float _2604 = _2578 * _2600;
            float _2606 = _213 * _2596;
            float _2608 = fma(_2576, _2602, _2604);
            float _2610 = _2598 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2612 = fma(_2580, _2606, _2608);
            float _2614 = _2612 * _2610;
            float _2616 = fma(_209, _2614, _2472);
            float _2618 = fma(_211, _2614, _2470);
            float _2620 = fma(_213, _2614, _2474);
            _2552 = _2616;
            _2556 = _2618;
            _2564 = _2620;
        }
    }
    float _2622 = _2552;
    float _2624 = _2556;
    float _2626 = _2564;
    float _2628 = -_1902;
    float _2630 = _2628 + _2622;
    float _2632 = -_1900;
    float _2634 = _2632 + _2624;
    float _2636 = -_1904;
    float _2638 = _2636 + _2626;
    float _2640 = _2634;
    float _2642 = _2630;
    float _2644 = _2638;
    if (_2524)
    {
        _221 = 1.0;
    }
    float _2646 = _221;
    float _2648 = _2646;
    if (!_2510)
    {
        float _2650 = _2186 * _2186;
        float _2652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2654 = -_1758;
        float _2656 = _2654 + _2626;
        float _2658 = -_1738;
        float _2660 = _2658 + _2624;
        float _2662 = fma(_2194, _2194, _2650);
        float _2664 = fma(_2202, _2202, _2662);
        float _2666 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2668 = sqrt(_2664);
        float _2670 = 1.0 / _2142;
        float _2672 = precise::min(_2668, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2674 = _2672 * _2652;
        float _2676 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2678 = -_1748;
        float _2680 = _2678 + _2622;
        float _2682 = _2674 * _2670;
        float _2684 = _2676 * _2682;
        float _2686 = _2656 * _2682;
        float _2688 = fma(_2660, _2684, _2176);
        float _2690 = fma(_2680, _2684, _2182);
        float _2692 = fma(_2676, _2686, _2190);
        _2640 = _2688;
        _2642 = _2690;
        _2644 = _2692;
        _2256 = _2668;
        _1836 = _2686;
    }
    float _2694 = _2640;
    float _2696 = _2642;
    float _2698 = _2644;
    float _2700 = _2256;
    float _2702 = _1836;
    float _2704 = _2700;
    float _2706 = _2702;
    if (_2524)
    {
        _1946 = 1.0;
    }
    float _2708 = _1946;
    float _2710 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2712 = _2542 * _2710;
    float _2714 = _2708;
    if (!_2524)
    {
        float _2716 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2718 = _2716 * 0.15915493667125701904296875;
        float _2720 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2722 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2724 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2722;
        float _2726 = _2718 * 6.283185482025146484375;
        float _2728 = cos(_2726);
        float _2730 = _2720 * 0.15915493667125701904296875;
        float _2732 = _2718 * 6.283185482025146484375;
        float _2734 = sin(_2732);
        float _2736 = 1.0 / _2728;
        float _2738 = _2730 * 6.283185482025146484375;
        float _2740 = cos(_2738);
        float _2742 = _2734 * _2736;
        float _2744 = _2730 * 6.283185482025146484375;
        float _2746 = sin(_2744);
        float _2748 = _2740 * _2742;
        float _2750 = 1.0 / _2724;
        float _2752 = 1.0 / _2748;
        float _2754 = _2746 * _2752;
        float _2756 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2758 = fma(_2712, _2754, _2756);
        float _2760 = _2758 * _2750;
        float _2762 = precise::clamp(_2760, 0.0, 1.0);
        _2258 = _2730;
        _2704 = _2742;
        _2648 = _2762;
    }
    float _2764 = _2258;
    float _2766 = _2704;
    float _2768 = _2648;
    float _2770 = _2764;
    float _2772 = _2766;
    if (!_2524)
    {
        float _2774 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2776 = _2774 * 0.15915493667125701904296875;
        float _2778 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2780 = _2776 * 6.283185482025146484375;
        float _2782 = cos(_2780);
        float _2784 = _2778 * 0.15915493667125701904296875;
        float _2786 = _2776 * 6.283185482025146484375;
        float _2788 = sin(_2786);
        float _2790 = 1.0 / _2782;
        float _2792 = _2784 * 6.283185482025146484375;
        float _2794 = cos(_2792);
        float _2796 = _2788 * _2790;
        float _2798 = _2784 * 6.283185482025146484375;
        float _2800 = sin(_2798);
        float _2802 = _2794 * _2796;
        float _2804 = 1.0 / _2802;
        float _2806 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2808 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2806;
        float _2810 = 1.0 / _2808;
        float _2812 = _2800 * _2804;
        float _2814 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2816 = fma(_2712, _2812, _2814);
        float _2818 = _2816 * _2810;
        float _2820 = precise::clamp(_2818, 0.0, 1.0);
        float _2822 = -_2820;
        float _2824 = _2822 + 1.0;
        _2770 = _2790;
        _2772 = _2802;
        _2714 = _2824;
    }
    float _2826 = _2770;
    float _2828 = _2772;
    float _2830 = _2714;
    float _2832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2834 = _2694 + _2832;
    float _2836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2838 = _2696 + _2836;
    float _2840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2842 = _2698 + _2840;
    float _2844 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2846 = _2834 * _2834;
    float _2848 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2844);
    float _2850 = fma(_2838, _2838, _2846);
    float _2852 = fma(_2842, _2842, _2850);
    float _2854 = rsqrt(_2852);
    float _2856 = sqrt(_2852);
    float _2858 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2860 = _2838 * _2858;
    float _2862 = _2842 * _2858;
    float _2864 = _2860 * _2860;
    float _2866 = _2862 * _2862;
    float _2868 = _2864 + _2866;
    float _2870 = sqrt(_2868);
    bool _2872 = _2870 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2876 = _2870 + _2874;
    float _2878 = _2826;
    float _2880 = _2868;
    float _2882 = _2876;
    float _2884 = _2828;
    float _2886 = _2834;
    if (_2872)
    {
        float _2888 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2878 = _2888;
    }
    float _2890 = _2878;
    if (_2872)
    {
        float _2892 = rsqrt(_2868);
        _2880 = _2892;
    }
    float _2894 = _2880;
    float _2896 = _2894;
    if (_2872)
    {
        float _2898 = _2876 * _2890;
        _2882 = _2898;
    }
    float _2900 = _2882;
    if (_2872)
    {
        float _2902 = _2900 * 0.15915493667125701904296875;
        _2884 = _2902;
    }
    float _2904 = _2884;
    float _2906 = _2842;
    float _2908 = _2904;
    if (_2872)
    {
        float _2910 = _2904 * 6.283185482025146484375;
        float _2912 = sin(_2910);
        _2906 = _2912;
    }
    float _2914 = _2906;
    float _2916 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2918 = precise::max(0.0, _2916);
    float _2920 = _2890;
    if (_2872)
    {
        float _2922 = _2904 * 6.283185482025146484375;
        float _2924 = cos(_2922);
        _2920 = _2924;
    }
    float _2926 = _2920;
    float _2928 = -_2858;
    float _2930 = -_2918;
    float _2932 = fma(_2834, _2928, _2930);
    float _2934 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2872)
    {
        float _2936 = _2932 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2886 = _2936;
    }
    float _2938 = _2886;
    float _2940 = _2938;
    if (!_2872)
    {
        _2908 = _2860;
    }
    float _2942 = _2908;
    float _2944 = fma(_2182, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2946 = _2914;
    float _2948 = _2942;
    if (_2872)
    {
        float _2950 = fma(_2914, _2938, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2946 = _2950;
    }
    float _2952 = _2946;
    float _2954 = _2952;
    if (!_2872)
    {
        _2940 = _2932;
    }
    float _2956 = _2940;
    float _2958 = _2956;
    float _2960 = _2926;
    if (_2872)
    {
        float _2962 = _2926 + (-1.0);
        _2934 = _2962;
    }
    float _2964 = _2934;
    float _2966 = _2964;
    if (_2872)
    {
        float _2968 = _2894 * _2952;
        _2706 = _2968;
    }
    float _2970 = _2706;
    if (!_2872)
    {
        _2896 = _2862;
    }
    float _2972 = _2896;
    float _2974 = _2972;
    if (_2872)
    {
        float _2976 = _2964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2966 = _2976;
    }
    float _2978 = _2966;
    if (_2872)
    {
        float _2980 = _2860 * _2970;
        _2948 = _2980;
    }
    float _2982 = _2948;
    if (!_2872)
    {
        _2954 = _2864;
    }
    float _2984 = _2954;
    float _2986 = _2984;
    if (_2872)
    {
        float _2988 = _2862 * _2970;
        _2974 = _2988;
    }
    float _2990 = _2974;
    if (_2872)
    {
        float _2992 = fma(_2932, _2926, _2978);
        _2958 = _2992;
    }
    float _2994 = _2958;
    if (_2872)
    {
        float _2996 = _2982 * _2982;
        _2986 = _2996;
    }
    float _2998 = _2986;
    if (!_2872)
    {
        _2960 = _2866;
    }
    float _3000 = _2960;
    float _3002 = _3000;
    if (_2872)
    {
        float _3004 = _2990 * _2990;
        _3002 = _3004;
    }
    float _3006 = _3002;
    float _3008 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3010 = fma(_2994, _2994, _2998);
    float _3012 = floor(_2944);
    float _3014 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3008);
    float _3016 = _3010 + _3006;
    float _3018 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3020 = fma(_2856, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3018);
    float _3022 = precise::clamp(_3020, 0.0, 1.0);
    float _3024 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3014);
    float _3026 = rsqrt(_3016);
    float _3028 = -_3022;
    float _3030 = _3028 + 1.0;
    float _3032 = _3024 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3034 = fma(_2190, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3036 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3038 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3040 = abs(_3030);
    float _3042 = log2(_3040);
    float _3044 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3046 = _3032 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3048 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3036);
    float _3050 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3044);
    float _3052 = -_3046;
    float _3054 = fma(_3052, _3038, 1.0);
    float _3056 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3048);
    float _3058 = _3026 * _2982;
    float _3060 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3050);
    float _3062 = _3026 * _2994;
    float _3064 = _3026 * _2990;
    float _3066 = _3058 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3068 = _3060 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3070 = _3056 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3072 = floor(_3034);
    float _3074 = -_3066;
    float _3076 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3074);
    float _3078 = _3068 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3080 = _3042 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3082 = -_3064;
    float _3084 = fma(_3082, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3076);
    float _3086 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2848);
    float _3088 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3078);
    float _3090 = exp2(_3080);
    float _3092 = fma(_3084, -0.5, 0.5);
    float _3094 = _3086 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3096 = fma(_3032, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3088);
    float _3098 = fma(_3084, 0.5, 0.5);
    float _3100 = _3068 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3102 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3096);
    float _3104 = log2(_3054);
    float _3106 = -_3072;
    float _3108 = _3034 + _3106;
    float _3110 = fma(_3098, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3112 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3100);
    float _3114 = fma(_3098, _3110, -0.212114393711090087890625);
    float _3116 = fma(_3032, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3112);
    float _3118 = 1.0 / _3102;
    float _3120 = -_3012;
    float _3122 = _2944 + _3120;
    float _3124 = _3068 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3126 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3124);
    float _3128 = _3062 + 1.0;
    float _3130 = sqrt(_3092);
    float _3132 = _3104 * 0.693147182464599609375;
    float _3134 = fma(_3032, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3126);
    float _3136 = -_3062;
    float _3138 = fma(_3090, _3128, _3136);
    float _3140 = fma(_3098, _3114, 1.570728778839111328125);
    float2 _8353 = float2(_3122, _3108);
    float _3142 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8353, float2(0.0), isnan(_8353)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8353, float2(0.0), isnan(_8353)), level(0.0)).x;
    float _3144 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3134);
    float _3146 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3116);
    float _3148 = _3132 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3150 = fma(_3138, 0.5, 0.5);
    float _3152 = _3144 * _3118;
    float _3154 = _3146 * _3118;
    float _3156 = fma(_3152, 0.5, 0.5);
    float _3158 = fma(_3154, -0.5, 0.5);
    float _3160 = _3130 * 0.636619746685028076171875;
    float _3162 = -_3140;
    float _3164 = fma(_3160, _3162, 1.0);
    float3 _8398 = float3(_3156, _3158, _3148);
    float _3166 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8398, float3(0.0), isnan(_8398)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8398, float3(0.0), isnan(_8398)), level(0.0)).x;
    float3 _8409 = float3(_3156, _3158, _3148);
    float4 _3169 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8409, float3(0.0), isnan(_8409)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8409, float3(0.0), isnan(_8409)), level(0.0)).xyzw;
    float _3171 = _3169.x;
    float _3173 = _3169.y;
    float _3175 = _3169.z;
    float _3177 = _3169.w;
    float2 _8425 = float2(_3164, _3150);
    float3 _3181 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8425, float2(0.0), isnan(_8425)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8425, float2(0.0), isnan(_8425)), level(0.0)).xyz;
    float _3183 = _3181.x;
    float _3185 = _3181.y;
    float _3187 = _3181.z;
    float _3189 = abs(_2712);
    float _3191 = log2(_3189);
    float _3193 = _2330 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3195 = _2330 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3197 = _2330 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3199 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3201 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3193);
    float _3203 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3195);
    float _3205 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3197);
    float _3207 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3209 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3211 = _2334 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3213 = _2334 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3215 = _2334 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3217 = -_2308;
    float _3219 = fma(_3217, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3199);
    float _3221 = -_2308;
    float _3223 = fma(_3221, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3209);
    float _3225 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3227 = _3191 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3229 = -_2308;
    float _3231 = fma(_3229, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3207);
    float _3233 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3211);
    float _3235 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3213);
    float _3237 = exp2(_3227);
    float _3239 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3215);
    float _3241 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3231);
    float _3243 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3233);
    float _3245 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3235);
    float _3247 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3239);
    float _3249 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3201);
    float _3251 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3219);
    float _3253 = fma(_3225, _3225, 1.0);
    float _3255 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3257 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3223);
    float _3259 = _3068 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3261 = rsqrt(_3253);
    float _3263 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3203);
    float _3265 = _3042 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3267 = fma(_3237, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3269 = precise::clamp(_3267, 0.0, 1.0);
    float _3271 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3205);
    float _3273 = _3225 * _3251;
    float _3275 = _3269 * _3269;
    float _3277 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3259);
    float _3279 = fma(_3269, -2.0, 3.0);
    float _3281 = _3225 * _3241;
    float _3283 = exp2(_3265);
    float _3285 = fma(_3255, _3263, _3273);
    float _3287 = _3275 * _3279;
    float _3289 = fma(_3255, _3249, _3281);
    float _3291 = _3225 * _3257;
    float _3293 = _3225 * _3261;
    float _3295 = -_3287;
    float _3297 = _3295 + 1.0;
    out.m_78.x = _3249;
    out.m_78.y = _3263;
    out.m_78.z = _3271;
    float _3299 = fma(_3255, _3271, _3291);
    float _3301 = -_3243;
    float _3303 = _3293 * _3301;
    float _3305 = fma(_3297, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3287);
    float _3307 = fma(_3032, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3277);
    float _3309 = in.m_80.x;
    float _3311 = fma(_3261, _3241, _3303);
    float _3313 = _3243 + _3289;
    float _3315 = _3245 + _3285;
    float _3317 = -_3283;
    float _3319 = _3317 + 1.0;
    out.m_82.x = _2696;
    out.m_82.y = _2694;
    out.m_82.z = _2698;
    bool _3321 = _2856 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3323 = isnan(_2856);
    bool _3325 = _3321 || _3323;
    bool _3327 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3329 = _3325 || _3327;
    float _3331 = -_3245;
    float _3333 = _3293 * _3331;
    float _3335 = -_3247;
    float _3337 = _3293 * _3335;
    float _3339 = _3319 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3341 = fma(_3261, _3251, _3333);
    bool _3343 = _2712 <= 8000.0;
    bool _3345 = isnan(_2712);
    bool _3347 = _3343 || _3345;
    bool _3349 = isnan(8000.0);
    bool _3351 = _3347 || _3349;
    float _3353 = float(_3351);
    float _3355 = fma(_3261, _3257, _3337);
    float _3357 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3307);
    float _3359 = _3102 * 0.5;
    float _3361 = _3144 + _3102;
    float _3363 = _3353 * _3305;
    out.m_84.x = _3311;
    out.m_84.y = _3341;
    out.m_84.z = _3355;
    float _3365 = _3357 + _3102;
    float _3367 = fma(_3146, -0.5, _3359);
    float _3369 = _3363 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3144;
    out.gl_Position.y = _3146;
    out.gl_Position.z = _3357;
    out.gl_Position.w = _3102;
    float _3371 = _3365 * 0.5;
    float _3373 = _3247 + _3299;
    float _3375 = _3361 * 0.5;
    out.m_86.x = _3313;
    out.m_86.y = _3315;
    out.m_86.z = _3373;
    float _3377 = _3245;
    float _3379 = _3355;
    float _3381 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3329)
    {
        _3377 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3383 = _3377;
    float _3385 = _3383;
    float _3387 = _3383;
    if (!_3329)
    {
        _3379 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3389 = _3379;
    out.m_88.z = _3371;
    out.m_88.w = _3102;
    out.m_90.x = _3375;
    out.m_90.y = _3367;
    out.m_90.z = _3371;
    out.m_90.w = _3102;
    float _3391 = -_3142;
    float _3393 = _3391 + 1.0;
    float _3395 = _3393 * _3369;
    float _3397 = precise::clamp(_3395, 0.0, 1.0);
    float _3399 = -_3397;
    float _3401 = fma(_3399, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3403 = _3173;
    float _3405 = _3389;
    float _3407 = _3389;
    if (!_3329)
    {
        _3381 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3409 = _3381;
    float _3411 = _3401 * _3309;
    float _3413 = _3411 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3415 = _3339 * _3166;
    float _3417 = -_3339;
    float _3419 = _3417 + 1.0;
    float _3421 = _3177 * _3415;
    float _3423 = _3187 * _3415;
    float _3425 = _3177 * _3419;
    out.m_92.x = _3413;
    float _3427 = fma(_3183, _3421, _3171);
    float _3429 = fma(_3185, _3421, _3173);
    float _3431 = fma(_3177, _3423, _3175);
    float _3433 = _2768 * _2830;
    float _3435 = _3415;
    float _3437 = _3433;
    float _3439 = _3409;
    float _3441 = _3409;
    if (!_3329)
    {
        _3435 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3443 = _3435;
    float _3445 = _3443;
    float _3447 = _3443;
    if (!_3329)
    {
        _3403 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3449 = _3403;
    out.m_94.x = _3427;
    out.m_94.y = _3429;
    out.m_94.z = _3431;
    out.m_94.w = _3425;
    float _3451 = _3433 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3453 = _3449;
    float _3455 = _3449;
    if (!_3329)
    {
        _3437 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3457 = _3437;
    bool _3459 = !_3329;
    float _3461 = _3457;
    float _3463 = _3457;
    if (!_3459)
    {
        bool _3465 = _2856 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3467 = isnan(_2856);
        bool _3469 = _3465 || _3467;
        bool _3471 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3473 = _3469 || _3471;
        if (!_3473)
        {
            float _3475 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3477 = _2856 + _3475;
            float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3481 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3479;
            float _3483 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3485 = _3483 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3487 = 1.0 / _3481;
            float _3489 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3491 = _3489 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3493 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3495 = _3493 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3497 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3499 = _3497 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3501 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3503 = _3501 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3505 = _3477 * _3487;
            float _3507 = precise::clamp(_3505, 0.0, 1.0);
            float _3509 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3511 = _3509 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3513 = fma(_3507, _3485, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3515 = fma(_3507, _3511, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3517 = fma(_3507, _3491, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3519 = fma(_3507, _3495, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3521 = fma(_3507, _3499, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3523 = fma(_3507, _3503, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3407 = _3517;
            _3455 = _3521;
            _3387 = _3513;
            _3447 = _3519;
            _3441 = _3515;
            _3463 = _3523;
            _3525 = true;
        }
        else
        {
            bool _3527 = _2856 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3529 = isnan(_2856);
            bool _3531 = _3527 || _3529;
            bool _3533 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3535 = _3531 || _3533;
            if (!_3535)
            {
                _3385 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3537 = _3385;
            _3387 = _3537;
            if (!_3535)
            {
                _3405 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3539 = _3405;
            _3407 = _3539;
            if (!_3535)
            {
                _3439 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3541 = _3439;
            _3441 = _3541;
            if (!_3535)
            {
                _3445 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3543 = _3445;
            _3447 = _3543;
            if (!_3535)
            {
                _3453 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3545 = _3453;
            _3455 = _3545;
            if (!_3535)
            {
                _3461 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3547 = _3461;
            bool _3549 = !_3535;
            _3463 = _3547;
            if (!_3549)
            {
                bool _3551 = _2856 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3553 = isnan(_2856);
                bool _3555 = _3551 || _3553;
                bool _3557 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3559 = _3555 || _3557;
                if (!_3559)
                {
                    float _3561 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3563 = _2856 + _3561;
                    float _3565 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3567 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3565;
                    float _3569 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3571 = _3569 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3573 = 1.0 / _3567;
                    float _3575 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3577 = _3575 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3579 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3581 = _3579 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3583 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3585 = _3583 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3587 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3589 = _3587 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3591 = _3563 * _3573;
                    float _3593 = precise::clamp(_3591, 0.0, 1.0);
                    float _3595 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3597 = _3595 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3599 = fma(_3593, _3571, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3601 = fma(_3593, _3597, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3603 = fma(_3593, _3577, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3605 = fma(_3593, _3581, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3607 = fma(_3593, _3585, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3609 = fma(_3593, _3589, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3407 = _3603;
                    _3455 = _3607;
                    _3387 = _3599;
                    _3447 = _3605;
                    _3441 = _3601;
                    _3463 = _3609;
                    _3525 = true;
                }
                else
                {
                    _3407 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3455 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3387 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3447 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3441 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3463 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3525 = false;
    float _3611 = _3407;
    float _3613 = _3455;
    float _3615 = _3387;
    float _3617 = _3447;
    float _3619 = _3441;
    float _3621 = _3463;
    float _3623 = fma(_3315, -0.5, 0.5);
    float _3625 = precise::clamp(_3623, 0.0, 1.0);
    float _3627 = -_3611;
    float _3629 = _3627 + _3613;
    float _3631 = _3451 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3633 = -_3615;
    float _3635 = _3633 + _3617;
    float _3637 = fma(_3625, _3629, _3611);
    out.m_96.x = 0.0;
    float _3639 = -_3619;
    float _3641 = _3639 + _3621;
    float _3643 = fma(_3625, _3635, _3615);
    float _3645 = _3637 * 0.586610972881317138671875;
    out.m_49.x = _3631;
    bool _3647 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3649 = fma(_3625, _3641, _3619);
    float _3651 = fma(_3643, 0.298911988735198974609375, _3645);
    bool _3653 = _2768 > 0.0;
    bool _3655 = isnan(_2768);
    bool _3657 = _3653 || _3655;
    bool _3659 = isnan(0.0);
    bool _3661 = _3657 || _3659;
    float _3663 = fma(_3649, 0.114477999508380889892578125, _3651);
    bool _3665 = _2830 <= 0.0;
    bool _3667 = !_3661;
    bool _3669 = _3665 || _3667;
    float _3671 = -_3663;
    float _3673 = _3637 + _3671;
    float _3675 = -_3663;
    float _3677 = _3643 + _3675;
    float _3679 = -_3663;
    float _3681 = _3649 + _3679;
    float _3683 = fma(_3673, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3663);
    float _3685 = fma(_3677, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3663);
    float _3687 = fma(_3681, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3663);
    bool _3689 = !_3647;
    if (!_3689)
    {
        float _3691 = -_2694;
        float _3693 = _3691 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3695 = -_2696;
        float _3697 = _3695 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3699 = -_2698;
        float _3701 = _3699 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3703 = _3693 * _3693;
        float _3705 = fma(_3697, _3697, _3703);
        float _3707 = fma(_3701, _3701, _3705);
        float _3709 = sqrt(_3707);
        float _3711 = rsqrt(_3707);
        float _3713 = -_3709;
        float _3715 = _3713 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3717 = _3715 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3719 = precise::clamp(_3717, 0.0, 1.0);
        float _3721 = _3697 * _3711;
        float _3723 = _3693 * _3711;
        float _3725 = abs(_3719);
        float _3727 = log2(_3725);
        float _3729 = _3701 * _3711;
        float _3731 = _3721 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3733 = _3315 * _3723;
        float _3735 = -_3723;
        float _3737 = -_3731;
        float _3739 = fma(_3735, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3737);
        float _3741 = fma(_3313, _3721, _3733);
        float _3743 = -_3729;
        float _3745 = fma(_3743, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3739);
        float _3747 = fma(_3373, _3729, _3741);
        float _3749 = precise::clamp(_3747, 0.0, 1.0);
        float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3753 = _3745 + _3751;
        float _3755 = _3727 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3757 = _3753 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3759 = precise::clamp(_3757, 0.0, 1.0);
        float _3761 = exp2(_3755);
        float _3763 = _3761 * _3759;
        float _3765 = _3749 * _3763;
        float _3767 = _3765 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3769 = _3765 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3771 = _3765 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3767;
        out.m_96.y = _3769;
        out.m_96.z = _3771;
    }
    out.m_98.x = _3685;
    out.m_98.y = _3683;
    out.m_98.z = _3687;
    if (!_3669)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3773 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3773;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3525 = false;
    bool _391 = false;
    bool _241 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_46.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (!_121)
    {
        out.m_49.x = 0.0;
    }
    int _127 = 0;
    if (!_121)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3829 = as_type<float>(_131);
        out.gl_Position.z = _3829;
    }
    if (!_121)
    {
        return out;
    }
    float _135 = in.m_51.w;
    float _137 = float(_117);
    float _139 = -_135;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_135);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    bool _153 = _141 >= _137;
    bool _155 = !_151;
    bool _157 = _153 || _155;
    float _159 = 1.0 / _137;
    float _161 = _135;
    float _163 = _141;
    if (_157)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _161;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    float _167 = _141 * _159;
    float _169 = _167;
    if (_157)
    {
        float _171 = _165 * 5.0;
        _133 = as_type<int>(_171);
    }
    int _173 = _133;
    out.m_53.x = _167;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3902 = as_type<float>(_173);
        out.gl_Position.z = _3902;
    }
    if (_157)
    {
        return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_58.x;
    float _179 = in.m_58.y;
    float _181 = in.m_58.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _201 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _205 = !_189;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _199);
    float _211 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _201);
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _203);
    bool _215 = !_185;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_191;
    float _221 = _211;
    float _239;
    if (!_219)
    {
        float _223 = in.m_60.x;
        float _225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _231 = _229 * _225;
        float _233 = floor(_231);
        float _235 = -_233;
        float _237 = _231 + _235;
        _239 = _237;
        _241 = true;
    }
    else
    {
        _239 = _167;
    }
    _241 = false;
    float _243 = _239;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _243 + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _261 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _263 = isnan(_243);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = in.m_62.x;
    float _275 = in.m_62.y;
    bool _277 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _279 = isnan(_243);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = 1.0 / _259;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = -_271;
    float _295 = _293 + 1.0;
    float _297 = 1.0 / _255;
    float _299 = _251 * _289;
    float _301 = _247 * _297;
    bool _303 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_243);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _319;
    float _323 = -_313;
    float _325 = _323 + 1.0;
    float _327 = fma(_317, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _329 = fma(_321, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _331 = _313 * _295;
    float _333 = _287 * _325;
    float _335 = -_287;
    float _337 = _335 + 1.0;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _347 = _327 * _333;
    float _349 = _329 * _333;
    float _351 = fma(_341, _299, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _353 = fma(_345, _299, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _355 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].x, _347);
    float _357 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].y, _349);
    float _359 = fma(_351, _331, _355);
    float _361 = fma(_353, _331, _357);
    float _363 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[145].x, _359);
    float _365 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[145].y, _361);
    float _367 = _363 * _273;
    float _369 = _365 * _275;
    bool _371 = !_291;
    float _389;
    if (!_371)
    {
        float _373 = in.m_60.x;
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _377 = _373 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        _389 = _167;
    }
    _391 = false;
    float _393 = _389;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _397 = _393 + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _403 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _405 = isnan(_393);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _423 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _425 = isnan(_393);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = 1.0 / _401;
    float _437 = -_413;
    float _439 = _437 + 1.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _441;
    bool _445 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _447 = isnan(_393);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = _433 * _439;
    float _459 = -_433;
    float _461 = _459 + 1.0;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _465 = 1.0 / _417;
    float _467 = _455 * _461;
    float _469 = -_455;
    float _471 = _469 + 1.0;
    float _473 = 1.0 / _421;
    float _475 = _443 * _435;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _481 = fma(_475, _397, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _483 = _479 * _465;
    bool _485 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _487 = isnan(_393);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _497;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _503 = _393 + _501;
    float _505 = _481 * _467;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _509 = _393 + _507;
    float _511 = -_495;
    float _513 = _511 + 1.0;
    float _515 = fma(_483, _503, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _517 = _499 * _473;
    float _519 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[115].x, _505);
    float _521 = _413 * _513;
    float _523 = fma(_517, _509, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _525 = fma(_515, _457, _519);
    float _527 = fma(_523, _521, _525);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _535 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[118].x, _527);
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _537;
    out.m_64.y = _539;
    out.m_64.z = _541;
    out.m_64.w = _543;
    bool _545 = !_463;
    float _547 = _413;
    if (!_545)
    {
        float _549 = in.m_60.x;
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _553 = _549 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _169 = _563;
    }
    float _565 = _169;
    float _567 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _569 = int(_567);
    float _571 = in.m_60.x;
    float _573 = in.m_60.y;
    float _575 = _159 * _141;
    float _577 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _581 = _579 != 0;
    float _583 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _585 = int(_583);
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _589 = float(_569);
    float _591 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _593 = int(_591);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_581)
    {
        _547 = 1.0;
    }
    float _599 = _547;
    float _601 = _599;
    if (!_581)
    {
        _601 = 7.345489978790283203125;
    }
    float _603 = _601;
    float _605 = float(_585);
    float _607 = 1.0 / _589;
    float _609 = _603 * _571;
    float _611 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _613 = int(_611);
    float _615 = float(uint(_593));
    bool _617 = _593 == 0;
    float _619 = 1.0 / _605;
    float _621 = _607 * _141;
    float _623 = 1.0 / _615;
    float _625 = float(uint(_613));
    int _627 = ~_613;
    int _629 = _627 + 1;
    float _631 = trunc(_621);
    int _633 = int(_631);
    float _635 = _619 * _141;
    int _637 = ~_593;
    int _639 = _637 + 1;
    float _641 = 1.0 / _625;
    int _643 = as_type<int>(_623) + (-2);
    float _645 = trunc(_635);
    int _647 = int(_645);
    float _649 = float(uint(_633));
    float _651 = as_type<float>(_643) * _649;
    int _653 = as_type<int>(_641) + (-2);
    float _655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _657 = ~_613;
    int _659 = _657 + 1;
    float _661 = float(uint(_647));
    float _663 = trunc(_651);
    float _665 = precise::max(_663, 0.0);
    uint _668 = uint(_665);
    float _670 = as_type<float>(_653) * _661;
    float _672 = trunc(_670);
    float _674 = precise::max(_672, 0.0);
    uint _676 = uint(_674);
    float _678 = _655 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _680 = _639 * int(_668);
    int _682 = _680 + _633;
    float _684 = floor(_609);
    float _686 = float(uint(_682));
    int _688 = _659 * int(_676);
    int _690 = _688 + _647;
    float _692 = as_type<float>(_643) * _686;
    float _694 = _686;
    if (_581)
    {
        _694 = 1.0;
    }
    float _696 = _694;
    float _698 = float(uint(_690));
    float _700 = trunc(_692);
    float _702 = precise::max(_700, 0.0);
    uint _704 = uint(_702);
    float _706 = _696;
    float _708 = _698;
    if (!_581)
    {
        _706 = 1.2345600128173828125;
    }
    float _710 = _706;
    float _712 = -_684;
    float _714 = _609 + _712;
    float _716 = as_type<float>(_653) * _698;
    if (_581)
    {
        _708 = _571;
    }
    float _718 = _708;
    float _720 = _718;
    if (!_581)
    {
        _720 = _573;
    }
    float _722 = _720;
    float _724 = trunc(_716);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    float _730 = _710 * _722;
    int _732 = ~_593;
    int _734 = _732 + 1;
    int _736 = int(_668) + int(_704);
    float _738 = floor(_730);
    float _740 = float(_593);
    float _742 = float(_633);
    int _744 = _734 * _736;
    int _746 = _744 + _633;
    int _748 = int(_676) + int(_728);
    float _750 = _714 * _740;
    float _752 = _740 * _575;
    bool _754 = _742 >= _740;
    bool _756 = isnan(_742);
    bool _758 = _754 || _756;
    bool _760 = isnan(_740);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    bool _766 = uint(_746) >= uint(_593);
    int _768 = _629 * _748;
    int _770 = _768 + _647;
    float _772 = -_738;
    float _774 = _730 + _772;
    float _776 = trunc(_764);
    int _778 = int(_776);
    bool _780 = !_766;
    int _782 = _780 ? 0 : (-1);
    bool _784 = uint(_770) >= uint(_613);
    float _786 = in.m_60.z;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _790 = _788 != 0;
    int _792 = ~_736;
    int _794 = _792 + _782;
    int _796 = _794 + 1;
    float _798 = trunc(_750);
    int _800 = int(_798);
    bool _802 = !_790;
    int _804 = _802 ? 0 : 1;
    float _806 = float(_613);
    int _808 = abs(_804);
    int _810 = _593 * _796;
    int _812 = _810 + _633;
    float _814 = float(_647);
    float _816 = _806 * _575;
    int _818 = ~_778;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    bool _824 = !_784;
    int _826 = _824 ? 0 : (-1);
    bool _828 = !_617;
    int _830 = _828 ? _812 : (-1);
    float _832 = trunc(_816);
    int _834 = int(_832);
    bool _836 = _814 >= _806;
    bool _838 = isnan(_814);
    bool _840 = _836 || _838;
    bool _842 = isnan(_806);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = _774 * _806;
    bool _850 = _573 > 0.5;
    int _852 = _830 * _822;
    int _854 = ~_748;
    int _856 = _854 + _826;
    int _858 = _856 + 1;
    int _860 = _800 * _808;
    int _862 = _860 + _633;
    bool _864 = _786 > 0.5;
    float _866 = trunc(_848);
    int _868 = int(_866);
    float _870 = -_217;
    int _872 = _850 ? as_type<int>(_870) : as_type<int>(_217);
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _876 = _874 != 0;
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _880 = _878 != 0;
    float _882 = -_207;
    int _884 = _864 ? as_type<int>(_882) : as_type<int>(_207);
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _888 = _886 != 0;
    float _890 = trunc(_846);
    int _892 = int(_890);
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _896 = _894 != 0;
    bool _898 = !_876;
    float _900 = _898 ? _217 : as_type<float>(_872);
    bool _902 = !_880;
    float _904 = _902 ? _207 : as_type<float>(_884);
    bool _906 = !_888;
    int _908 = _906 ? 0 : 1;
    float _910 = trunc(_752);
    int _912 = int(_910);
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _924 = _922 != 0;
    float _926 = _900 + 0.5;
    int _928 = abs(_908);
    int _930 = _593 + (-1);
    bool _932 = !_920;
    int _934 = _932 ? 0 : 1;
    bool _936 = !_896;
    int _938 = _936 ? 0 : 1;
    int _940 = _778 * _930;
    int _942 = _940 + _852;
    bool _944 = !_916;
    int _946 = _944 ? 0 : 1;
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _950 = _948 != 0;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _954 = _952 != 0;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _958 = _956 != 0;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _962 = _960 != 0;
    int _964 = abs(_934);
    int _966 = _868 * _928;
    int _968 = _966 + _647;
    int _970 = abs(_946);
    int _972 = _613 * _858;
    int _974 = _972 + _647;
    bool _976 = !_924;
    int _978 = _976 ? 0 : 1;
    bool _980 = !_954;
    int _982 = _980 ? 0 : 1;
    bool _984 = _613 == 0;
    int _986 = abs(_978);
    int _988 = _942 * _964;
    int _990 = ~_892;
    int _992 = _990 + 1;
    int _994 = _992 + 1;
    bool _996 = !_984;
    int _998 = _996 ? _974 : (-1);
    int _1000 = _912 * _970;
    int _1002 = _1000 + _988;
    int _1004 = _613 + (-1);
    int _1006 = _998 * _994;
    int _1008 = abs(_938);
    int _1010 = _862 * _986;
    int _1012 = _1010 + _1002;
    int _1014 = abs(_982);
    int _1016 = _892 * _1004;
    int _1018 = _1016 + _1006;
    bool _1020 = !_950;
    int _1022 = _1020 ? 0 : 1;
    int _1024 = _800 * _1008;
    int _1026 = _1024 + _1012;
    bool _1028 = !_958;
    int _1030 = _1028 ? 0 : 1;
    int _1032 = abs(_1022);
    bool _1034 = !_962;
    int _1036 = _1034 ? 0 : 1;
    int _1038 = abs(_1030);
    int _1040 = _1018 * _1014;
    float _1042 = float(uint(_1026));
    int _1044 = abs(_1036);
    int _1046 = _834 * _1032;
    int _1048 = _1046 + _1040;
    float _1050 = as_type<float>(_643) * _1042;
    int _1052 = ~_593;
    int _1054 = _1052 + 1;
    int _1056 = _968 * _1038;
    int _1058 = _1056 + _1048;
    bool _1060 = _593 == 0;
    float _1062 = trunc(_1050);
    float _1064 = precise::max(_1062, 0.0);
    uint _1066 = uint(_1064);
    int _1068 = _868 * _1044;
    int _1070 = _1068 + _1058;
    int _1072 = ~_593;
    int _1074 = _1072 + 1;
    int _1076 = ~_613;
    int _1078 = _1076 + 1;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1082 = float(uint(_1070));
    float _1084 = float(uint(_862));
    float _1086 = as_type<float>(_653) * _1082;
    float _1088 = as_type<float>(_643) * _1084;
    int _1090 = _1074 * int(_1066);
    int _1092 = _1090 + _1026;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1098 = trunc(_1086);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    float _1104 = float(uint(_1092));
    float _1106 = as_type<float>(_643) * _1104;
    float _1108 = trunc(_1088);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    int _1114 = _1078 * int(_1102);
    int _1116 = _1114 + _1070;
    float _1118 = trunc(_1106);
    float _1120 = precise::max(_1118, 0.0);
    uint _1122 = uint(_1120);
    float _1124 = _573 * 2.0;
    float _1126 = float(uint(_1116));
    float _1128 = floor(_1124);
    float _1130 = as_type<float>(_653) * _1126;
    int _1132 = ~_613;
    int _1134 = _1132 + 1;
    int _1136 = int(_1066) + int(_1122);
    float _1138 = trunc(_1130);
    float _1140 = precise::max(_1138, 0.0);
    uint _1142 = uint(_1140);
    int _1144 = _1054 * _1136;
    int _1146 = _1144 + _1026;
    float _1148 = 1.0 / _1096;
    bool _1150 = uint(_1146) >= uint(_593);
    bool _1152 = !_1150;
    int _1154 = _1152 ? 0 : (-1);
    int _1156 = ~_1136;
    int _1158 = _1156 + _1154;
    int _1160 = _1158 + 1;
    float _1162 = _786 * 2.0;
    int _1164 = int(_1102) + int(_1142);
    float _1166 = float(uint(_968));
    int _1168 = _593 * _1160;
    int _1170 = _1168 + _1026;
    float _1172 = _573 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1174 = _1134 * _1164;
    int _1176 = _1174 + _1070;
    float _1178 = floor(_1162);
    float _1180 = as_type<float>(_653) * _1166;
    bool _1182 = !_1060;
    int _1184 = _1182 ? _1170 : (-1);
    float _1186 = fma(_1172, -2.0, _1080);
    bool _1188 = uint(_1176) >= uint(_613);
    int _1190 = _1184 & 3;
    bool _1192 = _1190 != 0;
    int _1194 = _1184 & 3;
    bool _1196 = _1194 != 0;
    float _1198 = trunc(_1180);
    float _1200 = precise::max(_1198, 0.0);
    uint _1202 = uint(_1200);
    bool _1204 = !_1188;
    int _1206 = _1204 ? 0 : (-1);
    int _1208 = _1192 ? 0 : 1;
    bool _1210 = uint(_1194) >= 2u;
    bool _1212 = uint(_1194) > 1u;
    int _1214 = ~_1164;
    int _1216 = _1214 + _1206;
    int _1218 = _1216 + 1;
    int _1220 = _1210 ? 0 : 1;
    bool _1222 = _1194 != 3;
    int _1224 = _613 * _1218;
    int _1226 = _1224 + _1070;
    int _1228 = ~_1208;
    int _1230 = _1228 + 1;
    int _1232 = _1230 + 1;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1236 = _1234 != 0;
    bool _1238 = !_984;
    int _1240 = _1238 ? _1226 : (-1);
    int _1242 = _1232;
    float _1244 = as_type<float>(_862);
    if (!_1212)
    {
        int _1246 = ~_1208;
        int _1248 = _1246 + 1;
        _1242 = _1248;
    }
    int _1250 = _1242;
    int _1252 = _1240 & 3;
    bool _1254 = _1252 != 0;
    int _1256 = ~_1220;
    int _1258 = _1256 + 1;
    int _1260 = _1258 + 1;
    int _1262 = _1260;
    if (_1222)
    {
        int _1264 = ~_1220;
        int _1266 = _1264 + 1;
        _1262 = _1266;
    }
    int _1268 = _1262;
    bool _1270 = uint(_1252) > 1u;
    float _1272 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1274 = log2(_1272);
    int _1276 = _1240 & 3;
    bool _1278 = _1276 != 0;
    if (_1236)
    {
        _597 = 0;
    }
    int _1280 = _597;
    int _1282 = _1278 ? 0 : 1;
    int _1284 = _1280;
    if (!_1236)
    {
        _1284 = 2;
    }
    int _1286 = _1284;
    int _1288 = ~_1282;
    int _1290 = _1288 + 1;
    int _1292 = _1290 + 1;
    bool _1294 = _573 > 0.5;
    int _1296 = _1292;
    if (!_1270)
    {
        int _1298 = ~_1282;
        int _1300 = _1298 + 1;
        _1296 = _1300;
    }
    int _1302 = _1296;
    float _1304 = _571 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1306 = _1274 * _141;
    bool _1308 = _1252 != 3;
    bool _1310 = _1286 != 2;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1314 = -_207;
    float _1316 = _1294 ? _1314 : _207;
    float _1318 = exp2(_1306);
    bool _1320 = uint(_1252) >= 2u;
    float _1322 = -_1312;
    float _1324 = fma(_1304, 2.0, _1322);
    float _1326 = _571 * 2.0;
    float _1328 = _1320 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1330 = floor(_1326);
    int _1332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1334 = _1332 != 0;
    int _1336 = ~as_type<int>(_1328);
    int _1338 = _1336 + 1;
    int _1340 = _1338 + 1;
    int _1342 = _1340;
    float _1344 = _1328;
    float _1346 = _1316;
    if (_1308)
    {
        int _1348 = ~as_type<int>(_1328);
        int _1350 = _1348 + 1;
        _1342 = _1350;
    }
    int _1352 = _1342;
    if (_1310)
    {
        _1344 = _571;
    }
    float _1354 = _1344;
    float _1356 = _1354;
    if (!_1310)
    {
        _1356 = _786;
    }
    float _1358 = _1356;
    bool _1360 = !_1334;
    int _1362 = _1360 ? 0 : 1;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1366 = _1364 != 0;
    float _1368 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1370 = _571 > 0.5;
    float _1372 = -_1318;
    float _1374 = _1372 + 1.0;
    bool _1376 = !_1366;
    float _1378 = _1376 ? _207 : _1316;
    float _1380 = -_587;
    float _1382 = fma(_1368, 2.0, _1380);
    int _1384 = ~_593;
    int _1386 = _1384 + 1;
    float _1388 = -_217;
    int _1390 = _1370 ? as_type<int>(_1388) : as_type<int>(_217);
    float _1392 = -_141;
    float _1394 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1382);
    bool _1396 = _1330 > 0.0;
    int _1398 = _1386 * int(_1112);
    int _1400 = _1398 + _862;
    bool _1402 = _1330 >= 0.0;
    bool _1404 = isnan(_1330);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan(0.0);
    bool _1410 = _1406 || _1408;
    float _1412 = fma(_678, _926, _1394);
    int _1414 = ~_613;
    int _1416 = _1414 + 1;
    if (_1310)
    {
        _1346 = _573;
    }
    float _1418 = _1346;
    float _1420 = _1418;
    if (!_1310)
    {
        _1420 = _571;
    }
    float _1422 = _1420;
    int _1424 = _1416 * int(_1202);
    int _1426 = _1424 + _968;
    float _1428 = float(uint(_1400));
    bool _1430 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1432 = isnan(0.0);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1438 = _1434 || _1436;
    float _1440 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1442 = float(uint(_1426));
    float _1444 = as_type<float>(_643) * _1428;
    float _1446 = _1438 ? _1374 : 0.0;
    float _1448 = fma(_1440, -2.0, _595);
    bool _1450 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1452 = isnan(1.0);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1458 = _1454 || _1456;
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1462 = 1.0 + _1460;
    float _1464 = as_type<float>(_653) * _1442;
    float _1466 = trunc(_1444);
    float _1468 = precise::max(_1466, 0.0);
    uint _1470 = uint(_1468);
    float _1472 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1448);
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1476 = 1.0 / _1462;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1482 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1474);
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1486 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1478);
    float _1488 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1480);
    float _1490 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1482);
    float _1492 = trunc(_1464);
    float _1494 = precise::max(_1492, 0.0);
    uint _1496 = uint(_1494);
    float _1498 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1484);
    float _1500 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1186);
    float _1502 = -_141;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1324);
    float _1506 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1486);
    float _1508 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1488);
    float _1510 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1498);
    int _1512 = int(_1112) + int(_1470);
    if (_1458)
    {
        float _1514 = _1446 * _1476;
        _163 = _1514;
    }
    float _1516 = _163;
    int _1518 = ~_593;
    int _1520 = _1518 + 1;
    float _1522 = in.m_46.x;
    float _1524 = in.m_46.y;
    float _1526 = in.m_46.z;
    int _1528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1530 = _1528 != 0;
    float _1532 = _1378 + (-0.5);
    int _1534 = ~_613;
    int _1536 = _1534 + 1;
    int _1538 = _1520 * _1512;
    int _1540 = _1538 + _862;
    int _1542 = _1410 ? 0 : 1;
    float _1544 = -_1490;
    float _1546 = _1544 + 1.0;
    bool _1548 = !_1530;
    float _1550 = _1548 ? _217 : as_type<float>(_1390);
    float _1552 = -_1532;
    float _1554 = -_1500;
    float _1556 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1554);
    bool _1558 = _1128 > 0.0;
    float _1560 = -_1506;
    float _1562 = _1560 + 1.0;
    bool _1564 = _1128 >= 0.0;
    bool _1566 = isnan(_1128);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan(0.0);
    bool _1572 = _1568 || _1570;
    float _1574 = -_1508;
    float _1576 = _1574 + 1.0;
    int _1578 = int(_1202) + int(_1496);
    int _1580 = ~_1542;
    int _1582 = _1580 + 1;
    int _1584 = _1582 + 1;
    int _1586 = _1584;
    if (!_1396)
    {
        int _1588 = ~_1542;
        int _1590 = _1588 + 1;
        _1586 = _1590;
    }
    int _1592 = _1586;
    bool _1594 = uint(_1540) >= uint(_593);
    int _1596 = _1536 * _1578;
    int _1598 = _1596 + _968;
    float _1600 = _1524 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1602 = _1572 ? 0 : 1;
    float _1604 = _1524 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1606 = !_1594;
    int _1608 = _1606 ? 0 : (-1);
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1610;
    bool _1614 = uint(_1598) >= uint(_613);
    float _1616 = fma(_1522, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1600);
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1620 = _1618 != 0;
    float _1622 = _1612 * _1148;
    bool _1624 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1626 = isnan(_565);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1632 = _1628 || _1630;
    float _1634 = float(_1632);
    float _1636 = fma(_1522, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1604);
    int _1638 = ~_1602;
    int _1640 = _1638 + 1;
    int _1642 = _1640 + 1;
    int _1644 = _1642;
    if (!_1558)
    {
        int _1646 = ~_1602;
        int _1648 = _1646 + 1;
        _1644 = _1648;
    }
    int _1650 = _1644;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1654 = _565 + _1652;
    bool _1656 = !_1614;
    int _1658 = _1656 ? 0 : (-1);
    float _1660 = -_1634;
    float _1662 = _1660 + 1.0;
    int _1664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1666 = _1664 != 0;
    int _1668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1670 = _1668 != 0;
    int _1672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1674 = _1672 != 0;
    float _1676 = _1524 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1678 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1680 = isnan(_565);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1686 = _1682 || _1684;
    float _1688 = float(_1686);
    bool _1690 = !_1196;
    int _1692 = _1690 ? 0 : 1;
    float _1694 = fma(_1522, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1676);
    float _1696 = fma(_1622, _1654, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1698 = _1688 * _1662;
    float _1700 = _1550 + 0.5;
    float _1702 = fma(_1526, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1694);
    bool _1704 = _1178 >= 0.0;
    bool _1706 = isnan(_1178);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan(0.0);
    bool _1712 = _1708 || _1710;
    float _1714 = _1696 * _1698;
    float _1716 = fma(_1700, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1504);
    float _1718 = -_1688;
    float _1720 = _1718 + 1.0;
    int _1722 = _1712 ? 0 : 1;
    bool _1724 = _1178 > 0.0;
    float _1726 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1714);
    float _1728 = -_1546;
    float _1730 = fma(_1550, _1728, _1716);
    float _1732 = fma(_1378, _1562, _1556);
    float _1734 = fma(_1526, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1616);
    float _1736 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1726);
    float _1738 = _1702 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1740 = _1184 >> 31;
    float _1742 = _573 + _571;
    int _1744 = _1240 >> 31;
    float _1746 = fma(_1526, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1636);
    float _1748 = _1734 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1752 = _1738 + _1750;
    int _1754 = _1740 & 3;
    float _1756 = _1742 + (-1.0);
    float _1758 = _1746 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1760 = _1744 & 3;
    float _1762 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1764 = _1748 + _1762;
    float _1766 = _1752 * _1752;
    int _1768 = _1184 + _1754;
    out.m_66.x = _1730;
    out.m_66.y = _1732;
    float _1770 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1772 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1774 = _1758 + _1772;
    float _1776 = fma(_1764, _1764, _1766);
    int _1778 = _1768 >> 2;
    float _1780 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1782 = !_1254;
    int _1784 = _1782 ? 0 : 1;
    float _1786 = fma(_1774, _1774, _1776);
    int _1788 = _1778 << 4;
    int _1790 = _1788 + 368;
    float _1792 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1780);
    int _1794 = _1240 + _1760;
    float _1796 = _577 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1798 = _1194 != 3;
    float _1800 = rsqrt(_1786);
    int _1802 = _1794 >> 2;
    float _1804 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1792);
    int _1806 = ~_1722;
    int _1808 = _1806 + 1;
    int _1810 = _1808 + 1;
    float _1812 = _1736 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1814 = _1802 << 4;
    int _1816 = _1814 + 512;
    uint _1818 = uint(int(uint(_1790) >> uint(2)));
    uint _1820 = uint(int(uint(int(_1818)) >> uint(2)));
    int _1822 = int(_1818) & 3;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[int(_1820)][_1822];
    int _1826 = int(_1818) + 1;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    int _1830 = _1826 & 3;
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[int(_1828)][_1830];
    int _1834 = _1810;
    float _1836 = _1758;
    if (!_1724)
    {
        int _1838 = ~_1722;
        int _1840 = _1838 + 1;
        _1834 = _1840;
    }
    int _1842 = _1834;
    float _1844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1846 = !_1798;
    int _1848 = _1846 ? 0 : (-1);
    out.m_68.w = _1812;
    bool _1850 = _1252 != 3;
    int _1852 = abs(_1268);
    uint _1854 = uint(int(uint(_1816) >> uint(2)));
    uint _1856 = uint(int(uint(int(_1854)) >> uint(2)));
    int _1858 = int(_1854) & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    int _1862 = int(_1854) + 1;
    uint _1864 = uint(int(uint(_1862) >> uint(2)));
    int _1866 = _1862 & 3;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[int(_1864)][_1866];
    bool _1870 = !_1850;
    int _1872 = _1870 ? 0 : (-1);
    bool _1874 = _1804 >= 0.0;
    float _1876 = _1796 * _1800;
    int _1878 = abs(_1352);
    int _1880 = abs(_1362);
    int _1882 = _1790 + 8;
    uint _1884 = uint(int(uint(_1882) >> uint(2)));
    uint _1886 = uint(int(uint(int(_1884)) >> uint(2)));
    int _1888 = int(_1884) & 3;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[int(_1886)][_1888];
    int _1892 = int(_1884) + 1;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    int _1896 = _1892 & 3;
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[int(_1894)][_1896];
    float _1900 = _1752 * _1876;
    float _1902 = _1764 * _1876;
    float _1904 = _1774 * _1876;
    float _1906 = _1844 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1908 = -_1900;
    float _1910 = _1752 + _1908;
    float _1912 = -_1902;
    float _1914 = _1764 + _1912;
    float _1916 = -_1904;
    float _1918 = _1774 + _1916;
    int _1920 = _1816 + 8;
    uint _1922 = uint(int(uint(_1920) >> uint(2)));
    uint _1924 = uint(int(uint(int(_1922)) >> uint(2)));
    int _1926 = int(_1922) & 3;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[int(_1924)][_1926];
    int _1930 = int(_1922) + 1;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    int _1934 = _1930 & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    float _1938 = _1910 * _1910;
    float _1940 = _904 + (-0.5);
    bool _1942 = !_1666;
    int _1944 = _1942 ? 0 : 1;
    float _1946 = _1902;
    if (_1874)
    {
        out.m_49.x = 0.0;
    }
    float _1948 = fma(_1914, _1914, _1938);
    float _1950 = -_1906;
    float _1952 = -_1472;
    float _1954 = fma(_1950, _1940, _1952);
    int _1956 = abs(_1302);
    float _1958 = -_1576;
    float _1960 = fma(_900, _1958, _1412);
    float _1962 = fma(_1918, _1918, _1948);
    int _1964 = abs(_1250);
    float _1966 = _571 + (-0.5);
    int _1968 = abs(_1692);
    int _1970 = ~_1964;
    int _1972 = _1970 + 1;
    int _1974 = _1972 + 1;
    int _1976 = ~_1956;
    int _1978 = _1976 + 1;
    int _1980 = _1978 + 1;
    int _1982 = ~_1968;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    int _1988 = abs(_1784);
    int _1990 = ~_1512;
    int _1992 = _1990 + _1608;
    int _1994 = _1992 + 1;
    int _1996 = _1974 * as_type<int>(_1832);
    int _1998 = ~_1852;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    int _2004 = ~_1578;
    int _2006 = _2004 + _1658;
    int _2008 = _2006 + 1;
    int _2010 = _1986 * as_type<int>(_1824);
    int _2012 = _2010 + _1996;
    int _2014 = abs(_1848);
    int _2016 = _593 * _1994;
    int _2018 = _2016 + _862;
    int _2020 = abs(_1944);
    int _2022 = _1980 * as_type<int>(_1868);
    int _2024 = ~_1988;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = _613 * _2008;
    int _2032 = _2030 + _968;
    bool _2034 = _593 == 0;
    float _2036 = float(_1842);
    int _2038 = _2028 * as_type<int>(_1860);
    int _2040 = _2038 + _2022;
    int _2042 = _2002 * as_type<int>(_1890);
    int _2044 = _2042 + _2012;
    bool _2046 = !_1620;
    int _2048 = _2046 ? 0 : 1;
    int _2050 = abs(_1872);
    int _2052 = abs(_2048);
    int _2054 = ~_2014;
    int _2056 = _2054 + 1;
    int _2058 = _2056 + 1;
    int _2060 = ~_1878;
    int _2062 = _2060 + 1;
    int _2064 = _2062 + 1;
    int _2066 = ~_2050;
    int _2068 = _2066 + 1;
    int _2070 = _2068 + 1;
    int _2072 = _2058 * as_type<int>(_1898);
    int _2074 = _2072 + _2044;
    float _2076 = float(_2020);
    int _2078 = _2064 * as_type<int>(_1928);
    int _2080 = _2078 + _2040;
    float _2082 = in.m_70.x;
    float _2084 = in.m_70.y;
    float _2086 = in.m_70.z;
    int _2088 = _2070 * as_type<int>(_1936);
    int _2090 = _2088 + _2080;
    float _2092 = sqrt(_1962);
    int _2094 = ~_1880;
    int _2096 = _2094 + 1;
    int _2098 = _2096 + 1;
    float _2100 = -_1510;
    float _2102 = _2100 + 1.0;
    int _2104 = ~_2052;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    float _2110 = _2076 * _2036;
    bool _2112 = !_2034;
    int _2114 = _2112 ? _2018 : (-1);
    int _2116 = _2074 * _2098;
    bool _2118 = !_984;
    int _2120 = _2118 ? _2032 : (-1);
    int _2122 = _2090 * _2108;
    float _2124 = fma(_904, _2102, _1954);
    int _2126 = _2114 * _1880;
    int _2128 = _2126 + _2116;
    if (_1874)
    {
        _1244 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2130 = _1244;
    float _2132 = _2110 * (-2.0);
    int _2134 = _2120 * _2052;
    int _2136 = _2134 + _2122;
    bool _2138 = !_1670;
    int _2140 = _2138 ? 0 : 1;
    out.m_72.x = _1960;
    out.m_72.y = _2124;
    float _2142 = _1800 * _2092;
    int _2144 = as_type<int>(_2130);
    if (_1874)
    {
        float _2146 = _2130 * 5.0;
        _2144 = as_type<int>(_2146);
    }
    int _2148 = _2144;
    float _2150 = float(_2128);
    float _2152 = fma(_2132, _2082, _2082);
    float _2154 = float(_2136);
    float _2156 = _577 * _2142;
    if (_1874)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6797 = as_type<float>(_2148);
        out.gl_Position.z = _6797;
    }
    float _2158 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2152);
    float _2160 = _573 + _786;
    float _2162 = float(_1592);
    out.m_74.x = _2150;
    out.m_74.y = _2154;
    float _2164 = fma(_1770, _2132, _1770);
    float _2166 = _2160 + (-1.0);
    out.m_76.x = _2156;
    bool _2168 = !_1674;
    int _2170 = _2168 ? 0 : 1;
    int _2172 = abs(_2140);
    if (_1874)
    {
        return out;
    }
    float _2174 = -_1900;
    float _2176 = _1738 + _2174;
    int _2178 = abs(_2170);
    float _2180 = -_1902;
    float _2182 = _1748 + _2180;
    float _2184 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2186 = _2176 + _2184;
    float _2188 = -_1904;
    float _2190 = _1758 + _2188;
    float _2192 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2194 = _2182 + _2192;
    float _2196 = float(_2172);
    float _2198 = _2186 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2200 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2202 = _2190 + _2200;
    float _2204 = float(_1650);
    float _2206 = fma(_2166, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2208 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2198);
    float _2210 = _2196 * _2162;
    float _2212 = float(_2178);
    float _2214 = _573 + (-0.5);
    float _2216 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2208);
    float _2218 = _2210 * (-2.0);
    float _2220 = _786 + _571;
    float _2222 = _2212 * _2204;
    float _2224 = fma(_2164, _1516, _2158);
    bool _2226 = _2216 >= 0.0;
    float _2228 = fma(_2218, _2084, _2084);
    float _2230 = fma(_2206, _2218, _2206);
    float _2232 = _2220 + (-1.0);
    float _2234 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2228);
    float _2236 = _2222 * (-2.0);
    float _2238 = _2224 * 0.15915493667125701904296875;
    float _2240 = fma(_2232, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2242 = fma(_2230, _1516, _2234);
    float _2244 = fma(_2236, _2086, _2086);
    float _2246 = _786 + (-0.5);
    float _2248 = _2238 * 6.283185482025146484375;
    float _2250 = sin(_2248);
    float _2252 = _2242 * 0.15915493667125701904296875;
    float _2254 = _2206;
    float _2256 = _2194;
    float _2258 = _2202;
    if (_2226)
    {
        _2254 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2260 = _2254;
    float _2262 = fma(_2240, _2236, _2240);
    float _2264 = fma(_2246, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2244);
    int _2266 = as_type<int>(_2260);
    if (_2226)
    {
        out.m_49.x = 0.0;
    }
    if (_2226)
    {
        float _2268 = _2260 * 5.0;
        _2266 = as_type<int>(_2268);
    }
    int _2270 = _2266;
    float _2272 = _2238 * 6.283185482025146484375;
    float _2274 = cos(_2272);
    float _2276 = fma(_2262, _1516, _2264);
    if (_2226)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7000 = as_type<float>(_2270);
        out.gl_Position.z = _7000;
    }
    float _2278 = _2276 * 0.15915493667125701904296875;
    float _2280 = _2252 * 6.283185482025146484375;
    float _2282 = sin(_2280);
    float _2284 = _2252 * 6.283185482025146484375;
    float _2286 = cos(_2284);
    if (_2226)
    {
        return out;
    }
    float _2288 = _2278 * 6.283185482025146484375;
    float _2290 = cos(_2288);
    float _2292 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2294 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2296 = _2250 * _2282;
    float _2298 = _2274 * _2286;
    float _2300 = _2292 * _2142;
    float _2302 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2304 = _2250 * _2286;
    float _2306 = _2278 * 6.283185482025146484375;
    float _2308 = sin(_2306);
    float _2310 = _2300 * _2294;
    float _2312 = _2274 * _2282;
    float _2314 = _2142 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2316 = _2314 * 0.5;
    float _2318 = _2274 * _2290;
    float _2320 = _2286 * _2290;
    float _2322 = _2250 * _2290;
    float _2324 = _2282 * _2290;
    float _2326 = _2156 * _2302;
    float _2328 = _2318 * _2310;
    float _2330 = fma(_2308, _2298, _2296);
    float _2332 = -_2304;
    float _2334 = fma(_2308, _2312, _2332);
    float _2336 = -_2310;
    float _2338 = _2308 * _2336;
    float _2340 = -_2312;
    float _2342 = fma(_2308, _2304, _2340);
    float _2344 = fma(_2330, _2326, _2328);
    float _2346 = _2322 * _2310;
    float _2348 = fma(_2320, _2326, _2338);
    float _2350 = fma(_2334, _2316, _2344);
    float _2352 = fma(_2308, _2296, _2298);
    float _2354 = fma(_2342, _2326, _2346);
    float _2356 = fma(_2324, _2316, _2348);
    float _2358 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2360 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2362 = fma(_2352, _2316, _2354);
    float _2364 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2358);
    float _2366 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2360);
    float _2368 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2364);
    float _2370 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2366);
    float _2372 = _2368 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2374 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2376 = _1758 + _2372;
    float _2378 = _1748 + _2374;
    float _2380 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2382 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2386 = _2376 + _2384;
    float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2390 = _2378 + _2388;
    float _2392 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2380);
    float _2394 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2382);
    float _2396 = _2386 * _2386;
    float _2398 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2392);
    float _2400 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2394);
    float _2402 = fma(_2390, _2390, _2396);
    float _2404 = _2398 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2406 = sqrt(_2402);
    float _2408 = _1738 + _2404;
    bool _2410 = _2406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2412 = _2398;
    float _2414 = _2404;
    float _2416 = _2382;
    float _2418 = _2326;
    if (!_2410)
    {
        _2412 = _2378;
    }
    float _2420 = _2412;
    float _2422 = _2420;
    if (!_2410)
    {
        _2414 = _2376;
    }
    float _2424 = _2414;
    float _2426 = _2424;
    if (!_2410)
    {
        _2416 = _2408;
    }
    float _2428 = _2416;
    bool _2430 = !_2410;
    float _2432 = _2428;
    if (!_2430)
    {
        float _2434 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2438 = _2406 + _2436;
        float _2440 = rsqrt(_2402);
        float _2442 = _2438 * _2434;
        float _2444 = _2408 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2446 = _2442 * 0.15915493667125701904296875;
        float _2448 = _2446 * 6.283185482025146484375;
        float _2450 = cos(_2448);
        float _2452 = _2446 * 6.283185482025146484375;
        float _2454 = sin(_2452);
        float _2456 = _2450 + (-1.0);
        float _2458 = fma(_2454, _2444, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2460 = _2456 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2462 = _2440 * _2458;
        float _2464 = fma(_2408, _2450, _2460);
        float _2466 = fma(_2390, _2462, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2468 = fma(_2386, _2462, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2432 = _2464;
        _2422 = _2466;
        _2426 = _2468;
        _2418 = _2446;
    }
    float _2470 = _2432;
    float _2472 = _2422;
    float _2474 = _2426;
    float _2476 = _2418;
    float _2478 = -_1738;
    float _2480 = _2478 + _2470;
    float _2482 = -_1748;
    float _2484 = _2482 + _2472;
    float _2486 = -_1758;
    float _2488 = _2486 + _2474;
    float _2490 = _2400 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2492 = _2480 * _2480;
    float _2494 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2496 = 1.0 / _2490;
    float _2498 = fma(_2484, _2484, _2492);
    float _2500 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2494);
    bool _2502 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2504 = isnan(0.5);
    bool _2506 = _2502 || _2504;
    bool _2508 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2510 = _2506 || _2508;
    float _2512 = fma(_2488, _2488, _2498);
    float _2514 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2500);
    bool _2516 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2518 = isnan(0.5);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2524 = _2520 || _2522;
    float _2526 = sqrt(_2512);
    float _2528 = _2514 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2530 = _2528 + _2490;
    float _2532 = _2530 * _2496;
    float _2534 = _2532 * 0.5;
    bool _2536 = _2526 > 0.0;
    float _2538 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2540 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2538);
    float _2542 = 1.0 / _2540;
    float _2544 = _2534;
    float _2546 = _2496;
    float _2548 = _2476;
    if (!_2536)
    {
        _2544 = _2472;
    }
    float _2550 = _2544;
    float _2552 = _2550;
    if (!_2536)
    {
        _2546 = _2470;
    }
    float _2554 = _2546;
    float _2556 = _2554;
    if (!_2536)
    {
        _2548 = _2474;
    }
    float _2558 = _2548;
    bool _2560 = !_2536;
    float _2562 = _2558;
    float _2564 = _2558;
    if (!_2560)
    {
        float _2566 = _211 * _211;
        float _2568 = fma(_209, _209, _2566);
        float _2570 = rsqrt(_2512);
        float _2572 = fma(_213, _213, _2568);
        float _2574 = sqrt(_2572);
        float _2576 = _2484 * _2570;
        float _2578 = _2480 * _2570;
        float _2580 = _2488 * _2570;
        bool _2582 = _2574 > 0.0;
        float _2584 = _2570;
        float _2586 = _2574;
        if (!_2582)
        {
            _2584 = _2472;
        }
        float _2588 = _2584;
        _2552 = _2588;
        if (!_2582)
        {
            _2586 = _2470;
        }
        float _2590 = _2586;
        _2556 = _2590;
        if (!_2582)
        {
            _2562 = _2474;
        }
        float _2592 = _2562;
        bool _2594 = !_2582;
        _2564 = _2592;
        if (!_2594)
        {
            float _2596 = rsqrt(_2572);
            float _2598 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2600 = _211 * _2596;
            float _2602 = _209 * _2596;
            float _2604 = _2578 * _2600;
            float _2606 = _213 * _2596;
            float _2608 = fma(_2576, _2602, _2604);
            float _2610 = _2598 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2612 = fma(_2580, _2606, _2608);
            float _2614 = _2612 * _2610;
            float _2616 = fma(_209, _2614, _2472);
            float _2618 = fma(_211, _2614, _2470);
            float _2620 = fma(_213, _2614, _2474);
            _2552 = _2616;
            _2556 = _2618;
            _2564 = _2620;
        }
    }
    float _2622 = _2552;
    float _2624 = _2556;
    float _2626 = _2564;
    float _2628 = -_1902;
    float _2630 = _2628 + _2622;
    float _2632 = -_1900;
    float _2634 = _2632 + _2624;
    float _2636 = -_1904;
    float _2638 = _2636 + _2626;
    float _2640 = _2634;
    float _2642 = _2630;
    float _2644 = _2638;
    if (_2524)
    {
        _221 = 1.0;
    }
    float _2646 = _221;
    float _2648 = _2646;
    if (!_2510)
    {
        float _2650 = _2186 * _2186;
        float _2652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2654 = -_1758;
        float _2656 = _2654 + _2626;
        float _2658 = -_1738;
        float _2660 = _2658 + _2624;
        float _2662 = fma(_2194, _2194, _2650);
        float _2664 = fma(_2202, _2202, _2662);
        float _2666 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2668 = sqrt(_2664);
        float _2670 = 1.0 / _2142;
        float _2672 = precise::min(_2668, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2674 = _2672 * _2652;
        float _2676 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2678 = -_1748;
        float _2680 = _2678 + _2622;
        float _2682 = _2674 * _2670;
        float _2684 = _2676 * _2682;
        float _2686 = _2656 * _2682;
        float _2688 = fma(_2660, _2684, _2176);
        float _2690 = fma(_2680, _2684, _2182);
        float _2692 = fma(_2676, _2686, _2190);
        _2640 = _2688;
        _2642 = _2690;
        _2644 = _2692;
        _2256 = _2668;
        _1836 = _2686;
    }
    float _2694 = _2640;
    float _2696 = _2642;
    float _2698 = _2644;
    float _2700 = _2256;
    float _2702 = _1836;
    float _2704 = _2700;
    float _2706 = _2702;
    if (_2524)
    {
        _1946 = 1.0;
    }
    float _2708 = _1946;
    float _2710 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2712 = _2542 * _2710;
    float _2714 = _2708;
    if (!_2524)
    {
        float _2716 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2718 = _2716 * 0.15915493667125701904296875;
        float _2720 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2722 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2724 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2722;
        float _2726 = _2718 * 6.283185482025146484375;
        float _2728 = cos(_2726);
        float _2730 = _2720 * 0.15915493667125701904296875;
        float _2732 = _2718 * 6.283185482025146484375;
        float _2734 = sin(_2732);
        float _2736 = 1.0 / _2728;
        float _2738 = _2730 * 6.283185482025146484375;
        float _2740 = cos(_2738);
        float _2742 = _2734 * _2736;
        float _2744 = _2730 * 6.283185482025146484375;
        float _2746 = sin(_2744);
        float _2748 = _2740 * _2742;
        float _2750 = 1.0 / _2724;
        float _2752 = 1.0 / _2748;
        float _2754 = _2746 * _2752;
        float _2756 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2758 = fma(_2712, _2754, _2756);
        float _2760 = _2758 * _2750;
        float _2762 = precise::clamp(_2760, 0.0, 1.0);
        _2258 = _2730;
        _2704 = _2742;
        _2648 = _2762;
    }
    float _2764 = _2258;
    float _2766 = _2704;
    float _2768 = _2648;
    float _2770 = _2764;
    float _2772 = _2766;
    if (!_2524)
    {
        float _2774 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2776 = _2774 * 0.15915493667125701904296875;
        float _2778 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2780 = _2776 * 6.283185482025146484375;
        float _2782 = cos(_2780);
        float _2784 = _2778 * 0.15915493667125701904296875;
        float _2786 = _2776 * 6.283185482025146484375;
        float _2788 = sin(_2786);
        float _2790 = 1.0 / _2782;
        float _2792 = _2784 * 6.283185482025146484375;
        float _2794 = cos(_2792);
        float _2796 = _2788 * _2790;
        float _2798 = _2784 * 6.283185482025146484375;
        float _2800 = sin(_2798);
        float _2802 = _2794 * _2796;
        float _2804 = 1.0 / _2802;
        float _2806 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2808 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2806;
        float _2810 = 1.0 / _2808;
        float _2812 = _2800 * _2804;
        float _2814 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2816 = fma(_2712, _2812, _2814);
        float _2818 = _2816 * _2810;
        float _2820 = precise::clamp(_2818, 0.0, 1.0);
        float _2822 = -_2820;
        float _2824 = _2822 + 1.0;
        _2770 = _2790;
        _2772 = _2802;
        _2714 = _2824;
    }
    float _2826 = _2770;
    float _2828 = _2772;
    float _2830 = _2714;
    float _2832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2834 = _2694 + _2832;
    float _2836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2838 = _2696 + _2836;
    float _2840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2842 = _2698 + _2840;
    float _2844 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2846 = _2834 * _2834;
    float _2848 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2844);
    float _2850 = fma(_2838, _2838, _2846);
    float _2852 = fma(_2842, _2842, _2850);
    float _2854 = rsqrt(_2852);
    float _2856 = sqrt(_2852);
    float _2858 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2860 = _2838 * _2858;
    float _2862 = _2842 * _2858;
    float _2864 = _2860 * _2860;
    float _2866 = _2862 * _2862;
    float _2868 = _2864 + _2866;
    float _2870 = sqrt(_2868);
    bool _2872 = _2870 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2876 = _2870 + _2874;
    float _2878 = _2826;
    float _2880 = _2868;
    float _2882 = _2876;
    float _2884 = _2828;
    float _2886 = _2834;
    if (_2872)
    {
        float _2888 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2878 = _2888;
    }
    float _2890 = _2878;
    if (_2872)
    {
        float _2892 = rsqrt(_2868);
        _2880 = _2892;
    }
    float _2894 = _2880;
    float _2896 = _2894;
    if (_2872)
    {
        float _2898 = _2876 * _2890;
        _2882 = _2898;
    }
    float _2900 = _2882;
    if (_2872)
    {
        float _2902 = _2900 * 0.15915493667125701904296875;
        _2884 = _2902;
    }
    float _2904 = _2884;
    float _2906 = _2842;
    float _2908 = _2904;
    if (_2872)
    {
        float _2910 = _2904 * 6.283185482025146484375;
        float _2912 = sin(_2910);
        _2906 = _2912;
    }
    float _2914 = _2906;
    float _2916 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2918 = precise::max(0.0, _2916);
    float _2920 = _2890;
    if (_2872)
    {
        float _2922 = _2904 * 6.283185482025146484375;
        float _2924 = cos(_2922);
        _2920 = _2924;
    }
    float _2926 = _2920;
    float _2928 = -_2858;
    float _2930 = -_2918;
    float _2932 = fma(_2834, _2928, _2930);
    float _2934 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2872)
    {
        float _2936 = _2932 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2886 = _2936;
    }
    float _2938 = _2886;
    float _2940 = _2938;
    if (!_2872)
    {
        _2908 = _2860;
    }
    float _2942 = _2908;
    float _2944 = fma(_2182, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2946 = _2914;
    float _2948 = _2942;
    if (_2872)
    {
        float _2950 = fma(_2914, _2938, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2946 = _2950;
    }
    float _2952 = _2946;
    float _2954 = _2952;
    if (!_2872)
    {
        _2940 = _2932;
    }
    float _2956 = _2940;
    float _2958 = _2956;
    float _2960 = _2926;
    if (_2872)
    {
        float _2962 = _2926 + (-1.0);
        _2934 = _2962;
    }
    float _2964 = _2934;
    float _2966 = _2964;
    if (_2872)
    {
        float _2968 = _2894 * _2952;
        _2706 = _2968;
    }
    float _2970 = _2706;
    if (!_2872)
    {
        _2896 = _2862;
    }
    float _2972 = _2896;
    float _2974 = _2972;
    if (_2872)
    {
        float _2976 = _2964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2966 = _2976;
    }
    float _2978 = _2966;
    if (_2872)
    {
        float _2980 = _2860 * _2970;
        _2948 = _2980;
    }
    float _2982 = _2948;
    if (!_2872)
    {
        _2954 = _2864;
    }
    float _2984 = _2954;
    float _2986 = _2984;
    if (_2872)
    {
        float _2988 = _2862 * _2970;
        _2974 = _2988;
    }
    float _2990 = _2974;
    if (_2872)
    {
        float _2992 = fma(_2932, _2926, _2978);
        _2958 = _2992;
    }
    float _2994 = _2958;
    if (_2872)
    {
        float _2996 = _2982 * _2982;
        _2986 = _2996;
    }
    float _2998 = _2986;
    if (!_2872)
    {
        _2960 = _2866;
    }
    float _3000 = _2960;
    float _3002 = _3000;
    if (_2872)
    {
        float _3004 = _2990 * _2990;
        _3002 = _3004;
    }
    float _3006 = _3002;
    float _3008 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3010 = fma(_2994, _2994, _2998);
    float _3012 = floor(_2944);
    float _3014 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3008);
    float _3016 = _3010 + _3006;
    float _3018 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3020 = fma(_2856, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3018);
    float _3022 = precise::clamp(_3020, 0.0, 1.0);
    float _3024 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3014);
    float _3026 = rsqrt(_3016);
    float _3028 = -_3022;
    float _3030 = _3028 + 1.0;
    float _3032 = _3024 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3034 = fma(_2190, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3036 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3038 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3040 = abs(_3030);
    float _3042 = log2(_3040);
    float _3044 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3046 = _3032 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3048 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3036);
    float _3050 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3044);
    float _3052 = -_3046;
    float _3054 = fma(_3052, _3038, 1.0);
    float _3056 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3048);
    float _3058 = _3026 * _2982;
    float _3060 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3050);
    float _3062 = _3026 * _2994;
    float _3064 = _3026 * _2990;
    float _3066 = _3058 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3068 = _3060 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3070 = _3056 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3072 = floor(_3034);
    float _3074 = -_3066;
    float _3076 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3074);
    float _3078 = _3068 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3080 = _3042 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3082 = -_3064;
    float _3084 = fma(_3082, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3076);
    float _3086 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2848);
    float _3088 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3078);
    float _3090 = exp2(_3080);
    float _3092 = fma(_3084, -0.5, 0.5);
    float _3094 = _3086 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3096 = fma(_3032, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3088);
    float _3098 = fma(_3084, 0.5, 0.5);
    float _3100 = _3068 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3102 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3096);
    float _3104 = log2(_3054);
    float _3106 = -_3072;
    float _3108 = _3034 + _3106;
    float _3110 = fma(_3098, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3112 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3100);
    float _3114 = fma(_3098, _3110, -0.212114393711090087890625);
    float _3116 = fma(_3032, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3112);
    float _3118 = 1.0 / _3102;
    float _3120 = -_3012;
    float _3122 = _2944 + _3120;
    float _3124 = _3068 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3126 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3124);
    float _3128 = _3062 + 1.0;
    float _3130 = sqrt(_3092);
    float _3132 = _3104 * 0.693147182464599609375;
    float _3134 = fma(_3032, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3126);
    float _3136 = -_3062;
    float _3138 = fma(_3090, _3128, _3136);
    float _3140 = fma(_3098, _3114, 1.570728778839111328125);
    float2 _8353 = float2(_3122, _3108);
    float _3142 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8353, float2(0.0), isnan(_8353)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8353, float2(0.0), isnan(_8353)), level(0.0)).x;
    float _3144 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3134);
    float _3146 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3116);
    float _3148 = _3132 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3150 = fma(_3138, 0.5, 0.5);
    float _3152 = _3144 * _3118;
    float _3154 = _3146 * _3118;
    float _3156 = fma(_3152, 0.5, 0.5);
    float _3158 = fma(_3154, -0.5, 0.5);
    float _3160 = _3130 * 0.636619746685028076171875;
    float _3162 = -_3140;
    float _3164 = fma(_3160, _3162, 1.0);
    float3 _8398 = float3(_3156, _3158, _3148);
    float _3166 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8398, float3(0.0), isnan(_8398)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8398, float3(0.0), isnan(_8398)), level(0.0)).x;
    float3 _8409 = float3(_3156, _3158, _3148);
    float4 _3169 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8409, float3(0.0), isnan(_8409)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8409, float3(0.0), isnan(_8409)), level(0.0)).xyzw;
    float _3171 = _3169.x;
    float _3173 = _3169.y;
    float _3175 = _3169.z;
    float _3177 = _3169.w;
    float2 _8425 = float2(_3164, _3150);
    float3 _3181 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8425, float2(0.0), isnan(_8425)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8425, float2(0.0), isnan(_8425)), level(0.0)).xyz;
    float _3183 = _3181.x;
    float _3185 = _3181.y;
    float _3187 = _3181.z;
    float _3189 = abs(_2712);
    float _3191 = log2(_3189);
    float _3193 = _2330 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3195 = _2330 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3197 = _2330 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3199 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3201 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3193);
    float _3203 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3195);
    float _3205 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3197);
    float _3207 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3209 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3211 = _2334 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3213 = _2334 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3215 = _2334 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3217 = -_2308;
    float _3219 = fma(_3217, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3199);
    float _3221 = -_2308;
    float _3223 = fma(_3221, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3209);
    float _3225 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3227 = _3191 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3229 = -_2308;
    float _3231 = fma(_3229, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3207);
    float _3233 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3211);
    float _3235 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3213);
    float _3237 = exp2(_3227);
    float _3239 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3215);
    float _3241 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3231);
    float _3243 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3233);
    float _3245 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3235);
    float _3247 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3239);
    float _3249 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3201);
    float _3251 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3219);
    float _3253 = fma(_3225, _3225, 1.0);
    float _3255 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3257 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3223);
    float _3259 = _3068 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3261 = rsqrt(_3253);
    float _3263 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3203);
    float _3265 = _3042 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3267 = fma(_3237, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3269 = precise::clamp(_3267, 0.0, 1.0);
    float _3271 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3205);
    float _3273 = _3225 * _3251;
    float _3275 = _3269 * _3269;
    float _3277 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3259);
    float _3279 = fma(_3269, -2.0, 3.0);
    float _3281 = _3225 * _3241;
    float _3283 = exp2(_3265);
    float _3285 = fma(_3255, _3263, _3273);
    float _3287 = _3275 * _3279;
    float _3289 = fma(_3255, _3249, _3281);
    float _3291 = _3225 * _3257;
    float _3293 = _3225 * _3261;
    float _3295 = -_3287;
    float _3297 = _3295 + 1.0;
    out.m_78.x = _3249;
    out.m_78.y = _3263;
    out.m_78.z = _3271;
    float _3299 = fma(_3255, _3271, _3291);
    float _3301 = -_3243;
    float _3303 = _3293 * _3301;
    float _3305 = fma(_3297, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3287);
    float _3307 = fma(_3032, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3277);
    float _3309 = in.m_80.x;
    float _3311 = fma(_3261, _3241, _3303);
    float _3313 = _3243 + _3289;
    float _3315 = _3245 + _3285;
    float _3317 = -_3283;
    float _3319 = _3317 + 1.0;
    out.m_82.x = _2696;
    out.m_82.y = _2694;
    out.m_82.z = _2698;
    bool _3321 = _2856 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3323 = isnan(_2856);
    bool _3325 = _3321 || _3323;
    bool _3327 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3329 = _3325 || _3327;
    float _3331 = -_3245;
    float _3333 = _3293 * _3331;
    float _3335 = -_3247;
    float _3337 = _3293 * _3335;
    float _3339 = _3319 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3341 = fma(_3261, _3251, _3333);
    bool _3343 = _2712 <= 8000.0;
    bool _3345 = isnan(_2712);
    bool _3347 = _3343 || _3345;
    bool _3349 = isnan(8000.0);
    bool _3351 = _3347 || _3349;
    float _3353 = float(_3351);
    float _3355 = fma(_3261, _3257, _3337);
    float _3357 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3307);
    float _3359 = _3102 * 0.5;
    float _3361 = _3144 + _3102;
    float _3363 = _3353 * _3305;
    out.m_84.x = _3311;
    out.m_84.y = _3341;
    out.m_84.z = _3355;
    float _3365 = _3357 + _3102;
    float _3367 = fma(_3146, -0.5, _3359);
    float _3369 = _3363 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3144;
    out.gl_Position.y = _3146;
    out.gl_Position.z = _3357;
    out.gl_Position.w = _3102;
    float _3371 = _3365 * 0.5;
    float _3373 = _3247 + _3299;
    float _3375 = _3361 * 0.5;
    out.m_86.x = _3313;
    out.m_86.y = _3315;
    out.m_86.z = _3373;
    float _3377 = _3245;
    float _3379 = _3355;
    float _3381 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3329)
    {
        _3377 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3383 = _3377;
    float _3385 = _3383;
    float _3387 = _3383;
    if (!_3329)
    {
        _3379 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3389 = _3379;
    out.m_88.z = _3371;
    out.m_88.w = _3102;
    out.m_90.x = _3375;
    out.m_90.y = _3367;
    out.m_90.z = _3371;
    out.m_90.w = _3102;
    float _3391 = -_3142;
    float _3393 = _3391 + 1.0;
    float _3395 = _3393 * _3369;
    float _3397 = precise::clamp(_3395, 0.0, 1.0);
    float _3399 = -_3397;
    float _3401 = fma(_3399, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3403 = _3173;
    float _3405 = _3389;
    float _3407 = _3389;
    if (!_3329)
    {
        _3381 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3409 = _3381;
    float _3411 = _3401 * _3309;
    float _3413 = _3411 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3415 = _3339 * _3166;
    float _3417 = -_3339;
    float _3419 = _3417 + 1.0;
    float _3421 = _3177 * _3415;
    float _3423 = _3187 * _3415;
    float _3425 = _3177 * _3419;
    out.m_92.x = _3413;
    float _3427 = fma(_3183, _3421, _3171);
    float _3429 = fma(_3185, _3421, _3173);
    float _3431 = fma(_3177, _3423, _3175);
    float _3433 = _2768 * _2830;
    float _3435 = _3415;
    float _3437 = _3433;
    float _3439 = _3409;
    float _3441 = _3409;
    if (!_3329)
    {
        _3435 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3443 = _3435;
    float _3445 = _3443;
    float _3447 = _3443;
    if (!_3329)
    {
        _3403 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3449 = _3403;
    out.m_94.x = _3427;
    out.m_94.y = _3429;
    out.m_94.z = _3431;
    out.m_94.w = _3425;
    float _3451 = _3433 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3453 = _3449;
    float _3455 = _3449;
    if (!_3329)
    {
        _3437 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3457 = _3437;
    bool _3459 = !_3329;
    float _3461 = _3457;
    float _3463 = _3457;
    if (!_3459)
    {
        bool _3465 = _2856 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3467 = isnan(_2856);
        bool _3469 = _3465 || _3467;
        bool _3471 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3473 = _3469 || _3471;
        if (!_3473)
        {
            float _3475 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3477 = _2856 + _3475;
            float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3481 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3479;
            float _3483 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3485 = _3483 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3487 = 1.0 / _3481;
            float _3489 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3491 = _3489 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3493 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3495 = _3493 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3497 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3499 = _3497 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3501 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3503 = _3501 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3505 = _3477 * _3487;
            float _3507 = precise::clamp(_3505, 0.0, 1.0);
            float _3509 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3511 = _3509 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3513 = fma(_3507, _3485, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3515 = fma(_3507, _3511, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3517 = fma(_3507, _3491, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3519 = fma(_3507, _3495, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3521 = fma(_3507, _3499, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3523 = fma(_3507, _3503, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3407 = _3517;
            _3455 = _3521;
            _3387 = _3513;
            _3447 = _3519;
            _3441 = _3515;
            _3463 = _3523;
            _3525 = true;
        }
        else
        {
            bool _3527 = _2856 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3529 = isnan(_2856);
            bool _3531 = _3527 || _3529;
            bool _3533 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3535 = _3531 || _3533;
            if (!_3535)
            {
                _3385 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3537 = _3385;
            _3387 = _3537;
            if (!_3535)
            {
                _3405 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3539 = _3405;
            _3407 = _3539;
            if (!_3535)
            {
                _3439 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3541 = _3439;
            _3441 = _3541;
            if (!_3535)
            {
                _3445 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3543 = _3445;
            _3447 = _3543;
            if (!_3535)
            {
                _3453 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3545 = _3453;
            _3455 = _3545;
            if (!_3535)
            {
                _3461 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3547 = _3461;
            bool _3549 = !_3535;
            _3463 = _3547;
            if (!_3549)
            {
                bool _3551 = _2856 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3553 = isnan(_2856);
                bool _3555 = _3551 || _3553;
                bool _3557 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3559 = _3555 || _3557;
                if (!_3559)
                {
                    float _3561 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3563 = _2856 + _3561;
                    float _3565 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3567 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3565;
                    float _3569 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3571 = _3569 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3573 = 1.0 / _3567;
                    float _3575 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3577 = _3575 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3579 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3581 = _3579 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3583 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3585 = _3583 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3587 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3589 = _3587 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3591 = _3563 * _3573;
                    float _3593 = precise::clamp(_3591, 0.0, 1.0);
                    float _3595 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3597 = _3595 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3599 = fma(_3593, _3571, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3601 = fma(_3593, _3597, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3603 = fma(_3593, _3577, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3605 = fma(_3593, _3581, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3607 = fma(_3593, _3585, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3609 = fma(_3593, _3589, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3407 = _3603;
                    _3455 = _3607;
                    _3387 = _3599;
                    _3447 = _3605;
                    _3441 = _3601;
                    _3463 = _3609;
                    _3525 = true;
                }
                else
                {
                    _3407 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3455 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3387 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3447 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3441 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3463 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3525 = false;
    float _3611 = _3407;
    float _3613 = _3455;
    float _3615 = _3387;
    float _3617 = _3447;
    float _3619 = _3441;
    float _3621 = _3463;
    float _3623 = fma(_3315, -0.5, 0.5);
    float _3625 = precise::clamp(_3623, 0.0, 1.0);
    float _3627 = -_3611;
    float _3629 = _3627 + _3613;
    float _3631 = _3451 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3633 = -_3615;
    float _3635 = _3633 + _3617;
    float _3637 = fma(_3625, _3629, _3611);
    out.m_96.x = 0.0;
    float _3639 = -_3619;
    float _3641 = _3639 + _3621;
    float _3643 = fma(_3625, _3635, _3615);
    float _3645 = _3637 * 0.586610972881317138671875;
    out.m_49.x = _3631;
    bool _3647 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3649 = fma(_3625, _3641, _3619);
    float _3651 = fma(_3643, 0.298911988735198974609375, _3645);
    bool _3653 = _2768 > 0.0;
    bool _3655 = isnan(_2768);
    bool _3657 = _3653 || _3655;
    bool _3659 = isnan(0.0);
    bool _3661 = _3657 || _3659;
    float _3663 = fma(_3649, 0.114477999508380889892578125, _3651);
    bool _3665 = _2830 <= 0.0;
    bool _3667 = !_3661;
    bool _3669 = _3665 || _3667;
    float _3671 = -_3663;
    float _3673 = _3637 + _3671;
    float _3675 = -_3663;
    float _3677 = _3643 + _3675;
    float _3679 = -_3663;
    float _3681 = _3649 + _3679;
    float _3683 = fma(_3673, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3663);
    float _3685 = fma(_3677, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3663);
    float _3687 = fma(_3681, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3663);
    bool _3689 = !_3647;
    if (!_3689)
    {
        float _3691 = -_2694;
        float _3693 = _3691 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3695 = -_2696;
        float _3697 = _3695 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3699 = -_2698;
        float _3701 = _3699 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3703 = _3693 * _3693;
        float _3705 = fma(_3697, _3697, _3703);
        float _3707 = fma(_3701, _3701, _3705);
        float _3709 = sqrt(_3707);
        float _3711 = rsqrt(_3707);
        float _3713 = -_3709;
        float _3715 = _3713 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3717 = _3715 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3719 = precise::clamp(_3717, 0.0, 1.0);
        float _3721 = _3697 * _3711;
        float _3723 = _3693 * _3711;
        float _3725 = abs(_3719);
        float _3727 = log2(_3725);
        float _3729 = _3701 * _3711;
        float _3731 = _3721 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3733 = _3315 * _3723;
        float _3735 = -_3723;
        float _3737 = -_3731;
        float _3739 = fma(_3735, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3737);
        float _3741 = fma(_3313, _3721, _3733);
        float _3743 = -_3729;
        float _3745 = fma(_3743, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3739);
        float _3747 = fma(_3373, _3729, _3741);
        float _3749 = precise::clamp(_3747, 0.0, 1.0);
        float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3753 = _3745 + _3751;
        float _3755 = _3727 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3757 = _3753 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3759 = precise::clamp(_3757, 0.0, 1.0);
        float _3761 = exp2(_3755);
        float _3763 = _3761 * _3759;
        float _3765 = _3749 * _3763;
        float _3767 = _3765 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3769 = _3765 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3771 = _3765 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3767;
        out.m_96.y = _3769;
        out.m_96.z = _3771;
    }
    out.m_98.x = _3685;
    out.m_98.y = _3683;
    out.m_98.z = _3687;
    if (!_3669)
    {
        return out;
    }
    float _3773 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3773;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3525 = false;
    bool _391 = false;
    bool _241 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_46.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (!_121)
    {
        out.m_49.x = 0.0;
    }
    int _127 = 0;
    if (!_121)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3829 = as_type<float>(_131);
        out.gl_Position.z = _3829;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_51.w;
    float _137 = float(_117);
    float _139 = -_135;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_135);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    bool _153 = _141 >= _137;
    bool _155 = !_151;
    bool _157 = _153 || _155;
    float _159 = 1.0 / _137;
    float _161 = _135;
    float _163 = _141;
    if (_157)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _161;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    float _167 = _141 * _159;
    float _169 = _167;
    if (_157)
    {
        float _171 = _165 * 5.0;
        _133 = as_type<int>(_171);
    }
    int _173 = _133;
    out.m_53.x = _167;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3902 = as_type<float>(_173);
        out.gl_Position.z = _3902;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_58.x;
    float _179 = in.m_58.y;
    float _181 = in.m_58.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _201 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _205 = !_189;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _199);
    float _211 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _201);
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _203);
    bool _215 = !_185;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_191;
    float _221 = _211;
    float _239;
    if (!_219)
    {
        float _223 = in.m_60.x;
        float _225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _231 = _229 * _225;
        float _233 = floor(_231);
        float _235 = -_233;
        float _237 = _231 + _235;
        _239 = _237;
        _241 = true;
    }
    else
    {
        _239 = _167;
    }
    _241 = false;
    float _243 = _239;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _243 + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _261 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _263 = isnan(_243);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = in.m_62.x;
    float _275 = in.m_62.y;
    bool _277 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _279 = isnan(_243);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = 1.0 / _259;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = -_271;
    float _295 = _293 + 1.0;
    float _297 = 1.0 / _255;
    float _299 = _251 * _289;
    float _301 = _247 * _297;
    bool _303 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_243);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _319;
    float _323 = -_313;
    float _325 = _323 + 1.0;
    float _327 = fma(_317, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _329 = fma(_321, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _331 = _313 * _295;
    float _333 = _287 * _325;
    float _335 = -_287;
    float _337 = _335 + 1.0;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _347 = _327 * _333;
    float _349 = _329 * _333;
    float _351 = fma(_341, _299, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _353 = fma(_345, _299, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _355 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].x, _347);
    float _357 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].y, _349);
    float _359 = fma(_351, _331, _355);
    float _361 = fma(_353, _331, _357);
    float _363 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[145].x, _359);
    float _365 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[145].y, _361);
    float _367 = _363 * _273;
    float _369 = _365 * _275;
    bool _371 = !_291;
    float _389;
    if (!_371)
    {
        float _373 = in.m_60.x;
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _377 = _373 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        _389 = _167;
    }
    _391 = false;
    float _393 = _389;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _397 = _393 + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _403 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _405 = isnan(_393);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _423 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _425 = isnan(_393);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = 1.0 / _401;
    float _437 = -_413;
    float _439 = _437 + 1.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _441;
    bool _445 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _447 = isnan(_393);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = _433 * _439;
    float _459 = -_433;
    float _461 = _459 + 1.0;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _465 = 1.0 / _417;
    float _467 = _455 * _461;
    float _469 = -_455;
    float _471 = _469 + 1.0;
    float _473 = 1.0 / _421;
    float _475 = _443 * _435;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _481 = fma(_475, _397, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _483 = _479 * _465;
    bool _485 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _487 = isnan(_393);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _497;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _503 = _393 + _501;
    float _505 = _481 * _467;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _509 = _393 + _507;
    float _511 = -_495;
    float _513 = _511 + 1.0;
    float _515 = fma(_483, _503, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _517 = _499 * _473;
    float _519 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[115].x, _505);
    float _521 = _413 * _513;
    float _523 = fma(_517, _509, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _525 = fma(_515, _457, _519);
    float _527 = fma(_523, _521, _525);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _535 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[118].x, _527);
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _537;
    out.m_64.y = _539;
    out.m_64.z = _541;
    out.m_64.w = _543;
    bool _545 = !_463;
    float _547 = _413;
    if (!_545)
    {
        float _549 = in.m_60.x;
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _553 = _549 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _169 = _563;
    }
    float _565 = _169;
    float _567 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _569 = int(_567);
    float _571 = in.m_60.x;
    float _573 = in.m_60.y;
    float _575 = _159 * _141;
    float _577 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _581 = _579 != 0;
    float _583 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _585 = int(_583);
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _589 = float(_569);
    float _591 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _593 = int(_591);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_581)
    {
        _547 = 1.0;
    }
    float _599 = _547;
    float _601 = _599;
    if (!_581)
    {
        _601 = 7.345489978790283203125;
    }
    float _603 = _601;
    float _605 = float(_585);
    float _607 = 1.0 / _589;
    float _609 = _603 * _571;
    float _611 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _613 = int(_611);
    float _615 = float(uint(_593));
    bool _617 = _593 == 0;
    float _619 = 1.0 / _605;
    float _621 = _607 * _141;
    float _623 = 1.0 / _615;
    float _625 = float(uint(_613));
    int _627 = ~_613;
    int _629 = _627 + 1;
    float _631 = trunc(_621);
    int _633 = int(_631);
    float _635 = _619 * _141;
    int _637 = ~_593;
    int _639 = _637 + 1;
    float _641 = 1.0 / _625;
    int _643 = as_type<int>(_623) + (-2);
    float _645 = trunc(_635);
    int _647 = int(_645);
    float _649 = float(uint(_633));
    float _651 = as_type<float>(_643) * _649;
    int _653 = as_type<int>(_641) + (-2);
    float _655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _657 = ~_613;
    int _659 = _657 + 1;
    float _661 = float(uint(_647));
    float _663 = trunc(_651);
    float _665 = precise::max(_663, 0.0);
    uint _668 = uint(_665);
    float _670 = as_type<float>(_653) * _661;
    float _672 = trunc(_670);
    float _674 = precise::max(_672, 0.0);
    uint _676 = uint(_674);
    float _678 = _655 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _680 = _639 * int(_668);
    int _682 = _680 + _633;
    float _684 = floor(_609);
    float _686 = float(uint(_682));
    int _688 = _659 * int(_676);
    int _690 = _688 + _647;
    float _692 = as_type<float>(_643) * _686;
    float _694 = _686;
    if (_581)
    {
        _694 = 1.0;
    }
    float _696 = _694;
    float _698 = float(uint(_690));
    float _700 = trunc(_692);
    float _702 = precise::max(_700, 0.0);
    uint _704 = uint(_702);
    float _706 = _696;
    float _708 = _698;
    if (!_581)
    {
        _706 = 1.2345600128173828125;
    }
    float _710 = _706;
    float _712 = -_684;
    float _714 = _609 + _712;
    float _716 = as_type<float>(_653) * _698;
    if (_581)
    {
        _708 = _571;
    }
    float _718 = _708;
    float _720 = _718;
    if (!_581)
    {
        _720 = _573;
    }
    float _722 = _720;
    float _724 = trunc(_716);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    float _730 = _710 * _722;
    int _732 = ~_593;
    int _734 = _732 + 1;
    int _736 = int(_668) + int(_704);
    float _738 = floor(_730);
    float _740 = float(_593);
    float _742 = float(_633);
    int _744 = _734 * _736;
    int _746 = _744 + _633;
    int _748 = int(_676) + int(_728);
    float _750 = _714 * _740;
    float _752 = _740 * _575;
    bool _754 = _742 >= _740;
    bool _756 = isnan(_742);
    bool _758 = _754 || _756;
    bool _760 = isnan(_740);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    bool _766 = uint(_746) >= uint(_593);
    int _768 = _629 * _748;
    int _770 = _768 + _647;
    float _772 = -_738;
    float _774 = _730 + _772;
    float _776 = trunc(_764);
    int _778 = int(_776);
    bool _780 = !_766;
    int _782 = _780 ? 0 : (-1);
    bool _784 = uint(_770) >= uint(_613);
    float _786 = in.m_60.z;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _790 = _788 != 0;
    int _792 = ~_736;
    int _794 = _792 + _782;
    int _796 = _794 + 1;
    float _798 = trunc(_750);
    int _800 = int(_798);
    bool _802 = !_790;
    int _804 = _802 ? 0 : 1;
    float _806 = float(_613);
    int _808 = abs(_804);
    int _810 = _593 * _796;
    int _812 = _810 + _633;
    float _814 = float(_647);
    float _816 = _806 * _575;
    int _818 = ~_778;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    bool _824 = !_784;
    int _826 = _824 ? 0 : (-1);
    bool _828 = !_617;
    int _830 = _828 ? _812 : (-1);
    float _832 = trunc(_816);
    int _834 = int(_832);
    bool _836 = _814 >= _806;
    bool _838 = isnan(_814);
    bool _840 = _836 || _838;
    bool _842 = isnan(_806);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = _774 * _806;
    bool _850 = _573 > 0.5;
    int _852 = _830 * _822;
    int _854 = ~_748;
    int _856 = _854 + _826;
    int _858 = _856 + 1;
    int _860 = _800 * _808;
    int _862 = _860 + _633;
    bool _864 = _786 > 0.5;
    float _866 = trunc(_848);
    int _868 = int(_866);
    float _870 = -_217;
    int _872 = _850 ? as_type<int>(_870) : as_type<int>(_217);
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _876 = _874 != 0;
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _880 = _878 != 0;
    float _882 = -_207;
    int _884 = _864 ? as_type<int>(_882) : as_type<int>(_207);
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _888 = _886 != 0;
    float _890 = trunc(_846);
    int _892 = int(_890);
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _896 = _894 != 0;
    bool _898 = !_876;
    float _900 = _898 ? _217 : as_type<float>(_872);
    bool _902 = !_880;
    float _904 = _902 ? _207 : as_type<float>(_884);
    bool _906 = !_888;
    int _908 = _906 ? 0 : 1;
    float _910 = trunc(_752);
    int _912 = int(_910);
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _924 = _922 != 0;
    float _926 = _900 + 0.5;
    int _928 = abs(_908);
    int _930 = _593 + (-1);
    bool _932 = !_920;
    int _934 = _932 ? 0 : 1;
    bool _936 = !_896;
    int _938 = _936 ? 0 : 1;
    int _940 = _778 * _930;
    int _942 = _940 + _852;
    bool _944 = !_916;
    int _946 = _944 ? 0 : 1;
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _950 = _948 != 0;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _954 = _952 != 0;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _958 = _956 != 0;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _962 = _960 != 0;
    int _964 = abs(_934);
    int _966 = _868 * _928;
    int _968 = _966 + _647;
    int _970 = abs(_946);
    int _972 = _613 * _858;
    int _974 = _972 + _647;
    bool _976 = !_924;
    int _978 = _976 ? 0 : 1;
    bool _980 = !_954;
    int _982 = _980 ? 0 : 1;
    bool _984 = _613 == 0;
    int _986 = abs(_978);
    int _988 = _942 * _964;
    int _990 = ~_892;
    int _992 = _990 + 1;
    int _994 = _992 + 1;
    bool _996 = !_984;
    int _998 = _996 ? _974 : (-1);
    int _1000 = _912 * _970;
    int _1002 = _1000 + _988;
    int _1004 = _613 + (-1);
    int _1006 = _998 * _994;
    int _1008 = abs(_938);
    int _1010 = _862 * _986;
    int _1012 = _1010 + _1002;
    int _1014 = abs(_982);
    int _1016 = _892 * _1004;
    int _1018 = _1016 + _1006;
    bool _1020 = !_950;
    int _1022 = _1020 ? 0 : 1;
    int _1024 = _800 * _1008;
    int _1026 = _1024 + _1012;
    bool _1028 = !_958;
    int _1030 = _1028 ? 0 : 1;
    int _1032 = abs(_1022);
    bool _1034 = !_962;
    int _1036 = _1034 ? 0 : 1;
    int _1038 = abs(_1030);
    int _1040 = _1018 * _1014;
    float _1042 = float(uint(_1026));
    int _1044 = abs(_1036);
    int _1046 = _834 * _1032;
    int _1048 = _1046 + _1040;
    float _1050 = as_type<float>(_643) * _1042;
    int _1052 = ~_593;
    int _1054 = _1052 + 1;
    int _1056 = _968 * _1038;
    int _1058 = _1056 + _1048;
    bool _1060 = _593 == 0;
    float _1062 = trunc(_1050);
    float _1064 = precise::max(_1062, 0.0);
    uint _1066 = uint(_1064);
    int _1068 = _868 * _1044;
    int _1070 = _1068 + _1058;
    int _1072 = ~_593;
    int _1074 = _1072 + 1;
    int _1076 = ~_613;
    int _1078 = _1076 + 1;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1082 = float(uint(_1070));
    float _1084 = float(uint(_862));
    float _1086 = as_type<float>(_653) * _1082;
    float _1088 = as_type<float>(_643) * _1084;
    int _1090 = _1074 * int(_1066);
    int _1092 = _1090 + _1026;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1098 = trunc(_1086);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    float _1104 = float(uint(_1092));
    float _1106 = as_type<float>(_643) * _1104;
    float _1108 = trunc(_1088);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    int _1114 = _1078 * int(_1102);
    int _1116 = _1114 + _1070;
    float _1118 = trunc(_1106);
    float _1120 = precise::max(_1118, 0.0);
    uint _1122 = uint(_1120);
    float _1124 = _573 * 2.0;
    float _1126 = float(uint(_1116));
    float _1128 = floor(_1124);
    float _1130 = as_type<float>(_653) * _1126;
    int _1132 = ~_613;
    int _1134 = _1132 + 1;
    int _1136 = int(_1066) + int(_1122);
    float _1138 = trunc(_1130);
    float _1140 = precise::max(_1138, 0.0);
    uint _1142 = uint(_1140);
    int _1144 = _1054 * _1136;
    int _1146 = _1144 + _1026;
    float _1148 = 1.0 / _1096;
    bool _1150 = uint(_1146) >= uint(_593);
    bool _1152 = !_1150;
    int _1154 = _1152 ? 0 : (-1);
    int _1156 = ~_1136;
    int _1158 = _1156 + _1154;
    int _1160 = _1158 + 1;
    float _1162 = _786 * 2.0;
    int _1164 = int(_1102) + int(_1142);
    float _1166 = float(uint(_968));
    int _1168 = _593 * _1160;
    int _1170 = _1168 + _1026;
    float _1172 = _573 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1174 = _1134 * _1164;
    int _1176 = _1174 + _1070;
    float _1178 = floor(_1162);
    float _1180 = as_type<float>(_653) * _1166;
    bool _1182 = !_1060;
    int _1184 = _1182 ? _1170 : (-1);
    float _1186 = fma(_1172, -2.0, _1080);
    bool _1188 = uint(_1176) >= uint(_613);
    int _1190 = _1184 & 3;
    bool _1192 = _1190 != 0;
    int _1194 = _1184 & 3;
    bool _1196 = _1194 != 0;
    float _1198 = trunc(_1180);
    float _1200 = precise::max(_1198, 0.0);
    uint _1202 = uint(_1200);
    bool _1204 = !_1188;
    int _1206 = _1204 ? 0 : (-1);
    int _1208 = _1192 ? 0 : 1;
    bool _1210 = uint(_1194) >= 2u;
    bool _1212 = uint(_1194) > 1u;
    int _1214 = ~_1164;
    int _1216 = _1214 + _1206;
    int _1218 = _1216 + 1;
    int _1220 = _1210 ? 0 : 1;
    bool _1222 = _1194 != 3;
    int _1224 = _613 * _1218;
    int _1226 = _1224 + _1070;
    int _1228 = ~_1208;
    int _1230 = _1228 + 1;
    int _1232 = _1230 + 1;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1236 = _1234 != 0;
    bool _1238 = !_984;
    int _1240 = _1238 ? _1226 : (-1);
    int _1242 = _1232;
    float _1244 = as_type<float>(_862);
    if (!_1212)
    {
        int _1246 = ~_1208;
        int _1248 = _1246 + 1;
        _1242 = _1248;
    }
    int _1250 = _1242;
    int _1252 = _1240 & 3;
    bool _1254 = _1252 != 0;
    int _1256 = ~_1220;
    int _1258 = _1256 + 1;
    int _1260 = _1258 + 1;
    int _1262 = _1260;
    if (_1222)
    {
        int _1264 = ~_1220;
        int _1266 = _1264 + 1;
        _1262 = _1266;
    }
    int _1268 = _1262;
    bool _1270 = uint(_1252) > 1u;
    float _1272 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1274 = log2(_1272);
    int _1276 = _1240 & 3;
    bool _1278 = _1276 != 0;
    if (_1236)
    {
        _597 = 0;
    }
    int _1280 = _597;
    int _1282 = _1278 ? 0 : 1;
    int _1284 = _1280;
    if (!_1236)
    {
        _1284 = 2;
    }
    int _1286 = _1284;
    int _1288 = ~_1282;
    int _1290 = _1288 + 1;
    int _1292 = _1290 + 1;
    bool _1294 = _573 > 0.5;
    int _1296 = _1292;
    if (!_1270)
    {
        int _1298 = ~_1282;
        int _1300 = _1298 + 1;
        _1296 = _1300;
    }
    int _1302 = _1296;
    float _1304 = _571 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1306 = _1274 * _141;
    bool _1308 = _1252 != 3;
    bool _1310 = _1286 != 2;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1314 = -_207;
    float _1316 = _1294 ? _1314 : _207;
    float _1318 = exp2(_1306);
    bool _1320 = uint(_1252) >= 2u;
    float _1322 = -_1312;
    float _1324 = fma(_1304, 2.0, _1322);
    float _1326 = _571 * 2.0;
    float _1328 = _1320 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1330 = floor(_1326);
    int _1332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1334 = _1332 != 0;
    int _1336 = ~as_type<int>(_1328);
    int _1338 = _1336 + 1;
    int _1340 = _1338 + 1;
    int _1342 = _1340;
    float _1344 = _1328;
    float _1346 = _1316;
    if (_1308)
    {
        int _1348 = ~as_type<int>(_1328);
        int _1350 = _1348 + 1;
        _1342 = _1350;
    }
    int _1352 = _1342;
    if (_1310)
    {
        _1344 = _571;
    }
    float _1354 = _1344;
    float _1356 = _1354;
    if (!_1310)
    {
        _1356 = _786;
    }
    float _1358 = _1356;
    bool _1360 = !_1334;
    int _1362 = _1360 ? 0 : 1;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1366 = _1364 != 0;
    float _1368 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1370 = _571 > 0.5;
    float _1372 = -_1318;
    float _1374 = _1372 + 1.0;
    bool _1376 = !_1366;
    float _1378 = _1376 ? _207 : _1316;
    float _1380 = -_587;
    float _1382 = fma(_1368, 2.0, _1380);
    int _1384 = ~_593;
    int _1386 = _1384 + 1;
    float _1388 = -_217;
    int _1390 = _1370 ? as_type<int>(_1388) : as_type<int>(_217);
    float _1392 = -_141;
    float _1394 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1382);
    bool _1396 = _1330 > 0.0;
    int _1398 = _1386 * int(_1112);
    int _1400 = _1398 + _862;
    bool _1402 = _1330 >= 0.0;
    bool _1404 = isnan(_1330);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan(0.0);
    bool _1410 = _1406 || _1408;
    float _1412 = fma(_678, _926, _1394);
    int _1414 = ~_613;
    int _1416 = _1414 + 1;
    if (_1310)
    {
        _1346 = _573;
    }
    float _1418 = _1346;
    float _1420 = _1418;
    if (!_1310)
    {
        _1420 = _571;
    }
    float _1422 = _1420;
    int _1424 = _1416 * int(_1202);
    int _1426 = _1424 + _968;
    float _1428 = float(uint(_1400));
    bool _1430 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1432 = isnan(0.0);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1438 = _1434 || _1436;
    float _1440 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1442 = float(uint(_1426));
    float _1444 = as_type<float>(_643) * _1428;
    float _1446 = _1438 ? _1374 : 0.0;
    float _1448 = fma(_1440, -2.0, _595);
    bool _1450 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1452 = isnan(1.0);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1458 = _1454 || _1456;
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1462 = 1.0 + _1460;
    float _1464 = as_type<float>(_653) * _1442;
    float _1466 = trunc(_1444);
    float _1468 = precise::max(_1466, 0.0);
    uint _1470 = uint(_1468);
    float _1472 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1448);
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1476 = 1.0 / _1462;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1482 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1474);
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1486 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1478);
    float _1488 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1480);
    float _1490 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1482);
    float _1492 = trunc(_1464);
    float _1494 = precise::max(_1492, 0.0);
    uint _1496 = uint(_1494);
    float _1498 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1484);
    float _1500 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1186);
    float _1502 = -_141;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1324);
    float _1506 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1486);
    float _1508 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1488);
    float _1510 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1498);
    int _1512 = int(_1112) + int(_1470);
    if (_1458)
    {
        float _1514 = _1446 * _1476;
        _163 = _1514;
    }
    float _1516 = _163;
    int _1518 = ~_593;
    int _1520 = _1518 + 1;
    float _1522 = in.m_46.x;
    float _1524 = in.m_46.y;
    float _1526 = in.m_46.z;
    int _1528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1530 = _1528 != 0;
    float _1532 = _1378 + (-0.5);
    int _1534 = ~_613;
    int _1536 = _1534 + 1;
    int _1538 = _1520 * _1512;
    int _1540 = _1538 + _862;
    int _1542 = _1410 ? 0 : 1;
    float _1544 = -_1490;
    float _1546 = _1544 + 1.0;
    bool _1548 = !_1530;
    float _1550 = _1548 ? _217 : as_type<float>(_1390);
    float _1552 = -_1532;
    float _1554 = -_1500;
    float _1556 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1554);
    bool _1558 = _1128 > 0.0;
    float _1560 = -_1506;
    float _1562 = _1560 + 1.0;
    bool _1564 = _1128 >= 0.0;
    bool _1566 = isnan(_1128);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan(0.0);
    bool _1572 = _1568 || _1570;
    float _1574 = -_1508;
    float _1576 = _1574 + 1.0;
    int _1578 = int(_1202) + int(_1496);
    int _1580 = ~_1542;
    int _1582 = _1580 + 1;
    int _1584 = _1582 + 1;
    int _1586 = _1584;
    if (!_1396)
    {
        int _1588 = ~_1542;
        int _1590 = _1588 + 1;
        _1586 = _1590;
    }
    int _1592 = _1586;
    bool _1594 = uint(_1540) >= uint(_593);
    int _1596 = _1536 * _1578;
    int _1598 = _1596 + _968;
    float _1600 = _1524 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1602 = _1572 ? 0 : 1;
    float _1604 = _1524 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1606 = !_1594;
    int _1608 = _1606 ? 0 : (-1);
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1610;
    bool _1614 = uint(_1598) >= uint(_613);
    float _1616 = fma(_1522, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1600);
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1620 = _1618 != 0;
    float _1622 = _1612 * _1148;
    bool _1624 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1626 = isnan(_565);
    bool _1628 = _1624 || _1626;
    bool _1630 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1632 = _1628 || _1630;
    float _1634 = float(_1632);
    float _1636 = fma(_1522, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1604);
    int _1638 = ~_1602;
    int _1640 = _1638 + 1;
    int _1642 = _1640 + 1;
    int _1644 = _1642;
    if (!_1558)
    {
        int _1646 = ~_1602;
        int _1648 = _1646 + 1;
        _1644 = _1648;
    }
    int _1650 = _1644;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1654 = _565 + _1652;
    bool _1656 = !_1614;
    int _1658 = _1656 ? 0 : (-1);
    float _1660 = -_1634;
    float _1662 = _1660 + 1.0;
    int _1664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1666 = _1664 != 0;
    int _1668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1670 = _1668 != 0;
    int _1672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1674 = _1672 != 0;
    float _1676 = _1524 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1678 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1680 = isnan(_565);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1686 = _1682 || _1684;
    float _1688 = float(_1686);
    bool _1690 = !_1196;
    int _1692 = _1690 ? 0 : 1;
    float _1694 = fma(_1522, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1676);
    float _1696 = fma(_1622, _1654, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1698 = _1688 * _1662;
    float _1700 = _1550 + 0.5;
    float _1702 = fma(_1526, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1694);
    bool _1704 = _1178 >= 0.0;
    bool _1706 = isnan(_1178);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan(0.0);
    bool _1712 = _1708 || _1710;
    float _1714 = _1696 * _1698;
    float _1716 = fma(_1700, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1504);
    float _1718 = -_1688;
    float _1720 = _1718 + 1.0;
    int _1722 = _1712 ? 0 : 1;
    bool _1724 = _1178 > 0.0;
    float _1726 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1714);
    float _1728 = -_1546;
    float _1730 = fma(_1550, _1728, _1716);
    float _1732 = fma(_1378, _1562, _1556);
    float _1734 = fma(_1526, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1616);
    float _1736 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1726);
    float _1738 = _1702 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1740 = _1184 >> 31;
    float _1742 = _573 + _571;
    int _1744 = _1240 >> 31;
    float _1746 = fma(_1526, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1636);
    float _1748 = _1734 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1752 = _1738 + _1750;
    int _1754 = _1740 & 3;
    float _1756 = _1742 + (-1.0);
    float _1758 = _1746 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1760 = _1744 & 3;
    float _1762 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1764 = _1748 + _1762;
    float _1766 = _1752 * _1752;
    int _1768 = _1184 + _1754;
    out.m_66.x = _1730;
    out.m_66.y = _1732;
    float _1770 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1772 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1774 = _1758 + _1772;
    float _1776 = fma(_1764, _1764, _1766);
    int _1778 = _1768 >> 2;
    float _1780 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1782 = !_1254;
    int _1784 = _1782 ? 0 : 1;
    float _1786 = fma(_1774, _1774, _1776);
    int _1788 = _1778 << 4;
    int _1790 = _1788 + 368;
    float _1792 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1780);
    int _1794 = _1240 + _1760;
    float _1796 = _577 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1798 = _1194 != 3;
    float _1800 = rsqrt(_1786);
    int _1802 = _1794 >> 2;
    float _1804 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1792);
    int _1806 = ~_1722;
    int _1808 = _1806 + 1;
    int _1810 = _1808 + 1;
    float _1812 = _1736 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1814 = _1802 << 4;
    int _1816 = _1814 + 512;
    uint _1818 = uint(int(uint(_1790) >> uint(2)));
    uint _1820 = uint(int(uint(int(_1818)) >> uint(2)));
    int _1822 = int(_1818) & 3;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[int(_1820)][_1822];
    int _1826 = int(_1818) + 1;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    int _1830 = _1826 & 3;
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[int(_1828)][_1830];
    int _1834 = _1810;
    float _1836 = _1758;
    if (!_1724)
    {
        int _1838 = ~_1722;
        int _1840 = _1838 + 1;
        _1834 = _1840;
    }
    int _1842 = _1834;
    float _1844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1846 = !_1798;
    int _1848 = _1846 ? 0 : (-1);
    out.m_68.w = _1812;
    bool _1850 = _1252 != 3;
    int _1852 = abs(_1268);
    uint _1854 = uint(int(uint(_1816) >> uint(2)));
    uint _1856 = uint(int(uint(int(_1854)) >> uint(2)));
    int _1858 = int(_1854) & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    int _1862 = int(_1854) + 1;
    uint _1864 = uint(int(uint(_1862) >> uint(2)));
    int _1866 = _1862 & 3;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[int(_1864)][_1866];
    bool _1870 = !_1850;
    int _1872 = _1870 ? 0 : (-1);
    bool _1874 = _1804 >= 0.0;
    float _1876 = _1796 * _1800;
    int _1878 = abs(_1352);
    int _1880 = abs(_1362);
    int _1882 = _1790 + 8;
    uint _1884 = uint(int(uint(_1882) >> uint(2)));
    uint _1886 = uint(int(uint(int(_1884)) >> uint(2)));
    int _1888 = int(_1884) & 3;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[int(_1886)][_1888];
    int _1892 = int(_1884) + 1;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    int _1896 = _1892 & 3;
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[int(_1894)][_1896];
    float _1900 = _1752 * _1876;
    float _1902 = _1764 * _1876;
    float _1904 = _1774 * _1876;
    float _1906 = _1844 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1908 = -_1900;
    float _1910 = _1752 + _1908;
    float _1912 = -_1902;
    float _1914 = _1764 + _1912;
    float _1916 = -_1904;
    float _1918 = _1774 + _1916;
    int _1920 = _1816 + 8;
    uint _1922 = uint(int(uint(_1920) >> uint(2)));
    uint _1924 = uint(int(uint(int(_1922)) >> uint(2)));
    int _1926 = int(_1922) & 3;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[int(_1924)][_1926];
    int _1930 = int(_1922) + 1;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    int _1934 = _1930 & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    float _1938 = _1910 * _1910;
    float _1940 = _904 + (-0.5);
    bool _1942 = !_1666;
    int _1944 = _1942 ? 0 : 1;
    float _1946 = _1902;
    if (_1874)
    {
        out.m_49.x = 0.0;
    }
    float _1948 = fma(_1914, _1914, _1938);
    float _1950 = -_1906;
    float _1952 = -_1472;
    float _1954 = fma(_1950, _1940, _1952);
    int _1956 = abs(_1302);
    float _1958 = -_1576;
    float _1960 = fma(_900, _1958, _1412);
    float _1962 = fma(_1918, _1918, _1948);
    int _1964 = abs(_1250);
    float _1966 = _571 + (-0.5);
    int _1968 = abs(_1692);
    int _1970 = ~_1964;
    int _1972 = _1970 + 1;
    int _1974 = _1972 + 1;
    int _1976 = ~_1956;
    int _1978 = _1976 + 1;
    int _1980 = _1978 + 1;
    int _1982 = ~_1968;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    int _1988 = abs(_1784);
    int _1990 = ~_1512;
    int _1992 = _1990 + _1608;
    int _1994 = _1992 + 1;
    int _1996 = _1974 * as_type<int>(_1832);
    int _1998 = ~_1852;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    int _2004 = ~_1578;
    int _2006 = _2004 + _1658;
    int _2008 = _2006 + 1;
    int _2010 = _1986 * as_type<int>(_1824);
    int _2012 = _2010 + _1996;
    int _2014 = abs(_1848);
    int _2016 = _593 * _1994;
    int _2018 = _2016 + _862;
    int _2020 = abs(_1944);
    int _2022 = _1980 * as_type<int>(_1868);
    int _2024 = ~_1988;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = _613 * _2008;
    int _2032 = _2030 + _968;
    bool _2034 = _593 == 0;
    float _2036 = float(_1842);
    int _2038 = _2028 * as_type<int>(_1860);
    int _2040 = _2038 + _2022;
    int _2042 = _2002 * as_type<int>(_1890);
    int _2044 = _2042 + _2012;
    bool _2046 = !_1620;
    int _2048 = _2046 ? 0 : 1;
    int _2050 = abs(_1872);
    int _2052 = abs(_2048);
    int _2054 = ~_2014;
    int _2056 = _2054 + 1;
    int _2058 = _2056 + 1;
    int _2060 = ~_1878;
    int _2062 = _2060 + 1;
    int _2064 = _2062 + 1;
    int _2066 = ~_2050;
    int _2068 = _2066 + 1;
    int _2070 = _2068 + 1;
    int _2072 = _2058 * as_type<int>(_1898);
    int _2074 = _2072 + _2044;
    float _2076 = float(_2020);
    int _2078 = _2064 * as_type<int>(_1928);
    int _2080 = _2078 + _2040;
    float _2082 = in.m_70.x;
    float _2084 = in.m_70.y;
    float _2086 = in.m_70.z;
    int _2088 = _2070 * as_type<int>(_1936);
    int _2090 = _2088 + _2080;
    float _2092 = sqrt(_1962);
    int _2094 = ~_1880;
    int _2096 = _2094 + 1;
    int _2098 = _2096 + 1;
    float _2100 = -_1510;
    float _2102 = _2100 + 1.0;
    int _2104 = ~_2052;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    float _2110 = _2076 * _2036;
    bool _2112 = !_2034;
    int _2114 = _2112 ? _2018 : (-1);
    int _2116 = _2074 * _2098;
    bool _2118 = !_984;
    int _2120 = _2118 ? _2032 : (-1);
    int _2122 = _2090 * _2108;
    float _2124 = fma(_904, _2102, _1954);
    int _2126 = _2114 * _1880;
    int _2128 = _2126 + _2116;
    if (_1874)
    {
        _1244 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2130 = _1244;
    float _2132 = _2110 * (-2.0);
    int _2134 = _2120 * _2052;
    int _2136 = _2134 + _2122;
    bool _2138 = !_1670;
    int _2140 = _2138 ? 0 : 1;
    out.m_72.x = _1960;
    out.m_72.y = _2124;
    float _2142 = _1800 * _2092;
    int _2144 = as_type<int>(_2130);
    if (_1874)
    {
        float _2146 = _2130 * 5.0;
        _2144 = as_type<int>(_2146);
    }
    int _2148 = _2144;
    float _2150 = float(_2128);
    float _2152 = fma(_2132, _2082, _2082);
    float _2154 = float(_2136);
    float _2156 = _577 * _2142;
    if (_1874)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6797 = as_type<float>(_2148);
        out.gl_Position.z = _6797;
    }
    float _2158 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2152);
    float _2160 = _573 + _786;
    float _2162 = float(_1592);
    out.m_74.x = _2150;
    out.m_74.y = _2154;
    float _2164 = fma(_1770, _2132, _1770);
    float _2166 = _2160 + (-1.0);
    out.m_76.x = _2156;
    bool _2168 = !_1674;
    int _2170 = _2168 ? 0 : 1;
    int _2172 = abs(_2140);
    if (_1874)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2174 = -_1900;
    float _2176 = _1738 + _2174;
    int _2178 = abs(_2170);
    float _2180 = -_1902;
    float _2182 = _1748 + _2180;
    float _2184 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2186 = _2176 + _2184;
    float _2188 = -_1904;
    float _2190 = _1758 + _2188;
    float _2192 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2194 = _2182 + _2192;
    float _2196 = float(_2172);
    float _2198 = _2186 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2200 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2202 = _2190 + _2200;
    float _2204 = float(_1650);
    float _2206 = fma(_2166, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2208 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2198);
    float _2210 = _2196 * _2162;
    float _2212 = float(_2178);
    float _2214 = _573 + (-0.5);
    float _2216 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2208);
    float _2218 = _2210 * (-2.0);
    float _2220 = _786 + _571;
    float _2222 = _2212 * _2204;
    float _2224 = fma(_2164, _1516, _2158);
    bool _2226 = _2216 >= 0.0;
    float _2228 = fma(_2218, _2084, _2084);
    float _2230 = fma(_2206, _2218, _2206);
    float _2232 = _2220 + (-1.0);
    float _2234 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2228);
    float _2236 = _2222 * (-2.0);
    float _2238 = _2224 * 0.15915493667125701904296875;
    float _2240 = fma(_2232, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2242 = fma(_2230, _1516, _2234);
    float _2244 = fma(_2236, _2086, _2086);
    float _2246 = _786 + (-0.5);
    float _2248 = _2238 * 6.283185482025146484375;
    float _2250 = sin(_2248);
    float _2252 = _2242 * 0.15915493667125701904296875;
    float _2254 = _2206;
    float _2256 = _2194;
    float _2258 = _2202;
    if (_2226)
    {
        _2254 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2260 = _2254;
    float _2262 = fma(_2240, _2236, _2240);
    float _2264 = fma(_2246, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2244);
    int _2266 = as_type<int>(_2260);
    if (_2226)
    {
        out.m_49.x = 0.0;
    }
    if (_2226)
    {
        float _2268 = _2260 * 5.0;
        _2266 = as_type<int>(_2268);
    }
    int _2270 = _2266;
    float _2272 = _2238 * 6.283185482025146484375;
    float _2274 = cos(_2272);
    float _2276 = fma(_2262, _1516, _2264);
    if (_2226)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7000 = as_type<float>(_2270);
        out.gl_Position.z = _7000;
    }
    float _2278 = _2276 * 0.15915493667125701904296875;
    float _2280 = _2252 * 6.283185482025146484375;
    float _2282 = sin(_2280);
    float _2284 = _2252 * 6.283185482025146484375;
    float _2286 = cos(_2284);
    if (_2226)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2288 = _2278 * 6.283185482025146484375;
    float _2290 = cos(_2288);
    float _2292 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2294 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2296 = _2250 * _2282;
    float _2298 = _2274 * _2286;
    float _2300 = _2292 * _2142;
    float _2302 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2304 = _2250 * _2286;
    float _2306 = _2278 * 6.283185482025146484375;
    float _2308 = sin(_2306);
    float _2310 = _2300 * _2294;
    float _2312 = _2274 * _2282;
    float _2314 = _2142 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2316 = _2314 * 0.5;
    float _2318 = _2274 * _2290;
    float _2320 = _2286 * _2290;
    float _2322 = _2250 * _2290;
    float _2324 = _2282 * _2290;
    float _2326 = _2156 * _2302;
    float _2328 = _2318 * _2310;
    float _2330 = fma(_2308, _2298, _2296);
    float _2332 = -_2304;
    float _2334 = fma(_2308, _2312, _2332);
    float _2336 = -_2310;
    float _2338 = _2308 * _2336;
    float _2340 = -_2312;
    float _2342 = fma(_2308, _2304, _2340);
    float _2344 = fma(_2330, _2326, _2328);
    float _2346 = _2322 * _2310;
    float _2348 = fma(_2320, _2326, _2338);
    float _2350 = fma(_2334, _2316, _2344);
    float _2352 = fma(_2308, _2296, _2298);
    float _2354 = fma(_2342, _2326, _2346);
    float _2356 = fma(_2324, _2316, _2348);
    float _2358 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2360 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2362 = fma(_2352, _2316, _2354);
    float _2364 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2358);
    float _2366 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2360);
    float _2368 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2364);
    float _2370 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2366);
    float _2372 = _2368 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2374 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2376 = _1758 + _2372;
    float _2378 = _1748 + _2374;
    float _2380 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2382 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2386 = _2376 + _2384;
    float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2390 = _2378 + _2388;
    float _2392 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2380);
    float _2394 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2382);
    float _2396 = _2386 * _2386;
    float _2398 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2392);
    float _2400 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2394);
    float _2402 = fma(_2390, _2390, _2396);
    float _2404 = _2398 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2406 = sqrt(_2402);
    float _2408 = _1738 + _2404;
    bool _2410 = _2406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2412 = _2398;
    float _2414 = _2404;
    float _2416 = _2382;
    float _2418 = _2326;
    if (!_2410)
    {
        _2412 = _2378;
    }
    float _2420 = _2412;
    float _2422 = _2420;
    if (!_2410)
    {
        _2414 = _2376;
    }
    float _2424 = _2414;
    float _2426 = _2424;
    if (!_2410)
    {
        _2416 = _2408;
    }
    float _2428 = _2416;
    bool _2430 = !_2410;
    float _2432 = _2428;
    if (!_2430)
    {
        float _2434 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2438 = _2406 + _2436;
        float _2440 = rsqrt(_2402);
        float _2442 = _2438 * _2434;
        float _2444 = _2408 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2446 = _2442 * 0.15915493667125701904296875;
        float _2448 = _2446 * 6.283185482025146484375;
        float _2450 = cos(_2448);
        float _2452 = _2446 * 6.283185482025146484375;
        float _2454 = sin(_2452);
        float _2456 = _2450 + (-1.0);
        float _2458 = fma(_2454, _2444, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2460 = _2456 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2462 = _2440 * _2458;
        float _2464 = fma(_2408, _2450, _2460);
        float _2466 = fma(_2390, _2462, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2468 = fma(_2386, _2462, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2432 = _2464;
        _2422 = _2466;
        _2426 = _2468;
        _2418 = _2446;
    }
    float _2470 = _2432;
    float _2472 = _2422;
    float _2474 = _2426;
    float _2476 = _2418;
    float _2478 = -_1738;
    float _2480 = _2478 + _2470;
    float _2482 = -_1748;
    float _2484 = _2482 + _2472;
    float _2486 = -_1758;
    float _2488 = _2486 + _2474;
    float _2490 = _2400 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2492 = _2480 * _2480;
    float _2494 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2496 = 1.0 / _2490;
    float _2498 = fma(_2484, _2484, _2492);
    float _2500 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2494);
    bool _2502 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2504 = isnan(0.5);
    bool _2506 = _2502 || _2504;
    bool _2508 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2510 = _2506 || _2508;
    float _2512 = fma(_2488, _2488, _2498);
    float _2514 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2500);
    bool _2516 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2518 = isnan(0.5);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2524 = _2520 || _2522;
    float _2526 = sqrt(_2512);
    float _2528 = _2514 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2530 = _2528 + _2490;
    float _2532 = _2530 * _2496;
    float _2534 = _2532 * 0.5;
    bool _2536 = _2526 > 0.0;
    float _2538 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2540 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2538);
    float _2542 = 1.0 / _2540;
    float _2544 = _2534;
    float _2546 = _2496;
    float _2548 = _2476;
    if (!_2536)
    {
        _2544 = _2472;
    }
    float _2550 = _2544;
    float _2552 = _2550;
    if (!_2536)
    {
        _2546 = _2470;
    }
    float _2554 = _2546;
    float _2556 = _2554;
    if (!_2536)
    {
        _2548 = _2474;
    }
    float _2558 = _2548;
    bool _2560 = !_2536;
    float _2562 = _2558;
    float _2564 = _2558;
    if (!_2560)
    {
        float _2566 = _211 * _211;
        float _2568 = fma(_209, _209, _2566);
        float _2570 = rsqrt(_2512);
        float _2572 = fma(_213, _213, _2568);
        float _2574 = sqrt(_2572);
        float _2576 = _2484 * _2570;
        float _2578 = _2480 * _2570;
        float _2580 = _2488 * _2570;
        bool _2582 = _2574 > 0.0;
        float _2584 = _2570;
        float _2586 = _2574;
        if (!_2582)
        {
            _2584 = _2472;
        }
        float _2588 = _2584;
        _2552 = _2588;
        if (!_2582)
        {
            _2586 = _2470;
        }
        float _2590 = _2586;
        _2556 = _2590;
        if (!_2582)
        {
            _2562 = _2474;
        }
        float _2592 = _2562;
        bool _2594 = !_2582;
        _2564 = _2592;
        if (!_2594)
        {
            float _2596 = rsqrt(_2572);
            float _2598 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2600 = _211 * _2596;
            float _2602 = _209 * _2596;
            float _2604 = _2578 * _2600;
            float _2606 = _213 * _2596;
            float _2608 = fma(_2576, _2602, _2604);
            float _2610 = _2598 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2612 = fma(_2580, _2606, _2608);
            float _2614 = _2612 * _2610;
            float _2616 = fma(_209, _2614, _2472);
            float _2618 = fma(_211, _2614, _2470);
            float _2620 = fma(_213, _2614, _2474);
            _2552 = _2616;
            _2556 = _2618;
            _2564 = _2620;
        }
    }
    float _2622 = _2552;
    float _2624 = _2556;
    float _2626 = _2564;
    float _2628 = -_1902;
    float _2630 = _2628 + _2622;
    float _2632 = -_1900;
    float _2634 = _2632 + _2624;
    float _2636 = -_1904;
    float _2638 = _2636 + _2626;
    float _2640 = _2634;
    float _2642 = _2630;
    float _2644 = _2638;
    if (_2524)
    {
        _221 = 1.0;
    }
    float _2646 = _221;
    float _2648 = _2646;
    if (!_2510)
    {
        float _2650 = _2186 * _2186;
        float _2652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2654 = -_1758;
        float _2656 = _2654 + _2626;
        float _2658 = -_1738;
        float _2660 = _2658 + _2624;
        float _2662 = fma(_2194, _2194, _2650);
        float _2664 = fma(_2202, _2202, _2662);
        float _2666 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2668 = sqrt(_2664);
        float _2670 = 1.0 / _2142;
        float _2672 = precise::min(_2668, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2674 = _2672 * _2652;
        float _2676 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2678 = -_1748;
        float _2680 = _2678 + _2622;
        float _2682 = _2674 * _2670;
        float _2684 = _2676 * _2682;
        float _2686 = _2656 * _2682;
        float _2688 = fma(_2660, _2684, _2176);
        float _2690 = fma(_2680, _2684, _2182);
        float _2692 = fma(_2676, _2686, _2190);
        _2640 = _2688;
        _2642 = _2690;
        _2644 = _2692;
        _2256 = _2668;
        _1836 = _2686;
    }
    float _2694 = _2640;
    float _2696 = _2642;
    float _2698 = _2644;
    float _2700 = _2256;
    float _2702 = _1836;
    float _2704 = _2700;
    float _2706 = _2702;
    if (_2524)
    {
        _1946 = 1.0;
    }
    float _2708 = _1946;
    float _2710 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2712 = _2542 * _2710;
    float _2714 = _2708;
    if (!_2524)
    {
        float _2716 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2718 = _2716 * 0.15915493667125701904296875;
        float _2720 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2722 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2724 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2722;
        float _2726 = _2718 * 6.283185482025146484375;
        float _2728 = cos(_2726);
        float _2730 = _2720 * 0.15915493667125701904296875;
        float _2732 = _2718 * 6.283185482025146484375;
        float _2734 = sin(_2732);
        float _2736 = 1.0 / _2728;
        float _2738 = _2730 * 6.283185482025146484375;
        float _2740 = cos(_2738);
        float _2742 = _2734 * _2736;
        float _2744 = _2730 * 6.283185482025146484375;
        float _2746 = sin(_2744);
        float _2748 = _2740 * _2742;
        float _2750 = 1.0 / _2724;
        float _2752 = 1.0 / _2748;
        float _2754 = _2746 * _2752;
        float _2756 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2758 = fma(_2712, _2754, _2756);
        float _2760 = _2758 * _2750;
        float _2762 = precise::clamp(_2760, 0.0, 1.0);
        _2258 = _2730;
        _2704 = _2742;
        _2648 = _2762;
    }
    float _2764 = _2258;
    float _2766 = _2704;
    float _2768 = _2648;
    float _2770 = _2764;
    float _2772 = _2766;
    if (!_2524)
    {
        float _2774 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2776 = _2774 * 0.15915493667125701904296875;
        float _2778 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2780 = _2776 * 6.283185482025146484375;
        float _2782 = cos(_2780);
        float _2784 = _2778 * 0.15915493667125701904296875;
        float _2786 = _2776 * 6.283185482025146484375;
        float _2788 = sin(_2786);
        float _2790 = 1.0 / _2782;
        float _2792 = _2784 * 6.283185482025146484375;
        float _2794 = cos(_2792);
        float _2796 = _2788 * _2790;
        float _2798 = _2784 * 6.283185482025146484375;
        float _2800 = sin(_2798);
        float _2802 = _2794 * _2796;
        float _2804 = 1.0 / _2802;
        float _2806 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2808 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2806;
        float _2810 = 1.0 / _2808;
        float _2812 = _2800 * _2804;
        float _2814 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2816 = fma(_2712, _2812, _2814);
        float _2818 = _2816 * _2810;
        float _2820 = precise::clamp(_2818, 0.0, 1.0);
        float _2822 = -_2820;
        float _2824 = _2822 + 1.0;
        _2770 = _2790;
        _2772 = _2802;
        _2714 = _2824;
    }
    float _2826 = _2770;
    float _2828 = _2772;
    float _2830 = _2714;
    float _2832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2834 = _2694 + _2832;
    float _2836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2838 = _2696 + _2836;
    float _2840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2842 = _2698 + _2840;
    float _2844 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2846 = _2834 * _2834;
    float _2848 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2844);
    float _2850 = fma(_2838, _2838, _2846);
    float _2852 = fma(_2842, _2842, _2850);
    float _2854 = rsqrt(_2852);
    float _2856 = sqrt(_2852);
    float _2858 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2860 = _2838 * _2858;
    float _2862 = _2842 * _2858;
    float _2864 = _2860 * _2860;
    float _2866 = _2862 * _2862;
    float _2868 = _2864 + _2866;
    float _2870 = sqrt(_2868);
    bool _2872 = _2870 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2876 = _2870 + _2874;
    float _2878 = _2826;
    float _2880 = _2868;
    float _2882 = _2876;
    float _2884 = _2828;
    float _2886 = _2834;
    if (_2872)
    {
        float _2888 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2878 = _2888;
    }
    float _2890 = _2878;
    if (_2872)
    {
        float _2892 = rsqrt(_2868);
        _2880 = _2892;
    }
    float _2894 = _2880;
    float _2896 = _2894;
    if (_2872)
    {
        float _2898 = _2876 * _2890;
        _2882 = _2898;
    }
    float _2900 = _2882;
    if (_2872)
    {
        float _2902 = _2900 * 0.15915493667125701904296875;
        _2884 = _2902;
    }
    float _2904 = _2884;
    float _2906 = _2842;
    float _2908 = _2904;
    if (_2872)
    {
        float _2910 = _2904 * 6.283185482025146484375;
        float _2912 = sin(_2910);
        _2906 = _2912;
    }
    float _2914 = _2906;
    float _2916 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2918 = precise::max(0.0, _2916);
    float _2920 = _2890;
    if (_2872)
    {
        float _2922 = _2904 * 6.283185482025146484375;
        float _2924 = cos(_2922);
        _2920 = _2924;
    }
    float _2926 = _2920;
    float _2928 = -_2858;
    float _2930 = -_2918;
    float _2932 = fma(_2834, _2928, _2930);
    float _2934 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2872)
    {
        float _2936 = _2932 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2886 = _2936;
    }
    float _2938 = _2886;
    float _2940 = _2938;
    if (!_2872)
    {
        _2908 = _2860;
    }
    float _2942 = _2908;
    float _2944 = fma(_2182, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2946 = _2914;
    float _2948 = _2942;
    if (_2872)
    {
        float _2950 = fma(_2914, _2938, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2946 = _2950;
    }
    float _2952 = _2946;
    float _2954 = _2952;
    if (!_2872)
    {
        _2940 = _2932;
    }
    float _2956 = _2940;
    float _2958 = _2956;
    float _2960 = _2926;
    if (_2872)
    {
        float _2962 = _2926 + (-1.0);
        _2934 = _2962;
    }
    float _2964 = _2934;
    float _2966 = _2964;
    if (_2872)
    {
        float _2968 = _2894 * _2952;
        _2706 = _2968;
    }
    float _2970 = _2706;
    if (!_2872)
    {
        _2896 = _2862;
    }
    float _2972 = _2896;
    float _2974 = _2972;
    if (_2872)
    {
        float _2976 = _2964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2966 = _2976;
    }
    float _2978 = _2966;
    if (_2872)
    {
        float _2980 = _2860 * _2970;
        _2948 = _2980;
    }
    float _2982 = _2948;
    if (!_2872)
    {
        _2954 = _2864;
    }
    float _2984 = _2954;
    float _2986 = _2984;
    if (_2872)
    {
        float _2988 = _2862 * _2970;
        _2974 = _2988;
    }
    float _2990 = _2974;
    if (_2872)
    {
        float _2992 = fma(_2932, _2926, _2978);
        _2958 = _2992;
    }
    float _2994 = _2958;
    if (_2872)
    {
        float _2996 = _2982 * _2982;
        _2986 = _2996;
    }
    float _2998 = _2986;
    if (!_2872)
    {
        _2960 = _2866;
    }
    float _3000 = _2960;
    float _3002 = _3000;
    if (_2872)
    {
        float _3004 = _2990 * _2990;
        _3002 = _3004;
    }
    float _3006 = _3002;
    float _3008 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3010 = fma(_2994, _2994, _2998);
    float _3012 = floor(_2944);
    float _3014 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3008);
    float _3016 = _3010 + _3006;
    float _3018 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3020 = fma(_2856, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3018);
    float _3022 = precise::clamp(_3020, 0.0, 1.0);
    float _3024 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3014);
    float _3026 = rsqrt(_3016);
    float _3028 = -_3022;
    float _3030 = _3028 + 1.0;
    float _3032 = _3024 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3034 = fma(_2190, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3036 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3038 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3040 = abs(_3030);
    float _3042 = log2(_3040);
    float _3044 = _2694 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3046 = _3032 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3048 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3036);
    float _3050 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3044);
    float _3052 = -_3046;
    float _3054 = fma(_3052, _3038, 1.0);
    float _3056 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3048);
    float _3058 = _3026 * _2982;
    float _3060 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3050);
    float _3062 = _3026 * _2994;
    float _3064 = _3026 * _2990;
    float _3066 = _3058 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3068 = _3060 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3070 = _3056 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3072 = floor(_3034);
    float _3074 = -_3066;
    float _3076 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3074);
    float _3078 = _3068 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3080 = _3042 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3082 = -_3064;
    float _3084 = fma(_3082, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3076);
    float _3086 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2848);
    float _3088 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3078);
    float _3090 = exp2(_3080);
    float _3092 = fma(_3084, -0.5, 0.5);
    float _3094 = _3086 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3096 = fma(_3032, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3088);
    float _3098 = fma(_3084, 0.5, 0.5);
    float _3100 = _3068 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3102 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3096);
    float _3104 = log2(_3054);
    float _3106 = -_3072;
    float _3108 = _3034 + _3106;
    float _3110 = fma(_3098, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3112 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3100);
    float _3114 = fma(_3098, _3110, -0.212114393711090087890625);
    float _3116 = fma(_3032, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3112);
    float _3118 = 1.0 / _3102;
    float _3120 = -_3012;
    float _3122 = _2944 + _3120;
    float _3124 = _3068 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3126 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3124);
    float _3128 = _3062 + 1.0;
    float _3130 = sqrt(_3092);
    float _3132 = _3104 * 0.693147182464599609375;
    float _3134 = fma(_3032, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3126);
    float _3136 = -_3062;
    float _3138 = fma(_3090, _3128, _3136);
    float _3140 = fma(_3098, _3114, 1.570728778839111328125);
    float2 _8353 = float2(_3122, _3108);
    float _3142 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8353, float2(0.0), isnan(_8353)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8353, float2(0.0), isnan(_8353)), level(0.0)).x;
    float _3144 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3134);
    float _3146 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3116);
    float _3148 = _3132 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3150 = fma(_3138, 0.5, 0.5);
    float _3152 = _3144 * _3118;
    float _3154 = _3146 * _3118;
    float _3156 = fma(_3152, 0.5, 0.5);
    float _3158 = fma(_3154, -0.5, 0.5);
    float _3160 = _3130 * 0.636619746685028076171875;
    float _3162 = -_3140;
    float _3164 = fma(_3160, _3162, 1.0);
    float3 _8398 = float3(_3156, _3158, _3148);
    float _3166 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8398, float3(0.0), isnan(_8398)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8398, float3(0.0), isnan(_8398)), level(0.0)).x;
    float3 _8409 = float3(_3156, _3158, _3148);
    float4 _3169 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8409, float3(0.0), isnan(_8409)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8409, float3(0.0), isnan(_8409)), level(0.0)).xyzw;
    float _3171 = _3169.x;
    float _3173 = _3169.y;
    float _3175 = _3169.z;
    float _3177 = _3169.w;
    float2 _8425 = float2(_3164, _3150);
    float3 _3181 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8425, float2(0.0), isnan(_8425)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8425, float2(0.0), isnan(_8425)), level(0.0)).xyz;
    float _3183 = _3181.x;
    float _3185 = _3181.y;
    float _3187 = _3181.z;
    float _3189 = abs(_2712);
    float _3191 = log2(_3189);
    float _3193 = _2330 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3195 = _2330 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3197 = _2330 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3199 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3201 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3193);
    float _3203 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3195);
    float _3205 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3197);
    float _3207 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3209 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3211 = _2334 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3213 = _2334 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3215 = _2334 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3217 = -_2308;
    float _3219 = fma(_3217, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3199);
    float _3221 = -_2308;
    float _3223 = fma(_3221, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3209);
    float _3225 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3227 = _3191 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3229 = -_2308;
    float _3231 = fma(_3229, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3207);
    float _3233 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3211);
    float _3235 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3213);
    float _3237 = exp2(_3227);
    float _3239 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3215);
    float _3241 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3231);
    float _3243 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3233);
    float _3245 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3235);
    float _3247 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3239);
    float _3249 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3201);
    float _3251 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3219);
    float _3253 = fma(_3225, _3225, 1.0);
    float _3255 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3257 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3223);
    float _3259 = _3068 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3261 = rsqrt(_3253);
    float _3263 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3203);
    float _3265 = _3042 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3267 = fma(_3237, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3269 = precise::clamp(_3267, 0.0, 1.0);
    float _3271 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3205);
    float _3273 = _3225 * _3251;
    float _3275 = _3269 * _3269;
    float _3277 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3259);
    float _3279 = fma(_3269, -2.0, 3.0);
    float _3281 = _3225 * _3241;
    float _3283 = exp2(_3265);
    float _3285 = fma(_3255, _3263, _3273);
    float _3287 = _3275 * _3279;
    float _3289 = fma(_3255, _3249, _3281);
    float _3291 = _3225 * _3257;
    float _3293 = _3225 * _3261;
    float _3295 = -_3287;
    float _3297 = _3295 + 1.0;
    out.m_78.x = _3249;
    out.m_78.y = _3263;
    out.m_78.z = _3271;
    float _3299 = fma(_3255, _3271, _3291);
    float _3301 = -_3243;
    float _3303 = _3293 * _3301;
    float _3305 = fma(_3297, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3287);
    float _3307 = fma(_3032, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3277);
    float _3309 = in.m_80.x;
    float _3311 = fma(_3261, _3241, _3303);
    float _3313 = _3243 + _3289;
    float _3315 = _3245 + _3285;
    float _3317 = -_3283;
    float _3319 = _3317 + 1.0;
    out.m_82.x = _2696;
    out.m_82.y = _2694;
    out.m_82.z = _2698;
    bool _3321 = _2856 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3323 = isnan(_2856);
    bool _3325 = _3321 || _3323;
    bool _3327 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3329 = _3325 || _3327;
    float _3331 = -_3245;
    float _3333 = _3293 * _3331;
    float _3335 = -_3247;
    float _3337 = _3293 * _3335;
    float _3339 = _3319 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3341 = fma(_3261, _3251, _3333);
    bool _3343 = _2712 <= 8000.0;
    bool _3345 = isnan(_2712);
    bool _3347 = _3343 || _3345;
    bool _3349 = isnan(8000.0);
    bool _3351 = _3347 || _3349;
    float _3353 = float(_3351);
    float _3355 = fma(_3261, _3257, _3337);
    float _3357 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3307);
    float _3359 = _3102 * 0.5;
    float _3361 = _3144 + _3102;
    float _3363 = _3353 * _3305;
    out.m_84.x = _3311;
    out.m_84.y = _3341;
    out.m_84.z = _3355;
    float _3365 = _3357 + _3102;
    float _3367 = fma(_3146, -0.5, _3359);
    float _3369 = _3363 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3144;
    out.gl_Position.y = _3146;
    out.gl_Position.z = _3357;
    out.gl_Position.w = _3102;
    float _3371 = _3365 * 0.5;
    float _3373 = _3247 + _3299;
    float _3375 = _3361 * 0.5;
    out.m_86.x = _3313;
    out.m_86.y = _3315;
    out.m_86.z = _3373;
    float _3377 = _3245;
    float _3379 = _3355;
    float _3381 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3329)
    {
        _3377 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3383 = _3377;
    float _3385 = _3383;
    float _3387 = _3383;
    if (!_3329)
    {
        _3379 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3389 = _3379;
    out.m_88.z = _3371;
    out.m_88.w = _3102;
    out.m_90.x = _3375;
    out.m_90.y = _3367;
    out.m_90.z = _3371;
    out.m_90.w = _3102;
    float _3391 = -_3142;
    float _3393 = _3391 + 1.0;
    float _3395 = _3393 * _3369;
    float _3397 = precise::clamp(_3395, 0.0, 1.0);
    float _3399 = -_3397;
    float _3401 = fma(_3399, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3403 = _3173;
    float _3405 = _3389;
    float _3407 = _3389;
    if (!_3329)
    {
        _3381 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3409 = _3381;
    float _3411 = _3401 * _3309;
    float _3413 = _3411 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3415 = _3339 * _3166;
    float _3417 = -_3339;
    float _3419 = _3417 + 1.0;
    float _3421 = _3177 * _3415;
    float _3423 = _3187 * _3415;
    float _3425 = _3177 * _3419;
    out.m_92.x = _3413;
    float _3427 = fma(_3183, _3421, _3171);
    float _3429 = fma(_3185, _3421, _3173);
    float _3431 = fma(_3177, _3423, _3175);
    float _3433 = _2768 * _2830;
    float _3435 = _3415;
    float _3437 = _3433;
    float _3439 = _3409;
    float _3441 = _3409;
    if (!_3329)
    {
        _3435 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3443 = _3435;
    float _3445 = _3443;
    float _3447 = _3443;
    if (!_3329)
    {
        _3403 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3449 = _3403;
    out.m_94.x = _3427;
    out.m_94.y = _3429;
    out.m_94.z = _3431;
    out.m_94.w = _3425;
    float _3451 = _3433 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3453 = _3449;
    float _3455 = _3449;
    if (!_3329)
    {
        _3437 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3457 = _3437;
    bool _3459 = !_3329;
    float _3461 = _3457;
    float _3463 = _3457;
    if (!_3459)
    {
        bool _3465 = _2856 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3467 = isnan(_2856);
        bool _3469 = _3465 || _3467;
        bool _3471 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3473 = _3469 || _3471;
        if (!_3473)
        {
            float _3475 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3477 = _2856 + _3475;
            float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3481 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3479;
            float _3483 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3485 = _3483 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3487 = 1.0 / _3481;
            float _3489 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3491 = _3489 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3493 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3495 = _3493 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3497 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3499 = _3497 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3501 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3503 = _3501 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3505 = _3477 * _3487;
            float _3507 = precise::clamp(_3505, 0.0, 1.0);
            float _3509 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3511 = _3509 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3513 = fma(_3507, _3485, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3515 = fma(_3507, _3511, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3517 = fma(_3507, _3491, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3519 = fma(_3507, _3495, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3521 = fma(_3507, _3499, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3523 = fma(_3507, _3503, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3407 = _3517;
            _3455 = _3521;
            _3387 = _3513;
            _3447 = _3519;
            _3441 = _3515;
            _3463 = _3523;
            _3525 = true;
        }
        else
        {
            bool _3527 = _2856 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3529 = isnan(_2856);
            bool _3531 = _3527 || _3529;
            bool _3533 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3535 = _3531 || _3533;
            if (!_3535)
            {
                _3385 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3537 = _3385;
            _3387 = _3537;
            if (!_3535)
            {
                _3405 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3539 = _3405;
            _3407 = _3539;
            if (!_3535)
            {
                _3439 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3541 = _3439;
            _3441 = _3541;
            if (!_3535)
            {
                _3445 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3543 = _3445;
            _3447 = _3543;
            if (!_3535)
            {
                _3453 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3545 = _3453;
            _3455 = _3545;
            if (!_3535)
            {
                _3461 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3547 = _3461;
            bool _3549 = !_3535;
            _3463 = _3547;
            if (!_3549)
            {
                bool _3551 = _2856 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3553 = isnan(_2856);
                bool _3555 = _3551 || _3553;
                bool _3557 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3559 = _3555 || _3557;
                if (!_3559)
                {
                    float _3561 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3563 = _2856 + _3561;
                    float _3565 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3567 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3565;
                    float _3569 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3571 = _3569 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3573 = 1.0 / _3567;
                    float _3575 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3577 = _3575 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3579 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3581 = _3579 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3583 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3585 = _3583 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3587 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3589 = _3587 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3591 = _3563 * _3573;
                    float _3593 = precise::clamp(_3591, 0.0, 1.0);
                    float _3595 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3597 = _3595 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3599 = fma(_3593, _3571, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3601 = fma(_3593, _3597, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3603 = fma(_3593, _3577, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3605 = fma(_3593, _3581, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3607 = fma(_3593, _3585, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3609 = fma(_3593, _3589, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3407 = _3603;
                    _3455 = _3607;
                    _3387 = _3599;
                    _3447 = _3605;
                    _3441 = _3601;
                    _3463 = _3609;
                    _3525 = true;
                }
                else
                {
                    _3407 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3455 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3387 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3447 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3441 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3463 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3525 = false;
    float _3611 = _3407;
    float _3613 = _3455;
    float _3615 = _3387;
    float _3617 = _3447;
    float _3619 = _3441;
    float _3621 = _3463;
    float _3623 = fma(_3315, -0.5, 0.5);
    float _3625 = precise::clamp(_3623, 0.0, 1.0);
    float _3627 = -_3611;
    float _3629 = _3627 + _3613;
    float _3631 = _3451 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3633 = -_3615;
    float _3635 = _3633 + _3617;
    float _3637 = fma(_3625, _3629, _3611);
    out.m_96.x = 0.0;
    float _3639 = -_3619;
    float _3641 = _3639 + _3621;
    float _3643 = fma(_3625, _3635, _3615);
    float _3645 = _3637 * 0.586610972881317138671875;
    out.m_49.x = _3631;
    bool _3647 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3649 = fma(_3625, _3641, _3619);
    float _3651 = fma(_3643, 0.298911988735198974609375, _3645);
    bool _3653 = _2768 > 0.0;
    bool _3655 = isnan(_2768);
    bool _3657 = _3653 || _3655;
    bool _3659 = isnan(0.0);
    bool _3661 = _3657 || _3659;
    float _3663 = fma(_3649, 0.114477999508380889892578125, _3651);
    bool _3665 = _2830 <= 0.0;
    bool _3667 = !_3661;
    bool _3669 = _3665 || _3667;
    float _3671 = -_3663;
    float _3673 = _3637 + _3671;
    float _3675 = -_3663;
    float _3677 = _3643 + _3675;
    float _3679 = -_3663;
    float _3681 = _3649 + _3679;
    float _3683 = fma(_3673, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3663);
    float _3685 = fma(_3677, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3663);
    float _3687 = fma(_3681, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3663);
    bool _3689 = !_3647;
    if (!_3689)
    {
        float _3691 = -_2694;
        float _3693 = _3691 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3695 = -_2696;
        float _3697 = _3695 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3699 = -_2698;
        float _3701 = _3699 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3703 = _3693 * _3693;
        float _3705 = fma(_3697, _3697, _3703);
        float _3707 = fma(_3701, _3701, _3705);
        float _3709 = sqrt(_3707);
        float _3711 = rsqrt(_3707);
        float _3713 = -_3709;
        float _3715 = _3713 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3717 = _3715 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3719 = precise::clamp(_3717, 0.0, 1.0);
        float _3721 = _3697 * _3711;
        float _3723 = _3693 * _3711;
        float _3725 = abs(_3719);
        float _3727 = log2(_3725);
        float _3729 = _3701 * _3711;
        float _3731 = _3721 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3733 = _3315 * _3723;
        float _3735 = -_3723;
        float _3737 = -_3731;
        float _3739 = fma(_3735, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3737);
        float _3741 = fma(_3313, _3721, _3733);
        float _3743 = -_3729;
        float _3745 = fma(_3743, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3739);
        float _3747 = fma(_3373, _3729, _3741);
        float _3749 = precise::clamp(_3747, 0.0, 1.0);
        float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3753 = _3745 + _3751;
        float _3755 = _3727 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3757 = _3753 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3759 = precise::clamp(_3757, 0.0, 1.0);
        float _3761 = exp2(_3755);
        float _3763 = _3761 * _3759;
        float _3765 = _3749 * _3763;
        float _3767 = _3765 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3769 = _3765 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3771 = _3765 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3767;
        out.m_96.y = _3769;
        out.m_96.z = _3771;
    }
    out.m_98.x = _3685;
    out.m_98.y = _3683;
    out.m_98.z = _3687;
    if (!_3669)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3773 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3773;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

