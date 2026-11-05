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
    float4 m_55 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1919 = false;
    bool _1342 = false;
    bool _314 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_46.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2204 = as_type<float>(_118);
        out.gl_Position.z = _2204;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_51.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = _136;
    if (_132)
    {
        float _140 = float(_102);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2274 = as_type<float>(_156);
        out.gl_Position.z = _2274;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_53.w;
    float _160 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_51.x;
    float _174 = in.m_51.y;
    float _176 = in.m_51.z;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _180 = in.m_46.x;
    float _182 = in.m_46.y;
    float _184 = in.m_46.z;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _188 = _178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _194 = _186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _196 = 0.0;
    float _198 = _160;
    if (!_170)
    {
        float _200 = _160 * _160;
        float _202 = _200 * 0.5;
        _196 = _202;
    }
    float _204 = _196;
    float _206 = _190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _208 = _204;
    if (!_170)
    {
        float _210 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _210;
    }
    float _212 = _208;
    bool _214 = !_170;
    float _216 = _212;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _160 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _160);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_170;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _160 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _198 = _270;
    }
    float _272 = _198;
    out.m_55.x = _188;
    out.m_55.y = _194;
    out.m_55.z = _206;
    out.m_55.w = _192;
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _276 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _278 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _282 = fma(_272, _172, _276);
    float _284 = fma(_272, _174, _278);
    float _286 = fma(_272, _176, _280);
    float _288 = fma(_282, _158, _180);
    float _290 = fma(_284, _158, _182);
    float _292 = fma(_286, _158, _184);
    bool _294 = !_274;
    float _312;
    if (!_294)
    {
        float _296 = in.m_57.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _312 = _310;
        _314 = true;
    }
    else
    {
        float _316 = float(_102);
        float _318 = 1.0 / _316;
        float _320 = _136 * _318;
        _312 = _320;
    }
    _314 = false;
    float _322 = _312;
    float _324 = in.m_57.x;
    float _326 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _328 = log2(_326);
    float _330 = in.m_57.z;
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _334 = _332 != 0;
    float _336 = in.m_57.y;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _344 = in.m_57.w;
    float _346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _348 = _324 * 2.0;
    float _350 = _340 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _352 = _330 * 2.0;
    float _354 = floor(_348);
    float _356 = _336 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _358 = _336 * 2.0;
    float _360 = fma(_356, -2.0, _342);
    float _362 = floor(_352);
    float _364 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _360);
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _368 = _354 > 0.0;
    float _370 = _324 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _372 = _354 >= 0.0;
    bool _374 = isnan(_354);
    bool _376 = _372 || _374;
    bool _378 = isnan(0.0);
    bool _380 = _376 || _378;
    float _382 = floor(_358);
    float _384 = -_338;
    float _386 = fma(_370, 2.0, _384);
    float _388 = _370;
    float _390 = _338;
    if (_334)
    {
        _388 = _324;
    }
    float _392 = _388;
    float _394 = _392;
    if (!_334)
    {
        _394 = _330;
    }
    float _396 = _394;
    if (_334)
    {
        _390 = _336;
    }
    float _398 = _390;
    int _400 = _380 ? 0 : 1;
    float _402 = _396 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _404 = _398;
    if (!_334)
    {
        _404 = _324;
    }
    float _406 = _404;
    bool _408 = _362 > 0.0;
    float _410 = -_366;
    float _412 = fma(_402, 2.0, _410);
    float _414 = _328 * _136;
    int _416 = ~_400;
    int _418 = _416 + 1;
    int _420 = _418 + 1;
    float _422 = _406 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _424 = _420;
    if (!_368)
    {
        int _426 = ~_400;
        int _428 = _426 + 1;
        _424 = _428;
    }
    int _430 = _424;
    float _432 = in.m_59.y;
    bool _434 = _362 >= 0.0;
    bool _436 = isnan(_362);
    bool _438 = _434 || _436;
    bool _440 = isnan(0.0);
    bool _442 = _438 || _440;
    float _444 = exp2(_414);
    int _446 = _442 ? 0 : 1;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _450 = _382 > 0.0;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _454 = 1.0 + _452;
    bool _456 = _382 >= 0.0;
    bool _458 = isnan(_382);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = fma(_422, -2.0, _448);
    int _468 = ~_446;
    int _470 = _468 + 1;
    int _472 = _470 + 1;
    float _474 = 1.0 / _454;
    int _476 = _472;
    if (!_408)
    {
        int _478 = ~_446;
        int _480 = _478 + 1;
        _476 = _480;
    }
    int _482 = _476;
    float _484 = -_444;
    float _486 = _484 + 1.0;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _492 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _494 = isnan(1.0);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _500 = _496 || _498;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _504 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _512 = _508 || _510;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _516 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[78].z, _488);
    float _518 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[78].w, _490);
    float _520 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[88].z, _502);
    float _522 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[88].w, _514);
    float _524 = _512 ? _486 : 0.0;
    float _526 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _516);
    float _528 = -_136;
    float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[76].x, _386);
    float _532 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _518);
    float _534 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].z, _520);
    float _536 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].w, _522);
    float _538 = -_136;
    float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[86].x, _412);
    float _542 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[86].y, _466);
    if (_500)
    {
        float _544 = _524 * _474;
        _138 = _544;
    }
    float _546 = _138;
    float _548 = -_432;
    float _550 = _548 + 1.0;
    bool _552 = _336 > 0.5;
    int _554 = _464 ? 0 : 1;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _558 = _556 != 0;
    int _560 = _552 ? as_type<int>(_550) : as_type<int>(_432);
    bool _562 = _330 > 0.5;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _566 = _564 != 0;
    float _568 = _558 ? as_type<float>(_560) : _432;
    int _570 = _562 ? as_type<int>(_550) : as_type<int>(_432);
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _574 = _572 != 0;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _578 = _576 != 0;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _582 = _580 != 0;
    int _584 = ~_554;
    int _586 = _584 + 1;
    int _588 = _586 + 1;
    int _590 = _588;
    float _592 = _432;
    if (!_450)
    {
        int _594 = ~_554;
        int _596 = _594 + 1;
        _590 = _596;
    }
    int _598 = _590;
    float _600 = _566 ? as_type<float>(_570) : _432;
    bool _602 = !_574;
    int _604 = _602 ? 0 : 1;
    bool _606 = !_578;
    int _608 = _606 ? 0 : 1;
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _612 = _610 != 0;
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _616 = _614 != 0;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _624 = _622 != 0;
    int _626 = abs(_604);
    int _628 = abs(_608);
    float _630 = in.m_61.x;
    float _632 = in.m_61.y;
    float _634 = in.m_61.z;
    bool _636 = !_582;
    int _638 = _636 ? 0 : 1;
    float _640 = float(_626);
    int _642 = abs(_638);
    float _644 = float(_482);
    float _646 = in.m_53.x;
    float _648 = in.m_53.y;
    float _650 = in.m_53.z;
    float _652 = float(_430);
    float _654 = float(_642);
    float _656 = _640 * _644;
    float _658 = float(_598);
    float _660 = _290 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _662 = float(_628);
    float _664 = _656 * (-2.0);
    bool _666 = _344 > 0.5;
    float _668 = _654 * _658;
    float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _672 = _662 * _652;
    float _674 = _290 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _676 = _290 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _678 = _668 * (-2.0);
    float _680 = _672 * (-2.0);
    float _682 = fma(_664, _630, _630);
    float _684 = _324 + _336;
    float _686 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].x, _660);
    float _688 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].x, _674);
    float _690 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].x, _676);
    float _692 = fma(_678, _634, _634);
    float _694 = fma(_680, _632, _632);
    float _696 = _684 + (-1.0);
    float _698 = _336 + _330;
    float _700 = _648 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _702 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _704 = _324 + (-0.5);
    float _706 = _698 + (-1.0);
    float _708 = fma(_702, _664, _702);
    float _710 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[196].x, _682);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _716 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _718 = _650 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _720 = fma(_708, _546, _710);
    float _722 = 1.0 / _714;
    float _724 = in.m_63.x;
    float _726 = in.m_63.y;
    float _728 = in.m_63.z;
    float _730 = _336 + (-0.5);
    bool _732 = _666;
    if (_624)
    {
        float _734 = _666 ? _550 : _432;
        _592 = _734;
    }
    float _736 = _592;
    float _738 = fma(_716, _680, _716);
    if (_612)
    {
        bool _740 = _324 > 0.5;
        _732 = _740;
    }
    bool _742 = _732;
    float _744 = _324 + _330;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _750 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[196].y, _694);
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _752;
    float _756 = _744 + (-1.0);
    float _758 = 1.0 / _748;
    float _760 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].z, _686);
    float _762 = _646 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _764 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _766 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].z, _688);
    float _768 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].z, _690);
    float _770 = _754 * _722;
    float _772 = _330 + (-0.5);
    float _774 = fma(_738, _546, _750);
    float _776 = fma(_764, _678, _764);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _782 = _762 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _724);
    float _786 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[196].z, _692);
    float _788 = _720 * 0.15915493667125701904296875;
    float _790 = _780 * _758;
    float _792 = _782 * _784;
    float _794 = fma(_776, _546, _786);
    float _796 = in.m_59.x;
    float _798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _800 = _726 != 0.0;
    bool _802 = isnan(_726);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    float _810 = _774 * 0.15915493667125701904296875;
    float _812 = in.m_65.x;
    float _814 = in.m_65.y;
    float _816 = in.m_65.z;
    float _818 = _794 * 0.15915493667125701904296875;
    float _820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _728);
    float _822 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _826 = _322 + _824;
    bool _828 = _724 == 0.0;
    bool _830 = !_808;
    bool _832 = _828 && _830;
    float _834 = _788 * 6.283185482025146484375;
    float _836 = sin(_834);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _840 = _322 + _838;
    float _842 = _822 * _820;
    bool _844 = _728 == 0.0;
    bool _846 = _844 && _832;
    float _848 = fma(_770, _826, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _850 = fma(_790, _840, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _726);
    float _854 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _856 = _788 * 6.283185482025146484375;
    float _858 = cos(_856);
    float _860 = _798 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _862 = _670 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _864 = _854 * _852;
    float _866 = fma(_860, _568, -0.5);
    float _868 = _854;
    float _870 = _798;
    float _872 = _766;
    if (!_612)
    {
        _868 = _796;
    }
    float _874 = _868;
    float _876 = fma(_600, _862, -0.5);
    float _878 = _810 * 6.283185482025146484375;
    float _880 = sin(_878);
    float _882 = -_364;
    float _884 = fma(_532, _866, _882);
    float _886 = _816;
    float _888 = _814;
    float _890 = _812;
    float _892 = _874;
    if (!_846)
    {
        float _894 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[17].y, _816);
        _886 = _894;
    }
    float _896 = _886;
    if (!_846)
    {
        float _898 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[17].y, _814);
        _888 = _898;
    }
    float _900 = _888;
    if (!_612)
    {
        _870 = _874;
    }
    float _902 = _870;
    float _904 = _902;
    if (!_846)
    {
        float _906 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _812);
        _890 = _906;
    }
    float _908 = _890;
    if (_612)
    {
        _892 = _796;
    }
    float _910 = _892;
    float _912 = -_542;
    float _914 = fma(_536, _876, _912);
    float _916 = _810 * 6.283185482025146484375;
    float _918 = cos(_916);
    bool _920 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _922 = isnan(_322);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    int _932 = 0;
    float _934 = _910;
    if (_612)
    {
        float _936 = -_910;
        float _938 = _936 + 1.0;
        _932 = as_type<int>(_938);
    }
    int _940 = _932;
    int _942 = 0;
    int _944 = _940;
    if (_620)
    {
        float _946 = -_910;
        float _948 = _946 + 1.0;
        _942 = as_type<int>(_948);
    }
    int _950 = _942;
    float _952 = _818 * 6.283185482025146484375;
    float _954 = cos(_952);
    float _956 = _836 * _880;
    float _958 = _858 * _880;
    if (_612)
    {
        float _960 = _742 ? as_type<float>(_940) : _910;
        _904 = _960;
    }
    float _962 = _904;
    if (_616)
    {
        float _964 = -_910;
        float _966 = _964 + 1.0;
        _944 = as_type<int>(_966);
    }
    int _968 = _944;
    float _970 = _818 * 6.283185482025146484375;
    float _972 = sin(_970);
    float _974 = _858 * _918;
    float _976 = _836 * _918;
    float _978 = fma(_350, _962, -0.5);
    float _980 = _858 * _954;
    float _982 = _836 * _954;
    float _984 = _918 * _954;
    float _986 = _880 * _954;
    float _988 = _980 * _864;
    float _990 = _982 * _864;
    float _992 = _768 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _994 = _980 * _900;
    float _996 = fma(_972, _974, _956);
    float _998 = -_958;
    float _1000 = fma(_972, _976, _998);
    float _1002 = -_976;
    float _1004 = fma(_972, _958, _1002);
    float _1006 = -_864;
    float _1008 = _972 * _1006;
    float _1010 = fma(_996, _792, _988);
    float _1012 = fma(_972, _956, _974);
    float _1014 = fma(_1000, _792, _990);
    float _1016 = fma(_984, _792, _1008);
    float _1018 = fma(_1004, _842, _1010);
    float _1020 = _760 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1022 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1024 = isnan(_322);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1030 = _1026 || _1028;
    float _1032 = float(_1030);
    float _1034 = fma(_986, _842, _1016);
    float _1036 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1038 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1040 = fma(_1012, _842, _1014);
    bool _1042 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1044 = isnan(_322);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    float _1054 = fma(_1034, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1036);
    float _1056 = fma(_1034, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1038);
    float _1058 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1060 = -_900;
    float _1062 = _972 * _1060;
    float _1064 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1054);
    float _1066 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1056);
    float _1068 = -_930;
    float _1070 = _1068 + 1.0;
    float _1072 = fma(_1034, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1058);
    float _1074 = _1020 + _1064;
    float _1076 = _992 + _1066;
    float _1078 = _1032 * _1070;
    float _1080 = -_1032;
    float _1082 = _1080 + 1.0;
    float _1084 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1086 = _1074 + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1090 = _1076 + _1088;
    float _1092 = _992;
    float _1094 = _1074;
    float _1096 = _1076;
    if (!_620)
    {
        _1092 = _910;
    }
    float _1098 = _1092;
    float _1100 = _1052 * _1082;
    float _1102 = _1086 * _1086;
    float _1104 = _1090 * _1090;
    float _1106 = _1098;
    float _1108 = _1102;
    float _1110 = _1104;
    if (_620)
    {
        float _1112 = _552 ? as_type<float>(_950) : _910;
        _1106 = _1112;
    }
    float _1114 = _1106;
    float _1116 = _848 * _1100;
    if (_616)
    {
        float _1118 = _562 ? as_type<float>(_968) : _910;
        _934 = _1118;
    }
    float _1120 = _934;
    float _1122 = _1102 + _1104;
    float _1124 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1072);
    float _1126 = -_1052;
    float _1128 = _1126 + 1.0;
    float _1130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1132 = _982 * _900;
    float _1134 = _766 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1136 = _346 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1138 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1116);
    float _1140 = fma(_984, _908, _1062);
    float _1142 = _1134 + _1124;
    float _1144 = fma(_1136, _1114, -0.5);
    float _1146 = sqrt(_1122);
    float _1148 = fma(_850, _1078, _1138);
    float _1150 = fma(_526, _978, _530);
    float _1152 = fma(_534, _1144, _540);
    float _1154 = fma(_996, _908, _994);
    float _1156 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1148);
    float _1158 = fma(_1000, _908, _1132);
    float _1160 = fma(_986, _896, _1140);
    bool _1162 = _1146 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = _1152;
    if (!_1162)
    {
        _872 = _1142;
    }
    float _1166 = _872;
    bool _1168 = !_1162;
    float _1170 = _1166;
    if (!_1168)
    {
        float _1172 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1176 = _1146 + _1174;
        float _1178 = _1142 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1180 = rsqrt(_1122);
        float _1182 = _1176 * _1172;
        float _1184 = _1182 * 0.15915493667125701904296875;
        float _1186 = _1184 * 6.283185482025146484375;
        float _1188 = sin(_1186);
        float _1190 = _1184 * 6.283185482025146484375;
        float _1192 = cos(_1190);
        float _1194 = fma(_1188, _1178, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1196 = _1180 * _1194;
        float _1198 = _1192 + (-1.0);
        float _1200 = fma(_1086, _1196, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1202 = fma(_1090, _1196, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1204 = _1198 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1208 = _1200 + _1206;
        float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1212 = _1202 + _1210;
        float _1214 = fma(_1142, _1192, _1204);
        float _1216 = _1208 * _1208;
        float _1218 = _1212 * _1212;
        _1170 = _1214;
        _1108 = _1216;
        _1110 = _1218;
        _1094 = _1200;
        _1096 = _1202;
    }
    float _1220 = _1170;
    float _1222 = _1108;
    float _1224 = _1110;
    float _1226 = _1094;
    float _1228 = _1096;
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1232 = _1220 + _1230;
    float _1234 = fma(_1004, _896, _1154);
    float _1236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1238 = fma(_1232, _1232, _1222);
    float _1240 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1242 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1244 = _1238 + _1224;
    float _1246 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1240);
    float _1248 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1250 = fma(_1012, _896, _1158);
    float _1252 = _736 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1254 = sqrt(_1244);
    float _1256 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1242);
    float _1258 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1260 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1248);
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1268 = _1252 * _1130;
    float _1270 = _1258 * _1236;
    float _1272 = _914 + 0.5;
    float _1274 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1256);
    float _1276 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1282 = _884 + 0.5;
    float _1284 = _1152 + 0.5;
    float _1286 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1288 = _1150 + 0.5;
    float _1290 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1260);
    float _1292 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1246);
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _1294 = _1254 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1296 = isnan(_1254);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1302 = _1298 || _1300;
    out.m_69.x = _1276;
    out.m_69.y = _1278;
    out.m_69.z = _1280;
    out.m_69.w = _1286;
    out.m_71.x = _1288;
    out.m_71.y = _1282;
    out.m_71.z = _1270;
    out.m_71.w = _1268;
    out.m_73.x = _1284;
    out.m_73.y = _1272;
    float _1304 = _1228;
    float _1306 = _1272;
    if (!_1302)
    {
        _1164 = 1.0;
    }
    float _1308 = _1164;
    out.m_75.x = _1274;
    out.m_75.y = _1290;
    out.m_75.z = _1292;
    bool _1310 = !_1302;
    float _1312 = _1308;
    if (!_1310)
    {
        bool _1314 = _1254 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1316 = isnan(_1254);
        bool _1318 = _1314 || _1316;
        bool _1320 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1322 = _1318 || _1320;
        if (!_1322)
        {
            float _1324 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1326 = _1254 + _1324;
            float _1328 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1330 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1328;
            float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1334 = _1332 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1336 = 1.0 / _1330;
            float _1338 = _1326 * _1336;
            float _1340 = fma(_1338, _1334, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1312 = _1340;
            _1342 = true;
        }
        else
        {
            bool _1344 = _1254 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1346 = isnan(_1254);
            bool _1348 = _1344 || _1346;
            bool _1350 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1352 = _1348 || _1350;
            if (!_1352)
            {
                float _1354 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1356 = _1254 + _1354;
                float _1358 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1360 = _1358 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1362 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1364 = _1362 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1366 = 1.0 / _1360;
                float _1368 = _1356 * _1366;
                float _1370 = fma(_1368, _1364, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1312 = _1370;
                _1342 = true;
            }
            else
            {
                _1312 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1342 = false;
    float _1372 = _1312;
    float _1374 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1376 = _1220 + _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1380 = _1226 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1384 = _1228 + _1382;
    float _1386 = fma(_1376, _1372, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1388 = fma(_1380, _1372, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1390 = fma(_1384, _1372, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1394 = _1386 + _1392;
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1398 = _1388 + _1396;
    float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1402 = _1390 + _1400;
    float _1404 = _1394 * _1394;
    float _1406 = fma(_1398, _1398, _1404);
    float _1408 = fma(_1402, _1402, _1406);
    float _1410 = rsqrt(_1408);
    float _1412 = sqrt(_1408);
    float _1414 = _1398 * _1410;
    float _1416 = _1402 * _1410;
    float _1418 = _1394 * _1410;
    float _1420 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1422 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1424 = _1420 * _1420;
    float _1426 = _1422 * _1422;
    float _1428 = _1424 + _1426;
    float _1430 = sqrt(_1428);
    bool _1432 = _1430 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1436 = _1430 + _1434;
    float _1438 = _1268;
    float _1440 = _1428;
    float _1442 = _1436;
    float _1444 = _1420;
    if (_1432)
    {
        float _1446 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1438 = _1446;
    }
    float _1448 = _1438;
    if (_1432)
    {
        float _1450 = rsqrt(_1428);
        _1440 = _1450;
    }
    float _1452 = _1440;
    if (_1432)
    {
        float _1454 = _1436 * _1448;
        _1442 = _1454;
    }
    float _1456 = _1442;
    if (_1432)
    {
        float _1458 = _1456 * 0.15915493667125701904296875;
        _1304 = _1458;
    }
    float _1460 = _1304;
    float _1462 = _1448;
    float _1464 = _1460;
    if (_1432)
    {
        float _1466 = _1460 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        _1462 = _1468;
    }
    float _1470 = _1462;
    float _1472 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1474 = precise::max(0.0, _1472);
    float _1476 = _1276;
    float _1478 = _1472;
    float _1480 = _1474;
    if (_1432)
    {
        float _1482 = _1460 * 6.283185482025146484375;
        float _1484 = cos(_1482);
        _1476 = _1484;
    }
    float _1486 = _1476;
    float _1488 = -_1418;
    float _1490 = -_1474;
    float _1492 = fma(_1488, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1490);
    if (_1432)
    {
        float _1494 = _1492 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1478 = _1494;
    }
    float _1496 = _1478;
    float _1498 = _1470;
    float _1500 = _1496;
    if (_1432)
    {
        float _1502 = fma(_1470, _1496, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1498 = _1502;
    }
    float _1504 = _1498;
    float _1506 = _1504;
    if (!_1432)
    {
        _1500 = _1424;
    }
    float _1508 = _1500;
    float _1510 = _1508;
    float _1512 = _1486;
    if (_1432)
    {
        float _1514 = _1486 + (-1.0);
        _1480 = _1514;
    }
    float _1516 = _1480;
    float _1518 = _1516;
    if (_1432)
    {
        float _1520 = _1452 * _1504;
        _1306 = _1520;
    }
    float _1522 = _1306;
    if (!_1432)
    {
        _1506 = _1492;
    }
    float _1524 = _1506;
    float _1526 = _1524;
    if (_1432)
    {
        float _1528 = _1516 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1464 = _1528;
    }
    float _1530 = _1464;
    if (_1432)
    {
        float _1532 = _1420 * _1522;
        _1444 = _1532;
    }
    float _1534 = _1444;
    if (!_1432)
    {
        _1518 = _1422;
    }
    float _1536 = _1518;
    float _1538 = _1536;
    if (_1432)
    {
        float _1540 = _1422 * _1522;
        _1538 = _1540;
    }
    float _1542 = _1538;
    if (_1432)
    {
        float _1544 = fma(_1492, _1486, _1530);
        _1526 = _1544;
    }
    float _1546 = _1526;
    if (_1432)
    {
        float _1548 = _1534 * _1534;
        _1510 = _1548;
    }
    float _1550 = _1510;
    if (!_1432)
    {
        _1512 = _1426;
    }
    float _1552 = _1512;
    float _1554 = _1552;
    if (_1432)
    {
        float _1556 = _1542 * _1542;
        _1554 = _1556;
    }
    float _1558 = _1554;
    float _1560 = fma(_1546, _1546, _1550);
    float _1562 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1564 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1566 = _1560 + _1558;
    float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1570 = fma(_1412, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1568);
    float _1572 = precise::clamp(_1570, 0.0, 1.0);
    float _1574 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1562);
    float _1576 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1578 = rsqrt(_1566);
    float _1580 = -_1572;
    float _1582 = _1580 + 1.0;
    float _1584 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1574);
    float _1586 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1588 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1576);
    float _1590 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1592 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1594 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1586);
    float _1596 = abs(_1582);
    float _1598 = log2(_1596);
    float _1600 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1588);
    float _1602 = _1592 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1604 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1564);
    float _1606 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1594);
    float _1608 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1610 = -_1602;
    float _1612 = fma(_1610, _1590, 1.0);
    float _1614 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1604);
    float _1616 = _1578 * _1534;
    float _1618 = _1606 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1620 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1622 = _1578 * _1546;
    float _1624 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1626 = _1578 * _1542;
    float _1628 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1620);
    float _1630 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1632 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1634 = -_1624;
    float _1636 = fma(_1622, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1634);
    float _1638 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1628);
    float _1640 = log2(_1612);
    float _1642 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1644 = -_1626;
    float _1646 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1636);
    float _1648 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1638);
    float _1650 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1652 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1642);
    float _1654 = fma(_1646, -0.5, 0.5);
    float _1656 = fma(_1646, 0.5, 0.5);
    float _1658 = exp2(_1632);
    float _1660 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1650);
    float _1662 = _1622 + 1.0;
    float _1664 = fma(_1656, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1666 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1652);
    float _1668 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1660);
    float _1670 = fma(_1656, _1664, -0.212114393711090087890625);
    float _1672 = 1.0 / _1648;
    float _1674 = _1640 * 0.693147182464599609375;
    float _1676 = fma(_1656, _1670, 1.570728778839111328125);
    float _1678 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1680 = sqrt(_1654);
    float _1682 = -_1622;
    float _1684 = fma(_1658, _1662, _1682);
    float _1686 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1668);
    float _1688 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1666);
    float _1690 = fma(_1684, 0.5, 0.5);
    float _1692 = _1686 * _1672;
    float _1694 = _1688 * _1672;
    float _1696 = fma(_1692, 0.5, 0.5);
    float _1698 = fma(_1694, -0.5, 0.5);
    float _1700 = _1680 * 0.636619746685028076171875;
    float3 _4801 = float3(_1696, _1698, _1678);
    float _1702 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4801, float3(0.0), isnan(_4801)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4801, float3(0.0), isnan(_4801)), level(0.0)).x;
    float3 _4812 = float3(_1696, _1698, _1678);
    float4 _1705 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4812, float3(0.0), isnan(_4812)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4812, float3(0.0), isnan(_4812)), level(0.0)).xyzw;
    float _1707 = _1705.x;
    float _1709 = _1705.y;
    float _1711 = _1705.z;
    float _1713 = _1705.w;
    float _1715 = -_1676;
    float _1717 = fma(_1700, _1715, 1.0);
    float2 _4834 = float2(_1717, _1690);
    float3 _1721 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4834, float2(0.0), isnan(_4834)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4834, float2(0.0), isnan(_4834)), level(0.0)).xyz;
    float _1723 = _1721.x;
    float _1725 = _1721.y;
    float _1727 = _1721.z;
    float _1729 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1731 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1733 = _1290 * _1418;
    float _1735 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1731);
    float _1737 = exp2(_1729);
    float _1739 = fma(_1274, _1414, _1733);
    float _1741 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1735);
    bool _1743 = _1412 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1745 = isnan(_1412);
    bool _1747 = _1743 || _1745;
    bool _1749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1751 = _1747 || _1749;
    float _1753 = fma(_1292, _1416, _1739);
    float _1755 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1741);
    float _1757 = abs(_1753);
    float _1759 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1761 = _1757 + _1759;
    float _1763 = _1755 + _1648;
    out.gl_Position.x = _1686;
    out.gl_Position.y = _1688;
    out.gl_Position.z = _1755;
    out.gl_Position.w = _1648;
    float _1765 = _1763 * 0.5;
    float _1767 = -_1737;
    float _1769 = _1767 + 1.0;
    float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1773 = _1771 + (*spvDescriptorSet0.vp_c9)._m0[139].w;
    float _1775 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _1765;
    out.m_77.w = _1648;
    float _1777 = 1.0 / _1773;
    float _1779 = _1648;
    float _1781 = _1755;
    float _1783 = _1688;
    if (!_1751)
    {
        _1779 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1785 = _1779;
    float _1787 = _1785;
    float _1789 = _1785;
    if (!_1751)
    {
        _1781 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1791 = _1781;
    float _1793 = _1791;
    float _1795 = _1791;
    if (!_1751)
    {
        _1783 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1797 = _1783;
    float _1799 = _1761 * _1777;
    float _1801 = precise::clamp(_1799, 0.0, 1.0);
    float _1803 = _1777;
    float _1805 = _1797;
    float _1807 = _1797;
    if (!_1751)
    {
        _1803 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1809 = _1803;
    float _1811 = fma(_1801, -2.0, 3.0);
    float _1813 = _1801 * _1801;
    float _1815 = _1811 * _1813;
    float _1817 = _1811;
    float _1819 = _1809;
    float _1821 = _1809;
    if (!_1751)
    {
        _1817 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1823 = _1817;
    float _1825 = _1815 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1827 = _1775 * _1702;
    float _1829 = -_1775;
    float _1831 = _1829 + 1.0;
    float _1833 = _1713 * _1827;
    float _1835 = _1727 * _1827;
    float _1837 = fma(_1723, _1833, _1707);
    float _1839 = fma(_1725, _1833, _1709);
    float _1841 = _1713 * _1831;
    float _1843 = fma(_1713, _1835, _1711);
    float _1845 = _1833;
    float _1847 = _1823;
    float _1849 = _1823;
    if (!_1751)
    {
        _1845 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1851 = _1845;
    out.m_79.x = _1837;
    out.m_79.y = _1839;
    out.m_79.z = _1843;
    out.m_79.w = _1841;
    bool _1853 = !_1751;
    float _1855 = _1851;
    float _1857 = _1851;
    if (!_1853)
    {
        bool _1859 = _1412 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1861 = isnan(_1412);
        bool _1863 = _1859 || _1861;
        bool _1865 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1867 = _1863 || _1865;
        if (!_1867)
        {
            float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1871 = _1412 + _1869;
            float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1875 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1873;
            float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1879 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1881 = 1.0 / _1875;
            float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1889 = _1887 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1899 = _1871 * _1881;
            float _1901 = precise::clamp(_1899, 0.0, 1.0);
            float _1903 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1905 = _1903 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1907 = fma(_1901, _1879, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1909 = fma(_1901, _1905, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1911 = fma(_1901, _1885, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1913 = fma(_1901, _1889, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1915 = fma(_1901, _1893, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1917 = fma(_1901, _1897, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1821 = _1911;
            _1807 = _1915;
            _1857 = _1907;
            _1795 = _1913;
            _1789 = _1909;
            _1849 = _1917;
            _1919 = true;
        }
        else
        {
            bool _1921 = _1412 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1923 = isnan(_1412);
            bool _1925 = _1921 || _1923;
            bool _1927 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1929 = _1925 || _1927;
            if (!_1929)
            {
                _1855 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1931 = _1855;
            _1857 = _1931;
            if (!_1929)
            {
                _1819 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1933 = _1819;
            _1821 = _1933;
            if (!_1929)
            {
                _1787 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1935 = _1787;
            _1789 = _1935;
            if (!_1929)
            {
                _1793 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1937 = _1793;
            _1795 = _1937;
            if (!_1929)
            {
                _1805 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1939 = _1805;
            _1807 = _1939;
            if (!_1929)
            {
                _1847 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1941 = _1847;
            bool _1943 = !_1929;
            _1849 = _1941;
            if (!_1943)
            {
                bool _1945 = _1412 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1947 = isnan(_1412);
                bool _1949 = _1945 || _1947;
                bool _1951 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1953 = _1949 || _1951;
                if (!_1953)
                {
                    float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1957 = _1412 + _1955;
                    float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1961 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1959;
                    float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1967 = 1.0 / _1961;
                    float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1971 = _1969 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1975 = _1973 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1979 = _1977 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1985 = _1957 * _1967;
                    float _1987 = precise::clamp(_1985, 0.0, 1.0);
                    float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1991 = _1989 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1993 = fma(_1987, _1965, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1995 = fma(_1987, _1991, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1997 = fma(_1987, _1971, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1999 = fma(_1987, _1975, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2001 = fma(_1987, _1979, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2003 = fma(_1987, _1983, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1821 = _1997;
                    _1807 = _2001;
                    _1857 = _1993;
                    _1795 = _1999;
                    _1789 = _1995;
                    _1849 = _2003;
                    _1919 = true;
                }
                else
                {
                    _1821 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1807 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1857 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1795 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1789 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1849 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1919 = false;
    float _2005 = _1821;
    float _2007 = _1807;
    float _2009 = _1857;
    float _2011 = _1795;
    float _2013 = _1789;
    float _2015 = _1849;
    float _2017 = fma(_1290, -0.5, 0.5);
    float _2019 = precise::clamp(_2017, 0.0, 1.0);
    float _2021 = -_2005;
    float _2023 = _2021 + _2007;
    float _2025 = -_2009;
    float _2027 = _2025 + _2011;
    float _2029 = -_2013;
    float _2031 = _2029 + _2015;
    bool _2033 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2035 = fma(_2019, _2023, _2005);
    float _2037 = fma(_2019, _2027, _2009);
    float _2039 = fma(_2019, _2031, _2013);
    float _2041 = _1825 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2043 = _2035 * 0.586610972881317138671875;
    out.m_81.x = 0.0;
    float _2045 = fma(_2037, 0.298911988735198974609375, _2043);
    out.m_49.x = _2041;
    float _2047 = fma(_2039, 0.114477999508380889892578125, _2045);
    float _2049 = -_2047;
    float _2051 = _2037 + _2049;
    float _2053 = -_2047;
    float _2055 = _2035 + _2053;
    float _2057 = -_2047;
    float _2059 = _2039 + _2057;
    float _2061 = fma(_2051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2047);
    float _2063 = fma(_2055, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2047);
    float _2065 = fma(_2059, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2047);
    out.m_83.x = _2061;
    out.m_83.y = _2063;
    out.m_83.z = _2065;
    if (!_2033)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2067 = -_1386;
    float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2071 = -_1388;
    float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2075 = -_1390;
    float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2079 = _2069 * _2069;
    float _2081 = fma(_2073, _2073, _2079);
    float _2083 = fma(_2077, _2077, _2081);
    float _2085 = sqrt(_2083);
    float _2087 = rsqrt(_2083);
    float _2089 = -_2085;
    float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2093 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2095 = precise::clamp(_2093, 0.0, 1.0);
    float _2097 = _2073 * _2087;
    float _2099 = _2069 * _2087;
    float _2101 = abs(_2095);
    float _2103 = log2(_2101);
    float _2105 = _2077 * _2087;
    float _2107 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2109 = _1290 * _2099;
    float _2111 = -_2099;
    float _2113 = -_2107;
    float _2115 = fma(_2111, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2113);
    float _2117 = fma(_1274, _2097, _2109);
    float _2119 = -_2105;
    float _2121 = fma(_2119, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2115);
    float _2123 = fma(_1292, _2105, _2117);
    float _2125 = precise::clamp(_2123, 0.0, 1.0);
    float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2129 = _2121 + _2127;
    float _2131 = _2103 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2133 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2135 = precise::clamp(_2133, 0.0, 1.0);
    float _2137 = exp2(_2131);
    float _2139 = _2137 * _2135;
    float _2141 = _2125 * _2139;
    float _2143 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2145 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2147 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _2143;
    out.m_81.y = _2145;
    out.m_81.z = _2147;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1919 = false;
    bool _1342 = false;
    bool _314 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_46.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2204 = as_type<float>(_118);
        out.gl_Position.z = _2204;
    }
    if (!_106)
    {
        return out;
    }
    float _122 = in.m_51.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = _136;
    if (_132)
    {
        float _140 = float(_102);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2274 = as_type<float>(_156);
        out.gl_Position.z = _2274;
    }
    if (_148)
    {
        return out;
    }
    float _158 = in.m_53.w;
    float _160 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_51.x;
    float _174 = in.m_51.y;
    float _176 = in.m_51.z;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _180 = in.m_46.x;
    float _182 = in.m_46.y;
    float _184 = in.m_46.z;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _188 = _178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _194 = _186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _196 = 0.0;
    float _198 = _160;
    if (!_170)
    {
        float _200 = _160 * _160;
        float _202 = _200 * 0.5;
        _196 = _202;
    }
    float _204 = _196;
    float _206 = _190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _208 = _204;
    if (!_170)
    {
        float _210 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _210;
    }
    float _212 = _208;
    bool _214 = !_170;
    float _216 = _212;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _160 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _160);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_170;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _160 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _198 = _270;
    }
    float _272 = _198;
    out.m_55.x = _188;
    out.m_55.y = _194;
    out.m_55.z = _206;
    out.m_55.w = _192;
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _276 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _278 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _282 = fma(_272, _172, _276);
    float _284 = fma(_272, _174, _278);
    float _286 = fma(_272, _176, _280);
    float _288 = fma(_282, _158, _180);
    float _290 = fma(_284, _158, _182);
    float _292 = fma(_286, _158, _184);
    bool _294 = !_274;
    float _312;
    if (!_294)
    {
        float _296 = in.m_57.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _312 = _310;
        _314 = true;
    }
    else
    {
        float _316 = float(_102);
        float _318 = 1.0 / _316;
        float _320 = _136 * _318;
        _312 = _320;
    }
    _314 = false;
    float _322 = _312;
    float _324 = in.m_57.x;
    float _326 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _328 = log2(_326);
    float _330 = in.m_57.z;
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _334 = _332 != 0;
    float _336 = in.m_57.y;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _344 = in.m_57.w;
    float _346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _348 = _324 * 2.0;
    float _350 = _340 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _352 = _330 * 2.0;
    float _354 = floor(_348);
    float _356 = _336 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _358 = _336 * 2.0;
    float _360 = fma(_356, -2.0, _342);
    float _362 = floor(_352);
    float _364 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _360);
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _368 = _354 > 0.0;
    float _370 = _324 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _372 = _354 >= 0.0;
    bool _374 = isnan(_354);
    bool _376 = _372 || _374;
    bool _378 = isnan(0.0);
    bool _380 = _376 || _378;
    float _382 = floor(_358);
    float _384 = -_338;
    float _386 = fma(_370, 2.0, _384);
    float _388 = _370;
    float _390 = _338;
    if (_334)
    {
        _388 = _324;
    }
    float _392 = _388;
    float _394 = _392;
    if (!_334)
    {
        _394 = _330;
    }
    float _396 = _394;
    if (_334)
    {
        _390 = _336;
    }
    float _398 = _390;
    int _400 = _380 ? 0 : 1;
    float _402 = _396 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _404 = _398;
    if (!_334)
    {
        _404 = _324;
    }
    float _406 = _404;
    bool _408 = _362 > 0.0;
    float _410 = -_366;
    float _412 = fma(_402, 2.0, _410);
    float _414 = _328 * _136;
    int _416 = ~_400;
    int _418 = _416 + 1;
    int _420 = _418 + 1;
    float _422 = _406 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _424 = _420;
    if (!_368)
    {
        int _426 = ~_400;
        int _428 = _426 + 1;
        _424 = _428;
    }
    int _430 = _424;
    float _432 = in.m_59.y;
    bool _434 = _362 >= 0.0;
    bool _436 = isnan(_362);
    bool _438 = _434 || _436;
    bool _440 = isnan(0.0);
    bool _442 = _438 || _440;
    float _444 = exp2(_414);
    int _446 = _442 ? 0 : 1;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _450 = _382 > 0.0;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _454 = 1.0 + _452;
    bool _456 = _382 >= 0.0;
    bool _458 = isnan(_382);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = fma(_422, -2.0, _448);
    int _468 = ~_446;
    int _470 = _468 + 1;
    int _472 = _470 + 1;
    float _474 = 1.0 / _454;
    int _476 = _472;
    if (!_408)
    {
        int _478 = ~_446;
        int _480 = _478 + 1;
        _476 = _480;
    }
    int _482 = _476;
    float _484 = -_444;
    float _486 = _484 + 1.0;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _492 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _494 = isnan(1.0);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _500 = _496 || _498;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _504 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _512 = _508 || _510;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _516 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[78].z, _488);
    float _518 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[78].w, _490);
    float _520 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[88].z, _502);
    float _522 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[88].w, _514);
    float _524 = _512 ? _486 : 0.0;
    float _526 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _516);
    float _528 = -_136;
    float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[76].x, _386);
    float _532 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _518);
    float _534 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].z, _520);
    float _536 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].w, _522);
    float _538 = -_136;
    float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[86].x, _412);
    float _542 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[86].y, _466);
    if (_500)
    {
        float _544 = _524 * _474;
        _138 = _544;
    }
    float _546 = _138;
    float _548 = -_432;
    float _550 = _548 + 1.0;
    bool _552 = _336 > 0.5;
    int _554 = _464 ? 0 : 1;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _558 = _556 != 0;
    int _560 = _552 ? as_type<int>(_550) : as_type<int>(_432);
    bool _562 = _330 > 0.5;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _566 = _564 != 0;
    float _568 = _558 ? as_type<float>(_560) : _432;
    int _570 = _562 ? as_type<int>(_550) : as_type<int>(_432);
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _574 = _572 != 0;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _578 = _576 != 0;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _582 = _580 != 0;
    int _584 = ~_554;
    int _586 = _584 + 1;
    int _588 = _586 + 1;
    int _590 = _588;
    float _592 = _432;
    if (!_450)
    {
        int _594 = ~_554;
        int _596 = _594 + 1;
        _590 = _596;
    }
    int _598 = _590;
    float _600 = _566 ? as_type<float>(_570) : _432;
    bool _602 = !_574;
    int _604 = _602 ? 0 : 1;
    bool _606 = !_578;
    int _608 = _606 ? 0 : 1;
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _612 = _610 != 0;
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _616 = _614 != 0;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _624 = _622 != 0;
    int _626 = abs(_604);
    int _628 = abs(_608);
    float _630 = in.m_61.x;
    float _632 = in.m_61.y;
    float _634 = in.m_61.z;
    bool _636 = !_582;
    int _638 = _636 ? 0 : 1;
    float _640 = float(_626);
    int _642 = abs(_638);
    float _644 = float(_482);
    float _646 = in.m_53.x;
    float _648 = in.m_53.y;
    float _650 = in.m_53.z;
    float _652 = float(_430);
    float _654 = float(_642);
    float _656 = _640 * _644;
    float _658 = float(_598);
    float _660 = _290 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _662 = float(_628);
    float _664 = _656 * (-2.0);
    bool _666 = _344 > 0.5;
    float _668 = _654 * _658;
    float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _672 = _662 * _652;
    float _674 = _290 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _676 = _290 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _678 = _668 * (-2.0);
    float _680 = _672 * (-2.0);
    float _682 = fma(_664, _630, _630);
    float _684 = _324 + _336;
    float _686 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].x, _660);
    float _688 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].x, _674);
    float _690 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].x, _676);
    float _692 = fma(_678, _634, _634);
    float _694 = fma(_680, _632, _632);
    float _696 = _684 + (-1.0);
    float _698 = _336 + _330;
    float _700 = _648 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _702 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _704 = _324 + (-0.5);
    float _706 = _698 + (-1.0);
    float _708 = fma(_702, _664, _702);
    float _710 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[196].x, _682);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _716 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _718 = _650 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _720 = fma(_708, _546, _710);
    float _722 = 1.0 / _714;
    float _724 = in.m_63.x;
    float _726 = in.m_63.y;
    float _728 = in.m_63.z;
    float _730 = _336 + (-0.5);
    bool _732 = _666;
    if (_624)
    {
        float _734 = _666 ? _550 : _432;
        _592 = _734;
    }
    float _736 = _592;
    float _738 = fma(_716, _680, _716);
    if (_612)
    {
        bool _740 = _324 > 0.5;
        _732 = _740;
    }
    bool _742 = _732;
    float _744 = _324 + _330;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _750 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[196].y, _694);
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _752;
    float _756 = _744 + (-1.0);
    float _758 = 1.0 / _748;
    float _760 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].z, _686);
    float _762 = _646 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _764 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _766 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].z, _688);
    float _768 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].z, _690);
    float _770 = _754 * _722;
    float _772 = _330 + (-0.5);
    float _774 = fma(_738, _546, _750);
    float _776 = fma(_764, _678, _764);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _782 = _762 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _724);
    float _786 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[196].z, _692);
    float _788 = _720 * 0.15915493667125701904296875;
    float _790 = _780 * _758;
    float _792 = _782 * _784;
    float _794 = fma(_776, _546, _786);
    float _796 = in.m_59.x;
    float _798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _800 = _726 != 0.0;
    bool _802 = isnan(_726);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    float _810 = _774 * 0.15915493667125701904296875;
    float _812 = in.m_65.x;
    float _814 = in.m_65.y;
    float _816 = in.m_65.z;
    float _818 = _794 * 0.15915493667125701904296875;
    float _820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _728);
    float _822 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _826 = _322 + _824;
    bool _828 = _724 == 0.0;
    bool _830 = !_808;
    bool _832 = _828 && _830;
    float _834 = _788 * 6.283185482025146484375;
    float _836 = sin(_834);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _840 = _322 + _838;
    float _842 = _822 * _820;
    bool _844 = _728 == 0.0;
    bool _846 = _844 && _832;
    float _848 = fma(_770, _826, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _850 = fma(_790, _840, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _726);
    float _854 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _856 = _788 * 6.283185482025146484375;
    float _858 = cos(_856);
    float _860 = _798 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _862 = _670 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _864 = _854 * _852;
    float _866 = fma(_860, _568, -0.5);
    float _868 = _854;
    float _870 = _798;
    float _872 = _766;
    if (!_612)
    {
        _868 = _796;
    }
    float _874 = _868;
    float _876 = fma(_600, _862, -0.5);
    float _878 = _810 * 6.283185482025146484375;
    float _880 = sin(_878);
    float _882 = -_364;
    float _884 = fma(_532, _866, _882);
    float _886 = _816;
    float _888 = _814;
    float _890 = _812;
    float _892 = _874;
    if (!_846)
    {
        float _894 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[17].y, _816);
        _886 = _894;
    }
    float _896 = _886;
    if (!_846)
    {
        float _898 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[17].y, _814);
        _888 = _898;
    }
    float _900 = _888;
    if (!_612)
    {
        _870 = _874;
    }
    float _902 = _870;
    float _904 = _902;
    if (!_846)
    {
        float _906 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _812);
        _890 = _906;
    }
    float _908 = _890;
    if (_612)
    {
        _892 = _796;
    }
    float _910 = _892;
    float _912 = -_542;
    float _914 = fma(_536, _876, _912);
    float _916 = _810 * 6.283185482025146484375;
    float _918 = cos(_916);
    bool _920 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _922 = isnan(_322);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    int _932 = 0;
    float _934 = _910;
    if (_612)
    {
        float _936 = -_910;
        float _938 = _936 + 1.0;
        _932 = as_type<int>(_938);
    }
    int _940 = _932;
    int _942 = 0;
    int _944 = _940;
    if (_620)
    {
        float _946 = -_910;
        float _948 = _946 + 1.0;
        _942 = as_type<int>(_948);
    }
    int _950 = _942;
    float _952 = _818 * 6.283185482025146484375;
    float _954 = cos(_952);
    float _956 = _836 * _880;
    float _958 = _858 * _880;
    if (_612)
    {
        float _960 = _742 ? as_type<float>(_940) : _910;
        _904 = _960;
    }
    float _962 = _904;
    if (_616)
    {
        float _964 = -_910;
        float _966 = _964 + 1.0;
        _944 = as_type<int>(_966);
    }
    int _968 = _944;
    float _970 = _818 * 6.283185482025146484375;
    float _972 = sin(_970);
    float _974 = _858 * _918;
    float _976 = _836 * _918;
    float _978 = fma(_350, _962, -0.5);
    float _980 = _858 * _954;
    float _982 = _836 * _954;
    float _984 = _918 * _954;
    float _986 = _880 * _954;
    float _988 = _980 * _864;
    float _990 = _982 * _864;
    float _992 = _768 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _994 = _980 * _900;
    float _996 = fma(_972, _974, _956);
    float _998 = -_958;
    float _1000 = fma(_972, _976, _998);
    float _1002 = -_976;
    float _1004 = fma(_972, _958, _1002);
    float _1006 = -_864;
    float _1008 = _972 * _1006;
    float _1010 = fma(_996, _792, _988);
    float _1012 = fma(_972, _956, _974);
    float _1014 = fma(_1000, _792, _990);
    float _1016 = fma(_984, _792, _1008);
    float _1018 = fma(_1004, _842, _1010);
    float _1020 = _760 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1022 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1024 = isnan(_322);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1030 = _1026 || _1028;
    float _1032 = float(_1030);
    float _1034 = fma(_986, _842, _1016);
    float _1036 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1038 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1040 = fma(_1012, _842, _1014);
    bool _1042 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1044 = isnan(_322);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    float _1054 = fma(_1034, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1036);
    float _1056 = fma(_1034, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1038);
    float _1058 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1060 = -_900;
    float _1062 = _972 * _1060;
    float _1064 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1054);
    float _1066 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1056);
    float _1068 = -_930;
    float _1070 = _1068 + 1.0;
    float _1072 = fma(_1034, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1058);
    float _1074 = _1020 + _1064;
    float _1076 = _992 + _1066;
    float _1078 = _1032 * _1070;
    float _1080 = -_1032;
    float _1082 = _1080 + 1.0;
    float _1084 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1086 = _1074 + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1090 = _1076 + _1088;
    float _1092 = _992;
    float _1094 = _1074;
    float _1096 = _1076;
    if (!_620)
    {
        _1092 = _910;
    }
    float _1098 = _1092;
    float _1100 = _1052 * _1082;
    float _1102 = _1086 * _1086;
    float _1104 = _1090 * _1090;
    float _1106 = _1098;
    float _1108 = _1102;
    float _1110 = _1104;
    if (_620)
    {
        float _1112 = _552 ? as_type<float>(_950) : _910;
        _1106 = _1112;
    }
    float _1114 = _1106;
    float _1116 = _848 * _1100;
    if (_616)
    {
        float _1118 = _562 ? as_type<float>(_968) : _910;
        _934 = _1118;
    }
    float _1120 = _934;
    float _1122 = _1102 + _1104;
    float _1124 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1072);
    float _1126 = -_1052;
    float _1128 = _1126 + 1.0;
    float _1130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1132 = _982 * _900;
    float _1134 = _766 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1136 = _346 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1138 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1116);
    float _1140 = fma(_984, _908, _1062);
    float _1142 = _1134 + _1124;
    float _1144 = fma(_1136, _1114, -0.5);
    float _1146 = sqrt(_1122);
    float _1148 = fma(_850, _1078, _1138);
    float _1150 = fma(_526, _978, _530);
    float _1152 = fma(_534, _1144, _540);
    float _1154 = fma(_996, _908, _994);
    float _1156 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1148);
    float _1158 = fma(_1000, _908, _1132);
    float _1160 = fma(_986, _896, _1140);
    bool _1162 = _1146 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = _1152;
    if (!_1162)
    {
        _872 = _1142;
    }
    float _1166 = _872;
    bool _1168 = !_1162;
    float _1170 = _1166;
    if (!_1168)
    {
        float _1172 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1176 = _1146 + _1174;
        float _1178 = _1142 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1180 = rsqrt(_1122);
        float _1182 = _1176 * _1172;
        float _1184 = _1182 * 0.15915493667125701904296875;
        float _1186 = _1184 * 6.283185482025146484375;
        float _1188 = sin(_1186);
        float _1190 = _1184 * 6.283185482025146484375;
        float _1192 = cos(_1190);
        float _1194 = fma(_1188, _1178, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1196 = _1180 * _1194;
        float _1198 = _1192 + (-1.0);
        float _1200 = fma(_1086, _1196, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1202 = fma(_1090, _1196, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1204 = _1198 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1208 = _1200 + _1206;
        float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1212 = _1202 + _1210;
        float _1214 = fma(_1142, _1192, _1204);
        float _1216 = _1208 * _1208;
        float _1218 = _1212 * _1212;
        _1170 = _1214;
        _1108 = _1216;
        _1110 = _1218;
        _1094 = _1200;
        _1096 = _1202;
    }
    float _1220 = _1170;
    float _1222 = _1108;
    float _1224 = _1110;
    float _1226 = _1094;
    float _1228 = _1096;
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1232 = _1220 + _1230;
    float _1234 = fma(_1004, _896, _1154);
    float _1236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1238 = fma(_1232, _1232, _1222);
    float _1240 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1242 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1244 = _1238 + _1224;
    float _1246 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1240);
    float _1248 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1250 = fma(_1012, _896, _1158);
    float _1252 = _736 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1254 = sqrt(_1244);
    float _1256 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1242);
    float _1258 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1260 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1248);
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1268 = _1252 * _1130;
    float _1270 = _1258 * _1236;
    float _1272 = _914 + 0.5;
    float _1274 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1256);
    float _1276 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1282 = _884 + 0.5;
    float _1284 = _1152 + 0.5;
    float _1286 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1288 = _1150 + 0.5;
    float _1290 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1260);
    float _1292 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1246);
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _1294 = _1254 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1296 = isnan(_1254);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1302 = _1298 || _1300;
    out.m_69.x = _1276;
    out.m_69.y = _1278;
    out.m_69.z = _1280;
    out.m_69.w = _1286;
    out.m_71.x = _1288;
    out.m_71.y = _1282;
    out.m_71.z = _1270;
    out.m_71.w = _1268;
    out.m_73.x = _1284;
    out.m_73.y = _1272;
    float _1304 = _1228;
    float _1306 = _1272;
    if (!_1302)
    {
        _1164 = 1.0;
    }
    float _1308 = _1164;
    out.m_75.x = _1274;
    out.m_75.y = _1290;
    out.m_75.z = _1292;
    bool _1310 = !_1302;
    float _1312 = _1308;
    if (!_1310)
    {
        bool _1314 = _1254 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1316 = isnan(_1254);
        bool _1318 = _1314 || _1316;
        bool _1320 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1322 = _1318 || _1320;
        if (!_1322)
        {
            float _1324 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1326 = _1254 + _1324;
            float _1328 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1330 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1328;
            float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1334 = _1332 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1336 = 1.0 / _1330;
            float _1338 = _1326 * _1336;
            float _1340 = fma(_1338, _1334, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1312 = _1340;
            _1342 = true;
        }
        else
        {
            bool _1344 = _1254 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1346 = isnan(_1254);
            bool _1348 = _1344 || _1346;
            bool _1350 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1352 = _1348 || _1350;
            if (!_1352)
            {
                float _1354 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1356 = _1254 + _1354;
                float _1358 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1360 = _1358 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1362 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1364 = _1362 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1366 = 1.0 / _1360;
                float _1368 = _1356 * _1366;
                float _1370 = fma(_1368, _1364, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1312 = _1370;
                _1342 = true;
            }
            else
            {
                _1312 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1342 = false;
    float _1372 = _1312;
    float _1374 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1376 = _1220 + _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1380 = _1226 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1384 = _1228 + _1382;
    float _1386 = fma(_1376, _1372, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1388 = fma(_1380, _1372, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1390 = fma(_1384, _1372, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1394 = _1386 + _1392;
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1398 = _1388 + _1396;
    float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1402 = _1390 + _1400;
    float _1404 = _1394 * _1394;
    float _1406 = fma(_1398, _1398, _1404);
    float _1408 = fma(_1402, _1402, _1406);
    float _1410 = rsqrt(_1408);
    float _1412 = sqrt(_1408);
    float _1414 = _1398 * _1410;
    float _1416 = _1402 * _1410;
    float _1418 = _1394 * _1410;
    float _1420 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1422 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1424 = _1420 * _1420;
    float _1426 = _1422 * _1422;
    float _1428 = _1424 + _1426;
    float _1430 = sqrt(_1428);
    bool _1432 = _1430 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1436 = _1430 + _1434;
    float _1438 = _1268;
    float _1440 = _1428;
    float _1442 = _1436;
    float _1444 = _1420;
    if (_1432)
    {
        float _1446 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1438 = _1446;
    }
    float _1448 = _1438;
    if (_1432)
    {
        float _1450 = rsqrt(_1428);
        _1440 = _1450;
    }
    float _1452 = _1440;
    if (_1432)
    {
        float _1454 = _1436 * _1448;
        _1442 = _1454;
    }
    float _1456 = _1442;
    if (_1432)
    {
        float _1458 = _1456 * 0.15915493667125701904296875;
        _1304 = _1458;
    }
    float _1460 = _1304;
    float _1462 = _1448;
    float _1464 = _1460;
    if (_1432)
    {
        float _1466 = _1460 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        _1462 = _1468;
    }
    float _1470 = _1462;
    float _1472 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1474 = precise::max(0.0, _1472);
    float _1476 = _1276;
    float _1478 = _1472;
    float _1480 = _1474;
    if (_1432)
    {
        float _1482 = _1460 * 6.283185482025146484375;
        float _1484 = cos(_1482);
        _1476 = _1484;
    }
    float _1486 = _1476;
    float _1488 = -_1418;
    float _1490 = -_1474;
    float _1492 = fma(_1488, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1490);
    if (_1432)
    {
        float _1494 = _1492 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1478 = _1494;
    }
    float _1496 = _1478;
    float _1498 = _1470;
    float _1500 = _1496;
    if (_1432)
    {
        float _1502 = fma(_1470, _1496, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1498 = _1502;
    }
    float _1504 = _1498;
    float _1506 = _1504;
    if (!_1432)
    {
        _1500 = _1424;
    }
    float _1508 = _1500;
    float _1510 = _1508;
    float _1512 = _1486;
    if (_1432)
    {
        float _1514 = _1486 + (-1.0);
        _1480 = _1514;
    }
    float _1516 = _1480;
    float _1518 = _1516;
    if (_1432)
    {
        float _1520 = _1452 * _1504;
        _1306 = _1520;
    }
    float _1522 = _1306;
    if (!_1432)
    {
        _1506 = _1492;
    }
    float _1524 = _1506;
    float _1526 = _1524;
    if (_1432)
    {
        float _1528 = _1516 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1464 = _1528;
    }
    float _1530 = _1464;
    if (_1432)
    {
        float _1532 = _1420 * _1522;
        _1444 = _1532;
    }
    float _1534 = _1444;
    if (!_1432)
    {
        _1518 = _1422;
    }
    float _1536 = _1518;
    float _1538 = _1536;
    if (_1432)
    {
        float _1540 = _1422 * _1522;
        _1538 = _1540;
    }
    float _1542 = _1538;
    if (_1432)
    {
        float _1544 = fma(_1492, _1486, _1530);
        _1526 = _1544;
    }
    float _1546 = _1526;
    if (_1432)
    {
        float _1548 = _1534 * _1534;
        _1510 = _1548;
    }
    float _1550 = _1510;
    if (!_1432)
    {
        _1512 = _1426;
    }
    float _1552 = _1512;
    float _1554 = _1552;
    if (_1432)
    {
        float _1556 = _1542 * _1542;
        _1554 = _1556;
    }
    float _1558 = _1554;
    float _1560 = fma(_1546, _1546, _1550);
    float _1562 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1564 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1566 = _1560 + _1558;
    float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1570 = fma(_1412, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1568);
    float _1572 = precise::clamp(_1570, 0.0, 1.0);
    float _1574 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1562);
    float _1576 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1578 = rsqrt(_1566);
    float _1580 = -_1572;
    float _1582 = _1580 + 1.0;
    float _1584 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1574);
    float _1586 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1588 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1576);
    float _1590 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1592 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1594 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1586);
    float _1596 = abs(_1582);
    float _1598 = log2(_1596);
    float _1600 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1588);
    float _1602 = _1592 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1604 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1564);
    float _1606 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1594);
    float _1608 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1610 = -_1602;
    float _1612 = fma(_1610, _1590, 1.0);
    float _1614 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1604);
    float _1616 = _1578 * _1534;
    float _1618 = _1606 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1620 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1622 = _1578 * _1546;
    float _1624 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1626 = _1578 * _1542;
    float _1628 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1620);
    float _1630 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1632 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1634 = -_1624;
    float _1636 = fma(_1622, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1634);
    float _1638 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1628);
    float _1640 = log2(_1612);
    float _1642 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1644 = -_1626;
    float _1646 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1636);
    float _1648 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1638);
    float _1650 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1652 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1642);
    float _1654 = fma(_1646, -0.5, 0.5);
    float _1656 = fma(_1646, 0.5, 0.5);
    float _1658 = exp2(_1632);
    float _1660 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1650);
    float _1662 = _1622 + 1.0;
    float _1664 = fma(_1656, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1666 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1652);
    float _1668 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1660);
    float _1670 = fma(_1656, _1664, -0.212114393711090087890625);
    float _1672 = 1.0 / _1648;
    float _1674 = _1640 * 0.693147182464599609375;
    float _1676 = fma(_1656, _1670, 1.570728778839111328125);
    float _1678 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1680 = sqrt(_1654);
    float _1682 = -_1622;
    float _1684 = fma(_1658, _1662, _1682);
    float _1686 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1668);
    float _1688 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1666);
    float _1690 = fma(_1684, 0.5, 0.5);
    float _1692 = _1686 * _1672;
    float _1694 = _1688 * _1672;
    float _1696 = fma(_1692, 0.5, 0.5);
    float _1698 = fma(_1694, -0.5, 0.5);
    float _1700 = _1680 * 0.636619746685028076171875;
    float3 _4801 = float3(_1696, _1698, _1678);
    float _1702 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4801, float3(0.0), isnan(_4801)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4801, float3(0.0), isnan(_4801)), level(0.0)).x;
    float3 _4812 = float3(_1696, _1698, _1678);
    float4 _1705 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4812, float3(0.0), isnan(_4812)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4812, float3(0.0), isnan(_4812)), level(0.0)).xyzw;
    float _1707 = _1705.x;
    float _1709 = _1705.y;
    float _1711 = _1705.z;
    float _1713 = _1705.w;
    float _1715 = -_1676;
    float _1717 = fma(_1700, _1715, 1.0);
    float2 _4834 = float2(_1717, _1690);
    float3 _1721 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4834, float2(0.0), isnan(_4834)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4834, float2(0.0), isnan(_4834)), level(0.0)).xyz;
    float _1723 = _1721.x;
    float _1725 = _1721.y;
    float _1727 = _1721.z;
    float _1729 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1731 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1733 = _1290 * _1418;
    float _1735 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1731);
    float _1737 = exp2(_1729);
    float _1739 = fma(_1274, _1414, _1733);
    float _1741 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1735);
    bool _1743 = _1412 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1745 = isnan(_1412);
    bool _1747 = _1743 || _1745;
    bool _1749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1751 = _1747 || _1749;
    float _1753 = fma(_1292, _1416, _1739);
    float _1755 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1741);
    float _1757 = abs(_1753);
    float _1759 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1761 = _1757 + _1759;
    float _1763 = _1755 + _1648;
    out.gl_Position.x = _1686;
    out.gl_Position.y = _1688;
    out.gl_Position.z = _1755;
    out.gl_Position.w = _1648;
    float _1765 = _1763 * 0.5;
    float _1767 = -_1737;
    float _1769 = _1767 + 1.0;
    float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1773 = _1771 + (*spvDescriptorSet0.vp_c9)._m0[139].w;
    float _1775 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _1765;
    out.m_77.w = _1648;
    float _1777 = 1.0 / _1773;
    float _1779 = _1648;
    float _1781 = _1755;
    float _1783 = _1688;
    if (!_1751)
    {
        _1779 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1785 = _1779;
    float _1787 = _1785;
    float _1789 = _1785;
    if (!_1751)
    {
        _1781 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1791 = _1781;
    float _1793 = _1791;
    float _1795 = _1791;
    if (!_1751)
    {
        _1783 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1797 = _1783;
    float _1799 = _1761 * _1777;
    float _1801 = precise::clamp(_1799, 0.0, 1.0);
    float _1803 = _1777;
    float _1805 = _1797;
    float _1807 = _1797;
    if (!_1751)
    {
        _1803 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1809 = _1803;
    float _1811 = fma(_1801, -2.0, 3.0);
    float _1813 = _1801 * _1801;
    float _1815 = _1811 * _1813;
    float _1817 = _1811;
    float _1819 = _1809;
    float _1821 = _1809;
    if (!_1751)
    {
        _1817 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1823 = _1817;
    float _1825 = _1815 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1827 = _1775 * _1702;
    float _1829 = -_1775;
    float _1831 = _1829 + 1.0;
    float _1833 = _1713 * _1827;
    float _1835 = _1727 * _1827;
    float _1837 = fma(_1723, _1833, _1707);
    float _1839 = fma(_1725, _1833, _1709);
    float _1841 = _1713 * _1831;
    float _1843 = fma(_1713, _1835, _1711);
    float _1845 = _1833;
    float _1847 = _1823;
    float _1849 = _1823;
    if (!_1751)
    {
        _1845 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1851 = _1845;
    out.m_79.x = _1837;
    out.m_79.y = _1839;
    out.m_79.z = _1843;
    out.m_79.w = _1841;
    bool _1853 = !_1751;
    float _1855 = _1851;
    float _1857 = _1851;
    if (!_1853)
    {
        bool _1859 = _1412 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1861 = isnan(_1412);
        bool _1863 = _1859 || _1861;
        bool _1865 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1867 = _1863 || _1865;
        if (!_1867)
        {
            float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1871 = _1412 + _1869;
            float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1875 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1873;
            float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1879 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1881 = 1.0 / _1875;
            float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1889 = _1887 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1899 = _1871 * _1881;
            float _1901 = precise::clamp(_1899, 0.0, 1.0);
            float _1903 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1905 = _1903 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1907 = fma(_1901, _1879, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1909 = fma(_1901, _1905, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1911 = fma(_1901, _1885, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1913 = fma(_1901, _1889, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1915 = fma(_1901, _1893, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1917 = fma(_1901, _1897, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1821 = _1911;
            _1807 = _1915;
            _1857 = _1907;
            _1795 = _1913;
            _1789 = _1909;
            _1849 = _1917;
            _1919 = true;
        }
        else
        {
            bool _1921 = _1412 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1923 = isnan(_1412);
            bool _1925 = _1921 || _1923;
            bool _1927 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1929 = _1925 || _1927;
            if (!_1929)
            {
                _1855 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1931 = _1855;
            _1857 = _1931;
            if (!_1929)
            {
                _1819 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1933 = _1819;
            _1821 = _1933;
            if (!_1929)
            {
                _1787 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1935 = _1787;
            _1789 = _1935;
            if (!_1929)
            {
                _1793 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1937 = _1793;
            _1795 = _1937;
            if (!_1929)
            {
                _1805 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1939 = _1805;
            _1807 = _1939;
            if (!_1929)
            {
                _1847 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1941 = _1847;
            bool _1943 = !_1929;
            _1849 = _1941;
            if (!_1943)
            {
                bool _1945 = _1412 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1947 = isnan(_1412);
                bool _1949 = _1945 || _1947;
                bool _1951 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1953 = _1949 || _1951;
                if (!_1953)
                {
                    float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1957 = _1412 + _1955;
                    float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1961 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1959;
                    float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1967 = 1.0 / _1961;
                    float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1971 = _1969 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1975 = _1973 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1979 = _1977 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1985 = _1957 * _1967;
                    float _1987 = precise::clamp(_1985, 0.0, 1.0);
                    float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1991 = _1989 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1993 = fma(_1987, _1965, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1995 = fma(_1987, _1991, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1997 = fma(_1987, _1971, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1999 = fma(_1987, _1975, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2001 = fma(_1987, _1979, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2003 = fma(_1987, _1983, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1821 = _1997;
                    _1807 = _2001;
                    _1857 = _1993;
                    _1795 = _1999;
                    _1789 = _1995;
                    _1849 = _2003;
                    _1919 = true;
                }
                else
                {
                    _1821 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1807 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1857 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1795 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1789 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1849 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1919 = false;
    float _2005 = _1821;
    float _2007 = _1807;
    float _2009 = _1857;
    float _2011 = _1795;
    float _2013 = _1789;
    float _2015 = _1849;
    float _2017 = fma(_1290, -0.5, 0.5);
    float _2019 = precise::clamp(_2017, 0.0, 1.0);
    float _2021 = -_2005;
    float _2023 = _2021 + _2007;
    float _2025 = -_2009;
    float _2027 = _2025 + _2011;
    float _2029 = -_2013;
    float _2031 = _2029 + _2015;
    bool _2033 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2035 = fma(_2019, _2023, _2005);
    float _2037 = fma(_2019, _2027, _2009);
    float _2039 = fma(_2019, _2031, _2013);
    float _2041 = _1825 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2043 = _2035 * 0.586610972881317138671875;
    out.m_81.x = 0.0;
    float _2045 = fma(_2037, 0.298911988735198974609375, _2043);
    out.m_49.x = _2041;
    float _2047 = fma(_2039, 0.114477999508380889892578125, _2045);
    float _2049 = -_2047;
    float _2051 = _2037 + _2049;
    float _2053 = -_2047;
    float _2055 = _2035 + _2053;
    float _2057 = -_2047;
    float _2059 = _2039 + _2057;
    float _2061 = fma(_2051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2047);
    float _2063 = fma(_2055, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2047);
    float _2065 = fma(_2059, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2047);
    out.m_83.x = _2061;
    out.m_83.y = _2063;
    out.m_83.z = _2065;
    if (!_2033)
    {
        return out;
    }
    float _2067 = -_1386;
    float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2071 = -_1388;
    float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2075 = -_1390;
    float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2079 = _2069 * _2069;
    float _2081 = fma(_2073, _2073, _2079);
    float _2083 = fma(_2077, _2077, _2081);
    float _2085 = sqrt(_2083);
    float _2087 = rsqrt(_2083);
    float _2089 = -_2085;
    float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2093 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2095 = precise::clamp(_2093, 0.0, 1.0);
    float _2097 = _2073 * _2087;
    float _2099 = _2069 * _2087;
    float _2101 = abs(_2095);
    float _2103 = log2(_2101);
    float _2105 = _2077 * _2087;
    float _2107 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2109 = _1290 * _2099;
    float _2111 = -_2099;
    float _2113 = -_2107;
    float _2115 = fma(_2111, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2113);
    float _2117 = fma(_1274, _2097, _2109);
    float _2119 = -_2105;
    float _2121 = fma(_2119, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2115);
    float _2123 = fma(_1292, _2105, _2117);
    float _2125 = precise::clamp(_2123, 0.0, 1.0);
    float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2129 = _2121 + _2127;
    float _2131 = _2103 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2133 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2135 = precise::clamp(_2133, 0.0, 1.0);
    float _2137 = exp2(_2131);
    float _2139 = _2137 * _2135;
    float _2141 = _2125 * _2139;
    float _2143 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2145 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2147 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _2143;
    out.m_81.y = _2145;
    out.m_81.z = _2147;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1919 = false;
    bool _1342 = false;
    bool _314 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_46.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2204 = as_type<float>(_118);
        out.gl_Position.z = _2204;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_51.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = _136;
    if (_132)
    {
        float _140 = float(_102);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2274 = as_type<float>(_156);
        out.gl_Position.z = _2274;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_53.w;
    float _160 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_51.x;
    float _174 = in.m_51.y;
    float _176 = in.m_51.z;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _180 = in.m_46.x;
    float _182 = in.m_46.y;
    float _184 = in.m_46.z;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _188 = _178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _194 = _186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _196 = 0.0;
    float _198 = _160;
    if (!_170)
    {
        float _200 = _160 * _160;
        float _202 = _200 * 0.5;
        _196 = _202;
    }
    float _204 = _196;
    float _206 = _190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _208 = _204;
    if (!_170)
    {
        float _210 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _210;
    }
    float _212 = _208;
    bool _214 = !_170;
    float _216 = _212;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _160 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _160);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_170;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _160 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _198 = _270;
    }
    float _272 = _198;
    out.m_55.x = _188;
    out.m_55.y = _194;
    out.m_55.z = _206;
    out.m_55.w = _192;
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _276 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _278 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _282 = fma(_272, _172, _276);
    float _284 = fma(_272, _174, _278);
    float _286 = fma(_272, _176, _280);
    float _288 = fma(_282, _158, _180);
    float _290 = fma(_284, _158, _182);
    float _292 = fma(_286, _158, _184);
    bool _294 = !_274;
    float _312;
    if (!_294)
    {
        float _296 = in.m_57.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _312 = _310;
        _314 = true;
    }
    else
    {
        float _316 = float(_102);
        float _318 = 1.0 / _316;
        float _320 = _136 * _318;
        _312 = _320;
    }
    _314 = false;
    float _322 = _312;
    float _324 = in.m_57.x;
    float _326 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _328 = log2(_326);
    float _330 = in.m_57.z;
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _334 = _332 != 0;
    float _336 = in.m_57.y;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _344 = in.m_57.w;
    float _346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _348 = _324 * 2.0;
    float _350 = _340 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _352 = _330 * 2.0;
    float _354 = floor(_348);
    float _356 = _336 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _358 = _336 * 2.0;
    float _360 = fma(_356, -2.0, _342);
    float _362 = floor(_352);
    float _364 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _360);
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _368 = _354 > 0.0;
    float _370 = _324 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _372 = _354 >= 0.0;
    bool _374 = isnan(_354);
    bool _376 = _372 || _374;
    bool _378 = isnan(0.0);
    bool _380 = _376 || _378;
    float _382 = floor(_358);
    float _384 = -_338;
    float _386 = fma(_370, 2.0, _384);
    float _388 = _370;
    float _390 = _338;
    if (_334)
    {
        _388 = _324;
    }
    float _392 = _388;
    float _394 = _392;
    if (!_334)
    {
        _394 = _330;
    }
    float _396 = _394;
    if (_334)
    {
        _390 = _336;
    }
    float _398 = _390;
    int _400 = _380 ? 0 : 1;
    float _402 = _396 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _404 = _398;
    if (!_334)
    {
        _404 = _324;
    }
    float _406 = _404;
    bool _408 = _362 > 0.0;
    float _410 = -_366;
    float _412 = fma(_402, 2.0, _410);
    float _414 = _328 * _136;
    int _416 = ~_400;
    int _418 = _416 + 1;
    int _420 = _418 + 1;
    float _422 = _406 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _424 = _420;
    if (!_368)
    {
        int _426 = ~_400;
        int _428 = _426 + 1;
        _424 = _428;
    }
    int _430 = _424;
    float _432 = in.m_59.y;
    bool _434 = _362 >= 0.0;
    bool _436 = isnan(_362);
    bool _438 = _434 || _436;
    bool _440 = isnan(0.0);
    bool _442 = _438 || _440;
    float _444 = exp2(_414);
    int _446 = _442 ? 0 : 1;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _450 = _382 > 0.0;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _454 = 1.0 + _452;
    bool _456 = _382 >= 0.0;
    bool _458 = isnan(_382);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = fma(_422, -2.0, _448);
    int _468 = ~_446;
    int _470 = _468 + 1;
    int _472 = _470 + 1;
    float _474 = 1.0 / _454;
    int _476 = _472;
    if (!_408)
    {
        int _478 = ~_446;
        int _480 = _478 + 1;
        _476 = _480;
    }
    int _482 = _476;
    float _484 = -_444;
    float _486 = _484 + 1.0;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _492 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _494 = isnan(1.0);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _500 = _496 || _498;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _504 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _512 = _508 || _510;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _516 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[78].z, _488);
    float _518 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[78].w, _490);
    float _520 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[88].z, _502);
    float _522 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[88].w, _514);
    float _524 = _512 ? _486 : 0.0;
    float _526 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _516);
    float _528 = -_136;
    float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[76].x, _386);
    float _532 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _518);
    float _534 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].z, _520);
    float _536 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].w, _522);
    float _538 = -_136;
    float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[86].x, _412);
    float _542 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[86].y, _466);
    if (_500)
    {
        float _544 = _524 * _474;
        _138 = _544;
    }
    float _546 = _138;
    float _548 = -_432;
    float _550 = _548 + 1.0;
    bool _552 = _336 > 0.5;
    int _554 = _464 ? 0 : 1;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _558 = _556 != 0;
    int _560 = _552 ? as_type<int>(_550) : as_type<int>(_432);
    bool _562 = _330 > 0.5;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _566 = _564 != 0;
    float _568 = _558 ? as_type<float>(_560) : _432;
    int _570 = _562 ? as_type<int>(_550) : as_type<int>(_432);
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _574 = _572 != 0;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _578 = _576 != 0;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _582 = _580 != 0;
    int _584 = ~_554;
    int _586 = _584 + 1;
    int _588 = _586 + 1;
    int _590 = _588;
    float _592 = _432;
    if (!_450)
    {
        int _594 = ~_554;
        int _596 = _594 + 1;
        _590 = _596;
    }
    int _598 = _590;
    float _600 = _566 ? as_type<float>(_570) : _432;
    bool _602 = !_574;
    int _604 = _602 ? 0 : 1;
    bool _606 = !_578;
    int _608 = _606 ? 0 : 1;
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _612 = _610 != 0;
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _616 = _614 != 0;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _624 = _622 != 0;
    int _626 = abs(_604);
    int _628 = abs(_608);
    float _630 = in.m_61.x;
    float _632 = in.m_61.y;
    float _634 = in.m_61.z;
    bool _636 = !_582;
    int _638 = _636 ? 0 : 1;
    float _640 = float(_626);
    int _642 = abs(_638);
    float _644 = float(_482);
    float _646 = in.m_53.x;
    float _648 = in.m_53.y;
    float _650 = in.m_53.z;
    float _652 = float(_430);
    float _654 = float(_642);
    float _656 = _640 * _644;
    float _658 = float(_598);
    float _660 = _290 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _662 = float(_628);
    float _664 = _656 * (-2.0);
    bool _666 = _344 > 0.5;
    float _668 = _654 * _658;
    float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _672 = _662 * _652;
    float _674 = _290 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _676 = _290 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _678 = _668 * (-2.0);
    float _680 = _672 * (-2.0);
    float _682 = fma(_664, _630, _630);
    float _684 = _324 + _336;
    float _686 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].x, _660);
    float _688 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].x, _674);
    float _690 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].x, _676);
    float _692 = fma(_678, _634, _634);
    float _694 = fma(_680, _632, _632);
    float _696 = _684 + (-1.0);
    float _698 = _336 + _330;
    float _700 = _648 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _702 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _704 = _324 + (-0.5);
    float _706 = _698 + (-1.0);
    float _708 = fma(_702, _664, _702);
    float _710 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[196].x, _682);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _716 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _718 = _650 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _720 = fma(_708, _546, _710);
    float _722 = 1.0 / _714;
    float _724 = in.m_63.x;
    float _726 = in.m_63.y;
    float _728 = in.m_63.z;
    float _730 = _336 + (-0.5);
    bool _732 = _666;
    if (_624)
    {
        float _734 = _666 ? _550 : _432;
        _592 = _734;
    }
    float _736 = _592;
    float _738 = fma(_716, _680, _716);
    if (_612)
    {
        bool _740 = _324 > 0.5;
        _732 = _740;
    }
    bool _742 = _732;
    float _744 = _324 + _330;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _750 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[196].y, _694);
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _752;
    float _756 = _744 + (-1.0);
    float _758 = 1.0 / _748;
    float _760 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].z, _686);
    float _762 = _646 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _764 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _766 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].z, _688);
    float _768 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].z, _690);
    float _770 = _754 * _722;
    float _772 = _330 + (-0.5);
    float _774 = fma(_738, _546, _750);
    float _776 = fma(_764, _678, _764);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _782 = _762 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _724);
    float _786 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[196].z, _692);
    float _788 = _720 * 0.15915493667125701904296875;
    float _790 = _780 * _758;
    float _792 = _782 * _784;
    float _794 = fma(_776, _546, _786);
    float _796 = in.m_59.x;
    float _798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _800 = _726 != 0.0;
    bool _802 = isnan(_726);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    float _810 = _774 * 0.15915493667125701904296875;
    float _812 = in.m_65.x;
    float _814 = in.m_65.y;
    float _816 = in.m_65.z;
    float _818 = _794 * 0.15915493667125701904296875;
    float _820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _728);
    float _822 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _826 = _322 + _824;
    bool _828 = _724 == 0.0;
    bool _830 = !_808;
    bool _832 = _828 && _830;
    float _834 = _788 * 6.283185482025146484375;
    float _836 = sin(_834);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _840 = _322 + _838;
    float _842 = _822 * _820;
    bool _844 = _728 == 0.0;
    bool _846 = _844 && _832;
    float _848 = fma(_770, _826, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _850 = fma(_790, _840, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _726);
    float _854 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _856 = _788 * 6.283185482025146484375;
    float _858 = cos(_856);
    float _860 = _798 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _862 = _670 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _864 = _854 * _852;
    float _866 = fma(_860, _568, -0.5);
    float _868 = _854;
    float _870 = _798;
    float _872 = _766;
    if (!_612)
    {
        _868 = _796;
    }
    float _874 = _868;
    float _876 = fma(_600, _862, -0.5);
    float _878 = _810 * 6.283185482025146484375;
    float _880 = sin(_878);
    float _882 = -_364;
    float _884 = fma(_532, _866, _882);
    float _886 = _816;
    float _888 = _814;
    float _890 = _812;
    float _892 = _874;
    if (!_846)
    {
        float _894 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[17].y, _816);
        _886 = _894;
    }
    float _896 = _886;
    if (!_846)
    {
        float _898 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[17].y, _814);
        _888 = _898;
    }
    float _900 = _888;
    if (!_612)
    {
        _870 = _874;
    }
    float _902 = _870;
    float _904 = _902;
    if (!_846)
    {
        float _906 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _812);
        _890 = _906;
    }
    float _908 = _890;
    if (_612)
    {
        _892 = _796;
    }
    float _910 = _892;
    float _912 = -_542;
    float _914 = fma(_536, _876, _912);
    float _916 = _810 * 6.283185482025146484375;
    float _918 = cos(_916);
    bool _920 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _922 = isnan(_322);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    int _932 = 0;
    float _934 = _910;
    if (_612)
    {
        float _936 = -_910;
        float _938 = _936 + 1.0;
        _932 = as_type<int>(_938);
    }
    int _940 = _932;
    int _942 = 0;
    int _944 = _940;
    if (_620)
    {
        float _946 = -_910;
        float _948 = _946 + 1.0;
        _942 = as_type<int>(_948);
    }
    int _950 = _942;
    float _952 = _818 * 6.283185482025146484375;
    float _954 = cos(_952);
    float _956 = _836 * _880;
    float _958 = _858 * _880;
    if (_612)
    {
        float _960 = _742 ? as_type<float>(_940) : _910;
        _904 = _960;
    }
    float _962 = _904;
    if (_616)
    {
        float _964 = -_910;
        float _966 = _964 + 1.0;
        _944 = as_type<int>(_966);
    }
    int _968 = _944;
    float _970 = _818 * 6.283185482025146484375;
    float _972 = sin(_970);
    float _974 = _858 * _918;
    float _976 = _836 * _918;
    float _978 = fma(_350, _962, -0.5);
    float _980 = _858 * _954;
    float _982 = _836 * _954;
    float _984 = _918 * _954;
    float _986 = _880 * _954;
    float _988 = _980 * _864;
    float _990 = _982 * _864;
    float _992 = _768 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _994 = _980 * _900;
    float _996 = fma(_972, _974, _956);
    float _998 = -_958;
    float _1000 = fma(_972, _976, _998);
    float _1002 = -_976;
    float _1004 = fma(_972, _958, _1002);
    float _1006 = -_864;
    float _1008 = _972 * _1006;
    float _1010 = fma(_996, _792, _988);
    float _1012 = fma(_972, _956, _974);
    float _1014 = fma(_1000, _792, _990);
    float _1016 = fma(_984, _792, _1008);
    float _1018 = fma(_1004, _842, _1010);
    float _1020 = _760 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1022 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1024 = isnan(_322);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1030 = _1026 || _1028;
    float _1032 = float(_1030);
    float _1034 = fma(_986, _842, _1016);
    float _1036 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1038 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1040 = fma(_1012, _842, _1014);
    bool _1042 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1044 = isnan(_322);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    float _1054 = fma(_1034, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1036);
    float _1056 = fma(_1034, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1038);
    float _1058 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1060 = -_900;
    float _1062 = _972 * _1060;
    float _1064 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1054);
    float _1066 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1056);
    float _1068 = -_930;
    float _1070 = _1068 + 1.0;
    float _1072 = fma(_1034, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1058);
    float _1074 = _1020 + _1064;
    float _1076 = _992 + _1066;
    float _1078 = _1032 * _1070;
    float _1080 = -_1032;
    float _1082 = _1080 + 1.0;
    float _1084 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1086 = _1074 + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1090 = _1076 + _1088;
    float _1092 = _992;
    float _1094 = _1074;
    float _1096 = _1076;
    if (!_620)
    {
        _1092 = _910;
    }
    float _1098 = _1092;
    float _1100 = _1052 * _1082;
    float _1102 = _1086 * _1086;
    float _1104 = _1090 * _1090;
    float _1106 = _1098;
    float _1108 = _1102;
    float _1110 = _1104;
    if (_620)
    {
        float _1112 = _552 ? as_type<float>(_950) : _910;
        _1106 = _1112;
    }
    float _1114 = _1106;
    float _1116 = _848 * _1100;
    if (_616)
    {
        float _1118 = _562 ? as_type<float>(_968) : _910;
        _934 = _1118;
    }
    float _1120 = _934;
    float _1122 = _1102 + _1104;
    float _1124 = fma(_1040, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1072);
    float _1126 = -_1052;
    float _1128 = _1126 + 1.0;
    float _1130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1132 = _982 * _900;
    float _1134 = _766 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1136 = _346 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1138 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1116);
    float _1140 = fma(_984, _908, _1062);
    float _1142 = _1134 + _1124;
    float _1144 = fma(_1136, _1114, -0.5);
    float _1146 = sqrt(_1122);
    float _1148 = fma(_850, _1078, _1138);
    float _1150 = fma(_526, _978, _530);
    float _1152 = fma(_534, _1144, _540);
    float _1154 = fma(_996, _908, _994);
    float _1156 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1148);
    float _1158 = fma(_1000, _908, _1132);
    float _1160 = fma(_986, _896, _1140);
    bool _1162 = _1146 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = _1152;
    if (!_1162)
    {
        _872 = _1142;
    }
    float _1166 = _872;
    bool _1168 = !_1162;
    float _1170 = _1166;
    if (!_1168)
    {
        float _1172 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1176 = _1146 + _1174;
        float _1178 = _1142 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1180 = rsqrt(_1122);
        float _1182 = _1176 * _1172;
        float _1184 = _1182 * 0.15915493667125701904296875;
        float _1186 = _1184 * 6.283185482025146484375;
        float _1188 = sin(_1186);
        float _1190 = _1184 * 6.283185482025146484375;
        float _1192 = cos(_1190);
        float _1194 = fma(_1188, _1178, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1196 = _1180 * _1194;
        float _1198 = _1192 + (-1.0);
        float _1200 = fma(_1086, _1196, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1202 = fma(_1090, _1196, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1204 = _1198 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1208 = _1200 + _1206;
        float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1212 = _1202 + _1210;
        float _1214 = fma(_1142, _1192, _1204);
        float _1216 = _1208 * _1208;
        float _1218 = _1212 * _1212;
        _1170 = _1214;
        _1108 = _1216;
        _1110 = _1218;
        _1094 = _1200;
        _1096 = _1202;
    }
    float _1220 = _1170;
    float _1222 = _1108;
    float _1224 = _1110;
    float _1226 = _1094;
    float _1228 = _1096;
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1232 = _1220 + _1230;
    float _1234 = fma(_1004, _896, _1154);
    float _1236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1238 = fma(_1232, _1232, _1222);
    float _1240 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1242 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1244 = _1238 + _1224;
    float _1246 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1240);
    float _1248 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1250 = fma(_1012, _896, _1158);
    float _1252 = _736 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1254 = sqrt(_1244);
    float _1256 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1242);
    float _1258 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1260 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1248);
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1268 = _1252 * _1130;
    float _1270 = _1258 * _1236;
    float _1272 = _914 + 0.5;
    float _1274 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1256);
    float _1276 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1282 = _884 + 0.5;
    float _1284 = _1152 + 0.5;
    float _1286 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1288 = _1150 + 0.5;
    float _1290 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1260);
    float _1292 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1246);
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _1294 = _1254 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1296 = isnan(_1254);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1302 = _1298 || _1300;
    out.m_69.x = _1276;
    out.m_69.y = _1278;
    out.m_69.z = _1280;
    out.m_69.w = _1286;
    out.m_71.x = _1288;
    out.m_71.y = _1282;
    out.m_71.z = _1270;
    out.m_71.w = _1268;
    out.m_73.x = _1284;
    out.m_73.y = _1272;
    float _1304 = _1228;
    float _1306 = _1272;
    if (!_1302)
    {
        _1164 = 1.0;
    }
    float _1308 = _1164;
    out.m_75.x = _1274;
    out.m_75.y = _1290;
    out.m_75.z = _1292;
    bool _1310 = !_1302;
    float _1312 = _1308;
    if (!_1310)
    {
        bool _1314 = _1254 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1316 = isnan(_1254);
        bool _1318 = _1314 || _1316;
        bool _1320 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1322 = _1318 || _1320;
        if (!_1322)
        {
            float _1324 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1326 = _1254 + _1324;
            float _1328 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1330 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1328;
            float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1334 = _1332 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1336 = 1.0 / _1330;
            float _1338 = _1326 * _1336;
            float _1340 = fma(_1338, _1334, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1312 = _1340;
            _1342 = true;
        }
        else
        {
            bool _1344 = _1254 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1346 = isnan(_1254);
            bool _1348 = _1344 || _1346;
            bool _1350 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1352 = _1348 || _1350;
            if (!_1352)
            {
                float _1354 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1356 = _1254 + _1354;
                float _1358 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1360 = _1358 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1362 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1364 = _1362 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1366 = 1.0 / _1360;
                float _1368 = _1356 * _1366;
                float _1370 = fma(_1368, _1364, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1312 = _1370;
                _1342 = true;
            }
            else
            {
                _1312 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1342 = false;
    float _1372 = _1312;
    float _1374 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1376 = _1220 + _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1380 = _1226 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1384 = _1228 + _1382;
    float _1386 = fma(_1376, _1372, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1388 = fma(_1380, _1372, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1390 = fma(_1384, _1372, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1394 = _1386 + _1392;
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1398 = _1388 + _1396;
    float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1402 = _1390 + _1400;
    float _1404 = _1394 * _1394;
    float _1406 = fma(_1398, _1398, _1404);
    float _1408 = fma(_1402, _1402, _1406);
    float _1410 = rsqrt(_1408);
    float _1412 = sqrt(_1408);
    float _1414 = _1398 * _1410;
    float _1416 = _1402 * _1410;
    float _1418 = _1394 * _1410;
    float _1420 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1422 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1424 = _1420 * _1420;
    float _1426 = _1422 * _1422;
    float _1428 = _1424 + _1426;
    float _1430 = sqrt(_1428);
    bool _1432 = _1430 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1436 = _1430 + _1434;
    float _1438 = _1268;
    float _1440 = _1428;
    float _1442 = _1436;
    float _1444 = _1420;
    if (_1432)
    {
        float _1446 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1438 = _1446;
    }
    float _1448 = _1438;
    if (_1432)
    {
        float _1450 = rsqrt(_1428);
        _1440 = _1450;
    }
    float _1452 = _1440;
    if (_1432)
    {
        float _1454 = _1436 * _1448;
        _1442 = _1454;
    }
    float _1456 = _1442;
    if (_1432)
    {
        float _1458 = _1456 * 0.15915493667125701904296875;
        _1304 = _1458;
    }
    float _1460 = _1304;
    float _1462 = _1448;
    float _1464 = _1460;
    if (_1432)
    {
        float _1466 = _1460 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        _1462 = _1468;
    }
    float _1470 = _1462;
    float _1472 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1474 = precise::max(0.0, _1472);
    float _1476 = _1276;
    float _1478 = _1472;
    float _1480 = _1474;
    if (_1432)
    {
        float _1482 = _1460 * 6.283185482025146484375;
        float _1484 = cos(_1482);
        _1476 = _1484;
    }
    float _1486 = _1476;
    float _1488 = -_1418;
    float _1490 = -_1474;
    float _1492 = fma(_1488, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1490);
    if (_1432)
    {
        float _1494 = _1492 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1478 = _1494;
    }
    float _1496 = _1478;
    float _1498 = _1470;
    float _1500 = _1496;
    if (_1432)
    {
        float _1502 = fma(_1470, _1496, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1498 = _1502;
    }
    float _1504 = _1498;
    float _1506 = _1504;
    if (!_1432)
    {
        _1500 = _1424;
    }
    float _1508 = _1500;
    float _1510 = _1508;
    float _1512 = _1486;
    if (_1432)
    {
        float _1514 = _1486 + (-1.0);
        _1480 = _1514;
    }
    float _1516 = _1480;
    float _1518 = _1516;
    if (_1432)
    {
        float _1520 = _1452 * _1504;
        _1306 = _1520;
    }
    float _1522 = _1306;
    if (!_1432)
    {
        _1506 = _1492;
    }
    float _1524 = _1506;
    float _1526 = _1524;
    if (_1432)
    {
        float _1528 = _1516 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1464 = _1528;
    }
    float _1530 = _1464;
    if (_1432)
    {
        float _1532 = _1420 * _1522;
        _1444 = _1532;
    }
    float _1534 = _1444;
    if (!_1432)
    {
        _1518 = _1422;
    }
    float _1536 = _1518;
    float _1538 = _1536;
    if (_1432)
    {
        float _1540 = _1422 * _1522;
        _1538 = _1540;
    }
    float _1542 = _1538;
    if (_1432)
    {
        float _1544 = fma(_1492, _1486, _1530);
        _1526 = _1544;
    }
    float _1546 = _1526;
    if (_1432)
    {
        float _1548 = _1534 * _1534;
        _1510 = _1548;
    }
    float _1550 = _1510;
    if (!_1432)
    {
        _1512 = _1426;
    }
    float _1552 = _1512;
    float _1554 = _1552;
    if (_1432)
    {
        float _1556 = _1542 * _1542;
        _1554 = _1556;
    }
    float _1558 = _1554;
    float _1560 = fma(_1546, _1546, _1550);
    float _1562 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1564 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1566 = _1560 + _1558;
    float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1570 = fma(_1412, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1568);
    float _1572 = precise::clamp(_1570, 0.0, 1.0);
    float _1574 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1562);
    float _1576 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1578 = rsqrt(_1566);
    float _1580 = -_1572;
    float _1582 = _1580 + 1.0;
    float _1584 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1574);
    float _1586 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1588 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1576);
    float _1590 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1592 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1594 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1586);
    float _1596 = abs(_1582);
    float _1598 = log2(_1596);
    float _1600 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1588);
    float _1602 = _1592 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1604 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1564);
    float _1606 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1594);
    float _1608 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1610 = -_1602;
    float _1612 = fma(_1610, _1590, 1.0);
    float _1614 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1604);
    float _1616 = _1578 * _1534;
    float _1618 = _1606 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1620 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1622 = _1578 * _1546;
    float _1624 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1626 = _1578 * _1542;
    float _1628 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1620);
    float _1630 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1632 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1634 = -_1624;
    float _1636 = fma(_1622, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1634);
    float _1638 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1628);
    float _1640 = log2(_1612);
    float _1642 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1644 = -_1626;
    float _1646 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1636);
    float _1648 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1638);
    float _1650 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1652 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1642);
    float _1654 = fma(_1646, -0.5, 0.5);
    float _1656 = fma(_1646, 0.5, 0.5);
    float _1658 = exp2(_1632);
    float _1660 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1650);
    float _1662 = _1622 + 1.0;
    float _1664 = fma(_1656, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1666 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1652);
    float _1668 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1660);
    float _1670 = fma(_1656, _1664, -0.212114393711090087890625);
    float _1672 = 1.0 / _1648;
    float _1674 = _1640 * 0.693147182464599609375;
    float _1676 = fma(_1656, _1670, 1.570728778839111328125);
    float _1678 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1680 = sqrt(_1654);
    float _1682 = -_1622;
    float _1684 = fma(_1658, _1662, _1682);
    float _1686 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1668);
    float _1688 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1666);
    float _1690 = fma(_1684, 0.5, 0.5);
    float _1692 = _1686 * _1672;
    float _1694 = _1688 * _1672;
    float _1696 = fma(_1692, 0.5, 0.5);
    float _1698 = fma(_1694, -0.5, 0.5);
    float _1700 = _1680 * 0.636619746685028076171875;
    float3 _4801 = float3(_1696, _1698, _1678);
    float _1702 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4801, float3(0.0), isnan(_4801)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4801, float3(0.0), isnan(_4801)), level(0.0)).x;
    float3 _4812 = float3(_1696, _1698, _1678);
    float4 _1705 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4812, float3(0.0), isnan(_4812)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4812, float3(0.0), isnan(_4812)), level(0.0)).xyzw;
    float _1707 = _1705.x;
    float _1709 = _1705.y;
    float _1711 = _1705.z;
    float _1713 = _1705.w;
    float _1715 = -_1676;
    float _1717 = fma(_1700, _1715, 1.0);
    float2 _4834 = float2(_1717, _1690);
    float3 _1721 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4834, float2(0.0), isnan(_4834)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4834, float2(0.0), isnan(_4834)), level(0.0)).xyz;
    float _1723 = _1721.x;
    float _1725 = _1721.y;
    float _1727 = _1721.z;
    float _1729 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1731 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1733 = _1290 * _1418;
    float _1735 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1731);
    float _1737 = exp2(_1729);
    float _1739 = fma(_1274, _1414, _1733);
    float _1741 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1735);
    bool _1743 = _1412 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1745 = isnan(_1412);
    bool _1747 = _1743 || _1745;
    bool _1749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1751 = _1747 || _1749;
    float _1753 = fma(_1292, _1416, _1739);
    float _1755 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1741);
    float _1757 = abs(_1753);
    float _1759 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1761 = _1757 + _1759;
    float _1763 = _1755 + _1648;
    out.gl_Position.x = _1686;
    out.gl_Position.y = _1688;
    out.gl_Position.z = _1755;
    out.gl_Position.w = _1648;
    float _1765 = _1763 * 0.5;
    float _1767 = -_1737;
    float _1769 = _1767 + 1.0;
    float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1773 = _1771 + (*spvDescriptorSet0.vp_c9)._m0[139].w;
    float _1775 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _1765;
    out.m_77.w = _1648;
    float _1777 = 1.0 / _1773;
    float _1779 = _1648;
    float _1781 = _1755;
    float _1783 = _1688;
    if (!_1751)
    {
        _1779 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1785 = _1779;
    float _1787 = _1785;
    float _1789 = _1785;
    if (!_1751)
    {
        _1781 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1791 = _1781;
    float _1793 = _1791;
    float _1795 = _1791;
    if (!_1751)
    {
        _1783 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1797 = _1783;
    float _1799 = _1761 * _1777;
    float _1801 = precise::clamp(_1799, 0.0, 1.0);
    float _1803 = _1777;
    float _1805 = _1797;
    float _1807 = _1797;
    if (!_1751)
    {
        _1803 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1809 = _1803;
    float _1811 = fma(_1801, -2.0, 3.0);
    float _1813 = _1801 * _1801;
    float _1815 = _1811 * _1813;
    float _1817 = _1811;
    float _1819 = _1809;
    float _1821 = _1809;
    if (!_1751)
    {
        _1817 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1823 = _1817;
    float _1825 = _1815 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1827 = _1775 * _1702;
    float _1829 = -_1775;
    float _1831 = _1829 + 1.0;
    float _1833 = _1713 * _1827;
    float _1835 = _1727 * _1827;
    float _1837 = fma(_1723, _1833, _1707);
    float _1839 = fma(_1725, _1833, _1709);
    float _1841 = _1713 * _1831;
    float _1843 = fma(_1713, _1835, _1711);
    float _1845 = _1833;
    float _1847 = _1823;
    float _1849 = _1823;
    if (!_1751)
    {
        _1845 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1851 = _1845;
    out.m_79.x = _1837;
    out.m_79.y = _1839;
    out.m_79.z = _1843;
    out.m_79.w = _1841;
    bool _1853 = !_1751;
    float _1855 = _1851;
    float _1857 = _1851;
    if (!_1853)
    {
        bool _1859 = _1412 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1861 = isnan(_1412);
        bool _1863 = _1859 || _1861;
        bool _1865 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1867 = _1863 || _1865;
        if (!_1867)
        {
            float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1871 = _1412 + _1869;
            float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1875 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1873;
            float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1879 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1881 = 1.0 / _1875;
            float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1889 = _1887 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1899 = _1871 * _1881;
            float _1901 = precise::clamp(_1899, 0.0, 1.0);
            float _1903 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1905 = _1903 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1907 = fma(_1901, _1879, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1909 = fma(_1901, _1905, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1911 = fma(_1901, _1885, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1913 = fma(_1901, _1889, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1915 = fma(_1901, _1893, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1917 = fma(_1901, _1897, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1821 = _1911;
            _1807 = _1915;
            _1857 = _1907;
            _1795 = _1913;
            _1789 = _1909;
            _1849 = _1917;
            _1919 = true;
        }
        else
        {
            bool _1921 = _1412 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1923 = isnan(_1412);
            bool _1925 = _1921 || _1923;
            bool _1927 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1929 = _1925 || _1927;
            if (!_1929)
            {
                _1855 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1931 = _1855;
            _1857 = _1931;
            if (!_1929)
            {
                _1819 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1933 = _1819;
            _1821 = _1933;
            if (!_1929)
            {
                _1787 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1935 = _1787;
            _1789 = _1935;
            if (!_1929)
            {
                _1793 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1937 = _1793;
            _1795 = _1937;
            if (!_1929)
            {
                _1805 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1939 = _1805;
            _1807 = _1939;
            if (!_1929)
            {
                _1847 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1941 = _1847;
            bool _1943 = !_1929;
            _1849 = _1941;
            if (!_1943)
            {
                bool _1945 = _1412 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1947 = isnan(_1412);
                bool _1949 = _1945 || _1947;
                bool _1951 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1953 = _1949 || _1951;
                if (!_1953)
                {
                    float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1957 = _1412 + _1955;
                    float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1961 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1959;
                    float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1967 = 1.0 / _1961;
                    float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1971 = _1969 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1975 = _1973 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1979 = _1977 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1985 = _1957 * _1967;
                    float _1987 = precise::clamp(_1985, 0.0, 1.0);
                    float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1991 = _1989 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1993 = fma(_1987, _1965, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1995 = fma(_1987, _1991, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1997 = fma(_1987, _1971, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1999 = fma(_1987, _1975, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2001 = fma(_1987, _1979, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2003 = fma(_1987, _1983, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1821 = _1997;
                    _1807 = _2001;
                    _1857 = _1993;
                    _1795 = _1999;
                    _1789 = _1995;
                    _1849 = _2003;
                    _1919 = true;
                }
                else
                {
                    _1821 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1807 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1857 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1795 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1789 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1849 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1919 = false;
    float _2005 = _1821;
    float _2007 = _1807;
    float _2009 = _1857;
    float _2011 = _1795;
    float _2013 = _1789;
    float _2015 = _1849;
    float _2017 = fma(_1290, -0.5, 0.5);
    float _2019 = precise::clamp(_2017, 0.0, 1.0);
    float _2021 = -_2005;
    float _2023 = _2021 + _2007;
    float _2025 = -_2009;
    float _2027 = _2025 + _2011;
    float _2029 = -_2013;
    float _2031 = _2029 + _2015;
    bool _2033 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2035 = fma(_2019, _2023, _2005);
    float _2037 = fma(_2019, _2027, _2009);
    float _2039 = fma(_2019, _2031, _2013);
    float _2041 = _1825 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2043 = _2035 * 0.586610972881317138671875;
    out.m_81.x = 0.0;
    float _2045 = fma(_2037, 0.298911988735198974609375, _2043);
    out.m_49.x = _2041;
    float _2047 = fma(_2039, 0.114477999508380889892578125, _2045);
    float _2049 = -_2047;
    float _2051 = _2037 + _2049;
    float _2053 = -_2047;
    float _2055 = _2035 + _2053;
    float _2057 = -_2047;
    float _2059 = _2039 + _2057;
    float _2061 = fma(_2051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2047);
    float _2063 = fma(_2055, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2047);
    float _2065 = fma(_2059, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2047);
    out.m_83.x = _2061;
    out.m_83.y = _2063;
    out.m_83.z = _2065;
    if (!_2033)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2067 = -_1386;
    float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2071 = -_1388;
    float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2075 = -_1390;
    float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2079 = _2069 * _2069;
    float _2081 = fma(_2073, _2073, _2079);
    float _2083 = fma(_2077, _2077, _2081);
    float _2085 = sqrt(_2083);
    float _2087 = rsqrt(_2083);
    float _2089 = -_2085;
    float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2093 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2095 = precise::clamp(_2093, 0.0, 1.0);
    float _2097 = _2073 * _2087;
    float _2099 = _2069 * _2087;
    float _2101 = abs(_2095);
    float _2103 = log2(_2101);
    float _2105 = _2077 * _2087;
    float _2107 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2109 = _1290 * _2099;
    float _2111 = -_2099;
    float _2113 = -_2107;
    float _2115 = fma(_2111, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2113);
    float _2117 = fma(_1274, _2097, _2109);
    float _2119 = -_2105;
    float _2121 = fma(_2119, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2115);
    float _2123 = fma(_1292, _2105, _2117);
    float _2125 = precise::clamp(_2123, 0.0, 1.0);
    float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2129 = _2121 + _2127;
    float _2131 = _2103 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2133 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2135 = precise::clamp(_2133, 0.0, 1.0);
    float _2137 = exp2(_2131);
    float _2139 = _2137 * _2135;
    float _2141 = _2125 * _2139;
    float _2143 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2145 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2147 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _2143;
    out.m_81.y = _2145;
    out.m_81.z = _2147;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

