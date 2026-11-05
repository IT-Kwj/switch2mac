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
    bool _3437 = false;
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
        float _3741 = as_type<float>(_131);
        out.gl_Position.z = _3741;
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
        float _3814 = as_type<float>(_173);
        out.gl_Position.z = _3814;
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
    bool _249 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _251 = isnan(_243);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _243 + _261;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = -_259;
    float _275 = _273 + 1.0;
    float _277 = 1.0 / _267;
    bool _279 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _281 = isnan(_243);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = 1.0 / _271;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _295;
    float _299 = _247 * _277;
    bool _301 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _303 = isnan(_243);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = in.m_62.x;
    float _315 = in.m_62.y;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _317;
    float _321 = fma(_297, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _323 = _311 * _275;
    float _325 = -_311;
    float _327 = _325 + 1.0;
    float _329 = fma(_319, _299, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = _263 * _293;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _337 = _289 * _327;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _343 = -_289;
    float _345 = _343 + 1.0;
    float _347 = fma(_335, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _349 = _329 * _337;
    float _351 = _321 * _337;
    float _353 = fma(_341, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _355 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].x, _349);
    float _357 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].y, _351);
    float _359 = fma(_353, _323, _355);
    float _361 = fma(_347, _323, _357);
    float _363 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[145].x, _359);
    float _365 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[145].y, _361);
    float _367 = _363 * _313;
    float _369 = _365 * _315;
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
    bool _399 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _401 = isnan(_393);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _415 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _417 = isnan(_393);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _427;
    float _431 = -_409;
    float _433 = _431 + 1.0;
    bool _435 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _437 = 1.0 / _413;
    float _439 = _425 * _433;
    float _441 = -_425;
    float _443 = _441 + 1.0;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _447 = _445 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _449 = _429 * _437;
    float _451 = fma(_449, _397, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _455 = _451 * _439;
    float _457 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _459 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[115].x, _455);
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _463 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[116].x, _459);
    float _465 = _461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = _463 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _447;
    out.m_64.y = _465;
    out.m_64.z = _457;
    out.m_64.w = _467;
    bool _469 = !_435;
    float _471 = _465;
    if (!_469)
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
    float _507 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _509 = int(_507);
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _513 = float(_493);
    float _515 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _517 = int(_515);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _519;
    if (_505)
    {
        _471 = 1.0;
    }
    float _523 = _471;
    float _525 = _523;
    if (!_505)
    {
        _525 = 7.345489978790283203125;
    }
    float _527 = _525;
    float _529 = float(uint(_509));
    float _531 = 1.0 / _513;
    float _533 = _527 * _495;
    bool _535 = _509 == 0;
    float _537 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[88].z, _511);
    bool _539 = _497 > 0.5;
    float _541 = float(_517);
    float _543 = 1.0 / _529;
    float _545 = _531 * _141;
    float _547 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _549 = int(_547);
    float _551 = trunc(_545);
    int _553 = int(_551);
    int _555 = as_type<int>(_543) + (-2);
    float _557 = 1.0 / _541;
    float _559 = float(uint(_549));
    int _561 = ~_549;
    int _563 = _561 + 1;
    int _565 = ~_549;
    int _567 = _565 + 1;
    int _569 = ~_549;
    int _571 = _569 + 1;
    float _573 = 1.0 / _559;
    float _575 = float(uint(_553));
    int _577 = ~_509;
    int _579 = _577 + 1;
    float _581 = as_type<float>(_555) * _575;
    float _583 = _557 * _141;
    float _585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _587 = as_type<int>(_573) + (-2);
    float _589 = trunc(_583);
    int _591 = int(_589);
    float _593 = trunc(_581);
    float _595 = precise::max(_593, 0.0);
    uint _598 = uint(_595);
    float _600 = _585 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _602 = float(uint(_591));
    float _604 = _581;
    float _606 = _602;
    if (_505)
    {
        _604 = _495;
    }
    float _608 = _604;
    float _610 = _608;
    if (!_505)
    {
        _610 = _497;
    }
    float _612 = _610;
    float _614 = as_type<float>(_587) * _602;
    if (_505)
    {
        _606 = 1.0;
    }
    float _616 = _606;
    int _618 = _579 * int(_598);
    int _620 = _618 + _553;
    float _622 = trunc(_614);
    float _624 = precise::max(_622, 0.0);
    uint _626 = uint(_624);
    float _628 = _616;
    if (!_505)
    {
        _628 = 1.2345600128173828125;
    }
    float _630 = _628;
    float _632 = float(_591);
    float _634 = float(uint(_620));
    float _636 = _630 * _612;
    float _638 = as_type<float>(_555) * _634;
    int _640 = ~_509;
    int _642 = _640 + 1;
    float _644 = floor(_533);
    int _646 = _563 * int(_626);
    int _648 = _646 + _591;
    float _650 = trunc(_638);
    float _652 = precise::max(_650, 0.0);
    uint _654 = uint(_652);
    float _656 = float(uint(_648));
    float _658 = as_type<float>(_587) * _656;
    float _660 = float(_509);
    float _662 = floor(_636);
    float _664 = -_644;
    float _666 = _533 + _664;
    int _668 = int(_598) + int(_654);
    float _670 = trunc(_658);
    float _672 = precise::max(_670, 0.0);
    uint _674 = uint(_672);
    float _676 = in.m_60.z;
    int _678 = _642 * _668;
    int _680 = _678 + _553;
    float _682 = -_662;
    float _684 = _636 + _682;
    bool _686 = uint(_680) >= uint(_509);
    float _688 = float(_553);
    bool _690 = !_686;
    int _692 = _690 ? 0 : (-1);
    bool _694 = _688 >= _660;
    bool _696 = isnan(_688);
    bool _698 = _694 || _696;
    bool _700 = isnan(_660);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    int _706 = ~_668;
    int _708 = _706 + _692;
    int _710 = _708 + 1;
    float _712 = _666 * _660;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _716 = _714 != 0;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _720 = _718 != 0;
    float _722 = _660 * _499;
    float _724 = trunc(_704);
    int _726 = int(_724);
    int _728 = _509 * _710;
    int _730 = _728 + _553;
    int _732 = int(_626) + int(_674);
    bool _734 = _676 > 0.5;
    float _736 = -_217;
    int _738 = _539 ? as_type<int>(_736) : as_type<int>(_217);
    int _740 = _567 * _732;
    int _742 = _740 + _591;
    float _744 = -_207;
    int _746 = _734 ? as_type<int>(_744) : as_type<int>(_207);
    float _748 = trunc(_722);
    int _750 = int(_748);
    float _752 = float(_549);
    bool _754 = !_720;
    float _756 = _754 ? _207 : as_type<float>(_746);
    bool _758 = !_716;
    float _760 = _758 ? _217 : as_type<float>(_738);
    float _762 = _752 * _499;
    int _764 = ~_726;
    int _766 = _764 + 1;
    int _768 = _766 + 1;
    bool _770 = !_535;
    int _772 = _770 ? _730 : (-1);
    float _774 = _684 * _752;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _778 = _776 != 0;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _782 = _780 != 0;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _786 = _784 != 0;
    float _788 = trunc(_762);
    int _790 = int(_788);
    bool _792 = _632 >= _752;
    bool _794 = isnan(_632);
    bool _796 = _792 || _794;
    bool _798 = isnan(_752);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    int _804 = _772 * _768;
    int _806 = _509 + (-1);
    float _808 = _760 + 0.5;
    bool _810 = !_782;
    int _812 = _810 ? 0 : 1;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _816 = _814 != 0;
    float _818 = trunc(_712);
    int _820 = int(_818);
    int _822 = abs(_812);
    int _824 = _726 * _806;
    int _826 = _824 + _804;
    bool _828 = uint(_742) >= uint(_549);
    bool _830 = !_816;
    int _832 = _830 ? 0 : 1;
    float _834 = trunc(_802);
    int _836 = int(_834);
    bool _838 = !_778;
    int _840 = _838 ? 0 : 1;
    int _842 = _826 * _822;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _850 = _848 != 0;
    bool _852 = !_828;
    int _854 = _852 ? 0 : (-1);
    int _856 = abs(_832);
    int _858 = abs(_840);
    bool _860 = !_846;
    int _862 = _860 ? 0 : 1;
    int _864 = _820 * _856;
    int _866 = _864 + _553;
    bool _868 = !_850;
    int _870 = _868 ? 0 : 1;
    int _872 = _750 * _858;
    int _874 = _872 + _842;
    bool _876 = !_786;
    int _878 = _876 ? 0 : 1;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _882 = _880 != 0;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _886 = _884 != 0;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _890 = _888 != 0;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _894 = _892 != 0;
    int _896 = ~_732;
    int _898 = _896 + _854;
    int _900 = _898 + 1;
    int _902 = abs(_878);
    float _904 = trunc(_774);
    int _906 = int(_904);
    int _908 = abs(_862);
    int _910 = _549 * _900;
    int _912 = _910 + _591;
    bool _914 = !_886;
    int _916 = _914 ? 0 : 1;
    int _918 = _866 * _902;
    int _920 = _918 + _874;
    bool _922 = _549 == 0;
    int _924 = abs(_870);
    int _926 = ~_836;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    bool _932 = !_922;
    int _934 = _932 ? _912 : (-1);
    int _936 = _820 * _908;
    int _938 = _936 + _920;
    int _940 = _549 + (-1);
    int _942 = abs(_916);
    int _944 = _934 * _930;
    float _946 = float(uint(_938));
    bool _948 = !_890;
    int _950 = _948 ? 0 : 1;
    int _952 = _836 * _940;
    int _954 = _952 + _944;
    bool _956 = !_882;
    int _958 = _956 ? 0 : 1;
    float _960 = as_type<float>(_555) * _946;
    int _962 = abs(_950);
    int _964 = _954 * _942;
    int _966 = abs(_958);
    float _968 = trunc(_960);
    float _970 = precise::max(_968, 0.0);
    uint _972 = uint(_970);
    bool _974 = !_894;
    int _976 = _974 ? 0 : 1;
    int _978 = _790 * _966;
    int _980 = _978 + _964;
    int _982 = abs(_976);
    int _984 = _906 * _924;
    int _986 = _984 + _591;
    int _988 = ~_509;
    int _990 = _988 + 1;
    bool _992 = _509 == 0;
    int _994 = _986 * _962;
    int _996 = _994 + _980;
    int _998 = ~_509;
    int _1000 = _998 + 1;
    bool _1002 = _497 > 0.5;
    int _1004 = _906 * _982;
    int _1006 = _1004 + _996;
    int _1008 = _1000 * int(_972);
    int _1010 = _1008 + _938;
    float _1012 = float(uint(_1006));
    float _1014 = float(uint(_1010));
    int _1016 = ~_549;
    int _1018 = _1016 + 1;
    float _1020 = as_type<float>(_587) * _1012;
    float _1022 = as_type<float>(_555) * _1014;
    float _1024 = trunc(_1020);
    float _1026 = precise::max(_1024, 0.0);
    uint _1028 = uint(_1026);
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1032 = trunc(_1022);
    float _1034 = precise::max(_1032, 0.0);
    uint _1036 = uint(_1034);
    int _1038 = _1018 * int(_1028);
    int _1040 = _1038 + _1006;
    float _1042 = float(uint(_1040));
    int _1044 = int(_972) + int(_1036);
    float _1046 = as_type<float>(_587) * _1042;
    int _1048 = _990 * _1044;
    int _1050 = _1048 + _938;
    float _1052 = trunc(_1046);
    float _1054 = precise::max(_1052, 0.0);
    uint _1056 = uint(_1054);
    bool _1058 = uint(_1050) >= uint(_509);
    bool _1060 = !_1058;
    int _1062 = _1060 ? 0 : (-1);
    int _1064 = ~_1044;
    int _1066 = _1064 + _1062;
    int _1068 = _1066 + 1;
    int _1070 = ~_549;
    int _1072 = _1070 + 1;
    int _1074 = int(_1028) + int(_1056);
    int _1076 = _509 * _1068;
    int _1078 = _1076 + _938;
    bool _1080 = !_992;
    int _1082 = _1080 ? _1078 : (-1);
    int _1084 = _1072 * _1074;
    int _1086 = _1084 + _1006;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1090 = _1088 != 0;
    int _1092 = _1082 & 3;
    bool _1094 = _1092 != 0;
    int _1096 = _1082 & 3;
    bool _1098 = _1096 != 0;
    int _1100 = _1094 ? 0 : 1;
    bool _1102 = uint(_1086) >= uint(_549);
    bool _1104 = uint(_1096) >= 2u;
    bool _1106 = !_1102;
    int _1108 = _1106 ? 0 : (-1);
    int _1110 = _1104 ? 0 : 1;
    bool _1112 = uint(_1096) > 1u;
    bool _1114 = _1096 != 3;
    int _1116 = ~_1074;
    int _1118 = _1116 + _1108;
    int _1120 = _1118 + 1;
    int _1122 = ~_1100;
    int _1124 = _1122 + 1;
    int _1126 = _1124 + 1;
    float _1128 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1130 = log2(_1128);
    int _1132 = ~_1110;
    int _1134 = _1132 + 1;
    int _1136 = _1134 + 1;
    int _1138 = _549 * _1120;
    int _1140 = _1138 + _1006;
    float _1142 = _495 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1144 = _1126;
    int _1146 = _1136;
    int _1148 = _1110;
    float _1150 = as_type<float>(_866);
    if (!_1112)
    {
        int _1152 = ~_1100;
        int _1154 = _1152 + 1;
        _1144 = _1154;
    }
    int _1156 = _1144;
    bool _1158 = !_922;
    int _1160 = _1158 ? _1140 : (-1);
    if (_1114)
    {
        int _1162 = ~_1110;
        int _1164 = _1162 + 1;
        _1146 = _1164;
    }
    int _1166 = _1146;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1170 = _1168 != 0;
    int _1172 = _1160 & 3;
    bool _1174 = _1172 != 0;
    bool _1176 = !_1170;
    int _1178 = _1176 ? 0 : 1;
    bool _1180 = uint(_1172) > 1u;
    float _1182 = -_207;
    int _1184 = _1002 ? as_type<int>(_1182) : as_type<int>(_207);
    int _1186 = _1160 & 3;
    bool _1188 = _1186 != 0;
    if (_1090)
    {
        _1148 = 0;
    }
    int _1190 = _1148;
    int _1192 = _1190;
    if (!_1090)
    {
        _1192 = 2;
    }
    int _1194 = _1192;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1198 = _1172 != 3;
    int _1200 = _1188 ? 0 : 1;
    float _1202 = -_1196;
    float _1204 = fma(_1142, 2.0, _1202);
    bool _1206 = uint(_1172) >= 2u;
    float _1208 = _495 * 2.0;
    int _1210 = ~_1200;
    int _1212 = _1210 + 1;
    int _1214 = _1212 + 1;
    int _1216 = _1214;
    float _1218 = _1208;
    if (!_1180)
    {
        int _1220 = ~_1200;
        int _1222 = _1220 + 1;
        _1216 = _1222;
    }
    int _1224 = _1216;
    float _1226 = float(uint(_866));
    int _1228 = _1206 ? 0 : 1;
    bool _1230 = _1194 != 2;
    float _1232 = as_type<float>(_555) * _1226;
    int _1234 = ~_1228;
    int _1236 = _1234 + 1;
    int _1238 = _1236 + 1;
    float _1240 = floor(_1208);
    int _1242 = _1238;
    if (_1198)
    {
        int _1244 = ~_1228;
        int _1246 = _1244 + 1;
        _1242 = _1246;
    }
    int _1248 = _1242;
    float _1250 = _1130 * _141;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1254 = float(uint(_986));
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1258 = _1256 != 0;
    float _1260 = trunc(_1232);
    float _1262 = precise::max(_1260, 0.0);
    uint _1264 = uint(_1262);
    float _1266 = as_type<float>(_587) * _1254;
    bool _1268 = !_1258;
    float _1270 = _1268 ? _207 : as_type<float>(_1184);
    float _1272 = _497 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1274 = _495 > 0.5;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1278 = _1276 != 0;
    float _1280 = fma(_1272, -2.0, _1252);
    float _1282 = exp2(_1250);
    float _1284 = -_217;
    int _1286 = _1274 ? as_type<int>(_1284) : as_type<int>(_217);
    int _1288 = ~_509;
    int _1290 = _1288 + 1;
    bool _1292 = !_1278;
    float _1294 = _1292 ? _217 : as_type<float>(_1286);
    bool _1296 = _1240 > 0.0;
    float _1298 = trunc(_1266);
    float _1300 = precise::max(_1298, 0.0);
    uint _1302 = uint(_1300);
    float _1304 = _1272;
    if (_1230)
    {
        _1218 = _495;
    }
    float _1306 = _1218;
    bool _1308 = _1240 >= 0.0;
    bool _1310 = isnan(_1240);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan(0.0);
    bool _1316 = _1312 || _1314;
    float _1318 = _1306;
    if (!_1230)
    {
        _1318 = _676;
    }
    float _1320 = _1318;
    float _1322 = -_1282;
    float _1324 = _1322 + 1.0;
    int _1326 = _1290 * int(_1264);
    int _1328 = _1326 + _866;
    float _1330 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_1230)
    {
        _1304 = _497;
    }
    float _1332 = _1304;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1336 = _1332;
    if (!_1230)
    {
        _1336 = _495;
    }
    float _1338 = _1336;
    float _1340 = float(uint(_1328));
    int _1342 = _571 * int(_1302);
    int _1344 = _1342 + _986;
    bool _1346 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1348 = isnan(0.0);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1354 = _1350 || _1352;
    float _1356 = -_1334;
    float _1358 = fma(_1330, 2.0, _1356);
    float _1360 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1362 = as_type<float>(_555) * _1340;
    float _1364 = _1354 ? _1324 : 0.0;
    float _1366 = -_141;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1358);
    bool _1370 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1372 = isnan(1.0);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1378 = _1374 || _1376;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1382 = 1.0 + _1380;
    float _1384 = float(uint(_1344));
    float _1386 = trunc(_1362);
    float _1388 = precise::max(_1386, 0.0);
    uint _1390 = uint(_1388);
    float _1392 = fma(_1360, -2.0, _1030);
    float _1394 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1280);
    float _1396 = as_type<float>(_587) * _1384;
    float _1398 = _497 * 2.0;
    float _1400 = 1.0 / _1382;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1406 = ~_509;
    int _1408 = _1406 + 1;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1412 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1402);
    float _1414 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1404);
    float _1416 = floor(_1398);
    float _1418 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1410);
    float _1420 = -_141;
    float _1422 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1204);
    float _1424 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1412);
    int _1426 = int(_1264) + int(_1390);
    float _1428 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1414);
    float _1430 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _537);
    float _1432 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1418);
    float _1434 = trunc(_1396);
    float _1436 = precise::max(_1434, 0.0);
    uint _1438 = uint(_1436);
    float _1440 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1392);
    if (_1378)
    {
        float _1442 = _1364 * _1400;
        _163 = _1442;
    }
    float _1444 = _163;
    int _1446 = _1316 ? 0 : 1;
    float _1448 = in.m_46.x;
    float _1450 = in.m_46.y;
    float _1452 = in.m_46.z;
    float _1454 = _676 * 2.0;
    int _1456 = ~_549;
    int _1458 = _1456 + 1;
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1462 = _489 + _1460;
    bool _1464 = _1416 > 0.0;
    int _1466 = _1408 * _1426;
    int _1468 = _1466 + _866;
    float _1470 = floor(_1454);
    bool _1472 = _1416 >= 0.0;
    bool _1474 = isnan(_1416);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan(0.0);
    bool _1480 = _1476 || _1478;
    float _1482 = fma(_600, _808, _1368);
    int _1484 = ~_1446;
    int _1486 = _1484 + 1;
    int _1488 = _1486 + 1;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1494 = int(_1302) + int(_1438);
    float _1496 = -_1430;
    float _1498 = _1496 + 1.0;
    int _1500 = _1488;
    if (!_1296)
    {
        int _1502 = ~_1446;
        int _1504 = _1502 + 1;
        _1500 = _1504;
    }
    int _1506 = _1500;
    bool _1508 = uint(_1468) >= uint(_509);
    float _1510 = 1.0 / _1492;
    int _1512 = _1458 * _1494;
    int _1514 = _1512 + _986;
    int _1516 = _1480 ? 0 : 1;
    bool _1518 = !_1508;
    int _1520 = _1518 ? 0 : (-1);
    int _1522 = ~_1516;
    int _1524 = _1522 + 1;
    int _1526 = _1524 + 1;
    float _1528 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1530 = uint(_1514) >= uint(_549);
    int _1532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1534 = _1532 != 0;
    float _1536 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1538 = _1526;
    if (!_1464)
    {
        int _1540 = ~_1516;
        int _1542 = _1540 + 1;
        _1538 = _1542;
    }
    int _1544 = _1538;
    float _1546 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1548 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1550 = isnan(_489);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1556 = _1552 || _1554;
    float _1558 = float(_1556);
    float _1560 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1528);
    bool _1562 = !_1530;
    int _1564 = _1562 ? 0 : (-1);
    float _1566 = _521 * _1510;
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1570 = _1568 != 0;
    int _1572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1574 = _1572 != 0;
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1578 = _1576 != 0;
    float _1580 = _497 + _495;
    bool _1582 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1584 = isnan(_489);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = -_1558;
    float _1596 = _1594 + 1.0;
    float _1598 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1546);
    bool _1600 = !_1098;
    int _1602 = _1600 ? 0 : 1;
    float _1604 = _1580 + (-1.0);
    float _1606 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1536);
    bool _1608 = _1470 >= 0.0;
    bool _1610 = isnan(_1470);
    bool _1612 = _1608 || _1610;
    bool _1614 = isnan(0.0);
    bool _1616 = _1612 || _1614;
    float _1618 = fma(_1566, _1462, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1620 = _1592 * _1596;
    float _1622 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1598);
    float _1624 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1626 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1560);
    int _1628 = _1616 ? 0 : 1;
    float _1630 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1606);
    bool _1632 = _1470 > 0.0;
    float _1634 = _1294 + 0.5;
    float _1636 = _1618 * _1620;
    float _1638 = -_1592;
    float _1640 = _1638 + 1.0;
    float _1642 = _1270 + (-0.5);
    float _1644 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1422);
    int _1646 = _1082 >> 31;
    float _1648 = fma(_1640, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1636);
    float _1650 = -_1642;
    float _1652 = -_1394;
    float _1654 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1652);
    int _1656 = _1160 >> 31;
    float _1658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1660 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1648);
    int _1662 = _1646 & 3;
    bool _1664 = !_1174;
    int _1666 = _1664 ? 0 : 1;
    float _1668 = _1660 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1670 = _1656 & 3;
    bool _1672 = _1096 != 3;
    float _1674 = _1626 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1676 = _1082 + _1662;
    float _1678 = -_1428;
    float _1680 = _1678 + 1.0;
    int _1682 = _1160 + _1670;
    float _1684 = _1622 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1688 = _1674 + _1686;
    float _1690 = -_1424;
    float _1692 = _1690 + 1.0;
    int _1694 = _1676 >> 2;
    float _1696 = _1630 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1700 = _1684 + _1698;
    float _1702 = _1688 * _1688;
    int _1704 = _1682 >> 2;
    float _1706 = -_1692;
    float _1708 = fma(_1294, _1706, _1644);
    int _1710 = _1694 << 4;
    int _1712 = _1710 + 368;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1716 = _1696 + _1714;
    float _1718 = fma(_1700, _1700, _1702);
    int _1720 = _1704 << 4;
    int _1722 = _1720 + 512;
    float _1724 = fma(_1270, _1680, _1654);
    uint _1726 = uint(int(uint(_1712) >> uint(2)));
    uint _1728 = uint(int(uint(int(_1726)) >> uint(2)));
    int _1730 = int(_1726) & 3;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[int(_1728)][_1730];
    int _1734 = int(_1726) + 1;
    uint _1736 = uint(int(uint(_1734) >> uint(2)));
    int _1738 = _1734 & 3;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[int(_1736)][_1738];
    float _1742 = fma(_1716, _1716, _1718);
    int _1744 = ~_1628;
    int _1746 = _1744 + 1;
    int _1748 = _1746 + 1;
    float _1750 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1752 = _1748;
    float _1754 = _1674;
    if (!_1632)
    {
        int _1756 = ~_1628;
        int _1758 = _1756 + 1;
        _1752 = _1758;
    }
    int _1760 = _1752;
    float _1762 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1764 = !_1672;
    int _1766 = _1764 ? 0 : (-1);
    float _1768 = rsqrt(_1742);
    uint _1770 = uint(int(uint(_1722) >> uint(2)));
    uint _1772 = uint(int(uint(int(_1770)) >> uint(2)));
    int _1774 = int(_1770) & 3;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[int(_1772)][_1774];
    int _1778 = int(_1770) + 1;
    uint _1780 = uint(int(uint(_1778) >> uint(2)));
    int _1782 = _1778 & 3;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[int(_1780)][_1782];
    float _1786 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1762);
    bool _1788 = _1172 != 3;
    out.m_66.x = _1708;
    out.m_66.y = _1724;
    bool _1790 = !_1570;
    int _1792 = _1790 ? 0 : 1;
    float _1794 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1786);
    bool _1796 = !_1788;
    int _1798 = _1796 ? 0 : (-1);
    out.m_68.w = _1668;
    int _1800 = _1712 + 8;
    uint _1802 = uint(int(uint(_1800) >> uint(2)));
    uint _1804 = uint(int(uint(int(_1802)) >> uint(2)));
    int _1806 = int(_1802) & 3;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[int(_1804)][_1806];
    int _1810 = int(_1802) + 1;
    uint _1812 = uint(int(uint(_1810) >> uint(2)));
    int _1814 = _1810 & 3;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[int(_1812)][_1814];
    int _1818 = abs(_1792);
    bool _1820 = _1794 >= 0.0;
    float _1822 = float(_1760);
    float _1824 = _756 + (-0.5);
    float _1826 = _1688 * _1768;
    int _1828 = _1722 + 8;
    uint _1830 = uint(int(uint(_1828) >> uint(2)));
    uint _1832 = uint(int(uint(int(_1830)) >> uint(2)));
    int _1834 = int(_1830) & 3;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[int(_1832)][_1834];
    int _1838 = int(_1830) + 1;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    int _1842 = _1838 & 3;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[int(_1840)][_1842];
    int _1846 = abs(_1166);
    float _1848 = -_1750;
    float _1850 = -_1440;
    float _1852 = fma(_1848, _1824, _1850);
    float _1854 = -_1826;
    float _1856 = fma(_1854, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1688);
    float _1858 = _1700 * _1768;
    int _1860 = abs(_1602);
    float _1862 = _1856 * _1856;
    float _1864 = float(_1818);
    float _1866 = -_1858;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1700);
    int _1870 = ~_1860;
    int _1872 = _1870 + 1;
    int _1874 = _1872 + 1;
    float _1876 = _1716 * _1768;
    int _1878 = abs(_1666);
    float _1880 = _1864 * _1822;
    int _1882 = abs(_1156);
    float _1884 = fma(_1868, _1868, _1862);
    int _1886 = abs(_1224);
    float _1888 = -_1876;
    float _1890 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1716);
    int _1892 = ~_1882;
    int _1894 = _1892 + 1;
    int _1896 = _1894 + 1;
    float _1898 = _1858;
    if (_1820)
    {
        out.m_49.x = 0.0;
    }
    int _1900 = ~_1886;
    int _1902 = _1900 + 1;
    int _1904 = _1902 + 1;
    float _1906 = fma(_1890, _1890, _1884);
    int _1908 = abs(_1248);
    int _1910 = _1896 * as_type<int>(_1740);
    int _1912 = ~_1846;
    int _1914 = _1912 + 1;
    int _1916 = _1914 + 1;
    int _1918 = abs(_1178);
    int _1920 = _1874 * as_type<int>(_1732);
    int _1922 = _1920 + _1910;
    int _1924 = abs(_1766);
    float _1926 = sqrt(_1906);
    int _1928 = ~_1426;
    int _1930 = _1928 + _1520;
    int _1932 = _1930 + 1;
    int _1934 = _1904 * as_type<int>(_1784);
    int _1936 = ~_1878;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    int _1942 = ~_1494;
    int _1944 = _1942 + _1564;
    int _1946 = _1944 + 1;
    int _1948 = _509 * _1932;
    int _1950 = _1948 + _866;
    bool _1952 = _509 == 0;
    int _1954 = _1940 * as_type<int>(_1776);
    int _1956 = _1954 + _1934;
    int _1958 = _1916 * as_type<int>(_1808);
    int _1960 = _1958 + _1922;
    bool _1962 = !_1534;
    int _1964 = _1962 ? 0 : 1;
    int _1966 = _549 * _1946;
    int _1968 = _1966 + _986;
    int _1970 = ~_1908;
    int _1972 = _1970 + 1;
    int _1974 = _1972 + 1;
    int _1976 = abs(_1964);
    float _1978 = _1768 * _1926;
    int _1980 = ~_1924;
    int _1982 = _1980 + 1;
    int _1984 = _1982 + 1;
    int _1986 = _1974 * as_type<int>(_1836);
    int _1988 = _1986 + _1956;
    int _1990 = abs(_1798);
    int _1992 = _1984 * as_type<int>(_1816);
    int _1994 = _1992 + _1960;
    int _1996 = ~_1990;
    int _1998 = _1996 + 1;
    int _2000 = _1998 + 1;
    float _2002 = in.m_70.x;
    float _2004 = in.m_70.y;
    float _2006 = in.m_70.z;
    int _2008 = ~_1976;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    int _2014 = _2000 * as_type<int>(_1844);
    int _2016 = _2014 + _1988;
    int _2018 = ~_1918;
    int _2020 = _2018 + 1;
    int _2022 = _2020 + 1;
    float _2024 = -_1432;
    float _2026 = _2024 + 1.0;
    if (_1820)
    {
        _1150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2028 = _1150;
    int _2030 = _2016 * _2012;
    bool _2032 = !_1952;
    int _2034 = _2032 ? _1950 : (-1);
    int _2036 = _1994 * _2022;
    bool _2038 = !_922;
    int _2040 = _2038 ? _1968 : (-1);
    float _2042 = -_1498;
    float _2044 = fma(_760, _2042, _1482);
    int _2046 = as_type<int>(_2028);
    if (_1820)
    {
        float _2048 = _2028 * 5.0;
        _2046 = as_type<int>(_2048);
    }
    int _2050 = _2046;
    float _2052 = fma(_756, _2026, _1852);
    int _2054 = _2034 * _1918;
    int _2056 = _2054 + _2036;
    float _2058 = _1880 * (-2.0);
    int _2060 = _2040 * _1976;
    int _2062 = _2060 + _2030;
    if (_1820)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6567 = as_type<float>(_2050);
        out.gl_Position.z = _6567;
    }
    float _2064 = _495 + (-0.5);
    float _2066 = float(_2056);
    float _2068 = fma(_1624, _2058, _1624);
    float _2070 = float(_2062);
    out.m_72.x = _2044;
    out.m_72.y = _2052;
    float _2072 = fma(_2058, _2002, _2002);
    bool _2074 = !_1574;
    int _2076 = _2074 ? 0 : 1;
    out.m_74.x = _2066;
    out.m_74.y = _2070;
    float _2078 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2072);
    float _2080 = _497 + _676;
    float _2082 = _501 * _1978;
    float _2084 = float(_1506);
    float _2086 = _2080 + (-1.0);
    out.m_76.x = _2082;
    bool _2088 = !_1578;
    int _2090 = _2088 ? 0 : 1;
    int _2092 = abs(_2076);
    if (_1820)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2094 = -_1826;
    float _2096 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1674);
    int _2098 = abs(_2090);
    float _2100 = -_1876;
    float _2102 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1696);
    float _2104 = -_1858;
    float _2106 = fma(_2104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1684);
    float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2110 = _2096 + _2108;
    float _2112 = float(_1544);
    float _2114 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2116 = _2102 + _2114;
    float _2118 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2120 = _2106 + _2118;
    float _2122 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2124 = float(_2092);
    float _2126 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2128 = float(_2098);
    float _2130 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2122);
    float _2132 = _497 + (-0.5);
    float _2134 = _2124 * _2084;
    float _2136 = _676 + _495;
    float _2138 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2130);
    float _2140 = _2128 * _2112;
    float _2142 = _2134 * (-2.0);
    float _2144 = _2136 + (-1.0);
    float _2146 = fma(_2068, _1444, _2078);
    bool _2148 = _2138 >= 0.0;
    float _2150 = fma(_2142, _2004, _2004);
    float _2152 = fma(_2126, _2142, _2126);
    float _2154 = _2140 * (-2.0);
    float _2156 = fma(_2132, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2150);
    float _2158 = _2146 * 0.15915493667125701904296875;
    float _2160 = _676 + (-0.5);
    float _2162 = fma(_2144, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2164 = fma(_2152, _1444, _2156);
    float _2166 = fma(_2154, _2006, _2006);
    float _2168 = _2158 * 6.283185482025146484375;
    float _2170 = sin(_2168);
    float _2172 = _2164 * 0.15915493667125701904296875;
    float _2174 = _2126;
    float _2176 = _2120;
    float _2178 = _2116;
    if (_2148)
    {
        _2174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2180 = _2174;
    float _2182 = fma(_2162, _2154, _2162);
    float _2184 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2166);
    int _2186 = as_type<int>(_2180);
    if (_2148)
    {
        out.m_49.x = 0.0;
    }
    float _2188 = _2158 * 6.283185482025146484375;
    float _2190 = cos(_2188);
    if (_2148)
    {
        float _2192 = _2180 * 5.0;
        _2186 = as_type<int>(_2192);
    }
    int _2194 = _2186;
    float _2196 = fma(_2182, _1444, _2184);
    if (_2148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6797 = as_type<float>(_2194);
        out.gl_Position.z = _6797;
    }
    float _2198 = _2196 * 0.15915493667125701904296875;
    float _2200 = _2172 * 6.283185482025146484375;
    float _2202 = sin(_2200);
    float _2204 = _2172 * 6.283185482025146484375;
    float _2206 = cos(_2204);
    if (_2148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2208 = _2198 * 6.283185482025146484375;
    float _2210 = cos(_2208);
    float _2212 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2216 = _2170 * _2202;
    float _2218 = _2190 * _2206;
    float _2220 = _2212 * _1978;
    float _2222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2224 = _2190 * _2202;
    float _2226 = _2198 * 6.283185482025146484375;
    float _2228 = sin(_2226);
    float _2230 = _2220 * _2214;
    float _2232 = _2170 * _2206;
    float _2234 = _2082 * _2222;
    float _2236 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2238 = _2236 * 0.5;
    float _2240 = _2190 * _2210;
    float _2242 = _2206 * _2210;
    float _2244 = _2170 * _2210;
    float _2246 = _2202 * _2210;
    float _2248 = _2240 * _2230;
    float _2250 = fma(_2228, _2218, _2216);
    float _2252 = -_2232;
    float _2254 = fma(_2228, _2224, _2252);
    float _2256 = -_2230;
    float _2258 = _2228 * _2256;
    float _2260 = -_2224;
    float _2262 = fma(_2228, _2232, _2260);
    float _2264 = fma(_2250, _2234, _2248);
    float _2266 = _2244 * _2230;
    float _2268 = fma(_2242, _2234, _2258);
    float _2270 = fma(_2254, _2238, _2264);
    float _2272 = fma(_2228, _2216, _2218);
    float _2274 = fma(_2262, _2234, _2266);
    float _2276 = fma(_2246, _2238, _2268);
    float _2278 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2280 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2282 = fma(_2272, _2238, _2274);
    float _2284 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2278);
    float _2286 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2280);
    float _2288 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2284);
    float _2290 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2286);
    float _2292 = _2288 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2294 = _2290 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2296 = _1696 + _2292;
    float _2298 = _1684 + _2294;
    float _2300 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2302 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2306 = _2296 + _2304;
    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2310 = _2298 + _2308;
    float _2312 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2300);
    float _2314 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2302);
    float _2316 = _2306 * _2306;
    float _2318 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2312);
    float _2320 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2314);
    float _2322 = fma(_2310, _2310, _2316);
    float _2324 = _2318 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2326 = sqrt(_2322);
    float _2328 = _1674 + _2324;
    bool _2330 = _2326 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2332 = _2318;
    float _2334 = _2324;
    float _2336 = _2302;
    if (!_2330)
    {
        _2332 = _2298;
    }
    float _2338 = _2332;
    float _2340 = _2338;
    if (!_2330)
    {
        _2334 = _2296;
    }
    float _2342 = _2334;
    float _2344 = _2342;
    if (!_2330)
    {
        _2336 = _2328;
    }
    float _2346 = _2336;
    bool _2348 = !_2330;
    float _2350 = _2346;
    if (!_2348)
    {
        float _2352 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2356 = _2326 + _2354;
        float _2358 = rsqrt(_2322);
        float _2360 = _2356 * _2352;
        float _2362 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2364 = _2360 * 0.15915493667125701904296875;
        float _2366 = _2364 * 6.283185482025146484375;
        float _2368 = cos(_2366);
        float _2370 = _2364 * 6.283185482025146484375;
        float _2372 = sin(_2370);
        float _2374 = _2368 + (-1.0);
        float _2376 = fma(_2372, _2362, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2378 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2380 = _2358 * _2376;
        float _2382 = fma(_2328, _2368, _2378);
        float _2384 = fma(_2310, _2380, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2386 = fma(_2306, _2380, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2350 = _2382;
        _2340 = _2384;
        _2344 = _2386;
    }
    float _2388 = _2350;
    float _2390 = _2340;
    float _2392 = _2344;
    float _2394 = -_1674;
    float _2396 = _2394 + _2388;
    float _2398 = -_1684;
    float _2400 = _2398 + _2390;
    float _2402 = -_1696;
    float _2404 = _2402 + _2392;
    float _2406 = _2320 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2408 = _2396 * _2396;
    float _2410 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2412 = 1.0 / _2406;
    float _2414 = fma(_2400, _2400, _2408);
    float _2416 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2410);
    bool _2418 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2420 = isnan(0.5);
    bool _2422 = _2418 || _2420;
    bool _2424 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2426 = _2422 || _2424;
    float _2428 = fma(_2404, _2404, _2414);
    float _2430 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2416);
    bool _2432 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2434 = isnan(0.5);
    bool _2436 = _2432 || _2434;
    bool _2438 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2440 = _2436 || _2438;
    float _2442 = sqrt(_2428);
    float _2444 = _2430 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2446 = _2444 + _2406;
    float _2448 = _2446 * _2412;
    float _2450 = _2448 * 0.5;
    bool _2452 = _2442 > 0.0;
    float _2454 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2456 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2454);
    float _2458 = 1.0 / _2456;
    float _2460 = _2412;
    float _2462 = _2450;
    float _2464 = _2406;
    if (!_2452)
    {
        _2460 = _2390;
    }
    float _2466 = _2460;
    float _2468 = _2466;
    if (!_2452)
    {
        _2462 = _2388;
    }
    float _2470 = _2462;
    float _2472 = _2470;
    if (!_2452)
    {
        _2464 = _2392;
    }
    float _2474 = _2464;
    bool _2476 = !_2452;
    float _2478 = _2474;
    float _2480 = _2474;
    if (!_2476)
    {
        float _2482 = _211 * _211;
        float _2484 = fma(_209, _209, _2482);
        float _2486 = rsqrt(_2428);
        float _2488 = fma(_213, _213, _2484);
        float _2490 = sqrt(_2488);
        float _2492 = _2400 * _2486;
        float _2494 = _2396 * _2486;
        float _2496 = _2404 * _2486;
        bool _2498 = _2490 > 0.0;
        float _2500 = _2490;
        float _2502 = _2486;
        if (!_2498)
        {
            _2500 = _2390;
        }
        float _2504 = _2500;
        _2468 = _2504;
        if (!_2498)
        {
            _2502 = _2388;
        }
        float _2506 = _2502;
        _2472 = _2506;
        if (!_2498)
        {
            _2478 = _2392;
        }
        float _2508 = _2478;
        bool _2510 = !_2498;
        _2480 = _2508;
        if (!_2510)
        {
            float _2512 = rsqrt(_2488);
            float _2514 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2516 = _211 * _2512;
            float _2518 = _209 * _2512;
            float _2520 = _213 * _2512;
            float _2522 = _2494 * _2516;
            float _2524 = fma(_2492, _2518, _2522);
            float _2526 = _2514 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2528 = fma(_2496, _2520, _2524);
            float _2530 = _2528 * _2526;
            float _2532 = fma(_209, _2530, _2390);
            float _2534 = fma(_211, _2530, _2388);
            float _2536 = fma(_213, _2530, _2392);
            _2468 = _2532;
            _2472 = _2534;
            _2480 = _2536;
        }
    }
    float _2538 = _2468;
    float _2540 = _2472;
    float _2542 = _2480;
    float _2544 = -_1858;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2538);
    float _2548 = -_1826;
    float _2550 = fma(_2548, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2540);
    float _2552 = -_1876;
    float _2554 = fma(_2552, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2542);
    float _2556 = _2550;
    float _2558 = _2546;
    float _2560 = _2554;
    if (_2440)
    {
        _221 = 1.0;
    }
    float _2562 = _221;
    float _2564 = _2562;
    if (!_2426)
    {
        float _2566 = _2110 * _2110;
        float _2568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2570 = -_1696;
        float _2572 = _2570 + _2542;
        float _2574 = -_1674;
        float _2576 = _2574 + _2540;
        float _2578 = fma(_2120, _2120, _2566);
        float _2580 = fma(_2116, _2116, _2578);
        float _2582 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2584 = sqrt(_2580);
        float _2586 = 1.0 / _1978;
        float _2588 = precise::min(_2584, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2590 = _2588 * _2568;
        float _2592 = _2582 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2594 = -_1684;
        float _2596 = _2594 + _2538;
        float _2598 = _2590 * _2586;
        float _2600 = _2592 * _2598;
        float _2602 = _2572 * _2598;
        float _2604 = fma(_2576, _2600, _2096);
        float _2606 = fma(_2596, _2600, _2106);
        float _2608 = fma(_2592, _2602, _2102);
        _2556 = _2604;
        _2558 = _2606;
        _2560 = _2608;
        _2176 = _2584;
    }
    float _2610 = _2556;
    float _2612 = _2558;
    float _2614 = _2560;
    float _2616 = _2176;
    float _2618 = _2616;
    if (_2440)
    {
        _1754 = 1.0;
    }
    float _2620 = _1754;
    float _2622 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2624 = _2458 * _2622;
    float _2626 = _2620;
    if (!_2440)
    {
        float _2628 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2630 = _2628 * 0.15915493667125701904296875;
        float _2632 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2634 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2636 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2634;
        float _2638 = _2630 * 6.283185482025146484375;
        float _2640 = cos(_2638);
        float _2642 = _2632 * 0.15915493667125701904296875;
        float _2644 = _2630 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        float _2648 = 1.0 / _2640;
        float _2650 = _2642 * 6.283185482025146484375;
        float _2652 = cos(_2650);
        float _2654 = _2646 * _2648;
        float _2656 = _2642 * 6.283185482025146484375;
        float _2658 = sin(_2656);
        float _2660 = _2652 * _2654;
        float _2662 = 1.0 / _2636;
        float _2664 = 1.0 / _2660;
        float _2666 = _2658 * _2664;
        float _2668 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2670 = fma(_2624, _2666, _2668);
        float _2672 = _2670 * _2662;
        float _2674 = precise::clamp(_2672, 0.0, 1.0);
        _2178 = _2642;
        _2618 = _2654;
        _2564 = _2674;
    }
    float _2676 = _2178;
    float _2678 = _2618;
    float _2680 = _2564;
    float _2682 = _2676;
    float _2684 = _2678;
    if (!_2440)
    {
        float _2686 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2688 = _2686 * 0.15915493667125701904296875;
        float _2690 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2692 = _2688 * 6.283185482025146484375;
        float _2694 = cos(_2692);
        float _2696 = _2690 * 0.15915493667125701904296875;
        float _2698 = _2688 * 6.283185482025146484375;
        float _2700 = sin(_2698);
        float _2702 = 1.0 / _2694;
        float _2704 = _2696 * 6.283185482025146484375;
        float _2706 = cos(_2704);
        float _2708 = _2700 * _2702;
        float _2710 = _2696 * 6.283185482025146484375;
        float _2712 = sin(_2710);
        float _2714 = _2706 * _2708;
        float _2716 = 1.0 / _2714;
        float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2720 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2718;
        float _2722 = 1.0 / _2720;
        float _2724 = _2712 * _2716;
        float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2728 = fma(_2624, _2724, _2726);
        float _2730 = _2728 * _2722;
        float _2732 = precise::clamp(_2730, 0.0, 1.0);
        float _2734 = -_2732;
        float _2736 = _2734 + 1.0;
        _2682 = _2702;
        _2684 = _2714;
        _2626 = _2736;
    }
    float _2738 = _2682;
    float _2740 = _2684;
    float _2742 = _2626;
    float _2744 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2746 = _2610 + _2744;
    float _2748 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2750 = _2612 + _2748;
    float _2752 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2754 = _2614 + _2752;
    float _2756 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2758 = _2746 * _2746;
    float _2760 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2756);
    float _2762 = fma(_2750, _2750, _2758);
    float _2764 = fma(_2754, _2754, _2762);
    float _2766 = rsqrt(_2764);
    float _2768 = sqrt(_2764);
    float _2770 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2772 = _2750 * _2770;
    float _2774 = _2754 * _2770;
    float _2776 = _2772 * _2772;
    float _2778 = _2774 * _2774;
    float _2780 = _2776 + _2778;
    float _2782 = sqrt(_2780);
    bool _2784 = _2782 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2788 = _2782 + _2786;
    float _2790 = _2738;
    float _2792 = _2780;
    float _2794 = _2788;
    float _2796 = _2740;
    float _2798 = _2746;
    if (_2784)
    {
        float _2800 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2790 = _2800;
    }
    float _2802 = _2790;
    if (_2784)
    {
        float _2804 = rsqrt(_2780);
        _2792 = _2804;
    }
    float _2806 = _2792;
    float _2808 = _2806;
    if (_2784)
    {
        float _2810 = _2788 * _2802;
        _2794 = _2810;
    }
    float _2812 = _2794;
    if (_2784)
    {
        float _2814 = _2812 * 0.15915493667125701904296875;
        _2796 = _2814;
    }
    float _2816 = _2796;
    float _2818 = _2754;
    float _2820 = _2816;
    if (_2784)
    {
        float _2822 = _2816 * 6.283185482025146484375;
        float _2824 = sin(_2822);
        _2818 = _2824;
    }
    float _2826 = _2818;
    float _2828 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2830 = precise::max(0.0, _2828);
    float _2832 = _2802;
    if (_2784)
    {
        float _2834 = _2816 * 6.283185482025146484375;
        float _2836 = cos(_2834);
        _2832 = _2836;
    }
    float _2838 = _2832;
    float _2840 = -_2770;
    float _2842 = -_2830;
    float _2844 = fma(_2746, _2840, _2842);
    float _2846 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2784)
    {
        float _2848 = _2844 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2798 = _2848;
    }
    float _2850 = _2798;
    float _2852 = _2850;
    if (!_2784)
    {
        _2820 = _2772;
    }
    float _2854 = _2820;
    float _2856 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2858 = _2826;
    float _2860 = _2854;
    if (_2784)
    {
        float _2862 = fma(_2826, _2850, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2858 = _2862;
    }
    float _2864 = _2858;
    float _2866 = _2864;
    if (!_2784)
    {
        _2852 = _2844;
    }
    float _2868 = _2852;
    float _2870 = _2868;
    float _2872 = _2838;
    if (_2784)
    {
        float _2874 = _2838 + (-1.0);
        _2846 = _2874;
    }
    float _2876 = _2846;
    float _2878 = _2876;
    if (_2784)
    {
        float _2880 = _2806 * _2864;
        _1898 = _2880;
    }
    float _2882 = _1898;
    if (!_2784)
    {
        _2808 = _2774;
    }
    float _2884 = _2808;
    float _2886 = _2884;
    if (_2784)
    {
        float _2888 = _2876 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2878 = _2888;
    }
    float _2890 = _2878;
    if (_2784)
    {
        float _2892 = _2772 * _2882;
        _2860 = _2892;
    }
    float _2894 = _2860;
    if (!_2784)
    {
        _2866 = _2776;
    }
    float _2896 = _2866;
    float _2898 = _2896;
    if (_2784)
    {
        float _2900 = _2774 * _2882;
        _2886 = _2900;
    }
    float _2902 = _2886;
    if (_2784)
    {
        float _2904 = fma(_2844, _2838, _2890);
        _2870 = _2904;
    }
    float _2906 = _2870;
    if (_2784)
    {
        float _2908 = _2894 * _2894;
        _2898 = _2908;
    }
    float _2910 = _2898;
    if (!_2784)
    {
        _2872 = _2778;
    }
    float _2912 = _2872;
    float _2914 = _2912;
    if (_2784)
    {
        float _2916 = _2902 * _2902;
        _2914 = _2916;
    }
    float _2918 = _2914;
    float _2920 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2922 = fma(_2906, _2906, _2910);
    float _2924 = floor(_2856);
    float _2926 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2920);
    float _2928 = _2922 + _2918;
    float _2930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2932 = fma(_2768, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2930);
    float _2934 = precise::clamp(_2932, 0.0, 1.0);
    float _2936 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2926);
    float _2938 = rsqrt(_2928);
    float _2940 = -_2934;
    float _2942 = _2940 + 1.0;
    float _2944 = _2936 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2946 = fma(_2102, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2948 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2950 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2952 = abs(_2942);
    float _2954 = log2(_2952);
    float _2956 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2958 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2960 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2948);
    float _2962 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2956);
    float _2964 = -_2958;
    float _2966 = fma(_2964, _2950, 1.0);
    float _2968 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2960);
    float _2970 = _2938 * _2894;
    float _2972 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2962);
    float _2974 = _2938 * _2906;
    float _2976 = _2938 * _2902;
    float _2978 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2980 = _2972 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2982 = _2968 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2984 = floor(_2946);
    float _2986 = -_2978;
    float _2988 = fma(_2974, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2986);
    float _2990 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2992 = _2954 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2994 = -_2976;
    float _2996 = fma(_2994, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2988);
    float _2998 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2760);
    float _3000 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2990);
    float _3002 = exp2(_2992);
    float _3004 = fma(_2996, -0.5, 0.5);
    float _3006 = _2998 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3008 = fma(_2944, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3000);
    float _3010 = fma(_2996, 0.5, 0.5);
    float _3012 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3014 = fma(_3006, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3008);
    float _3016 = log2(_2966);
    float _3018 = -_2984;
    float _3020 = _2946 + _3018;
    float _3022 = fma(_3010, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3024 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3012);
    float _3026 = fma(_3010, _3022, -0.212114393711090087890625);
    float _3028 = fma(_2944, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3024);
    float _3030 = 1.0 / _3014;
    float _3032 = -_2924;
    float _3034 = _2856 + _3032;
    float _3036 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3038 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3036);
    float _3040 = _2974 + 1.0;
    float _3042 = sqrt(_3004);
    float _3044 = _3016 * 0.693147182464599609375;
    float _3046 = fma(_2944, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3038);
    float _3048 = -_2974;
    float _3050 = fma(_3002, _3040, _3048);
    float _3052 = fma(_3010, _3026, 1.570728778839111328125);
    float2 _8150 = float2(_3034, _3020);
    float _3054 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8150, float2(0.0), isnan(_8150)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8150, float2(0.0), isnan(_8150)), level(0.0)).x;
    float _3056 = fma(_3006, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3046);
    float _3058 = fma(_3006, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3028);
    float _3060 = _3044 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3062 = fma(_3050, 0.5, 0.5);
    float _3064 = _3056 * _3030;
    float _3066 = _3058 * _3030;
    float _3068 = fma(_3064, 0.5, 0.5);
    float _3070 = fma(_3066, -0.5, 0.5);
    float _3072 = _3042 * 0.636619746685028076171875;
    float _3074 = -_3052;
    float _3076 = fma(_3072, _3074, 1.0);
    float3 _8195 = float3(_3068, _3070, _3060);
    float _3078 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8195, float3(0.0), isnan(_8195)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8195, float3(0.0), isnan(_8195)), level(0.0)).x;
    float3 _8206 = float3(_3068, _3070, _3060);
    float4 _3081 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8206, float3(0.0), isnan(_8206)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8206, float3(0.0), isnan(_8206)), level(0.0)).xyzw;
    float _3083 = _3081.x;
    float _3085 = _3081.y;
    float _3087 = _3081.z;
    float _3089 = _3081.w;
    float2 _8222 = float2(_3076, _3062);
    float3 _3093 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8222, float2(0.0), isnan(_8222)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8222, float2(0.0), isnan(_8222)), level(0.0)).xyz;
    float _3095 = _3093.x;
    float _3097 = _3093.y;
    float _3099 = _3093.z;
    float _3101 = abs(_2624);
    float _3103 = log2(_3101);
    float _3105 = _2250 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3107 = _2250 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3109 = _2250 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3111 = _2240 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3113 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3105);
    float _3115 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3107);
    float _3117 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3109);
    float _3119 = _2240 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3121 = _2240 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3123 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3125 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3127 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3129 = -_2228;
    float _3131 = fma(_3129, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3111);
    float _3133 = -_2228;
    float _3135 = fma(_3133, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3121);
    float _3137 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3139 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3141 = -_2228;
    float _3143 = fma(_3141, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3119);
    float _3145 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3123);
    float _3147 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3125);
    float _3149 = exp2(_3139);
    float _3151 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3127);
    float _3153 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3143);
    float _3155 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3145);
    float _3157 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3147);
    float _3159 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3151);
    float _3161 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3113);
    float _3163 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3131);
    float _3165 = fma(_3137, _3137, 1.0);
    float _3167 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3169 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3135);
    float _3171 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3173 = rsqrt(_3165);
    float _3175 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3115);
    float _3177 = _2954 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3179 = fma(_3149, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3181 = precise::clamp(_3179, 0.0, 1.0);
    float _3183 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3117);
    float _3185 = _3137 * _3163;
    float _3187 = _3181 * _3181;
    float _3189 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3171);
    float _3191 = fma(_3181, -2.0, 3.0);
    float _3193 = _3137 * _3153;
    float _3195 = exp2(_3177);
    float _3197 = fma(_3167, _3175, _3185);
    float _3199 = _3187 * _3191;
    float _3201 = fma(_3167, _3161, _3193);
    float _3203 = _3137 * _3169;
    float _3205 = _3137 * _3173;
    float _3207 = -_3199;
    float _3209 = _3207 + 1.0;
    out.m_78.x = _3161;
    out.m_78.y = _3175;
    out.m_78.z = _3183;
    float _3211 = fma(_3167, _3183, _3203);
    float _3213 = -_3155;
    float _3215 = _3205 * _3213;
    float _3217 = fma(_3209, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3199);
    float _3219 = fma(_2944, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3189);
    float _3221 = in.m_80.x;
    float _3223 = fma(_3173, _3153, _3215);
    float _3225 = _3155 + _3201;
    float _3227 = _3157 + _3197;
    float _3229 = -_3195;
    float _3231 = _3229 + 1.0;
    out.m_82.x = _2612;
    out.m_82.y = _2610;
    out.m_82.z = _2614;
    bool _3233 = _2768 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3235 = isnan(_2768);
    bool _3237 = _3233 || _3235;
    bool _3239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3241 = _3237 || _3239;
    float _3243 = -_3157;
    float _3245 = _3205 * _3243;
    float _3247 = -_3159;
    float _3249 = _3205 * _3247;
    float _3251 = _3231 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3253 = fma(_3173, _3163, _3245);
    bool _3255 = _2624 <= 8000.0;
    bool _3257 = isnan(_2624);
    bool _3259 = _3255 || _3257;
    bool _3261 = isnan(8000.0);
    bool _3263 = _3259 || _3261;
    float _3265 = float(_3263);
    float _3267 = fma(_3173, _3169, _3249);
    float _3269 = fma(_3006, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3219);
    float _3271 = _3014 * 0.5;
    float _3273 = _3056 + _3014;
    float _3275 = _3265 * _3217;
    out.m_84.x = _3223;
    out.m_84.y = _3253;
    out.m_84.z = _3267;
    float _3277 = _3269 + _3014;
    float _3279 = fma(_3058, -0.5, _3271);
    float _3281 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3056;
    out.gl_Position.y = _3058;
    out.gl_Position.z = _3269;
    out.gl_Position.w = _3014;
    float _3283 = _3277 * 0.5;
    float _3285 = _3159 + _3211;
    float _3287 = _3273 * 0.5;
    out.m_86.x = _3225;
    out.m_86.y = _3227;
    out.m_86.z = _3285;
    float _3289 = _3157;
    float _3291 = _3267;
    float _3293 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3241)
    {
        _3289 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3295 = _3289;
    float _3297 = _3295;
    float _3299 = _3295;
    if (!_3241)
    {
        _3291 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3301 = _3291;
    out.m_88.z = _3283;
    out.m_88.w = _3014;
    out.m_90.x = _3287;
    out.m_90.y = _3279;
    out.m_90.z = _3283;
    out.m_90.w = _3014;
    float _3303 = -_3054;
    float _3305 = _3303 + 1.0;
    float _3307 = _3305 * _3281;
    float _3309 = precise::clamp(_3307, 0.0, 1.0);
    float _3311 = -_3309;
    float _3313 = fma(_3311, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3315 = _3085;
    float _3317 = _3301;
    float _3319 = _3301;
    if (!_3241)
    {
        _3293 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3321 = _3293;
    float _3323 = _3313 * _3221;
    float _3325 = _3323 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3327 = _3251 * _3078;
    float _3329 = -_3251;
    float _3331 = _3329 + 1.0;
    float _3333 = _3089 * _3327;
    float _3335 = _3099 * _3327;
    float _3337 = _3089 * _3331;
    out.m_92.x = _3325;
    float _3339 = fma(_3095, _3333, _3083);
    float _3341 = fma(_3097, _3333, _3085);
    float _3343 = fma(_3089, _3335, _3087);
    float _3345 = _2680 * _2742;
    float _3347 = _3327;
    float _3349 = _3345;
    float _3351 = _3321;
    float _3353 = _3321;
    if (!_3241)
    {
        _3347 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3355 = _3347;
    float _3357 = _3355;
    float _3359 = _3355;
    if (!_3241)
    {
        _3315 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3361 = _3315;
    out.m_94.x = _3339;
    out.m_94.y = _3341;
    out.m_94.z = _3343;
    out.m_94.w = _3337;
    float _3363 = _3345 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3365 = _3361;
    float _3367 = _3361;
    if (!_3241)
    {
        _3349 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3369 = _3349;
    bool _3371 = !_3241;
    float _3373 = _3369;
    float _3375 = _3369;
    if (!_3371)
    {
        bool _3377 = _2768 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3379 = isnan(_2768);
        bool _3381 = _3377 || _3379;
        bool _3383 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3385 = _3381 || _3383;
        if (!_3385)
        {
            float _3387 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3389 = _2768 + _3387;
            float _3391 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3393 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3391;
            float _3395 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3397 = _3395 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3399 = 1.0 / _3393;
            float _3401 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3403 = _3401 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3405 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3407 = _3405 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3409 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3411 = _3409 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3413 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3415 = _3413 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3417 = _3389 * _3399;
            float _3419 = precise::clamp(_3417, 0.0, 1.0);
            float _3421 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3423 = _3421 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3425 = fma(_3419, _3397, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3427 = fma(_3419, _3423, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3429 = fma(_3419, _3403, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3431 = fma(_3419, _3407, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3433 = fma(_3419, _3411, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3435 = fma(_3419, _3415, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3319 = _3429;
            _3367 = _3433;
            _3299 = _3425;
            _3359 = _3431;
            _3353 = _3427;
            _3375 = _3435;
            _3437 = true;
        }
        else
        {
            bool _3439 = _2768 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3441 = isnan(_2768);
            bool _3443 = _3439 || _3441;
            bool _3445 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3447 = _3443 || _3445;
            if (!_3447)
            {
                _3297 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3449 = _3297;
            _3299 = _3449;
            if (!_3447)
            {
                _3317 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3451 = _3317;
            _3319 = _3451;
            if (!_3447)
            {
                _3351 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3453 = _3351;
            _3353 = _3453;
            if (!_3447)
            {
                _3357 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3455 = _3357;
            _3359 = _3455;
            if (!_3447)
            {
                _3365 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3457 = _3365;
            _3367 = _3457;
            if (!_3447)
            {
                _3373 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3459 = _3373;
            bool _3461 = !_3447;
            _3375 = _3459;
            if (!_3461)
            {
                bool _3463 = _2768 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3465 = isnan(_2768);
                bool _3467 = _3463 || _3465;
                bool _3469 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3471 = _3467 || _3469;
                if (!_3471)
                {
                    float _3473 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3475 = _2768 + _3473;
                    float _3477 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3479 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3477;
                    float _3481 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3483 = _3481 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3485 = 1.0 / _3479;
                    float _3487 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3489 = _3487 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3491 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3493 = _3491 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3495 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3497 = _3495 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3499 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3501 = _3499 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3503 = _3475 * _3485;
                    float _3505 = precise::clamp(_3503, 0.0, 1.0);
                    float _3507 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3509 = _3507 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3511 = fma(_3505, _3483, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3513 = fma(_3505, _3509, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3515 = fma(_3505, _3489, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3517 = fma(_3505, _3493, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3519 = fma(_3505, _3497, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3521 = fma(_3505, _3501, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3319 = _3515;
                    _3367 = _3519;
                    _3299 = _3511;
                    _3359 = _3517;
                    _3353 = _3513;
                    _3375 = _3521;
                    _3437 = true;
                }
                else
                {
                    _3319 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3367 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3299 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3359 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3353 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3375 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3437 = false;
    float _3523 = _3319;
    float _3525 = _3367;
    float _3527 = _3299;
    float _3529 = _3359;
    float _3531 = _3353;
    float _3533 = _3375;
    float _3535 = fma(_3227, -0.5, 0.5);
    float _3537 = precise::clamp(_3535, 0.0, 1.0);
    float _3539 = -_3523;
    float _3541 = _3539 + _3525;
    float _3543 = _3363 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3545 = -_3527;
    float _3547 = _3545 + _3529;
    float _3549 = fma(_3537, _3541, _3523);
    out.m_96.x = 0.0;
    float _3551 = -_3531;
    float _3553 = _3551 + _3533;
    float _3555 = fma(_3537, _3547, _3527);
    float _3557 = _3549 * 0.586610972881317138671875;
    out.m_49.x = _3543;
    bool _3559 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3561 = fma(_3537, _3553, _3531);
    float _3563 = fma(_3555, 0.298911988735198974609375, _3557);
    bool _3565 = _2680 > 0.0;
    bool _3567 = isnan(_2680);
    bool _3569 = _3565 || _3567;
    bool _3571 = isnan(0.0);
    bool _3573 = _3569 || _3571;
    float _3575 = fma(_3561, 0.114477999508380889892578125, _3563);
    bool _3577 = _2742 <= 0.0;
    bool _3579 = !_3573;
    bool _3581 = _3577 || _3579;
    float _3583 = -_3575;
    float _3585 = _3549 + _3583;
    float _3587 = -_3575;
    float _3589 = _3555 + _3587;
    float _3591 = -_3575;
    float _3593 = _3561 + _3591;
    float _3595 = fma(_3585, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3575);
    float _3597 = fma(_3589, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3575);
    float _3599 = fma(_3593, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3575);
    bool _3601 = !_3559;
    if (!_3601)
    {
        float _3603 = -_2610;
        float _3605 = _3603 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3607 = -_2612;
        float _3609 = _3607 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3611 = -_2614;
        float _3613 = _3611 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3615 = _3605 * _3605;
        float _3617 = fma(_3609, _3609, _3615);
        float _3619 = fma(_3613, _3613, _3617);
        float _3621 = sqrt(_3619);
        float _3623 = rsqrt(_3619);
        float _3625 = -_3621;
        float _3627 = _3625 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3629 = _3627 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3631 = precise::clamp(_3629, 0.0, 1.0);
        float _3633 = _3609 * _3623;
        float _3635 = _3605 * _3623;
        float _3637 = abs(_3631);
        float _3639 = log2(_3637);
        float _3641 = _3613 * _3623;
        float _3643 = _3633 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3645 = _3227 * _3635;
        float _3647 = -_3635;
        float _3649 = -_3643;
        float _3651 = fma(_3647, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3649);
        float _3653 = fma(_3225, _3633, _3645);
        float _3655 = -_3641;
        float _3657 = fma(_3655, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3651);
        float _3659 = fma(_3285, _3641, _3653);
        float _3661 = precise::clamp(_3659, 0.0, 1.0);
        float _3663 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3665 = _3657 + _3663;
        float _3667 = _3639 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3669 = _3665 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3671 = precise::clamp(_3669, 0.0, 1.0);
        float _3673 = exp2(_3667);
        float _3675 = _3673 * _3671;
        float _3677 = _3661 * _3675;
        float _3679 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3681 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3683 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3679;
        out.m_96.y = _3681;
        out.m_96.z = _3683;
    }
    out.m_98.x = _3597;
    out.m_98.y = _3595;
    out.m_98.z = _3599;
    if (!_3581)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3685 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3685;
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
    bool _3437 = false;
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
        float _3741 = as_type<float>(_131);
        out.gl_Position.z = _3741;
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
        float _3814 = as_type<float>(_173);
        out.gl_Position.z = _3814;
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
    bool _249 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _251 = isnan(_243);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _243 + _261;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = -_259;
    float _275 = _273 + 1.0;
    float _277 = 1.0 / _267;
    bool _279 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _281 = isnan(_243);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = 1.0 / _271;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _295;
    float _299 = _247 * _277;
    bool _301 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _303 = isnan(_243);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = in.m_62.x;
    float _315 = in.m_62.y;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _317;
    float _321 = fma(_297, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _323 = _311 * _275;
    float _325 = -_311;
    float _327 = _325 + 1.0;
    float _329 = fma(_319, _299, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = _263 * _293;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _337 = _289 * _327;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _343 = -_289;
    float _345 = _343 + 1.0;
    float _347 = fma(_335, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _349 = _329 * _337;
    float _351 = _321 * _337;
    float _353 = fma(_341, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _355 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].x, _349);
    float _357 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].y, _351);
    float _359 = fma(_353, _323, _355);
    float _361 = fma(_347, _323, _357);
    float _363 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[145].x, _359);
    float _365 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[145].y, _361);
    float _367 = _363 * _313;
    float _369 = _365 * _315;
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
    bool _399 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _401 = isnan(_393);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _415 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _417 = isnan(_393);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _427;
    float _431 = -_409;
    float _433 = _431 + 1.0;
    bool _435 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _437 = 1.0 / _413;
    float _439 = _425 * _433;
    float _441 = -_425;
    float _443 = _441 + 1.0;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _447 = _445 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _449 = _429 * _437;
    float _451 = fma(_449, _397, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _455 = _451 * _439;
    float _457 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _459 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[115].x, _455);
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _463 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[116].x, _459);
    float _465 = _461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = _463 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _447;
    out.m_64.y = _465;
    out.m_64.z = _457;
    out.m_64.w = _467;
    bool _469 = !_435;
    float _471 = _465;
    if (!_469)
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
    float _507 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _509 = int(_507);
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _513 = float(_493);
    float _515 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _517 = int(_515);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _519;
    if (_505)
    {
        _471 = 1.0;
    }
    float _523 = _471;
    float _525 = _523;
    if (!_505)
    {
        _525 = 7.345489978790283203125;
    }
    float _527 = _525;
    float _529 = float(uint(_509));
    float _531 = 1.0 / _513;
    float _533 = _527 * _495;
    bool _535 = _509 == 0;
    float _537 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[88].z, _511);
    bool _539 = _497 > 0.5;
    float _541 = float(_517);
    float _543 = 1.0 / _529;
    float _545 = _531 * _141;
    float _547 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _549 = int(_547);
    float _551 = trunc(_545);
    int _553 = int(_551);
    int _555 = as_type<int>(_543) + (-2);
    float _557 = 1.0 / _541;
    float _559 = float(uint(_549));
    int _561 = ~_549;
    int _563 = _561 + 1;
    int _565 = ~_549;
    int _567 = _565 + 1;
    int _569 = ~_549;
    int _571 = _569 + 1;
    float _573 = 1.0 / _559;
    float _575 = float(uint(_553));
    int _577 = ~_509;
    int _579 = _577 + 1;
    float _581 = as_type<float>(_555) * _575;
    float _583 = _557 * _141;
    float _585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _587 = as_type<int>(_573) + (-2);
    float _589 = trunc(_583);
    int _591 = int(_589);
    float _593 = trunc(_581);
    float _595 = precise::max(_593, 0.0);
    uint _598 = uint(_595);
    float _600 = _585 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _602 = float(uint(_591));
    float _604 = _581;
    float _606 = _602;
    if (_505)
    {
        _604 = _495;
    }
    float _608 = _604;
    float _610 = _608;
    if (!_505)
    {
        _610 = _497;
    }
    float _612 = _610;
    float _614 = as_type<float>(_587) * _602;
    if (_505)
    {
        _606 = 1.0;
    }
    float _616 = _606;
    int _618 = _579 * int(_598);
    int _620 = _618 + _553;
    float _622 = trunc(_614);
    float _624 = precise::max(_622, 0.0);
    uint _626 = uint(_624);
    float _628 = _616;
    if (!_505)
    {
        _628 = 1.2345600128173828125;
    }
    float _630 = _628;
    float _632 = float(_591);
    float _634 = float(uint(_620));
    float _636 = _630 * _612;
    float _638 = as_type<float>(_555) * _634;
    int _640 = ~_509;
    int _642 = _640 + 1;
    float _644 = floor(_533);
    int _646 = _563 * int(_626);
    int _648 = _646 + _591;
    float _650 = trunc(_638);
    float _652 = precise::max(_650, 0.0);
    uint _654 = uint(_652);
    float _656 = float(uint(_648));
    float _658 = as_type<float>(_587) * _656;
    float _660 = float(_509);
    float _662 = floor(_636);
    float _664 = -_644;
    float _666 = _533 + _664;
    int _668 = int(_598) + int(_654);
    float _670 = trunc(_658);
    float _672 = precise::max(_670, 0.0);
    uint _674 = uint(_672);
    float _676 = in.m_60.z;
    int _678 = _642 * _668;
    int _680 = _678 + _553;
    float _682 = -_662;
    float _684 = _636 + _682;
    bool _686 = uint(_680) >= uint(_509);
    float _688 = float(_553);
    bool _690 = !_686;
    int _692 = _690 ? 0 : (-1);
    bool _694 = _688 >= _660;
    bool _696 = isnan(_688);
    bool _698 = _694 || _696;
    bool _700 = isnan(_660);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    int _706 = ~_668;
    int _708 = _706 + _692;
    int _710 = _708 + 1;
    float _712 = _666 * _660;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _716 = _714 != 0;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _720 = _718 != 0;
    float _722 = _660 * _499;
    float _724 = trunc(_704);
    int _726 = int(_724);
    int _728 = _509 * _710;
    int _730 = _728 + _553;
    int _732 = int(_626) + int(_674);
    bool _734 = _676 > 0.5;
    float _736 = -_217;
    int _738 = _539 ? as_type<int>(_736) : as_type<int>(_217);
    int _740 = _567 * _732;
    int _742 = _740 + _591;
    float _744 = -_207;
    int _746 = _734 ? as_type<int>(_744) : as_type<int>(_207);
    float _748 = trunc(_722);
    int _750 = int(_748);
    float _752 = float(_549);
    bool _754 = !_720;
    float _756 = _754 ? _207 : as_type<float>(_746);
    bool _758 = !_716;
    float _760 = _758 ? _217 : as_type<float>(_738);
    float _762 = _752 * _499;
    int _764 = ~_726;
    int _766 = _764 + 1;
    int _768 = _766 + 1;
    bool _770 = !_535;
    int _772 = _770 ? _730 : (-1);
    float _774 = _684 * _752;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _778 = _776 != 0;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _782 = _780 != 0;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _786 = _784 != 0;
    float _788 = trunc(_762);
    int _790 = int(_788);
    bool _792 = _632 >= _752;
    bool _794 = isnan(_632);
    bool _796 = _792 || _794;
    bool _798 = isnan(_752);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    int _804 = _772 * _768;
    int _806 = _509 + (-1);
    float _808 = _760 + 0.5;
    bool _810 = !_782;
    int _812 = _810 ? 0 : 1;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _816 = _814 != 0;
    float _818 = trunc(_712);
    int _820 = int(_818);
    int _822 = abs(_812);
    int _824 = _726 * _806;
    int _826 = _824 + _804;
    bool _828 = uint(_742) >= uint(_549);
    bool _830 = !_816;
    int _832 = _830 ? 0 : 1;
    float _834 = trunc(_802);
    int _836 = int(_834);
    bool _838 = !_778;
    int _840 = _838 ? 0 : 1;
    int _842 = _826 * _822;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _850 = _848 != 0;
    bool _852 = !_828;
    int _854 = _852 ? 0 : (-1);
    int _856 = abs(_832);
    int _858 = abs(_840);
    bool _860 = !_846;
    int _862 = _860 ? 0 : 1;
    int _864 = _820 * _856;
    int _866 = _864 + _553;
    bool _868 = !_850;
    int _870 = _868 ? 0 : 1;
    int _872 = _750 * _858;
    int _874 = _872 + _842;
    bool _876 = !_786;
    int _878 = _876 ? 0 : 1;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _882 = _880 != 0;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _886 = _884 != 0;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _890 = _888 != 0;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _894 = _892 != 0;
    int _896 = ~_732;
    int _898 = _896 + _854;
    int _900 = _898 + 1;
    int _902 = abs(_878);
    float _904 = trunc(_774);
    int _906 = int(_904);
    int _908 = abs(_862);
    int _910 = _549 * _900;
    int _912 = _910 + _591;
    bool _914 = !_886;
    int _916 = _914 ? 0 : 1;
    int _918 = _866 * _902;
    int _920 = _918 + _874;
    bool _922 = _549 == 0;
    int _924 = abs(_870);
    int _926 = ~_836;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    bool _932 = !_922;
    int _934 = _932 ? _912 : (-1);
    int _936 = _820 * _908;
    int _938 = _936 + _920;
    int _940 = _549 + (-1);
    int _942 = abs(_916);
    int _944 = _934 * _930;
    float _946 = float(uint(_938));
    bool _948 = !_890;
    int _950 = _948 ? 0 : 1;
    int _952 = _836 * _940;
    int _954 = _952 + _944;
    bool _956 = !_882;
    int _958 = _956 ? 0 : 1;
    float _960 = as_type<float>(_555) * _946;
    int _962 = abs(_950);
    int _964 = _954 * _942;
    int _966 = abs(_958);
    float _968 = trunc(_960);
    float _970 = precise::max(_968, 0.0);
    uint _972 = uint(_970);
    bool _974 = !_894;
    int _976 = _974 ? 0 : 1;
    int _978 = _790 * _966;
    int _980 = _978 + _964;
    int _982 = abs(_976);
    int _984 = _906 * _924;
    int _986 = _984 + _591;
    int _988 = ~_509;
    int _990 = _988 + 1;
    bool _992 = _509 == 0;
    int _994 = _986 * _962;
    int _996 = _994 + _980;
    int _998 = ~_509;
    int _1000 = _998 + 1;
    bool _1002 = _497 > 0.5;
    int _1004 = _906 * _982;
    int _1006 = _1004 + _996;
    int _1008 = _1000 * int(_972);
    int _1010 = _1008 + _938;
    float _1012 = float(uint(_1006));
    float _1014 = float(uint(_1010));
    int _1016 = ~_549;
    int _1018 = _1016 + 1;
    float _1020 = as_type<float>(_587) * _1012;
    float _1022 = as_type<float>(_555) * _1014;
    float _1024 = trunc(_1020);
    float _1026 = precise::max(_1024, 0.0);
    uint _1028 = uint(_1026);
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1032 = trunc(_1022);
    float _1034 = precise::max(_1032, 0.0);
    uint _1036 = uint(_1034);
    int _1038 = _1018 * int(_1028);
    int _1040 = _1038 + _1006;
    float _1042 = float(uint(_1040));
    int _1044 = int(_972) + int(_1036);
    float _1046 = as_type<float>(_587) * _1042;
    int _1048 = _990 * _1044;
    int _1050 = _1048 + _938;
    float _1052 = trunc(_1046);
    float _1054 = precise::max(_1052, 0.0);
    uint _1056 = uint(_1054);
    bool _1058 = uint(_1050) >= uint(_509);
    bool _1060 = !_1058;
    int _1062 = _1060 ? 0 : (-1);
    int _1064 = ~_1044;
    int _1066 = _1064 + _1062;
    int _1068 = _1066 + 1;
    int _1070 = ~_549;
    int _1072 = _1070 + 1;
    int _1074 = int(_1028) + int(_1056);
    int _1076 = _509 * _1068;
    int _1078 = _1076 + _938;
    bool _1080 = !_992;
    int _1082 = _1080 ? _1078 : (-1);
    int _1084 = _1072 * _1074;
    int _1086 = _1084 + _1006;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1090 = _1088 != 0;
    int _1092 = _1082 & 3;
    bool _1094 = _1092 != 0;
    int _1096 = _1082 & 3;
    bool _1098 = _1096 != 0;
    int _1100 = _1094 ? 0 : 1;
    bool _1102 = uint(_1086) >= uint(_549);
    bool _1104 = uint(_1096) >= 2u;
    bool _1106 = !_1102;
    int _1108 = _1106 ? 0 : (-1);
    int _1110 = _1104 ? 0 : 1;
    bool _1112 = uint(_1096) > 1u;
    bool _1114 = _1096 != 3;
    int _1116 = ~_1074;
    int _1118 = _1116 + _1108;
    int _1120 = _1118 + 1;
    int _1122 = ~_1100;
    int _1124 = _1122 + 1;
    int _1126 = _1124 + 1;
    float _1128 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1130 = log2(_1128);
    int _1132 = ~_1110;
    int _1134 = _1132 + 1;
    int _1136 = _1134 + 1;
    int _1138 = _549 * _1120;
    int _1140 = _1138 + _1006;
    float _1142 = _495 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1144 = _1126;
    int _1146 = _1136;
    int _1148 = _1110;
    float _1150 = as_type<float>(_866);
    if (!_1112)
    {
        int _1152 = ~_1100;
        int _1154 = _1152 + 1;
        _1144 = _1154;
    }
    int _1156 = _1144;
    bool _1158 = !_922;
    int _1160 = _1158 ? _1140 : (-1);
    if (_1114)
    {
        int _1162 = ~_1110;
        int _1164 = _1162 + 1;
        _1146 = _1164;
    }
    int _1166 = _1146;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1170 = _1168 != 0;
    int _1172 = _1160 & 3;
    bool _1174 = _1172 != 0;
    bool _1176 = !_1170;
    int _1178 = _1176 ? 0 : 1;
    bool _1180 = uint(_1172) > 1u;
    float _1182 = -_207;
    int _1184 = _1002 ? as_type<int>(_1182) : as_type<int>(_207);
    int _1186 = _1160 & 3;
    bool _1188 = _1186 != 0;
    if (_1090)
    {
        _1148 = 0;
    }
    int _1190 = _1148;
    int _1192 = _1190;
    if (!_1090)
    {
        _1192 = 2;
    }
    int _1194 = _1192;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1198 = _1172 != 3;
    int _1200 = _1188 ? 0 : 1;
    float _1202 = -_1196;
    float _1204 = fma(_1142, 2.0, _1202);
    bool _1206 = uint(_1172) >= 2u;
    float _1208 = _495 * 2.0;
    int _1210 = ~_1200;
    int _1212 = _1210 + 1;
    int _1214 = _1212 + 1;
    int _1216 = _1214;
    float _1218 = _1208;
    if (!_1180)
    {
        int _1220 = ~_1200;
        int _1222 = _1220 + 1;
        _1216 = _1222;
    }
    int _1224 = _1216;
    float _1226 = float(uint(_866));
    int _1228 = _1206 ? 0 : 1;
    bool _1230 = _1194 != 2;
    float _1232 = as_type<float>(_555) * _1226;
    int _1234 = ~_1228;
    int _1236 = _1234 + 1;
    int _1238 = _1236 + 1;
    float _1240 = floor(_1208);
    int _1242 = _1238;
    if (_1198)
    {
        int _1244 = ~_1228;
        int _1246 = _1244 + 1;
        _1242 = _1246;
    }
    int _1248 = _1242;
    float _1250 = _1130 * _141;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1254 = float(uint(_986));
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1258 = _1256 != 0;
    float _1260 = trunc(_1232);
    float _1262 = precise::max(_1260, 0.0);
    uint _1264 = uint(_1262);
    float _1266 = as_type<float>(_587) * _1254;
    bool _1268 = !_1258;
    float _1270 = _1268 ? _207 : as_type<float>(_1184);
    float _1272 = _497 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1274 = _495 > 0.5;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1278 = _1276 != 0;
    float _1280 = fma(_1272, -2.0, _1252);
    float _1282 = exp2(_1250);
    float _1284 = -_217;
    int _1286 = _1274 ? as_type<int>(_1284) : as_type<int>(_217);
    int _1288 = ~_509;
    int _1290 = _1288 + 1;
    bool _1292 = !_1278;
    float _1294 = _1292 ? _217 : as_type<float>(_1286);
    bool _1296 = _1240 > 0.0;
    float _1298 = trunc(_1266);
    float _1300 = precise::max(_1298, 0.0);
    uint _1302 = uint(_1300);
    float _1304 = _1272;
    if (_1230)
    {
        _1218 = _495;
    }
    float _1306 = _1218;
    bool _1308 = _1240 >= 0.0;
    bool _1310 = isnan(_1240);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan(0.0);
    bool _1316 = _1312 || _1314;
    float _1318 = _1306;
    if (!_1230)
    {
        _1318 = _676;
    }
    float _1320 = _1318;
    float _1322 = -_1282;
    float _1324 = _1322 + 1.0;
    int _1326 = _1290 * int(_1264);
    int _1328 = _1326 + _866;
    float _1330 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_1230)
    {
        _1304 = _497;
    }
    float _1332 = _1304;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1336 = _1332;
    if (!_1230)
    {
        _1336 = _495;
    }
    float _1338 = _1336;
    float _1340 = float(uint(_1328));
    int _1342 = _571 * int(_1302);
    int _1344 = _1342 + _986;
    bool _1346 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1348 = isnan(0.0);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1354 = _1350 || _1352;
    float _1356 = -_1334;
    float _1358 = fma(_1330, 2.0, _1356);
    float _1360 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1362 = as_type<float>(_555) * _1340;
    float _1364 = _1354 ? _1324 : 0.0;
    float _1366 = -_141;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1358);
    bool _1370 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1372 = isnan(1.0);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1378 = _1374 || _1376;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1382 = 1.0 + _1380;
    float _1384 = float(uint(_1344));
    float _1386 = trunc(_1362);
    float _1388 = precise::max(_1386, 0.0);
    uint _1390 = uint(_1388);
    float _1392 = fma(_1360, -2.0, _1030);
    float _1394 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1280);
    float _1396 = as_type<float>(_587) * _1384;
    float _1398 = _497 * 2.0;
    float _1400 = 1.0 / _1382;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1406 = ~_509;
    int _1408 = _1406 + 1;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1412 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1402);
    float _1414 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1404);
    float _1416 = floor(_1398);
    float _1418 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1410);
    float _1420 = -_141;
    float _1422 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1204);
    float _1424 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1412);
    int _1426 = int(_1264) + int(_1390);
    float _1428 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1414);
    float _1430 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _537);
    float _1432 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1418);
    float _1434 = trunc(_1396);
    float _1436 = precise::max(_1434, 0.0);
    uint _1438 = uint(_1436);
    float _1440 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1392);
    if (_1378)
    {
        float _1442 = _1364 * _1400;
        _163 = _1442;
    }
    float _1444 = _163;
    int _1446 = _1316 ? 0 : 1;
    float _1448 = in.m_46.x;
    float _1450 = in.m_46.y;
    float _1452 = in.m_46.z;
    float _1454 = _676 * 2.0;
    int _1456 = ~_549;
    int _1458 = _1456 + 1;
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1462 = _489 + _1460;
    bool _1464 = _1416 > 0.0;
    int _1466 = _1408 * _1426;
    int _1468 = _1466 + _866;
    float _1470 = floor(_1454);
    bool _1472 = _1416 >= 0.0;
    bool _1474 = isnan(_1416);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan(0.0);
    bool _1480 = _1476 || _1478;
    float _1482 = fma(_600, _808, _1368);
    int _1484 = ~_1446;
    int _1486 = _1484 + 1;
    int _1488 = _1486 + 1;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1494 = int(_1302) + int(_1438);
    float _1496 = -_1430;
    float _1498 = _1496 + 1.0;
    int _1500 = _1488;
    if (!_1296)
    {
        int _1502 = ~_1446;
        int _1504 = _1502 + 1;
        _1500 = _1504;
    }
    int _1506 = _1500;
    bool _1508 = uint(_1468) >= uint(_509);
    float _1510 = 1.0 / _1492;
    int _1512 = _1458 * _1494;
    int _1514 = _1512 + _986;
    int _1516 = _1480 ? 0 : 1;
    bool _1518 = !_1508;
    int _1520 = _1518 ? 0 : (-1);
    int _1522 = ~_1516;
    int _1524 = _1522 + 1;
    int _1526 = _1524 + 1;
    float _1528 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1530 = uint(_1514) >= uint(_549);
    int _1532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1534 = _1532 != 0;
    float _1536 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1538 = _1526;
    if (!_1464)
    {
        int _1540 = ~_1516;
        int _1542 = _1540 + 1;
        _1538 = _1542;
    }
    int _1544 = _1538;
    float _1546 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1548 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1550 = isnan(_489);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1556 = _1552 || _1554;
    float _1558 = float(_1556);
    float _1560 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1528);
    bool _1562 = !_1530;
    int _1564 = _1562 ? 0 : (-1);
    float _1566 = _521 * _1510;
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1570 = _1568 != 0;
    int _1572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1574 = _1572 != 0;
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1578 = _1576 != 0;
    float _1580 = _497 + _495;
    bool _1582 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1584 = isnan(_489);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = -_1558;
    float _1596 = _1594 + 1.0;
    float _1598 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1546);
    bool _1600 = !_1098;
    int _1602 = _1600 ? 0 : 1;
    float _1604 = _1580 + (-1.0);
    float _1606 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1536);
    bool _1608 = _1470 >= 0.0;
    bool _1610 = isnan(_1470);
    bool _1612 = _1608 || _1610;
    bool _1614 = isnan(0.0);
    bool _1616 = _1612 || _1614;
    float _1618 = fma(_1566, _1462, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1620 = _1592 * _1596;
    float _1622 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1598);
    float _1624 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1626 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1560);
    int _1628 = _1616 ? 0 : 1;
    float _1630 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1606);
    bool _1632 = _1470 > 0.0;
    float _1634 = _1294 + 0.5;
    float _1636 = _1618 * _1620;
    float _1638 = -_1592;
    float _1640 = _1638 + 1.0;
    float _1642 = _1270 + (-0.5);
    float _1644 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1422);
    int _1646 = _1082 >> 31;
    float _1648 = fma(_1640, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1636);
    float _1650 = -_1642;
    float _1652 = -_1394;
    float _1654 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1652);
    int _1656 = _1160 >> 31;
    float _1658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1660 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1648);
    int _1662 = _1646 & 3;
    bool _1664 = !_1174;
    int _1666 = _1664 ? 0 : 1;
    float _1668 = _1660 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1670 = _1656 & 3;
    bool _1672 = _1096 != 3;
    float _1674 = _1626 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1676 = _1082 + _1662;
    float _1678 = -_1428;
    float _1680 = _1678 + 1.0;
    int _1682 = _1160 + _1670;
    float _1684 = _1622 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1688 = _1674 + _1686;
    float _1690 = -_1424;
    float _1692 = _1690 + 1.0;
    int _1694 = _1676 >> 2;
    float _1696 = _1630 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1700 = _1684 + _1698;
    float _1702 = _1688 * _1688;
    int _1704 = _1682 >> 2;
    float _1706 = -_1692;
    float _1708 = fma(_1294, _1706, _1644);
    int _1710 = _1694 << 4;
    int _1712 = _1710 + 368;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1716 = _1696 + _1714;
    float _1718 = fma(_1700, _1700, _1702);
    int _1720 = _1704 << 4;
    int _1722 = _1720 + 512;
    float _1724 = fma(_1270, _1680, _1654);
    uint _1726 = uint(int(uint(_1712) >> uint(2)));
    uint _1728 = uint(int(uint(int(_1726)) >> uint(2)));
    int _1730 = int(_1726) & 3;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[int(_1728)][_1730];
    int _1734 = int(_1726) + 1;
    uint _1736 = uint(int(uint(_1734) >> uint(2)));
    int _1738 = _1734 & 3;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[int(_1736)][_1738];
    float _1742 = fma(_1716, _1716, _1718);
    int _1744 = ~_1628;
    int _1746 = _1744 + 1;
    int _1748 = _1746 + 1;
    float _1750 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1752 = _1748;
    float _1754 = _1674;
    if (!_1632)
    {
        int _1756 = ~_1628;
        int _1758 = _1756 + 1;
        _1752 = _1758;
    }
    int _1760 = _1752;
    float _1762 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1764 = !_1672;
    int _1766 = _1764 ? 0 : (-1);
    float _1768 = rsqrt(_1742);
    uint _1770 = uint(int(uint(_1722) >> uint(2)));
    uint _1772 = uint(int(uint(int(_1770)) >> uint(2)));
    int _1774 = int(_1770) & 3;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[int(_1772)][_1774];
    int _1778 = int(_1770) + 1;
    uint _1780 = uint(int(uint(_1778) >> uint(2)));
    int _1782 = _1778 & 3;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[int(_1780)][_1782];
    float _1786 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1762);
    bool _1788 = _1172 != 3;
    out.m_66.x = _1708;
    out.m_66.y = _1724;
    bool _1790 = !_1570;
    int _1792 = _1790 ? 0 : 1;
    float _1794 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1786);
    bool _1796 = !_1788;
    int _1798 = _1796 ? 0 : (-1);
    out.m_68.w = _1668;
    int _1800 = _1712 + 8;
    uint _1802 = uint(int(uint(_1800) >> uint(2)));
    uint _1804 = uint(int(uint(int(_1802)) >> uint(2)));
    int _1806 = int(_1802) & 3;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[int(_1804)][_1806];
    int _1810 = int(_1802) + 1;
    uint _1812 = uint(int(uint(_1810) >> uint(2)));
    int _1814 = _1810 & 3;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[int(_1812)][_1814];
    int _1818 = abs(_1792);
    bool _1820 = _1794 >= 0.0;
    float _1822 = float(_1760);
    float _1824 = _756 + (-0.5);
    float _1826 = _1688 * _1768;
    int _1828 = _1722 + 8;
    uint _1830 = uint(int(uint(_1828) >> uint(2)));
    uint _1832 = uint(int(uint(int(_1830)) >> uint(2)));
    int _1834 = int(_1830) & 3;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[int(_1832)][_1834];
    int _1838 = int(_1830) + 1;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    int _1842 = _1838 & 3;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[int(_1840)][_1842];
    int _1846 = abs(_1166);
    float _1848 = -_1750;
    float _1850 = -_1440;
    float _1852 = fma(_1848, _1824, _1850);
    float _1854 = -_1826;
    float _1856 = fma(_1854, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1688);
    float _1858 = _1700 * _1768;
    int _1860 = abs(_1602);
    float _1862 = _1856 * _1856;
    float _1864 = float(_1818);
    float _1866 = -_1858;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1700);
    int _1870 = ~_1860;
    int _1872 = _1870 + 1;
    int _1874 = _1872 + 1;
    float _1876 = _1716 * _1768;
    int _1878 = abs(_1666);
    float _1880 = _1864 * _1822;
    int _1882 = abs(_1156);
    float _1884 = fma(_1868, _1868, _1862);
    int _1886 = abs(_1224);
    float _1888 = -_1876;
    float _1890 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1716);
    int _1892 = ~_1882;
    int _1894 = _1892 + 1;
    int _1896 = _1894 + 1;
    float _1898 = _1858;
    if (_1820)
    {
        out.m_49.x = 0.0;
    }
    int _1900 = ~_1886;
    int _1902 = _1900 + 1;
    int _1904 = _1902 + 1;
    float _1906 = fma(_1890, _1890, _1884);
    int _1908 = abs(_1248);
    int _1910 = _1896 * as_type<int>(_1740);
    int _1912 = ~_1846;
    int _1914 = _1912 + 1;
    int _1916 = _1914 + 1;
    int _1918 = abs(_1178);
    int _1920 = _1874 * as_type<int>(_1732);
    int _1922 = _1920 + _1910;
    int _1924 = abs(_1766);
    float _1926 = sqrt(_1906);
    int _1928 = ~_1426;
    int _1930 = _1928 + _1520;
    int _1932 = _1930 + 1;
    int _1934 = _1904 * as_type<int>(_1784);
    int _1936 = ~_1878;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    int _1942 = ~_1494;
    int _1944 = _1942 + _1564;
    int _1946 = _1944 + 1;
    int _1948 = _509 * _1932;
    int _1950 = _1948 + _866;
    bool _1952 = _509 == 0;
    int _1954 = _1940 * as_type<int>(_1776);
    int _1956 = _1954 + _1934;
    int _1958 = _1916 * as_type<int>(_1808);
    int _1960 = _1958 + _1922;
    bool _1962 = !_1534;
    int _1964 = _1962 ? 0 : 1;
    int _1966 = _549 * _1946;
    int _1968 = _1966 + _986;
    int _1970 = ~_1908;
    int _1972 = _1970 + 1;
    int _1974 = _1972 + 1;
    int _1976 = abs(_1964);
    float _1978 = _1768 * _1926;
    int _1980 = ~_1924;
    int _1982 = _1980 + 1;
    int _1984 = _1982 + 1;
    int _1986 = _1974 * as_type<int>(_1836);
    int _1988 = _1986 + _1956;
    int _1990 = abs(_1798);
    int _1992 = _1984 * as_type<int>(_1816);
    int _1994 = _1992 + _1960;
    int _1996 = ~_1990;
    int _1998 = _1996 + 1;
    int _2000 = _1998 + 1;
    float _2002 = in.m_70.x;
    float _2004 = in.m_70.y;
    float _2006 = in.m_70.z;
    int _2008 = ~_1976;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    int _2014 = _2000 * as_type<int>(_1844);
    int _2016 = _2014 + _1988;
    int _2018 = ~_1918;
    int _2020 = _2018 + 1;
    int _2022 = _2020 + 1;
    float _2024 = -_1432;
    float _2026 = _2024 + 1.0;
    if (_1820)
    {
        _1150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2028 = _1150;
    int _2030 = _2016 * _2012;
    bool _2032 = !_1952;
    int _2034 = _2032 ? _1950 : (-1);
    int _2036 = _1994 * _2022;
    bool _2038 = !_922;
    int _2040 = _2038 ? _1968 : (-1);
    float _2042 = -_1498;
    float _2044 = fma(_760, _2042, _1482);
    int _2046 = as_type<int>(_2028);
    if (_1820)
    {
        float _2048 = _2028 * 5.0;
        _2046 = as_type<int>(_2048);
    }
    int _2050 = _2046;
    float _2052 = fma(_756, _2026, _1852);
    int _2054 = _2034 * _1918;
    int _2056 = _2054 + _2036;
    float _2058 = _1880 * (-2.0);
    int _2060 = _2040 * _1976;
    int _2062 = _2060 + _2030;
    if (_1820)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6567 = as_type<float>(_2050);
        out.gl_Position.z = _6567;
    }
    float _2064 = _495 + (-0.5);
    float _2066 = float(_2056);
    float _2068 = fma(_1624, _2058, _1624);
    float _2070 = float(_2062);
    out.m_72.x = _2044;
    out.m_72.y = _2052;
    float _2072 = fma(_2058, _2002, _2002);
    bool _2074 = !_1574;
    int _2076 = _2074 ? 0 : 1;
    out.m_74.x = _2066;
    out.m_74.y = _2070;
    float _2078 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2072);
    float _2080 = _497 + _676;
    float _2082 = _501 * _1978;
    float _2084 = float(_1506);
    float _2086 = _2080 + (-1.0);
    out.m_76.x = _2082;
    bool _2088 = !_1578;
    int _2090 = _2088 ? 0 : 1;
    int _2092 = abs(_2076);
    if (_1820)
    {
        return out;
    }
    float _2094 = -_1826;
    float _2096 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1674);
    int _2098 = abs(_2090);
    float _2100 = -_1876;
    float _2102 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1696);
    float _2104 = -_1858;
    float _2106 = fma(_2104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1684);
    float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2110 = _2096 + _2108;
    float _2112 = float(_1544);
    float _2114 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2116 = _2102 + _2114;
    float _2118 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2120 = _2106 + _2118;
    float _2122 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2124 = float(_2092);
    float _2126 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2128 = float(_2098);
    float _2130 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2122);
    float _2132 = _497 + (-0.5);
    float _2134 = _2124 * _2084;
    float _2136 = _676 + _495;
    float _2138 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2130);
    float _2140 = _2128 * _2112;
    float _2142 = _2134 * (-2.0);
    float _2144 = _2136 + (-1.0);
    float _2146 = fma(_2068, _1444, _2078);
    bool _2148 = _2138 >= 0.0;
    float _2150 = fma(_2142, _2004, _2004);
    float _2152 = fma(_2126, _2142, _2126);
    float _2154 = _2140 * (-2.0);
    float _2156 = fma(_2132, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2150);
    float _2158 = _2146 * 0.15915493667125701904296875;
    float _2160 = _676 + (-0.5);
    float _2162 = fma(_2144, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2164 = fma(_2152, _1444, _2156);
    float _2166 = fma(_2154, _2006, _2006);
    float _2168 = _2158 * 6.283185482025146484375;
    float _2170 = sin(_2168);
    float _2172 = _2164 * 0.15915493667125701904296875;
    float _2174 = _2126;
    float _2176 = _2120;
    float _2178 = _2116;
    if (_2148)
    {
        _2174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2180 = _2174;
    float _2182 = fma(_2162, _2154, _2162);
    float _2184 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2166);
    int _2186 = as_type<int>(_2180);
    if (_2148)
    {
        out.m_49.x = 0.0;
    }
    float _2188 = _2158 * 6.283185482025146484375;
    float _2190 = cos(_2188);
    if (_2148)
    {
        float _2192 = _2180 * 5.0;
        _2186 = as_type<int>(_2192);
    }
    int _2194 = _2186;
    float _2196 = fma(_2182, _1444, _2184);
    if (_2148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6797 = as_type<float>(_2194);
        out.gl_Position.z = _6797;
    }
    float _2198 = _2196 * 0.15915493667125701904296875;
    float _2200 = _2172 * 6.283185482025146484375;
    float _2202 = sin(_2200);
    float _2204 = _2172 * 6.283185482025146484375;
    float _2206 = cos(_2204);
    if (_2148)
    {
        return out;
    }
    float _2208 = _2198 * 6.283185482025146484375;
    float _2210 = cos(_2208);
    float _2212 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2216 = _2170 * _2202;
    float _2218 = _2190 * _2206;
    float _2220 = _2212 * _1978;
    float _2222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2224 = _2190 * _2202;
    float _2226 = _2198 * 6.283185482025146484375;
    float _2228 = sin(_2226);
    float _2230 = _2220 * _2214;
    float _2232 = _2170 * _2206;
    float _2234 = _2082 * _2222;
    float _2236 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2238 = _2236 * 0.5;
    float _2240 = _2190 * _2210;
    float _2242 = _2206 * _2210;
    float _2244 = _2170 * _2210;
    float _2246 = _2202 * _2210;
    float _2248 = _2240 * _2230;
    float _2250 = fma(_2228, _2218, _2216);
    float _2252 = -_2232;
    float _2254 = fma(_2228, _2224, _2252);
    float _2256 = -_2230;
    float _2258 = _2228 * _2256;
    float _2260 = -_2224;
    float _2262 = fma(_2228, _2232, _2260);
    float _2264 = fma(_2250, _2234, _2248);
    float _2266 = _2244 * _2230;
    float _2268 = fma(_2242, _2234, _2258);
    float _2270 = fma(_2254, _2238, _2264);
    float _2272 = fma(_2228, _2216, _2218);
    float _2274 = fma(_2262, _2234, _2266);
    float _2276 = fma(_2246, _2238, _2268);
    float _2278 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2280 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2282 = fma(_2272, _2238, _2274);
    float _2284 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2278);
    float _2286 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2280);
    float _2288 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2284);
    float _2290 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2286);
    float _2292 = _2288 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2294 = _2290 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2296 = _1696 + _2292;
    float _2298 = _1684 + _2294;
    float _2300 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2302 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2306 = _2296 + _2304;
    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2310 = _2298 + _2308;
    float _2312 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2300);
    float _2314 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2302);
    float _2316 = _2306 * _2306;
    float _2318 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2312);
    float _2320 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2314);
    float _2322 = fma(_2310, _2310, _2316);
    float _2324 = _2318 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2326 = sqrt(_2322);
    float _2328 = _1674 + _2324;
    bool _2330 = _2326 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2332 = _2318;
    float _2334 = _2324;
    float _2336 = _2302;
    if (!_2330)
    {
        _2332 = _2298;
    }
    float _2338 = _2332;
    float _2340 = _2338;
    if (!_2330)
    {
        _2334 = _2296;
    }
    float _2342 = _2334;
    float _2344 = _2342;
    if (!_2330)
    {
        _2336 = _2328;
    }
    float _2346 = _2336;
    bool _2348 = !_2330;
    float _2350 = _2346;
    if (!_2348)
    {
        float _2352 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2356 = _2326 + _2354;
        float _2358 = rsqrt(_2322);
        float _2360 = _2356 * _2352;
        float _2362 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2364 = _2360 * 0.15915493667125701904296875;
        float _2366 = _2364 * 6.283185482025146484375;
        float _2368 = cos(_2366);
        float _2370 = _2364 * 6.283185482025146484375;
        float _2372 = sin(_2370);
        float _2374 = _2368 + (-1.0);
        float _2376 = fma(_2372, _2362, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2378 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2380 = _2358 * _2376;
        float _2382 = fma(_2328, _2368, _2378);
        float _2384 = fma(_2310, _2380, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2386 = fma(_2306, _2380, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2350 = _2382;
        _2340 = _2384;
        _2344 = _2386;
    }
    float _2388 = _2350;
    float _2390 = _2340;
    float _2392 = _2344;
    float _2394 = -_1674;
    float _2396 = _2394 + _2388;
    float _2398 = -_1684;
    float _2400 = _2398 + _2390;
    float _2402 = -_1696;
    float _2404 = _2402 + _2392;
    float _2406 = _2320 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2408 = _2396 * _2396;
    float _2410 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2412 = 1.0 / _2406;
    float _2414 = fma(_2400, _2400, _2408);
    float _2416 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2410);
    bool _2418 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2420 = isnan(0.5);
    bool _2422 = _2418 || _2420;
    bool _2424 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2426 = _2422 || _2424;
    float _2428 = fma(_2404, _2404, _2414);
    float _2430 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2416);
    bool _2432 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2434 = isnan(0.5);
    bool _2436 = _2432 || _2434;
    bool _2438 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2440 = _2436 || _2438;
    float _2442 = sqrt(_2428);
    float _2444 = _2430 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2446 = _2444 + _2406;
    float _2448 = _2446 * _2412;
    float _2450 = _2448 * 0.5;
    bool _2452 = _2442 > 0.0;
    float _2454 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2456 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2454);
    float _2458 = 1.0 / _2456;
    float _2460 = _2412;
    float _2462 = _2450;
    float _2464 = _2406;
    if (!_2452)
    {
        _2460 = _2390;
    }
    float _2466 = _2460;
    float _2468 = _2466;
    if (!_2452)
    {
        _2462 = _2388;
    }
    float _2470 = _2462;
    float _2472 = _2470;
    if (!_2452)
    {
        _2464 = _2392;
    }
    float _2474 = _2464;
    bool _2476 = !_2452;
    float _2478 = _2474;
    float _2480 = _2474;
    if (!_2476)
    {
        float _2482 = _211 * _211;
        float _2484 = fma(_209, _209, _2482);
        float _2486 = rsqrt(_2428);
        float _2488 = fma(_213, _213, _2484);
        float _2490 = sqrt(_2488);
        float _2492 = _2400 * _2486;
        float _2494 = _2396 * _2486;
        float _2496 = _2404 * _2486;
        bool _2498 = _2490 > 0.0;
        float _2500 = _2490;
        float _2502 = _2486;
        if (!_2498)
        {
            _2500 = _2390;
        }
        float _2504 = _2500;
        _2468 = _2504;
        if (!_2498)
        {
            _2502 = _2388;
        }
        float _2506 = _2502;
        _2472 = _2506;
        if (!_2498)
        {
            _2478 = _2392;
        }
        float _2508 = _2478;
        bool _2510 = !_2498;
        _2480 = _2508;
        if (!_2510)
        {
            float _2512 = rsqrt(_2488);
            float _2514 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2516 = _211 * _2512;
            float _2518 = _209 * _2512;
            float _2520 = _213 * _2512;
            float _2522 = _2494 * _2516;
            float _2524 = fma(_2492, _2518, _2522);
            float _2526 = _2514 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2528 = fma(_2496, _2520, _2524);
            float _2530 = _2528 * _2526;
            float _2532 = fma(_209, _2530, _2390);
            float _2534 = fma(_211, _2530, _2388);
            float _2536 = fma(_213, _2530, _2392);
            _2468 = _2532;
            _2472 = _2534;
            _2480 = _2536;
        }
    }
    float _2538 = _2468;
    float _2540 = _2472;
    float _2542 = _2480;
    float _2544 = -_1858;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2538);
    float _2548 = -_1826;
    float _2550 = fma(_2548, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2540);
    float _2552 = -_1876;
    float _2554 = fma(_2552, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2542);
    float _2556 = _2550;
    float _2558 = _2546;
    float _2560 = _2554;
    if (_2440)
    {
        _221 = 1.0;
    }
    float _2562 = _221;
    float _2564 = _2562;
    if (!_2426)
    {
        float _2566 = _2110 * _2110;
        float _2568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2570 = -_1696;
        float _2572 = _2570 + _2542;
        float _2574 = -_1674;
        float _2576 = _2574 + _2540;
        float _2578 = fma(_2120, _2120, _2566);
        float _2580 = fma(_2116, _2116, _2578);
        float _2582 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2584 = sqrt(_2580);
        float _2586 = 1.0 / _1978;
        float _2588 = precise::min(_2584, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2590 = _2588 * _2568;
        float _2592 = _2582 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2594 = -_1684;
        float _2596 = _2594 + _2538;
        float _2598 = _2590 * _2586;
        float _2600 = _2592 * _2598;
        float _2602 = _2572 * _2598;
        float _2604 = fma(_2576, _2600, _2096);
        float _2606 = fma(_2596, _2600, _2106);
        float _2608 = fma(_2592, _2602, _2102);
        _2556 = _2604;
        _2558 = _2606;
        _2560 = _2608;
        _2176 = _2584;
    }
    float _2610 = _2556;
    float _2612 = _2558;
    float _2614 = _2560;
    float _2616 = _2176;
    float _2618 = _2616;
    if (_2440)
    {
        _1754 = 1.0;
    }
    float _2620 = _1754;
    float _2622 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2624 = _2458 * _2622;
    float _2626 = _2620;
    if (!_2440)
    {
        float _2628 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2630 = _2628 * 0.15915493667125701904296875;
        float _2632 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2634 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2636 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2634;
        float _2638 = _2630 * 6.283185482025146484375;
        float _2640 = cos(_2638);
        float _2642 = _2632 * 0.15915493667125701904296875;
        float _2644 = _2630 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        float _2648 = 1.0 / _2640;
        float _2650 = _2642 * 6.283185482025146484375;
        float _2652 = cos(_2650);
        float _2654 = _2646 * _2648;
        float _2656 = _2642 * 6.283185482025146484375;
        float _2658 = sin(_2656);
        float _2660 = _2652 * _2654;
        float _2662 = 1.0 / _2636;
        float _2664 = 1.0 / _2660;
        float _2666 = _2658 * _2664;
        float _2668 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2670 = fma(_2624, _2666, _2668);
        float _2672 = _2670 * _2662;
        float _2674 = precise::clamp(_2672, 0.0, 1.0);
        _2178 = _2642;
        _2618 = _2654;
        _2564 = _2674;
    }
    float _2676 = _2178;
    float _2678 = _2618;
    float _2680 = _2564;
    float _2682 = _2676;
    float _2684 = _2678;
    if (!_2440)
    {
        float _2686 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2688 = _2686 * 0.15915493667125701904296875;
        float _2690 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2692 = _2688 * 6.283185482025146484375;
        float _2694 = cos(_2692);
        float _2696 = _2690 * 0.15915493667125701904296875;
        float _2698 = _2688 * 6.283185482025146484375;
        float _2700 = sin(_2698);
        float _2702 = 1.0 / _2694;
        float _2704 = _2696 * 6.283185482025146484375;
        float _2706 = cos(_2704);
        float _2708 = _2700 * _2702;
        float _2710 = _2696 * 6.283185482025146484375;
        float _2712 = sin(_2710);
        float _2714 = _2706 * _2708;
        float _2716 = 1.0 / _2714;
        float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2720 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2718;
        float _2722 = 1.0 / _2720;
        float _2724 = _2712 * _2716;
        float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2728 = fma(_2624, _2724, _2726);
        float _2730 = _2728 * _2722;
        float _2732 = precise::clamp(_2730, 0.0, 1.0);
        float _2734 = -_2732;
        float _2736 = _2734 + 1.0;
        _2682 = _2702;
        _2684 = _2714;
        _2626 = _2736;
    }
    float _2738 = _2682;
    float _2740 = _2684;
    float _2742 = _2626;
    float _2744 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2746 = _2610 + _2744;
    float _2748 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2750 = _2612 + _2748;
    float _2752 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2754 = _2614 + _2752;
    float _2756 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2758 = _2746 * _2746;
    float _2760 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2756);
    float _2762 = fma(_2750, _2750, _2758);
    float _2764 = fma(_2754, _2754, _2762);
    float _2766 = rsqrt(_2764);
    float _2768 = sqrt(_2764);
    float _2770 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2772 = _2750 * _2770;
    float _2774 = _2754 * _2770;
    float _2776 = _2772 * _2772;
    float _2778 = _2774 * _2774;
    float _2780 = _2776 + _2778;
    float _2782 = sqrt(_2780);
    bool _2784 = _2782 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2788 = _2782 + _2786;
    float _2790 = _2738;
    float _2792 = _2780;
    float _2794 = _2788;
    float _2796 = _2740;
    float _2798 = _2746;
    if (_2784)
    {
        float _2800 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2790 = _2800;
    }
    float _2802 = _2790;
    if (_2784)
    {
        float _2804 = rsqrt(_2780);
        _2792 = _2804;
    }
    float _2806 = _2792;
    float _2808 = _2806;
    if (_2784)
    {
        float _2810 = _2788 * _2802;
        _2794 = _2810;
    }
    float _2812 = _2794;
    if (_2784)
    {
        float _2814 = _2812 * 0.15915493667125701904296875;
        _2796 = _2814;
    }
    float _2816 = _2796;
    float _2818 = _2754;
    float _2820 = _2816;
    if (_2784)
    {
        float _2822 = _2816 * 6.283185482025146484375;
        float _2824 = sin(_2822);
        _2818 = _2824;
    }
    float _2826 = _2818;
    float _2828 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2830 = precise::max(0.0, _2828);
    float _2832 = _2802;
    if (_2784)
    {
        float _2834 = _2816 * 6.283185482025146484375;
        float _2836 = cos(_2834);
        _2832 = _2836;
    }
    float _2838 = _2832;
    float _2840 = -_2770;
    float _2842 = -_2830;
    float _2844 = fma(_2746, _2840, _2842);
    float _2846 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2784)
    {
        float _2848 = _2844 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2798 = _2848;
    }
    float _2850 = _2798;
    float _2852 = _2850;
    if (!_2784)
    {
        _2820 = _2772;
    }
    float _2854 = _2820;
    float _2856 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2858 = _2826;
    float _2860 = _2854;
    if (_2784)
    {
        float _2862 = fma(_2826, _2850, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2858 = _2862;
    }
    float _2864 = _2858;
    float _2866 = _2864;
    if (!_2784)
    {
        _2852 = _2844;
    }
    float _2868 = _2852;
    float _2870 = _2868;
    float _2872 = _2838;
    if (_2784)
    {
        float _2874 = _2838 + (-1.0);
        _2846 = _2874;
    }
    float _2876 = _2846;
    float _2878 = _2876;
    if (_2784)
    {
        float _2880 = _2806 * _2864;
        _1898 = _2880;
    }
    float _2882 = _1898;
    if (!_2784)
    {
        _2808 = _2774;
    }
    float _2884 = _2808;
    float _2886 = _2884;
    if (_2784)
    {
        float _2888 = _2876 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2878 = _2888;
    }
    float _2890 = _2878;
    if (_2784)
    {
        float _2892 = _2772 * _2882;
        _2860 = _2892;
    }
    float _2894 = _2860;
    if (!_2784)
    {
        _2866 = _2776;
    }
    float _2896 = _2866;
    float _2898 = _2896;
    if (_2784)
    {
        float _2900 = _2774 * _2882;
        _2886 = _2900;
    }
    float _2902 = _2886;
    if (_2784)
    {
        float _2904 = fma(_2844, _2838, _2890);
        _2870 = _2904;
    }
    float _2906 = _2870;
    if (_2784)
    {
        float _2908 = _2894 * _2894;
        _2898 = _2908;
    }
    float _2910 = _2898;
    if (!_2784)
    {
        _2872 = _2778;
    }
    float _2912 = _2872;
    float _2914 = _2912;
    if (_2784)
    {
        float _2916 = _2902 * _2902;
        _2914 = _2916;
    }
    float _2918 = _2914;
    float _2920 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2922 = fma(_2906, _2906, _2910);
    float _2924 = floor(_2856);
    float _2926 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2920);
    float _2928 = _2922 + _2918;
    float _2930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2932 = fma(_2768, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2930);
    float _2934 = precise::clamp(_2932, 0.0, 1.0);
    float _2936 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2926);
    float _2938 = rsqrt(_2928);
    float _2940 = -_2934;
    float _2942 = _2940 + 1.0;
    float _2944 = _2936 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2946 = fma(_2102, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2948 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2950 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2952 = abs(_2942);
    float _2954 = log2(_2952);
    float _2956 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2958 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2960 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2948);
    float _2962 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2956);
    float _2964 = -_2958;
    float _2966 = fma(_2964, _2950, 1.0);
    float _2968 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2960);
    float _2970 = _2938 * _2894;
    float _2972 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2962);
    float _2974 = _2938 * _2906;
    float _2976 = _2938 * _2902;
    float _2978 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2980 = _2972 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2982 = _2968 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2984 = floor(_2946);
    float _2986 = -_2978;
    float _2988 = fma(_2974, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2986);
    float _2990 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2992 = _2954 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2994 = -_2976;
    float _2996 = fma(_2994, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2988);
    float _2998 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2760);
    float _3000 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2990);
    float _3002 = exp2(_2992);
    float _3004 = fma(_2996, -0.5, 0.5);
    float _3006 = _2998 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3008 = fma(_2944, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3000);
    float _3010 = fma(_2996, 0.5, 0.5);
    float _3012 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3014 = fma(_3006, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3008);
    float _3016 = log2(_2966);
    float _3018 = -_2984;
    float _3020 = _2946 + _3018;
    float _3022 = fma(_3010, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3024 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3012);
    float _3026 = fma(_3010, _3022, -0.212114393711090087890625);
    float _3028 = fma(_2944, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3024);
    float _3030 = 1.0 / _3014;
    float _3032 = -_2924;
    float _3034 = _2856 + _3032;
    float _3036 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3038 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3036);
    float _3040 = _2974 + 1.0;
    float _3042 = sqrt(_3004);
    float _3044 = _3016 * 0.693147182464599609375;
    float _3046 = fma(_2944, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3038);
    float _3048 = -_2974;
    float _3050 = fma(_3002, _3040, _3048);
    float _3052 = fma(_3010, _3026, 1.570728778839111328125);
    float2 _8150 = float2(_3034, _3020);
    float _3054 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8150, float2(0.0), isnan(_8150)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8150, float2(0.0), isnan(_8150)), level(0.0)).x;
    float _3056 = fma(_3006, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3046);
    float _3058 = fma(_3006, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3028);
    float _3060 = _3044 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3062 = fma(_3050, 0.5, 0.5);
    float _3064 = _3056 * _3030;
    float _3066 = _3058 * _3030;
    float _3068 = fma(_3064, 0.5, 0.5);
    float _3070 = fma(_3066, -0.5, 0.5);
    float _3072 = _3042 * 0.636619746685028076171875;
    float _3074 = -_3052;
    float _3076 = fma(_3072, _3074, 1.0);
    float3 _8195 = float3(_3068, _3070, _3060);
    float _3078 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8195, float3(0.0), isnan(_8195)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8195, float3(0.0), isnan(_8195)), level(0.0)).x;
    float3 _8206 = float3(_3068, _3070, _3060);
    float4 _3081 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8206, float3(0.0), isnan(_8206)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8206, float3(0.0), isnan(_8206)), level(0.0)).xyzw;
    float _3083 = _3081.x;
    float _3085 = _3081.y;
    float _3087 = _3081.z;
    float _3089 = _3081.w;
    float2 _8222 = float2(_3076, _3062);
    float3 _3093 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8222, float2(0.0), isnan(_8222)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8222, float2(0.0), isnan(_8222)), level(0.0)).xyz;
    float _3095 = _3093.x;
    float _3097 = _3093.y;
    float _3099 = _3093.z;
    float _3101 = abs(_2624);
    float _3103 = log2(_3101);
    float _3105 = _2250 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3107 = _2250 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3109 = _2250 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3111 = _2240 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3113 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3105);
    float _3115 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3107);
    float _3117 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3109);
    float _3119 = _2240 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3121 = _2240 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3123 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3125 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3127 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3129 = -_2228;
    float _3131 = fma(_3129, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3111);
    float _3133 = -_2228;
    float _3135 = fma(_3133, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3121);
    float _3137 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3139 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3141 = -_2228;
    float _3143 = fma(_3141, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3119);
    float _3145 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3123);
    float _3147 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3125);
    float _3149 = exp2(_3139);
    float _3151 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3127);
    float _3153 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3143);
    float _3155 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3145);
    float _3157 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3147);
    float _3159 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3151);
    float _3161 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3113);
    float _3163 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3131);
    float _3165 = fma(_3137, _3137, 1.0);
    float _3167 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3169 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3135);
    float _3171 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3173 = rsqrt(_3165);
    float _3175 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3115);
    float _3177 = _2954 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3179 = fma(_3149, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3181 = precise::clamp(_3179, 0.0, 1.0);
    float _3183 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3117);
    float _3185 = _3137 * _3163;
    float _3187 = _3181 * _3181;
    float _3189 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3171);
    float _3191 = fma(_3181, -2.0, 3.0);
    float _3193 = _3137 * _3153;
    float _3195 = exp2(_3177);
    float _3197 = fma(_3167, _3175, _3185);
    float _3199 = _3187 * _3191;
    float _3201 = fma(_3167, _3161, _3193);
    float _3203 = _3137 * _3169;
    float _3205 = _3137 * _3173;
    float _3207 = -_3199;
    float _3209 = _3207 + 1.0;
    out.m_78.x = _3161;
    out.m_78.y = _3175;
    out.m_78.z = _3183;
    float _3211 = fma(_3167, _3183, _3203);
    float _3213 = -_3155;
    float _3215 = _3205 * _3213;
    float _3217 = fma(_3209, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3199);
    float _3219 = fma(_2944, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3189);
    float _3221 = in.m_80.x;
    float _3223 = fma(_3173, _3153, _3215);
    float _3225 = _3155 + _3201;
    float _3227 = _3157 + _3197;
    float _3229 = -_3195;
    float _3231 = _3229 + 1.0;
    out.m_82.x = _2612;
    out.m_82.y = _2610;
    out.m_82.z = _2614;
    bool _3233 = _2768 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3235 = isnan(_2768);
    bool _3237 = _3233 || _3235;
    bool _3239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3241 = _3237 || _3239;
    float _3243 = -_3157;
    float _3245 = _3205 * _3243;
    float _3247 = -_3159;
    float _3249 = _3205 * _3247;
    float _3251 = _3231 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3253 = fma(_3173, _3163, _3245);
    bool _3255 = _2624 <= 8000.0;
    bool _3257 = isnan(_2624);
    bool _3259 = _3255 || _3257;
    bool _3261 = isnan(8000.0);
    bool _3263 = _3259 || _3261;
    float _3265 = float(_3263);
    float _3267 = fma(_3173, _3169, _3249);
    float _3269 = fma(_3006, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3219);
    float _3271 = _3014 * 0.5;
    float _3273 = _3056 + _3014;
    float _3275 = _3265 * _3217;
    out.m_84.x = _3223;
    out.m_84.y = _3253;
    out.m_84.z = _3267;
    float _3277 = _3269 + _3014;
    float _3279 = fma(_3058, -0.5, _3271);
    float _3281 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3056;
    out.gl_Position.y = _3058;
    out.gl_Position.z = _3269;
    out.gl_Position.w = _3014;
    float _3283 = _3277 * 0.5;
    float _3285 = _3159 + _3211;
    float _3287 = _3273 * 0.5;
    out.m_86.x = _3225;
    out.m_86.y = _3227;
    out.m_86.z = _3285;
    float _3289 = _3157;
    float _3291 = _3267;
    float _3293 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3241)
    {
        _3289 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3295 = _3289;
    float _3297 = _3295;
    float _3299 = _3295;
    if (!_3241)
    {
        _3291 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3301 = _3291;
    out.m_88.z = _3283;
    out.m_88.w = _3014;
    out.m_90.x = _3287;
    out.m_90.y = _3279;
    out.m_90.z = _3283;
    out.m_90.w = _3014;
    float _3303 = -_3054;
    float _3305 = _3303 + 1.0;
    float _3307 = _3305 * _3281;
    float _3309 = precise::clamp(_3307, 0.0, 1.0);
    float _3311 = -_3309;
    float _3313 = fma(_3311, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3315 = _3085;
    float _3317 = _3301;
    float _3319 = _3301;
    if (!_3241)
    {
        _3293 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3321 = _3293;
    float _3323 = _3313 * _3221;
    float _3325 = _3323 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3327 = _3251 * _3078;
    float _3329 = -_3251;
    float _3331 = _3329 + 1.0;
    float _3333 = _3089 * _3327;
    float _3335 = _3099 * _3327;
    float _3337 = _3089 * _3331;
    out.m_92.x = _3325;
    float _3339 = fma(_3095, _3333, _3083);
    float _3341 = fma(_3097, _3333, _3085);
    float _3343 = fma(_3089, _3335, _3087);
    float _3345 = _2680 * _2742;
    float _3347 = _3327;
    float _3349 = _3345;
    float _3351 = _3321;
    float _3353 = _3321;
    if (!_3241)
    {
        _3347 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3355 = _3347;
    float _3357 = _3355;
    float _3359 = _3355;
    if (!_3241)
    {
        _3315 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3361 = _3315;
    out.m_94.x = _3339;
    out.m_94.y = _3341;
    out.m_94.z = _3343;
    out.m_94.w = _3337;
    float _3363 = _3345 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3365 = _3361;
    float _3367 = _3361;
    if (!_3241)
    {
        _3349 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3369 = _3349;
    bool _3371 = !_3241;
    float _3373 = _3369;
    float _3375 = _3369;
    if (!_3371)
    {
        bool _3377 = _2768 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3379 = isnan(_2768);
        bool _3381 = _3377 || _3379;
        bool _3383 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3385 = _3381 || _3383;
        if (!_3385)
        {
            float _3387 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3389 = _2768 + _3387;
            float _3391 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3393 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3391;
            float _3395 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3397 = _3395 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3399 = 1.0 / _3393;
            float _3401 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3403 = _3401 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3405 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3407 = _3405 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3409 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3411 = _3409 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3413 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3415 = _3413 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3417 = _3389 * _3399;
            float _3419 = precise::clamp(_3417, 0.0, 1.0);
            float _3421 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3423 = _3421 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3425 = fma(_3419, _3397, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3427 = fma(_3419, _3423, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3429 = fma(_3419, _3403, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3431 = fma(_3419, _3407, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3433 = fma(_3419, _3411, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3435 = fma(_3419, _3415, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3319 = _3429;
            _3367 = _3433;
            _3299 = _3425;
            _3359 = _3431;
            _3353 = _3427;
            _3375 = _3435;
            _3437 = true;
        }
        else
        {
            bool _3439 = _2768 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3441 = isnan(_2768);
            bool _3443 = _3439 || _3441;
            bool _3445 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3447 = _3443 || _3445;
            if (!_3447)
            {
                _3297 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3449 = _3297;
            _3299 = _3449;
            if (!_3447)
            {
                _3317 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3451 = _3317;
            _3319 = _3451;
            if (!_3447)
            {
                _3351 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3453 = _3351;
            _3353 = _3453;
            if (!_3447)
            {
                _3357 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3455 = _3357;
            _3359 = _3455;
            if (!_3447)
            {
                _3365 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3457 = _3365;
            _3367 = _3457;
            if (!_3447)
            {
                _3373 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3459 = _3373;
            bool _3461 = !_3447;
            _3375 = _3459;
            if (!_3461)
            {
                bool _3463 = _2768 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3465 = isnan(_2768);
                bool _3467 = _3463 || _3465;
                bool _3469 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3471 = _3467 || _3469;
                if (!_3471)
                {
                    float _3473 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3475 = _2768 + _3473;
                    float _3477 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3479 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3477;
                    float _3481 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3483 = _3481 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3485 = 1.0 / _3479;
                    float _3487 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3489 = _3487 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3491 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3493 = _3491 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3495 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3497 = _3495 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3499 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3501 = _3499 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3503 = _3475 * _3485;
                    float _3505 = precise::clamp(_3503, 0.0, 1.0);
                    float _3507 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3509 = _3507 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3511 = fma(_3505, _3483, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3513 = fma(_3505, _3509, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3515 = fma(_3505, _3489, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3517 = fma(_3505, _3493, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3519 = fma(_3505, _3497, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3521 = fma(_3505, _3501, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3319 = _3515;
                    _3367 = _3519;
                    _3299 = _3511;
                    _3359 = _3517;
                    _3353 = _3513;
                    _3375 = _3521;
                    _3437 = true;
                }
                else
                {
                    _3319 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3367 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3299 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3359 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3353 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3375 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3437 = false;
    float _3523 = _3319;
    float _3525 = _3367;
    float _3527 = _3299;
    float _3529 = _3359;
    float _3531 = _3353;
    float _3533 = _3375;
    float _3535 = fma(_3227, -0.5, 0.5);
    float _3537 = precise::clamp(_3535, 0.0, 1.0);
    float _3539 = -_3523;
    float _3541 = _3539 + _3525;
    float _3543 = _3363 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3545 = -_3527;
    float _3547 = _3545 + _3529;
    float _3549 = fma(_3537, _3541, _3523);
    out.m_96.x = 0.0;
    float _3551 = -_3531;
    float _3553 = _3551 + _3533;
    float _3555 = fma(_3537, _3547, _3527);
    float _3557 = _3549 * 0.586610972881317138671875;
    out.m_49.x = _3543;
    bool _3559 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3561 = fma(_3537, _3553, _3531);
    float _3563 = fma(_3555, 0.298911988735198974609375, _3557);
    bool _3565 = _2680 > 0.0;
    bool _3567 = isnan(_2680);
    bool _3569 = _3565 || _3567;
    bool _3571 = isnan(0.0);
    bool _3573 = _3569 || _3571;
    float _3575 = fma(_3561, 0.114477999508380889892578125, _3563);
    bool _3577 = _2742 <= 0.0;
    bool _3579 = !_3573;
    bool _3581 = _3577 || _3579;
    float _3583 = -_3575;
    float _3585 = _3549 + _3583;
    float _3587 = -_3575;
    float _3589 = _3555 + _3587;
    float _3591 = -_3575;
    float _3593 = _3561 + _3591;
    float _3595 = fma(_3585, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3575);
    float _3597 = fma(_3589, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3575);
    float _3599 = fma(_3593, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3575);
    bool _3601 = !_3559;
    if (!_3601)
    {
        float _3603 = -_2610;
        float _3605 = _3603 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3607 = -_2612;
        float _3609 = _3607 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3611 = -_2614;
        float _3613 = _3611 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3615 = _3605 * _3605;
        float _3617 = fma(_3609, _3609, _3615);
        float _3619 = fma(_3613, _3613, _3617);
        float _3621 = sqrt(_3619);
        float _3623 = rsqrt(_3619);
        float _3625 = -_3621;
        float _3627 = _3625 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3629 = _3627 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3631 = precise::clamp(_3629, 0.0, 1.0);
        float _3633 = _3609 * _3623;
        float _3635 = _3605 * _3623;
        float _3637 = abs(_3631);
        float _3639 = log2(_3637);
        float _3641 = _3613 * _3623;
        float _3643 = _3633 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3645 = _3227 * _3635;
        float _3647 = -_3635;
        float _3649 = -_3643;
        float _3651 = fma(_3647, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3649);
        float _3653 = fma(_3225, _3633, _3645);
        float _3655 = -_3641;
        float _3657 = fma(_3655, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3651);
        float _3659 = fma(_3285, _3641, _3653);
        float _3661 = precise::clamp(_3659, 0.0, 1.0);
        float _3663 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3665 = _3657 + _3663;
        float _3667 = _3639 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3669 = _3665 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3671 = precise::clamp(_3669, 0.0, 1.0);
        float _3673 = exp2(_3667);
        float _3675 = _3673 * _3671;
        float _3677 = _3661 * _3675;
        float _3679 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3681 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3683 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3679;
        out.m_96.y = _3681;
        out.m_96.z = _3683;
    }
    out.m_98.x = _3597;
    out.m_98.y = _3595;
    out.m_98.z = _3599;
    if (!_3581)
    {
        return out;
    }
    float _3685 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3685;
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
    bool _3437 = false;
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
        float _3741 = as_type<float>(_131);
        out.gl_Position.z = _3741;
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
        float _3814 = as_type<float>(_173);
        out.gl_Position.z = _3814;
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
    bool _249 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _251 = isnan(_243);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _243 + _261;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = -_259;
    float _275 = _273 + 1.0;
    float _277 = 1.0 / _267;
    bool _279 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _281 = isnan(_243);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = 1.0 / _271;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _295;
    float _299 = _247 * _277;
    bool _301 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _303 = isnan(_243);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = in.m_62.x;
    float _315 = in.m_62.y;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _317;
    float _321 = fma(_297, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _323 = _311 * _275;
    float _325 = -_311;
    float _327 = _325 + 1.0;
    float _329 = fma(_319, _299, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = _263 * _293;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _337 = _289 * _327;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _343 = -_289;
    float _345 = _343 + 1.0;
    float _347 = fma(_335, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _349 = _329 * _337;
    float _351 = _321 * _337;
    float _353 = fma(_341, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _355 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].x, _349);
    float _357 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].y, _351);
    float _359 = fma(_353, _323, _355);
    float _361 = fma(_347, _323, _357);
    float _363 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[145].x, _359);
    float _365 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[145].y, _361);
    float _367 = _363 * _313;
    float _369 = _365 * _315;
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
    bool _399 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _401 = isnan(_393);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _415 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _417 = isnan(_393);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _427;
    float _431 = -_409;
    float _433 = _431 + 1.0;
    bool _435 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _437 = 1.0 / _413;
    float _439 = _425 * _433;
    float _441 = -_425;
    float _443 = _441 + 1.0;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _447 = _445 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _449 = _429 * _437;
    float _451 = fma(_449, _397, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _455 = _451 * _439;
    float _457 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _459 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[115].x, _455);
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _463 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[116].x, _459);
    float _465 = _461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = _463 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _447;
    out.m_64.y = _465;
    out.m_64.z = _457;
    out.m_64.w = _467;
    bool _469 = !_435;
    float _471 = _465;
    if (!_469)
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
    float _507 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _509 = int(_507);
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _513 = float(_493);
    float _515 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _517 = int(_515);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _519;
    if (_505)
    {
        _471 = 1.0;
    }
    float _523 = _471;
    float _525 = _523;
    if (!_505)
    {
        _525 = 7.345489978790283203125;
    }
    float _527 = _525;
    float _529 = float(uint(_509));
    float _531 = 1.0 / _513;
    float _533 = _527 * _495;
    bool _535 = _509 == 0;
    float _537 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[88].z, _511);
    bool _539 = _497 > 0.5;
    float _541 = float(_517);
    float _543 = 1.0 / _529;
    float _545 = _531 * _141;
    float _547 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _549 = int(_547);
    float _551 = trunc(_545);
    int _553 = int(_551);
    int _555 = as_type<int>(_543) + (-2);
    float _557 = 1.0 / _541;
    float _559 = float(uint(_549));
    int _561 = ~_549;
    int _563 = _561 + 1;
    int _565 = ~_549;
    int _567 = _565 + 1;
    int _569 = ~_549;
    int _571 = _569 + 1;
    float _573 = 1.0 / _559;
    float _575 = float(uint(_553));
    int _577 = ~_509;
    int _579 = _577 + 1;
    float _581 = as_type<float>(_555) * _575;
    float _583 = _557 * _141;
    float _585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _587 = as_type<int>(_573) + (-2);
    float _589 = trunc(_583);
    int _591 = int(_589);
    float _593 = trunc(_581);
    float _595 = precise::max(_593, 0.0);
    uint _598 = uint(_595);
    float _600 = _585 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _602 = float(uint(_591));
    float _604 = _581;
    float _606 = _602;
    if (_505)
    {
        _604 = _495;
    }
    float _608 = _604;
    float _610 = _608;
    if (!_505)
    {
        _610 = _497;
    }
    float _612 = _610;
    float _614 = as_type<float>(_587) * _602;
    if (_505)
    {
        _606 = 1.0;
    }
    float _616 = _606;
    int _618 = _579 * int(_598);
    int _620 = _618 + _553;
    float _622 = trunc(_614);
    float _624 = precise::max(_622, 0.0);
    uint _626 = uint(_624);
    float _628 = _616;
    if (!_505)
    {
        _628 = 1.2345600128173828125;
    }
    float _630 = _628;
    float _632 = float(_591);
    float _634 = float(uint(_620));
    float _636 = _630 * _612;
    float _638 = as_type<float>(_555) * _634;
    int _640 = ~_509;
    int _642 = _640 + 1;
    float _644 = floor(_533);
    int _646 = _563 * int(_626);
    int _648 = _646 + _591;
    float _650 = trunc(_638);
    float _652 = precise::max(_650, 0.0);
    uint _654 = uint(_652);
    float _656 = float(uint(_648));
    float _658 = as_type<float>(_587) * _656;
    float _660 = float(_509);
    float _662 = floor(_636);
    float _664 = -_644;
    float _666 = _533 + _664;
    int _668 = int(_598) + int(_654);
    float _670 = trunc(_658);
    float _672 = precise::max(_670, 0.0);
    uint _674 = uint(_672);
    float _676 = in.m_60.z;
    int _678 = _642 * _668;
    int _680 = _678 + _553;
    float _682 = -_662;
    float _684 = _636 + _682;
    bool _686 = uint(_680) >= uint(_509);
    float _688 = float(_553);
    bool _690 = !_686;
    int _692 = _690 ? 0 : (-1);
    bool _694 = _688 >= _660;
    bool _696 = isnan(_688);
    bool _698 = _694 || _696;
    bool _700 = isnan(_660);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    int _706 = ~_668;
    int _708 = _706 + _692;
    int _710 = _708 + 1;
    float _712 = _666 * _660;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _716 = _714 != 0;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _720 = _718 != 0;
    float _722 = _660 * _499;
    float _724 = trunc(_704);
    int _726 = int(_724);
    int _728 = _509 * _710;
    int _730 = _728 + _553;
    int _732 = int(_626) + int(_674);
    bool _734 = _676 > 0.5;
    float _736 = -_217;
    int _738 = _539 ? as_type<int>(_736) : as_type<int>(_217);
    int _740 = _567 * _732;
    int _742 = _740 + _591;
    float _744 = -_207;
    int _746 = _734 ? as_type<int>(_744) : as_type<int>(_207);
    float _748 = trunc(_722);
    int _750 = int(_748);
    float _752 = float(_549);
    bool _754 = !_720;
    float _756 = _754 ? _207 : as_type<float>(_746);
    bool _758 = !_716;
    float _760 = _758 ? _217 : as_type<float>(_738);
    float _762 = _752 * _499;
    int _764 = ~_726;
    int _766 = _764 + 1;
    int _768 = _766 + 1;
    bool _770 = !_535;
    int _772 = _770 ? _730 : (-1);
    float _774 = _684 * _752;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _778 = _776 != 0;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _782 = _780 != 0;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _786 = _784 != 0;
    float _788 = trunc(_762);
    int _790 = int(_788);
    bool _792 = _632 >= _752;
    bool _794 = isnan(_632);
    bool _796 = _792 || _794;
    bool _798 = isnan(_752);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    int _804 = _772 * _768;
    int _806 = _509 + (-1);
    float _808 = _760 + 0.5;
    bool _810 = !_782;
    int _812 = _810 ? 0 : 1;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _816 = _814 != 0;
    float _818 = trunc(_712);
    int _820 = int(_818);
    int _822 = abs(_812);
    int _824 = _726 * _806;
    int _826 = _824 + _804;
    bool _828 = uint(_742) >= uint(_549);
    bool _830 = !_816;
    int _832 = _830 ? 0 : 1;
    float _834 = trunc(_802);
    int _836 = int(_834);
    bool _838 = !_778;
    int _840 = _838 ? 0 : 1;
    int _842 = _826 * _822;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _850 = _848 != 0;
    bool _852 = !_828;
    int _854 = _852 ? 0 : (-1);
    int _856 = abs(_832);
    int _858 = abs(_840);
    bool _860 = !_846;
    int _862 = _860 ? 0 : 1;
    int _864 = _820 * _856;
    int _866 = _864 + _553;
    bool _868 = !_850;
    int _870 = _868 ? 0 : 1;
    int _872 = _750 * _858;
    int _874 = _872 + _842;
    bool _876 = !_786;
    int _878 = _876 ? 0 : 1;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _882 = _880 != 0;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _886 = _884 != 0;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _890 = _888 != 0;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _894 = _892 != 0;
    int _896 = ~_732;
    int _898 = _896 + _854;
    int _900 = _898 + 1;
    int _902 = abs(_878);
    float _904 = trunc(_774);
    int _906 = int(_904);
    int _908 = abs(_862);
    int _910 = _549 * _900;
    int _912 = _910 + _591;
    bool _914 = !_886;
    int _916 = _914 ? 0 : 1;
    int _918 = _866 * _902;
    int _920 = _918 + _874;
    bool _922 = _549 == 0;
    int _924 = abs(_870);
    int _926 = ~_836;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    bool _932 = !_922;
    int _934 = _932 ? _912 : (-1);
    int _936 = _820 * _908;
    int _938 = _936 + _920;
    int _940 = _549 + (-1);
    int _942 = abs(_916);
    int _944 = _934 * _930;
    float _946 = float(uint(_938));
    bool _948 = !_890;
    int _950 = _948 ? 0 : 1;
    int _952 = _836 * _940;
    int _954 = _952 + _944;
    bool _956 = !_882;
    int _958 = _956 ? 0 : 1;
    float _960 = as_type<float>(_555) * _946;
    int _962 = abs(_950);
    int _964 = _954 * _942;
    int _966 = abs(_958);
    float _968 = trunc(_960);
    float _970 = precise::max(_968, 0.0);
    uint _972 = uint(_970);
    bool _974 = !_894;
    int _976 = _974 ? 0 : 1;
    int _978 = _790 * _966;
    int _980 = _978 + _964;
    int _982 = abs(_976);
    int _984 = _906 * _924;
    int _986 = _984 + _591;
    int _988 = ~_509;
    int _990 = _988 + 1;
    bool _992 = _509 == 0;
    int _994 = _986 * _962;
    int _996 = _994 + _980;
    int _998 = ~_509;
    int _1000 = _998 + 1;
    bool _1002 = _497 > 0.5;
    int _1004 = _906 * _982;
    int _1006 = _1004 + _996;
    int _1008 = _1000 * int(_972);
    int _1010 = _1008 + _938;
    float _1012 = float(uint(_1006));
    float _1014 = float(uint(_1010));
    int _1016 = ~_549;
    int _1018 = _1016 + 1;
    float _1020 = as_type<float>(_587) * _1012;
    float _1022 = as_type<float>(_555) * _1014;
    float _1024 = trunc(_1020);
    float _1026 = precise::max(_1024, 0.0);
    uint _1028 = uint(_1026);
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1032 = trunc(_1022);
    float _1034 = precise::max(_1032, 0.0);
    uint _1036 = uint(_1034);
    int _1038 = _1018 * int(_1028);
    int _1040 = _1038 + _1006;
    float _1042 = float(uint(_1040));
    int _1044 = int(_972) + int(_1036);
    float _1046 = as_type<float>(_587) * _1042;
    int _1048 = _990 * _1044;
    int _1050 = _1048 + _938;
    float _1052 = trunc(_1046);
    float _1054 = precise::max(_1052, 0.0);
    uint _1056 = uint(_1054);
    bool _1058 = uint(_1050) >= uint(_509);
    bool _1060 = !_1058;
    int _1062 = _1060 ? 0 : (-1);
    int _1064 = ~_1044;
    int _1066 = _1064 + _1062;
    int _1068 = _1066 + 1;
    int _1070 = ~_549;
    int _1072 = _1070 + 1;
    int _1074 = int(_1028) + int(_1056);
    int _1076 = _509 * _1068;
    int _1078 = _1076 + _938;
    bool _1080 = !_992;
    int _1082 = _1080 ? _1078 : (-1);
    int _1084 = _1072 * _1074;
    int _1086 = _1084 + _1006;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1090 = _1088 != 0;
    int _1092 = _1082 & 3;
    bool _1094 = _1092 != 0;
    int _1096 = _1082 & 3;
    bool _1098 = _1096 != 0;
    int _1100 = _1094 ? 0 : 1;
    bool _1102 = uint(_1086) >= uint(_549);
    bool _1104 = uint(_1096) >= 2u;
    bool _1106 = !_1102;
    int _1108 = _1106 ? 0 : (-1);
    int _1110 = _1104 ? 0 : 1;
    bool _1112 = uint(_1096) > 1u;
    bool _1114 = _1096 != 3;
    int _1116 = ~_1074;
    int _1118 = _1116 + _1108;
    int _1120 = _1118 + 1;
    int _1122 = ~_1100;
    int _1124 = _1122 + 1;
    int _1126 = _1124 + 1;
    float _1128 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1130 = log2(_1128);
    int _1132 = ~_1110;
    int _1134 = _1132 + 1;
    int _1136 = _1134 + 1;
    int _1138 = _549 * _1120;
    int _1140 = _1138 + _1006;
    float _1142 = _495 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1144 = _1126;
    int _1146 = _1136;
    int _1148 = _1110;
    float _1150 = as_type<float>(_866);
    if (!_1112)
    {
        int _1152 = ~_1100;
        int _1154 = _1152 + 1;
        _1144 = _1154;
    }
    int _1156 = _1144;
    bool _1158 = !_922;
    int _1160 = _1158 ? _1140 : (-1);
    if (_1114)
    {
        int _1162 = ~_1110;
        int _1164 = _1162 + 1;
        _1146 = _1164;
    }
    int _1166 = _1146;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1170 = _1168 != 0;
    int _1172 = _1160 & 3;
    bool _1174 = _1172 != 0;
    bool _1176 = !_1170;
    int _1178 = _1176 ? 0 : 1;
    bool _1180 = uint(_1172) > 1u;
    float _1182 = -_207;
    int _1184 = _1002 ? as_type<int>(_1182) : as_type<int>(_207);
    int _1186 = _1160 & 3;
    bool _1188 = _1186 != 0;
    if (_1090)
    {
        _1148 = 0;
    }
    int _1190 = _1148;
    int _1192 = _1190;
    if (!_1090)
    {
        _1192 = 2;
    }
    int _1194 = _1192;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1198 = _1172 != 3;
    int _1200 = _1188 ? 0 : 1;
    float _1202 = -_1196;
    float _1204 = fma(_1142, 2.0, _1202);
    bool _1206 = uint(_1172) >= 2u;
    float _1208 = _495 * 2.0;
    int _1210 = ~_1200;
    int _1212 = _1210 + 1;
    int _1214 = _1212 + 1;
    int _1216 = _1214;
    float _1218 = _1208;
    if (!_1180)
    {
        int _1220 = ~_1200;
        int _1222 = _1220 + 1;
        _1216 = _1222;
    }
    int _1224 = _1216;
    float _1226 = float(uint(_866));
    int _1228 = _1206 ? 0 : 1;
    bool _1230 = _1194 != 2;
    float _1232 = as_type<float>(_555) * _1226;
    int _1234 = ~_1228;
    int _1236 = _1234 + 1;
    int _1238 = _1236 + 1;
    float _1240 = floor(_1208);
    int _1242 = _1238;
    if (_1198)
    {
        int _1244 = ~_1228;
        int _1246 = _1244 + 1;
        _1242 = _1246;
    }
    int _1248 = _1242;
    float _1250 = _1130 * _141;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1254 = float(uint(_986));
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1258 = _1256 != 0;
    float _1260 = trunc(_1232);
    float _1262 = precise::max(_1260, 0.0);
    uint _1264 = uint(_1262);
    float _1266 = as_type<float>(_587) * _1254;
    bool _1268 = !_1258;
    float _1270 = _1268 ? _207 : as_type<float>(_1184);
    float _1272 = _497 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1274 = _495 > 0.5;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1278 = _1276 != 0;
    float _1280 = fma(_1272, -2.0, _1252);
    float _1282 = exp2(_1250);
    float _1284 = -_217;
    int _1286 = _1274 ? as_type<int>(_1284) : as_type<int>(_217);
    int _1288 = ~_509;
    int _1290 = _1288 + 1;
    bool _1292 = !_1278;
    float _1294 = _1292 ? _217 : as_type<float>(_1286);
    bool _1296 = _1240 > 0.0;
    float _1298 = trunc(_1266);
    float _1300 = precise::max(_1298, 0.0);
    uint _1302 = uint(_1300);
    float _1304 = _1272;
    if (_1230)
    {
        _1218 = _495;
    }
    float _1306 = _1218;
    bool _1308 = _1240 >= 0.0;
    bool _1310 = isnan(_1240);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan(0.0);
    bool _1316 = _1312 || _1314;
    float _1318 = _1306;
    if (!_1230)
    {
        _1318 = _676;
    }
    float _1320 = _1318;
    float _1322 = -_1282;
    float _1324 = _1322 + 1.0;
    int _1326 = _1290 * int(_1264);
    int _1328 = _1326 + _866;
    float _1330 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_1230)
    {
        _1304 = _497;
    }
    float _1332 = _1304;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1336 = _1332;
    if (!_1230)
    {
        _1336 = _495;
    }
    float _1338 = _1336;
    float _1340 = float(uint(_1328));
    int _1342 = _571 * int(_1302);
    int _1344 = _1342 + _986;
    bool _1346 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1348 = isnan(0.0);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1354 = _1350 || _1352;
    float _1356 = -_1334;
    float _1358 = fma(_1330, 2.0, _1356);
    float _1360 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1362 = as_type<float>(_555) * _1340;
    float _1364 = _1354 ? _1324 : 0.0;
    float _1366 = -_141;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1358);
    bool _1370 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1372 = isnan(1.0);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1378 = _1374 || _1376;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1382 = 1.0 + _1380;
    float _1384 = float(uint(_1344));
    float _1386 = trunc(_1362);
    float _1388 = precise::max(_1386, 0.0);
    uint _1390 = uint(_1388);
    float _1392 = fma(_1360, -2.0, _1030);
    float _1394 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1280);
    float _1396 = as_type<float>(_587) * _1384;
    float _1398 = _497 * 2.0;
    float _1400 = 1.0 / _1382;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1406 = ~_509;
    int _1408 = _1406 + 1;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1412 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1402);
    float _1414 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1404);
    float _1416 = floor(_1398);
    float _1418 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1410);
    float _1420 = -_141;
    float _1422 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1204);
    float _1424 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1412);
    int _1426 = int(_1264) + int(_1390);
    float _1428 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1414);
    float _1430 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _537);
    float _1432 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1418);
    float _1434 = trunc(_1396);
    float _1436 = precise::max(_1434, 0.0);
    uint _1438 = uint(_1436);
    float _1440 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1392);
    if (_1378)
    {
        float _1442 = _1364 * _1400;
        _163 = _1442;
    }
    float _1444 = _163;
    int _1446 = _1316 ? 0 : 1;
    float _1448 = in.m_46.x;
    float _1450 = in.m_46.y;
    float _1452 = in.m_46.z;
    float _1454 = _676 * 2.0;
    int _1456 = ~_549;
    int _1458 = _1456 + 1;
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1462 = _489 + _1460;
    bool _1464 = _1416 > 0.0;
    int _1466 = _1408 * _1426;
    int _1468 = _1466 + _866;
    float _1470 = floor(_1454);
    bool _1472 = _1416 >= 0.0;
    bool _1474 = isnan(_1416);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan(0.0);
    bool _1480 = _1476 || _1478;
    float _1482 = fma(_600, _808, _1368);
    int _1484 = ~_1446;
    int _1486 = _1484 + 1;
    int _1488 = _1486 + 1;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1494 = int(_1302) + int(_1438);
    float _1496 = -_1430;
    float _1498 = _1496 + 1.0;
    int _1500 = _1488;
    if (!_1296)
    {
        int _1502 = ~_1446;
        int _1504 = _1502 + 1;
        _1500 = _1504;
    }
    int _1506 = _1500;
    bool _1508 = uint(_1468) >= uint(_509);
    float _1510 = 1.0 / _1492;
    int _1512 = _1458 * _1494;
    int _1514 = _1512 + _986;
    int _1516 = _1480 ? 0 : 1;
    bool _1518 = !_1508;
    int _1520 = _1518 ? 0 : (-1);
    int _1522 = ~_1516;
    int _1524 = _1522 + 1;
    int _1526 = _1524 + 1;
    float _1528 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1530 = uint(_1514) >= uint(_549);
    int _1532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1534 = _1532 != 0;
    float _1536 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1538 = _1526;
    if (!_1464)
    {
        int _1540 = ~_1516;
        int _1542 = _1540 + 1;
        _1538 = _1542;
    }
    int _1544 = _1538;
    float _1546 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1548 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1550 = isnan(_489);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1556 = _1552 || _1554;
    float _1558 = float(_1556);
    float _1560 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1528);
    bool _1562 = !_1530;
    int _1564 = _1562 ? 0 : (-1);
    float _1566 = _521 * _1510;
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1570 = _1568 != 0;
    int _1572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1574 = _1572 != 0;
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1578 = _1576 != 0;
    float _1580 = _497 + _495;
    bool _1582 = _489 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1584 = isnan(_489);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = -_1558;
    float _1596 = _1594 + 1.0;
    float _1598 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1546);
    bool _1600 = !_1098;
    int _1602 = _1600 ? 0 : 1;
    float _1604 = _1580 + (-1.0);
    float _1606 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1536);
    bool _1608 = _1470 >= 0.0;
    bool _1610 = isnan(_1470);
    bool _1612 = _1608 || _1610;
    bool _1614 = isnan(0.0);
    bool _1616 = _1612 || _1614;
    float _1618 = fma(_1566, _1462, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1620 = _1592 * _1596;
    float _1622 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1598);
    float _1624 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1626 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1560);
    int _1628 = _1616 ? 0 : 1;
    float _1630 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1606);
    bool _1632 = _1470 > 0.0;
    float _1634 = _1294 + 0.5;
    float _1636 = _1618 * _1620;
    float _1638 = -_1592;
    float _1640 = _1638 + 1.0;
    float _1642 = _1270 + (-0.5);
    float _1644 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1422);
    int _1646 = _1082 >> 31;
    float _1648 = fma(_1640, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1636);
    float _1650 = -_1642;
    float _1652 = -_1394;
    float _1654 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1652);
    int _1656 = _1160 >> 31;
    float _1658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1660 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1648);
    int _1662 = _1646 & 3;
    bool _1664 = !_1174;
    int _1666 = _1664 ? 0 : 1;
    float _1668 = _1660 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1670 = _1656 & 3;
    bool _1672 = _1096 != 3;
    float _1674 = _1626 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1676 = _1082 + _1662;
    float _1678 = -_1428;
    float _1680 = _1678 + 1.0;
    int _1682 = _1160 + _1670;
    float _1684 = _1622 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1688 = _1674 + _1686;
    float _1690 = -_1424;
    float _1692 = _1690 + 1.0;
    int _1694 = _1676 >> 2;
    float _1696 = _1630 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1700 = _1684 + _1698;
    float _1702 = _1688 * _1688;
    int _1704 = _1682 >> 2;
    float _1706 = -_1692;
    float _1708 = fma(_1294, _1706, _1644);
    int _1710 = _1694 << 4;
    int _1712 = _1710 + 368;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1716 = _1696 + _1714;
    float _1718 = fma(_1700, _1700, _1702);
    int _1720 = _1704 << 4;
    int _1722 = _1720 + 512;
    float _1724 = fma(_1270, _1680, _1654);
    uint _1726 = uint(int(uint(_1712) >> uint(2)));
    uint _1728 = uint(int(uint(int(_1726)) >> uint(2)));
    int _1730 = int(_1726) & 3;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[int(_1728)][_1730];
    int _1734 = int(_1726) + 1;
    uint _1736 = uint(int(uint(_1734) >> uint(2)));
    int _1738 = _1734 & 3;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[int(_1736)][_1738];
    float _1742 = fma(_1716, _1716, _1718);
    int _1744 = ~_1628;
    int _1746 = _1744 + 1;
    int _1748 = _1746 + 1;
    float _1750 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1752 = _1748;
    float _1754 = _1674;
    if (!_1632)
    {
        int _1756 = ~_1628;
        int _1758 = _1756 + 1;
        _1752 = _1758;
    }
    int _1760 = _1752;
    float _1762 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1764 = !_1672;
    int _1766 = _1764 ? 0 : (-1);
    float _1768 = rsqrt(_1742);
    uint _1770 = uint(int(uint(_1722) >> uint(2)));
    uint _1772 = uint(int(uint(int(_1770)) >> uint(2)));
    int _1774 = int(_1770) & 3;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[int(_1772)][_1774];
    int _1778 = int(_1770) + 1;
    uint _1780 = uint(int(uint(_1778) >> uint(2)));
    int _1782 = _1778 & 3;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[int(_1780)][_1782];
    float _1786 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1762);
    bool _1788 = _1172 != 3;
    out.m_66.x = _1708;
    out.m_66.y = _1724;
    bool _1790 = !_1570;
    int _1792 = _1790 ? 0 : 1;
    float _1794 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1786);
    bool _1796 = !_1788;
    int _1798 = _1796 ? 0 : (-1);
    out.m_68.w = _1668;
    int _1800 = _1712 + 8;
    uint _1802 = uint(int(uint(_1800) >> uint(2)));
    uint _1804 = uint(int(uint(int(_1802)) >> uint(2)));
    int _1806 = int(_1802) & 3;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[int(_1804)][_1806];
    int _1810 = int(_1802) + 1;
    uint _1812 = uint(int(uint(_1810) >> uint(2)));
    int _1814 = _1810 & 3;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[int(_1812)][_1814];
    int _1818 = abs(_1792);
    bool _1820 = _1794 >= 0.0;
    float _1822 = float(_1760);
    float _1824 = _756 + (-0.5);
    float _1826 = _1688 * _1768;
    int _1828 = _1722 + 8;
    uint _1830 = uint(int(uint(_1828) >> uint(2)));
    uint _1832 = uint(int(uint(int(_1830)) >> uint(2)));
    int _1834 = int(_1830) & 3;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[int(_1832)][_1834];
    int _1838 = int(_1830) + 1;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    int _1842 = _1838 & 3;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[int(_1840)][_1842];
    int _1846 = abs(_1166);
    float _1848 = -_1750;
    float _1850 = -_1440;
    float _1852 = fma(_1848, _1824, _1850);
    float _1854 = -_1826;
    float _1856 = fma(_1854, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1688);
    float _1858 = _1700 * _1768;
    int _1860 = abs(_1602);
    float _1862 = _1856 * _1856;
    float _1864 = float(_1818);
    float _1866 = -_1858;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1700);
    int _1870 = ~_1860;
    int _1872 = _1870 + 1;
    int _1874 = _1872 + 1;
    float _1876 = _1716 * _1768;
    int _1878 = abs(_1666);
    float _1880 = _1864 * _1822;
    int _1882 = abs(_1156);
    float _1884 = fma(_1868, _1868, _1862);
    int _1886 = abs(_1224);
    float _1888 = -_1876;
    float _1890 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1716);
    int _1892 = ~_1882;
    int _1894 = _1892 + 1;
    int _1896 = _1894 + 1;
    float _1898 = _1858;
    if (_1820)
    {
        out.m_49.x = 0.0;
    }
    int _1900 = ~_1886;
    int _1902 = _1900 + 1;
    int _1904 = _1902 + 1;
    float _1906 = fma(_1890, _1890, _1884);
    int _1908 = abs(_1248);
    int _1910 = _1896 * as_type<int>(_1740);
    int _1912 = ~_1846;
    int _1914 = _1912 + 1;
    int _1916 = _1914 + 1;
    int _1918 = abs(_1178);
    int _1920 = _1874 * as_type<int>(_1732);
    int _1922 = _1920 + _1910;
    int _1924 = abs(_1766);
    float _1926 = sqrt(_1906);
    int _1928 = ~_1426;
    int _1930 = _1928 + _1520;
    int _1932 = _1930 + 1;
    int _1934 = _1904 * as_type<int>(_1784);
    int _1936 = ~_1878;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    int _1942 = ~_1494;
    int _1944 = _1942 + _1564;
    int _1946 = _1944 + 1;
    int _1948 = _509 * _1932;
    int _1950 = _1948 + _866;
    bool _1952 = _509 == 0;
    int _1954 = _1940 * as_type<int>(_1776);
    int _1956 = _1954 + _1934;
    int _1958 = _1916 * as_type<int>(_1808);
    int _1960 = _1958 + _1922;
    bool _1962 = !_1534;
    int _1964 = _1962 ? 0 : 1;
    int _1966 = _549 * _1946;
    int _1968 = _1966 + _986;
    int _1970 = ~_1908;
    int _1972 = _1970 + 1;
    int _1974 = _1972 + 1;
    int _1976 = abs(_1964);
    float _1978 = _1768 * _1926;
    int _1980 = ~_1924;
    int _1982 = _1980 + 1;
    int _1984 = _1982 + 1;
    int _1986 = _1974 * as_type<int>(_1836);
    int _1988 = _1986 + _1956;
    int _1990 = abs(_1798);
    int _1992 = _1984 * as_type<int>(_1816);
    int _1994 = _1992 + _1960;
    int _1996 = ~_1990;
    int _1998 = _1996 + 1;
    int _2000 = _1998 + 1;
    float _2002 = in.m_70.x;
    float _2004 = in.m_70.y;
    float _2006 = in.m_70.z;
    int _2008 = ~_1976;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    int _2014 = _2000 * as_type<int>(_1844);
    int _2016 = _2014 + _1988;
    int _2018 = ~_1918;
    int _2020 = _2018 + 1;
    int _2022 = _2020 + 1;
    float _2024 = -_1432;
    float _2026 = _2024 + 1.0;
    if (_1820)
    {
        _1150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2028 = _1150;
    int _2030 = _2016 * _2012;
    bool _2032 = !_1952;
    int _2034 = _2032 ? _1950 : (-1);
    int _2036 = _1994 * _2022;
    bool _2038 = !_922;
    int _2040 = _2038 ? _1968 : (-1);
    float _2042 = -_1498;
    float _2044 = fma(_760, _2042, _1482);
    int _2046 = as_type<int>(_2028);
    if (_1820)
    {
        float _2048 = _2028 * 5.0;
        _2046 = as_type<int>(_2048);
    }
    int _2050 = _2046;
    float _2052 = fma(_756, _2026, _1852);
    int _2054 = _2034 * _1918;
    int _2056 = _2054 + _2036;
    float _2058 = _1880 * (-2.0);
    int _2060 = _2040 * _1976;
    int _2062 = _2060 + _2030;
    if (_1820)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6567 = as_type<float>(_2050);
        out.gl_Position.z = _6567;
    }
    float _2064 = _495 + (-0.5);
    float _2066 = float(_2056);
    float _2068 = fma(_1624, _2058, _1624);
    float _2070 = float(_2062);
    out.m_72.x = _2044;
    out.m_72.y = _2052;
    float _2072 = fma(_2058, _2002, _2002);
    bool _2074 = !_1574;
    int _2076 = _2074 ? 0 : 1;
    out.m_74.x = _2066;
    out.m_74.y = _2070;
    float _2078 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2072);
    float _2080 = _497 + _676;
    float _2082 = _501 * _1978;
    float _2084 = float(_1506);
    float _2086 = _2080 + (-1.0);
    out.m_76.x = _2082;
    bool _2088 = !_1578;
    int _2090 = _2088 ? 0 : 1;
    int _2092 = abs(_2076);
    if (_1820)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2094 = -_1826;
    float _2096 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1674);
    int _2098 = abs(_2090);
    float _2100 = -_1876;
    float _2102 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1696);
    float _2104 = -_1858;
    float _2106 = fma(_2104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1684);
    float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2110 = _2096 + _2108;
    float _2112 = float(_1544);
    float _2114 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2116 = _2102 + _2114;
    float _2118 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2120 = _2106 + _2118;
    float _2122 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2124 = float(_2092);
    float _2126 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2128 = float(_2098);
    float _2130 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2122);
    float _2132 = _497 + (-0.5);
    float _2134 = _2124 * _2084;
    float _2136 = _676 + _495;
    float _2138 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2130);
    float _2140 = _2128 * _2112;
    float _2142 = _2134 * (-2.0);
    float _2144 = _2136 + (-1.0);
    float _2146 = fma(_2068, _1444, _2078);
    bool _2148 = _2138 >= 0.0;
    float _2150 = fma(_2142, _2004, _2004);
    float _2152 = fma(_2126, _2142, _2126);
    float _2154 = _2140 * (-2.0);
    float _2156 = fma(_2132, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2150);
    float _2158 = _2146 * 0.15915493667125701904296875;
    float _2160 = _676 + (-0.5);
    float _2162 = fma(_2144, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2164 = fma(_2152, _1444, _2156);
    float _2166 = fma(_2154, _2006, _2006);
    float _2168 = _2158 * 6.283185482025146484375;
    float _2170 = sin(_2168);
    float _2172 = _2164 * 0.15915493667125701904296875;
    float _2174 = _2126;
    float _2176 = _2120;
    float _2178 = _2116;
    if (_2148)
    {
        _2174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2180 = _2174;
    float _2182 = fma(_2162, _2154, _2162);
    float _2184 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2166);
    int _2186 = as_type<int>(_2180);
    if (_2148)
    {
        out.m_49.x = 0.0;
    }
    float _2188 = _2158 * 6.283185482025146484375;
    float _2190 = cos(_2188);
    if (_2148)
    {
        float _2192 = _2180 * 5.0;
        _2186 = as_type<int>(_2192);
    }
    int _2194 = _2186;
    float _2196 = fma(_2182, _1444, _2184);
    if (_2148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6797 = as_type<float>(_2194);
        out.gl_Position.z = _6797;
    }
    float _2198 = _2196 * 0.15915493667125701904296875;
    float _2200 = _2172 * 6.283185482025146484375;
    float _2202 = sin(_2200);
    float _2204 = _2172 * 6.283185482025146484375;
    float _2206 = cos(_2204);
    if (_2148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2208 = _2198 * 6.283185482025146484375;
    float _2210 = cos(_2208);
    float _2212 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2216 = _2170 * _2202;
    float _2218 = _2190 * _2206;
    float _2220 = _2212 * _1978;
    float _2222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2224 = _2190 * _2202;
    float _2226 = _2198 * 6.283185482025146484375;
    float _2228 = sin(_2226);
    float _2230 = _2220 * _2214;
    float _2232 = _2170 * _2206;
    float _2234 = _2082 * _2222;
    float _2236 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2238 = _2236 * 0.5;
    float _2240 = _2190 * _2210;
    float _2242 = _2206 * _2210;
    float _2244 = _2170 * _2210;
    float _2246 = _2202 * _2210;
    float _2248 = _2240 * _2230;
    float _2250 = fma(_2228, _2218, _2216);
    float _2252 = -_2232;
    float _2254 = fma(_2228, _2224, _2252);
    float _2256 = -_2230;
    float _2258 = _2228 * _2256;
    float _2260 = -_2224;
    float _2262 = fma(_2228, _2232, _2260);
    float _2264 = fma(_2250, _2234, _2248);
    float _2266 = _2244 * _2230;
    float _2268 = fma(_2242, _2234, _2258);
    float _2270 = fma(_2254, _2238, _2264);
    float _2272 = fma(_2228, _2216, _2218);
    float _2274 = fma(_2262, _2234, _2266);
    float _2276 = fma(_2246, _2238, _2268);
    float _2278 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2280 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2282 = fma(_2272, _2238, _2274);
    float _2284 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2278);
    float _2286 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2280);
    float _2288 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2284);
    float _2290 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2286);
    float _2292 = _2288 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2294 = _2290 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2296 = _1696 + _2292;
    float _2298 = _1684 + _2294;
    float _2300 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2302 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2306 = _2296 + _2304;
    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2310 = _2298 + _2308;
    float _2312 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2300);
    float _2314 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2302);
    float _2316 = _2306 * _2306;
    float _2318 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2312);
    float _2320 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2314);
    float _2322 = fma(_2310, _2310, _2316);
    float _2324 = _2318 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2326 = sqrt(_2322);
    float _2328 = _1674 + _2324;
    bool _2330 = _2326 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2332 = _2318;
    float _2334 = _2324;
    float _2336 = _2302;
    if (!_2330)
    {
        _2332 = _2298;
    }
    float _2338 = _2332;
    float _2340 = _2338;
    if (!_2330)
    {
        _2334 = _2296;
    }
    float _2342 = _2334;
    float _2344 = _2342;
    if (!_2330)
    {
        _2336 = _2328;
    }
    float _2346 = _2336;
    bool _2348 = !_2330;
    float _2350 = _2346;
    if (!_2348)
    {
        float _2352 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2356 = _2326 + _2354;
        float _2358 = rsqrt(_2322);
        float _2360 = _2356 * _2352;
        float _2362 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2364 = _2360 * 0.15915493667125701904296875;
        float _2366 = _2364 * 6.283185482025146484375;
        float _2368 = cos(_2366);
        float _2370 = _2364 * 6.283185482025146484375;
        float _2372 = sin(_2370);
        float _2374 = _2368 + (-1.0);
        float _2376 = fma(_2372, _2362, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2378 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2380 = _2358 * _2376;
        float _2382 = fma(_2328, _2368, _2378);
        float _2384 = fma(_2310, _2380, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2386 = fma(_2306, _2380, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2350 = _2382;
        _2340 = _2384;
        _2344 = _2386;
    }
    float _2388 = _2350;
    float _2390 = _2340;
    float _2392 = _2344;
    float _2394 = -_1674;
    float _2396 = _2394 + _2388;
    float _2398 = -_1684;
    float _2400 = _2398 + _2390;
    float _2402 = -_1696;
    float _2404 = _2402 + _2392;
    float _2406 = _2320 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2408 = _2396 * _2396;
    float _2410 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2412 = 1.0 / _2406;
    float _2414 = fma(_2400, _2400, _2408);
    float _2416 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2410);
    bool _2418 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2420 = isnan(0.5);
    bool _2422 = _2418 || _2420;
    bool _2424 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2426 = _2422 || _2424;
    float _2428 = fma(_2404, _2404, _2414);
    float _2430 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2416);
    bool _2432 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2434 = isnan(0.5);
    bool _2436 = _2432 || _2434;
    bool _2438 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2440 = _2436 || _2438;
    float _2442 = sqrt(_2428);
    float _2444 = _2430 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2446 = _2444 + _2406;
    float _2448 = _2446 * _2412;
    float _2450 = _2448 * 0.5;
    bool _2452 = _2442 > 0.0;
    float _2454 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2456 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2454);
    float _2458 = 1.0 / _2456;
    float _2460 = _2412;
    float _2462 = _2450;
    float _2464 = _2406;
    if (!_2452)
    {
        _2460 = _2390;
    }
    float _2466 = _2460;
    float _2468 = _2466;
    if (!_2452)
    {
        _2462 = _2388;
    }
    float _2470 = _2462;
    float _2472 = _2470;
    if (!_2452)
    {
        _2464 = _2392;
    }
    float _2474 = _2464;
    bool _2476 = !_2452;
    float _2478 = _2474;
    float _2480 = _2474;
    if (!_2476)
    {
        float _2482 = _211 * _211;
        float _2484 = fma(_209, _209, _2482);
        float _2486 = rsqrt(_2428);
        float _2488 = fma(_213, _213, _2484);
        float _2490 = sqrt(_2488);
        float _2492 = _2400 * _2486;
        float _2494 = _2396 * _2486;
        float _2496 = _2404 * _2486;
        bool _2498 = _2490 > 0.0;
        float _2500 = _2490;
        float _2502 = _2486;
        if (!_2498)
        {
            _2500 = _2390;
        }
        float _2504 = _2500;
        _2468 = _2504;
        if (!_2498)
        {
            _2502 = _2388;
        }
        float _2506 = _2502;
        _2472 = _2506;
        if (!_2498)
        {
            _2478 = _2392;
        }
        float _2508 = _2478;
        bool _2510 = !_2498;
        _2480 = _2508;
        if (!_2510)
        {
            float _2512 = rsqrt(_2488);
            float _2514 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2516 = _211 * _2512;
            float _2518 = _209 * _2512;
            float _2520 = _213 * _2512;
            float _2522 = _2494 * _2516;
            float _2524 = fma(_2492, _2518, _2522);
            float _2526 = _2514 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2528 = fma(_2496, _2520, _2524);
            float _2530 = _2528 * _2526;
            float _2532 = fma(_209, _2530, _2390);
            float _2534 = fma(_211, _2530, _2388);
            float _2536 = fma(_213, _2530, _2392);
            _2468 = _2532;
            _2472 = _2534;
            _2480 = _2536;
        }
    }
    float _2538 = _2468;
    float _2540 = _2472;
    float _2542 = _2480;
    float _2544 = -_1858;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2538);
    float _2548 = -_1826;
    float _2550 = fma(_2548, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2540);
    float _2552 = -_1876;
    float _2554 = fma(_2552, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2542);
    float _2556 = _2550;
    float _2558 = _2546;
    float _2560 = _2554;
    if (_2440)
    {
        _221 = 1.0;
    }
    float _2562 = _221;
    float _2564 = _2562;
    if (!_2426)
    {
        float _2566 = _2110 * _2110;
        float _2568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2570 = -_1696;
        float _2572 = _2570 + _2542;
        float _2574 = -_1674;
        float _2576 = _2574 + _2540;
        float _2578 = fma(_2120, _2120, _2566);
        float _2580 = fma(_2116, _2116, _2578);
        float _2582 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2584 = sqrt(_2580);
        float _2586 = 1.0 / _1978;
        float _2588 = precise::min(_2584, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2590 = _2588 * _2568;
        float _2592 = _2582 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2594 = -_1684;
        float _2596 = _2594 + _2538;
        float _2598 = _2590 * _2586;
        float _2600 = _2592 * _2598;
        float _2602 = _2572 * _2598;
        float _2604 = fma(_2576, _2600, _2096);
        float _2606 = fma(_2596, _2600, _2106);
        float _2608 = fma(_2592, _2602, _2102);
        _2556 = _2604;
        _2558 = _2606;
        _2560 = _2608;
        _2176 = _2584;
    }
    float _2610 = _2556;
    float _2612 = _2558;
    float _2614 = _2560;
    float _2616 = _2176;
    float _2618 = _2616;
    if (_2440)
    {
        _1754 = 1.0;
    }
    float _2620 = _1754;
    float _2622 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2624 = _2458 * _2622;
    float _2626 = _2620;
    if (!_2440)
    {
        float _2628 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2630 = _2628 * 0.15915493667125701904296875;
        float _2632 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2634 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2636 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2634;
        float _2638 = _2630 * 6.283185482025146484375;
        float _2640 = cos(_2638);
        float _2642 = _2632 * 0.15915493667125701904296875;
        float _2644 = _2630 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        float _2648 = 1.0 / _2640;
        float _2650 = _2642 * 6.283185482025146484375;
        float _2652 = cos(_2650);
        float _2654 = _2646 * _2648;
        float _2656 = _2642 * 6.283185482025146484375;
        float _2658 = sin(_2656);
        float _2660 = _2652 * _2654;
        float _2662 = 1.0 / _2636;
        float _2664 = 1.0 / _2660;
        float _2666 = _2658 * _2664;
        float _2668 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2670 = fma(_2624, _2666, _2668);
        float _2672 = _2670 * _2662;
        float _2674 = precise::clamp(_2672, 0.0, 1.0);
        _2178 = _2642;
        _2618 = _2654;
        _2564 = _2674;
    }
    float _2676 = _2178;
    float _2678 = _2618;
    float _2680 = _2564;
    float _2682 = _2676;
    float _2684 = _2678;
    if (!_2440)
    {
        float _2686 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2688 = _2686 * 0.15915493667125701904296875;
        float _2690 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2692 = _2688 * 6.283185482025146484375;
        float _2694 = cos(_2692);
        float _2696 = _2690 * 0.15915493667125701904296875;
        float _2698 = _2688 * 6.283185482025146484375;
        float _2700 = sin(_2698);
        float _2702 = 1.0 / _2694;
        float _2704 = _2696 * 6.283185482025146484375;
        float _2706 = cos(_2704);
        float _2708 = _2700 * _2702;
        float _2710 = _2696 * 6.283185482025146484375;
        float _2712 = sin(_2710);
        float _2714 = _2706 * _2708;
        float _2716 = 1.0 / _2714;
        float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2720 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2718;
        float _2722 = 1.0 / _2720;
        float _2724 = _2712 * _2716;
        float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2728 = fma(_2624, _2724, _2726);
        float _2730 = _2728 * _2722;
        float _2732 = precise::clamp(_2730, 0.0, 1.0);
        float _2734 = -_2732;
        float _2736 = _2734 + 1.0;
        _2682 = _2702;
        _2684 = _2714;
        _2626 = _2736;
    }
    float _2738 = _2682;
    float _2740 = _2684;
    float _2742 = _2626;
    float _2744 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2746 = _2610 + _2744;
    float _2748 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2750 = _2612 + _2748;
    float _2752 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2754 = _2614 + _2752;
    float _2756 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2758 = _2746 * _2746;
    float _2760 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2756);
    float _2762 = fma(_2750, _2750, _2758);
    float _2764 = fma(_2754, _2754, _2762);
    float _2766 = rsqrt(_2764);
    float _2768 = sqrt(_2764);
    float _2770 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2772 = _2750 * _2770;
    float _2774 = _2754 * _2770;
    float _2776 = _2772 * _2772;
    float _2778 = _2774 * _2774;
    float _2780 = _2776 + _2778;
    float _2782 = sqrt(_2780);
    bool _2784 = _2782 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2788 = _2782 + _2786;
    float _2790 = _2738;
    float _2792 = _2780;
    float _2794 = _2788;
    float _2796 = _2740;
    float _2798 = _2746;
    if (_2784)
    {
        float _2800 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2790 = _2800;
    }
    float _2802 = _2790;
    if (_2784)
    {
        float _2804 = rsqrt(_2780);
        _2792 = _2804;
    }
    float _2806 = _2792;
    float _2808 = _2806;
    if (_2784)
    {
        float _2810 = _2788 * _2802;
        _2794 = _2810;
    }
    float _2812 = _2794;
    if (_2784)
    {
        float _2814 = _2812 * 0.15915493667125701904296875;
        _2796 = _2814;
    }
    float _2816 = _2796;
    float _2818 = _2754;
    float _2820 = _2816;
    if (_2784)
    {
        float _2822 = _2816 * 6.283185482025146484375;
        float _2824 = sin(_2822);
        _2818 = _2824;
    }
    float _2826 = _2818;
    float _2828 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2830 = precise::max(0.0, _2828);
    float _2832 = _2802;
    if (_2784)
    {
        float _2834 = _2816 * 6.283185482025146484375;
        float _2836 = cos(_2834);
        _2832 = _2836;
    }
    float _2838 = _2832;
    float _2840 = -_2770;
    float _2842 = -_2830;
    float _2844 = fma(_2746, _2840, _2842);
    float _2846 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2784)
    {
        float _2848 = _2844 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2798 = _2848;
    }
    float _2850 = _2798;
    float _2852 = _2850;
    if (!_2784)
    {
        _2820 = _2772;
    }
    float _2854 = _2820;
    float _2856 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2858 = _2826;
    float _2860 = _2854;
    if (_2784)
    {
        float _2862 = fma(_2826, _2850, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2858 = _2862;
    }
    float _2864 = _2858;
    float _2866 = _2864;
    if (!_2784)
    {
        _2852 = _2844;
    }
    float _2868 = _2852;
    float _2870 = _2868;
    float _2872 = _2838;
    if (_2784)
    {
        float _2874 = _2838 + (-1.0);
        _2846 = _2874;
    }
    float _2876 = _2846;
    float _2878 = _2876;
    if (_2784)
    {
        float _2880 = _2806 * _2864;
        _1898 = _2880;
    }
    float _2882 = _1898;
    if (!_2784)
    {
        _2808 = _2774;
    }
    float _2884 = _2808;
    float _2886 = _2884;
    if (_2784)
    {
        float _2888 = _2876 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2878 = _2888;
    }
    float _2890 = _2878;
    if (_2784)
    {
        float _2892 = _2772 * _2882;
        _2860 = _2892;
    }
    float _2894 = _2860;
    if (!_2784)
    {
        _2866 = _2776;
    }
    float _2896 = _2866;
    float _2898 = _2896;
    if (_2784)
    {
        float _2900 = _2774 * _2882;
        _2886 = _2900;
    }
    float _2902 = _2886;
    if (_2784)
    {
        float _2904 = fma(_2844, _2838, _2890);
        _2870 = _2904;
    }
    float _2906 = _2870;
    if (_2784)
    {
        float _2908 = _2894 * _2894;
        _2898 = _2908;
    }
    float _2910 = _2898;
    if (!_2784)
    {
        _2872 = _2778;
    }
    float _2912 = _2872;
    float _2914 = _2912;
    if (_2784)
    {
        float _2916 = _2902 * _2902;
        _2914 = _2916;
    }
    float _2918 = _2914;
    float _2920 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2922 = fma(_2906, _2906, _2910);
    float _2924 = floor(_2856);
    float _2926 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2920);
    float _2928 = _2922 + _2918;
    float _2930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2932 = fma(_2768, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2930);
    float _2934 = precise::clamp(_2932, 0.0, 1.0);
    float _2936 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2926);
    float _2938 = rsqrt(_2928);
    float _2940 = -_2934;
    float _2942 = _2940 + 1.0;
    float _2944 = _2936 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2946 = fma(_2102, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2948 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2950 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2952 = abs(_2942);
    float _2954 = log2(_2952);
    float _2956 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2958 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2960 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2948);
    float _2962 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2956);
    float _2964 = -_2958;
    float _2966 = fma(_2964, _2950, 1.0);
    float _2968 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2960);
    float _2970 = _2938 * _2894;
    float _2972 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2962);
    float _2974 = _2938 * _2906;
    float _2976 = _2938 * _2902;
    float _2978 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2980 = _2972 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2982 = _2968 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2984 = floor(_2946);
    float _2986 = -_2978;
    float _2988 = fma(_2974, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2986);
    float _2990 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2992 = _2954 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2994 = -_2976;
    float _2996 = fma(_2994, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2988);
    float _2998 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2760);
    float _3000 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2990);
    float _3002 = exp2(_2992);
    float _3004 = fma(_2996, -0.5, 0.5);
    float _3006 = _2998 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3008 = fma(_2944, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3000);
    float _3010 = fma(_2996, 0.5, 0.5);
    float _3012 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3014 = fma(_3006, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3008);
    float _3016 = log2(_2966);
    float _3018 = -_2984;
    float _3020 = _2946 + _3018;
    float _3022 = fma(_3010, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3024 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3012);
    float _3026 = fma(_3010, _3022, -0.212114393711090087890625);
    float _3028 = fma(_2944, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3024);
    float _3030 = 1.0 / _3014;
    float _3032 = -_2924;
    float _3034 = _2856 + _3032;
    float _3036 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3038 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3036);
    float _3040 = _2974 + 1.0;
    float _3042 = sqrt(_3004);
    float _3044 = _3016 * 0.693147182464599609375;
    float _3046 = fma(_2944, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3038);
    float _3048 = -_2974;
    float _3050 = fma(_3002, _3040, _3048);
    float _3052 = fma(_3010, _3026, 1.570728778839111328125);
    float2 _8150 = float2(_3034, _3020);
    float _3054 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8150, float2(0.0), isnan(_8150)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8150, float2(0.0), isnan(_8150)), level(0.0)).x;
    float _3056 = fma(_3006, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3046);
    float _3058 = fma(_3006, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3028);
    float _3060 = _3044 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3062 = fma(_3050, 0.5, 0.5);
    float _3064 = _3056 * _3030;
    float _3066 = _3058 * _3030;
    float _3068 = fma(_3064, 0.5, 0.5);
    float _3070 = fma(_3066, -0.5, 0.5);
    float _3072 = _3042 * 0.636619746685028076171875;
    float _3074 = -_3052;
    float _3076 = fma(_3072, _3074, 1.0);
    float3 _8195 = float3(_3068, _3070, _3060);
    float _3078 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8195, float3(0.0), isnan(_8195)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8195, float3(0.0), isnan(_8195)), level(0.0)).x;
    float3 _8206 = float3(_3068, _3070, _3060);
    float4 _3081 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8206, float3(0.0), isnan(_8206)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8206, float3(0.0), isnan(_8206)), level(0.0)).xyzw;
    float _3083 = _3081.x;
    float _3085 = _3081.y;
    float _3087 = _3081.z;
    float _3089 = _3081.w;
    float2 _8222 = float2(_3076, _3062);
    float3 _3093 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8222, float2(0.0), isnan(_8222)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8222, float2(0.0), isnan(_8222)), level(0.0)).xyz;
    float _3095 = _3093.x;
    float _3097 = _3093.y;
    float _3099 = _3093.z;
    float _3101 = abs(_2624);
    float _3103 = log2(_3101);
    float _3105 = _2250 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3107 = _2250 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3109 = _2250 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3111 = _2240 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3113 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3105);
    float _3115 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3107);
    float _3117 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3109);
    float _3119 = _2240 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3121 = _2240 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3123 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3125 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3127 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3129 = -_2228;
    float _3131 = fma(_3129, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3111);
    float _3133 = -_2228;
    float _3135 = fma(_3133, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3121);
    float _3137 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3139 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3141 = -_2228;
    float _3143 = fma(_3141, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3119);
    float _3145 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3123);
    float _3147 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3125);
    float _3149 = exp2(_3139);
    float _3151 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3127);
    float _3153 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3143);
    float _3155 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3145);
    float _3157 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3147);
    float _3159 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3151);
    float _3161 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3113);
    float _3163 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3131);
    float _3165 = fma(_3137, _3137, 1.0);
    float _3167 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3169 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3135);
    float _3171 = _2980 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3173 = rsqrt(_3165);
    float _3175 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3115);
    float _3177 = _2954 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3179 = fma(_3149, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3181 = precise::clamp(_3179, 0.0, 1.0);
    float _3183 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3117);
    float _3185 = _3137 * _3163;
    float _3187 = _3181 * _3181;
    float _3189 = fma(_2982, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3171);
    float _3191 = fma(_3181, -2.0, 3.0);
    float _3193 = _3137 * _3153;
    float _3195 = exp2(_3177);
    float _3197 = fma(_3167, _3175, _3185);
    float _3199 = _3187 * _3191;
    float _3201 = fma(_3167, _3161, _3193);
    float _3203 = _3137 * _3169;
    float _3205 = _3137 * _3173;
    float _3207 = -_3199;
    float _3209 = _3207 + 1.0;
    out.m_78.x = _3161;
    out.m_78.y = _3175;
    out.m_78.z = _3183;
    float _3211 = fma(_3167, _3183, _3203);
    float _3213 = -_3155;
    float _3215 = _3205 * _3213;
    float _3217 = fma(_3209, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3199);
    float _3219 = fma(_2944, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3189);
    float _3221 = in.m_80.x;
    float _3223 = fma(_3173, _3153, _3215);
    float _3225 = _3155 + _3201;
    float _3227 = _3157 + _3197;
    float _3229 = -_3195;
    float _3231 = _3229 + 1.0;
    out.m_82.x = _2612;
    out.m_82.y = _2610;
    out.m_82.z = _2614;
    bool _3233 = _2768 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3235 = isnan(_2768);
    bool _3237 = _3233 || _3235;
    bool _3239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3241 = _3237 || _3239;
    float _3243 = -_3157;
    float _3245 = _3205 * _3243;
    float _3247 = -_3159;
    float _3249 = _3205 * _3247;
    float _3251 = _3231 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3253 = fma(_3173, _3163, _3245);
    bool _3255 = _2624 <= 8000.0;
    bool _3257 = isnan(_2624);
    bool _3259 = _3255 || _3257;
    bool _3261 = isnan(8000.0);
    bool _3263 = _3259 || _3261;
    float _3265 = float(_3263);
    float _3267 = fma(_3173, _3169, _3249);
    float _3269 = fma(_3006, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3219);
    float _3271 = _3014 * 0.5;
    float _3273 = _3056 + _3014;
    float _3275 = _3265 * _3217;
    out.m_84.x = _3223;
    out.m_84.y = _3253;
    out.m_84.z = _3267;
    float _3277 = _3269 + _3014;
    float _3279 = fma(_3058, -0.5, _3271);
    float _3281 = _3275 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3056;
    out.gl_Position.y = _3058;
    out.gl_Position.z = _3269;
    out.gl_Position.w = _3014;
    float _3283 = _3277 * 0.5;
    float _3285 = _3159 + _3211;
    float _3287 = _3273 * 0.5;
    out.m_86.x = _3225;
    out.m_86.y = _3227;
    out.m_86.z = _3285;
    float _3289 = _3157;
    float _3291 = _3267;
    float _3293 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3241)
    {
        _3289 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3295 = _3289;
    float _3297 = _3295;
    float _3299 = _3295;
    if (!_3241)
    {
        _3291 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3301 = _3291;
    out.m_88.z = _3283;
    out.m_88.w = _3014;
    out.m_90.x = _3287;
    out.m_90.y = _3279;
    out.m_90.z = _3283;
    out.m_90.w = _3014;
    float _3303 = -_3054;
    float _3305 = _3303 + 1.0;
    float _3307 = _3305 * _3281;
    float _3309 = precise::clamp(_3307, 0.0, 1.0);
    float _3311 = -_3309;
    float _3313 = fma(_3311, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3315 = _3085;
    float _3317 = _3301;
    float _3319 = _3301;
    if (!_3241)
    {
        _3293 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3321 = _3293;
    float _3323 = _3313 * _3221;
    float _3325 = _3323 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3327 = _3251 * _3078;
    float _3329 = -_3251;
    float _3331 = _3329 + 1.0;
    float _3333 = _3089 * _3327;
    float _3335 = _3099 * _3327;
    float _3337 = _3089 * _3331;
    out.m_92.x = _3325;
    float _3339 = fma(_3095, _3333, _3083);
    float _3341 = fma(_3097, _3333, _3085);
    float _3343 = fma(_3089, _3335, _3087);
    float _3345 = _2680 * _2742;
    float _3347 = _3327;
    float _3349 = _3345;
    float _3351 = _3321;
    float _3353 = _3321;
    if (!_3241)
    {
        _3347 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3355 = _3347;
    float _3357 = _3355;
    float _3359 = _3355;
    if (!_3241)
    {
        _3315 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3361 = _3315;
    out.m_94.x = _3339;
    out.m_94.y = _3341;
    out.m_94.z = _3343;
    out.m_94.w = _3337;
    float _3363 = _3345 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3365 = _3361;
    float _3367 = _3361;
    if (!_3241)
    {
        _3349 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3369 = _3349;
    bool _3371 = !_3241;
    float _3373 = _3369;
    float _3375 = _3369;
    if (!_3371)
    {
        bool _3377 = _2768 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3379 = isnan(_2768);
        bool _3381 = _3377 || _3379;
        bool _3383 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3385 = _3381 || _3383;
        if (!_3385)
        {
            float _3387 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3389 = _2768 + _3387;
            float _3391 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3393 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3391;
            float _3395 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3397 = _3395 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3399 = 1.0 / _3393;
            float _3401 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3403 = _3401 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3405 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3407 = _3405 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3409 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3411 = _3409 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3413 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3415 = _3413 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3417 = _3389 * _3399;
            float _3419 = precise::clamp(_3417, 0.0, 1.0);
            float _3421 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3423 = _3421 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3425 = fma(_3419, _3397, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3427 = fma(_3419, _3423, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3429 = fma(_3419, _3403, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3431 = fma(_3419, _3407, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3433 = fma(_3419, _3411, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3435 = fma(_3419, _3415, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3319 = _3429;
            _3367 = _3433;
            _3299 = _3425;
            _3359 = _3431;
            _3353 = _3427;
            _3375 = _3435;
            _3437 = true;
        }
        else
        {
            bool _3439 = _2768 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3441 = isnan(_2768);
            bool _3443 = _3439 || _3441;
            bool _3445 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3447 = _3443 || _3445;
            if (!_3447)
            {
                _3297 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3449 = _3297;
            _3299 = _3449;
            if (!_3447)
            {
                _3317 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3451 = _3317;
            _3319 = _3451;
            if (!_3447)
            {
                _3351 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3453 = _3351;
            _3353 = _3453;
            if (!_3447)
            {
                _3357 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3455 = _3357;
            _3359 = _3455;
            if (!_3447)
            {
                _3365 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3457 = _3365;
            _3367 = _3457;
            if (!_3447)
            {
                _3373 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3459 = _3373;
            bool _3461 = !_3447;
            _3375 = _3459;
            if (!_3461)
            {
                bool _3463 = _2768 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3465 = isnan(_2768);
                bool _3467 = _3463 || _3465;
                bool _3469 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3471 = _3467 || _3469;
                if (!_3471)
                {
                    float _3473 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3475 = _2768 + _3473;
                    float _3477 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3479 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3477;
                    float _3481 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3483 = _3481 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3485 = 1.0 / _3479;
                    float _3487 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3489 = _3487 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3491 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3493 = _3491 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3495 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3497 = _3495 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3499 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3501 = _3499 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3503 = _3475 * _3485;
                    float _3505 = precise::clamp(_3503, 0.0, 1.0);
                    float _3507 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3509 = _3507 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3511 = fma(_3505, _3483, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3513 = fma(_3505, _3509, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3515 = fma(_3505, _3489, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3517 = fma(_3505, _3493, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3519 = fma(_3505, _3497, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3521 = fma(_3505, _3501, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3319 = _3515;
                    _3367 = _3519;
                    _3299 = _3511;
                    _3359 = _3517;
                    _3353 = _3513;
                    _3375 = _3521;
                    _3437 = true;
                }
                else
                {
                    _3319 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3367 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3299 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3359 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3353 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3375 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3437 = false;
    float _3523 = _3319;
    float _3525 = _3367;
    float _3527 = _3299;
    float _3529 = _3359;
    float _3531 = _3353;
    float _3533 = _3375;
    float _3535 = fma(_3227, -0.5, 0.5);
    float _3537 = precise::clamp(_3535, 0.0, 1.0);
    float _3539 = -_3523;
    float _3541 = _3539 + _3525;
    float _3543 = _3363 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3545 = -_3527;
    float _3547 = _3545 + _3529;
    float _3549 = fma(_3537, _3541, _3523);
    out.m_96.x = 0.0;
    float _3551 = -_3531;
    float _3553 = _3551 + _3533;
    float _3555 = fma(_3537, _3547, _3527);
    float _3557 = _3549 * 0.586610972881317138671875;
    out.m_49.x = _3543;
    bool _3559 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3561 = fma(_3537, _3553, _3531);
    float _3563 = fma(_3555, 0.298911988735198974609375, _3557);
    bool _3565 = _2680 > 0.0;
    bool _3567 = isnan(_2680);
    bool _3569 = _3565 || _3567;
    bool _3571 = isnan(0.0);
    bool _3573 = _3569 || _3571;
    float _3575 = fma(_3561, 0.114477999508380889892578125, _3563);
    bool _3577 = _2742 <= 0.0;
    bool _3579 = !_3573;
    bool _3581 = _3577 || _3579;
    float _3583 = -_3575;
    float _3585 = _3549 + _3583;
    float _3587 = -_3575;
    float _3589 = _3555 + _3587;
    float _3591 = -_3575;
    float _3593 = _3561 + _3591;
    float _3595 = fma(_3585, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3575);
    float _3597 = fma(_3589, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3575);
    float _3599 = fma(_3593, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3575);
    bool _3601 = !_3559;
    if (!_3601)
    {
        float _3603 = -_2610;
        float _3605 = _3603 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3607 = -_2612;
        float _3609 = _3607 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3611 = -_2614;
        float _3613 = _3611 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3615 = _3605 * _3605;
        float _3617 = fma(_3609, _3609, _3615);
        float _3619 = fma(_3613, _3613, _3617);
        float _3621 = sqrt(_3619);
        float _3623 = rsqrt(_3619);
        float _3625 = -_3621;
        float _3627 = _3625 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3629 = _3627 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3631 = precise::clamp(_3629, 0.0, 1.0);
        float _3633 = _3609 * _3623;
        float _3635 = _3605 * _3623;
        float _3637 = abs(_3631);
        float _3639 = log2(_3637);
        float _3641 = _3613 * _3623;
        float _3643 = _3633 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3645 = _3227 * _3635;
        float _3647 = -_3635;
        float _3649 = -_3643;
        float _3651 = fma(_3647, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3649);
        float _3653 = fma(_3225, _3633, _3645);
        float _3655 = -_3641;
        float _3657 = fma(_3655, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3651);
        float _3659 = fma(_3285, _3641, _3653);
        float _3661 = precise::clamp(_3659, 0.0, 1.0);
        float _3663 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3665 = _3657 + _3663;
        float _3667 = _3639 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3669 = _3665 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3671 = precise::clamp(_3669, 0.0, 1.0);
        float _3673 = exp2(_3667);
        float _3675 = _3673 * _3671;
        float _3677 = _3661 * _3675;
        float _3679 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3681 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3683 = _3677 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3679;
        out.m_96.y = _3681;
        out.m_96.z = _3683;
    }
    out.m_98.x = _3597;
    out.m_98.y = _3595;
    out.m_98.z = _3599;
    if (!_3581)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3685 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3685;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

