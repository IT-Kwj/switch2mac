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
    float4 m_67 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_97 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_87 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_83 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
    float4 m_73 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2696 = false;
    bool _348 = false;
    bool _240 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = in.m_48.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _122;
    bool _126 = _118 >= 1;
    float _128 = 0.0;
    float _130 = _113;
    float _132 = _122;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _128;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _136 = 0;
    if (!_126)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2960 = as_type<float>(_140);
        out.gl_Position.z = _2960;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _144 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_113);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = float(_118);
    bool _156 = _122 >= _154;
    bool _158 = !_152;
    bool _160 = _156 || _158;
    if (_160)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _130;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _142 = as_type<int>(_164);
    }
    int _166 = _142;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3015 = as_type<float>(_166);
        out.gl_Position.z = _3015;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = 1.0 / _154;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = in.m_57.x;
    float _180 = in.m_57.y;
    float _182 = in.m_57.z;
    float _184 = in.m_59.x;
    float _186 = in.m_59.y;
    float _188 = in.m_59.z;
    float _190 = in.m_61.x;
    float _192 = in.m_61.y;
    float _194 = in.m_61.z;
    float _196 = _122 * _174;
    float _198 = _170 * _180;
    float _200 = _170 * _186;
    float _202 = fma(_168, _178, _198);
    float _204 = _170 * _192;
    float _206 = fma(_168, _184, _200);
    float _208 = fma(_172, _182, _202);
    float _210 = fma(_168, _190, _204);
    float _212 = fma(_172, _188, _206);
    float _214 = fma(_172, _194, _210);
    bool _216 = !_176;
    float _218 = _196;
    float _220 = _212;
    float _238;
    if (!_216)
    {
        float _222 = in.m_63.x;
        float _224 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _226 = _222 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _228 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _230 = _228 * _224;
        float _232 = floor(_230);
        float _234 = -_232;
        float _236 = _230 + _234;
        _238 = _236;
        _240 = true;
    }
    else
    {
        _238 = _196;
    }
    _240 = false;
    float _242 = _238;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = _242 + _244;
    bool _248 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _250 = isnan(_242);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _260;
    bool _264 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _266 = isnan(_242);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -_258;
    float _278 = _276 + 1.0;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _280;
    float _284 = 1.0 / _262;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _288 = _246 * _284;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _290;
    float _294 = _274 * _278;
    float _296 = fma(_282, _288, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = -_274;
    float _300 = _298 + 1.0;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _302;
    float _306 = fma(_292, _288, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _308 = _296 * _294;
    float _310 = fma(_304, _288, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _312 = _306 * _294;
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[143].x, _308);
    float _316 = _310 * _294;
    float _318 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[143].z, _312);
    float _320 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[143].y, _316);
    float _322 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[144].x, _314);
    float _324 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[144].y, _320);
    float _326 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[144].z, _318);
    bool _328 = !_286;
    float _346;
    if (!_328)
    {
        float _330 = in.m_63.x;
        float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _334 = _330 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _338 = _336 * _332;
        float _340 = floor(_338);
        float _342 = -_340;
        float _344 = _338 + _342;
        _346 = _344;
        _348 = true;
    }
    else
    {
        _346 = _196;
    }
    _348 = false;
    float _350 = _346;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _354 = _350 + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _360 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _362 = isnan(_350);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _380 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _382 = isnan(_350);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = 1.0 / _358;
    float _394 = -_370;
    float _396 = _394 + 1.0;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _398;
    bool _402 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _404 = isnan(_350);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = _390 * _396;
    float _416 = -_390;
    float _418 = _416 + 1.0;
    bool _420 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _422 = 1.0 / _374;
    float _424 = _412 * _418;
    float _426 = -_412;
    float _428 = _426 + 1.0;
    float _430 = 1.0 / _378;
    float _432 = _400 * _392;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _438 = fma(_432, _354, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _440 = _436 * _422;
    bool _442 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _444 = isnan(_350);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _460 = _350 + _458;
    float _462 = _438 * _424;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _466 = _350 + _464;
    float _468 = -_452;
    float _470 = _468 + 1.0;
    float _472 = fma(_440, _460, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _474 = _456 * _430;
    float _476 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[115].x, _462);
    float _478 = _370 * _470;
    float _480 = fma(_474, _466, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _482 = fma(_472, _414, _476);
    float _484 = fma(_480, _478, _482);
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _490 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[118].x, _484);
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _494 = _488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _496 = in.m_65.x;
    float _498 = in.m_65.y;
    float _500 = in.m_65.z;
    float _502 = _486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _490 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _494;
    out.m_67.y = _502;
    out.m_67.z = _504;
    out.m_67.w = _506;
    float _508 = _324 * _498;
    float _510 = _326 * _500;
    float _512 = _322 * _496;
    bool _514 = !_420;
    if (!_514)
    {
        float _516 = in.m_63.x;
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _520 = _516 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _524 = _522 * _518;
        float _526 = floor(_524);
        float _528 = -_526;
        float _530 = _524 + _528;
        _218 = _530;
    }
    float _532 = _218;
    float _534 = in.m_63.z;
    float _536 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _538 = int(_536);
    float _540 = in.m_63.x;
    float _542 = in.m_63.y;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _558 = _556 != 0;
    float _560 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _562 = int(_560);
    float _564 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _566 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _568 = !_554;
    int _570 = _568 ? 0 : 1;
    float _572 = in.m_61.w;
    bool _574 = !_550;
    int _576 = _574 ? 0 : 1;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _580 = !_558;
    int _582 = _580 ? 0 : 1;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _586 = _584 != 0;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _590 = _588 != 0;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _594 = _592 != 0;
    float _596 = float(_538);
    float _598 = _534 * 2.0;
    bool _600 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _602 = isnan(1.0);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _608 = _604 || _606;
    float _610 = 1.0 / _596;
    float _612 = float(_562);
    float _614 = _540 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _616 = _542 + _540;
    float _618 = _540 * 2.0;
    float _620 = _542 * 2.0;
    float _622 = -_544;
    float _624 = fma(_614, 2.0, _622);
    float _626 = _542 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _628 = floor(_598);
    float _630 = _616 + (-1.0);
    float _632 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[78].w, _578);
    float _634 = fma(_626, -2.0, _546);
    float _636 = _612 * _122;
    float _638 = -_122;
    float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[76].x, _624);
    float _642 = floor(_618);
    float _644 = _610 * _122;
    float _646 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _632);
    bool _648 = _628 > 0.0;
    float _650 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _652 = _628 >= 0.0;
    bool _654 = isnan(_628);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _664 = log2(_662);
    bool _666 = !_586;
    int _668 = _666 ? 0 : 1;
    int _670 = _660 ? 0 : 1;
    int _672 = abs(_668);
    bool _674 = _642 >= 0.0;
    bool _676 = isnan(_642);
    bool _678 = _674 || _676;
    bool _680 = isnan(0.0);
    bool _682 = _678 || _680;
    float _684 = floor(_620);
    float _686 = float(_672);
    bool _688 = _642 > 0.0;
    int _690 = _682 ? 0 : 1;
    int _692 = ~_670;
    int _694 = _692 + 1;
    int _696 = _694 + 1;
    int _698 = _696;
    if (!_648)
    {
        int _700 = ~_670;
        int _702 = _700 + 1;
        _698 = _702;
    }
    int _704 = _698;
    int _706 = ~_690;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    float _712 = float(_704);
    float _714 = _664 * _122;
    bool _716 = _684 > 0.0;
    bool _718 = _684 >= 0.0;
    bool _720 = isnan(_684);
    bool _722 = _718 || _720;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    float _728 = _686 * _712;
    float _730 = in.m_69.x;
    float _732 = in.m_69.y;
    float _734 = in.m_69.z;
    float _736 = exp2(_714);
    int _738 = _710;
    if (!_688)
    {
        int _740 = ~_690;
        int _742 = _740 + 1;
        _738 = _742;
    }
    int _744 = _738;
    float _746 = _728 * (-2.0);
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _752 = 1.0 + _750;
    bool _754 = !_590;
    int _756 = _754 ? 0 : 1;
    float _758 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[78].z, _748);
    float _760 = 1.0 / _752;
    int _762 = abs(_756);
    float _764 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _634);
    float _766 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _758);
    int _768 = _726 ? 0 : 1;
    bool _770 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _772 = isnan(0.0);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _778 = _774 || _776;
    float _780 = -_736;
    float _782 = _780 + 1.0;
    int _784 = ~_768;
    int _786 = _784 + 1;
    int _788 = _786 + 1;
    float _790 = float(_744);
    float _792 = float(_762);
    float _794 = _778 ? _782 : 0.0;
    int _796 = _788;
    if (!_716)
    {
        int _798 = ~_768;
        int _800 = _798 + 1;
        _796 = _800;
    }
    int _802 = _796;
    float _804 = fma(_650, _746, _650);
    bool _806 = !_594;
    int _808 = _806 ? 0 : 1;
    float _810 = fma(_746, _730, _730);
    float _812 = _542 + _534;
    float _814 = _792 * _790;
    if (_608)
    {
        float _816 = _794 * _760;
        _132 = _816;
    }
    float _818 = _132;
    float _820 = _540 + (-0.5);
    int _822 = abs(_808);
    float _824 = _812 + (-1.0);
    float _826 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[196].x, _810);
    float _828 = float(_822);
    float _830 = _814 * (-2.0);
    float _832 = float(_802);
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _836 = fma(_804, _818, _826);
    float _838 = fma(_834, _830, _834);
    float _840 = _828 * _832;
    float _842 = fma(_830, _732, _732);
    float _844 = _534 + _540;
    float _846 = _542 + (-0.5);
    float _848 = _836 * 0.15915493667125701904296875;
    float _850 = _844 + (-1.0);
    float _852 = _840 * (-2.0);
    float _854 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[196].y, _842);
    float _856 = _534 + (-0.5);
    float _858 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _860 = fma(_852, _734, _734);
    float _862 = fma(_838, _818, _854);
    float _864 = _848 * 6.283185482025146484375;
    float _866 = sin(_864);
    float _868 = in.m_46.x;
    float _870 = in.m_46.y;
    float _872 = in.m_46.z;
    float _874 = fma(_858, _852, _858);
    float _876 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[196].z, _860);
    float _878 = _862 * 0.15915493667125701904296875;
    float _880 = in.m_71.x;
    float _882 = in.m_71.y;
    float _884 = in.m_71.z;
    float _886 = fma(_874, _818, _876);
    float _888 = _848 * 6.283185482025146484375;
    float _890 = cos(_888);
    float _892 = _886 * 0.15915493667125701904296875;
    float _894 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _896 = _878 * 6.283185482025146484375;
    float _898 = sin(_896);
    float _900 = _878 * 6.283185482025146484375;
    float _902 = cos(_900);
    float _904 = _192 * _870;
    float _906 = _186 * _870;
    float _908 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    float _912 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _880);
    float _914 = _892 * 6.283185482025146484375;
    float _916 = cos(_914);
    float _918 = fma(_190, _868, _904);
    float _920 = _894 * _908;
    float _922 = _564 * _910;
    float _924 = _866 * _898;
    float _926 = _566 * _912;
    float _928 = _890 * _898;
    float _930 = fma(_184, _868, _906);
    float _932 = _892 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = _890 * _902;
    float _938 = _866 * _902;
    float _940 = fma(_188, _872, _930);
    float _942 = _890 * _916;
    float _944 = _866 * _916;
    float _946 = _902 * _916;
    float _948 = _898 * _916;
    float _950 = _942 * _920;
    float _952 = in.m_57.w;
    float _954 = _944 * _920;
    float _956 = fma(_934, _936, _924);
    float _958 = -_920;
    float _960 = _934 * _958;
    float _962 = -_938;
    float _964 = fma(_934, _928, _962);
    float _966 = -_928;
    float _968 = fma(_934, _938, _966);
    float _970 = fma(_956, _926, _950);
    float _972 = fma(_946, _926, _960);
    float _974 = fma(_934, _924, _936);
    float _976 = fma(_968, _926, _954);
    float _978 = fma(_964, _922, _970);
    float _980 = fma(_948, _922, _972);
    float _982 = _180 * _870;
    float _984 = fma(_974, _922, _976);
    float _986 = _978 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _988 = _978 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _990 = fma(_178, _868, _982);
    float _992 = fma(_194, _872, _918);
    float _994 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[26].x, _986);
    float _996 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[24].x, _988);
    float _998 = fma(_182, _872, _990);
    float _1000 = _992 + _572;
    float _1002 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[26].z, _994);
    float _1004 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[24].z, _996);
    float _1006 = _998 + _952;
    float _1008 = in.m_59.w;
    float _1010 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1012 = _1004 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1014 = _978 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1016 = _1000 + _1010;
    float _1018 = _1006 + _1012;
    float _1020 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1014);
    float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1024 = _1016 + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1028 = _1018 + _1026;
    float _1030 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1020);
    float _1032 = _1024 * _1024;
    float _1034 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1036 = fma(_1028, _1028, _1032);
    float _1038 = sqrt(_1036);
    float _1040 = _940 + _1008;
    float _1042 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1044 = _1040 + _1034;
    float _1046 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1042);
    float _1048 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1046);
    bool _1050 = _1038 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1052 = _872;
    float _1054 = _1030;
    float _1056 = _1014;
    float _1058 = _1038;
    if (!_1050)
    {
        _1052 = _1018;
    }
    float _1060 = _1052;
    float _1062 = _1060;
    if (!_1050)
    {
        _1054 = _1016;
    }
    float _1064 = _1054;
    float _1066 = _1064;
    if (!_1050)
    {
        _1056 = _1044;
    }
    float _1068 = _1056;
    bool _1070 = !_1050;
    float _1072 = _1068;
    if (!_1070)
    {
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1078 = _1038 + _1076;
        float _1080 = rsqrt(_1036);
        float _1082 = _1078 * _1074;
        float _1084 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = _1082 * 0.15915493667125701904296875;
        float _1088 = _1086 * 6.283185482025146484375;
        float _1090 = cos(_1088);
        float _1092 = _1086 * 6.283185482025146484375;
        float _1094 = sin(_1092);
        float _1096 = _1090 + (-1.0);
        float _1098 = fma(_1094, _1084, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1100 = _1096 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1102 = _1080 * _1098;
        float _1104 = fma(_1044, _1090, _1100);
        float _1106 = fma(_1028, _1102, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1108 = fma(_1024, _1102, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1072 = _1104;
        _1062 = _1106;
        _1066 = _1108;
    }
    float _1110 = _1072;
    float _1112 = _1062;
    float _1114 = _1066;
    float _1116 = -_1040;
    float _1118 = _1116 + _1110;
    float _1120 = -_1006;
    float _1122 = _1120 + _1112;
    float _1124 = _1048 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1126 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1128 = _1118 * _1118;
    float _1130 = -_1000;
    float _1132 = _1130 + _1114;
    float _1134 = 1.0 / _1124;
    bool _1136 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1138 = isnan(0.5);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1144 = _1140 || _1142;
    float _1146 = fma(_1122, _1122, _1128);
    float _1148 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1126);
    float _1150 = fma(_1132, _1132, _1146);
    float _1152 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1148);
    float _1154 = sqrt(_1150);
    float _1156 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1158 = _1156 + _1124;
    float _1160 = _1158 * _1134;
    float _1162 = _1160 * 0.5;
    float _1164 = _1134;
    float _1166 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1168 = _1110;
    float _1170 = _1112;
    float _1172 = _1114;
    float _1174 = _1124;
    if (_1144)
    {
        _1164 = 1.0;
    }
    float _1176 = _1164;
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1178);
    bool _1182 = _1154 > 0.0;
    float _1184 = 1.0 / _1180;
    bool _1186 = !_1182;
    float _1188 = _1176;
    if (!_1186)
    {
        float _1190 = _212 * _212;
        float _1192 = rsqrt(_1150);
        float _1194 = fma(_208, _208, _1190);
        float _1196 = fma(_214, _214, _1194);
        float _1198 = sqrt(_1196);
        float _1200 = _1118 * _1192;
        float _1202 = _1132 * _1192;
        bool _1204 = _1198 > 0.0;
        float _1206 = _1122 * _1192;
        bool _1208 = !_1204;
        _1166 = _1206;
        _1174 = _1200;
        _1058 = _1202;
        if (!_1208)
        {
            float _1210 = rsqrt(_1196);
            float _1212 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1214 = _212 * _1210;
            float _1216 = _208 * _1210;
            float _1218 = _1200 * _1214;
            float _1220 = _214 * _1210;
            float _1222 = fma(_1206, _1216, _1218);
            float _1224 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1226 = fma(_1202, _1220, _1222);
            float _1228 = _1226 * _1224;
            float _1230 = fma(_208, _1228, _1112);
            float _1232 = fma(_212, _1228, _1110);
            float _1234 = fma(_214, _1228, _1114);
            _1168 = _1232;
            _1170 = _1230;
            _1172 = _1234;
        }
    }
    float _1236 = _1166;
    float _1238 = _1168;
    float _1240 = _1170;
    float _1242 = _1172;
    float _1244 = _1174;
    float _1246 = _1058;
    float _1248 = _1246;
    float _1250 = _1236;
    if (_1144)
    {
        _1248 = 1.0;
    }
    float _1252 = _1248;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1256 = _1184 * _1254;
    float _1258 = _1252;
    if (!_1144)
    {
        float _1260 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1262 = _1260 * 0.15915493667125701904296875;
        float _1264 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1266 = _1262 * 6.283185482025146484375;
        float _1268 = cos(_1266);
        float _1270 = _1264 * 0.15915493667125701904296875;
        float _1272 = _1262 * 6.283185482025146484375;
        float _1274 = sin(_1272);
        float _1276 = 1.0 / _1268;
        float _1278 = _1270 * 6.283185482025146484375;
        float _1280 = cos(_1278);
        float _1282 = _1274 * _1276;
        float _1284 = _1270 * 6.283185482025146484375;
        float _1286 = sin(_1284);
        float _1288 = _1280 * _1282;
        float _1290 = 1.0 / _1288;
        float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1294 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1292;
        float _1296 = 1.0 / _1294;
        float _1298 = _1286 * _1290;
        float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1302 = fma(_1256, _1298, _1300);
        float _1304 = _1302 * _1296;
        float _1306 = precise::clamp(_1304, 0.0, 1.0);
        _1250 = _1262;
        _1188 = _1306;
    }
    float _1308 = _1250;
    float _1310 = _1188;
    float _1312 = _1308;
    if (!_1144)
    {
        float _1314 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1316 = _1314 * 0.15915493667125701904296875;
        float _1318 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1320 = _1316 * 6.283185482025146484375;
        float _1322 = cos(_1320);
        float _1324 = _1318 * 0.15915493667125701904296875;
        float _1326 = _1316 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        float _1330 = 1.0 / _1322;
        float _1332 = _1324 * 6.283185482025146484375;
        float _1334 = cos(_1332);
        float _1336 = _1328 * _1330;
        float _1338 = _1324 * 6.283185482025146484375;
        float _1340 = sin(_1338);
        float _1342 = _1334 * _1336;
        float _1344 = 1.0 / _1342;
        float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1348 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1346;
        float _1350 = 1.0 / _1348;
        float _1352 = _1340 * _1344;
        float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1356 = fma(_1256, _1352, _1354);
        float _1358 = _1356 * _1350;
        float _1360 = precise::clamp(_1358, 0.0, 1.0);
        float _1362 = -_1360;
        float _1364 = _1362 + 1.0;
        _1312 = _1322;
        _1258 = _1364;
    }
    float _1366 = _1312;
    float _1368 = _1258;
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1372 = _1238 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1376 = _1240 + _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1380 = _1242 + _1378;
    float _1382 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1384 = _1372 * _1372;
    float _1386 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1388 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1382);
    float _1390 = fma(_1376, _1376, _1384);
    float _1392 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1388);
    float _1394 = fma(_1380, _1380, _1390);
    float _1396 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1398 = rsqrt(_1394);
    float _1400 = sqrt(_1394);
    float _1402 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1404 = _1376 * _1402;
    float _1406 = _1380 * _1402;
    float _1408 = _1404 * _1404;
    float _1410 = _1406 * _1406;
    float _1412 = _1408 + _1410;
    float _1414 = sqrt(_1412);
    bool _1416 = _1414 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1420 = _1414 + _1418;
    float _1422 = _1150;
    float _1424 = _1420;
    float _1426 = _1404;
    float _1428 = _1406;
    float _1430 = _1408;
    float _1432 = _1410;
    if (_1416)
    {
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1422 = _1434;
    }
    float _1436 = _1422;
    if (_1416)
    {
        float _1438 = _1420 * _1436;
        _1424 = _1438;
    }
    float _1440 = _1424;
    if (_1416)
    {
        float _1442 = _1440 * 0.15915493667125701904296875;
        _220 = _1442;
    }
    float _1444 = _220;
    float _1446 = _1244;
    float _1448 = _1444;
    if (_1416)
    {
        float _1450 = _1444 * 6.283185482025146484375;
        float _1452 = sin(_1450);
        _1446 = _1452;
    }
    float _1454 = _1446;
    float _1456 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1458 = precise::max(0.0, _1456);
    float _1460 = _1366;
    float _1462 = _1458;
    if (_1416)
    {
        float _1464 = _1444 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        _1460 = _1466;
    }
    float _1468 = _1460;
    float _1470 = -_1402;
    float _1472 = -_1458;
    float _1474 = fma(_1372, _1470, _1472);
    float _1476 = _1456;
    if (_1416)
    {
        float _1478 = rsqrt(_1412);
        _1476 = _1478;
    }
    float _1480 = _1476;
    if (_1416)
    {
        float _1482 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1462 = _1482;
    }
    float _1484 = _1462;
    float _1486 = fma(_1006, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1488 = _1484;
    float _1490 = _1454;
    if (_1416)
    {
        float _1492 = fma(_1454, _1484, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1488 = _1492;
    }
    float _1494 = _1488;
    float _1496 = _1494;
    if (_1416)
    {
        float _1498 = _1468 + (-1.0);
        _1490 = _1498;
    }
    float _1500 = _1490;
    float _1502 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1504 = floor(_1486);
    float _1506 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1502);
    float _1508 = _1480;
    if (_1416)
    {
        float _1510 = _1480 * _1494;
        _1448 = _1510;
    }
    float _1512 = _1448;
    if (_1416)
    {
        float _1514 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1514;
    }
    float _1516 = _1496;
    if (!_1416)
    {
        _1508 = _1474;
    }
    float _1518 = _1508;
    float _1520 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1506);
    float _1522 = _1518;
    if (_1416)
    {
        float _1524 = _1404 * _1512;
        _1426 = _1524;
    }
    float _1526 = _1426;
    if (_1416)
    {
        float _1528 = fma(_1474, _1468, _1516);
        _1522 = _1528;
    }
    float _1530 = _1522;
    if (_1416)
    {
        float _1532 = _1406 * _1512;
        _1428 = _1532;
    }
    float _1534 = _1428;
    if (_1416)
    {
        float _1536 = _1526 * _1526;
        _1430 = _1536;
    }
    float _1538 = _1430;
    if (_1416)
    {
        float _1540 = _1534 * _1534;
        _1432 = _1540;
    }
    float _1542 = _1432;
    float _1544 = fma(_1530, _1530, _1538);
    float _1546 = fma(_1000, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1548 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1550 = _1544 + _1542;
    float _1552 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1554 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1556 = fma(_1400, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1554);
    float _1558 = precise::clamp(_1556, 0.0, 1.0);
    float _1560 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1548);
    float _1562 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1386);
    float _1564 = _1520 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1566 = rsqrt(_1550);
    float _1568 = -_1558;
    float _1570 = _1568 + 1.0;
    float _1572 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1574 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1562);
    float _1576 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1560);
    float _1578 = -_1572;
    float _1580 = fma(_1578, _1552, 1.0);
    float _1582 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1584 = abs(_1570);
    float _1586 = log2(_1584);
    float _1588 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1590 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1592 = -_1504;
    float _1594 = _1486 + _1592;
    float _1596 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1598 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1590);
    float _1600 = _1566 * _1526;
    float _1602 = _1566 * _1530;
    float _1604 = _1566 * _1534;
    float _1606 = floor(_1546);
    float _1608 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1610 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1598);
    float _1612 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1596);
    float _1614 = -_1608;
    float _1616 = fma(_1602, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1614);
    float _1618 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1620 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1610);
    float _1622 = log2(_1580);
    float _1624 = -_1604;
    float _1626 = fma(_1624, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1616);
    float _1628 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1630 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1612);
    float _1632 = fma(_1626, -0.5, 0.5);
    float _1634 = fma(_1626, 0.5, 0.5);
    float _1636 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1628);
    float _1638 = exp2(_1618);
    float _1640 = -_1606;
    float _1642 = _1546 + _1640;
    float _1644 = fma(_1634, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1646 = _1602 + 1.0;
    float _1648 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1636);
    float _1650 = fma(_1634, _1644, -0.212114393711090087890625);
    float _1652 = 1.0 / _1620;
    float _1654 = fma(_1634, _1650, 1.570728778839111328125);
    float _1656 = _1622 * 0.693147182464599609375;
    float _1658 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1660 = sqrt(_1632);
    float _1662 = -_1602;
    float _1664 = fma(_1638, _1646, _1662);
    float _1666 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1630);
    float _1668 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1648);
    float _1670 = _1666 * _1652;
    float _1672 = _1668 * _1652;
    float2 _5338 = float2(_1594, _1642);
    float _1674 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5338, float2(0.0), isnan(_5338)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5338, float2(0.0), isnan(_5338)), level(0.0)).x;
    float _1676 = fma(_1672, -0.5, 0.5);
    float _1678 = _1660 * 0.636619746685028076171875;
    float _1680 = fma(_1670, 0.5, 0.5);
    float _1682 = -_1654;
    float _1684 = fma(_1678, _1682, 1.0);
    float _1686 = fma(_1664, 0.5, 0.5);
    float3 _5363 = float3(_1680, _1676, _1658);
    float _1688 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5363, float3(0.0), isnan(_5363)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5363, float3(0.0), isnan(_5363)), level(0.0)).x;
    float3 _5374 = float3(_1680, _1676, _1658);
    float4 _1691 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5374, float3(0.0), isnan(_5374)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5374, float3(0.0), isnan(_5374)), level(0.0)).xyzw;
    float _1693 = _1691.x;
    float _1695 = _1691.y;
    float _1697 = _1691.z;
    float _1699 = _1691.w;
    float2 _5390 = float2(_1684, _1686);
    float3 _1703 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5390, float2(0.0), isnan(_5390)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5390, float2(0.0), isnan(_5390)), level(0.0)).xyz;
    float _1705 = _1703.x;
    float _1707 = _1703.y;
    float _1709 = _1703.z;
    float _1711 = float(uint(_562));
    float _1713 = trunc(_644);
    int _1715 = int(_1713);
    bool _1717 = _562 == 0;
    float _1719 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1721 = abs(_570);
    float _1723 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1725 = abs(_582);
    float _1727 = 1.0 / _1711;
    int _1729 = ~_562;
    int _1731 = _1729 + 1;
    float _1733 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1723);
    bool _1735 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1737 = isnan(_532);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1743 = _1739 || _1741;
    float _1745 = float(_1743);
    float _1747 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1733);
    float _1749 = float(uint(_1715));
    float _1751 = exp2(_1719);
    float _1753 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1747);
    out.gl_Position.x = _1666;
    out.gl_Position.y = _1668;
    out.gl_Position.z = _1753;
    out.gl_Position.w = _1620;
    int _1755 = as_type<int>(_1727) + (-2);
    float _1757 = as_type<float>(_1755) * _1749;
    float _1759 = -_1751;
    float _1761 = _1759 + 1.0;
    float _1763 = trunc(_1757);
    float _1765 = precise::max(_1763, 0.0);
    uint _1768 = uint(_1765);
    float _1770 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1772 = _1731 * int(_1768);
    int _1774 = _1772 + _1715;
    float _1776 = float(uint(_1774));
    float _1778 = as_type<float>(_1755) * _1776;
    float _1780 = trunc(_1778);
    float _1782 = precise::max(_1780, 0.0);
    uint _1784 = uint(_1782);
    int _1786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1788 = _1786 != 0;
    int _1790 = ~_562;
    int _1792 = _1790 + 1;
    bool _1794 = !_1788;
    float _1796 = _1794 ? 7.345489978790283203125 : 1.0;
    float _1798 = _1796 * _540;
    float _1800 = floor(_1798);
    int _1802 = int(_1768) + int(_1784);
    float _1804 = float(_1715);
    int _1806 = _1792 * _1802;
    int _1808 = _1806 + _1715;
    bool _1810 = _1804 >= _612;
    bool _1812 = isnan(_1804);
    bool _1814 = _1810 || _1812;
    bool _1816 = isnan(_612);
    bool _1818 = _1814 || _1816;
    float _1820 = float(_1818);
    bool _1822 = uint(_1808) >= uint(_562);
    float _1824 = trunc(_1820);
    int _1826 = int(_1824);
    float _1828 = -_1800;
    float _1830 = _1798 + _1828;
    bool _1832 = !_1822;
    int _1834 = _1832 ? 0 : (-1);
    float _1836 = _1830 * _612;
    int _1838 = ~_1802;
    int _1840 = _1838 + _1834;
    int _1842 = _1840 + 1;
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1846 = _1844 != 0;
    int _1848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1850 = _1848 != 0;
    int _1852 = _562 * _1842;
    int _1854 = _1852 + _1715;
    float _1856 = trunc(_1836);
    int _1858 = int(_1856);
    int _1860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1862 = _1860 != 0;
    int _1864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1866 = _1864 != 0;
    bool _1868 = !_1717;
    int _1870 = _1868 ? _1854 : (-1);
    float _1872 = _636 * _174;
    int _1874 = ~_1826;
    int _1876 = _1874 + 1;
    int _1878 = _1876 + 1;
    int _1880 = _562 + (-1);
    bool _1882 = !_1846;
    int _1884 = _1882 ? 0 : 1;
    float _1886 = trunc(_1872);
    int _1888 = int(_1886);
    int _1890 = _1870 * _1878;
    int _1892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1894 = _1892 != 0;
    float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1898 = _532 + _1896;
    int _1900 = abs(_1884);
    int _1902 = _1826 * _1880;
    int _1904 = _1902 + _1890;
    int _1906 = abs(_576);
    float _1908 = in.m_73.y;
    int _1910 = _1904 * _1721;
    bool _1912 = !_1894;
    int _1914 = _1912 ? 0 : 1;
    int _1916 = _1858 * _1900;
    int _1918 = _1916 + _1715;
    bool _1920 = _542 > 0.5;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1926 = _1888 * _1906;
    int _1928 = _1926 + _1910;
    float _1930 = 1.0 / _1924;
    int _1932 = abs(_1914);
    int _1934 = _1918 * _1725;
    int _1936 = _1934 + _1928;
    float _1938 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1940 = _1938 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1942 = _1858 * _1932;
    int _1944 = _1942 + _1936;
    float _1946 = 1.0 / _1940;
    float _1948 = float(uint(_1944));
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    float _1950 = -_1908;
    float _1952 = _1950 + 1.0;
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1954;
    float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1962 = ~_562;
    int _1964 = _1962 + 1;
    float _1966 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1968 = _1966 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1970 = _1956 * _1930;
    float _1972 = _1908;
    if (_1862)
    {
        float _1974 = _1920 ? _1952 : _1908;
        _1972 = _1974;
    }
    float _1976 = _1972;
    float _1978 = _1956;
    if (_1850)
    {
        float _1980 = in.m_63.x;
        _1978 = _1980;
    }
    float _1982 = _1978;
    float _1984 = fma(_1970, _1898, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1986 = 1.0 / _1968;
    float _1988 = as_type<float>(_1755) * _1948;
    bool _1990 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1992 = isnan(_532);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    float _2002 = _1960 * _1946;
    bool _2004 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2006 = isnan(_532);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2012 = _2008 || _2010;
    float _2014 = float(_2012);
    float _2016 = in.m_73.x;
    bool _2018 = _882 != 0.0;
    bool _2020 = isnan(_882);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan(0.0);
    bool _2026 = _2022 || _2024;
    float _2028 = -_2000;
    float _2030 = _2028 + 1.0;
    float _2032 = trunc(_1988);
    float _2034 = precise::max(_2032, 0.0);
    uint _2036 = uint(_2034);
    float _2038 = -_2014;
    float _2040 = _2038 + 1.0;
    float _2042 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2042;
    float _2046 = _2014 * _2030;
    bool _2048 = _880 == 0.0;
    bool _2050 = !_2026;
    bool _2052 = _2048 && _2050;
    float _2054 = _1745 * _2040;
    float _2056 = -_1745;
    float _2058 = _2056 + 1.0;
    float _2060 = _2044 * _1986;
    bool _2062 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2064 = isnan(_532);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2070 = _2066 || _2068;
    float _2072 = float(_2070);
    float _2074 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2076 = _532 + _2074;
    bool _2078 = _884 == 0.0;
    bool _2080 = _2078 && _2052;
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2084 = _532 + _2082;
    bool _2086 = _1982 > 0.5;
    bool _2088 = _2086 && _1850;
    float _2090 = _2072 * _2058;
    float _2092 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _2094 = _1964 * int(_2036);
    int _2096 = _2094 + _1944;
    float _2098 = -_2072;
    float _2100 = _2098 + 1.0;
    float _2102 = fma(_2002, _2076, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2104 = -_764;
    float _2106 = fma(_646, _2092, _2104);
    float _2108 = float(uint(_1918));
    float _2110 = fma(_2060, _2084, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2112 = float(uint(_2096));
    float _2114 = _1984 * _2090;
    float _2116 = _2092;
    float _2118 = _2016;
    if (_1850)
    {
        _2116 = _2016;
    }
    float _2120 = _2116;
    float _2122 = as_type<float>(_1755) * _2108;
    float _2124 = as_type<float>(_1755) * _2112;
    float _2126 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2114);
    float _2128 = in.m_77.x;
    float _2130 = in.m_77.y;
    float _2132 = in.m_77.z;
    float _2134 = _2120;
    if (_2088)
    {
        float _2136 = -_2120;
        float _2138 = _2136 + 1.0;
        _2134 = _2138;
    }
    float _2140 = _2134;
    float _2142 = trunc(_2122);
    float _2144 = precise::max(_2142, 0.0);
    uint _2146 = uint(_2144);
    int _2148 = ~_562;
    int _2150 = _2148 + 1;
    float _2152 = fma(_2102, _2054, _2126);
    if (_1850)
    {
        _2118 = _2140;
    }
    float _2154 = _2118;
    float _2156 = fma(_2110, _2046, _2152);
    float _2158 = trunc(_2124);
    float _2160 = precise::max(_2158, 0.0);
    uint _2162 = uint(_2160);
    float _2164 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2166 = ~_562;
    int _2168 = _2166 + 1;
    float _2170 = fma(_2000, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2156);
    float _2172 = fma(_766, _2164, _640);
    float _2174 = _2170 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2176 = abs(_1256);
    float _2178 = log2(_2176);
    float _2180 = _2172 + 0.5;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2184 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2186 = _2128;
    float _2188 = _2130;
    float _2190 = _2132;
    if (!_2080)
    {
        float _2192 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2128);
        _2186 = _2192;
    }
    float _2194 = _2186;
    int _2196 = _2150 * int(_2146);
    int _2198 = _2196 + _1918;
    int _2200 = int(_2036) + int(_2162);
    if (!_2080)
    {
        float _2202 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2130);
        _2188 = _2202;
    }
    float _2204 = _2188;
    if (!_2080)
    {
        float _2206 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2132);
        _2190 = _2206;
    }
    float _2208 = _2190;
    float _2210 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2212 = _2168 * _2200;
    int _2214 = _2212 + _1944;
    float _2216 = float(uint(_2198));
    float _2218 = _2184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2220 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2222 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2224 = uint(_2214) >= uint(_562);
    float _2226 = as_type<float>(_1755) * _2216;
    int _2228 = ~_562;
    int _2230 = _2228 + 1;
    float _2232 = _2222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2234 = !_2224;
    int _2236 = _2234 ? 0 : (-1);
    float _2238 = exp2(_2220);
    float _2240 = _942 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2242 = _1256 <= 8000.0;
    bool _2244 = isnan(_1256);
    bool _2246 = _2242 || _2244;
    bool _2248 = isnan(8000.0);
    bool _2250 = _2246 || _2248;
    float _2252 = float(_2250);
    out.m_79.x = _2232;
    out.m_79.y = _2210;
    out.m_79.z = _2218;
    out.m_79.w = _2174;
    int _2254 = ~_2200;
    int _2256 = _2254 + _2236;
    int _2258 = _2256 + 1;
    float _2260 = _2106 + 0.5;
    float _2262 = -_934;
    float _2264 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2240);
    float _2266 = trunc(_2226);
    float _2268 = precise::max(_2266, 0.0);
    uint _2270 = uint(_2268);
    int _2272 = _562 * _2258;
    int _2274 = _2272 + _1944;
    out.m_81.x = _2180;
    out.m_81.y = _2260;
    float _2276 = _942 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2278 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2264);
    bool _2280 = !_1717;
    int _2282 = _2280 ? _2274 : (-1);
    float _2284 = -_934;
    float _2286 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2276);
    float _2288 = _956 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2290 = _2282 & 3;
    bool _2292 = _2290 != 0;
    int _2294 = _2282 >> 31;
    int _2296 = int(_2146) + int(_2270);
    float _2298 = _942 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2300 = _2294 & 3;
    float _2302 = _964 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2304 = -_934;
    float _2306 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2298);
    int _2308 = _2282 + _2300;
    float _2310 = fma(_2238, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2312 = precise::clamp(_2310, 0.0, 1.0);
    float _2314 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2286);
    float _2316 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2306);
    int _2318 = _2308 >> 2;
    int _2320 = _2230 * _2296;
    int _2322 = _2320 + _1918;
    float _2324 = _956 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2326 = _956 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2328 = _2318 << 4;
    int _2330 = _2328 + 368;
    float _2332 = _964 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2334 = uint(_2322) >= uint(_562);
    float _2336 = _964 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _2338 = uint(int(uint(_2330) >> uint(2)));
    uint _2340 = uint(int(uint(int(_2338)) >> uint(2)));
    int _2342 = int(_2338) & 3;
    float _2344 = (*spvDescriptorSet0.vp_c9)._m0[int(_2340)][_2342];
    int _2346 = int(_2338) + 1;
    uint _2348 = uint(int(uint(_2346) >> uint(2)));
    int _2350 = _2346 & 3;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[int(_2348)][_2350];
    float _2354 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2324);
    float _2356 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2288);
    float _2358 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2326);
    float _2360 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2336);
    float _2362 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2302);
    float _2364 = _2278 * _2204;
    int _2366 = _2282 & 3;
    bool _2368 = _2366 != 0;
    int _2370 = _2330 + 8;
    uint _2372 = uint(int(uint(_2370) >> uint(2)));
    uint _2374 = uint(int(uint(int(_2372)) >> uint(2)));
    int _2376 = int(_2372) & 3;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[int(_2374)][_2376];
    int _2380 = int(_2372) + 1;
    uint _2382 = uint(int(uint(_2380) >> uint(2)));
    int _2384 = _2380 & 3;
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[int(_2382)][_2384];
    float _2388 = fma(_2312, -2.0, 3.0);
    float _2390 = _2312 * _2312;
    bool _2392 = uint(_2366) > 1u;
    float _2394 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2332);
    int _2396 = _2292 ? 0 : 1;
    float _2398 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2354);
    float _2400 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2356);
    float _2402 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2358);
    bool _2404 = _2366 != 3;
    float _2406 = _2316 * _2204;
    int _2408 = ~_2396;
    int _2410 = _2408 + 1;
    int _2412 = _2410 + 1;
    float _2414 = _2390 * _2388;
    bool _2416 = !_2334;
    int _2418 = _2416 ? 0 : (-1);
    float _2420 = _2314 * _2204;
    bool _2422 = uint(_2366) >= 2u;
    float _2424 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2360);
    int _2426 = _2412;
    if (!_2392)
    {
        int _2428 = ~_2396;
        int _2430 = _2428 + 1;
        _2426 = _2430;
    }
    int _2432 = _2426;
    float _2434 = fma(_2398, _2194, _2406);
    int _2436 = ~_2296;
    int _2438 = _2436 + _2418;
    int _2440 = _2438 + 1;
    float _2442 = fma(_2400, _2194, _2364);
    int _2444 = abs(_2432);
    float _2446 = fma(_2402, _2194, _2420);
    bool _2448 = !_2368;
    int _2450 = _2448 ? 0 : 1;
    float _2452 = fma(_2424, _2208, _2434);
    int _2454 = _2422 ? 0 : 1;
    float _2456 = in.m_83.x;
    bool _2458 = _2366 != 3;
    int _2460 = _562 * _2440;
    int _2462 = _2460 + _1918;
    float _2464 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2362);
    int _2466 = ~_2454;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    float _2472 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2394);
    bool _2474 = !_2458;
    int _2476 = _2474 ? 0 : (-1);
    float _2478 = fma(_2464, _2208, _2442);
    int _2480 = abs(_2450);
    float _2482 = -_1674;
    float _2484 = _2482 + 1.0;
    int _2486 = _2470;
    if (_2404)
    {
        int _2488 = ~_2454;
        int _2490 = _2488 + 1;
        _2486 = _2490;
    }
    int _2492 = _2486;
    float _2494 = fma(_2472, _2208, _2446);
    int _2496 = ~_2444;
    int _2498 = _2496 + 1;
    int _2500 = _2498 + 1;
    float _2502 = _1770 * _1688;
    bool _2504 = !_1866;
    int _2506 = _2504 ? 0 : 1;
    int _2508 = abs(_2476);
    int _2510 = _2500 * as_type<int>(_2352);
    int _2512 = abs(_2492);
    out.m_85.x = _2452;
    out.m_85.y = _2478;
    out.m_85.z = _2494;
    int _2514 = ~_2480;
    int _2516 = _2514 + 1;
    int _2518 = _2516 + 1;
    int _2520 = abs(_2506);
    int _2522 = _2518 * as_type<int>(_2344);
    int _2524 = _2522 + _2510;
    int _2526 = ~_2512;
    int _2528 = _2526 + 1;
    int _2530 = _2528 + 1;
    int _2532 = ~_2508;
    int _2534 = _2532 + 1;
    int _2536 = _2534 + 1;
    int _2538 = _2530 * as_type<int>(_2378);
    int _2540 = _2538 + _2524;
    bool _2542 = !_1717;
    int _2544 = _2542 ? _2462 : (-1);
    int _2546 = ~_2520;
    int _2548 = _2546 + 1;
    int _2550 = _2548 + 1;
    int _2552 = _2536 * as_type<int>(_2386);
    int _2554 = _2552 + _2540;
    float _2556 = -_2414;
    float _2558 = _2556 + 1.0;
    int _2560 = _2554 * _2550;
    float _2562 = fma(_2558, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2414);
    float _2564 = _1620 * 0.5;
    float _2566 = _1753 + _1620;
    int _2568 = _2544 * _2520;
    int _2570 = _2568 + _2560;
    float _2572 = _2252 * _2562;
    float _2574 = fma(_1668, -0.5, _2564);
    float _2576 = _1666 + _1620;
    float _2578 = _2572 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2580 = _2566 * 0.5;
    float _2582 = _2576 * 0.5;
    float _2584 = float(_2570);
    float _2586 = _2484 * _2578;
    float _2588 = precise::clamp(_2586, 0.0, 1.0);
    float _2590 = _1699 * _2502;
    float _2592 = _1709 * _2502;
    out.m_87.x = _2582;
    out.m_87.y = _2574;
    out.m_87.z = _2580;
    out.m_87.w = _1620;
    float _2594 = -_2588;
    float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2598 = fma(_1705, _2590, _1693);
    float _2600 = fma(_1707, _2590, _1695);
    out.m_89.x = _2584;
    float _2602 = _2596 * _2456;
    float _2604 = fma(_1699, _2592, _1697);
    bool _2606 = _1400 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2608 = isnan(_1400);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2614 = _2610 || _2612;
    float _2616 = _2602 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2618 = -_1770;
    float _2620 = _2618 + 1.0;
    out.m_91.x = _2616;
    float _2622 = _1699 * _2620;
    float _2624 = _1310 * _1368;
    float _2626 = _2580;
    float _2628 = _2574;
    float _2630 = _2624;
    if (!_2614)
    {
        _2626 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2632 = _2626;
    float _2634 = _2632;
    float _2636 = _2632;
    if (!_2614)
    {
        _2628 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2638 = _2628;
    out.m_93.x = _2598;
    out.m_93.y = _2600;
    out.m_93.z = _2604;
    out.m_93.w = _2622;
    float _2640 = _2624 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2642 = _2638;
    float _2644 = _2638;
    if (!_2614)
    {
        _2630 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2646 = _2630;
    bool _2648 = !_2614;
    float _2650 = _2646;
    float _2652 = _2646;
    if (!_2648)
    {
        bool _2654 = _1400 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2656 = isnan(_1400);
        bool _2658 = _2654 || _2656;
        bool _2660 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2662 = _2658 || _2660;
        if (!_2662)
        {
            float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2666 = _1400 + _2664;
            float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2670 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2668;
            float _2672 = 1.0 / _2670;
            float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2682 = _2666 * _2672;
            float _2684 = precise::clamp(_2682, 0.0, 1.0);
            float _2686 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2688 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2690 = fma(_2684, _2680, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2692 = fma(_2684, _2688, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2694 = fma(_2684, _2676, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2644 = _2694;
            _2636 = _2692;
            _2652 = _2690;
            _2696 = true;
        }
        else
        {
            bool _2698 = _1400 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2700 = isnan(_1400);
            bool _2702 = _2698 || _2700;
            bool _2704 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2706 = _2702 || _2704;
            if (!_2706)
            {
                _2634 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2708 = _2634;
            _2636 = _2708;
            if (!_2706)
            {
                _2642 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2710 = _2642;
            _2644 = _2710;
            if (!_2706)
            {
                _2650 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2712 = _2650;
            bool _2714 = !_2706;
            _2652 = _2712;
            if (!_2714)
            {
                bool _2716 = _1400 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2718 = isnan(_1400);
                bool _2720 = _2716 || _2718;
                bool _2722 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2724 = _2720 || _2722;
                if (!_2724)
                {
                    float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2728 = _1400 + _2726;
                    float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2732 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2730;
                    float _2734 = 1.0 / _2732;
                    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2742 = _2740 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2744 = _2728 * _2734;
                    float _2746 = precise::clamp(_2744, 0.0, 1.0);
                    float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2750 = _2748 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2752 = fma(_2746, _2742, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2754 = fma(_2746, _2750, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2756 = fma(_2746, _2738, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2644 = _2756;
                    _2636 = _2754;
                    _2652 = _2752;
                    _2696 = true;
                }
                else
                {
                    _2644 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2636 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2652 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2696 = false;
    float _2758 = _2644;
    float _2760 = _2636;
    float _2762 = _2652;
    float _2764 = _2640 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_95.x = 0.0;
    float _2766 = _2758 * 0.586610972881317138671875;
    bool _2768 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_53.x = _2764;
    float _2770 = fma(_2760, 0.298911988735198974609375, _2766);
    bool _2772 = _1310 > 0.0;
    bool _2774 = isnan(_1310);
    bool _2776 = _2772 || _2774;
    bool _2778 = isnan(0.0);
    bool _2780 = _2776 || _2778;
    float _2782 = fma(_2762, 0.114477999508380889892578125, _2770);
    bool _2784 = _1368 <= 0.0;
    bool _2786 = !_2780;
    bool _2788 = _2784 || _2786;
    float _2790 = -_2782;
    float _2792 = _2790 + _2760;
    float _2794 = -_2782;
    float _2796 = _2794 + _2758;
    float _2798 = -_2782;
    float _2800 = _2798 + _2762;
    float _2802 = fma(_2792, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2782);
    float _2804 = fma(_2796, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2782);
    float _2806 = fma(_2800, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2782);
    bool _2808 = !_2768;
    if (!_2808)
    {
        float _2810 = -_1238;
        float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2814 = -_1240;
        float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2818 = -_1242;
        float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2822 = _2812 * _2812;
        float _2824 = fma(_2816, _2816, _2822);
        float _2826 = fma(_2820, _2820, _2824);
        float _2828 = sqrt(_2826);
        float _2830 = rsqrt(_2826);
        float _2832 = -_2828;
        float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2836 = _2834 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2838 = precise::clamp(_2836, 0.0, 1.0);
        float _2840 = _2816 * _2830;
        float _2842 = _2812 * _2830;
        float _2844 = abs(_2838);
        float _2846 = log2(_2844);
        float _2848 = _2820 * _2830;
        float _2850 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2852 = _2478 * _2842;
        float _2854 = -_2842;
        float _2856 = -_2850;
        float _2858 = fma(_2854, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2856);
        float _2860 = fma(_2452, _2840, _2852);
        float _2862 = -_2848;
        float _2864 = fma(_2862, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2858);
        float _2866 = fma(_2494, _2848, _2860);
        float _2868 = precise::clamp(_2866, 0.0, 1.0);
        float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2872 = _2864 + _2870;
        float _2874 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2876 = _2872 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2878 = precise::clamp(_2876, 0.0, 1.0);
        float _2880 = exp2(_2874);
        float _2882 = _2880 * _2878;
        float _2884 = _2868 * _2882;
        float _2886 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2888 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2890 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2886;
        out.m_95.y = _2888;
        out.m_95.z = _2890;
    }
    out.m_97.x = _2802;
    out.m_97.y = _2804;
    out.m_97.z = _2806;
    if (!_2788)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2892 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2892;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2696 = false;
    bool _348 = false;
    bool _240 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = in.m_48.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _122;
    bool _126 = _118 >= 1;
    float _128 = 0.0;
    float _130 = _113;
    float _132 = _122;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _128;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _136 = 0;
    if (!_126)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2960 = as_type<float>(_140);
        out.gl_Position.z = _2960;
    }
    if (!_126)
    {
        return out;
    }
    bool _144 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_113);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = float(_118);
    bool _156 = _122 >= _154;
    bool _158 = !_152;
    bool _160 = _156 || _158;
    if (_160)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _130;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _142 = as_type<int>(_164);
    }
    int _166 = _142;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3015 = as_type<float>(_166);
        out.gl_Position.z = _3015;
    }
    if (_160)
    {
        return out;
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = 1.0 / _154;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = in.m_57.x;
    float _180 = in.m_57.y;
    float _182 = in.m_57.z;
    float _184 = in.m_59.x;
    float _186 = in.m_59.y;
    float _188 = in.m_59.z;
    float _190 = in.m_61.x;
    float _192 = in.m_61.y;
    float _194 = in.m_61.z;
    float _196 = _122 * _174;
    float _198 = _170 * _180;
    float _200 = _170 * _186;
    float _202 = fma(_168, _178, _198);
    float _204 = _170 * _192;
    float _206 = fma(_168, _184, _200);
    float _208 = fma(_172, _182, _202);
    float _210 = fma(_168, _190, _204);
    float _212 = fma(_172, _188, _206);
    float _214 = fma(_172, _194, _210);
    bool _216 = !_176;
    float _218 = _196;
    float _220 = _212;
    float _238;
    if (!_216)
    {
        float _222 = in.m_63.x;
        float _224 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _226 = _222 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _228 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _230 = _228 * _224;
        float _232 = floor(_230);
        float _234 = -_232;
        float _236 = _230 + _234;
        _238 = _236;
        _240 = true;
    }
    else
    {
        _238 = _196;
    }
    _240 = false;
    float _242 = _238;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = _242 + _244;
    bool _248 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _250 = isnan(_242);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _260;
    bool _264 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _266 = isnan(_242);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -_258;
    float _278 = _276 + 1.0;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _280;
    float _284 = 1.0 / _262;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _288 = _246 * _284;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _290;
    float _294 = _274 * _278;
    float _296 = fma(_282, _288, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = -_274;
    float _300 = _298 + 1.0;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _302;
    float _306 = fma(_292, _288, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _308 = _296 * _294;
    float _310 = fma(_304, _288, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _312 = _306 * _294;
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[143].x, _308);
    float _316 = _310 * _294;
    float _318 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[143].z, _312);
    float _320 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[143].y, _316);
    float _322 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[144].x, _314);
    float _324 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[144].y, _320);
    float _326 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[144].z, _318);
    bool _328 = !_286;
    float _346;
    if (!_328)
    {
        float _330 = in.m_63.x;
        float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _334 = _330 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _338 = _336 * _332;
        float _340 = floor(_338);
        float _342 = -_340;
        float _344 = _338 + _342;
        _346 = _344;
        _348 = true;
    }
    else
    {
        _346 = _196;
    }
    _348 = false;
    float _350 = _346;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _354 = _350 + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _360 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _362 = isnan(_350);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _380 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _382 = isnan(_350);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = 1.0 / _358;
    float _394 = -_370;
    float _396 = _394 + 1.0;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _398;
    bool _402 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _404 = isnan(_350);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = _390 * _396;
    float _416 = -_390;
    float _418 = _416 + 1.0;
    bool _420 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _422 = 1.0 / _374;
    float _424 = _412 * _418;
    float _426 = -_412;
    float _428 = _426 + 1.0;
    float _430 = 1.0 / _378;
    float _432 = _400 * _392;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _438 = fma(_432, _354, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _440 = _436 * _422;
    bool _442 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _444 = isnan(_350);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _460 = _350 + _458;
    float _462 = _438 * _424;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _466 = _350 + _464;
    float _468 = -_452;
    float _470 = _468 + 1.0;
    float _472 = fma(_440, _460, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _474 = _456 * _430;
    float _476 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[115].x, _462);
    float _478 = _370 * _470;
    float _480 = fma(_474, _466, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _482 = fma(_472, _414, _476);
    float _484 = fma(_480, _478, _482);
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _490 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[118].x, _484);
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _494 = _488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _496 = in.m_65.x;
    float _498 = in.m_65.y;
    float _500 = in.m_65.z;
    float _502 = _486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _490 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _494;
    out.m_67.y = _502;
    out.m_67.z = _504;
    out.m_67.w = _506;
    float _508 = _324 * _498;
    float _510 = _326 * _500;
    float _512 = _322 * _496;
    bool _514 = !_420;
    if (!_514)
    {
        float _516 = in.m_63.x;
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _520 = _516 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _524 = _522 * _518;
        float _526 = floor(_524);
        float _528 = -_526;
        float _530 = _524 + _528;
        _218 = _530;
    }
    float _532 = _218;
    float _534 = in.m_63.z;
    float _536 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _538 = int(_536);
    float _540 = in.m_63.x;
    float _542 = in.m_63.y;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _558 = _556 != 0;
    float _560 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _562 = int(_560);
    float _564 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _566 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _568 = !_554;
    int _570 = _568 ? 0 : 1;
    float _572 = in.m_61.w;
    bool _574 = !_550;
    int _576 = _574 ? 0 : 1;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _580 = !_558;
    int _582 = _580 ? 0 : 1;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _586 = _584 != 0;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _590 = _588 != 0;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _594 = _592 != 0;
    float _596 = float(_538);
    float _598 = _534 * 2.0;
    bool _600 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _602 = isnan(1.0);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _608 = _604 || _606;
    float _610 = 1.0 / _596;
    float _612 = float(_562);
    float _614 = _540 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _616 = _542 + _540;
    float _618 = _540 * 2.0;
    float _620 = _542 * 2.0;
    float _622 = -_544;
    float _624 = fma(_614, 2.0, _622);
    float _626 = _542 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _628 = floor(_598);
    float _630 = _616 + (-1.0);
    float _632 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[78].w, _578);
    float _634 = fma(_626, -2.0, _546);
    float _636 = _612 * _122;
    float _638 = -_122;
    float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[76].x, _624);
    float _642 = floor(_618);
    float _644 = _610 * _122;
    float _646 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _632);
    bool _648 = _628 > 0.0;
    float _650 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _652 = _628 >= 0.0;
    bool _654 = isnan(_628);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _664 = log2(_662);
    bool _666 = !_586;
    int _668 = _666 ? 0 : 1;
    int _670 = _660 ? 0 : 1;
    int _672 = abs(_668);
    bool _674 = _642 >= 0.0;
    bool _676 = isnan(_642);
    bool _678 = _674 || _676;
    bool _680 = isnan(0.0);
    bool _682 = _678 || _680;
    float _684 = floor(_620);
    float _686 = float(_672);
    bool _688 = _642 > 0.0;
    int _690 = _682 ? 0 : 1;
    int _692 = ~_670;
    int _694 = _692 + 1;
    int _696 = _694 + 1;
    int _698 = _696;
    if (!_648)
    {
        int _700 = ~_670;
        int _702 = _700 + 1;
        _698 = _702;
    }
    int _704 = _698;
    int _706 = ~_690;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    float _712 = float(_704);
    float _714 = _664 * _122;
    bool _716 = _684 > 0.0;
    bool _718 = _684 >= 0.0;
    bool _720 = isnan(_684);
    bool _722 = _718 || _720;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    float _728 = _686 * _712;
    float _730 = in.m_69.x;
    float _732 = in.m_69.y;
    float _734 = in.m_69.z;
    float _736 = exp2(_714);
    int _738 = _710;
    if (!_688)
    {
        int _740 = ~_690;
        int _742 = _740 + 1;
        _738 = _742;
    }
    int _744 = _738;
    float _746 = _728 * (-2.0);
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _752 = 1.0 + _750;
    bool _754 = !_590;
    int _756 = _754 ? 0 : 1;
    float _758 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[78].z, _748);
    float _760 = 1.0 / _752;
    int _762 = abs(_756);
    float _764 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _634);
    float _766 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _758);
    int _768 = _726 ? 0 : 1;
    bool _770 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _772 = isnan(0.0);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _778 = _774 || _776;
    float _780 = -_736;
    float _782 = _780 + 1.0;
    int _784 = ~_768;
    int _786 = _784 + 1;
    int _788 = _786 + 1;
    float _790 = float(_744);
    float _792 = float(_762);
    float _794 = _778 ? _782 : 0.0;
    int _796 = _788;
    if (!_716)
    {
        int _798 = ~_768;
        int _800 = _798 + 1;
        _796 = _800;
    }
    int _802 = _796;
    float _804 = fma(_650, _746, _650);
    bool _806 = !_594;
    int _808 = _806 ? 0 : 1;
    float _810 = fma(_746, _730, _730);
    float _812 = _542 + _534;
    float _814 = _792 * _790;
    if (_608)
    {
        float _816 = _794 * _760;
        _132 = _816;
    }
    float _818 = _132;
    float _820 = _540 + (-0.5);
    int _822 = abs(_808);
    float _824 = _812 + (-1.0);
    float _826 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[196].x, _810);
    float _828 = float(_822);
    float _830 = _814 * (-2.0);
    float _832 = float(_802);
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _836 = fma(_804, _818, _826);
    float _838 = fma(_834, _830, _834);
    float _840 = _828 * _832;
    float _842 = fma(_830, _732, _732);
    float _844 = _534 + _540;
    float _846 = _542 + (-0.5);
    float _848 = _836 * 0.15915493667125701904296875;
    float _850 = _844 + (-1.0);
    float _852 = _840 * (-2.0);
    float _854 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[196].y, _842);
    float _856 = _534 + (-0.5);
    float _858 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _860 = fma(_852, _734, _734);
    float _862 = fma(_838, _818, _854);
    float _864 = _848 * 6.283185482025146484375;
    float _866 = sin(_864);
    float _868 = in.m_46.x;
    float _870 = in.m_46.y;
    float _872 = in.m_46.z;
    float _874 = fma(_858, _852, _858);
    float _876 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[196].z, _860);
    float _878 = _862 * 0.15915493667125701904296875;
    float _880 = in.m_71.x;
    float _882 = in.m_71.y;
    float _884 = in.m_71.z;
    float _886 = fma(_874, _818, _876);
    float _888 = _848 * 6.283185482025146484375;
    float _890 = cos(_888);
    float _892 = _886 * 0.15915493667125701904296875;
    float _894 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _896 = _878 * 6.283185482025146484375;
    float _898 = sin(_896);
    float _900 = _878 * 6.283185482025146484375;
    float _902 = cos(_900);
    float _904 = _192 * _870;
    float _906 = _186 * _870;
    float _908 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    float _912 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _880);
    float _914 = _892 * 6.283185482025146484375;
    float _916 = cos(_914);
    float _918 = fma(_190, _868, _904);
    float _920 = _894 * _908;
    float _922 = _564 * _910;
    float _924 = _866 * _898;
    float _926 = _566 * _912;
    float _928 = _890 * _898;
    float _930 = fma(_184, _868, _906);
    float _932 = _892 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = _890 * _902;
    float _938 = _866 * _902;
    float _940 = fma(_188, _872, _930);
    float _942 = _890 * _916;
    float _944 = _866 * _916;
    float _946 = _902 * _916;
    float _948 = _898 * _916;
    float _950 = _942 * _920;
    float _952 = in.m_57.w;
    float _954 = _944 * _920;
    float _956 = fma(_934, _936, _924);
    float _958 = -_920;
    float _960 = _934 * _958;
    float _962 = -_938;
    float _964 = fma(_934, _928, _962);
    float _966 = -_928;
    float _968 = fma(_934, _938, _966);
    float _970 = fma(_956, _926, _950);
    float _972 = fma(_946, _926, _960);
    float _974 = fma(_934, _924, _936);
    float _976 = fma(_968, _926, _954);
    float _978 = fma(_964, _922, _970);
    float _980 = fma(_948, _922, _972);
    float _982 = _180 * _870;
    float _984 = fma(_974, _922, _976);
    float _986 = _978 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _988 = _978 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _990 = fma(_178, _868, _982);
    float _992 = fma(_194, _872, _918);
    float _994 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[26].x, _986);
    float _996 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[24].x, _988);
    float _998 = fma(_182, _872, _990);
    float _1000 = _992 + _572;
    float _1002 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[26].z, _994);
    float _1004 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[24].z, _996);
    float _1006 = _998 + _952;
    float _1008 = in.m_59.w;
    float _1010 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1012 = _1004 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1014 = _978 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1016 = _1000 + _1010;
    float _1018 = _1006 + _1012;
    float _1020 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1014);
    float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1024 = _1016 + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1028 = _1018 + _1026;
    float _1030 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1020);
    float _1032 = _1024 * _1024;
    float _1034 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1036 = fma(_1028, _1028, _1032);
    float _1038 = sqrt(_1036);
    float _1040 = _940 + _1008;
    float _1042 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1044 = _1040 + _1034;
    float _1046 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1042);
    float _1048 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1046);
    bool _1050 = _1038 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1052 = _872;
    float _1054 = _1030;
    float _1056 = _1014;
    float _1058 = _1038;
    if (!_1050)
    {
        _1052 = _1018;
    }
    float _1060 = _1052;
    float _1062 = _1060;
    if (!_1050)
    {
        _1054 = _1016;
    }
    float _1064 = _1054;
    float _1066 = _1064;
    if (!_1050)
    {
        _1056 = _1044;
    }
    float _1068 = _1056;
    bool _1070 = !_1050;
    float _1072 = _1068;
    if (!_1070)
    {
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1078 = _1038 + _1076;
        float _1080 = rsqrt(_1036);
        float _1082 = _1078 * _1074;
        float _1084 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = _1082 * 0.15915493667125701904296875;
        float _1088 = _1086 * 6.283185482025146484375;
        float _1090 = cos(_1088);
        float _1092 = _1086 * 6.283185482025146484375;
        float _1094 = sin(_1092);
        float _1096 = _1090 + (-1.0);
        float _1098 = fma(_1094, _1084, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1100 = _1096 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1102 = _1080 * _1098;
        float _1104 = fma(_1044, _1090, _1100);
        float _1106 = fma(_1028, _1102, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1108 = fma(_1024, _1102, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1072 = _1104;
        _1062 = _1106;
        _1066 = _1108;
    }
    float _1110 = _1072;
    float _1112 = _1062;
    float _1114 = _1066;
    float _1116 = -_1040;
    float _1118 = _1116 + _1110;
    float _1120 = -_1006;
    float _1122 = _1120 + _1112;
    float _1124 = _1048 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1126 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1128 = _1118 * _1118;
    float _1130 = -_1000;
    float _1132 = _1130 + _1114;
    float _1134 = 1.0 / _1124;
    bool _1136 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1138 = isnan(0.5);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1144 = _1140 || _1142;
    float _1146 = fma(_1122, _1122, _1128);
    float _1148 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1126);
    float _1150 = fma(_1132, _1132, _1146);
    float _1152 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1148);
    float _1154 = sqrt(_1150);
    float _1156 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1158 = _1156 + _1124;
    float _1160 = _1158 * _1134;
    float _1162 = _1160 * 0.5;
    float _1164 = _1134;
    float _1166 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1168 = _1110;
    float _1170 = _1112;
    float _1172 = _1114;
    float _1174 = _1124;
    if (_1144)
    {
        _1164 = 1.0;
    }
    float _1176 = _1164;
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1178);
    bool _1182 = _1154 > 0.0;
    float _1184 = 1.0 / _1180;
    bool _1186 = !_1182;
    float _1188 = _1176;
    if (!_1186)
    {
        float _1190 = _212 * _212;
        float _1192 = rsqrt(_1150);
        float _1194 = fma(_208, _208, _1190);
        float _1196 = fma(_214, _214, _1194);
        float _1198 = sqrt(_1196);
        float _1200 = _1118 * _1192;
        float _1202 = _1132 * _1192;
        bool _1204 = _1198 > 0.0;
        float _1206 = _1122 * _1192;
        bool _1208 = !_1204;
        _1166 = _1206;
        _1174 = _1200;
        _1058 = _1202;
        if (!_1208)
        {
            float _1210 = rsqrt(_1196);
            float _1212 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1214 = _212 * _1210;
            float _1216 = _208 * _1210;
            float _1218 = _1200 * _1214;
            float _1220 = _214 * _1210;
            float _1222 = fma(_1206, _1216, _1218);
            float _1224 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1226 = fma(_1202, _1220, _1222);
            float _1228 = _1226 * _1224;
            float _1230 = fma(_208, _1228, _1112);
            float _1232 = fma(_212, _1228, _1110);
            float _1234 = fma(_214, _1228, _1114);
            _1168 = _1232;
            _1170 = _1230;
            _1172 = _1234;
        }
    }
    float _1236 = _1166;
    float _1238 = _1168;
    float _1240 = _1170;
    float _1242 = _1172;
    float _1244 = _1174;
    float _1246 = _1058;
    float _1248 = _1246;
    float _1250 = _1236;
    if (_1144)
    {
        _1248 = 1.0;
    }
    float _1252 = _1248;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1256 = _1184 * _1254;
    float _1258 = _1252;
    if (!_1144)
    {
        float _1260 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1262 = _1260 * 0.15915493667125701904296875;
        float _1264 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1266 = _1262 * 6.283185482025146484375;
        float _1268 = cos(_1266);
        float _1270 = _1264 * 0.15915493667125701904296875;
        float _1272 = _1262 * 6.283185482025146484375;
        float _1274 = sin(_1272);
        float _1276 = 1.0 / _1268;
        float _1278 = _1270 * 6.283185482025146484375;
        float _1280 = cos(_1278);
        float _1282 = _1274 * _1276;
        float _1284 = _1270 * 6.283185482025146484375;
        float _1286 = sin(_1284);
        float _1288 = _1280 * _1282;
        float _1290 = 1.0 / _1288;
        float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1294 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1292;
        float _1296 = 1.0 / _1294;
        float _1298 = _1286 * _1290;
        float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1302 = fma(_1256, _1298, _1300);
        float _1304 = _1302 * _1296;
        float _1306 = precise::clamp(_1304, 0.0, 1.0);
        _1250 = _1262;
        _1188 = _1306;
    }
    float _1308 = _1250;
    float _1310 = _1188;
    float _1312 = _1308;
    if (!_1144)
    {
        float _1314 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1316 = _1314 * 0.15915493667125701904296875;
        float _1318 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1320 = _1316 * 6.283185482025146484375;
        float _1322 = cos(_1320);
        float _1324 = _1318 * 0.15915493667125701904296875;
        float _1326 = _1316 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        float _1330 = 1.0 / _1322;
        float _1332 = _1324 * 6.283185482025146484375;
        float _1334 = cos(_1332);
        float _1336 = _1328 * _1330;
        float _1338 = _1324 * 6.283185482025146484375;
        float _1340 = sin(_1338);
        float _1342 = _1334 * _1336;
        float _1344 = 1.0 / _1342;
        float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1348 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1346;
        float _1350 = 1.0 / _1348;
        float _1352 = _1340 * _1344;
        float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1356 = fma(_1256, _1352, _1354);
        float _1358 = _1356 * _1350;
        float _1360 = precise::clamp(_1358, 0.0, 1.0);
        float _1362 = -_1360;
        float _1364 = _1362 + 1.0;
        _1312 = _1322;
        _1258 = _1364;
    }
    float _1366 = _1312;
    float _1368 = _1258;
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1372 = _1238 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1376 = _1240 + _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1380 = _1242 + _1378;
    float _1382 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1384 = _1372 * _1372;
    float _1386 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1388 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1382);
    float _1390 = fma(_1376, _1376, _1384);
    float _1392 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1388);
    float _1394 = fma(_1380, _1380, _1390);
    float _1396 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1398 = rsqrt(_1394);
    float _1400 = sqrt(_1394);
    float _1402 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1404 = _1376 * _1402;
    float _1406 = _1380 * _1402;
    float _1408 = _1404 * _1404;
    float _1410 = _1406 * _1406;
    float _1412 = _1408 + _1410;
    float _1414 = sqrt(_1412);
    bool _1416 = _1414 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1420 = _1414 + _1418;
    float _1422 = _1150;
    float _1424 = _1420;
    float _1426 = _1404;
    float _1428 = _1406;
    float _1430 = _1408;
    float _1432 = _1410;
    if (_1416)
    {
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1422 = _1434;
    }
    float _1436 = _1422;
    if (_1416)
    {
        float _1438 = _1420 * _1436;
        _1424 = _1438;
    }
    float _1440 = _1424;
    if (_1416)
    {
        float _1442 = _1440 * 0.15915493667125701904296875;
        _220 = _1442;
    }
    float _1444 = _220;
    float _1446 = _1244;
    float _1448 = _1444;
    if (_1416)
    {
        float _1450 = _1444 * 6.283185482025146484375;
        float _1452 = sin(_1450);
        _1446 = _1452;
    }
    float _1454 = _1446;
    float _1456 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1458 = precise::max(0.0, _1456);
    float _1460 = _1366;
    float _1462 = _1458;
    if (_1416)
    {
        float _1464 = _1444 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        _1460 = _1466;
    }
    float _1468 = _1460;
    float _1470 = -_1402;
    float _1472 = -_1458;
    float _1474 = fma(_1372, _1470, _1472);
    float _1476 = _1456;
    if (_1416)
    {
        float _1478 = rsqrt(_1412);
        _1476 = _1478;
    }
    float _1480 = _1476;
    if (_1416)
    {
        float _1482 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1462 = _1482;
    }
    float _1484 = _1462;
    float _1486 = fma(_1006, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1488 = _1484;
    float _1490 = _1454;
    if (_1416)
    {
        float _1492 = fma(_1454, _1484, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1488 = _1492;
    }
    float _1494 = _1488;
    float _1496 = _1494;
    if (_1416)
    {
        float _1498 = _1468 + (-1.0);
        _1490 = _1498;
    }
    float _1500 = _1490;
    float _1502 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1504 = floor(_1486);
    float _1506 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1502);
    float _1508 = _1480;
    if (_1416)
    {
        float _1510 = _1480 * _1494;
        _1448 = _1510;
    }
    float _1512 = _1448;
    if (_1416)
    {
        float _1514 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1514;
    }
    float _1516 = _1496;
    if (!_1416)
    {
        _1508 = _1474;
    }
    float _1518 = _1508;
    float _1520 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1506);
    float _1522 = _1518;
    if (_1416)
    {
        float _1524 = _1404 * _1512;
        _1426 = _1524;
    }
    float _1526 = _1426;
    if (_1416)
    {
        float _1528 = fma(_1474, _1468, _1516);
        _1522 = _1528;
    }
    float _1530 = _1522;
    if (_1416)
    {
        float _1532 = _1406 * _1512;
        _1428 = _1532;
    }
    float _1534 = _1428;
    if (_1416)
    {
        float _1536 = _1526 * _1526;
        _1430 = _1536;
    }
    float _1538 = _1430;
    if (_1416)
    {
        float _1540 = _1534 * _1534;
        _1432 = _1540;
    }
    float _1542 = _1432;
    float _1544 = fma(_1530, _1530, _1538);
    float _1546 = fma(_1000, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1548 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1550 = _1544 + _1542;
    float _1552 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1554 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1556 = fma(_1400, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1554);
    float _1558 = precise::clamp(_1556, 0.0, 1.0);
    float _1560 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1548);
    float _1562 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1386);
    float _1564 = _1520 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1566 = rsqrt(_1550);
    float _1568 = -_1558;
    float _1570 = _1568 + 1.0;
    float _1572 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1574 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1562);
    float _1576 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1560);
    float _1578 = -_1572;
    float _1580 = fma(_1578, _1552, 1.0);
    float _1582 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1584 = abs(_1570);
    float _1586 = log2(_1584);
    float _1588 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1590 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1592 = -_1504;
    float _1594 = _1486 + _1592;
    float _1596 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1598 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1590);
    float _1600 = _1566 * _1526;
    float _1602 = _1566 * _1530;
    float _1604 = _1566 * _1534;
    float _1606 = floor(_1546);
    float _1608 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1610 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1598);
    float _1612 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1596);
    float _1614 = -_1608;
    float _1616 = fma(_1602, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1614);
    float _1618 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1620 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1610);
    float _1622 = log2(_1580);
    float _1624 = -_1604;
    float _1626 = fma(_1624, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1616);
    float _1628 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1630 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1612);
    float _1632 = fma(_1626, -0.5, 0.5);
    float _1634 = fma(_1626, 0.5, 0.5);
    float _1636 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1628);
    float _1638 = exp2(_1618);
    float _1640 = -_1606;
    float _1642 = _1546 + _1640;
    float _1644 = fma(_1634, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1646 = _1602 + 1.0;
    float _1648 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1636);
    float _1650 = fma(_1634, _1644, -0.212114393711090087890625);
    float _1652 = 1.0 / _1620;
    float _1654 = fma(_1634, _1650, 1.570728778839111328125);
    float _1656 = _1622 * 0.693147182464599609375;
    float _1658 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1660 = sqrt(_1632);
    float _1662 = -_1602;
    float _1664 = fma(_1638, _1646, _1662);
    float _1666 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1630);
    float _1668 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1648);
    float _1670 = _1666 * _1652;
    float _1672 = _1668 * _1652;
    float2 _5338 = float2(_1594, _1642);
    float _1674 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5338, float2(0.0), isnan(_5338)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5338, float2(0.0), isnan(_5338)), level(0.0)).x;
    float _1676 = fma(_1672, -0.5, 0.5);
    float _1678 = _1660 * 0.636619746685028076171875;
    float _1680 = fma(_1670, 0.5, 0.5);
    float _1682 = -_1654;
    float _1684 = fma(_1678, _1682, 1.0);
    float _1686 = fma(_1664, 0.5, 0.5);
    float3 _5363 = float3(_1680, _1676, _1658);
    float _1688 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5363, float3(0.0), isnan(_5363)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5363, float3(0.0), isnan(_5363)), level(0.0)).x;
    float3 _5374 = float3(_1680, _1676, _1658);
    float4 _1691 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5374, float3(0.0), isnan(_5374)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5374, float3(0.0), isnan(_5374)), level(0.0)).xyzw;
    float _1693 = _1691.x;
    float _1695 = _1691.y;
    float _1697 = _1691.z;
    float _1699 = _1691.w;
    float2 _5390 = float2(_1684, _1686);
    float3 _1703 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5390, float2(0.0), isnan(_5390)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5390, float2(0.0), isnan(_5390)), level(0.0)).xyz;
    float _1705 = _1703.x;
    float _1707 = _1703.y;
    float _1709 = _1703.z;
    float _1711 = float(uint(_562));
    float _1713 = trunc(_644);
    int _1715 = int(_1713);
    bool _1717 = _562 == 0;
    float _1719 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1721 = abs(_570);
    float _1723 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1725 = abs(_582);
    float _1727 = 1.0 / _1711;
    int _1729 = ~_562;
    int _1731 = _1729 + 1;
    float _1733 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1723);
    bool _1735 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1737 = isnan(_532);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1743 = _1739 || _1741;
    float _1745 = float(_1743);
    float _1747 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1733);
    float _1749 = float(uint(_1715));
    float _1751 = exp2(_1719);
    float _1753 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1747);
    out.gl_Position.x = _1666;
    out.gl_Position.y = _1668;
    out.gl_Position.z = _1753;
    out.gl_Position.w = _1620;
    int _1755 = as_type<int>(_1727) + (-2);
    float _1757 = as_type<float>(_1755) * _1749;
    float _1759 = -_1751;
    float _1761 = _1759 + 1.0;
    float _1763 = trunc(_1757);
    float _1765 = precise::max(_1763, 0.0);
    uint _1768 = uint(_1765);
    float _1770 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1772 = _1731 * int(_1768);
    int _1774 = _1772 + _1715;
    float _1776 = float(uint(_1774));
    float _1778 = as_type<float>(_1755) * _1776;
    float _1780 = trunc(_1778);
    float _1782 = precise::max(_1780, 0.0);
    uint _1784 = uint(_1782);
    int _1786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1788 = _1786 != 0;
    int _1790 = ~_562;
    int _1792 = _1790 + 1;
    bool _1794 = !_1788;
    float _1796 = _1794 ? 7.345489978790283203125 : 1.0;
    float _1798 = _1796 * _540;
    float _1800 = floor(_1798);
    int _1802 = int(_1768) + int(_1784);
    float _1804 = float(_1715);
    int _1806 = _1792 * _1802;
    int _1808 = _1806 + _1715;
    bool _1810 = _1804 >= _612;
    bool _1812 = isnan(_1804);
    bool _1814 = _1810 || _1812;
    bool _1816 = isnan(_612);
    bool _1818 = _1814 || _1816;
    float _1820 = float(_1818);
    bool _1822 = uint(_1808) >= uint(_562);
    float _1824 = trunc(_1820);
    int _1826 = int(_1824);
    float _1828 = -_1800;
    float _1830 = _1798 + _1828;
    bool _1832 = !_1822;
    int _1834 = _1832 ? 0 : (-1);
    float _1836 = _1830 * _612;
    int _1838 = ~_1802;
    int _1840 = _1838 + _1834;
    int _1842 = _1840 + 1;
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1846 = _1844 != 0;
    int _1848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1850 = _1848 != 0;
    int _1852 = _562 * _1842;
    int _1854 = _1852 + _1715;
    float _1856 = trunc(_1836);
    int _1858 = int(_1856);
    int _1860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1862 = _1860 != 0;
    int _1864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1866 = _1864 != 0;
    bool _1868 = !_1717;
    int _1870 = _1868 ? _1854 : (-1);
    float _1872 = _636 * _174;
    int _1874 = ~_1826;
    int _1876 = _1874 + 1;
    int _1878 = _1876 + 1;
    int _1880 = _562 + (-1);
    bool _1882 = !_1846;
    int _1884 = _1882 ? 0 : 1;
    float _1886 = trunc(_1872);
    int _1888 = int(_1886);
    int _1890 = _1870 * _1878;
    int _1892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1894 = _1892 != 0;
    float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1898 = _532 + _1896;
    int _1900 = abs(_1884);
    int _1902 = _1826 * _1880;
    int _1904 = _1902 + _1890;
    int _1906 = abs(_576);
    float _1908 = in.m_73.y;
    int _1910 = _1904 * _1721;
    bool _1912 = !_1894;
    int _1914 = _1912 ? 0 : 1;
    int _1916 = _1858 * _1900;
    int _1918 = _1916 + _1715;
    bool _1920 = _542 > 0.5;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1926 = _1888 * _1906;
    int _1928 = _1926 + _1910;
    float _1930 = 1.0 / _1924;
    int _1932 = abs(_1914);
    int _1934 = _1918 * _1725;
    int _1936 = _1934 + _1928;
    float _1938 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1940 = _1938 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1942 = _1858 * _1932;
    int _1944 = _1942 + _1936;
    float _1946 = 1.0 / _1940;
    float _1948 = float(uint(_1944));
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    float _1950 = -_1908;
    float _1952 = _1950 + 1.0;
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1954;
    float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1962 = ~_562;
    int _1964 = _1962 + 1;
    float _1966 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1968 = _1966 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1970 = _1956 * _1930;
    float _1972 = _1908;
    if (_1862)
    {
        float _1974 = _1920 ? _1952 : _1908;
        _1972 = _1974;
    }
    float _1976 = _1972;
    float _1978 = _1956;
    if (_1850)
    {
        float _1980 = in.m_63.x;
        _1978 = _1980;
    }
    float _1982 = _1978;
    float _1984 = fma(_1970, _1898, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1986 = 1.0 / _1968;
    float _1988 = as_type<float>(_1755) * _1948;
    bool _1990 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1992 = isnan(_532);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    float _2002 = _1960 * _1946;
    bool _2004 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2006 = isnan(_532);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2012 = _2008 || _2010;
    float _2014 = float(_2012);
    float _2016 = in.m_73.x;
    bool _2018 = _882 != 0.0;
    bool _2020 = isnan(_882);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan(0.0);
    bool _2026 = _2022 || _2024;
    float _2028 = -_2000;
    float _2030 = _2028 + 1.0;
    float _2032 = trunc(_1988);
    float _2034 = precise::max(_2032, 0.0);
    uint _2036 = uint(_2034);
    float _2038 = -_2014;
    float _2040 = _2038 + 1.0;
    float _2042 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2042;
    float _2046 = _2014 * _2030;
    bool _2048 = _880 == 0.0;
    bool _2050 = !_2026;
    bool _2052 = _2048 && _2050;
    float _2054 = _1745 * _2040;
    float _2056 = -_1745;
    float _2058 = _2056 + 1.0;
    float _2060 = _2044 * _1986;
    bool _2062 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2064 = isnan(_532);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2070 = _2066 || _2068;
    float _2072 = float(_2070);
    float _2074 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2076 = _532 + _2074;
    bool _2078 = _884 == 0.0;
    bool _2080 = _2078 && _2052;
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2084 = _532 + _2082;
    bool _2086 = _1982 > 0.5;
    bool _2088 = _2086 && _1850;
    float _2090 = _2072 * _2058;
    float _2092 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _2094 = _1964 * int(_2036);
    int _2096 = _2094 + _1944;
    float _2098 = -_2072;
    float _2100 = _2098 + 1.0;
    float _2102 = fma(_2002, _2076, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2104 = -_764;
    float _2106 = fma(_646, _2092, _2104);
    float _2108 = float(uint(_1918));
    float _2110 = fma(_2060, _2084, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2112 = float(uint(_2096));
    float _2114 = _1984 * _2090;
    float _2116 = _2092;
    float _2118 = _2016;
    if (_1850)
    {
        _2116 = _2016;
    }
    float _2120 = _2116;
    float _2122 = as_type<float>(_1755) * _2108;
    float _2124 = as_type<float>(_1755) * _2112;
    float _2126 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2114);
    float _2128 = in.m_77.x;
    float _2130 = in.m_77.y;
    float _2132 = in.m_77.z;
    float _2134 = _2120;
    if (_2088)
    {
        float _2136 = -_2120;
        float _2138 = _2136 + 1.0;
        _2134 = _2138;
    }
    float _2140 = _2134;
    float _2142 = trunc(_2122);
    float _2144 = precise::max(_2142, 0.0);
    uint _2146 = uint(_2144);
    int _2148 = ~_562;
    int _2150 = _2148 + 1;
    float _2152 = fma(_2102, _2054, _2126);
    if (_1850)
    {
        _2118 = _2140;
    }
    float _2154 = _2118;
    float _2156 = fma(_2110, _2046, _2152);
    float _2158 = trunc(_2124);
    float _2160 = precise::max(_2158, 0.0);
    uint _2162 = uint(_2160);
    float _2164 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2166 = ~_562;
    int _2168 = _2166 + 1;
    float _2170 = fma(_2000, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2156);
    float _2172 = fma(_766, _2164, _640);
    float _2174 = _2170 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2176 = abs(_1256);
    float _2178 = log2(_2176);
    float _2180 = _2172 + 0.5;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2184 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2186 = _2128;
    float _2188 = _2130;
    float _2190 = _2132;
    if (!_2080)
    {
        float _2192 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2128);
        _2186 = _2192;
    }
    float _2194 = _2186;
    int _2196 = _2150 * int(_2146);
    int _2198 = _2196 + _1918;
    int _2200 = int(_2036) + int(_2162);
    if (!_2080)
    {
        float _2202 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2130);
        _2188 = _2202;
    }
    float _2204 = _2188;
    if (!_2080)
    {
        float _2206 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2132);
        _2190 = _2206;
    }
    float _2208 = _2190;
    float _2210 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2212 = _2168 * _2200;
    int _2214 = _2212 + _1944;
    float _2216 = float(uint(_2198));
    float _2218 = _2184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2220 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2222 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2224 = uint(_2214) >= uint(_562);
    float _2226 = as_type<float>(_1755) * _2216;
    int _2228 = ~_562;
    int _2230 = _2228 + 1;
    float _2232 = _2222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2234 = !_2224;
    int _2236 = _2234 ? 0 : (-1);
    float _2238 = exp2(_2220);
    float _2240 = _942 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2242 = _1256 <= 8000.0;
    bool _2244 = isnan(_1256);
    bool _2246 = _2242 || _2244;
    bool _2248 = isnan(8000.0);
    bool _2250 = _2246 || _2248;
    float _2252 = float(_2250);
    out.m_79.x = _2232;
    out.m_79.y = _2210;
    out.m_79.z = _2218;
    out.m_79.w = _2174;
    int _2254 = ~_2200;
    int _2256 = _2254 + _2236;
    int _2258 = _2256 + 1;
    float _2260 = _2106 + 0.5;
    float _2262 = -_934;
    float _2264 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2240);
    float _2266 = trunc(_2226);
    float _2268 = precise::max(_2266, 0.0);
    uint _2270 = uint(_2268);
    int _2272 = _562 * _2258;
    int _2274 = _2272 + _1944;
    out.m_81.x = _2180;
    out.m_81.y = _2260;
    float _2276 = _942 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2278 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2264);
    bool _2280 = !_1717;
    int _2282 = _2280 ? _2274 : (-1);
    float _2284 = -_934;
    float _2286 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2276);
    float _2288 = _956 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2290 = _2282 & 3;
    bool _2292 = _2290 != 0;
    int _2294 = _2282 >> 31;
    int _2296 = int(_2146) + int(_2270);
    float _2298 = _942 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2300 = _2294 & 3;
    float _2302 = _964 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2304 = -_934;
    float _2306 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2298);
    int _2308 = _2282 + _2300;
    float _2310 = fma(_2238, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2312 = precise::clamp(_2310, 0.0, 1.0);
    float _2314 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2286);
    float _2316 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2306);
    int _2318 = _2308 >> 2;
    int _2320 = _2230 * _2296;
    int _2322 = _2320 + _1918;
    float _2324 = _956 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2326 = _956 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2328 = _2318 << 4;
    int _2330 = _2328 + 368;
    float _2332 = _964 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2334 = uint(_2322) >= uint(_562);
    float _2336 = _964 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _2338 = uint(int(uint(_2330) >> uint(2)));
    uint _2340 = uint(int(uint(int(_2338)) >> uint(2)));
    int _2342 = int(_2338) & 3;
    float _2344 = (*spvDescriptorSet0.vp_c9)._m0[int(_2340)][_2342];
    int _2346 = int(_2338) + 1;
    uint _2348 = uint(int(uint(_2346) >> uint(2)));
    int _2350 = _2346 & 3;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[int(_2348)][_2350];
    float _2354 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2324);
    float _2356 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2288);
    float _2358 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2326);
    float _2360 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2336);
    float _2362 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2302);
    float _2364 = _2278 * _2204;
    int _2366 = _2282 & 3;
    bool _2368 = _2366 != 0;
    int _2370 = _2330 + 8;
    uint _2372 = uint(int(uint(_2370) >> uint(2)));
    uint _2374 = uint(int(uint(int(_2372)) >> uint(2)));
    int _2376 = int(_2372) & 3;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[int(_2374)][_2376];
    int _2380 = int(_2372) + 1;
    uint _2382 = uint(int(uint(_2380) >> uint(2)));
    int _2384 = _2380 & 3;
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[int(_2382)][_2384];
    float _2388 = fma(_2312, -2.0, 3.0);
    float _2390 = _2312 * _2312;
    bool _2392 = uint(_2366) > 1u;
    float _2394 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2332);
    int _2396 = _2292 ? 0 : 1;
    float _2398 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2354);
    float _2400 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2356);
    float _2402 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2358);
    bool _2404 = _2366 != 3;
    float _2406 = _2316 * _2204;
    int _2408 = ~_2396;
    int _2410 = _2408 + 1;
    int _2412 = _2410 + 1;
    float _2414 = _2390 * _2388;
    bool _2416 = !_2334;
    int _2418 = _2416 ? 0 : (-1);
    float _2420 = _2314 * _2204;
    bool _2422 = uint(_2366) >= 2u;
    float _2424 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2360);
    int _2426 = _2412;
    if (!_2392)
    {
        int _2428 = ~_2396;
        int _2430 = _2428 + 1;
        _2426 = _2430;
    }
    int _2432 = _2426;
    float _2434 = fma(_2398, _2194, _2406);
    int _2436 = ~_2296;
    int _2438 = _2436 + _2418;
    int _2440 = _2438 + 1;
    float _2442 = fma(_2400, _2194, _2364);
    int _2444 = abs(_2432);
    float _2446 = fma(_2402, _2194, _2420);
    bool _2448 = !_2368;
    int _2450 = _2448 ? 0 : 1;
    float _2452 = fma(_2424, _2208, _2434);
    int _2454 = _2422 ? 0 : 1;
    float _2456 = in.m_83.x;
    bool _2458 = _2366 != 3;
    int _2460 = _562 * _2440;
    int _2462 = _2460 + _1918;
    float _2464 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2362);
    int _2466 = ~_2454;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    float _2472 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2394);
    bool _2474 = !_2458;
    int _2476 = _2474 ? 0 : (-1);
    float _2478 = fma(_2464, _2208, _2442);
    int _2480 = abs(_2450);
    float _2482 = -_1674;
    float _2484 = _2482 + 1.0;
    int _2486 = _2470;
    if (_2404)
    {
        int _2488 = ~_2454;
        int _2490 = _2488 + 1;
        _2486 = _2490;
    }
    int _2492 = _2486;
    float _2494 = fma(_2472, _2208, _2446);
    int _2496 = ~_2444;
    int _2498 = _2496 + 1;
    int _2500 = _2498 + 1;
    float _2502 = _1770 * _1688;
    bool _2504 = !_1866;
    int _2506 = _2504 ? 0 : 1;
    int _2508 = abs(_2476);
    int _2510 = _2500 * as_type<int>(_2352);
    int _2512 = abs(_2492);
    out.m_85.x = _2452;
    out.m_85.y = _2478;
    out.m_85.z = _2494;
    int _2514 = ~_2480;
    int _2516 = _2514 + 1;
    int _2518 = _2516 + 1;
    int _2520 = abs(_2506);
    int _2522 = _2518 * as_type<int>(_2344);
    int _2524 = _2522 + _2510;
    int _2526 = ~_2512;
    int _2528 = _2526 + 1;
    int _2530 = _2528 + 1;
    int _2532 = ~_2508;
    int _2534 = _2532 + 1;
    int _2536 = _2534 + 1;
    int _2538 = _2530 * as_type<int>(_2378);
    int _2540 = _2538 + _2524;
    bool _2542 = !_1717;
    int _2544 = _2542 ? _2462 : (-1);
    int _2546 = ~_2520;
    int _2548 = _2546 + 1;
    int _2550 = _2548 + 1;
    int _2552 = _2536 * as_type<int>(_2386);
    int _2554 = _2552 + _2540;
    float _2556 = -_2414;
    float _2558 = _2556 + 1.0;
    int _2560 = _2554 * _2550;
    float _2562 = fma(_2558, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2414);
    float _2564 = _1620 * 0.5;
    float _2566 = _1753 + _1620;
    int _2568 = _2544 * _2520;
    int _2570 = _2568 + _2560;
    float _2572 = _2252 * _2562;
    float _2574 = fma(_1668, -0.5, _2564);
    float _2576 = _1666 + _1620;
    float _2578 = _2572 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2580 = _2566 * 0.5;
    float _2582 = _2576 * 0.5;
    float _2584 = float(_2570);
    float _2586 = _2484 * _2578;
    float _2588 = precise::clamp(_2586, 0.0, 1.0);
    float _2590 = _1699 * _2502;
    float _2592 = _1709 * _2502;
    out.m_87.x = _2582;
    out.m_87.y = _2574;
    out.m_87.z = _2580;
    out.m_87.w = _1620;
    float _2594 = -_2588;
    float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2598 = fma(_1705, _2590, _1693);
    float _2600 = fma(_1707, _2590, _1695);
    out.m_89.x = _2584;
    float _2602 = _2596 * _2456;
    float _2604 = fma(_1699, _2592, _1697);
    bool _2606 = _1400 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2608 = isnan(_1400);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2614 = _2610 || _2612;
    float _2616 = _2602 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2618 = -_1770;
    float _2620 = _2618 + 1.0;
    out.m_91.x = _2616;
    float _2622 = _1699 * _2620;
    float _2624 = _1310 * _1368;
    float _2626 = _2580;
    float _2628 = _2574;
    float _2630 = _2624;
    if (!_2614)
    {
        _2626 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2632 = _2626;
    float _2634 = _2632;
    float _2636 = _2632;
    if (!_2614)
    {
        _2628 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2638 = _2628;
    out.m_93.x = _2598;
    out.m_93.y = _2600;
    out.m_93.z = _2604;
    out.m_93.w = _2622;
    float _2640 = _2624 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2642 = _2638;
    float _2644 = _2638;
    if (!_2614)
    {
        _2630 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2646 = _2630;
    bool _2648 = !_2614;
    float _2650 = _2646;
    float _2652 = _2646;
    if (!_2648)
    {
        bool _2654 = _1400 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2656 = isnan(_1400);
        bool _2658 = _2654 || _2656;
        bool _2660 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2662 = _2658 || _2660;
        if (!_2662)
        {
            float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2666 = _1400 + _2664;
            float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2670 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2668;
            float _2672 = 1.0 / _2670;
            float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2682 = _2666 * _2672;
            float _2684 = precise::clamp(_2682, 0.0, 1.0);
            float _2686 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2688 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2690 = fma(_2684, _2680, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2692 = fma(_2684, _2688, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2694 = fma(_2684, _2676, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2644 = _2694;
            _2636 = _2692;
            _2652 = _2690;
            _2696 = true;
        }
        else
        {
            bool _2698 = _1400 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2700 = isnan(_1400);
            bool _2702 = _2698 || _2700;
            bool _2704 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2706 = _2702 || _2704;
            if (!_2706)
            {
                _2634 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2708 = _2634;
            _2636 = _2708;
            if (!_2706)
            {
                _2642 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2710 = _2642;
            _2644 = _2710;
            if (!_2706)
            {
                _2650 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2712 = _2650;
            bool _2714 = !_2706;
            _2652 = _2712;
            if (!_2714)
            {
                bool _2716 = _1400 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2718 = isnan(_1400);
                bool _2720 = _2716 || _2718;
                bool _2722 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2724 = _2720 || _2722;
                if (!_2724)
                {
                    float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2728 = _1400 + _2726;
                    float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2732 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2730;
                    float _2734 = 1.0 / _2732;
                    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2742 = _2740 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2744 = _2728 * _2734;
                    float _2746 = precise::clamp(_2744, 0.0, 1.0);
                    float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2750 = _2748 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2752 = fma(_2746, _2742, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2754 = fma(_2746, _2750, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2756 = fma(_2746, _2738, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2644 = _2756;
                    _2636 = _2754;
                    _2652 = _2752;
                    _2696 = true;
                }
                else
                {
                    _2644 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2636 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2652 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2696 = false;
    float _2758 = _2644;
    float _2760 = _2636;
    float _2762 = _2652;
    float _2764 = _2640 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_95.x = 0.0;
    float _2766 = _2758 * 0.586610972881317138671875;
    bool _2768 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_53.x = _2764;
    float _2770 = fma(_2760, 0.298911988735198974609375, _2766);
    bool _2772 = _1310 > 0.0;
    bool _2774 = isnan(_1310);
    bool _2776 = _2772 || _2774;
    bool _2778 = isnan(0.0);
    bool _2780 = _2776 || _2778;
    float _2782 = fma(_2762, 0.114477999508380889892578125, _2770);
    bool _2784 = _1368 <= 0.0;
    bool _2786 = !_2780;
    bool _2788 = _2784 || _2786;
    float _2790 = -_2782;
    float _2792 = _2790 + _2760;
    float _2794 = -_2782;
    float _2796 = _2794 + _2758;
    float _2798 = -_2782;
    float _2800 = _2798 + _2762;
    float _2802 = fma(_2792, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2782);
    float _2804 = fma(_2796, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2782);
    float _2806 = fma(_2800, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2782);
    bool _2808 = !_2768;
    if (!_2808)
    {
        float _2810 = -_1238;
        float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2814 = -_1240;
        float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2818 = -_1242;
        float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2822 = _2812 * _2812;
        float _2824 = fma(_2816, _2816, _2822);
        float _2826 = fma(_2820, _2820, _2824);
        float _2828 = sqrt(_2826);
        float _2830 = rsqrt(_2826);
        float _2832 = -_2828;
        float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2836 = _2834 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2838 = precise::clamp(_2836, 0.0, 1.0);
        float _2840 = _2816 * _2830;
        float _2842 = _2812 * _2830;
        float _2844 = abs(_2838);
        float _2846 = log2(_2844);
        float _2848 = _2820 * _2830;
        float _2850 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2852 = _2478 * _2842;
        float _2854 = -_2842;
        float _2856 = -_2850;
        float _2858 = fma(_2854, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2856);
        float _2860 = fma(_2452, _2840, _2852);
        float _2862 = -_2848;
        float _2864 = fma(_2862, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2858);
        float _2866 = fma(_2494, _2848, _2860);
        float _2868 = precise::clamp(_2866, 0.0, 1.0);
        float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2872 = _2864 + _2870;
        float _2874 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2876 = _2872 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2878 = precise::clamp(_2876, 0.0, 1.0);
        float _2880 = exp2(_2874);
        float _2882 = _2880 * _2878;
        float _2884 = _2868 * _2882;
        float _2886 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2888 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2890 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2886;
        out.m_95.y = _2888;
        out.m_95.z = _2890;
    }
    out.m_97.x = _2802;
    out.m_97.y = _2804;
    out.m_97.z = _2806;
    if (!_2788)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2892 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2892;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2696 = false;
    bool _348 = false;
    bool _240 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = in.m_48.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _122;
    bool _126 = _118 >= 1;
    float _128 = 0.0;
    float _130 = _113;
    float _132 = _122;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _128;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _136 = 0;
    if (!_126)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2960 = as_type<float>(_140);
        out.gl_Position.z = _2960;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _144 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_113);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = float(_118);
    bool _156 = _122 >= _154;
    bool _158 = !_152;
    bool _160 = _156 || _158;
    if (_160)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _130;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _142 = as_type<int>(_164);
    }
    int _166 = _142;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3015 = as_type<float>(_166);
        out.gl_Position.z = _3015;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = 1.0 / _154;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = in.m_57.x;
    float _180 = in.m_57.y;
    float _182 = in.m_57.z;
    float _184 = in.m_59.x;
    float _186 = in.m_59.y;
    float _188 = in.m_59.z;
    float _190 = in.m_61.x;
    float _192 = in.m_61.y;
    float _194 = in.m_61.z;
    float _196 = _122 * _174;
    float _198 = _170 * _180;
    float _200 = _170 * _186;
    float _202 = fma(_168, _178, _198);
    float _204 = _170 * _192;
    float _206 = fma(_168, _184, _200);
    float _208 = fma(_172, _182, _202);
    float _210 = fma(_168, _190, _204);
    float _212 = fma(_172, _188, _206);
    float _214 = fma(_172, _194, _210);
    bool _216 = !_176;
    float _218 = _196;
    float _220 = _212;
    float _238;
    if (!_216)
    {
        float _222 = in.m_63.x;
        float _224 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _226 = _222 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _228 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _230 = _228 * _224;
        float _232 = floor(_230);
        float _234 = -_232;
        float _236 = _230 + _234;
        _238 = _236;
        _240 = true;
    }
    else
    {
        _238 = _196;
    }
    _240 = false;
    float _242 = _238;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = _242 + _244;
    bool _248 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _250 = isnan(_242);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _260;
    bool _264 = _242 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _266 = isnan(_242);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -_258;
    float _278 = _276 + 1.0;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _280;
    float _284 = 1.0 / _262;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _288 = _246 * _284;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _290;
    float _294 = _274 * _278;
    float _296 = fma(_282, _288, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = -_274;
    float _300 = _298 + 1.0;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _302;
    float _306 = fma(_292, _288, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _308 = _296 * _294;
    float _310 = fma(_304, _288, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _312 = _306 * _294;
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[143].x, _308);
    float _316 = _310 * _294;
    float _318 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[143].z, _312);
    float _320 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[143].y, _316);
    float _322 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[144].x, _314);
    float _324 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[144].y, _320);
    float _326 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[144].z, _318);
    bool _328 = !_286;
    float _346;
    if (!_328)
    {
        float _330 = in.m_63.x;
        float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _334 = _330 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _338 = _336 * _332;
        float _340 = floor(_338);
        float _342 = -_340;
        float _344 = _338 + _342;
        _346 = _344;
        _348 = true;
    }
    else
    {
        _346 = _196;
    }
    _348 = false;
    float _350 = _346;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _354 = _350 + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _360 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _362 = isnan(_350);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _380 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _382 = isnan(_350);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = 1.0 / _358;
    float _394 = -_370;
    float _396 = _394 + 1.0;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _398;
    bool _402 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _404 = isnan(_350);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = _390 * _396;
    float _416 = -_390;
    float _418 = _416 + 1.0;
    bool _420 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _422 = 1.0 / _374;
    float _424 = _412 * _418;
    float _426 = -_412;
    float _428 = _426 + 1.0;
    float _430 = 1.0 / _378;
    float _432 = _400 * _392;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _438 = fma(_432, _354, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _440 = _436 * _422;
    bool _442 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _444 = isnan(_350);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _460 = _350 + _458;
    float _462 = _438 * _424;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _466 = _350 + _464;
    float _468 = -_452;
    float _470 = _468 + 1.0;
    float _472 = fma(_440, _460, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _474 = _456 * _430;
    float _476 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[115].x, _462);
    float _478 = _370 * _470;
    float _480 = fma(_474, _466, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _482 = fma(_472, _414, _476);
    float _484 = fma(_480, _478, _482);
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _490 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[118].x, _484);
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _494 = _488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _496 = in.m_65.x;
    float _498 = in.m_65.y;
    float _500 = in.m_65.z;
    float _502 = _486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _490 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _494;
    out.m_67.y = _502;
    out.m_67.z = _504;
    out.m_67.w = _506;
    float _508 = _324 * _498;
    float _510 = _326 * _500;
    float _512 = _322 * _496;
    bool _514 = !_420;
    if (!_514)
    {
        float _516 = in.m_63.x;
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _520 = _516 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _524 = _522 * _518;
        float _526 = floor(_524);
        float _528 = -_526;
        float _530 = _524 + _528;
        _218 = _530;
    }
    float _532 = _218;
    float _534 = in.m_63.z;
    float _536 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _538 = int(_536);
    float _540 = in.m_63.x;
    float _542 = in.m_63.y;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _558 = _556 != 0;
    float _560 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _562 = int(_560);
    float _564 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _566 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _568 = !_554;
    int _570 = _568 ? 0 : 1;
    float _572 = in.m_61.w;
    bool _574 = !_550;
    int _576 = _574 ? 0 : 1;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _580 = !_558;
    int _582 = _580 ? 0 : 1;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _586 = _584 != 0;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _590 = _588 != 0;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _594 = _592 != 0;
    float _596 = float(_538);
    float _598 = _534 * 2.0;
    bool _600 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _602 = isnan(1.0);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _608 = _604 || _606;
    float _610 = 1.0 / _596;
    float _612 = float(_562);
    float _614 = _540 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _616 = _542 + _540;
    float _618 = _540 * 2.0;
    float _620 = _542 * 2.0;
    float _622 = -_544;
    float _624 = fma(_614, 2.0, _622);
    float _626 = _542 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _628 = floor(_598);
    float _630 = _616 + (-1.0);
    float _632 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[78].w, _578);
    float _634 = fma(_626, -2.0, _546);
    float _636 = _612 * _122;
    float _638 = -_122;
    float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[76].x, _624);
    float _642 = floor(_618);
    float _644 = _610 * _122;
    float _646 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _632);
    bool _648 = _628 > 0.0;
    float _650 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _652 = _628 >= 0.0;
    bool _654 = isnan(_628);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _664 = log2(_662);
    bool _666 = !_586;
    int _668 = _666 ? 0 : 1;
    int _670 = _660 ? 0 : 1;
    int _672 = abs(_668);
    bool _674 = _642 >= 0.0;
    bool _676 = isnan(_642);
    bool _678 = _674 || _676;
    bool _680 = isnan(0.0);
    bool _682 = _678 || _680;
    float _684 = floor(_620);
    float _686 = float(_672);
    bool _688 = _642 > 0.0;
    int _690 = _682 ? 0 : 1;
    int _692 = ~_670;
    int _694 = _692 + 1;
    int _696 = _694 + 1;
    int _698 = _696;
    if (!_648)
    {
        int _700 = ~_670;
        int _702 = _700 + 1;
        _698 = _702;
    }
    int _704 = _698;
    int _706 = ~_690;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    float _712 = float(_704);
    float _714 = _664 * _122;
    bool _716 = _684 > 0.0;
    bool _718 = _684 >= 0.0;
    bool _720 = isnan(_684);
    bool _722 = _718 || _720;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    float _728 = _686 * _712;
    float _730 = in.m_69.x;
    float _732 = in.m_69.y;
    float _734 = in.m_69.z;
    float _736 = exp2(_714);
    int _738 = _710;
    if (!_688)
    {
        int _740 = ~_690;
        int _742 = _740 + 1;
        _738 = _742;
    }
    int _744 = _738;
    float _746 = _728 * (-2.0);
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _752 = 1.0 + _750;
    bool _754 = !_590;
    int _756 = _754 ? 0 : 1;
    float _758 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[78].z, _748);
    float _760 = 1.0 / _752;
    int _762 = abs(_756);
    float _764 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _634);
    float _766 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _758);
    int _768 = _726 ? 0 : 1;
    bool _770 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _772 = isnan(0.0);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _778 = _774 || _776;
    float _780 = -_736;
    float _782 = _780 + 1.0;
    int _784 = ~_768;
    int _786 = _784 + 1;
    int _788 = _786 + 1;
    float _790 = float(_744);
    float _792 = float(_762);
    float _794 = _778 ? _782 : 0.0;
    int _796 = _788;
    if (!_716)
    {
        int _798 = ~_768;
        int _800 = _798 + 1;
        _796 = _800;
    }
    int _802 = _796;
    float _804 = fma(_650, _746, _650);
    bool _806 = !_594;
    int _808 = _806 ? 0 : 1;
    float _810 = fma(_746, _730, _730);
    float _812 = _542 + _534;
    float _814 = _792 * _790;
    if (_608)
    {
        float _816 = _794 * _760;
        _132 = _816;
    }
    float _818 = _132;
    float _820 = _540 + (-0.5);
    int _822 = abs(_808);
    float _824 = _812 + (-1.0);
    float _826 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[196].x, _810);
    float _828 = float(_822);
    float _830 = _814 * (-2.0);
    float _832 = float(_802);
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _836 = fma(_804, _818, _826);
    float _838 = fma(_834, _830, _834);
    float _840 = _828 * _832;
    float _842 = fma(_830, _732, _732);
    float _844 = _534 + _540;
    float _846 = _542 + (-0.5);
    float _848 = _836 * 0.15915493667125701904296875;
    float _850 = _844 + (-1.0);
    float _852 = _840 * (-2.0);
    float _854 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[196].y, _842);
    float _856 = _534 + (-0.5);
    float _858 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _860 = fma(_852, _734, _734);
    float _862 = fma(_838, _818, _854);
    float _864 = _848 * 6.283185482025146484375;
    float _866 = sin(_864);
    float _868 = in.m_46.x;
    float _870 = in.m_46.y;
    float _872 = in.m_46.z;
    float _874 = fma(_858, _852, _858);
    float _876 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[196].z, _860);
    float _878 = _862 * 0.15915493667125701904296875;
    float _880 = in.m_71.x;
    float _882 = in.m_71.y;
    float _884 = in.m_71.z;
    float _886 = fma(_874, _818, _876);
    float _888 = _848 * 6.283185482025146484375;
    float _890 = cos(_888);
    float _892 = _886 * 0.15915493667125701904296875;
    float _894 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _896 = _878 * 6.283185482025146484375;
    float _898 = sin(_896);
    float _900 = _878 * 6.283185482025146484375;
    float _902 = cos(_900);
    float _904 = _192 * _870;
    float _906 = _186 * _870;
    float _908 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    float _912 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _880);
    float _914 = _892 * 6.283185482025146484375;
    float _916 = cos(_914);
    float _918 = fma(_190, _868, _904);
    float _920 = _894 * _908;
    float _922 = _564 * _910;
    float _924 = _866 * _898;
    float _926 = _566 * _912;
    float _928 = _890 * _898;
    float _930 = fma(_184, _868, _906);
    float _932 = _892 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = _890 * _902;
    float _938 = _866 * _902;
    float _940 = fma(_188, _872, _930);
    float _942 = _890 * _916;
    float _944 = _866 * _916;
    float _946 = _902 * _916;
    float _948 = _898 * _916;
    float _950 = _942 * _920;
    float _952 = in.m_57.w;
    float _954 = _944 * _920;
    float _956 = fma(_934, _936, _924);
    float _958 = -_920;
    float _960 = _934 * _958;
    float _962 = -_938;
    float _964 = fma(_934, _928, _962);
    float _966 = -_928;
    float _968 = fma(_934, _938, _966);
    float _970 = fma(_956, _926, _950);
    float _972 = fma(_946, _926, _960);
    float _974 = fma(_934, _924, _936);
    float _976 = fma(_968, _926, _954);
    float _978 = fma(_964, _922, _970);
    float _980 = fma(_948, _922, _972);
    float _982 = _180 * _870;
    float _984 = fma(_974, _922, _976);
    float _986 = _978 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _988 = _978 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _990 = fma(_178, _868, _982);
    float _992 = fma(_194, _872, _918);
    float _994 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[26].x, _986);
    float _996 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[24].x, _988);
    float _998 = fma(_182, _872, _990);
    float _1000 = _992 + _572;
    float _1002 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[26].z, _994);
    float _1004 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[24].z, _996);
    float _1006 = _998 + _952;
    float _1008 = in.m_59.w;
    float _1010 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1012 = _1004 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1014 = _978 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1016 = _1000 + _1010;
    float _1018 = _1006 + _1012;
    float _1020 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1014);
    float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1024 = _1016 + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1028 = _1018 + _1026;
    float _1030 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1020);
    float _1032 = _1024 * _1024;
    float _1034 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1036 = fma(_1028, _1028, _1032);
    float _1038 = sqrt(_1036);
    float _1040 = _940 + _1008;
    float _1042 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1044 = _1040 + _1034;
    float _1046 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1042);
    float _1048 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1046);
    bool _1050 = _1038 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1052 = _872;
    float _1054 = _1030;
    float _1056 = _1014;
    float _1058 = _1038;
    if (!_1050)
    {
        _1052 = _1018;
    }
    float _1060 = _1052;
    float _1062 = _1060;
    if (!_1050)
    {
        _1054 = _1016;
    }
    float _1064 = _1054;
    float _1066 = _1064;
    if (!_1050)
    {
        _1056 = _1044;
    }
    float _1068 = _1056;
    bool _1070 = !_1050;
    float _1072 = _1068;
    if (!_1070)
    {
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1078 = _1038 + _1076;
        float _1080 = rsqrt(_1036);
        float _1082 = _1078 * _1074;
        float _1084 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = _1082 * 0.15915493667125701904296875;
        float _1088 = _1086 * 6.283185482025146484375;
        float _1090 = cos(_1088);
        float _1092 = _1086 * 6.283185482025146484375;
        float _1094 = sin(_1092);
        float _1096 = _1090 + (-1.0);
        float _1098 = fma(_1094, _1084, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1100 = _1096 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1102 = _1080 * _1098;
        float _1104 = fma(_1044, _1090, _1100);
        float _1106 = fma(_1028, _1102, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1108 = fma(_1024, _1102, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1072 = _1104;
        _1062 = _1106;
        _1066 = _1108;
    }
    float _1110 = _1072;
    float _1112 = _1062;
    float _1114 = _1066;
    float _1116 = -_1040;
    float _1118 = _1116 + _1110;
    float _1120 = -_1006;
    float _1122 = _1120 + _1112;
    float _1124 = _1048 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1126 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1128 = _1118 * _1118;
    float _1130 = -_1000;
    float _1132 = _1130 + _1114;
    float _1134 = 1.0 / _1124;
    bool _1136 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1138 = isnan(0.5);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1144 = _1140 || _1142;
    float _1146 = fma(_1122, _1122, _1128);
    float _1148 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1126);
    float _1150 = fma(_1132, _1132, _1146);
    float _1152 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1148);
    float _1154 = sqrt(_1150);
    float _1156 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1158 = _1156 + _1124;
    float _1160 = _1158 * _1134;
    float _1162 = _1160 * 0.5;
    float _1164 = _1134;
    float _1166 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1168 = _1110;
    float _1170 = _1112;
    float _1172 = _1114;
    float _1174 = _1124;
    if (_1144)
    {
        _1164 = 1.0;
    }
    float _1176 = _1164;
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1178);
    bool _1182 = _1154 > 0.0;
    float _1184 = 1.0 / _1180;
    bool _1186 = !_1182;
    float _1188 = _1176;
    if (!_1186)
    {
        float _1190 = _212 * _212;
        float _1192 = rsqrt(_1150);
        float _1194 = fma(_208, _208, _1190);
        float _1196 = fma(_214, _214, _1194);
        float _1198 = sqrt(_1196);
        float _1200 = _1118 * _1192;
        float _1202 = _1132 * _1192;
        bool _1204 = _1198 > 0.0;
        float _1206 = _1122 * _1192;
        bool _1208 = !_1204;
        _1166 = _1206;
        _1174 = _1200;
        _1058 = _1202;
        if (!_1208)
        {
            float _1210 = rsqrt(_1196);
            float _1212 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1214 = _212 * _1210;
            float _1216 = _208 * _1210;
            float _1218 = _1200 * _1214;
            float _1220 = _214 * _1210;
            float _1222 = fma(_1206, _1216, _1218);
            float _1224 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1226 = fma(_1202, _1220, _1222);
            float _1228 = _1226 * _1224;
            float _1230 = fma(_208, _1228, _1112);
            float _1232 = fma(_212, _1228, _1110);
            float _1234 = fma(_214, _1228, _1114);
            _1168 = _1232;
            _1170 = _1230;
            _1172 = _1234;
        }
    }
    float _1236 = _1166;
    float _1238 = _1168;
    float _1240 = _1170;
    float _1242 = _1172;
    float _1244 = _1174;
    float _1246 = _1058;
    float _1248 = _1246;
    float _1250 = _1236;
    if (_1144)
    {
        _1248 = 1.0;
    }
    float _1252 = _1248;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1256 = _1184 * _1254;
    float _1258 = _1252;
    if (!_1144)
    {
        float _1260 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1262 = _1260 * 0.15915493667125701904296875;
        float _1264 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1266 = _1262 * 6.283185482025146484375;
        float _1268 = cos(_1266);
        float _1270 = _1264 * 0.15915493667125701904296875;
        float _1272 = _1262 * 6.283185482025146484375;
        float _1274 = sin(_1272);
        float _1276 = 1.0 / _1268;
        float _1278 = _1270 * 6.283185482025146484375;
        float _1280 = cos(_1278);
        float _1282 = _1274 * _1276;
        float _1284 = _1270 * 6.283185482025146484375;
        float _1286 = sin(_1284);
        float _1288 = _1280 * _1282;
        float _1290 = 1.0 / _1288;
        float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1294 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1292;
        float _1296 = 1.0 / _1294;
        float _1298 = _1286 * _1290;
        float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1302 = fma(_1256, _1298, _1300);
        float _1304 = _1302 * _1296;
        float _1306 = precise::clamp(_1304, 0.0, 1.0);
        _1250 = _1262;
        _1188 = _1306;
    }
    float _1308 = _1250;
    float _1310 = _1188;
    float _1312 = _1308;
    if (!_1144)
    {
        float _1314 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1316 = _1314 * 0.15915493667125701904296875;
        float _1318 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1320 = _1316 * 6.283185482025146484375;
        float _1322 = cos(_1320);
        float _1324 = _1318 * 0.15915493667125701904296875;
        float _1326 = _1316 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        float _1330 = 1.0 / _1322;
        float _1332 = _1324 * 6.283185482025146484375;
        float _1334 = cos(_1332);
        float _1336 = _1328 * _1330;
        float _1338 = _1324 * 6.283185482025146484375;
        float _1340 = sin(_1338);
        float _1342 = _1334 * _1336;
        float _1344 = 1.0 / _1342;
        float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1348 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1346;
        float _1350 = 1.0 / _1348;
        float _1352 = _1340 * _1344;
        float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1356 = fma(_1256, _1352, _1354);
        float _1358 = _1356 * _1350;
        float _1360 = precise::clamp(_1358, 0.0, 1.0);
        float _1362 = -_1360;
        float _1364 = _1362 + 1.0;
        _1312 = _1322;
        _1258 = _1364;
    }
    float _1366 = _1312;
    float _1368 = _1258;
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1372 = _1238 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1376 = _1240 + _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1380 = _1242 + _1378;
    float _1382 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1384 = _1372 * _1372;
    float _1386 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1388 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1382);
    float _1390 = fma(_1376, _1376, _1384);
    float _1392 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1388);
    float _1394 = fma(_1380, _1380, _1390);
    float _1396 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1398 = rsqrt(_1394);
    float _1400 = sqrt(_1394);
    float _1402 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1404 = _1376 * _1402;
    float _1406 = _1380 * _1402;
    float _1408 = _1404 * _1404;
    float _1410 = _1406 * _1406;
    float _1412 = _1408 + _1410;
    float _1414 = sqrt(_1412);
    bool _1416 = _1414 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1420 = _1414 + _1418;
    float _1422 = _1150;
    float _1424 = _1420;
    float _1426 = _1404;
    float _1428 = _1406;
    float _1430 = _1408;
    float _1432 = _1410;
    if (_1416)
    {
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1422 = _1434;
    }
    float _1436 = _1422;
    if (_1416)
    {
        float _1438 = _1420 * _1436;
        _1424 = _1438;
    }
    float _1440 = _1424;
    if (_1416)
    {
        float _1442 = _1440 * 0.15915493667125701904296875;
        _220 = _1442;
    }
    float _1444 = _220;
    float _1446 = _1244;
    float _1448 = _1444;
    if (_1416)
    {
        float _1450 = _1444 * 6.283185482025146484375;
        float _1452 = sin(_1450);
        _1446 = _1452;
    }
    float _1454 = _1446;
    float _1456 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1458 = precise::max(0.0, _1456);
    float _1460 = _1366;
    float _1462 = _1458;
    if (_1416)
    {
        float _1464 = _1444 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        _1460 = _1466;
    }
    float _1468 = _1460;
    float _1470 = -_1402;
    float _1472 = -_1458;
    float _1474 = fma(_1372, _1470, _1472);
    float _1476 = _1456;
    if (_1416)
    {
        float _1478 = rsqrt(_1412);
        _1476 = _1478;
    }
    float _1480 = _1476;
    if (_1416)
    {
        float _1482 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1462 = _1482;
    }
    float _1484 = _1462;
    float _1486 = fma(_1006, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1488 = _1484;
    float _1490 = _1454;
    if (_1416)
    {
        float _1492 = fma(_1454, _1484, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1488 = _1492;
    }
    float _1494 = _1488;
    float _1496 = _1494;
    if (_1416)
    {
        float _1498 = _1468 + (-1.0);
        _1490 = _1498;
    }
    float _1500 = _1490;
    float _1502 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1504 = floor(_1486);
    float _1506 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1502);
    float _1508 = _1480;
    if (_1416)
    {
        float _1510 = _1480 * _1494;
        _1448 = _1510;
    }
    float _1512 = _1448;
    if (_1416)
    {
        float _1514 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1514;
    }
    float _1516 = _1496;
    if (!_1416)
    {
        _1508 = _1474;
    }
    float _1518 = _1508;
    float _1520 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1506);
    float _1522 = _1518;
    if (_1416)
    {
        float _1524 = _1404 * _1512;
        _1426 = _1524;
    }
    float _1526 = _1426;
    if (_1416)
    {
        float _1528 = fma(_1474, _1468, _1516);
        _1522 = _1528;
    }
    float _1530 = _1522;
    if (_1416)
    {
        float _1532 = _1406 * _1512;
        _1428 = _1532;
    }
    float _1534 = _1428;
    if (_1416)
    {
        float _1536 = _1526 * _1526;
        _1430 = _1536;
    }
    float _1538 = _1430;
    if (_1416)
    {
        float _1540 = _1534 * _1534;
        _1432 = _1540;
    }
    float _1542 = _1432;
    float _1544 = fma(_1530, _1530, _1538);
    float _1546 = fma(_1000, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1548 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1550 = _1544 + _1542;
    float _1552 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1554 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1556 = fma(_1400, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1554);
    float _1558 = precise::clamp(_1556, 0.0, 1.0);
    float _1560 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1548);
    float _1562 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1386);
    float _1564 = _1520 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1566 = rsqrt(_1550);
    float _1568 = -_1558;
    float _1570 = _1568 + 1.0;
    float _1572 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1574 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1562);
    float _1576 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1560);
    float _1578 = -_1572;
    float _1580 = fma(_1578, _1552, 1.0);
    float _1582 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1584 = abs(_1570);
    float _1586 = log2(_1584);
    float _1588 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1590 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1592 = -_1504;
    float _1594 = _1486 + _1592;
    float _1596 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1598 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1590);
    float _1600 = _1566 * _1526;
    float _1602 = _1566 * _1530;
    float _1604 = _1566 * _1534;
    float _1606 = floor(_1546);
    float _1608 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1610 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1598);
    float _1612 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1596);
    float _1614 = -_1608;
    float _1616 = fma(_1602, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1614);
    float _1618 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1620 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1610);
    float _1622 = log2(_1580);
    float _1624 = -_1604;
    float _1626 = fma(_1624, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1616);
    float _1628 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1630 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1612);
    float _1632 = fma(_1626, -0.5, 0.5);
    float _1634 = fma(_1626, 0.5, 0.5);
    float _1636 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1628);
    float _1638 = exp2(_1618);
    float _1640 = -_1606;
    float _1642 = _1546 + _1640;
    float _1644 = fma(_1634, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1646 = _1602 + 1.0;
    float _1648 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1636);
    float _1650 = fma(_1634, _1644, -0.212114393711090087890625);
    float _1652 = 1.0 / _1620;
    float _1654 = fma(_1634, _1650, 1.570728778839111328125);
    float _1656 = _1622 * 0.693147182464599609375;
    float _1658 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1660 = sqrt(_1632);
    float _1662 = -_1602;
    float _1664 = fma(_1638, _1646, _1662);
    float _1666 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1630);
    float _1668 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1648);
    float _1670 = _1666 * _1652;
    float _1672 = _1668 * _1652;
    float2 _5338 = float2(_1594, _1642);
    float _1674 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5338, float2(0.0), isnan(_5338)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5338, float2(0.0), isnan(_5338)), level(0.0)).x;
    float _1676 = fma(_1672, -0.5, 0.5);
    float _1678 = _1660 * 0.636619746685028076171875;
    float _1680 = fma(_1670, 0.5, 0.5);
    float _1682 = -_1654;
    float _1684 = fma(_1678, _1682, 1.0);
    float _1686 = fma(_1664, 0.5, 0.5);
    float3 _5363 = float3(_1680, _1676, _1658);
    float _1688 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5363, float3(0.0), isnan(_5363)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5363, float3(0.0), isnan(_5363)), level(0.0)).x;
    float3 _5374 = float3(_1680, _1676, _1658);
    float4 _1691 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5374, float3(0.0), isnan(_5374)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5374, float3(0.0), isnan(_5374)), level(0.0)).xyzw;
    float _1693 = _1691.x;
    float _1695 = _1691.y;
    float _1697 = _1691.z;
    float _1699 = _1691.w;
    float2 _5390 = float2(_1684, _1686);
    float3 _1703 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5390, float2(0.0), isnan(_5390)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5390, float2(0.0), isnan(_5390)), level(0.0)).xyz;
    float _1705 = _1703.x;
    float _1707 = _1703.y;
    float _1709 = _1703.z;
    float _1711 = float(uint(_562));
    float _1713 = trunc(_644);
    int _1715 = int(_1713);
    bool _1717 = _562 == 0;
    float _1719 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1721 = abs(_570);
    float _1723 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1725 = abs(_582);
    float _1727 = 1.0 / _1711;
    int _1729 = ~_562;
    int _1731 = _1729 + 1;
    float _1733 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1723);
    bool _1735 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1737 = isnan(_532);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1743 = _1739 || _1741;
    float _1745 = float(_1743);
    float _1747 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1733);
    float _1749 = float(uint(_1715));
    float _1751 = exp2(_1719);
    float _1753 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1747);
    out.gl_Position.x = _1666;
    out.gl_Position.y = _1668;
    out.gl_Position.z = _1753;
    out.gl_Position.w = _1620;
    int _1755 = as_type<int>(_1727) + (-2);
    float _1757 = as_type<float>(_1755) * _1749;
    float _1759 = -_1751;
    float _1761 = _1759 + 1.0;
    float _1763 = trunc(_1757);
    float _1765 = precise::max(_1763, 0.0);
    uint _1768 = uint(_1765);
    float _1770 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1772 = _1731 * int(_1768);
    int _1774 = _1772 + _1715;
    float _1776 = float(uint(_1774));
    float _1778 = as_type<float>(_1755) * _1776;
    float _1780 = trunc(_1778);
    float _1782 = precise::max(_1780, 0.0);
    uint _1784 = uint(_1782);
    int _1786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1788 = _1786 != 0;
    int _1790 = ~_562;
    int _1792 = _1790 + 1;
    bool _1794 = !_1788;
    float _1796 = _1794 ? 7.345489978790283203125 : 1.0;
    float _1798 = _1796 * _540;
    float _1800 = floor(_1798);
    int _1802 = int(_1768) + int(_1784);
    float _1804 = float(_1715);
    int _1806 = _1792 * _1802;
    int _1808 = _1806 + _1715;
    bool _1810 = _1804 >= _612;
    bool _1812 = isnan(_1804);
    bool _1814 = _1810 || _1812;
    bool _1816 = isnan(_612);
    bool _1818 = _1814 || _1816;
    float _1820 = float(_1818);
    bool _1822 = uint(_1808) >= uint(_562);
    float _1824 = trunc(_1820);
    int _1826 = int(_1824);
    float _1828 = -_1800;
    float _1830 = _1798 + _1828;
    bool _1832 = !_1822;
    int _1834 = _1832 ? 0 : (-1);
    float _1836 = _1830 * _612;
    int _1838 = ~_1802;
    int _1840 = _1838 + _1834;
    int _1842 = _1840 + 1;
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1846 = _1844 != 0;
    int _1848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1850 = _1848 != 0;
    int _1852 = _562 * _1842;
    int _1854 = _1852 + _1715;
    float _1856 = trunc(_1836);
    int _1858 = int(_1856);
    int _1860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1862 = _1860 != 0;
    int _1864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1866 = _1864 != 0;
    bool _1868 = !_1717;
    int _1870 = _1868 ? _1854 : (-1);
    float _1872 = _636 * _174;
    int _1874 = ~_1826;
    int _1876 = _1874 + 1;
    int _1878 = _1876 + 1;
    int _1880 = _562 + (-1);
    bool _1882 = !_1846;
    int _1884 = _1882 ? 0 : 1;
    float _1886 = trunc(_1872);
    int _1888 = int(_1886);
    int _1890 = _1870 * _1878;
    int _1892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1894 = _1892 != 0;
    float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1898 = _532 + _1896;
    int _1900 = abs(_1884);
    int _1902 = _1826 * _1880;
    int _1904 = _1902 + _1890;
    int _1906 = abs(_576);
    float _1908 = in.m_73.y;
    int _1910 = _1904 * _1721;
    bool _1912 = !_1894;
    int _1914 = _1912 ? 0 : 1;
    int _1916 = _1858 * _1900;
    int _1918 = _1916 + _1715;
    bool _1920 = _542 > 0.5;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1926 = _1888 * _1906;
    int _1928 = _1926 + _1910;
    float _1930 = 1.0 / _1924;
    int _1932 = abs(_1914);
    int _1934 = _1918 * _1725;
    int _1936 = _1934 + _1928;
    float _1938 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1940 = _1938 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1942 = _1858 * _1932;
    int _1944 = _1942 + _1936;
    float _1946 = 1.0 / _1940;
    float _1948 = float(uint(_1944));
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    float _1950 = -_1908;
    float _1952 = _1950 + 1.0;
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1954;
    float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1962 = ~_562;
    int _1964 = _1962 + 1;
    float _1966 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1968 = _1966 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1970 = _1956 * _1930;
    float _1972 = _1908;
    if (_1862)
    {
        float _1974 = _1920 ? _1952 : _1908;
        _1972 = _1974;
    }
    float _1976 = _1972;
    float _1978 = _1956;
    if (_1850)
    {
        float _1980 = in.m_63.x;
        _1978 = _1980;
    }
    float _1982 = _1978;
    float _1984 = fma(_1970, _1898, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1986 = 1.0 / _1968;
    float _1988 = as_type<float>(_1755) * _1948;
    bool _1990 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1992 = isnan(_532);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    float _2002 = _1960 * _1946;
    bool _2004 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2006 = isnan(_532);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2012 = _2008 || _2010;
    float _2014 = float(_2012);
    float _2016 = in.m_73.x;
    bool _2018 = _882 != 0.0;
    bool _2020 = isnan(_882);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan(0.0);
    bool _2026 = _2022 || _2024;
    float _2028 = -_2000;
    float _2030 = _2028 + 1.0;
    float _2032 = trunc(_1988);
    float _2034 = precise::max(_2032, 0.0);
    uint _2036 = uint(_2034);
    float _2038 = -_2014;
    float _2040 = _2038 + 1.0;
    float _2042 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2042;
    float _2046 = _2014 * _2030;
    bool _2048 = _880 == 0.0;
    bool _2050 = !_2026;
    bool _2052 = _2048 && _2050;
    float _2054 = _1745 * _2040;
    float _2056 = -_1745;
    float _2058 = _2056 + 1.0;
    float _2060 = _2044 * _1986;
    bool _2062 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2064 = isnan(_532);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2070 = _2066 || _2068;
    float _2072 = float(_2070);
    float _2074 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2076 = _532 + _2074;
    bool _2078 = _884 == 0.0;
    bool _2080 = _2078 && _2052;
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2084 = _532 + _2082;
    bool _2086 = _1982 > 0.5;
    bool _2088 = _2086 && _1850;
    float _2090 = _2072 * _2058;
    float _2092 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _2094 = _1964 * int(_2036);
    int _2096 = _2094 + _1944;
    float _2098 = -_2072;
    float _2100 = _2098 + 1.0;
    float _2102 = fma(_2002, _2076, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2104 = -_764;
    float _2106 = fma(_646, _2092, _2104);
    float _2108 = float(uint(_1918));
    float _2110 = fma(_2060, _2084, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2112 = float(uint(_2096));
    float _2114 = _1984 * _2090;
    float _2116 = _2092;
    float _2118 = _2016;
    if (_1850)
    {
        _2116 = _2016;
    }
    float _2120 = _2116;
    float _2122 = as_type<float>(_1755) * _2108;
    float _2124 = as_type<float>(_1755) * _2112;
    float _2126 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2114);
    float _2128 = in.m_77.x;
    float _2130 = in.m_77.y;
    float _2132 = in.m_77.z;
    float _2134 = _2120;
    if (_2088)
    {
        float _2136 = -_2120;
        float _2138 = _2136 + 1.0;
        _2134 = _2138;
    }
    float _2140 = _2134;
    float _2142 = trunc(_2122);
    float _2144 = precise::max(_2142, 0.0);
    uint _2146 = uint(_2144);
    int _2148 = ~_562;
    int _2150 = _2148 + 1;
    float _2152 = fma(_2102, _2054, _2126);
    if (_1850)
    {
        _2118 = _2140;
    }
    float _2154 = _2118;
    float _2156 = fma(_2110, _2046, _2152);
    float _2158 = trunc(_2124);
    float _2160 = precise::max(_2158, 0.0);
    uint _2162 = uint(_2160);
    float _2164 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2166 = ~_562;
    int _2168 = _2166 + 1;
    float _2170 = fma(_2000, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2156);
    float _2172 = fma(_766, _2164, _640);
    float _2174 = _2170 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2176 = abs(_1256);
    float _2178 = log2(_2176);
    float _2180 = _2172 + 0.5;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2184 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2186 = _2128;
    float _2188 = _2130;
    float _2190 = _2132;
    if (!_2080)
    {
        float _2192 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2128);
        _2186 = _2192;
    }
    float _2194 = _2186;
    int _2196 = _2150 * int(_2146);
    int _2198 = _2196 + _1918;
    int _2200 = int(_2036) + int(_2162);
    if (!_2080)
    {
        float _2202 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2130);
        _2188 = _2202;
    }
    float _2204 = _2188;
    if (!_2080)
    {
        float _2206 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2132);
        _2190 = _2206;
    }
    float _2208 = _2190;
    float _2210 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2212 = _2168 * _2200;
    int _2214 = _2212 + _1944;
    float _2216 = float(uint(_2198));
    float _2218 = _2184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2220 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2222 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2224 = uint(_2214) >= uint(_562);
    float _2226 = as_type<float>(_1755) * _2216;
    int _2228 = ~_562;
    int _2230 = _2228 + 1;
    float _2232 = _2222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2234 = !_2224;
    int _2236 = _2234 ? 0 : (-1);
    float _2238 = exp2(_2220);
    float _2240 = _942 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2242 = _1256 <= 8000.0;
    bool _2244 = isnan(_1256);
    bool _2246 = _2242 || _2244;
    bool _2248 = isnan(8000.0);
    bool _2250 = _2246 || _2248;
    float _2252 = float(_2250);
    out.m_79.x = _2232;
    out.m_79.y = _2210;
    out.m_79.z = _2218;
    out.m_79.w = _2174;
    int _2254 = ~_2200;
    int _2256 = _2254 + _2236;
    int _2258 = _2256 + 1;
    float _2260 = _2106 + 0.5;
    float _2262 = -_934;
    float _2264 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2240);
    float _2266 = trunc(_2226);
    float _2268 = precise::max(_2266, 0.0);
    uint _2270 = uint(_2268);
    int _2272 = _562 * _2258;
    int _2274 = _2272 + _1944;
    out.m_81.x = _2180;
    out.m_81.y = _2260;
    float _2276 = _942 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2278 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2264);
    bool _2280 = !_1717;
    int _2282 = _2280 ? _2274 : (-1);
    float _2284 = -_934;
    float _2286 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2276);
    float _2288 = _956 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2290 = _2282 & 3;
    bool _2292 = _2290 != 0;
    int _2294 = _2282 >> 31;
    int _2296 = int(_2146) + int(_2270);
    float _2298 = _942 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2300 = _2294 & 3;
    float _2302 = _964 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2304 = -_934;
    float _2306 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2298);
    int _2308 = _2282 + _2300;
    float _2310 = fma(_2238, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2312 = precise::clamp(_2310, 0.0, 1.0);
    float _2314 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2286);
    float _2316 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2306);
    int _2318 = _2308 >> 2;
    int _2320 = _2230 * _2296;
    int _2322 = _2320 + _1918;
    float _2324 = _956 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2326 = _956 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2328 = _2318 << 4;
    int _2330 = _2328 + 368;
    float _2332 = _964 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2334 = uint(_2322) >= uint(_562);
    float _2336 = _964 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _2338 = uint(int(uint(_2330) >> uint(2)));
    uint _2340 = uint(int(uint(int(_2338)) >> uint(2)));
    int _2342 = int(_2338) & 3;
    float _2344 = (*spvDescriptorSet0.vp_c9)._m0[int(_2340)][_2342];
    int _2346 = int(_2338) + 1;
    uint _2348 = uint(int(uint(_2346) >> uint(2)));
    int _2350 = _2346 & 3;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[int(_2348)][_2350];
    float _2354 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2324);
    float _2356 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2288);
    float _2358 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2326);
    float _2360 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2336);
    float _2362 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2302);
    float _2364 = _2278 * _2204;
    int _2366 = _2282 & 3;
    bool _2368 = _2366 != 0;
    int _2370 = _2330 + 8;
    uint _2372 = uint(int(uint(_2370) >> uint(2)));
    uint _2374 = uint(int(uint(int(_2372)) >> uint(2)));
    int _2376 = int(_2372) & 3;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[int(_2374)][_2376];
    int _2380 = int(_2372) + 1;
    uint _2382 = uint(int(uint(_2380) >> uint(2)));
    int _2384 = _2380 & 3;
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[int(_2382)][_2384];
    float _2388 = fma(_2312, -2.0, 3.0);
    float _2390 = _2312 * _2312;
    bool _2392 = uint(_2366) > 1u;
    float _2394 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2332);
    int _2396 = _2292 ? 0 : 1;
    float _2398 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2354);
    float _2400 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2356);
    float _2402 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2358);
    bool _2404 = _2366 != 3;
    float _2406 = _2316 * _2204;
    int _2408 = ~_2396;
    int _2410 = _2408 + 1;
    int _2412 = _2410 + 1;
    float _2414 = _2390 * _2388;
    bool _2416 = !_2334;
    int _2418 = _2416 ? 0 : (-1);
    float _2420 = _2314 * _2204;
    bool _2422 = uint(_2366) >= 2u;
    float _2424 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2360);
    int _2426 = _2412;
    if (!_2392)
    {
        int _2428 = ~_2396;
        int _2430 = _2428 + 1;
        _2426 = _2430;
    }
    int _2432 = _2426;
    float _2434 = fma(_2398, _2194, _2406);
    int _2436 = ~_2296;
    int _2438 = _2436 + _2418;
    int _2440 = _2438 + 1;
    float _2442 = fma(_2400, _2194, _2364);
    int _2444 = abs(_2432);
    float _2446 = fma(_2402, _2194, _2420);
    bool _2448 = !_2368;
    int _2450 = _2448 ? 0 : 1;
    float _2452 = fma(_2424, _2208, _2434);
    int _2454 = _2422 ? 0 : 1;
    float _2456 = in.m_83.x;
    bool _2458 = _2366 != 3;
    int _2460 = _562 * _2440;
    int _2462 = _2460 + _1918;
    float _2464 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2362);
    int _2466 = ~_2454;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    float _2472 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2394);
    bool _2474 = !_2458;
    int _2476 = _2474 ? 0 : (-1);
    float _2478 = fma(_2464, _2208, _2442);
    int _2480 = abs(_2450);
    float _2482 = -_1674;
    float _2484 = _2482 + 1.0;
    int _2486 = _2470;
    if (_2404)
    {
        int _2488 = ~_2454;
        int _2490 = _2488 + 1;
        _2486 = _2490;
    }
    int _2492 = _2486;
    float _2494 = fma(_2472, _2208, _2446);
    int _2496 = ~_2444;
    int _2498 = _2496 + 1;
    int _2500 = _2498 + 1;
    float _2502 = _1770 * _1688;
    bool _2504 = !_1866;
    int _2506 = _2504 ? 0 : 1;
    int _2508 = abs(_2476);
    int _2510 = _2500 * as_type<int>(_2352);
    int _2512 = abs(_2492);
    out.m_85.x = _2452;
    out.m_85.y = _2478;
    out.m_85.z = _2494;
    int _2514 = ~_2480;
    int _2516 = _2514 + 1;
    int _2518 = _2516 + 1;
    int _2520 = abs(_2506);
    int _2522 = _2518 * as_type<int>(_2344);
    int _2524 = _2522 + _2510;
    int _2526 = ~_2512;
    int _2528 = _2526 + 1;
    int _2530 = _2528 + 1;
    int _2532 = ~_2508;
    int _2534 = _2532 + 1;
    int _2536 = _2534 + 1;
    int _2538 = _2530 * as_type<int>(_2378);
    int _2540 = _2538 + _2524;
    bool _2542 = !_1717;
    int _2544 = _2542 ? _2462 : (-1);
    int _2546 = ~_2520;
    int _2548 = _2546 + 1;
    int _2550 = _2548 + 1;
    int _2552 = _2536 * as_type<int>(_2386);
    int _2554 = _2552 + _2540;
    float _2556 = -_2414;
    float _2558 = _2556 + 1.0;
    int _2560 = _2554 * _2550;
    float _2562 = fma(_2558, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2414);
    float _2564 = _1620 * 0.5;
    float _2566 = _1753 + _1620;
    int _2568 = _2544 * _2520;
    int _2570 = _2568 + _2560;
    float _2572 = _2252 * _2562;
    float _2574 = fma(_1668, -0.5, _2564);
    float _2576 = _1666 + _1620;
    float _2578 = _2572 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2580 = _2566 * 0.5;
    float _2582 = _2576 * 0.5;
    float _2584 = float(_2570);
    float _2586 = _2484 * _2578;
    float _2588 = precise::clamp(_2586, 0.0, 1.0);
    float _2590 = _1699 * _2502;
    float _2592 = _1709 * _2502;
    out.m_87.x = _2582;
    out.m_87.y = _2574;
    out.m_87.z = _2580;
    out.m_87.w = _1620;
    float _2594 = -_2588;
    float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2598 = fma(_1705, _2590, _1693);
    float _2600 = fma(_1707, _2590, _1695);
    out.m_89.x = _2584;
    float _2602 = _2596 * _2456;
    float _2604 = fma(_1699, _2592, _1697);
    bool _2606 = _1400 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2608 = isnan(_1400);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2614 = _2610 || _2612;
    float _2616 = _2602 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2618 = -_1770;
    float _2620 = _2618 + 1.0;
    out.m_91.x = _2616;
    float _2622 = _1699 * _2620;
    float _2624 = _1310 * _1368;
    float _2626 = _2580;
    float _2628 = _2574;
    float _2630 = _2624;
    if (!_2614)
    {
        _2626 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2632 = _2626;
    float _2634 = _2632;
    float _2636 = _2632;
    if (!_2614)
    {
        _2628 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2638 = _2628;
    out.m_93.x = _2598;
    out.m_93.y = _2600;
    out.m_93.z = _2604;
    out.m_93.w = _2622;
    float _2640 = _2624 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2642 = _2638;
    float _2644 = _2638;
    if (!_2614)
    {
        _2630 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2646 = _2630;
    bool _2648 = !_2614;
    float _2650 = _2646;
    float _2652 = _2646;
    if (!_2648)
    {
        bool _2654 = _1400 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2656 = isnan(_1400);
        bool _2658 = _2654 || _2656;
        bool _2660 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2662 = _2658 || _2660;
        if (!_2662)
        {
            float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2666 = _1400 + _2664;
            float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2670 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2668;
            float _2672 = 1.0 / _2670;
            float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2682 = _2666 * _2672;
            float _2684 = precise::clamp(_2682, 0.0, 1.0);
            float _2686 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2688 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2690 = fma(_2684, _2680, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2692 = fma(_2684, _2688, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2694 = fma(_2684, _2676, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2644 = _2694;
            _2636 = _2692;
            _2652 = _2690;
            _2696 = true;
        }
        else
        {
            bool _2698 = _1400 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2700 = isnan(_1400);
            bool _2702 = _2698 || _2700;
            bool _2704 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2706 = _2702 || _2704;
            if (!_2706)
            {
                _2634 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2708 = _2634;
            _2636 = _2708;
            if (!_2706)
            {
                _2642 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2710 = _2642;
            _2644 = _2710;
            if (!_2706)
            {
                _2650 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2712 = _2650;
            bool _2714 = !_2706;
            _2652 = _2712;
            if (!_2714)
            {
                bool _2716 = _1400 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2718 = isnan(_1400);
                bool _2720 = _2716 || _2718;
                bool _2722 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2724 = _2720 || _2722;
                if (!_2724)
                {
                    float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2728 = _1400 + _2726;
                    float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2732 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2730;
                    float _2734 = 1.0 / _2732;
                    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2742 = _2740 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2744 = _2728 * _2734;
                    float _2746 = precise::clamp(_2744, 0.0, 1.0);
                    float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2750 = _2748 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2752 = fma(_2746, _2742, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2754 = fma(_2746, _2750, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2756 = fma(_2746, _2738, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2644 = _2756;
                    _2636 = _2754;
                    _2652 = _2752;
                    _2696 = true;
                }
                else
                {
                    _2644 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2636 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2652 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2696 = false;
    float _2758 = _2644;
    float _2760 = _2636;
    float _2762 = _2652;
    float _2764 = _2640 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_95.x = 0.0;
    float _2766 = _2758 * 0.586610972881317138671875;
    bool _2768 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_53.x = _2764;
    float _2770 = fma(_2760, 0.298911988735198974609375, _2766);
    bool _2772 = _1310 > 0.0;
    bool _2774 = isnan(_1310);
    bool _2776 = _2772 || _2774;
    bool _2778 = isnan(0.0);
    bool _2780 = _2776 || _2778;
    float _2782 = fma(_2762, 0.114477999508380889892578125, _2770);
    bool _2784 = _1368 <= 0.0;
    bool _2786 = !_2780;
    bool _2788 = _2784 || _2786;
    float _2790 = -_2782;
    float _2792 = _2790 + _2760;
    float _2794 = -_2782;
    float _2796 = _2794 + _2758;
    float _2798 = -_2782;
    float _2800 = _2798 + _2762;
    float _2802 = fma(_2792, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2782);
    float _2804 = fma(_2796, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2782);
    float _2806 = fma(_2800, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2782);
    bool _2808 = !_2768;
    if (!_2808)
    {
        float _2810 = -_1238;
        float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2814 = -_1240;
        float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2818 = -_1242;
        float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2822 = _2812 * _2812;
        float _2824 = fma(_2816, _2816, _2822);
        float _2826 = fma(_2820, _2820, _2824);
        float _2828 = sqrt(_2826);
        float _2830 = rsqrt(_2826);
        float _2832 = -_2828;
        float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2836 = _2834 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2838 = precise::clamp(_2836, 0.0, 1.0);
        float _2840 = _2816 * _2830;
        float _2842 = _2812 * _2830;
        float _2844 = abs(_2838);
        float _2846 = log2(_2844);
        float _2848 = _2820 * _2830;
        float _2850 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2852 = _2478 * _2842;
        float _2854 = -_2842;
        float _2856 = -_2850;
        float _2858 = fma(_2854, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2856);
        float _2860 = fma(_2452, _2840, _2852);
        float _2862 = -_2848;
        float _2864 = fma(_2862, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2858);
        float _2866 = fma(_2494, _2848, _2860);
        float _2868 = precise::clamp(_2866, 0.0, 1.0);
        float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2872 = _2864 + _2870;
        float _2874 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2876 = _2872 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2878 = precise::clamp(_2876, 0.0, 1.0);
        float _2880 = exp2(_2874);
        float _2882 = _2880 * _2878;
        float _2884 = _2868 * _2882;
        float _2886 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2888 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2890 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2886;
        out.m_95.y = _2888;
        out.m_95.z = _2890;
    }
    out.m_97.x = _2802;
    out.m_97.y = _2804;
    out.m_97.z = _2806;
    if (!_2788)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2892 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2892;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

