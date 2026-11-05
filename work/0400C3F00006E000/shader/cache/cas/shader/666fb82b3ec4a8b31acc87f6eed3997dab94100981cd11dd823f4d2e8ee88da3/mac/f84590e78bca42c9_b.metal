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
    bool _3449 = false;
    bool _393 = false;
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
        float _3753 = as_type<float>(_131);
        out.gl_Position.z = _3753;
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
        float _3826 = as_type<float>(_173);
        out.gl_Position.z = _3826;
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
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391;
    if (!_371)
    {
        float _375 = in.m_60.x;
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _379 = _375 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _383 = _381 * _377;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _389;
        _393 = true;
    }
    else
    {
        _391 = _167;
    }
    _393 = false;
    float _395 = _391;
    bool _397 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _399 = isnan(_395);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _413 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _415 = isnan(_395);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _431 = _395 + _429;
    float _433 = -_407;
    float _435 = _433 + 1.0;
    float _437 = 1.0 / _411;
    bool _439 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _441 = _423 * _435;
    float _443 = -_423;
    float _445 = _443 + 1.0;
    float _447 = _427 * _437;
    float _449 = fma(_447, _431, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _451 = _449 * _441;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _457 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[115].x, _451);
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _461 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _463 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[116].x, _457);
    float _467 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = _465 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _461;
    out.m_64.y = _463;
    out.m_64.z = _467;
    out.m_64.w = _469;
    bool _471 = !_439;
    if (!_471)
    {
        float _473 = in.m_60.x;
        float _475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _477 = _473 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _479 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _481 = _479 * _475;
        float _483 = floor(_481);
        float _485 = -_483;
        float _487 = _481 + _485;
        _169 = _487;
    }
    float _489 = _169;
    float _491 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _493 = int(_491);
    float _495 = in.m_60.x;
    float _497 = in.m_60.y;
    float _499 = _159 * _141;
    float _501 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _505 = _503 != 0;
    float _507 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _509 = int(_507);
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _513 = float(_493);
    float _515 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _517 = int(_515);
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_505)
    {
        _373 = 1.0;
    }
    float _523 = _373;
    float _525 = _523;
    if (!_505)
    {
        _525 = 7.345489978790283203125;
    }
    float _527 = _525;
    float _529 = float(_509);
    float _531 = 1.0 / _513;
    float _533 = _527 * _495;
    float _535 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _537 = int(_535);
    float _539 = float(uint(_517));
    bool _541 = _517 == 0;
    float _543 = 1.0 / _529;
    float _545 = _531 * _141;
    float _547 = 1.0 / _539;
    float _549 = float(uint(_537));
    int _551 = ~_537;
    int _553 = _551 + 1;
    float _555 = trunc(_545);
    int _557 = int(_555);
    float _559 = _543 * _141;
    int _561 = ~_517;
    int _563 = _561 + 1;
    float _565 = 1.0 / _549;
    int _567 = as_type<int>(_547) + (-2);
    float _569 = trunc(_559);
    int _571 = int(_569);
    float _573 = float(uint(_557));
    float _575 = as_type<float>(_567) * _573;
    int _577 = as_type<int>(_565) + (-2);
    float _579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _581 = ~_537;
    int _583 = _581 + 1;
    float _585 = float(uint(_571));
    float _587 = trunc(_575);
    float _589 = precise::max(_587, 0.0);
    uint _592 = uint(_589);
    float _594 = as_type<float>(_577) * _585;
    float _596 = trunc(_594);
    float _598 = precise::max(_596, 0.0);
    uint _600 = uint(_598);
    float _602 = _579 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _604 = _563 * int(_592);
    int _606 = _604 + _557;
    float _608 = floor(_533);
    float _610 = float(uint(_606));
    int _612 = _583 * int(_600);
    int _614 = _612 + _571;
    float _616 = as_type<float>(_567) * _610;
    float _618 = _610;
    if (_505)
    {
        _618 = 1.0;
    }
    float _620 = _618;
    float _622 = float(uint(_614));
    float _624 = trunc(_616);
    float _626 = precise::max(_624, 0.0);
    uint _628 = uint(_626);
    float _630 = _620;
    float _632 = _622;
    if (!_505)
    {
        _630 = 1.2345600128173828125;
    }
    float _634 = _630;
    float _636 = -_608;
    float _638 = _533 + _636;
    float _640 = as_type<float>(_577) * _622;
    if (_505)
    {
        _632 = _495;
    }
    float _642 = _632;
    float _644 = _642;
    if (!_505)
    {
        _644 = _497;
    }
    float _646 = _644;
    float _648 = trunc(_640);
    float _650 = precise::max(_648, 0.0);
    uint _652 = uint(_650);
    float _654 = _634 * _646;
    int _656 = ~_517;
    int _658 = _656 + 1;
    int _660 = int(_592) + int(_628);
    float _662 = floor(_654);
    float _664 = float(_517);
    float _666 = float(_557);
    int _668 = _658 * _660;
    int _670 = _668 + _557;
    int _672 = int(_600) + int(_652);
    float _674 = _638 * _664;
    float _676 = _664 * _499;
    bool _678 = _666 >= _664;
    bool _680 = isnan(_666);
    bool _682 = _678 || _680;
    bool _684 = isnan(_664);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    bool _690 = uint(_670) >= uint(_517);
    int _692 = _553 * _672;
    int _694 = _692 + _571;
    float _696 = -_662;
    float _698 = _654 + _696;
    float _700 = trunc(_688);
    int _702 = int(_700);
    bool _704 = !_690;
    int _706 = _704 ? 0 : (-1);
    bool _708 = uint(_694) >= uint(_537);
    float _710 = in.m_60.z;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _714 = _712 != 0;
    int _716 = ~_660;
    int _718 = _716 + _706;
    int _720 = _718 + 1;
    float _722 = trunc(_674);
    int _724 = int(_722);
    bool _726 = !_714;
    int _728 = _726 ? 0 : 1;
    float _730 = float(_537);
    int _732 = abs(_728);
    int _734 = _517 * _720;
    int _736 = _734 + _557;
    float _738 = float(_571);
    float _740 = _730 * _499;
    int _742 = ~_702;
    int _744 = _742 + 1;
    int _746 = _744 + 1;
    bool _748 = !_708;
    int _750 = _748 ? 0 : (-1);
    bool _752 = !_541;
    int _754 = _752 ? _736 : (-1);
    float _756 = trunc(_740);
    int _758 = int(_756);
    bool _760 = _738 >= _730;
    bool _762 = isnan(_738);
    bool _764 = _760 || _762;
    bool _766 = isnan(_730);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = _698 * _730;
    bool _774 = _497 > 0.5;
    int _776 = _754 * _746;
    int _778 = ~_672;
    int _780 = _778 + _750;
    int _782 = _780 + 1;
    int _784 = _724 * _732;
    int _786 = _784 + _557;
    bool _788 = _710 > 0.5;
    float _790 = trunc(_772);
    int _792 = int(_790);
    float _794 = -_217;
    int _796 = _774 ? as_type<int>(_794) : as_type<int>(_217);
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _800 = _798 != 0;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _804 = _802 != 0;
    float _806 = -_207;
    int _808 = _788 ? as_type<int>(_806) : as_type<int>(_207);
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _812 = _810 != 0;
    float _814 = trunc(_770);
    int _816 = int(_814);
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _820 = _818 != 0;
    bool _822 = !_800;
    float _824 = _822 ? _217 : as_type<float>(_796);
    bool _826 = !_804;
    float _828 = _826 ? _207 : as_type<float>(_808);
    bool _830 = !_812;
    int _832 = _830 ? 0 : 1;
    float _834 = trunc(_676);
    int _836 = int(_834);
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _840 = _838 != 0;
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _844 = _842 != 0;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _848 = _846 != 0;
    float _850 = _824 + 0.5;
    int _852 = abs(_832);
    int _854 = _517 + (-1);
    bool _856 = !_844;
    int _858 = _856 ? 0 : 1;
    bool _860 = !_820;
    int _862 = _860 ? 0 : 1;
    int _864 = _702 * _854;
    int _866 = _864 + _776;
    bool _868 = !_840;
    int _870 = _868 ? 0 : 1;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _874 = _872 != 0;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _878 = _876 != 0;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _882 = _880 != 0;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _886 = _884 != 0;
    int _888 = abs(_858);
    int _890 = _792 * _852;
    int _892 = _890 + _571;
    int _894 = abs(_870);
    int _896 = _537 * _782;
    int _898 = _896 + _571;
    bool _900 = !_848;
    int _902 = _900 ? 0 : 1;
    bool _904 = !_878;
    int _906 = _904 ? 0 : 1;
    bool _908 = _537 == 0;
    int _910 = abs(_902);
    int _912 = _866 * _888;
    int _914 = ~_816;
    int _916 = _914 + 1;
    int _918 = _916 + 1;
    bool _920 = !_908;
    int _922 = _920 ? _898 : (-1);
    int _924 = _836 * _894;
    int _926 = _924 + _912;
    int _928 = _537 + (-1);
    int _930 = _922 * _918;
    int _932 = abs(_862);
    int _934 = _786 * _910;
    int _936 = _934 + _926;
    int _938 = abs(_906);
    int _940 = _816 * _928;
    int _942 = _940 + _930;
    bool _944 = !_874;
    int _946 = _944 ? 0 : 1;
    int _948 = _724 * _932;
    int _950 = _948 + _936;
    bool _952 = !_882;
    int _954 = _952 ? 0 : 1;
    int _956 = abs(_946);
    bool _958 = !_886;
    int _960 = _958 ? 0 : 1;
    int _962 = abs(_954);
    int _964 = _942 * _938;
    float _966 = float(uint(_950));
    int _968 = abs(_960);
    int _970 = _758 * _956;
    int _972 = _970 + _964;
    float _974 = as_type<float>(_567) * _966;
    int _976 = ~_517;
    int _978 = _976 + 1;
    int _980 = _892 * _962;
    int _982 = _980 + _972;
    bool _984 = _517 == 0;
    float _986 = trunc(_974);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    int _992 = _792 * _968;
    int _994 = _992 + _982;
    int _996 = ~_517;
    int _998 = _996 + 1;
    int _1000 = ~_537;
    int _1002 = _1000 + 1;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1006 = float(uint(_994));
    float _1008 = float(uint(_786));
    float _1010 = as_type<float>(_577) * _1006;
    float _1012 = as_type<float>(_567) * _1008;
    int _1014 = _998 * int(_990);
    int _1016 = _1014 + _950;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1022 = trunc(_1010);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    float _1028 = float(uint(_1016));
    float _1030 = as_type<float>(_567) * _1028;
    float _1032 = trunc(_1012);
    float _1034 = precise::max(_1032, 0.0);
    uint _1036 = uint(_1034);
    int _1038 = _1002 * int(_1026);
    int _1040 = _1038 + _994;
    float _1042 = trunc(_1030);
    float _1044 = precise::max(_1042, 0.0);
    uint _1046 = uint(_1044);
    float _1048 = _497 * 2.0;
    float _1050 = float(uint(_1040));
    float _1052 = floor(_1048);
    float _1054 = as_type<float>(_577) * _1050;
    int _1056 = ~_537;
    int _1058 = _1056 + 1;
    int _1060 = int(_990) + int(_1046);
    float _1062 = trunc(_1054);
    float _1064 = precise::max(_1062, 0.0);
    uint _1066 = uint(_1064);
    int _1068 = _978 * _1060;
    int _1070 = _1068 + _950;
    float _1072 = 1.0 / _1020;
    bool _1074 = uint(_1070) >= uint(_517);
    bool _1076 = !_1074;
    int _1078 = _1076 ? 0 : (-1);
    int _1080 = ~_1060;
    int _1082 = _1080 + _1078;
    int _1084 = _1082 + 1;
    float _1086 = _710 * 2.0;
    int _1088 = int(_1026) + int(_1066);
    float _1090 = float(uint(_892));
    int _1092 = _517 * _1084;
    int _1094 = _1092 + _950;
    float _1096 = _497 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1098 = _1058 * _1088;
    int _1100 = _1098 + _994;
    float _1102 = floor(_1086);
    float _1104 = as_type<float>(_577) * _1090;
    bool _1106 = !_984;
    int _1108 = _1106 ? _1094 : (-1);
    float _1110 = fma(_1096, -2.0, _1004);
    bool _1112 = uint(_1100) >= uint(_537);
    int _1114 = _1108 & 3;
    bool _1116 = _1114 != 0;
    int _1118 = _1108 & 3;
    bool _1120 = _1118 != 0;
    float _1122 = trunc(_1104);
    float _1124 = precise::max(_1122, 0.0);
    uint _1126 = uint(_1124);
    bool _1128 = !_1112;
    int _1130 = _1128 ? 0 : (-1);
    int _1132 = _1116 ? 0 : 1;
    bool _1134 = uint(_1118) >= 2u;
    bool _1136 = uint(_1118) > 1u;
    int _1138 = ~_1088;
    int _1140 = _1138 + _1130;
    int _1142 = _1140 + 1;
    int _1144 = _1134 ? 0 : 1;
    bool _1146 = _1118 != 3;
    int _1148 = _537 * _1142;
    int _1150 = _1148 + _994;
    int _1152 = ~_1132;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1160 = _1158 != 0;
    bool _1162 = !_908;
    int _1164 = _1162 ? _1150 : (-1);
    int _1166 = _1156;
    float _1168 = as_type<float>(_786);
    if (!_1136)
    {
        int _1170 = ~_1132;
        int _1172 = _1170 + 1;
        _1166 = _1172;
    }
    int _1174 = _1166;
    int _1176 = _1164 & 3;
    bool _1178 = _1176 != 0;
    int _1180 = ~_1144;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    int _1186 = _1184;
    if (_1146)
    {
        int _1188 = ~_1144;
        int _1190 = _1188 + 1;
        _1186 = _1190;
    }
    int _1192 = _1186;
    bool _1194 = uint(_1176) > 1u;
    float _1196 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1198 = log2(_1196);
    int _1200 = _1164 & 3;
    bool _1202 = _1200 != 0;
    if (_1160)
    {
        _521 = 0;
    }
    int _1204 = _521;
    int _1206 = _1202 ? 0 : 1;
    int _1208 = _1204;
    if (!_1160)
    {
        _1208 = 2;
    }
    int _1210 = _1208;
    int _1212 = ~_1206;
    int _1214 = _1212 + 1;
    int _1216 = _1214 + 1;
    bool _1218 = _497 > 0.5;
    int _1220 = _1216;
    if (!_1194)
    {
        int _1222 = ~_1206;
        int _1224 = _1222 + 1;
        _1220 = _1224;
    }
    int _1226 = _1220;
    float _1228 = _495 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1230 = _1198 * _141;
    bool _1232 = _1176 != 3;
    bool _1234 = _1210 != 2;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1238 = -_207;
    float _1240 = _1218 ? _1238 : _207;
    float _1242 = exp2(_1230);
    bool _1244 = uint(_1176) >= 2u;
    float _1246 = -_1236;
    float _1248 = fma(_1228, 2.0, _1246);
    float _1250 = _495 * 2.0;
    float _1252 = _1244 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1254 = floor(_1250);
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1258 = _1256 != 0;
    int _1260 = ~as_type<int>(_1252);
    int _1262 = _1260 + 1;
    int _1264 = _1262 + 1;
    int _1266 = _1264;
    float _1268 = _1252;
    float _1270 = _1240;
    if (_1232)
    {
        int _1272 = ~as_type<int>(_1252);
        int _1274 = _1272 + 1;
        _1266 = _1274;
    }
    int _1276 = _1266;
    if (_1234)
    {
        _1268 = _495;
    }
    float _1278 = _1268;
    float _1280 = _1278;
    if (!_1234)
    {
        _1280 = _710;
    }
    float _1282 = _1280;
    bool _1284 = !_1258;
    int _1286 = _1284 ? 0 : 1;
    int _1288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1290 = _1288 != 0;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1294 = _495 > 0.5;
    float _1296 = -_1242;
    float _1298 = _1296 + 1.0;
    bool _1300 = !_1290;
    float _1302 = _1300 ? _207 : _1240;
    float _1304 = -_511;
    float _1306 = fma(_1292, 2.0, _1304);
    int _1308 = ~_517;
    int _1310 = _1308 + 1;
    float _1312 = -_217;
    int _1314 = _1294 ? as_type<int>(_1312) : as_type<int>(_217);
    float _1316 = -_141;
    float _1318 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1306);
    bool _1320 = _1254 > 0.0;
    int _1322 = _1310 * int(_1036);
    int _1324 = _1322 + _786;
    bool _1326 = _1254 >= 0.0;
    bool _1328 = isnan(_1254);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(0.0);
    bool _1334 = _1330 || _1332;
    float _1336 = fma(_602, _850, _1318);
    int _1338 = ~_537;
    int _1340 = _1338 + 1;
    if (_1234)
    {
        _1270 = _497;
    }
    float _1342 = _1270;
    float _1344 = _1342;
    if (!_1234)
    {
        _1344 = _495;
    }
    float _1346 = _1344;
    int _1348 = _1340 * int(_1126);
    int _1350 = _1348 + _892;
    float _1352 = float(uint(_1324));
    bool _1354 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1356 = isnan(0.0);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1362 = _1358 || _1360;
    float _1364 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1366 = float(uint(_1350));
    float _1368 = as_type<float>(_567) * _1352;
    float _1370 = _1362 ? _1298 : 0.0;
    float _1372 = fma(_1364, -2.0, _519);
    bool _1374 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1376 = isnan(1.0);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1382 = _1378 || _1380;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1386 = 1.0 + _1384;
    float _1388 = as_type<float>(_577) * _1366;
    float _1390 = trunc(_1368);
    float _1392 = precise::max(_1390, 0.0);
    uint _1394 = uint(_1392);
    float _1396 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1372);
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1400 = 1.0 / _1386;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1406 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1398);
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1410 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1402);
    float _1412 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1404);
    float _1414 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1406);
    float _1416 = trunc(_1388);
    float _1418 = precise::max(_1416, 0.0);
    uint _1420 = uint(_1418);
    float _1422 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1408);
    float _1424 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1110);
    float _1426 = -_141;
    float _1428 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1248);
    float _1430 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1410);
    float _1432 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1412);
    float _1434 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1422);
    int _1436 = int(_1036) + int(_1394);
    if (_1382)
    {
        float _1438 = _1370 * _1400;
        _163 = _1438;
    }
    float _1440 = _163;
    int _1442 = ~_517;
    int _1444 = _1442 + 1;
    float _1446 = in.m_46.x;
    float _1448 = in.m_46.y;
    float _1450 = in.m_46.z;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1454 = _1452 != 0;
    float _1456 = _1302 + (-0.5);
    int _1458 = ~_537;
    int _1460 = _1458 + 1;
    int _1462 = _1444 * _1436;
    int _1464 = _1462 + _786;
    int _1466 = _1334 ? 0 : 1;
    float _1468 = -_1414;
    float _1470 = _1468 + 1.0;
    bool _1472 = !_1454;
    float _1474 = _1472 ? _217 : as_type<float>(_1314);
    float _1476 = -_1456;
    float _1478 = -_1424;
    float _1480 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1478);
    bool _1482 = _1052 > 0.0;
    float _1484 = -_1430;
    float _1486 = _1484 + 1.0;
    bool _1488 = _1052 >= 0.0;
    bool _1490 = isnan(_1052);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan(0.0);
    bool _1496 = _1492 || _1494;
    float _1498 = -_1432;
    float _1500 = _1498 + 1.0;
    int _1502 = int(_1126) + int(_1420);
    int _1504 = ~_1466;
    int _1506 = _1504 + 1;
    int _1508 = _1506 + 1;
    int _1510 = _1508;
    if (!_1320)
    {
        int _1512 = ~_1466;
        int _1514 = _1512 + 1;
        _1510 = _1514;
    }
    int _1516 = _1510;
    bool _1518 = uint(_1464) >= uint(_517);
    int _1520 = _1460 * _1502;
    int _1522 = _1520 + _892;
    float _1524 = _1448 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1526 = _1496 ? 0 : 1;
    float _1528 = _1448 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1530 = !_1518;
    int _1532 = _1530 ? 0 : (-1);
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1534;
    bool _1538 = uint(_1522) >= uint(_537);
    float _1540 = fma(_1446, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1524);
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1544 = _1542 != 0;
    float _1546 = _1536 * _1072;
    bool _1548 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1550 = isnan(_489);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1556 = _1552 || _1554;
    float _1558 = float(_1556);
    float _1560 = fma(_1446, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1528);
    int _1562 = ~_1526;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    int _1568 = _1566;
    if (!_1482)
    {
        int _1570 = ~_1526;
        int _1572 = _1570 + 1;
        _1568 = _1572;
    }
    int _1574 = _1568;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1578 = _489 + _1576;
    bool _1580 = !_1538;
    int _1582 = _1580 ? 0 : (-1);
    float _1584 = -_1558;
    float _1586 = _1584 + 1.0;
    int _1588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1590 = _1588 != 0;
    int _1592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1594 = _1592 != 0;
    int _1596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1598 = _1596 != 0;
    float _1600 = _1448 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1602 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1604 = isnan(_489);
    bool _1606 = _1602 || _1604;
    bool _1608 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1610 = _1606 || _1608;
    float _1612 = float(_1610);
    bool _1614 = !_1120;
    int _1616 = _1614 ? 0 : 1;
    float _1618 = fma(_1446, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1600);
    float _1620 = fma(_1546, _1578, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1622 = _1612 * _1586;
    float _1624 = _1474 + 0.5;
    float _1626 = fma(_1450, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1618);
    bool _1628 = _1102 >= 0.0;
    bool _1630 = isnan(_1102);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan(0.0);
    bool _1636 = _1632 || _1634;
    float _1638 = _1620 * _1622;
    float _1640 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1428);
    float _1642 = -_1612;
    float _1644 = _1642 + 1.0;
    int _1646 = _1636 ? 0 : 1;
    bool _1648 = _1102 > 0.0;
    float _1650 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1638);
    float _1652 = -_1470;
    float _1654 = fma(_1474, _1652, _1640);
    float _1656 = fma(_1302, _1486, _1480);
    float _1658 = fma(_1450, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1540);
    float _1660 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1650);
    float _1662 = _1626 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1664 = _1108 >> 31;
    float _1666 = _497 + _495;
    int _1668 = _1164 >> 31;
    float _1670 = fma(_1450, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1560);
    float _1672 = _1658 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1676 = _1662 + _1674;
    int _1678 = _1664 & 3;
    float _1680 = _1666 + (-1.0);
    float _1682 = _1670 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1684 = _1668 & 3;
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1688 = _1672 + _1686;
    float _1690 = _1676 * _1676;
    int _1692 = _1108 + _1678;
    out.m_66.x = _1654;
    out.m_66.y = _1656;
    float _1694 = fma(_1680, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1698 = _1682 + _1696;
    float _1700 = fma(_1688, _1688, _1690);
    int _1702 = _1692 >> 2;
    float _1704 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1706 = !_1178;
    int _1708 = _1706 ? 0 : 1;
    float _1710 = fma(_1698, _1698, _1700);
    int _1712 = _1702 << 4;
    int _1714 = _1712 + 368;
    float _1716 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1704);
    int _1718 = _1164 + _1684;
    float _1720 = _501 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1722 = _1118 != 3;
    float _1724 = rsqrt(_1710);
    int _1726 = _1718 >> 2;
    float _1728 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1716);
    int _1730 = ~_1646;
    int _1732 = _1730 + 1;
    int _1734 = _1732 + 1;
    float _1736 = _1660 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1738 = _1726 << 4;
    int _1740 = _1738 + 512;
    uint _1742 = uint(int(uint(_1714) >> uint(2)));
    uint _1744 = uint(int(uint(int(_1742)) >> uint(2)));
    int _1746 = int(_1742) & 3;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[int(_1744)][_1746];
    int _1750 = int(_1742) + 1;
    uint _1752 = uint(int(uint(_1750) >> uint(2)));
    int _1754 = _1750 & 3;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[int(_1752)][_1754];
    int _1758 = _1734;
    float _1760 = _1682;
    if (!_1648)
    {
        int _1762 = ~_1646;
        int _1764 = _1762 + 1;
        _1758 = _1764;
    }
    int _1766 = _1758;
    float _1768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1770 = !_1722;
    int _1772 = _1770 ? 0 : (-1);
    out.m_68.w = _1736;
    bool _1774 = _1176 != 3;
    int _1776 = abs(_1192);
    uint _1778 = uint(int(uint(_1740) >> uint(2)));
    uint _1780 = uint(int(uint(int(_1778)) >> uint(2)));
    int _1782 = int(_1778) & 3;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[int(_1780)][_1782];
    int _1786 = int(_1778) + 1;
    uint _1788 = uint(int(uint(_1786) >> uint(2)));
    int _1790 = _1786 & 3;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[int(_1788)][_1790];
    bool _1794 = !_1774;
    int _1796 = _1794 ? 0 : (-1);
    bool _1798 = _1728 >= 0.0;
    float _1800 = _1720 * _1724;
    int _1802 = abs(_1276);
    int _1804 = abs(_1286);
    int _1806 = _1714 + 8;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    uint _1810 = uint(int(uint(int(_1808)) >> uint(2)));
    int _1812 = int(_1808) & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    int _1816 = int(_1808) + 1;
    uint _1818 = uint(int(uint(_1816) >> uint(2)));
    int _1820 = _1816 & 3;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[int(_1818)][_1820];
    float _1824 = _1676 * _1800;
    float _1826 = _1688 * _1800;
    float _1828 = _1698 * _1800;
    float _1830 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1832 = -_1824;
    float _1834 = _1676 + _1832;
    float _1836 = -_1826;
    float _1838 = _1688 + _1836;
    float _1840 = -_1828;
    float _1842 = _1698 + _1840;
    int _1844 = _1740 + 8;
    uint _1846 = uint(int(uint(_1844) >> uint(2)));
    uint _1848 = uint(int(uint(int(_1846)) >> uint(2)));
    int _1850 = int(_1846) & 3;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[int(_1848)][_1850];
    int _1854 = int(_1846) + 1;
    uint _1856 = uint(int(uint(_1854) >> uint(2)));
    int _1858 = _1854 & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    float _1862 = _1834 * _1834;
    float _1864 = _828 + (-0.5);
    bool _1866 = !_1590;
    int _1868 = _1866 ? 0 : 1;
    float _1870 = _1826;
    if (_1798)
    {
        out.m_49.x = 0.0;
    }
    float _1872 = fma(_1838, _1838, _1862);
    float _1874 = -_1830;
    float _1876 = -_1396;
    float _1878 = fma(_1874, _1864, _1876);
    int _1880 = abs(_1226);
    float _1882 = -_1500;
    float _1884 = fma(_824, _1882, _1336);
    float _1886 = fma(_1842, _1842, _1872);
    int _1888 = abs(_1174);
    float _1890 = _495 + (-0.5);
    int _1892 = abs(_1616);
    int _1894 = ~_1888;
    int _1896 = _1894 + 1;
    int _1898 = _1896 + 1;
    int _1900 = ~_1880;
    int _1902 = _1900 + 1;
    int _1904 = _1902 + 1;
    int _1906 = ~_1892;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    int _1912 = abs(_1708);
    int _1914 = ~_1436;
    int _1916 = _1914 + _1532;
    int _1918 = _1916 + 1;
    int _1920 = _1898 * as_type<int>(_1756);
    int _1922 = ~_1776;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    int _1928 = ~_1502;
    int _1930 = _1928 + _1582;
    int _1932 = _1930 + 1;
    int _1934 = _1910 * as_type<int>(_1748);
    int _1936 = _1934 + _1920;
    int _1938 = abs(_1772);
    int _1940 = _517 * _1918;
    int _1942 = _1940 + _786;
    int _1944 = abs(_1868);
    int _1946 = _1904 * as_type<int>(_1792);
    int _1948 = ~_1912;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    int _1954 = _537 * _1932;
    int _1956 = _1954 + _892;
    bool _1958 = _517 == 0;
    float _1960 = float(_1766);
    int _1962 = _1952 * as_type<int>(_1784);
    int _1964 = _1962 + _1946;
    int _1966 = _1926 * as_type<int>(_1814);
    int _1968 = _1966 + _1936;
    bool _1970 = !_1544;
    int _1972 = _1970 ? 0 : 1;
    int _1974 = abs(_1796);
    int _1976 = abs(_1972);
    int _1978 = ~_1938;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    int _1984 = ~_1802;
    int _1986 = _1984 + 1;
    int _1988 = _1986 + 1;
    int _1990 = ~_1974;
    int _1992 = _1990 + 1;
    int _1994 = _1992 + 1;
    int _1996 = _1982 * as_type<int>(_1822);
    int _1998 = _1996 + _1968;
    float _2000 = float(_1944);
    int _2002 = _1988 * as_type<int>(_1852);
    int _2004 = _2002 + _1964;
    float _2006 = in.m_70.x;
    float _2008 = in.m_70.y;
    float _2010 = in.m_70.z;
    int _2012 = _1994 * as_type<int>(_1860);
    int _2014 = _2012 + _2004;
    float _2016 = sqrt(_1886);
    int _2018 = ~_1804;
    int _2020 = _2018 + 1;
    int _2022 = _2020 + 1;
    float _2024 = -_1434;
    float _2026 = _2024 + 1.0;
    int _2028 = ~_1976;
    int _2030 = _2028 + 1;
    int _2032 = _2030 + 1;
    float _2034 = _2000 * _1960;
    bool _2036 = !_1958;
    int _2038 = _2036 ? _1942 : (-1);
    int _2040 = _1998 * _2022;
    bool _2042 = !_908;
    int _2044 = _2042 ? _1956 : (-1);
    int _2046 = _2014 * _2032;
    float _2048 = fma(_828, _2026, _1878);
    int _2050 = _2038 * _1804;
    int _2052 = _2050 + _2040;
    if (_1798)
    {
        _1168 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2054 = _1168;
    float _2056 = _2034 * (-2.0);
    int _2058 = _2044 * _1976;
    int _2060 = _2058 + _2046;
    bool _2062 = !_1594;
    int _2064 = _2062 ? 0 : 1;
    out.m_72.x = _1884;
    out.m_72.y = _2048;
    float _2066 = _1724 * _2016;
    int _2068 = as_type<int>(_2054);
    if (_1798)
    {
        float _2070 = _2054 * 5.0;
        _2068 = as_type<int>(_2070);
    }
    int _2072 = _2068;
    float _2074 = float(_2052);
    float _2076 = fma(_2056, _2006, _2006);
    float _2078 = float(_2060);
    float _2080 = _501 * _2066;
    if (_1798)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6604 = as_type<float>(_2072);
        out.gl_Position.z = _6604;
    }
    float _2082 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2076);
    float _2084 = _497 + _710;
    float _2086 = float(_1516);
    out.m_74.x = _2074;
    out.m_74.y = _2078;
    float _2088 = fma(_1694, _2056, _1694);
    float _2090 = _2084 + (-1.0);
    out.m_76.x = _2080;
    bool _2092 = !_1598;
    int _2094 = _2092 ? 0 : 1;
    int _2096 = abs(_2064);
    if (_1798)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2098 = -_1824;
    float _2100 = _1662 + _2098;
    int _2102 = abs(_2094);
    float _2104 = -_1826;
    float _2106 = _1672 + _2104;
    float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2110 = _2100 + _2108;
    float _2112 = -_1828;
    float _2114 = _1682 + _2112;
    float _2116 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2118 = _2106 + _2116;
    float _2120 = float(_2096);
    float _2122 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2126 = _2114 + _2124;
    float _2128 = float(_1574);
    float _2130 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2132 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2122);
    float _2134 = _2120 * _2086;
    float _2136 = float(_2102);
    float _2138 = _497 + (-0.5);
    float _2140 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2132);
    float _2142 = _2134 * (-2.0);
    float _2144 = _710 + _495;
    float _2146 = _2136 * _2128;
    float _2148 = fma(_2088, _1440, _2082);
    bool _2150 = _2140 >= 0.0;
    float _2152 = fma(_2142, _2008, _2008);
    float _2154 = fma(_2130, _2142, _2130);
    float _2156 = _2144 + (-1.0);
    float _2158 = fma(_2138, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2152);
    float _2160 = _2146 * (-2.0);
    float _2162 = _2148 * 0.15915493667125701904296875;
    float _2164 = fma(_2156, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2166 = fma(_2154, _1440, _2158);
    float _2168 = fma(_2160, _2010, _2010);
    float _2170 = _710 + (-0.5);
    float _2172 = _2162 * 6.283185482025146484375;
    float _2174 = sin(_2172);
    float _2176 = _2166 * 0.15915493667125701904296875;
    float _2178 = _2130;
    float _2180 = _2118;
    float _2182 = _2126;
    if (_2150)
    {
        _2178 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2184 = _2178;
    float _2186 = fma(_2164, _2160, _2164);
    float _2188 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2168);
    int _2190 = as_type<int>(_2184);
    if (_2150)
    {
        out.m_49.x = 0.0;
    }
    if (_2150)
    {
        float _2192 = _2184 * 5.0;
        _2190 = as_type<int>(_2192);
    }
    int _2194 = _2190;
    float _2196 = _2162 * 6.283185482025146484375;
    float _2198 = cos(_2196);
    float _2200 = fma(_2186, _1440, _2188);
    if (_2150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6807 = as_type<float>(_2194);
        out.gl_Position.z = _6807;
    }
    float _2202 = _2200 * 0.15915493667125701904296875;
    float _2204 = _2176 * 6.283185482025146484375;
    float _2206 = sin(_2204);
    float _2208 = _2176 * 6.283185482025146484375;
    float _2210 = cos(_2208);
    if (_2150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2212 = _2202 * 6.283185482025146484375;
    float _2214 = cos(_2212);
    float _2216 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2218 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2220 = _2174 * _2206;
    float _2222 = _2198 * _2210;
    float _2224 = _2216 * _2066;
    float _2226 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2228 = _2174 * _2210;
    float _2230 = _2202 * 6.283185482025146484375;
    float _2232 = sin(_2230);
    float _2234 = _2224 * _2218;
    float _2236 = _2198 * _2206;
    float _2238 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2240 = _2238 * 0.5;
    float _2242 = _2198 * _2214;
    float _2244 = _2210 * _2214;
    float _2246 = _2174 * _2214;
    float _2248 = _2206 * _2214;
    float _2250 = _2080 * _2226;
    float _2252 = _2242 * _2234;
    float _2254 = fma(_2232, _2222, _2220);
    float _2256 = -_2228;
    float _2258 = fma(_2232, _2236, _2256);
    float _2260 = -_2234;
    float _2262 = _2232 * _2260;
    float _2264 = -_2236;
    float _2266 = fma(_2232, _2228, _2264);
    float _2268 = fma(_2254, _2250, _2252);
    float _2270 = _2246 * _2234;
    float _2272 = fma(_2244, _2250, _2262);
    float _2274 = fma(_2258, _2240, _2268);
    float _2276 = fma(_2232, _2220, _2222);
    float _2278 = fma(_2266, _2250, _2270);
    float _2280 = fma(_2248, _2240, _2272);
    float _2282 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2284 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2286 = fma(_2276, _2240, _2278);
    float _2288 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2282);
    float _2290 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2284);
    float _2292 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2288);
    float _2294 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2290);
    float _2296 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2298 = _2294 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2300 = _1682 + _2296;
    float _2302 = _1672 + _2298;
    float _2304 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2306 = _2100 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2310 = _2300 + _2308;
    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2314 = _2302 + _2312;
    float _2316 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2304);
    float _2318 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2306);
    float _2320 = _2310 * _2310;
    float _2322 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2316);
    float _2324 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2318);
    float _2326 = fma(_2314, _2314, _2320);
    float _2328 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2330 = sqrt(_2326);
    float _2332 = _1662 + _2328;
    bool _2334 = _2330 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2336 = _2322;
    float _2338 = _2328;
    float _2340 = _2306;
    float _2342 = _2250;
    if (!_2334)
    {
        _2336 = _2302;
    }
    float _2344 = _2336;
    float _2346 = _2344;
    if (!_2334)
    {
        _2338 = _2300;
    }
    float _2348 = _2338;
    float _2350 = _2348;
    if (!_2334)
    {
        _2340 = _2332;
    }
    float _2352 = _2340;
    bool _2354 = !_2334;
    float _2356 = _2352;
    if (!_2354)
    {
        float _2358 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2362 = _2330 + _2360;
        float _2364 = rsqrt(_2326);
        float _2366 = _2362 * _2358;
        float _2368 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2370 = _2366 * 0.15915493667125701904296875;
        float _2372 = _2370 * 6.283185482025146484375;
        float _2374 = cos(_2372);
        float _2376 = _2370 * 6.283185482025146484375;
        float _2378 = sin(_2376);
        float _2380 = _2374 + (-1.0);
        float _2382 = fma(_2378, _2368, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2384 = _2380 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2386 = _2364 * _2382;
        float _2388 = fma(_2332, _2374, _2384);
        float _2390 = fma(_2314, _2386, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2392 = fma(_2310, _2386, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2356 = _2388;
        _2346 = _2390;
        _2350 = _2392;
        _2342 = _2370;
    }
    float _2394 = _2356;
    float _2396 = _2346;
    float _2398 = _2350;
    float _2400 = _2342;
    float _2402 = -_1662;
    float _2404 = _2402 + _2394;
    float _2406 = -_1672;
    float _2408 = _2406 + _2396;
    float _2410 = -_1682;
    float _2412 = _2410 + _2398;
    float _2414 = _2324 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2416 = _2404 * _2404;
    float _2418 = _2100 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2420 = 1.0 / _2414;
    float _2422 = fma(_2408, _2408, _2416);
    float _2424 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2418);
    bool _2426 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2428 = isnan(0.5);
    bool _2430 = _2426 || _2428;
    bool _2432 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2434 = _2430 || _2432;
    float _2436 = fma(_2412, _2412, _2422);
    float _2438 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2424);
    bool _2440 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2442 = isnan(0.5);
    bool _2444 = _2440 || _2442;
    bool _2446 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2448 = _2444 || _2446;
    float _2450 = sqrt(_2436);
    float _2452 = _2438 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2454 = _2452 + _2414;
    float _2456 = _2454 * _2420;
    float _2458 = _2456 * 0.5;
    bool _2460 = _2450 > 0.0;
    float _2462 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2464 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2462);
    float _2466 = 1.0 / _2464;
    float _2468 = _2458;
    float _2470 = _2420;
    float _2472 = _2400;
    if (!_2460)
    {
        _2468 = _2396;
    }
    float _2474 = _2468;
    float _2476 = _2474;
    if (!_2460)
    {
        _2470 = _2394;
    }
    float _2478 = _2470;
    float _2480 = _2478;
    if (!_2460)
    {
        _2472 = _2398;
    }
    float _2482 = _2472;
    bool _2484 = !_2460;
    float _2486 = _2482;
    float _2488 = _2482;
    if (!_2484)
    {
        float _2490 = _211 * _211;
        float _2492 = fma(_209, _209, _2490);
        float _2494 = rsqrt(_2436);
        float _2496 = fma(_213, _213, _2492);
        float _2498 = sqrt(_2496);
        float _2500 = _2408 * _2494;
        float _2502 = _2404 * _2494;
        float _2504 = _2412 * _2494;
        bool _2506 = _2498 > 0.0;
        float _2508 = _2494;
        float _2510 = _2498;
        if (!_2506)
        {
            _2508 = _2396;
        }
        float _2512 = _2508;
        _2476 = _2512;
        if (!_2506)
        {
            _2510 = _2394;
        }
        float _2514 = _2510;
        _2480 = _2514;
        if (!_2506)
        {
            _2486 = _2398;
        }
        float _2516 = _2486;
        bool _2518 = !_2506;
        _2488 = _2516;
        if (!_2518)
        {
            float _2520 = rsqrt(_2496);
            float _2522 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2524 = _211 * _2520;
            float _2526 = _209 * _2520;
            float _2528 = _2502 * _2524;
            float _2530 = _213 * _2520;
            float _2532 = fma(_2500, _2526, _2528);
            float _2534 = _2522 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2536 = fma(_2504, _2530, _2532);
            float _2538 = _2536 * _2534;
            float _2540 = fma(_209, _2538, _2396);
            float _2542 = fma(_211, _2538, _2394);
            float _2544 = fma(_213, _2538, _2398);
            _2476 = _2540;
            _2480 = _2542;
            _2488 = _2544;
        }
    }
    float _2546 = _2476;
    float _2548 = _2480;
    float _2550 = _2488;
    float _2552 = -_1826;
    float _2554 = _2552 + _2546;
    float _2556 = -_1824;
    float _2558 = _2556 + _2548;
    float _2560 = -_1828;
    float _2562 = _2560 + _2550;
    float _2564 = _2558;
    float _2566 = _2554;
    float _2568 = _2562;
    if (_2448)
    {
        _221 = 1.0;
    }
    float _2570 = _221;
    float _2572 = _2570;
    if (!_2434)
    {
        float _2574 = _2110 * _2110;
        float _2576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2578 = -_1682;
        float _2580 = _2578 + _2550;
        float _2582 = -_1662;
        float _2584 = _2582 + _2548;
        float _2586 = fma(_2118, _2118, _2574);
        float _2588 = fma(_2126, _2126, _2586);
        float _2590 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2592 = sqrt(_2588);
        float _2594 = 1.0 / _2066;
        float _2596 = precise::min(_2592, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2598 = _2596 * _2576;
        float _2600 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2602 = -_1672;
        float _2604 = _2602 + _2546;
        float _2606 = _2598 * _2594;
        float _2608 = _2600 * _2606;
        float _2610 = _2580 * _2606;
        float _2612 = fma(_2584, _2608, _2100);
        float _2614 = fma(_2604, _2608, _2106);
        float _2616 = fma(_2600, _2610, _2114);
        _2564 = _2612;
        _2566 = _2614;
        _2568 = _2616;
        _2180 = _2592;
        _1760 = _2610;
    }
    float _2618 = _2564;
    float _2620 = _2566;
    float _2622 = _2568;
    float _2624 = _2180;
    float _2626 = _1760;
    float _2628 = _2624;
    float _2630 = _2626;
    if (_2448)
    {
        _1870 = 1.0;
    }
    float _2632 = _1870;
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2636 = _2466 * _2634;
    float _2638 = _2632;
    if (!_2448)
    {
        float _2640 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2642 = _2640 * 0.15915493667125701904296875;
        float _2644 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2646 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2648 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2646;
        float _2650 = _2642 * 6.283185482025146484375;
        float _2652 = cos(_2650);
        float _2654 = _2644 * 0.15915493667125701904296875;
        float _2656 = _2642 * 6.283185482025146484375;
        float _2658 = sin(_2656);
        float _2660 = 1.0 / _2652;
        float _2662 = _2654 * 6.283185482025146484375;
        float _2664 = cos(_2662);
        float _2666 = _2658 * _2660;
        float _2668 = _2654 * 6.283185482025146484375;
        float _2670 = sin(_2668);
        float _2672 = _2664 * _2666;
        float _2674 = 1.0 / _2648;
        float _2676 = 1.0 / _2672;
        float _2678 = _2670 * _2676;
        float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2682 = fma(_2636, _2678, _2680);
        float _2684 = _2682 * _2674;
        float _2686 = precise::clamp(_2684, 0.0, 1.0);
        _2182 = _2654;
        _2628 = _2666;
        _2572 = _2686;
    }
    float _2688 = _2182;
    float _2690 = _2628;
    float _2692 = _2572;
    float _2694 = _2688;
    float _2696 = _2690;
    if (!_2448)
    {
        float _2698 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2700 = _2698 * 0.15915493667125701904296875;
        float _2702 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2704 = _2700 * 6.283185482025146484375;
        float _2706 = cos(_2704);
        float _2708 = _2702 * 0.15915493667125701904296875;
        float _2710 = _2700 * 6.283185482025146484375;
        float _2712 = sin(_2710);
        float _2714 = 1.0 / _2706;
        float _2716 = _2708 * 6.283185482025146484375;
        float _2718 = cos(_2716);
        float _2720 = _2712 * _2714;
        float _2722 = _2708 * 6.283185482025146484375;
        float _2724 = sin(_2722);
        float _2726 = _2718 * _2720;
        float _2728 = 1.0 / _2726;
        float _2730 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2732 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2730;
        float _2734 = 1.0 / _2732;
        float _2736 = _2724 * _2728;
        float _2738 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2740 = fma(_2636, _2736, _2738);
        float _2742 = _2740 * _2734;
        float _2744 = precise::clamp(_2742, 0.0, 1.0);
        float _2746 = -_2744;
        float _2748 = _2746 + 1.0;
        _2694 = _2714;
        _2696 = _2726;
        _2638 = _2748;
    }
    float _2750 = _2694;
    float _2752 = _2696;
    float _2754 = _2638;
    float _2756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2758 = _2618 + _2756;
    float _2760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2762 = _2620 + _2760;
    float _2764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2766 = _2622 + _2764;
    float _2768 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2770 = _2758 * _2758;
    float _2772 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2768);
    float _2774 = fma(_2762, _2762, _2770);
    float _2776 = fma(_2766, _2766, _2774);
    float _2778 = rsqrt(_2776);
    float _2780 = sqrt(_2776);
    float _2782 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2784 = _2762 * _2782;
    float _2786 = _2766 * _2782;
    float _2788 = _2784 * _2784;
    float _2790 = _2786 * _2786;
    float _2792 = _2788 + _2790;
    float _2794 = sqrt(_2792);
    bool _2796 = _2794 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2800 = _2794 + _2798;
    float _2802 = _2750;
    float _2804 = _2792;
    float _2806 = _2800;
    float _2808 = _2752;
    float _2810 = _2758;
    if (_2796)
    {
        float _2812 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2802 = _2812;
    }
    float _2814 = _2802;
    if (_2796)
    {
        float _2816 = rsqrt(_2792);
        _2804 = _2816;
    }
    float _2818 = _2804;
    float _2820 = _2818;
    if (_2796)
    {
        float _2822 = _2800 * _2814;
        _2806 = _2822;
    }
    float _2824 = _2806;
    if (_2796)
    {
        float _2826 = _2824 * 0.15915493667125701904296875;
        _2808 = _2826;
    }
    float _2828 = _2808;
    float _2830 = _2766;
    float _2832 = _2828;
    if (_2796)
    {
        float _2834 = _2828 * 6.283185482025146484375;
        float _2836 = sin(_2834);
        _2830 = _2836;
    }
    float _2838 = _2830;
    float _2840 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2842 = precise::max(0.0, _2840);
    float _2844 = _2814;
    if (_2796)
    {
        float _2846 = _2828 * 6.283185482025146484375;
        float _2848 = cos(_2846);
        _2844 = _2848;
    }
    float _2850 = _2844;
    float _2852 = -_2782;
    float _2854 = -_2842;
    float _2856 = fma(_2758, _2852, _2854);
    float _2858 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2796)
    {
        float _2860 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2810 = _2860;
    }
    float _2862 = _2810;
    float _2864 = _2862;
    if (!_2796)
    {
        _2832 = _2784;
    }
    float _2866 = _2832;
    float _2868 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2870 = _2838;
    float _2872 = _2866;
    if (_2796)
    {
        float _2874 = fma(_2838, _2862, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2870 = _2874;
    }
    float _2876 = _2870;
    float _2878 = _2876;
    if (!_2796)
    {
        _2864 = _2856;
    }
    float _2880 = _2864;
    float _2882 = _2880;
    float _2884 = _2850;
    if (_2796)
    {
        float _2886 = _2850 + (-1.0);
        _2858 = _2886;
    }
    float _2888 = _2858;
    float _2890 = _2888;
    if (_2796)
    {
        float _2892 = _2818 * _2876;
        _2630 = _2892;
    }
    float _2894 = _2630;
    if (!_2796)
    {
        _2820 = _2786;
    }
    float _2896 = _2820;
    float _2898 = _2896;
    if (_2796)
    {
        float _2900 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2890 = _2900;
    }
    float _2902 = _2890;
    if (_2796)
    {
        float _2904 = _2784 * _2894;
        _2872 = _2904;
    }
    float _2906 = _2872;
    if (!_2796)
    {
        _2878 = _2788;
    }
    float _2908 = _2878;
    float _2910 = _2908;
    if (_2796)
    {
        float _2912 = _2786 * _2894;
        _2898 = _2912;
    }
    float _2914 = _2898;
    if (_2796)
    {
        float _2916 = fma(_2856, _2850, _2902);
        _2882 = _2916;
    }
    float _2918 = _2882;
    if (_2796)
    {
        float _2920 = _2906 * _2906;
        _2910 = _2920;
    }
    float _2922 = _2910;
    if (!_2796)
    {
        _2884 = _2790;
    }
    float _2924 = _2884;
    float _2926 = _2924;
    if (_2796)
    {
        float _2928 = _2914 * _2914;
        _2926 = _2928;
    }
    float _2930 = _2926;
    float _2932 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2934 = fma(_2918, _2918, _2922);
    float _2936 = floor(_2868);
    float _2938 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2932);
    float _2940 = _2934 + _2930;
    float _2942 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2944 = fma(_2780, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2942);
    float _2946 = precise::clamp(_2944, 0.0, 1.0);
    float _2948 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2938);
    float _2950 = rsqrt(_2940);
    float _2952 = -_2946;
    float _2954 = _2952 + 1.0;
    float _2956 = _2948 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2958 = fma(_2114, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2960 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2962 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2964 = abs(_2954);
    float _2966 = log2(_2964);
    float _2968 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2970 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2972 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2960);
    float _2974 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2968);
    float _2976 = -_2970;
    float _2978 = fma(_2976, _2962, 1.0);
    float _2980 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2972);
    float _2982 = _2950 * _2906;
    float _2984 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2974);
    float _2986 = _2950 * _2918;
    float _2988 = _2950 * _2914;
    float _2990 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2992 = _2984 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2994 = _2980 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2996 = floor(_2958);
    float _2998 = -_2990;
    float _3000 = fma(_2986, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2998);
    float _3002 = _2992 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3004 = _2966 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3006 = -_2988;
    float _3008 = fma(_3006, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3000);
    float _3010 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2772);
    float _3012 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3002);
    float _3014 = exp2(_3004);
    float _3016 = fma(_3008, -0.5, 0.5);
    float _3018 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3020 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3012);
    float _3022 = fma(_3008, 0.5, 0.5);
    float _3024 = _2992 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3026 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3020);
    float _3028 = log2(_2978);
    float _3030 = -_2996;
    float _3032 = _2958 + _3030;
    float _3034 = fma(_3022, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3036 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3024);
    float _3038 = fma(_3022, _3034, -0.212114393711090087890625);
    float _3040 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3036);
    float _3042 = 1.0 / _3026;
    float _3044 = -_2936;
    float _3046 = _2868 + _3044;
    float _3048 = _2992 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3050 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3048);
    float _3052 = _2986 + 1.0;
    float _3054 = sqrt(_3016);
    float _3056 = _3028 * 0.693147182464599609375;
    float _3058 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3050);
    float _3060 = -_2986;
    float _3062 = fma(_3014, _3052, _3060);
    float _3064 = fma(_3022, _3038, 1.570728778839111328125);
    float2 _8160 = float2(_3046, _3032);
    float _3066 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8160, float2(0.0), isnan(_8160)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8160, float2(0.0), isnan(_8160)), level(0.0)).x;
    float _3068 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3058);
    float _3070 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3040);
    float _3072 = _3056 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3074 = fma(_3062, 0.5, 0.5);
    float _3076 = _3068 * _3042;
    float _3078 = _3070 * _3042;
    float _3080 = fma(_3076, 0.5, 0.5);
    float _3082 = fma(_3078, -0.5, 0.5);
    float _3084 = _3054 * 0.636619746685028076171875;
    float _3086 = -_3064;
    float _3088 = fma(_3084, _3086, 1.0);
    float3 _8205 = float3(_3080, _3082, _3072);
    float _3090 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8205, float3(0.0), isnan(_8205)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8205, float3(0.0), isnan(_8205)), level(0.0)).x;
    float3 _8216 = float3(_3080, _3082, _3072);
    float4 _3093 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8216, float3(0.0), isnan(_8216)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8216, float3(0.0), isnan(_8216)), level(0.0)).xyzw;
    float _3095 = _3093.x;
    float _3097 = _3093.y;
    float _3099 = _3093.z;
    float _3101 = _3093.w;
    float2 _8232 = float2(_3088, _3074);
    float3 _3105 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8232, float2(0.0), isnan(_8232)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8232, float2(0.0), isnan(_8232)), level(0.0)).xyz;
    float _3107 = _3105.x;
    float _3109 = _3105.y;
    float _3111 = _3105.z;
    float _3113 = abs(_2636);
    float _3115 = log2(_3113);
    float _3117 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3119 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3121 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3123 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3125 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3117);
    float _3127 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3119);
    float _3129 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3121);
    float _3131 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3133 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3135 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3137 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3139 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3141 = -_2232;
    float _3143 = fma(_3141, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3123);
    float _3145 = -_2232;
    float _3147 = fma(_3145, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3133);
    float _3149 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3151 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3153 = -_2232;
    float _3155 = fma(_3153, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3131);
    float _3157 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3135);
    float _3159 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3137);
    float _3161 = exp2(_3151);
    float _3163 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3139);
    float _3165 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3155);
    float _3167 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3157);
    float _3169 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3159);
    float _3171 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3163);
    float _3173 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3125);
    float _3175 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3143);
    float _3177 = fma(_3149, _3149, 1.0);
    float _3179 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3181 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3147);
    float _3183 = _2992 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3185 = rsqrt(_3177);
    float _3187 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3127);
    float _3189 = _2966 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3191 = fma(_3161, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3193 = precise::clamp(_3191, 0.0, 1.0);
    float _3195 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3129);
    float _3197 = _3149 * _3175;
    float _3199 = _3193 * _3193;
    float _3201 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3183);
    float _3203 = fma(_3193, -2.0, 3.0);
    float _3205 = _3149 * _3165;
    float _3207 = exp2(_3189);
    float _3209 = fma(_3179, _3187, _3197);
    float _3211 = _3199 * _3203;
    float _3213 = fma(_3179, _3173, _3205);
    float _3215 = _3149 * _3181;
    float _3217 = _3149 * _3185;
    float _3219 = -_3211;
    float _3221 = _3219 + 1.0;
    out.m_78.x = _3173;
    out.m_78.y = _3187;
    out.m_78.z = _3195;
    float _3223 = fma(_3179, _3195, _3215);
    float _3225 = -_3167;
    float _3227 = _3217 * _3225;
    float _3229 = fma(_3221, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3211);
    float _3231 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3201);
    float _3233 = in.m_80.x;
    float _3235 = fma(_3185, _3165, _3227);
    float _3237 = _3167 + _3213;
    float _3239 = _3169 + _3209;
    float _3241 = -_3207;
    float _3243 = _3241 + 1.0;
    out.m_82.x = _2620;
    out.m_82.y = _2618;
    out.m_82.z = _2622;
    bool _3245 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3247 = isnan(_2780);
    bool _3249 = _3245 || _3247;
    bool _3251 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3253 = _3249 || _3251;
    float _3255 = -_3169;
    float _3257 = _3217 * _3255;
    float _3259 = -_3171;
    float _3261 = _3217 * _3259;
    float _3263 = _3243 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3265 = fma(_3185, _3175, _3257);
    bool _3267 = _2636 <= 8000.0;
    bool _3269 = isnan(_2636);
    bool _3271 = _3267 || _3269;
    bool _3273 = isnan(8000.0);
    bool _3275 = _3271 || _3273;
    float _3277 = float(_3275);
    float _3279 = fma(_3185, _3181, _3261);
    float _3281 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3231);
    float _3283 = _3026 * 0.5;
    float _3285 = _3068 + _3026;
    float _3287 = _3277 * _3229;
    out.m_84.x = _3235;
    out.m_84.y = _3265;
    out.m_84.z = _3279;
    float _3289 = _3281 + _3026;
    float _3291 = fma(_3070, -0.5, _3283);
    float _3293 = _3287 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3068;
    out.gl_Position.y = _3070;
    out.gl_Position.z = _3281;
    out.gl_Position.w = _3026;
    float _3295 = _3289 * 0.5;
    float _3297 = _3171 + _3223;
    float _3299 = _3285 * 0.5;
    out.m_86.x = _3237;
    out.m_86.y = _3239;
    out.m_86.z = _3297;
    float _3301 = _3169;
    float _3303 = _3279;
    float _3305 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3253)
    {
        _3301 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3307 = _3301;
    float _3309 = _3307;
    float _3311 = _3307;
    if (!_3253)
    {
        _3303 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3313 = _3303;
    out.m_88.z = _3295;
    out.m_88.w = _3026;
    out.m_90.x = _3299;
    out.m_90.y = _3291;
    out.m_90.z = _3295;
    out.m_90.w = _3026;
    float _3315 = -_3066;
    float _3317 = _3315 + 1.0;
    float _3319 = _3317 * _3293;
    float _3321 = precise::clamp(_3319, 0.0, 1.0);
    float _3323 = -_3321;
    float _3325 = fma(_3323, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3327 = _3097;
    float _3329 = _3313;
    float _3331 = _3313;
    if (!_3253)
    {
        _3305 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3333 = _3305;
    float _3335 = _3325 * _3233;
    float _3337 = _3335 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3339 = _3263 * _3090;
    float _3341 = -_3263;
    float _3343 = _3341 + 1.0;
    float _3345 = _3101 * _3339;
    float _3347 = _3111 * _3339;
    float _3349 = _3101 * _3343;
    out.m_92.x = _3337;
    float _3351 = fma(_3107, _3345, _3095);
    float _3353 = fma(_3109, _3345, _3097);
    float _3355 = fma(_3101, _3347, _3099);
    float _3357 = _2692 * _2754;
    float _3359 = _3339;
    float _3361 = _3357;
    float _3363 = _3333;
    float _3365 = _3333;
    if (!_3253)
    {
        _3359 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3367 = _3359;
    float _3369 = _3367;
    float _3371 = _3367;
    if (!_3253)
    {
        _3327 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3373 = _3327;
    out.m_94.x = _3351;
    out.m_94.y = _3353;
    out.m_94.z = _3355;
    out.m_94.w = _3349;
    float _3375 = _3357 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3377 = _3373;
    float _3379 = _3373;
    if (!_3253)
    {
        _3361 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3381 = _3361;
    bool _3383 = !_3253;
    float _3385 = _3381;
    float _3387 = _3381;
    if (!_3383)
    {
        bool _3389 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3391 = isnan(_2780);
        bool _3393 = _3389 || _3391;
        bool _3395 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3397 = _3393 || _3395;
        if (!_3397)
        {
            float _3399 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3401 = _2780 + _3399;
            float _3403 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3405 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3403;
            float _3407 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3409 = _3407 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3411 = 1.0 / _3405;
            float _3413 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3415 = _3413 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3417 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3419 = _3417 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3421 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3423 = _3421 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3425 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3427 = _3425 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3429 = _3401 * _3411;
            float _3431 = precise::clamp(_3429, 0.0, 1.0);
            float _3433 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3435 = _3433 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3437 = fma(_3431, _3409, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3439 = fma(_3431, _3435, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3441 = fma(_3431, _3415, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3443 = fma(_3431, _3419, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3445 = fma(_3431, _3423, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3447 = fma(_3431, _3427, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3331 = _3441;
            _3379 = _3445;
            _3311 = _3437;
            _3371 = _3443;
            _3365 = _3439;
            _3387 = _3447;
            _3449 = true;
        }
        else
        {
            bool _3451 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3453 = isnan(_2780);
            bool _3455 = _3451 || _3453;
            bool _3457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3459 = _3455 || _3457;
            if (!_3459)
            {
                _3309 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3461 = _3309;
            _3311 = _3461;
            if (!_3459)
            {
                _3329 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3463 = _3329;
            _3331 = _3463;
            if (!_3459)
            {
                _3363 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3465 = _3363;
            _3365 = _3465;
            if (!_3459)
            {
                _3369 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3467 = _3369;
            _3371 = _3467;
            if (!_3459)
            {
                _3377 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3469 = _3377;
            _3379 = _3469;
            if (!_3459)
            {
                _3385 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3471 = _3385;
            bool _3473 = !_3459;
            _3387 = _3471;
            if (!_3473)
            {
                bool _3475 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3477 = isnan(_2780);
                bool _3479 = _3475 || _3477;
                bool _3481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3483 = _3479 || _3481;
                if (!_3483)
                {
                    float _3485 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3487 = _2780 + _3485;
                    float _3489 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3491 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3489;
                    float _3493 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3495 = _3493 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3497 = 1.0 / _3491;
                    float _3499 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3501 = _3499 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3503 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3505 = _3503 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3507 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3509 = _3507 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3511 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3513 = _3511 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3515 = _3487 * _3497;
                    float _3517 = precise::clamp(_3515, 0.0, 1.0);
                    float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3521 = _3519 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3523 = fma(_3517, _3495, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3525 = fma(_3517, _3521, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3527 = fma(_3517, _3501, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3529 = fma(_3517, _3505, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3531 = fma(_3517, _3509, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3533 = fma(_3517, _3513, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3331 = _3527;
                    _3379 = _3531;
                    _3311 = _3523;
                    _3371 = _3529;
                    _3365 = _3525;
                    _3387 = _3533;
                    _3449 = true;
                }
                else
                {
                    _3331 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3379 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3311 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3371 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3365 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3387 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3449 = false;
    float _3535 = _3331;
    float _3537 = _3379;
    float _3539 = _3311;
    float _3541 = _3371;
    float _3543 = _3365;
    float _3545 = _3387;
    float _3547 = fma(_3239, -0.5, 0.5);
    float _3549 = precise::clamp(_3547, 0.0, 1.0);
    float _3551 = -_3535;
    float _3553 = _3551 + _3537;
    float _3555 = _3375 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3557 = -_3539;
    float _3559 = _3557 + _3541;
    float _3561 = fma(_3549, _3553, _3535);
    out.m_96.x = 0.0;
    float _3563 = -_3543;
    float _3565 = _3563 + _3545;
    float _3567 = fma(_3549, _3559, _3539);
    float _3569 = _3561 * 0.586610972881317138671875;
    out.m_49.x = _3555;
    bool _3571 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3573 = fma(_3549, _3565, _3543);
    float _3575 = fma(_3567, 0.298911988735198974609375, _3569);
    bool _3577 = _2692 > 0.0;
    bool _3579 = isnan(_2692);
    bool _3581 = _3577 || _3579;
    bool _3583 = isnan(0.0);
    bool _3585 = _3581 || _3583;
    float _3587 = fma(_3573, 0.114477999508380889892578125, _3575);
    bool _3589 = _2754 <= 0.0;
    bool _3591 = !_3585;
    bool _3593 = _3589 || _3591;
    float _3595 = -_3587;
    float _3597 = _3561 + _3595;
    float _3599 = -_3587;
    float _3601 = _3567 + _3599;
    float _3603 = -_3587;
    float _3605 = _3573 + _3603;
    float _3607 = fma(_3597, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3587);
    float _3609 = fma(_3601, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3587);
    float _3611 = fma(_3605, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3587);
    bool _3613 = !_3571;
    if (!_3613)
    {
        float _3615 = -_2618;
        float _3617 = _3615 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3619 = -_2620;
        float _3621 = _3619 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3623 = -_2622;
        float _3625 = _3623 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3627 = _3617 * _3617;
        float _3629 = fma(_3621, _3621, _3627);
        float _3631 = fma(_3625, _3625, _3629);
        float _3633 = sqrt(_3631);
        float _3635 = rsqrt(_3631);
        float _3637 = -_3633;
        float _3639 = _3637 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3641 = _3639 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3643 = precise::clamp(_3641, 0.0, 1.0);
        float _3645 = _3621 * _3635;
        float _3647 = _3617 * _3635;
        float _3649 = abs(_3643);
        float _3651 = log2(_3649);
        float _3653 = _3625 * _3635;
        float _3655 = _3645 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3657 = _3239 * _3647;
        float _3659 = -_3647;
        float _3661 = -_3655;
        float _3663 = fma(_3659, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3661);
        float _3665 = fma(_3237, _3645, _3657);
        float _3667 = -_3653;
        float _3669 = fma(_3667, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3663);
        float _3671 = fma(_3297, _3653, _3665);
        float _3673 = precise::clamp(_3671, 0.0, 1.0);
        float _3675 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3677 = _3669 + _3675;
        float _3679 = _3651 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3681 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3683 = precise::clamp(_3681, 0.0, 1.0);
        float _3685 = exp2(_3679);
        float _3687 = _3685 * _3683;
        float _3689 = _3673 * _3687;
        float _3691 = _3689 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3693 = _3689 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3695 = _3689 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3691;
        out.m_96.y = _3693;
        out.m_96.z = _3695;
    }
    out.m_98.x = _3609;
    out.m_98.y = _3607;
    out.m_98.z = _3611;
    if (!_3593)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3697 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3697;
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
    bool _3449 = false;
    bool _393 = false;
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
        float _3753 = as_type<float>(_131);
        out.gl_Position.z = _3753;
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
        float _3826 = as_type<float>(_173);
        out.gl_Position.z = _3826;
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
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391;
    if (!_371)
    {
        float _375 = in.m_60.x;
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _379 = _375 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _383 = _381 * _377;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _389;
        _393 = true;
    }
    else
    {
        _391 = _167;
    }
    _393 = false;
    float _395 = _391;
    bool _397 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _399 = isnan(_395);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _413 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _415 = isnan(_395);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _431 = _395 + _429;
    float _433 = -_407;
    float _435 = _433 + 1.0;
    float _437 = 1.0 / _411;
    bool _439 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _441 = _423 * _435;
    float _443 = -_423;
    float _445 = _443 + 1.0;
    float _447 = _427 * _437;
    float _449 = fma(_447, _431, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _451 = _449 * _441;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _457 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[115].x, _451);
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _461 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _463 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[116].x, _457);
    float _467 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = _465 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _461;
    out.m_64.y = _463;
    out.m_64.z = _467;
    out.m_64.w = _469;
    bool _471 = !_439;
    if (!_471)
    {
        float _473 = in.m_60.x;
        float _475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _477 = _473 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _479 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _481 = _479 * _475;
        float _483 = floor(_481);
        float _485 = -_483;
        float _487 = _481 + _485;
        _169 = _487;
    }
    float _489 = _169;
    float _491 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _493 = int(_491);
    float _495 = in.m_60.x;
    float _497 = in.m_60.y;
    float _499 = _159 * _141;
    float _501 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _505 = _503 != 0;
    float _507 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _509 = int(_507);
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _513 = float(_493);
    float _515 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _517 = int(_515);
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_505)
    {
        _373 = 1.0;
    }
    float _523 = _373;
    float _525 = _523;
    if (!_505)
    {
        _525 = 7.345489978790283203125;
    }
    float _527 = _525;
    float _529 = float(_509);
    float _531 = 1.0 / _513;
    float _533 = _527 * _495;
    float _535 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _537 = int(_535);
    float _539 = float(uint(_517));
    bool _541 = _517 == 0;
    float _543 = 1.0 / _529;
    float _545 = _531 * _141;
    float _547 = 1.0 / _539;
    float _549 = float(uint(_537));
    int _551 = ~_537;
    int _553 = _551 + 1;
    float _555 = trunc(_545);
    int _557 = int(_555);
    float _559 = _543 * _141;
    int _561 = ~_517;
    int _563 = _561 + 1;
    float _565 = 1.0 / _549;
    int _567 = as_type<int>(_547) + (-2);
    float _569 = trunc(_559);
    int _571 = int(_569);
    float _573 = float(uint(_557));
    float _575 = as_type<float>(_567) * _573;
    int _577 = as_type<int>(_565) + (-2);
    float _579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _581 = ~_537;
    int _583 = _581 + 1;
    float _585 = float(uint(_571));
    float _587 = trunc(_575);
    float _589 = precise::max(_587, 0.0);
    uint _592 = uint(_589);
    float _594 = as_type<float>(_577) * _585;
    float _596 = trunc(_594);
    float _598 = precise::max(_596, 0.0);
    uint _600 = uint(_598);
    float _602 = _579 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _604 = _563 * int(_592);
    int _606 = _604 + _557;
    float _608 = floor(_533);
    float _610 = float(uint(_606));
    int _612 = _583 * int(_600);
    int _614 = _612 + _571;
    float _616 = as_type<float>(_567) * _610;
    float _618 = _610;
    if (_505)
    {
        _618 = 1.0;
    }
    float _620 = _618;
    float _622 = float(uint(_614));
    float _624 = trunc(_616);
    float _626 = precise::max(_624, 0.0);
    uint _628 = uint(_626);
    float _630 = _620;
    float _632 = _622;
    if (!_505)
    {
        _630 = 1.2345600128173828125;
    }
    float _634 = _630;
    float _636 = -_608;
    float _638 = _533 + _636;
    float _640 = as_type<float>(_577) * _622;
    if (_505)
    {
        _632 = _495;
    }
    float _642 = _632;
    float _644 = _642;
    if (!_505)
    {
        _644 = _497;
    }
    float _646 = _644;
    float _648 = trunc(_640);
    float _650 = precise::max(_648, 0.0);
    uint _652 = uint(_650);
    float _654 = _634 * _646;
    int _656 = ~_517;
    int _658 = _656 + 1;
    int _660 = int(_592) + int(_628);
    float _662 = floor(_654);
    float _664 = float(_517);
    float _666 = float(_557);
    int _668 = _658 * _660;
    int _670 = _668 + _557;
    int _672 = int(_600) + int(_652);
    float _674 = _638 * _664;
    float _676 = _664 * _499;
    bool _678 = _666 >= _664;
    bool _680 = isnan(_666);
    bool _682 = _678 || _680;
    bool _684 = isnan(_664);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    bool _690 = uint(_670) >= uint(_517);
    int _692 = _553 * _672;
    int _694 = _692 + _571;
    float _696 = -_662;
    float _698 = _654 + _696;
    float _700 = trunc(_688);
    int _702 = int(_700);
    bool _704 = !_690;
    int _706 = _704 ? 0 : (-1);
    bool _708 = uint(_694) >= uint(_537);
    float _710 = in.m_60.z;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _714 = _712 != 0;
    int _716 = ~_660;
    int _718 = _716 + _706;
    int _720 = _718 + 1;
    float _722 = trunc(_674);
    int _724 = int(_722);
    bool _726 = !_714;
    int _728 = _726 ? 0 : 1;
    float _730 = float(_537);
    int _732 = abs(_728);
    int _734 = _517 * _720;
    int _736 = _734 + _557;
    float _738 = float(_571);
    float _740 = _730 * _499;
    int _742 = ~_702;
    int _744 = _742 + 1;
    int _746 = _744 + 1;
    bool _748 = !_708;
    int _750 = _748 ? 0 : (-1);
    bool _752 = !_541;
    int _754 = _752 ? _736 : (-1);
    float _756 = trunc(_740);
    int _758 = int(_756);
    bool _760 = _738 >= _730;
    bool _762 = isnan(_738);
    bool _764 = _760 || _762;
    bool _766 = isnan(_730);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = _698 * _730;
    bool _774 = _497 > 0.5;
    int _776 = _754 * _746;
    int _778 = ~_672;
    int _780 = _778 + _750;
    int _782 = _780 + 1;
    int _784 = _724 * _732;
    int _786 = _784 + _557;
    bool _788 = _710 > 0.5;
    float _790 = trunc(_772);
    int _792 = int(_790);
    float _794 = -_217;
    int _796 = _774 ? as_type<int>(_794) : as_type<int>(_217);
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _800 = _798 != 0;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _804 = _802 != 0;
    float _806 = -_207;
    int _808 = _788 ? as_type<int>(_806) : as_type<int>(_207);
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _812 = _810 != 0;
    float _814 = trunc(_770);
    int _816 = int(_814);
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _820 = _818 != 0;
    bool _822 = !_800;
    float _824 = _822 ? _217 : as_type<float>(_796);
    bool _826 = !_804;
    float _828 = _826 ? _207 : as_type<float>(_808);
    bool _830 = !_812;
    int _832 = _830 ? 0 : 1;
    float _834 = trunc(_676);
    int _836 = int(_834);
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _840 = _838 != 0;
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _844 = _842 != 0;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _848 = _846 != 0;
    float _850 = _824 + 0.5;
    int _852 = abs(_832);
    int _854 = _517 + (-1);
    bool _856 = !_844;
    int _858 = _856 ? 0 : 1;
    bool _860 = !_820;
    int _862 = _860 ? 0 : 1;
    int _864 = _702 * _854;
    int _866 = _864 + _776;
    bool _868 = !_840;
    int _870 = _868 ? 0 : 1;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _874 = _872 != 0;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _878 = _876 != 0;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _882 = _880 != 0;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _886 = _884 != 0;
    int _888 = abs(_858);
    int _890 = _792 * _852;
    int _892 = _890 + _571;
    int _894 = abs(_870);
    int _896 = _537 * _782;
    int _898 = _896 + _571;
    bool _900 = !_848;
    int _902 = _900 ? 0 : 1;
    bool _904 = !_878;
    int _906 = _904 ? 0 : 1;
    bool _908 = _537 == 0;
    int _910 = abs(_902);
    int _912 = _866 * _888;
    int _914 = ~_816;
    int _916 = _914 + 1;
    int _918 = _916 + 1;
    bool _920 = !_908;
    int _922 = _920 ? _898 : (-1);
    int _924 = _836 * _894;
    int _926 = _924 + _912;
    int _928 = _537 + (-1);
    int _930 = _922 * _918;
    int _932 = abs(_862);
    int _934 = _786 * _910;
    int _936 = _934 + _926;
    int _938 = abs(_906);
    int _940 = _816 * _928;
    int _942 = _940 + _930;
    bool _944 = !_874;
    int _946 = _944 ? 0 : 1;
    int _948 = _724 * _932;
    int _950 = _948 + _936;
    bool _952 = !_882;
    int _954 = _952 ? 0 : 1;
    int _956 = abs(_946);
    bool _958 = !_886;
    int _960 = _958 ? 0 : 1;
    int _962 = abs(_954);
    int _964 = _942 * _938;
    float _966 = float(uint(_950));
    int _968 = abs(_960);
    int _970 = _758 * _956;
    int _972 = _970 + _964;
    float _974 = as_type<float>(_567) * _966;
    int _976 = ~_517;
    int _978 = _976 + 1;
    int _980 = _892 * _962;
    int _982 = _980 + _972;
    bool _984 = _517 == 0;
    float _986 = trunc(_974);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    int _992 = _792 * _968;
    int _994 = _992 + _982;
    int _996 = ~_517;
    int _998 = _996 + 1;
    int _1000 = ~_537;
    int _1002 = _1000 + 1;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1006 = float(uint(_994));
    float _1008 = float(uint(_786));
    float _1010 = as_type<float>(_577) * _1006;
    float _1012 = as_type<float>(_567) * _1008;
    int _1014 = _998 * int(_990);
    int _1016 = _1014 + _950;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1022 = trunc(_1010);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    float _1028 = float(uint(_1016));
    float _1030 = as_type<float>(_567) * _1028;
    float _1032 = trunc(_1012);
    float _1034 = precise::max(_1032, 0.0);
    uint _1036 = uint(_1034);
    int _1038 = _1002 * int(_1026);
    int _1040 = _1038 + _994;
    float _1042 = trunc(_1030);
    float _1044 = precise::max(_1042, 0.0);
    uint _1046 = uint(_1044);
    float _1048 = _497 * 2.0;
    float _1050 = float(uint(_1040));
    float _1052 = floor(_1048);
    float _1054 = as_type<float>(_577) * _1050;
    int _1056 = ~_537;
    int _1058 = _1056 + 1;
    int _1060 = int(_990) + int(_1046);
    float _1062 = trunc(_1054);
    float _1064 = precise::max(_1062, 0.0);
    uint _1066 = uint(_1064);
    int _1068 = _978 * _1060;
    int _1070 = _1068 + _950;
    float _1072 = 1.0 / _1020;
    bool _1074 = uint(_1070) >= uint(_517);
    bool _1076 = !_1074;
    int _1078 = _1076 ? 0 : (-1);
    int _1080 = ~_1060;
    int _1082 = _1080 + _1078;
    int _1084 = _1082 + 1;
    float _1086 = _710 * 2.0;
    int _1088 = int(_1026) + int(_1066);
    float _1090 = float(uint(_892));
    int _1092 = _517 * _1084;
    int _1094 = _1092 + _950;
    float _1096 = _497 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1098 = _1058 * _1088;
    int _1100 = _1098 + _994;
    float _1102 = floor(_1086);
    float _1104 = as_type<float>(_577) * _1090;
    bool _1106 = !_984;
    int _1108 = _1106 ? _1094 : (-1);
    float _1110 = fma(_1096, -2.0, _1004);
    bool _1112 = uint(_1100) >= uint(_537);
    int _1114 = _1108 & 3;
    bool _1116 = _1114 != 0;
    int _1118 = _1108 & 3;
    bool _1120 = _1118 != 0;
    float _1122 = trunc(_1104);
    float _1124 = precise::max(_1122, 0.0);
    uint _1126 = uint(_1124);
    bool _1128 = !_1112;
    int _1130 = _1128 ? 0 : (-1);
    int _1132 = _1116 ? 0 : 1;
    bool _1134 = uint(_1118) >= 2u;
    bool _1136 = uint(_1118) > 1u;
    int _1138 = ~_1088;
    int _1140 = _1138 + _1130;
    int _1142 = _1140 + 1;
    int _1144 = _1134 ? 0 : 1;
    bool _1146 = _1118 != 3;
    int _1148 = _537 * _1142;
    int _1150 = _1148 + _994;
    int _1152 = ~_1132;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1160 = _1158 != 0;
    bool _1162 = !_908;
    int _1164 = _1162 ? _1150 : (-1);
    int _1166 = _1156;
    float _1168 = as_type<float>(_786);
    if (!_1136)
    {
        int _1170 = ~_1132;
        int _1172 = _1170 + 1;
        _1166 = _1172;
    }
    int _1174 = _1166;
    int _1176 = _1164 & 3;
    bool _1178 = _1176 != 0;
    int _1180 = ~_1144;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    int _1186 = _1184;
    if (_1146)
    {
        int _1188 = ~_1144;
        int _1190 = _1188 + 1;
        _1186 = _1190;
    }
    int _1192 = _1186;
    bool _1194 = uint(_1176) > 1u;
    float _1196 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1198 = log2(_1196);
    int _1200 = _1164 & 3;
    bool _1202 = _1200 != 0;
    if (_1160)
    {
        _521 = 0;
    }
    int _1204 = _521;
    int _1206 = _1202 ? 0 : 1;
    int _1208 = _1204;
    if (!_1160)
    {
        _1208 = 2;
    }
    int _1210 = _1208;
    int _1212 = ~_1206;
    int _1214 = _1212 + 1;
    int _1216 = _1214 + 1;
    bool _1218 = _497 > 0.5;
    int _1220 = _1216;
    if (!_1194)
    {
        int _1222 = ~_1206;
        int _1224 = _1222 + 1;
        _1220 = _1224;
    }
    int _1226 = _1220;
    float _1228 = _495 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1230 = _1198 * _141;
    bool _1232 = _1176 != 3;
    bool _1234 = _1210 != 2;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1238 = -_207;
    float _1240 = _1218 ? _1238 : _207;
    float _1242 = exp2(_1230);
    bool _1244 = uint(_1176) >= 2u;
    float _1246 = -_1236;
    float _1248 = fma(_1228, 2.0, _1246);
    float _1250 = _495 * 2.0;
    float _1252 = _1244 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1254 = floor(_1250);
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1258 = _1256 != 0;
    int _1260 = ~as_type<int>(_1252);
    int _1262 = _1260 + 1;
    int _1264 = _1262 + 1;
    int _1266 = _1264;
    float _1268 = _1252;
    float _1270 = _1240;
    if (_1232)
    {
        int _1272 = ~as_type<int>(_1252);
        int _1274 = _1272 + 1;
        _1266 = _1274;
    }
    int _1276 = _1266;
    if (_1234)
    {
        _1268 = _495;
    }
    float _1278 = _1268;
    float _1280 = _1278;
    if (!_1234)
    {
        _1280 = _710;
    }
    float _1282 = _1280;
    bool _1284 = !_1258;
    int _1286 = _1284 ? 0 : 1;
    int _1288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1290 = _1288 != 0;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1294 = _495 > 0.5;
    float _1296 = -_1242;
    float _1298 = _1296 + 1.0;
    bool _1300 = !_1290;
    float _1302 = _1300 ? _207 : _1240;
    float _1304 = -_511;
    float _1306 = fma(_1292, 2.0, _1304);
    int _1308 = ~_517;
    int _1310 = _1308 + 1;
    float _1312 = -_217;
    int _1314 = _1294 ? as_type<int>(_1312) : as_type<int>(_217);
    float _1316 = -_141;
    float _1318 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1306);
    bool _1320 = _1254 > 0.0;
    int _1322 = _1310 * int(_1036);
    int _1324 = _1322 + _786;
    bool _1326 = _1254 >= 0.0;
    bool _1328 = isnan(_1254);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(0.0);
    bool _1334 = _1330 || _1332;
    float _1336 = fma(_602, _850, _1318);
    int _1338 = ~_537;
    int _1340 = _1338 + 1;
    if (_1234)
    {
        _1270 = _497;
    }
    float _1342 = _1270;
    float _1344 = _1342;
    if (!_1234)
    {
        _1344 = _495;
    }
    float _1346 = _1344;
    int _1348 = _1340 * int(_1126);
    int _1350 = _1348 + _892;
    float _1352 = float(uint(_1324));
    bool _1354 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1356 = isnan(0.0);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1362 = _1358 || _1360;
    float _1364 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1366 = float(uint(_1350));
    float _1368 = as_type<float>(_567) * _1352;
    float _1370 = _1362 ? _1298 : 0.0;
    float _1372 = fma(_1364, -2.0, _519);
    bool _1374 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1376 = isnan(1.0);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1382 = _1378 || _1380;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1386 = 1.0 + _1384;
    float _1388 = as_type<float>(_577) * _1366;
    float _1390 = trunc(_1368);
    float _1392 = precise::max(_1390, 0.0);
    uint _1394 = uint(_1392);
    float _1396 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1372);
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1400 = 1.0 / _1386;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1406 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1398);
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1410 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1402);
    float _1412 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1404);
    float _1414 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1406);
    float _1416 = trunc(_1388);
    float _1418 = precise::max(_1416, 0.0);
    uint _1420 = uint(_1418);
    float _1422 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1408);
    float _1424 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1110);
    float _1426 = -_141;
    float _1428 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1248);
    float _1430 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1410);
    float _1432 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1412);
    float _1434 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1422);
    int _1436 = int(_1036) + int(_1394);
    if (_1382)
    {
        float _1438 = _1370 * _1400;
        _163 = _1438;
    }
    float _1440 = _163;
    int _1442 = ~_517;
    int _1444 = _1442 + 1;
    float _1446 = in.m_46.x;
    float _1448 = in.m_46.y;
    float _1450 = in.m_46.z;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1454 = _1452 != 0;
    float _1456 = _1302 + (-0.5);
    int _1458 = ~_537;
    int _1460 = _1458 + 1;
    int _1462 = _1444 * _1436;
    int _1464 = _1462 + _786;
    int _1466 = _1334 ? 0 : 1;
    float _1468 = -_1414;
    float _1470 = _1468 + 1.0;
    bool _1472 = !_1454;
    float _1474 = _1472 ? _217 : as_type<float>(_1314);
    float _1476 = -_1456;
    float _1478 = -_1424;
    float _1480 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1478);
    bool _1482 = _1052 > 0.0;
    float _1484 = -_1430;
    float _1486 = _1484 + 1.0;
    bool _1488 = _1052 >= 0.0;
    bool _1490 = isnan(_1052);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan(0.0);
    bool _1496 = _1492 || _1494;
    float _1498 = -_1432;
    float _1500 = _1498 + 1.0;
    int _1502 = int(_1126) + int(_1420);
    int _1504 = ~_1466;
    int _1506 = _1504 + 1;
    int _1508 = _1506 + 1;
    int _1510 = _1508;
    if (!_1320)
    {
        int _1512 = ~_1466;
        int _1514 = _1512 + 1;
        _1510 = _1514;
    }
    int _1516 = _1510;
    bool _1518 = uint(_1464) >= uint(_517);
    int _1520 = _1460 * _1502;
    int _1522 = _1520 + _892;
    float _1524 = _1448 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1526 = _1496 ? 0 : 1;
    float _1528 = _1448 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1530 = !_1518;
    int _1532 = _1530 ? 0 : (-1);
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1534;
    bool _1538 = uint(_1522) >= uint(_537);
    float _1540 = fma(_1446, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1524);
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1544 = _1542 != 0;
    float _1546 = _1536 * _1072;
    bool _1548 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1550 = isnan(_489);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1556 = _1552 || _1554;
    float _1558 = float(_1556);
    float _1560 = fma(_1446, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1528);
    int _1562 = ~_1526;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    int _1568 = _1566;
    if (!_1482)
    {
        int _1570 = ~_1526;
        int _1572 = _1570 + 1;
        _1568 = _1572;
    }
    int _1574 = _1568;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1578 = _489 + _1576;
    bool _1580 = !_1538;
    int _1582 = _1580 ? 0 : (-1);
    float _1584 = -_1558;
    float _1586 = _1584 + 1.0;
    int _1588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1590 = _1588 != 0;
    int _1592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1594 = _1592 != 0;
    int _1596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1598 = _1596 != 0;
    float _1600 = _1448 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1602 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1604 = isnan(_489);
    bool _1606 = _1602 || _1604;
    bool _1608 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1610 = _1606 || _1608;
    float _1612 = float(_1610);
    bool _1614 = !_1120;
    int _1616 = _1614 ? 0 : 1;
    float _1618 = fma(_1446, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1600);
    float _1620 = fma(_1546, _1578, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1622 = _1612 * _1586;
    float _1624 = _1474 + 0.5;
    float _1626 = fma(_1450, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1618);
    bool _1628 = _1102 >= 0.0;
    bool _1630 = isnan(_1102);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan(0.0);
    bool _1636 = _1632 || _1634;
    float _1638 = _1620 * _1622;
    float _1640 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1428);
    float _1642 = -_1612;
    float _1644 = _1642 + 1.0;
    int _1646 = _1636 ? 0 : 1;
    bool _1648 = _1102 > 0.0;
    float _1650 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1638);
    float _1652 = -_1470;
    float _1654 = fma(_1474, _1652, _1640);
    float _1656 = fma(_1302, _1486, _1480);
    float _1658 = fma(_1450, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1540);
    float _1660 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1650);
    float _1662 = _1626 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1664 = _1108 >> 31;
    float _1666 = _497 + _495;
    int _1668 = _1164 >> 31;
    float _1670 = fma(_1450, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1560);
    float _1672 = _1658 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1676 = _1662 + _1674;
    int _1678 = _1664 & 3;
    float _1680 = _1666 + (-1.0);
    float _1682 = _1670 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1684 = _1668 & 3;
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1688 = _1672 + _1686;
    float _1690 = _1676 * _1676;
    int _1692 = _1108 + _1678;
    out.m_66.x = _1654;
    out.m_66.y = _1656;
    float _1694 = fma(_1680, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1698 = _1682 + _1696;
    float _1700 = fma(_1688, _1688, _1690);
    int _1702 = _1692 >> 2;
    float _1704 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1706 = !_1178;
    int _1708 = _1706 ? 0 : 1;
    float _1710 = fma(_1698, _1698, _1700);
    int _1712 = _1702 << 4;
    int _1714 = _1712 + 368;
    float _1716 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1704);
    int _1718 = _1164 + _1684;
    float _1720 = _501 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1722 = _1118 != 3;
    float _1724 = rsqrt(_1710);
    int _1726 = _1718 >> 2;
    float _1728 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1716);
    int _1730 = ~_1646;
    int _1732 = _1730 + 1;
    int _1734 = _1732 + 1;
    float _1736 = _1660 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1738 = _1726 << 4;
    int _1740 = _1738 + 512;
    uint _1742 = uint(int(uint(_1714) >> uint(2)));
    uint _1744 = uint(int(uint(int(_1742)) >> uint(2)));
    int _1746 = int(_1742) & 3;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[int(_1744)][_1746];
    int _1750 = int(_1742) + 1;
    uint _1752 = uint(int(uint(_1750) >> uint(2)));
    int _1754 = _1750 & 3;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[int(_1752)][_1754];
    int _1758 = _1734;
    float _1760 = _1682;
    if (!_1648)
    {
        int _1762 = ~_1646;
        int _1764 = _1762 + 1;
        _1758 = _1764;
    }
    int _1766 = _1758;
    float _1768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1770 = !_1722;
    int _1772 = _1770 ? 0 : (-1);
    out.m_68.w = _1736;
    bool _1774 = _1176 != 3;
    int _1776 = abs(_1192);
    uint _1778 = uint(int(uint(_1740) >> uint(2)));
    uint _1780 = uint(int(uint(int(_1778)) >> uint(2)));
    int _1782 = int(_1778) & 3;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[int(_1780)][_1782];
    int _1786 = int(_1778) + 1;
    uint _1788 = uint(int(uint(_1786) >> uint(2)));
    int _1790 = _1786 & 3;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[int(_1788)][_1790];
    bool _1794 = !_1774;
    int _1796 = _1794 ? 0 : (-1);
    bool _1798 = _1728 >= 0.0;
    float _1800 = _1720 * _1724;
    int _1802 = abs(_1276);
    int _1804 = abs(_1286);
    int _1806 = _1714 + 8;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    uint _1810 = uint(int(uint(int(_1808)) >> uint(2)));
    int _1812 = int(_1808) & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    int _1816 = int(_1808) + 1;
    uint _1818 = uint(int(uint(_1816) >> uint(2)));
    int _1820 = _1816 & 3;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[int(_1818)][_1820];
    float _1824 = _1676 * _1800;
    float _1826 = _1688 * _1800;
    float _1828 = _1698 * _1800;
    float _1830 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1832 = -_1824;
    float _1834 = _1676 + _1832;
    float _1836 = -_1826;
    float _1838 = _1688 + _1836;
    float _1840 = -_1828;
    float _1842 = _1698 + _1840;
    int _1844 = _1740 + 8;
    uint _1846 = uint(int(uint(_1844) >> uint(2)));
    uint _1848 = uint(int(uint(int(_1846)) >> uint(2)));
    int _1850 = int(_1846) & 3;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[int(_1848)][_1850];
    int _1854 = int(_1846) + 1;
    uint _1856 = uint(int(uint(_1854) >> uint(2)));
    int _1858 = _1854 & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    float _1862 = _1834 * _1834;
    float _1864 = _828 + (-0.5);
    bool _1866 = !_1590;
    int _1868 = _1866 ? 0 : 1;
    float _1870 = _1826;
    if (_1798)
    {
        out.m_49.x = 0.0;
    }
    float _1872 = fma(_1838, _1838, _1862);
    float _1874 = -_1830;
    float _1876 = -_1396;
    float _1878 = fma(_1874, _1864, _1876);
    int _1880 = abs(_1226);
    float _1882 = -_1500;
    float _1884 = fma(_824, _1882, _1336);
    float _1886 = fma(_1842, _1842, _1872);
    int _1888 = abs(_1174);
    float _1890 = _495 + (-0.5);
    int _1892 = abs(_1616);
    int _1894 = ~_1888;
    int _1896 = _1894 + 1;
    int _1898 = _1896 + 1;
    int _1900 = ~_1880;
    int _1902 = _1900 + 1;
    int _1904 = _1902 + 1;
    int _1906 = ~_1892;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    int _1912 = abs(_1708);
    int _1914 = ~_1436;
    int _1916 = _1914 + _1532;
    int _1918 = _1916 + 1;
    int _1920 = _1898 * as_type<int>(_1756);
    int _1922 = ~_1776;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    int _1928 = ~_1502;
    int _1930 = _1928 + _1582;
    int _1932 = _1930 + 1;
    int _1934 = _1910 * as_type<int>(_1748);
    int _1936 = _1934 + _1920;
    int _1938 = abs(_1772);
    int _1940 = _517 * _1918;
    int _1942 = _1940 + _786;
    int _1944 = abs(_1868);
    int _1946 = _1904 * as_type<int>(_1792);
    int _1948 = ~_1912;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    int _1954 = _537 * _1932;
    int _1956 = _1954 + _892;
    bool _1958 = _517 == 0;
    float _1960 = float(_1766);
    int _1962 = _1952 * as_type<int>(_1784);
    int _1964 = _1962 + _1946;
    int _1966 = _1926 * as_type<int>(_1814);
    int _1968 = _1966 + _1936;
    bool _1970 = !_1544;
    int _1972 = _1970 ? 0 : 1;
    int _1974 = abs(_1796);
    int _1976 = abs(_1972);
    int _1978 = ~_1938;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    int _1984 = ~_1802;
    int _1986 = _1984 + 1;
    int _1988 = _1986 + 1;
    int _1990 = ~_1974;
    int _1992 = _1990 + 1;
    int _1994 = _1992 + 1;
    int _1996 = _1982 * as_type<int>(_1822);
    int _1998 = _1996 + _1968;
    float _2000 = float(_1944);
    int _2002 = _1988 * as_type<int>(_1852);
    int _2004 = _2002 + _1964;
    float _2006 = in.m_70.x;
    float _2008 = in.m_70.y;
    float _2010 = in.m_70.z;
    int _2012 = _1994 * as_type<int>(_1860);
    int _2014 = _2012 + _2004;
    float _2016 = sqrt(_1886);
    int _2018 = ~_1804;
    int _2020 = _2018 + 1;
    int _2022 = _2020 + 1;
    float _2024 = -_1434;
    float _2026 = _2024 + 1.0;
    int _2028 = ~_1976;
    int _2030 = _2028 + 1;
    int _2032 = _2030 + 1;
    float _2034 = _2000 * _1960;
    bool _2036 = !_1958;
    int _2038 = _2036 ? _1942 : (-1);
    int _2040 = _1998 * _2022;
    bool _2042 = !_908;
    int _2044 = _2042 ? _1956 : (-1);
    int _2046 = _2014 * _2032;
    float _2048 = fma(_828, _2026, _1878);
    int _2050 = _2038 * _1804;
    int _2052 = _2050 + _2040;
    if (_1798)
    {
        _1168 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2054 = _1168;
    float _2056 = _2034 * (-2.0);
    int _2058 = _2044 * _1976;
    int _2060 = _2058 + _2046;
    bool _2062 = !_1594;
    int _2064 = _2062 ? 0 : 1;
    out.m_72.x = _1884;
    out.m_72.y = _2048;
    float _2066 = _1724 * _2016;
    int _2068 = as_type<int>(_2054);
    if (_1798)
    {
        float _2070 = _2054 * 5.0;
        _2068 = as_type<int>(_2070);
    }
    int _2072 = _2068;
    float _2074 = float(_2052);
    float _2076 = fma(_2056, _2006, _2006);
    float _2078 = float(_2060);
    float _2080 = _501 * _2066;
    if (_1798)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6604 = as_type<float>(_2072);
        out.gl_Position.z = _6604;
    }
    float _2082 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2076);
    float _2084 = _497 + _710;
    float _2086 = float(_1516);
    out.m_74.x = _2074;
    out.m_74.y = _2078;
    float _2088 = fma(_1694, _2056, _1694);
    float _2090 = _2084 + (-1.0);
    out.m_76.x = _2080;
    bool _2092 = !_1598;
    int _2094 = _2092 ? 0 : 1;
    int _2096 = abs(_2064);
    if (_1798)
    {
        return out;
    }
    float _2098 = -_1824;
    float _2100 = _1662 + _2098;
    int _2102 = abs(_2094);
    float _2104 = -_1826;
    float _2106 = _1672 + _2104;
    float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2110 = _2100 + _2108;
    float _2112 = -_1828;
    float _2114 = _1682 + _2112;
    float _2116 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2118 = _2106 + _2116;
    float _2120 = float(_2096);
    float _2122 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2126 = _2114 + _2124;
    float _2128 = float(_1574);
    float _2130 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2132 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2122);
    float _2134 = _2120 * _2086;
    float _2136 = float(_2102);
    float _2138 = _497 + (-0.5);
    float _2140 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2132);
    float _2142 = _2134 * (-2.0);
    float _2144 = _710 + _495;
    float _2146 = _2136 * _2128;
    float _2148 = fma(_2088, _1440, _2082);
    bool _2150 = _2140 >= 0.0;
    float _2152 = fma(_2142, _2008, _2008);
    float _2154 = fma(_2130, _2142, _2130);
    float _2156 = _2144 + (-1.0);
    float _2158 = fma(_2138, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2152);
    float _2160 = _2146 * (-2.0);
    float _2162 = _2148 * 0.15915493667125701904296875;
    float _2164 = fma(_2156, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2166 = fma(_2154, _1440, _2158);
    float _2168 = fma(_2160, _2010, _2010);
    float _2170 = _710 + (-0.5);
    float _2172 = _2162 * 6.283185482025146484375;
    float _2174 = sin(_2172);
    float _2176 = _2166 * 0.15915493667125701904296875;
    float _2178 = _2130;
    float _2180 = _2118;
    float _2182 = _2126;
    if (_2150)
    {
        _2178 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2184 = _2178;
    float _2186 = fma(_2164, _2160, _2164);
    float _2188 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2168);
    int _2190 = as_type<int>(_2184);
    if (_2150)
    {
        out.m_49.x = 0.0;
    }
    if (_2150)
    {
        float _2192 = _2184 * 5.0;
        _2190 = as_type<int>(_2192);
    }
    int _2194 = _2190;
    float _2196 = _2162 * 6.283185482025146484375;
    float _2198 = cos(_2196);
    float _2200 = fma(_2186, _1440, _2188);
    if (_2150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6807 = as_type<float>(_2194);
        out.gl_Position.z = _6807;
    }
    float _2202 = _2200 * 0.15915493667125701904296875;
    float _2204 = _2176 * 6.283185482025146484375;
    float _2206 = sin(_2204);
    float _2208 = _2176 * 6.283185482025146484375;
    float _2210 = cos(_2208);
    if (_2150)
    {
        return out;
    }
    float _2212 = _2202 * 6.283185482025146484375;
    float _2214 = cos(_2212);
    float _2216 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2218 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2220 = _2174 * _2206;
    float _2222 = _2198 * _2210;
    float _2224 = _2216 * _2066;
    float _2226 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2228 = _2174 * _2210;
    float _2230 = _2202 * 6.283185482025146484375;
    float _2232 = sin(_2230);
    float _2234 = _2224 * _2218;
    float _2236 = _2198 * _2206;
    float _2238 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2240 = _2238 * 0.5;
    float _2242 = _2198 * _2214;
    float _2244 = _2210 * _2214;
    float _2246 = _2174 * _2214;
    float _2248 = _2206 * _2214;
    float _2250 = _2080 * _2226;
    float _2252 = _2242 * _2234;
    float _2254 = fma(_2232, _2222, _2220);
    float _2256 = -_2228;
    float _2258 = fma(_2232, _2236, _2256);
    float _2260 = -_2234;
    float _2262 = _2232 * _2260;
    float _2264 = -_2236;
    float _2266 = fma(_2232, _2228, _2264);
    float _2268 = fma(_2254, _2250, _2252);
    float _2270 = _2246 * _2234;
    float _2272 = fma(_2244, _2250, _2262);
    float _2274 = fma(_2258, _2240, _2268);
    float _2276 = fma(_2232, _2220, _2222);
    float _2278 = fma(_2266, _2250, _2270);
    float _2280 = fma(_2248, _2240, _2272);
    float _2282 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2284 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2286 = fma(_2276, _2240, _2278);
    float _2288 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2282);
    float _2290 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2284);
    float _2292 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2288);
    float _2294 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2290);
    float _2296 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2298 = _2294 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2300 = _1682 + _2296;
    float _2302 = _1672 + _2298;
    float _2304 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2306 = _2100 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2310 = _2300 + _2308;
    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2314 = _2302 + _2312;
    float _2316 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2304);
    float _2318 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2306);
    float _2320 = _2310 * _2310;
    float _2322 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2316);
    float _2324 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2318);
    float _2326 = fma(_2314, _2314, _2320);
    float _2328 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2330 = sqrt(_2326);
    float _2332 = _1662 + _2328;
    bool _2334 = _2330 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2336 = _2322;
    float _2338 = _2328;
    float _2340 = _2306;
    float _2342 = _2250;
    if (!_2334)
    {
        _2336 = _2302;
    }
    float _2344 = _2336;
    float _2346 = _2344;
    if (!_2334)
    {
        _2338 = _2300;
    }
    float _2348 = _2338;
    float _2350 = _2348;
    if (!_2334)
    {
        _2340 = _2332;
    }
    float _2352 = _2340;
    bool _2354 = !_2334;
    float _2356 = _2352;
    if (!_2354)
    {
        float _2358 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2362 = _2330 + _2360;
        float _2364 = rsqrt(_2326);
        float _2366 = _2362 * _2358;
        float _2368 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2370 = _2366 * 0.15915493667125701904296875;
        float _2372 = _2370 * 6.283185482025146484375;
        float _2374 = cos(_2372);
        float _2376 = _2370 * 6.283185482025146484375;
        float _2378 = sin(_2376);
        float _2380 = _2374 + (-1.0);
        float _2382 = fma(_2378, _2368, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2384 = _2380 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2386 = _2364 * _2382;
        float _2388 = fma(_2332, _2374, _2384);
        float _2390 = fma(_2314, _2386, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2392 = fma(_2310, _2386, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2356 = _2388;
        _2346 = _2390;
        _2350 = _2392;
        _2342 = _2370;
    }
    float _2394 = _2356;
    float _2396 = _2346;
    float _2398 = _2350;
    float _2400 = _2342;
    float _2402 = -_1662;
    float _2404 = _2402 + _2394;
    float _2406 = -_1672;
    float _2408 = _2406 + _2396;
    float _2410 = -_1682;
    float _2412 = _2410 + _2398;
    float _2414 = _2324 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2416 = _2404 * _2404;
    float _2418 = _2100 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2420 = 1.0 / _2414;
    float _2422 = fma(_2408, _2408, _2416);
    float _2424 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2418);
    bool _2426 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2428 = isnan(0.5);
    bool _2430 = _2426 || _2428;
    bool _2432 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2434 = _2430 || _2432;
    float _2436 = fma(_2412, _2412, _2422);
    float _2438 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2424);
    bool _2440 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2442 = isnan(0.5);
    bool _2444 = _2440 || _2442;
    bool _2446 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2448 = _2444 || _2446;
    float _2450 = sqrt(_2436);
    float _2452 = _2438 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2454 = _2452 + _2414;
    float _2456 = _2454 * _2420;
    float _2458 = _2456 * 0.5;
    bool _2460 = _2450 > 0.0;
    float _2462 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2464 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2462);
    float _2466 = 1.0 / _2464;
    float _2468 = _2458;
    float _2470 = _2420;
    float _2472 = _2400;
    if (!_2460)
    {
        _2468 = _2396;
    }
    float _2474 = _2468;
    float _2476 = _2474;
    if (!_2460)
    {
        _2470 = _2394;
    }
    float _2478 = _2470;
    float _2480 = _2478;
    if (!_2460)
    {
        _2472 = _2398;
    }
    float _2482 = _2472;
    bool _2484 = !_2460;
    float _2486 = _2482;
    float _2488 = _2482;
    if (!_2484)
    {
        float _2490 = _211 * _211;
        float _2492 = fma(_209, _209, _2490);
        float _2494 = rsqrt(_2436);
        float _2496 = fma(_213, _213, _2492);
        float _2498 = sqrt(_2496);
        float _2500 = _2408 * _2494;
        float _2502 = _2404 * _2494;
        float _2504 = _2412 * _2494;
        bool _2506 = _2498 > 0.0;
        float _2508 = _2494;
        float _2510 = _2498;
        if (!_2506)
        {
            _2508 = _2396;
        }
        float _2512 = _2508;
        _2476 = _2512;
        if (!_2506)
        {
            _2510 = _2394;
        }
        float _2514 = _2510;
        _2480 = _2514;
        if (!_2506)
        {
            _2486 = _2398;
        }
        float _2516 = _2486;
        bool _2518 = !_2506;
        _2488 = _2516;
        if (!_2518)
        {
            float _2520 = rsqrt(_2496);
            float _2522 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2524 = _211 * _2520;
            float _2526 = _209 * _2520;
            float _2528 = _2502 * _2524;
            float _2530 = _213 * _2520;
            float _2532 = fma(_2500, _2526, _2528);
            float _2534 = _2522 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2536 = fma(_2504, _2530, _2532);
            float _2538 = _2536 * _2534;
            float _2540 = fma(_209, _2538, _2396);
            float _2542 = fma(_211, _2538, _2394);
            float _2544 = fma(_213, _2538, _2398);
            _2476 = _2540;
            _2480 = _2542;
            _2488 = _2544;
        }
    }
    float _2546 = _2476;
    float _2548 = _2480;
    float _2550 = _2488;
    float _2552 = -_1826;
    float _2554 = _2552 + _2546;
    float _2556 = -_1824;
    float _2558 = _2556 + _2548;
    float _2560 = -_1828;
    float _2562 = _2560 + _2550;
    float _2564 = _2558;
    float _2566 = _2554;
    float _2568 = _2562;
    if (_2448)
    {
        _221 = 1.0;
    }
    float _2570 = _221;
    float _2572 = _2570;
    if (!_2434)
    {
        float _2574 = _2110 * _2110;
        float _2576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2578 = -_1682;
        float _2580 = _2578 + _2550;
        float _2582 = -_1662;
        float _2584 = _2582 + _2548;
        float _2586 = fma(_2118, _2118, _2574);
        float _2588 = fma(_2126, _2126, _2586);
        float _2590 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2592 = sqrt(_2588);
        float _2594 = 1.0 / _2066;
        float _2596 = precise::min(_2592, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2598 = _2596 * _2576;
        float _2600 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2602 = -_1672;
        float _2604 = _2602 + _2546;
        float _2606 = _2598 * _2594;
        float _2608 = _2600 * _2606;
        float _2610 = _2580 * _2606;
        float _2612 = fma(_2584, _2608, _2100);
        float _2614 = fma(_2604, _2608, _2106);
        float _2616 = fma(_2600, _2610, _2114);
        _2564 = _2612;
        _2566 = _2614;
        _2568 = _2616;
        _2180 = _2592;
        _1760 = _2610;
    }
    float _2618 = _2564;
    float _2620 = _2566;
    float _2622 = _2568;
    float _2624 = _2180;
    float _2626 = _1760;
    float _2628 = _2624;
    float _2630 = _2626;
    if (_2448)
    {
        _1870 = 1.0;
    }
    float _2632 = _1870;
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2636 = _2466 * _2634;
    float _2638 = _2632;
    if (!_2448)
    {
        float _2640 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2642 = _2640 * 0.15915493667125701904296875;
        float _2644 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2646 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2648 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2646;
        float _2650 = _2642 * 6.283185482025146484375;
        float _2652 = cos(_2650);
        float _2654 = _2644 * 0.15915493667125701904296875;
        float _2656 = _2642 * 6.283185482025146484375;
        float _2658 = sin(_2656);
        float _2660 = 1.0 / _2652;
        float _2662 = _2654 * 6.283185482025146484375;
        float _2664 = cos(_2662);
        float _2666 = _2658 * _2660;
        float _2668 = _2654 * 6.283185482025146484375;
        float _2670 = sin(_2668);
        float _2672 = _2664 * _2666;
        float _2674 = 1.0 / _2648;
        float _2676 = 1.0 / _2672;
        float _2678 = _2670 * _2676;
        float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2682 = fma(_2636, _2678, _2680);
        float _2684 = _2682 * _2674;
        float _2686 = precise::clamp(_2684, 0.0, 1.0);
        _2182 = _2654;
        _2628 = _2666;
        _2572 = _2686;
    }
    float _2688 = _2182;
    float _2690 = _2628;
    float _2692 = _2572;
    float _2694 = _2688;
    float _2696 = _2690;
    if (!_2448)
    {
        float _2698 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2700 = _2698 * 0.15915493667125701904296875;
        float _2702 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2704 = _2700 * 6.283185482025146484375;
        float _2706 = cos(_2704);
        float _2708 = _2702 * 0.15915493667125701904296875;
        float _2710 = _2700 * 6.283185482025146484375;
        float _2712 = sin(_2710);
        float _2714 = 1.0 / _2706;
        float _2716 = _2708 * 6.283185482025146484375;
        float _2718 = cos(_2716);
        float _2720 = _2712 * _2714;
        float _2722 = _2708 * 6.283185482025146484375;
        float _2724 = sin(_2722);
        float _2726 = _2718 * _2720;
        float _2728 = 1.0 / _2726;
        float _2730 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2732 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2730;
        float _2734 = 1.0 / _2732;
        float _2736 = _2724 * _2728;
        float _2738 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2740 = fma(_2636, _2736, _2738);
        float _2742 = _2740 * _2734;
        float _2744 = precise::clamp(_2742, 0.0, 1.0);
        float _2746 = -_2744;
        float _2748 = _2746 + 1.0;
        _2694 = _2714;
        _2696 = _2726;
        _2638 = _2748;
    }
    float _2750 = _2694;
    float _2752 = _2696;
    float _2754 = _2638;
    float _2756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2758 = _2618 + _2756;
    float _2760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2762 = _2620 + _2760;
    float _2764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2766 = _2622 + _2764;
    float _2768 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2770 = _2758 * _2758;
    float _2772 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2768);
    float _2774 = fma(_2762, _2762, _2770);
    float _2776 = fma(_2766, _2766, _2774);
    float _2778 = rsqrt(_2776);
    float _2780 = sqrt(_2776);
    float _2782 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2784 = _2762 * _2782;
    float _2786 = _2766 * _2782;
    float _2788 = _2784 * _2784;
    float _2790 = _2786 * _2786;
    float _2792 = _2788 + _2790;
    float _2794 = sqrt(_2792);
    bool _2796 = _2794 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2800 = _2794 + _2798;
    float _2802 = _2750;
    float _2804 = _2792;
    float _2806 = _2800;
    float _2808 = _2752;
    float _2810 = _2758;
    if (_2796)
    {
        float _2812 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2802 = _2812;
    }
    float _2814 = _2802;
    if (_2796)
    {
        float _2816 = rsqrt(_2792);
        _2804 = _2816;
    }
    float _2818 = _2804;
    float _2820 = _2818;
    if (_2796)
    {
        float _2822 = _2800 * _2814;
        _2806 = _2822;
    }
    float _2824 = _2806;
    if (_2796)
    {
        float _2826 = _2824 * 0.15915493667125701904296875;
        _2808 = _2826;
    }
    float _2828 = _2808;
    float _2830 = _2766;
    float _2832 = _2828;
    if (_2796)
    {
        float _2834 = _2828 * 6.283185482025146484375;
        float _2836 = sin(_2834);
        _2830 = _2836;
    }
    float _2838 = _2830;
    float _2840 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2842 = precise::max(0.0, _2840);
    float _2844 = _2814;
    if (_2796)
    {
        float _2846 = _2828 * 6.283185482025146484375;
        float _2848 = cos(_2846);
        _2844 = _2848;
    }
    float _2850 = _2844;
    float _2852 = -_2782;
    float _2854 = -_2842;
    float _2856 = fma(_2758, _2852, _2854);
    float _2858 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2796)
    {
        float _2860 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2810 = _2860;
    }
    float _2862 = _2810;
    float _2864 = _2862;
    if (!_2796)
    {
        _2832 = _2784;
    }
    float _2866 = _2832;
    float _2868 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2870 = _2838;
    float _2872 = _2866;
    if (_2796)
    {
        float _2874 = fma(_2838, _2862, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2870 = _2874;
    }
    float _2876 = _2870;
    float _2878 = _2876;
    if (!_2796)
    {
        _2864 = _2856;
    }
    float _2880 = _2864;
    float _2882 = _2880;
    float _2884 = _2850;
    if (_2796)
    {
        float _2886 = _2850 + (-1.0);
        _2858 = _2886;
    }
    float _2888 = _2858;
    float _2890 = _2888;
    if (_2796)
    {
        float _2892 = _2818 * _2876;
        _2630 = _2892;
    }
    float _2894 = _2630;
    if (!_2796)
    {
        _2820 = _2786;
    }
    float _2896 = _2820;
    float _2898 = _2896;
    if (_2796)
    {
        float _2900 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2890 = _2900;
    }
    float _2902 = _2890;
    if (_2796)
    {
        float _2904 = _2784 * _2894;
        _2872 = _2904;
    }
    float _2906 = _2872;
    if (!_2796)
    {
        _2878 = _2788;
    }
    float _2908 = _2878;
    float _2910 = _2908;
    if (_2796)
    {
        float _2912 = _2786 * _2894;
        _2898 = _2912;
    }
    float _2914 = _2898;
    if (_2796)
    {
        float _2916 = fma(_2856, _2850, _2902);
        _2882 = _2916;
    }
    float _2918 = _2882;
    if (_2796)
    {
        float _2920 = _2906 * _2906;
        _2910 = _2920;
    }
    float _2922 = _2910;
    if (!_2796)
    {
        _2884 = _2790;
    }
    float _2924 = _2884;
    float _2926 = _2924;
    if (_2796)
    {
        float _2928 = _2914 * _2914;
        _2926 = _2928;
    }
    float _2930 = _2926;
    float _2932 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2934 = fma(_2918, _2918, _2922);
    float _2936 = floor(_2868);
    float _2938 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2932);
    float _2940 = _2934 + _2930;
    float _2942 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2944 = fma(_2780, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2942);
    float _2946 = precise::clamp(_2944, 0.0, 1.0);
    float _2948 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2938);
    float _2950 = rsqrt(_2940);
    float _2952 = -_2946;
    float _2954 = _2952 + 1.0;
    float _2956 = _2948 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2958 = fma(_2114, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2960 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2962 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2964 = abs(_2954);
    float _2966 = log2(_2964);
    float _2968 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2970 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2972 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2960);
    float _2974 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2968);
    float _2976 = -_2970;
    float _2978 = fma(_2976, _2962, 1.0);
    float _2980 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2972);
    float _2982 = _2950 * _2906;
    float _2984 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2974);
    float _2986 = _2950 * _2918;
    float _2988 = _2950 * _2914;
    float _2990 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2992 = _2984 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2994 = _2980 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2996 = floor(_2958);
    float _2998 = -_2990;
    float _3000 = fma(_2986, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2998);
    float _3002 = _2992 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3004 = _2966 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3006 = -_2988;
    float _3008 = fma(_3006, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3000);
    float _3010 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2772);
    float _3012 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3002);
    float _3014 = exp2(_3004);
    float _3016 = fma(_3008, -0.5, 0.5);
    float _3018 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3020 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3012);
    float _3022 = fma(_3008, 0.5, 0.5);
    float _3024 = _2992 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3026 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3020);
    float _3028 = log2(_2978);
    float _3030 = -_2996;
    float _3032 = _2958 + _3030;
    float _3034 = fma(_3022, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3036 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3024);
    float _3038 = fma(_3022, _3034, -0.212114393711090087890625);
    float _3040 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3036);
    float _3042 = 1.0 / _3026;
    float _3044 = -_2936;
    float _3046 = _2868 + _3044;
    float _3048 = _2992 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3050 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3048);
    float _3052 = _2986 + 1.0;
    float _3054 = sqrt(_3016);
    float _3056 = _3028 * 0.693147182464599609375;
    float _3058 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3050);
    float _3060 = -_2986;
    float _3062 = fma(_3014, _3052, _3060);
    float _3064 = fma(_3022, _3038, 1.570728778839111328125);
    float2 _8160 = float2(_3046, _3032);
    float _3066 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8160, float2(0.0), isnan(_8160)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8160, float2(0.0), isnan(_8160)), level(0.0)).x;
    float _3068 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3058);
    float _3070 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3040);
    float _3072 = _3056 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3074 = fma(_3062, 0.5, 0.5);
    float _3076 = _3068 * _3042;
    float _3078 = _3070 * _3042;
    float _3080 = fma(_3076, 0.5, 0.5);
    float _3082 = fma(_3078, -0.5, 0.5);
    float _3084 = _3054 * 0.636619746685028076171875;
    float _3086 = -_3064;
    float _3088 = fma(_3084, _3086, 1.0);
    float3 _8205 = float3(_3080, _3082, _3072);
    float _3090 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8205, float3(0.0), isnan(_8205)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8205, float3(0.0), isnan(_8205)), level(0.0)).x;
    float3 _8216 = float3(_3080, _3082, _3072);
    float4 _3093 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8216, float3(0.0), isnan(_8216)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8216, float3(0.0), isnan(_8216)), level(0.0)).xyzw;
    float _3095 = _3093.x;
    float _3097 = _3093.y;
    float _3099 = _3093.z;
    float _3101 = _3093.w;
    float2 _8232 = float2(_3088, _3074);
    float3 _3105 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8232, float2(0.0), isnan(_8232)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8232, float2(0.0), isnan(_8232)), level(0.0)).xyz;
    float _3107 = _3105.x;
    float _3109 = _3105.y;
    float _3111 = _3105.z;
    float _3113 = abs(_2636);
    float _3115 = log2(_3113);
    float _3117 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3119 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3121 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3123 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3125 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3117);
    float _3127 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3119);
    float _3129 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3121);
    float _3131 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3133 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3135 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3137 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3139 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3141 = -_2232;
    float _3143 = fma(_3141, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3123);
    float _3145 = -_2232;
    float _3147 = fma(_3145, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3133);
    float _3149 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3151 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3153 = -_2232;
    float _3155 = fma(_3153, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3131);
    float _3157 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3135);
    float _3159 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3137);
    float _3161 = exp2(_3151);
    float _3163 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3139);
    float _3165 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3155);
    float _3167 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3157);
    float _3169 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3159);
    float _3171 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3163);
    float _3173 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3125);
    float _3175 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3143);
    float _3177 = fma(_3149, _3149, 1.0);
    float _3179 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3181 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3147);
    float _3183 = _2992 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3185 = rsqrt(_3177);
    float _3187 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3127);
    float _3189 = _2966 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3191 = fma(_3161, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3193 = precise::clamp(_3191, 0.0, 1.0);
    float _3195 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3129);
    float _3197 = _3149 * _3175;
    float _3199 = _3193 * _3193;
    float _3201 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3183);
    float _3203 = fma(_3193, -2.0, 3.0);
    float _3205 = _3149 * _3165;
    float _3207 = exp2(_3189);
    float _3209 = fma(_3179, _3187, _3197);
    float _3211 = _3199 * _3203;
    float _3213 = fma(_3179, _3173, _3205);
    float _3215 = _3149 * _3181;
    float _3217 = _3149 * _3185;
    float _3219 = -_3211;
    float _3221 = _3219 + 1.0;
    out.m_78.x = _3173;
    out.m_78.y = _3187;
    out.m_78.z = _3195;
    float _3223 = fma(_3179, _3195, _3215);
    float _3225 = -_3167;
    float _3227 = _3217 * _3225;
    float _3229 = fma(_3221, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3211);
    float _3231 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3201);
    float _3233 = in.m_80.x;
    float _3235 = fma(_3185, _3165, _3227);
    float _3237 = _3167 + _3213;
    float _3239 = _3169 + _3209;
    float _3241 = -_3207;
    float _3243 = _3241 + 1.0;
    out.m_82.x = _2620;
    out.m_82.y = _2618;
    out.m_82.z = _2622;
    bool _3245 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3247 = isnan(_2780);
    bool _3249 = _3245 || _3247;
    bool _3251 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3253 = _3249 || _3251;
    float _3255 = -_3169;
    float _3257 = _3217 * _3255;
    float _3259 = -_3171;
    float _3261 = _3217 * _3259;
    float _3263 = _3243 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3265 = fma(_3185, _3175, _3257);
    bool _3267 = _2636 <= 8000.0;
    bool _3269 = isnan(_2636);
    bool _3271 = _3267 || _3269;
    bool _3273 = isnan(8000.0);
    bool _3275 = _3271 || _3273;
    float _3277 = float(_3275);
    float _3279 = fma(_3185, _3181, _3261);
    float _3281 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3231);
    float _3283 = _3026 * 0.5;
    float _3285 = _3068 + _3026;
    float _3287 = _3277 * _3229;
    out.m_84.x = _3235;
    out.m_84.y = _3265;
    out.m_84.z = _3279;
    float _3289 = _3281 + _3026;
    float _3291 = fma(_3070, -0.5, _3283);
    float _3293 = _3287 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3068;
    out.gl_Position.y = _3070;
    out.gl_Position.z = _3281;
    out.gl_Position.w = _3026;
    float _3295 = _3289 * 0.5;
    float _3297 = _3171 + _3223;
    float _3299 = _3285 * 0.5;
    out.m_86.x = _3237;
    out.m_86.y = _3239;
    out.m_86.z = _3297;
    float _3301 = _3169;
    float _3303 = _3279;
    float _3305 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3253)
    {
        _3301 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3307 = _3301;
    float _3309 = _3307;
    float _3311 = _3307;
    if (!_3253)
    {
        _3303 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3313 = _3303;
    out.m_88.z = _3295;
    out.m_88.w = _3026;
    out.m_90.x = _3299;
    out.m_90.y = _3291;
    out.m_90.z = _3295;
    out.m_90.w = _3026;
    float _3315 = -_3066;
    float _3317 = _3315 + 1.0;
    float _3319 = _3317 * _3293;
    float _3321 = precise::clamp(_3319, 0.0, 1.0);
    float _3323 = -_3321;
    float _3325 = fma(_3323, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3327 = _3097;
    float _3329 = _3313;
    float _3331 = _3313;
    if (!_3253)
    {
        _3305 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3333 = _3305;
    float _3335 = _3325 * _3233;
    float _3337 = _3335 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3339 = _3263 * _3090;
    float _3341 = -_3263;
    float _3343 = _3341 + 1.0;
    float _3345 = _3101 * _3339;
    float _3347 = _3111 * _3339;
    float _3349 = _3101 * _3343;
    out.m_92.x = _3337;
    float _3351 = fma(_3107, _3345, _3095);
    float _3353 = fma(_3109, _3345, _3097);
    float _3355 = fma(_3101, _3347, _3099);
    float _3357 = _2692 * _2754;
    float _3359 = _3339;
    float _3361 = _3357;
    float _3363 = _3333;
    float _3365 = _3333;
    if (!_3253)
    {
        _3359 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3367 = _3359;
    float _3369 = _3367;
    float _3371 = _3367;
    if (!_3253)
    {
        _3327 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3373 = _3327;
    out.m_94.x = _3351;
    out.m_94.y = _3353;
    out.m_94.z = _3355;
    out.m_94.w = _3349;
    float _3375 = _3357 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3377 = _3373;
    float _3379 = _3373;
    if (!_3253)
    {
        _3361 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3381 = _3361;
    bool _3383 = !_3253;
    float _3385 = _3381;
    float _3387 = _3381;
    if (!_3383)
    {
        bool _3389 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3391 = isnan(_2780);
        bool _3393 = _3389 || _3391;
        bool _3395 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3397 = _3393 || _3395;
        if (!_3397)
        {
            float _3399 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3401 = _2780 + _3399;
            float _3403 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3405 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3403;
            float _3407 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3409 = _3407 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3411 = 1.0 / _3405;
            float _3413 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3415 = _3413 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3417 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3419 = _3417 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3421 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3423 = _3421 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3425 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3427 = _3425 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3429 = _3401 * _3411;
            float _3431 = precise::clamp(_3429, 0.0, 1.0);
            float _3433 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3435 = _3433 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3437 = fma(_3431, _3409, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3439 = fma(_3431, _3435, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3441 = fma(_3431, _3415, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3443 = fma(_3431, _3419, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3445 = fma(_3431, _3423, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3447 = fma(_3431, _3427, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3331 = _3441;
            _3379 = _3445;
            _3311 = _3437;
            _3371 = _3443;
            _3365 = _3439;
            _3387 = _3447;
            _3449 = true;
        }
        else
        {
            bool _3451 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3453 = isnan(_2780);
            bool _3455 = _3451 || _3453;
            bool _3457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3459 = _3455 || _3457;
            if (!_3459)
            {
                _3309 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3461 = _3309;
            _3311 = _3461;
            if (!_3459)
            {
                _3329 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3463 = _3329;
            _3331 = _3463;
            if (!_3459)
            {
                _3363 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3465 = _3363;
            _3365 = _3465;
            if (!_3459)
            {
                _3369 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3467 = _3369;
            _3371 = _3467;
            if (!_3459)
            {
                _3377 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3469 = _3377;
            _3379 = _3469;
            if (!_3459)
            {
                _3385 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3471 = _3385;
            bool _3473 = !_3459;
            _3387 = _3471;
            if (!_3473)
            {
                bool _3475 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3477 = isnan(_2780);
                bool _3479 = _3475 || _3477;
                bool _3481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3483 = _3479 || _3481;
                if (!_3483)
                {
                    float _3485 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3487 = _2780 + _3485;
                    float _3489 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3491 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3489;
                    float _3493 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3495 = _3493 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3497 = 1.0 / _3491;
                    float _3499 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3501 = _3499 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3503 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3505 = _3503 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3507 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3509 = _3507 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3511 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3513 = _3511 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3515 = _3487 * _3497;
                    float _3517 = precise::clamp(_3515, 0.0, 1.0);
                    float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3521 = _3519 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3523 = fma(_3517, _3495, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3525 = fma(_3517, _3521, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3527 = fma(_3517, _3501, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3529 = fma(_3517, _3505, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3531 = fma(_3517, _3509, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3533 = fma(_3517, _3513, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3331 = _3527;
                    _3379 = _3531;
                    _3311 = _3523;
                    _3371 = _3529;
                    _3365 = _3525;
                    _3387 = _3533;
                    _3449 = true;
                }
                else
                {
                    _3331 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3379 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3311 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3371 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3365 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3387 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3449 = false;
    float _3535 = _3331;
    float _3537 = _3379;
    float _3539 = _3311;
    float _3541 = _3371;
    float _3543 = _3365;
    float _3545 = _3387;
    float _3547 = fma(_3239, -0.5, 0.5);
    float _3549 = precise::clamp(_3547, 0.0, 1.0);
    float _3551 = -_3535;
    float _3553 = _3551 + _3537;
    float _3555 = _3375 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3557 = -_3539;
    float _3559 = _3557 + _3541;
    float _3561 = fma(_3549, _3553, _3535);
    out.m_96.x = 0.0;
    float _3563 = -_3543;
    float _3565 = _3563 + _3545;
    float _3567 = fma(_3549, _3559, _3539);
    float _3569 = _3561 * 0.586610972881317138671875;
    out.m_49.x = _3555;
    bool _3571 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3573 = fma(_3549, _3565, _3543);
    float _3575 = fma(_3567, 0.298911988735198974609375, _3569);
    bool _3577 = _2692 > 0.0;
    bool _3579 = isnan(_2692);
    bool _3581 = _3577 || _3579;
    bool _3583 = isnan(0.0);
    bool _3585 = _3581 || _3583;
    float _3587 = fma(_3573, 0.114477999508380889892578125, _3575);
    bool _3589 = _2754 <= 0.0;
    bool _3591 = !_3585;
    bool _3593 = _3589 || _3591;
    float _3595 = -_3587;
    float _3597 = _3561 + _3595;
    float _3599 = -_3587;
    float _3601 = _3567 + _3599;
    float _3603 = -_3587;
    float _3605 = _3573 + _3603;
    float _3607 = fma(_3597, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3587);
    float _3609 = fma(_3601, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3587);
    float _3611 = fma(_3605, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3587);
    bool _3613 = !_3571;
    if (!_3613)
    {
        float _3615 = -_2618;
        float _3617 = _3615 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3619 = -_2620;
        float _3621 = _3619 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3623 = -_2622;
        float _3625 = _3623 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3627 = _3617 * _3617;
        float _3629 = fma(_3621, _3621, _3627);
        float _3631 = fma(_3625, _3625, _3629);
        float _3633 = sqrt(_3631);
        float _3635 = rsqrt(_3631);
        float _3637 = -_3633;
        float _3639 = _3637 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3641 = _3639 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3643 = precise::clamp(_3641, 0.0, 1.0);
        float _3645 = _3621 * _3635;
        float _3647 = _3617 * _3635;
        float _3649 = abs(_3643);
        float _3651 = log2(_3649);
        float _3653 = _3625 * _3635;
        float _3655 = _3645 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3657 = _3239 * _3647;
        float _3659 = -_3647;
        float _3661 = -_3655;
        float _3663 = fma(_3659, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3661);
        float _3665 = fma(_3237, _3645, _3657);
        float _3667 = -_3653;
        float _3669 = fma(_3667, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3663);
        float _3671 = fma(_3297, _3653, _3665);
        float _3673 = precise::clamp(_3671, 0.0, 1.0);
        float _3675 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3677 = _3669 + _3675;
        float _3679 = _3651 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3681 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3683 = precise::clamp(_3681, 0.0, 1.0);
        float _3685 = exp2(_3679);
        float _3687 = _3685 * _3683;
        float _3689 = _3673 * _3687;
        float _3691 = _3689 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3693 = _3689 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3695 = _3689 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3691;
        out.m_96.y = _3693;
        out.m_96.z = _3695;
    }
    out.m_98.x = _3609;
    out.m_98.y = _3607;
    out.m_98.z = _3611;
    if (!_3593)
    {
        return out;
    }
    float _3697 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3697;
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
    bool _3449 = false;
    bool _393 = false;
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
        float _3753 = as_type<float>(_131);
        out.gl_Position.z = _3753;
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
        float _3826 = as_type<float>(_173);
        out.gl_Position.z = _3826;
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
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391;
    if (!_371)
    {
        float _375 = in.m_60.x;
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _379 = _375 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _383 = _381 * _377;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _389;
        _393 = true;
    }
    else
    {
        _391 = _167;
    }
    _393 = false;
    float _395 = _391;
    bool _397 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _399 = isnan(_395);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _413 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _415 = isnan(_395);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _431 = _395 + _429;
    float _433 = -_407;
    float _435 = _433 + 1.0;
    float _437 = 1.0 / _411;
    bool _439 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _441 = _423 * _435;
    float _443 = -_423;
    float _445 = _443 + 1.0;
    float _447 = _427 * _437;
    float _449 = fma(_447, _431, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _451 = _449 * _441;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _457 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[115].x, _451);
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _461 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _463 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[116].x, _457);
    float _467 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = _465 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _461;
    out.m_64.y = _463;
    out.m_64.z = _467;
    out.m_64.w = _469;
    bool _471 = !_439;
    if (!_471)
    {
        float _473 = in.m_60.x;
        float _475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _477 = _473 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _479 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _481 = _479 * _475;
        float _483 = floor(_481);
        float _485 = -_483;
        float _487 = _481 + _485;
        _169 = _487;
    }
    float _489 = _169;
    float _491 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _493 = int(_491);
    float _495 = in.m_60.x;
    float _497 = in.m_60.y;
    float _499 = _159 * _141;
    float _501 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _505 = _503 != 0;
    float _507 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _509 = int(_507);
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _513 = float(_493);
    float _515 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _517 = int(_515);
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_505)
    {
        _373 = 1.0;
    }
    float _523 = _373;
    float _525 = _523;
    if (!_505)
    {
        _525 = 7.345489978790283203125;
    }
    float _527 = _525;
    float _529 = float(_509);
    float _531 = 1.0 / _513;
    float _533 = _527 * _495;
    float _535 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _537 = int(_535);
    float _539 = float(uint(_517));
    bool _541 = _517 == 0;
    float _543 = 1.0 / _529;
    float _545 = _531 * _141;
    float _547 = 1.0 / _539;
    float _549 = float(uint(_537));
    int _551 = ~_537;
    int _553 = _551 + 1;
    float _555 = trunc(_545);
    int _557 = int(_555);
    float _559 = _543 * _141;
    int _561 = ~_517;
    int _563 = _561 + 1;
    float _565 = 1.0 / _549;
    int _567 = as_type<int>(_547) + (-2);
    float _569 = trunc(_559);
    int _571 = int(_569);
    float _573 = float(uint(_557));
    float _575 = as_type<float>(_567) * _573;
    int _577 = as_type<int>(_565) + (-2);
    float _579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _581 = ~_537;
    int _583 = _581 + 1;
    float _585 = float(uint(_571));
    float _587 = trunc(_575);
    float _589 = precise::max(_587, 0.0);
    uint _592 = uint(_589);
    float _594 = as_type<float>(_577) * _585;
    float _596 = trunc(_594);
    float _598 = precise::max(_596, 0.0);
    uint _600 = uint(_598);
    float _602 = _579 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _604 = _563 * int(_592);
    int _606 = _604 + _557;
    float _608 = floor(_533);
    float _610 = float(uint(_606));
    int _612 = _583 * int(_600);
    int _614 = _612 + _571;
    float _616 = as_type<float>(_567) * _610;
    float _618 = _610;
    if (_505)
    {
        _618 = 1.0;
    }
    float _620 = _618;
    float _622 = float(uint(_614));
    float _624 = trunc(_616);
    float _626 = precise::max(_624, 0.0);
    uint _628 = uint(_626);
    float _630 = _620;
    float _632 = _622;
    if (!_505)
    {
        _630 = 1.2345600128173828125;
    }
    float _634 = _630;
    float _636 = -_608;
    float _638 = _533 + _636;
    float _640 = as_type<float>(_577) * _622;
    if (_505)
    {
        _632 = _495;
    }
    float _642 = _632;
    float _644 = _642;
    if (!_505)
    {
        _644 = _497;
    }
    float _646 = _644;
    float _648 = trunc(_640);
    float _650 = precise::max(_648, 0.0);
    uint _652 = uint(_650);
    float _654 = _634 * _646;
    int _656 = ~_517;
    int _658 = _656 + 1;
    int _660 = int(_592) + int(_628);
    float _662 = floor(_654);
    float _664 = float(_517);
    float _666 = float(_557);
    int _668 = _658 * _660;
    int _670 = _668 + _557;
    int _672 = int(_600) + int(_652);
    float _674 = _638 * _664;
    float _676 = _664 * _499;
    bool _678 = _666 >= _664;
    bool _680 = isnan(_666);
    bool _682 = _678 || _680;
    bool _684 = isnan(_664);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    bool _690 = uint(_670) >= uint(_517);
    int _692 = _553 * _672;
    int _694 = _692 + _571;
    float _696 = -_662;
    float _698 = _654 + _696;
    float _700 = trunc(_688);
    int _702 = int(_700);
    bool _704 = !_690;
    int _706 = _704 ? 0 : (-1);
    bool _708 = uint(_694) >= uint(_537);
    float _710 = in.m_60.z;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _714 = _712 != 0;
    int _716 = ~_660;
    int _718 = _716 + _706;
    int _720 = _718 + 1;
    float _722 = trunc(_674);
    int _724 = int(_722);
    bool _726 = !_714;
    int _728 = _726 ? 0 : 1;
    float _730 = float(_537);
    int _732 = abs(_728);
    int _734 = _517 * _720;
    int _736 = _734 + _557;
    float _738 = float(_571);
    float _740 = _730 * _499;
    int _742 = ~_702;
    int _744 = _742 + 1;
    int _746 = _744 + 1;
    bool _748 = !_708;
    int _750 = _748 ? 0 : (-1);
    bool _752 = !_541;
    int _754 = _752 ? _736 : (-1);
    float _756 = trunc(_740);
    int _758 = int(_756);
    bool _760 = _738 >= _730;
    bool _762 = isnan(_738);
    bool _764 = _760 || _762;
    bool _766 = isnan(_730);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = _698 * _730;
    bool _774 = _497 > 0.5;
    int _776 = _754 * _746;
    int _778 = ~_672;
    int _780 = _778 + _750;
    int _782 = _780 + 1;
    int _784 = _724 * _732;
    int _786 = _784 + _557;
    bool _788 = _710 > 0.5;
    float _790 = trunc(_772);
    int _792 = int(_790);
    float _794 = -_217;
    int _796 = _774 ? as_type<int>(_794) : as_type<int>(_217);
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _800 = _798 != 0;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _804 = _802 != 0;
    float _806 = -_207;
    int _808 = _788 ? as_type<int>(_806) : as_type<int>(_207);
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _812 = _810 != 0;
    float _814 = trunc(_770);
    int _816 = int(_814);
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _820 = _818 != 0;
    bool _822 = !_800;
    float _824 = _822 ? _217 : as_type<float>(_796);
    bool _826 = !_804;
    float _828 = _826 ? _207 : as_type<float>(_808);
    bool _830 = !_812;
    int _832 = _830 ? 0 : 1;
    float _834 = trunc(_676);
    int _836 = int(_834);
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _840 = _838 != 0;
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _844 = _842 != 0;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _848 = _846 != 0;
    float _850 = _824 + 0.5;
    int _852 = abs(_832);
    int _854 = _517 + (-1);
    bool _856 = !_844;
    int _858 = _856 ? 0 : 1;
    bool _860 = !_820;
    int _862 = _860 ? 0 : 1;
    int _864 = _702 * _854;
    int _866 = _864 + _776;
    bool _868 = !_840;
    int _870 = _868 ? 0 : 1;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _874 = _872 != 0;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _878 = _876 != 0;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _882 = _880 != 0;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _886 = _884 != 0;
    int _888 = abs(_858);
    int _890 = _792 * _852;
    int _892 = _890 + _571;
    int _894 = abs(_870);
    int _896 = _537 * _782;
    int _898 = _896 + _571;
    bool _900 = !_848;
    int _902 = _900 ? 0 : 1;
    bool _904 = !_878;
    int _906 = _904 ? 0 : 1;
    bool _908 = _537 == 0;
    int _910 = abs(_902);
    int _912 = _866 * _888;
    int _914 = ~_816;
    int _916 = _914 + 1;
    int _918 = _916 + 1;
    bool _920 = !_908;
    int _922 = _920 ? _898 : (-1);
    int _924 = _836 * _894;
    int _926 = _924 + _912;
    int _928 = _537 + (-1);
    int _930 = _922 * _918;
    int _932 = abs(_862);
    int _934 = _786 * _910;
    int _936 = _934 + _926;
    int _938 = abs(_906);
    int _940 = _816 * _928;
    int _942 = _940 + _930;
    bool _944 = !_874;
    int _946 = _944 ? 0 : 1;
    int _948 = _724 * _932;
    int _950 = _948 + _936;
    bool _952 = !_882;
    int _954 = _952 ? 0 : 1;
    int _956 = abs(_946);
    bool _958 = !_886;
    int _960 = _958 ? 0 : 1;
    int _962 = abs(_954);
    int _964 = _942 * _938;
    float _966 = float(uint(_950));
    int _968 = abs(_960);
    int _970 = _758 * _956;
    int _972 = _970 + _964;
    float _974 = as_type<float>(_567) * _966;
    int _976 = ~_517;
    int _978 = _976 + 1;
    int _980 = _892 * _962;
    int _982 = _980 + _972;
    bool _984 = _517 == 0;
    float _986 = trunc(_974);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    int _992 = _792 * _968;
    int _994 = _992 + _982;
    int _996 = ~_517;
    int _998 = _996 + 1;
    int _1000 = ~_537;
    int _1002 = _1000 + 1;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1006 = float(uint(_994));
    float _1008 = float(uint(_786));
    float _1010 = as_type<float>(_577) * _1006;
    float _1012 = as_type<float>(_567) * _1008;
    int _1014 = _998 * int(_990);
    int _1016 = _1014 + _950;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1022 = trunc(_1010);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    float _1028 = float(uint(_1016));
    float _1030 = as_type<float>(_567) * _1028;
    float _1032 = trunc(_1012);
    float _1034 = precise::max(_1032, 0.0);
    uint _1036 = uint(_1034);
    int _1038 = _1002 * int(_1026);
    int _1040 = _1038 + _994;
    float _1042 = trunc(_1030);
    float _1044 = precise::max(_1042, 0.0);
    uint _1046 = uint(_1044);
    float _1048 = _497 * 2.0;
    float _1050 = float(uint(_1040));
    float _1052 = floor(_1048);
    float _1054 = as_type<float>(_577) * _1050;
    int _1056 = ~_537;
    int _1058 = _1056 + 1;
    int _1060 = int(_990) + int(_1046);
    float _1062 = trunc(_1054);
    float _1064 = precise::max(_1062, 0.0);
    uint _1066 = uint(_1064);
    int _1068 = _978 * _1060;
    int _1070 = _1068 + _950;
    float _1072 = 1.0 / _1020;
    bool _1074 = uint(_1070) >= uint(_517);
    bool _1076 = !_1074;
    int _1078 = _1076 ? 0 : (-1);
    int _1080 = ~_1060;
    int _1082 = _1080 + _1078;
    int _1084 = _1082 + 1;
    float _1086 = _710 * 2.0;
    int _1088 = int(_1026) + int(_1066);
    float _1090 = float(uint(_892));
    int _1092 = _517 * _1084;
    int _1094 = _1092 + _950;
    float _1096 = _497 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1098 = _1058 * _1088;
    int _1100 = _1098 + _994;
    float _1102 = floor(_1086);
    float _1104 = as_type<float>(_577) * _1090;
    bool _1106 = !_984;
    int _1108 = _1106 ? _1094 : (-1);
    float _1110 = fma(_1096, -2.0, _1004);
    bool _1112 = uint(_1100) >= uint(_537);
    int _1114 = _1108 & 3;
    bool _1116 = _1114 != 0;
    int _1118 = _1108 & 3;
    bool _1120 = _1118 != 0;
    float _1122 = trunc(_1104);
    float _1124 = precise::max(_1122, 0.0);
    uint _1126 = uint(_1124);
    bool _1128 = !_1112;
    int _1130 = _1128 ? 0 : (-1);
    int _1132 = _1116 ? 0 : 1;
    bool _1134 = uint(_1118) >= 2u;
    bool _1136 = uint(_1118) > 1u;
    int _1138 = ~_1088;
    int _1140 = _1138 + _1130;
    int _1142 = _1140 + 1;
    int _1144 = _1134 ? 0 : 1;
    bool _1146 = _1118 != 3;
    int _1148 = _537 * _1142;
    int _1150 = _1148 + _994;
    int _1152 = ~_1132;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1160 = _1158 != 0;
    bool _1162 = !_908;
    int _1164 = _1162 ? _1150 : (-1);
    int _1166 = _1156;
    float _1168 = as_type<float>(_786);
    if (!_1136)
    {
        int _1170 = ~_1132;
        int _1172 = _1170 + 1;
        _1166 = _1172;
    }
    int _1174 = _1166;
    int _1176 = _1164 & 3;
    bool _1178 = _1176 != 0;
    int _1180 = ~_1144;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    int _1186 = _1184;
    if (_1146)
    {
        int _1188 = ~_1144;
        int _1190 = _1188 + 1;
        _1186 = _1190;
    }
    int _1192 = _1186;
    bool _1194 = uint(_1176) > 1u;
    float _1196 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1198 = log2(_1196);
    int _1200 = _1164 & 3;
    bool _1202 = _1200 != 0;
    if (_1160)
    {
        _521 = 0;
    }
    int _1204 = _521;
    int _1206 = _1202 ? 0 : 1;
    int _1208 = _1204;
    if (!_1160)
    {
        _1208 = 2;
    }
    int _1210 = _1208;
    int _1212 = ~_1206;
    int _1214 = _1212 + 1;
    int _1216 = _1214 + 1;
    bool _1218 = _497 > 0.5;
    int _1220 = _1216;
    if (!_1194)
    {
        int _1222 = ~_1206;
        int _1224 = _1222 + 1;
        _1220 = _1224;
    }
    int _1226 = _1220;
    float _1228 = _495 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1230 = _1198 * _141;
    bool _1232 = _1176 != 3;
    bool _1234 = _1210 != 2;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1238 = -_207;
    float _1240 = _1218 ? _1238 : _207;
    float _1242 = exp2(_1230);
    bool _1244 = uint(_1176) >= 2u;
    float _1246 = -_1236;
    float _1248 = fma(_1228, 2.0, _1246);
    float _1250 = _495 * 2.0;
    float _1252 = _1244 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1254 = floor(_1250);
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1258 = _1256 != 0;
    int _1260 = ~as_type<int>(_1252);
    int _1262 = _1260 + 1;
    int _1264 = _1262 + 1;
    int _1266 = _1264;
    float _1268 = _1252;
    float _1270 = _1240;
    if (_1232)
    {
        int _1272 = ~as_type<int>(_1252);
        int _1274 = _1272 + 1;
        _1266 = _1274;
    }
    int _1276 = _1266;
    if (_1234)
    {
        _1268 = _495;
    }
    float _1278 = _1268;
    float _1280 = _1278;
    if (!_1234)
    {
        _1280 = _710;
    }
    float _1282 = _1280;
    bool _1284 = !_1258;
    int _1286 = _1284 ? 0 : 1;
    int _1288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1290 = _1288 != 0;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1294 = _495 > 0.5;
    float _1296 = -_1242;
    float _1298 = _1296 + 1.0;
    bool _1300 = !_1290;
    float _1302 = _1300 ? _207 : _1240;
    float _1304 = -_511;
    float _1306 = fma(_1292, 2.0, _1304);
    int _1308 = ~_517;
    int _1310 = _1308 + 1;
    float _1312 = -_217;
    int _1314 = _1294 ? as_type<int>(_1312) : as_type<int>(_217);
    float _1316 = -_141;
    float _1318 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1306);
    bool _1320 = _1254 > 0.0;
    int _1322 = _1310 * int(_1036);
    int _1324 = _1322 + _786;
    bool _1326 = _1254 >= 0.0;
    bool _1328 = isnan(_1254);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(0.0);
    bool _1334 = _1330 || _1332;
    float _1336 = fma(_602, _850, _1318);
    int _1338 = ~_537;
    int _1340 = _1338 + 1;
    if (_1234)
    {
        _1270 = _497;
    }
    float _1342 = _1270;
    float _1344 = _1342;
    if (!_1234)
    {
        _1344 = _495;
    }
    float _1346 = _1344;
    int _1348 = _1340 * int(_1126);
    int _1350 = _1348 + _892;
    float _1352 = float(uint(_1324));
    bool _1354 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1356 = isnan(0.0);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1362 = _1358 || _1360;
    float _1364 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1366 = float(uint(_1350));
    float _1368 = as_type<float>(_567) * _1352;
    float _1370 = _1362 ? _1298 : 0.0;
    float _1372 = fma(_1364, -2.0, _519);
    bool _1374 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1376 = isnan(1.0);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1382 = _1378 || _1380;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1386 = 1.0 + _1384;
    float _1388 = as_type<float>(_577) * _1366;
    float _1390 = trunc(_1368);
    float _1392 = precise::max(_1390, 0.0);
    uint _1394 = uint(_1392);
    float _1396 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1372);
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1400 = 1.0 / _1386;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1406 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1398);
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1410 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1402);
    float _1412 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1404);
    float _1414 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1406);
    float _1416 = trunc(_1388);
    float _1418 = precise::max(_1416, 0.0);
    uint _1420 = uint(_1418);
    float _1422 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1408);
    float _1424 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1110);
    float _1426 = -_141;
    float _1428 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1248);
    float _1430 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1410);
    float _1432 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1412);
    float _1434 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1422);
    int _1436 = int(_1036) + int(_1394);
    if (_1382)
    {
        float _1438 = _1370 * _1400;
        _163 = _1438;
    }
    float _1440 = _163;
    int _1442 = ~_517;
    int _1444 = _1442 + 1;
    float _1446 = in.m_46.x;
    float _1448 = in.m_46.y;
    float _1450 = in.m_46.z;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1454 = _1452 != 0;
    float _1456 = _1302 + (-0.5);
    int _1458 = ~_537;
    int _1460 = _1458 + 1;
    int _1462 = _1444 * _1436;
    int _1464 = _1462 + _786;
    int _1466 = _1334 ? 0 : 1;
    float _1468 = -_1414;
    float _1470 = _1468 + 1.0;
    bool _1472 = !_1454;
    float _1474 = _1472 ? _217 : as_type<float>(_1314);
    float _1476 = -_1456;
    float _1478 = -_1424;
    float _1480 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1478);
    bool _1482 = _1052 > 0.0;
    float _1484 = -_1430;
    float _1486 = _1484 + 1.0;
    bool _1488 = _1052 >= 0.0;
    bool _1490 = isnan(_1052);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan(0.0);
    bool _1496 = _1492 || _1494;
    float _1498 = -_1432;
    float _1500 = _1498 + 1.0;
    int _1502 = int(_1126) + int(_1420);
    int _1504 = ~_1466;
    int _1506 = _1504 + 1;
    int _1508 = _1506 + 1;
    int _1510 = _1508;
    if (!_1320)
    {
        int _1512 = ~_1466;
        int _1514 = _1512 + 1;
        _1510 = _1514;
    }
    int _1516 = _1510;
    bool _1518 = uint(_1464) >= uint(_517);
    int _1520 = _1460 * _1502;
    int _1522 = _1520 + _892;
    float _1524 = _1448 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1526 = _1496 ? 0 : 1;
    float _1528 = _1448 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1530 = !_1518;
    int _1532 = _1530 ? 0 : (-1);
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1534;
    bool _1538 = uint(_1522) >= uint(_537);
    float _1540 = fma(_1446, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1524);
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1544 = _1542 != 0;
    float _1546 = _1536 * _1072;
    bool _1548 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1550 = isnan(_489);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1556 = _1552 || _1554;
    float _1558 = float(_1556);
    float _1560 = fma(_1446, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1528);
    int _1562 = ~_1526;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    int _1568 = _1566;
    if (!_1482)
    {
        int _1570 = ~_1526;
        int _1572 = _1570 + 1;
        _1568 = _1572;
    }
    int _1574 = _1568;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1578 = _489 + _1576;
    bool _1580 = !_1538;
    int _1582 = _1580 ? 0 : (-1);
    float _1584 = -_1558;
    float _1586 = _1584 + 1.0;
    int _1588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1590 = _1588 != 0;
    int _1592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1594 = _1592 != 0;
    int _1596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1598 = _1596 != 0;
    float _1600 = _1448 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1602 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1604 = isnan(_489);
    bool _1606 = _1602 || _1604;
    bool _1608 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1610 = _1606 || _1608;
    float _1612 = float(_1610);
    bool _1614 = !_1120;
    int _1616 = _1614 ? 0 : 1;
    float _1618 = fma(_1446, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1600);
    float _1620 = fma(_1546, _1578, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1622 = _1612 * _1586;
    float _1624 = _1474 + 0.5;
    float _1626 = fma(_1450, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1618);
    bool _1628 = _1102 >= 0.0;
    bool _1630 = isnan(_1102);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan(0.0);
    bool _1636 = _1632 || _1634;
    float _1638 = _1620 * _1622;
    float _1640 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1428);
    float _1642 = -_1612;
    float _1644 = _1642 + 1.0;
    int _1646 = _1636 ? 0 : 1;
    bool _1648 = _1102 > 0.0;
    float _1650 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1638);
    float _1652 = -_1470;
    float _1654 = fma(_1474, _1652, _1640);
    float _1656 = fma(_1302, _1486, _1480);
    float _1658 = fma(_1450, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1540);
    float _1660 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1650);
    float _1662 = _1626 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1664 = _1108 >> 31;
    float _1666 = _497 + _495;
    int _1668 = _1164 >> 31;
    float _1670 = fma(_1450, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1560);
    float _1672 = _1658 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1676 = _1662 + _1674;
    int _1678 = _1664 & 3;
    float _1680 = _1666 + (-1.0);
    float _1682 = _1670 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1684 = _1668 & 3;
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1688 = _1672 + _1686;
    float _1690 = _1676 * _1676;
    int _1692 = _1108 + _1678;
    out.m_66.x = _1654;
    out.m_66.y = _1656;
    float _1694 = fma(_1680, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1698 = _1682 + _1696;
    float _1700 = fma(_1688, _1688, _1690);
    int _1702 = _1692 >> 2;
    float _1704 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1706 = !_1178;
    int _1708 = _1706 ? 0 : 1;
    float _1710 = fma(_1698, _1698, _1700);
    int _1712 = _1702 << 4;
    int _1714 = _1712 + 368;
    float _1716 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1704);
    int _1718 = _1164 + _1684;
    float _1720 = _501 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1722 = _1118 != 3;
    float _1724 = rsqrt(_1710);
    int _1726 = _1718 >> 2;
    float _1728 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1716);
    int _1730 = ~_1646;
    int _1732 = _1730 + 1;
    int _1734 = _1732 + 1;
    float _1736 = _1660 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1738 = _1726 << 4;
    int _1740 = _1738 + 512;
    uint _1742 = uint(int(uint(_1714) >> uint(2)));
    uint _1744 = uint(int(uint(int(_1742)) >> uint(2)));
    int _1746 = int(_1742) & 3;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[int(_1744)][_1746];
    int _1750 = int(_1742) + 1;
    uint _1752 = uint(int(uint(_1750) >> uint(2)));
    int _1754 = _1750 & 3;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[int(_1752)][_1754];
    int _1758 = _1734;
    float _1760 = _1682;
    if (!_1648)
    {
        int _1762 = ~_1646;
        int _1764 = _1762 + 1;
        _1758 = _1764;
    }
    int _1766 = _1758;
    float _1768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1770 = !_1722;
    int _1772 = _1770 ? 0 : (-1);
    out.m_68.w = _1736;
    bool _1774 = _1176 != 3;
    int _1776 = abs(_1192);
    uint _1778 = uint(int(uint(_1740) >> uint(2)));
    uint _1780 = uint(int(uint(int(_1778)) >> uint(2)));
    int _1782 = int(_1778) & 3;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[int(_1780)][_1782];
    int _1786 = int(_1778) + 1;
    uint _1788 = uint(int(uint(_1786) >> uint(2)));
    int _1790 = _1786 & 3;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[int(_1788)][_1790];
    bool _1794 = !_1774;
    int _1796 = _1794 ? 0 : (-1);
    bool _1798 = _1728 >= 0.0;
    float _1800 = _1720 * _1724;
    int _1802 = abs(_1276);
    int _1804 = abs(_1286);
    int _1806 = _1714 + 8;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    uint _1810 = uint(int(uint(int(_1808)) >> uint(2)));
    int _1812 = int(_1808) & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    int _1816 = int(_1808) + 1;
    uint _1818 = uint(int(uint(_1816) >> uint(2)));
    int _1820 = _1816 & 3;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[int(_1818)][_1820];
    float _1824 = _1676 * _1800;
    float _1826 = _1688 * _1800;
    float _1828 = _1698 * _1800;
    float _1830 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1832 = -_1824;
    float _1834 = _1676 + _1832;
    float _1836 = -_1826;
    float _1838 = _1688 + _1836;
    float _1840 = -_1828;
    float _1842 = _1698 + _1840;
    int _1844 = _1740 + 8;
    uint _1846 = uint(int(uint(_1844) >> uint(2)));
    uint _1848 = uint(int(uint(int(_1846)) >> uint(2)));
    int _1850 = int(_1846) & 3;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[int(_1848)][_1850];
    int _1854 = int(_1846) + 1;
    uint _1856 = uint(int(uint(_1854) >> uint(2)));
    int _1858 = _1854 & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    float _1862 = _1834 * _1834;
    float _1864 = _828 + (-0.5);
    bool _1866 = !_1590;
    int _1868 = _1866 ? 0 : 1;
    float _1870 = _1826;
    if (_1798)
    {
        out.m_49.x = 0.0;
    }
    float _1872 = fma(_1838, _1838, _1862);
    float _1874 = -_1830;
    float _1876 = -_1396;
    float _1878 = fma(_1874, _1864, _1876);
    int _1880 = abs(_1226);
    float _1882 = -_1500;
    float _1884 = fma(_824, _1882, _1336);
    float _1886 = fma(_1842, _1842, _1872);
    int _1888 = abs(_1174);
    float _1890 = _495 + (-0.5);
    int _1892 = abs(_1616);
    int _1894 = ~_1888;
    int _1896 = _1894 + 1;
    int _1898 = _1896 + 1;
    int _1900 = ~_1880;
    int _1902 = _1900 + 1;
    int _1904 = _1902 + 1;
    int _1906 = ~_1892;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    int _1912 = abs(_1708);
    int _1914 = ~_1436;
    int _1916 = _1914 + _1532;
    int _1918 = _1916 + 1;
    int _1920 = _1898 * as_type<int>(_1756);
    int _1922 = ~_1776;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    int _1928 = ~_1502;
    int _1930 = _1928 + _1582;
    int _1932 = _1930 + 1;
    int _1934 = _1910 * as_type<int>(_1748);
    int _1936 = _1934 + _1920;
    int _1938 = abs(_1772);
    int _1940 = _517 * _1918;
    int _1942 = _1940 + _786;
    int _1944 = abs(_1868);
    int _1946 = _1904 * as_type<int>(_1792);
    int _1948 = ~_1912;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    int _1954 = _537 * _1932;
    int _1956 = _1954 + _892;
    bool _1958 = _517 == 0;
    float _1960 = float(_1766);
    int _1962 = _1952 * as_type<int>(_1784);
    int _1964 = _1962 + _1946;
    int _1966 = _1926 * as_type<int>(_1814);
    int _1968 = _1966 + _1936;
    bool _1970 = !_1544;
    int _1972 = _1970 ? 0 : 1;
    int _1974 = abs(_1796);
    int _1976 = abs(_1972);
    int _1978 = ~_1938;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    int _1984 = ~_1802;
    int _1986 = _1984 + 1;
    int _1988 = _1986 + 1;
    int _1990 = ~_1974;
    int _1992 = _1990 + 1;
    int _1994 = _1992 + 1;
    int _1996 = _1982 * as_type<int>(_1822);
    int _1998 = _1996 + _1968;
    float _2000 = float(_1944);
    int _2002 = _1988 * as_type<int>(_1852);
    int _2004 = _2002 + _1964;
    float _2006 = in.m_70.x;
    float _2008 = in.m_70.y;
    float _2010 = in.m_70.z;
    int _2012 = _1994 * as_type<int>(_1860);
    int _2014 = _2012 + _2004;
    float _2016 = sqrt(_1886);
    int _2018 = ~_1804;
    int _2020 = _2018 + 1;
    int _2022 = _2020 + 1;
    float _2024 = -_1434;
    float _2026 = _2024 + 1.0;
    int _2028 = ~_1976;
    int _2030 = _2028 + 1;
    int _2032 = _2030 + 1;
    float _2034 = _2000 * _1960;
    bool _2036 = !_1958;
    int _2038 = _2036 ? _1942 : (-1);
    int _2040 = _1998 * _2022;
    bool _2042 = !_908;
    int _2044 = _2042 ? _1956 : (-1);
    int _2046 = _2014 * _2032;
    float _2048 = fma(_828, _2026, _1878);
    int _2050 = _2038 * _1804;
    int _2052 = _2050 + _2040;
    if (_1798)
    {
        _1168 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2054 = _1168;
    float _2056 = _2034 * (-2.0);
    int _2058 = _2044 * _1976;
    int _2060 = _2058 + _2046;
    bool _2062 = !_1594;
    int _2064 = _2062 ? 0 : 1;
    out.m_72.x = _1884;
    out.m_72.y = _2048;
    float _2066 = _1724 * _2016;
    int _2068 = as_type<int>(_2054);
    if (_1798)
    {
        float _2070 = _2054 * 5.0;
        _2068 = as_type<int>(_2070);
    }
    int _2072 = _2068;
    float _2074 = float(_2052);
    float _2076 = fma(_2056, _2006, _2006);
    float _2078 = float(_2060);
    float _2080 = _501 * _2066;
    if (_1798)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6604 = as_type<float>(_2072);
        out.gl_Position.z = _6604;
    }
    float _2082 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2076);
    float _2084 = _497 + _710;
    float _2086 = float(_1516);
    out.m_74.x = _2074;
    out.m_74.y = _2078;
    float _2088 = fma(_1694, _2056, _1694);
    float _2090 = _2084 + (-1.0);
    out.m_76.x = _2080;
    bool _2092 = !_1598;
    int _2094 = _2092 ? 0 : 1;
    int _2096 = abs(_2064);
    if (_1798)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2098 = -_1824;
    float _2100 = _1662 + _2098;
    int _2102 = abs(_2094);
    float _2104 = -_1826;
    float _2106 = _1672 + _2104;
    float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2110 = _2100 + _2108;
    float _2112 = -_1828;
    float _2114 = _1682 + _2112;
    float _2116 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2118 = _2106 + _2116;
    float _2120 = float(_2096);
    float _2122 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2126 = _2114 + _2124;
    float _2128 = float(_1574);
    float _2130 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2132 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2122);
    float _2134 = _2120 * _2086;
    float _2136 = float(_2102);
    float _2138 = _497 + (-0.5);
    float _2140 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2132);
    float _2142 = _2134 * (-2.0);
    float _2144 = _710 + _495;
    float _2146 = _2136 * _2128;
    float _2148 = fma(_2088, _1440, _2082);
    bool _2150 = _2140 >= 0.0;
    float _2152 = fma(_2142, _2008, _2008);
    float _2154 = fma(_2130, _2142, _2130);
    float _2156 = _2144 + (-1.0);
    float _2158 = fma(_2138, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2152);
    float _2160 = _2146 * (-2.0);
    float _2162 = _2148 * 0.15915493667125701904296875;
    float _2164 = fma(_2156, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2166 = fma(_2154, _1440, _2158);
    float _2168 = fma(_2160, _2010, _2010);
    float _2170 = _710 + (-0.5);
    float _2172 = _2162 * 6.283185482025146484375;
    float _2174 = sin(_2172);
    float _2176 = _2166 * 0.15915493667125701904296875;
    float _2178 = _2130;
    float _2180 = _2118;
    float _2182 = _2126;
    if (_2150)
    {
        _2178 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2184 = _2178;
    float _2186 = fma(_2164, _2160, _2164);
    float _2188 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2168);
    int _2190 = as_type<int>(_2184);
    if (_2150)
    {
        out.m_49.x = 0.0;
    }
    if (_2150)
    {
        float _2192 = _2184 * 5.0;
        _2190 = as_type<int>(_2192);
    }
    int _2194 = _2190;
    float _2196 = _2162 * 6.283185482025146484375;
    float _2198 = cos(_2196);
    float _2200 = fma(_2186, _1440, _2188);
    if (_2150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6807 = as_type<float>(_2194);
        out.gl_Position.z = _6807;
    }
    float _2202 = _2200 * 0.15915493667125701904296875;
    float _2204 = _2176 * 6.283185482025146484375;
    float _2206 = sin(_2204);
    float _2208 = _2176 * 6.283185482025146484375;
    float _2210 = cos(_2208);
    if (_2150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2212 = _2202 * 6.283185482025146484375;
    float _2214 = cos(_2212);
    float _2216 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2218 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2220 = _2174 * _2206;
    float _2222 = _2198 * _2210;
    float _2224 = _2216 * _2066;
    float _2226 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2228 = _2174 * _2210;
    float _2230 = _2202 * 6.283185482025146484375;
    float _2232 = sin(_2230);
    float _2234 = _2224 * _2218;
    float _2236 = _2198 * _2206;
    float _2238 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2240 = _2238 * 0.5;
    float _2242 = _2198 * _2214;
    float _2244 = _2210 * _2214;
    float _2246 = _2174 * _2214;
    float _2248 = _2206 * _2214;
    float _2250 = _2080 * _2226;
    float _2252 = _2242 * _2234;
    float _2254 = fma(_2232, _2222, _2220);
    float _2256 = -_2228;
    float _2258 = fma(_2232, _2236, _2256);
    float _2260 = -_2234;
    float _2262 = _2232 * _2260;
    float _2264 = -_2236;
    float _2266 = fma(_2232, _2228, _2264);
    float _2268 = fma(_2254, _2250, _2252);
    float _2270 = _2246 * _2234;
    float _2272 = fma(_2244, _2250, _2262);
    float _2274 = fma(_2258, _2240, _2268);
    float _2276 = fma(_2232, _2220, _2222);
    float _2278 = fma(_2266, _2250, _2270);
    float _2280 = fma(_2248, _2240, _2272);
    float _2282 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2284 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2286 = fma(_2276, _2240, _2278);
    float _2288 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2282);
    float _2290 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2284);
    float _2292 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2288);
    float _2294 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2290);
    float _2296 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2298 = _2294 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2300 = _1682 + _2296;
    float _2302 = _1672 + _2298;
    float _2304 = _2274 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2306 = _2100 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2310 = _2300 + _2308;
    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2314 = _2302 + _2312;
    float _2316 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2304);
    float _2318 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2306);
    float _2320 = _2310 * _2310;
    float _2322 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2316);
    float _2324 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2318);
    float _2326 = fma(_2314, _2314, _2320);
    float _2328 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2330 = sqrt(_2326);
    float _2332 = _1662 + _2328;
    bool _2334 = _2330 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2336 = _2322;
    float _2338 = _2328;
    float _2340 = _2306;
    float _2342 = _2250;
    if (!_2334)
    {
        _2336 = _2302;
    }
    float _2344 = _2336;
    float _2346 = _2344;
    if (!_2334)
    {
        _2338 = _2300;
    }
    float _2348 = _2338;
    float _2350 = _2348;
    if (!_2334)
    {
        _2340 = _2332;
    }
    float _2352 = _2340;
    bool _2354 = !_2334;
    float _2356 = _2352;
    if (!_2354)
    {
        float _2358 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2362 = _2330 + _2360;
        float _2364 = rsqrt(_2326);
        float _2366 = _2362 * _2358;
        float _2368 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2370 = _2366 * 0.15915493667125701904296875;
        float _2372 = _2370 * 6.283185482025146484375;
        float _2374 = cos(_2372);
        float _2376 = _2370 * 6.283185482025146484375;
        float _2378 = sin(_2376);
        float _2380 = _2374 + (-1.0);
        float _2382 = fma(_2378, _2368, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2384 = _2380 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2386 = _2364 * _2382;
        float _2388 = fma(_2332, _2374, _2384);
        float _2390 = fma(_2314, _2386, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2392 = fma(_2310, _2386, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2356 = _2388;
        _2346 = _2390;
        _2350 = _2392;
        _2342 = _2370;
    }
    float _2394 = _2356;
    float _2396 = _2346;
    float _2398 = _2350;
    float _2400 = _2342;
    float _2402 = -_1662;
    float _2404 = _2402 + _2394;
    float _2406 = -_1672;
    float _2408 = _2406 + _2396;
    float _2410 = -_1682;
    float _2412 = _2410 + _2398;
    float _2414 = _2324 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2416 = _2404 * _2404;
    float _2418 = _2100 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2420 = 1.0 / _2414;
    float _2422 = fma(_2408, _2408, _2416);
    float _2424 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2418);
    bool _2426 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2428 = isnan(0.5);
    bool _2430 = _2426 || _2428;
    bool _2432 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2434 = _2430 || _2432;
    float _2436 = fma(_2412, _2412, _2422);
    float _2438 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2424);
    bool _2440 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2442 = isnan(0.5);
    bool _2444 = _2440 || _2442;
    bool _2446 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2448 = _2444 || _2446;
    float _2450 = sqrt(_2436);
    float _2452 = _2438 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2454 = _2452 + _2414;
    float _2456 = _2454 * _2420;
    float _2458 = _2456 * 0.5;
    bool _2460 = _2450 > 0.0;
    float _2462 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2464 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2462);
    float _2466 = 1.0 / _2464;
    float _2468 = _2458;
    float _2470 = _2420;
    float _2472 = _2400;
    if (!_2460)
    {
        _2468 = _2396;
    }
    float _2474 = _2468;
    float _2476 = _2474;
    if (!_2460)
    {
        _2470 = _2394;
    }
    float _2478 = _2470;
    float _2480 = _2478;
    if (!_2460)
    {
        _2472 = _2398;
    }
    float _2482 = _2472;
    bool _2484 = !_2460;
    float _2486 = _2482;
    float _2488 = _2482;
    if (!_2484)
    {
        float _2490 = _211 * _211;
        float _2492 = fma(_209, _209, _2490);
        float _2494 = rsqrt(_2436);
        float _2496 = fma(_213, _213, _2492);
        float _2498 = sqrt(_2496);
        float _2500 = _2408 * _2494;
        float _2502 = _2404 * _2494;
        float _2504 = _2412 * _2494;
        bool _2506 = _2498 > 0.0;
        float _2508 = _2494;
        float _2510 = _2498;
        if (!_2506)
        {
            _2508 = _2396;
        }
        float _2512 = _2508;
        _2476 = _2512;
        if (!_2506)
        {
            _2510 = _2394;
        }
        float _2514 = _2510;
        _2480 = _2514;
        if (!_2506)
        {
            _2486 = _2398;
        }
        float _2516 = _2486;
        bool _2518 = !_2506;
        _2488 = _2516;
        if (!_2518)
        {
            float _2520 = rsqrt(_2496);
            float _2522 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2524 = _211 * _2520;
            float _2526 = _209 * _2520;
            float _2528 = _2502 * _2524;
            float _2530 = _213 * _2520;
            float _2532 = fma(_2500, _2526, _2528);
            float _2534 = _2522 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2536 = fma(_2504, _2530, _2532);
            float _2538 = _2536 * _2534;
            float _2540 = fma(_209, _2538, _2396);
            float _2542 = fma(_211, _2538, _2394);
            float _2544 = fma(_213, _2538, _2398);
            _2476 = _2540;
            _2480 = _2542;
            _2488 = _2544;
        }
    }
    float _2546 = _2476;
    float _2548 = _2480;
    float _2550 = _2488;
    float _2552 = -_1826;
    float _2554 = _2552 + _2546;
    float _2556 = -_1824;
    float _2558 = _2556 + _2548;
    float _2560 = -_1828;
    float _2562 = _2560 + _2550;
    float _2564 = _2558;
    float _2566 = _2554;
    float _2568 = _2562;
    if (_2448)
    {
        _221 = 1.0;
    }
    float _2570 = _221;
    float _2572 = _2570;
    if (!_2434)
    {
        float _2574 = _2110 * _2110;
        float _2576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2578 = -_1682;
        float _2580 = _2578 + _2550;
        float _2582 = -_1662;
        float _2584 = _2582 + _2548;
        float _2586 = fma(_2118, _2118, _2574);
        float _2588 = fma(_2126, _2126, _2586);
        float _2590 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2592 = sqrt(_2588);
        float _2594 = 1.0 / _2066;
        float _2596 = precise::min(_2592, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2598 = _2596 * _2576;
        float _2600 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2602 = -_1672;
        float _2604 = _2602 + _2546;
        float _2606 = _2598 * _2594;
        float _2608 = _2600 * _2606;
        float _2610 = _2580 * _2606;
        float _2612 = fma(_2584, _2608, _2100);
        float _2614 = fma(_2604, _2608, _2106);
        float _2616 = fma(_2600, _2610, _2114);
        _2564 = _2612;
        _2566 = _2614;
        _2568 = _2616;
        _2180 = _2592;
        _1760 = _2610;
    }
    float _2618 = _2564;
    float _2620 = _2566;
    float _2622 = _2568;
    float _2624 = _2180;
    float _2626 = _1760;
    float _2628 = _2624;
    float _2630 = _2626;
    if (_2448)
    {
        _1870 = 1.0;
    }
    float _2632 = _1870;
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2636 = _2466 * _2634;
    float _2638 = _2632;
    if (!_2448)
    {
        float _2640 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2642 = _2640 * 0.15915493667125701904296875;
        float _2644 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2646 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2648 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2646;
        float _2650 = _2642 * 6.283185482025146484375;
        float _2652 = cos(_2650);
        float _2654 = _2644 * 0.15915493667125701904296875;
        float _2656 = _2642 * 6.283185482025146484375;
        float _2658 = sin(_2656);
        float _2660 = 1.0 / _2652;
        float _2662 = _2654 * 6.283185482025146484375;
        float _2664 = cos(_2662);
        float _2666 = _2658 * _2660;
        float _2668 = _2654 * 6.283185482025146484375;
        float _2670 = sin(_2668);
        float _2672 = _2664 * _2666;
        float _2674 = 1.0 / _2648;
        float _2676 = 1.0 / _2672;
        float _2678 = _2670 * _2676;
        float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2682 = fma(_2636, _2678, _2680);
        float _2684 = _2682 * _2674;
        float _2686 = precise::clamp(_2684, 0.0, 1.0);
        _2182 = _2654;
        _2628 = _2666;
        _2572 = _2686;
    }
    float _2688 = _2182;
    float _2690 = _2628;
    float _2692 = _2572;
    float _2694 = _2688;
    float _2696 = _2690;
    if (!_2448)
    {
        float _2698 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2700 = _2698 * 0.15915493667125701904296875;
        float _2702 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2704 = _2700 * 6.283185482025146484375;
        float _2706 = cos(_2704);
        float _2708 = _2702 * 0.15915493667125701904296875;
        float _2710 = _2700 * 6.283185482025146484375;
        float _2712 = sin(_2710);
        float _2714 = 1.0 / _2706;
        float _2716 = _2708 * 6.283185482025146484375;
        float _2718 = cos(_2716);
        float _2720 = _2712 * _2714;
        float _2722 = _2708 * 6.283185482025146484375;
        float _2724 = sin(_2722);
        float _2726 = _2718 * _2720;
        float _2728 = 1.0 / _2726;
        float _2730 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2732 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2730;
        float _2734 = 1.0 / _2732;
        float _2736 = _2724 * _2728;
        float _2738 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2740 = fma(_2636, _2736, _2738);
        float _2742 = _2740 * _2734;
        float _2744 = precise::clamp(_2742, 0.0, 1.0);
        float _2746 = -_2744;
        float _2748 = _2746 + 1.0;
        _2694 = _2714;
        _2696 = _2726;
        _2638 = _2748;
    }
    float _2750 = _2694;
    float _2752 = _2696;
    float _2754 = _2638;
    float _2756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2758 = _2618 + _2756;
    float _2760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2762 = _2620 + _2760;
    float _2764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2766 = _2622 + _2764;
    float _2768 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2770 = _2758 * _2758;
    float _2772 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2768);
    float _2774 = fma(_2762, _2762, _2770);
    float _2776 = fma(_2766, _2766, _2774);
    float _2778 = rsqrt(_2776);
    float _2780 = sqrt(_2776);
    float _2782 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2784 = _2762 * _2782;
    float _2786 = _2766 * _2782;
    float _2788 = _2784 * _2784;
    float _2790 = _2786 * _2786;
    float _2792 = _2788 + _2790;
    float _2794 = sqrt(_2792);
    bool _2796 = _2794 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2800 = _2794 + _2798;
    float _2802 = _2750;
    float _2804 = _2792;
    float _2806 = _2800;
    float _2808 = _2752;
    float _2810 = _2758;
    if (_2796)
    {
        float _2812 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2802 = _2812;
    }
    float _2814 = _2802;
    if (_2796)
    {
        float _2816 = rsqrt(_2792);
        _2804 = _2816;
    }
    float _2818 = _2804;
    float _2820 = _2818;
    if (_2796)
    {
        float _2822 = _2800 * _2814;
        _2806 = _2822;
    }
    float _2824 = _2806;
    if (_2796)
    {
        float _2826 = _2824 * 0.15915493667125701904296875;
        _2808 = _2826;
    }
    float _2828 = _2808;
    float _2830 = _2766;
    float _2832 = _2828;
    if (_2796)
    {
        float _2834 = _2828 * 6.283185482025146484375;
        float _2836 = sin(_2834);
        _2830 = _2836;
    }
    float _2838 = _2830;
    float _2840 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2842 = precise::max(0.0, _2840);
    float _2844 = _2814;
    if (_2796)
    {
        float _2846 = _2828 * 6.283185482025146484375;
        float _2848 = cos(_2846);
        _2844 = _2848;
    }
    float _2850 = _2844;
    float _2852 = -_2782;
    float _2854 = -_2842;
    float _2856 = fma(_2758, _2852, _2854);
    float _2858 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2796)
    {
        float _2860 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2810 = _2860;
    }
    float _2862 = _2810;
    float _2864 = _2862;
    if (!_2796)
    {
        _2832 = _2784;
    }
    float _2866 = _2832;
    float _2868 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2870 = _2838;
    float _2872 = _2866;
    if (_2796)
    {
        float _2874 = fma(_2838, _2862, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2870 = _2874;
    }
    float _2876 = _2870;
    float _2878 = _2876;
    if (!_2796)
    {
        _2864 = _2856;
    }
    float _2880 = _2864;
    float _2882 = _2880;
    float _2884 = _2850;
    if (_2796)
    {
        float _2886 = _2850 + (-1.0);
        _2858 = _2886;
    }
    float _2888 = _2858;
    float _2890 = _2888;
    if (_2796)
    {
        float _2892 = _2818 * _2876;
        _2630 = _2892;
    }
    float _2894 = _2630;
    if (!_2796)
    {
        _2820 = _2786;
    }
    float _2896 = _2820;
    float _2898 = _2896;
    if (_2796)
    {
        float _2900 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2890 = _2900;
    }
    float _2902 = _2890;
    if (_2796)
    {
        float _2904 = _2784 * _2894;
        _2872 = _2904;
    }
    float _2906 = _2872;
    if (!_2796)
    {
        _2878 = _2788;
    }
    float _2908 = _2878;
    float _2910 = _2908;
    if (_2796)
    {
        float _2912 = _2786 * _2894;
        _2898 = _2912;
    }
    float _2914 = _2898;
    if (_2796)
    {
        float _2916 = fma(_2856, _2850, _2902);
        _2882 = _2916;
    }
    float _2918 = _2882;
    if (_2796)
    {
        float _2920 = _2906 * _2906;
        _2910 = _2920;
    }
    float _2922 = _2910;
    if (!_2796)
    {
        _2884 = _2790;
    }
    float _2924 = _2884;
    float _2926 = _2924;
    if (_2796)
    {
        float _2928 = _2914 * _2914;
        _2926 = _2928;
    }
    float _2930 = _2926;
    float _2932 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2934 = fma(_2918, _2918, _2922);
    float _2936 = floor(_2868);
    float _2938 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2932);
    float _2940 = _2934 + _2930;
    float _2942 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2944 = fma(_2780, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2942);
    float _2946 = precise::clamp(_2944, 0.0, 1.0);
    float _2948 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2938);
    float _2950 = rsqrt(_2940);
    float _2952 = -_2946;
    float _2954 = _2952 + 1.0;
    float _2956 = _2948 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2958 = fma(_2114, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2960 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2962 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2964 = abs(_2954);
    float _2966 = log2(_2964);
    float _2968 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2970 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2972 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2960);
    float _2974 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2968);
    float _2976 = -_2970;
    float _2978 = fma(_2976, _2962, 1.0);
    float _2980 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2972);
    float _2982 = _2950 * _2906;
    float _2984 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2974);
    float _2986 = _2950 * _2918;
    float _2988 = _2950 * _2914;
    float _2990 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2992 = _2984 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2994 = _2980 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2996 = floor(_2958);
    float _2998 = -_2990;
    float _3000 = fma(_2986, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2998);
    float _3002 = _2992 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3004 = _2966 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3006 = -_2988;
    float _3008 = fma(_3006, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3000);
    float _3010 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2772);
    float _3012 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3002);
    float _3014 = exp2(_3004);
    float _3016 = fma(_3008, -0.5, 0.5);
    float _3018 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3020 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3012);
    float _3022 = fma(_3008, 0.5, 0.5);
    float _3024 = _2992 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3026 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3020);
    float _3028 = log2(_2978);
    float _3030 = -_2996;
    float _3032 = _2958 + _3030;
    float _3034 = fma(_3022, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3036 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3024);
    float _3038 = fma(_3022, _3034, -0.212114393711090087890625);
    float _3040 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3036);
    float _3042 = 1.0 / _3026;
    float _3044 = -_2936;
    float _3046 = _2868 + _3044;
    float _3048 = _2992 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3050 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3048);
    float _3052 = _2986 + 1.0;
    float _3054 = sqrt(_3016);
    float _3056 = _3028 * 0.693147182464599609375;
    float _3058 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3050);
    float _3060 = -_2986;
    float _3062 = fma(_3014, _3052, _3060);
    float _3064 = fma(_3022, _3038, 1.570728778839111328125);
    float2 _8160 = float2(_3046, _3032);
    float _3066 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8160, float2(0.0), isnan(_8160)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8160, float2(0.0), isnan(_8160)), level(0.0)).x;
    float _3068 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3058);
    float _3070 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3040);
    float _3072 = _3056 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3074 = fma(_3062, 0.5, 0.5);
    float _3076 = _3068 * _3042;
    float _3078 = _3070 * _3042;
    float _3080 = fma(_3076, 0.5, 0.5);
    float _3082 = fma(_3078, -0.5, 0.5);
    float _3084 = _3054 * 0.636619746685028076171875;
    float _3086 = -_3064;
    float _3088 = fma(_3084, _3086, 1.0);
    float3 _8205 = float3(_3080, _3082, _3072);
    float _3090 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8205, float3(0.0), isnan(_8205)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8205, float3(0.0), isnan(_8205)), level(0.0)).x;
    float3 _8216 = float3(_3080, _3082, _3072);
    float4 _3093 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8216, float3(0.0), isnan(_8216)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8216, float3(0.0), isnan(_8216)), level(0.0)).xyzw;
    float _3095 = _3093.x;
    float _3097 = _3093.y;
    float _3099 = _3093.z;
    float _3101 = _3093.w;
    float2 _8232 = float2(_3088, _3074);
    float3 _3105 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8232, float2(0.0), isnan(_8232)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8232, float2(0.0), isnan(_8232)), level(0.0)).xyz;
    float _3107 = _3105.x;
    float _3109 = _3105.y;
    float _3111 = _3105.z;
    float _3113 = abs(_2636);
    float _3115 = log2(_3113);
    float _3117 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3119 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3121 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3123 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3125 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3117);
    float _3127 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3119);
    float _3129 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3121);
    float _3131 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3133 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3135 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3137 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3139 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3141 = -_2232;
    float _3143 = fma(_3141, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3123);
    float _3145 = -_2232;
    float _3147 = fma(_3145, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3133);
    float _3149 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3151 = _3115 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3153 = -_2232;
    float _3155 = fma(_3153, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3131);
    float _3157 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3135);
    float _3159 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3137);
    float _3161 = exp2(_3151);
    float _3163 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3139);
    float _3165 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3155);
    float _3167 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3157);
    float _3169 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3159);
    float _3171 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3163);
    float _3173 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3125);
    float _3175 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3143);
    float _3177 = fma(_3149, _3149, 1.0);
    float _3179 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3181 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3147);
    float _3183 = _2992 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3185 = rsqrt(_3177);
    float _3187 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3127);
    float _3189 = _2966 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3191 = fma(_3161, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3193 = precise::clamp(_3191, 0.0, 1.0);
    float _3195 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3129);
    float _3197 = _3149 * _3175;
    float _3199 = _3193 * _3193;
    float _3201 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3183);
    float _3203 = fma(_3193, -2.0, 3.0);
    float _3205 = _3149 * _3165;
    float _3207 = exp2(_3189);
    float _3209 = fma(_3179, _3187, _3197);
    float _3211 = _3199 * _3203;
    float _3213 = fma(_3179, _3173, _3205);
    float _3215 = _3149 * _3181;
    float _3217 = _3149 * _3185;
    float _3219 = -_3211;
    float _3221 = _3219 + 1.0;
    out.m_78.x = _3173;
    out.m_78.y = _3187;
    out.m_78.z = _3195;
    float _3223 = fma(_3179, _3195, _3215);
    float _3225 = -_3167;
    float _3227 = _3217 * _3225;
    float _3229 = fma(_3221, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3211);
    float _3231 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3201);
    float _3233 = in.m_80.x;
    float _3235 = fma(_3185, _3165, _3227);
    float _3237 = _3167 + _3213;
    float _3239 = _3169 + _3209;
    float _3241 = -_3207;
    float _3243 = _3241 + 1.0;
    out.m_82.x = _2620;
    out.m_82.y = _2618;
    out.m_82.z = _2622;
    bool _3245 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3247 = isnan(_2780);
    bool _3249 = _3245 || _3247;
    bool _3251 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3253 = _3249 || _3251;
    float _3255 = -_3169;
    float _3257 = _3217 * _3255;
    float _3259 = -_3171;
    float _3261 = _3217 * _3259;
    float _3263 = _3243 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3265 = fma(_3185, _3175, _3257);
    bool _3267 = _2636 <= 8000.0;
    bool _3269 = isnan(_2636);
    bool _3271 = _3267 || _3269;
    bool _3273 = isnan(8000.0);
    bool _3275 = _3271 || _3273;
    float _3277 = float(_3275);
    float _3279 = fma(_3185, _3181, _3261);
    float _3281 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3231);
    float _3283 = _3026 * 0.5;
    float _3285 = _3068 + _3026;
    float _3287 = _3277 * _3229;
    out.m_84.x = _3235;
    out.m_84.y = _3265;
    out.m_84.z = _3279;
    float _3289 = _3281 + _3026;
    float _3291 = fma(_3070, -0.5, _3283);
    float _3293 = _3287 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3068;
    out.gl_Position.y = _3070;
    out.gl_Position.z = _3281;
    out.gl_Position.w = _3026;
    float _3295 = _3289 * 0.5;
    float _3297 = _3171 + _3223;
    float _3299 = _3285 * 0.5;
    out.m_86.x = _3237;
    out.m_86.y = _3239;
    out.m_86.z = _3297;
    float _3301 = _3169;
    float _3303 = _3279;
    float _3305 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3253)
    {
        _3301 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3307 = _3301;
    float _3309 = _3307;
    float _3311 = _3307;
    if (!_3253)
    {
        _3303 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3313 = _3303;
    out.m_88.z = _3295;
    out.m_88.w = _3026;
    out.m_90.x = _3299;
    out.m_90.y = _3291;
    out.m_90.z = _3295;
    out.m_90.w = _3026;
    float _3315 = -_3066;
    float _3317 = _3315 + 1.0;
    float _3319 = _3317 * _3293;
    float _3321 = precise::clamp(_3319, 0.0, 1.0);
    float _3323 = -_3321;
    float _3325 = fma(_3323, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3327 = _3097;
    float _3329 = _3313;
    float _3331 = _3313;
    if (!_3253)
    {
        _3305 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3333 = _3305;
    float _3335 = _3325 * _3233;
    float _3337 = _3335 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3339 = _3263 * _3090;
    float _3341 = -_3263;
    float _3343 = _3341 + 1.0;
    float _3345 = _3101 * _3339;
    float _3347 = _3111 * _3339;
    float _3349 = _3101 * _3343;
    out.m_92.x = _3337;
    float _3351 = fma(_3107, _3345, _3095);
    float _3353 = fma(_3109, _3345, _3097);
    float _3355 = fma(_3101, _3347, _3099);
    float _3357 = _2692 * _2754;
    float _3359 = _3339;
    float _3361 = _3357;
    float _3363 = _3333;
    float _3365 = _3333;
    if (!_3253)
    {
        _3359 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3367 = _3359;
    float _3369 = _3367;
    float _3371 = _3367;
    if (!_3253)
    {
        _3327 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3373 = _3327;
    out.m_94.x = _3351;
    out.m_94.y = _3353;
    out.m_94.z = _3355;
    out.m_94.w = _3349;
    float _3375 = _3357 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3377 = _3373;
    float _3379 = _3373;
    if (!_3253)
    {
        _3361 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3381 = _3361;
    bool _3383 = !_3253;
    float _3385 = _3381;
    float _3387 = _3381;
    if (!_3383)
    {
        bool _3389 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3391 = isnan(_2780);
        bool _3393 = _3389 || _3391;
        bool _3395 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3397 = _3393 || _3395;
        if (!_3397)
        {
            float _3399 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3401 = _2780 + _3399;
            float _3403 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3405 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3403;
            float _3407 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3409 = _3407 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3411 = 1.0 / _3405;
            float _3413 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3415 = _3413 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3417 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3419 = _3417 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3421 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3423 = _3421 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3425 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3427 = _3425 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3429 = _3401 * _3411;
            float _3431 = precise::clamp(_3429, 0.0, 1.0);
            float _3433 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3435 = _3433 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3437 = fma(_3431, _3409, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3439 = fma(_3431, _3435, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3441 = fma(_3431, _3415, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3443 = fma(_3431, _3419, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3445 = fma(_3431, _3423, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3447 = fma(_3431, _3427, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3331 = _3441;
            _3379 = _3445;
            _3311 = _3437;
            _3371 = _3443;
            _3365 = _3439;
            _3387 = _3447;
            _3449 = true;
        }
        else
        {
            bool _3451 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3453 = isnan(_2780);
            bool _3455 = _3451 || _3453;
            bool _3457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3459 = _3455 || _3457;
            if (!_3459)
            {
                _3309 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3461 = _3309;
            _3311 = _3461;
            if (!_3459)
            {
                _3329 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3463 = _3329;
            _3331 = _3463;
            if (!_3459)
            {
                _3363 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3465 = _3363;
            _3365 = _3465;
            if (!_3459)
            {
                _3369 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3467 = _3369;
            _3371 = _3467;
            if (!_3459)
            {
                _3377 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3469 = _3377;
            _3379 = _3469;
            if (!_3459)
            {
                _3385 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3471 = _3385;
            bool _3473 = !_3459;
            _3387 = _3471;
            if (!_3473)
            {
                bool _3475 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3477 = isnan(_2780);
                bool _3479 = _3475 || _3477;
                bool _3481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3483 = _3479 || _3481;
                if (!_3483)
                {
                    float _3485 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3487 = _2780 + _3485;
                    float _3489 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3491 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3489;
                    float _3493 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3495 = _3493 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3497 = 1.0 / _3491;
                    float _3499 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3501 = _3499 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3503 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3505 = _3503 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3507 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3509 = _3507 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3511 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3513 = _3511 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3515 = _3487 * _3497;
                    float _3517 = precise::clamp(_3515, 0.0, 1.0);
                    float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3521 = _3519 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3523 = fma(_3517, _3495, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3525 = fma(_3517, _3521, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3527 = fma(_3517, _3501, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3529 = fma(_3517, _3505, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3531 = fma(_3517, _3509, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3533 = fma(_3517, _3513, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3331 = _3527;
                    _3379 = _3531;
                    _3311 = _3523;
                    _3371 = _3529;
                    _3365 = _3525;
                    _3387 = _3533;
                    _3449 = true;
                }
                else
                {
                    _3331 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3379 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3311 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3371 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3365 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3387 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3449 = false;
    float _3535 = _3331;
    float _3537 = _3379;
    float _3539 = _3311;
    float _3541 = _3371;
    float _3543 = _3365;
    float _3545 = _3387;
    float _3547 = fma(_3239, -0.5, 0.5);
    float _3549 = precise::clamp(_3547, 0.0, 1.0);
    float _3551 = -_3535;
    float _3553 = _3551 + _3537;
    float _3555 = _3375 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3557 = -_3539;
    float _3559 = _3557 + _3541;
    float _3561 = fma(_3549, _3553, _3535);
    out.m_96.x = 0.0;
    float _3563 = -_3543;
    float _3565 = _3563 + _3545;
    float _3567 = fma(_3549, _3559, _3539);
    float _3569 = _3561 * 0.586610972881317138671875;
    out.m_49.x = _3555;
    bool _3571 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3573 = fma(_3549, _3565, _3543);
    float _3575 = fma(_3567, 0.298911988735198974609375, _3569);
    bool _3577 = _2692 > 0.0;
    bool _3579 = isnan(_2692);
    bool _3581 = _3577 || _3579;
    bool _3583 = isnan(0.0);
    bool _3585 = _3581 || _3583;
    float _3587 = fma(_3573, 0.114477999508380889892578125, _3575);
    bool _3589 = _2754 <= 0.0;
    bool _3591 = !_3585;
    bool _3593 = _3589 || _3591;
    float _3595 = -_3587;
    float _3597 = _3561 + _3595;
    float _3599 = -_3587;
    float _3601 = _3567 + _3599;
    float _3603 = -_3587;
    float _3605 = _3573 + _3603;
    float _3607 = fma(_3597, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3587);
    float _3609 = fma(_3601, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3587);
    float _3611 = fma(_3605, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3587);
    bool _3613 = !_3571;
    if (!_3613)
    {
        float _3615 = -_2618;
        float _3617 = _3615 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3619 = -_2620;
        float _3621 = _3619 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3623 = -_2622;
        float _3625 = _3623 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3627 = _3617 * _3617;
        float _3629 = fma(_3621, _3621, _3627);
        float _3631 = fma(_3625, _3625, _3629);
        float _3633 = sqrt(_3631);
        float _3635 = rsqrt(_3631);
        float _3637 = -_3633;
        float _3639 = _3637 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3641 = _3639 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3643 = precise::clamp(_3641, 0.0, 1.0);
        float _3645 = _3621 * _3635;
        float _3647 = _3617 * _3635;
        float _3649 = abs(_3643);
        float _3651 = log2(_3649);
        float _3653 = _3625 * _3635;
        float _3655 = _3645 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3657 = _3239 * _3647;
        float _3659 = -_3647;
        float _3661 = -_3655;
        float _3663 = fma(_3659, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3661);
        float _3665 = fma(_3237, _3645, _3657);
        float _3667 = -_3653;
        float _3669 = fma(_3667, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3663);
        float _3671 = fma(_3297, _3653, _3665);
        float _3673 = precise::clamp(_3671, 0.0, 1.0);
        float _3675 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3677 = _3669 + _3675;
        float _3679 = _3651 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3681 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3683 = precise::clamp(_3681, 0.0, 1.0);
        float _3685 = exp2(_3679);
        float _3687 = _3685 * _3683;
        float _3689 = _3673 * _3687;
        float _3691 = _3689 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3693 = _3689 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3695 = _3689 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3691;
        out.m_96.y = _3693;
        out.m_96.z = _3695;
    }
    out.m_98.x = _3609;
    out.m_98.y = _3607;
    out.m_98.z = _3611;
    if (!_3593)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3697 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3697;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

