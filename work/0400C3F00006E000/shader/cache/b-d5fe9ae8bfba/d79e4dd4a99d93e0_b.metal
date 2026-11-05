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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_69 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_73 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_49 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _326 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2785 = as_type<float>(_116);
        out.gl_Position.z = _2785;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_100);
        _110 = _136;
    }
    float _138 = _110;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2854 = as_type<float>(_152);
        out.gl_Position.z = _2854;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_49.y;
    float _156 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = in.m_42.x;
    float _176 = in.m_42.y;
    float _178 = in.m_42.z;
    float _180 = in.m_51.x;
    float _182 = in.m_51.y;
    float _184 = in.m_51.z;
    float _186 = in.m_51.w;
    float _188 = 0.0;
    float _190 = _156;
    if (!_166)
    {
        float _192 = _156 * _156;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_166)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_166;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _156 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _156);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_166;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _156 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    out.m_53.y = _154;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = _184 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = fma(_262, _168, _266);
    float _276 = fma(_262, _170, _268);
    float _278 = fma(_262, _172, _270);
    float _280 = fma(_274, _186, _174);
    float _282 = fma(_276, _186, _176);
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _286 = fma(_278, _186, _178);
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _290 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _294 = _182 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _296 = _284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _298 = _288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _300 = _292 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _302 = !_264;
    float _304 = _296;
    int _306 = as_type<int>(_298);
    float _324;
    if (!_302)
    {
        float _308 = in.m_55.x;
        float _310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _312 = _308 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[11].z, _134);
        float _316 = _314 * _310;
        float _318 = floor(_316);
        float _320 = -_318;
        float _322 = _316 + _320;
        _324 = _322;
        _326 = true;
    }
    else
    {
        float _328 = float(_100);
        float _330 = 1.0 / _328;
        float _332 = _134 * _330;
        _324 = _332;
    }
    _326 = false;
    float _334 = _324;
    float _336 = _282 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _338 = _282 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _340 = _282 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _342 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].x, _336);
    float _344 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].x, _338);
    float _346 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].x, _340);
    float _348 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].z, _342);
    float _350 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].z, _344);
    float _352 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].z, _346);
    float _354 = _348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _356 = _350 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _358 = _352 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _360 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _362 = -_354;
    float _364 = _362 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _366 = -_356;
    float _368 = _366 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _370 = -_358;
    float _372 = _370 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _374 = _364 * _364;
    float _376 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _378 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _380 = fma(_368, _368, _374);
    float _382 = -_360;
    float _384 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _382);
    float _386 = in.m_55.z;
    float _388 = 1.0 / _294;
    float _390 = fma(_372, _372, _380);
    float _392 = rsqrt(_390);
    float _394 = _294 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _396 = _368 * _392;
    float _398 = _372 * _392;
    float _400 = _364 * _392;
    float _402 = _396 * _396;
    float _404 = fma(_398, _398, _402);
    float _406 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _408 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _410 = rsqrt(_404);
    float _412 = -_406;
    float _414 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _412);
    float _416 = -_408;
    float _418 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _416);
    float _420 = -_376;
    float _422 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _420);
    float _424 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _426 = _414 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _428 = -_424;
    float _430 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _428);
    float _432 = -_378;
    float _434 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _432);
    float _436 = _418 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _438 = -_426;
    float _440 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[1].y, _438);
    float _442 = _418 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _444 = _434 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _446 = -_436;
    float _448 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[1].x, _446);
    float _450 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[1].w, _440);
    float _452 = _398 * _410;
    float _454 = _396 * _410;
    float _456 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[1].w, _448);
    float _458 = -_442;
    float _460 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[1].x, _458);
    float _462 = -_452;
    float _464 = _398 * _462;
    float _466 = -_452;
    float _468 = _400 * _466;
    float _470 = _456 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _472 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[1].w, _460);
    float _474 = -_464;
    float _476 = fma(_396, _454, _474);
    float _478 = _400 * _454;
    float _480 = -_470;
    float _482 = fma(_450, (*spvDescriptorSet0.vp_c8)._m0[0].x, _480);
    float _484 = -_444;
    float _486 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _484);
    float _488 = _476 * _476;
    float _490 = _418 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _492 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[0].z, _482);
    float _494 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[1].z, _486);
    float _496 = fma(_478, _478, _488);
    float _498 = -_490;
    float _500 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[0].x, _498);
    float _502 = _414 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _504 = -_494;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[0].w, _492);
    float _508 = fma(_468, _468, _496);
    float _510 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[0].w, _500);
    float _512 = -_502;
    float _514 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[0].y, _512);
    float _516 = 1.0 / _506;
    float _518 = _418 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _520 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[0].w, _514);
    float _522 = -_518;
    float _524 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[0].x, _522);
    float _526 = rsqrt(_508);
    float _528 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[0].w, _524);
    float _530 = fma(_510, _516, -1.0);
    float _532 = _476 * _526;
    float _534 = precise::clamp(_532, 0.0, 1.0);
    float _536 = 1.0 / _272;
    float _538 = -_534;
    float _540 = _538 + 1.0;
    float _542 = _540 * _516;
    float _544 = fma(_540, _530, 1.0);
    float _546 = _520 * _542;
    float _548 = _544 * _544;
    float _550 = _528 * _542;
    float _552 = 1.0 / _290;
    float _554 = fma(_546, _546, _548);
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _558 = _358 + _556;
    float _560 = fma(_550, _550, _554);
    float _562 = rsqrt(_560);
    float _564 = _550 * _562;
    float _566 = _546 * _562;
    float _568 = _544 * _562;
    float _570 = -_564;
    float _572 = _396 * _570;
    float _574 = _398 * _568;
    float _576 = -_566;
    float _578 = -_572;
    float _580 = fma(_398, _576, _578);
    float _582 = -_566;
    float _584 = _400 * _582;
    float _586 = -_564;
    float _588 = -_574;
    float _590 = fma(_400, _586, _588);
    float _592 = _580 * _580;
    float _594 = -_584;
    float _596 = fma(_396, _568, _594);
    float _598 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _600 = _354 + _598;
    float _602 = fma(_590, _590, _592);
    float _604 = _600 * _600;
    float _606 = fma(_596, _596, _602);
    float _608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _610 = _356 + _608;
    float _612 = fma(_610, _610, _604);
    float _614 = rsqrt(_606);
    float _616 = fma(_558, _558, _612);
    float _618 = _590 * _614;
    float _620 = _596 * _614;
    float _622 = _580 * _614;
    float _624 = _398 * _618;
    float _626 = _400 * _620;
    float _628 = -_624;
    float _630 = fma(_396, _620, _628);
    float _632 = -_626;
    float _634 = fma(_398, _622, _632);
    float _636 = _396 * _622;
    float _638 = rsqrt(_616);
    float _640 = _630 * _630;
    float _642 = -_636;
    float _644 = fma(_400, _618, _642);
    float _646 = fma(_634, _634, _640);
    float _648 = fma(_644, _644, _646);
    float _650 = rsqrt(_648);
    float _652 = _600 * _638;
    float _654 = _610 * _638;
    float _656 = _558 * _638;
    float _658 = -_652;
    float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[18].w, _600);
    float _662 = -_654;
    float _664 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[18].w, _610);
    float _666 = -_656;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _670 = -_654;
    float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[18].w, _356);
    float _674 = _660 * _660;
    float _676 = fma(_664, _664, _674);
    float _678 = _644 * _650;
    float _680 = _634 * _650;
    float _682 = _630 * _650;
    float _684 = fma(_668, _668, _676);
    float _686 = _396 * _678;
    float _688 = _400 * _680;
    float _690 = _398 * _682;
    float _692 = -_686;
    float _694 = fma(_398, _680, _692);
    float _696 = -_688;
    float _698 = fma(_396, _682, _696);
    float _700 = in.m_57.x;
    float _702 = in.m_57.y;
    float _704 = in.m_57.z;
    float _706 = -_690;
    float _708 = fma(_400, _678, _706);
    float _710 = _694 * _694;
    float _712 = sqrt(_684);
    float _714 = fma(_708, _708, _710);
    float _716 = in.m_55.x;
    float _718 = fma(_698, _698, _714);
    float _720 = rsqrt(_718);
    float _722 = _552 * _700;
    float _724 = _388 * _702;
    float _726 = _638 * _712;
    float _728 = _536 * _704;
    float _730 = _290 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _732 = _386 * 6.283185482025146484375;
    float _734 = _272 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _724);
    float _738 = _726 * _394;
    float _740 = _708 * _720;
    float _742 = _694 * _720;
    float _744 = _698 * _720;
    float _746 = fma(_134, 0.310000002384185791015625, _732);
    float _748 = _726 * _730;
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _722);
    float _752 = _738 * _736;
    float _754 = _716 * 6.283185482025146484375;
    float _756 = _746 * 0.15915493667125701904296875;
    float _758 = _726 * _734;
    float _760 = _748 * _750;
    float _762 = _752 * _682;
    float _764 = fma(_134, 0.10999999940395355224609375, _754);
    float _766 = _752 * _680;
    float _768 = _752 * _678;
    float _770 = _728 * _758;
    float _772 = fma(_760, _742, _762);
    float _774 = _764 * 0.15915493667125701904296875;
    float _776 = fma(_760, _740, _766);
    float _778 = _756 * 6.283185482025146484375;
    float _780 = sin(_778);
    float _782 = fma(_770, _400, _772);
    float _784 = fma(_760, _744, _768);
    float _786 = fma(_770, _396, _776);
    float _788 = _782 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _790 = fma(_770, _398, _784);
    float _792 = _782 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _794 = _774 * 6.283185482025146484375;
    float _796 = sin(_794);
    float _798 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].z, _788);
    float _800 = _782 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _802 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].y, _792);
    float _804 = _354 + _782;
    float _806 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].z, _798);
    float _808 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].x, _800);
    float _810 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].y, _802);
    float _812 = fma(_780, 0.12999999523162841796875, 1.0);
    float _814 = _758 * _806;
    float _816 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].x, _808);
    float _818 = _738 * _810;
    float _820 = _358 + _790;
    float _822 = _814 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _824 = _748 * _816;
    float _826 = _814 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _828 = fma(_796, 0.300000011920928955078125, _812);
    float _830 = -_154;
    float _832 = fma(_830, 0.5, 0.5);
    float _834 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[10].y, _822);
    float _836 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[8].y, _826);
    float _838 = _356 + _786;
    float _840 = _828 * _832;
    float _842 = fma(_824, (*spvDescriptorSet0.vp_c10)._m0[10].x, _834);
    float _844 = _738 * _840;
    float _846 = _844 * 2.0;
    float _848 = fma(_824, (*spvDescriptorSet0.vp_c10)._m0[8].x, _836);
    float _850 = _820 + _842;
    float _852 = _838 + _848;
    float _854 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[32].z, _850);
    float _856 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[32].x, _852);
    float _858 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _860 = _854 + _858;
    float _862 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _864 = _856 + _862;
    float _866 = _860 * _860;
    float _868 = fma(_864, _864, _866);
    float _870 = _814 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _872 = sqrt(_868);
    float _874 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[9].y, _870);
    float _876 = fma(_824, (*spvDescriptorSet0.vp_c10)._m0[9].x, _874);
    float _878 = _804 + _876;
    float _880 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[32].y, _878);
    bool _882 = _872 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _886 = _884 != 0;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _890 = _888 != 0;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _894 = _892 != 0;
    bool _896 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _898 = isnan(0.5);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _904 = _900 || _902;
    bool _906 = !_890;
    int _908 = _906 ? 0 : 1;
    bool _910 = !_886;
    int _912 = _910 ? 0 : 1;
    bool _914 = !_894;
    int _916 = _914 ? 0 : 1;
    float _918 = _824;
    float _920 = _878;
    float _922 = _876;
    float _924 = _856;
    float _926 = _814;
    float _928 = _758;
    bool _930 = false;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _934 = _722;
    if (!_882)
    {
        _918 = _856;
    }
    float _936 = _918;
    float _938 = _936;
    if (!_882)
    {
        _920 = _854;
    }
    float _940 = _920;
    float _942 = _940;
    if (!_882)
    {
        _922 = _880;
    }
    float _944 = _922;
    bool _946 = !_882;
    float _948 = _944;
    if (!_946)
    {
        float _950 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _952 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _954 = _872 + _952;
        float _956 = rsqrt(_868);
        float _958 = _954 * _950;
        float _960 = _880 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _962 = _958 * 0.15915493667125701904296875;
        float _964 = _962 * 6.283185482025146484375;
        float _966 = cos(_964);
        float _968 = _962 * 6.283185482025146484375;
        float _970 = sin(_968);
        float _972 = _966 + (-1.0);
        float _974 = _972 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _976 = fma(_970, _960, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _978 = fma(_880, _966, _974);
        float _980 = _956 * _976;
        float _982 = fma(_864, _980, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _984 = fma(_860, _980, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _948 = _978;
        _942 = _984;
        _938 = _982;
        _924 = _956;
    }
    float _986 = _948;
    float _988 = _942;
    float _990 = _938;
    float _992 = _924;
    float _994 = -_652;
    float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _986);
    float _998 = -_656;
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[18].w, _988);
    float _1002 = -_654;
    float _1004 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[18].w, _990);
    float _1006 = -_652;
    float _1008 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[18].w, _354);
    float _1010 = -_656;
    float _1012 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[18].w, _358);
    float _1014 = _996;
    float _1016 = _1004;
    float _1018 = _1000;
    float _1020 = _992;
    if (!_904)
    {
        float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1024 = _1008 + _1022;
        float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1028 = _672 + _1026;
        float _1030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1032 = -_356;
        float _1034 = _1032 + _990;
        float _1036 = _1024 * _1024;
        float _1038 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1040 = _1012 + _1038;
        float _1042 = -_354;
        float _1044 = _1042 + _986;
        float _1046 = -_358;
        float _1048 = _1046 + _988;
        float _1050 = fma(_1028, _1028, _1036);
        float _1052 = fma(_1040, _1040, _1050);
        float _1054 = 1.0 / _726;
        float _1056 = sqrt(_1052);
        float _1058 = precise::min(_1056, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1060 = _1058 * _1030;
        float _1062 = _1060 * _1054;
        float _1064 = fma(_1034, _1062, _672);
        float _1066 = fma(_1044, _1062, _1008);
        float _1068 = fma(_1048, _1062, _1012);
        _1014 = _1066;
        _1016 = _1064;
        _1018 = _1068;
        _926 = _1030;
        _1020 = _1056;
    }
    float _1070 = _1014;
    float _1072 = _1016;
    float _1074 = _1018;
    float _1076 = _926;
    float _1078 = _1020;
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1082 = _1070 + _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1072 + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1090 = _1074 + _1088;
    float _1092 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1094 = _1082 * _1082;
    float _1096 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1092);
    float _1098 = fma(_1086, _1086, _1094);
    float _1100 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1096);
    float _1102 = fma(_1090, _1090, _1098);
    float _1104 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1106 = rsqrt(_1102);
    float _1108 = sqrt(_1102);
    float _1110 = _1106 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1112 = _1086 * _1110;
    float _1114 = _1090 * _1110;
    float _1116 = _1112 * _1112;
    float _1118 = _1114 * _1114;
    float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1122 = fma(_1108, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1120);
    float _1124 = precise::clamp(_1122, 0.0, 1.0);
    float _1126 = _1116 + _1118;
    float _1128 = -_1124;
    float _1130 = _1128 + 1.0;
    float _1132 = sqrt(_1126);
    bool _1134 = _1132 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1138 = _1132 + _1136;
    float _1140 = _1098;
    float _1142 = _1078;
    float _1144 = _1138;
    float _1146 = _1076;
    float _1148 = _1112;
    if (_1134)
    {
        float _1150 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1140 = _1150;
    }
    float _1152 = _1140;
    if (_1134)
    {
        float _1154 = rsqrt(_1126);
        _1142 = _1154;
    }
    float _1156 = _1142;
    float _1158 = _1156;
    if (_1134)
    {
        float _1160 = _1138 * _1152;
        _1144 = _1160;
    }
    float _1162 = _1144;
    if (_1134)
    {
        float _1164 = _1162 * 0.15915493667125701904296875;
        _1146 = _1164;
    }
    float _1166 = _1146;
    float _1168 = _1152;
    if (_1134)
    {
        float _1170 = _1166 * 6.283185482025146484375;
        float _1172 = sin(_1170);
        _1168 = _1172;
    }
    float _1174 = _1168;
    float _1176 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1178 = precise::max(0.0, _1176);
    float _1180 = _990;
    float _1182 = _1178;
    if (_1134)
    {
        float _1184 = _1166 * 6.283185482025146484375;
        float _1186 = cos(_1184);
        _1180 = _1186;
    }
    float _1188 = _1180;
    float _1190 = -_1110;
    float _1192 = -_1178;
    float _1194 = fma(_1082, _1190, _1192);
    if (_1134)
    {
        float _1196 = _1194 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1182 = _1196;
    }
    float _1198 = _1182;
    float _1200 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1202 = _1174;
    float _1204 = _1198;
    if (_1134)
    {
        float _1206 = fma(_1174, _1198, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1202 = _1206;
    }
    float _1208 = _1202;
    float _1210 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1200);
    float _1212 = _1208;
    float _1214 = _1188;
    if (_1134)
    {
        float _1216 = _1188 + (-1.0);
        _1204 = _1216;
    }
    float _1218 = _1204;
    float _1220 = _1218;
    if (_1134)
    {
        float _1222 = _1156 * _1208;
        _928 = _1222;
    }
    float _1224 = _928;
    if (!_1134)
    {
        _1212 = _1194;
    }
    float _1226 = _1212;
    float _1228 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1210);
    float _1230 = _1226;
    if (_1134)
    {
        float _1232 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1158 = _1232;
    }
    float _1234 = _1158;
    float _1236 = _1234;
    if (_1134)
    {
        float _1238 = _1112 * _1224;
        _1148 = _1238;
    }
    float _1240 = _1148;
    if (!_1134)
    {
        _1220 = _1114;
    }
    float _1242 = _1220;
    float _1244 = _1242;
    if (_1134)
    {
        float _1246 = _1114 * _1224;
        _1244 = _1246;
    }
    float _1248 = _1244;
    if (_1134)
    {
        float _1250 = fma(_1194, _1188, _1234);
        _1230 = _1250;
    }
    float _1252 = _1230;
    if (!_1134)
    {
        _1236 = _1116;
    }
    float _1254 = _1236;
    float _1256 = _1254;
    if (_1134)
    {
        float _1258 = _1240 * _1240;
        _1256 = _1258;
    }
    float _1260 = _1256;
    float _1262 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1134)
    {
        _1214 = _1118;
    }
    float _1264 = _1214;
    float _1266 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1268 = _1264;
    if (_1134)
    {
        float _1270 = _1248 * _1248;
        _1268 = _1270;
    }
    float _1272 = _1268;
    float _1274 = fma(_1252, _1252, _1260);
    float _1276 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1262);
    float _1278 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1266);
    float _1280 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1282 = _1274 + _1272;
    float _1284 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1276);
    float _1286 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1278);
    float _1288 = abs(_1130);
    float _1290 = log2(_1288);
    float _1292 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1294 = _1286 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1296 = _1104 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1298 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1300 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1302 = rsqrt(_1282);
    float _1304 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1298);
    float _1306 = -_1296;
    float _1308 = fma(_1306, _1300, 1.0);
    float _1310 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1304);
    float _1312 = log2(_1308);
    float _1314 = _1302 * _1240;
    float _1316 = _1302 * _1252;
    float _1318 = _1302 * _1248;
    float _1320 = _1290 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1322 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1324 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1310);
    float _1326 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1328 = _1316 + 1.0;
    float _1330 = -_1322;
    float _1332 = fma(_1316, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1330);
    float _1334 = 1.0 / _1324;
    float _1336 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1326);
    float _1338 = -_1318;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1332);
    float _1342 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1344 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1336);
    float _1346 = fma(_1340, -0.5, 0.5);
    float _1348 = exp2(_1320);
    float _1350 = fma(_1340, 0.5, 0.5);
    float _1352 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1342);
    float _1354 = fma(_1350, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1356 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1352);
    float _1358 = sqrt(_1346);
    float _1360 = fma(_1350, _1354, -0.212114393711090087890625);
    float _1362 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1356);
    float _1364 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1344);
    float _1366 = _1312 * 0.693147182464599609375;
    float _1368 = fma(_1350, _1360, 1.570728778839111328125);
    float _1370 = _1362 * _1334;
    float _1372 = _1364 * _1334;
    float _1374 = -_1316;
    float _1376 = fma(_1348, _1328, _1374);
    float _1378 = _1366 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1380 = fma(_1370, 0.5, 0.5);
    float _1382 = fma(_1372, -0.5, 0.5);
    float _1384 = fma(_1376, 0.5, 0.5);
    float _1386 = _1358 * 0.636619746685028076171875;
    float _1388 = -_1368;
    float _1390 = fma(_1386, _1388, 1.0);
    float3 _4872 = float3(_1380, _1382, _1378);
    float _1392 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4872, float3(0.0), isnan(_4872)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4872, float3(0.0), isnan(_4872)), level(0.0)).x;
    float3 _4883 = float3(_1380, _1382, _1378);
    float4 _1395 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4883, float3(0.0), isnan(_4883)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4883, float3(0.0), isnan(_4883)), level(0.0)).xyzw;
    float _1397 = _1395.x;
    float _1399 = _1395.y;
    float _1401 = _1395.z;
    float _1403 = _1395.w;
    float2 _4900 = float2(_1390, _1384);
    float3 _1407 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4900, float2(0.0), isnan(_4900)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4900, float2(0.0), isnan(_4900)), level(0.0)).xyz;
    float _1409 = _1407.x;
    float _1411 = _1407.y;
    float _1413 = _1407.z;
    float _1415 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1417 = int(_1415);
    float _1419 = in.m_55.y;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1423 = _1421 != 0;
    float _1425 = _1290 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1429 = _1427 != 0;
    out.m_59.x = _296;
    out.m_59.y = _298;
    out.m_59.z = _300;
    int _1431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1433 = _1431 != 0;
    float _1435 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1437 = int(_1435);
    bool _1439 = _386 > 0.5;
    float _1441 = in.m_61.w;
    out.m_63.x = _1086;
    out.m_63.y = _1082;
    out.m_63.z = _1090;
    float _1443 = exp2(_1425);
    float _1445 = float(_1417);
    float _1447 = in.m_49.x;
    float _1449 = _1419;
    if (_1429)
    {
        bool _1451 = _716 > 0.5;
        _930 = _1451;
    }
    bool _1453 = _930;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1457 = 1.0 / _1445;
    float _1459 = float(uint(_1437));
    int _1461 = ~_1437;
    int _1463 = _1461 + 1;
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1465;
    int _1469 = ~_1437;
    int _1471 = _1469 + 1;
    float _1473 = float(_1437);
    float _1475 = 1.0 / _1459;
    out.m_65.w = _1441;
    int _1477 = abs(_916);
    float _1479 = _134 * _1473;
    float _1481 = -_1443;
    float _1483 = _1481 + 1.0;
    float _1485 = _134 * _1457;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1489 = _334 + _1487;
    float _1491 = trunc(_1485);
    int _1493 = int(_1491);
    int _1495 = as_type<int>(_1475) + (-2);
    float _1497 = float(uint(_1493));
    float _1499 = float(_1493);
    float _1501 = as_type<float>(_1495) * _1497;
    float _1503 = trunc(_1501);
    float _1505 = precise::max(_1503, 0.0);
    uint _1508 = uint(_1505);
    int _1510 = _1463 * int(_1508);
    int _1512 = _1510 + _1493;
    float _1514 = float(uint(_1512));
    float _1516 = as_type<float>(_1495) * _1514;
    float _1518 = _1514;
    int _1520 = _1463;
    if (!_1429)
    {
        _1518 = _1447;
    }
    float _1522 = _1518;
    float _1524 = _1522;
    if (!_1429)
    {
        _932 = _1522;
    }
    float _1526 = _932;
    float _1528 = trunc(_1516);
    float _1530 = precise::max(_1528, 0.0);
    uint _1532 = uint(_1530);
    float _1534 = _1526;
    if (_1429)
    {
        _1524 = _1447;
    }
    float _1536 = _1524;
    if (!_1433)
    {
        _304 = _1536;
    }
    float _1538 = _304;
    float _1540 = _1538;
    if (_1429)
    {
        float _1542 = -_1536;
        float _1544 = _1542 + 1.0;
        _306 = as_type<int>(_1544);
    }
    int _1546 = _306;
    int _1548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1550 = _1548 != 0;
    if (_1433)
    {
        float _1552 = -_1536;
        float _1554 = _1552 + 1.0;
        _1520 = as_type<int>(_1554);
    }
    int _1556 = _1520;
    float _1558 = in.m_55.w;
    if (_1429)
    {
        float _1560 = _1453 ? as_type<float>(_1546) : _1536;
        _1534 = _1560;
    }
    float _1562 = _1534;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    if (_1433)
    {
        float _1568 = _1439 ? as_type<float>(_1556) : _1536;
        _1540 = _1568;
    }
    float _1570 = _1540;
    int _1572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1574 = _1572 != 0;
    float _1576 = 1.0 / _1566;
    int _1578 = int(_1508) + int(_1532);
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1580;
    float _1584 = -_154;
    float _1586 = _1584 + 1.0;
    bool _1588 = _1419 > 0.5;
    int _1590 = _1471 * _1578;
    int _1592 = _1590 + _1493;
    bool _1594 = !_1574;
    int _1596 = _1594 ? 0 : 1;
    float _1598 = 1.0 / _1582;
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1602 = _1600 != 0;
    bool _1604 = uint(_1592) >= uint(_1437);
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1606;
    int _1610 = _1588 ? as_type<int>(_1586) : as_type<int>(_154);
    bool _1612 = !_1604;
    int _1614 = _1612 ? 0 : (-1);
    float _1616 = 1.0 / _1608;
    float _1618 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1620 = _1618 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    int _1622 = _1439 ? as_type<int>(_1586) : as_type<int>(_154);
    float _1624 = _1602 ? as_type<float>(_1610) : _154;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1628 = _1626 != 0;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1632 = _1630 != 0;
    float _1634 = 1.0 / _1620;
    int _1636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1638 = _1636 != 0;
    int _1640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1642 = _1640 != 0;
    float _1644 = float(_100);
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1648 = _334 + _1646;
    float _1650 = _1489 * _1616;
    float _1652 = _1638 ? as_type<float>(_1622) : _154;
    float _1654 = 1.0 / _1644;
    bool _1656 = _1558 > 0.5;
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1658;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1664 = _716 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1666 = _1656 ? as_type<int>(_1586) : as_type<int>(_154);
    float _1668 = _1648 * _1576;
    bool _1670 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1672 = isnan(0.5);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1678 = _1674 || _1676;
    float _1680 = -_1662;
    float _1682 = fma(_1664, 2.0, _1680);
    float _1684 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1686 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1688 = _334 + _1686;
    float _1690 = 1.0 / _1660;
    float _1692 = fma(_1684, -2.0, _1455);
    float _1694 = _1688 * _1598;
    float _1696 = _1479 * _1654;
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1698;
    float _1702 = _1642 ? as_type<float>(_1666) : _154;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1706 = _334 + _1704;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1710 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1708;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1712;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1718 = _1716 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1722 = _334 + _1720;
    float _1724 = _1706 * _1634;
    float _1726 = fma(_1710, _1694, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1728 = fma(_1700, _1694, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1730 = fma(_1714, _1694, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1740;
    bool _1744 = !_1550;
    float _1746 = _1744 ? 7.345489978790283203125 : 1.0;
    float _1748 = _1722 * _1690;
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1752 = _1750 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1754 = fma(_1734, _1650, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1756 = fma(_1738, _1650, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1758 = fma(_1742, _1650, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1760 = _1746 * _716;
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1764 = _1762 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1768 = _1766 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1772 = _1770 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1778 = fma(_1764, _1724, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1780 = fma(_1768, _1724, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1782 = fma(_1772, _1724, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1784 = fma(_1718, _1668, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1786 = fma(_1776, _1668, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1788 = fma(_1752, _1668, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1792 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1692);
    int _1794 = ~_1578;
    int _1796 = _1794 + _1614;
    int _1798 = _1796 + 1;
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1800;
    bool _1804 = _1437 == 0;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1806;
    int _1810 = abs(_1596);
    float _1812 = floor(_1760);
    float _1814 = fma(_1802, _1748, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    bool _1816 = _1499 >= _1473;
    bool _1818 = isnan(_1499);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan(_1473);
    bool _1824 = _1820 || _1822;
    float _1826 = float(_1824);
    float _1828 = fma(_1808, _1748, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1830 = fma(_1467, _1748, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    int _1832 = _1437 * _1798;
    int _1834 = _1832 + _1493;
    float _1836 = -_134;
    float _1838 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1682);
    float _1840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1842 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1844 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1846 = fma(_1702, _1842, -0.5);
    float _1848 = trunc(_1826);
    int _1850 = int(_1848);
    float _1852 = -_1812;
    float _1854 = _1760 + _1852;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1860 = _1854 * _1473;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1864 = _1840 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1866 = !_1804;
    int _1868 = _1866 ? _1834 : (-1);
    float _1870 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1856);
    float _1872 = trunc(_1860);
    int _1874 = int(_1872);
    float _1876 = fma(_1652, _1864, -0.5);
    int _1878 = abs(_908);
    float _1880 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1862);
    int _1882 = ~_1850;
    int _1884 = _1882 + 1;
    int _1886 = _1884 + 1;
    bool _1888 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1890 = isnan(_334);
    bool _1892 = _1888 || _1890;
    bool _1894 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1896 = _1892 || _1894;
    float _1898 = float(_1896);
    float _1900 = as_type<float>(_1834);
    int _1902 = as_type<int>(_1726);
    float _1904 = _1730;
    if (!_1550)
    {
        _1900 = _1419;
    }
    float _1906 = _1900;
    int _1908 = _1868 * _1886;
    int _1910 = _1437 + (-1);
    float _1912 = trunc(_1696);
    int _1914 = int(_1912);
    float _1916 = _1906;
    if (_1550)
    {
        _1916 = _716;
    }
    float _1918 = _1916;
    int _1920 = _1874 * _1810;
    int _1922 = _1920 + _1493;
    float _1924 = -_1898;
    float _1926 = _1924 + 1.0;
    int _1928 = _1850 * _1910;
    int _1930 = _1928 + _1908;
    bool _1932 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1934 = isnan(_334);
    bool _1936 = _1932 || _1934;
    bool _1938 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1940 = _1936 || _1938;
    float _1942 = float(_1940);
    float _1944 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1946 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1948 = isnan(_334);
    bool _1950 = _1946 || _1948;
    bool _1952 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1954 = _1950 || _1952;
    float _1956 = float(_1954);
    int _1958 = _1930 * _1878;
    int _1960 = abs(_912);
    float _1962 = _1942 * _1926;
    float _1964 = -_1942;
    float _1966 = _1964 + 1.0;
    bool _1968 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1970 = isnan(_334);
    bool _1972 = _1968 || _1970;
    bool _1974 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1976 = _1972 || _1974;
    float _1978 = float(_1976);
    float _1980 = -_1956;
    float _1982 = _1980 + 1.0;
    float _1984 = _1956 * _1966;
    int _1986 = _1914 * _1960;
    int _1988 = _1986 + _1958;
    bool _1990 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1992 = isnan(_334);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    float _2002 = -_1978;
    float _2004 = _2002 + 1.0;
    bool _2006 = !_1423;
    int _2008 = _2006 ? 0 : 1;
    float _2010 = _1978 * _1982;
    int _2012 = _1922 * _1477;
    int _2014 = _2012 + _1988;
    bool _2016 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2018 = isnan(_334);
    bool _2020 = _2016 || _2018;
    bool _2022 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2024 = _2020 || _2022;
    float _2026 = float(_2024);
    float _2028 = _2000 * _2004;
    float _2030 = -_2000;
    float _2032 = _2030 + 1.0;
    int _2034 = abs(_2008);
    float _2036 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1880);
    float _2038 = _2000;
    if (_1550)
    {
        _2038 = _716;
    }
    float _2040 = _2038;
    float _2042 = _2026 * _2032;
    float _2044 = -_1792;
    float _2046 = fma(_2036, _1844, _2044);
    float _2048 = _2040;
    if (!_1550)
    {
        _2048 = _386;
    }
    float _2050 = _2048;
    int _2052 = _1874 * _2034;
    int _2054 = _2052 + _2014;
    float _2056 = _1728 * _2042;
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2060 = _1726 * _2042;
    float _2062 = _2050 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2064 = _1730 * _2042;
    if (_1632)
    {
        float _2066 = -_1536;
        float _2068 = _2066 + 1.0;
        _1902 = as_type<int>(_2068);
    }
    int _2070 = _1902;
    float _2072 = float(uint(_2054));
    float _2074 = -_2026;
    float _2076 = _2074 + 1.0;
    float _2078 = _2076;
    if (!_1632)
    {
        _1904 = _1536;
    }
    float _2080 = _1904;
    float _2082 = -_2058;
    float _2084 = fma(_2062, 2.0, _2082);
    float _2086 = _2080;
    if (_1632)
    {
        float _2088 = _1588 ? as_type<float>(_2070) : _1536;
        _2086 = _2088;
    }
    float _2090 = _2086;
    float _2092 = as_type<float>(_1495) * _2072;
    float _2094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2096 = ~_1437;
    int _2098 = _2096 + 1;
    float _2100 = fma(_2076, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2060);
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_1550)
    {
        _2104 = _386;
    }
    float _2106 = _2104;
    float _2108 = fma(_2076, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2064);
    float _2110 = _2106;
    if (_1550)
    {
        _2110 = _1419;
    }
    float _2112 = _2110;
    float _2114 = trunc(_2092);
    float _2116 = precise::max(_2114, 0.0);
    uint _2118 = uint(_2116);
    float _2120 = -_2102;
    float _2122 = fma(_1944, 2.0, _2120);
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2126 = fma(_2112, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1858);
    float _2128 = fma(_1918, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2124);
    float _2130 = fma(_2076, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2056);
    if (!_1550)
    {
        _2078 = _386;
    }
    float _2132 = _2078;
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2138 = _2132;
    if (_1550)
    {
        _2138 = _1419;
    }
    float _2140 = _2138;
    float _2142 = fma(_1786, _2028, _2130);
    float _2144 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2134);
    float _2146 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2136);
    if (!_1550)
    {
        _1449 = _716;
    }
    float _2148 = _1449;
    int _2150 = _2098 * int(_2118);
    int _2152 = _2150 + _2054;
    float _2154 = _2094 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2156 = _2140 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2158 = fma(_1784, _2028, _2100);
    float _2160 = float(uint(_2152));
    float _2162 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2164 = fma(_2154, _1570, -0.5);
    float _2166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2168 = as_type<float>(_1495) * _2160;
    float _2170 = fma(_2156, -2.0, _2162);
    int _2172 = ~_1437;
    int _2174 = _2172 + 1;
    float _2176 = fma(_1754, _2010, _2158);
    float _2178 = fma(_1756, _2010, _2142);
    float _2180 = fma(_1788, _2028, _2108);
    float _2182 = trunc(_2168);
    float _2184 = precise::max(_2182, 0.0);
    uint _2186 = uint(_2184);
    float _2188 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2190 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2144);
    float _2192 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2128);
    float _2194 = -_134;
    float _2196 = fma(_2194, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2122);
    float _2198 = fma(_1758, _2010, _2180);
    float _2200 = float(uint(_1922));
    float _2202 = _2166 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2204 = fma(_2190, _2188, _1838);
    float _2206 = fma(_2192, _2164, _2196);
    float _2208 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2146);
    float _2210 = fma(_2202, _2090, -0.5);
    float _2212 = -_134;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2084);
    float _2216 = as_type<float>(_1495) * _2200;
    float _2218 = fma(_1778, _1984, _2176);
    int _2220 = int(_2118) + int(_2186);
    float _2222 = fma(_2208, _2210, _2214);
    float _2224 = fma(_1780, _1984, _2178);
    float _2226 = trunc(_2216);
    float _2228 = precise::max(_2226, 0.0);
    uint _2230 = uint(_2228);
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2234 = _2174 * _2220;
    int _2236 = _2234 + _2054;
    float _2238 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2240 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2126);
    float _2242 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2170);
    int _2244 = ~_1437;
    int _2246 = _2244 + 1;
    float _2248 = fma(_2238, -2.0, _2232);
    bool _2250 = uint(_2236) >= uint(_1437);
    float _2252 = -_2242;
    float _2254 = fma(_2240, _1846, _2252);
    float _2256 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1870);
    bool _2258 = !_2250;
    int _2260 = _2258 ? 0 : (-1);
    float _2262 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2248);
    float _2264 = fma(_1814, _1962, _2224);
    float _2266 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2268 = ~_2220;
    int _2270 = _2268 + _2260;
    int _2272 = _2270 + 1;
    float _2274 = fma(_1782, _1984, _2198);
    int _2276 = _2246 * int(_2230);
    int _2278 = _2276 + _1922;
    float _2280 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2266);
    float _2282 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2284 = _1437 * _2272;
    int _2286 = _2284 + _2054;
    float _2288 = -_2262;
    float _2290 = fma(_2256, _1876, _2288);
    float _2292 = float(uint(_2278));
    float _2294 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2282);
    float _2296 = fma(_1828, _1962, _2218);
    bool _2298 = !_1804;
    int _2300 = _2298 ? _2286 : (-1);
    float _2302 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2280);
    float _2304 = as_type<float>(_1495) * _2292;
    float _2306 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2294);
    int _2308 = _2300 >> 31;
    float _2310 = fma(_1830, _1962, _2274);
    float _2312 = trunc(_2304);
    float _2314 = precise::max(_2312, 0.0);
    uint _2316 = uint(_2314);
    float _2318 = _2306 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _2320 = _2308 & 3;
    float _2322 = _2204 + 0.5;
    int _2324 = _2300 & 3;
    bool _2326 = _2324 != 0;
    float _2328 = _2206 + 0.5;
    int _2330 = _2300 + _2320;
    float _2332 = _2046 + 0.5;
    float _2334 = _2254 + 0.5;
    float _2336 = _2302 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2338 = _2330 >> 2;
    float _2340 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[128].y, _2264);
    bool _2342 = uint(_2324) > 1u;
    float _2344 = _2336 + _2318;
    int _2346 = _2338 << 4;
    int _2348 = _2346 + 368;
    float _2350 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[128].x, _2296);
    float _2352 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[128].z, _2310);
    int _2354 = ~_1437;
    int _2356 = _2354 + 1;
    uint _2358 = uint(int(uint(_2348) >> uint(2)));
    uint _2360 = uint(int(uint(int(_2358)) >> uint(2)));
    int _2362 = int(_2358) & 3;
    float _2364 = (*spvDescriptorSet0.vp_c9)._m0[int(_2360)][_2362];
    int _2366 = int(_2358) + 1;
    uint _2368 = uint(int(uint(_2366) >> uint(2)));
    int _2370 = _2366 & 3;
    float _2372 = (*spvDescriptorSet0.vp_c9)._m0[int(_2368)][_2370];
    int _2374 = _2300 & 3;
    bool _2376 = _2374 != 0;
    out.m_67.x = _2322;
    out.m_67.y = _2332;
    out.m_67.z = _2328;
    out.m_67.w = _2334;
    float _2378 = _2290 + 0.5;
    bool _2380 = _2324 != 3;
    float _2382 = _2222 + 0.5;
    int _2384 = int(_2230) + int(_2316);
    float _2386 = 1.0 / _2318;
    int _2388 = _2348 + 8;
    uint _2390 = uint(int(uint(_2388) >> uint(2)));
    uint _2392 = uint(int(uint(int(_2390)) >> uint(2)));
    int _2394 = int(_2390) & 3;
    float _2396 = (*spvDescriptorSet0.vp_c9)._m0[int(_2392)][_2394];
    int _2398 = int(_2390) + 1;
    uint _2400 = uint(int(uint(_2398) >> uint(2)));
    int _2402 = _2398 & 3;
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[int(_2400)][_2402];
    float _2406 = as_type<float>(_2230);
    if (!_1678)
    {
        _2406 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2408 = _2406;
    float _2410 = _2350 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_69.x = _2382;
    out.m_69.y = _2378;
    int _2412 = _2376 ? 0 : 1;
    bool _2414 = uint(_2324) >= 2u;
    int _2416 = _2356 * _2384;
    int _2418 = _2416 + _1922;
    int _2420 = ~_2412;
    int _2422 = _2420 + 1;
    int _2424 = _2422 + 1;
    float _2426 = _2344 * _2386;
    float _2428 = _2426 * 0.5;
    int _2430 = _2414 ? 0 : 1;
    int _2432 = _2424;
    float _2434 = _2408;
    float _2436 = _2410;
    if (!_2342)
    {
        int _2438 = ~_2412;
        int _2440 = _2438 + 1;
        _2432 = _2440;
    }
    int _2442 = _2432;
    if (!_1678)
    {
        float _2444 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2446 = fma(_2428, _2408, _2444);
        _2434 = _2446;
    }
    float _2448 = _2434;
    bool _2450 = uint(_2418) >= uint(_1437);
    bool _2452 = _2324 != 3;
    float _2454 = in.m_71.x;
    float _2456 = in.m_71.y;
    float _2458 = in.m_71.z;
    int _2460 = ~_2430;
    int _2462 = _2460 + 1;
    int _2464 = _2462 + 1;
    float _2466 = _2448;
    int _2468 = _2464;
    if (!_1678)
    {
        float _2470 = 1.0 / _2448;
        _2466 = _2470;
    }
    float _2472 = _2466;
    if (_2380)
    {
        int _2474 = ~_2430;
        int _2476 = _2474 + 1;
        _2468 = _2476;
    }
    int _2478 = _2468;
    bool _2480 = !_2326;
    int _2482 = _2480 ? 0 : 1;
    int _2484 = abs(_2442);
    bool _2486 = _724 != 0.0;
    bool _2488 = isnan(_724);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan(0.0);
    bool _2494 = _2490 || _2492;
    int _2496 = abs(_2478);
    int _2498 = abs(_2482);
    int _2500 = ~_2484;
    int _2502 = _2500 + 1;
    int _2504 = _2502 + 1;
    bool _2506 = _722 == 0.0;
    bool _2508 = !_2494;
    bool _2510 = _2506 && _2508;
    bool _2512 = !_2450;
    int _2514 = _2512 ? 0 : (-1);
    int _2516 = _2504 * as_type<int>(_2372);
    int _2518 = ~_2498;
    int _2520 = _2518 + 1;
    int _2522 = _2520 + 1;
    bool _2524 = _728 == 0.0;
    bool _2526 = _2524 && _2510;
    bool _2528 = !_2452;
    int _2530 = _2528 ? 0 : (-1);
    int _2532 = _2522 * as_type<int>(_2364);
    int _2534 = _2532 + _2516;
    int _2536 = ~_2384;
    int _2538 = _2536 + _2514;
    int _2540 = _2538 + 1;
    bool _2542 = !_1628;
    int _2544 = _2542 ? 0 : 1;
    int _2546 = abs(_2530);
    int _2548 = _1437 * _2540;
    int _2550 = _2548 + _1922;
    int _2552 = abs(_2544);
    int _2554 = ~_2496;
    int _2556 = _2554 + 1;
    int _2558 = _2556 + 1;
    float _2560 = _2456;
    float _2562 = _2454;
    float _2564 = _2458;
    if (!_2526)
    {
        float _2566 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2456);
        _2560 = _2566;
    }
    float _2568 = _2560;
    if (!_2526)
    {
        float _2570 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2454);
        _2562 = _2570;
    }
    float _2572 = _2562;
    if (!_2526)
    {
        float _2574 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2458);
        _2564 = _2574;
    }
    float _2576 = _2564;
    int _2578 = _2558 * as_type<int>(_2396);
    int _2580 = _2578 + _2534;
    int _2582 = ~_2546;
    int _2584 = _2582 + 1;
    int _2586 = _2584 + 1;
    float _2588 = _680 * _2568;
    float _2590 = _682 * _2568;
    float _2592 = _678 * _2568;
    int _2594 = ~_2552;
    int _2596 = _2594 + 1;
    int _2598 = _2596 + 1;
    int _2600 = _2586 * as_type<int>(_2404);
    int _2602 = _2600 + _2580;
    float _2604 = as_type<float>(_2580);
    float _2606 = as_type<float>(_2602);
    if (!_1678)
    {
        _2604 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2608 = _2604;
    float _2610 = fma(_742, _2572, _2590);
    bool _2612 = !_1804;
    int _2614 = _2612 ? _2550 : (-1);
    int _2616 = _2602 * _2598;
    float _2618 = fma(_740, _2572, _2588);
    if (!_1678)
    {
        float _2620 = -_2608;
        float _2622 = _2620 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2606 = _2622;
    }
    float _2624 = _2606;
    float _2626 = fma(_744, _2572, _2592);
    float _2628 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2630 = _2614 * _2552;
    int _2632 = _2630 + _2616;
    float _2634 = fma(_396, _2576, _2618);
    float _2636 = fma(_400, _2576, _2610);
    float _2638 = _2624;
    if (!_1678)
    {
        float _2640 = 1.0 / _2624;
        _2638 = _2640;
    }
    float _2642 = _2638;
    float _2644 = fma(_398, _2576, _2626);
    if (!_1678)
    {
        float _2646 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2648 = -_2608;
        float _2650 = fma(_2472, _2646, _2648);
        _934 = _2650;
    }
    float _2652 = _934;
    float _2654 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2628);
    float _2656 = _2340 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2658 = _2410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1678)
    {
        _2436 = 1.0;
    }
    float _2660 = _2436;
    out.m_73.x = _2634;
    out.m_73.y = _2636;
    out.m_73.z = _2644;
    float _2662 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2654);
    float _2664 = float(_2632);
    float _2666 = _1362 + _1324;
    float _2668 = _2352 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2670 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2662);
    float _2672 = _1324 * 0.5;
    out.m_75.x = _2664;
    float _2674 = _2666 * 0.5;
    float _2676 = _2660;
    if (!_1678)
    {
        float _2678 = _2652 * _2642;
        float _2680 = precise::clamp(_2678, 0.0, 1.0);
        _2676 = _2680;
    }
    float _2682 = _2676;
    float _2684 = _2670 + _1324;
    float _2686 = _2656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2688 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2690 = _2682 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2692 = _2682 > 0.0;
    bool _2694 = isnan(_2682);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan(0.0);
    bool _2700 = _2696 || _2698;
    float _2702 = _2668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2704 = _2688 * _1392;
    float _2706 = -_2688;
    float _2708 = _2706 + 1.0;
    float _2710 = _2690 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2712 = _1403 * _2704;
    float _2714 = _1413 * _2704;
    float _2716 = _2684 * 0.5;
    float _2718 = fma(_1364, -0.5, _2672);
    float _2720 = fma(_1409, _2712, _1397);
    float _2722 = fma(_1411, _2712, _1399);
    float _2724 = _1403 * _2708;
    float _2726 = fma(_1403, _2714, _1401);
    out.m_77.x = _2658;
    out.m_77.y = _2686;
    out.m_77.z = _2702;
    out.gl_Position.x = _1362;
    out.gl_Position.y = _1364;
    out.gl_Position.z = _2670;
    out.gl_Position.w = _1324;
    out.m_79.x = _2674;
    out.m_79.y = _2718;
    out.m_79.z = _2716;
    out.m_79.w = _1324;
    out.m_45.x = _2710;
    out.m_81.x = _2720;
    out.m_81.y = _2722;
    out.m_81.z = _2726;
    out.m_81.w = _2724;
    if (_2700)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2728 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2728;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _326 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2785 = as_type<float>(_116);
        out.gl_Position.z = _2785;
    }
    if (!_104)
    {
        return out;
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_100);
        _110 = _136;
    }
    float _138 = _110;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2854 = as_type<float>(_152);
        out.gl_Position.z = _2854;
    }
    if (_144)
    {
        return out;
    }
    float _154 = in.m_49.y;
    float _156 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = in.m_42.x;
    float _176 = in.m_42.y;
    float _178 = in.m_42.z;
    float _180 = in.m_51.x;
    float _182 = in.m_51.y;
    float _184 = in.m_51.z;
    float _186 = in.m_51.w;
    float _188 = 0.0;
    float _190 = _156;
    if (!_166)
    {
        float _192 = _156 * _156;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_166)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_166;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _156 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _156);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_166;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _156 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    out.m_53.y = _154;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = _184 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = fma(_262, _168, _266);
    float _276 = fma(_262, _170, _268);
    float _278 = fma(_262, _172, _270);
    float _280 = fma(_274, _186, _174);
    float _282 = fma(_276, _186, _176);
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _286 = fma(_278, _186, _178);
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _290 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _294 = _182 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _296 = _284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _298 = _288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _300 = _292 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _302 = !_264;
    float _304 = _296;
    int _306 = as_type<int>(_298);
    float _324;
    if (!_302)
    {
        float _308 = in.m_55.x;
        float _310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _312 = _308 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[11].z, _134);
        float _316 = _314 * _310;
        float _318 = floor(_316);
        float _320 = -_318;
        float _322 = _316 + _320;
        _324 = _322;
        _326 = true;
    }
    else
    {
        float _328 = float(_100);
        float _330 = 1.0 / _328;
        float _332 = _134 * _330;
        _324 = _332;
    }
    _326 = false;
    float _334 = _324;
    float _336 = _282 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _338 = _282 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _340 = _282 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _342 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].x, _336);
    float _344 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].x, _338);
    float _346 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].x, _340);
    float _348 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].z, _342);
    float _350 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].z, _344);
    float _352 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].z, _346);
    float _354 = _348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _356 = _350 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _358 = _352 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _360 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _362 = -_354;
    float _364 = _362 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _366 = -_356;
    float _368 = _366 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _370 = -_358;
    float _372 = _370 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _374 = _364 * _364;
    float _376 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _378 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _380 = fma(_368, _368, _374);
    float _382 = -_360;
    float _384 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _382);
    float _386 = in.m_55.z;
    float _388 = 1.0 / _294;
    float _390 = fma(_372, _372, _380);
    float _392 = rsqrt(_390);
    float _394 = _294 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _396 = _368 * _392;
    float _398 = _372 * _392;
    float _400 = _364 * _392;
    float _402 = _396 * _396;
    float _404 = fma(_398, _398, _402);
    float _406 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _408 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _410 = rsqrt(_404);
    float _412 = -_406;
    float _414 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _412);
    float _416 = -_408;
    float _418 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _416);
    float _420 = -_376;
    float _422 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _420);
    float _424 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _426 = _414 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _428 = -_424;
    float _430 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _428);
    float _432 = -_378;
    float _434 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _432);
    float _436 = _418 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _438 = -_426;
    float _440 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[1].y, _438);
    float _442 = _418 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _444 = _434 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _446 = -_436;
    float _448 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[1].x, _446);
    float _450 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[1].w, _440);
    float _452 = _398 * _410;
    float _454 = _396 * _410;
    float _456 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[1].w, _448);
    float _458 = -_442;
    float _460 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[1].x, _458);
    float _462 = -_452;
    float _464 = _398 * _462;
    float _466 = -_452;
    float _468 = _400 * _466;
    float _470 = _456 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _472 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[1].w, _460);
    float _474 = -_464;
    float _476 = fma(_396, _454, _474);
    float _478 = _400 * _454;
    float _480 = -_470;
    float _482 = fma(_450, (*spvDescriptorSet0.vp_c8)._m0[0].x, _480);
    float _484 = -_444;
    float _486 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _484);
    float _488 = _476 * _476;
    float _490 = _418 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _492 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[0].z, _482);
    float _494 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[1].z, _486);
    float _496 = fma(_478, _478, _488);
    float _498 = -_490;
    float _500 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[0].x, _498);
    float _502 = _414 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _504 = -_494;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[0].w, _492);
    float _508 = fma(_468, _468, _496);
    float _510 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[0].w, _500);
    float _512 = -_502;
    float _514 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[0].y, _512);
    float _516 = 1.0 / _506;
    float _518 = _418 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _520 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[0].w, _514);
    float _522 = -_518;
    float _524 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[0].x, _522);
    float _526 = rsqrt(_508);
    float _528 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[0].w, _524);
    float _530 = fma(_510, _516, -1.0);
    float _532 = _476 * _526;
    float _534 = precise::clamp(_532, 0.0, 1.0);
    float _536 = 1.0 / _272;
    float _538 = -_534;
    float _540 = _538 + 1.0;
    float _542 = _540 * _516;
    float _544 = fma(_540, _530, 1.0);
    float _546 = _520 * _542;
    float _548 = _544 * _544;
    float _550 = _528 * _542;
    float _552 = 1.0 / _290;
    float _554 = fma(_546, _546, _548);
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _558 = _358 + _556;
    float _560 = fma(_550, _550, _554);
    float _562 = rsqrt(_560);
    float _564 = _550 * _562;
    float _566 = _546 * _562;
    float _568 = _544 * _562;
    float _570 = -_564;
    float _572 = _396 * _570;
    float _574 = _398 * _568;
    float _576 = -_566;
    float _578 = -_572;
    float _580 = fma(_398, _576, _578);
    float _582 = -_566;
    float _584 = _400 * _582;
    float _586 = -_564;
    float _588 = -_574;
    float _590 = fma(_400, _586, _588);
    float _592 = _580 * _580;
    float _594 = -_584;
    float _596 = fma(_396, _568, _594);
    float _598 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _600 = _354 + _598;
    float _602 = fma(_590, _590, _592);
    float _604 = _600 * _600;
    float _606 = fma(_596, _596, _602);
    float _608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _610 = _356 + _608;
    float _612 = fma(_610, _610, _604);
    float _614 = rsqrt(_606);
    float _616 = fma(_558, _558, _612);
    float _618 = _590 * _614;
    float _620 = _596 * _614;
    float _622 = _580 * _614;
    float _624 = _398 * _618;
    float _626 = _400 * _620;
    float _628 = -_624;
    float _630 = fma(_396, _620, _628);
    float _632 = -_626;
    float _634 = fma(_398, _622, _632);
    float _636 = _396 * _622;
    float _638 = rsqrt(_616);
    float _640 = _630 * _630;
    float _642 = -_636;
    float _644 = fma(_400, _618, _642);
    float _646 = fma(_634, _634, _640);
    float _648 = fma(_644, _644, _646);
    float _650 = rsqrt(_648);
    float _652 = _600 * _638;
    float _654 = _610 * _638;
    float _656 = _558 * _638;
    float _658 = -_652;
    float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[18].w, _600);
    float _662 = -_654;
    float _664 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[18].w, _610);
    float _666 = -_656;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _670 = -_654;
    float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[18].w, _356);
    float _674 = _660 * _660;
    float _676 = fma(_664, _664, _674);
    float _678 = _644 * _650;
    float _680 = _634 * _650;
    float _682 = _630 * _650;
    float _684 = fma(_668, _668, _676);
    float _686 = _396 * _678;
    float _688 = _400 * _680;
    float _690 = _398 * _682;
    float _692 = -_686;
    float _694 = fma(_398, _680, _692);
    float _696 = -_688;
    float _698 = fma(_396, _682, _696);
    float _700 = in.m_57.x;
    float _702 = in.m_57.y;
    float _704 = in.m_57.z;
    float _706 = -_690;
    float _708 = fma(_400, _678, _706);
    float _710 = _694 * _694;
    float _712 = sqrt(_684);
    float _714 = fma(_708, _708, _710);
    float _716 = in.m_55.x;
    float _718 = fma(_698, _698, _714);
    float _720 = rsqrt(_718);
    float _722 = _552 * _700;
    float _724 = _388 * _702;
    float _726 = _638 * _712;
    float _728 = _536 * _704;
    float _730 = _290 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _732 = _386 * 6.283185482025146484375;
    float _734 = _272 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _724);
    float _738 = _726 * _394;
    float _740 = _708 * _720;
    float _742 = _694 * _720;
    float _744 = _698 * _720;
    float _746 = fma(_134, 0.310000002384185791015625, _732);
    float _748 = _726 * _730;
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _722);
    float _752 = _738 * _736;
    float _754 = _716 * 6.283185482025146484375;
    float _756 = _746 * 0.15915493667125701904296875;
    float _758 = _726 * _734;
    float _760 = _748 * _750;
    float _762 = _752 * _682;
    float _764 = fma(_134, 0.10999999940395355224609375, _754);
    float _766 = _752 * _680;
    float _768 = _752 * _678;
    float _770 = _728 * _758;
    float _772 = fma(_760, _742, _762);
    float _774 = _764 * 0.15915493667125701904296875;
    float _776 = fma(_760, _740, _766);
    float _778 = _756 * 6.283185482025146484375;
    float _780 = sin(_778);
    float _782 = fma(_770, _400, _772);
    float _784 = fma(_760, _744, _768);
    float _786 = fma(_770, _396, _776);
    float _788 = _782 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _790 = fma(_770, _398, _784);
    float _792 = _782 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _794 = _774 * 6.283185482025146484375;
    float _796 = sin(_794);
    float _798 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].z, _788);
    float _800 = _782 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _802 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].y, _792);
    float _804 = _354 + _782;
    float _806 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].z, _798);
    float _808 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].x, _800);
    float _810 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].y, _802);
    float _812 = fma(_780, 0.12999999523162841796875, 1.0);
    float _814 = _758 * _806;
    float _816 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].x, _808);
    float _818 = _738 * _810;
    float _820 = _358 + _790;
    float _822 = _814 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _824 = _748 * _816;
    float _826 = _814 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _828 = fma(_796, 0.300000011920928955078125, _812);
    float _830 = -_154;
    float _832 = fma(_830, 0.5, 0.5);
    float _834 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[10].y, _822);
    float _836 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[8].y, _826);
    float _838 = _356 + _786;
    float _840 = _828 * _832;
    float _842 = fma(_824, (*spvDescriptorSet0.vp_c10)._m0[10].x, _834);
    float _844 = _738 * _840;
    float _846 = _844 * 2.0;
    float _848 = fma(_824, (*spvDescriptorSet0.vp_c10)._m0[8].x, _836);
    float _850 = _820 + _842;
    float _852 = _838 + _848;
    float _854 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[32].z, _850);
    float _856 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[32].x, _852);
    float _858 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _860 = _854 + _858;
    float _862 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _864 = _856 + _862;
    float _866 = _860 * _860;
    float _868 = fma(_864, _864, _866);
    float _870 = _814 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _872 = sqrt(_868);
    float _874 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[9].y, _870);
    float _876 = fma(_824, (*spvDescriptorSet0.vp_c10)._m0[9].x, _874);
    float _878 = _804 + _876;
    float _880 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[32].y, _878);
    bool _882 = _872 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _886 = _884 != 0;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _890 = _888 != 0;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _894 = _892 != 0;
    bool _896 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _898 = isnan(0.5);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _904 = _900 || _902;
    bool _906 = !_890;
    int _908 = _906 ? 0 : 1;
    bool _910 = !_886;
    int _912 = _910 ? 0 : 1;
    bool _914 = !_894;
    int _916 = _914 ? 0 : 1;
    float _918 = _824;
    float _920 = _878;
    float _922 = _876;
    float _924 = _856;
    float _926 = _814;
    float _928 = _758;
    bool _930 = false;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _934 = _722;
    if (!_882)
    {
        _918 = _856;
    }
    float _936 = _918;
    float _938 = _936;
    if (!_882)
    {
        _920 = _854;
    }
    float _940 = _920;
    float _942 = _940;
    if (!_882)
    {
        _922 = _880;
    }
    float _944 = _922;
    bool _946 = !_882;
    float _948 = _944;
    if (!_946)
    {
        float _950 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _952 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _954 = _872 + _952;
        float _956 = rsqrt(_868);
        float _958 = _954 * _950;
        float _960 = _880 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _962 = _958 * 0.15915493667125701904296875;
        float _964 = _962 * 6.283185482025146484375;
        float _966 = cos(_964);
        float _968 = _962 * 6.283185482025146484375;
        float _970 = sin(_968);
        float _972 = _966 + (-1.0);
        float _974 = _972 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _976 = fma(_970, _960, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _978 = fma(_880, _966, _974);
        float _980 = _956 * _976;
        float _982 = fma(_864, _980, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _984 = fma(_860, _980, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _948 = _978;
        _942 = _984;
        _938 = _982;
        _924 = _956;
    }
    float _986 = _948;
    float _988 = _942;
    float _990 = _938;
    float _992 = _924;
    float _994 = -_652;
    float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _986);
    float _998 = -_656;
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[18].w, _988);
    float _1002 = -_654;
    float _1004 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[18].w, _990);
    float _1006 = -_652;
    float _1008 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[18].w, _354);
    float _1010 = -_656;
    float _1012 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[18].w, _358);
    float _1014 = _996;
    float _1016 = _1004;
    float _1018 = _1000;
    float _1020 = _992;
    if (!_904)
    {
        float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1024 = _1008 + _1022;
        float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1028 = _672 + _1026;
        float _1030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1032 = -_356;
        float _1034 = _1032 + _990;
        float _1036 = _1024 * _1024;
        float _1038 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1040 = _1012 + _1038;
        float _1042 = -_354;
        float _1044 = _1042 + _986;
        float _1046 = -_358;
        float _1048 = _1046 + _988;
        float _1050 = fma(_1028, _1028, _1036);
        float _1052 = fma(_1040, _1040, _1050);
        float _1054 = 1.0 / _726;
        float _1056 = sqrt(_1052);
        float _1058 = precise::min(_1056, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1060 = _1058 * _1030;
        float _1062 = _1060 * _1054;
        float _1064 = fma(_1034, _1062, _672);
        float _1066 = fma(_1044, _1062, _1008);
        float _1068 = fma(_1048, _1062, _1012);
        _1014 = _1066;
        _1016 = _1064;
        _1018 = _1068;
        _926 = _1030;
        _1020 = _1056;
    }
    float _1070 = _1014;
    float _1072 = _1016;
    float _1074 = _1018;
    float _1076 = _926;
    float _1078 = _1020;
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1082 = _1070 + _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1072 + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1090 = _1074 + _1088;
    float _1092 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1094 = _1082 * _1082;
    float _1096 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1092);
    float _1098 = fma(_1086, _1086, _1094);
    float _1100 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1096);
    float _1102 = fma(_1090, _1090, _1098);
    float _1104 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1106 = rsqrt(_1102);
    float _1108 = sqrt(_1102);
    float _1110 = _1106 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1112 = _1086 * _1110;
    float _1114 = _1090 * _1110;
    float _1116 = _1112 * _1112;
    float _1118 = _1114 * _1114;
    float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1122 = fma(_1108, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1120);
    float _1124 = precise::clamp(_1122, 0.0, 1.0);
    float _1126 = _1116 + _1118;
    float _1128 = -_1124;
    float _1130 = _1128 + 1.0;
    float _1132 = sqrt(_1126);
    bool _1134 = _1132 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1138 = _1132 + _1136;
    float _1140 = _1098;
    float _1142 = _1078;
    float _1144 = _1138;
    float _1146 = _1076;
    float _1148 = _1112;
    if (_1134)
    {
        float _1150 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1140 = _1150;
    }
    float _1152 = _1140;
    if (_1134)
    {
        float _1154 = rsqrt(_1126);
        _1142 = _1154;
    }
    float _1156 = _1142;
    float _1158 = _1156;
    if (_1134)
    {
        float _1160 = _1138 * _1152;
        _1144 = _1160;
    }
    float _1162 = _1144;
    if (_1134)
    {
        float _1164 = _1162 * 0.15915493667125701904296875;
        _1146 = _1164;
    }
    float _1166 = _1146;
    float _1168 = _1152;
    if (_1134)
    {
        float _1170 = _1166 * 6.283185482025146484375;
        float _1172 = sin(_1170);
        _1168 = _1172;
    }
    float _1174 = _1168;
    float _1176 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1178 = precise::max(0.0, _1176);
    float _1180 = _990;
    float _1182 = _1178;
    if (_1134)
    {
        float _1184 = _1166 * 6.283185482025146484375;
        float _1186 = cos(_1184);
        _1180 = _1186;
    }
    float _1188 = _1180;
    float _1190 = -_1110;
    float _1192 = -_1178;
    float _1194 = fma(_1082, _1190, _1192);
    if (_1134)
    {
        float _1196 = _1194 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1182 = _1196;
    }
    float _1198 = _1182;
    float _1200 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1202 = _1174;
    float _1204 = _1198;
    if (_1134)
    {
        float _1206 = fma(_1174, _1198, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1202 = _1206;
    }
    float _1208 = _1202;
    float _1210 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1200);
    float _1212 = _1208;
    float _1214 = _1188;
    if (_1134)
    {
        float _1216 = _1188 + (-1.0);
        _1204 = _1216;
    }
    float _1218 = _1204;
    float _1220 = _1218;
    if (_1134)
    {
        float _1222 = _1156 * _1208;
        _928 = _1222;
    }
    float _1224 = _928;
    if (!_1134)
    {
        _1212 = _1194;
    }
    float _1226 = _1212;
    float _1228 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1210);
    float _1230 = _1226;
    if (_1134)
    {
        float _1232 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1158 = _1232;
    }
    float _1234 = _1158;
    float _1236 = _1234;
    if (_1134)
    {
        float _1238 = _1112 * _1224;
        _1148 = _1238;
    }
    float _1240 = _1148;
    if (!_1134)
    {
        _1220 = _1114;
    }
    float _1242 = _1220;
    float _1244 = _1242;
    if (_1134)
    {
        float _1246 = _1114 * _1224;
        _1244 = _1246;
    }
    float _1248 = _1244;
    if (_1134)
    {
        float _1250 = fma(_1194, _1188, _1234);
        _1230 = _1250;
    }
    float _1252 = _1230;
    if (!_1134)
    {
        _1236 = _1116;
    }
    float _1254 = _1236;
    float _1256 = _1254;
    if (_1134)
    {
        float _1258 = _1240 * _1240;
        _1256 = _1258;
    }
    float _1260 = _1256;
    float _1262 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1134)
    {
        _1214 = _1118;
    }
    float _1264 = _1214;
    float _1266 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1268 = _1264;
    if (_1134)
    {
        float _1270 = _1248 * _1248;
        _1268 = _1270;
    }
    float _1272 = _1268;
    float _1274 = fma(_1252, _1252, _1260);
    float _1276 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1262);
    float _1278 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1266);
    float _1280 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1282 = _1274 + _1272;
    float _1284 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1276);
    float _1286 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1278);
    float _1288 = abs(_1130);
    float _1290 = log2(_1288);
    float _1292 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1294 = _1286 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1296 = _1104 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1298 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1300 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1302 = rsqrt(_1282);
    float _1304 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1298);
    float _1306 = -_1296;
    float _1308 = fma(_1306, _1300, 1.0);
    float _1310 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1304);
    float _1312 = log2(_1308);
    float _1314 = _1302 * _1240;
    float _1316 = _1302 * _1252;
    float _1318 = _1302 * _1248;
    float _1320 = _1290 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1322 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1324 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1310);
    float _1326 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1328 = _1316 + 1.0;
    float _1330 = -_1322;
    float _1332 = fma(_1316, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1330);
    float _1334 = 1.0 / _1324;
    float _1336 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1326);
    float _1338 = -_1318;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1332);
    float _1342 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1344 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1336);
    float _1346 = fma(_1340, -0.5, 0.5);
    float _1348 = exp2(_1320);
    float _1350 = fma(_1340, 0.5, 0.5);
    float _1352 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1342);
    float _1354 = fma(_1350, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1356 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1352);
    float _1358 = sqrt(_1346);
    float _1360 = fma(_1350, _1354, -0.212114393711090087890625);
    float _1362 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1356);
    float _1364 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1344);
    float _1366 = _1312 * 0.693147182464599609375;
    float _1368 = fma(_1350, _1360, 1.570728778839111328125);
    float _1370 = _1362 * _1334;
    float _1372 = _1364 * _1334;
    float _1374 = -_1316;
    float _1376 = fma(_1348, _1328, _1374);
    float _1378 = _1366 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1380 = fma(_1370, 0.5, 0.5);
    float _1382 = fma(_1372, -0.5, 0.5);
    float _1384 = fma(_1376, 0.5, 0.5);
    float _1386 = _1358 * 0.636619746685028076171875;
    float _1388 = -_1368;
    float _1390 = fma(_1386, _1388, 1.0);
    float3 _4872 = float3(_1380, _1382, _1378);
    float _1392 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4872, float3(0.0), isnan(_4872)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4872, float3(0.0), isnan(_4872)), level(0.0)).x;
    float3 _4883 = float3(_1380, _1382, _1378);
    float4 _1395 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4883, float3(0.0), isnan(_4883)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4883, float3(0.0), isnan(_4883)), level(0.0)).xyzw;
    float _1397 = _1395.x;
    float _1399 = _1395.y;
    float _1401 = _1395.z;
    float _1403 = _1395.w;
    float2 _4900 = float2(_1390, _1384);
    float3 _1407 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4900, float2(0.0), isnan(_4900)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4900, float2(0.0), isnan(_4900)), level(0.0)).xyz;
    float _1409 = _1407.x;
    float _1411 = _1407.y;
    float _1413 = _1407.z;
    float _1415 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1417 = int(_1415);
    float _1419 = in.m_55.y;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1423 = _1421 != 0;
    float _1425 = _1290 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1429 = _1427 != 0;
    out.m_59.x = _296;
    out.m_59.y = _298;
    out.m_59.z = _300;
    int _1431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1433 = _1431 != 0;
    float _1435 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1437 = int(_1435);
    bool _1439 = _386 > 0.5;
    float _1441 = in.m_61.w;
    out.m_63.x = _1086;
    out.m_63.y = _1082;
    out.m_63.z = _1090;
    float _1443 = exp2(_1425);
    float _1445 = float(_1417);
    float _1447 = in.m_49.x;
    float _1449 = _1419;
    if (_1429)
    {
        bool _1451 = _716 > 0.5;
        _930 = _1451;
    }
    bool _1453 = _930;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1457 = 1.0 / _1445;
    float _1459 = float(uint(_1437));
    int _1461 = ~_1437;
    int _1463 = _1461 + 1;
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1465;
    int _1469 = ~_1437;
    int _1471 = _1469 + 1;
    float _1473 = float(_1437);
    float _1475 = 1.0 / _1459;
    out.m_65.w = _1441;
    int _1477 = abs(_916);
    float _1479 = _134 * _1473;
    float _1481 = -_1443;
    float _1483 = _1481 + 1.0;
    float _1485 = _134 * _1457;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1489 = _334 + _1487;
    float _1491 = trunc(_1485);
    int _1493 = int(_1491);
    int _1495 = as_type<int>(_1475) + (-2);
    float _1497 = float(uint(_1493));
    float _1499 = float(_1493);
    float _1501 = as_type<float>(_1495) * _1497;
    float _1503 = trunc(_1501);
    float _1505 = precise::max(_1503, 0.0);
    uint _1508 = uint(_1505);
    int _1510 = _1463 * int(_1508);
    int _1512 = _1510 + _1493;
    float _1514 = float(uint(_1512));
    float _1516 = as_type<float>(_1495) * _1514;
    float _1518 = _1514;
    int _1520 = _1463;
    if (!_1429)
    {
        _1518 = _1447;
    }
    float _1522 = _1518;
    float _1524 = _1522;
    if (!_1429)
    {
        _932 = _1522;
    }
    float _1526 = _932;
    float _1528 = trunc(_1516);
    float _1530 = precise::max(_1528, 0.0);
    uint _1532 = uint(_1530);
    float _1534 = _1526;
    if (_1429)
    {
        _1524 = _1447;
    }
    float _1536 = _1524;
    if (!_1433)
    {
        _304 = _1536;
    }
    float _1538 = _304;
    float _1540 = _1538;
    if (_1429)
    {
        float _1542 = -_1536;
        float _1544 = _1542 + 1.0;
        _306 = as_type<int>(_1544);
    }
    int _1546 = _306;
    int _1548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1550 = _1548 != 0;
    if (_1433)
    {
        float _1552 = -_1536;
        float _1554 = _1552 + 1.0;
        _1520 = as_type<int>(_1554);
    }
    int _1556 = _1520;
    float _1558 = in.m_55.w;
    if (_1429)
    {
        float _1560 = _1453 ? as_type<float>(_1546) : _1536;
        _1534 = _1560;
    }
    float _1562 = _1534;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    if (_1433)
    {
        float _1568 = _1439 ? as_type<float>(_1556) : _1536;
        _1540 = _1568;
    }
    float _1570 = _1540;
    int _1572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1574 = _1572 != 0;
    float _1576 = 1.0 / _1566;
    int _1578 = int(_1508) + int(_1532);
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1580;
    float _1584 = -_154;
    float _1586 = _1584 + 1.0;
    bool _1588 = _1419 > 0.5;
    int _1590 = _1471 * _1578;
    int _1592 = _1590 + _1493;
    bool _1594 = !_1574;
    int _1596 = _1594 ? 0 : 1;
    float _1598 = 1.0 / _1582;
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1602 = _1600 != 0;
    bool _1604 = uint(_1592) >= uint(_1437);
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1606;
    int _1610 = _1588 ? as_type<int>(_1586) : as_type<int>(_154);
    bool _1612 = !_1604;
    int _1614 = _1612 ? 0 : (-1);
    float _1616 = 1.0 / _1608;
    float _1618 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1620 = _1618 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    int _1622 = _1439 ? as_type<int>(_1586) : as_type<int>(_154);
    float _1624 = _1602 ? as_type<float>(_1610) : _154;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1628 = _1626 != 0;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1632 = _1630 != 0;
    float _1634 = 1.0 / _1620;
    int _1636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1638 = _1636 != 0;
    int _1640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1642 = _1640 != 0;
    float _1644 = float(_100);
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1648 = _334 + _1646;
    float _1650 = _1489 * _1616;
    float _1652 = _1638 ? as_type<float>(_1622) : _154;
    float _1654 = 1.0 / _1644;
    bool _1656 = _1558 > 0.5;
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1658;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1664 = _716 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1666 = _1656 ? as_type<int>(_1586) : as_type<int>(_154);
    float _1668 = _1648 * _1576;
    bool _1670 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1672 = isnan(0.5);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1678 = _1674 || _1676;
    float _1680 = -_1662;
    float _1682 = fma(_1664, 2.0, _1680);
    float _1684 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1686 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1688 = _334 + _1686;
    float _1690 = 1.0 / _1660;
    float _1692 = fma(_1684, -2.0, _1455);
    float _1694 = _1688 * _1598;
    float _1696 = _1479 * _1654;
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1698;
    float _1702 = _1642 ? as_type<float>(_1666) : _154;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1706 = _334 + _1704;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1710 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1708;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1712;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1718 = _1716 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1722 = _334 + _1720;
    float _1724 = _1706 * _1634;
    float _1726 = fma(_1710, _1694, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1728 = fma(_1700, _1694, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1730 = fma(_1714, _1694, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1740;
    bool _1744 = !_1550;
    float _1746 = _1744 ? 7.345489978790283203125 : 1.0;
    float _1748 = _1722 * _1690;
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1752 = _1750 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1754 = fma(_1734, _1650, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1756 = fma(_1738, _1650, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1758 = fma(_1742, _1650, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1760 = _1746 * _716;
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1764 = _1762 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1768 = _1766 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1772 = _1770 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1778 = fma(_1764, _1724, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1780 = fma(_1768, _1724, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1782 = fma(_1772, _1724, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1784 = fma(_1718, _1668, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1786 = fma(_1776, _1668, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1788 = fma(_1752, _1668, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1792 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1692);
    int _1794 = ~_1578;
    int _1796 = _1794 + _1614;
    int _1798 = _1796 + 1;
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1800;
    bool _1804 = _1437 == 0;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1806;
    int _1810 = abs(_1596);
    float _1812 = floor(_1760);
    float _1814 = fma(_1802, _1748, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    bool _1816 = _1499 >= _1473;
    bool _1818 = isnan(_1499);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan(_1473);
    bool _1824 = _1820 || _1822;
    float _1826 = float(_1824);
    float _1828 = fma(_1808, _1748, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1830 = fma(_1467, _1748, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    int _1832 = _1437 * _1798;
    int _1834 = _1832 + _1493;
    float _1836 = -_134;
    float _1838 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1682);
    float _1840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1842 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1844 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1846 = fma(_1702, _1842, -0.5);
    float _1848 = trunc(_1826);
    int _1850 = int(_1848);
    float _1852 = -_1812;
    float _1854 = _1760 + _1852;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1860 = _1854 * _1473;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1864 = _1840 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1866 = !_1804;
    int _1868 = _1866 ? _1834 : (-1);
    float _1870 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1856);
    float _1872 = trunc(_1860);
    int _1874 = int(_1872);
    float _1876 = fma(_1652, _1864, -0.5);
    int _1878 = abs(_908);
    float _1880 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1862);
    int _1882 = ~_1850;
    int _1884 = _1882 + 1;
    int _1886 = _1884 + 1;
    bool _1888 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1890 = isnan(_334);
    bool _1892 = _1888 || _1890;
    bool _1894 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1896 = _1892 || _1894;
    float _1898 = float(_1896);
    float _1900 = as_type<float>(_1834);
    int _1902 = as_type<int>(_1726);
    float _1904 = _1730;
    if (!_1550)
    {
        _1900 = _1419;
    }
    float _1906 = _1900;
    int _1908 = _1868 * _1886;
    int _1910 = _1437 + (-1);
    float _1912 = trunc(_1696);
    int _1914 = int(_1912);
    float _1916 = _1906;
    if (_1550)
    {
        _1916 = _716;
    }
    float _1918 = _1916;
    int _1920 = _1874 * _1810;
    int _1922 = _1920 + _1493;
    float _1924 = -_1898;
    float _1926 = _1924 + 1.0;
    int _1928 = _1850 * _1910;
    int _1930 = _1928 + _1908;
    bool _1932 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1934 = isnan(_334);
    bool _1936 = _1932 || _1934;
    bool _1938 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1940 = _1936 || _1938;
    float _1942 = float(_1940);
    float _1944 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1946 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1948 = isnan(_334);
    bool _1950 = _1946 || _1948;
    bool _1952 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1954 = _1950 || _1952;
    float _1956 = float(_1954);
    int _1958 = _1930 * _1878;
    int _1960 = abs(_912);
    float _1962 = _1942 * _1926;
    float _1964 = -_1942;
    float _1966 = _1964 + 1.0;
    bool _1968 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1970 = isnan(_334);
    bool _1972 = _1968 || _1970;
    bool _1974 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1976 = _1972 || _1974;
    float _1978 = float(_1976);
    float _1980 = -_1956;
    float _1982 = _1980 + 1.0;
    float _1984 = _1956 * _1966;
    int _1986 = _1914 * _1960;
    int _1988 = _1986 + _1958;
    bool _1990 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1992 = isnan(_334);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    float _2002 = -_1978;
    float _2004 = _2002 + 1.0;
    bool _2006 = !_1423;
    int _2008 = _2006 ? 0 : 1;
    float _2010 = _1978 * _1982;
    int _2012 = _1922 * _1477;
    int _2014 = _2012 + _1988;
    bool _2016 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2018 = isnan(_334);
    bool _2020 = _2016 || _2018;
    bool _2022 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2024 = _2020 || _2022;
    float _2026 = float(_2024);
    float _2028 = _2000 * _2004;
    float _2030 = -_2000;
    float _2032 = _2030 + 1.0;
    int _2034 = abs(_2008);
    float _2036 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1880);
    float _2038 = _2000;
    if (_1550)
    {
        _2038 = _716;
    }
    float _2040 = _2038;
    float _2042 = _2026 * _2032;
    float _2044 = -_1792;
    float _2046 = fma(_2036, _1844, _2044);
    float _2048 = _2040;
    if (!_1550)
    {
        _2048 = _386;
    }
    float _2050 = _2048;
    int _2052 = _1874 * _2034;
    int _2054 = _2052 + _2014;
    float _2056 = _1728 * _2042;
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2060 = _1726 * _2042;
    float _2062 = _2050 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2064 = _1730 * _2042;
    if (_1632)
    {
        float _2066 = -_1536;
        float _2068 = _2066 + 1.0;
        _1902 = as_type<int>(_2068);
    }
    int _2070 = _1902;
    float _2072 = float(uint(_2054));
    float _2074 = -_2026;
    float _2076 = _2074 + 1.0;
    float _2078 = _2076;
    if (!_1632)
    {
        _1904 = _1536;
    }
    float _2080 = _1904;
    float _2082 = -_2058;
    float _2084 = fma(_2062, 2.0, _2082);
    float _2086 = _2080;
    if (_1632)
    {
        float _2088 = _1588 ? as_type<float>(_2070) : _1536;
        _2086 = _2088;
    }
    float _2090 = _2086;
    float _2092 = as_type<float>(_1495) * _2072;
    float _2094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2096 = ~_1437;
    int _2098 = _2096 + 1;
    float _2100 = fma(_2076, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2060);
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_1550)
    {
        _2104 = _386;
    }
    float _2106 = _2104;
    float _2108 = fma(_2076, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2064);
    float _2110 = _2106;
    if (_1550)
    {
        _2110 = _1419;
    }
    float _2112 = _2110;
    float _2114 = trunc(_2092);
    float _2116 = precise::max(_2114, 0.0);
    uint _2118 = uint(_2116);
    float _2120 = -_2102;
    float _2122 = fma(_1944, 2.0, _2120);
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2126 = fma(_2112, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1858);
    float _2128 = fma(_1918, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2124);
    float _2130 = fma(_2076, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2056);
    if (!_1550)
    {
        _2078 = _386;
    }
    float _2132 = _2078;
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2138 = _2132;
    if (_1550)
    {
        _2138 = _1419;
    }
    float _2140 = _2138;
    float _2142 = fma(_1786, _2028, _2130);
    float _2144 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2134);
    float _2146 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2136);
    if (!_1550)
    {
        _1449 = _716;
    }
    float _2148 = _1449;
    int _2150 = _2098 * int(_2118);
    int _2152 = _2150 + _2054;
    float _2154 = _2094 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2156 = _2140 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2158 = fma(_1784, _2028, _2100);
    float _2160 = float(uint(_2152));
    float _2162 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2164 = fma(_2154, _1570, -0.5);
    float _2166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2168 = as_type<float>(_1495) * _2160;
    float _2170 = fma(_2156, -2.0, _2162);
    int _2172 = ~_1437;
    int _2174 = _2172 + 1;
    float _2176 = fma(_1754, _2010, _2158);
    float _2178 = fma(_1756, _2010, _2142);
    float _2180 = fma(_1788, _2028, _2108);
    float _2182 = trunc(_2168);
    float _2184 = precise::max(_2182, 0.0);
    uint _2186 = uint(_2184);
    float _2188 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2190 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2144);
    float _2192 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2128);
    float _2194 = -_134;
    float _2196 = fma(_2194, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2122);
    float _2198 = fma(_1758, _2010, _2180);
    float _2200 = float(uint(_1922));
    float _2202 = _2166 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2204 = fma(_2190, _2188, _1838);
    float _2206 = fma(_2192, _2164, _2196);
    float _2208 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2146);
    float _2210 = fma(_2202, _2090, -0.5);
    float _2212 = -_134;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2084);
    float _2216 = as_type<float>(_1495) * _2200;
    float _2218 = fma(_1778, _1984, _2176);
    int _2220 = int(_2118) + int(_2186);
    float _2222 = fma(_2208, _2210, _2214);
    float _2224 = fma(_1780, _1984, _2178);
    float _2226 = trunc(_2216);
    float _2228 = precise::max(_2226, 0.0);
    uint _2230 = uint(_2228);
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2234 = _2174 * _2220;
    int _2236 = _2234 + _2054;
    float _2238 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2240 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2126);
    float _2242 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2170);
    int _2244 = ~_1437;
    int _2246 = _2244 + 1;
    float _2248 = fma(_2238, -2.0, _2232);
    bool _2250 = uint(_2236) >= uint(_1437);
    float _2252 = -_2242;
    float _2254 = fma(_2240, _1846, _2252);
    float _2256 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1870);
    bool _2258 = !_2250;
    int _2260 = _2258 ? 0 : (-1);
    float _2262 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2248);
    float _2264 = fma(_1814, _1962, _2224);
    float _2266 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2268 = ~_2220;
    int _2270 = _2268 + _2260;
    int _2272 = _2270 + 1;
    float _2274 = fma(_1782, _1984, _2198);
    int _2276 = _2246 * int(_2230);
    int _2278 = _2276 + _1922;
    float _2280 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2266);
    float _2282 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2284 = _1437 * _2272;
    int _2286 = _2284 + _2054;
    float _2288 = -_2262;
    float _2290 = fma(_2256, _1876, _2288);
    float _2292 = float(uint(_2278));
    float _2294 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2282);
    float _2296 = fma(_1828, _1962, _2218);
    bool _2298 = !_1804;
    int _2300 = _2298 ? _2286 : (-1);
    float _2302 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2280);
    float _2304 = as_type<float>(_1495) * _2292;
    float _2306 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2294);
    int _2308 = _2300 >> 31;
    float _2310 = fma(_1830, _1962, _2274);
    float _2312 = trunc(_2304);
    float _2314 = precise::max(_2312, 0.0);
    uint _2316 = uint(_2314);
    float _2318 = _2306 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _2320 = _2308 & 3;
    float _2322 = _2204 + 0.5;
    int _2324 = _2300 & 3;
    bool _2326 = _2324 != 0;
    float _2328 = _2206 + 0.5;
    int _2330 = _2300 + _2320;
    float _2332 = _2046 + 0.5;
    float _2334 = _2254 + 0.5;
    float _2336 = _2302 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2338 = _2330 >> 2;
    float _2340 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[128].y, _2264);
    bool _2342 = uint(_2324) > 1u;
    float _2344 = _2336 + _2318;
    int _2346 = _2338 << 4;
    int _2348 = _2346 + 368;
    float _2350 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[128].x, _2296);
    float _2352 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[128].z, _2310);
    int _2354 = ~_1437;
    int _2356 = _2354 + 1;
    uint _2358 = uint(int(uint(_2348) >> uint(2)));
    uint _2360 = uint(int(uint(int(_2358)) >> uint(2)));
    int _2362 = int(_2358) & 3;
    float _2364 = (*spvDescriptorSet0.vp_c9)._m0[int(_2360)][_2362];
    int _2366 = int(_2358) + 1;
    uint _2368 = uint(int(uint(_2366) >> uint(2)));
    int _2370 = _2366 & 3;
    float _2372 = (*spvDescriptorSet0.vp_c9)._m0[int(_2368)][_2370];
    int _2374 = _2300 & 3;
    bool _2376 = _2374 != 0;
    out.m_67.x = _2322;
    out.m_67.y = _2332;
    out.m_67.z = _2328;
    out.m_67.w = _2334;
    float _2378 = _2290 + 0.5;
    bool _2380 = _2324 != 3;
    float _2382 = _2222 + 0.5;
    int _2384 = int(_2230) + int(_2316);
    float _2386 = 1.0 / _2318;
    int _2388 = _2348 + 8;
    uint _2390 = uint(int(uint(_2388) >> uint(2)));
    uint _2392 = uint(int(uint(int(_2390)) >> uint(2)));
    int _2394 = int(_2390) & 3;
    float _2396 = (*spvDescriptorSet0.vp_c9)._m0[int(_2392)][_2394];
    int _2398 = int(_2390) + 1;
    uint _2400 = uint(int(uint(_2398) >> uint(2)));
    int _2402 = _2398 & 3;
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[int(_2400)][_2402];
    float _2406 = as_type<float>(_2230);
    if (!_1678)
    {
        _2406 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2408 = _2406;
    float _2410 = _2350 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_69.x = _2382;
    out.m_69.y = _2378;
    int _2412 = _2376 ? 0 : 1;
    bool _2414 = uint(_2324) >= 2u;
    int _2416 = _2356 * _2384;
    int _2418 = _2416 + _1922;
    int _2420 = ~_2412;
    int _2422 = _2420 + 1;
    int _2424 = _2422 + 1;
    float _2426 = _2344 * _2386;
    float _2428 = _2426 * 0.5;
    int _2430 = _2414 ? 0 : 1;
    int _2432 = _2424;
    float _2434 = _2408;
    float _2436 = _2410;
    if (!_2342)
    {
        int _2438 = ~_2412;
        int _2440 = _2438 + 1;
        _2432 = _2440;
    }
    int _2442 = _2432;
    if (!_1678)
    {
        float _2444 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2446 = fma(_2428, _2408, _2444);
        _2434 = _2446;
    }
    float _2448 = _2434;
    bool _2450 = uint(_2418) >= uint(_1437);
    bool _2452 = _2324 != 3;
    float _2454 = in.m_71.x;
    float _2456 = in.m_71.y;
    float _2458 = in.m_71.z;
    int _2460 = ~_2430;
    int _2462 = _2460 + 1;
    int _2464 = _2462 + 1;
    float _2466 = _2448;
    int _2468 = _2464;
    if (!_1678)
    {
        float _2470 = 1.0 / _2448;
        _2466 = _2470;
    }
    float _2472 = _2466;
    if (_2380)
    {
        int _2474 = ~_2430;
        int _2476 = _2474 + 1;
        _2468 = _2476;
    }
    int _2478 = _2468;
    bool _2480 = !_2326;
    int _2482 = _2480 ? 0 : 1;
    int _2484 = abs(_2442);
    bool _2486 = _724 != 0.0;
    bool _2488 = isnan(_724);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan(0.0);
    bool _2494 = _2490 || _2492;
    int _2496 = abs(_2478);
    int _2498 = abs(_2482);
    int _2500 = ~_2484;
    int _2502 = _2500 + 1;
    int _2504 = _2502 + 1;
    bool _2506 = _722 == 0.0;
    bool _2508 = !_2494;
    bool _2510 = _2506 && _2508;
    bool _2512 = !_2450;
    int _2514 = _2512 ? 0 : (-1);
    int _2516 = _2504 * as_type<int>(_2372);
    int _2518 = ~_2498;
    int _2520 = _2518 + 1;
    int _2522 = _2520 + 1;
    bool _2524 = _728 == 0.0;
    bool _2526 = _2524 && _2510;
    bool _2528 = !_2452;
    int _2530 = _2528 ? 0 : (-1);
    int _2532 = _2522 * as_type<int>(_2364);
    int _2534 = _2532 + _2516;
    int _2536 = ~_2384;
    int _2538 = _2536 + _2514;
    int _2540 = _2538 + 1;
    bool _2542 = !_1628;
    int _2544 = _2542 ? 0 : 1;
    int _2546 = abs(_2530);
    int _2548 = _1437 * _2540;
    int _2550 = _2548 + _1922;
    int _2552 = abs(_2544);
    int _2554 = ~_2496;
    int _2556 = _2554 + 1;
    int _2558 = _2556 + 1;
    float _2560 = _2456;
    float _2562 = _2454;
    float _2564 = _2458;
    if (!_2526)
    {
        float _2566 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2456);
        _2560 = _2566;
    }
    float _2568 = _2560;
    if (!_2526)
    {
        float _2570 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2454);
        _2562 = _2570;
    }
    float _2572 = _2562;
    if (!_2526)
    {
        float _2574 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2458);
        _2564 = _2574;
    }
    float _2576 = _2564;
    int _2578 = _2558 * as_type<int>(_2396);
    int _2580 = _2578 + _2534;
    int _2582 = ~_2546;
    int _2584 = _2582 + 1;
    int _2586 = _2584 + 1;
    float _2588 = _680 * _2568;
    float _2590 = _682 * _2568;
    float _2592 = _678 * _2568;
    int _2594 = ~_2552;
    int _2596 = _2594 + 1;
    int _2598 = _2596 + 1;
    int _2600 = _2586 * as_type<int>(_2404);
    int _2602 = _2600 + _2580;
    float _2604 = as_type<float>(_2580);
    float _2606 = as_type<float>(_2602);
    if (!_1678)
    {
        _2604 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2608 = _2604;
    float _2610 = fma(_742, _2572, _2590);
    bool _2612 = !_1804;
    int _2614 = _2612 ? _2550 : (-1);
    int _2616 = _2602 * _2598;
    float _2618 = fma(_740, _2572, _2588);
    if (!_1678)
    {
        float _2620 = -_2608;
        float _2622 = _2620 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2606 = _2622;
    }
    float _2624 = _2606;
    float _2626 = fma(_744, _2572, _2592);
    float _2628 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2630 = _2614 * _2552;
    int _2632 = _2630 + _2616;
    float _2634 = fma(_396, _2576, _2618);
    float _2636 = fma(_400, _2576, _2610);
    float _2638 = _2624;
    if (!_1678)
    {
        float _2640 = 1.0 / _2624;
        _2638 = _2640;
    }
    float _2642 = _2638;
    float _2644 = fma(_398, _2576, _2626);
    if (!_1678)
    {
        float _2646 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2648 = -_2608;
        float _2650 = fma(_2472, _2646, _2648);
        _934 = _2650;
    }
    float _2652 = _934;
    float _2654 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2628);
    float _2656 = _2340 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2658 = _2410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1678)
    {
        _2436 = 1.0;
    }
    float _2660 = _2436;
    out.m_73.x = _2634;
    out.m_73.y = _2636;
    out.m_73.z = _2644;
    float _2662 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2654);
    float _2664 = float(_2632);
    float _2666 = _1362 + _1324;
    float _2668 = _2352 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2670 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2662);
    float _2672 = _1324 * 0.5;
    out.m_75.x = _2664;
    float _2674 = _2666 * 0.5;
    float _2676 = _2660;
    if (!_1678)
    {
        float _2678 = _2652 * _2642;
        float _2680 = precise::clamp(_2678, 0.0, 1.0);
        _2676 = _2680;
    }
    float _2682 = _2676;
    float _2684 = _2670 + _1324;
    float _2686 = _2656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2688 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2690 = _2682 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2692 = _2682 > 0.0;
    bool _2694 = isnan(_2682);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan(0.0);
    bool _2700 = _2696 || _2698;
    float _2702 = _2668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2704 = _2688 * _1392;
    float _2706 = -_2688;
    float _2708 = _2706 + 1.0;
    float _2710 = _2690 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2712 = _1403 * _2704;
    float _2714 = _1413 * _2704;
    float _2716 = _2684 * 0.5;
    float _2718 = fma(_1364, -0.5, _2672);
    float _2720 = fma(_1409, _2712, _1397);
    float _2722 = fma(_1411, _2712, _1399);
    float _2724 = _1403 * _2708;
    float _2726 = fma(_1403, _2714, _1401);
    out.m_77.x = _2658;
    out.m_77.y = _2686;
    out.m_77.z = _2702;
    out.gl_Position.x = _1362;
    out.gl_Position.y = _1364;
    out.gl_Position.z = _2670;
    out.gl_Position.w = _1324;
    out.m_79.x = _2674;
    out.m_79.y = _2718;
    out.m_79.z = _2716;
    out.m_79.w = _1324;
    out.m_45.x = _2710;
    out.m_81.x = _2720;
    out.m_81.y = _2722;
    out.m_81.z = _2726;
    out.m_81.w = _2724;
    if (_2700)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2728 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2728;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _326 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2785 = as_type<float>(_116);
        out.gl_Position.z = _2785;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_100);
        _110 = _136;
    }
    float _138 = _110;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2854 = as_type<float>(_152);
        out.gl_Position.z = _2854;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_49.y;
    float _156 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = in.m_42.x;
    float _176 = in.m_42.y;
    float _178 = in.m_42.z;
    float _180 = in.m_51.x;
    float _182 = in.m_51.y;
    float _184 = in.m_51.z;
    float _186 = in.m_51.w;
    float _188 = 0.0;
    float _190 = _156;
    if (!_166)
    {
        float _192 = _156 * _156;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_166)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_166;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _156 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _156);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_166;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _156 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    out.m_53.y = _154;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = _184 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = fma(_262, _168, _266);
    float _276 = fma(_262, _170, _268);
    float _278 = fma(_262, _172, _270);
    float _280 = fma(_274, _186, _174);
    float _282 = fma(_276, _186, _176);
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _286 = fma(_278, _186, _178);
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _290 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _294 = _182 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _296 = _284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _298 = _288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _300 = _292 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _302 = !_264;
    float _304 = _296;
    int _306 = as_type<int>(_298);
    float _324;
    if (!_302)
    {
        float _308 = in.m_55.x;
        float _310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _312 = _308 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[11].z, _134);
        float _316 = _314 * _310;
        float _318 = floor(_316);
        float _320 = -_318;
        float _322 = _316 + _320;
        _324 = _322;
        _326 = true;
    }
    else
    {
        float _328 = float(_100);
        float _330 = 1.0 / _328;
        float _332 = _134 * _330;
        _324 = _332;
    }
    _326 = false;
    float _334 = _324;
    float _336 = _282 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _338 = _282 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _340 = _282 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _342 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].x, _336);
    float _344 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].x, _338);
    float _346 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].x, _340);
    float _348 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].z, _342);
    float _350 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].z, _344);
    float _352 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].z, _346);
    float _354 = _348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _356 = _350 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _358 = _352 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _360 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _362 = -_354;
    float _364 = _362 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _366 = -_356;
    float _368 = _366 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _370 = -_358;
    float _372 = _370 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _374 = _364 * _364;
    float _376 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _378 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _380 = fma(_368, _368, _374);
    float _382 = -_360;
    float _384 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _382);
    float _386 = in.m_55.z;
    float _388 = 1.0 / _294;
    float _390 = fma(_372, _372, _380);
    float _392 = rsqrt(_390);
    float _394 = _294 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _396 = _368 * _392;
    float _398 = _372 * _392;
    float _400 = _364 * _392;
    float _402 = _396 * _396;
    float _404 = fma(_398, _398, _402);
    float _406 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _408 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _410 = rsqrt(_404);
    float _412 = -_406;
    float _414 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _412);
    float _416 = -_408;
    float _418 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _416);
    float _420 = -_376;
    float _422 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _420);
    float _424 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _426 = _414 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _428 = -_424;
    float _430 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _428);
    float _432 = -_378;
    float _434 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _432);
    float _436 = _418 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _438 = -_426;
    float _440 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[1].y, _438);
    float _442 = _418 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _444 = _434 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _446 = -_436;
    float _448 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[1].x, _446);
    float _450 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[1].w, _440);
    float _452 = _398 * _410;
    float _454 = _396 * _410;
    float _456 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[1].w, _448);
    float _458 = -_442;
    float _460 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[1].x, _458);
    float _462 = -_452;
    float _464 = _398 * _462;
    float _466 = -_452;
    float _468 = _400 * _466;
    float _470 = _456 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _472 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[1].w, _460);
    float _474 = -_464;
    float _476 = fma(_396, _454, _474);
    float _478 = _400 * _454;
    float _480 = -_470;
    float _482 = fma(_450, (*spvDescriptorSet0.vp_c8)._m0[0].x, _480);
    float _484 = -_444;
    float _486 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _484);
    float _488 = _476 * _476;
    float _490 = _418 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _492 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[0].z, _482);
    float _494 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[1].z, _486);
    float _496 = fma(_478, _478, _488);
    float _498 = -_490;
    float _500 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[0].x, _498);
    float _502 = _414 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _504 = -_494;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[0].w, _492);
    float _508 = fma(_468, _468, _496);
    float _510 = fma(_434, (*spvDescriptorSet0.vp_c8)._m0[0].w, _500);
    float _512 = -_502;
    float _514 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[0].y, _512);
    float _516 = 1.0 / _506;
    float _518 = _418 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _520 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[0].w, _514);
    float _522 = -_518;
    float _524 = fma(_414, (*spvDescriptorSet0.vp_c8)._m0[0].x, _522);
    float _526 = rsqrt(_508);
    float _528 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[0].w, _524);
    float _530 = fma(_510, _516, -1.0);
    float _532 = _476 * _526;
    float _534 = precise::clamp(_532, 0.0, 1.0);
    float _536 = 1.0 / _272;
    float _538 = -_534;
    float _540 = _538 + 1.0;
    float _542 = _540 * _516;
    float _544 = fma(_540, _530, 1.0);
    float _546 = _520 * _542;
    float _548 = _544 * _544;
    float _550 = _528 * _542;
    float _552 = 1.0 / _290;
    float _554 = fma(_546, _546, _548);
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _558 = _358 + _556;
    float _560 = fma(_550, _550, _554);
    float _562 = rsqrt(_560);
    float _564 = _550 * _562;
    float _566 = _546 * _562;
    float _568 = _544 * _562;
    float _570 = -_564;
    float _572 = _396 * _570;
    float _574 = _398 * _568;
    float _576 = -_566;
    float _578 = -_572;
    float _580 = fma(_398, _576, _578);
    float _582 = -_566;
    float _584 = _400 * _582;
    float _586 = -_564;
    float _588 = -_574;
    float _590 = fma(_400, _586, _588);
    float _592 = _580 * _580;
    float _594 = -_584;
    float _596 = fma(_396, _568, _594);
    float _598 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _600 = _354 + _598;
    float _602 = fma(_590, _590, _592);
    float _604 = _600 * _600;
    float _606 = fma(_596, _596, _602);
    float _608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _610 = _356 + _608;
    float _612 = fma(_610, _610, _604);
    float _614 = rsqrt(_606);
    float _616 = fma(_558, _558, _612);
    float _618 = _590 * _614;
    float _620 = _596 * _614;
    float _622 = _580 * _614;
    float _624 = _398 * _618;
    float _626 = _400 * _620;
    float _628 = -_624;
    float _630 = fma(_396, _620, _628);
    float _632 = -_626;
    float _634 = fma(_398, _622, _632);
    float _636 = _396 * _622;
    float _638 = rsqrt(_616);
    float _640 = _630 * _630;
    float _642 = -_636;
    float _644 = fma(_400, _618, _642);
    float _646 = fma(_634, _634, _640);
    float _648 = fma(_644, _644, _646);
    float _650 = rsqrt(_648);
    float _652 = _600 * _638;
    float _654 = _610 * _638;
    float _656 = _558 * _638;
    float _658 = -_652;
    float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[18].w, _600);
    float _662 = -_654;
    float _664 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[18].w, _610);
    float _666 = -_656;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _670 = -_654;
    float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[18].w, _356);
    float _674 = _660 * _660;
    float _676 = fma(_664, _664, _674);
    float _678 = _644 * _650;
    float _680 = _634 * _650;
    float _682 = _630 * _650;
    float _684 = fma(_668, _668, _676);
    float _686 = _396 * _678;
    float _688 = _400 * _680;
    float _690 = _398 * _682;
    float _692 = -_686;
    float _694 = fma(_398, _680, _692);
    float _696 = -_688;
    float _698 = fma(_396, _682, _696);
    float _700 = in.m_57.x;
    float _702 = in.m_57.y;
    float _704 = in.m_57.z;
    float _706 = -_690;
    float _708 = fma(_400, _678, _706);
    float _710 = _694 * _694;
    float _712 = sqrt(_684);
    float _714 = fma(_708, _708, _710);
    float _716 = in.m_55.x;
    float _718 = fma(_698, _698, _714);
    float _720 = rsqrt(_718);
    float _722 = _552 * _700;
    float _724 = _388 * _702;
    float _726 = _638 * _712;
    float _728 = _536 * _704;
    float _730 = _290 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _732 = _386 * 6.283185482025146484375;
    float _734 = _272 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _724);
    float _738 = _726 * _394;
    float _740 = _708 * _720;
    float _742 = _694 * _720;
    float _744 = _698 * _720;
    float _746 = fma(_134, 0.310000002384185791015625, _732);
    float _748 = _726 * _730;
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _722);
    float _752 = _738 * _736;
    float _754 = _716 * 6.283185482025146484375;
    float _756 = _746 * 0.15915493667125701904296875;
    float _758 = _726 * _734;
    float _760 = _748 * _750;
    float _762 = _752 * _682;
    float _764 = fma(_134, 0.10999999940395355224609375, _754);
    float _766 = _752 * _680;
    float _768 = _752 * _678;
    float _770 = _728 * _758;
    float _772 = fma(_760, _742, _762);
    float _774 = _764 * 0.15915493667125701904296875;
    float _776 = fma(_760, _740, _766);
    float _778 = _756 * 6.283185482025146484375;
    float _780 = sin(_778);
    float _782 = fma(_770, _400, _772);
    float _784 = fma(_760, _744, _768);
    float _786 = fma(_770, _396, _776);
    float _788 = _782 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _790 = fma(_770, _398, _784);
    float _792 = _782 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _794 = _774 * 6.283185482025146484375;
    float _796 = sin(_794);
    float _798 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].z, _788);
    float _800 = _782 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _802 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].y, _792);
    float _804 = _354 + _782;
    float _806 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].z, _798);
    float _808 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].x, _800);
    float _810 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].y, _802);
    float _812 = fma(_780, 0.12999999523162841796875, 1.0);
    float _814 = _758 * _806;
    float _816 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].x, _808);
    float _818 = _738 * _810;
    float _820 = _358 + _790;
    float _822 = _814 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _824 = _748 * _816;
    float _826 = _814 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _828 = fma(_796, 0.300000011920928955078125, _812);
    float _830 = -_154;
    float _832 = fma(_830, 0.5, 0.5);
    float _834 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[10].y, _822);
    float _836 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[8].y, _826);
    float _838 = _356 + _786;
    float _840 = _828 * _832;
    float _842 = fma(_824, (*spvDescriptorSet0.vp_c10)._m0[10].x, _834);
    float _844 = _738 * _840;
    float _846 = _844 * 2.0;
    float _848 = fma(_824, (*spvDescriptorSet0.vp_c10)._m0[8].x, _836);
    float _850 = _820 + _842;
    float _852 = _838 + _848;
    float _854 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[32].z, _850);
    float _856 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[32].x, _852);
    float _858 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _860 = _854 + _858;
    float _862 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _864 = _856 + _862;
    float _866 = _860 * _860;
    float _868 = fma(_864, _864, _866);
    float _870 = _814 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _872 = sqrt(_868);
    float _874 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[9].y, _870);
    float _876 = fma(_824, (*spvDescriptorSet0.vp_c10)._m0[9].x, _874);
    float _878 = _804 + _876;
    float _880 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[32].y, _878);
    bool _882 = _872 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _886 = _884 != 0;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _890 = _888 != 0;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _894 = _892 != 0;
    bool _896 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _898 = isnan(0.5);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _904 = _900 || _902;
    bool _906 = !_890;
    int _908 = _906 ? 0 : 1;
    bool _910 = !_886;
    int _912 = _910 ? 0 : 1;
    bool _914 = !_894;
    int _916 = _914 ? 0 : 1;
    float _918 = _824;
    float _920 = _878;
    float _922 = _876;
    float _924 = _856;
    float _926 = _814;
    float _928 = _758;
    bool _930 = false;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _934 = _722;
    if (!_882)
    {
        _918 = _856;
    }
    float _936 = _918;
    float _938 = _936;
    if (!_882)
    {
        _920 = _854;
    }
    float _940 = _920;
    float _942 = _940;
    if (!_882)
    {
        _922 = _880;
    }
    float _944 = _922;
    bool _946 = !_882;
    float _948 = _944;
    if (!_946)
    {
        float _950 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _952 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _954 = _872 + _952;
        float _956 = rsqrt(_868);
        float _958 = _954 * _950;
        float _960 = _880 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _962 = _958 * 0.15915493667125701904296875;
        float _964 = _962 * 6.283185482025146484375;
        float _966 = cos(_964);
        float _968 = _962 * 6.283185482025146484375;
        float _970 = sin(_968);
        float _972 = _966 + (-1.0);
        float _974 = _972 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _976 = fma(_970, _960, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _978 = fma(_880, _966, _974);
        float _980 = _956 * _976;
        float _982 = fma(_864, _980, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _984 = fma(_860, _980, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _948 = _978;
        _942 = _984;
        _938 = _982;
        _924 = _956;
    }
    float _986 = _948;
    float _988 = _942;
    float _990 = _938;
    float _992 = _924;
    float _994 = -_652;
    float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _986);
    float _998 = -_656;
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[18].w, _988);
    float _1002 = -_654;
    float _1004 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[18].w, _990);
    float _1006 = -_652;
    float _1008 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[18].w, _354);
    float _1010 = -_656;
    float _1012 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[18].w, _358);
    float _1014 = _996;
    float _1016 = _1004;
    float _1018 = _1000;
    float _1020 = _992;
    if (!_904)
    {
        float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1024 = _1008 + _1022;
        float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1028 = _672 + _1026;
        float _1030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1032 = -_356;
        float _1034 = _1032 + _990;
        float _1036 = _1024 * _1024;
        float _1038 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1040 = _1012 + _1038;
        float _1042 = -_354;
        float _1044 = _1042 + _986;
        float _1046 = -_358;
        float _1048 = _1046 + _988;
        float _1050 = fma(_1028, _1028, _1036);
        float _1052 = fma(_1040, _1040, _1050);
        float _1054 = 1.0 / _726;
        float _1056 = sqrt(_1052);
        float _1058 = precise::min(_1056, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1060 = _1058 * _1030;
        float _1062 = _1060 * _1054;
        float _1064 = fma(_1034, _1062, _672);
        float _1066 = fma(_1044, _1062, _1008);
        float _1068 = fma(_1048, _1062, _1012);
        _1014 = _1066;
        _1016 = _1064;
        _1018 = _1068;
        _926 = _1030;
        _1020 = _1056;
    }
    float _1070 = _1014;
    float _1072 = _1016;
    float _1074 = _1018;
    float _1076 = _926;
    float _1078 = _1020;
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1082 = _1070 + _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1072 + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1090 = _1074 + _1088;
    float _1092 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1094 = _1082 * _1082;
    float _1096 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1092);
    float _1098 = fma(_1086, _1086, _1094);
    float _1100 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1096);
    float _1102 = fma(_1090, _1090, _1098);
    float _1104 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1106 = rsqrt(_1102);
    float _1108 = sqrt(_1102);
    float _1110 = _1106 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1112 = _1086 * _1110;
    float _1114 = _1090 * _1110;
    float _1116 = _1112 * _1112;
    float _1118 = _1114 * _1114;
    float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1122 = fma(_1108, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1120);
    float _1124 = precise::clamp(_1122, 0.0, 1.0);
    float _1126 = _1116 + _1118;
    float _1128 = -_1124;
    float _1130 = _1128 + 1.0;
    float _1132 = sqrt(_1126);
    bool _1134 = _1132 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1138 = _1132 + _1136;
    float _1140 = _1098;
    float _1142 = _1078;
    float _1144 = _1138;
    float _1146 = _1076;
    float _1148 = _1112;
    if (_1134)
    {
        float _1150 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1140 = _1150;
    }
    float _1152 = _1140;
    if (_1134)
    {
        float _1154 = rsqrt(_1126);
        _1142 = _1154;
    }
    float _1156 = _1142;
    float _1158 = _1156;
    if (_1134)
    {
        float _1160 = _1138 * _1152;
        _1144 = _1160;
    }
    float _1162 = _1144;
    if (_1134)
    {
        float _1164 = _1162 * 0.15915493667125701904296875;
        _1146 = _1164;
    }
    float _1166 = _1146;
    float _1168 = _1152;
    if (_1134)
    {
        float _1170 = _1166 * 6.283185482025146484375;
        float _1172 = sin(_1170);
        _1168 = _1172;
    }
    float _1174 = _1168;
    float _1176 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1178 = precise::max(0.0, _1176);
    float _1180 = _990;
    float _1182 = _1178;
    if (_1134)
    {
        float _1184 = _1166 * 6.283185482025146484375;
        float _1186 = cos(_1184);
        _1180 = _1186;
    }
    float _1188 = _1180;
    float _1190 = -_1110;
    float _1192 = -_1178;
    float _1194 = fma(_1082, _1190, _1192);
    if (_1134)
    {
        float _1196 = _1194 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1182 = _1196;
    }
    float _1198 = _1182;
    float _1200 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1202 = _1174;
    float _1204 = _1198;
    if (_1134)
    {
        float _1206 = fma(_1174, _1198, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1202 = _1206;
    }
    float _1208 = _1202;
    float _1210 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1200);
    float _1212 = _1208;
    float _1214 = _1188;
    if (_1134)
    {
        float _1216 = _1188 + (-1.0);
        _1204 = _1216;
    }
    float _1218 = _1204;
    float _1220 = _1218;
    if (_1134)
    {
        float _1222 = _1156 * _1208;
        _928 = _1222;
    }
    float _1224 = _928;
    if (!_1134)
    {
        _1212 = _1194;
    }
    float _1226 = _1212;
    float _1228 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1210);
    float _1230 = _1226;
    if (_1134)
    {
        float _1232 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1158 = _1232;
    }
    float _1234 = _1158;
    float _1236 = _1234;
    if (_1134)
    {
        float _1238 = _1112 * _1224;
        _1148 = _1238;
    }
    float _1240 = _1148;
    if (!_1134)
    {
        _1220 = _1114;
    }
    float _1242 = _1220;
    float _1244 = _1242;
    if (_1134)
    {
        float _1246 = _1114 * _1224;
        _1244 = _1246;
    }
    float _1248 = _1244;
    if (_1134)
    {
        float _1250 = fma(_1194, _1188, _1234);
        _1230 = _1250;
    }
    float _1252 = _1230;
    if (!_1134)
    {
        _1236 = _1116;
    }
    float _1254 = _1236;
    float _1256 = _1254;
    if (_1134)
    {
        float _1258 = _1240 * _1240;
        _1256 = _1258;
    }
    float _1260 = _1256;
    float _1262 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1134)
    {
        _1214 = _1118;
    }
    float _1264 = _1214;
    float _1266 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1268 = _1264;
    if (_1134)
    {
        float _1270 = _1248 * _1248;
        _1268 = _1270;
    }
    float _1272 = _1268;
    float _1274 = fma(_1252, _1252, _1260);
    float _1276 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1262);
    float _1278 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1266);
    float _1280 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1282 = _1274 + _1272;
    float _1284 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1276);
    float _1286 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1278);
    float _1288 = abs(_1130);
    float _1290 = log2(_1288);
    float _1292 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1294 = _1286 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1296 = _1104 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1298 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1300 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1302 = rsqrt(_1282);
    float _1304 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1298);
    float _1306 = -_1296;
    float _1308 = fma(_1306, _1300, 1.0);
    float _1310 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1304);
    float _1312 = log2(_1308);
    float _1314 = _1302 * _1240;
    float _1316 = _1302 * _1252;
    float _1318 = _1302 * _1248;
    float _1320 = _1290 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1322 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1324 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1310);
    float _1326 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1328 = _1316 + 1.0;
    float _1330 = -_1322;
    float _1332 = fma(_1316, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1330);
    float _1334 = 1.0 / _1324;
    float _1336 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1326);
    float _1338 = -_1318;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1332);
    float _1342 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1344 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1336);
    float _1346 = fma(_1340, -0.5, 0.5);
    float _1348 = exp2(_1320);
    float _1350 = fma(_1340, 0.5, 0.5);
    float _1352 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1342);
    float _1354 = fma(_1350, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1356 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1352);
    float _1358 = sqrt(_1346);
    float _1360 = fma(_1350, _1354, -0.212114393711090087890625);
    float _1362 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1356);
    float _1364 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1344);
    float _1366 = _1312 * 0.693147182464599609375;
    float _1368 = fma(_1350, _1360, 1.570728778839111328125);
    float _1370 = _1362 * _1334;
    float _1372 = _1364 * _1334;
    float _1374 = -_1316;
    float _1376 = fma(_1348, _1328, _1374);
    float _1378 = _1366 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1380 = fma(_1370, 0.5, 0.5);
    float _1382 = fma(_1372, -0.5, 0.5);
    float _1384 = fma(_1376, 0.5, 0.5);
    float _1386 = _1358 * 0.636619746685028076171875;
    float _1388 = -_1368;
    float _1390 = fma(_1386, _1388, 1.0);
    float3 _4872 = float3(_1380, _1382, _1378);
    float _1392 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4872, float3(0.0), isnan(_4872)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4872, float3(0.0), isnan(_4872)), level(0.0)).x;
    float3 _4883 = float3(_1380, _1382, _1378);
    float4 _1395 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4883, float3(0.0), isnan(_4883)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4883, float3(0.0), isnan(_4883)), level(0.0)).xyzw;
    float _1397 = _1395.x;
    float _1399 = _1395.y;
    float _1401 = _1395.z;
    float _1403 = _1395.w;
    float2 _4900 = float2(_1390, _1384);
    float3 _1407 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4900, float2(0.0), isnan(_4900)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4900, float2(0.0), isnan(_4900)), level(0.0)).xyz;
    float _1409 = _1407.x;
    float _1411 = _1407.y;
    float _1413 = _1407.z;
    float _1415 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1417 = int(_1415);
    float _1419 = in.m_55.y;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1423 = _1421 != 0;
    float _1425 = _1290 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1429 = _1427 != 0;
    out.m_59.x = _296;
    out.m_59.y = _298;
    out.m_59.z = _300;
    int _1431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1433 = _1431 != 0;
    float _1435 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1437 = int(_1435);
    bool _1439 = _386 > 0.5;
    float _1441 = in.m_61.w;
    out.m_63.x = _1086;
    out.m_63.y = _1082;
    out.m_63.z = _1090;
    float _1443 = exp2(_1425);
    float _1445 = float(_1417);
    float _1447 = in.m_49.x;
    float _1449 = _1419;
    if (_1429)
    {
        bool _1451 = _716 > 0.5;
        _930 = _1451;
    }
    bool _1453 = _930;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1457 = 1.0 / _1445;
    float _1459 = float(uint(_1437));
    int _1461 = ~_1437;
    int _1463 = _1461 + 1;
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1465;
    int _1469 = ~_1437;
    int _1471 = _1469 + 1;
    float _1473 = float(_1437);
    float _1475 = 1.0 / _1459;
    out.m_65.w = _1441;
    int _1477 = abs(_916);
    float _1479 = _134 * _1473;
    float _1481 = -_1443;
    float _1483 = _1481 + 1.0;
    float _1485 = _134 * _1457;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1489 = _334 + _1487;
    float _1491 = trunc(_1485);
    int _1493 = int(_1491);
    int _1495 = as_type<int>(_1475) + (-2);
    float _1497 = float(uint(_1493));
    float _1499 = float(_1493);
    float _1501 = as_type<float>(_1495) * _1497;
    float _1503 = trunc(_1501);
    float _1505 = precise::max(_1503, 0.0);
    uint _1508 = uint(_1505);
    int _1510 = _1463 * int(_1508);
    int _1512 = _1510 + _1493;
    float _1514 = float(uint(_1512));
    float _1516 = as_type<float>(_1495) * _1514;
    float _1518 = _1514;
    int _1520 = _1463;
    if (!_1429)
    {
        _1518 = _1447;
    }
    float _1522 = _1518;
    float _1524 = _1522;
    if (!_1429)
    {
        _932 = _1522;
    }
    float _1526 = _932;
    float _1528 = trunc(_1516);
    float _1530 = precise::max(_1528, 0.0);
    uint _1532 = uint(_1530);
    float _1534 = _1526;
    if (_1429)
    {
        _1524 = _1447;
    }
    float _1536 = _1524;
    if (!_1433)
    {
        _304 = _1536;
    }
    float _1538 = _304;
    float _1540 = _1538;
    if (_1429)
    {
        float _1542 = -_1536;
        float _1544 = _1542 + 1.0;
        _306 = as_type<int>(_1544);
    }
    int _1546 = _306;
    int _1548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1550 = _1548 != 0;
    if (_1433)
    {
        float _1552 = -_1536;
        float _1554 = _1552 + 1.0;
        _1520 = as_type<int>(_1554);
    }
    int _1556 = _1520;
    float _1558 = in.m_55.w;
    if (_1429)
    {
        float _1560 = _1453 ? as_type<float>(_1546) : _1536;
        _1534 = _1560;
    }
    float _1562 = _1534;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    if (_1433)
    {
        float _1568 = _1439 ? as_type<float>(_1556) : _1536;
        _1540 = _1568;
    }
    float _1570 = _1540;
    int _1572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1574 = _1572 != 0;
    float _1576 = 1.0 / _1566;
    int _1578 = int(_1508) + int(_1532);
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1580;
    float _1584 = -_154;
    float _1586 = _1584 + 1.0;
    bool _1588 = _1419 > 0.5;
    int _1590 = _1471 * _1578;
    int _1592 = _1590 + _1493;
    bool _1594 = !_1574;
    int _1596 = _1594 ? 0 : 1;
    float _1598 = 1.0 / _1582;
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1602 = _1600 != 0;
    bool _1604 = uint(_1592) >= uint(_1437);
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1606;
    int _1610 = _1588 ? as_type<int>(_1586) : as_type<int>(_154);
    bool _1612 = !_1604;
    int _1614 = _1612 ? 0 : (-1);
    float _1616 = 1.0 / _1608;
    float _1618 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1620 = _1618 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    int _1622 = _1439 ? as_type<int>(_1586) : as_type<int>(_154);
    float _1624 = _1602 ? as_type<float>(_1610) : _154;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1628 = _1626 != 0;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1632 = _1630 != 0;
    float _1634 = 1.0 / _1620;
    int _1636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1638 = _1636 != 0;
    int _1640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1642 = _1640 != 0;
    float _1644 = float(_100);
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1648 = _334 + _1646;
    float _1650 = _1489 * _1616;
    float _1652 = _1638 ? as_type<float>(_1622) : _154;
    float _1654 = 1.0 / _1644;
    bool _1656 = _1558 > 0.5;
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1658;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1664 = _716 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1666 = _1656 ? as_type<int>(_1586) : as_type<int>(_154);
    float _1668 = _1648 * _1576;
    bool _1670 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1672 = isnan(0.5);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1678 = _1674 || _1676;
    float _1680 = -_1662;
    float _1682 = fma(_1664, 2.0, _1680);
    float _1684 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1686 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1688 = _334 + _1686;
    float _1690 = 1.0 / _1660;
    float _1692 = fma(_1684, -2.0, _1455);
    float _1694 = _1688 * _1598;
    float _1696 = _1479 * _1654;
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1698;
    float _1702 = _1642 ? as_type<float>(_1666) : _154;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1706 = _334 + _1704;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1710 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1708;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1712;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1718 = _1716 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1722 = _334 + _1720;
    float _1724 = _1706 * _1634;
    float _1726 = fma(_1710, _1694, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1728 = fma(_1700, _1694, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1730 = fma(_1714, _1694, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1740;
    bool _1744 = !_1550;
    float _1746 = _1744 ? 7.345489978790283203125 : 1.0;
    float _1748 = _1722 * _1690;
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1752 = _1750 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1754 = fma(_1734, _1650, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1756 = fma(_1738, _1650, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1758 = fma(_1742, _1650, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1760 = _1746 * _716;
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1764 = _1762 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1768 = _1766 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1772 = _1770 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1778 = fma(_1764, _1724, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1780 = fma(_1768, _1724, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1782 = fma(_1772, _1724, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1784 = fma(_1718, _1668, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1786 = fma(_1776, _1668, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1788 = fma(_1752, _1668, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1792 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1692);
    int _1794 = ~_1578;
    int _1796 = _1794 + _1614;
    int _1798 = _1796 + 1;
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1800;
    bool _1804 = _1437 == 0;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1806;
    int _1810 = abs(_1596);
    float _1812 = floor(_1760);
    float _1814 = fma(_1802, _1748, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    bool _1816 = _1499 >= _1473;
    bool _1818 = isnan(_1499);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan(_1473);
    bool _1824 = _1820 || _1822;
    float _1826 = float(_1824);
    float _1828 = fma(_1808, _1748, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1830 = fma(_1467, _1748, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    int _1832 = _1437 * _1798;
    int _1834 = _1832 + _1493;
    float _1836 = -_134;
    float _1838 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1682);
    float _1840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1842 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1844 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1846 = fma(_1702, _1842, -0.5);
    float _1848 = trunc(_1826);
    int _1850 = int(_1848);
    float _1852 = -_1812;
    float _1854 = _1760 + _1852;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1860 = _1854 * _1473;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1864 = _1840 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1866 = !_1804;
    int _1868 = _1866 ? _1834 : (-1);
    float _1870 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1856);
    float _1872 = trunc(_1860);
    int _1874 = int(_1872);
    float _1876 = fma(_1652, _1864, -0.5);
    int _1878 = abs(_908);
    float _1880 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1862);
    int _1882 = ~_1850;
    int _1884 = _1882 + 1;
    int _1886 = _1884 + 1;
    bool _1888 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1890 = isnan(_334);
    bool _1892 = _1888 || _1890;
    bool _1894 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1896 = _1892 || _1894;
    float _1898 = float(_1896);
    float _1900 = as_type<float>(_1834);
    int _1902 = as_type<int>(_1726);
    float _1904 = _1730;
    if (!_1550)
    {
        _1900 = _1419;
    }
    float _1906 = _1900;
    int _1908 = _1868 * _1886;
    int _1910 = _1437 + (-1);
    float _1912 = trunc(_1696);
    int _1914 = int(_1912);
    float _1916 = _1906;
    if (_1550)
    {
        _1916 = _716;
    }
    float _1918 = _1916;
    int _1920 = _1874 * _1810;
    int _1922 = _1920 + _1493;
    float _1924 = -_1898;
    float _1926 = _1924 + 1.0;
    int _1928 = _1850 * _1910;
    int _1930 = _1928 + _1908;
    bool _1932 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1934 = isnan(_334);
    bool _1936 = _1932 || _1934;
    bool _1938 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1940 = _1936 || _1938;
    float _1942 = float(_1940);
    float _1944 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1946 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1948 = isnan(_334);
    bool _1950 = _1946 || _1948;
    bool _1952 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1954 = _1950 || _1952;
    float _1956 = float(_1954);
    int _1958 = _1930 * _1878;
    int _1960 = abs(_912);
    float _1962 = _1942 * _1926;
    float _1964 = -_1942;
    float _1966 = _1964 + 1.0;
    bool _1968 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1970 = isnan(_334);
    bool _1972 = _1968 || _1970;
    bool _1974 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1976 = _1972 || _1974;
    float _1978 = float(_1976);
    float _1980 = -_1956;
    float _1982 = _1980 + 1.0;
    float _1984 = _1956 * _1966;
    int _1986 = _1914 * _1960;
    int _1988 = _1986 + _1958;
    bool _1990 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1992 = isnan(_334);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    float _2002 = -_1978;
    float _2004 = _2002 + 1.0;
    bool _2006 = !_1423;
    int _2008 = _2006 ? 0 : 1;
    float _2010 = _1978 * _1982;
    int _2012 = _1922 * _1477;
    int _2014 = _2012 + _1988;
    bool _2016 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2018 = isnan(_334);
    bool _2020 = _2016 || _2018;
    bool _2022 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2024 = _2020 || _2022;
    float _2026 = float(_2024);
    float _2028 = _2000 * _2004;
    float _2030 = -_2000;
    float _2032 = _2030 + 1.0;
    int _2034 = abs(_2008);
    float _2036 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1880);
    float _2038 = _2000;
    if (_1550)
    {
        _2038 = _716;
    }
    float _2040 = _2038;
    float _2042 = _2026 * _2032;
    float _2044 = -_1792;
    float _2046 = fma(_2036, _1844, _2044);
    float _2048 = _2040;
    if (!_1550)
    {
        _2048 = _386;
    }
    float _2050 = _2048;
    int _2052 = _1874 * _2034;
    int _2054 = _2052 + _2014;
    float _2056 = _1728 * _2042;
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2060 = _1726 * _2042;
    float _2062 = _2050 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2064 = _1730 * _2042;
    if (_1632)
    {
        float _2066 = -_1536;
        float _2068 = _2066 + 1.0;
        _1902 = as_type<int>(_2068);
    }
    int _2070 = _1902;
    float _2072 = float(uint(_2054));
    float _2074 = -_2026;
    float _2076 = _2074 + 1.0;
    float _2078 = _2076;
    if (!_1632)
    {
        _1904 = _1536;
    }
    float _2080 = _1904;
    float _2082 = -_2058;
    float _2084 = fma(_2062, 2.0, _2082);
    float _2086 = _2080;
    if (_1632)
    {
        float _2088 = _1588 ? as_type<float>(_2070) : _1536;
        _2086 = _2088;
    }
    float _2090 = _2086;
    float _2092 = as_type<float>(_1495) * _2072;
    float _2094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2096 = ~_1437;
    int _2098 = _2096 + 1;
    float _2100 = fma(_2076, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2060);
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_1550)
    {
        _2104 = _386;
    }
    float _2106 = _2104;
    float _2108 = fma(_2076, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2064);
    float _2110 = _2106;
    if (_1550)
    {
        _2110 = _1419;
    }
    float _2112 = _2110;
    float _2114 = trunc(_2092);
    float _2116 = precise::max(_2114, 0.0);
    uint _2118 = uint(_2116);
    float _2120 = -_2102;
    float _2122 = fma(_1944, 2.0, _2120);
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2126 = fma(_2112, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1858);
    float _2128 = fma(_1918, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2124);
    float _2130 = fma(_2076, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2056);
    if (!_1550)
    {
        _2078 = _386;
    }
    float _2132 = _2078;
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2138 = _2132;
    if (_1550)
    {
        _2138 = _1419;
    }
    float _2140 = _2138;
    float _2142 = fma(_1786, _2028, _2130);
    float _2144 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2134);
    float _2146 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2136);
    if (!_1550)
    {
        _1449 = _716;
    }
    float _2148 = _1449;
    int _2150 = _2098 * int(_2118);
    int _2152 = _2150 + _2054;
    float _2154 = _2094 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2156 = _2140 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2158 = fma(_1784, _2028, _2100);
    float _2160 = float(uint(_2152));
    float _2162 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2164 = fma(_2154, _1570, -0.5);
    float _2166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2168 = as_type<float>(_1495) * _2160;
    float _2170 = fma(_2156, -2.0, _2162);
    int _2172 = ~_1437;
    int _2174 = _2172 + 1;
    float _2176 = fma(_1754, _2010, _2158);
    float _2178 = fma(_1756, _2010, _2142);
    float _2180 = fma(_1788, _2028, _2108);
    float _2182 = trunc(_2168);
    float _2184 = precise::max(_2182, 0.0);
    uint _2186 = uint(_2184);
    float _2188 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2190 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2144);
    float _2192 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2128);
    float _2194 = -_134;
    float _2196 = fma(_2194, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2122);
    float _2198 = fma(_1758, _2010, _2180);
    float _2200 = float(uint(_1922));
    float _2202 = _2166 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2204 = fma(_2190, _2188, _1838);
    float _2206 = fma(_2192, _2164, _2196);
    float _2208 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2146);
    float _2210 = fma(_2202, _2090, -0.5);
    float _2212 = -_134;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2084);
    float _2216 = as_type<float>(_1495) * _2200;
    float _2218 = fma(_1778, _1984, _2176);
    int _2220 = int(_2118) + int(_2186);
    float _2222 = fma(_2208, _2210, _2214);
    float _2224 = fma(_1780, _1984, _2178);
    float _2226 = trunc(_2216);
    float _2228 = precise::max(_2226, 0.0);
    uint _2230 = uint(_2228);
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2234 = _2174 * _2220;
    int _2236 = _2234 + _2054;
    float _2238 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2240 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2126);
    float _2242 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2170);
    int _2244 = ~_1437;
    int _2246 = _2244 + 1;
    float _2248 = fma(_2238, -2.0, _2232);
    bool _2250 = uint(_2236) >= uint(_1437);
    float _2252 = -_2242;
    float _2254 = fma(_2240, _1846, _2252);
    float _2256 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1870);
    bool _2258 = !_2250;
    int _2260 = _2258 ? 0 : (-1);
    float _2262 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2248);
    float _2264 = fma(_1814, _1962, _2224);
    float _2266 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2268 = ~_2220;
    int _2270 = _2268 + _2260;
    int _2272 = _2270 + 1;
    float _2274 = fma(_1782, _1984, _2198);
    int _2276 = _2246 * int(_2230);
    int _2278 = _2276 + _1922;
    float _2280 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2266);
    float _2282 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2284 = _1437 * _2272;
    int _2286 = _2284 + _2054;
    float _2288 = -_2262;
    float _2290 = fma(_2256, _1876, _2288);
    float _2292 = float(uint(_2278));
    float _2294 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2282);
    float _2296 = fma(_1828, _1962, _2218);
    bool _2298 = !_1804;
    int _2300 = _2298 ? _2286 : (-1);
    float _2302 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2280);
    float _2304 = as_type<float>(_1495) * _2292;
    float _2306 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2294);
    int _2308 = _2300 >> 31;
    float _2310 = fma(_1830, _1962, _2274);
    float _2312 = trunc(_2304);
    float _2314 = precise::max(_2312, 0.0);
    uint _2316 = uint(_2314);
    float _2318 = _2306 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _2320 = _2308 & 3;
    float _2322 = _2204 + 0.5;
    int _2324 = _2300 & 3;
    bool _2326 = _2324 != 0;
    float _2328 = _2206 + 0.5;
    int _2330 = _2300 + _2320;
    float _2332 = _2046 + 0.5;
    float _2334 = _2254 + 0.5;
    float _2336 = _2302 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2338 = _2330 >> 2;
    float _2340 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[128].y, _2264);
    bool _2342 = uint(_2324) > 1u;
    float _2344 = _2336 + _2318;
    int _2346 = _2338 << 4;
    int _2348 = _2346 + 368;
    float _2350 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[128].x, _2296);
    float _2352 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[128].z, _2310);
    int _2354 = ~_1437;
    int _2356 = _2354 + 1;
    uint _2358 = uint(int(uint(_2348) >> uint(2)));
    uint _2360 = uint(int(uint(int(_2358)) >> uint(2)));
    int _2362 = int(_2358) & 3;
    float _2364 = (*spvDescriptorSet0.vp_c9)._m0[int(_2360)][_2362];
    int _2366 = int(_2358) + 1;
    uint _2368 = uint(int(uint(_2366) >> uint(2)));
    int _2370 = _2366 & 3;
    float _2372 = (*spvDescriptorSet0.vp_c9)._m0[int(_2368)][_2370];
    int _2374 = _2300 & 3;
    bool _2376 = _2374 != 0;
    out.m_67.x = _2322;
    out.m_67.y = _2332;
    out.m_67.z = _2328;
    out.m_67.w = _2334;
    float _2378 = _2290 + 0.5;
    bool _2380 = _2324 != 3;
    float _2382 = _2222 + 0.5;
    int _2384 = int(_2230) + int(_2316);
    float _2386 = 1.0 / _2318;
    int _2388 = _2348 + 8;
    uint _2390 = uint(int(uint(_2388) >> uint(2)));
    uint _2392 = uint(int(uint(int(_2390)) >> uint(2)));
    int _2394 = int(_2390) & 3;
    float _2396 = (*spvDescriptorSet0.vp_c9)._m0[int(_2392)][_2394];
    int _2398 = int(_2390) + 1;
    uint _2400 = uint(int(uint(_2398) >> uint(2)));
    int _2402 = _2398 & 3;
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[int(_2400)][_2402];
    float _2406 = as_type<float>(_2230);
    if (!_1678)
    {
        _2406 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2408 = _2406;
    float _2410 = _2350 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_69.x = _2382;
    out.m_69.y = _2378;
    int _2412 = _2376 ? 0 : 1;
    bool _2414 = uint(_2324) >= 2u;
    int _2416 = _2356 * _2384;
    int _2418 = _2416 + _1922;
    int _2420 = ~_2412;
    int _2422 = _2420 + 1;
    int _2424 = _2422 + 1;
    float _2426 = _2344 * _2386;
    float _2428 = _2426 * 0.5;
    int _2430 = _2414 ? 0 : 1;
    int _2432 = _2424;
    float _2434 = _2408;
    float _2436 = _2410;
    if (!_2342)
    {
        int _2438 = ~_2412;
        int _2440 = _2438 + 1;
        _2432 = _2440;
    }
    int _2442 = _2432;
    if (!_1678)
    {
        float _2444 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2446 = fma(_2428, _2408, _2444);
        _2434 = _2446;
    }
    float _2448 = _2434;
    bool _2450 = uint(_2418) >= uint(_1437);
    bool _2452 = _2324 != 3;
    float _2454 = in.m_71.x;
    float _2456 = in.m_71.y;
    float _2458 = in.m_71.z;
    int _2460 = ~_2430;
    int _2462 = _2460 + 1;
    int _2464 = _2462 + 1;
    float _2466 = _2448;
    int _2468 = _2464;
    if (!_1678)
    {
        float _2470 = 1.0 / _2448;
        _2466 = _2470;
    }
    float _2472 = _2466;
    if (_2380)
    {
        int _2474 = ~_2430;
        int _2476 = _2474 + 1;
        _2468 = _2476;
    }
    int _2478 = _2468;
    bool _2480 = !_2326;
    int _2482 = _2480 ? 0 : 1;
    int _2484 = abs(_2442);
    bool _2486 = _724 != 0.0;
    bool _2488 = isnan(_724);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan(0.0);
    bool _2494 = _2490 || _2492;
    int _2496 = abs(_2478);
    int _2498 = abs(_2482);
    int _2500 = ~_2484;
    int _2502 = _2500 + 1;
    int _2504 = _2502 + 1;
    bool _2506 = _722 == 0.0;
    bool _2508 = !_2494;
    bool _2510 = _2506 && _2508;
    bool _2512 = !_2450;
    int _2514 = _2512 ? 0 : (-1);
    int _2516 = _2504 * as_type<int>(_2372);
    int _2518 = ~_2498;
    int _2520 = _2518 + 1;
    int _2522 = _2520 + 1;
    bool _2524 = _728 == 0.0;
    bool _2526 = _2524 && _2510;
    bool _2528 = !_2452;
    int _2530 = _2528 ? 0 : (-1);
    int _2532 = _2522 * as_type<int>(_2364);
    int _2534 = _2532 + _2516;
    int _2536 = ~_2384;
    int _2538 = _2536 + _2514;
    int _2540 = _2538 + 1;
    bool _2542 = !_1628;
    int _2544 = _2542 ? 0 : 1;
    int _2546 = abs(_2530);
    int _2548 = _1437 * _2540;
    int _2550 = _2548 + _1922;
    int _2552 = abs(_2544);
    int _2554 = ~_2496;
    int _2556 = _2554 + 1;
    int _2558 = _2556 + 1;
    float _2560 = _2456;
    float _2562 = _2454;
    float _2564 = _2458;
    if (!_2526)
    {
        float _2566 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2456);
        _2560 = _2566;
    }
    float _2568 = _2560;
    if (!_2526)
    {
        float _2570 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2454);
        _2562 = _2570;
    }
    float _2572 = _2562;
    if (!_2526)
    {
        float _2574 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2458);
        _2564 = _2574;
    }
    float _2576 = _2564;
    int _2578 = _2558 * as_type<int>(_2396);
    int _2580 = _2578 + _2534;
    int _2582 = ~_2546;
    int _2584 = _2582 + 1;
    int _2586 = _2584 + 1;
    float _2588 = _680 * _2568;
    float _2590 = _682 * _2568;
    float _2592 = _678 * _2568;
    int _2594 = ~_2552;
    int _2596 = _2594 + 1;
    int _2598 = _2596 + 1;
    int _2600 = _2586 * as_type<int>(_2404);
    int _2602 = _2600 + _2580;
    float _2604 = as_type<float>(_2580);
    float _2606 = as_type<float>(_2602);
    if (!_1678)
    {
        _2604 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2608 = _2604;
    float _2610 = fma(_742, _2572, _2590);
    bool _2612 = !_1804;
    int _2614 = _2612 ? _2550 : (-1);
    int _2616 = _2602 * _2598;
    float _2618 = fma(_740, _2572, _2588);
    if (!_1678)
    {
        float _2620 = -_2608;
        float _2622 = _2620 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2606 = _2622;
    }
    float _2624 = _2606;
    float _2626 = fma(_744, _2572, _2592);
    float _2628 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2630 = _2614 * _2552;
    int _2632 = _2630 + _2616;
    float _2634 = fma(_396, _2576, _2618);
    float _2636 = fma(_400, _2576, _2610);
    float _2638 = _2624;
    if (!_1678)
    {
        float _2640 = 1.0 / _2624;
        _2638 = _2640;
    }
    float _2642 = _2638;
    float _2644 = fma(_398, _2576, _2626);
    if (!_1678)
    {
        float _2646 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2648 = -_2608;
        float _2650 = fma(_2472, _2646, _2648);
        _934 = _2650;
    }
    float _2652 = _934;
    float _2654 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2628);
    float _2656 = _2340 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2658 = _2410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1678)
    {
        _2436 = 1.0;
    }
    float _2660 = _2436;
    out.m_73.x = _2634;
    out.m_73.y = _2636;
    out.m_73.z = _2644;
    float _2662 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2654);
    float _2664 = float(_2632);
    float _2666 = _1362 + _1324;
    float _2668 = _2352 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2670 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2662);
    float _2672 = _1324 * 0.5;
    out.m_75.x = _2664;
    float _2674 = _2666 * 0.5;
    float _2676 = _2660;
    if (!_1678)
    {
        float _2678 = _2652 * _2642;
        float _2680 = precise::clamp(_2678, 0.0, 1.0);
        _2676 = _2680;
    }
    float _2682 = _2676;
    float _2684 = _2670 + _1324;
    float _2686 = _2656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2688 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2690 = _2682 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2692 = _2682 > 0.0;
    bool _2694 = isnan(_2682);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan(0.0);
    bool _2700 = _2696 || _2698;
    float _2702 = _2668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2704 = _2688 * _1392;
    float _2706 = -_2688;
    float _2708 = _2706 + 1.0;
    float _2710 = _2690 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2712 = _1403 * _2704;
    float _2714 = _1413 * _2704;
    float _2716 = _2684 * 0.5;
    float _2718 = fma(_1364, -0.5, _2672);
    float _2720 = fma(_1409, _2712, _1397);
    float _2722 = fma(_1411, _2712, _1399);
    float _2724 = _1403 * _2708;
    float _2726 = fma(_1403, _2714, _1401);
    out.m_77.x = _2658;
    out.m_77.y = _2686;
    out.m_77.z = _2702;
    out.gl_Position.x = _1362;
    out.gl_Position.y = _1364;
    out.gl_Position.z = _2670;
    out.gl_Position.w = _1324;
    out.m_79.x = _2674;
    out.m_79.y = _2718;
    out.m_79.z = _2716;
    out.m_79.w = _1324;
    out.m_45.x = _2710;
    out.m_81.x = _2720;
    out.m_81.y = _2722;
    out.m_81.z = _2726;
    out.m_81.w = _2724;
    if (_2700)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2728 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2728;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

