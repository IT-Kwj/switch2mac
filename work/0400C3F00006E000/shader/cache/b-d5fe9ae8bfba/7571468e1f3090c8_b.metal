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
    bool _3403 = false;
    bool _347 = false;
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
        float _3707 = as_type<float>(_131);
        out.gl_Position.z = _3707;
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
        float _3780 = as_type<float>(_173);
        out.gl_Position.z = _3780;
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
    float _249 = in.m_62.x;
    float _251 = in.m_62.y;
    bool _253 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _255 = isnan(_243);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    bool _269 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _271 = isnan(_243);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -_263;
    float _283 = _281 + 1.0;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    float _289 = 1.0 / _267;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = _279 * _283;
    float _295 = -_279;
    float _297 = _295 + 1.0;
    float _299 = _247 * _289;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _301;
    float _305 = fma(_287, _299, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _307 = fma(_303, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _309 = _305 * _293;
    float _311 = _307 * _293;
    float _313 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _315 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].y, _311);
    float _317 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].x, _313);
    float _319 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].y, _315);
    float _321 = _317 * _249;
    float _323 = _319 * _251;
    bool _325 = !_291;
    float _327 = _299;
    float _345;
    if (!_325)
    {
        float _329 = in.m_60.x;
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _333 = _329 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _337 = _335 * _331;
        float _339 = floor(_337);
        float _341 = -_339;
        float _343 = _337 + _341;
        _345 = _343;
        _347 = true;
    }
    else
    {
        _345 = _167;
    }
    _347 = false;
    float _349 = _345;
    bool _351 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _353 = isnan(_349);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _367 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _369 = isnan(_349);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _385 = _349 + _383;
    float _387 = -_361;
    float _389 = _387 + 1.0;
    float _391 = 1.0 / _365;
    bool _393 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _395 = _377 * _389;
    float _397 = -_377;
    float _399 = _397 + 1.0;
    float _401 = _381 * _391;
    float _403 = fma(_401, _385, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _405 = _403 * _395;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _411 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[115].x, _405);
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _415 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _417 = _409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[116].x, _411);
    float _421 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = _419 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _415;
    out.m_64.y = _417;
    out.m_64.z = _421;
    out.m_64.w = _423;
    bool _425 = !_393;
    if (!_425)
    {
        float _427 = in.m_60.x;
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _431 = _427 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _169 = _441;
    }
    float _443 = _169;
    float _445 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _447 = int(_445);
    float _449 = in.m_60.x;
    float _451 = in.m_60.y;
    float _453 = _159 * _141;
    float _455 = _321 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _459 = _457 != 0;
    float _461 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _463 = int(_461);
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _467 = float(_447);
    float _469 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _471 = int(_469);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_459)
    {
        _327 = 1.0;
    }
    float _477 = _327;
    float _479 = _477;
    if (!_459)
    {
        _479 = 7.345489978790283203125;
    }
    float _481 = _479;
    float _483 = float(_463);
    float _485 = 1.0 / _467;
    float _487 = _481 * _449;
    float _489 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _491 = int(_489);
    float _493 = float(uint(_471));
    bool _495 = _471 == 0;
    float _497 = 1.0 / _483;
    float _499 = _485 * _141;
    float _501 = 1.0 / _493;
    float _503 = float(uint(_491));
    int _505 = ~_491;
    int _507 = _505 + 1;
    float _509 = trunc(_499);
    int _511 = int(_509);
    float _513 = _497 * _141;
    int _515 = ~_471;
    int _517 = _515 + 1;
    float _519 = 1.0 / _503;
    int _521 = as_type<int>(_501) + (-2);
    float _523 = trunc(_513);
    int _525 = int(_523);
    float _527 = float(uint(_511));
    float _529 = as_type<float>(_521) * _527;
    int _531 = as_type<int>(_519) + (-2);
    float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _535 = ~_491;
    int _537 = _535 + 1;
    float _539 = float(uint(_525));
    float _541 = trunc(_529);
    float _543 = precise::max(_541, 0.0);
    uint _546 = uint(_543);
    float _548 = as_type<float>(_531) * _539;
    float _550 = trunc(_548);
    float _552 = precise::max(_550, 0.0);
    uint _554 = uint(_552);
    float _556 = _533 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _558 = _517 * int(_546);
    int _560 = _558 + _511;
    float _562 = floor(_487);
    float _564 = float(uint(_560));
    int _566 = _537 * int(_554);
    int _568 = _566 + _525;
    float _570 = as_type<float>(_521) * _564;
    float _572 = _564;
    if (_459)
    {
        _572 = 1.0;
    }
    float _574 = _572;
    float _576 = float(uint(_568));
    float _578 = trunc(_570);
    float _580 = precise::max(_578, 0.0);
    uint _582 = uint(_580);
    float _584 = _574;
    float _586 = _576;
    if (!_459)
    {
        _584 = 1.2345600128173828125;
    }
    float _588 = _584;
    float _590 = -_562;
    float _592 = _487 + _590;
    float _594 = as_type<float>(_531) * _576;
    if (_459)
    {
        _586 = _449;
    }
    float _596 = _586;
    float _598 = _596;
    if (!_459)
    {
        _598 = _451;
    }
    float _600 = _598;
    float _602 = trunc(_594);
    float _604 = precise::max(_602, 0.0);
    uint _606 = uint(_604);
    float _608 = _588 * _600;
    int _610 = ~_471;
    int _612 = _610 + 1;
    int _614 = int(_546) + int(_582);
    float _616 = floor(_608);
    float _618 = float(_471);
    float _620 = float(_511);
    int _622 = _612 * _614;
    int _624 = _622 + _511;
    int _626 = int(_554) + int(_606);
    float _628 = _592 * _618;
    float _630 = _618 * _453;
    bool _632 = _620 >= _618;
    bool _634 = isnan(_620);
    bool _636 = _632 || _634;
    bool _638 = isnan(_618);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    bool _644 = uint(_624) >= uint(_471);
    int _646 = _507 * _626;
    int _648 = _646 + _525;
    float _650 = -_616;
    float _652 = _608 + _650;
    float _654 = trunc(_642);
    int _656 = int(_654);
    bool _658 = !_644;
    int _660 = _658 ? 0 : (-1);
    bool _662 = uint(_648) >= uint(_491);
    float _664 = in.m_60.z;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _668 = _666 != 0;
    int _670 = ~_614;
    int _672 = _670 + _660;
    int _674 = _672 + 1;
    float _676 = trunc(_628);
    int _678 = int(_676);
    bool _680 = !_668;
    int _682 = _680 ? 0 : 1;
    float _684 = float(_491);
    int _686 = abs(_682);
    int _688 = _471 * _674;
    int _690 = _688 + _511;
    float _692 = float(_525);
    float _694 = _684 * _453;
    int _696 = ~_656;
    int _698 = _696 + 1;
    int _700 = _698 + 1;
    bool _702 = !_662;
    int _704 = _702 ? 0 : (-1);
    bool _706 = !_495;
    int _708 = _706 ? _690 : (-1);
    float _710 = trunc(_694);
    int _712 = int(_710);
    bool _714 = _692 >= _684;
    bool _716 = isnan(_692);
    bool _718 = _714 || _716;
    bool _720 = isnan(_684);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = _652 * _684;
    bool _728 = _451 > 0.5;
    int _730 = _708 * _700;
    int _732 = ~_626;
    int _734 = _732 + _704;
    int _736 = _734 + 1;
    int _738 = _678 * _686;
    int _740 = _738 + _511;
    bool _742 = _664 > 0.5;
    float _744 = trunc(_726);
    int _746 = int(_744);
    float _748 = -_217;
    int _750 = _728 ? as_type<int>(_748) : as_type<int>(_217);
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _754 = _752 != 0;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _758 = _756 != 0;
    float _760 = -_207;
    int _762 = _742 ? as_type<int>(_760) : as_type<int>(_207);
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _766 = _764 != 0;
    float _768 = trunc(_724);
    int _770 = int(_768);
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _774 = _772 != 0;
    bool _776 = !_754;
    float _778 = _776 ? _217 : as_type<float>(_750);
    bool _780 = !_758;
    float _782 = _780 ? _207 : as_type<float>(_762);
    bool _784 = !_766;
    int _786 = _784 ? 0 : 1;
    float _788 = trunc(_630);
    int _790 = int(_788);
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _794 = _792 != 0;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _798 = _796 != 0;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _802 = _800 != 0;
    float _804 = _778 + 0.5;
    int _806 = abs(_786);
    int _808 = _471 + (-1);
    bool _810 = !_798;
    int _812 = _810 ? 0 : 1;
    bool _814 = !_774;
    int _816 = _814 ? 0 : 1;
    int _818 = _656 * _808;
    int _820 = _818 + _730;
    bool _822 = !_794;
    int _824 = _822 ? 0 : 1;
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _828 = _826 != 0;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _832 = _830 != 0;
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _836 = _834 != 0;
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _840 = _838 != 0;
    int _842 = abs(_812);
    int _844 = _746 * _806;
    int _846 = _844 + _525;
    int _848 = abs(_824);
    int _850 = _491 * _736;
    int _852 = _850 + _525;
    bool _854 = !_802;
    int _856 = _854 ? 0 : 1;
    bool _858 = !_832;
    int _860 = _858 ? 0 : 1;
    bool _862 = _491 == 0;
    int _864 = abs(_856);
    int _866 = _820 * _842;
    int _868 = ~_770;
    int _870 = _868 + 1;
    int _872 = _870 + 1;
    bool _874 = !_862;
    int _876 = _874 ? _852 : (-1);
    int _878 = _790 * _848;
    int _880 = _878 + _866;
    int _882 = _491 + (-1);
    int _884 = _876 * _872;
    int _886 = abs(_816);
    int _888 = _740 * _864;
    int _890 = _888 + _880;
    int _892 = abs(_860);
    int _894 = _770 * _882;
    int _896 = _894 + _884;
    bool _898 = !_828;
    int _900 = _898 ? 0 : 1;
    int _902 = _678 * _886;
    int _904 = _902 + _890;
    bool _906 = !_836;
    int _908 = _906 ? 0 : 1;
    int _910 = abs(_900);
    bool _912 = !_840;
    int _914 = _912 ? 0 : 1;
    int _916 = abs(_908);
    int _918 = _896 * _892;
    float _920 = float(uint(_904));
    int _922 = abs(_914);
    int _924 = _712 * _910;
    int _926 = _924 + _918;
    float _928 = as_type<float>(_521) * _920;
    int _930 = ~_471;
    int _932 = _930 + 1;
    int _934 = _846 * _916;
    int _936 = _934 + _926;
    bool _938 = _471 == 0;
    float _940 = trunc(_928);
    float _942 = precise::max(_940, 0.0);
    uint _944 = uint(_942);
    int _946 = _746 * _922;
    int _948 = _946 + _936;
    int _950 = ~_471;
    int _952 = _950 + 1;
    int _954 = ~_491;
    int _956 = _954 + 1;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _960 = float(uint(_948));
    float _962 = float(uint(_740));
    float _964 = as_type<float>(_531) * _960;
    float _966 = as_type<float>(_521) * _962;
    int _968 = _952 * int(_944);
    int _970 = _968 + _904;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _974 = _972 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _976 = trunc(_964);
    float _978 = precise::max(_976, 0.0);
    uint _980 = uint(_978);
    float _982 = float(uint(_970));
    float _984 = as_type<float>(_521) * _982;
    float _986 = trunc(_966);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    int _992 = _956 * int(_980);
    int _994 = _992 + _948;
    float _996 = trunc(_984);
    float _998 = precise::max(_996, 0.0);
    uint _1000 = uint(_998);
    float _1002 = _451 * 2.0;
    float _1004 = float(uint(_994));
    float _1006 = floor(_1002);
    float _1008 = as_type<float>(_531) * _1004;
    int _1010 = ~_491;
    int _1012 = _1010 + 1;
    int _1014 = int(_944) + int(_1000);
    float _1016 = trunc(_1008);
    float _1018 = precise::max(_1016, 0.0);
    uint _1020 = uint(_1018);
    int _1022 = _932 * _1014;
    int _1024 = _1022 + _904;
    float _1026 = 1.0 / _974;
    bool _1028 = uint(_1024) >= uint(_471);
    bool _1030 = !_1028;
    int _1032 = _1030 ? 0 : (-1);
    int _1034 = ~_1014;
    int _1036 = _1034 + _1032;
    int _1038 = _1036 + 1;
    float _1040 = _664 * 2.0;
    int _1042 = int(_980) + int(_1020);
    float _1044 = float(uint(_846));
    int _1046 = _471 * _1038;
    int _1048 = _1046 + _904;
    float _1050 = _451 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1052 = _1012 * _1042;
    int _1054 = _1052 + _948;
    float _1056 = floor(_1040);
    float _1058 = as_type<float>(_531) * _1044;
    bool _1060 = !_938;
    int _1062 = _1060 ? _1048 : (-1);
    float _1064 = fma(_1050, -2.0, _958);
    bool _1066 = uint(_1054) >= uint(_491);
    int _1068 = _1062 & 3;
    bool _1070 = _1068 != 0;
    int _1072 = _1062 & 3;
    bool _1074 = _1072 != 0;
    float _1076 = trunc(_1058);
    float _1078 = precise::max(_1076, 0.0);
    uint _1080 = uint(_1078);
    bool _1082 = !_1066;
    int _1084 = _1082 ? 0 : (-1);
    int _1086 = _1070 ? 0 : 1;
    bool _1088 = uint(_1072) >= 2u;
    bool _1090 = uint(_1072) > 1u;
    int _1092 = ~_1042;
    int _1094 = _1092 + _1084;
    int _1096 = _1094 + 1;
    int _1098 = _1088 ? 0 : 1;
    bool _1100 = _1072 != 3;
    int _1102 = _491 * _1096;
    int _1104 = _1102 + _948;
    int _1106 = ~_1086;
    int _1108 = _1106 + 1;
    int _1110 = _1108 + 1;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1114 = _1112 != 0;
    bool _1116 = !_862;
    int _1118 = _1116 ? _1104 : (-1);
    int _1120 = _1110;
    float _1122 = as_type<float>(_740);
    if (!_1090)
    {
        int _1124 = ~_1086;
        int _1126 = _1124 + 1;
        _1120 = _1126;
    }
    int _1128 = _1120;
    int _1130 = _1118 & 3;
    bool _1132 = _1130 != 0;
    int _1134 = ~_1098;
    int _1136 = _1134 + 1;
    int _1138 = _1136 + 1;
    int _1140 = _1138;
    if (_1100)
    {
        int _1142 = ~_1098;
        int _1144 = _1142 + 1;
        _1140 = _1144;
    }
    int _1146 = _1140;
    bool _1148 = uint(_1130) > 1u;
    float _1150 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1152 = log2(_1150);
    int _1154 = _1118 & 3;
    bool _1156 = _1154 != 0;
    if (_1114)
    {
        _475 = 0;
    }
    int _1158 = _475;
    int _1160 = _1156 ? 0 : 1;
    int _1162 = _1158;
    if (!_1114)
    {
        _1162 = 2;
    }
    int _1164 = _1162;
    int _1166 = ~_1160;
    int _1168 = _1166 + 1;
    int _1170 = _1168 + 1;
    bool _1172 = _451 > 0.5;
    int _1174 = _1170;
    if (!_1148)
    {
        int _1176 = ~_1160;
        int _1178 = _1176 + 1;
        _1174 = _1178;
    }
    int _1180 = _1174;
    float _1182 = _449 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1184 = _1152 * _141;
    bool _1186 = _1130 != 3;
    bool _1188 = _1164 != 2;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1192 = -_207;
    float _1194 = _1172 ? _1192 : _207;
    float _1196 = exp2(_1184);
    bool _1198 = uint(_1130) >= 2u;
    float _1200 = -_1190;
    float _1202 = fma(_1182, 2.0, _1200);
    float _1204 = _449 * 2.0;
    float _1206 = _1198 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1208 = floor(_1204);
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1212 = _1210 != 0;
    int _1214 = ~as_type<int>(_1206);
    int _1216 = _1214 + 1;
    int _1218 = _1216 + 1;
    int _1220 = _1218;
    float _1222 = _1206;
    float _1224 = _1194;
    if (_1186)
    {
        int _1226 = ~as_type<int>(_1206);
        int _1228 = _1226 + 1;
        _1220 = _1228;
    }
    int _1230 = _1220;
    if (_1188)
    {
        _1222 = _449;
    }
    float _1232 = _1222;
    float _1234 = _1232;
    if (!_1188)
    {
        _1234 = _664;
    }
    float _1236 = _1234;
    bool _1238 = !_1212;
    int _1240 = _1238 ? 0 : 1;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1244 = _1242 != 0;
    float _1246 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1248 = _449 > 0.5;
    float _1250 = -_1196;
    float _1252 = _1250 + 1.0;
    bool _1254 = !_1244;
    float _1256 = _1254 ? _207 : _1194;
    float _1258 = -_465;
    float _1260 = fma(_1246, 2.0, _1258);
    int _1262 = ~_471;
    int _1264 = _1262 + 1;
    float _1266 = -_217;
    int _1268 = _1248 ? as_type<int>(_1266) : as_type<int>(_217);
    float _1270 = -_141;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1260);
    bool _1274 = _1208 > 0.0;
    int _1276 = _1264 * int(_990);
    int _1278 = _1276 + _740;
    bool _1280 = _1208 >= 0.0;
    bool _1282 = isnan(_1208);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan(0.0);
    bool _1288 = _1284 || _1286;
    float _1290 = fma(_556, _804, _1272);
    int _1292 = ~_491;
    int _1294 = _1292 + 1;
    if (_1188)
    {
        _1224 = _451;
    }
    float _1296 = _1224;
    float _1298 = _1296;
    if (!_1188)
    {
        _1298 = _449;
    }
    float _1300 = _1298;
    int _1302 = _1294 * int(_1080);
    int _1304 = _1302 + _846;
    float _1306 = float(uint(_1278));
    bool _1308 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1310 = isnan(0.0);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1316 = _1312 || _1314;
    float _1318 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1320 = float(uint(_1304));
    float _1322 = as_type<float>(_521) * _1306;
    float _1324 = _1316 ? _1252 : 0.0;
    float _1326 = fma(_1318, -2.0, _473);
    bool _1328 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1330 = isnan(1.0);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1336 = _1332 || _1334;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1340 = 1.0 + _1338;
    float _1342 = as_type<float>(_531) * _1320;
    float _1344 = trunc(_1322);
    float _1346 = precise::max(_1344, 0.0);
    uint _1348 = uint(_1346);
    float _1350 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1326);
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1354 = 1.0 / _1340;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1360 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1352);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1364 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1356);
    float _1366 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1358);
    float _1368 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1360);
    float _1370 = trunc(_1342);
    float _1372 = precise::max(_1370, 0.0);
    uint _1374 = uint(_1372);
    float _1376 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1362);
    float _1378 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1064);
    float _1380 = -_141;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1202);
    float _1384 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1364);
    float _1386 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1366);
    float _1388 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1376);
    int _1390 = int(_990) + int(_1348);
    if (_1336)
    {
        float _1392 = _1324 * _1354;
        _163 = _1392;
    }
    float _1394 = _163;
    int _1396 = ~_471;
    int _1398 = _1396 + 1;
    float _1400 = in.m_46.x;
    float _1402 = in.m_46.y;
    float _1404 = in.m_46.z;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1408 = _1406 != 0;
    float _1410 = _1256 + (-0.5);
    int _1412 = ~_491;
    int _1414 = _1412 + 1;
    int _1416 = _1398 * _1390;
    int _1418 = _1416 + _740;
    int _1420 = _1288 ? 0 : 1;
    float _1422 = -_1368;
    float _1424 = _1422 + 1.0;
    bool _1426 = !_1408;
    float _1428 = _1426 ? _217 : as_type<float>(_1268);
    float _1430 = -_1410;
    float _1432 = -_1378;
    float _1434 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1432);
    bool _1436 = _1006 > 0.0;
    float _1438 = -_1384;
    float _1440 = _1438 + 1.0;
    bool _1442 = _1006 >= 0.0;
    bool _1444 = isnan(_1006);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan(0.0);
    bool _1450 = _1446 || _1448;
    float _1452 = -_1386;
    float _1454 = _1452 + 1.0;
    int _1456 = int(_1080) + int(_1374);
    int _1458 = ~_1420;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    int _1464 = _1462;
    if (!_1274)
    {
        int _1466 = ~_1420;
        int _1468 = _1466 + 1;
        _1464 = _1468;
    }
    int _1470 = _1464;
    bool _1472 = uint(_1418) >= uint(_471);
    int _1474 = _1414 * _1456;
    int _1476 = _1474 + _846;
    float _1478 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1480 = _1450 ? 0 : 1;
    float _1482 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1484 = !_1472;
    int _1486 = _1484 ? 0 : (-1);
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1488;
    bool _1492 = uint(_1476) >= uint(_491);
    float _1494 = fma(_1400, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1478);
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1498 = _1496 != 0;
    float _1500 = _1490 * _1026;
    bool _1502 = _443 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1504 = isnan(_443);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1510 = _1506 || _1508;
    float _1512 = float(_1510);
    float _1514 = fma(_1400, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1482);
    int _1516 = ~_1480;
    int _1518 = _1516 + 1;
    int _1520 = _1518 + 1;
    int _1522 = _1520;
    if (!_1436)
    {
        int _1524 = ~_1480;
        int _1526 = _1524 + 1;
        _1522 = _1526;
    }
    int _1528 = _1522;
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1532 = _443 + _1530;
    bool _1534 = !_1492;
    int _1536 = _1534 ? 0 : (-1);
    float _1538 = -_1512;
    float _1540 = _1538 + 1.0;
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1544 = _1542 != 0;
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1548 = _1546 != 0;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1552 = _1550 != 0;
    float _1554 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1556 = _443 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1558 = isnan(_443);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    bool _1568 = !_1074;
    int _1570 = _1568 ? 0 : 1;
    float _1572 = fma(_1400, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1554);
    float _1574 = fma(_1500, _1532, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1576 = _1566 * _1540;
    float _1578 = _1428 + 0.5;
    float _1580 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1572);
    bool _1582 = _1056 >= 0.0;
    bool _1584 = isnan(_1056);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan(0.0);
    bool _1590 = _1586 || _1588;
    float _1592 = _1574 * _1576;
    float _1594 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1382);
    float _1596 = -_1566;
    float _1598 = _1596 + 1.0;
    int _1600 = _1590 ? 0 : 1;
    bool _1602 = _1056 > 0.0;
    float _1604 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1592);
    float _1606 = -_1424;
    float _1608 = fma(_1428, _1606, _1594);
    float _1610 = fma(_1256, _1440, _1434);
    float _1612 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1494);
    float _1614 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1604);
    float _1616 = _1580 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1618 = _1062 >> 31;
    float _1620 = _451 + _449;
    int _1622 = _1118 >> 31;
    float _1624 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1514);
    float _1626 = _1612 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1630 = _1616 + _1628;
    int _1632 = _1618 & 3;
    float _1634 = _1620 + (-1.0);
    float _1636 = _1624 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1638 = _1622 & 3;
    float _1640 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1642 = _1626 + _1640;
    float _1644 = _1630 * _1630;
    int _1646 = _1062 + _1632;
    out.m_66.x = _1608;
    out.m_66.y = _1610;
    float _1648 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1652 = _1636 + _1650;
    float _1654 = fma(_1642, _1642, _1644);
    int _1656 = _1646 >> 2;
    float _1658 = _1630 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1660 = !_1132;
    int _1662 = _1660 ? 0 : 1;
    float _1664 = fma(_1652, _1652, _1654);
    int _1666 = _1656 << 4;
    int _1668 = _1666 + 368;
    float _1670 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1658);
    int _1672 = _1118 + _1638;
    float _1674 = _455 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1676 = _1072 != 3;
    float _1678 = rsqrt(_1664);
    int _1680 = _1672 >> 2;
    float _1682 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1670);
    int _1684 = ~_1600;
    int _1686 = _1684 + 1;
    int _1688 = _1686 + 1;
    float _1690 = _1614 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1692 = _1680 << 4;
    int _1694 = _1692 + 512;
    uint _1696 = uint(int(uint(_1668) >> uint(2)));
    uint _1698 = uint(int(uint(int(_1696)) >> uint(2)));
    int _1700 = int(_1696) & 3;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[int(_1698)][_1700];
    int _1704 = int(_1696) + 1;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    int _1708 = _1704 & 3;
    float _1710 = (*spvDescriptorSet0.vp_c9)._m0[int(_1706)][_1708];
    int _1712 = _1688;
    float _1714 = _1636;
    if (!_1602)
    {
        int _1716 = ~_1600;
        int _1718 = _1716 + 1;
        _1712 = _1718;
    }
    int _1720 = _1712;
    float _1722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1724 = !_1676;
    int _1726 = _1724 ? 0 : (-1);
    out.m_68.w = _1690;
    bool _1728 = _1130 != 3;
    int _1730 = abs(_1146);
    uint _1732 = uint(int(uint(_1694) >> uint(2)));
    uint _1734 = uint(int(uint(int(_1732)) >> uint(2)));
    int _1736 = int(_1732) & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = int(_1732) + 1;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    int _1744 = _1740 & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    bool _1748 = !_1728;
    int _1750 = _1748 ? 0 : (-1);
    bool _1752 = _1682 >= 0.0;
    float _1754 = _1674 * _1678;
    int _1756 = abs(_1230);
    int _1758 = abs(_1240);
    int _1760 = _1668 + 8;
    uint _1762 = uint(int(uint(_1760) >> uint(2)));
    uint _1764 = uint(int(uint(int(_1762)) >> uint(2)));
    int _1766 = int(_1762) & 3;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[int(_1764)][_1766];
    int _1770 = int(_1762) + 1;
    uint _1772 = uint(int(uint(_1770) >> uint(2)));
    int _1774 = _1770 & 3;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[int(_1772)][_1774];
    float _1778 = _1630 * _1754;
    float _1780 = _1642 * _1754;
    float _1782 = _1652 * _1754;
    float _1784 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1786 = -_1778;
    float _1788 = _1630 + _1786;
    float _1790 = -_1780;
    float _1792 = _1642 + _1790;
    float _1794 = -_1782;
    float _1796 = _1652 + _1794;
    int _1798 = _1694 + 8;
    uint _1800 = uint(int(uint(_1798) >> uint(2)));
    uint _1802 = uint(int(uint(int(_1800)) >> uint(2)));
    int _1804 = int(_1800) & 3;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[int(_1802)][_1804];
    int _1808 = int(_1800) + 1;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    int _1812 = _1808 & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    float _1816 = _1788 * _1788;
    float _1818 = _782 + (-0.5);
    bool _1820 = !_1544;
    int _1822 = _1820 ? 0 : 1;
    float _1824 = _1780;
    if (_1752)
    {
        out.m_49.x = 0.0;
    }
    float _1826 = fma(_1792, _1792, _1816);
    float _1828 = -_1784;
    float _1830 = -_1350;
    float _1832 = fma(_1828, _1818, _1830);
    int _1834 = abs(_1180);
    float _1836 = -_1454;
    float _1838 = fma(_778, _1836, _1290);
    float _1840 = fma(_1796, _1796, _1826);
    int _1842 = abs(_1128);
    float _1844 = _449 + (-0.5);
    int _1846 = abs(_1570);
    int _1848 = ~_1842;
    int _1850 = _1848 + 1;
    int _1852 = _1850 + 1;
    int _1854 = ~_1834;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    int _1860 = ~_1846;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    int _1866 = abs(_1662);
    int _1868 = ~_1390;
    int _1870 = _1868 + _1486;
    int _1872 = _1870 + 1;
    int _1874 = _1852 * as_type<int>(_1710);
    int _1876 = ~_1730;
    int _1878 = _1876 + 1;
    int _1880 = _1878 + 1;
    int _1882 = ~_1456;
    int _1884 = _1882 + _1536;
    int _1886 = _1884 + 1;
    int _1888 = _1864 * as_type<int>(_1702);
    int _1890 = _1888 + _1874;
    int _1892 = abs(_1726);
    int _1894 = _471 * _1872;
    int _1896 = _1894 + _740;
    int _1898 = abs(_1822);
    int _1900 = _1858 * as_type<int>(_1746);
    int _1902 = ~_1866;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    int _1908 = _491 * _1886;
    int _1910 = _1908 + _846;
    bool _1912 = _471 == 0;
    float _1914 = float(_1720);
    int _1916 = _1906 * as_type<int>(_1738);
    int _1918 = _1916 + _1900;
    int _1920 = _1880 * as_type<int>(_1768);
    int _1922 = _1920 + _1890;
    bool _1924 = !_1498;
    int _1926 = _1924 ? 0 : 1;
    int _1928 = abs(_1750);
    int _1930 = abs(_1926);
    int _1932 = ~_1892;
    int _1934 = _1932 + 1;
    int _1936 = _1934 + 1;
    int _1938 = ~_1756;
    int _1940 = _1938 + 1;
    int _1942 = _1940 + 1;
    int _1944 = ~_1928;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    int _1950 = _1936 * as_type<int>(_1776);
    int _1952 = _1950 + _1922;
    float _1954 = float(_1898);
    int _1956 = _1942 * as_type<int>(_1806);
    int _1958 = _1956 + _1918;
    float _1960 = in.m_70.x;
    float _1962 = in.m_70.y;
    float _1964 = in.m_70.z;
    int _1966 = _1948 * as_type<int>(_1814);
    int _1968 = _1966 + _1958;
    float _1970 = sqrt(_1840);
    int _1972 = ~_1758;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    float _1978 = -_1388;
    float _1980 = _1978 + 1.0;
    int _1982 = ~_1930;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    float _1988 = _1954 * _1914;
    bool _1990 = !_1912;
    int _1992 = _1990 ? _1896 : (-1);
    int _1994 = _1952 * _1976;
    bool _1996 = !_862;
    int _1998 = _1996 ? _1910 : (-1);
    int _2000 = _1968 * _1986;
    float _2002 = fma(_782, _1980, _1832);
    int _2004 = _1992 * _1758;
    int _2006 = _2004 + _1994;
    if (_1752)
    {
        _1122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2008 = _1122;
    float _2010 = _1988 * (-2.0);
    int _2012 = _1998 * _1930;
    int _2014 = _2012 + _2000;
    bool _2016 = !_1548;
    int _2018 = _2016 ? 0 : 1;
    out.m_72.x = _1838;
    out.m_72.y = _2002;
    float _2020 = _1678 * _1970;
    int _2022 = as_type<int>(_2008);
    if (_1752)
    {
        float _2024 = _2008 * 5.0;
        _2022 = as_type<int>(_2024);
    }
    int _2026 = _2022;
    float _2028 = float(_2006);
    float _2030 = fma(_2010, _1960, _1960);
    float _2032 = float(_2014);
    float _2034 = _455 * _2020;
    if (_1752)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6482 = as_type<float>(_2026);
        out.gl_Position.z = _6482;
    }
    float _2036 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2030);
    float _2038 = _451 + _664;
    float _2040 = float(_1470);
    out.m_74.x = _2028;
    out.m_74.y = _2032;
    float _2042 = fma(_1648, _2010, _1648);
    float _2044 = _2038 + (-1.0);
    out.m_76.x = _2034;
    bool _2046 = !_1552;
    int _2048 = _2046 ? 0 : 1;
    int _2050 = abs(_2018);
    if (_1752)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2052 = -_1778;
    float _2054 = _1616 + _2052;
    int _2056 = abs(_2048);
    float _2058 = -_1780;
    float _2060 = _1626 + _2058;
    float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2064 = _2054 + _2062;
    float _2066 = -_1782;
    float _2068 = _1636 + _2066;
    float _2070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2072 = _2060 + _2070;
    float _2074 = float(_2050);
    float _2076 = _2064 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2078 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2080 = _2068 + _2078;
    float _2082 = float(_1528);
    float _2084 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2086 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2076);
    float _2088 = _2074 * _2040;
    float _2090 = float(_2056);
    float _2092 = _451 + (-0.5);
    float _2094 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2086);
    float _2096 = _2088 * (-2.0);
    float _2098 = _664 + _449;
    float _2100 = _2090 * _2082;
    float _2102 = fma(_2042, _1394, _2036);
    bool _2104 = _2094 >= 0.0;
    float _2106 = fma(_2096, _1962, _1962);
    float _2108 = fma(_2084, _2096, _2084);
    float _2110 = _2098 + (-1.0);
    float _2112 = fma(_2092, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2106);
    float _2114 = _2100 * (-2.0);
    float _2116 = _2102 * 0.15915493667125701904296875;
    float _2118 = fma(_2110, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2120 = fma(_2108, _1394, _2112);
    float _2122 = fma(_2114, _1964, _1964);
    float _2124 = _664 + (-0.5);
    float _2126 = _2116 * 6.283185482025146484375;
    float _2128 = sin(_2126);
    float _2130 = _2120 * 0.15915493667125701904296875;
    float _2132 = _2084;
    float _2134 = _2072;
    float _2136 = _2080;
    if (_2104)
    {
        _2132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2138 = _2132;
    float _2140 = fma(_2118, _2114, _2118);
    float _2142 = fma(_2124, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2122);
    int _2144 = as_type<int>(_2138);
    if (_2104)
    {
        out.m_49.x = 0.0;
    }
    if (_2104)
    {
        float _2146 = _2138 * 5.0;
        _2144 = as_type<int>(_2146);
    }
    int _2148 = _2144;
    float _2150 = _2116 * 6.283185482025146484375;
    float _2152 = cos(_2150);
    float _2154 = fma(_2140, _1394, _2142);
    if (_2104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6685 = as_type<float>(_2148);
        out.gl_Position.z = _6685;
    }
    float _2156 = _2154 * 0.15915493667125701904296875;
    float _2158 = _2130 * 6.283185482025146484375;
    float _2160 = sin(_2158);
    float _2162 = _2130 * 6.283185482025146484375;
    float _2164 = cos(_2162);
    if (_2104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2166 = _2156 * 6.283185482025146484375;
    float _2168 = cos(_2166);
    float _2170 = _323 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2174 = _2128 * _2160;
    float _2176 = _2152 * _2164;
    float _2178 = _2170 * _2020;
    float _2180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2182 = _2128 * _2164;
    float _2184 = _2156 * 6.283185482025146484375;
    float _2186 = sin(_2184);
    float _2188 = _2178 * _2172;
    float _2190 = _2152 * _2160;
    float _2192 = _2020 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2194 = _2192 * 0.5;
    float _2196 = _2152 * _2168;
    float _2198 = _2164 * _2168;
    float _2200 = _2128 * _2168;
    float _2202 = _2160 * _2168;
    float _2204 = _2034 * _2180;
    float _2206 = _2196 * _2188;
    float _2208 = fma(_2186, _2176, _2174);
    float _2210 = -_2182;
    float _2212 = fma(_2186, _2190, _2210);
    float _2214 = -_2188;
    float _2216 = _2186 * _2214;
    float _2218 = -_2190;
    float _2220 = fma(_2186, _2182, _2218);
    float _2222 = fma(_2208, _2204, _2206);
    float _2224 = _2200 * _2188;
    float _2226 = fma(_2198, _2204, _2216);
    float _2228 = fma(_2212, _2194, _2222);
    float _2230 = fma(_2186, _2174, _2176);
    float _2232 = fma(_2220, _2204, _2224);
    float _2234 = fma(_2202, _2194, _2226);
    float _2236 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2238 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2240 = fma(_2230, _2194, _2232);
    float _2242 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2236);
    float _2244 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2238);
    float _2246 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2242);
    float _2248 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2244);
    float _2250 = _2246 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2252 = _2248 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2254 = _1636 + _2250;
    float _2256 = _1626 + _2252;
    float _2258 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2260 = _2054 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2264 = _2254 + _2262;
    float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2268 = _2256 + _2266;
    float _2270 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2258);
    float _2272 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2260);
    float _2274 = _2264 * _2264;
    float _2276 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2270);
    float _2278 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2272);
    float _2280 = fma(_2268, _2268, _2274);
    float _2282 = _2276 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2284 = sqrt(_2280);
    float _2286 = _1616 + _2282;
    bool _2288 = _2284 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2290 = _2276;
    float _2292 = _2282;
    float _2294 = _2260;
    float _2296 = _2204;
    if (!_2288)
    {
        _2290 = _2256;
    }
    float _2298 = _2290;
    float _2300 = _2298;
    if (!_2288)
    {
        _2292 = _2254;
    }
    float _2302 = _2292;
    float _2304 = _2302;
    if (!_2288)
    {
        _2294 = _2286;
    }
    float _2306 = _2294;
    bool _2308 = !_2288;
    float _2310 = _2306;
    if (!_2308)
    {
        float _2312 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2316 = _2284 + _2314;
        float _2318 = rsqrt(_2280);
        float _2320 = _2316 * _2312;
        float _2322 = _2286 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2324 = _2320 * 0.15915493667125701904296875;
        float _2326 = _2324 * 6.283185482025146484375;
        float _2328 = cos(_2326);
        float _2330 = _2324 * 6.283185482025146484375;
        float _2332 = sin(_2330);
        float _2334 = _2328 + (-1.0);
        float _2336 = fma(_2332, _2322, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2338 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2340 = _2318 * _2336;
        float _2342 = fma(_2286, _2328, _2338);
        float _2344 = fma(_2268, _2340, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2346 = fma(_2264, _2340, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2310 = _2342;
        _2300 = _2344;
        _2304 = _2346;
        _2296 = _2324;
    }
    float _2348 = _2310;
    float _2350 = _2300;
    float _2352 = _2304;
    float _2354 = _2296;
    float _2356 = -_1616;
    float _2358 = _2356 + _2348;
    float _2360 = -_1626;
    float _2362 = _2360 + _2350;
    float _2364 = -_1636;
    float _2366 = _2364 + _2352;
    float _2368 = _2278 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2370 = _2358 * _2358;
    float _2372 = _2054 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2374 = 1.0 / _2368;
    float _2376 = fma(_2362, _2362, _2370);
    float _2378 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2372);
    bool _2380 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2382 = isnan(0.5);
    bool _2384 = _2380 || _2382;
    bool _2386 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2388 = _2384 || _2386;
    float _2390 = fma(_2366, _2366, _2376);
    float _2392 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2378);
    bool _2394 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2396 = isnan(0.5);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2402 = _2398 || _2400;
    float _2404 = sqrt(_2390);
    float _2406 = _2392 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2408 = _2406 + _2368;
    float _2410 = _2408 * _2374;
    float _2412 = _2410 * 0.5;
    bool _2414 = _2404 > 0.0;
    float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2418 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2416);
    float _2420 = 1.0 / _2418;
    float _2422 = _2412;
    float _2424 = _2374;
    float _2426 = _2354;
    if (!_2414)
    {
        _2422 = _2350;
    }
    float _2428 = _2422;
    float _2430 = _2428;
    if (!_2414)
    {
        _2424 = _2348;
    }
    float _2432 = _2424;
    float _2434 = _2432;
    if (!_2414)
    {
        _2426 = _2352;
    }
    float _2436 = _2426;
    bool _2438 = !_2414;
    float _2440 = _2436;
    float _2442 = _2436;
    if (!_2438)
    {
        float _2444 = _211 * _211;
        float _2446 = fma(_209, _209, _2444);
        float _2448 = rsqrt(_2390);
        float _2450 = fma(_213, _213, _2446);
        float _2452 = sqrt(_2450);
        float _2454 = _2362 * _2448;
        float _2456 = _2358 * _2448;
        float _2458 = _2366 * _2448;
        bool _2460 = _2452 > 0.0;
        float _2462 = _2448;
        float _2464 = _2452;
        if (!_2460)
        {
            _2462 = _2350;
        }
        float _2466 = _2462;
        _2430 = _2466;
        if (!_2460)
        {
            _2464 = _2348;
        }
        float _2468 = _2464;
        _2434 = _2468;
        if (!_2460)
        {
            _2440 = _2352;
        }
        float _2470 = _2440;
        bool _2472 = !_2460;
        _2442 = _2470;
        if (!_2472)
        {
            float _2474 = rsqrt(_2450);
            float _2476 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2478 = _211 * _2474;
            float _2480 = _209 * _2474;
            float _2482 = _2456 * _2478;
            float _2484 = _213 * _2474;
            float _2486 = fma(_2454, _2480, _2482);
            float _2488 = _2476 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2490 = fma(_2458, _2484, _2486);
            float _2492 = _2490 * _2488;
            float _2494 = fma(_209, _2492, _2350);
            float _2496 = fma(_211, _2492, _2348);
            float _2498 = fma(_213, _2492, _2352);
            _2430 = _2494;
            _2434 = _2496;
            _2442 = _2498;
        }
    }
    float _2500 = _2430;
    float _2502 = _2434;
    float _2504 = _2442;
    float _2506 = -_1780;
    float _2508 = _2506 + _2500;
    float _2510 = -_1778;
    float _2512 = _2510 + _2502;
    float _2514 = -_1782;
    float _2516 = _2514 + _2504;
    float _2518 = _2512;
    float _2520 = _2508;
    float _2522 = _2516;
    if (_2402)
    {
        _221 = 1.0;
    }
    float _2524 = _221;
    float _2526 = _2524;
    if (!_2388)
    {
        float _2528 = _2064 * _2064;
        float _2530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2532 = -_1636;
        float _2534 = _2532 + _2504;
        float _2536 = -_1616;
        float _2538 = _2536 + _2502;
        float _2540 = fma(_2072, _2072, _2528);
        float _2542 = fma(_2080, _2080, _2540);
        float _2544 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2546 = sqrt(_2542);
        float _2548 = 1.0 / _2020;
        float _2550 = precise::min(_2546, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2552 = _2550 * _2530;
        float _2554 = _2544 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2556 = -_1626;
        float _2558 = _2556 + _2500;
        float _2560 = _2552 * _2548;
        float _2562 = _2554 * _2560;
        float _2564 = _2534 * _2560;
        float _2566 = fma(_2538, _2562, _2054);
        float _2568 = fma(_2558, _2562, _2060);
        float _2570 = fma(_2554, _2564, _2068);
        _2518 = _2566;
        _2520 = _2568;
        _2522 = _2570;
        _2134 = _2546;
        _1714 = _2564;
    }
    float _2572 = _2518;
    float _2574 = _2520;
    float _2576 = _2522;
    float _2578 = _2134;
    float _2580 = _1714;
    float _2582 = _2578;
    float _2584 = _2580;
    if (_2402)
    {
        _1824 = 1.0;
    }
    float _2586 = _1824;
    float _2588 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2590 = _2420 * _2588;
    float _2592 = _2586;
    if (!_2402)
    {
        float _2594 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2596 = _2594 * 0.15915493667125701904296875;
        float _2598 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2602 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2600;
        float _2604 = _2596 * 6.283185482025146484375;
        float _2606 = cos(_2604);
        float _2608 = _2598 * 0.15915493667125701904296875;
        float _2610 = _2596 * 6.283185482025146484375;
        float _2612 = sin(_2610);
        float _2614 = 1.0 / _2606;
        float _2616 = _2608 * 6.283185482025146484375;
        float _2618 = cos(_2616);
        float _2620 = _2612 * _2614;
        float _2622 = _2608 * 6.283185482025146484375;
        float _2624 = sin(_2622);
        float _2626 = _2618 * _2620;
        float _2628 = 1.0 / _2602;
        float _2630 = 1.0 / _2626;
        float _2632 = _2624 * _2630;
        float _2634 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2636 = fma(_2590, _2632, _2634);
        float _2638 = _2636 * _2628;
        float _2640 = precise::clamp(_2638, 0.0, 1.0);
        _2136 = _2608;
        _2582 = _2620;
        _2526 = _2640;
    }
    float _2642 = _2136;
    float _2644 = _2582;
    float _2646 = _2526;
    float _2648 = _2642;
    float _2650 = _2644;
    if (!_2402)
    {
        float _2652 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2654 = _2652 * 0.15915493667125701904296875;
        float _2656 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2658 = _2654 * 6.283185482025146484375;
        float _2660 = cos(_2658);
        float _2662 = _2656 * 0.15915493667125701904296875;
        float _2664 = _2654 * 6.283185482025146484375;
        float _2666 = sin(_2664);
        float _2668 = 1.0 / _2660;
        float _2670 = _2662 * 6.283185482025146484375;
        float _2672 = cos(_2670);
        float _2674 = _2666 * _2668;
        float _2676 = _2662 * 6.283185482025146484375;
        float _2678 = sin(_2676);
        float _2680 = _2672 * _2674;
        float _2682 = 1.0 / _2680;
        float _2684 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2686 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2684;
        float _2688 = 1.0 / _2686;
        float _2690 = _2678 * _2682;
        float _2692 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2694 = fma(_2590, _2690, _2692);
        float _2696 = _2694 * _2688;
        float _2698 = precise::clamp(_2696, 0.0, 1.0);
        float _2700 = -_2698;
        float _2702 = _2700 + 1.0;
        _2648 = _2668;
        _2650 = _2680;
        _2592 = _2702;
    }
    float _2704 = _2648;
    float _2706 = _2650;
    float _2708 = _2592;
    float _2710 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2712 = _2572 + _2710;
    float _2714 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2716 = _2574 + _2714;
    float _2718 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2720 = _2576 + _2718;
    float _2722 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2724 = _2712 * _2712;
    float _2726 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2722);
    float _2728 = fma(_2716, _2716, _2724);
    float _2730 = fma(_2720, _2720, _2728);
    float _2732 = rsqrt(_2730);
    float _2734 = sqrt(_2730);
    float _2736 = _2732 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2738 = _2716 * _2736;
    float _2740 = _2720 * _2736;
    float _2742 = _2738 * _2738;
    float _2744 = _2740 * _2740;
    float _2746 = _2742 + _2744;
    float _2748 = sqrt(_2746);
    bool _2750 = _2748 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2754 = _2748 + _2752;
    float _2756 = _2704;
    float _2758 = _2746;
    float _2760 = _2754;
    float _2762 = _2706;
    float _2764 = _2712;
    if (_2750)
    {
        float _2766 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2756 = _2766;
    }
    float _2768 = _2756;
    if (_2750)
    {
        float _2770 = rsqrt(_2746);
        _2758 = _2770;
    }
    float _2772 = _2758;
    float _2774 = _2772;
    if (_2750)
    {
        float _2776 = _2754 * _2768;
        _2760 = _2776;
    }
    float _2778 = _2760;
    if (_2750)
    {
        float _2780 = _2778 * 0.15915493667125701904296875;
        _2762 = _2780;
    }
    float _2782 = _2762;
    float _2784 = _2720;
    float _2786 = _2782;
    if (_2750)
    {
        float _2788 = _2782 * 6.283185482025146484375;
        float _2790 = sin(_2788);
        _2784 = _2790;
    }
    float _2792 = _2784;
    float _2794 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2796 = precise::max(0.0, _2794);
    float _2798 = _2768;
    if (_2750)
    {
        float _2800 = _2782 * 6.283185482025146484375;
        float _2802 = cos(_2800);
        _2798 = _2802;
    }
    float _2804 = _2798;
    float _2806 = -_2736;
    float _2808 = -_2796;
    float _2810 = fma(_2712, _2806, _2808);
    float _2812 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2750)
    {
        float _2814 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2764 = _2814;
    }
    float _2816 = _2764;
    float _2818 = _2816;
    if (!_2750)
    {
        _2786 = _2738;
    }
    float _2820 = _2786;
    float _2822 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2824 = _2792;
    float _2826 = _2820;
    if (_2750)
    {
        float _2828 = fma(_2792, _2816, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2824 = _2828;
    }
    float _2830 = _2824;
    float _2832 = _2830;
    if (!_2750)
    {
        _2818 = _2810;
    }
    float _2834 = _2818;
    float _2836 = _2834;
    float _2838 = _2804;
    if (_2750)
    {
        float _2840 = _2804 + (-1.0);
        _2812 = _2840;
    }
    float _2842 = _2812;
    float _2844 = _2842;
    if (_2750)
    {
        float _2846 = _2772 * _2830;
        _2584 = _2846;
    }
    float _2848 = _2584;
    if (!_2750)
    {
        _2774 = _2740;
    }
    float _2850 = _2774;
    float _2852 = _2850;
    if (_2750)
    {
        float _2854 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2844 = _2854;
    }
    float _2856 = _2844;
    if (_2750)
    {
        float _2858 = _2738 * _2848;
        _2826 = _2858;
    }
    float _2860 = _2826;
    if (!_2750)
    {
        _2832 = _2742;
    }
    float _2862 = _2832;
    float _2864 = _2862;
    if (_2750)
    {
        float _2866 = _2740 * _2848;
        _2852 = _2866;
    }
    float _2868 = _2852;
    if (_2750)
    {
        float _2870 = fma(_2810, _2804, _2856);
        _2836 = _2870;
    }
    float _2872 = _2836;
    if (_2750)
    {
        float _2874 = _2860 * _2860;
        _2864 = _2874;
    }
    float _2876 = _2864;
    if (!_2750)
    {
        _2838 = _2744;
    }
    float _2878 = _2838;
    float _2880 = _2878;
    if (_2750)
    {
        float _2882 = _2868 * _2868;
        _2880 = _2882;
    }
    float _2884 = _2880;
    float _2886 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2888 = fma(_2872, _2872, _2876);
    float _2890 = floor(_2822);
    float _2892 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2886);
    float _2894 = _2888 + _2884;
    float _2896 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2898 = fma(_2734, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2896);
    float _2900 = precise::clamp(_2898, 0.0, 1.0);
    float _2902 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2892);
    float _2904 = rsqrt(_2894);
    float _2906 = -_2900;
    float _2908 = _2906 + 1.0;
    float _2910 = _2902 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2912 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2914 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2916 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2918 = abs(_2908);
    float _2920 = log2(_2918);
    float _2922 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2924 = _2910 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2926 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2914);
    float _2928 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2922);
    float _2930 = -_2924;
    float _2932 = fma(_2930, _2916, 1.0);
    float _2934 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2926);
    float _2936 = _2904 * _2860;
    float _2938 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2928);
    float _2940 = _2904 * _2872;
    float _2942 = _2904 * _2868;
    float _2944 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2946 = _2938 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2948 = _2934 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2950 = floor(_2912);
    float _2952 = -_2944;
    float _2954 = fma(_2940, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2952);
    float _2956 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2958 = _2920 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2960 = -_2942;
    float _2962 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2954);
    float _2964 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2726);
    float _2966 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2956);
    float _2968 = exp2(_2958);
    float _2970 = fma(_2962, -0.5, 0.5);
    float _2972 = _2964 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2974 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2966);
    float _2976 = fma(_2962, 0.5, 0.5);
    float _2978 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2980 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2974);
    float _2982 = log2(_2932);
    float _2984 = -_2950;
    float _2986 = _2912 + _2984;
    float _2988 = fma(_2976, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2990 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2978);
    float _2992 = fma(_2976, _2988, -0.212114393711090087890625);
    float _2994 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2990);
    float _2996 = 1.0 / _2980;
    float _2998 = -_2890;
    float _3000 = _2822 + _2998;
    float _3002 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3004 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3002);
    float _3006 = _2940 + 1.0;
    float _3008 = sqrt(_2970);
    float _3010 = _2982 * 0.693147182464599609375;
    float _3012 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3004);
    float _3014 = -_2940;
    float _3016 = fma(_2968, _3006, _3014);
    float _3018 = fma(_2976, _2992, 1.570728778839111328125);
    float2 _8038 = float2(_3000, _2986);
    float _3020 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8038, float2(0.0), isnan(_8038)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8038, float2(0.0), isnan(_8038)), level(0.0)).x;
    float _3022 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3012);
    float _3024 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2994);
    float _3026 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3028 = fma(_3016, 0.5, 0.5);
    float _3030 = _3022 * _2996;
    float _3032 = _3024 * _2996;
    float _3034 = fma(_3030, 0.5, 0.5);
    float _3036 = fma(_3032, -0.5, 0.5);
    float _3038 = _3008 * 0.636619746685028076171875;
    float _3040 = -_3018;
    float _3042 = fma(_3038, _3040, 1.0);
    float3 _8083 = float3(_3034, _3036, _3026);
    float _3044 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8083, float3(0.0), isnan(_8083)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8083, float3(0.0), isnan(_8083)), level(0.0)).x;
    float3 _8094 = float3(_3034, _3036, _3026);
    float4 _3047 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8094, float3(0.0), isnan(_8094)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8094, float3(0.0), isnan(_8094)), level(0.0)).xyzw;
    float _3049 = _3047.x;
    float _3051 = _3047.y;
    float _3053 = _3047.z;
    float _3055 = _3047.w;
    float2 _8110 = float2(_3042, _3028);
    float3 _3059 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8110, float2(0.0), isnan(_8110)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8110, float2(0.0), isnan(_8110)), level(0.0)).xyz;
    float _3061 = _3059.x;
    float _3063 = _3059.y;
    float _3065 = _3059.z;
    float _3067 = abs(_2590);
    float _3069 = log2(_3067);
    float _3071 = _2208 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3073 = _2208 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3075 = _2208 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3077 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3079 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3071);
    float _3081 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3073);
    float _3083 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3075);
    float _3085 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3087 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3089 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3091 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3093 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3095 = -_2186;
    float _3097 = fma(_3095, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3077);
    float _3099 = -_2186;
    float _3101 = fma(_3099, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3087);
    float _3103 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3105 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3107 = -_2186;
    float _3109 = fma(_3107, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3085);
    float _3111 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3089);
    float _3113 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3091);
    float _3115 = exp2(_3105);
    float _3117 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3093);
    float _3119 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3109);
    float _3121 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3111);
    float _3123 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3113);
    float _3125 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3117);
    float _3127 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3079);
    float _3129 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3097);
    float _3131 = fma(_3103, _3103, 1.0);
    float _3133 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3135 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3101);
    float _3137 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3139 = rsqrt(_3131);
    float _3141 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3081);
    float _3143 = _2920 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3145 = fma(_3115, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3147 = precise::clamp(_3145, 0.0, 1.0);
    float _3149 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3083);
    float _3151 = _3103 * _3129;
    float _3153 = _3147 * _3147;
    float _3155 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3137);
    float _3157 = fma(_3147, -2.0, 3.0);
    float _3159 = _3103 * _3119;
    float _3161 = exp2(_3143);
    float _3163 = fma(_3133, _3141, _3151);
    float _3165 = _3153 * _3157;
    float _3167 = fma(_3133, _3127, _3159);
    float _3169 = _3103 * _3135;
    float _3171 = _3103 * _3139;
    float _3173 = -_3165;
    float _3175 = _3173 + 1.0;
    out.m_78.x = _3127;
    out.m_78.y = _3141;
    out.m_78.z = _3149;
    float _3177 = fma(_3133, _3149, _3169);
    float _3179 = -_3121;
    float _3181 = _3171 * _3179;
    float _3183 = fma(_3175, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3165);
    float _3185 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3155);
    float _3187 = in.m_80.x;
    float _3189 = fma(_3139, _3119, _3181);
    float _3191 = _3121 + _3167;
    float _3193 = _3123 + _3163;
    float _3195 = -_3161;
    float _3197 = _3195 + 1.0;
    out.m_82.x = _2574;
    out.m_82.y = _2572;
    out.m_82.z = _2576;
    bool _3199 = _2734 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3201 = isnan(_2734);
    bool _3203 = _3199 || _3201;
    bool _3205 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3207 = _3203 || _3205;
    float _3209 = -_3123;
    float _3211 = _3171 * _3209;
    float _3213 = -_3125;
    float _3215 = _3171 * _3213;
    float _3217 = _3197 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3219 = fma(_3139, _3129, _3211);
    bool _3221 = _2590 <= 8000.0;
    bool _3223 = isnan(_2590);
    bool _3225 = _3221 || _3223;
    bool _3227 = isnan(8000.0);
    bool _3229 = _3225 || _3227;
    float _3231 = float(_3229);
    float _3233 = fma(_3139, _3135, _3215);
    float _3235 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3185);
    float _3237 = _2980 * 0.5;
    float _3239 = _3022 + _2980;
    float _3241 = _3231 * _3183;
    out.m_84.x = _3189;
    out.m_84.y = _3219;
    out.m_84.z = _3233;
    float _3243 = _3235 + _2980;
    float _3245 = fma(_3024, -0.5, _3237);
    float _3247 = _3241 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3022;
    out.gl_Position.y = _3024;
    out.gl_Position.z = _3235;
    out.gl_Position.w = _2980;
    float _3249 = _3243 * 0.5;
    float _3251 = _3125 + _3177;
    float _3253 = _3239 * 0.5;
    out.m_86.x = _3191;
    out.m_86.y = _3193;
    out.m_86.z = _3251;
    float _3255 = _3123;
    float _3257 = _3233;
    float _3259 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3207)
    {
        _3255 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3261 = _3255;
    float _3263 = _3261;
    float _3265 = _3261;
    if (!_3207)
    {
        _3257 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3267 = _3257;
    out.m_88.z = _3249;
    out.m_88.w = _2980;
    out.m_90.x = _3253;
    out.m_90.y = _3245;
    out.m_90.z = _3249;
    out.m_90.w = _2980;
    float _3269 = -_3020;
    float _3271 = _3269 + 1.0;
    float _3273 = _3271 * _3247;
    float _3275 = precise::clamp(_3273, 0.0, 1.0);
    float _3277 = -_3275;
    float _3279 = fma(_3277, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3281 = _3051;
    float _3283 = _3267;
    float _3285 = _3267;
    if (!_3207)
    {
        _3259 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3287 = _3259;
    float _3289 = _3279 * _3187;
    float _3291 = _3289 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3293 = _3217 * _3044;
    float _3295 = -_3217;
    float _3297 = _3295 + 1.0;
    float _3299 = _3055 * _3293;
    float _3301 = _3065 * _3293;
    float _3303 = _3055 * _3297;
    out.m_92.x = _3291;
    float _3305 = fma(_3061, _3299, _3049);
    float _3307 = fma(_3063, _3299, _3051);
    float _3309 = fma(_3055, _3301, _3053);
    float _3311 = _2646 * _2708;
    float _3313 = _3293;
    float _3315 = _3311;
    float _3317 = _3287;
    float _3319 = _3287;
    if (!_3207)
    {
        _3313 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3321 = _3313;
    float _3323 = _3321;
    float _3325 = _3321;
    if (!_3207)
    {
        _3281 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3327 = _3281;
    out.m_94.x = _3305;
    out.m_94.y = _3307;
    out.m_94.z = _3309;
    out.m_94.w = _3303;
    float _3329 = _3311 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3331 = _3327;
    float _3333 = _3327;
    if (!_3207)
    {
        _3315 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3335 = _3315;
    bool _3337 = !_3207;
    float _3339 = _3335;
    float _3341 = _3335;
    if (!_3337)
    {
        bool _3343 = _2734 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3345 = isnan(_2734);
        bool _3347 = _3343 || _3345;
        bool _3349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3351 = _3347 || _3349;
        if (!_3351)
        {
            float _3353 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3355 = _2734 + _3353;
            float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3359 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3357;
            float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3365 = 1.0 / _3359;
            float _3367 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3369 = _3367 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3371 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3373 = _3371 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3375 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3377 = _3375 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3379 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3381 = _3379 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3383 = _3355 * _3365;
            float _3385 = precise::clamp(_3383, 0.0, 1.0);
            float _3387 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3389 = _3387 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3391 = fma(_3385, _3363, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3393 = fma(_3385, _3389, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3395 = fma(_3385, _3369, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3397 = fma(_3385, _3373, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3399 = fma(_3385, _3377, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3401 = fma(_3385, _3381, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3285 = _3395;
            _3333 = _3399;
            _3265 = _3391;
            _3325 = _3397;
            _3319 = _3393;
            _3341 = _3401;
            _3403 = true;
        }
        else
        {
            bool _3405 = _2734 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3407 = isnan(_2734);
            bool _3409 = _3405 || _3407;
            bool _3411 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3413 = _3409 || _3411;
            if (!_3413)
            {
                _3263 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3415 = _3263;
            _3265 = _3415;
            if (!_3413)
            {
                _3283 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3417 = _3283;
            _3285 = _3417;
            if (!_3413)
            {
                _3317 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3419 = _3317;
            _3319 = _3419;
            if (!_3413)
            {
                _3323 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3421 = _3323;
            _3325 = _3421;
            if (!_3413)
            {
                _3331 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3423 = _3331;
            _3333 = _3423;
            if (!_3413)
            {
                _3339 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3425 = _3339;
            bool _3427 = !_3413;
            _3341 = _3425;
            if (!_3427)
            {
                bool _3429 = _2734 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3431 = isnan(_2734);
                bool _3433 = _3429 || _3431;
                bool _3435 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3437 = _3433 || _3435;
                if (!_3437)
                {
                    float _3439 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3441 = _2734 + _3439;
                    float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3445 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3443;
                    float _3447 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3449 = _3447 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3451 = 1.0 / _3445;
                    float _3453 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3455 = _3453 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3457 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3459 = _3457 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3461 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3463 = _3461 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3465 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3467 = _3465 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3469 = _3441 * _3451;
                    float _3471 = precise::clamp(_3469, 0.0, 1.0);
                    float _3473 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3475 = _3473 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3477 = fma(_3471, _3449, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3479 = fma(_3471, _3475, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3481 = fma(_3471, _3455, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3483 = fma(_3471, _3459, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3485 = fma(_3471, _3463, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3487 = fma(_3471, _3467, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3285 = _3481;
                    _3333 = _3485;
                    _3265 = _3477;
                    _3325 = _3483;
                    _3319 = _3479;
                    _3341 = _3487;
                    _3403 = true;
                }
                else
                {
                    _3285 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3333 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3265 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3325 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3319 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3341 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3403 = false;
    float _3489 = _3285;
    float _3491 = _3333;
    float _3493 = _3265;
    float _3495 = _3325;
    float _3497 = _3319;
    float _3499 = _3341;
    float _3501 = fma(_3193, -0.5, 0.5);
    float _3503 = precise::clamp(_3501, 0.0, 1.0);
    float _3505 = -_3489;
    float _3507 = _3505 + _3491;
    float _3509 = _3329 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3511 = -_3493;
    float _3513 = _3511 + _3495;
    float _3515 = fma(_3503, _3507, _3489);
    out.m_96.x = 0.0;
    float _3517 = -_3497;
    float _3519 = _3517 + _3499;
    float _3521 = fma(_3503, _3513, _3493);
    float _3523 = _3515 * 0.586610972881317138671875;
    out.m_49.x = _3509;
    bool _3525 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3527 = fma(_3503, _3519, _3497);
    float _3529 = fma(_3521, 0.298911988735198974609375, _3523);
    bool _3531 = _2646 > 0.0;
    bool _3533 = isnan(_2646);
    bool _3535 = _3531 || _3533;
    bool _3537 = isnan(0.0);
    bool _3539 = _3535 || _3537;
    float _3541 = fma(_3527, 0.114477999508380889892578125, _3529);
    bool _3543 = _2708 <= 0.0;
    bool _3545 = !_3539;
    bool _3547 = _3543 || _3545;
    float _3549 = -_3541;
    float _3551 = _3515 + _3549;
    float _3553 = -_3541;
    float _3555 = _3521 + _3553;
    float _3557 = -_3541;
    float _3559 = _3527 + _3557;
    float _3561 = fma(_3551, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3541);
    float _3563 = fma(_3555, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3541);
    float _3565 = fma(_3559, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3541);
    bool _3567 = !_3525;
    if (!_3567)
    {
        float _3569 = -_2572;
        float _3571 = _3569 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3573 = -_2574;
        float _3575 = _3573 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3577 = -_2576;
        float _3579 = _3577 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3581 = _3571 * _3571;
        float _3583 = fma(_3575, _3575, _3581);
        float _3585 = fma(_3579, _3579, _3583);
        float _3587 = sqrt(_3585);
        float _3589 = rsqrt(_3585);
        float _3591 = -_3587;
        float _3593 = _3591 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3595 = _3593 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3597 = precise::clamp(_3595, 0.0, 1.0);
        float _3599 = _3575 * _3589;
        float _3601 = _3571 * _3589;
        float _3603 = abs(_3597);
        float _3605 = log2(_3603);
        float _3607 = _3579 * _3589;
        float _3609 = _3599 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3611 = _3193 * _3601;
        float _3613 = -_3601;
        float _3615 = -_3609;
        float _3617 = fma(_3613, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3615);
        float _3619 = fma(_3191, _3599, _3611);
        float _3621 = -_3607;
        float _3623 = fma(_3621, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3617);
        float _3625 = fma(_3251, _3607, _3619);
        float _3627 = precise::clamp(_3625, 0.0, 1.0);
        float _3629 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3631 = _3623 + _3629;
        float _3633 = _3605 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3635 = _3631 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3637 = precise::clamp(_3635, 0.0, 1.0);
        float _3639 = exp2(_3633);
        float _3641 = _3639 * _3637;
        float _3643 = _3627 * _3641;
        float _3645 = _3643 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3647 = _3643 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3649 = _3643 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3645;
        out.m_96.y = _3647;
        out.m_96.z = _3649;
    }
    out.m_98.x = _3563;
    out.m_98.y = _3561;
    out.m_98.z = _3565;
    if (!_3547)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3651 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3651;
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
    bool _3403 = false;
    bool _347 = false;
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
        float _3707 = as_type<float>(_131);
        out.gl_Position.z = _3707;
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
        float _3780 = as_type<float>(_173);
        out.gl_Position.z = _3780;
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
    float _249 = in.m_62.x;
    float _251 = in.m_62.y;
    bool _253 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _255 = isnan(_243);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    bool _269 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _271 = isnan(_243);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -_263;
    float _283 = _281 + 1.0;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    float _289 = 1.0 / _267;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = _279 * _283;
    float _295 = -_279;
    float _297 = _295 + 1.0;
    float _299 = _247 * _289;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _301;
    float _305 = fma(_287, _299, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _307 = fma(_303, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _309 = _305 * _293;
    float _311 = _307 * _293;
    float _313 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _315 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].y, _311);
    float _317 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].x, _313);
    float _319 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].y, _315);
    float _321 = _317 * _249;
    float _323 = _319 * _251;
    bool _325 = !_291;
    float _327 = _299;
    float _345;
    if (!_325)
    {
        float _329 = in.m_60.x;
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _333 = _329 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _337 = _335 * _331;
        float _339 = floor(_337);
        float _341 = -_339;
        float _343 = _337 + _341;
        _345 = _343;
        _347 = true;
    }
    else
    {
        _345 = _167;
    }
    _347 = false;
    float _349 = _345;
    bool _351 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _353 = isnan(_349);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _367 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _369 = isnan(_349);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _385 = _349 + _383;
    float _387 = -_361;
    float _389 = _387 + 1.0;
    float _391 = 1.0 / _365;
    bool _393 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _395 = _377 * _389;
    float _397 = -_377;
    float _399 = _397 + 1.0;
    float _401 = _381 * _391;
    float _403 = fma(_401, _385, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _405 = _403 * _395;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _411 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[115].x, _405);
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _415 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _417 = _409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[116].x, _411);
    float _421 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = _419 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _415;
    out.m_64.y = _417;
    out.m_64.z = _421;
    out.m_64.w = _423;
    bool _425 = !_393;
    if (!_425)
    {
        float _427 = in.m_60.x;
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _431 = _427 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _169 = _441;
    }
    float _443 = _169;
    float _445 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _447 = int(_445);
    float _449 = in.m_60.x;
    float _451 = in.m_60.y;
    float _453 = _159 * _141;
    float _455 = _321 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _459 = _457 != 0;
    float _461 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _463 = int(_461);
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _467 = float(_447);
    float _469 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _471 = int(_469);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_459)
    {
        _327 = 1.0;
    }
    float _477 = _327;
    float _479 = _477;
    if (!_459)
    {
        _479 = 7.345489978790283203125;
    }
    float _481 = _479;
    float _483 = float(_463);
    float _485 = 1.0 / _467;
    float _487 = _481 * _449;
    float _489 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _491 = int(_489);
    float _493 = float(uint(_471));
    bool _495 = _471 == 0;
    float _497 = 1.0 / _483;
    float _499 = _485 * _141;
    float _501 = 1.0 / _493;
    float _503 = float(uint(_491));
    int _505 = ~_491;
    int _507 = _505 + 1;
    float _509 = trunc(_499);
    int _511 = int(_509);
    float _513 = _497 * _141;
    int _515 = ~_471;
    int _517 = _515 + 1;
    float _519 = 1.0 / _503;
    int _521 = as_type<int>(_501) + (-2);
    float _523 = trunc(_513);
    int _525 = int(_523);
    float _527 = float(uint(_511));
    float _529 = as_type<float>(_521) * _527;
    int _531 = as_type<int>(_519) + (-2);
    float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _535 = ~_491;
    int _537 = _535 + 1;
    float _539 = float(uint(_525));
    float _541 = trunc(_529);
    float _543 = precise::max(_541, 0.0);
    uint _546 = uint(_543);
    float _548 = as_type<float>(_531) * _539;
    float _550 = trunc(_548);
    float _552 = precise::max(_550, 0.0);
    uint _554 = uint(_552);
    float _556 = _533 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _558 = _517 * int(_546);
    int _560 = _558 + _511;
    float _562 = floor(_487);
    float _564 = float(uint(_560));
    int _566 = _537 * int(_554);
    int _568 = _566 + _525;
    float _570 = as_type<float>(_521) * _564;
    float _572 = _564;
    if (_459)
    {
        _572 = 1.0;
    }
    float _574 = _572;
    float _576 = float(uint(_568));
    float _578 = trunc(_570);
    float _580 = precise::max(_578, 0.0);
    uint _582 = uint(_580);
    float _584 = _574;
    float _586 = _576;
    if (!_459)
    {
        _584 = 1.2345600128173828125;
    }
    float _588 = _584;
    float _590 = -_562;
    float _592 = _487 + _590;
    float _594 = as_type<float>(_531) * _576;
    if (_459)
    {
        _586 = _449;
    }
    float _596 = _586;
    float _598 = _596;
    if (!_459)
    {
        _598 = _451;
    }
    float _600 = _598;
    float _602 = trunc(_594);
    float _604 = precise::max(_602, 0.0);
    uint _606 = uint(_604);
    float _608 = _588 * _600;
    int _610 = ~_471;
    int _612 = _610 + 1;
    int _614 = int(_546) + int(_582);
    float _616 = floor(_608);
    float _618 = float(_471);
    float _620 = float(_511);
    int _622 = _612 * _614;
    int _624 = _622 + _511;
    int _626 = int(_554) + int(_606);
    float _628 = _592 * _618;
    float _630 = _618 * _453;
    bool _632 = _620 >= _618;
    bool _634 = isnan(_620);
    bool _636 = _632 || _634;
    bool _638 = isnan(_618);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    bool _644 = uint(_624) >= uint(_471);
    int _646 = _507 * _626;
    int _648 = _646 + _525;
    float _650 = -_616;
    float _652 = _608 + _650;
    float _654 = trunc(_642);
    int _656 = int(_654);
    bool _658 = !_644;
    int _660 = _658 ? 0 : (-1);
    bool _662 = uint(_648) >= uint(_491);
    float _664 = in.m_60.z;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _668 = _666 != 0;
    int _670 = ~_614;
    int _672 = _670 + _660;
    int _674 = _672 + 1;
    float _676 = trunc(_628);
    int _678 = int(_676);
    bool _680 = !_668;
    int _682 = _680 ? 0 : 1;
    float _684 = float(_491);
    int _686 = abs(_682);
    int _688 = _471 * _674;
    int _690 = _688 + _511;
    float _692 = float(_525);
    float _694 = _684 * _453;
    int _696 = ~_656;
    int _698 = _696 + 1;
    int _700 = _698 + 1;
    bool _702 = !_662;
    int _704 = _702 ? 0 : (-1);
    bool _706 = !_495;
    int _708 = _706 ? _690 : (-1);
    float _710 = trunc(_694);
    int _712 = int(_710);
    bool _714 = _692 >= _684;
    bool _716 = isnan(_692);
    bool _718 = _714 || _716;
    bool _720 = isnan(_684);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = _652 * _684;
    bool _728 = _451 > 0.5;
    int _730 = _708 * _700;
    int _732 = ~_626;
    int _734 = _732 + _704;
    int _736 = _734 + 1;
    int _738 = _678 * _686;
    int _740 = _738 + _511;
    bool _742 = _664 > 0.5;
    float _744 = trunc(_726);
    int _746 = int(_744);
    float _748 = -_217;
    int _750 = _728 ? as_type<int>(_748) : as_type<int>(_217);
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _754 = _752 != 0;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _758 = _756 != 0;
    float _760 = -_207;
    int _762 = _742 ? as_type<int>(_760) : as_type<int>(_207);
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _766 = _764 != 0;
    float _768 = trunc(_724);
    int _770 = int(_768);
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _774 = _772 != 0;
    bool _776 = !_754;
    float _778 = _776 ? _217 : as_type<float>(_750);
    bool _780 = !_758;
    float _782 = _780 ? _207 : as_type<float>(_762);
    bool _784 = !_766;
    int _786 = _784 ? 0 : 1;
    float _788 = trunc(_630);
    int _790 = int(_788);
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _794 = _792 != 0;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _798 = _796 != 0;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _802 = _800 != 0;
    float _804 = _778 + 0.5;
    int _806 = abs(_786);
    int _808 = _471 + (-1);
    bool _810 = !_798;
    int _812 = _810 ? 0 : 1;
    bool _814 = !_774;
    int _816 = _814 ? 0 : 1;
    int _818 = _656 * _808;
    int _820 = _818 + _730;
    bool _822 = !_794;
    int _824 = _822 ? 0 : 1;
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _828 = _826 != 0;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _832 = _830 != 0;
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _836 = _834 != 0;
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _840 = _838 != 0;
    int _842 = abs(_812);
    int _844 = _746 * _806;
    int _846 = _844 + _525;
    int _848 = abs(_824);
    int _850 = _491 * _736;
    int _852 = _850 + _525;
    bool _854 = !_802;
    int _856 = _854 ? 0 : 1;
    bool _858 = !_832;
    int _860 = _858 ? 0 : 1;
    bool _862 = _491 == 0;
    int _864 = abs(_856);
    int _866 = _820 * _842;
    int _868 = ~_770;
    int _870 = _868 + 1;
    int _872 = _870 + 1;
    bool _874 = !_862;
    int _876 = _874 ? _852 : (-1);
    int _878 = _790 * _848;
    int _880 = _878 + _866;
    int _882 = _491 + (-1);
    int _884 = _876 * _872;
    int _886 = abs(_816);
    int _888 = _740 * _864;
    int _890 = _888 + _880;
    int _892 = abs(_860);
    int _894 = _770 * _882;
    int _896 = _894 + _884;
    bool _898 = !_828;
    int _900 = _898 ? 0 : 1;
    int _902 = _678 * _886;
    int _904 = _902 + _890;
    bool _906 = !_836;
    int _908 = _906 ? 0 : 1;
    int _910 = abs(_900);
    bool _912 = !_840;
    int _914 = _912 ? 0 : 1;
    int _916 = abs(_908);
    int _918 = _896 * _892;
    float _920 = float(uint(_904));
    int _922 = abs(_914);
    int _924 = _712 * _910;
    int _926 = _924 + _918;
    float _928 = as_type<float>(_521) * _920;
    int _930 = ~_471;
    int _932 = _930 + 1;
    int _934 = _846 * _916;
    int _936 = _934 + _926;
    bool _938 = _471 == 0;
    float _940 = trunc(_928);
    float _942 = precise::max(_940, 0.0);
    uint _944 = uint(_942);
    int _946 = _746 * _922;
    int _948 = _946 + _936;
    int _950 = ~_471;
    int _952 = _950 + 1;
    int _954 = ~_491;
    int _956 = _954 + 1;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _960 = float(uint(_948));
    float _962 = float(uint(_740));
    float _964 = as_type<float>(_531) * _960;
    float _966 = as_type<float>(_521) * _962;
    int _968 = _952 * int(_944);
    int _970 = _968 + _904;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _974 = _972 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _976 = trunc(_964);
    float _978 = precise::max(_976, 0.0);
    uint _980 = uint(_978);
    float _982 = float(uint(_970));
    float _984 = as_type<float>(_521) * _982;
    float _986 = trunc(_966);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    int _992 = _956 * int(_980);
    int _994 = _992 + _948;
    float _996 = trunc(_984);
    float _998 = precise::max(_996, 0.0);
    uint _1000 = uint(_998);
    float _1002 = _451 * 2.0;
    float _1004 = float(uint(_994));
    float _1006 = floor(_1002);
    float _1008 = as_type<float>(_531) * _1004;
    int _1010 = ~_491;
    int _1012 = _1010 + 1;
    int _1014 = int(_944) + int(_1000);
    float _1016 = trunc(_1008);
    float _1018 = precise::max(_1016, 0.0);
    uint _1020 = uint(_1018);
    int _1022 = _932 * _1014;
    int _1024 = _1022 + _904;
    float _1026 = 1.0 / _974;
    bool _1028 = uint(_1024) >= uint(_471);
    bool _1030 = !_1028;
    int _1032 = _1030 ? 0 : (-1);
    int _1034 = ~_1014;
    int _1036 = _1034 + _1032;
    int _1038 = _1036 + 1;
    float _1040 = _664 * 2.0;
    int _1042 = int(_980) + int(_1020);
    float _1044 = float(uint(_846));
    int _1046 = _471 * _1038;
    int _1048 = _1046 + _904;
    float _1050 = _451 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1052 = _1012 * _1042;
    int _1054 = _1052 + _948;
    float _1056 = floor(_1040);
    float _1058 = as_type<float>(_531) * _1044;
    bool _1060 = !_938;
    int _1062 = _1060 ? _1048 : (-1);
    float _1064 = fma(_1050, -2.0, _958);
    bool _1066 = uint(_1054) >= uint(_491);
    int _1068 = _1062 & 3;
    bool _1070 = _1068 != 0;
    int _1072 = _1062 & 3;
    bool _1074 = _1072 != 0;
    float _1076 = trunc(_1058);
    float _1078 = precise::max(_1076, 0.0);
    uint _1080 = uint(_1078);
    bool _1082 = !_1066;
    int _1084 = _1082 ? 0 : (-1);
    int _1086 = _1070 ? 0 : 1;
    bool _1088 = uint(_1072) >= 2u;
    bool _1090 = uint(_1072) > 1u;
    int _1092 = ~_1042;
    int _1094 = _1092 + _1084;
    int _1096 = _1094 + 1;
    int _1098 = _1088 ? 0 : 1;
    bool _1100 = _1072 != 3;
    int _1102 = _491 * _1096;
    int _1104 = _1102 + _948;
    int _1106 = ~_1086;
    int _1108 = _1106 + 1;
    int _1110 = _1108 + 1;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1114 = _1112 != 0;
    bool _1116 = !_862;
    int _1118 = _1116 ? _1104 : (-1);
    int _1120 = _1110;
    float _1122 = as_type<float>(_740);
    if (!_1090)
    {
        int _1124 = ~_1086;
        int _1126 = _1124 + 1;
        _1120 = _1126;
    }
    int _1128 = _1120;
    int _1130 = _1118 & 3;
    bool _1132 = _1130 != 0;
    int _1134 = ~_1098;
    int _1136 = _1134 + 1;
    int _1138 = _1136 + 1;
    int _1140 = _1138;
    if (_1100)
    {
        int _1142 = ~_1098;
        int _1144 = _1142 + 1;
        _1140 = _1144;
    }
    int _1146 = _1140;
    bool _1148 = uint(_1130) > 1u;
    float _1150 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1152 = log2(_1150);
    int _1154 = _1118 & 3;
    bool _1156 = _1154 != 0;
    if (_1114)
    {
        _475 = 0;
    }
    int _1158 = _475;
    int _1160 = _1156 ? 0 : 1;
    int _1162 = _1158;
    if (!_1114)
    {
        _1162 = 2;
    }
    int _1164 = _1162;
    int _1166 = ~_1160;
    int _1168 = _1166 + 1;
    int _1170 = _1168 + 1;
    bool _1172 = _451 > 0.5;
    int _1174 = _1170;
    if (!_1148)
    {
        int _1176 = ~_1160;
        int _1178 = _1176 + 1;
        _1174 = _1178;
    }
    int _1180 = _1174;
    float _1182 = _449 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1184 = _1152 * _141;
    bool _1186 = _1130 != 3;
    bool _1188 = _1164 != 2;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1192 = -_207;
    float _1194 = _1172 ? _1192 : _207;
    float _1196 = exp2(_1184);
    bool _1198 = uint(_1130) >= 2u;
    float _1200 = -_1190;
    float _1202 = fma(_1182, 2.0, _1200);
    float _1204 = _449 * 2.0;
    float _1206 = _1198 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1208 = floor(_1204);
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1212 = _1210 != 0;
    int _1214 = ~as_type<int>(_1206);
    int _1216 = _1214 + 1;
    int _1218 = _1216 + 1;
    int _1220 = _1218;
    float _1222 = _1206;
    float _1224 = _1194;
    if (_1186)
    {
        int _1226 = ~as_type<int>(_1206);
        int _1228 = _1226 + 1;
        _1220 = _1228;
    }
    int _1230 = _1220;
    if (_1188)
    {
        _1222 = _449;
    }
    float _1232 = _1222;
    float _1234 = _1232;
    if (!_1188)
    {
        _1234 = _664;
    }
    float _1236 = _1234;
    bool _1238 = !_1212;
    int _1240 = _1238 ? 0 : 1;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1244 = _1242 != 0;
    float _1246 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1248 = _449 > 0.5;
    float _1250 = -_1196;
    float _1252 = _1250 + 1.0;
    bool _1254 = !_1244;
    float _1256 = _1254 ? _207 : _1194;
    float _1258 = -_465;
    float _1260 = fma(_1246, 2.0, _1258);
    int _1262 = ~_471;
    int _1264 = _1262 + 1;
    float _1266 = -_217;
    int _1268 = _1248 ? as_type<int>(_1266) : as_type<int>(_217);
    float _1270 = -_141;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1260);
    bool _1274 = _1208 > 0.0;
    int _1276 = _1264 * int(_990);
    int _1278 = _1276 + _740;
    bool _1280 = _1208 >= 0.0;
    bool _1282 = isnan(_1208);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan(0.0);
    bool _1288 = _1284 || _1286;
    float _1290 = fma(_556, _804, _1272);
    int _1292 = ~_491;
    int _1294 = _1292 + 1;
    if (_1188)
    {
        _1224 = _451;
    }
    float _1296 = _1224;
    float _1298 = _1296;
    if (!_1188)
    {
        _1298 = _449;
    }
    float _1300 = _1298;
    int _1302 = _1294 * int(_1080);
    int _1304 = _1302 + _846;
    float _1306 = float(uint(_1278));
    bool _1308 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1310 = isnan(0.0);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1316 = _1312 || _1314;
    float _1318 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1320 = float(uint(_1304));
    float _1322 = as_type<float>(_521) * _1306;
    float _1324 = _1316 ? _1252 : 0.0;
    float _1326 = fma(_1318, -2.0, _473);
    bool _1328 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1330 = isnan(1.0);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1336 = _1332 || _1334;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1340 = 1.0 + _1338;
    float _1342 = as_type<float>(_531) * _1320;
    float _1344 = trunc(_1322);
    float _1346 = precise::max(_1344, 0.0);
    uint _1348 = uint(_1346);
    float _1350 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1326);
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1354 = 1.0 / _1340;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1360 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1352);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1364 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1356);
    float _1366 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1358);
    float _1368 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1360);
    float _1370 = trunc(_1342);
    float _1372 = precise::max(_1370, 0.0);
    uint _1374 = uint(_1372);
    float _1376 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1362);
    float _1378 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1064);
    float _1380 = -_141;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1202);
    float _1384 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1364);
    float _1386 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1366);
    float _1388 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1376);
    int _1390 = int(_990) + int(_1348);
    if (_1336)
    {
        float _1392 = _1324 * _1354;
        _163 = _1392;
    }
    float _1394 = _163;
    int _1396 = ~_471;
    int _1398 = _1396 + 1;
    float _1400 = in.m_46.x;
    float _1402 = in.m_46.y;
    float _1404 = in.m_46.z;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1408 = _1406 != 0;
    float _1410 = _1256 + (-0.5);
    int _1412 = ~_491;
    int _1414 = _1412 + 1;
    int _1416 = _1398 * _1390;
    int _1418 = _1416 + _740;
    int _1420 = _1288 ? 0 : 1;
    float _1422 = -_1368;
    float _1424 = _1422 + 1.0;
    bool _1426 = !_1408;
    float _1428 = _1426 ? _217 : as_type<float>(_1268);
    float _1430 = -_1410;
    float _1432 = -_1378;
    float _1434 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1432);
    bool _1436 = _1006 > 0.0;
    float _1438 = -_1384;
    float _1440 = _1438 + 1.0;
    bool _1442 = _1006 >= 0.0;
    bool _1444 = isnan(_1006);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan(0.0);
    bool _1450 = _1446 || _1448;
    float _1452 = -_1386;
    float _1454 = _1452 + 1.0;
    int _1456 = int(_1080) + int(_1374);
    int _1458 = ~_1420;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    int _1464 = _1462;
    if (!_1274)
    {
        int _1466 = ~_1420;
        int _1468 = _1466 + 1;
        _1464 = _1468;
    }
    int _1470 = _1464;
    bool _1472 = uint(_1418) >= uint(_471);
    int _1474 = _1414 * _1456;
    int _1476 = _1474 + _846;
    float _1478 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1480 = _1450 ? 0 : 1;
    float _1482 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1484 = !_1472;
    int _1486 = _1484 ? 0 : (-1);
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1488;
    bool _1492 = uint(_1476) >= uint(_491);
    float _1494 = fma(_1400, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1478);
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1498 = _1496 != 0;
    float _1500 = _1490 * _1026;
    bool _1502 = _443 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1504 = isnan(_443);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1510 = _1506 || _1508;
    float _1512 = float(_1510);
    float _1514 = fma(_1400, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1482);
    int _1516 = ~_1480;
    int _1518 = _1516 + 1;
    int _1520 = _1518 + 1;
    int _1522 = _1520;
    if (!_1436)
    {
        int _1524 = ~_1480;
        int _1526 = _1524 + 1;
        _1522 = _1526;
    }
    int _1528 = _1522;
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1532 = _443 + _1530;
    bool _1534 = !_1492;
    int _1536 = _1534 ? 0 : (-1);
    float _1538 = -_1512;
    float _1540 = _1538 + 1.0;
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1544 = _1542 != 0;
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1548 = _1546 != 0;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1552 = _1550 != 0;
    float _1554 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1556 = _443 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1558 = isnan(_443);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    bool _1568 = !_1074;
    int _1570 = _1568 ? 0 : 1;
    float _1572 = fma(_1400, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1554);
    float _1574 = fma(_1500, _1532, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1576 = _1566 * _1540;
    float _1578 = _1428 + 0.5;
    float _1580 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1572);
    bool _1582 = _1056 >= 0.0;
    bool _1584 = isnan(_1056);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan(0.0);
    bool _1590 = _1586 || _1588;
    float _1592 = _1574 * _1576;
    float _1594 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1382);
    float _1596 = -_1566;
    float _1598 = _1596 + 1.0;
    int _1600 = _1590 ? 0 : 1;
    bool _1602 = _1056 > 0.0;
    float _1604 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1592);
    float _1606 = -_1424;
    float _1608 = fma(_1428, _1606, _1594);
    float _1610 = fma(_1256, _1440, _1434);
    float _1612 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1494);
    float _1614 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1604);
    float _1616 = _1580 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1618 = _1062 >> 31;
    float _1620 = _451 + _449;
    int _1622 = _1118 >> 31;
    float _1624 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1514);
    float _1626 = _1612 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1630 = _1616 + _1628;
    int _1632 = _1618 & 3;
    float _1634 = _1620 + (-1.0);
    float _1636 = _1624 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1638 = _1622 & 3;
    float _1640 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1642 = _1626 + _1640;
    float _1644 = _1630 * _1630;
    int _1646 = _1062 + _1632;
    out.m_66.x = _1608;
    out.m_66.y = _1610;
    float _1648 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1652 = _1636 + _1650;
    float _1654 = fma(_1642, _1642, _1644);
    int _1656 = _1646 >> 2;
    float _1658 = _1630 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1660 = !_1132;
    int _1662 = _1660 ? 0 : 1;
    float _1664 = fma(_1652, _1652, _1654);
    int _1666 = _1656 << 4;
    int _1668 = _1666 + 368;
    float _1670 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1658);
    int _1672 = _1118 + _1638;
    float _1674 = _455 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1676 = _1072 != 3;
    float _1678 = rsqrt(_1664);
    int _1680 = _1672 >> 2;
    float _1682 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1670);
    int _1684 = ~_1600;
    int _1686 = _1684 + 1;
    int _1688 = _1686 + 1;
    float _1690 = _1614 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1692 = _1680 << 4;
    int _1694 = _1692 + 512;
    uint _1696 = uint(int(uint(_1668) >> uint(2)));
    uint _1698 = uint(int(uint(int(_1696)) >> uint(2)));
    int _1700 = int(_1696) & 3;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[int(_1698)][_1700];
    int _1704 = int(_1696) + 1;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    int _1708 = _1704 & 3;
    float _1710 = (*spvDescriptorSet0.vp_c9)._m0[int(_1706)][_1708];
    int _1712 = _1688;
    float _1714 = _1636;
    if (!_1602)
    {
        int _1716 = ~_1600;
        int _1718 = _1716 + 1;
        _1712 = _1718;
    }
    int _1720 = _1712;
    float _1722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1724 = !_1676;
    int _1726 = _1724 ? 0 : (-1);
    out.m_68.w = _1690;
    bool _1728 = _1130 != 3;
    int _1730 = abs(_1146);
    uint _1732 = uint(int(uint(_1694) >> uint(2)));
    uint _1734 = uint(int(uint(int(_1732)) >> uint(2)));
    int _1736 = int(_1732) & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = int(_1732) + 1;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    int _1744 = _1740 & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    bool _1748 = !_1728;
    int _1750 = _1748 ? 0 : (-1);
    bool _1752 = _1682 >= 0.0;
    float _1754 = _1674 * _1678;
    int _1756 = abs(_1230);
    int _1758 = abs(_1240);
    int _1760 = _1668 + 8;
    uint _1762 = uint(int(uint(_1760) >> uint(2)));
    uint _1764 = uint(int(uint(int(_1762)) >> uint(2)));
    int _1766 = int(_1762) & 3;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[int(_1764)][_1766];
    int _1770 = int(_1762) + 1;
    uint _1772 = uint(int(uint(_1770) >> uint(2)));
    int _1774 = _1770 & 3;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[int(_1772)][_1774];
    float _1778 = _1630 * _1754;
    float _1780 = _1642 * _1754;
    float _1782 = _1652 * _1754;
    float _1784 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1786 = -_1778;
    float _1788 = _1630 + _1786;
    float _1790 = -_1780;
    float _1792 = _1642 + _1790;
    float _1794 = -_1782;
    float _1796 = _1652 + _1794;
    int _1798 = _1694 + 8;
    uint _1800 = uint(int(uint(_1798) >> uint(2)));
    uint _1802 = uint(int(uint(int(_1800)) >> uint(2)));
    int _1804 = int(_1800) & 3;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[int(_1802)][_1804];
    int _1808 = int(_1800) + 1;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    int _1812 = _1808 & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    float _1816 = _1788 * _1788;
    float _1818 = _782 + (-0.5);
    bool _1820 = !_1544;
    int _1822 = _1820 ? 0 : 1;
    float _1824 = _1780;
    if (_1752)
    {
        out.m_49.x = 0.0;
    }
    float _1826 = fma(_1792, _1792, _1816);
    float _1828 = -_1784;
    float _1830 = -_1350;
    float _1832 = fma(_1828, _1818, _1830);
    int _1834 = abs(_1180);
    float _1836 = -_1454;
    float _1838 = fma(_778, _1836, _1290);
    float _1840 = fma(_1796, _1796, _1826);
    int _1842 = abs(_1128);
    float _1844 = _449 + (-0.5);
    int _1846 = abs(_1570);
    int _1848 = ~_1842;
    int _1850 = _1848 + 1;
    int _1852 = _1850 + 1;
    int _1854 = ~_1834;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    int _1860 = ~_1846;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    int _1866 = abs(_1662);
    int _1868 = ~_1390;
    int _1870 = _1868 + _1486;
    int _1872 = _1870 + 1;
    int _1874 = _1852 * as_type<int>(_1710);
    int _1876 = ~_1730;
    int _1878 = _1876 + 1;
    int _1880 = _1878 + 1;
    int _1882 = ~_1456;
    int _1884 = _1882 + _1536;
    int _1886 = _1884 + 1;
    int _1888 = _1864 * as_type<int>(_1702);
    int _1890 = _1888 + _1874;
    int _1892 = abs(_1726);
    int _1894 = _471 * _1872;
    int _1896 = _1894 + _740;
    int _1898 = abs(_1822);
    int _1900 = _1858 * as_type<int>(_1746);
    int _1902 = ~_1866;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    int _1908 = _491 * _1886;
    int _1910 = _1908 + _846;
    bool _1912 = _471 == 0;
    float _1914 = float(_1720);
    int _1916 = _1906 * as_type<int>(_1738);
    int _1918 = _1916 + _1900;
    int _1920 = _1880 * as_type<int>(_1768);
    int _1922 = _1920 + _1890;
    bool _1924 = !_1498;
    int _1926 = _1924 ? 0 : 1;
    int _1928 = abs(_1750);
    int _1930 = abs(_1926);
    int _1932 = ~_1892;
    int _1934 = _1932 + 1;
    int _1936 = _1934 + 1;
    int _1938 = ~_1756;
    int _1940 = _1938 + 1;
    int _1942 = _1940 + 1;
    int _1944 = ~_1928;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    int _1950 = _1936 * as_type<int>(_1776);
    int _1952 = _1950 + _1922;
    float _1954 = float(_1898);
    int _1956 = _1942 * as_type<int>(_1806);
    int _1958 = _1956 + _1918;
    float _1960 = in.m_70.x;
    float _1962 = in.m_70.y;
    float _1964 = in.m_70.z;
    int _1966 = _1948 * as_type<int>(_1814);
    int _1968 = _1966 + _1958;
    float _1970 = sqrt(_1840);
    int _1972 = ~_1758;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    float _1978 = -_1388;
    float _1980 = _1978 + 1.0;
    int _1982 = ~_1930;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    float _1988 = _1954 * _1914;
    bool _1990 = !_1912;
    int _1992 = _1990 ? _1896 : (-1);
    int _1994 = _1952 * _1976;
    bool _1996 = !_862;
    int _1998 = _1996 ? _1910 : (-1);
    int _2000 = _1968 * _1986;
    float _2002 = fma(_782, _1980, _1832);
    int _2004 = _1992 * _1758;
    int _2006 = _2004 + _1994;
    if (_1752)
    {
        _1122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2008 = _1122;
    float _2010 = _1988 * (-2.0);
    int _2012 = _1998 * _1930;
    int _2014 = _2012 + _2000;
    bool _2016 = !_1548;
    int _2018 = _2016 ? 0 : 1;
    out.m_72.x = _1838;
    out.m_72.y = _2002;
    float _2020 = _1678 * _1970;
    int _2022 = as_type<int>(_2008);
    if (_1752)
    {
        float _2024 = _2008 * 5.0;
        _2022 = as_type<int>(_2024);
    }
    int _2026 = _2022;
    float _2028 = float(_2006);
    float _2030 = fma(_2010, _1960, _1960);
    float _2032 = float(_2014);
    float _2034 = _455 * _2020;
    if (_1752)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6482 = as_type<float>(_2026);
        out.gl_Position.z = _6482;
    }
    float _2036 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2030);
    float _2038 = _451 + _664;
    float _2040 = float(_1470);
    out.m_74.x = _2028;
    out.m_74.y = _2032;
    float _2042 = fma(_1648, _2010, _1648);
    float _2044 = _2038 + (-1.0);
    out.m_76.x = _2034;
    bool _2046 = !_1552;
    int _2048 = _2046 ? 0 : 1;
    int _2050 = abs(_2018);
    if (_1752)
    {
        return out;
    }
    float _2052 = -_1778;
    float _2054 = _1616 + _2052;
    int _2056 = abs(_2048);
    float _2058 = -_1780;
    float _2060 = _1626 + _2058;
    float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2064 = _2054 + _2062;
    float _2066 = -_1782;
    float _2068 = _1636 + _2066;
    float _2070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2072 = _2060 + _2070;
    float _2074 = float(_2050);
    float _2076 = _2064 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2078 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2080 = _2068 + _2078;
    float _2082 = float(_1528);
    float _2084 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2086 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2076);
    float _2088 = _2074 * _2040;
    float _2090 = float(_2056);
    float _2092 = _451 + (-0.5);
    float _2094 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2086);
    float _2096 = _2088 * (-2.0);
    float _2098 = _664 + _449;
    float _2100 = _2090 * _2082;
    float _2102 = fma(_2042, _1394, _2036);
    bool _2104 = _2094 >= 0.0;
    float _2106 = fma(_2096, _1962, _1962);
    float _2108 = fma(_2084, _2096, _2084);
    float _2110 = _2098 + (-1.0);
    float _2112 = fma(_2092, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2106);
    float _2114 = _2100 * (-2.0);
    float _2116 = _2102 * 0.15915493667125701904296875;
    float _2118 = fma(_2110, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2120 = fma(_2108, _1394, _2112);
    float _2122 = fma(_2114, _1964, _1964);
    float _2124 = _664 + (-0.5);
    float _2126 = _2116 * 6.283185482025146484375;
    float _2128 = sin(_2126);
    float _2130 = _2120 * 0.15915493667125701904296875;
    float _2132 = _2084;
    float _2134 = _2072;
    float _2136 = _2080;
    if (_2104)
    {
        _2132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2138 = _2132;
    float _2140 = fma(_2118, _2114, _2118);
    float _2142 = fma(_2124, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2122);
    int _2144 = as_type<int>(_2138);
    if (_2104)
    {
        out.m_49.x = 0.0;
    }
    if (_2104)
    {
        float _2146 = _2138 * 5.0;
        _2144 = as_type<int>(_2146);
    }
    int _2148 = _2144;
    float _2150 = _2116 * 6.283185482025146484375;
    float _2152 = cos(_2150);
    float _2154 = fma(_2140, _1394, _2142);
    if (_2104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6685 = as_type<float>(_2148);
        out.gl_Position.z = _6685;
    }
    float _2156 = _2154 * 0.15915493667125701904296875;
    float _2158 = _2130 * 6.283185482025146484375;
    float _2160 = sin(_2158);
    float _2162 = _2130 * 6.283185482025146484375;
    float _2164 = cos(_2162);
    if (_2104)
    {
        return out;
    }
    float _2166 = _2156 * 6.283185482025146484375;
    float _2168 = cos(_2166);
    float _2170 = _323 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2174 = _2128 * _2160;
    float _2176 = _2152 * _2164;
    float _2178 = _2170 * _2020;
    float _2180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2182 = _2128 * _2164;
    float _2184 = _2156 * 6.283185482025146484375;
    float _2186 = sin(_2184);
    float _2188 = _2178 * _2172;
    float _2190 = _2152 * _2160;
    float _2192 = _2020 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2194 = _2192 * 0.5;
    float _2196 = _2152 * _2168;
    float _2198 = _2164 * _2168;
    float _2200 = _2128 * _2168;
    float _2202 = _2160 * _2168;
    float _2204 = _2034 * _2180;
    float _2206 = _2196 * _2188;
    float _2208 = fma(_2186, _2176, _2174);
    float _2210 = -_2182;
    float _2212 = fma(_2186, _2190, _2210);
    float _2214 = -_2188;
    float _2216 = _2186 * _2214;
    float _2218 = -_2190;
    float _2220 = fma(_2186, _2182, _2218);
    float _2222 = fma(_2208, _2204, _2206);
    float _2224 = _2200 * _2188;
    float _2226 = fma(_2198, _2204, _2216);
    float _2228 = fma(_2212, _2194, _2222);
    float _2230 = fma(_2186, _2174, _2176);
    float _2232 = fma(_2220, _2204, _2224);
    float _2234 = fma(_2202, _2194, _2226);
    float _2236 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2238 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2240 = fma(_2230, _2194, _2232);
    float _2242 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2236);
    float _2244 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2238);
    float _2246 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2242);
    float _2248 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2244);
    float _2250 = _2246 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2252 = _2248 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2254 = _1636 + _2250;
    float _2256 = _1626 + _2252;
    float _2258 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2260 = _2054 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2264 = _2254 + _2262;
    float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2268 = _2256 + _2266;
    float _2270 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2258);
    float _2272 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2260);
    float _2274 = _2264 * _2264;
    float _2276 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2270);
    float _2278 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2272);
    float _2280 = fma(_2268, _2268, _2274);
    float _2282 = _2276 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2284 = sqrt(_2280);
    float _2286 = _1616 + _2282;
    bool _2288 = _2284 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2290 = _2276;
    float _2292 = _2282;
    float _2294 = _2260;
    float _2296 = _2204;
    if (!_2288)
    {
        _2290 = _2256;
    }
    float _2298 = _2290;
    float _2300 = _2298;
    if (!_2288)
    {
        _2292 = _2254;
    }
    float _2302 = _2292;
    float _2304 = _2302;
    if (!_2288)
    {
        _2294 = _2286;
    }
    float _2306 = _2294;
    bool _2308 = !_2288;
    float _2310 = _2306;
    if (!_2308)
    {
        float _2312 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2316 = _2284 + _2314;
        float _2318 = rsqrt(_2280);
        float _2320 = _2316 * _2312;
        float _2322 = _2286 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2324 = _2320 * 0.15915493667125701904296875;
        float _2326 = _2324 * 6.283185482025146484375;
        float _2328 = cos(_2326);
        float _2330 = _2324 * 6.283185482025146484375;
        float _2332 = sin(_2330);
        float _2334 = _2328 + (-1.0);
        float _2336 = fma(_2332, _2322, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2338 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2340 = _2318 * _2336;
        float _2342 = fma(_2286, _2328, _2338);
        float _2344 = fma(_2268, _2340, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2346 = fma(_2264, _2340, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2310 = _2342;
        _2300 = _2344;
        _2304 = _2346;
        _2296 = _2324;
    }
    float _2348 = _2310;
    float _2350 = _2300;
    float _2352 = _2304;
    float _2354 = _2296;
    float _2356 = -_1616;
    float _2358 = _2356 + _2348;
    float _2360 = -_1626;
    float _2362 = _2360 + _2350;
    float _2364 = -_1636;
    float _2366 = _2364 + _2352;
    float _2368 = _2278 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2370 = _2358 * _2358;
    float _2372 = _2054 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2374 = 1.0 / _2368;
    float _2376 = fma(_2362, _2362, _2370);
    float _2378 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2372);
    bool _2380 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2382 = isnan(0.5);
    bool _2384 = _2380 || _2382;
    bool _2386 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2388 = _2384 || _2386;
    float _2390 = fma(_2366, _2366, _2376);
    float _2392 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2378);
    bool _2394 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2396 = isnan(0.5);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2402 = _2398 || _2400;
    float _2404 = sqrt(_2390);
    float _2406 = _2392 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2408 = _2406 + _2368;
    float _2410 = _2408 * _2374;
    float _2412 = _2410 * 0.5;
    bool _2414 = _2404 > 0.0;
    float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2418 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2416);
    float _2420 = 1.0 / _2418;
    float _2422 = _2412;
    float _2424 = _2374;
    float _2426 = _2354;
    if (!_2414)
    {
        _2422 = _2350;
    }
    float _2428 = _2422;
    float _2430 = _2428;
    if (!_2414)
    {
        _2424 = _2348;
    }
    float _2432 = _2424;
    float _2434 = _2432;
    if (!_2414)
    {
        _2426 = _2352;
    }
    float _2436 = _2426;
    bool _2438 = !_2414;
    float _2440 = _2436;
    float _2442 = _2436;
    if (!_2438)
    {
        float _2444 = _211 * _211;
        float _2446 = fma(_209, _209, _2444);
        float _2448 = rsqrt(_2390);
        float _2450 = fma(_213, _213, _2446);
        float _2452 = sqrt(_2450);
        float _2454 = _2362 * _2448;
        float _2456 = _2358 * _2448;
        float _2458 = _2366 * _2448;
        bool _2460 = _2452 > 0.0;
        float _2462 = _2448;
        float _2464 = _2452;
        if (!_2460)
        {
            _2462 = _2350;
        }
        float _2466 = _2462;
        _2430 = _2466;
        if (!_2460)
        {
            _2464 = _2348;
        }
        float _2468 = _2464;
        _2434 = _2468;
        if (!_2460)
        {
            _2440 = _2352;
        }
        float _2470 = _2440;
        bool _2472 = !_2460;
        _2442 = _2470;
        if (!_2472)
        {
            float _2474 = rsqrt(_2450);
            float _2476 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2478 = _211 * _2474;
            float _2480 = _209 * _2474;
            float _2482 = _2456 * _2478;
            float _2484 = _213 * _2474;
            float _2486 = fma(_2454, _2480, _2482);
            float _2488 = _2476 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2490 = fma(_2458, _2484, _2486);
            float _2492 = _2490 * _2488;
            float _2494 = fma(_209, _2492, _2350);
            float _2496 = fma(_211, _2492, _2348);
            float _2498 = fma(_213, _2492, _2352);
            _2430 = _2494;
            _2434 = _2496;
            _2442 = _2498;
        }
    }
    float _2500 = _2430;
    float _2502 = _2434;
    float _2504 = _2442;
    float _2506 = -_1780;
    float _2508 = _2506 + _2500;
    float _2510 = -_1778;
    float _2512 = _2510 + _2502;
    float _2514 = -_1782;
    float _2516 = _2514 + _2504;
    float _2518 = _2512;
    float _2520 = _2508;
    float _2522 = _2516;
    if (_2402)
    {
        _221 = 1.0;
    }
    float _2524 = _221;
    float _2526 = _2524;
    if (!_2388)
    {
        float _2528 = _2064 * _2064;
        float _2530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2532 = -_1636;
        float _2534 = _2532 + _2504;
        float _2536 = -_1616;
        float _2538 = _2536 + _2502;
        float _2540 = fma(_2072, _2072, _2528);
        float _2542 = fma(_2080, _2080, _2540);
        float _2544 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2546 = sqrt(_2542);
        float _2548 = 1.0 / _2020;
        float _2550 = precise::min(_2546, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2552 = _2550 * _2530;
        float _2554 = _2544 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2556 = -_1626;
        float _2558 = _2556 + _2500;
        float _2560 = _2552 * _2548;
        float _2562 = _2554 * _2560;
        float _2564 = _2534 * _2560;
        float _2566 = fma(_2538, _2562, _2054);
        float _2568 = fma(_2558, _2562, _2060);
        float _2570 = fma(_2554, _2564, _2068);
        _2518 = _2566;
        _2520 = _2568;
        _2522 = _2570;
        _2134 = _2546;
        _1714 = _2564;
    }
    float _2572 = _2518;
    float _2574 = _2520;
    float _2576 = _2522;
    float _2578 = _2134;
    float _2580 = _1714;
    float _2582 = _2578;
    float _2584 = _2580;
    if (_2402)
    {
        _1824 = 1.0;
    }
    float _2586 = _1824;
    float _2588 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2590 = _2420 * _2588;
    float _2592 = _2586;
    if (!_2402)
    {
        float _2594 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2596 = _2594 * 0.15915493667125701904296875;
        float _2598 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2602 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2600;
        float _2604 = _2596 * 6.283185482025146484375;
        float _2606 = cos(_2604);
        float _2608 = _2598 * 0.15915493667125701904296875;
        float _2610 = _2596 * 6.283185482025146484375;
        float _2612 = sin(_2610);
        float _2614 = 1.0 / _2606;
        float _2616 = _2608 * 6.283185482025146484375;
        float _2618 = cos(_2616);
        float _2620 = _2612 * _2614;
        float _2622 = _2608 * 6.283185482025146484375;
        float _2624 = sin(_2622);
        float _2626 = _2618 * _2620;
        float _2628 = 1.0 / _2602;
        float _2630 = 1.0 / _2626;
        float _2632 = _2624 * _2630;
        float _2634 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2636 = fma(_2590, _2632, _2634);
        float _2638 = _2636 * _2628;
        float _2640 = precise::clamp(_2638, 0.0, 1.0);
        _2136 = _2608;
        _2582 = _2620;
        _2526 = _2640;
    }
    float _2642 = _2136;
    float _2644 = _2582;
    float _2646 = _2526;
    float _2648 = _2642;
    float _2650 = _2644;
    if (!_2402)
    {
        float _2652 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2654 = _2652 * 0.15915493667125701904296875;
        float _2656 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2658 = _2654 * 6.283185482025146484375;
        float _2660 = cos(_2658);
        float _2662 = _2656 * 0.15915493667125701904296875;
        float _2664 = _2654 * 6.283185482025146484375;
        float _2666 = sin(_2664);
        float _2668 = 1.0 / _2660;
        float _2670 = _2662 * 6.283185482025146484375;
        float _2672 = cos(_2670);
        float _2674 = _2666 * _2668;
        float _2676 = _2662 * 6.283185482025146484375;
        float _2678 = sin(_2676);
        float _2680 = _2672 * _2674;
        float _2682 = 1.0 / _2680;
        float _2684 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2686 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2684;
        float _2688 = 1.0 / _2686;
        float _2690 = _2678 * _2682;
        float _2692 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2694 = fma(_2590, _2690, _2692);
        float _2696 = _2694 * _2688;
        float _2698 = precise::clamp(_2696, 0.0, 1.0);
        float _2700 = -_2698;
        float _2702 = _2700 + 1.0;
        _2648 = _2668;
        _2650 = _2680;
        _2592 = _2702;
    }
    float _2704 = _2648;
    float _2706 = _2650;
    float _2708 = _2592;
    float _2710 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2712 = _2572 + _2710;
    float _2714 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2716 = _2574 + _2714;
    float _2718 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2720 = _2576 + _2718;
    float _2722 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2724 = _2712 * _2712;
    float _2726 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2722);
    float _2728 = fma(_2716, _2716, _2724);
    float _2730 = fma(_2720, _2720, _2728);
    float _2732 = rsqrt(_2730);
    float _2734 = sqrt(_2730);
    float _2736 = _2732 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2738 = _2716 * _2736;
    float _2740 = _2720 * _2736;
    float _2742 = _2738 * _2738;
    float _2744 = _2740 * _2740;
    float _2746 = _2742 + _2744;
    float _2748 = sqrt(_2746);
    bool _2750 = _2748 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2754 = _2748 + _2752;
    float _2756 = _2704;
    float _2758 = _2746;
    float _2760 = _2754;
    float _2762 = _2706;
    float _2764 = _2712;
    if (_2750)
    {
        float _2766 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2756 = _2766;
    }
    float _2768 = _2756;
    if (_2750)
    {
        float _2770 = rsqrt(_2746);
        _2758 = _2770;
    }
    float _2772 = _2758;
    float _2774 = _2772;
    if (_2750)
    {
        float _2776 = _2754 * _2768;
        _2760 = _2776;
    }
    float _2778 = _2760;
    if (_2750)
    {
        float _2780 = _2778 * 0.15915493667125701904296875;
        _2762 = _2780;
    }
    float _2782 = _2762;
    float _2784 = _2720;
    float _2786 = _2782;
    if (_2750)
    {
        float _2788 = _2782 * 6.283185482025146484375;
        float _2790 = sin(_2788);
        _2784 = _2790;
    }
    float _2792 = _2784;
    float _2794 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2796 = precise::max(0.0, _2794);
    float _2798 = _2768;
    if (_2750)
    {
        float _2800 = _2782 * 6.283185482025146484375;
        float _2802 = cos(_2800);
        _2798 = _2802;
    }
    float _2804 = _2798;
    float _2806 = -_2736;
    float _2808 = -_2796;
    float _2810 = fma(_2712, _2806, _2808);
    float _2812 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2750)
    {
        float _2814 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2764 = _2814;
    }
    float _2816 = _2764;
    float _2818 = _2816;
    if (!_2750)
    {
        _2786 = _2738;
    }
    float _2820 = _2786;
    float _2822 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2824 = _2792;
    float _2826 = _2820;
    if (_2750)
    {
        float _2828 = fma(_2792, _2816, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2824 = _2828;
    }
    float _2830 = _2824;
    float _2832 = _2830;
    if (!_2750)
    {
        _2818 = _2810;
    }
    float _2834 = _2818;
    float _2836 = _2834;
    float _2838 = _2804;
    if (_2750)
    {
        float _2840 = _2804 + (-1.0);
        _2812 = _2840;
    }
    float _2842 = _2812;
    float _2844 = _2842;
    if (_2750)
    {
        float _2846 = _2772 * _2830;
        _2584 = _2846;
    }
    float _2848 = _2584;
    if (!_2750)
    {
        _2774 = _2740;
    }
    float _2850 = _2774;
    float _2852 = _2850;
    if (_2750)
    {
        float _2854 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2844 = _2854;
    }
    float _2856 = _2844;
    if (_2750)
    {
        float _2858 = _2738 * _2848;
        _2826 = _2858;
    }
    float _2860 = _2826;
    if (!_2750)
    {
        _2832 = _2742;
    }
    float _2862 = _2832;
    float _2864 = _2862;
    if (_2750)
    {
        float _2866 = _2740 * _2848;
        _2852 = _2866;
    }
    float _2868 = _2852;
    if (_2750)
    {
        float _2870 = fma(_2810, _2804, _2856);
        _2836 = _2870;
    }
    float _2872 = _2836;
    if (_2750)
    {
        float _2874 = _2860 * _2860;
        _2864 = _2874;
    }
    float _2876 = _2864;
    if (!_2750)
    {
        _2838 = _2744;
    }
    float _2878 = _2838;
    float _2880 = _2878;
    if (_2750)
    {
        float _2882 = _2868 * _2868;
        _2880 = _2882;
    }
    float _2884 = _2880;
    float _2886 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2888 = fma(_2872, _2872, _2876);
    float _2890 = floor(_2822);
    float _2892 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2886);
    float _2894 = _2888 + _2884;
    float _2896 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2898 = fma(_2734, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2896);
    float _2900 = precise::clamp(_2898, 0.0, 1.0);
    float _2902 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2892);
    float _2904 = rsqrt(_2894);
    float _2906 = -_2900;
    float _2908 = _2906 + 1.0;
    float _2910 = _2902 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2912 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2914 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2916 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2918 = abs(_2908);
    float _2920 = log2(_2918);
    float _2922 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2924 = _2910 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2926 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2914);
    float _2928 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2922);
    float _2930 = -_2924;
    float _2932 = fma(_2930, _2916, 1.0);
    float _2934 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2926);
    float _2936 = _2904 * _2860;
    float _2938 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2928);
    float _2940 = _2904 * _2872;
    float _2942 = _2904 * _2868;
    float _2944 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2946 = _2938 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2948 = _2934 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2950 = floor(_2912);
    float _2952 = -_2944;
    float _2954 = fma(_2940, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2952);
    float _2956 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2958 = _2920 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2960 = -_2942;
    float _2962 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2954);
    float _2964 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2726);
    float _2966 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2956);
    float _2968 = exp2(_2958);
    float _2970 = fma(_2962, -0.5, 0.5);
    float _2972 = _2964 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2974 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2966);
    float _2976 = fma(_2962, 0.5, 0.5);
    float _2978 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2980 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2974);
    float _2982 = log2(_2932);
    float _2984 = -_2950;
    float _2986 = _2912 + _2984;
    float _2988 = fma(_2976, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2990 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2978);
    float _2992 = fma(_2976, _2988, -0.212114393711090087890625);
    float _2994 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2990);
    float _2996 = 1.0 / _2980;
    float _2998 = -_2890;
    float _3000 = _2822 + _2998;
    float _3002 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3004 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3002);
    float _3006 = _2940 + 1.0;
    float _3008 = sqrt(_2970);
    float _3010 = _2982 * 0.693147182464599609375;
    float _3012 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3004);
    float _3014 = -_2940;
    float _3016 = fma(_2968, _3006, _3014);
    float _3018 = fma(_2976, _2992, 1.570728778839111328125);
    float2 _8038 = float2(_3000, _2986);
    float _3020 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8038, float2(0.0), isnan(_8038)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8038, float2(0.0), isnan(_8038)), level(0.0)).x;
    float _3022 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3012);
    float _3024 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2994);
    float _3026 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3028 = fma(_3016, 0.5, 0.5);
    float _3030 = _3022 * _2996;
    float _3032 = _3024 * _2996;
    float _3034 = fma(_3030, 0.5, 0.5);
    float _3036 = fma(_3032, -0.5, 0.5);
    float _3038 = _3008 * 0.636619746685028076171875;
    float _3040 = -_3018;
    float _3042 = fma(_3038, _3040, 1.0);
    float3 _8083 = float3(_3034, _3036, _3026);
    float _3044 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8083, float3(0.0), isnan(_8083)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8083, float3(0.0), isnan(_8083)), level(0.0)).x;
    float3 _8094 = float3(_3034, _3036, _3026);
    float4 _3047 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8094, float3(0.0), isnan(_8094)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8094, float3(0.0), isnan(_8094)), level(0.0)).xyzw;
    float _3049 = _3047.x;
    float _3051 = _3047.y;
    float _3053 = _3047.z;
    float _3055 = _3047.w;
    float2 _8110 = float2(_3042, _3028);
    float3 _3059 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8110, float2(0.0), isnan(_8110)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8110, float2(0.0), isnan(_8110)), level(0.0)).xyz;
    float _3061 = _3059.x;
    float _3063 = _3059.y;
    float _3065 = _3059.z;
    float _3067 = abs(_2590);
    float _3069 = log2(_3067);
    float _3071 = _2208 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3073 = _2208 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3075 = _2208 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3077 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3079 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3071);
    float _3081 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3073);
    float _3083 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3075);
    float _3085 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3087 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3089 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3091 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3093 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3095 = -_2186;
    float _3097 = fma(_3095, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3077);
    float _3099 = -_2186;
    float _3101 = fma(_3099, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3087);
    float _3103 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3105 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3107 = -_2186;
    float _3109 = fma(_3107, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3085);
    float _3111 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3089);
    float _3113 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3091);
    float _3115 = exp2(_3105);
    float _3117 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3093);
    float _3119 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3109);
    float _3121 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3111);
    float _3123 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3113);
    float _3125 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3117);
    float _3127 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3079);
    float _3129 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3097);
    float _3131 = fma(_3103, _3103, 1.0);
    float _3133 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3135 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3101);
    float _3137 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3139 = rsqrt(_3131);
    float _3141 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3081);
    float _3143 = _2920 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3145 = fma(_3115, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3147 = precise::clamp(_3145, 0.0, 1.0);
    float _3149 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3083);
    float _3151 = _3103 * _3129;
    float _3153 = _3147 * _3147;
    float _3155 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3137);
    float _3157 = fma(_3147, -2.0, 3.0);
    float _3159 = _3103 * _3119;
    float _3161 = exp2(_3143);
    float _3163 = fma(_3133, _3141, _3151);
    float _3165 = _3153 * _3157;
    float _3167 = fma(_3133, _3127, _3159);
    float _3169 = _3103 * _3135;
    float _3171 = _3103 * _3139;
    float _3173 = -_3165;
    float _3175 = _3173 + 1.0;
    out.m_78.x = _3127;
    out.m_78.y = _3141;
    out.m_78.z = _3149;
    float _3177 = fma(_3133, _3149, _3169);
    float _3179 = -_3121;
    float _3181 = _3171 * _3179;
    float _3183 = fma(_3175, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3165);
    float _3185 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3155);
    float _3187 = in.m_80.x;
    float _3189 = fma(_3139, _3119, _3181);
    float _3191 = _3121 + _3167;
    float _3193 = _3123 + _3163;
    float _3195 = -_3161;
    float _3197 = _3195 + 1.0;
    out.m_82.x = _2574;
    out.m_82.y = _2572;
    out.m_82.z = _2576;
    bool _3199 = _2734 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3201 = isnan(_2734);
    bool _3203 = _3199 || _3201;
    bool _3205 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3207 = _3203 || _3205;
    float _3209 = -_3123;
    float _3211 = _3171 * _3209;
    float _3213 = -_3125;
    float _3215 = _3171 * _3213;
    float _3217 = _3197 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3219 = fma(_3139, _3129, _3211);
    bool _3221 = _2590 <= 8000.0;
    bool _3223 = isnan(_2590);
    bool _3225 = _3221 || _3223;
    bool _3227 = isnan(8000.0);
    bool _3229 = _3225 || _3227;
    float _3231 = float(_3229);
    float _3233 = fma(_3139, _3135, _3215);
    float _3235 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3185);
    float _3237 = _2980 * 0.5;
    float _3239 = _3022 + _2980;
    float _3241 = _3231 * _3183;
    out.m_84.x = _3189;
    out.m_84.y = _3219;
    out.m_84.z = _3233;
    float _3243 = _3235 + _2980;
    float _3245 = fma(_3024, -0.5, _3237);
    float _3247 = _3241 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3022;
    out.gl_Position.y = _3024;
    out.gl_Position.z = _3235;
    out.gl_Position.w = _2980;
    float _3249 = _3243 * 0.5;
    float _3251 = _3125 + _3177;
    float _3253 = _3239 * 0.5;
    out.m_86.x = _3191;
    out.m_86.y = _3193;
    out.m_86.z = _3251;
    float _3255 = _3123;
    float _3257 = _3233;
    float _3259 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3207)
    {
        _3255 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3261 = _3255;
    float _3263 = _3261;
    float _3265 = _3261;
    if (!_3207)
    {
        _3257 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3267 = _3257;
    out.m_88.z = _3249;
    out.m_88.w = _2980;
    out.m_90.x = _3253;
    out.m_90.y = _3245;
    out.m_90.z = _3249;
    out.m_90.w = _2980;
    float _3269 = -_3020;
    float _3271 = _3269 + 1.0;
    float _3273 = _3271 * _3247;
    float _3275 = precise::clamp(_3273, 0.0, 1.0);
    float _3277 = -_3275;
    float _3279 = fma(_3277, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3281 = _3051;
    float _3283 = _3267;
    float _3285 = _3267;
    if (!_3207)
    {
        _3259 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3287 = _3259;
    float _3289 = _3279 * _3187;
    float _3291 = _3289 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3293 = _3217 * _3044;
    float _3295 = -_3217;
    float _3297 = _3295 + 1.0;
    float _3299 = _3055 * _3293;
    float _3301 = _3065 * _3293;
    float _3303 = _3055 * _3297;
    out.m_92.x = _3291;
    float _3305 = fma(_3061, _3299, _3049);
    float _3307 = fma(_3063, _3299, _3051);
    float _3309 = fma(_3055, _3301, _3053);
    float _3311 = _2646 * _2708;
    float _3313 = _3293;
    float _3315 = _3311;
    float _3317 = _3287;
    float _3319 = _3287;
    if (!_3207)
    {
        _3313 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3321 = _3313;
    float _3323 = _3321;
    float _3325 = _3321;
    if (!_3207)
    {
        _3281 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3327 = _3281;
    out.m_94.x = _3305;
    out.m_94.y = _3307;
    out.m_94.z = _3309;
    out.m_94.w = _3303;
    float _3329 = _3311 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3331 = _3327;
    float _3333 = _3327;
    if (!_3207)
    {
        _3315 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3335 = _3315;
    bool _3337 = !_3207;
    float _3339 = _3335;
    float _3341 = _3335;
    if (!_3337)
    {
        bool _3343 = _2734 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3345 = isnan(_2734);
        bool _3347 = _3343 || _3345;
        bool _3349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3351 = _3347 || _3349;
        if (!_3351)
        {
            float _3353 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3355 = _2734 + _3353;
            float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3359 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3357;
            float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3365 = 1.0 / _3359;
            float _3367 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3369 = _3367 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3371 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3373 = _3371 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3375 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3377 = _3375 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3379 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3381 = _3379 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3383 = _3355 * _3365;
            float _3385 = precise::clamp(_3383, 0.0, 1.0);
            float _3387 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3389 = _3387 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3391 = fma(_3385, _3363, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3393 = fma(_3385, _3389, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3395 = fma(_3385, _3369, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3397 = fma(_3385, _3373, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3399 = fma(_3385, _3377, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3401 = fma(_3385, _3381, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3285 = _3395;
            _3333 = _3399;
            _3265 = _3391;
            _3325 = _3397;
            _3319 = _3393;
            _3341 = _3401;
            _3403 = true;
        }
        else
        {
            bool _3405 = _2734 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3407 = isnan(_2734);
            bool _3409 = _3405 || _3407;
            bool _3411 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3413 = _3409 || _3411;
            if (!_3413)
            {
                _3263 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3415 = _3263;
            _3265 = _3415;
            if (!_3413)
            {
                _3283 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3417 = _3283;
            _3285 = _3417;
            if (!_3413)
            {
                _3317 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3419 = _3317;
            _3319 = _3419;
            if (!_3413)
            {
                _3323 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3421 = _3323;
            _3325 = _3421;
            if (!_3413)
            {
                _3331 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3423 = _3331;
            _3333 = _3423;
            if (!_3413)
            {
                _3339 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3425 = _3339;
            bool _3427 = !_3413;
            _3341 = _3425;
            if (!_3427)
            {
                bool _3429 = _2734 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3431 = isnan(_2734);
                bool _3433 = _3429 || _3431;
                bool _3435 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3437 = _3433 || _3435;
                if (!_3437)
                {
                    float _3439 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3441 = _2734 + _3439;
                    float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3445 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3443;
                    float _3447 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3449 = _3447 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3451 = 1.0 / _3445;
                    float _3453 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3455 = _3453 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3457 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3459 = _3457 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3461 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3463 = _3461 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3465 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3467 = _3465 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3469 = _3441 * _3451;
                    float _3471 = precise::clamp(_3469, 0.0, 1.0);
                    float _3473 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3475 = _3473 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3477 = fma(_3471, _3449, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3479 = fma(_3471, _3475, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3481 = fma(_3471, _3455, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3483 = fma(_3471, _3459, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3485 = fma(_3471, _3463, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3487 = fma(_3471, _3467, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3285 = _3481;
                    _3333 = _3485;
                    _3265 = _3477;
                    _3325 = _3483;
                    _3319 = _3479;
                    _3341 = _3487;
                    _3403 = true;
                }
                else
                {
                    _3285 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3333 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3265 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3325 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3319 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3341 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3403 = false;
    float _3489 = _3285;
    float _3491 = _3333;
    float _3493 = _3265;
    float _3495 = _3325;
    float _3497 = _3319;
    float _3499 = _3341;
    float _3501 = fma(_3193, -0.5, 0.5);
    float _3503 = precise::clamp(_3501, 0.0, 1.0);
    float _3505 = -_3489;
    float _3507 = _3505 + _3491;
    float _3509 = _3329 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3511 = -_3493;
    float _3513 = _3511 + _3495;
    float _3515 = fma(_3503, _3507, _3489);
    out.m_96.x = 0.0;
    float _3517 = -_3497;
    float _3519 = _3517 + _3499;
    float _3521 = fma(_3503, _3513, _3493);
    float _3523 = _3515 * 0.586610972881317138671875;
    out.m_49.x = _3509;
    bool _3525 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3527 = fma(_3503, _3519, _3497);
    float _3529 = fma(_3521, 0.298911988735198974609375, _3523);
    bool _3531 = _2646 > 0.0;
    bool _3533 = isnan(_2646);
    bool _3535 = _3531 || _3533;
    bool _3537 = isnan(0.0);
    bool _3539 = _3535 || _3537;
    float _3541 = fma(_3527, 0.114477999508380889892578125, _3529);
    bool _3543 = _2708 <= 0.0;
    bool _3545 = !_3539;
    bool _3547 = _3543 || _3545;
    float _3549 = -_3541;
    float _3551 = _3515 + _3549;
    float _3553 = -_3541;
    float _3555 = _3521 + _3553;
    float _3557 = -_3541;
    float _3559 = _3527 + _3557;
    float _3561 = fma(_3551, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3541);
    float _3563 = fma(_3555, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3541);
    float _3565 = fma(_3559, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3541);
    bool _3567 = !_3525;
    if (!_3567)
    {
        float _3569 = -_2572;
        float _3571 = _3569 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3573 = -_2574;
        float _3575 = _3573 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3577 = -_2576;
        float _3579 = _3577 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3581 = _3571 * _3571;
        float _3583 = fma(_3575, _3575, _3581);
        float _3585 = fma(_3579, _3579, _3583);
        float _3587 = sqrt(_3585);
        float _3589 = rsqrt(_3585);
        float _3591 = -_3587;
        float _3593 = _3591 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3595 = _3593 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3597 = precise::clamp(_3595, 0.0, 1.0);
        float _3599 = _3575 * _3589;
        float _3601 = _3571 * _3589;
        float _3603 = abs(_3597);
        float _3605 = log2(_3603);
        float _3607 = _3579 * _3589;
        float _3609 = _3599 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3611 = _3193 * _3601;
        float _3613 = -_3601;
        float _3615 = -_3609;
        float _3617 = fma(_3613, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3615);
        float _3619 = fma(_3191, _3599, _3611);
        float _3621 = -_3607;
        float _3623 = fma(_3621, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3617);
        float _3625 = fma(_3251, _3607, _3619);
        float _3627 = precise::clamp(_3625, 0.0, 1.0);
        float _3629 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3631 = _3623 + _3629;
        float _3633 = _3605 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3635 = _3631 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3637 = precise::clamp(_3635, 0.0, 1.0);
        float _3639 = exp2(_3633);
        float _3641 = _3639 * _3637;
        float _3643 = _3627 * _3641;
        float _3645 = _3643 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3647 = _3643 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3649 = _3643 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3645;
        out.m_96.y = _3647;
        out.m_96.z = _3649;
    }
    out.m_98.x = _3563;
    out.m_98.y = _3561;
    out.m_98.z = _3565;
    if (!_3547)
    {
        return out;
    }
    float _3651 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3651;
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
    bool _3403 = false;
    bool _347 = false;
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
        float _3707 = as_type<float>(_131);
        out.gl_Position.z = _3707;
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
        float _3780 = as_type<float>(_173);
        out.gl_Position.z = _3780;
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
    float _249 = in.m_62.x;
    float _251 = in.m_62.y;
    bool _253 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _255 = isnan(_243);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    bool _269 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _271 = isnan(_243);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -_263;
    float _283 = _281 + 1.0;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    float _289 = 1.0 / _267;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = _279 * _283;
    float _295 = -_279;
    float _297 = _295 + 1.0;
    float _299 = _247 * _289;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _301;
    float _305 = fma(_287, _299, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _307 = fma(_303, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _309 = _305 * _293;
    float _311 = _307 * _293;
    float _313 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _315 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].y, _311);
    float _317 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].x, _313);
    float _319 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].y, _315);
    float _321 = _317 * _249;
    float _323 = _319 * _251;
    bool _325 = !_291;
    float _327 = _299;
    float _345;
    if (!_325)
    {
        float _329 = in.m_60.x;
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _333 = _329 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _337 = _335 * _331;
        float _339 = floor(_337);
        float _341 = -_339;
        float _343 = _337 + _341;
        _345 = _343;
        _347 = true;
    }
    else
    {
        _345 = _167;
    }
    _347 = false;
    float _349 = _345;
    bool _351 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _353 = isnan(_349);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _367 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _369 = isnan(_349);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _385 = _349 + _383;
    float _387 = -_361;
    float _389 = _387 + 1.0;
    float _391 = 1.0 / _365;
    bool _393 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _395 = _377 * _389;
    float _397 = -_377;
    float _399 = _397 + 1.0;
    float _401 = _381 * _391;
    float _403 = fma(_401, _385, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _405 = _403 * _395;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _411 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[115].x, _405);
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _415 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _417 = _409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[116].x, _411);
    float _421 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = _419 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _415;
    out.m_64.y = _417;
    out.m_64.z = _421;
    out.m_64.w = _423;
    bool _425 = !_393;
    if (!_425)
    {
        float _427 = in.m_60.x;
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _431 = _427 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _169 = _441;
    }
    float _443 = _169;
    float _445 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _447 = int(_445);
    float _449 = in.m_60.x;
    float _451 = in.m_60.y;
    float _453 = _159 * _141;
    float _455 = _321 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _459 = _457 != 0;
    float _461 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _463 = int(_461);
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _467 = float(_447);
    float _469 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _471 = int(_469);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_459)
    {
        _327 = 1.0;
    }
    float _477 = _327;
    float _479 = _477;
    if (!_459)
    {
        _479 = 7.345489978790283203125;
    }
    float _481 = _479;
    float _483 = float(_463);
    float _485 = 1.0 / _467;
    float _487 = _481 * _449;
    float _489 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _491 = int(_489);
    float _493 = float(uint(_471));
    bool _495 = _471 == 0;
    float _497 = 1.0 / _483;
    float _499 = _485 * _141;
    float _501 = 1.0 / _493;
    float _503 = float(uint(_491));
    int _505 = ~_491;
    int _507 = _505 + 1;
    float _509 = trunc(_499);
    int _511 = int(_509);
    float _513 = _497 * _141;
    int _515 = ~_471;
    int _517 = _515 + 1;
    float _519 = 1.0 / _503;
    int _521 = as_type<int>(_501) + (-2);
    float _523 = trunc(_513);
    int _525 = int(_523);
    float _527 = float(uint(_511));
    float _529 = as_type<float>(_521) * _527;
    int _531 = as_type<int>(_519) + (-2);
    float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _535 = ~_491;
    int _537 = _535 + 1;
    float _539 = float(uint(_525));
    float _541 = trunc(_529);
    float _543 = precise::max(_541, 0.0);
    uint _546 = uint(_543);
    float _548 = as_type<float>(_531) * _539;
    float _550 = trunc(_548);
    float _552 = precise::max(_550, 0.0);
    uint _554 = uint(_552);
    float _556 = _533 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _558 = _517 * int(_546);
    int _560 = _558 + _511;
    float _562 = floor(_487);
    float _564 = float(uint(_560));
    int _566 = _537 * int(_554);
    int _568 = _566 + _525;
    float _570 = as_type<float>(_521) * _564;
    float _572 = _564;
    if (_459)
    {
        _572 = 1.0;
    }
    float _574 = _572;
    float _576 = float(uint(_568));
    float _578 = trunc(_570);
    float _580 = precise::max(_578, 0.0);
    uint _582 = uint(_580);
    float _584 = _574;
    float _586 = _576;
    if (!_459)
    {
        _584 = 1.2345600128173828125;
    }
    float _588 = _584;
    float _590 = -_562;
    float _592 = _487 + _590;
    float _594 = as_type<float>(_531) * _576;
    if (_459)
    {
        _586 = _449;
    }
    float _596 = _586;
    float _598 = _596;
    if (!_459)
    {
        _598 = _451;
    }
    float _600 = _598;
    float _602 = trunc(_594);
    float _604 = precise::max(_602, 0.0);
    uint _606 = uint(_604);
    float _608 = _588 * _600;
    int _610 = ~_471;
    int _612 = _610 + 1;
    int _614 = int(_546) + int(_582);
    float _616 = floor(_608);
    float _618 = float(_471);
    float _620 = float(_511);
    int _622 = _612 * _614;
    int _624 = _622 + _511;
    int _626 = int(_554) + int(_606);
    float _628 = _592 * _618;
    float _630 = _618 * _453;
    bool _632 = _620 >= _618;
    bool _634 = isnan(_620);
    bool _636 = _632 || _634;
    bool _638 = isnan(_618);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    bool _644 = uint(_624) >= uint(_471);
    int _646 = _507 * _626;
    int _648 = _646 + _525;
    float _650 = -_616;
    float _652 = _608 + _650;
    float _654 = trunc(_642);
    int _656 = int(_654);
    bool _658 = !_644;
    int _660 = _658 ? 0 : (-1);
    bool _662 = uint(_648) >= uint(_491);
    float _664 = in.m_60.z;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _668 = _666 != 0;
    int _670 = ~_614;
    int _672 = _670 + _660;
    int _674 = _672 + 1;
    float _676 = trunc(_628);
    int _678 = int(_676);
    bool _680 = !_668;
    int _682 = _680 ? 0 : 1;
    float _684 = float(_491);
    int _686 = abs(_682);
    int _688 = _471 * _674;
    int _690 = _688 + _511;
    float _692 = float(_525);
    float _694 = _684 * _453;
    int _696 = ~_656;
    int _698 = _696 + 1;
    int _700 = _698 + 1;
    bool _702 = !_662;
    int _704 = _702 ? 0 : (-1);
    bool _706 = !_495;
    int _708 = _706 ? _690 : (-1);
    float _710 = trunc(_694);
    int _712 = int(_710);
    bool _714 = _692 >= _684;
    bool _716 = isnan(_692);
    bool _718 = _714 || _716;
    bool _720 = isnan(_684);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = _652 * _684;
    bool _728 = _451 > 0.5;
    int _730 = _708 * _700;
    int _732 = ~_626;
    int _734 = _732 + _704;
    int _736 = _734 + 1;
    int _738 = _678 * _686;
    int _740 = _738 + _511;
    bool _742 = _664 > 0.5;
    float _744 = trunc(_726);
    int _746 = int(_744);
    float _748 = -_217;
    int _750 = _728 ? as_type<int>(_748) : as_type<int>(_217);
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _754 = _752 != 0;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _758 = _756 != 0;
    float _760 = -_207;
    int _762 = _742 ? as_type<int>(_760) : as_type<int>(_207);
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _766 = _764 != 0;
    float _768 = trunc(_724);
    int _770 = int(_768);
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _774 = _772 != 0;
    bool _776 = !_754;
    float _778 = _776 ? _217 : as_type<float>(_750);
    bool _780 = !_758;
    float _782 = _780 ? _207 : as_type<float>(_762);
    bool _784 = !_766;
    int _786 = _784 ? 0 : 1;
    float _788 = trunc(_630);
    int _790 = int(_788);
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _794 = _792 != 0;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _798 = _796 != 0;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _802 = _800 != 0;
    float _804 = _778 + 0.5;
    int _806 = abs(_786);
    int _808 = _471 + (-1);
    bool _810 = !_798;
    int _812 = _810 ? 0 : 1;
    bool _814 = !_774;
    int _816 = _814 ? 0 : 1;
    int _818 = _656 * _808;
    int _820 = _818 + _730;
    bool _822 = !_794;
    int _824 = _822 ? 0 : 1;
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _828 = _826 != 0;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _832 = _830 != 0;
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _836 = _834 != 0;
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _840 = _838 != 0;
    int _842 = abs(_812);
    int _844 = _746 * _806;
    int _846 = _844 + _525;
    int _848 = abs(_824);
    int _850 = _491 * _736;
    int _852 = _850 + _525;
    bool _854 = !_802;
    int _856 = _854 ? 0 : 1;
    bool _858 = !_832;
    int _860 = _858 ? 0 : 1;
    bool _862 = _491 == 0;
    int _864 = abs(_856);
    int _866 = _820 * _842;
    int _868 = ~_770;
    int _870 = _868 + 1;
    int _872 = _870 + 1;
    bool _874 = !_862;
    int _876 = _874 ? _852 : (-1);
    int _878 = _790 * _848;
    int _880 = _878 + _866;
    int _882 = _491 + (-1);
    int _884 = _876 * _872;
    int _886 = abs(_816);
    int _888 = _740 * _864;
    int _890 = _888 + _880;
    int _892 = abs(_860);
    int _894 = _770 * _882;
    int _896 = _894 + _884;
    bool _898 = !_828;
    int _900 = _898 ? 0 : 1;
    int _902 = _678 * _886;
    int _904 = _902 + _890;
    bool _906 = !_836;
    int _908 = _906 ? 0 : 1;
    int _910 = abs(_900);
    bool _912 = !_840;
    int _914 = _912 ? 0 : 1;
    int _916 = abs(_908);
    int _918 = _896 * _892;
    float _920 = float(uint(_904));
    int _922 = abs(_914);
    int _924 = _712 * _910;
    int _926 = _924 + _918;
    float _928 = as_type<float>(_521) * _920;
    int _930 = ~_471;
    int _932 = _930 + 1;
    int _934 = _846 * _916;
    int _936 = _934 + _926;
    bool _938 = _471 == 0;
    float _940 = trunc(_928);
    float _942 = precise::max(_940, 0.0);
    uint _944 = uint(_942);
    int _946 = _746 * _922;
    int _948 = _946 + _936;
    int _950 = ~_471;
    int _952 = _950 + 1;
    int _954 = ~_491;
    int _956 = _954 + 1;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _960 = float(uint(_948));
    float _962 = float(uint(_740));
    float _964 = as_type<float>(_531) * _960;
    float _966 = as_type<float>(_521) * _962;
    int _968 = _952 * int(_944);
    int _970 = _968 + _904;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _974 = _972 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _976 = trunc(_964);
    float _978 = precise::max(_976, 0.0);
    uint _980 = uint(_978);
    float _982 = float(uint(_970));
    float _984 = as_type<float>(_521) * _982;
    float _986 = trunc(_966);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    int _992 = _956 * int(_980);
    int _994 = _992 + _948;
    float _996 = trunc(_984);
    float _998 = precise::max(_996, 0.0);
    uint _1000 = uint(_998);
    float _1002 = _451 * 2.0;
    float _1004 = float(uint(_994));
    float _1006 = floor(_1002);
    float _1008 = as_type<float>(_531) * _1004;
    int _1010 = ~_491;
    int _1012 = _1010 + 1;
    int _1014 = int(_944) + int(_1000);
    float _1016 = trunc(_1008);
    float _1018 = precise::max(_1016, 0.0);
    uint _1020 = uint(_1018);
    int _1022 = _932 * _1014;
    int _1024 = _1022 + _904;
    float _1026 = 1.0 / _974;
    bool _1028 = uint(_1024) >= uint(_471);
    bool _1030 = !_1028;
    int _1032 = _1030 ? 0 : (-1);
    int _1034 = ~_1014;
    int _1036 = _1034 + _1032;
    int _1038 = _1036 + 1;
    float _1040 = _664 * 2.0;
    int _1042 = int(_980) + int(_1020);
    float _1044 = float(uint(_846));
    int _1046 = _471 * _1038;
    int _1048 = _1046 + _904;
    float _1050 = _451 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1052 = _1012 * _1042;
    int _1054 = _1052 + _948;
    float _1056 = floor(_1040);
    float _1058 = as_type<float>(_531) * _1044;
    bool _1060 = !_938;
    int _1062 = _1060 ? _1048 : (-1);
    float _1064 = fma(_1050, -2.0, _958);
    bool _1066 = uint(_1054) >= uint(_491);
    int _1068 = _1062 & 3;
    bool _1070 = _1068 != 0;
    int _1072 = _1062 & 3;
    bool _1074 = _1072 != 0;
    float _1076 = trunc(_1058);
    float _1078 = precise::max(_1076, 0.0);
    uint _1080 = uint(_1078);
    bool _1082 = !_1066;
    int _1084 = _1082 ? 0 : (-1);
    int _1086 = _1070 ? 0 : 1;
    bool _1088 = uint(_1072) >= 2u;
    bool _1090 = uint(_1072) > 1u;
    int _1092 = ~_1042;
    int _1094 = _1092 + _1084;
    int _1096 = _1094 + 1;
    int _1098 = _1088 ? 0 : 1;
    bool _1100 = _1072 != 3;
    int _1102 = _491 * _1096;
    int _1104 = _1102 + _948;
    int _1106 = ~_1086;
    int _1108 = _1106 + 1;
    int _1110 = _1108 + 1;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1114 = _1112 != 0;
    bool _1116 = !_862;
    int _1118 = _1116 ? _1104 : (-1);
    int _1120 = _1110;
    float _1122 = as_type<float>(_740);
    if (!_1090)
    {
        int _1124 = ~_1086;
        int _1126 = _1124 + 1;
        _1120 = _1126;
    }
    int _1128 = _1120;
    int _1130 = _1118 & 3;
    bool _1132 = _1130 != 0;
    int _1134 = ~_1098;
    int _1136 = _1134 + 1;
    int _1138 = _1136 + 1;
    int _1140 = _1138;
    if (_1100)
    {
        int _1142 = ~_1098;
        int _1144 = _1142 + 1;
        _1140 = _1144;
    }
    int _1146 = _1140;
    bool _1148 = uint(_1130) > 1u;
    float _1150 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1152 = log2(_1150);
    int _1154 = _1118 & 3;
    bool _1156 = _1154 != 0;
    if (_1114)
    {
        _475 = 0;
    }
    int _1158 = _475;
    int _1160 = _1156 ? 0 : 1;
    int _1162 = _1158;
    if (!_1114)
    {
        _1162 = 2;
    }
    int _1164 = _1162;
    int _1166 = ~_1160;
    int _1168 = _1166 + 1;
    int _1170 = _1168 + 1;
    bool _1172 = _451 > 0.5;
    int _1174 = _1170;
    if (!_1148)
    {
        int _1176 = ~_1160;
        int _1178 = _1176 + 1;
        _1174 = _1178;
    }
    int _1180 = _1174;
    float _1182 = _449 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1184 = _1152 * _141;
    bool _1186 = _1130 != 3;
    bool _1188 = _1164 != 2;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1192 = -_207;
    float _1194 = _1172 ? _1192 : _207;
    float _1196 = exp2(_1184);
    bool _1198 = uint(_1130) >= 2u;
    float _1200 = -_1190;
    float _1202 = fma(_1182, 2.0, _1200);
    float _1204 = _449 * 2.0;
    float _1206 = _1198 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1208 = floor(_1204);
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1212 = _1210 != 0;
    int _1214 = ~as_type<int>(_1206);
    int _1216 = _1214 + 1;
    int _1218 = _1216 + 1;
    int _1220 = _1218;
    float _1222 = _1206;
    float _1224 = _1194;
    if (_1186)
    {
        int _1226 = ~as_type<int>(_1206);
        int _1228 = _1226 + 1;
        _1220 = _1228;
    }
    int _1230 = _1220;
    if (_1188)
    {
        _1222 = _449;
    }
    float _1232 = _1222;
    float _1234 = _1232;
    if (!_1188)
    {
        _1234 = _664;
    }
    float _1236 = _1234;
    bool _1238 = !_1212;
    int _1240 = _1238 ? 0 : 1;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1244 = _1242 != 0;
    float _1246 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1248 = _449 > 0.5;
    float _1250 = -_1196;
    float _1252 = _1250 + 1.0;
    bool _1254 = !_1244;
    float _1256 = _1254 ? _207 : _1194;
    float _1258 = -_465;
    float _1260 = fma(_1246, 2.0, _1258);
    int _1262 = ~_471;
    int _1264 = _1262 + 1;
    float _1266 = -_217;
    int _1268 = _1248 ? as_type<int>(_1266) : as_type<int>(_217);
    float _1270 = -_141;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1260);
    bool _1274 = _1208 > 0.0;
    int _1276 = _1264 * int(_990);
    int _1278 = _1276 + _740;
    bool _1280 = _1208 >= 0.0;
    bool _1282 = isnan(_1208);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan(0.0);
    bool _1288 = _1284 || _1286;
    float _1290 = fma(_556, _804, _1272);
    int _1292 = ~_491;
    int _1294 = _1292 + 1;
    if (_1188)
    {
        _1224 = _451;
    }
    float _1296 = _1224;
    float _1298 = _1296;
    if (!_1188)
    {
        _1298 = _449;
    }
    float _1300 = _1298;
    int _1302 = _1294 * int(_1080);
    int _1304 = _1302 + _846;
    float _1306 = float(uint(_1278));
    bool _1308 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1310 = isnan(0.0);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1316 = _1312 || _1314;
    float _1318 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1320 = float(uint(_1304));
    float _1322 = as_type<float>(_521) * _1306;
    float _1324 = _1316 ? _1252 : 0.0;
    float _1326 = fma(_1318, -2.0, _473);
    bool _1328 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1330 = isnan(1.0);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1336 = _1332 || _1334;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1340 = 1.0 + _1338;
    float _1342 = as_type<float>(_531) * _1320;
    float _1344 = trunc(_1322);
    float _1346 = precise::max(_1344, 0.0);
    uint _1348 = uint(_1346);
    float _1350 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1326);
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1354 = 1.0 / _1340;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1360 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1352);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1364 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1356);
    float _1366 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1358);
    float _1368 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1360);
    float _1370 = trunc(_1342);
    float _1372 = precise::max(_1370, 0.0);
    uint _1374 = uint(_1372);
    float _1376 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1362);
    float _1378 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1064);
    float _1380 = -_141;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1202);
    float _1384 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1364);
    float _1386 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1366);
    float _1388 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1376);
    int _1390 = int(_990) + int(_1348);
    if (_1336)
    {
        float _1392 = _1324 * _1354;
        _163 = _1392;
    }
    float _1394 = _163;
    int _1396 = ~_471;
    int _1398 = _1396 + 1;
    float _1400 = in.m_46.x;
    float _1402 = in.m_46.y;
    float _1404 = in.m_46.z;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1408 = _1406 != 0;
    float _1410 = _1256 + (-0.5);
    int _1412 = ~_491;
    int _1414 = _1412 + 1;
    int _1416 = _1398 * _1390;
    int _1418 = _1416 + _740;
    int _1420 = _1288 ? 0 : 1;
    float _1422 = -_1368;
    float _1424 = _1422 + 1.0;
    bool _1426 = !_1408;
    float _1428 = _1426 ? _217 : as_type<float>(_1268);
    float _1430 = -_1410;
    float _1432 = -_1378;
    float _1434 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1432);
    bool _1436 = _1006 > 0.0;
    float _1438 = -_1384;
    float _1440 = _1438 + 1.0;
    bool _1442 = _1006 >= 0.0;
    bool _1444 = isnan(_1006);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan(0.0);
    bool _1450 = _1446 || _1448;
    float _1452 = -_1386;
    float _1454 = _1452 + 1.0;
    int _1456 = int(_1080) + int(_1374);
    int _1458 = ~_1420;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    int _1464 = _1462;
    if (!_1274)
    {
        int _1466 = ~_1420;
        int _1468 = _1466 + 1;
        _1464 = _1468;
    }
    int _1470 = _1464;
    bool _1472 = uint(_1418) >= uint(_471);
    int _1474 = _1414 * _1456;
    int _1476 = _1474 + _846;
    float _1478 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1480 = _1450 ? 0 : 1;
    float _1482 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1484 = !_1472;
    int _1486 = _1484 ? 0 : (-1);
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1488;
    bool _1492 = uint(_1476) >= uint(_491);
    float _1494 = fma(_1400, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1478);
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1498 = _1496 != 0;
    float _1500 = _1490 * _1026;
    bool _1502 = _443 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1504 = isnan(_443);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1510 = _1506 || _1508;
    float _1512 = float(_1510);
    float _1514 = fma(_1400, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1482);
    int _1516 = ~_1480;
    int _1518 = _1516 + 1;
    int _1520 = _1518 + 1;
    int _1522 = _1520;
    if (!_1436)
    {
        int _1524 = ~_1480;
        int _1526 = _1524 + 1;
        _1522 = _1526;
    }
    int _1528 = _1522;
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1532 = _443 + _1530;
    bool _1534 = !_1492;
    int _1536 = _1534 ? 0 : (-1);
    float _1538 = -_1512;
    float _1540 = _1538 + 1.0;
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1544 = _1542 != 0;
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1548 = _1546 != 0;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1552 = _1550 != 0;
    float _1554 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1556 = _443 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1558 = isnan(_443);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    bool _1568 = !_1074;
    int _1570 = _1568 ? 0 : 1;
    float _1572 = fma(_1400, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1554);
    float _1574 = fma(_1500, _1532, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1576 = _1566 * _1540;
    float _1578 = _1428 + 0.5;
    float _1580 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1572);
    bool _1582 = _1056 >= 0.0;
    bool _1584 = isnan(_1056);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan(0.0);
    bool _1590 = _1586 || _1588;
    float _1592 = _1574 * _1576;
    float _1594 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1382);
    float _1596 = -_1566;
    float _1598 = _1596 + 1.0;
    int _1600 = _1590 ? 0 : 1;
    bool _1602 = _1056 > 0.0;
    float _1604 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1592);
    float _1606 = -_1424;
    float _1608 = fma(_1428, _1606, _1594);
    float _1610 = fma(_1256, _1440, _1434);
    float _1612 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1494);
    float _1614 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1604);
    float _1616 = _1580 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1618 = _1062 >> 31;
    float _1620 = _451 + _449;
    int _1622 = _1118 >> 31;
    float _1624 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1514);
    float _1626 = _1612 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1630 = _1616 + _1628;
    int _1632 = _1618 & 3;
    float _1634 = _1620 + (-1.0);
    float _1636 = _1624 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1638 = _1622 & 3;
    float _1640 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1642 = _1626 + _1640;
    float _1644 = _1630 * _1630;
    int _1646 = _1062 + _1632;
    out.m_66.x = _1608;
    out.m_66.y = _1610;
    float _1648 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1652 = _1636 + _1650;
    float _1654 = fma(_1642, _1642, _1644);
    int _1656 = _1646 >> 2;
    float _1658 = _1630 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1660 = !_1132;
    int _1662 = _1660 ? 0 : 1;
    float _1664 = fma(_1652, _1652, _1654);
    int _1666 = _1656 << 4;
    int _1668 = _1666 + 368;
    float _1670 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1658);
    int _1672 = _1118 + _1638;
    float _1674 = _455 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1676 = _1072 != 3;
    float _1678 = rsqrt(_1664);
    int _1680 = _1672 >> 2;
    float _1682 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1670);
    int _1684 = ~_1600;
    int _1686 = _1684 + 1;
    int _1688 = _1686 + 1;
    float _1690 = _1614 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1692 = _1680 << 4;
    int _1694 = _1692 + 512;
    uint _1696 = uint(int(uint(_1668) >> uint(2)));
    uint _1698 = uint(int(uint(int(_1696)) >> uint(2)));
    int _1700 = int(_1696) & 3;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[int(_1698)][_1700];
    int _1704 = int(_1696) + 1;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    int _1708 = _1704 & 3;
    float _1710 = (*spvDescriptorSet0.vp_c9)._m0[int(_1706)][_1708];
    int _1712 = _1688;
    float _1714 = _1636;
    if (!_1602)
    {
        int _1716 = ~_1600;
        int _1718 = _1716 + 1;
        _1712 = _1718;
    }
    int _1720 = _1712;
    float _1722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1724 = !_1676;
    int _1726 = _1724 ? 0 : (-1);
    out.m_68.w = _1690;
    bool _1728 = _1130 != 3;
    int _1730 = abs(_1146);
    uint _1732 = uint(int(uint(_1694) >> uint(2)));
    uint _1734 = uint(int(uint(int(_1732)) >> uint(2)));
    int _1736 = int(_1732) & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = int(_1732) + 1;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    int _1744 = _1740 & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    bool _1748 = !_1728;
    int _1750 = _1748 ? 0 : (-1);
    bool _1752 = _1682 >= 0.0;
    float _1754 = _1674 * _1678;
    int _1756 = abs(_1230);
    int _1758 = abs(_1240);
    int _1760 = _1668 + 8;
    uint _1762 = uint(int(uint(_1760) >> uint(2)));
    uint _1764 = uint(int(uint(int(_1762)) >> uint(2)));
    int _1766 = int(_1762) & 3;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[int(_1764)][_1766];
    int _1770 = int(_1762) + 1;
    uint _1772 = uint(int(uint(_1770) >> uint(2)));
    int _1774 = _1770 & 3;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[int(_1772)][_1774];
    float _1778 = _1630 * _1754;
    float _1780 = _1642 * _1754;
    float _1782 = _1652 * _1754;
    float _1784 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1786 = -_1778;
    float _1788 = _1630 + _1786;
    float _1790 = -_1780;
    float _1792 = _1642 + _1790;
    float _1794 = -_1782;
    float _1796 = _1652 + _1794;
    int _1798 = _1694 + 8;
    uint _1800 = uint(int(uint(_1798) >> uint(2)));
    uint _1802 = uint(int(uint(int(_1800)) >> uint(2)));
    int _1804 = int(_1800) & 3;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[int(_1802)][_1804];
    int _1808 = int(_1800) + 1;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    int _1812 = _1808 & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    float _1816 = _1788 * _1788;
    float _1818 = _782 + (-0.5);
    bool _1820 = !_1544;
    int _1822 = _1820 ? 0 : 1;
    float _1824 = _1780;
    if (_1752)
    {
        out.m_49.x = 0.0;
    }
    float _1826 = fma(_1792, _1792, _1816);
    float _1828 = -_1784;
    float _1830 = -_1350;
    float _1832 = fma(_1828, _1818, _1830);
    int _1834 = abs(_1180);
    float _1836 = -_1454;
    float _1838 = fma(_778, _1836, _1290);
    float _1840 = fma(_1796, _1796, _1826);
    int _1842 = abs(_1128);
    float _1844 = _449 + (-0.5);
    int _1846 = abs(_1570);
    int _1848 = ~_1842;
    int _1850 = _1848 + 1;
    int _1852 = _1850 + 1;
    int _1854 = ~_1834;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    int _1860 = ~_1846;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    int _1866 = abs(_1662);
    int _1868 = ~_1390;
    int _1870 = _1868 + _1486;
    int _1872 = _1870 + 1;
    int _1874 = _1852 * as_type<int>(_1710);
    int _1876 = ~_1730;
    int _1878 = _1876 + 1;
    int _1880 = _1878 + 1;
    int _1882 = ~_1456;
    int _1884 = _1882 + _1536;
    int _1886 = _1884 + 1;
    int _1888 = _1864 * as_type<int>(_1702);
    int _1890 = _1888 + _1874;
    int _1892 = abs(_1726);
    int _1894 = _471 * _1872;
    int _1896 = _1894 + _740;
    int _1898 = abs(_1822);
    int _1900 = _1858 * as_type<int>(_1746);
    int _1902 = ~_1866;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    int _1908 = _491 * _1886;
    int _1910 = _1908 + _846;
    bool _1912 = _471 == 0;
    float _1914 = float(_1720);
    int _1916 = _1906 * as_type<int>(_1738);
    int _1918 = _1916 + _1900;
    int _1920 = _1880 * as_type<int>(_1768);
    int _1922 = _1920 + _1890;
    bool _1924 = !_1498;
    int _1926 = _1924 ? 0 : 1;
    int _1928 = abs(_1750);
    int _1930 = abs(_1926);
    int _1932 = ~_1892;
    int _1934 = _1932 + 1;
    int _1936 = _1934 + 1;
    int _1938 = ~_1756;
    int _1940 = _1938 + 1;
    int _1942 = _1940 + 1;
    int _1944 = ~_1928;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    int _1950 = _1936 * as_type<int>(_1776);
    int _1952 = _1950 + _1922;
    float _1954 = float(_1898);
    int _1956 = _1942 * as_type<int>(_1806);
    int _1958 = _1956 + _1918;
    float _1960 = in.m_70.x;
    float _1962 = in.m_70.y;
    float _1964 = in.m_70.z;
    int _1966 = _1948 * as_type<int>(_1814);
    int _1968 = _1966 + _1958;
    float _1970 = sqrt(_1840);
    int _1972 = ~_1758;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    float _1978 = -_1388;
    float _1980 = _1978 + 1.0;
    int _1982 = ~_1930;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    float _1988 = _1954 * _1914;
    bool _1990 = !_1912;
    int _1992 = _1990 ? _1896 : (-1);
    int _1994 = _1952 * _1976;
    bool _1996 = !_862;
    int _1998 = _1996 ? _1910 : (-1);
    int _2000 = _1968 * _1986;
    float _2002 = fma(_782, _1980, _1832);
    int _2004 = _1992 * _1758;
    int _2006 = _2004 + _1994;
    if (_1752)
    {
        _1122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2008 = _1122;
    float _2010 = _1988 * (-2.0);
    int _2012 = _1998 * _1930;
    int _2014 = _2012 + _2000;
    bool _2016 = !_1548;
    int _2018 = _2016 ? 0 : 1;
    out.m_72.x = _1838;
    out.m_72.y = _2002;
    float _2020 = _1678 * _1970;
    int _2022 = as_type<int>(_2008);
    if (_1752)
    {
        float _2024 = _2008 * 5.0;
        _2022 = as_type<int>(_2024);
    }
    int _2026 = _2022;
    float _2028 = float(_2006);
    float _2030 = fma(_2010, _1960, _1960);
    float _2032 = float(_2014);
    float _2034 = _455 * _2020;
    if (_1752)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6482 = as_type<float>(_2026);
        out.gl_Position.z = _6482;
    }
    float _2036 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2030);
    float _2038 = _451 + _664;
    float _2040 = float(_1470);
    out.m_74.x = _2028;
    out.m_74.y = _2032;
    float _2042 = fma(_1648, _2010, _1648);
    float _2044 = _2038 + (-1.0);
    out.m_76.x = _2034;
    bool _2046 = !_1552;
    int _2048 = _2046 ? 0 : 1;
    int _2050 = abs(_2018);
    if (_1752)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2052 = -_1778;
    float _2054 = _1616 + _2052;
    int _2056 = abs(_2048);
    float _2058 = -_1780;
    float _2060 = _1626 + _2058;
    float _2062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2064 = _2054 + _2062;
    float _2066 = -_1782;
    float _2068 = _1636 + _2066;
    float _2070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2072 = _2060 + _2070;
    float _2074 = float(_2050);
    float _2076 = _2064 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2078 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2080 = _2068 + _2078;
    float _2082 = float(_1528);
    float _2084 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2086 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2076);
    float _2088 = _2074 * _2040;
    float _2090 = float(_2056);
    float _2092 = _451 + (-0.5);
    float _2094 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2086);
    float _2096 = _2088 * (-2.0);
    float _2098 = _664 + _449;
    float _2100 = _2090 * _2082;
    float _2102 = fma(_2042, _1394, _2036);
    bool _2104 = _2094 >= 0.0;
    float _2106 = fma(_2096, _1962, _1962);
    float _2108 = fma(_2084, _2096, _2084);
    float _2110 = _2098 + (-1.0);
    float _2112 = fma(_2092, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2106);
    float _2114 = _2100 * (-2.0);
    float _2116 = _2102 * 0.15915493667125701904296875;
    float _2118 = fma(_2110, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2120 = fma(_2108, _1394, _2112);
    float _2122 = fma(_2114, _1964, _1964);
    float _2124 = _664 + (-0.5);
    float _2126 = _2116 * 6.283185482025146484375;
    float _2128 = sin(_2126);
    float _2130 = _2120 * 0.15915493667125701904296875;
    float _2132 = _2084;
    float _2134 = _2072;
    float _2136 = _2080;
    if (_2104)
    {
        _2132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2138 = _2132;
    float _2140 = fma(_2118, _2114, _2118);
    float _2142 = fma(_2124, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2122);
    int _2144 = as_type<int>(_2138);
    if (_2104)
    {
        out.m_49.x = 0.0;
    }
    if (_2104)
    {
        float _2146 = _2138 * 5.0;
        _2144 = as_type<int>(_2146);
    }
    int _2148 = _2144;
    float _2150 = _2116 * 6.283185482025146484375;
    float _2152 = cos(_2150);
    float _2154 = fma(_2140, _1394, _2142);
    if (_2104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6685 = as_type<float>(_2148);
        out.gl_Position.z = _6685;
    }
    float _2156 = _2154 * 0.15915493667125701904296875;
    float _2158 = _2130 * 6.283185482025146484375;
    float _2160 = sin(_2158);
    float _2162 = _2130 * 6.283185482025146484375;
    float _2164 = cos(_2162);
    if (_2104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2166 = _2156 * 6.283185482025146484375;
    float _2168 = cos(_2166);
    float _2170 = _323 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2174 = _2128 * _2160;
    float _2176 = _2152 * _2164;
    float _2178 = _2170 * _2020;
    float _2180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2182 = _2128 * _2164;
    float _2184 = _2156 * 6.283185482025146484375;
    float _2186 = sin(_2184);
    float _2188 = _2178 * _2172;
    float _2190 = _2152 * _2160;
    float _2192 = _2020 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2194 = _2192 * 0.5;
    float _2196 = _2152 * _2168;
    float _2198 = _2164 * _2168;
    float _2200 = _2128 * _2168;
    float _2202 = _2160 * _2168;
    float _2204 = _2034 * _2180;
    float _2206 = _2196 * _2188;
    float _2208 = fma(_2186, _2176, _2174);
    float _2210 = -_2182;
    float _2212 = fma(_2186, _2190, _2210);
    float _2214 = -_2188;
    float _2216 = _2186 * _2214;
    float _2218 = -_2190;
    float _2220 = fma(_2186, _2182, _2218);
    float _2222 = fma(_2208, _2204, _2206);
    float _2224 = _2200 * _2188;
    float _2226 = fma(_2198, _2204, _2216);
    float _2228 = fma(_2212, _2194, _2222);
    float _2230 = fma(_2186, _2174, _2176);
    float _2232 = fma(_2220, _2204, _2224);
    float _2234 = fma(_2202, _2194, _2226);
    float _2236 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2238 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2240 = fma(_2230, _2194, _2232);
    float _2242 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2236);
    float _2244 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2238);
    float _2246 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2242);
    float _2248 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2244);
    float _2250 = _2246 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2252 = _2248 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2254 = _1636 + _2250;
    float _2256 = _1626 + _2252;
    float _2258 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2260 = _2054 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2264 = _2254 + _2262;
    float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2268 = _2256 + _2266;
    float _2270 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2258);
    float _2272 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2260);
    float _2274 = _2264 * _2264;
    float _2276 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2270);
    float _2278 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2272);
    float _2280 = fma(_2268, _2268, _2274);
    float _2282 = _2276 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2284 = sqrt(_2280);
    float _2286 = _1616 + _2282;
    bool _2288 = _2284 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2290 = _2276;
    float _2292 = _2282;
    float _2294 = _2260;
    float _2296 = _2204;
    if (!_2288)
    {
        _2290 = _2256;
    }
    float _2298 = _2290;
    float _2300 = _2298;
    if (!_2288)
    {
        _2292 = _2254;
    }
    float _2302 = _2292;
    float _2304 = _2302;
    if (!_2288)
    {
        _2294 = _2286;
    }
    float _2306 = _2294;
    bool _2308 = !_2288;
    float _2310 = _2306;
    if (!_2308)
    {
        float _2312 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2316 = _2284 + _2314;
        float _2318 = rsqrt(_2280);
        float _2320 = _2316 * _2312;
        float _2322 = _2286 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2324 = _2320 * 0.15915493667125701904296875;
        float _2326 = _2324 * 6.283185482025146484375;
        float _2328 = cos(_2326);
        float _2330 = _2324 * 6.283185482025146484375;
        float _2332 = sin(_2330);
        float _2334 = _2328 + (-1.0);
        float _2336 = fma(_2332, _2322, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2338 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2340 = _2318 * _2336;
        float _2342 = fma(_2286, _2328, _2338);
        float _2344 = fma(_2268, _2340, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2346 = fma(_2264, _2340, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2310 = _2342;
        _2300 = _2344;
        _2304 = _2346;
        _2296 = _2324;
    }
    float _2348 = _2310;
    float _2350 = _2300;
    float _2352 = _2304;
    float _2354 = _2296;
    float _2356 = -_1616;
    float _2358 = _2356 + _2348;
    float _2360 = -_1626;
    float _2362 = _2360 + _2350;
    float _2364 = -_1636;
    float _2366 = _2364 + _2352;
    float _2368 = _2278 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2370 = _2358 * _2358;
    float _2372 = _2054 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2374 = 1.0 / _2368;
    float _2376 = fma(_2362, _2362, _2370);
    float _2378 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2372);
    bool _2380 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2382 = isnan(0.5);
    bool _2384 = _2380 || _2382;
    bool _2386 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2388 = _2384 || _2386;
    float _2390 = fma(_2366, _2366, _2376);
    float _2392 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2378);
    bool _2394 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2396 = isnan(0.5);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2402 = _2398 || _2400;
    float _2404 = sqrt(_2390);
    float _2406 = _2392 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2408 = _2406 + _2368;
    float _2410 = _2408 * _2374;
    float _2412 = _2410 * 0.5;
    bool _2414 = _2404 > 0.0;
    float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2418 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2416);
    float _2420 = 1.0 / _2418;
    float _2422 = _2412;
    float _2424 = _2374;
    float _2426 = _2354;
    if (!_2414)
    {
        _2422 = _2350;
    }
    float _2428 = _2422;
    float _2430 = _2428;
    if (!_2414)
    {
        _2424 = _2348;
    }
    float _2432 = _2424;
    float _2434 = _2432;
    if (!_2414)
    {
        _2426 = _2352;
    }
    float _2436 = _2426;
    bool _2438 = !_2414;
    float _2440 = _2436;
    float _2442 = _2436;
    if (!_2438)
    {
        float _2444 = _211 * _211;
        float _2446 = fma(_209, _209, _2444);
        float _2448 = rsqrt(_2390);
        float _2450 = fma(_213, _213, _2446);
        float _2452 = sqrt(_2450);
        float _2454 = _2362 * _2448;
        float _2456 = _2358 * _2448;
        float _2458 = _2366 * _2448;
        bool _2460 = _2452 > 0.0;
        float _2462 = _2448;
        float _2464 = _2452;
        if (!_2460)
        {
            _2462 = _2350;
        }
        float _2466 = _2462;
        _2430 = _2466;
        if (!_2460)
        {
            _2464 = _2348;
        }
        float _2468 = _2464;
        _2434 = _2468;
        if (!_2460)
        {
            _2440 = _2352;
        }
        float _2470 = _2440;
        bool _2472 = !_2460;
        _2442 = _2470;
        if (!_2472)
        {
            float _2474 = rsqrt(_2450);
            float _2476 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2478 = _211 * _2474;
            float _2480 = _209 * _2474;
            float _2482 = _2456 * _2478;
            float _2484 = _213 * _2474;
            float _2486 = fma(_2454, _2480, _2482);
            float _2488 = _2476 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2490 = fma(_2458, _2484, _2486);
            float _2492 = _2490 * _2488;
            float _2494 = fma(_209, _2492, _2350);
            float _2496 = fma(_211, _2492, _2348);
            float _2498 = fma(_213, _2492, _2352);
            _2430 = _2494;
            _2434 = _2496;
            _2442 = _2498;
        }
    }
    float _2500 = _2430;
    float _2502 = _2434;
    float _2504 = _2442;
    float _2506 = -_1780;
    float _2508 = _2506 + _2500;
    float _2510 = -_1778;
    float _2512 = _2510 + _2502;
    float _2514 = -_1782;
    float _2516 = _2514 + _2504;
    float _2518 = _2512;
    float _2520 = _2508;
    float _2522 = _2516;
    if (_2402)
    {
        _221 = 1.0;
    }
    float _2524 = _221;
    float _2526 = _2524;
    if (!_2388)
    {
        float _2528 = _2064 * _2064;
        float _2530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2532 = -_1636;
        float _2534 = _2532 + _2504;
        float _2536 = -_1616;
        float _2538 = _2536 + _2502;
        float _2540 = fma(_2072, _2072, _2528);
        float _2542 = fma(_2080, _2080, _2540);
        float _2544 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2546 = sqrt(_2542);
        float _2548 = 1.0 / _2020;
        float _2550 = precise::min(_2546, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2552 = _2550 * _2530;
        float _2554 = _2544 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2556 = -_1626;
        float _2558 = _2556 + _2500;
        float _2560 = _2552 * _2548;
        float _2562 = _2554 * _2560;
        float _2564 = _2534 * _2560;
        float _2566 = fma(_2538, _2562, _2054);
        float _2568 = fma(_2558, _2562, _2060);
        float _2570 = fma(_2554, _2564, _2068);
        _2518 = _2566;
        _2520 = _2568;
        _2522 = _2570;
        _2134 = _2546;
        _1714 = _2564;
    }
    float _2572 = _2518;
    float _2574 = _2520;
    float _2576 = _2522;
    float _2578 = _2134;
    float _2580 = _1714;
    float _2582 = _2578;
    float _2584 = _2580;
    if (_2402)
    {
        _1824 = 1.0;
    }
    float _2586 = _1824;
    float _2588 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2590 = _2420 * _2588;
    float _2592 = _2586;
    if (!_2402)
    {
        float _2594 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2596 = _2594 * 0.15915493667125701904296875;
        float _2598 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2602 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2600;
        float _2604 = _2596 * 6.283185482025146484375;
        float _2606 = cos(_2604);
        float _2608 = _2598 * 0.15915493667125701904296875;
        float _2610 = _2596 * 6.283185482025146484375;
        float _2612 = sin(_2610);
        float _2614 = 1.0 / _2606;
        float _2616 = _2608 * 6.283185482025146484375;
        float _2618 = cos(_2616);
        float _2620 = _2612 * _2614;
        float _2622 = _2608 * 6.283185482025146484375;
        float _2624 = sin(_2622);
        float _2626 = _2618 * _2620;
        float _2628 = 1.0 / _2602;
        float _2630 = 1.0 / _2626;
        float _2632 = _2624 * _2630;
        float _2634 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2636 = fma(_2590, _2632, _2634);
        float _2638 = _2636 * _2628;
        float _2640 = precise::clamp(_2638, 0.0, 1.0);
        _2136 = _2608;
        _2582 = _2620;
        _2526 = _2640;
    }
    float _2642 = _2136;
    float _2644 = _2582;
    float _2646 = _2526;
    float _2648 = _2642;
    float _2650 = _2644;
    if (!_2402)
    {
        float _2652 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2654 = _2652 * 0.15915493667125701904296875;
        float _2656 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2658 = _2654 * 6.283185482025146484375;
        float _2660 = cos(_2658);
        float _2662 = _2656 * 0.15915493667125701904296875;
        float _2664 = _2654 * 6.283185482025146484375;
        float _2666 = sin(_2664);
        float _2668 = 1.0 / _2660;
        float _2670 = _2662 * 6.283185482025146484375;
        float _2672 = cos(_2670);
        float _2674 = _2666 * _2668;
        float _2676 = _2662 * 6.283185482025146484375;
        float _2678 = sin(_2676);
        float _2680 = _2672 * _2674;
        float _2682 = 1.0 / _2680;
        float _2684 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2686 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2684;
        float _2688 = 1.0 / _2686;
        float _2690 = _2678 * _2682;
        float _2692 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2694 = fma(_2590, _2690, _2692);
        float _2696 = _2694 * _2688;
        float _2698 = precise::clamp(_2696, 0.0, 1.0);
        float _2700 = -_2698;
        float _2702 = _2700 + 1.0;
        _2648 = _2668;
        _2650 = _2680;
        _2592 = _2702;
    }
    float _2704 = _2648;
    float _2706 = _2650;
    float _2708 = _2592;
    float _2710 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2712 = _2572 + _2710;
    float _2714 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2716 = _2574 + _2714;
    float _2718 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2720 = _2576 + _2718;
    float _2722 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2724 = _2712 * _2712;
    float _2726 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2722);
    float _2728 = fma(_2716, _2716, _2724);
    float _2730 = fma(_2720, _2720, _2728);
    float _2732 = rsqrt(_2730);
    float _2734 = sqrt(_2730);
    float _2736 = _2732 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2738 = _2716 * _2736;
    float _2740 = _2720 * _2736;
    float _2742 = _2738 * _2738;
    float _2744 = _2740 * _2740;
    float _2746 = _2742 + _2744;
    float _2748 = sqrt(_2746);
    bool _2750 = _2748 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2754 = _2748 + _2752;
    float _2756 = _2704;
    float _2758 = _2746;
    float _2760 = _2754;
    float _2762 = _2706;
    float _2764 = _2712;
    if (_2750)
    {
        float _2766 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2756 = _2766;
    }
    float _2768 = _2756;
    if (_2750)
    {
        float _2770 = rsqrt(_2746);
        _2758 = _2770;
    }
    float _2772 = _2758;
    float _2774 = _2772;
    if (_2750)
    {
        float _2776 = _2754 * _2768;
        _2760 = _2776;
    }
    float _2778 = _2760;
    if (_2750)
    {
        float _2780 = _2778 * 0.15915493667125701904296875;
        _2762 = _2780;
    }
    float _2782 = _2762;
    float _2784 = _2720;
    float _2786 = _2782;
    if (_2750)
    {
        float _2788 = _2782 * 6.283185482025146484375;
        float _2790 = sin(_2788);
        _2784 = _2790;
    }
    float _2792 = _2784;
    float _2794 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2796 = precise::max(0.0, _2794);
    float _2798 = _2768;
    if (_2750)
    {
        float _2800 = _2782 * 6.283185482025146484375;
        float _2802 = cos(_2800);
        _2798 = _2802;
    }
    float _2804 = _2798;
    float _2806 = -_2736;
    float _2808 = -_2796;
    float _2810 = fma(_2712, _2806, _2808);
    float _2812 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2750)
    {
        float _2814 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2764 = _2814;
    }
    float _2816 = _2764;
    float _2818 = _2816;
    if (!_2750)
    {
        _2786 = _2738;
    }
    float _2820 = _2786;
    float _2822 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2824 = _2792;
    float _2826 = _2820;
    if (_2750)
    {
        float _2828 = fma(_2792, _2816, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2824 = _2828;
    }
    float _2830 = _2824;
    float _2832 = _2830;
    if (!_2750)
    {
        _2818 = _2810;
    }
    float _2834 = _2818;
    float _2836 = _2834;
    float _2838 = _2804;
    if (_2750)
    {
        float _2840 = _2804 + (-1.0);
        _2812 = _2840;
    }
    float _2842 = _2812;
    float _2844 = _2842;
    if (_2750)
    {
        float _2846 = _2772 * _2830;
        _2584 = _2846;
    }
    float _2848 = _2584;
    if (!_2750)
    {
        _2774 = _2740;
    }
    float _2850 = _2774;
    float _2852 = _2850;
    if (_2750)
    {
        float _2854 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2844 = _2854;
    }
    float _2856 = _2844;
    if (_2750)
    {
        float _2858 = _2738 * _2848;
        _2826 = _2858;
    }
    float _2860 = _2826;
    if (!_2750)
    {
        _2832 = _2742;
    }
    float _2862 = _2832;
    float _2864 = _2862;
    if (_2750)
    {
        float _2866 = _2740 * _2848;
        _2852 = _2866;
    }
    float _2868 = _2852;
    if (_2750)
    {
        float _2870 = fma(_2810, _2804, _2856);
        _2836 = _2870;
    }
    float _2872 = _2836;
    if (_2750)
    {
        float _2874 = _2860 * _2860;
        _2864 = _2874;
    }
    float _2876 = _2864;
    if (!_2750)
    {
        _2838 = _2744;
    }
    float _2878 = _2838;
    float _2880 = _2878;
    if (_2750)
    {
        float _2882 = _2868 * _2868;
        _2880 = _2882;
    }
    float _2884 = _2880;
    float _2886 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2888 = fma(_2872, _2872, _2876);
    float _2890 = floor(_2822);
    float _2892 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2886);
    float _2894 = _2888 + _2884;
    float _2896 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2898 = fma(_2734, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2896);
    float _2900 = precise::clamp(_2898, 0.0, 1.0);
    float _2902 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2892);
    float _2904 = rsqrt(_2894);
    float _2906 = -_2900;
    float _2908 = _2906 + 1.0;
    float _2910 = _2902 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2912 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2914 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2916 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2918 = abs(_2908);
    float _2920 = log2(_2918);
    float _2922 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2924 = _2910 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2926 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2914);
    float _2928 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2922);
    float _2930 = -_2924;
    float _2932 = fma(_2930, _2916, 1.0);
    float _2934 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2926);
    float _2936 = _2904 * _2860;
    float _2938 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2928);
    float _2940 = _2904 * _2872;
    float _2942 = _2904 * _2868;
    float _2944 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2946 = _2938 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2948 = _2934 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2950 = floor(_2912);
    float _2952 = -_2944;
    float _2954 = fma(_2940, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2952);
    float _2956 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2958 = _2920 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2960 = -_2942;
    float _2962 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2954);
    float _2964 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2726);
    float _2966 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2956);
    float _2968 = exp2(_2958);
    float _2970 = fma(_2962, -0.5, 0.5);
    float _2972 = _2964 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2974 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2966);
    float _2976 = fma(_2962, 0.5, 0.5);
    float _2978 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2980 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2974);
    float _2982 = log2(_2932);
    float _2984 = -_2950;
    float _2986 = _2912 + _2984;
    float _2988 = fma(_2976, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2990 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2978);
    float _2992 = fma(_2976, _2988, -0.212114393711090087890625);
    float _2994 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2990);
    float _2996 = 1.0 / _2980;
    float _2998 = -_2890;
    float _3000 = _2822 + _2998;
    float _3002 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3004 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3002);
    float _3006 = _2940 + 1.0;
    float _3008 = sqrt(_2970);
    float _3010 = _2982 * 0.693147182464599609375;
    float _3012 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3004);
    float _3014 = -_2940;
    float _3016 = fma(_2968, _3006, _3014);
    float _3018 = fma(_2976, _2992, 1.570728778839111328125);
    float2 _8038 = float2(_3000, _2986);
    float _3020 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8038, float2(0.0), isnan(_8038)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8038, float2(0.0), isnan(_8038)), level(0.0)).x;
    float _3022 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3012);
    float _3024 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2994);
    float _3026 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3028 = fma(_3016, 0.5, 0.5);
    float _3030 = _3022 * _2996;
    float _3032 = _3024 * _2996;
    float _3034 = fma(_3030, 0.5, 0.5);
    float _3036 = fma(_3032, -0.5, 0.5);
    float _3038 = _3008 * 0.636619746685028076171875;
    float _3040 = -_3018;
    float _3042 = fma(_3038, _3040, 1.0);
    float3 _8083 = float3(_3034, _3036, _3026);
    float _3044 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8083, float3(0.0), isnan(_8083)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8083, float3(0.0), isnan(_8083)), level(0.0)).x;
    float3 _8094 = float3(_3034, _3036, _3026);
    float4 _3047 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8094, float3(0.0), isnan(_8094)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8094, float3(0.0), isnan(_8094)), level(0.0)).xyzw;
    float _3049 = _3047.x;
    float _3051 = _3047.y;
    float _3053 = _3047.z;
    float _3055 = _3047.w;
    float2 _8110 = float2(_3042, _3028);
    float3 _3059 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8110, float2(0.0), isnan(_8110)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8110, float2(0.0), isnan(_8110)), level(0.0)).xyz;
    float _3061 = _3059.x;
    float _3063 = _3059.y;
    float _3065 = _3059.z;
    float _3067 = abs(_2590);
    float _3069 = log2(_3067);
    float _3071 = _2208 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3073 = _2208 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3075 = _2208 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3077 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3079 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3071);
    float _3081 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3073);
    float _3083 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3075);
    float _3085 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3087 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3089 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3091 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3093 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3095 = -_2186;
    float _3097 = fma(_3095, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3077);
    float _3099 = -_2186;
    float _3101 = fma(_3099, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3087);
    float _3103 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3105 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3107 = -_2186;
    float _3109 = fma(_3107, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3085);
    float _3111 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3089);
    float _3113 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3091);
    float _3115 = exp2(_3105);
    float _3117 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3093);
    float _3119 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3109);
    float _3121 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3111);
    float _3123 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3113);
    float _3125 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3117);
    float _3127 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3079);
    float _3129 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3097);
    float _3131 = fma(_3103, _3103, 1.0);
    float _3133 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3135 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3101);
    float _3137 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3139 = rsqrt(_3131);
    float _3141 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3081);
    float _3143 = _2920 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3145 = fma(_3115, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3147 = precise::clamp(_3145, 0.0, 1.0);
    float _3149 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3083);
    float _3151 = _3103 * _3129;
    float _3153 = _3147 * _3147;
    float _3155 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3137);
    float _3157 = fma(_3147, -2.0, 3.0);
    float _3159 = _3103 * _3119;
    float _3161 = exp2(_3143);
    float _3163 = fma(_3133, _3141, _3151);
    float _3165 = _3153 * _3157;
    float _3167 = fma(_3133, _3127, _3159);
    float _3169 = _3103 * _3135;
    float _3171 = _3103 * _3139;
    float _3173 = -_3165;
    float _3175 = _3173 + 1.0;
    out.m_78.x = _3127;
    out.m_78.y = _3141;
    out.m_78.z = _3149;
    float _3177 = fma(_3133, _3149, _3169);
    float _3179 = -_3121;
    float _3181 = _3171 * _3179;
    float _3183 = fma(_3175, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3165);
    float _3185 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3155);
    float _3187 = in.m_80.x;
    float _3189 = fma(_3139, _3119, _3181);
    float _3191 = _3121 + _3167;
    float _3193 = _3123 + _3163;
    float _3195 = -_3161;
    float _3197 = _3195 + 1.0;
    out.m_82.x = _2574;
    out.m_82.y = _2572;
    out.m_82.z = _2576;
    bool _3199 = _2734 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3201 = isnan(_2734);
    bool _3203 = _3199 || _3201;
    bool _3205 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3207 = _3203 || _3205;
    float _3209 = -_3123;
    float _3211 = _3171 * _3209;
    float _3213 = -_3125;
    float _3215 = _3171 * _3213;
    float _3217 = _3197 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3219 = fma(_3139, _3129, _3211);
    bool _3221 = _2590 <= 8000.0;
    bool _3223 = isnan(_2590);
    bool _3225 = _3221 || _3223;
    bool _3227 = isnan(8000.0);
    bool _3229 = _3225 || _3227;
    float _3231 = float(_3229);
    float _3233 = fma(_3139, _3135, _3215);
    float _3235 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3185);
    float _3237 = _2980 * 0.5;
    float _3239 = _3022 + _2980;
    float _3241 = _3231 * _3183;
    out.m_84.x = _3189;
    out.m_84.y = _3219;
    out.m_84.z = _3233;
    float _3243 = _3235 + _2980;
    float _3245 = fma(_3024, -0.5, _3237);
    float _3247 = _3241 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3022;
    out.gl_Position.y = _3024;
    out.gl_Position.z = _3235;
    out.gl_Position.w = _2980;
    float _3249 = _3243 * 0.5;
    float _3251 = _3125 + _3177;
    float _3253 = _3239 * 0.5;
    out.m_86.x = _3191;
    out.m_86.y = _3193;
    out.m_86.z = _3251;
    float _3255 = _3123;
    float _3257 = _3233;
    float _3259 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3207)
    {
        _3255 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3261 = _3255;
    float _3263 = _3261;
    float _3265 = _3261;
    if (!_3207)
    {
        _3257 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3267 = _3257;
    out.m_88.z = _3249;
    out.m_88.w = _2980;
    out.m_90.x = _3253;
    out.m_90.y = _3245;
    out.m_90.z = _3249;
    out.m_90.w = _2980;
    float _3269 = -_3020;
    float _3271 = _3269 + 1.0;
    float _3273 = _3271 * _3247;
    float _3275 = precise::clamp(_3273, 0.0, 1.0);
    float _3277 = -_3275;
    float _3279 = fma(_3277, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3281 = _3051;
    float _3283 = _3267;
    float _3285 = _3267;
    if (!_3207)
    {
        _3259 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3287 = _3259;
    float _3289 = _3279 * _3187;
    float _3291 = _3289 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3293 = _3217 * _3044;
    float _3295 = -_3217;
    float _3297 = _3295 + 1.0;
    float _3299 = _3055 * _3293;
    float _3301 = _3065 * _3293;
    float _3303 = _3055 * _3297;
    out.m_92.x = _3291;
    float _3305 = fma(_3061, _3299, _3049);
    float _3307 = fma(_3063, _3299, _3051);
    float _3309 = fma(_3055, _3301, _3053);
    float _3311 = _2646 * _2708;
    float _3313 = _3293;
    float _3315 = _3311;
    float _3317 = _3287;
    float _3319 = _3287;
    if (!_3207)
    {
        _3313 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3321 = _3313;
    float _3323 = _3321;
    float _3325 = _3321;
    if (!_3207)
    {
        _3281 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3327 = _3281;
    out.m_94.x = _3305;
    out.m_94.y = _3307;
    out.m_94.z = _3309;
    out.m_94.w = _3303;
    float _3329 = _3311 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3331 = _3327;
    float _3333 = _3327;
    if (!_3207)
    {
        _3315 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3335 = _3315;
    bool _3337 = !_3207;
    float _3339 = _3335;
    float _3341 = _3335;
    if (!_3337)
    {
        bool _3343 = _2734 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3345 = isnan(_2734);
        bool _3347 = _3343 || _3345;
        bool _3349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3351 = _3347 || _3349;
        if (!_3351)
        {
            float _3353 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3355 = _2734 + _3353;
            float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3359 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3357;
            float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3365 = 1.0 / _3359;
            float _3367 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3369 = _3367 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3371 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3373 = _3371 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3375 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3377 = _3375 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3379 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3381 = _3379 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3383 = _3355 * _3365;
            float _3385 = precise::clamp(_3383, 0.0, 1.0);
            float _3387 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3389 = _3387 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3391 = fma(_3385, _3363, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3393 = fma(_3385, _3389, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3395 = fma(_3385, _3369, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3397 = fma(_3385, _3373, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3399 = fma(_3385, _3377, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3401 = fma(_3385, _3381, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3285 = _3395;
            _3333 = _3399;
            _3265 = _3391;
            _3325 = _3397;
            _3319 = _3393;
            _3341 = _3401;
            _3403 = true;
        }
        else
        {
            bool _3405 = _2734 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3407 = isnan(_2734);
            bool _3409 = _3405 || _3407;
            bool _3411 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3413 = _3409 || _3411;
            if (!_3413)
            {
                _3263 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3415 = _3263;
            _3265 = _3415;
            if (!_3413)
            {
                _3283 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3417 = _3283;
            _3285 = _3417;
            if (!_3413)
            {
                _3317 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3419 = _3317;
            _3319 = _3419;
            if (!_3413)
            {
                _3323 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3421 = _3323;
            _3325 = _3421;
            if (!_3413)
            {
                _3331 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3423 = _3331;
            _3333 = _3423;
            if (!_3413)
            {
                _3339 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3425 = _3339;
            bool _3427 = !_3413;
            _3341 = _3425;
            if (!_3427)
            {
                bool _3429 = _2734 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3431 = isnan(_2734);
                bool _3433 = _3429 || _3431;
                bool _3435 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3437 = _3433 || _3435;
                if (!_3437)
                {
                    float _3439 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3441 = _2734 + _3439;
                    float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3445 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3443;
                    float _3447 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3449 = _3447 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3451 = 1.0 / _3445;
                    float _3453 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3455 = _3453 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3457 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3459 = _3457 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3461 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3463 = _3461 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3465 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3467 = _3465 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3469 = _3441 * _3451;
                    float _3471 = precise::clamp(_3469, 0.0, 1.0);
                    float _3473 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3475 = _3473 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3477 = fma(_3471, _3449, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3479 = fma(_3471, _3475, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3481 = fma(_3471, _3455, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3483 = fma(_3471, _3459, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3485 = fma(_3471, _3463, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3487 = fma(_3471, _3467, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3285 = _3481;
                    _3333 = _3485;
                    _3265 = _3477;
                    _3325 = _3483;
                    _3319 = _3479;
                    _3341 = _3487;
                    _3403 = true;
                }
                else
                {
                    _3285 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3333 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3265 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3325 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3319 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3341 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3403 = false;
    float _3489 = _3285;
    float _3491 = _3333;
    float _3493 = _3265;
    float _3495 = _3325;
    float _3497 = _3319;
    float _3499 = _3341;
    float _3501 = fma(_3193, -0.5, 0.5);
    float _3503 = precise::clamp(_3501, 0.0, 1.0);
    float _3505 = -_3489;
    float _3507 = _3505 + _3491;
    float _3509 = _3329 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3511 = -_3493;
    float _3513 = _3511 + _3495;
    float _3515 = fma(_3503, _3507, _3489);
    out.m_96.x = 0.0;
    float _3517 = -_3497;
    float _3519 = _3517 + _3499;
    float _3521 = fma(_3503, _3513, _3493);
    float _3523 = _3515 * 0.586610972881317138671875;
    out.m_49.x = _3509;
    bool _3525 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3527 = fma(_3503, _3519, _3497);
    float _3529 = fma(_3521, 0.298911988735198974609375, _3523);
    bool _3531 = _2646 > 0.0;
    bool _3533 = isnan(_2646);
    bool _3535 = _3531 || _3533;
    bool _3537 = isnan(0.0);
    bool _3539 = _3535 || _3537;
    float _3541 = fma(_3527, 0.114477999508380889892578125, _3529);
    bool _3543 = _2708 <= 0.0;
    bool _3545 = !_3539;
    bool _3547 = _3543 || _3545;
    float _3549 = -_3541;
    float _3551 = _3515 + _3549;
    float _3553 = -_3541;
    float _3555 = _3521 + _3553;
    float _3557 = -_3541;
    float _3559 = _3527 + _3557;
    float _3561 = fma(_3551, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3541);
    float _3563 = fma(_3555, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3541);
    float _3565 = fma(_3559, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3541);
    bool _3567 = !_3525;
    if (!_3567)
    {
        float _3569 = -_2572;
        float _3571 = _3569 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3573 = -_2574;
        float _3575 = _3573 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3577 = -_2576;
        float _3579 = _3577 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3581 = _3571 * _3571;
        float _3583 = fma(_3575, _3575, _3581);
        float _3585 = fma(_3579, _3579, _3583);
        float _3587 = sqrt(_3585);
        float _3589 = rsqrt(_3585);
        float _3591 = -_3587;
        float _3593 = _3591 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3595 = _3593 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3597 = precise::clamp(_3595, 0.0, 1.0);
        float _3599 = _3575 * _3589;
        float _3601 = _3571 * _3589;
        float _3603 = abs(_3597);
        float _3605 = log2(_3603);
        float _3607 = _3579 * _3589;
        float _3609 = _3599 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3611 = _3193 * _3601;
        float _3613 = -_3601;
        float _3615 = -_3609;
        float _3617 = fma(_3613, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3615);
        float _3619 = fma(_3191, _3599, _3611);
        float _3621 = -_3607;
        float _3623 = fma(_3621, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3617);
        float _3625 = fma(_3251, _3607, _3619);
        float _3627 = precise::clamp(_3625, 0.0, 1.0);
        float _3629 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3631 = _3623 + _3629;
        float _3633 = _3605 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3635 = _3631 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3637 = precise::clamp(_3635, 0.0, 1.0);
        float _3639 = exp2(_3633);
        float _3641 = _3639 * _3637;
        float _3643 = _3627 * _3641;
        float _3645 = _3643 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3647 = _3643 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3649 = _3643 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3645;
        out.m_96.y = _3647;
        out.m_96.z = _3649;
    }
    out.m_98.x = _3563;
    out.m_98.y = _3561;
    out.m_98.z = _3565;
    if (!_3547)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3651 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3651;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

