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
    constant _16* vp_c12 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_77 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_57 [[attribute(3)]];
    float4 m_46 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
    float4 m_67 [[attribute(12)]];
    float4 m_65 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2129 = false;
    bool _1162 = false;
    bool _1150 = false;
    bool _456 = false;
    bool _342 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2434 = as_type<float>(_122);
        out.gl_Position.z = _2434;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_106);
        _116 = _142;
    }
    float _144 = _116;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_49.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2503 = as_type<float>(_158);
        out.gl_Position.z = _2503;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = in.m_55.z;
    float _172 = in.m_57.x;
    float _174 = in.m_57.y;
    float _176 = in.m_57.z;
    float _178 = _160 * _160;
    float _180 = _162 * _162;
    float _182 = _164 * _164;
    float _184 = fma(_166, _166, _178);
    float _186 = fma(_168, _168, _180);
    float _188 = fma(_170, _170, _182);
    float _190 = fma(_172, _172, _184);
    float _192 = fma(_174, _174, _186);
    float _194 = fma(_176, _176, _188);
    float _196 = sqrt(_190);
    float _198 = sqrt(_192);
    float _200 = sqrt(_194);
    bool _202 = _196 > 0.0;
    bool _204 = _198 > 0.0;
    float _206 = _198;
    if (_202)
    {
        float _208 = rsqrt(_190);
        _206 = _208;
    }
    float _210 = _206;
    float _212 = 0.0;
    float _214 = 0.0;
    if (!_202)
    {
        _212 = 0.0;
        _214 = 0.0;
    }
    float _216 = _212;
    float _218 = _214;
    bool _220 = _200 > 0.0;
    float _222 = 0.0;
    float _224 = _216;
    float _226 = _218;
    if (!_202)
    {
        _222 = 0.0;
    }
    float _228 = _222;
    float _230 = 0.0;
    float _232 = _228;
    if (!_204)
    {
        _230 = 0.0;
    }
    float _234 = _230;
    float _236 = _200;
    float _238 = _234;
    if (_204)
    {
        float _240 = rsqrt(_192);
        _236 = _240;
    }
    float _242 = _236;
    float _244 = 0.0;
    if (!_204)
    {
        _244 = 0.0;
    }
    float _246 = _244;
    float _248 = 0.0;
    float _250 = _246;
    if (!_220)
    {
        _248 = 0.0;
    }
    float _252 = _248;
    float _254 = 0.0;
    float _256 = _252;
    if (_220)
    {
        float _258 = rsqrt(_194);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = _210;
    if (_202)
    {
        float _264 = _210 * _166;
        _232 = _264;
    }
    float _266 = _232;
    if (_202)
    {
        float _268 = _210 * _160;
        _224 = _268;
    }
    float _270 = _224;
    if (_202)
    {
        float _272 = _210 * _172;
        _226 = _272;
    }
    float _274 = _226;
    bool _276 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_204)
    {
        _262 = 0.0;
    }
    float _278 = _262;
    float _280 = 0.0;
    float _282 = _278;
    if (!_220)
    {
        _280 = 0.0;
    }
    float _284 = _280;
    float _286 = _284;
    if (_204)
    {
        float _288 = _242 * _168;
        _238 = _288;
    }
    float _290 = _238;
    float _292 = 0.0;
    if (!_220)
    {
        _292 = 0.0;
    }
    float _294 = _292;
    float _296 = _294;
    if (_204)
    {
        float _298 = _242 * _162;
        _250 = _298;
    }
    float _300 = _250;
    float _302 = _300;
    float _304 = _300;
    if (_204)
    {
        float _306 = _242 * _174;
        _282 = _306;
    }
    float _308 = _282;
    if (_220)
    {
        float _310 = _260 * _170;
        _256 = _310;
    }
    float _312 = _256;
    if (_220)
    {
        float _314 = _260 * _164;
        _286 = _314;
    }
    float _316 = _286;
    if (_220)
    {
        float _318 = _260 * _176;
        _296 = _318;
    }
    float _320 = _296;
    bool _322 = !_276;
    float _340;
    if (!_322)
    {
        float _324 = in.m_59.x;
        float _326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _328 = _324 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _332 = _330 * _326;
        float _334 = floor(_332);
        float _336 = -_334;
        float _338 = _332 + _336;
        _340 = _338;
        _342 = true;
    }
    else
    {
        float _344 = float(_106);
        float _346 = 1.0 / _344;
        float _348 = _140 * _346;
        _340 = _348;
    }
    _342 = false;
    float _350 = _340;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _354 = _350 + _352;
    bool _356 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _358 = isnan(_350);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _368;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _374 = 1.0 / _370;
    float _376 = -_366;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _380;
    float _384 = _354 * _374;
    bool _386 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _388 = isnan(_350);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _398;
    float _402 = fma(_382, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _404;
    float _408 = _396 * _378;
    float _410 = fma(_400, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _412 = fma(_406, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _414 = -_396;
    float _416 = _414 + 1.0;
    float _418 = _402 * _408;
    float _420 = _410 * _408;
    float _422 = _412 * _408;
    float _424 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _426 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].z, _418);
    float _430 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[144].x, _424);
    float _432 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[144].y, _426);
    float _434 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[144].z, _428);
    bool _436 = !_372;
    float _454;
    if (!_436)
    {
        float _438 = in.m_59.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        float _458 = float(_106);
        float _460 = 1.0 / _458;
        float _462 = _140 * _460;
        _454 = _462;
    }
    _456 = false;
    float _464 = _454;
    float _466 = in.m_59.y;
    float _468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _470 = in.m_46.x;
    float _472 = in.m_46.y;
    float _474 = in.m_46.z;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _478 = _476 != 0;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _482 = _480 != 0;
    float _484 = in.m_61.x;
    float _486 = in.m_61.y;
    float _488 = in.m_61.z;
    float _490 = in.m_63.x;
    float _492 = in.m_63.y;
    float _494 = in.m_63.z;
    float _496 = in.m_65.x;
    float _498 = in.m_65.w;
    bool _500 = _466 > 0.5;
    float _502 = in.m_67.x;
    float _504 = _162 * _472;
    float _506 = _174 * _472;
    float _508 = _168 * _472;
    float _510 = _432 * _486;
    float _512 = _430 * _484;
    float _514 = fma(_160, _470, _504);
    float _516 = -_492;
    float _518 = _516 + (-1.0);
    float _520 = _434 * _488;
    float _522 = fma(_166, _470, _508);
    float _524 = fma(_518, _496, _492);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _530 = fma(_172, _470, _506);
    float _532 = fma(_170, _474, _522);
    float _534 = 1.0 / _528;
    float _536 = fma(_164, _474, _514);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _542 = -_490;
    float _544 = fma(_496, _542, _490);
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _548 = in.m_67.y;
    float _550 = 1.0 / _540;
    float _552 = fma(_176, _474, _530);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _558 = in.m_53.w;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _562 = 1.0 / _556;
    float _564 = _546 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _566;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _572 = -_494;
    float _574 = fma(_496, _572, _494);
    out.m_69.w = _498;
    float _576 = _568 * _534;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _586 = _464 + _584;
    float _588 = _498;
    float _590 = 9.9999997473787516355514526367188e-05;
    float _592 = _524;
    float _594 = _544;
    float _596 = _574;
    if (_478)
    {
        float _598 = in.m_59.x;
        _588 = _598;
    }
    float _600 = _588;
    float _602 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = fma(_576, _586, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _608 = in.m_55.w;
    float _610 = _580 * _550;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _614 = _464 + _612;
    out.m_71.x = _564;
    out.m_71.y = _602;
    out.m_71.z = _604;
    out.m_71.w = _582;
    float _616 = -_548;
    float _618 = _616 + 1.0;
    float _620 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _622 = _536 + _558;
    float _624 = in.m_57.w;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _626;
    float _630 = _548;
    if (_482)
    {
        float _632 = _500 ? _618 : _548;
        _630 = _632;
    }
    float _634 = _630;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _638 = _464 + _636;
    float _640 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.vp_c8)._m0[32].y;
    float _642 = _628 * _562;
    float _644 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _646 = _622 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _648 = _634 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _650 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _652 = fma(_610, _614, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _654 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _656 = isnan(_464);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = in.m_73.x;
    float _668 = in.m_73.y;
    float _670 = in.m_73.z;
    bool _672 = _600 > 0.5;
    bool _674 = _672 && _478;
    float _676 = fma(_642, _638, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _678 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _680 = isnan(_464);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = _532 + _608;
    float _692 = -_664;
    float _694 = _692 + 1.0;
    float _696 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.vp_c8)._m0[32].x;
    float _698 = _640 * _640;
    bool _700 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _702 = isnan(_464);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = _688 * _694;
    float _714 = -_688;
    float _716 = _714 + 1.0;
    float _718 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.vp_c8)._m0[32].z;
    float _720 = fma(_696, _696, _698);
    float _722 = _720;
    if (_478)
    {
        _590 = _502;
    }
    float _724 = _590;
    float _726 = _710 * _716;
    bool _728 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _730 = isnan(_464);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = fma(_718, _718, _720);
    float _742 = -_710;
    float _744 = _742 + 1.0;
    float _746 = _552 + _624;
    float _748 = _724;
    if (_674)
    {
        float _750 = -_724;
        float _752 = _750 + 1.0;
        _748 = _752;
    }
    float _754 = _748;
    float _756 = rsqrt(_740);
    float _758 = _738 * _744;
    if (!_478)
    {
        _722 = _502;
    }
    float _760 = _722;
    float _762 = -_738;
    float _764 = _762 + 1.0;
    float _766 = _668 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _768 = _668 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _770 = _668 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _772 = _606 * _758;
    float _774 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].x, _766);
    float _776 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].x, _768);
    float _778 = _760;
    if (_478)
    {
        _778 = _754;
    }
    float _780 = _778;
    float _782 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].x, _770);
    float _784 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[25].z, _774);
    float _786 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[24].z, _776);
    float _788 = _690 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _790 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[26].z, _782);
    float _792 = _784 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _794 = _784 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _796 = _784 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _798 = _780 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _800 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].x, _792);
    float _802 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].y, _794);
    float _804 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].z, _796);
    float _806 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[115].x, _772);
    float _808 = _718 * _756;
    float _810 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].x, _800);
    float _812 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].y, _802);
    float _814 = fma(_652, _726, _806);
    float _816 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].z, _804);
    float _818 = _798 * _644;
    float _820 = _646 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _822 = _646 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _824 = _646 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _826 = _696 * _756;
    float _828 = _648 * _468;
    float _830 = fma(_788, (*spvDescriptorSet0.vp_c12)._m0[6].x, _820);
    float _832 = fma(_788, (*spvDescriptorSet0.vp_c12)._m0[6].y, _822);
    float _834 = fma(_788, (*spvDescriptorSet0.vp_c12)._m0[6].z, _824);
    float _836 = _746 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _838 = _826 * _826;
    float _840 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _842 = fma(_836, (*spvDescriptorSet0.vp_c12)._m0[8].x, _830);
    float _844 = fma(_836, (*spvDescriptorSet0.vp_c12)._m0[8].y, _832);
    float _846 = fma(_836, (*spvDescriptorSet0.vp_c12)._m0[8].z, _834);
    float _848 = fma(_808, _808, _838);
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[191].x * 0.15915493667125701904296875;
    float _852 = fma(_676, _712, _814);
    float _854 = _842 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _856 = rsqrt(_848);
    out.m_75.x = _818;
    out.m_75.y = _828;
    float _858 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[118].x, _852);
    float _860 = _846 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _862 = _858 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _864 = _844 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _866 = _850 * 6.283185482025146484375;
    float _868 = cos(_866);
    float _870 = _854 * _840;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _874 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _876 = fma(_870, 0.5, 0.5);
    float _878 = _872 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _880 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _886 = _808 * _856;
    float _888 = _826 * _856;
    float _890 = _882 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _892 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _894 = _850 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = -_868;
    float _900 = _898 + 1.0;
    float _902 = _868 * _668;
    out.m_77.x = _890;
    out.m_77.y = _892;
    out.m_77.z = _878;
    out.m_77.w = _862;
    float _904 = _886 * _900;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _908 = _860 * _880;
    float _910 = fma(_908, 0.5, 0.5);
    float _912 = _886 * _896;
    float _914 = -_896;
    float _916 = _888 * _914;
    float _918 = fma(_886, _904, _868);
    float _920 = -_904;
    float _922 = _888 * _920;
    float _924 = _888 * _888;
    float _926 = fma(_916, _666, _902);
    float _928 = _916 * _668;
    float _930 = _912 * _668;
    float _932 = _864 * _906;
    float _934 = -_912;
    float _936 = fma(_934, _670, _926);
    float _938 = -_928;
    float _940 = fma(_918, _666, _938);
    float _942 = fma(_900, _924, _868);
    float _944 = fma(_932, 0.5, 0.5);
    float _946 = fma(_922, _666, _930);
    float _948 = -_812;
    float _950 = _948 + _936;
    float _952 = fma(_922, _670, _940);
    float _954 = floor(_944);
    float _956 = fma(_942, _670, _946);
    float _958 = fma(_950, _496, _812);
    float _960 = -_810;
    float _962 = _960 + _952;
    float _964 = -_816;
    float _966 = _964 + _956;
    float _968 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _958);
    float _970 = fma(_962, _496, _810);
    float _972 = floor(_876);
    bool _974 = _958 != 0.0;
    bool _976 = isnan(_958);
    bool _978 = _974 || _976;
    bool _980 = isnan(0.0);
    bool _982 = _978 || _980;
    float _984 = fma(_966, _496, _816);
    float _986 = _620 * _968;
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _970);
    bool _990 = _970 == 0.0;
    bool _992 = !_982;
    bool _994 = _990 && _992;
    float _996 = floor(_910);
    float _998 = -_954;
    float _1000 = _944 + _998;
    bool _1002 = _984 == 0.0;
    bool _1004 = _1002 && _994;
    float _1006 = _650 * _988;
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _984);
    float _1010 = fma(_1000, 2.0, -1.0);
    float _1012 = -_972;
    float _1014 = _876 + _1012;
    float _1016 = _874 * _1008;
    float _1018 = fma(_1014, 2.0, -1.0);
    float _1020 = _1016;
    float _1022 = _1016;
    float _1024 = _1018;
    float _1026 = _1010;
    if (!_1004)
    {
        float _1028 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[17].y, _524);
        _592 = _1028;
    }
    float _1030 = _592;
    float _1032 = -_996;
    float _1034 = _910 + _1032;
    float _1036 = _1018 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    if (!_1004)
    {
        float _1038 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[17].y, _544);
        _594 = _1038;
    }
    float _1040 = _594;
    float _1042 = _290 * _1030;
    float _1044 = fma(_1034, 2.0, -1.0);
    float _1046 = _1010 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1048 = _300 * _1030;
    float _1050 = _1044;
    if (!_1004)
    {
        float _1052 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[17].y, _574);
        _596 = _1052;
    }
    float _1054 = _596;
    float _1056 = _986 * _290;
    float _1058 = _1046 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1060 = _1046 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1062 = _1046 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1064 = fma(_270, _1040, _1048);
    float _1066 = fma(_1036, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1058);
    float _1068 = fma(_1036, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1060);
    float _1070 = fma(_1036, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1062);
    float _1072 = _308 * _1030;
    float _1074 = fma(_266, _1040, _1042);
    float _1076 = fma(_316, _1054, _1064);
    float _1078 = _986 * _308;
    float _1080 = fma(_274, _1040, _1072);
    float _1082 = fma(_312, _1054, _1074);
    float _1084 = _1044 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1086 = fma(_1006, _274, _1078);
    float _1088 = fma(_320, _1054, _1080);
    float _1090 = _986 * _300;
    float _1092 = fma(_1006, _266, _1056);
    float _1094 = fma(_1084, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1066);
    out.m_79.x = _1082;
    out.m_79.y = _1076;
    out.m_79.z = _1088;
    bool _1096 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan(1.0);
    bool _1104 = _1100 || _1102;
    float _1106 = fma(_1084, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1068);
    float _1108 = fma(_1084, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1070);
    float _1110 = fma(_1006, _270, _1090);
    float _1112 = fma(_1016, _312, _1092);
    float _1114 = fma(_1016, _320, _1086);
    float _1116 = _1094 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1118 = fma(_1016, _316, _1110);
    float _1120 = _1106 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1122 = _1108 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1124 = _1112 + _1116;
    float _1126 = _1118 + _1120;
    float _1128 = _1114 + _1122;
    float _1130 = _1058;
    float _1132 = _1080;
    float _1134 = _1080;
    float _1136 = _1110;
    float _1138 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _1140 = _1094;
    float _1142 = _1122;
    float _1144 = _1128;
    float _1154;
    float _1156;
    float _1158;
    float _1160;
    if (!_1104)
    {
        bool _1146 = _1120 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1148 = !_1146;
        _1150 = _1148;
        if (!_1150)
        {
            float _1152 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1154 = _1152;
            _1156 = 0.0;
            _1158 = 0.0;
            _1160 = 0.0;
            _1162 = true;
        }
    }
    if ((!_1162) || _1150)
    {
        bool _1198;
        if (!_1150)
        {
            bool _1164 = _1120 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1166 = isnan(_1120);
            bool _1168 = _1164 || _1166;
            bool _1170 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1172 = _1168 || _1170;
            bool _1174 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1176 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1178 = !_1172;
            bool _1180 = _1176 && _1178;
            if (_1180)
            {
                _1130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1182 = _1130;
            float _1184 = _1182;
            if (_1180)
            {
                _302 = 0.0;
            }
            float _1186 = _302;
            _304 = _1186;
            _1156 = _1186;
            if (_1180)
            {
                _1132 = 0.0;
            }
            float _1188 = _1132;
            _1134 = _1188;
            _1158 = _1188;
            if (_1180)
            {
                float _1190 = _1182 * 5.0;
                _1184 = _1190;
            }
            float _1192 = _1184;
            _1154 = _1192;
            if (_1180)
            {
                _1020 = 0.0;
            }
            float _1194 = _1020;
            bool _1196 = !_1172;
            _1198 = _1196 && _1174;
            _1022 = _1194;
            _1160 = _1194;
        }
        if ((!_1198) || _1150)
        {
            _1150 = false;
            float _1200 = _1022;
            float _1202 = _1134;
            float _1204 = _304;
            bool _1206 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1208 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1210 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1212 = _1200;
            _1154 = _1128;
            if (_1206)
            {
                float _1214 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1212 = _1214;
            }
            float _1216 = _1212;
            if (_1206)
            {
                float _1218 = abs(_1018);
                float _1220 = -_1218;
                float _1222 = _1220 + 1.0;
                _1024 = _1222;
            }
            float _1224 = _1024;
            if (_1208)
            {
                float _1226 = abs(_1010);
                float _1228 = -_1226;
                float _1230 = _1228 + 1.0;
                _1026 = _1230;
            }
            float _1232 = _1026;
            if (!_1206)
            {
                _1136 = 1.0;
            }
            float _1234 = _1136;
            float _1236 = _1234;
            if (_1210)
            {
                float _1238 = abs(_1044);
                float _1240 = -_1238;
                float _1242 = _1240 + 1.0;
                _1050 = _1242;
            }
            float _1244 = _1050;
            if (!_1208)
            {
                _1138 = 1.0;
            }
            float _1246 = _1138;
            float _1248 = _1202;
            float _1250 = _1246;
            if (_1208)
            {
                float _1252 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1248 = _1252;
            }
            float _1254 = _1248;
            float _1256 = _1204;
            if (_1210)
            {
                float _1258 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1256 = _1258;
            }
            float _1260 = _1256;
            float _1262 = _1216;
            if (_1206)
            {
                float _1264 = _1224 * _1216;
                float _1266 = precise::clamp(_1264, 0.0, 1.0);
                _1236 = _1266;
            }
            float _1268 = _1236;
            if (!_1210)
            {
                _1262 = 1.0;
            }
            float _1270 = _1262;
            float _1272 = _1270;
            if (_1208)
            {
                float _1274 = _1232 * _1254;
                float _1276 = precise::clamp(_1274, 0.0, 1.0);
                _1250 = _1276;
            }
            float _1278 = _1250;
            float _1280 = _1268 * _1278;
            _1158 = _1126;
            if (_1210)
            {
                float _1282 = _1244 * _1260;
                float _1284 = precise::clamp(_1282, 0.0, 1.0);
                _1272 = _1284;
            }
            float _1286 = _1272;
            float _1288 = _1280 * _1286;
            _1156 = _1124;
            _1160 = _1288;
        }
    }
    _1162 = false;
    float _1290 = _1154;
    float _1292 = _1156;
    float _1294 = _1158;
    float _1296 = _1160;
    float _1298 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1300 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1302 = _1290 + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1306 = _1292 + _1304;
    float _1308 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1298);
    float _1310 = _1302 * _1302;
    bool _1312 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan(0.5);
    bool _1320 = _1316 || _1318;
    float _1322 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1308);
    float _1324 = fma(_1306, _1306, _1310);
    float _1326 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1328 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1330 = 1.0 / _1326;
    float _1332 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1328);
    float _1334 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1332);
    float _1336 = sqrt(_1324);
    float _1338 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1340 = _1338 + _1326;
    float _1342 = _1340 * _1330;
    float _1344 = _1342 * 0.5;
    bool _1346 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan(0.5);
    bool _1354 = _1350 || _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1358 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1356);
    bool _1360 = _1336 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1362 = 1.0 / _1358;
    bool _1364 = !_1360;
    float _1366 = _1292;
    float _1368 = _1294;
    float _1370 = _1290;
    float _1372 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1374 = _1330;
    float _1376 = _1362;
    float _1378 = _1296;
    if (!_1364)
    {
        float _1380 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1384 = _1336 + _1382;
        float _1386 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1388 = rsqrt(_1324);
        float _1390 = _1384 * _1380;
        float _1392 = _1390 * 0.15915493667125701904296875;
        float _1394 = _1392 * 6.283185482025146484375;
        float _1396 = cos(_1394);
        float _1398 = _1392 * 6.283185482025146484375;
        float _1400 = sin(_1398);
        float _1402 = _1396 + (-1.0);
        float _1404 = _1402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1406 = fma(_1400, _1386, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1408 = fma(_1396, _1294, _1404);
        float _1410 = _1388 * _1406;
        float _1412 = fma(_1306, _1410, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1414 = fma(_1302, _1410, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1140 = _1392;
        _1366 = _1412;
        _1368 = _1408;
        _1370 = _1414;
        _1372 = _1410;
    }
    float _1416 = _1140;
    float _1418 = _1366;
    float _1420 = _1368;
    float _1422 = _1370;
    float _1424 = _1372;
    float _1426 = _1424;
    float _1428 = _1416;
    float _1430 = _1420;
    float _1432 = _1418;
    float _1434 = _1422;
    if (_1320)
    {
        _1426 = 1.0;
    }
    float _1436 = _1426;
    float _1438 = _1436;
    if (!_1354)
    {
        float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1442 = _1120 + _1440;
        float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1446 = _1116 + _1444;
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1450 = _1442 * _1442;
        float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1454 = _1122 + _1452;
        float _1456 = fma(_1446, _1446, _1450);
        float _1458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1460 = fma(_1454, _1454, _1456);
        float _1462 = sqrt(_1460);
        float _1464 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1466 = precise::min(_1462, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1468 = _1466 * _1458;
        float _1470 = -_1116;
        float _1472 = _1470 + _1418;
        float _1474 = _1464 * _1468;
        float _1476 = -_1120;
        float _1478 = _1476 + _1420;
        float _1480 = -_1122;
        float _1482 = _1480 + _1422;
        float _1484 = fma(_1472, _1474, _1116);
        float _1486 = fma(_1478, _1474, _1120);
        float _1488 = fma(_1482, _1474, _1122);
        _1428 = _1482;
        _1430 = _1486;
        _1432 = _1484;
        _1434 = _1488;
        _1374 = _1474;
    }
    float _1490 = _1428;
    float _1492 = _1430;
    float _1494 = _1432;
    float _1496 = _1434;
    float _1498 = _1374;
    float _1500 = _1490;
    if (_1320)
    {
        _1142 = 1.0;
    }
    float _1502 = _1142;
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1506 = _1362 * _1504;
    float _1508 = _1502;
    if (!_1320)
    {
        float _1510 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1512 = _1510 * 0.15915493667125701904296875;
        float _1514 = _1512 * 6.283185482025146484375;
        float _1516 = cos(_1514);
        float _1518 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1520 = _1518 * 0.15915493667125701904296875;
        float _1522 = _1512 * 6.283185482025146484375;
        float _1524 = sin(_1522);
        float _1526 = 1.0 / _1516;
        float _1528 = _1520 * 6.283185482025146484375;
        float _1530 = cos(_1528);
        float _1532 = _1524 * _1526;
        float _1534 = _1520 * 6.283185482025146484375;
        float _1536 = sin(_1534);
        float _1538 = _1530 * _1532;
        float _1540 = 1.0 / _1538;
        float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1544 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1542;
        float _1546 = 1.0 / _1544;
        float _1548 = _1536 * _1540;
        float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1552 = fma(_1506, _1548, _1550);
        float _1554 = _1552 * _1546;
        float _1556 = precise::clamp(_1554, 0.0, 1.0);
        _1500 = _1520;
        _1438 = _1556;
    }
    float _1558 = _1500;
    float _1560 = _1438;
    float _1562 = _1558;
    if (!_1320)
    {
        float _1564 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1566 = _1564 * 0.15915493667125701904296875;
        float _1568 = _1566 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        float _1572 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1574 = _1572 * 0.15915493667125701904296875;
        float _1576 = _1566 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = 1.0 / _1570;
        float _1582 = _1574 * 6.283185482025146484375;
        float _1584 = cos(_1582);
        float _1586 = _1578 * _1580;
        float _1588 = _1574 * 6.283185482025146484375;
        float _1590 = sin(_1588);
        float _1592 = _1584 * _1586;
        float _1594 = 1.0 / _1592;
        float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1598 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1596;
        float _1600 = 1.0 / _1598;
        float _1602 = _1590 * _1594;
        float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1606 = fma(_1506, _1602, _1604);
        float _1608 = _1606 * _1600;
        float _1610 = precise::clamp(_1608, 0.0, 1.0);
        float _1612 = -_1610;
        float _1614 = _1612 + 1.0;
        _1376 = _1594;
        _1562 = _1580;
        _1508 = _1614;
    }
    float _1616 = _1376;
    float _1618 = _1562;
    float _1620 = _1508;
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1624 = _1492 + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1628 = _1494 + _1626;
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1632 = _1496 + _1630;
    float _1634 = _1624 * _1624;
    float _1636 = fma(_1628, _1628, _1634);
    float _1638 = fma(_1632, _1632, _1636);
    float _1640 = rsqrt(_1638);
    float _1642 = sqrt(_1638);
    float _1644 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1646 = _1628 * _1644;
    float _1648 = _1632 * _1644;
    float _1650 = _1646 * _1646;
    float _1652 = _1648 * _1648;
    float _1654 = _1650 + _1652;
    float _1656 = sqrt(_1654);
    bool _1658 = _1656 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = _1656 + _1660;
    float _1664 = _1498;
    float _1666 = _1662;
    float _1668 = _1616;
    float _1670 = _1624;
    float _1672 = _1646;
    if (_1658)
    {
        float _1674 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1664 = _1674;
    }
    float _1676 = _1664;
    float _1678 = _1676;
    if (_1658)
    {
        float _1680 = _1662 * _1676;
        _1666 = _1680;
    }
    float _1682 = _1666;
    if (_1658)
    {
        float _1684 = rsqrt(_1654);
        _1678 = _1684;
    }
    float _1686 = _1678;
    float _1688 = _1686;
    if (_1658)
    {
        float _1690 = _1682 * 0.15915493667125701904296875;
        _1668 = _1690;
    }
    float _1692 = _1668;
    float _1694 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1696 = _1632;
    if (_1658)
    {
        float _1698 = _1692 * 6.283185482025146484375;
        float _1700 = sin(_1698);
        _1696 = _1700;
    }
    float _1702 = _1696;
    float _1704 = precise::max(0.0, _1694);
    float _1706 = _1618;
    float _1708 = _1704;
    if (_1658)
    {
        float _1710 = _1692 * 6.283185482025146484375;
        float _1712 = cos(_1710);
        _1706 = _1712;
    }
    float _1714 = _1706;
    float _1716 = -_1644;
    float _1718 = -_1704;
    float _1720 = fma(_1624, _1716, _1718);
    if (_1658)
    {
        float _1722 = _1720 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1670 = _1722;
    }
    float _1724 = _1670;
    float _1726 = _1702;
    float _1728 = _1724;
    if (_1658)
    {
        float _1730 = fma(_1702, _1724, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1726 = _1730;
    }
    float _1732 = _1726;
    float _1734 = _1732;
    if (!_1658)
    {
        _1728 = _1720;
    }
    float _1736 = _1728;
    float _1738 = _1736;
    if (_1658)
    {
        float _1740 = _1686 * _1732;
        _1144 = _1740;
    }
    float _1742 = _1144;
    if (!_1658)
    {
        _1734 = _1650;
    }
    float _1744 = _1734;
    float _1746 = _1744;
    float _1748 = _1714;
    if (_1658)
    {
        float _1750 = _1714 + (-1.0);
        _1708 = _1750;
    }
    float _1752 = _1708;
    float _1754 = _1752;
    if (_1658)
    {
        float _1756 = _1646 * _1742;
        _1672 = _1756;
    }
    float _1758 = _1672;
    if (_1658)
    {
        float _1760 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1688 = _1760;
    }
    float _1762 = _1688;
    if (!_1658)
    {
        _1754 = _1648;
    }
    float _1764 = _1754;
    float _1766 = _1764;
    if (_1658)
    {
        float _1768 = _1648 * _1742;
        _1766 = _1768;
    }
    float _1770 = _1766;
    if (_1658)
    {
        float _1772 = _1758 * _1758;
        _1746 = _1772;
    }
    float _1774 = _1746;
    if (_1658)
    {
        float _1776 = fma(_1720, _1714, _1762);
        _1738 = _1776;
    }
    float _1778 = _1738;
    if (!_1658)
    {
        _1748 = _1652;
    }
    float _1780 = _1748;
    float _1782 = _1780;
    if (_1658)
    {
        float _1784 = _1770 * _1770;
        _1782 = _1784;
    }
    float _1786 = _1782;
    float _1788 = fma(_1778, _1778, _1774);
    float _1790 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1792 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1794 = _1788 + _1786;
    float _1796 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1790);
    float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1800 = fma(_1642, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1798);
    float _1802 = precise::clamp(_1800, 0.0, 1.0);
    float _1804 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1806 = rsqrt(_1794);
    float _1808 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1796);
    float _1810 = -_1802;
    float _1812 = _1810 + 1.0;
    float _1814 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1804);
    float _1816 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1818 = _1808 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1820 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1792);
    float _1822 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1824 = abs(_1812);
    float _1826 = log2(_1824);
    float _1828 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1816);
    float _1830 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1814);
    float _1832 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1834 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1820);
    float _1836 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1828);
    float _1838 = _1830 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1840 = -_1832;
    float _1842 = fma(_1840, _1822, 1.0);
    float _1844 = _1806 * _1770;
    float _1846 = _1806 * _1758;
    float _1848 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1850 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1852 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1854 = _1806 * _1778;
    float _1856 = _1846 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1858 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1850);
    float _1860 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1862 = log2(_1842);
    float _1864 = -_1856;
    float _1866 = fma(_1854, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1864);
    float _1868 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1858);
    float _1870 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1872 = -_1844;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1866);
    float _1876 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1868);
    float _1878 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1880 = exp2(_1860);
    float _1882 = fma(_1874, -0.5, 0.5);
    float _1884 = fma(_1874, 0.5, 0.5);
    float _1886 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1878);
    float _1888 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1870);
    float _1890 = _1854 + 1.0;
    float _1892 = fma(_1884, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1894 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1886);
    float _1896 = 1.0 / _1876;
    float _1898 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1888);
    float _1900 = fma(_1884, _1892, -0.212114393711090087890625);
    float _1902 = _1862 * 0.693147182464599609375;
    float _1904 = fma(_1884, _1900, 1.570728778839111328125);
    float _1906 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1908 = sqrt(_1882);
    float _1910 = -_1854;
    float _1912 = fma(_1880, _1890, _1910);
    float _1914 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1894);
    float _1916 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1898);
    float _1918 = fma(_1912, 0.5, 0.5);
    float _1920 = _1914 * _1896;
    float _1922 = _1916 * _1896;
    float _1924 = fma(_1920, 0.5, 0.5);
    float _1926 = fma(_1922, -0.5, 0.5);
    float _1928 = _1908 * 0.636619746685028076171875;
    float3 _5284 = float3(_1924, _1926, _1906);
    float _1930 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5284, float3(0.0), isnan(_5284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5284, float3(0.0), isnan(_5284)), level(0.0)).x;
    float3 _5295 = float3(_1924, _1926, _1906);
    float4 _1933 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5295, float3(0.0), isnan(_5295)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5295, float3(0.0), isnan(_5295)), level(0.0)).xyzw;
    float _1935 = _1933.x;
    float _1937 = _1933.y;
    float _1939 = _1933.z;
    float _1941 = _1933.w;
    float _1943 = -_1904;
    float _1945 = fma(_1928, _1943, 1.0);
    float2 _5317 = float2(_1945, _1918);
    float3 _1949 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5317, float2(0.0), isnan(_5317)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5317, float2(0.0), isnan(_5317)), level(0.0)).xyz;
    float _1951 = _1949.x;
    float _1953 = _1949.y;
    float _1955 = _1949.z;
    float _1957 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1959 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1961 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1963 = isnan(_1642);
    bool _1965 = _1961 || _1963;
    bool _1967 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1969 = _1965 || _1967;
    float _1971 = _1914 + _1876;
    float _1973 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1959);
    float _1975 = exp2(_1957);
    float _1977 = _1876 * 0.5;
    float _1979 = _1971 * 0.5;
    float _1981 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1973);
    float _1983 = fma(_1916, -0.5, _1977);
    float _1985 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1981);
    float _1987 = _1985 + _1876;
    out.gl_Position.x = _1914;
    out.gl_Position.y = _1916;
    out.gl_Position.z = _1985;
    out.gl_Position.w = _1876;
    float _1989 = _1987 * 0.5;
    float _1991 = -_1975;
    float _1993 = _1991 + 1.0;
    float _1995 = _1993 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _1979;
    out.m_81.y = _1983;
    out.m_81.z = _1989;
    out.m_81.w = _1876;
    float _1997 = -_1995;
    float _1999 = _1997 + 1.0;
    float _2001 = _1560 * _1620;
    float _2003 = _1876;
    float _2005 = _1985;
    float _2007 = _1916;
    float _2009 = _1979;
    if (!_1969)
    {
        _2003 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2011 = _2003;
    float _2013 = _2011;
    float _2015 = _2011;
    if (!_1969)
    {
        _2005 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2017 = _2005;
    float _2019 = _2001 * _1296;
    float _2021 = _2019;
    float _2023 = _2017;
    float _2025 = _2017;
    if (!_1969)
    {
        _1378 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2027 = _1378;
    float _2029 = _2027;
    float _2031 = _2027;
    if (!_1969)
    {
        _2007 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2033 = _2007;
    float _2035 = _2019 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2037 = _2033;
    float _2039 = _2033;
    if (!_1969)
    {
        _2009 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2041 = _2009;
    float _2043 = _2041;
    float _2045 = _2041;
    if (!_1969)
    {
        _2021 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2047 = _2021;
    float _2049 = _1995 * _1930;
    float _2051 = _1941 * _2049;
    float _2053 = _1955 * _2049;
    float _2055 = fma(_1951, _2051, _1935);
    float _2057 = fma(_1953, _2051, _1937);
    float _2059 = _1941 * _1999;
    float _2061 = fma(_1941, _2053, _1939);
    out.m_83.x = _2055;
    out.m_83.y = _2057;
    out.m_83.z = _2061;
    out.m_83.w = _2059;
    bool _2063 = !_1969;
    float _2065 = _2047;
    float _2067 = _2047;
    if (!_2063)
    {
        bool _2069 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2071 = isnan(_1642);
        bool _2073 = _2069 || _2071;
        bool _2075 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2077 = _2073 || _2075;
        if (!_2077)
        {
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2081 = _1642 + _2079;
            float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2085 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2083;
            float _2087 = 1.0 / _2085;
            float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2099 = _2097 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2103 = _2101 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2107 = _2105 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2109 = _2081 * _2087;
            float _2111 = precise::clamp(_2109, 0.0, 1.0);
            float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2115 = _2113 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2117 = fma(_2111, _2091, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2119 = fma(_2111, _2115, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2121 = fma(_2111, _2095, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2123 = fma(_2111, _2099, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2125 = fma(_2111, _2103, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2127 = fma(_2111, _2107, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2045 = _2119;
            _2039 = _2125;
            _2031 = _2117;
            _2025 = _2123;
            _2015 = _2121;
            _2067 = _2127;
            _2129 = true;
        }
        else
        {
            bool _2131 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2133 = isnan(_1642);
            bool _2135 = _2131 || _2133;
            bool _2137 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2139 = _2135 || _2137;
            if (!_2139)
            {
                _2029 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2141 = _2029;
            _2031 = _2141;
            if (!_2139)
            {
                _2043 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2143 = _2043;
            _2045 = _2143;
            if (!_2139)
            {
                _2013 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2145 = _2013;
            _2015 = _2145;
            if (!_2139)
            {
                _2023 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2147 = _2023;
            _2025 = _2147;
            if (!_2139)
            {
                _2037 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2149 = _2037;
            _2039 = _2149;
            if (!_2139)
            {
                _2065 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2151 = _2065;
            bool _2153 = !_2139;
            _2067 = _2151;
            if (!_2153)
            {
                bool _2155 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2157 = isnan(_1642);
                bool _2159 = _2155 || _2157;
                bool _2161 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2163 = _2159 || _2161;
                if (!_2163)
                {
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2167 = _1642 + _2165;
                    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2171 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2169;
                    float _2173 = 1.0 / _2171;
                    float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2193 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2195 = _2167 * _2173;
                    float _2197 = precise::clamp(_2195, 0.0, 1.0);
                    float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2203 = fma(_2197, _2177, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2205 = fma(_2197, _2201, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2207 = fma(_2197, _2181, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2209 = fma(_2197, _2185, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2211 = fma(_2197, _2189, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2213 = fma(_2197, _2193, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2045 = _2205;
                    _2039 = _2211;
                    _2031 = _2203;
                    _2025 = _2209;
                    _2015 = _2207;
                    _2067 = _2213;
                    _2129 = true;
                }
                else
                {
                    _2045 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2039 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2031 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2025 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2015 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2067 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2129 = false;
    float _2215 = _2045;
    float _2217 = _2039;
    float _2219 = _2031;
    float _2221 = _2025;
    float _2223 = _2015;
    float _2225 = _2067;
    float _2227 = fma(_1076, -0.5, 0.5);
    float _2229 = precise::clamp(_2227, 0.0, 1.0);
    float _2231 = -_2215;
    float _2233 = _2231 + _2217;
    float _2235 = _2035 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2237 = -_2219;
    float _2239 = _2237 + _2221;
    out.m_85.x = 0.0;
    float _2241 = fma(_2229, _2233, _2215);
    float _2243 = fma(_2229, _2239, _2219);
    out.m_49.x = _2235;
    float _2245 = -_2223;
    float _2247 = _2245 + _2225;
    float _2249 = _2241 * 0.586610972881317138671875;
    bool _2251 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2253 = fma(_2229, _2247, _2223);
    float _2255 = fma(_2243, 0.298911988735198974609375, _2249);
    bool _2257 = _1560 > 0.0;
    bool _2259 = isnan(_1560);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan(0.0);
    bool _2265 = _2261 || _2263;
    float _2267 = fma(_2253, 0.114477999508380889892578125, _2255);
    bool _2269 = _1620 <= 0.0;
    bool _2271 = !_2265;
    bool _2273 = _2269 || _2271;
    float _2275 = -_2267;
    float _2277 = _2243 + _2275;
    float _2279 = -_2267;
    float _2281 = _2241 + _2279;
    float _2283 = -_2267;
    float _2285 = _2253 + _2283;
    float _2287 = fma(_2277, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2267);
    float _2289 = fma(_2281, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2267);
    float _2291 = fma(_2285, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2267);
    bool _2293 = !_2251;
    if (!_2293)
    {
        float _2295 = -_1492;
        float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2299 = -_1494;
        float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2303 = -_1496;
        float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2307 = _2297 * _2297;
        float _2309 = fma(_2301, _2301, _2307);
        float _2311 = fma(_2305, _2305, _2309);
        float _2313 = sqrt(_2311);
        float _2315 = rsqrt(_2311);
        float _2317 = -_2313;
        float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2321 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2323 = precise::clamp(_2321, 0.0, 1.0);
        float _2325 = _2301 * _2315;
        float _2327 = _2297 * _2315;
        float _2329 = abs(_2323);
        float _2331 = log2(_2329);
        float _2333 = _2305 * _2315;
        float _2335 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2337 = _1076 * _2327;
        float _2339 = -_2327;
        float _2341 = -_2335;
        float _2343 = fma(_2339, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2341);
        float _2345 = fma(_1082, _2325, _2337);
        float _2347 = -_2333;
        float _2349 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2343);
        float _2351 = fma(_1088, _2333, _2345);
        float _2353 = precise::clamp(_2351, 0.0, 1.0);
        float _2355 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2357 = _2349 + _2355;
        float _2359 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2361 = _2357 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2363 = precise::clamp(_2361, 0.0, 1.0);
        float _2365 = exp2(_2359);
        float _2367 = _2365 * _2363;
        float _2369 = _2353 * _2367;
        float _2371 = _2369 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2373 = _2369 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2375 = _2369 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _2371;
        out.m_85.y = _2373;
        out.m_85.z = _2375;
    }
    out.m_87.x = _2287;
    out.m_87.y = _2289;
    out.m_87.z = _2291;
    if (!_2273)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2377 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2377;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2129 = false;
    bool _1162 = false;
    bool _1150 = false;
    bool _456 = false;
    bool _342 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2434 = as_type<float>(_122);
        out.gl_Position.z = _2434;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_106);
        _116 = _142;
    }
    float _144 = _116;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_49.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2503 = as_type<float>(_158);
        out.gl_Position.z = _2503;
    }
    if (_150)
    {
        return out;
    }
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = in.m_55.z;
    float _172 = in.m_57.x;
    float _174 = in.m_57.y;
    float _176 = in.m_57.z;
    float _178 = _160 * _160;
    float _180 = _162 * _162;
    float _182 = _164 * _164;
    float _184 = fma(_166, _166, _178);
    float _186 = fma(_168, _168, _180);
    float _188 = fma(_170, _170, _182);
    float _190 = fma(_172, _172, _184);
    float _192 = fma(_174, _174, _186);
    float _194 = fma(_176, _176, _188);
    float _196 = sqrt(_190);
    float _198 = sqrt(_192);
    float _200 = sqrt(_194);
    bool _202 = _196 > 0.0;
    bool _204 = _198 > 0.0;
    float _206 = _198;
    if (_202)
    {
        float _208 = rsqrt(_190);
        _206 = _208;
    }
    float _210 = _206;
    float _212 = 0.0;
    float _214 = 0.0;
    if (!_202)
    {
        _212 = 0.0;
        _214 = 0.0;
    }
    float _216 = _212;
    float _218 = _214;
    bool _220 = _200 > 0.0;
    float _222 = 0.0;
    float _224 = _216;
    float _226 = _218;
    if (!_202)
    {
        _222 = 0.0;
    }
    float _228 = _222;
    float _230 = 0.0;
    float _232 = _228;
    if (!_204)
    {
        _230 = 0.0;
    }
    float _234 = _230;
    float _236 = _200;
    float _238 = _234;
    if (_204)
    {
        float _240 = rsqrt(_192);
        _236 = _240;
    }
    float _242 = _236;
    float _244 = 0.0;
    if (!_204)
    {
        _244 = 0.0;
    }
    float _246 = _244;
    float _248 = 0.0;
    float _250 = _246;
    if (!_220)
    {
        _248 = 0.0;
    }
    float _252 = _248;
    float _254 = 0.0;
    float _256 = _252;
    if (_220)
    {
        float _258 = rsqrt(_194);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = _210;
    if (_202)
    {
        float _264 = _210 * _166;
        _232 = _264;
    }
    float _266 = _232;
    if (_202)
    {
        float _268 = _210 * _160;
        _224 = _268;
    }
    float _270 = _224;
    if (_202)
    {
        float _272 = _210 * _172;
        _226 = _272;
    }
    float _274 = _226;
    bool _276 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_204)
    {
        _262 = 0.0;
    }
    float _278 = _262;
    float _280 = 0.0;
    float _282 = _278;
    if (!_220)
    {
        _280 = 0.0;
    }
    float _284 = _280;
    float _286 = _284;
    if (_204)
    {
        float _288 = _242 * _168;
        _238 = _288;
    }
    float _290 = _238;
    float _292 = 0.0;
    if (!_220)
    {
        _292 = 0.0;
    }
    float _294 = _292;
    float _296 = _294;
    if (_204)
    {
        float _298 = _242 * _162;
        _250 = _298;
    }
    float _300 = _250;
    float _302 = _300;
    float _304 = _300;
    if (_204)
    {
        float _306 = _242 * _174;
        _282 = _306;
    }
    float _308 = _282;
    if (_220)
    {
        float _310 = _260 * _170;
        _256 = _310;
    }
    float _312 = _256;
    if (_220)
    {
        float _314 = _260 * _164;
        _286 = _314;
    }
    float _316 = _286;
    if (_220)
    {
        float _318 = _260 * _176;
        _296 = _318;
    }
    float _320 = _296;
    bool _322 = !_276;
    float _340;
    if (!_322)
    {
        float _324 = in.m_59.x;
        float _326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _328 = _324 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _332 = _330 * _326;
        float _334 = floor(_332);
        float _336 = -_334;
        float _338 = _332 + _336;
        _340 = _338;
        _342 = true;
    }
    else
    {
        float _344 = float(_106);
        float _346 = 1.0 / _344;
        float _348 = _140 * _346;
        _340 = _348;
    }
    _342 = false;
    float _350 = _340;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _354 = _350 + _352;
    bool _356 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _358 = isnan(_350);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _368;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _374 = 1.0 / _370;
    float _376 = -_366;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _380;
    float _384 = _354 * _374;
    bool _386 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _388 = isnan(_350);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _398;
    float _402 = fma(_382, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _404;
    float _408 = _396 * _378;
    float _410 = fma(_400, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _412 = fma(_406, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _414 = -_396;
    float _416 = _414 + 1.0;
    float _418 = _402 * _408;
    float _420 = _410 * _408;
    float _422 = _412 * _408;
    float _424 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _426 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].z, _418);
    float _430 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[144].x, _424);
    float _432 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[144].y, _426);
    float _434 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[144].z, _428);
    bool _436 = !_372;
    float _454;
    if (!_436)
    {
        float _438 = in.m_59.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        float _458 = float(_106);
        float _460 = 1.0 / _458;
        float _462 = _140 * _460;
        _454 = _462;
    }
    _456 = false;
    float _464 = _454;
    float _466 = in.m_59.y;
    float _468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _470 = in.m_46.x;
    float _472 = in.m_46.y;
    float _474 = in.m_46.z;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _478 = _476 != 0;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _482 = _480 != 0;
    float _484 = in.m_61.x;
    float _486 = in.m_61.y;
    float _488 = in.m_61.z;
    float _490 = in.m_63.x;
    float _492 = in.m_63.y;
    float _494 = in.m_63.z;
    float _496 = in.m_65.x;
    float _498 = in.m_65.w;
    bool _500 = _466 > 0.5;
    float _502 = in.m_67.x;
    float _504 = _162 * _472;
    float _506 = _174 * _472;
    float _508 = _168 * _472;
    float _510 = _432 * _486;
    float _512 = _430 * _484;
    float _514 = fma(_160, _470, _504);
    float _516 = -_492;
    float _518 = _516 + (-1.0);
    float _520 = _434 * _488;
    float _522 = fma(_166, _470, _508);
    float _524 = fma(_518, _496, _492);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _530 = fma(_172, _470, _506);
    float _532 = fma(_170, _474, _522);
    float _534 = 1.0 / _528;
    float _536 = fma(_164, _474, _514);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _542 = -_490;
    float _544 = fma(_496, _542, _490);
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _548 = in.m_67.y;
    float _550 = 1.0 / _540;
    float _552 = fma(_176, _474, _530);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _558 = in.m_53.w;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _562 = 1.0 / _556;
    float _564 = _546 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _566;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _572 = -_494;
    float _574 = fma(_496, _572, _494);
    out.m_69.w = _498;
    float _576 = _568 * _534;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _586 = _464 + _584;
    float _588 = _498;
    float _590 = 9.9999997473787516355514526367188e-05;
    float _592 = _524;
    float _594 = _544;
    float _596 = _574;
    if (_478)
    {
        float _598 = in.m_59.x;
        _588 = _598;
    }
    float _600 = _588;
    float _602 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = fma(_576, _586, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _608 = in.m_55.w;
    float _610 = _580 * _550;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _614 = _464 + _612;
    out.m_71.x = _564;
    out.m_71.y = _602;
    out.m_71.z = _604;
    out.m_71.w = _582;
    float _616 = -_548;
    float _618 = _616 + 1.0;
    float _620 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _622 = _536 + _558;
    float _624 = in.m_57.w;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _626;
    float _630 = _548;
    if (_482)
    {
        float _632 = _500 ? _618 : _548;
        _630 = _632;
    }
    float _634 = _630;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _638 = _464 + _636;
    float _640 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.vp_c8)._m0[32].y;
    float _642 = _628 * _562;
    float _644 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _646 = _622 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _648 = _634 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _650 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _652 = fma(_610, _614, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _654 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _656 = isnan(_464);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = in.m_73.x;
    float _668 = in.m_73.y;
    float _670 = in.m_73.z;
    bool _672 = _600 > 0.5;
    bool _674 = _672 && _478;
    float _676 = fma(_642, _638, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _678 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _680 = isnan(_464);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = _532 + _608;
    float _692 = -_664;
    float _694 = _692 + 1.0;
    float _696 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.vp_c8)._m0[32].x;
    float _698 = _640 * _640;
    bool _700 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _702 = isnan(_464);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = _688 * _694;
    float _714 = -_688;
    float _716 = _714 + 1.0;
    float _718 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.vp_c8)._m0[32].z;
    float _720 = fma(_696, _696, _698);
    float _722 = _720;
    if (_478)
    {
        _590 = _502;
    }
    float _724 = _590;
    float _726 = _710 * _716;
    bool _728 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _730 = isnan(_464);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = fma(_718, _718, _720);
    float _742 = -_710;
    float _744 = _742 + 1.0;
    float _746 = _552 + _624;
    float _748 = _724;
    if (_674)
    {
        float _750 = -_724;
        float _752 = _750 + 1.0;
        _748 = _752;
    }
    float _754 = _748;
    float _756 = rsqrt(_740);
    float _758 = _738 * _744;
    if (!_478)
    {
        _722 = _502;
    }
    float _760 = _722;
    float _762 = -_738;
    float _764 = _762 + 1.0;
    float _766 = _668 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _768 = _668 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _770 = _668 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _772 = _606 * _758;
    float _774 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].x, _766);
    float _776 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].x, _768);
    float _778 = _760;
    if (_478)
    {
        _778 = _754;
    }
    float _780 = _778;
    float _782 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].x, _770);
    float _784 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[25].z, _774);
    float _786 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[24].z, _776);
    float _788 = _690 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _790 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[26].z, _782);
    float _792 = _784 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _794 = _784 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _796 = _784 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _798 = _780 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _800 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].x, _792);
    float _802 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].y, _794);
    float _804 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].z, _796);
    float _806 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[115].x, _772);
    float _808 = _718 * _756;
    float _810 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].x, _800);
    float _812 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].y, _802);
    float _814 = fma(_652, _726, _806);
    float _816 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].z, _804);
    float _818 = _798 * _644;
    float _820 = _646 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _822 = _646 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _824 = _646 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _826 = _696 * _756;
    float _828 = _648 * _468;
    float _830 = fma(_788, (*spvDescriptorSet0.vp_c12)._m0[6].x, _820);
    float _832 = fma(_788, (*spvDescriptorSet0.vp_c12)._m0[6].y, _822);
    float _834 = fma(_788, (*spvDescriptorSet0.vp_c12)._m0[6].z, _824);
    float _836 = _746 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _838 = _826 * _826;
    float _840 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _842 = fma(_836, (*spvDescriptorSet0.vp_c12)._m0[8].x, _830);
    float _844 = fma(_836, (*spvDescriptorSet0.vp_c12)._m0[8].y, _832);
    float _846 = fma(_836, (*spvDescriptorSet0.vp_c12)._m0[8].z, _834);
    float _848 = fma(_808, _808, _838);
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[191].x * 0.15915493667125701904296875;
    float _852 = fma(_676, _712, _814);
    float _854 = _842 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _856 = rsqrt(_848);
    out.m_75.x = _818;
    out.m_75.y = _828;
    float _858 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[118].x, _852);
    float _860 = _846 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _862 = _858 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _864 = _844 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _866 = _850 * 6.283185482025146484375;
    float _868 = cos(_866);
    float _870 = _854 * _840;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _874 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _876 = fma(_870, 0.5, 0.5);
    float _878 = _872 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _880 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _886 = _808 * _856;
    float _888 = _826 * _856;
    float _890 = _882 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _892 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _894 = _850 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = -_868;
    float _900 = _898 + 1.0;
    float _902 = _868 * _668;
    out.m_77.x = _890;
    out.m_77.y = _892;
    out.m_77.z = _878;
    out.m_77.w = _862;
    float _904 = _886 * _900;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _908 = _860 * _880;
    float _910 = fma(_908, 0.5, 0.5);
    float _912 = _886 * _896;
    float _914 = -_896;
    float _916 = _888 * _914;
    float _918 = fma(_886, _904, _868);
    float _920 = -_904;
    float _922 = _888 * _920;
    float _924 = _888 * _888;
    float _926 = fma(_916, _666, _902);
    float _928 = _916 * _668;
    float _930 = _912 * _668;
    float _932 = _864 * _906;
    float _934 = -_912;
    float _936 = fma(_934, _670, _926);
    float _938 = -_928;
    float _940 = fma(_918, _666, _938);
    float _942 = fma(_900, _924, _868);
    float _944 = fma(_932, 0.5, 0.5);
    float _946 = fma(_922, _666, _930);
    float _948 = -_812;
    float _950 = _948 + _936;
    float _952 = fma(_922, _670, _940);
    float _954 = floor(_944);
    float _956 = fma(_942, _670, _946);
    float _958 = fma(_950, _496, _812);
    float _960 = -_810;
    float _962 = _960 + _952;
    float _964 = -_816;
    float _966 = _964 + _956;
    float _968 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _958);
    float _970 = fma(_962, _496, _810);
    float _972 = floor(_876);
    bool _974 = _958 != 0.0;
    bool _976 = isnan(_958);
    bool _978 = _974 || _976;
    bool _980 = isnan(0.0);
    bool _982 = _978 || _980;
    float _984 = fma(_966, _496, _816);
    float _986 = _620 * _968;
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _970);
    bool _990 = _970 == 0.0;
    bool _992 = !_982;
    bool _994 = _990 && _992;
    float _996 = floor(_910);
    float _998 = -_954;
    float _1000 = _944 + _998;
    bool _1002 = _984 == 0.0;
    bool _1004 = _1002 && _994;
    float _1006 = _650 * _988;
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _984);
    float _1010 = fma(_1000, 2.0, -1.0);
    float _1012 = -_972;
    float _1014 = _876 + _1012;
    float _1016 = _874 * _1008;
    float _1018 = fma(_1014, 2.0, -1.0);
    float _1020 = _1016;
    float _1022 = _1016;
    float _1024 = _1018;
    float _1026 = _1010;
    if (!_1004)
    {
        float _1028 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[17].y, _524);
        _592 = _1028;
    }
    float _1030 = _592;
    float _1032 = -_996;
    float _1034 = _910 + _1032;
    float _1036 = _1018 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    if (!_1004)
    {
        float _1038 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[17].y, _544);
        _594 = _1038;
    }
    float _1040 = _594;
    float _1042 = _290 * _1030;
    float _1044 = fma(_1034, 2.0, -1.0);
    float _1046 = _1010 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1048 = _300 * _1030;
    float _1050 = _1044;
    if (!_1004)
    {
        float _1052 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[17].y, _574);
        _596 = _1052;
    }
    float _1054 = _596;
    float _1056 = _986 * _290;
    float _1058 = _1046 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1060 = _1046 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1062 = _1046 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1064 = fma(_270, _1040, _1048);
    float _1066 = fma(_1036, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1058);
    float _1068 = fma(_1036, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1060);
    float _1070 = fma(_1036, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1062);
    float _1072 = _308 * _1030;
    float _1074 = fma(_266, _1040, _1042);
    float _1076 = fma(_316, _1054, _1064);
    float _1078 = _986 * _308;
    float _1080 = fma(_274, _1040, _1072);
    float _1082 = fma(_312, _1054, _1074);
    float _1084 = _1044 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1086 = fma(_1006, _274, _1078);
    float _1088 = fma(_320, _1054, _1080);
    float _1090 = _986 * _300;
    float _1092 = fma(_1006, _266, _1056);
    float _1094 = fma(_1084, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1066);
    out.m_79.x = _1082;
    out.m_79.y = _1076;
    out.m_79.z = _1088;
    bool _1096 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan(1.0);
    bool _1104 = _1100 || _1102;
    float _1106 = fma(_1084, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1068);
    float _1108 = fma(_1084, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1070);
    float _1110 = fma(_1006, _270, _1090);
    float _1112 = fma(_1016, _312, _1092);
    float _1114 = fma(_1016, _320, _1086);
    float _1116 = _1094 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1118 = fma(_1016, _316, _1110);
    float _1120 = _1106 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1122 = _1108 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1124 = _1112 + _1116;
    float _1126 = _1118 + _1120;
    float _1128 = _1114 + _1122;
    float _1130 = _1058;
    float _1132 = _1080;
    float _1134 = _1080;
    float _1136 = _1110;
    float _1138 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _1140 = _1094;
    float _1142 = _1122;
    float _1144 = _1128;
    float _1154;
    float _1156;
    float _1158;
    float _1160;
    if (!_1104)
    {
        bool _1146 = _1120 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1148 = !_1146;
        _1150 = _1148;
        if (!_1150)
        {
            float _1152 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1154 = _1152;
            _1156 = 0.0;
            _1158 = 0.0;
            _1160 = 0.0;
            _1162 = true;
        }
    }
    if ((!_1162) || _1150)
    {
        bool _1198;
        if (!_1150)
        {
            bool _1164 = _1120 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1166 = isnan(_1120);
            bool _1168 = _1164 || _1166;
            bool _1170 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1172 = _1168 || _1170;
            bool _1174 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1176 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1178 = !_1172;
            bool _1180 = _1176 && _1178;
            if (_1180)
            {
                _1130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1182 = _1130;
            float _1184 = _1182;
            if (_1180)
            {
                _302 = 0.0;
            }
            float _1186 = _302;
            _304 = _1186;
            _1156 = _1186;
            if (_1180)
            {
                _1132 = 0.0;
            }
            float _1188 = _1132;
            _1134 = _1188;
            _1158 = _1188;
            if (_1180)
            {
                float _1190 = _1182 * 5.0;
                _1184 = _1190;
            }
            float _1192 = _1184;
            _1154 = _1192;
            if (_1180)
            {
                _1020 = 0.0;
            }
            float _1194 = _1020;
            bool _1196 = !_1172;
            _1198 = _1196 && _1174;
            _1022 = _1194;
            _1160 = _1194;
        }
        if ((!_1198) || _1150)
        {
            _1150 = false;
            float _1200 = _1022;
            float _1202 = _1134;
            float _1204 = _304;
            bool _1206 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1208 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1210 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1212 = _1200;
            _1154 = _1128;
            if (_1206)
            {
                float _1214 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1212 = _1214;
            }
            float _1216 = _1212;
            if (_1206)
            {
                float _1218 = abs(_1018);
                float _1220 = -_1218;
                float _1222 = _1220 + 1.0;
                _1024 = _1222;
            }
            float _1224 = _1024;
            if (_1208)
            {
                float _1226 = abs(_1010);
                float _1228 = -_1226;
                float _1230 = _1228 + 1.0;
                _1026 = _1230;
            }
            float _1232 = _1026;
            if (!_1206)
            {
                _1136 = 1.0;
            }
            float _1234 = _1136;
            float _1236 = _1234;
            if (_1210)
            {
                float _1238 = abs(_1044);
                float _1240 = -_1238;
                float _1242 = _1240 + 1.0;
                _1050 = _1242;
            }
            float _1244 = _1050;
            if (!_1208)
            {
                _1138 = 1.0;
            }
            float _1246 = _1138;
            float _1248 = _1202;
            float _1250 = _1246;
            if (_1208)
            {
                float _1252 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1248 = _1252;
            }
            float _1254 = _1248;
            float _1256 = _1204;
            if (_1210)
            {
                float _1258 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1256 = _1258;
            }
            float _1260 = _1256;
            float _1262 = _1216;
            if (_1206)
            {
                float _1264 = _1224 * _1216;
                float _1266 = precise::clamp(_1264, 0.0, 1.0);
                _1236 = _1266;
            }
            float _1268 = _1236;
            if (!_1210)
            {
                _1262 = 1.0;
            }
            float _1270 = _1262;
            float _1272 = _1270;
            if (_1208)
            {
                float _1274 = _1232 * _1254;
                float _1276 = precise::clamp(_1274, 0.0, 1.0);
                _1250 = _1276;
            }
            float _1278 = _1250;
            float _1280 = _1268 * _1278;
            _1158 = _1126;
            if (_1210)
            {
                float _1282 = _1244 * _1260;
                float _1284 = precise::clamp(_1282, 0.0, 1.0);
                _1272 = _1284;
            }
            float _1286 = _1272;
            float _1288 = _1280 * _1286;
            _1156 = _1124;
            _1160 = _1288;
        }
    }
    _1162 = false;
    float _1290 = _1154;
    float _1292 = _1156;
    float _1294 = _1158;
    float _1296 = _1160;
    float _1298 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1300 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1302 = _1290 + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1306 = _1292 + _1304;
    float _1308 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1298);
    float _1310 = _1302 * _1302;
    bool _1312 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan(0.5);
    bool _1320 = _1316 || _1318;
    float _1322 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1308);
    float _1324 = fma(_1306, _1306, _1310);
    float _1326 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1328 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1330 = 1.0 / _1326;
    float _1332 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1328);
    float _1334 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1332);
    float _1336 = sqrt(_1324);
    float _1338 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1340 = _1338 + _1326;
    float _1342 = _1340 * _1330;
    float _1344 = _1342 * 0.5;
    bool _1346 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan(0.5);
    bool _1354 = _1350 || _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1358 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1356);
    bool _1360 = _1336 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1362 = 1.0 / _1358;
    bool _1364 = !_1360;
    float _1366 = _1292;
    float _1368 = _1294;
    float _1370 = _1290;
    float _1372 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1374 = _1330;
    float _1376 = _1362;
    float _1378 = _1296;
    if (!_1364)
    {
        float _1380 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1384 = _1336 + _1382;
        float _1386 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1388 = rsqrt(_1324);
        float _1390 = _1384 * _1380;
        float _1392 = _1390 * 0.15915493667125701904296875;
        float _1394 = _1392 * 6.283185482025146484375;
        float _1396 = cos(_1394);
        float _1398 = _1392 * 6.283185482025146484375;
        float _1400 = sin(_1398);
        float _1402 = _1396 + (-1.0);
        float _1404 = _1402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1406 = fma(_1400, _1386, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1408 = fma(_1396, _1294, _1404);
        float _1410 = _1388 * _1406;
        float _1412 = fma(_1306, _1410, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1414 = fma(_1302, _1410, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1140 = _1392;
        _1366 = _1412;
        _1368 = _1408;
        _1370 = _1414;
        _1372 = _1410;
    }
    float _1416 = _1140;
    float _1418 = _1366;
    float _1420 = _1368;
    float _1422 = _1370;
    float _1424 = _1372;
    float _1426 = _1424;
    float _1428 = _1416;
    float _1430 = _1420;
    float _1432 = _1418;
    float _1434 = _1422;
    if (_1320)
    {
        _1426 = 1.0;
    }
    float _1436 = _1426;
    float _1438 = _1436;
    if (!_1354)
    {
        float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1442 = _1120 + _1440;
        float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1446 = _1116 + _1444;
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1450 = _1442 * _1442;
        float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1454 = _1122 + _1452;
        float _1456 = fma(_1446, _1446, _1450);
        float _1458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1460 = fma(_1454, _1454, _1456);
        float _1462 = sqrt(_1460);
        float _1464 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1466 = precise::min(_1462, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1468 = _1466 * _1458;
        float _1470 = -_1116;
        float _1472 = _1470 + _1418;
        float _1474 = _1464 * _1468;
        float _1476 = -_1120;
        float _1478 = _1476 + _1420;
        float _1480 = -_1122;
        float _1482 = _1480 + _1422;
        float _1484 = fma(_1472, _1474, _1116);
        float _1486 = fma(_1478, _1474, _1120);
        float _1488 = fma(_1482, _1474, _1122);
        _1428 = _1482;
        _1430 = _1486;
        _1432 = _1484;
        _1434 = _1488;
        _1374 = _1474;
    }
    float _1490 = _1428;
    float _1492 = _1430;
    float _1494 = _1432;
    float _1496 = _1434;
    float _1498 = _1374;
    float _1500 = _1490;
    if (_1320)
    {
        _1142 = 1.0;
    }
    float _1502 = _1142;
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1506 = _1362 * _1504;
    float _1508 = _1502;
    if (!_1320)
    {
        float _1510 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1512 = _1510 * 0.15915493667125701904296875;
        float _1514 = _1512 * 6.283185482025146484375;
        float _1516 = cos(_1514);
        float _1518 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1520 = _1518 * 0.15915493667125701904296875;
        float _1522 = _1512 * 6.283185482025146484375;
        float _1524 = sin(_1522);
        float _1526 = 1.0 / _1516;
        float _1528 = _1520 * 6.283185482025146484375;
        float _1530 = cos(_1528);
        float _1532 = _1524 * _1526;
        float _1534 = _1520 * 6.283185482025146484375;
        float _1536 = sin(_1534);
        float _1538 = _1530 * _1532;
        float _1540 = 1.0 / _1538;
        float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1544 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1542;
        float _1546 = 1.0 / _1544;
        float _1548 = _1536 * _1540;
        float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1552 = fma(_1506, _1548, _1550);
        float _1554 = _1552 * _1546;
        float _1556 = precise::clamp(_1554, 0.0, 1.0);
        _1500 = _1520;
        _1438 = _1556;
    }
    float _1558 = _1500;
    float _1560 = _1438;
    float _1562 = _1558;
    if (!_1320)
    {
        float _1564 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1566 = _1564 * 0.15915493667125701904296875;
        float _1568 = _1566 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        float _1572 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1574 = _1572 * 0.15915493667125701904296875;
        float _1576 = _1566 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = 1.0 / _1570;
        float _1582 = _1574 * 6.283185482025146484375;
        float _1584 = cos(_1582);
        float _1586 = _1578 * _1580;
        float _1588 = _1574 * 6.283185482025146484375;
        float _1590 = sin(_1588);
        float _1592 = _1584 * _1586;
        float _1594 = 1.0 / _1592;
        float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1598 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1596;
        float _1600 = 1.0 / _1598;
        float _1602 = _1590 * _1594;
        float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1606 = fma(_1506, _1602, _1604);
        float _1608 = _1606 * _1600;
        float _1610 = precise::clamp(_1608, 0.0, 1.0);
        float _1612 = -_1610;
        float _1614 = _1612 + 1.0;
        _1376 = _1594;
        _1562 = _1580;
        _1508 = _1614;
    }
    float _1616 = _1376;
    float _1618 = _1562;
    float _1620 = _1508;
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1624 = _1492 + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1628 = _1494 + _1626;
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1632 = _1496 + _1630;
    float _1634 = _1624 * _1624;
    float _1636 = fma(_1628, _1628, _1634);
    float _1638 = fma(_1632, _1632, _1636);
    float _1640 = rsqrt(_1638);
    float _1642 = sqrt(_1638);
    float _1644 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1646 = _1628 * _1644;
    float _1648 = _1632 * _1644;
    float _1650 = _1646 * _1646;
    float _1652 = _1648 * _1648;
    float _1654 = _1650 + _1652;
    float _1656 = sqrt(_1654);
    bool _1658 = _1656 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = _1656 + _1660;
    float _1664 = _1498;
    float _1666 = _1662;
    float _1668 = _1616;
    float _1670 = _1624;
    float _1672 = _1646;
    if (_1658)
    {
        float _1674 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1664 = _1674;
    }
    float _1676 = _1664;
    float _1678 = _1676;
    if (_1658)
    {
        float _1680 = _1662 * _1676;
        _1666 = _1680;
    }
    float _1682 = _1666;
    if (_1658)
    {
        float _1684 = rsqrt(_1654);
        _1678 = _1684;
    }
    float _1686 = _1678;
    float _1688 = _1686;
    if (_1658)
    {
        float _1690 = _1682 * 0.15915493667125701904296875;
        _1668 = _1690;
    }
    float _1692 = _1668;
    float _1694 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1696 = _1632;
    if (_1658)
    {
        float _1698 = _1692 * 6.283185482025146484375;
        float _1700 = sin(_1698);
        _1696 = _1700;
    }
    float _1702 = _1696;
    float _1704 = precise::max(0.0, _1694);
    float _1706 = _1618;
    float _1708 = _1704;
    if (_1658)
    {
        float _1710 = _1692 * 6.283185482025146484375;
        float _1712 = cos(_1710);
        _1706 = _1712;
    }
    float _1714 = _1706;
    float _1716 = -_1644;
    float _1718 = -_1704;
    float _1720 = fma(_1624, _1716, _1718);
    if (_1658)
    {
        float _1722 = _1720 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1670 = _1722;
    }
    float _1724 = _1670;
    float _1726 = _1702;
    float _1728 = _1724;
    if (_1658)
    {
        float _1730 = fma(_1702, _1724, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1726 = _1730;
    }
    float _1732 = _1726;
    float _1734 = _1732;
    if (!_1658)
    {
        _1728 = _1720;
    }
    float _1736 = _1728;
    float _1738 = _1736;
    if (_1658)
    {
        float _1740 = _1686 * _1732;
        _1144 = _1740;
    }
    float _1742 = _1144;
    if (!_1658)
    {
        _1734 = _1650;
    }
    float _1744 = _1734;
    float _1746 = _1744;
    float _1748 = _1714;
    if (_1658)
    {
        float _1750 = _1714 + (-1.0);
        _1708 = _1750;
    }
    float _1752 = _1708;
    float _1754 = _1752;
    if (_1658)
    {
        float _1756 = _1646 * _1742;
        _1672 = _1756;
    }
    float _1758 = _1672;
    if (_1658)
    {
        float _1760 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1688 = _1760;
    }
    float _1762 = _1688;
    if (!_1658)
    {
        _1754 = _1648;
    }
    float _1764 = _1754;
    float _1766 = _1764;
    if (_1658)
    {
        float _1768 = _1648 * _1742;
        _1766 = _1768;
    }
    float _1770 = _1766;
    if (_1658)
    {
        float _1772 = _1758 * _1758;
        _1746 = _1772;
    }
    float _1774 = _1746;
    if (_1658)
    {
        float _1776 = fma(_1720, _1714, _1762);
        _1738 = _1776;
    }
    float _1778 = _1738;
    if (!_1658)
    {
        _1748 = _1652;
    }
    float _1780 = _1748;
    float _1782 = _1780;
    if (_1658)
    {
        float _1784 = _1770 * _1770;
        _1782 = _1784;
    }
    float _1786 = _1782;
    float _1788 = fma(_1778, _1778, _1774);
    float _1790 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1792 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1794 = _1788 + _1786;
    float _1796 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1790);
    float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1800 = fma(_1642, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1798);
    float _1802 = precise::clamp(_1800, 0.0, 1.0);
    float _1804 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1806 = rsqrt(_1794);
    float _1808 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1796);
    float _1810 = -_1802;
    float _1812 = _1810 + 1.0;
    float _1814 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1804);
    float _1816 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1818 = _1808 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1820 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1792);
    float _1822 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1824 = abs(_1812);
    float _1826 = log2(_1824);
    float _1828 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1816);
    float _1830 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1814);
    float _1832 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1834 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1820);
    float _1836 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1828);
    float _1838 = _1830 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1840 = -_1832;
    float _1842 = fma(_1840, _1822, 1.0);
    float _1844 = _1806 * _1770;
    float _1846 = _1806 * _1758;
    float _1848 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1850 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1852 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1854 = _1806 * _1778;
    float _1856 = _1846 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1858 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1850);
    float _1860 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1862 = log2(_1842);
    float _1864 = -_1856;
    float _1866 = fma(_1854, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1864);
    float _1868 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1858);
    float _1870 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1872 = -_1844;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1866);
    float _1876 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1868);
    float _1878 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1880 = exp2(_1860);
    float _1882 = fma(_1874, -0.5, 0.5);
    float _1884 = fma(_1874, 0.5, 0.5);
    float _1886 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1878);
    float _1888 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1870);
    float _1890 = _1854 + 1.0;
    float _1892 = fma(_1884, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1894 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1886);
    float _1896 = 1.0 / _1876;
    float _1898 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1888);
    float _1900 = fma(_1884, _1892, -0.212114393711090087890625);
    float _1902 = _1862 * 0.693147182464599609375;
    float _1904 = fma(_1884, _1900, 1.570728778839111328125);
    float _1906 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1908 = sqrt(_1882);
    float _1910 = -_1854;
    float _1912 = fma(_1880, _1890, _1910);
    float _1914 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1894);
    float _1916 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1898);
    float _1918 = fma(_1912, 0.5, 0.5);
    float _1920 = _1914 * _1896;
    float _1922 = _1916 * _1896;
    float _1924 = fma(_1920, 0.5, 0.5);
    float _1926 = fma(_1922, -0.5, 0.5);
    float _1928 = _1908 * 0.636619746685028076171875;
    float3 _5284 = float3(_1924, _1926, _1906);
    float _1930 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5284, float3(0.0), isnan(_5284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5284, float3(0.0), isnan(_5284)), level(0.0)).x;
    float3 _5295 = float3(_1924, _1926, _1906);
    float4 _1933 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5295, float3(0.0), isnan(_5295)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5295, float3(0.0), isnan(_5295)), level(0.0)).xyzw;
    float _1935 = _1933.x;
    float _1937 = _1933.y;
    float _1939 = _1933.z;
    float _1941 = _1933.w;
    float _1943 = -_1904;
    float _1945 = fma(_1928, _1943, 1.0);
    float2 _5317 = float2(_1945, _1918);
    float3 _1949 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5317, float2(0.0), isnan(_5317)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5317, float2(0.0), isnan(_5317)), level(0.0)).xyz;
    float _1951 = _1949.x;
    float _1953 = _1949.y;
    float _1955 = _1949.z;
    float _1957 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1959 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1961 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1963 = isnan(_1642);
    bool _1965 = _1961 || _1963;
    bool _1967 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1969 = _1965 || _1967;
    float _1971 = _1914 + _1876;
    float _1973 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1959);
    float _1975 = exp2(_1957);
    float _1977 = _1876 * 0.5;
    float _1979 = _1971 * 0.5;
    float _1981 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1973);
    float _1983 = fma(_1916, -0.5, _1977);
    float _1985 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1981);
    float _1987 = _1985 + _1876;
    out.gl_Position.x = _1914;
    out.gl_Position.y = _1916;
    out.gl_Position.z = _1985;
    out.gl_Position.w = _1876;
    float _1989 = _1987 * 0.5;
    float _1991 = -_1975;
    float _1993 = _1991 + 1.0;
    float _1995 = _1993 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _1979;
    out.m_81.y = _1983;
    out.m_81.z = _1989;
    out.m_81.w = _1876;
    float _1997 = -_1995;
    float _1999 = _1997 + 1.0;
    float _2001 = _1560 * _1620;
    float _2003 = _1876;
    float _2005 = _1985;
    float _2007 = _1916;
    float _2009 = _1979;
    if (!_1969)
    {
        _2003 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2011 = _2003;
    float _2013 = _2011;
    float _2015 = _2011;
    if (!_1969)
    {
        _2005 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2017 = _2005;
    float _2019 = _2001 * _1296;
    float _2021 = _2019;
    float _2023 = _2017;
    float _2025 = _2017;
    if (!_1969)
    {
        _1378 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2027 = _1378;
    float _2029 = _2027;
    float _2031 = _2027;
    if (!_1969)
    {
        _2007 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2033 = _2007;
    float _2035 = _2019 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2037 = _2033;
    float _2039 = _2033;
    if (!_1969)
    {
        _2009 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2041 = _2009;
    float _2043 = _2041;
    float _2045 = _2041;
    if (!_1969)
    {
        _2021 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2047 = _2021;
    float _2049 = _1995 * _1930;
    float _2051 = _1941 * _2049;
    float _2053 = _1955 * _2049;
    float _2055 = fma(_1951, _2051, _1935);
    float _2057 = fma(_1953, _2051, _1937);
    float _2059 = _1941 * _1999;
    float _2061 = fma(_1941, _2053, _1939);
    out.m_83.x = _2055;
    out.m_83.y = _2057;
    out.m_83.z = _2061;
    out.m_83.w = _2059;
    bool _2063 = !_1969;
    float _2065 = _2047;
    float _2067 = _2047;
    if (!_2063)
    {
        bool _2069 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2071 = isnan(_1642);
        bool _2073 = _2069 || _2071;
        bool _2075 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2077 = _2073 || _2075;
        if (!_2077)
        {
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2081 = _1642 + _2079;
            float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2085 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2083;
            float _2087 = 1.0 / _2085;
            float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2099 = _2097 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2103 = _2101 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2107 = _2105 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2109 = _2081 * _2087;
            float _2111 = precise::clamp(_2109, 0.0, 1.0);
            float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2115 = _2113 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2117 = fma(_2111, _2091, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2119 = fma(_2111, _2115, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2121 = fma(_2111, _2095, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2123 = fma(_2111, _2099, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2125 = fma(_2111, _2103, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2127 = fma(_2111, _2107, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2045 = _2119;
            _2039 = _2125;
            _2031 = _2117;
            _2025 = _2123;
            _2015 = _2121;
            _2067 = _2127;
            _2129 = true;
        }
        else
        {
            bool _2131 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2133 = isnan(_1642);
            bool _2135 = _2131 || _2133;
            bool _2137 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2139 = _2135 || _2137;
            if (!_2139)
            {
                _2029 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2141 = _2029;
            _2031 = _2141;
            if (!_2139)
            {
                _2043 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2143 = _2043;
            _2045 = _2143;
            if (!_2139)
            {
                _2013 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2145 = _2013;
            _2015 = _2145;
            if (!_2139)
            {
                _2023 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2147 = _2023;
            _2025 = _2147;
            if (!_2139)
            {
                _2037 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2149 = _2037;
            _2039 = _2149;
            if (!_2139)
            {
                _2065 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2151 = _2065;
            bool _2153 = !_2139;
            _2067 = _2151;
            if (!_2153)
            {
                bool _2155 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2157 = isnan(_1642);
                bool _2159 = _2155 || _2157;
                bool _2161 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2163 = _2159 || _2161;
                if (!_2163)
                {
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2167 = _1642 + _2165;
                    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2171 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2169;
                    float _2173 = 1.0 / _2171;
                    float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2193 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2195 = _2167 * _2173;
                    float _2197 = precise::clamp(_2195, 0.0, 1.0);
                    float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2203 = fma(_2197, _2177, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2205 = fma(_2197, _2201, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2207 = fma(_2197, _2181, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2209 = fma(_2197, _2185, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2211 = fma(_2197, _2189, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2213 = fma(_2197, _2193, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2045 = _2205;
                    _2039 = _2211;
                    _2031 = _2203;
                    _2025 = _2209;
                    _2015 = _2207;
                    _2067 = _2213;
                    _2129 = true;
                }
                else
                {
                    _2045 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2039 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2031 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2025 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2015 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2067 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2129 = false;
    float _2215 = _2045;
    float _2217 = _2039;
    float _2219 = _2031;
    float _2221 = _2025;
    float _2223 = _2015;
    float _2225 = _2067;
    float _2227 = fma(_1076, -0.5, 0.5);
    float _2229 = precise::clamp(_2227, 0.0, 1.0);
    float _2231 = -_2215;
    float _2233 = _2231 + _2217;
    float _2235 = _2035 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2237 = -_2219;
    float _2239 = _2237 + _2221;
    out.m_85.x = 0.0;
    float _2241 = fma(_2229, _2233, _2215);
    float _2243 = fma(_2229, _2239, _2219);
    out.m_49.x = _2235;
    float _2245 = -_2223;
    float _2247 = _2245 + _2225;
    float _2249 = _2241 * 0.586610972881317138671875;
    bool _2251 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2253 = fma(_2229, _2247, _2223);
    float _2255 = fma(_2243, 0.298911988735198974609375, _2249);
    bool _2257 = _1560 > 0.0;
    bool _2259 = isnan(_1560);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan(0.0);
    bool _2265 = _2261 || _2263;
    float _2267 = fma(_2253, 0.114477999508380889892578125, _2255);
    bool _2269 = _1620 <= 0.0;
    bool _2271 = !_2265;
    bool _2273 = _2269 || _2271;
    float _2275 = -_2267;
    float _2277 = _2243 + _2275;
    float _2279 = -_2267;
    float _2281 = _2241 + _2279;
    float _2283 = -_2267;
    float _2285 = _2253 + _2283;
    float _2287 = fma(_2277, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2267);
    float _2289 = fma(_2281, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2267);
    float _2291 = fma(_2285, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2267);
    bool _2293 = !_2251;
    if (!_2293)
    {
        float _2295 = -_1492;
        float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2299 = -_1494;
        float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2303 = -_1496;
        float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2307 = _2297 * _2297;
        float _2309 = fma(_2301, _2301, _2307);
        float _2311 = fma(_2305, _2305, _2309);
        float _2313 = sqrt(_2311);
        float _2315 = rsqrt(_2311);
        float _2317 = -_2313;
        float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2321 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2323 = precise::clamp(_2321, 0.0, 1.0);
        float _2325 = _2301 * _2315;
        float _2327 = _2297 * _2315;
        float _2329 = abs(_2323);
        float _2331 = log2(_2329);
        float _2333 = _2305 * _2315;
        float _2335 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2337 = _1076 * _2327;
        float _2339 = -_2327;
        float _2341 = -_2335;
        float _2343 = fma(_2339, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2341);
        float _2345 = fma(_1082, _2325, _2337);
        float _2347 = -_2333;
        float _2349 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2343);
        float _2351 = fma(_1088, _2333, _2345);
        float _2353 = precise::clamp(_2351, 0.0, 1.0);
        float _2355 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2357 = _2349 + _2355;
        float _2359 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2361 = _2357 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2363 = precise::clamp(_2361, 0.0, 1.0);
        float _2365 = exp2(_2359);
        float _2367 = _2365 * _2363;
        float _2369 = _2353 * _2367;
        float _2371 = _2369 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2373 = _2369 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2375 = _2369 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _2371;
        out.m_85.y = _2373;
        out.m_85.z = _2375;
    }
    out.m_87.x = _2287;
    out.m_87.y = _2289;
    out.m_87.z = _2291;
    if (!_2273)
    {
        return out;
    }
    float _2377 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2377;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2129 = false;
    bool _1162 = false;
    bool _1150 = false;
    bool _456 = false;
    bool _342 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2434 = as_type<float>(_122);
        out.gl_Position.z = _2434;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_106);
        _116 = _142;
    }
    float _144 = _116;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_49.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2503 = as_type<float>(_158);
        out.gl_Position.z = _2503;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = in.m_55.z;
    float _172 = in.m_57.x;
    float _174 = in.m_57.y;
    float _176 = in.m_57.z;
    float _178 = _160 * _160;
    float _180 = _162 * _162;
    float _182 = _164 * _164;
    float _184 = fma(_166, _166, _178);
    float _186 = fma(_168, _168, _180);
    float _188 = fma(_170, _170, _182);
    float _190 = fma(_172, _172, _184);
    float _192 = fma(_174, _174, _186);
    float _194 = fma(_176, _176, _188);
    float _196 = sqrt(_190);
    float _198 = sqrt(_192);
    float _200 = sqrt(_194);
    bool _202 = _196 > 0.0;
    bool _204 = _198 > 0.0;
    float _206 = _198;
    if (_202)
    {
        float _208 = rsqrt(_190);
        _206 = _208;
    }
    float _210 = _206;
    float _212 = 0.0;
    float _214 = 0.0;
    if (!_202)
    {
        _212 = 0.0;
        _214 = 0.0;
    }
    float _216 = _212;
    float _218 = _214;
    bool _220 = _200 > 0.0;
    float _222 = 0.0;
    float _224 = _216;
    float _226 = _218;
    if (!_202)
    {
        _222 = 0.0;
    }
    float _228 = _222;
    float _230 = 0.0;
    float _232 = _228;
    if (!_204)
    {
        _230 = 0.0;
    }
    float _234 = _230;
    float _236 = _200;
    float _238 = _234;
    if (_204)
    {
        float _240 = rsqrt(_192);
        _236 = _240;
    }
    float _242 = _236;
    float _244 = 0.0;
    if (!_204)
    {
        _244 = 0.0;
    }
    float _246 = _244;
    float _248 = 0.0;
    float _250 = _246;
    if (!_220)
    {
        _248 = 0.0;
    }
    float _252 = _248;
    float _254 = 0.0;
    float _256 = _252;
    if (_220)
    {
        float _258 = rsqrt(_194);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = _210;
    if (_202)
    {
        float _264 = _210 * _166;
        _232 = _264;
    }
    float _266 = _232;
    if (_202)
    {
        float _268 = _210 * _160;
        _224 = _268;
    }
    float _270 = _224;
    if (_202)
    {
        float _272 = _210 * _172;
        _226 = _272;
    }
    float _274 = _226;
    bool _276 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_204)
    {
        _262 = 0.0;
    }
    float _278 = _262;
    float _280 = 0.0;
    float _282 = _278;
    if (!_220)
    {
        _280 = 0.0;
    }
    float _284 = _280;
    float _286 = _284;
    if (_204)
    {
        float _288 = _242 * _168;
        _238 = _288;
    }
    float _290 = _238;
    float _292 = 0.0;
    if (!_220)
    {
        _292 = 0.0;
    }
    float _294 = _292;
    float _296 = _294;
    if (_204)
    {
        float _298 = _242 * _162;
        _250 = _298;
    }
    float _300 = _250;
    float _302 = _300;
    float _304 = _300;
    if (_204)
    {
        float _306 = _242 * _174;
        _282 = _306;
    }
    float _308 = _282;
    if (_220)
    {
        float _310 = _260 * _170;
        _256 = _310;
    }
    float _312 = _256;
    if (_220)
    {
        float _314 = _260 * _164;
        _286 = _314;
    }
    float _316 = _286;
    if (_220)
    {
        float _318 = _260 * _176;
        _296 = _318;
    }
    float _320 = _296;
    bool _322 = !_276;
    float _340;
    if (!_322)
    {
        float _324 = in.m_59.x;
        float _326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _328 = _324 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _332 = _330 * _326;
        float _334 = floor(_332);
        float _336 = -_334;
        float _338 = _332 + _336;
        _340 = _338;
        _342 = true;
    }
    else
    {
        float _344 = float(_106);
        float _346 = 1.0 / _344;
        float _348 = _140 * _346;
        _340 = _348;
    }
    _342 = false;
    float _350 = _340;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _354 = _350 + _352;
    bool _356 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _358 = isnan(_350);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _368;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _374 = 1.0 / _370;
    float _376 = -_366;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _380;
    float _384 = _354 * _374;
    bool _386 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _388 = isnan(_350);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _398;
    float _402 = fma(_382, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _404;
    float _408 = _396 * _378;
    float _410 = fma(_400, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _412 = fma(_406, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _414 = -_396;
    float _416 = _414 + 1.0;
    float _418 = _402 * _408;
    float _420 = _410 * _408;
    float _422 = _412 * _408;
    float _424 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _426 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].z, _418);
    float _430 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[144].x, _424);
    float _432 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[144].y, _426);
    float _434 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[144].z, _428);
    bool _436 = !_372;
    float _454;
    if (!_436)
    {
        float _438 = in.m_59.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        float _458 = float(_106);
        float _460 = 1.0 / _458;
        float _462 = _140 * _460;
        _454 = _462;
    }
    _456 = false;
    float _464 = _454;
    float _466 = in.m_59.y;
    float _468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _470 = in.m_46.x;
    float _472 = in.m_46.y;
    float _474 = in.m_46.z;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _478 = _476 != 0;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _482 = _480 != 0;
    float _484 = in.m_61.x;
    float _486 = in.m_61.y;
    float _488 = in.m_61.z;
    float _490 = in.m_63.x;
    float _492 = in.m_63.y;
    float _494 = in.m_63.z;
    float _496 = in.m_65.x;
    float _498 = in.m_65.w;
    bool _500 = _466 > 0.5;
    float _502 = in.m_67.x;
    float _504 = _162 * _472;
    float _506 = _174 * _472;
    float _508 = _168 * _472;
    float _510 = _432 * _486;
    float _512 = _430 * _484;
    float _514 = fma(_160, _470, _504);
    float _516 = -_492;
    float _518 = _516 + (-1.0);
    float _520 = _434 * _488;
    float _522 = fma(_166, _470, _508);
    float _524 = fma(_518, _496, _492);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _530 = fma(_172, _470, _506);
    float _532 = fma(_170, _474, _522);
    float _534 = 1.0 / _528;
    float _536 = fma(_164, _474, _514);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _542 = -_490;
    float _544 = fma(_496, _542, _490);
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _548 = in.m_67.y;
    float _550 = 1.0 / _540;
    float _552 = fma(_176, _474, _530);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _558 = in.m_53.w;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _562 = 1.0 / _556;
    float _564 = _546 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _566;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _572 = -_494;
    float _574 = fma(_496, _572, _494);
    out.m_69.w = _498;
    float _576 = _568 * _534;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _586 = _464 + _584;
    float _588 = _498;
    float _590 = 9.9999997473787516355514526367188e-05;
    float _592 = _524;
    float _594 = _544;
    float _596 = _574;
    if (_478)
    {
        float _598 = in.m_59.x;
        _588 = _598;
    }
    float _600 = _588;
    float _602 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = fma(_576, _586, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _608 = in.m_55.w;
    float _610 = _580 * _550;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _614 = _464 + _612;
    out.m_71.x = _564;
    out.m_71.y = _602;
    out.m_71.z = _604;
    out.m_71.w = _582;
    float _616 = -_548;
    float _618 = _616 + 1.0;
    float _620 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _622 = _536 + _558;
    float _624 = in.m_57.w;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _626;
    float _630 = _548;
    if (_482)
    {
        float _632 = _500 ? _618 : _548;
        _630 = _632;
    }
    float _634 = _630;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _638 = _464 + _636;
    float _640 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.vp_c8)._m0[32].y;
    float _642 = _628 * _562;
    float _644 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _646 = _622 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _648 = _634 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _650 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _652 = fma(_610, _614, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _654 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _656 = isnan(_464);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = in.m_73.x;
    float _668 = in.m_73.y;
    float _670 = in.m_73.z;
    bool _672 = _600 > 0.5;
    bool _674 = _672 && _478;
    float _676 = fma(_642, _638, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _678 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _680 = isnan(_464);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = _532 + _608;
    float _692 = -_664;
    float _694 = _692 + 1.0;
    float _696 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.vp_c8)._m0[32].x;
    float _698 = _640 * _640;
    bool _700 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _702 = isnan(_464);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = _688 * _694;
    float _714 = -_688;
    float _716 = _714 + 1.0;
    float _718 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.vp_c8)._m0[32].z;
    float _720 = fma(_696, _696, _698);
    float _722 = _720;
    if (_478)
    {
        _590 = _502;
    }
    float _724 = _590;
    float _726 = _710 * _716;
    bool _728 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _730 = isnan(_464);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = fma(_718, _718, _720);
    float _742 = -_710;
    float _744 = _742 + 1.0;
    float _746 = _552 + _624;
    float _748 = _724;
    if (_674)
    {
        float _750 = -_724;
        float _752 = _750 + 1.0;
        _748 = _752;
    }
    float _754 = _748;
    float _756 = rsqrt(_740);
    float _758 = _738 * _744;
    if (!_478)
    {
        _722 = _502;
    }
    float _760 = _722;
    float _762 = -_738;
    float _764 = _762 + 1.0;
    float _766 = _668 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _768 = _668 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _770 = _668 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _772 = _606 * _758;
    float _774 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].x, _766);
    float _776 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].x, _768);
    float _778 = _760;
    if (_478)
    {
        _778 = _754;
    }
    float _780 = _778;
    float _782 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].x, _770);
    float _784 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[25].z, _774);
    float _786 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[24].z, _776);
    float _788 = _690 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _790 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[26].z, _782);
    float _792 = _784 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _794 = _784 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _796 = _784 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _798 = _780 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _800 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].x, _792);
    float _802 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].y, _794);
    float _804 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].z, _796);
    float _806 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[115].x, _772);
    float _808 = _718 * _756;
    float _810 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].x, _800);
    float _812 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].y, _802);
    float _814 = fma(_652, _726, _806);
    float _816 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].z, _804);
    float _818 = _798 * _644;
    float _820 = _646 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _822 = _646 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _824 = _646 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _826 = _696 * _756;
    float _828 = _648 * _468;
    float _830 = fma(_788, (*spvDescriptorSet0.vp_c12)._m0[6].x, _820);
    float _832 = fma(_788, (*spvDescriptorSet0.vp_c12)._m0[6].y, _822);
    float _834 = fma(_788, (*spvDescriptorSet0.vp_c12)._m0[6].z, _824);
    float _836 = _746 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _838 = _826 * _826;
    float _840 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _842 = fma(_836, (*spvDescriptorSet0.vp_c12)._m0[8].x, _830);
    float _844 = fma(_836, (*spvDescriptorSet0.vp_c12)._m0[8].y, _832);
    float _846 = fma(_836, (*spvDescriptorSet0.vp_c12)._m0[8].z, _834);
    float _848 = fma(_808, _808, _838);
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[191].x * 0.15915493667125701904296875;
    float _852 = fma(_676, _712, _814);
    float _854 = _842 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _856 = rsqrt(_848);
    out.m_75.x = _818;
    out.m_75.y = _828;
    float _858 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[118].x, _852);
    float _860 = _846 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _862 = _858 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _864 = _844 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _866 = _850 * 6.283185482025146484375;
    float _868 = cos(_866);
    float _870 = _854 * _840;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _874 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _876 = fma(_870, 0.5, 0.5);
    float _878 = _872 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _880 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _886 = _808 * _856;
    float _888 = _826 * _856;
    float _890 = _882 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _892 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _894 = _850 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = -_868;
    float _900 = _898 + 1.0;
    float _902 = _868 * _668;
    out.m_77.x = _890;
    out.m_77.y = _892;
    out.m_77.z = _878;
    out.m_77.w = _862;
    float _904 = _886 * _900;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _908 = _860 * _880;
    float _910 = fma(_908, 0.5, 0.5);
    float _912 = _886 * _896;
    float _914 = -_896;
    float _916 = _888 * _914;
    float _918 = fma(_886, _904, _868);
    float _920 = -_904;
    float _922 = _888 * _920;
    float _924 = _888 * _888;
    float _926 = fma(_916, _666, _902);
    float _928 = _916 * _668;
    float _930 = _912 * _668;
    float _932 = _864 * _906;
    float _934 = -_912;
    float _936 = fma(_934, _670, _926);
    float _938 = -_928;
    float _940 = fma(_918, _666, _938);
    float _942 = fma(_900, _924, _868);
    float _944 = fma(_932, 0.5, 0.5);
    float _946 = fma(_922, _666, _930);
    float _948 = -_812;
    float _950 = _948 + _936;
    float _952 = fma(_922, _670, _940);
    float _954 = floor(_944);
    float _956 = fma(_942, _670, _946);
    float _958 = fma(_950, _496, _812);
    float _960 = -_810;
    float _962 = _960 + _952;
    float _964 = -_816;
    float _966 = _964 + _956;
    float _968 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _958);
    float _970 = fma(_962, _496, _810);
    float _972 = floor(_876);
    bool _974 = _958 != 0.0;
    bool _976 = isnan(_958);
    bool _978 = _974 || _976;
    bool _980 = isnan(0.0);
    bool _982 = _978 || _980;
    float _984 = fma(_966, _496, _816);
    float _986 = _620 * _968;
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _970);
    bool _990 = _970 == 0.0;
    bool _992 = !_982;
    bool _994 = _990 && _992;
    float _996 = floor(_910);
    float _998 = -_954;
    float _1000 = _944 + _998;
    bool _1002 = _984 == 0.0;
    bool _1004 = _1002 && _994;
    float _1006 = _650 * _988;
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _984);
    float _1010 = fma(_1000, 2.0, -1.0);
    float _1012 = -_972;
    float _1014 = _876 + _1012;
    float _1016 = _874 * _1008;
    float _1018 = fma(_1014, 2.0, -1.0);
    float _1020 = _1016;
    float _1022 = _1016;
    float _1024 = _1018;
    float _1026 = _1010;
    if (!_1004)
    {
        float _1028 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[17].y, _524);
        _592 = _1028;
    }
    float _1030 = _592;
    float _1032 = -_996;
    float _1034 = _910 + _1032;
    float _1036 = _1018 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    if (!_1004)
    {
        float _1038 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[17].y, _544);
        _594 = _1038;
    }
    float _1040 = _594;
    float _1042 = _290 * _1030;
    float _1044 = fma(_1034, 2.0, -1.0);
    float _1046 = _1010 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1048 = _300 * _1030;
    float _1050 = _1044;
    if (!_1004)
    {
        float _1052 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[17].y, _574);
        _596 = _1052;
    }
    float _1054 = _596;
    float _1056 = _986 * _290;
    float _1058 = _1046 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1060 = _1046 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1062 = _1046 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1064 = fma(_270, _1040, _1048);
    float _1066 = fma(_1036, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1058);
    float _1068 = fma(_1036, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1060);
    float _1070 = fma(_1036, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1062);
    float _1072 = _308 * _1030;
    float _1074 = fma(_266, _1040, _1042);
    float _1076 = fma(_316, _1054, _1064);
    float _1078 = _986 * _308;
    float _1080 = fma(_274, _1040, _1072);
    float _1082 = fma(_312, _1054, _1074);
    float _1084 = _1044 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1086 = fma(_1006, _274, _1078);
    float _1088 = fma(_320, _1054, _1080);
    float _1090 = _986 * _300;
    float _1092 = fma(_1006, _266, _1056);
    float _1094 = fma(_1084, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1066);
    out.m_79.x = _1082;
    out.m_79.y = _1076;
    out.m_79.z = _1088;
    bool _1096 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan(1.0);
    bool _1104 = _1100 || _1102;
    float _1106 = fma(_1084, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1068);
    float _1108 = fma(_1084, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1070);
    float _1110 = fma(_1006, _270, _1090);
    float _1112 = fma(_1016, _312, _1092);
    float _1114 = fma(_1016, _320, _1086);
    float _1116 = _1094 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1118 = fma(_1016, _316, _1110);
    float _1120 = _1106 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1122 = _1108 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1124 = _1112 + _1116;
    float _1126 = _1118 + _1120;
    float _1128 = _1114 + _1122;
    float _1130 = _1058;
    float _1132 = _1080;
    float _1134 = _1080;
    float _1136 = _1110;
    float _1138 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _1140 = _1094;
    float _1142 = _1122;
    float _1144 = _1128;
    float _1154;
    float _1156;
    float _1158;
    float _1160;
    if (!_1104)
    {
        bool _1146 = _1120 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1148 = !_1146;
        _1150 = _1148;
        if (!_1150)
        {
            float _1152 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1154 = _1152;
            _1156 = 0.0;
            _1158 = 0.0;
            _1160 = 0.0;
            _1162 = true;
        }
    }
    if ((!_1162) || _1150)
    {
        bool _1198;
        if (!_1150)
        {
            bool _1164 = _1120 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1166 = isnan(_1120);
            bool _1168 = _1164 || _1166;
            bool _1170 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1172 = _1168 || _1170;
            bool _1174 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1176 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1178 = !_1172;
            bool _1180 = _1176 && _1178;
            if (_1180)
            {
                _1130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1182 = _1130;
            float _1184 = _1182;
            if (_1180)
            {
                _302 = 0.0;
            }
            float _1186 = _302;
            _304 = _1186;
            _1156 = _1186;
            if (_1180)
            {
                _1132 = 0.0;
            }
            float _1188 = _1132;
            _1134 = _1188;
            _1158 = _1188;
            if (_1180)
            {
                float _1190 = _1182 * 5.0;
                _1184 = _1190;
            }
            float _1192 = _1184;
            _1154 = _1192;
            if (_1180)
            {
                _1020 = 0.0;
            }
            float _1194 = _1020;
            bool _1196 = !_1172;
            _1198 = _1196 && _1174;
            _1022 = _1194;
            _1160 = _1194;
        }
        if ((!_1198) || _1150)
        {
            _1150 = false;
            float _1200 = _1022;
            float _1202 = _1134;
            float _1204 = _304;
            bool _1206 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1208 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1210 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1212 = _1200;
            _1154 = _1128;
            if (_1206)
            {
                float _1214 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1212 = _1214;
            }
            float _1216 = _1212;
            if (_1206)
            {
                float _1218 = abs(_1018);
                float _1220 = -_1218;
                float _1222 = _1220 + 1.0;
                _1024 = _1222;
            }
            float _1224 = _1024;
            if (_1208)
            {
                float _1226 = abs(_1010);
                float _1228 = -_1226;
                float _1230 = _1228 + 1.0;
                _1026 = _1230;
            }
            float _1232 = _1026;
            if (!_1206)
            {
                _1136 = 1.0;
            }
            float _1234 = _1136;
            float _1236 = _1234;
            if (_1210)
            {
                float _1238 = abs(_1044);
                float _1240 = -_1238;
                float _1242 = _1240 + 1.0;
                _1050 = _1242;
            }
            float _1244 = _1050;
            if (!_1208)
            {
                _1138 = 1.0;
            }
            float _1246 = _1138;
            float _1248 = _1202;
            float _1250 = _1246;
            if (_1208)
            {
                float _1252 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1248 = _1252;
            }
            float _1254 = _1248;
            float _1256 = _1204;
            if (_1210)
            {
                float _1258 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1256 = _1258;
            }
            float _1260 = _1256;
            float _1262 = _1216;
            if (_1206)
            {
                float _1264 = _1224 * _1216;
                float _1266 = precise::clamp(_1264, 0.0, 1.0);
                _1236 = _1266;
            }
            float _1268 = _1236;
            if (!_1210)
            {
                _1262 = 1.0;
            }
            float _1270 = _1262;
            float _1272 = _1270;
            if (_1208)
            {
                float _1274 = _1232 * _1254;
                float _1276 = precise::clamp(_1274, 0.0, 1.0);
                _1250 = _1276;
            }
            float _1278 = _1250;
            float _1280 = _1268 * _1278;
            _1158 = _1126;
            if (_1210)
            {
                float _1282 = _1244 * _1260;
                float _1284 = precise::clamp(_1282, 0.0, 1.0);
                _1272 = _1284;
            }
            float _1286 = _1272;
            float _1288 = _1280 * _1286;
            _1156 = _1124;
            _1160 = _1288;
        }
    }
    _1162 = false;
    float _1290 = _1154;
    float _1292 = _1156;
    float _1294 = _1158;
    float _1296 = _1160;
    float _1298 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1300 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1302 = _1290 + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1306 = _1292 + _1304;
    float _1308 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1298);
    float _1310 = _1302 * _1302;
    bool _1312 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan(0.5);
    bool _1320 = _1316 || _1318;
    float _1322 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1308);
    float _1324 = fma(_1306, _1306, _1310);
    float _1326 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1328 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1330 = 1.0 / _1326;
    float _1332 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1328);
    float _1334 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1332);
    float _1336 = sqrt(_1324);
    float _1338 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1340 = _1338 + _1326;
    float _1342 = _1340 * _1330;
    float _1344 = _1342 * 0.5;
    bool _1346 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan(0.5);
    bool _1354 = _1350 || _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1358 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1356);
    bool _1360 = _1336 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1362 = 1.0 / _1358;
    bool _1364 = !_1360;
    float _1366 = _1292;
    float _1368 = _1294;
    float _1370 = _1290;
    float _1372 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1374 = _1330;
    float _1376 = _1362;
    float _1378 = _1296;
    if (!_1364)
    {
        float _1380 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1384 = _1336 + _1382;
        float _1386 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1388 = rsqrt(_1324);
        float _1390 = _1384 * _1380;
        float _1392 = _1390 * 0.15915493667125701904296875;
        float _1394 = _1392 * 6.283185482025146484375;
        float _1396 = cos(_1394);
        float _1398 = _1392 * 6.283185482025146484375;
        float _1400 = sin(_1398);
        float _1402 = _1396 + (-1.0);
        float _1404 = _1402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1406 = fma(_1400, _1386, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1408 = fma(_1396, _1294, _1404);
        float _1410 = _1388 * _1406;
        float _1412 = fma(_1306, _1410, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1414 = fma(_1302, _1410, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1140 = _1392;
        _1366 = _1412;
        _1368 = _1408;
        _1370 = _1414;
        _1372 = _1410;
    }
    float _1416 = _1140;
    float _1418 = _1366;
    float _1420 = _1368;
    float _1422 = _1370;
    float _1424 = _1372;
    float _1426 = _1424;
    float _1428 = _1416;
    float _1430 = _1420;
    float _1432 = _1418;
    float _1434 = _1422;
    if (_1320)
    {
        _1426 = 1.0;
    }
    float _1436 = _1426;
    float _1438 = _1436;
    if (!_1354)
    {
        float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1442 = _1120 + _1440;
        float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1446 = _1116 + _1444;
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1450 = _1442 * _1442;
        float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1454 = _1122 + _1452;
        float _1456 = fma(_1446, _1446, _1450);
        float _1458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1460 = fma(_1454, _1454, _1456);
        float _1462 = sqrt(_1460);
        float _1464 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1466 = precise::min(_1462, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1468 = _1466 * _1458;
        float _1470 = -_1116;
        float _1472 = _1470 + _1418;
        float _1474 = _1464 * _1468;
        float _1476 = -_1120;
        float _1478 = _1476 + _1420;
        float _1480 = -_1122;
        float _1482 = _1480 + _1422;
        float _1484 = fma(_1472, _1474, _1116);
        float _1486 = fma(_1478, _1474, _1120);
        float _1488 = fma(_1482, _1474, _1122);
        _1428 = _1482;
        _1430 = _1486;
        _1432 = _1484;
        _1434 = _1488;
        _1374 = _1474;
    }
    float _1490 = _1428;
    float _1492 = _1430;
    float _1494 = _1432;
    float _1496 = _1434;
    float _1498 = _1374;
    float _1500 = _1490;
    if (_1320)
    {
        _1142 = 1.0;
    }
    float _1502 = _1142;
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1506 = _1362 * _1504;
    float _1508 = _1502;
    if (!_1320)
    {
        float _1510 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1512 = _1510 * 0.15915493667125701904296875;
        float _1514 = _1512 * 6.283185482025146484375;
        float _1516 = cos(_1514);
        float _1518 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1520 = _1518 * 0.15915493667125701904296875;
        float _1522 = _1512 * 6.283185482025146484375;
        float _1524 = sin(_1522);
        float _1526 = 1.0 / _1516;
        float _1528 = _1520 * 6.283185482025146484375;
        float _1530 = cos(_1528);
        float _1532 = _1524 * _1526;
        float _1534 = _1520 * 6.283185482025146484375;
        float _1536 = sin(_1534);
        float _1538 = _1530 * _1532;
        float _1540 = 1.0 / _1538;
        float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1544 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1542;
        float _1546 = 1.0 / _1544;
        float _1548 = _1536 * _1540;
        float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1552 = fma(_1506, _1548, _1550);
        float _1554 = _1552 * _1546;
        float _1556 = precise::clamp(_1554, 0.0, 1.0);
        _1500 = _1520;
        _1438 = _1556;
    }
    float _1558 = _1500;
    float _1560 = _1438;
    float _1562 = _1558;
    if (!_1320)
    {
        float _1564 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1566 = _1564 * 0.15915493667125701904296875;
        float _1568 = _1566 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        float _1572 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1574 = _1572 * 0.15915493667125701904296875;
        float _1576 = _1566 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = 1.0 / _1570;
        float _1582 = _1574 * 6.283185482025146484375;
        float _1584 = cos(_1582);
        float _1586 = _1578 * _1580;
        float _1588 = _1574 * 6.283185482025146484375;
        float _1590 = sin(_1588);
        float _1592 = _1584 * _1586;
        float _1594 = 1.0 / _1592;
        float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1598 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1596;
        float _1600 = 1.0 / _1598;
        float _1602 = _1590 * _1594;
        float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1606 = fma(_1506, _1602, _1604);
        float _1608 = _1606 * _1600;
        float _1610 = precise::clamp(_1608, 0.0, 1.0);
        float _1612 = -_1610;
        float _1614 = _1612 + 1.0;
        _1376 = _1594;
        _1562 = _1580;
        _1508 = _1614;
    }
    float _1616 = _1376;
    float _1618 = _1562;
    float _1620 = _1508;
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1624 = _1492 + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1628 = _1494 + _1626;
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1632 = _1496 + _1630;
    float _1634 = _1624 * _1624;
    float _1636 = fma(_1628, _1628, _1634);
    float _1638 = fma(_1632, _1632, _1636);
    float _1640 = rsqrt(_1638);
    float _1642 = sqrt(_1638);
    float _1644 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1646 = _1628 * _1644;
    float _1648 = _1632 * _1644;
    float _1650 = _1646 * _1646;
    float _1652 = _1648 * _1648;
    float _1654 = _1650 + _1652;
    float _1656 = sqrt(_1654);
    bool _1658 = _1656 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = _1656 + _1660;
    float _1664 = _1498;
    float _1666 = _1662;
    float _1668 = _1616;
    float _1670 = _1624;
    float _1672 = _1646;
    if (_1658)
    {
        float _1674 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1664 = _1674;
    }
    float _1676 = _1664;
    float _1678 = _1676;
    if (_1658)
    {
        float _1680 = _1662 * _1676;
        _1666 = _1680;
    }
    float _1682 = _1666;
    if (_1658)
    {
        float _1684 = rsqrt(_1654);
        _1678 = _1684;
    }
    float _1686 = _1678;
    float _1688 = _1686;
    if (_1658)
    {
        float _1690 = _1682 * 0.15915493667125701904296875;
        _1668 = _1690;
    }
    float _1692 = _1668;
    float _1694 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1696 = _1632;
    if (_1658)
    {
        float _1698 = _1692 * 6.283185482025146484375;
        float _1700 = sin(_1698);
        _1696 = _1700;
    }
    float _1702 = _1696;
    float _1704 = precise::max(0.0, _1694);
    float _1706 = _1618;
    float _1708 = _1704;
    if (_1658)
    {
        float _1710 = _1692 * 6.283185482025146484375;
        float _1712 = cos(_1710);
        _1706 = _1712;
    }
    float _1714 = _1706;
    float _1716 = -_1644;
    float _1718 = -_1704;
    float _1720 = fma(_1624, _1716, _1718);
    if (_1658)
    {
        float _1722 = _1720 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1670 = _1722;
    }
    float _1724 = _1670;
    float _1726 = _1702;
    float _1728 = _1724;
    if (_1658)
    {
        float _1730 = fma(_1702, _1724, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1726 = _1730;
    }
    float _1732 = _1726;
    float _1734 = _1732;
    if (!_1658)
    {
        _1728 = _1720;
    }
    float _1736 = _1728;
    float _1738 = _1736;
    if (_1658)
    {
        float _1740 = _1686 * _1732;
        _1144 = _1740;
    }
    float _1742 = _1144;
    if (!_1658)
    {
        _1734 = _1650;
    }
    float _1744 = _1734;
    float _1746 = _1744;
    float _1748 = _1714;
    if (_1658)
    {
        float _1750 = _1714 + (-1.0);
        _1708 = _1750;
    }
    float _1752 = _1708;
    float _1754 = _1752;
    if (_1658)
    {
        float _1756 = _1646 * _1742;
        _1672 = _1756;
    }
    float _1758 = _1672;
    if (_1658)
    {
        float _1760 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1688 = _1760;
    }
    float _1762 = _1688;
    if (!_1658)
    {
        _1754 = _1648;
    }
    float _1764 = _1754;
    float _1766 = _1764;
    if (_1658)
    {
        float _1768 = _1648 * _1742;
        _1766 = _1768;
    }
    float _1770 = _1766;
    if (_1658)
    {
        float _1772 = _1758 * _1758;
        _1746 = _1772;
    }
    float _1774 = _1746;
    if (_1658)
    {
        float _1776 = fma(_1720, _1714, _1762);
        _1738 = _1776;
    }
    float _1778 = _1738;
    if (!_1658)
    {
        _1748 = _1652;
    }
    float _1780 = _1748;
    float _1782 = _1780;
    if (_1658)
    {
        float _1784 = _1770 * _1770;
        _1782 = _1784;
    }
    float _1786 = _1782;
    float _1788 = fma(_1778, _1778, _1774);
    float _1790 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1792 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1794 = _1788 + _1786;
    float _1796 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1790);
    float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1800 = fma(_1642, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1798);
    float _1802 = precise::clamp(_1800, 0.0, 1.0);
    float _1804 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1806 = rsqrt(_1794);
    float _1808 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1796);
    float _1810 = -_1802;
    float _1812 = _1810 + 1.0;
    float _1814 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1804);
    float _1816 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1818 = _1808 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1820 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1792);
    float _1822 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1824 = abs(_1812);
    float _1826 = log2(_1824);
    float _1828 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1816);
    float _1830 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1814);
    float _1832 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1834 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1820);
    float _1836 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1828);
    float _1838 = _1830 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1840 = -_1832;
    float _1842 = fma(_1840, _1822, 1.0);
    float _1844 = _1806 * _1770;
    float _1846 = _1806 * _1758;
    float _1848 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1850 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1852 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1854 = _1806 * _1778;
    float _1856 = _1846 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1858 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1850);
    float _1860 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1862 = log2(_1842);
    float _1864 = -_1856;
    float _1866 = fma(_1854, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1864);
    float _1868 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1858);
    float _1870 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1872 = -_1844;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1866);
    float _1876 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1868);
    float _1878 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1880 = exp2(_1860);
    float _1882 = fma(_1874, -0.5, 0.5);
    float _1884 = fma(_1874, 0.5, 0.5);
    float _1886 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1878);
    float _1888 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1870);
    float _1890 = _1854 + 1.0;
    float _1892 = fma(_1884, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1894 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1886);
    float _1896 = 1.0 / _1876;
    float _1898 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1888);
    float _1900 = fma(_1884, _1892, -0.212114393711090087890625);
    float _1902 = _1862 * 0.693147182464599609375;
    float _1904 = fma(_1884, _1900, 1.570728778839111328125);
    float _1906 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1908 = sqrt(_1882);
    float _1910 = -_1854;
    float _1912 = fma(_1880, _1890, _1910);
    float _1914 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1894);
    float _1916 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1898);
    float _1918 = fma(_1912, 0.5, 0.5);
    float _1920 = _1914 * _1896;
    float _1922 = _1916 * _1896;
    float _1924 = fma(_1920, 0.5, 0.5);
    float _1926 = fma(_1922, -0.5, 0.5);
    float _1928 = _1908 * 0.636619746685028076171875;
    float3 _5284 = float3(_1924, _1926, _1906);
    float _1930 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5284, float3(0.0), isnan(_5284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5284, float3(0.0), isnan(_5284)), level(0.0)).x;
    float3 _5295 = float3(_1924, _1926, _1906);
    float4 _1933 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5295, float3(0.0), isnan(_5295)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5295, float3(0.0), isnan(_5295)), level(0.0)).xyzw;
    float _1935 = _1933.x;
    float _1937 = _1933.y;
    float _1939 = _1933.z;
    float _1941 = _1933.w;
    float _1943 = -_1904;
    float _1945 = fma(_1928, _1943, 1.0);
    float2 _5317 = float2(_1945, _1918);
    float3 _1949 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5317, float2(0.0), isnan(_5317)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5317, float2(0.0), isnan(_5317)), level(0.0)).xyz;
    float _1951 = _1949.x;
    float _1953 = _1949.y;
    float _1955 = _1949.z;
    float _1957 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1959 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1961 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1963 = isnan(_1642);
    bool _1965 = _1961 || _1963;
    bool _1967 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1969 = _1965 || _1967;
    float _1971 = _1914 + _1876;
    float _1973 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1959);
    float _1975 = exp2(_1957);
    float _1977 = _1876 * 0.5;
    float _1979 = _1971 * 0.5;
    float _1981 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1973);
    float _1983 = fma(_1916, -0.5, _1977);
    float _1985 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1981);
    float _1987 = _1985 + _1876;
    out.gl_Position.x = _1914;
    out.gl_Position.y = _1916;
    out.gl_Position.z = _1985;
    out.gl_Position.w = _1876;
    float _1989 = _1987 * 0.5;
    float _1991 = -_1975;
    float _1993 = _1991 + 1.0;
    float _1995 = _1993 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _1979;
    out.m_81.y = _1983;
    out.m_81.z = _1989;
    out.m_81.w = _1876;
    float _1997 = -_1995;
    float _1999 = _1997 + 1.0;
    float _2001 = _1560 * _1620;
    float _2003 = _1876;
    float _2005 = _1985;
    float _2007 = _1916;
    float _2009 = _1979;
    if (!_1969)
    {
        _2003 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2011 = _2003;
    float _2013 = _2011;
    float _2015 = _2011;
    if (!_1969)
    {
        _2005 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2017 = _2005;
    float _2019 = _2001 * _1296;
    float _2021 = _2019;
    float _2023 = _2017;
    float _2025 = _2017;
    if (!_1969)
    {
        _1378 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2027 = _1378;
    float _2029 = _2027;
    float _2031 = _2027;
    if (!_1969)
    {
        _2007 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2033 = _2007;
    float _2035 = _2019 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2037 = _2033;
    float _2039 = _2033;
    if (!_1969)
    {
        _2009 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2041 = _2009;
    float _2043 = _2041;
    float _2045 = _2041;
    if (!_1969)
    {
        _2021 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2047 = _2021;
    float _2049 = _1995 * _1930;
    float _2051 = _1941 * _2049;
    float _2053 = _1955 * _2049;
    float _2055 = fma(_1951, _2051, _1935);
    float _2057 = fma(_1953, _2051, _1937);
    float _2059 = _1941 * _1999;
    float _2061 = fma(_1941, _2053, _1939);
    out.m_83.x = _2055;
    out.m_83.y = _2057;
    out.m_83.z = _2061;
    out.m_83.w = _2059;
    bool _2063 = !_1969;
    float _2065 = _2047;
    float _2067 = _2047;
    if (!_2063)
    {
        bool _2069 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2071 = isnan(_1642);
        bool _2073 = _2069 || _2071;
        bool _2075 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2077 = _2073 || _2075;
        if (!_2077)
        {
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2081 = _1642 + _2079;
            float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2085 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2083;
            float _2087 = 1.0 / _2085;
            float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2099 = _2097 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2103 = _2101 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2107 = _2105 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2109 = _2081 * _2087;
            float _2111 = precise::clamp(_2109, 0.0, 1.0);
            float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2115 = _2113 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2117 = fma(_2111, _2091, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2119 = fma(_2111, _2115, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2121 = fma(_2111, _2095, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2123 = fma(_2111, _2099, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2125 = fma(_2111, _2103, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2127 = fma(_2111, _2107, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2045 = _2119;
            _2039 = _2125;
            _2031 = _2117;
            _2025 = _2123;
            _2015 = _2121;
            _2067 = _2127;
            _2129 = true;
        }
        else
        {
            bool _2131 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2133 = isnan(_1642);
            bool _2135 = _2131 || _2133;
            bool _2137 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2139 = _2135 || _2137;
            if (!_2139)
            {
                _2029 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2141 = _2029;
            _2031 = _2141;
            if (!_2139)
            {
                _2043 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2143 = _2043;
            _2045 = _2143;
            if (!_2139)
            {
                _2013 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2145 = _2013;
            _2015 = _2145;
            if (!_2139)
            {
                _2023 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2147 = _2023;
            _2025 = _2147;
            if (!_2139)
            {
                _2037 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2149 = _2037;
            _2039 = _2149;
            if (!_2139)
            {
                _2065 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2151 = _2065;
            bool _2153 = !_2139;
            _2067 = _2151;
            if (!_2153)
            {
                bool _2155 = _1642 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2157 = isnan(_1642);
                bool _2159 = _2155 || _2157;
                bool _2161 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2163 = _2159 || _2161;
                if (!_2163)
                {
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2167 = _1642 + _2165;
                    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2171 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2169;
                    float _2173 = 1.0 / _2171;
                    float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2193 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2195 = _2167 * _2173;
                    float _2197 = precise::clamp(_2195, 0.0, 1.0);
                    float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2203 = fma(_2197, _2177, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2205 = fma(_2197, _2201, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2207 = fma(_2197, _2181, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2209 = fma(_2197, _2185, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2211 = fma(_2197, _2189, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2213 = fma(_2197, _2193, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2045 = _2205;
                    _2039 = _2211;
                    _2031 = _2203;
                    _2025 = _2209;
                    _2015 = _2207;
                    _2067 = _2213;
                    _2129 = true;
                }
                else
                {
                    _2045 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2039 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2031 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2025 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2015 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2067 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2129 = false;
    float _2215 = _2045;
    float _2217 = _2039;
    float _2219 = _2031;
    float _2221 = _2025;
    float _2223 = _2015;
    float _2225 = _2067;
    float _2227 = fma(_1076, -0.5, 0.5);
    float _2229 = precise::clamp(_2227, 0.0, 1.0);
    float _2231 = -_2215;
    float _2233 = _2231 + _2217;
    float _2235 = _2035 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2237 = -_2219;
    float _2239 = _2237 + _2221;
    out.m_85.x = 0.0;
    float _2241 = fma(_2229, _2233, _2215);
    float _2243 = fma(_2229, _2239, _2219);
    out.m_49.x = _2235;
    float _2245 = -_2223;
    float _2247 = _2245 + _2225;
    float _2249 = _2241 * 0.586610972881317138671875;
    bool _2251 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2253 = fma(_2229, _2247, _2223);
    float _2255 = fma(_2243, 0.298911988735198974609375, _2249);
    bool _2257 = _1560 > 0.0;
    bool _2259 = isnan(_1560);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan(0.0);
    bool _2265 = _2261 || _2263;
    float _2267 = fma(_2253, 0.114477999508380889892578125, _2255);
    bool _2269 = _1620 <= 0.0;
    bool _2271 = !_2265;
    bool _2273 = _2269 || _2271;
    float _2275 = -_2267;
    float _2277 = _2243 + _2275;
    float _2279 = -_2267;
    float _2281 = _2241 + _2279;
    float _2283 = -_2267;
    float _2285 = _2253 + _2283;
    float _2287 = fma(_2277, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2267);
    float _2289 = fma(_2281, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2267);
    float _2291 = fma(_2285, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2267);
    bool _2293 = !_2251;
    if (!_2293)
    {
        float _2295 = -_1492;
        float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2299 = -_1494;
        float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2303 = -_1496;
        float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2307 = _2297 * _2297;
        float _2309 = fma(_2301, _2301, _2307);
        float _2311 = fma(_2305, _2305, _2309);
        float _2313 = sqrt(_2311);
        float _2315 = rsqrt(_2311);
        float _2317 = -_2313;
        float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2321 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2323 = precise::clamp(_2321, 0.0, 1.0);
        float _2325 = _2301 * _2315;
        float _2327 = _2297 * _2315;
        float _2329 = abs(_2323);
        float _2331 = log2(_2329);
        float _2333 = _2305 * _2315;
        float _2335 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2337 = _1076 * _2327;
        float _2339 = -_2327;
        float _2341 = -_2335;
        float _2343 = fma(_2339, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2341);
        float _2345 = fma(_1082, _2325, _2337);
        float _2347 = -_2333;
        float _2349 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2343);
        float _2351 = fma(_1088, _2333, _2345);
        float _2353 = precise::clamp(_2351, 0.0, 1.0);
        float _2355 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2357 = _2349 + _2355;
        float _2359 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2361 = _2357 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2363 = precise::clamp(_2361, 0.0, 1.0);
        float _2365 = exp2(_2359);
        float _2367 = _2365 * _2363;
        float _2369 = _2353 * _2367;
        float _2371 = _2369 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2373 = _2369 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2375 = _2369 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _2371;
        out.m_85.y = _2373;
        out.m_85.z = _2375;
    }
    out.m_87.x = _2287;
    out.m_87.y = _2289;
    out.m_87.z = _2291;
    if (!_2273)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2377 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2377;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

