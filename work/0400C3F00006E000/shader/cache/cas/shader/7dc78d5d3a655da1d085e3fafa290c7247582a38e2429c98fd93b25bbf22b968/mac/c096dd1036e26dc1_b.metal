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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_73 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_87 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_85 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_49 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_71 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3186 = false;
    bool _680 = false;
    bool _560 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = in.m_46.w;
    float _105 = trunc(_101);
    int _108 = int(_105);
    float _110 = -_103;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _112;
    bool _116 = _108 >= 1;
    float _118 = 0.0;
    float _120 = _103;
    float _122 = _112;
    float _124 = _112;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _118;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_116)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3503 = as_type<float>(_132);
        out.gl_Position.z = _3503;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _136 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_103);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = float(_108);
    bool _148 = _112 >= _146;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    if (_152)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _120;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _134 = as_type<int>(_156);
    }
    int _158 = _134;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3558 = as_type<float>(_158);
        out.gl_Position.z = _3558;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_53.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _112 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    int _178 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _180 = _178 != 0;
    float _182 = _164 * _162;
    float _184 = 0.0;
    float _186 = _166;
    if (!_176)
    {
        float _188 = _166 * _166;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _182);
    float _196 = _192;
    if (!_176)
    {
        float _198 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    float _202 = in.m_46.x;
    float _204 = in.m_46.y;
    float _206 = in.m_46.z;
    float _208 = _194 * 6.283185482025146484375;
    float _210 = floor(_194);
    float _212 = _208 * 0.15915493667125701904296875;
    float _214 = _212 * 6.283185482025146484375;
    float _216 = cos(_214);
    float _218 = -_210;
    float _220 = _194 + _218;
    bool _222 = !_176;
    float _224 = _200;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _166 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _166);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _254;
    }
    float _256 = _224;
    bool _258 = !_176;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _166 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _186 = _278;
    }
    float _280 = _186;
    float _282 = in.m_55.w;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _286 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    float _294 = _284 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _296 = _284 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _298 = _284 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _300 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _302 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].x, _294);
    float _304 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].y, _296);
    float _306 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].z, _298);
    float _308 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[10].x, _302);
    bool _310 = _220 < 0.5;
    float _312 = float(_310);
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[10].y, _304);
    float _316 = fma(_216, 0.5, 0.5);
    float _318 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[10].z, _306);
    float _320 = _294;
    float _322 = _296;
    if (!_176)
    {
        float _324 = _112 * _112;
        float _326 = _324 * 0.5;
        _320 = _326;
    }
    float _328 = _320;
    float _330 = -_220;
    float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _334 = fma(_280, _202, _308);
    float _336 = fma(_280, _204, _314);
    float _338 = -_312;
    float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _342 = -_316;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _346 = fma(_280, _206, _318);
    float _348 = _328;
    if (!_176)
    {
        _322 = _112;
    }
    float _350 = _322;
    float _352 = _350;
    if (!_176)
    {
        float _354 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _348 = _354;
    }
    float _356 = _348;
    bool _358 = !_176;
    float _360 = _356;
    if (!_358)
    {
        float _362 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _364 = log2(_362);
        float _366 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _368 = _366 + 1.0;
        float _370 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _372 = _112 * _364;
        float _374 = 1.0 / _368;
        float _376 = _370 * 0.693147182464599609375;
        float _378 = exp2(_372);
        float _380 = 1.0 / _376;
        float _382 = _378 + (-1.0);
        float _384 = -_382;
        float _386 = fma(_384, _380, _112);
        float _388 = _386 * _374;
        float _390 = _388 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _360 = _390;
    }
    float _392 = _360;
    bool _394 = !_176;
    if (!_394)
    {
        float _396 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _398 = log2(_396);
        float _400 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _402 = _400 + 1.0;
        float _404 = 1.0 / _402;
        float _406 = _112 * _398;
        float _408 = exp2(_406);
        float _410 = -_408;
        float _412 = _410 + 1.0;
        float _414 = _412 * _404;
        _352 = _414;
    }
    float _416 = _352;
    float _418 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _420 = fma(_334, _282, _288);
    float _422 = fma(_336, _282, _290);
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _430 = _428 != 0;
    float _432 = fma(_346, _282, _292);
    float _434 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _436 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _438 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    bool _440 = !_426;
    int _442 = _440 ? 0 : 1;
    float _444 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _446 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[8].y, _436);
    float _448 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _450 = abs(_442);
    float _452 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[8].x, _438);
    float _454 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[8].z, _444);
    float _456 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[10].y, _446);
    float _458 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[10].x, _452);
    bool _460 = !_180;
    int _462 = _460 ? 0 : 1;
    float _464 = fma(_416, _204, _456);
    float _466 = float(_450);
    float _468 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[10].z, _454);
    bool _470 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _472 = -_464;
    float _474 = _336 + _472;
    bool _476 = !_430;
    int _478 = _476 ? 0 : 1;
    float _480 = abs(_332);
    float _482 = _466 * _480;
    int _484 = abs(_462);
    float _486 = 1.0 / _146;
    float _488 = fma(_416, _202, _458);
    int _490 = abs(_478);
    float _492 = _474 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _494 = float(_484);
    float _496 = _474 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _498 = fma(_416, _206, _468);
    float _500 = -_488;
    float _502 = _334 + _500;
    float _504 = _474 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _506 = float(_490);
    float _508 = -_498;
    float _510 = _346 + _508;
    float _512 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[4].x, _492);
    float _514 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[5].x, _496);
    float _516 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[6].x, _504);
    float _518 = fma(_494, _344, _482);
    float _520 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[4].z, _512);
    float _522 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[5].z, _514);
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[6].z, _516);
    float _526 = abs(_340);
    float _528 = fma(_506, _526, _518);
    float _530 = _112 * _486;
    bool _532 = !_470;
    float _534 = _522;
    float _536 = _520;
    float _538 = _524;
    float _540 = _520;
    float _542 = _464;
    float _558;
    if (!_532)
    {
        float _544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _546 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _548 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[12].x, _112);
        float _550 = _548 * _544;
        float _552 = floor(_550);
        float _554 = -_552;
        float _556 = _550 + _554;
        _558 = _556;
        _560 = true;
    }
    else
    {
        _558 = _530;
    }
    _560 = false;
    float _562 = _558;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _566 = _562 + _564;
    bool _568 = _562 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _570 = isnan(_562);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _580;
    float _584 = -_578;
    float _586 = _584 + 1.0;
    bool _588 = _562 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _590 = isnan(_562);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = 1.0 / _582;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _606;
    bool _610 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _612 = _566 * _600;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _614;
    float _618 = in.m_55.x;
    float _620 = in.m_55.y;
    float _622 = in.m_55.z;
    float _624 = _598 * _586;
    float _626 = fma(_604, _612, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _628 = fma(_616, _612, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _630 = fma(_608, _612, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _632 = -_598;
    float _634 = _632 + 1.0;
    float _636 = _626 * _624;
    float _638 = _628 * _624;
    float _640 = _630 * _624;
    float _642 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].x, _636);
    float _644 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].y, _638);
    float _646 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].z, _640);
    float _648 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[144].x, _642);
    float _650 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[144].y, _644);
    float _652 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[144].z, _646);
    float _654 = _648 * _618;
    float _656 = _650 * _620;
    float _658 = _652 * _622;
    bool _660 = !_610;
    float _662 = _648;
    float _678;
    if (!_660)
    {
        float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _666 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[11].y, _112);
        float _670 = _668 * _664;
        float _672 = floor(_670);
        float _674 = -_672;
        float _676 = _670 + _674;
        _678 = _676;
        _680 = true;
    }
    else
    {
        _678 = _530;
    }
    _680 = false;
    float _682 = _678;
    float _684 = in.m_57.x;
    float _686 = _160 * 2.0;
    float _688 = in.m_57.y;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _692 = _690 != 0;
    float _694 = _422 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _698 = _696 != 0;
    float _700 = in.m_53.y;
    bool _702 = _160 > 0.5;
    bool _704 = _702 && _692;
    float _706 = floor(_686);
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _710 = _708 != 0;
    float _712 = _422 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _714 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[5].x, _694);
    float _716 = in.m_53.z;
    float _718 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _720 = int(_718);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _728 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[5].z, _714);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _734 = _682 + _732;
    float _736 = _684;
    if (_692)
    {
        _662 = _684;
    }
    float _738 = _662;
    float _740 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _742 = int(_740);
    float _744 = -_688;
    float _746 = _744 + 1.0;
    float _748 = _738;
    float _750 = _688;
    if (_704)
    {
        float _752 = -_738;
        float _754 = _752 + 1.0;
        _748 = _754;
    }
    float _756 = _748;
    float _758 = _728 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _760 = _700 > 0.5;
    float _762 = _654 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _764 = float(_720);
    float _766 = 1.0 / _724;
    if (_698)
    {
        float _768 = _760 ? _746 : _688;
        _750 = _768;
    }
    float _770 = _750;
    float _772 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _776 = _774 != 0;
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _780 = _778 != 0;
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _784 = _782 != 0;
    float _786 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    if (_692)
    {
        _736 = _756;
    }
    float _788 = _736;
    float _790 = -_726;
    float _792 = fma(_772, 2.0, _790);
    bool _794 = _706 >= 0.0;
    bool _796 = isnan(_706);
    bool _798 = _794 || _796;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    float _804 = 1.0 / _764;
    float _806 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _808 = _802 ? 0 : 1;
    float _810 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _812 = _706 > 0.0;
    float _814 = _422 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _816 = ~_808;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = _700 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _826 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[4].x, _814);
    float _828 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[6].x, _712);
    float _830 = fma(_822, -2.0, _730);
    float _832 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].z, _826);
    float _834 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[6].z, _828);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _840 = _820;
    if (!_812)
    {
        int _842 = ~_808;
        int _844 = _842 + 1;
        _840 = _844;
    }
    int _846 = _840;
    float _848 = _700 * 2.0;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _852;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _858 = _856 != 0;
    float _860 = floor(_848);
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _866 = !_710;
    float _868 = _866 ? 7.345489978790283203125 : 1.0;
    float _870 = _854 * _766;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _874 = _872 != 0;
    float _876 = _824 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _878 = float(uint(_742));
    float _880 = 1.0 / _838;
    bool _882 = !_780;
    int _884 = _882 ? 0 : 1;
    float _886 = _850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _888 = !_776;
    int _890 = _888 ? 0 : 1;
    float _892 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _894 = !_784;
    int _896 = _894 ? 0 : 1;
    float _898 = _832 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _900 = float(_742);
    float _902 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _904 = log2(_902);
    bool _906 = _860 >= 0.0;
    bool _908 = isnan(_860);
    bool _910 = _906 || _908;
    bool _912 = isnan(0.0);
    bool _914 = _910 || _912;
    float _916 = _112 * _804;
    out.m_59.x = _876;
    out.m_59.y = _886;
    out.m_59.z = _892;
    out.m_59.w = _864;
    float _918 = _112 * _900;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _922 = _920 != 0;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _926 = _924 != 0;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _930 = _928 != 0;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _936 = 1.0 / _878;
    float _938 = _918 * _486;
    float _940 = _716 * 2.0;
    float _942 = _934 * _880;
    int _944 = ~_742;
    int _946 = _944 + 1;
    float _948 = _834 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _950 = _914 ? 0 : 1;
    float _952 = fma(_942, _734, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _954 = trunc(_916);
    int _956 = int(_954);
    float _958 = _700 + _716;
    float _960 = _160 + _716;
    float _962 = _112 * _904;
    float _964 = _958 + (-1.0);
    float _966 = _160 + _700;
    bool _968 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _970 = isnan(_682);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = floor(_940);
    int _982 = as_type<int>(_936) + (-2);
    float _984 = _960 + (-1.0);
    float _986 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _990 = _682 + _988;
    float _992 = _966 + (-1.0);
    float _994 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _996 = _868 * _160;
    float _998 = float(uint(_956));
    float _1000 = exp2(_962);
    float _1002 = fma(_870, _990, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1004 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1006 = isnan(_682);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1012 = _1008 || _1010;
    float _1014 = float(_1012);
    float _1016 = -_978;
    float _1018 = _1016 + 1.0;
    float _1020 = as_type<float>(_982) * _998;
    float _1022 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1024 = _860 > 0.0;
    float _1026 = _1014 * _1018;
    float _1028 = floor(_996);
    float _1030 = -_1014;
    float _1032 = _1030 + 1.0;
    bool _1034 = !_922;
    int _1036 = _1034 ? 0 : 1;
    float _1038 = _716 + (-0.5);
    bool _1040 = _980 >= 0.0;
    bool _1042 = isnan(_980);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan(0.0);
    bool _1048 = _1044 || _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1052 = 1.0 + _1050;
    bool _1054 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1056 = isnan(_682);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    float _1066 = trunc(_1020);
    float _1068 = precise::max(_1066, 0.0);
    uint _1071 = uint(_1068);
    float _1073 = -_1000;
    float _1075 = _1073 + 1.0;
    int _1077 = _1048 ? 0 : 1;
    bool _1079 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1081 = isnan(0.0);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1087 = _1083 || _1085;
    bool _1089 = !_926;
    int _1091 = _1089 ? 0 : 1;
    float _1093 = 1.0 / _1052;
    float _1095 = _1087 ? _1075 : 0.0;
    float _1097 = -_1028;
    float _1099 = _996 + _1097;
    bool _1101 = _980 > 0.0;
    int _1103 = abs(_1036);
    float _1105 = float(_846);
    int _1107 = _946 * int(_1071);
    int _1109 = _1107 + _956;
    int _1111 = ~_1077;
    int _1113 = _1111 + 1;
    int _1115 = _1113 + 1;
    float _1117 = _1099 * _900;
    int _1119 = ~_742;
    int _1121 = _1119 + 1;
    float _1123 = trunc(_938);
    int _1125 = int(_1123);
    float _1127 = float(uint(_1109));
    float _1129 = _1064 * _1032;
    int _1131 = abs(_1091);
    float _1133 = _1095 * _1093;
    float _1135 = -_1064;
    float _1137 = _1135 + 1.0;
    float _1139 = as_type<float>(_982) * _1127;
    float _1141 = in.m_61.x;
    float _1143 = in.m_61.y;
    float _1145 = in.m_61.z;
    float _1147 = _1002 * _1129;
    float _1149 = float(_956);
    float _1151 = trunc(_1139);
    float _1153 = precise::max(_1151, 0.0);
    uint _1155 = uint(_1153);
    float _1157 = float(_1131);
    float _1159 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1147);
    bool _1161 = _1149 >= _900;
    bool _1163 = isnan(_1149);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan(_900);
    bool _1169 = _1165 || _1167;
    float _1171 = float(_1169);
    float _1173 = _700 + (-0.5);
    int _1175 = _1115;
    if (!_1101)
    {
        int _1177 = ~_1077;
        int _1179 = _1177 + 1;
        _1175 = _1179;
    }
    int _1181 = _1175;
    float _1183 = _1157 * _1105;
    float _1185 = _160 + (-0.5);
    float _1187 = float(_1181);
    float _1189 = _1183 * (-2.0);
    float _1191 = float(_1103);
    float _1193 = trunc(_1171);
    int _1195 = int(_1193);
    int _1197 = ~_950;
    int _1199 = _1197 + 1;
    int _1201 = _1199 + 1;
    float _1203 = fma(_986, _1189, _986);
    int _1205 = _1201;
    if (!_1024)
    {
        int _1207 = ~_950;
        int _1209 = _1207 + 1;
        _1205 = _1209;
    }
    int _1211 = _1205;
    float _1213 = _1191 * _1187;
    int _1215 = int(_1071) + int(_1155);
    float _1217 = _1213 * (-2.0);
    float _1219 = fma(_1189, _1143, _1143);
    int _1221 = _1121 * _1215;
    int _1223 = _1221 + _956;
    bool _1225 = !_858;
    int _1227 = _1225 ? 0 : 1;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1231 = fma(_1022, _1217, _1022);
    float _1233 = trunc(_1117);
    int _1235 = int(_1233);
    bool _1237 = uint(_1223) >= uint(_742);
    float _1239 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1229);
    int _1241 = abs(_1227);
    float _1243 = fma(_1217, _1141, _1141);
    bool _1245 = !_1237;
    int _1247 = _1245 ? 0 : (-1);
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1251 = _898 + _1249;
    float _1253 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1243);
    int _1255 = ~_1215;
    int _1257 = _1255 + _1247;
    int _1259 = _1257 + 1;
    float _1261 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1219);
    float _1263 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1239);
    bool _1265 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1267 = isnan(1.0);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1273 = _1269 || _1271;
    bool _1275 = _742 == 0;
    int _1277 = _1235 * _1241;
    int _1279 = _1277 + _956;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1283 = _742 * _1259;
    int _1285 = _1283 + _956;
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1289 = _758 + _1287;
    bool _1291 = !_1273;
    float _1293 = _1291 ? _112 : _1133;
    float _1295 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1281);
    float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1299 = _948 + _1297;
    float _1301 = _1289 * _1289;
    bool _1303 = !_930;
    int _1305 = _1303 ? 0 : 1;
    float _1307 = fma(_1293, _1203, _1261);
    int _1309 = ~_1195;
    int _1311 = _1309 + 1;
    int _1313 = _1311 + 1;
    float _1315 = fma(_1251, _1251, _1301);
    bool _1317 = !_1275;
    int _1319 = _1317 ? _1285 : (-1);
    float _1321 = fma(_1293, _1231, _1253);
    int _1323 = abs(_1305);
    float _1325 = fma(_1299, _1299, _1315);
    float _1327 = float(_1211);
    int _1329 = _1319 * _1313;
    int _1331 = _742 + (-1);
    float _1333 = sqrt(_1325);
    float _1335 = float(_1323);
    float _1337 = _1321 * 0.15915493667125701904296875;
    int _1339 = abs(_884);
    int _1341 = _1195 * _1331;
    int _1343 = _1341 + _1329;
    int _1345 = abs(_890);
    float _1347 = _1335 * _1327;
    bool _1349 = !_874;
    int _1351 = _1349 ? 0 : 1;
    float _1353 = rsqrt(_1325);
    int _1355 = abs(_896);
    float _1357 = _1307 * 0.15915493667125701904296875;
    float _1359 = _762 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1361 = abs(_1351);
    float _1363 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1295);
    float _1365 = float(uint(_1279));
    float _1367 = _1333 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _1369 = _1343 * _1339;
    float _1371 = as_type<float>(_982) * _1365;
    float _1373 = _1347 * (-2.0);
    int _1375 = _1125 * _1345;
    int _1377 = _1375 + _1369;
    float _1379 = precise::min(_1359, _1367);
    float _1381 = trunc(_1371);
    float _1383 = precise::max(_1381, 0.0);
    uint _1385 = uint(_1383);
    int _1387 = _1279 * _1355;
    int _1389 = _1387 + _1377;
    float _1391 = fma(_1373, _1145, _1145);
    float _1393 = in.m_63.x;
    float _1395 = in.m_63.y;
    float _1397 = in.m_63.z;
    float _1399 = _1353 * _1379;
    int _1401 = _1235 * _1361;
    int _1403 = _1401 + _1389;
    float _1405 = fma(_994, _1373, _994);
    float _1407 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1391);
    float _1409 = _1289 * _1399;
    float _1411 = _1251 * _1399;
    float _1413 = float(uint(_1403));
    float _1415 = fma(_1293, _1405, _1407);
    float _1417 = -_1409;
    float _1419 = _1289 + _1417;
    float _1421 = -_1411;
    float _1423 = _1251 + _1421;
    int _1425 = ~_742;
    int _1427 = _1425 + 1;
    float _1429 = as_type<float>(_982) * _1413;
    float _1431 = _1419 * _1419;
    int _1433 = ~_742;
    int _1435 = _1433 + 1;
    float _1437 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1439 = _1299 * _1399;
    float _1441 = fma(_1423, _1423, _1431);
    float _1443 = trunc(_1429);
    float _1445 = precise::max(_1443, 0.0);
    uint _1447 = uint(_1445);
    float _1449 = in.m_65.x;
    float _1451 = in.m_65.y;
    float _1453 = in.m_65.z;
    int _1455 = _1435 * int(_1385);
    int _1457 = _1455 + _1279;
    float _1459 = _1415 * 0.15915493667125701904296875;
    int _1461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1463 = _1461 != 0;
    bool _1465 = _1395 != 0.0;
    bool _1467 = isnan(_1395);
    bool _1469 = _1465 || _1467;
    bool _1471 = isnan(0.0);
    bool _1473 = _1469 || _1471;
    float _1475 = _1357 * 6.283185482025146484375;
    float _1477 = sin(_1475);
    float _1479 = float(uint(_1457));
    bool _1481 = _1393 == 0.0;
    bool _1483 = !_1473;
    bool _1485 = _1481 && _1483;
    float _1487 = as_type<float>(_982) * _1479;
    bool _1489 = _1397 == 0.0;
    bool _1491 = _1489 && _1485;
    int _1493 = _1427 * int(_1447);
    int _1495 = _1493 + _1403;
    float _1497 = _1357 * 6.283185482025146484375;
    float _1499 = cos(_1497);
    float _1501 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _830);
    float _1503 = -_1439;
    float _1505 = _1299 + _1503;
    float _1507 = float(uint(_1495));
    float _1509 = -_1501;
    float _1511 = fma(_1263, _1437, _1509);
    float _1513 = _1337 * 6.283185482025146484375;
    float _1515 = sin(_1513);
    float _1517 = _1453;
    float _1519 = _1449;
    float _1521 = _1451;
    if (!_1491)
    {
        float _1523 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1453);
        _1517 = _1523;
    }
    float _1525 = _1517;
    if (!_1491)
    {
        float _1527 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1449);
        _1519 = _1527;
    }
    float _1529 = _1519;
    if (!_1491)
    {
        float _1531 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1451);
        _1521 = _1531;
    }
    float _1533 = _1521;
    float _1535 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1395);
    float _1537 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1393);
    float _1539 = _1337 * 6.283185482025146484375;
    float _1541 = cos(_1539);
    float _1543 = _1459 * 6.283185482025146484375;
    float _1545 = sin(_1543);
    float _1547 = -_112;
    float _1549 = fma(_1547, (*spvDescriptorSet0.vp_c9)._m0[76].x, _792);
    float _1551 = fma(_1363, _806, _1549);
    float _1553 = fma(_1505, _1505, _1441);
    float _1555 = as_type<float>(_982) * _1507;
    float _1557 = trunc(_1487);
    float _1559 = precise::max(_1557, 0.0);
    uint _1561 = uint(_1559);
    float _1563 = fma(_952, _1026, _1159);
    float _1565 = _1511 + 0.5;
    float _1567 = _1551 + 0.5;
    float _1569 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1397);
    float _1571 = _1515 * _1477;
    float _1573 = _1541 * _1499;
    float _1575 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1563);
    float _1577 = sqrt(_1553);
    out.m_67.x = _1567;
    out.m_67.y = _1565;
    float _1579 = fma(_1545, _1573, _1571);
    float _1581 = _1515 * _1499;
    float _1583 = _1541 * _1477;
    float _1585 = trunc(_1555);
    float _1587 = precise::max(_1585, 0.0);
    uint _1589 = uint(_1587);
    int _1591 = int(_1385) + int(_1561);
    float _1593 = fma(_1545, _1571, _1573);
    int _1595 = ~_742;
    int _1597 = _1595 + 1;
    float _1599 = -_1581;
    float _1601 = fma(_1545, _1583, _1599);
    int _1603 = ~_742;
    int _1605 = _1603 + 1;
    float _1607 = _1459 * 6.283185482025146484375;
    float _1609 = cos(_1607);
    float _1611 = _1353 * _1577;
    float _1613 = -_1583;
    float _1615 = fma(_1545, _1581, _1613);
    float _1617 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1619 = _786 * _1611;
    float _1621 = _810 * _1611;
    int _1623 = _1597 * _1591;
    int _1625 = _1623 + _1279;
    int _1627 = int(_1447) + int(_1589);
    float _1629 = _762 * _1611;
    float _1631 = _1619 * _1569;
    bool _1633 = uint(_1625) >= uint(_742);
    int _1635 = _1605 * _1627;
    int _1637 = _1635 + _1403;
    float _1639 = _1621 * _1535;
    float _1641 = _1541 * _1609;
    float _1643 = _1499 * _1609;
    bool _1645 = uint(_1637) >= uint(_742);
    float _1647 = _1515 * _1609;
    float _1649 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1651 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1653 = !_1645;
    int _1655 = _1653 ? 0 : (-1);
    float _1657 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1659 = -_1545;
    float _1661 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1649);
    float _1663 = _1579 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1665 = ~_1627;
    int _1667 = _1665 + _1655;
    int _1669 = _1667 + 1;
    float _1671 = -_1545;
    float _1673 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1651);
    float _1675 = -_1545;
    float _1677 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1657);
    float _1679 = -_1639;
    float _1681 = _1545 * _1679;
    float _1683 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1663);
    int _1685 = _742 * _1669;
    int _1687 = _1685 + _1403;
    float _1689 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1661);
    float _1691 = _1641 * _1639;
    float _1693 = _1629 * _1537;
    float _1695 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1673);
    bool _1697 = !_1275;
    int _1699 = _1697 ? _1687 : (-1);
    float _1701 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1677);
    float _1703 = _1647 * _1639;
    float _1705 = _1579 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1707 = _1699 >> 31;
    float _1709 = _1579 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1711 = fma(_1579, _1693, _1691);
    float _1713 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1705);
    int _1715 = _1707 & 3;
    float _1717 = _1477 * _1609;
    float _1719 = fma(_1643, _1693, _1681);
    float _1721 = fma(_1615, _1693, _1703);
    int _1723 = _1699 + _1715;
    float _1725 = fma(_1601, _1631, _1711);
    float _1727 = fma(_1717, _1631, _1719);
    float _1729 = fma(_1593, _1631, _1721);
    int _1731 = _1723 >> 2;
    float _1733 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1735 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1737 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1739 = _1731 << 4;
    int _1741 = _1739 + 368;
    float _1743 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1733);
    float _1745 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1617);
    float _1747 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1735);
    float _1749 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1751 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1737);
    float _1753 = _1689 * _1533;
    uint _1755 = uint(int(uint(_1741) >> uint(2)));
    uint _1757 = uint(int(uint(int(_1755)) >> uint(2)));
    int _1759 = int(_1755) & 3;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[int(_1757)][_1759];
    int _1763 = int(_1755) + 1;
    uint _1765 = uint(int(uint(_1763) >> uint(2)));
    int _1767 = _1763 & 3;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[int(_1765)][_1767];
    float _1771 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1749);
    float _1773 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1751);
    float _1775 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1709);
    float _1777 = _1695 * _1533;
    float _1779 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1771);
    float _1781 = _1701 * _1533;
    float _1783 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1713);
    float _1785 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1683);
    float _1787 = _1779 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1789 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1775);
    float _1791 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1793 = _1699 & 3;
    bool _1795 = _1793 != 0;
    int _1797 = _1741 + 8;
    uint _1799 = uint(int(uint(_1797) >> uint(2)));
    uint _1801 = uint(int(uint(int(_1799)) >> uint(2)));
    int _1803 = int(_1799) & 3;
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[int(_1801)][_1803];
    int _1807 = int(_1799) + 1;
    uint _1809 = uint(int(uint(_1807) >> uint(2)));
    int _1811 = _1807 & 3;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[int(_1809)][_1811];
    float _1815 = _948 + _1787;
    float _1817 = _898 + _1791;
    int _1819 = _1699 & 3;
    bool _1821 = _1819 != 0;
    float _1823 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1743);
    float _1825 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1827 = _1815 + _1825;
    bool _1829 = uint(_1793) > 1u;
    float _1831 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1745);
    float _1833 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1835 = _1817 + _1833;
    float _1837 = _1827 * _1827;
    int _1839 = _1821 ? 0 : 1;
    float _1841 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1747);
    bool _1843 = uint(_1793) >= 2u;
    float _1845 = fma(_1783, _1529, _1777);
    float _1847 = fma(_1835, _1835, _1837);
    float _1849 = fma(_1785, _1529, _1753);
    int _1851 = _1843 ? 0 : 1;
    float _1853 = fma(_1789, _1529, _1781);
    bool _1855 = _1793 != 3;
    float _1857 = sqrt(_1847);
    int _1859 = ~_1839;
    int _1861 = _1859 + 1;
    int _1863 = _1861 + 1;
    int _1865 = _1863;
    float _1867 = _1817;
    float _1869 = _1815;
    float _1871 = _1841;
    if (!_1829)
    {
        int _1873 = ~_1839;
        int _1875 = _1873 + 1;
        _1865 = _1875;
    }
    int _1877 = _1865;
    float _1879 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1881 = ~_1851;
    int _1883 = _1881 + 1;
    int _1885 = _1883 + 1;
    int _1887 = abs(_1877);
    float _1889 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1879);
    bool _1891 = !_1795;
    int _1893 = _1891 ? 0 : 1;
    bool _1895 = _1793 != 3;
    int _1897 = _1885;
    if (_1855)
    {
        int _1899 = ~_1851;
        int _1901 = _1899 + 1;
        _1897 = _1901;
    }
    int _1903 = _1897;
    float _1905 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1889);
    int _1907 = ~_1887;
    int _1909 = _1907 + 1;
    int _1911 = _1909 + 1;
    int _1913 = abs(_1893);
    float _1915 = _1905 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1917 = _1857 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1919 = _1911 * as_type<int>(_1769);
    bool _1921 = !_1895;
    int _1923 = _1921 ? 0 : (-1);
    int _1925 = ~_1913;
    int _1927 = _1925 + 1;
    int _1929 = _1927 + 1;
    int _1931 = abs(_1903);
    float _1933 = _758 + _1915;
    bool _1935 = !_1463;
    int _1937 = _1935 ? 0 : 1;
    int _1939 = _1929 * as_type<int>(_1761);
    int _1941 = _1939 + _1919;
    int _1943 = abs(_1923);
    int _1945 = ~_1931;
    int _1947 = _1945 + 1;
    int _1949 = _1947 + 1;
    int _1951 = abs(_1937);
    bool _1953 = !_1633;
    int _1955 = _1953 ? 0 : (-1);
    int _1957 = _1949 * as_type<int>(_1805);
    int _1959 = _1957 + _1941;
    int _1961 = ~_1591;
    int _1963 = _1961 + _1955;
    int _1965 = _1963 + 1;
    int _1967 = ~_1943;
    int _1969 = _1967 + 1;
    int _1971 = _1969 + 1;
    float _1973 = as_type<float>(_1949);
    if (!_1917)
    {
        _1973 = _1933;
    }
    float _1975 = _1973;
    bool _1977 = !_1917;
    float _1979 = _1975;
    if (!_1977)
    {
        float _1981 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1985 = _1857 + _1983;
        float _1987 = rsqrt(_1847);
        float _1989 = _1985 * _1981;
        float _1991 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1993 = _1989 * 0.15915493667125701904296875;
        float _1995 = _1993 * 6.283185482025146484375;
        float _1997 = cos(_1995);
        float _1999 = _1993 * 6.283185482025146484375;
        float _2001 = sin(_1999);
        float _2003 = _1997 + (-1.0);
        float _2005 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2007 = fma(_2001, _1991, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2009 = fma(_1933, _1997, _2005);
        float _2011 = _1987 * _2007;
        float _2013 = fma(_1835, _2011, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2015 = fma(_1827, _2011, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1979 = _2009;
        _1867 = _2013;
        _1869 = _2015;
    }
    float _2017 = _1979;
    float _2019 = _1867;
    float _2021 = _1869;
    float _2023 = -_758;
    float _2025 = _2023 + _2017;
    int _2027 = _1971 * as_type<int>(_1813);
    int _2029 = _2027 + _1959;
    int _2031 = ~_1951;
    int _2033 = _2031 + 1;
    int _2035 = _2033 + 1;
    int _2037 = _742 * _1965;
    int _2039 = _2037 + _1279;
    float _2041 = -_898;
    float _2043 = _2041 + _2019;
    float _2045 = _2025 * _2025;
    float _2047 = -_948;
    float _2049 = _2047 + _2021;
    int _2051 = _2029 * _2035;
    float _2053 = fma(_2043, _2043, _2045);
    float _2055 = fma(_1831, _1525, _1849);
    float _2057 = fma(_2049, _2049, _2053);
    bool _2059 = !_1275;
    int _2061 = _2059 ? _2039 : (-1);
    float _2063 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2065 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_69.w = _1379;
    float _2069 = sqrt(_2057);
    int _2071 = _2061 * _1951;
    int _2073 = _2071 + _2051;
    float _2075 = _2065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2077 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2079 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2081 = fma(_1823, _1525, _1845);
    float _2083 = _1575 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2085 = float(_2073);
    float _2087 = fma(_1841, _1525, _1853);
    out.m_71.x = _1629;
    float _2089 = -_1411;
    float _2091 = _2089 + _2019;
    float _2093 = -_1411;
    float _2095 = _898 + _2093;
    out.m_73.x = _2075;
    out.m_73.y = _2077;
    out.m_73.z = _2079;
    out.m_73.w = _2083;
    float _2097 = -_1409;
    float _2099 = _2097 + _2017;
    float _2101 = -_1439;
    float _2103 = _2101 + _2021;
    bool _2105 = _2069 > 0.0;
    out.m_75.x = _2085;
    float _2107 = -_1409;
    float _2109 = _758 + _2107;
    float _2111 = -_1439;
    float _2113 = _948 + _2111;
    out.m_77.x = _2081;
    out.m_77.y = _2055;
    out.m_77.z = _2087;
    bool _2115 = !_2105;
    float _2117 = _2077;
    float _2119 = _2079;
    float _2121 = _2075;
    float _2123 = _2091;
    float _2125 = _2103;
    float _2127 = _2099;
    float _2129 = _2083;
    float _2131 = _2109;
    float _2133 = _2095;
    if (!_2115)
    {
        bool _2135 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2137 = _2083;
        if (_2135)
        {
            float _2139 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2137 = _2139;
        }
        float _2141 = _2137;
        if (_2135)
        {
            float _2143 = _520 * _2141;
            _2117 = _2143;
        }
        float _2145 = _2117;
        float _2147 = _2145;
        if (_2135)
        {
            float _2149 = _522 * _2141;
            _2119 = _2149;
        }
        float _2151 = _2119;
        float _2153 = _2151;
        if (_2135)
        {
            float _2155 = _524 * _2141;
            _2121 = _2155;
        }
        float _2157 = _2121;
        float _2159 = _2157;
        if (!_2135)
        {
            float _2161 = _112 + 1.0;
            if (!_176)
            {
                float _2163 = _2161 * _2161;
                float _2165 = _2163 * 0.5;
                _122 = _2165;
            }
            float _2167 = _122;
            float _2169 = _2167;
            if (!_176)
            {
                float _2171 = _2167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2169 = _2171;
            }
            float _2173 = _2169;
            bool _2175 = !_176;
            float _2177 = _2173;
            if (!_2175)
            {
                float _2179 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2181 = log2(_2179);
                float _2183 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2185 = 1.0 + _2183;
                float _2187 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2189 = _2181 * _2161;
                float _2191 = 1.0 / _2185;
                float _2193 = _2187 * 0.693147182464599609375;
                float _2195 = exp2(_2189);
                float _2197 = 1.0 / _2193;
                float _2199 = _2195 + (-1.0);
                float _2201 = -_2199;
                float _2203 = fma(_2201, _2197, _2161);
                float _2205 = _2203 * _2191;
                float _2207 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2177 = _2207;
            }
            float _2209 = _2177;
            float _2211 = _2209 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2213 = _2209 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2215 = _2209 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2217 = _2209;
            if (!_176)
            {
                _2217 = _2161;
            }
            float _2219 = _2217;
            float _2221 = _2211 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2223 = _2211 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2225 = _2211 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2227 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2221);
            float _2229 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2223);
            float _2231 = fma(_2215, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2227);
            bool _2233 = !_176;
            float _2235 = _2219;
            if (!_2233)
            {
                float _2237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2239 = log2(_2237);
                float _2241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2243 = 1.0 + _2241;
                float _2245 = 1.0 / _2243;
                float _2247 = _2239 * _2161;
                float _2249 = exp2(_2247);
                float _2251 = -_2249;
                float _2253 = _2251 + 1.0;
                float _2255 = _2253 * _2245;
                _2235 = _2255;
            }
            float _2257 = _2235;
            float _2259 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2225);
            float _2261 = fma(_2215, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2229);
            float _2263 = fma(_2257, _204, _2231);
            float _2265 = fma(_2215, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2259);
            float _2267 = fma(_2257, _202, _2261);
            float _2269 = -_464;
            float _2271 = _2269 + _2263;
            float _2273 = fma(_2257, _206, _2265);
            float _2275 = -_488;
            float _2277 = _2275 + _2267;
            float _2279 = _2271 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2281 = _2271 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2283 = _2271 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2285 = -_498;
            float _2287 = _2285 + _2273;
            float _2289 = fma(_2277, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2279);
            float _2291 = fma(_2277, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2281);
            float _2293 = fma(_2277, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2283);
            float _2295 = fma(_2287, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2289);
            float _2297 = fma(_2287, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2291);
            float _2299 = fma(_2287, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2293);
            _534 = _2297;
            _536 = _2295;
            _538 = _2299;
            _2147 = _2295;
            _2153 = _2297;
            _2159 = _2299;
        }
        float _2301 = _534;
        float _2303 = _536;
        float _2305 = _538;
        float _2307 = _2147;
        float _2309 = _2153;
        float _2311 = _2159;
        float _2313 = _2301 * _2301;
        float _2315 = rsqrt(_2057);
        float _2317 = fma(_2303, _2303, _2313);
        float _2319 = fma(_2305, _2305, _2317);
        float _2321 = sqrt(_2319);
        float _2323 = _2043 * _2315;
        float _2325 = _2025 * _2315;
        float _2327 = _2049 * _2315;
        bool _2329 = _2321 > 0.0;
        bool _2331 = !_2329;
        _2129 = _2319;
        _540 = _2303;
        _124 = _2325;
        if (!_2331)
        {
            float _2333 = rsqrt(_2319);
            float _2335 = _2333 * _2301;
            float _2337 = _2333 * _2303;
            float _2339 = _2333 * _2305;
            float _2341 = _2325 * _2335;
            float _2343 = fma(_2323, _2337, _2341);
            float _2345 = fma(_2327, _2339, _2343);
            float _2347 = _2345 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2349 = fma(_2307, _2347, _2091);
            float _2351 = fma(_2309, _2347, _2099);
            float _2353 = fma(_2311, _2347, _2103);
            _2123 = _2349;
            _2125 = _2353;
            _2127 = _2351;
            _124 = _2341;
        }
    }
    float _2355 = _2123;
    float _2357 = _2125;
    float _2359 = _2127;
    float _2361 = _2129;
    float _2363 = _540;
    float _2365 = _124;
    float _2367 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2369 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2371 = isnan(0.5);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2377 = _2373 || _2375;
    float _2379 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2367);
    bool _2381 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2383 = isnan(0.5);
    bool _2385 = _2381 || _2383;
    bool _2387 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2389 = _2385 || _2387;
    float _2391 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2379);
    float _2393 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2395 = _2391 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2397 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2393);
    float _2399 = 1.0 / _2395;
    float _2401 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2397);
    float _2403 = _2365;
    float _2405 = _2395;
    float _2407 = _2363;
    if (_2389)
    {
        _2403 = 1.0;
    }
    float _2409 = _2403;
    float _2411 = _2401 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2413 = _2411 + _2395;
    float _2415 = _2409;
    if (_2377)
    {
        _2405 = _2355;
    }
    float _2417 = _2405;
    float _2419 = _2413 * _2399;
    float _2421 = _2419 * 0.5;
    float _2423 = _2399;
    float _2425 = _2421;
    float _2427 = _2417;
    if (_2377)
    {
        _2423 = _2357;
    }
    float _2429 = _2423;
    float _2431 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2433 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2431);
    float _2435 = _2433;
    float _2437 = _2429;
    if (_2377)
    {
        _2425 = _2359;
    }
    float _2439 = _2425;
    float _2441 = 1.0 / _2433;
    float _2443 = _2439;
    if (!_2377)
    {
        float _2445 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2447 = _2109 + _2445;
        float _2449 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2451 = _2095 + _2449;
        float _2453 = -_2109;
        float _2455 = _2453 + _2359;
        float _2457 = -_2113;
        float _2459 = _2457 + _2357;
        float _2461 = _2447 * _2447;
        float _2463 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2465 = _2113 + _2463;
        float _2467 = fma(_2451, _2451, _2461);
        float _2469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2471 = fma(_2465, _2465, _2467);
        float _2473 = sqrt(_2471);
        float _2475 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _2477 = _2473 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2479 = isnan(_2473);
        bool _2481 = _2477 || _2479;
        bool _2483 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2485 = _2481 || _2483;
        float _2487 = precise::min(_2473, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2489 = _2487 * _2469;
        float _2491 = _2475 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2493 = -_2095;
        float _2495 = _2493 + _2355;
        float _2497 = _2491 * _2489;
        float _2499 = _2361;
        float _2501 = _2491;
        _542 = _2455;
        if (_2485)
        {
            float _2503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2499 = _2503;
        }
        float _2505 = _2499;
        if (_2485)
        {
            float _2507 = precise::max(_2473, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2435 = _2507;
        }
        float _2509 = _2435;
        float _2511 = fma(_2455, _2497, _2109);
        float _2513 = fma(_2495, _2497, _2095);
        float _2515 = _2509;
        float _2517 = _2511;
        float _2519 = _2513;
        if (_2485)
        {
            float _2521 = _2509 * _2505;
            _2515 = _2521;
        }
        float _2523 = _2515;
        float _2525 = fma(_2459, _2497, _2113);
        float _2527 = _2523;
        if (_2485)
        {
            float _2529 = _2491 * _2523;
            _2527 = _2529;
        }
        float _2531 = _2527;
        if (!_2485)
        {
            _2501 = _2511;
        }
        float _2533 = _2501;
        float _2535 = _2533;
        if (!_2485)
        {
            _2517 = _2525;
        }
        float _2537 = _2517;
        _2437 = _2537;
        if (_2485)
        {
            float _2539 = fma(_2495, _2531, _2095);
            _2519 = _2539;
        }
        float _2541 = _2519;
        _2427 = _2541;
        if (_2485)
        {
            float _2543 = fma(_2455, _2531, _2109);
            _2535 = _2543;
        }
        float _2545 = _2535;
        _2443 = _2545;
        if (_2485)
        {
            float _2547 = fma(_2459, _2531, _2113);
            _2437 = _2547;
        }
    }
    float _2549 = _542;
    float _2551 = _2443;
    float _2553 = _2427;
    float _2555 = _2437;
    float _2557 = _2549;
    if (_2389)
    {
        _2557 = 1.0;
    }
    float _2559 = _2557;
    float _2561 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2563 = _2441 * _2561;
    float _2565 = _2559;
    if (!_2389)
    {
        float _2567 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2569 = _2567 * 0.15915493667125701904296875;
        float _2571 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2573 = _2569 * 6.283185482025146484375;
        float _2575 = cos(_2573);
        float _2577 = _2571 * 0.15915493667125701904296875;
        float _2579 = _2569 * 6.283185482025146484375;
        float _2581 = sin(_2579);
        float _2583 = 1.0 / _2575;
        float _2585 = _2577 * 6.283185482025146484375;
        float _2587 = cos(_2585);
        float _2589 = _2581 * _2583;
        float _2591 = _2577 * 6.283185482025146484375;
        float _2593 = sin(_2591);
        float _2595 = _2587 * _2589;
        float _2597 = 1.0 / _2595;
        float _2599 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2601 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2599;
        float _2603 = 1.0 / _2601;
        float _2605 = _2593 * _2597;
        float _2607 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2609 = fma(_2563, _2605, _2607);
        float _2611 = _2609 * _2603;
        float _2613 = precise::clamp(_2611, 0.0, 1.0);
        _2407 = _2603;
        _2415 = _2613;
    }
    float _2615 = _2407;
    float _2617 = _2415;
    float _2619 = _2615;
    if (!_2389)
    {
        float _2621 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2623 = _2621 * 0.15915493667125701904296875;
        float _2625 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2627 = _2623 * 6.283185482025146484375;
        float _2629 = cos(_2627);
        float _2631 = _2625 * 0.15915493667125701904296875;
        float _2633 = _2623 * 6.283185482025146484375;
        float _2635 = sin(_2633);
        float _2637 = 1.0 / _2629;
        float _2639 = _2631 * 6.283185482025146484375;
        float _2641 = cos(_2639);
        float _2643 = _2635 * _2637;
        float _2645 = _2631 * 6.283185482025146484375;
        float _2647 = sin(_2645);
        float _2649 = _2641 * _2643;
        float _2651 = 1.0 / _2649;
        float _2653 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2655 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2653;
        float _2657 = 1.0 / _2655;
        float _2659 = _2647 * _2651;
        float _2661 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2663 = fma(_2563, _2659, _2661);
        float _2665 = _2663 * _2657;
        float _2667 = precise::clamp(_2665, 0.0, 1.0);
        float _2669 = -_2667;
        float _2671 = _2669 + 1.0;
        _2619 = _2649;
        _2565 = _2671;
    }
    float _2673 = _2619;
    float _2675 = _2565;
    float _2677 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2679 = _2551 + _2677;
    float _2681 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2683 = _2553 + _2681;
    float _2685 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2687 = _2555 + _2685;
    float _2689 = _2679 * _2679;
    float _2691 = fma(_2683, _2683, _2689);
    float _2693 = fma(_2687, _2687, _2691);
    float _2695 = rsqrt(_2693);
    float _2697 = sqrt(_2693);
    float _2699 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2701 = _2683 * _2699;
    float _2703 = _2687 * _2699;
    float _2705 = _2701 * _2701;
    float _2707 = _2703 * _2703;
    float _2709 = _2705 + _2707;
    float _2711 = sqrt(_2709);
    bool _2713 = _2711 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2717 = _2711 + _2715;
    float _2719 = _2695;
    float _2721 = _2717;
    float _2723 = _2673;
    float _2725 = _2679;
    if (_2713)
    {
        float _2727 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2719 = _2727;
    }
    float _2729 = _2719;
    float _2731 = _2729;
    if (_2713)
    {
        float _2733 = _2717 * _2729;
        _2721 = _2733;
    }
    float _2735 = _2721;
    if (_2713)
    {
        float _2737 = rsqrt(_2709);
        _2731 = _2737;
    }
    float _2739 = _2731;
    float _2741 = _2739;
    if (_2713)
    {
        float _2743 = _2735 * 0.15915493667125701904296875;
        _2723 = _2743;
    }
    float _2745 = _2723;
    float _2747 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2749 = _2687;
    float _2751 = _2745;
    if (_2713)
    {
        float _2753 = _2745 * 6.283185482025146484375;
        float _2755 = sin(_2753);
        _2749 = _2755;
    }
    float _2757 = _2749;
    float _2759 = precise::max(0.0, _2747);
    float _2761 = _498;
    float _2763 = _2759;
    if (_2713)
    {
        float _2765 = _2745 * 6.283185482025146484375;
        float _2767 = cos(_2765);
        _2761 = _2767;
    }
    float _2769 = _2761;
    float _2771 = -_2699;
    float _2773 = -_2759;
    float _2775 = fma(_2679, _2771, _2773);
    if (_2713)
    {
        float _2777 = _2775 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2725 = _2777;
    }
    float _2779 = _2725;
    float _2781 = _2757;
    float _2783 = _2779;
    if (_2713)
    {
        float _2785 = fma(_2757, _2779, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2781 = _2785;
    }
    float _2787 = _2781;
    float _2789 = _2787;
    if (!_2713)
    {
        _2783 = _2775;
    }
    float _2791 = _2783;
    float _2793 = _2791;
    if (_2713)
    {
        float _2795 = _2739 * _2787;
        _1871 = _2795;
    }
    float _2797 = _1871;
    if (!_2713)
    {
        _2741 = _2701;
    }
    float _2799 = _2741;
    float _2801 = _2799;
    float _2803 = _2769;
    if (_2713)
    {
        float _2805 = _2769 + (-1.0);
        _2763 = _2805;
    }
    float _2807 = _2763;
    float _2809 = _2807;
    if (_2713)
    {
        float _2811 = _2701 * _2797;
        _2801 = _2811;
    }
    float _2813 = _2801;
    if (!_2713)
    {
        _2789 = _2705;
    }
    float _2815 = _2789;
    float _2817 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2819 = _2815;
    if (_2713)
    {
        float _2821 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2751 = _2821;
    }
    float _2823 = _2751;
    if (!_2713)
    {
        _2809 = _2703;
    }
    float _2825 = _2809;
    float _2827 = _2825;
    if (_2713)
    {
        float _2829 = _2703 * _2797;
        _2827 = _2829;
    }
    float _2831 = _2827;
    if (_2713)
    {
        float _2833 = _2813 * _2813;
        _2819 = _2833;
    }
    float _2835 = _2819;
    if (_2713)
    {
        float _2837 = fma(_2775, _2769, _2823);
        _2793 = _2837;
    }
    float _2839 = _2793;
    if (!_2713)
    {
        _2803 = _2707;
    }
    float _2841 = _2803;
    float _2843 = _2841;
    if (_2713)
    {
        float _2845 = _2831 * _2831;
        _2843 = _2845;
    }
    float _2847 = _2843;
    float _2849 = fma(_2839, _2839, _2835);
    float _2851 = fma(_2553, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2817);
    float _2853 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2855 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2857 = _2849 + _2847;
    float _2859 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2861 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2863 = fma(_2697, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2861);
    float _2865 = precise::clamp(_2863, 0.0, 1.0);
    float _2867 = fma(_2555, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2851);
    float _2869 = rsqrt(_2857);
    float _2871 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2873 = fma(_2553, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2859);
    float _2875 = -_2865;
    float _2877 = _2875 + 1.0;
    float _2879 = _2867 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2881 = fma(_2553, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2871);
    float _2883 = fma(_2553, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2855);
    float _2885 = abs(_2877);
    float _2887 = log2(_2885);
    float _2889 = fma(_2555, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2873);
    float _2891 = _2879 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2893 = fma(_2555, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2881);
    float _2895 = fma(_2555, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2883);
    float _2897 = _2889 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2899 = -_2891;
    float _2901 = fma(_2899, _2853, 1.0);
    float _2903 = _2893 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2905 = _2869 * _2813;
    float _2907 = _2897 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2909 = _2895 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2911 = _2869 * _2839;
    float _2913 = _2905 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2915 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2907);
    float _2917 = _2869 * _2831;
    float _2919 = log2(_2901);
    float _2921 = -_2913;
    float _2923 = fma(_2911, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2921);
    float _2925 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2915);
    float _2927 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2929 = _2897 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2931 = -_2917;
    float _2933 = fma(_2931, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2923);
    float _2935 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2925);
    float _2937 = _2897 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2939 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2929);
    float _2941 = fma(_2933, -0.5, 0.5);
    float _2943 = exp2(_2927);
    float _2945 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2937);
    float _2947 = fma(_2933, 0.5, 0.5);
    float _2949 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2939);
    float _2951 = _2911 + 1.0;
    float _2953 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2945);
    float _2955 = fma(_2947, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2957 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2949);
    float _2959 = 1.0 / _2935;
    float _2961 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2953);
    float _2963 = fma(_2947, _2955, -0.212114393711090087890625);
    float _2965 = _2919 * 0.693147182464599609375;
    float _2967 = fma(_2947, _2963, 1.570728778839111328125);
    float _2969 = _2965 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2971 = sqrt(_2941);
    float _2973 = -_2911;
    float _2975 = fma(_2943, _2951, _2973);
    float _2977 = _2961 * _2959;
    float _2979 = _2957 * _2959;
    float _2981 = fma(_2975, 0.5, 0.5);
    float _2983 = fma(_2977, 0.5, 0.5);
    float _2985 = fma(_2979, -0.5, 0.5);
    float _2987 = _2971 * 0.636619746685028076171875;
    float3 _7901 = float3(_2983, _2985, _2969);
    float _2989 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7901, float3(0.0), isnan(_7901)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7901, float3(0.0), isnan(_7901)), level(0.0)).x;
    float _2991 = -_2967;
    float _2993 = fma(_2987, _2991, 1.0);
    float3 _7917 = float3(_2983, _2985, _2969);
    float4 _2996 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7917, float3(0.0), isnan(_7917)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7917, float3(0.0), isnan(_7917)), level(0.0)).xyzw;
    float _2998 = _2996.x;
    float _3000 = _2996.y;
    float _3002 = _2996.z;
    float _3004 = _2996.w;
    float2 _7934 = float2(_2993, _2981);
    float3 _3008 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7934, float2(0.0), isnan(_7934)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7934, float2(0.0), isnan(_7934)), level(0.0)).xyz;
    float _3010 = _3008.x;
    float _3012 = _3008.y;
    float _3014 = _3008.z;
    float _3016 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3018 = _2897 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3020 = _2935 * 0.5;
    float _3022 = _2961 + _2935;
    out.m_79.x = _2553;
    out.m_79.y = _2551;
    out.m_79.z = _2555;
    float _3024 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3018);
    float _3026 = exp2(_3016);
    float _3028 = _3022 * 0.5;
    bool _3030 = _2697 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3032 = isnan(_2697);
    bool _3034 = _3030 || _3032;
    bool _3036 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3038 = _3034 || _3036;
    float _3040 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3024);
    float _3042 = fma(_2957, -0.5, _3020);
    out.m_81.x = _2095;
    out.m_81.y = _2109;
    out.m_81.z = _2113;
    float _3044 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3040);
    float _3046 = _3044 + _2935;
    out.gl_Position.x = _2961;
    out.gl_Position.y = _2957;
    out.gl_Position.z = _3044;
    out.gl_Position.w = _2935;
    float _3048 = _3046 * 0.5;
    float _3050 = -_3026;
    float _3052 = _3050 + 1.0;
    float _3054 = _2935;
    float _3056 = _3044;
    float _3058 = _2957;
    if (!_3038)
    {
        _2131 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3060 = _2131;
    float _3062 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _3028;
    out.m_83.y = _3042;
    out.m_83.z = _3048;
    out.m_83.w = _2935;
    float _3064 = _3060;
    float _3066 = _3060;
    if (!_3038)
    {
        _2133 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3068 = _2133;
    float _3070 = -_3062;
    float _3072 = _3070 + 1.0;
    float _3074 = _2617 * _2675;
    float _3076 = _3068;
    float _3078 = _3068;
    if (!_3038)
    {
        _3054 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3080 = _3054;
    float _3082 = _3080;
    float _3084 = _3080;
    if (!_3038)
    {
        _3056 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3086 = _3056;
    float _3088 = _3074 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3090 = _3088;
    float _3092 = _3086;
    float _3094 = _3086;
    if (!_3038)
    {
        _3058 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3096 = _3058;
    float _3098 = _528 * _3088;
    float _3100 = _3096;
    float _3102 = _3096;
    if (!_3038)
    {
        _3090 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3104 = _3090;
    float _3106 = _3062 * _2989;
    float _3108 = _3004 * _3106;
    float _3110 = _3014 * _3106;
    float _3112 = fma(_3010, _3108, _2998);
    float _3114 = fma(_3012, _3108, _3000);
    float _3116 = _3004 * _3072;
    float _3118 = fma(_3004, _3110, _3002);
    out.m_85.x = _3112;
    out.m_85.y = _3114;
    out.m_85.z = _3118;
    out.m_85.w = _3116;
    bool _3120 = !_3038;
    float _3122 = _3104;
    float _3124 = _3104;
    if (!_3120)
    {
        bool _3126 = _2697 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3128 = isnan(_2697);
        bool _3130 = _3126 || _3128;
        bool _3132 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3134 = _3130 || _3132;
        if (!_3134)
        {
            float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3138 = _2697 + _3136;
            float _3140 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3142 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3140;
            float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3146 = _3144 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3148 = 1.0 / _3142;
            float _3150 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3152 = _3150 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3154 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3156 = _3154 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3158 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3160 = _3158 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3162 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3164 = _3162 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3166 = _3138 * _3148;
            float _3168 = precise::clamp(_3166, 0.0, 1.0);
            float _3170 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3172 = _3170 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3174 = fma(_3168, _3146, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3176 = fma(_3168, _3172, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3178 = fma(_3168, _3152, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3180 = fma(_3168, _3156, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3182 = fma(_3168, _3160, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3184 = fma(_3168, _3164, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3078 = _3178;
            _3102 = _3182;
            _3066 = _3174;
            _3094 = _3180;
            _3084 = _3176;
            _3124 = _3184;
            _3186 = true;
        }
        else
        {
            bool _3188 = _2697 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3190 = isnan(_2697);
            bool _3192 = _3188 || _3190;
            bool _3194 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3196 = _3192 || _3194;
            if (!_3196)
            {
                _3064 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3198 = _3064;
            _3066 = _3198;
            if (!_3196)
            {
                _3076 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3200 = _3076;
            _3078 = _3200;
            if (!_3196)
            {
                _3082 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3202 = _3082;
            _3084 = _3202;
            if (!_3196)
            {
                _3092 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3204 = _3092;
            _3094 = _3204;
            if (!_3196)
            {
                _3100 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3206 = _3100;
            _3102 = _3206;
            if (!_3196)
            {
                _3122 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3208 = _3122;
            bool _3210 = !_3196;
            _3124 = _3208;
            if (!_3210)
            {
                bool _3212 = _2697 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3214 = isnan(_2697);
                bool _3216 = _3212 || _3214;
                bool _3218 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3220 = _3216 || _3218;
                if (!_3220)
                {
                    float _3222 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3224 = _2697 + _3222;
                    float _3226 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3228 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3226;
                    float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3234 = 1.0 / _3228;
                    float _3236 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3238 = _3236 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3240 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3242 = _3240 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3244 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3246 = _3244 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3248 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3250 = _3248 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3252 = _3224 * _3234;
                    float _3254 = precise::clamp(_3252, 0.0, 1.0);
                    float _3256 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3258 = _3256 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3260 = fma(_3254, _3232, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3262 = fma(_3254, _3258, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3264 = fma(_3254, _3238, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3266 = fma(_3254, _3242, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3268 = fma(_3254, _3246, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3270 = fma(_3254, _3250, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3078 = _3264;
                    _3102 = _3268;
                    _3066 = _3260;
                    _3094 = _3266;
                    _3084 = _3262;
                    _3124 = _3270;
                    _3186 = true;
                }
                else
                {
                    _3078 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3102 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3066 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3094 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3084 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3124 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3186 = false;
    float _3272 = _3078;
    float _3274 = _3102;
    float _3276 = _3066;
    float _3278 = _3094;
    float _3280 = _3084;
    float _3282 = _3124;
    float _3284 = fma(_2055, -0.5, 0.5);
    float _3286 = precise::clamp(_3284, 0.0, 1.0);
    float _3288 = -_3272;
    float _3290 = _3288 + _3274;
    float _3292 = _3098 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3294 = -_3276;
    float _3296 = _3294 + _3278;
    float _3298 = fma(_3286, _3290, _3272);
    out.m_87.x = 0.0;
    float _3300 = -_3280;
    float _3302 = _3300 + _3282;
    float _3304 = fma(_3286, _3296, _3276);
    float _3306 = _3298 * 0.586610972881317138671875;
    out.m_51.x = _3292;
    bool _3308 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3310 = fma(_3286, _3302, _3280);
    float _3312 = fma(_3304, 0.298911988735198974609375, _3306);
    bool _3314 = _2617 > 0.0;
    bool _3316 = isnan(_2617);
    bool _3318 = _3314 || _3316;
    bool _3320 = isnan(0.0);
    bool _3322 = _3318 || _3320;
    float _3324 = fma(_3310, 0.114477999508380889892578125, _3312);
    bool _3326 = _2675 <= 0.0;
    bool _3328 = !_3322;
    bool _3330 = _3326 || _3328;
    float _3332 = -_3324;
    float _3334 = _3304 + _3332;
    float _3336 = -_3324;
    float _3338 = _3298 + _3336;
    float _3340 = -_3324;
    float _3342 = _3310 + _3340;
    float _3344 = fma(_3334, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3324);
    float _3346 = fma(_3338, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3324);
    float _3348 = fma(_3342, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3324);
    bool _3350 = !_3308;
    if (!_3350)
    {
        float _3352 = -_2551;
        float _3354 = _3352 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3356 = -_2553;
        float _3358 = _3356 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3360 = -_2555;
        float _3362 = _3360 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3364 = _3354 * _3354;
        float _3366 = fma(_3358, _3358, _3364);
        float _3368 = fma(_3362, _3362, _3366);
        float _3370 = sqrt(_3368);
        float _3372 = rsqrt(_3368);
        float _3374 = -_3370;
        float _3376 = _3374 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3378 = _3376 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3380 = precise::clamp(_3378, 0.0, 1.0);
        float _3382 = _3358 * _3372;
        float _3384 = _3354 * _3372;
        float _3386 = abs(_3380);
        float _3388 = log2(_3386);
        float _3390 = _3362 * _3372;
        float _3392 = _3382 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3394 = _2055 * _3384;
        float _3396 = -_3384;
        float _3398 = -_3392;
        float _3400 = fma(_3396, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3398);
        float _3402 = fma(_2081, _3382, _3394);
        float _3404 = -_3390;
        float _3406 = fma(_3404, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3400);
        float _3408 = fma(_2087, _3390, _3402);
        float _3410 = precise::clamp(_3408, 0.0, 1.0);
        float _3412 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3414 = _3406 + _3412;
        float _3416 = _3388 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3418 = _3414 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3420 = precise::clamp(_3418, 0.0, 1.0);
        float _3422 = exp2(_3416);
        float _3424 = _3422 * _3420;
        float _3426 = _3410 * _3424;
        float _3428 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3430 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3432 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3428;
        out.m_87.y = _3430;
        out.m_87.z = _3432;
    }
    out.m_69.x = _3344;
    out.m_69.y = _3346;
    out.m_69.z = _3348;
    if (!_3330)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3434 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3434;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3186 = false;
    bool _680 = false;
    bool _560 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = in.m_46.w;
    float _105 = trunc(_101);
    int _108 = int(_105);
    float _110 = -_103;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _112;
    bool _116 = _108 >= 1;
    float _118 = 0.0;
    float _120 = _103;
    float _122 = _112;
    float _124 = _112;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _118;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_116)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3503 = as_type<float>(_132);
        out.gl_Position.z = _3503;
    }
    if (!_116)
    {
        return out;
    }
    bool _136 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_103);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = float(_108);
    bool _148 = _112 >= _146;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    if (_152)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _120;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _134 = as_type<int>(_156);
    }
    int _158 = _134;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3558 = as_type<float>(_158);
        out.gl_Position.z = _3558;
    }
    if (_152)
    {
        return out;
    }
    float _160 = in.m_53.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _112 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    int _178 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _180 = _178 != 0;
    float _182 = _164 * _162;
    float _184 = 0.0;
    float _186 = _166;
    if (!_176)
    {
        float _188 = _166 * _166;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _182);
    float _196 = _192;
    if (!_176)
    {
        float _198 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    float _202 = in.m_46.x;
    float _204 = in.m_46.y;
    float _206 = in.m_46.z;
    float _208 = _194 * 6.283185482025146484375;
    float _210 = floor(_194);
    float _212 = _208 * 0.15915493667125701904296875;
    float _214 = _212 * 6.283185482025146484375;
    float _216 = cos(_214);
    float _218 = -_210;
    float _220 = _194 + _218;
    bool _222 = !_176;
    float _224 = _200;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _166 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _166);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _254;
    }
    float _256 = _224;
    bool _258 = !_176;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _166 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _186 = _278;
    }
    float _280 = _186;
    float _282 = in.m_55.w;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _286 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    float _294 = _284 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _296 = _284 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _298 = _284 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _300 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _302 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].x, _294);
    float _304 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].y, _296);
    float _306 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].z, _298);
    float _308 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[10].x, _302);
    bool _310 = _220 < 0.5;
    float _312 = float(_310);
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[10].y, _304);
    float _316 = fma(_216, 0.5, 0.5);
    float _318 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[10].z, _306);
    float _320 = _294;
    float _322 = _296;
    if (!_176)
    {
        float _324 = _112 * _112;
        float _326 = _324 * 0.5;
        _320 = _326;
    }
    float _328 = _320;
    float _330 = -_220;
    float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _334 = fma(_280, _202, _308);
    float _336 = fma(_280, _204, _314);
    float _338 = -_312;
    float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _342 = -_316;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _346 = fma(_280, _206, _318);
    float _348 = _328;
    if (!_176)
    {
        _322 = _112;
    }
    float _350 = _322;
    float _352 = _350;
    if (!_176)
    {
        float _354 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _348 = _354;
    }
    float _356 = _348;
    bool _358 = !_176;
    float _360 = _356;
    if (!_358)
    {
        float _362 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _364 = log2(_362);
        float _366 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _368 = _366 + 1.0;
        float _370 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _372 = _112 * _364;
        float _374 = 1.0 / _368;
        float _376 = _370 * 0.693147182464599609375;
        float _378 = exp2(_372);
        float _380 = 1.0 / _376;
        float _382 = _378 + (-1.0);
        float _384 = -_382;
        float _386 = fma(_384, _380, _112);
        float _388 = _386 * _374;
        float _390 = _388 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _360 = _390;
    }
    float _392 = _360;
    bool _394 = !_176;
    if (!_394)
    {
        float _396 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _398 = log2(_396);
        float _400 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _402 = _400 + 1.0;
        float _404 = 1.0 / _402;
        float _406 = _112 * _398;
        float _408 = exp2(_406);
        float _410 = -_408;
        float _412 = _410 + 1.0;
        float _414 = _412 * _404;
        _352 = _414;
    }
    float _416 = _352;
    float _418 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _420 = fma(_334, _282, _288);
    float _422 = fma(_336, _282, _290);
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _430 = _428 != 0;
    float _432 = fma(_346, _282, _292);
    float _434 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _436 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _438 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    bool _440 = !_426;
    int _442 = _440 ? 0 : 1;
    float _444 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _446 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[8].y, _436);
    float _448 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _450 = abs(_442);
    float _452 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[8].x, _438);
    float _454 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[8].z, _444);
    float _456 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[10].y, _446);
    float _458 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[10].x, _452);
    bool _460 = !_180;
    int _462 = _460 ? 0 : 1;
    float _464 = fma(_416, _204, _456);
    float _466 = float(_450);
    float _468 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[10].z, _454);
    bool _470 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _472 = -_464;
    float _474 = _336 + _472;
    bool _476 = !_430;
    int _478 = _476 ? 0 : 1;
    float _480 = abs(_332);
    float _482 = _466 * _480;
    int _484 = abs(_462);
    float _486 = 1.0 / _146;
    float _488 = fma(_416, _202, _458);
    int _490 = abs(_478);
    float _492 = _474 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _494 = float(_484);
    float _496 = _474 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _498 = fma(_416, _206, _468);
    float _500 = -_488;
    float _502 = _334 + _500;
    float _504 = _474 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _506 = float(_490);
    float _508 = -_498;
    float _510 = _346 + _508;
    float _512 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[4].x, _492);
    float _514 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[5].x, _496);
    float _516 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[6].x, _504);
    float _518 = fma(_494, _344, _482);
    float _520 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[4].z, _512);
    float _522 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[5].z, _514);
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[6].z, _516);
    float _526 = abs(_340);
    float _528 = fma(_506, _526, _518);
    float _530 = _112 * _486;
    bool _532 = !_470;
    float _534 = _522;
    float _536 = _520;
    float _538 = _524;
    float _540 = _520;
    float _542 = _464;
    float _558;
    if (!_532)
    {
        float _544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _546 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _548 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[12].x, _112);
        float _550 = _548 * _544;
        float _552 = floor(_550);
        float _554 = -_552;
        float _556 = _550 + _554;
        _558 = _556;
        _560 = true;
    }
    else
    {
        _558 = _530;
    }
    _560 = false;
    float _562 = _558;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _566 = _562 + _564;
    bool _568 = _562 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _570 = isnan(_562);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _580;
    float _584 = -_578;
    float _586 = _584 + 1.0;
    bool _588 = _562 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _590 = isnan(_562);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = 1.0 / _582;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _606;
    bool _610 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _612 = _566 * _600;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _614;
    float _618 = in.m_55.x;
    float _620 = in.m_55.y;
    float _622 = in.m_55.z;
    float _624 = _598 * _586;
    float _626 = fma(_604, _612, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _628 = fma(_616, _612, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _630 = fma(_608, _612, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _632 = -_598;
    float _634 = _632 + 1.0;
    float _636 = _626 * _624;
    float _638 = _628 * _624;
    float _640 = _630 * _624;
    float _642 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].x, _636);
    float _644 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].y, _638);
    float _646 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].z, _640);
    float _648 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[144].x, _642);
    float _650 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[144].y, _644);
    float _652 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[144].z, _646);
    float _654 = _648 * _618;
    float _656 = _650 * _620;
    float _658 = _652 * _622;
    bool _660 = !_610;
    float _662 = _648;
    float _678;
    if (!_660)
    {
        float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _666 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[11].y, _112);
        float _670 = _668 * _664;
        float _672 = floor(_670);
        float _674 = -_672;
        float _676 = _670 + _674;
        _678 = _676;
        _680 = true;
    }
    else
    {
        _678 = _530;
    }
    _680 = false;
    float _682 = _678;
    float _684 = in.m_57.x;
    float _686 = _160 * 2.0;
    float _688 = in.m_57.y;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _692 = _690 != 0;
    float _694 = _422 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _698 = _696 != 0;
    float _700 = in.m_53.y;
    bool _702 = _160 > 0.5;
    bool _704 = _702 && _692;
    float _706 = floor(_686);
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _710 = _708 != 0;
    float _712 = _422 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _714 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[5].x, _694);
    float _716 = in.m_53.z;
    float _718 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _720 = int(_718);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _728 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[5].z, _714);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _734 = _682 + _732;
    float _736 = _684;
    if (_692)
    {
        _662 = _684;
    }
    float _738 = _662;
    float _740 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _742 = int(_740);
    float _744 = -_688;
    float _746 = _744 + 1.0;
    float _748 = _738;
    float _750 = _688;
    if (_704)
    {
        float _752 = -_738;
        float _754 = _752 + 1.0;
        _748 = _754;
    }
    float _756 = _748;
    float _758 = _728 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _760 = _700 > 0.5;
    float _762 = _654 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _764 = float(_720);
    float _766 = 1.0 / _724;
    if (_698)
    {
        float _768 = _760 ? _746 : _688;
        _750 = _768;
    }
    float _770 = _750;
    float _772 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _776 = _774 != 0;
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _780 = _778 != 0;
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _784 = _782 != 0;
    float _786 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    if (_692)
    {
        _736 = _756;
    }
    float _788 = _736;
    float _790 = -_726;
    float _792 = fma(_772, 2.0, _790);
    bool _794 = _706 >= 0.0;
    bool _796 = isnan(_706);
    bool _798 = _794 || _796;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    float _804 = 1.0 / _764;
    float _806 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _808 = _802 ? 0 : 1;
    float _810 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _812 = _706 > 0.0;
    float _814 = _422 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _816 = ~_808;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = _700 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _826 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[4].x, _814);
    float _828 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[6].x, _712);
    float _830 = fma(_822, -2.0, _730);
    float _832 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].z, _826);
    float _834 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[6].z, _828);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _840 = _820;
    if (!_812)
    {
        int _842 = ~_808;
        int _844 = _842 + 1;
        _840 = _844;
    }
    int _846 = _840;
    float _848 = _700 * 2.0;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _852;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _858 = _856 != 0;
    float _860 = floor(_848);
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _866 = !_710;
    float _868 = _866 ? 7.345489978790283203125 : 1.0;
    float _870 = _854 * _766;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _874 = _872 != 0;
    float _876 = _824 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _878 = float(uint(_742));
    float _880 = 1.0 / _838;
    bool _882 = !_780;
    int _884 = _882 ? 0 : 1;
    float _886 = _850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _888 = !_776;
    int _890 = _888 ? 0 : 1;
    float _892 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _894 = !_784;
    int _896 = _894 ? 0 : 1;
    float _898 = _832 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _900 = float(_742);
    float _902 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _904 = log2(_902);
    bool _906 = _860 >= 0.0;
    bool _908 = isnan(_860);
    bool _910 = _906 || _908;
    bool _912 = isnan(0.0);
    bool _914 = _910 || _912;
    float _916 = _112 * _804;
    out.m_59.x = _876;
    out.m_59.y = _886;
    out.m_59.z = _892;
    out.m_59.w = _864;
    float _918 = _112 * _900;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _922 = _920 != 0;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _926 = _924 != 0;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _930 = _928 != 0;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _936 = 1.0 / _878;
    float _938 = _918 * _486;
    float _940 = _716 * 2.0;
    float _942 = _934 * _880;
    int _944 = ~_742;
    int _946 = _944 + 1;
    float _948 = _834 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _950 = _914 ? 0 : 1;
    float _952 = fma(_942, _734, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _954 = trunc(_916);
    int _956 = int(_954);
    float _958 = _700 + _716;
    float _960 = _160 + _716;
    float _962 = _112 * _904;
    float _964 = _958 + (-1.0);
    float _966 = _160 + _700;
    bool _968 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _970 = isnan(_682);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = floor(_940);
    int _982 = as_type<int>(_936) + (-2);
    float _984 = _960 + (-1.0);
    float _986 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _990 = _682 + _988;
    float _992 = _966 + (-1.0);
    float _994 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _996 = _868 * _160;
    float _998 = float(uint(_956));
    float _1000 = exp2(_962);
    float _1002 = fma(_870, _990, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1004 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1006 = isnan(_682);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1012 = _1008 || _1010;
    float _1014 = float(_1012);
    float _1016 = -_978;
    float _1018 = _1016 + 1.0;
    float _1020 = as_type<float>(_982) * _998;
    float _1022 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1024 = _860 > 0.0;
    float _1026 = _1014 * _1018;
    float _1028 = floor(_996);
    float _1030 = -_1014;
    float _1032 = _1030 + 1.0;
    bool _1034 = !_922;
    int _1036 = _1034 ? 0 : 1;
    float _1038 = _716 + (-0.5);
    bool _1040 = _980 >= 0.0;
    bool _1042 = isnan(_980);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan(0.0);
    bool _1048 = _1044 || _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1052 = 1.0 + _1050;
    bool _1054 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1056 = isnan(_682);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    float _1066 = trunc(_1020);
    float _1068 = precise::max(_1066, 0.0);
    uint _1071 = uint(_1068);
    float _1073 = -_1000;
    float _1075 = _1073 + 1.0;
    int _1077 = _1048 ? 0 : 1;
    bool _1079 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1081 = isnan(0.0);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1087 = _1083 || _1085;
    bool _1089 = !_926;
    int _1091 = _1089 ? 0 : 1;
    float _1093 = 1.0 / _1052;
    float _1095 = _1087 ? _1075 : 0.0;
    float _1097 = -_1028;
    float _1099 = _996 + _1097;
    bool _1101 = _980 > 0.0;
    int _1103 = abs(_1036);
    float _1105 = float(_846);
    int _1107 = _946 * int(_1071);
    int _1109 = _1107 + _956;
    int _1111 = ~_1077;
    int _1113 = _1111 + 1;
    int _1115 = _1113 + 1;
    float _1117 = _1099 * _900;
    int _1119 = ~_742;
    int _1121 = _1119 + 1;
    float _1123 = trunc(_938);
    int _1125 = int(_1123);
    float _1127 = float(uint(_1109));
    float _1129 = _1064 * _1032;
    int _1131 = abs(_1091);
    float _1133 = _1095 * _1093;
    float _1135 = -_1064;
    float _1137 = _1135 + 1.0;
    float _1139 = as_type<float>(_982) * _1127;
    float _1141 = in.m_61.x;
    float _1143 = in.m_61.y;
    float _1145 = in.m_61.z;
    float _1147 = _1002 * _1129;
    float _1149 = float(_956);
    float _1151 = trunc(_1139);
    float _1153 = precise::max(_1151, 0.0);
    uint _1155 = uint(_1153);
    float _1157 = float(_1131);
    float _1159 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1147);
    bool _1161 = _1149 >= _900;
    bool _1163 = isnan(_1149);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan(_900);
    bool _1169 = _1165 || _1167;
    float _1171 = float(_1169);
    float _1173 = _700 + (-0.5);
    int _1175 = _1115;
    if (!_1101)
    {
        int _1177 = ~_1077;
        int _1179 = _1177 + 1;
        _1175 = _1179;
    }
    int _1181 = _1175;
    float _1183 = _1157 * _1105;
    float _1185 = _160 + (-0.5);
    float _1187 = float(_1181);
    float _1189 = _1183 * (-2.0);
    float _1191 = float(_1103);
    float _1193 = trunc(_1171);
    int _1195 = int(_1193);
    int _1197 = ~_950;
    int _1199 = _1197 + 1;
    int _1201 = _1199 + 1;
    float _1203 = fma(_986, _1189, _986);
    int _1205 = _1201;
    if (!_1024)
    {
        int _1207 = ~_950;
        int _1209 = _1207 + 1;
        _1205 = _1209;
    }
    int _1211 = _1205;
    float _1213 = _1191 * _1187;
    int _1215 = int(_1071) + int(_1155);
    float _1217 = _1213 * (-2.0);
    float _1219 = fma(_1189, _1143, _1143);
    int _1221 = _1121 * _1215;
    int _1223 = _1221 + _956;
    bool _1225 = !_858;
    int _1227 = _1225 ? 0 : 1;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1231 = fma(_1022, _1217, _1022);
    float _1233 = trunc(_1117);
    int _1235 = int(_1233);
    bool _1237 = uint(_1223) >= uint(_742);
    float _1239 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1229);
    int _1241 = abs(_1227);
    float _1243 = fma(_1217, _1141, _1141);
    bool _1245 = !_1237;
    int _1247 = _1245 ? 0 : (-1);
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1251 = _898 + _1249;
    float _1253 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1243);
    int _1255 = ~_1215;
    int _1257 = _1255 + _1247;
    int _1259 = _1257 + 1;
    float _1261 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1219);
    float _1263 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1239);
    bool _1265 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1267 = isnan(1.0);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1273 = _1269 || _1271;
    bool _1275 = _742 == 0;
    int _1277 = _1235 * _1241;
    int _1279 = _1277 + _956;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1283 = _742 * _1259;
    int _1285 = _1283 + _956;
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1289 = _758 + _1287;
    bool _1291 = !_1273;
    float _1293 = _1291 ? _112 : _1133;
    float _1295 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1281);
    float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1299 = _948 + _1297;
    float _1301 = _1289 * _1289;
    bool _1303 = !_930;
    int _1305 = _1303 ? 0 : 1;
    float _1307 = fma(_1293, _1203, _1261);
    int _1309 = ~_1195;
    int _1311 = _1309 + 1;
    int _1313 = _1311 + 1;
    float _1315 = fma(_1251, _1251, _1301);
    bool _1317 = !_1275;
    int _1319 = _1317 ? _1285 : (-1);
    float _1321 = fma(_1293, _1231, _1253);
    int _1323 = abs(_1305);
    float _1325 = fma(_1299, _1299, _1315);
    float _1327 = float(_1211);
    int _1329 = _1319 * _1313;
    int _1331 = _742 + (-1);
    float _1333 = sqrt(_1325);
    float _1335 = float(_1323);
    float _1337 = _1321 * 0.15915493667125701904296875;
    int _1339 = abs(_884);
    int _1341 = _1195 * _1331;
    int _1343 = _1341 + _1329;
    int _1345 = abs(_890);
    float _1347 = _1335 * _1327;
    bool _1349 = !_874;
    int _1351 = _1349 ? 0 : 1;
    float _1353 = rsqrt(_1325);
    int _1355 = abs(_896);
    float _1357 = _1307 * 0.15915493667125701904296875;
    float _1359 = _762 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1361 = abs(_1351);
    float _1363 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1295);
    float _1365 = float(uint(_1279));
    float _1367 = _1333 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _1369 = _1343 * _1339;
    float _1371 = as_type<float>(_982) * _1365;
    float _1373 = _1347 * (-2.0);
    int _1375 = _1125 * _1345;
    int _1377 = _1375 + _1369;
    float _1379 = precise::min(_1359, _1367);
    float _1381 = trunc(_1371);
    float _1383 = precise::max(_1381, 0.0);
    uint _1385 = uint(_1383);
    int _1387 = _1279 * _1355;
    int _1389 = _1387 + _1377;
    float _1391 = fma(_1373, _1145, _1145);
    float _1393 = in.m_63.x;
    float _1395 = in.m_63.y;
    float _1397 = in.m_63.z;
    float _1399 = _1353 * _1379;
    int _1401 = _1235 * _1361;
    int _1403 = _1401 + _1389;
    float _1405 = fma(_994, _1373, _994);
    float _1407 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1391);
    float _1409 = _1289 * _1399;
    float _1411 = _1251 * _1399;
    float _1413 = float(uint(_1403));
    float _1415 = fma(_1293, _1405, _1407);
    float _1417 = -_1409;
    float _1419 = _1289 + _1417;
    float _1421 = -_1411;
    float _1423 = _1251 + _1421;
    int _1425 = ~_742;
    int _1427 = _1425 + 1;
    float _1429 = as_type<float>(_982) * _1413;
    float _1431 = _1419 * _1419;
    int _1433 = ~_742;
    int _1435 = _1433 + 1;
    float _1437 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1439 = _1299 * _1399;
    float _1441 = fma(_1423, _1423, _1431);
    float _1443 = trunc(_1429);
    float _1445 = precise::max(_1443, 0.0);
    uint _1447 = uint(_1445);
    float _1449 = in.m_65.x;
    float _1451 = in.m_65.y;
    float _1453 = in.m_65.z;
    int _1455 = _1435 * int(_1385);
    int _1457 = _1455 + _1279;
    float _1459 = _1415 * 0.15915493667125701904296875;
    int _1461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1463 = _1461 != 0;
    bool _1465 = _1395 != 0.0;
    bool _1467 = isnan(_1395);
    bool _1469 = _1465 || _1467;
    bool _1471 = isnan(0.0);
    bool _1473 = _1469 || _1471;
    float _1475 = _1357 * 6.283185482025146484375;
    float _1477 = sin(_1475);
    float _1479 = float(uint(_1457));
    bool _1481 = _1393 == 0.0;
    bool _1483 = !_1473;
    bool _1485 = _1481 && _1483;
    float _1487 = as_type<float>(_982) * _1479;
    bool _1489 = _1397 == 0.0;
    bool _1491 = _1489 && _1485;
    int _1493 = _1427 * int(_1447);
    int _1495 = _1493 + _1403;
    float _1497 = _1357 * 6.283185482025146484375;
    float _1499 = cos(_1497);
    float _1501 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _830);
    float _1503 = -_1439;
    float _1505 = _1299 + _1503;
    float _1507 = float(uint(_1495));
    float _1509 = -_1501;
    float _1511 = fma(_1263, _1437, _1509);
    float _1513 = _1337 * 6.283185482025146484375;
    float _1515 = sin(_1513);
    float _1517 = _1453;
    float _1519 = _1449;
    float _1521 = _1451;
    if (!_1491)
    {
        float _1523 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1453);
        _1517 = _1523;
    }
    float _1525 = _1517;
    if (!_1491)
    {
        float _1527 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1449);
        _1519 = _1527;
    }
    float _1529 = _1519;
    if (!_1491)
    {
        float _1531 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1451);
        _1521 = _1531;
    }
    float _1533 = _1521;
    float _1535 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1395);
    float _1537 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1393);
    float _1539 = _1337 * 6.283185482025146484375;
    float _1541 = cos(_1539);
    float _1543 = _1459 * 6.283185482025146484375;
    float _1545 = sin(_1543);
    float _1547 = -_112;
    float _1549 = fma(_1547, (*spvDescriptorSet0.vp_c9)._m0[76].x, _792);
    float _1551 = fma(_1363, _806, _1549);
    float _1553 = fma(_1505, _1505, _1441);
    float _1555 = as_type<float>(_982) * _1507;
    float _1557 = trunc(_1487);
    float _1559 = precise::max(_1557, 0.0);
    uint _1561 = uint(_1559);
    float _1563 = fma(_952, _1026, _1159);
    float _1565 = _1511 + 0.5;
    float _1567 = _1551 + 0.5;
    float _1569 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1397);
    float _1571 = _1515 * _1477;
    float _1573 = _1541 * _1499;
    float _1575 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1563);
    float _1577 = sqrt(_1553);
    out.m_67.x = _1567;
    out.m_67.y = _1565;
    float _1579 = fma(_1545, _1573, _1571);
    float _1581 = _1515 * _1499;
    float _1583 = _1541 * _1477;
    float _1585 = trunc(_1555);
    float _1587 = precise::max(_1585, 0.0);
    uint _1589 = uint(_1587);
    int _1591 = int(_1385) + int(_1561);
    float _1593 = fma(_1545, _1571, _1573);
    int _1595 = ~_742;
    int _1597 = _1595 + 1;
    float _1599 = -_1581;
    float _1601 = fma(_1545, _1583, _1599);
    int _1603 = ~_742;
    int _1605 = _1603 + 1;
    float _1607 = _1459 * 6.283185482025146484375;
    float _1609 = cos(_1607);
    float _1611 = _1353 * _1577;
    float _1613 = -_1583;
    float _1615 = fma(_1545, _1581, _1613);
    float _1617 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1619 = _786 * _1611;
    float _1621 = _810 * _1611;
    int _1623 = _1597 * _1591;
    int _1625 = _1623 + _1279;
    int _1627 = int(_1447) + int(_1589);
    float _1629 = _762 * _1611;
    float _1631 = _1619 * _1569;
    bool _1633 = uint(_1625) >= uint(_742);
    int _1635 = _1605 * _1627;
    int _1637 = _1635 + _1403;
    float _1639 = _1621 * _1535;
    float _1641 = _1541 * _1609;
    float _1643 = _1499 * _1609;
    bool _1645 = uint(_1637) >= uint(_742);
    float _1647 = _1515 * _1609;
    float _1649 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1651 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1653 = !_1645;
    int _1655 = _1653 ? 0 : (-1);
    float _1657 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1659 = -_1545;
    float _1661 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1649);
    float _1663 = _1579 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1665 = ~_1627;
    int _1667 = _1665 + _1655;
    int _1669 = _1667 + 1;
    float _1671 = -_1545;
    float _1673 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1651);
    float _1675 = -_1545;
    float _1677 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1657);
    float _1679 = -_1639;
    float _1681 = _1545 * _1679;
    float _1683 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1663);
    int _1685 = _742 * _1669;
    int _1687 = _1685 + _1403;
    float _1689 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1661);
    float _1691 = _1641 * _1639;
    float _1693 = _1629 * _1537;
    float _1695 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1673);
    bool _1697 = !_1275;
    int _1699 = _1697 ? _1687 : (-1);
    float _1701 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1677);
    float _1703 = _1647 * _1639;
    float _1705 = _1579 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1707 = _1699 >> 31;
    float _1709 = _1579 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1711 = fma(_1579, _1693, _1691);
    float _1713 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1705);
    int _1715 = _1707 & 3;
    float _1717 = _1477 * _1609;
    float _1719 = fma(_1643, _1693, _1681);
    float _1721 = fma(_1615, _1693, _1703);
    int _1723 = _1699 + _1715;
    float _1725 = fma(_1601, _1631, _1711);
    float _1727 = fma(_1717, _1631, _1719);
    float _1729 = fma(_1593, _1631, _1721);
    int _1731 = _1723 >> 2;
    float _1733 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1735 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1737 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1739 = _1731 << 4;
    int _1741 = _1739 + 368;
    float _1743 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1733);
    float _1745 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1617);
    float _1747 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1735);
    float _1749 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1751 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1737);
    float _1753 = _1689 * _1533;
    uint _1755 = uint(int(uint(_1741) >> uint(2)));
    uint _1757 = uint(int(uint(int(_1755)) >> uint(2)));
    int _1759 = int(_1755) & 3;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[int(_1757)][_1759];
    int _1763 = int(_1755) + 1;
    uint _1765 = uint(int(uint(_1763) >> uint(2)));
    int _1767 = _1763 & 3;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[int(_1765)][_1767];
    float _1771 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1749);
    float _1773 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1751);
    float _1775 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1709);
    float _1777 = _1695 * _1533;
    float _1779 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1771);
    float _1781 = _1701 * _1533;
    float _1783 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1713);
    float _1785 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1683);
    float _1787 = _1779 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1789 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1775);
    float _1791 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1793 = _1699 & 3;
    bool _1795 = _1793 != 0;
    int _1797 = _1741 + 8;
    uint _1799 = uint(int(uint(_1797) >> uint(2)));
    uint _1801 = uint(int(uint(int(_1799)) >> uint(2)));
    int _1803 = int(_1799) & 3;
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[int(_1801)][_1803];
    int _1807 = int(_1799) + 1;
    uint _1809 = uint(int(uint(_1807) >> uint(2)));
    int _1811 = _1807 & 3;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[int(_1809)][_1811];
    float _1815 = _948 + _1787;
    float _1817 = _898 + _1791;
    int _1819 = _1699 & 3;
    bool _1821 = _1819 != 0;
    float _1823 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1743);
    float _1825 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1827 = _1815 + _1825;
    bool _1829 = uint(_1793) > 1u;
    float _1831 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1745);
    float _1833 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1835 = _1817 + _1833;
    float _1837 = _1827 * _1827;
    int _1839 = _1821 ? 0 : 1;
    float _1841 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1747);
    bool _1843 = uint(_1793) >= 2u;
    float _1845 = fma(_1783, _1529, _1777);
    float _1847 = fma(_1835, _1835, _1837);
    float _1849 = fma(_1785, _1529, _1753);
    int _1851 = _1843 ? 0 : 1;
    float _1853 = fma(_1789, _1529, _1781);
    bool _1855 = _1793 != 3;
    float _1857 = sqrt(_1847);
    int _1859 = ~_1839;
    int _1861 = _1859 + 1;
    int _1863 = _1861 + 1;
    int _1865 = _1863;
    float _1867 = _1817;
    float _1869 = _1815;
    float _1871 = _1841;
    if (!_1829)
    {
        int _1873 = ~_1839;
        int _1875 = _1873 + 1;
        _1865 = _1875;
    }
    int _1877 = _1865;
    float _1879 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1881 = ~_1851;
    int _1883 = _1881 + 1;
    int _1885 = _1883 + 1;
    int _1887 = abs(_1877);
    float _1889 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1879);
    bool _1891 = !_1795;
    int _1893 = _1891 ? 0 : 1;
    bool _1895 = _1793 != 3;
    int _1897 = _1885;
    if (_1855)
    {
        int _1899 = ~_1851;
        int _1901 = _1899 + 1;
        _1897 = _1901;
    }
    int _1903 = _1897;
    float _1905 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1889);
    int _1907 = ~_1887;
    int _1909 = _1907 + 1;
    int _1911 = _1909 + 1;
    int _1913 = abs(_1893);
    float _1915 = _1905 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1917 = _1857 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1919 = _1911 * as_type<int>(_1769);
    bool _1921 = !_1895;
    int _1923 = _1921 ? 0 : (-1);
    int _1925 = ~_1913;
    int _1927 = _1925 + 1;
    int _1929 = _1927 + 1;
    int _1931 = abs(_1903);
    float _1933 = _758 + _1915;
    bool _1935 = !_1463;
    int _1937 = _1935 ? 0 : 1;
    int _1939 = _1929 * as_type<int>(_1761);
    int _1941 = _1939 + _1919;
    int _1943 = abs(_1923);
    int _1945 = ~_1931;
    int _1947 = _1945 + 1;
    int _1949 = _1947 + 1;
    int _1951 = abs(_1937);
    bool _1953 = !_1633;
    int _1955 = _1953 ? 0 : (-1);
    int _1957 = _1949 * as_type<int>(_1805);
    int _1959 = _1957 + _1941;
    int _1961 = ~_1591;
    int _1963 = _1961 + _1955;
    int _1965 = _1963 + 1;
    int _1967 = ~_1943;
    int _1969 = _1967 + 1;
    int _1971 = _1969 + 1;
    float _1973 = as_type<float>(_1949);
    if (!_1917)
    {
        _1973 = _1933;
    }
    float _1975 = _1973;
    bool _1977 = !_1917;
    float _1979 = _1975;
    if (!_1977)
    {
        float _1981 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1985 = _1857 + _1983;
        float _1987 = rsqrt(_1847);
        float _1989 = _1985 * _1981;
        float _1991 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1993 = _1989 * 0.15915493667125701904296875;
        float _1995 = _1993 * 6.283185482025146484375;
        float _1997 = cos(_1995);
        float _1999 = _1993 * 6.283185482025146484375;
        float _2001 = sin(_1999);
        float _2003 = _1997 + (-1.0);
        float _2005 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2007 = fma(_2001, _1991, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2009 = fma(_1933, _1997, _2005);
        float _2011 = _1987 * _2007;
        float _2013 = fma(_1835, _2011, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2015 = fma(_1827, _2011, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1979 = _2009;
        _1867 = _2013;
        _1869 = _2015;
    }
    float _2017 = _1979;
    float _2019 = _1867;
    float _2021 = _1869;
    float _2023 = -_758;
    float _2025 = _2023 + _2017;
    int _2027 = _1971 * as_type<int>(_1813);
    int _2029 = _2027 + _1959;
    int _2031 = ~_1951;
    int _2033 = _2031 + 1;
    int _2035 = _2033 + 1;
    int _2037 = _742 * _1965;
    int _2039 = _2037 + _1279;
    float _2041 = -_898;
    float _2043 = _2041 + _2019;
    float _2045 = _2025 * _2025;
    float _2047 = -_948;
    float _2049 = _2047 + _2021;
    int _2051 = _2029 * _2035;
    float _2053 = fma(_2043, _2043, _2045);
    float _2055 = fma(_1831, _1525, _1849);
    float _2057 = fma(_2049, _2049, _2053);
    bool _2059 = !_1275;
    int _2061 = _2059 ? _2039 : (-1);
    float _2063 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2065 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_69.w = _1379;
    float _2069 = sqrt(_2057);
    int _2071 = _2061 * _1951;
    int _2073 = _2071 + _2051;
    float _2075 = _2065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2077 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2079 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2081 = fma(_1823, _1525, _1845);
    float _2083 = _1575 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2085 = float(_2073);
    float _2087 = fma(_1841, _1525, _1853);
    out.m_71.x = _1629;
    float _2089 = -_1411;
    float _2091 = _2089 + _2019;
    float _2093 = -_1411;
    float _2095 = _898 + _2093;
    out.m_73.x = _2075;
    out.m_73.y = _2077;
    out.m_73.z = _2079;
    out.m_73.w = _2083;
    float _2097 = -_1409;
    float _2099 = _2097 + _2017;
    float _2101 = -_1439;
    float _2103 = _2101 + _2021;
    bool _2105 = _2069 > 0.0;
    out.m_75.x = _2085;
    float _2107 = -_1409;
    float _2109 = _758 + _2107;
    float _2111 = -_1439;
    float _2113 = _948 + _2111;
    out.m_77.x = _2081;
    out.m_77.y = _2055;
    out.m_77.z = _2087;
    bool _2115 = !_2105;
    float _2117 = _2077;
    float _2119 = _2079;
    float _2121 = _2075;
    float _2123 = _2091;
    float _2125 = _2103;
    float _2127 = _2099;
    float _2129 = _2083;
    float _2131 = _2109;
    float _2133 = _2095;
    if (!_2115)
    {
        bool _2135 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2137 = _2083;
        if (_2135)
        {
            float _2139 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2137 = _2139;
        }
        float _2141 = _2137;
        if (_2135)
        {
            float _2143 = _520 * _2141;
            _2117 = _2143;
        }
        float _2145 = _2117;
        float _2147 = _2145;
        if (_2135)
        {
            float _2149 = _522 * _2141;
            _2119 = _2149;
        }
        float _2151 = _2119;
        float _2153 = _2151;
        if (_2135)
        {
            float _2155 = _524 * _2141;
            _2121 = _2155;
        }
        float _2157 = _2121;
        float _2159 = _2157;
        if (!_2135)
        {
            float _2161 = _112 + 1.0;
            if (!_176)
            {
                float _2163 = _2161 * _2161;
                float _2165 = _2163 * 0.5;
                _122 = _2165;
            }
            float _2167 = _122;
            float _2169 = _2167;
            if (!_176)
            {
                float _2171 = _2167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2169 = _2171;
            }
            float _2173 = _2169;
            bool _2175 = !_176;
            float _2177 = _2173;
            if (!_2175)
            {
                float _2179 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2181 = log2(_2179);
                float _2183 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2185 = 1.0 + _2183;
                float _2187 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2189 = _2181 * _2161;
                float _2191 = 1.0 / _2185;
                float _2193 = _2187 * 0.693147182464599609375;
                float _2195 = exp2(_2189);
                float _2197 = 1.0 / _2193;
                float _2199 = _2195 + (-1.0);
                float _2201 = -_2199;
                float _2203 = fma(_2201, _2197, _2161);
                float _2205 = _2203 * _2191;
                float _2207 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2177 = _2207;
            }
            float _2209 = _2177;
            float _2211 = _2209 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2213 = _2209 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2215 = _2209 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2217 = _2209;
            if (!_176)
            {
                _2217 = _2161;
            }
            float _2219 = _2217;
            float _2221 = _2211 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2223 = _2211 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2225 = _2211 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2227 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2221);
            float _2229 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2223);
            float _2231 = fma(_2215, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2227);
            bool _2233 = !_176;
            float _2235 = _2219;
            if (!_2233)
            {
                float _2237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2239 = log2(_2237);
                float _2241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2243 = 1.0 + _2241;
                float _2245 = 1.0 / _2243;
                float _2247 = _2239 * _2161;
                float _2249 = exp2(_2247);
                float _2251 = -_2249;
                float _2253 = _2251 + 1.0;
                float _2255 = _2253 * _2245;
                _2235 = _2255;
            }
            float _2257 = _2235;
            float _2259 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2225);
            float _2261 = fma(_2215, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2229);
            float _2263 = fma(_2257, _204, _2231);
            float _2265 = fma(_2215, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2259);
            float _2267 = fma(_2257, _202, _2261);
            float _2269 = -_464;
            float _2271 = _2269 + _2263;
            float _2273 = fma(_2257, _206, _2265);
            float _2275 = -_488;
            float _2277 = _2275 + _2267;
            float _2279 = _2271 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2281 = _2271 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2283 = _2271 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2285 = -_498;
            float _2287 = _2285 + _2273;
            float _2289 = fma(_2277, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2279);
            float _2291 = fma(_2277, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2281);
            float _2293 = fma(_2277, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2283);
            float _2295 = fma(_2287, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2289);
            float _2297 = fma(_2287, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2291);
            float _2299 = fma(_2287, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2293);
            _534 = _2297;
            _536 = _2295;
            _538 = _2299;
            _2147 = _2295;
            _2153 = _2297;
            _2159 = _2299;
        }
        float _2301 = _534;
        float _2303 = _536;
        float _2305 = _538;
        float _2307 = _2147;
        float _2309 = _2153;
        float _2311 = _2159;
        float _2313 = _2301 * _2301;
        float _2315 = rsqrt(_2057);
        float _2317 = fma(_2303, _2303, _2313);
        float _2319 = fma(_2305, _2305, _2317);
        float _2321 = sqrt(_2319);
        float _2323 = _2043 * _2315;
        float _2325 = _2025 * _2315;
        float _2327 = _2049 * _2315;
        bool _2329 = _2321 > 0.0;
        bool _2331 = !_2329;
        _2129 = _2319;
        _540 = _2303;
        _124 = _2325;
        if (!_2331)
        {
            float _2333 = rsqrt(_2319);
            float _2335 = _2333 * _2301;
            float _2337 = _2333 * _2303;
            float _2339 = _2333 * _2305;
            float _2341 = _2325 * _2335;
            float _2343 = fma(_2323, _2337, _2341);
            float _2345 = fma(_2327, _2339, _2343);
            float _2347 = _2345 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2349 = fma(_2307, _2347, _2091);
            float _2351 = fma(_2309, _2347, _2099);
            float _2353 = fma(_2311, _2347, _2103);
            _2123 = _2349;
            _2125 = _2353;
            _2127 = _2351;
            _124 = _2341;
        }
    }
    float _2355 = _2123;
    float _2357 = _2125;
    float _2359 = _2127;
    float _2361 = _2129;
    float _2363 = _540;
    float _2365 = _124;
    float _2367 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2369 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2371 = isnan(0.5);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2377 = _2373 || _2375;
    float _2379 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2367);
    bool _2381 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2383 = isnan(0.5);
    bool _2385 = _2381 || _2383;
    bool _2387 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2389 = _2385 || _2387;
    float _2391 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2379);
    float _2393 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2395 = _2391 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2397 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2393);
    float _2399 = 1.0 / _2395;
    float _2401 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2397);
    float _2403 = _2365;
    float _2405 = _2395;
    float _2407 = _2363;
    if (_2389)
    {
        _2403 = 1.0;
    }
    float _2409 = _2403;
    float _2411 = _2401 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2413 = _2411 + _2395;
    float _2415 = _2409;
    if (_2377)
    {
        _2405 = _2355;
    }
    float _2417 = _2405;
    float _2419 = _2413 * _2399;
    float _2421 = _2419 * 0.5;
    float _2423 = _2399;
    float _2425 = _2421;
    float _2427 = _2417;
    if (_2377)
    {
        _2423 = _2357;
    }
    float _2429 = _2423;
    float _2431 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2433 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2431);
    float _2435 = _2433;
    float _2437 = _2429;
    if (_2377)
    {
        _2425 = _2359;
    }
    float _2439 = _2425;
    float _2441 = 1.0 / _2433;
    float _2443 = _2439;
    if (!_2377)
    {
        float _2445 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2447 = _2109 + _2445;
        float _2449 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2451 = _2095 + _2449;
        float _2453 = -_2109;
        float _2455 = _2453 + _2359;
        float _2457 = -_2113;
        float _2459 = _2457 + _2357;
        float _2461 = _2447 * _2447;
        float _2463 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2465 = _2113 + _2463;
        float _2467 = fma(_2451, _2451, _2461);
        float _2469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2471 = fma(_2465, _2465, _2467);
        float _2473 = sqrt(_2471);
        float _2475 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _2477 = _2473 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2479 = isnan(_2473);
        bool _2481 = _2477 || _2479;
        bool _2483 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2485 = _2481 || _2483;
        float _2487 = precise::min(_2473, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2489 = _2487 * _2469;
        float _2491 = _2475 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2493 = -_2095;
        float _2495 = _2493 + _2355;
        float _2497 = _2491 * _2489;
        float _2499 = _2361;
        float _2501 = _2491;
        _542 = _2455;
        if (_2485)
        {
            float _2503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2499 = _2503;
        }
        float _2505 = _2499;
        if (_2485)
        {
            float _2507 = precise::max(_2473, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2435 = _2507;
        }
        float _2509 = _2435;
        float _2511 = fma(_2455, _2497, _2109);
        float _2513 = fma(_2495, _2497, _2095);
        float _2515 = _2509;
        float _2517 = _2511;
        float _2519 = _2513;
        if (_2485)
        {
            float _2521 = _2509 * _2505;
            _2515 = _2521;
        }
        float _2523 = _2515;
        float _2525 = fma(_2459, _2497, _2113);
        float _2527 = _2523;
        if (_2485)
        {
            float _2529 = _2491 * _2523;
            _2527 = _2529;
        }
        float _2531 = _2527;
        if (!_2485)
        {
            _2501 = _2511;
        }
        float _2533 = _2501;
        float _2535 = _2533;
        if (!_2485)
        {
            _2517 = _2525;
        }
        float _2537 = _2517;
        _2437 = _2537;
        if (_2485)
        {
            float _2539 = fma(_2495, _2531, _2095);
            _2519 = _2539;
        }
        float _2541 = _2519;
        _2427 = _2541;
        if (_2485)
        {
            float _2543 = fma(_2455, _2531, _2109);
            _2535 = _2543;
        }
        float _2545 = _2535;
        _2443 = _2545;
        if (_2485)
        {
            float _2547 = fma(_2459, _2531, _2113);
            _2437 = _2547;
        }
    }
    float _2549 = _542;
    float _2551 = _2443;
    float _2553 = _2427;
    float _2555 = _2437;
    float _2557 = _2549;
    if (_2389)
    {
        _2557 = 1.0;
    }
    float _2559 = _2557;
    float _2561 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2563 = _2441 * _2561;
    float _2565 = _2559;
    if (!_2389)
    {
        float _2567 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2569 = _2567 * 0.15915493667125701904296875;
        float _2571 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2573 = _2569 * 6.283185482025146484375;
        float _2575 = cos(_2573);
        float _2577 = _2571 * 0.15915493667125701904296875;
        float _2579 = _2569 * 6.283185482025146484375;
        float _2581 = sin(_2579);
        float _2583 = 1.0 / _2575;
        float _2585 = _2577 * 6.283185482025146484375;
        float _2587 = cos(_2585);
        float _2589 = _2581 * _2583;
        float _2591 = _2577 * 6.283185482025146484375;
        float _2593 = sin(_2591);
        float _2595 = _2587 * _2589;
        float _2597 = 1.0 / _2595;
        float _2599 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2601 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2599;
        float _2603 = 1.0 / _2601;
        float _2605 = _2593 * _2597;
        float _2607 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2609 = fma(_2563, _2605, _2607);
        float _2611 = _2609 * _2603;
        float _2613 = precise::clamp(_2611, 0.0, 1.0);
        _2407 = _2603;
        _2415 = _2613;
    }
    float _2615 = _2407;
    float _2617 = _2415;
    float _2619 = _2615;
    if (!_2389)
    {
        float _2621 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2623 = _2621 * 0.15915493667125701904296875;
        float _2625 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2627 = _2623 * 6.283185482025146484375;
        float _2629 = cos(_2627);
        float _2631 = _2625 * 0.15915493667125701904296875;
        float _2633 = _2623 * 6.283185482025146484375;
        float _2635 = sin(_2633);
        float _2637 = 1.0 / _2629;
        float _2639 = _2631 * 6.283185482025146484375;
        float _2641 = cos(_2639);
        float _2643 = _2635 * _2637;
        float _2645 = _2631 * 6.283185482025146484375;
        float _2647 = sin(_2645);
        float _2649 = _2641 * _2643;
        float _2651 = 1.0 / _2649;
        float _2653 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2655 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2653;
        float _2657 = 1.0 / _2655;
        float _2659 = _2647 * _2651;
        float _2661 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2663 = fma(_2563, _2659, _2661);
        float _2665 = _2663 * _2657;
        float _2667 = precise::clamp(_2665, 0.0, 1.0);
        float _2669 = -_2667;
        float _2671 = _2669 + 1.0;
        _2619 = _2649;
        _2565 = _2671;
    }
    float _2673 = _2619;
    float _2675 = _2565;
    float _2677 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2679 = _2551 + _2677;
    float _2681 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2683 = _2553 + _2681;
    float _2685 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2687 = _2555 + _2685;
    float _2689 = _2679 * _2679;
    float _2691 = fma(_2683, _2683, _2689);
    float _2693 = fma(_2687, _2687, _2691);
    float _2695 = rsqrt(_2693);
    float _2697 = sqrt(_2693);
    float _2699 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2701 = _2683 * _2699;
    float _2703 = _2687 * _2699;
    float _2705 = _2701 * _2701;
    float _2707 = _2703 * _2703;
    float _2709 = _2705 + _2707;
    float _2711 = sqrt(_2709);
    bool _2713 = _2711 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2717 = _2711 + _2715;
    float _2719 = _2695;
    float _2721 = _2717;
    float _2723 = _2673;
    float _2725 = _2679;
    if (_2713)
    {
        float _2727 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2719 = _2727;
    }
    float _2729 = _2719;
    float _2731 = _2729;
    if (_2713)
    {
        float _2733 = _2717 * _2729;
        _2721 = _2733;
    }
    float _2735 = _2721;
    if (_2713)
    {
        float _2737 = rsqrt(_2709);
        _2731 = _2737;
    }
    float _2739 = _2731;
    float _2741 = _2739;
    if (_2713)
    {
        float _2743 = _2735 * 0.15915493667125701904296875;
        _2723 = _2743;
    }
    float _2745 = _2723;
    float _2747 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2749 = _2687;
    float _2751 = _2745;
    if (_2713)
    {
        float _2753 = _2745 * 6.283185482025146484375;
        float _2755 = sin(_2753);
        _2749 = _2755;
    }
    float _2757 = _2749;
    float _2759 = precise::max(0.0, _2747);
    float _2761 = _498;
    float _2763 = _2759;
    if (_2713)
    {
        float _2765 = _2745 * 6.283185482025146484375;
        float _2767 = cos(_2765);
        _2761 = _2767;
    }
    float _2769 = _2761;
    float _2771 = -_2699;
    float _2773 = -_2759;
    float _2775 = fma(_2679, _2771, _2773);
    if (_2713)
    {
        float _2777 = _2775 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2725 = _2777;
    }
    float _2779 = _2725;
    float _2781 = _2757;
    float _2783 = _2779;
    if (_2713)
    {
        float _2785 = fma(_2757, _2779, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2781 = _2785;
    }
    float _2787 = _2781;
    float _2789 = _2787;
    if (!_2713)
    {
        _2783 = _2775;
    }
    float _2791 = _2783;
    float _2793 = _2791;
    if (_2713)
    {
        float _2795 = _2739 * _2787;
        _1871 = _2795;
    }
    float _2797 = _1871;
    if (!_2713)
    {
        _2741 = _2701;
    }
    float _2799 = _2741;
    float _2801 = _2799;
    float _2803 = _2769;
    if (_2713)
    {
        float _2805 = _2769 + (-1.0);
        _2763 = _2805;
    }
    float _2807 = _2763;
    float _2809 = _2807;
    if (_2713)
    {
        float _2811 = _2701 * _2797;
        _2801 = _2811;
    }
    float _2813 = _2801;
    if (!_2713)
    {
        _2789 = _2705;
    }
    float _2815 = _2789;
    float _2817 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2819 = _2815;
    if (_2713)
    {
        float _2821 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2751 = _2821;
    }
    float _2823 = _2751;
    if (!_2713)
    {
        _2809 = _2703;
    }
    float _2825 = _2809;
    float _2827 = _2825;
    if (_2713)
    {
        float _2829 = _2703 * _2797;
        _2827 = _2829;
    }
    float _2831 = _2827;
    if (_2713)
    {
        float _2833 = _2813 * _2813;
        _2819 = _2833;
    }
    float _2835 = _2819;
    if (_2713)
    {
        float _2837 = fma(_2775, _2769, _2823);
        _2793 = _2837;
    }
    float _2839 = _2793;
    if (!_2713)
    {
        _2803 = _2707;
    }
    float _2841 = _2803;
    float _2843 = _2841;
    if (_2713)
    {
        float _2845 = _2831 * _2831;
        _2843 = _2845;
    }
    float _2847 = _2843;
    float _2849 = fma(_2839, _2839, _2835);
    float _2851 = fma(_2553, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2817);
    float _2853 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2855 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2857 = _2849 + _2847;
    float _2859 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2861 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2863 = fma(_2697, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2861);
    float _2865 = precise::clamp(_2863, 0.0, 1.0);
    float _2867 = fma(_2555, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2851);
    float _2869 = rsqrt(_2857);
    float _2871 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2873 = fma(_2553, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2859);
    float _2875 = -_2865;
    float _2877 = _2875 + 1.0;
    float _2879 = _2867 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2881 = fma(_2553, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2871);
    float _2883 = fma(_2553, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2855);
    float _2885 = abs(_2877);
    float _2887 = log2(_2885);
    float _2889 = fma(_2555, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2873);
    float _2891 = _2879 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2893 = fma(_2555, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2881);
    float _2895 = fma(_2555, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2883);
    float _2897 = _2889 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2899 = -_2891;
    float _2901 = fma(_2899, _2853, 1.0);
    float _2903 = _2893 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2905 = _2869 * _2813;
    float _2907 = _2897 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2909 = _2895 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2911 = _2869 * _2839;
    float _2913 = _2905 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2915 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2907);
    float _2917 = _2869 * _2831;
    float _2919 = log2(_2901);
    float _2921 = -_2913;
    float _2923 = fma(_2911, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2921);
    float _2925 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2915);
    float _2927 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2929 = _2897 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2931 = -_2917;
    float _2933 = fma(_2931, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2923);
    float _2935 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2925);
    float _2937 = _2897 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2939 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2929);
    float _2941 = fma(_2933, -0.5, 0.5);
    float _2943 = exp2(_2927);
    float _2945 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2937);
    float _2947 = fma(_2933, 0.5, 0.5);
    float _2949 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2939);
    float _2951 = _2911 + 1.0;
    float _2953 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2945);
    float _2955 = fma(_2947, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2957 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2949);
    float _2959 = 1.0 / _2935;
    float _2961 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2953);
    float _2963 = fma(_2947, _2955, -0.212114393711090087890625);
    float _2965 = _2919 * 0.693147182464599609375;
    float _2967 = fma(_2947, _2963, 1.570728778839111328125);
    float _2969 = _2965 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2971 = sqrt(_2941);
    float _2973 = -_2911;
    float _2975 = fma(_2943, _2951, _2973);
    float _2977 = _2961 * _2959;
    float _2979 = _2957 * _2959;
    float _2981 = fma(_2975, 0.5, 0.5);
    float _2983 = fma(_2977, 0.5, 0.5);
    float _2985 = fma(_2979, -0.5, 0.5);
    float _2987 = _2971 * 0.636619746685028076171875;
    float3 _7901 = float3(_2983, _2985, _2969);
    float _2989 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7901, float3(0.0), isnan(_7901)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7901, float3(0.0), isnan(_7901)), level(0.0)).x;
    float _2991 = -_2967;
    float _2993 = fma(_2987, _2991, 1.0);
    float3 _7917 = float3(_2983, _2985, _2969);
    float4 _2996 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7917, float3(0.0), isnan(_7917)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7917, float3(0.0), isnan(_7917)), level(0.0)).xyzw;
    float _2998 = _2996.x;
    float _3000 = _2996.y;
    float _3002 = _2996.z;
    float _3004 = _2996.w;
    float2 _7934 = float2(_2993, _2981);
    float3 _3008 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7934, float2(0.0), isnan(_7934)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7934, float2(0.0), isnan(_7934)), level(0.0)).xyz;
    float _3010 = _3008.x;
    float _3012 = _3008.y;
    float _3014 = _3008.z;
    float _3016 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3018 = _2897 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3020 = _2935 * 0.5;
    float _3022 = _2961 + _2935;
    out.m_79.x = _2553;
    out.m_79.y = _2551;
    out.m_79.z = _2555;
    float _3024 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3018);
    float _3026 = exp2(_3016);
    float _3028 = _3022 * 0.5;
    bool _3030 = _2697 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3032 = isnan(_2697);
    bool _3034 = _3030 || _3032;
    bool _3036 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3038 = _3034 || _3036;
    float _3040 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3024);
    float _3042 = fma(_2957, -0.5, _3020);
    out.m_81.x = _2095;
    out.m_81.y = _2109;
    out.m_81.z = _2113;
    float _3044 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3040);
    float _3046 = _3044 + _2935;
    out.gl_Position.x = _2961;
    out.gl_Position.y = _2957;
    out.gl_Position.z = _3044;
    out.gl_Position.w = _2935;
    float _3048 = _3046 * 0.5;
    float _3050 = -_3026;
    float _3052 = _3050 + 1.0;
    float _3054 = _2935;
    float _3056 = _3044;
    float _3058 = _2957;
    if (!_3038)
    {
        _2131 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3060 = _2131;
    float _3062 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _3028;
    out.m_83.y = _3042;
    out.m_83.z = _3048;
    out.m_83.w = _2935;
    float _3064 = _3060;
    float _3066 = _3060;
    if (!_3038)
    {
        _2133 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3068 = _2133;
    float _3070 = -_3062;
    float _3072 = _3070 + 1.0;
    float _3074 = _2617 * _2675;
    float _3076 = _3068;
    float _3078 = _3068;
    if (!_3038)
    {
        _3054 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3080 = _3054;
    float _3082 = _3080;
    float _3084 = _3080;
    if (!_3038)
    {
        _3056 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3086 = _3056;
    float _3088 = _3074 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3090 = _3088;
    float _3092 = _3086;
    float _3094 = _3086;
    if (!_3038)
    {
        _3058 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3096 = _3058;
    float _3098 = _528 * _3088;
    float _3100 = _3096;
    float _3102 = _3096;
    if (!_3038)
    {
        _3090 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3104 = _3090;
    float _3106 = _3062 * _2989;
    float _3108 = _3004 * _3106;
    float _3110 = _3014 * _3106;
    float _3112 = fma(_3010, _3108, _2998);
    float _3114 = fma(_3012, _3108, _3000);
    float _3116 = _3004 * _3072;
    float _3118 = fma(_3004, _3110, _3002);
    out.m_85.x = _3112;
    out.m_85.y = _3114;
    out.m_85.z = _3118;
    out.m_85.w = _3116;
    bool _3120 = !_3038;
    float _3122 = _3104;
    float _3124 = _3104;
    if (!_3120)
    {
        bool _3126 = _2697 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3128 = isnan(_2697);
        bool _3130 = _3126 || _3128;
        bool _3132 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3134 = _3130 || _3132;
        if (!_3134)
        {
            float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3138 = _2697 + _3136;
            float _3140 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3142 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3140;
            float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3146 = _3144 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3148 = 1.0 / _3142;
            float _3150 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3152 = _3150 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3154 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3156 = _3154 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3158 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3160 = _3158 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3162 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3164 = _3162 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3166 = _3138 * _3148;
            float _3168 = precise::clamp(_3166, 0.0, 1.0);
            float _3170 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3172 = _3170 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3174 = fma(_3168, _3146, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3176 = fma(_3168, _3172, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3178 = fma(_3168, _3152, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3180 = fma(_3168, _3156, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3182 = fma(_3168, _3160, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3184 = fma(_3168, _3164, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3078 = _3178;
            _3102 = _3182;
            _3066 = _3174;
            _3094 = _3180;
            _3084 = _3176;
            _3124 = _3184;
            _3186 = true;
        }
        else
        {
            bool _3188 = _2697 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3190 = isnan(_2697);
            bool _3192 = _3188 || _3190;
            bool _3194 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3196 = _3192 || _3194;
            if (!_3196)
            {
                _3064 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3198 = _3064;
            _3066 = _3198;
            if (!_3196)
            {
                _3076 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3200 = _3076;
            _3078 = _3200;
            if (!_3196)
            {
                _3082 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3202 = _3082;
            _3084 = _3202;
            if (!_3196)
            {
                _3092 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3204 = _3092;
            _3094 = _3204;
            if (!_3196)
            {
                _3100 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3206 = _3100;
            _3102 = _3206;
            if (!_3196)
            {
                _3122 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3208 = _3122;
            bool _3210 = !_3196;
            _3124 = _3208;
            if (!_3210)
            {
                bool _3212 = _2697 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3214 = isnan(_2697);
                bool _3216 = _3212 || _3214;
                bool _3218 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3220 = _3216 || _3218;
                if (!_3220)
                {
                    float _3222 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3224 = _2697 + _3222;
                    float _3226 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3228 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3226;
                    float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3234 = 1.0 / _3228;
                    float _3236 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3238 = _3236 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3240 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3242 = _3240 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3244 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3246 = _3244 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3248 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3250 = _3248 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3252 = _3224 * _3234;
                    float _3254 = precise::clamp(_3252, 0.0, 1.0);
                    float _3256 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3258 = _3256 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3260 = fma(_3254, _3232, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3262 = fma(_3254, _3258, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3264 = fma(_3254, _3238, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3266 = fma(_3254, _3242, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3268 = fma(_3254, _3246, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3270 = fma(_3254, _3250, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3078 = _3264;
                    _3102 = _3268;
                    _3066 = _3260;
                    _3094 = _3266;
                    _3084 = _3262;
                    _3124 = _3270;
                    _3186 = true;
                }
                else
                {
                    _3078 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3102 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3066 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3094 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3084 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3124 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3186 = false;
    float _3272 = _3078;
    float _3274 = _3102;
    float _3276 = _3066;
    float _3278 = _3094;
    float _3280 = _3084;
    float _3282 = _3124;
    float _3284 = fma(_2055, -0.5, 0.5);
    float _3286 = precise::clamp(_3284, 0.0, 1.0);
    float _3288 = -_3272;
    float _3290 = _3288 + _3274;
    float _3292 = _3098 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3294 = -_3276;
    float _3296 = _3294 + _3278;
    float _3298 = fma(_3286, _3290, _3272);
    out.m_87.x = 0.0;
    float _3300 = -_3280;
    float _3302 = _3300 + _3282;
    float _3304 = fma(_3286, _3296, _3276);
    float _3306 = _3298 * 0.586610972881317138671875;
    out.m_51.x = _3292;
    bool _3308 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3310 = fma(_3286, _3302, _3280);
    float _3312 = fma(_3304, 0.298911988735198974609375, _3306);
    bool _3314 = _2617 > 0.0;
    bool _3316 = isnan(_2617);
    bool _3318 = _3314 || _3316;
    bool _3320 = isnan(0.0);
    bool _3322 = _3318 || _3320;
    float _3324 = fma(_3310, 0.114477999508380889892578125, _3312);
    bool _3326 = _2675 <= 0.0;
    bool _3328 = !_3322;
    bool _3330 = _3326 || _3328;
    float _3332 = -_3324;
    float _3334 = _3304 + _3332;
    float _3336 = -_3324;
    float _3338 = _3298 + _3336;
    float _3340 = -_3324;
    float _3342 = _3310 + _3340;
    float _3344 = fma(_3334, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3324);
    float _3346 = fma(_3338, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3324);
    float _3348 = fma(_3342, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3324);
    bool _3350 = !_3308;
    if (!_3350)
    {
        float _3352 = -_2551;
        float _3354 = _3352 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3356 = -_2553;
        float _3358 = _3356 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3360 = -_2555;
        float _3362 = _3360 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3364 = _3354 * _3354;
        float _3366 = fma(_3358, _3358, _3364);
        float _3368 = fma(_3362, _3362, _3366);
        float _3370 = sqrt(_3368);
        float _3372 = rsqrt(_3368);
        float _3374 = -_3370;
        float _3376 = _3374 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3378 = _3376 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3380 = precise::clamp(_3378, 0.0, 1.0);
        float _3382 = _3358 * _3372;
        float _3384 = _3354 * _3372;
        float _3386 = abs(_3380);
        float _3388 = log2(_3386);
        float _3390 = _3362 * _3372;
        float _3392 = _3382 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3394 = _2055 * _3384;
        float _3396 = -_3384;
        float _3398 = -_3392;
        float _3400 = fma(_3396, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3398);
        float _3402 = fma(_2081, _3382, _3394);
        float _3404 = -_3390;
        float _3406 = fma(_3404, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3400);
        float _3408 = fma(_2087, _3390, _3402);
        float _3410 = precise::clamp(_3408, 0.0, 1.0);
        float _3412 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3414 = _3406 + _3412;
        float _3416 = _3388 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3418 = _3414 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3420 = precise::clamp(_3418, 0.0, 1.0);
        float _3422 = exp2(_3416);
        float _3424 = _3422 * _3420;
        float _3426 = _3410 * _3424;
        float _3428 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3430 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3432 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3428;
        out.m_87.y = _3430;
        out.m_87.z = _3432;
    }
    out.m_69.x = _3344;
    out.m_69.y = _3346;
    out.m_69.z = _3348;
    if (!_3330)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3434 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3434;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3186 = false;
    bool _680 = false;
    bool _560 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = in.m_46.w;
    float _105 = trunc(_101);
    int _108 = int(_105);
    float _110 = -_103;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _112;
    bool _116 = _108 >= 1;
    float _118 = 0.0;
    float _120 = _103;
    float _122 = _112;
    float _124 = _112;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _118;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_116)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3503 = as_type<float>(_132);
        out.gl_Position.z = _3503;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _136 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_103);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = float(_108);
    bool _148 = _112 >= _146;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    if (_152)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _120;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _134 = as_type<int>(_156);
    }
    int _158 = _134;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3558 = as_type<float>(_158);
        out.gl_Position.z = _3558;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_53.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _112 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    int _178 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _180 = _178 != 0;
    float _182 = _164 * _162;
    float _184 = 0.0;
    float _186 = _166;
    if (!_176)
    {
        float _188 = _166 * _166;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _182);
    float _196 = _192;
    if (!_176)
    {
        float _198 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    float _202 = in.m_46.x;
    float _204 = in.m_46.y;
    float _206 = in.m_46.z;
    float _208 = _194 * 6.283185482025146484375;
    float _210 = floor(_194);
    float _212 = _208 * 0.15915493667125701904296875;
    float _214 = _212 * 6.283185482025146484375;
    float _216 = cos(_214);
    float _218 = -_210;
    float _220 = _194 + _218;
    bool _222 = !_176;
    float _224 = _200;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _166 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _166);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _254;
    }
    float _256 = _224;
    bool _258 = !_176;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _166 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _186 = _278;
    }
    float _280 = _186;
    float _282 = in.m_55.w;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _286 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    float _294 = _284 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _296 = _284 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _298 = _284 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _300 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _302 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].x, _294);
    float _304 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].y, _296);
    float _306 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].z, _298);
    float _308 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[10].x, _302);
    bool _310 = _220 < 0.5;
    float _312 = float(_310);
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[10].y, _304);
    float _316 = fma(_216, 0.5, 0.5);
    float _318 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[10].z, _306);
    float _320 = _294;
    float _322 = _296;
    if (!_176)
    {
        float _324 = _112 * _112;
        float _326 = _324 * 0.5;
        _320 = _326;
    }
    float _328 = _320;
    float _330 = -_220;
    float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _334 = fma(_280, _202, _308);
    float _336 = fma(_280, _204, _314);
    float _338 = -_312;
    float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _342 = -_316;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _346 = fma(_280, _206, _318);
    float _348 = _328;
    if (!_176)
    {
        _322 = _112;
    }
    float _350 = _322;
    float _352 = _350;
    if (!_176)
    {
        float _354 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _348 = _354;
    }
    float _356 = _348;
    bool _358 = !_176;
    float _360 = _356;
    if (!_358)
    {
        float _362 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _364 = log2(_362);
        float _366 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _368 = _366 + 1.0;
        float _370 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _372 = _112 * _364;
        float _374 = 1.0 / _368;
        float _376 = _370 * 0.693147182464599609375;
        float _378 = exp2(_372);
        float _380 = 1.0 / _376;
        float _382 = _378 + (-1.0);
        float _384 = -_382;
        float _386 = fma(_384, _380, _112);
        float _388 = _386 * _374;
        float _390 = _388 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _360 = _390;
    }
    float _392 = _360;
    bool _394 = !_176;
    if (!_394)
    {
        float _396 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _398 = log2(_396);
        float _400 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _402 = _400 + 1.0;
        float _404 = 1.0 / _402;
        float _406 = _112 * _398;
        float _408 = exp2(_406);
        float _410 = -_408;
        float _412 = _410 + 1.0;
        float _414 = _412 * _404;
        _352 = _414;
    }
    float _416 = _352;
    float _418 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _420 = fma(_334, _282, _288);
    float _422 = fma(_336, _282, _290);
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _430 = _428 != 0;
    float _432 = fma(_346, _282, _292);
    float _434 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _436 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _438 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    bool _440 = !_426;
    int _442 = _440 ? 0 : 1;
    float _444 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _446 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[8].y, _436);
    float _448 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _450 = abs(_442);
    float _452 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[8].x, _438);
    float _454 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[8].z, _444);
    float _456 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[10].y, _446);
    float _458 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[10].x, _452);
    bool _460 = !_180;
    int _462 = _460 ? 0 : 1;
    float _464 = fma(_416, _204, _456);
    float _466 = float(_450);
    float _468 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[10].z, _454);
    bool _470 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _472 = -_464;
    float _474 = _336 + _472;
    bool _476 = !_430;
    int _478 = _476 ? 0 : 1;
    float _480 = abs(_332);
    float _482 = _466 * _480;
    int _484 = abs(_462);
    float _486 = 1.0 / _146;
    float _488 = fma(_416, _202, _458);
    int _490 = abs(_478);
    float _492 = _474 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _494 = float(_484);
    float _496 = _474 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _498 = fma(_416, _206, _468);
    float _500 = -_488;
    float _502 = _334 + _500;
    float _504 = _474 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _506 = float(_490);
    float _508 = -_498;
    float _510 = _346 + _508;
    float _512 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[4].x, _492);
    float _514 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[5].x, _496);
    float _516 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[6].x, _504);
    float _518 = fma(_494, _344, _482);
    float _520 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[4].z, _512);
    float _522 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[5].z, _514);
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[6].z, _516);
    float _526 = abs(_340);
    float _528 = fma(_506, _526, _518);
    float _530 = _112 * _486;
    bool _532 = !_470;
    float _534 = _522;
    float _536 = _520;
    float _538 = _524;
    float _540 = _520;
    float _542 = _464;
    float _558;
    if (!_532)
    {
        float _544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _546 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _548 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[12].x, _112);
        float _550 = _548 * _544;
        float _552 = floor(_550);
        float _554 = -_552;
        float _556 = _550 + _554;
        _558 = _556;
        _560 = true;
    }
    else
    {
        _558 = _530;
    }
    _560 = false;
    float _562 = _558;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _566 = _562 + _564;
    bool _568 = _562 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _570 = isnan(_562);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _580;
    float _584 = -_578;
    float _586 = _584 + 1.0;
    bool _588 = _562 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _590 = isnan(_562);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = 1.0 / _582;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _606;
    bool _610 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _612 = _566 * _600;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _614;
    float _618 = in.m_55.x;
    float _620 = in.m_55.y;
    float _622 = in.m_55.z;
    float _624 = _598 * _586;
    float _626 = fma(_604, _612, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _628 = fma(_616, _612, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _630 = fma(_608, _612, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _632 = -_598;
    float _634 = _632 + 1.0;
    float _636 = _626 * _624;
    float _638 = _628 * _624;
    float _640 = _630 * _624;
    float _642 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].x, _636);
    float _644 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].y, _638);
    float _646 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].z, _640);
    float _648 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[144].x, _642);
    float _650 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[144].y, _644);
    float _652 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[144].z, _646);
    float _654 = _648 * _618;
    float _656 = _650 * _620;
    float _658 = _652 * _622;
    bool _660 = !_610;
    float _662 = _648;
    float _678;
    if (!_660)
    {
        float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _666 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[11].y, _112);
        float _670 = _668 * _664;
        float _672 = floor(_670);
        float _674 = -_672;
        float _676 = _670 + _674;
        _678 = _676;
        _680 = true;
    }
    else
    {
        _678 = _530;
    }
    _680 = false;
    float _682 = _678;
    float _684 = in.m_57.x;
    float _686 = _160 * 2.0;
    float _688 = in.m_57.y;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _692 = _690 != 0;
    float _694 = _422 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _698 = _696 != 0;
    float _700 = in.m_53.y;
    bool _702 = _160 > 0.5;
    bool _704 = _702 && _692;
    float _706 = floor(_686);
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _710 = _708 != 0;
    float _712 = _422 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _714 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[5].x, _694);
    float _716 = in.m_53.z;
    float _718 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _720 = int(_718);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _728 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[5].z, _714);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _734 = _682 + _732;
    float _736 = _684;
    if (_692)
    {
        _662 = _684;
    }
    float _738 = _662;
    float _740 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _742 = int(_740);
    float _744 = -_688;
    float _746 = _744 + 1.0;
    float _748 = _738;
    float _750 = _688;
    if (_704)
    {
        float _752 = -_738;
        float _754 = _752 + 1.0;
        _748 = _754;
    }
    float _756 = _748;
    float _758 = _728 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _760 = _700 > 0.5;
    float _762 = _654 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _764 = float(_720);
    float _766 = 1.0 / _724;
    if (_698)
    {
        float _768 = _760 ? _746 : _688;
        _750 = _768;
    }
    float _770 = _750;
    float _772 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _776 = _774 != 0;
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _780 = _778 != 0;
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _784 = _782 != 0;
    float _786 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    if (_692)
    {
        _736 = _756;
    }
    float _788 = _736;
    float _790 = -_726;
    float _792 = fma(_772, 2.0, _790);
    bool _794 = _706 >= 0.0;
    bool _796 = isnan(_706);
    bool _798 = _794 || _796;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    float _804 = 1.0 / _764;
    float _806 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _808 = _802 ? 0 : 1;
    float _810 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _812 = _706 > 0.0;
    float _814 = _422 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _816 = ~_808;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = _700 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _826 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[4].x, _814);
    float _828 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[6].x, _712);
    float _830 = fma(_822, -2.0, _730);
    float _832 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].z, _826);
    float _834 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[6].z, _828);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _840 = _820;
    if (!_812)
    {
        int _842 = ~_808;
        int _844 = _842 + 1;
        _840 = _844;
    }
    int _846 = _840;
    float _848 = _700 * 2.0;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _852;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _858 = _856 != 0;
    float _860 = floor(_848);
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _866 = !_710;
    float _868 = _866 ? 7.345489978790283203125 : 1.0;
    float _870 = _854 * _766;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _874 = _872 != 0;
    float _876 = _824 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _878 = float(uint(_742));
    float _880 = 1.0 / _838;
    bool _882 = !_780;
    int _884 = _882 ? 0 : 1;
    float _886 = _850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _888 = !_776;
    int _890 = _888 ? 0 : 1;
    float _892 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _894 = !_784;
    int _896 = _894 ? 0 : 1;
    float _898 = _832 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _900 = float(_742);
    float _902 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _904 = log2(_902);
    bool _906 = _860 >= 0.0;
    bool _908 = isnan(_860);
    bool _910 = _906 || _908;
    bool _912 = isnan(0.0);
    bool _914 = _910 || _912;
    float _916 = _112 * _804;
    out.m_59.x = _876;
    out.m_59.y = _886;
    out.m_59.z = _892;
    out.m_59.w = _864;
    float _918 = _112 * _900;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _922 = _920 != 0;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _926 = _924 != 0;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _930 = _928 != 0;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _936 = 1.0 / _878;
    float _938 = _918 * _486;
    float _940 = _716 * 2.0;
    float _942 = _934 * _880;
    int _944 = ~_742;
    int _946 = _944 + 1;
    float _948 = _834 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _950 = _914 ? 0 : 1;
    float _952 = fma(_942, _734, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _954 = trunc(_916);
    int _956 = int(_954);
    float _958 = _700 + _716;
    float _960 = _160 + _716;
    float _962 = _112 * _904;
    float _964 = _958 + (-1.0);
    float _966 = _160 + _700;
    bool _968 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _970 = isnan(_682);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = floor(_940);
    int _982 = as_type<int>(_936) + (-2);
    float _984 = _960 + (-1.0);
    float _986 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _990 = _682 + _988;
    float _992 = _966 + (-1.0);
    float _994 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _996 = _868 * _160;
    float _998 = float(uint(_956));
    float _1000 = exp2(_962);
    float _1002 = fma(_870, _990, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1004 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1006 = isnan(_682);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1012 = _1008 || _1010;
    float _1014 = float(_1012);
    float _1016 = -_978;
    float _1018 = _1016 + 1.0;
    float _1020 = as_type<float>(_982) * _998;
    float _1022 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1024 = _860 > 0.0;
    float _1026 = _1014 * _1018;
    float _1028 = floor(_996);
    float _1030 = -_1014;
    float _1032 = _1030 + 1.0;
    bool _1034 = !_922;
    int _1036 = _1034 ? 0 : 1;
    float _1038 = _716 + (-0.5);
    bool _1040 = _980 >= 0.0;
    bool _1042 = isnan(_980);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan(0.0);
    bool _1048 = _1044 || _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1052 = 1.0 + _1050;
    bool _1054 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1056 = isnan(_682);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    float _1066 = trunc(_1020);
    float _1068 = precise::max(_1066, 0.0);
    uint _1071 = uint(_1068);
    float _1073 = -_1000;
    float _1075 = _1073 + 1.0;
    int _1077 = _1048 ? 0 : 1;
    bool _1079 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1081 = isnan(0.0);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1087 = _1083 || _1085;
    bool _1089 = !_926;
    int _1091 = _1089 ? 0 : 1;
    float _1093 = 1.0 / _1052;
    float _1095 = _1087 ? _1075 : 0.0;
    float _1097 = -_1028;
    float _1099 = _996 + _1097;
    bool _1101 = _980 > 0.0;
    int _1103 = abs(_1036);
    float _1105 = float(_846);
    int _1107 = _946 * int(_1071);
    int _1109 = _1107 + _956;
    int _1111 = ~_1077;
    int _1113 = _1111 + 1;
    int _1115 = _1113 + 1;
    float _1117 = _1099 * _900;
    int _1119 = ~_742;
    int _1121 = _1119 + 1;
    float _1123 = trunc(_938);
    int _1125 = int(_1123);
    float _1127 = float(uint(_1109));
    float _1129 = _1064 * _1032;
    int _1131 = abs(_1091);
    float _1133 = _1095 * _1093;
    float _1135 = -_1064;
    float _1137 = _1135 + 1.0;
    float _1139 = as_type<float>(_982) * _1127;
    float _1141 = in.m_61.x;
    float _1143 = in.m_61.y;
    float _1145 = in.m_61.z;
    float _1147 = _1002 * _1129;
    float _1149 = float(_956);
    float _1151 = trunc(_1139);
    float _1153 = precise::max(_1151, 0.0);
    uint _1155 = uint(_1153);
    float _1157 = float(_1131);
    float _1159 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1147);
    bool _1161 = _1149 >= _900;
    bool _1163 = isnan(_1149);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan(_900);
    bool _1169 = _1165 || _1167;
    float _1171 = float(_1169);
    float _1173 = _700 + (-0.5);
    int _1175 = _1115;
    if (!_1101)
    {
        int _1177 = ~_1077;
        int _1179 = _1177 + 1;
        _1175 = _1179;
    }
    int _1181 = _1175;
    float _1183 = _1157 * _1105;
    float _1185 = _160 + (-0.5);
    float _1187 = float(_1181);
    float _1189 = _1183 * (-2.0);
    float _1191 = float(_1103);
    float _1193 = trunc(_1171);
    int _1195 = int(_1193);
    int _1197 = ~_950;
    int _1199 = _1197 + 1;
    int _1201 = _1199 + 1;
    float _1203 = fma(_986, _1189, _986);
    int _1205 = _1201;
    if (!_1024)
    {
        int _1207 = ~_950;
        int _1209 = _1207 + 1;
        _1205 = _1209;
    }
    int _1211 = _1205;
    float _1213 = _1191 * _1187;
    int _1215 = int(_1071) + int(_1155);
    float _1217 = _1213 * (-2.0);
    float _1219 = fma(_1189, _1143, _1143);
    int _1221 = _1121 * _1215;
    int _1223 = _1221 + _956;
    bool _1225 = !_858;
    int _1227 = _1225 ? 0 : 1;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1231 = fma(_1022, _1217, _1022);
    float _1233 = trunc(_1117);
    int _1235 = int(_1233);
    bool _1237 = uint(_1223) >= uint(_742);
    float _1239 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1229);
    int _1241 = abs(_1227);
    float _1243 = fma(_1217, _1141, _1141);
    bool _1245 = !_1237;
    int _1247 = _1245 ? 0 : (-1);
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1251 = _898 + _1249;
    float _1253 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1243);
    int _1255 = ~_1215;
    int _1257 = _1255 + _1247;
    int _1259 = _1257 + 1;
    float _1261 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1219);
    float _1263 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1239);
    bool _1265 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1267 = isnan(1.0);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1273 = _1269 || _1271;
    bool _1275 = _742 == 0;
    int _1277 = _1235 * _1241;
    int _1279 = _1277 + _956;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1283 = _742 * _1259;
    int _1285 = _1283 + _956;
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1289 = _758 + _1287;
    bool _1291 = !_1273;
    float _1293 = _1291 ? _112 : _1133;
    float _1295 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1281);
    float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1299 = _948 + _1297;
    float _1301 = _1289 * _1289;
    bool _1303 = !_930;
    int _1305 = _1303 ? 0 : 1;
    float _1307 = fma(_1293, _1203, _1261);
    int _1309 = ~_1195;
    int _1311 = _1309 + 1;
    int _1313 = _1311 + 1;
    float _1315 = fma(_1251, _1251, _1301);
    bool _1317 = !_1275;
    int _1319 = _1317 ? _1285 : (-1);
    float _1321 = fma(_1293, _1231, _1253);
    int _1323 = abs(_1305);
    float _1325 = fma(_1299, _1299, _1315);
    float _1327 = float(_1211);
    int _1329 = _1319 * _1313;
    int _1331 = _742 + (-1);
    float _1333 = sqrt(_1325);
    float _1335 = float(_1323);
    float _1337 = _1321 * 0.15915493667125701904296875;
    int _1339 = abs(_884);
    int _1341 = _1195 * _1331;
    int _1343 = _1341 + _1329;
    int _1345 = abs(_890);
    float _1347 = _1335 * _1327;
    bool _1349 = !_874;
    int _1351 = _1349 ? 0 : 1;
    float _1353 = rsqrt(_1325);
    int _1355 = abs(_896);
    float _1357 = _1307 * 0.15915493667125701904296875;
    float _1359 = _762 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1361 = abs(_1351);
    float _1363 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1295);
    float _1365 = float(uint(_1279));
    float _1367 = _1333 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _1369 = _1343 * _1339;
    float _1371 = as_type<float>(_982) * _1365;
    float _1373 = _1347 * (-2.0);
    int _1375 = _1125 * _1345;
    int _1377 = _1375 + _1369;
    float _1379 = precise::min(_1359, _1367);
    float _1381 = trunc(_1371);
    float _1383 = precise::max(_1381, 0.0);
    uint _1385 = uint(_1383);
    int _1387 = _1279 * _1355;
    int _1389 = _1387 + _1377;
    float _1391 = fma(_1373, _1145, _1145);
    float _1393 = in.m_63.x;
    float _1395 = in.m_63.y;
    float _1397 = in.m_63.z;
    float _1399 = _1353 * _1379;
    int _1401 = _1235 * _1361;
    int _1403 = _1401 + _1389;
    float _1405 = fma(_994, _1373, _994);
    float _1407 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1391);
    float _1409 = _1289 * _1399;
    float _1411 = _1251 * _1399;
    float _1413 = float(uint(_1403));
    float _1415 = fma(_1293, _1405, _1407);
    float _1417 = -_1409;
    float _1419 = _1289 + _1417;
    float _1421 = -_1411;
    float _1423 = _1251 + _1421;
    int _1425 = ~_742;
    int _1427 = _1425 + 1;
    float _1429 = as_type<float>(_982) * _1413;
    float _1431 = _1419 * _1419;
    int _1433 = ~_742;
    int _1435 = _1433 + 1;
    float _1437 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1439 = _1299 * _1399;
    float _1441 = fma(_1423, _1423, _1431);
    float _1443 = trunc(_1429);
    float _1445 = precise::max(_1443, 0.0);
    uint _1447 = uint(_1445);
    float _1449 = in.m_65.x;
    float _1451 = in.m_65.y;
    float _1453 = in.m_65.z;
    int _1455 = _1435 * int(_1385);
    int _1457 = _1455 + _1279;
    float _1459 = _1415 * 0.15915493667125701904296875;
    int _1461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1463 = _1461 != 0;
    bool _1465 = _1395 != 0.0;
    bool _1467 = isnan(_1395);
    bool _1469 = _1465 || _1467;
    bool _1471 = isnan(0.0);
    bool _1473 = _1469 || _1471;
    float _1475 = _1357 * 6.283185482025146484375;
    float _1477 = sin(_1475);
    float _1479 = float(uint(_1457));
    bool _1481 = _1393 == 0.0;
    bool _1483 = !_1473;
    bool _1485 = _1481 && _1483;
    float _1487 = as_type<float>(_982) * _1479;
    bool _1489 = _1397 == 0.0;
    bool _1491 = _1489 && _1485;
    int _1493 = _1427 * int(_1447);
    int _1495 = _1493 + _1403;
    float _1497 = _1357 * 6.283185482025146484375;
    float _1499 = cos(_1497);
    float _1501 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _830);
    float _1503 = -_1439;
    float _1505 = _1299 + _1503;
    float _1507 = float(uint(_1495));
    float _1509 = -_1501;
    float _1511 = fma(_1263, _1437, _1509);
    float _1513 = _1337 * 6.283185482025146484375;
    float _1515 = sin(_1513);
    float _1517 = _1453;
    float _1519 = _1449;
    float _1521 = _1451;
    if (!_1491)
    {
        float _1523 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1453);
        _1517 = _1523;
    }
    float _1525 = _1517;
    if (!_1491)
    {
        float _1527 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1449);
        _1519 = _1527;
    }
    float _1529 = _1519;
    if (!_1491)
    {
        float _1531 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1451);
        _1521 = _1531;
    }
    float _1533 = _1521;
    float _1535 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1395);
    float _1537 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1393);
    float _1539 = _1337 * 6.283185482025146484375;
    float _1541 = cos(_1539);
    float _1543 = _1459 * 6.283185482025146484375;
    float _1545 = sin(_1543);
    float _1547 = -_112;
    float _1549 = fma(_1547, (*spvDescriptorSet0.vp_c9)._m0[76].x, _792);
    float _1551 = fma(_1363, _806, _1549);
    float _1553 = fma(_1505, _1505, _1441);
    float _1555 = as_type<float>(_982) * _1507;
    float _1557 = trunc(_1487);
    float _1559 = precise::max(_1557, 0.0);
    uint _1561 = uint(_1559);
    float _1563 = fma(_952, _1026, _1159);
    float _1565 = _1511 + 0.5;
    float _1567 = _1551 + 0.5;
    float _1569 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1397);
    float _1571 = _1515 * _1477;
    float _1573 = _1541 * _1499;
    float _1575 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1563);
    float _1577 = sqrt(_1553);
    out.m_67.x = _1567;
    out.m_67.y = _1565;
    float _1579 = fma(_1545, _1573, _1571);
    float _1581 = _1515 * _1499;
    float _1583 = _1541 * _1477;
    float _1585 = trunc(_1555);
    float _1587 = precise::max(_1585, 0.0);
    uint _1589 = uint(_1587);
    int _1591 = int(_1385) + int(_1561);
    float _1593 = fma(_1545, _1571, _1573);
    int _1595 = ~_742;
    int _1597 = _1595 + 1;
    float _1599 = -_1581;
    float _1601 = fma(_1545, _1583, _1599);
    int _1603 = ~_742;
    int _1605 = _1603 + 1;
    float _1607 = _1459 * 6.283185482025146484375;
    float _1609 = cos(_1607);
    float _1611 = _1353 * _1577;
    float _1613 = -_1583;
    float _1615 = fma(_1545, _1581, _1613);
    float _1617 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1619 = _786 * _1611;
    float _1621 = _810 * _1611;
    int _1623 = _1597 * _1591;
    int _1625 = _1623 + _1279;
    int _1627 = int(_1447) + int(_1589);
    float _1629 = _762 * _1611;
    float _1631 = _1619 * _1569;
    bool _1633 = uint(_1625) >= uint(_742);
    int _1635 = _1605 * _1627;
    int _1637 = _1635 + _1403;
    float _1639 = _1621 * _1535;
    float _1641 = _1541 * _1609;
    float _1643 = _1499 * _1609;
    bool _1645 = uint(_1637) >= uint(_742);
    float _1647 = _1515 * _1609;
    float _1649 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1651 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1653 = !_1645;
    int _1655 = _1653 ? 0 : (-1);
    float _1657 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1659 = -_1545;
    float _1661 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1649);
    float _1663 = _1579 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1665 = ~_1627;
    int _1667 = _1665 + _1655;
    int _1669 = _1667 + 1;
    float _1671 = -_1545;
    float _1673 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1651);
    float _1675 = -_1545;
    float _1677 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1657);
    float _1679 = -_1639;
    float _1681 = _1545 * _1679;
    float _1683 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1663);
    int _1685 = _742 * _1669;
    int _1687 = _1685 + _1403;
    float _1689 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1661);
    float _1691 = _1641 * _1639;
    float _1693 = _1629 * _1537;
    float _1695 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1673);
    bool _1697 = !_1275;
    int _1699 = _1697 ? _1687 : (-1);
    float _1701 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1677);
    float _1703 = _1647 * _1639;
    float _1705 = _1579 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1707 = _1699 >> 31;
    float _1709 = _1579 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1711 = fma(_1579, _1693, _1691);
    float _1713 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1705);
    int _1715 = _1707 & 3;
    float _1717 = _1477 * _1609;
    float _1719 = fma(_1643, _1693, _1681);
    float _1721 = fma(_1615, _1693, _1703);
    int _1723 = _1699 + _1715;
    float _1725 = fma(_1601, _1631, _1711);
    float _1727 = fma(_1717, _1631, _1719);
    float _1729 = fma(_1593, _1631, _1721);
    int _1731 = _1723 >> 2;
    float _1733 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1735 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1737 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1739 = _1731 << 4;
    int _1741 = _1739 + 368;
    float _1743 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1733);
    float _1745 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1617);
    float _1747 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1735);
    float _1749 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1751 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1737);
    float _1753 = _1689 * _1533;
    uint _1755 = uint(int(uint(_1741) >> uint(2)));
    uint _1757 = uint(int(uint(int(_1755)) >> uint(2)));
    int _1759 = int(_1755) & 3;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[int(_1757)][_1759];
    int _1763 = int(_1755) + 1;
    uint _1765 = uint(int(uint(_1763) >> uint(2)));
    int _1767 = _1763 & 3;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[int(_1765)][_1767];
    float _1771 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1749);
    float _1773 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1751);
    float _1775 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1709);
    float _1777 = _1695 * _1533;
    float _1779 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1771);
    float _1781 = _1701 * _1533;
    float _1783 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1713);
    float _1785 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1683);
    float _1787 = _1779 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1789 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1775);
    float _1791 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1793 = _1699 & 3;
    bool _1795 = _1793 != 0;
    int _1797 = _1741 + 8;
    uint _1799 = uint(int(uint(_1797) >> uint(2)));
    uint _1801 = uint(int(uint(int(_1799)) >> uint(2)));
    int _1803 = int(_1799) & 3;
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[int(_1801)][_1803];
    int _1807 = int(_1799) + 1;
    uint _1809 = uint(int(uint(_1807) >> uint(2)));
    int _1811 = _1807 & 3;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[int(_1809)][_1811];
    float _1815 = _948 + _1787;
    float _1817 = _898 + _1791;
    int _1819 = _1699 & 3;
    bool _1821 = _1819 != 0;
    float _1823 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1743);
    float _1825 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1827 = _1815 + _1825;
    bool _1829 = uint(_1793) > 1u;
    float _1831 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1745);
    float _1833 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1835 = _1817 + _1833;
    float _1837 = _1827 * _1827;
    int _1839 = _1821 ? 0 : 1;
    float _1841 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1747);
    bool _1843 = uint(_1793) >= 2u;
    float _1845 = fma(_1783, _1529, _1777);
    float _1847 = fma(_1835, _1835, _1837);
    float _1849 = fma(_1785, _1529, _1753);
    int _1851 = _1843 ? 0 : 1;
    float _1853 = fma(_1789, _1529, _1781);
    bool _1855 = _1793 != 3;
    float _1857 = sqrt(_1847);
    int _1859 = ~_1839;
    int _1861 = _1859 + 1;
    int _1863 = _1861 + 1;
    int _1865 = _1863;
    float _1867 = _1817;
    float _1869 = _1815;
    float _1871 = _1841;
    if (!_1829)
    {
        int _1873 = ~_1839;
        int _1875 = _1873 + 1;
        _1865 = _1875;
    }
    int _1877 = _1865;
    float _1879 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1881 = ~_1851;
    int _1883 = _1881 + 1;
    int _1885 = _1883 + 1;
    int _1887 = abs(_1877);
    float _1889 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1879);
    bool _1891 = !_1795;
    int _1893 = _1891 ? 0 : 1;
    bool _1895 = _1793 != 3;
    int _1897 = _1885;
    if (_1855)
    {
        int _1899 = ~_1851;
        int _1901 = _1899 + 1;
        _1897 = _1901;
    }
    int _1903 = _1897;
    float _1905 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1889);
    int _1907 = ~_1887;
    int _1909 = _1907 + 1;
    int _1911 = _1909 + 1;
    int _1913 = abs(_1893);
    float _1915 = _1905 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1917 = _1857 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1919 = _1911 * as_type<int>(_1769);
    bool _1921 = !_1895;
    int _1923 = _1921 ? 0 : (-1);
    int _1925 = ~_1913;
    int _1927 = _1925 + 1;
    int _1929 = _1927 + 1;
    int _1931 = abs(_1903);
    float _1933 = _758 + _1915;
    bool _1935 = !_1463;
    int _1937 = _1935 ? 0 : 1;
    int _1939 = _1929 * as_type<int>(_1761);
    int _1941 = _1939 + _1919;
    int _1943 = abs(_1923);
    int _1945 = ~_1931;
    int _1947 = _1945 + 1;
    int _1949 = _1947 + 1;
    int _1951 = abs(_1937);
    bool _1953 = !_1633;
    int _1955 = _1953 ? 0 : (-1);
    int _1957 = _1949 * as_type<int>(_1805);
    int _1959 = _1957 + _1941;
    int _1961 = ~_1591;
    int _1963 = _1961 + _1955;
    int _1965 = _1963 + 1;
    int _1967 = ~_1943;
    int _1969 = _1967 + 1;
    int _1971 = _1969 + 1;
    float _1973 = as_type<float>(_1949);
    if (!_1917)
    {
        _1973 = _1933;
    }
    float _1975 = _1973;
    bool _1977 = !_1917;
    float _1979 = _1975;
    if (!_1977)
    {
        float _1981 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1985 = _1857 + _1983;
        float _1987 = rsqrt(_1847);
        float _1989 = _1985 * _1981;
        float _1991 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1993 = _1989 * 0.15915493667125701904296875;
        float _1995 = _1993 * 6.283185482025146484375;
        float _1997 = cos(_1995);
        float _1999 = _1993 * 6.283185482025146484375;
        float _2001 = sin(_1999);
        float _2003 = _1997 + (-1.0);
        float _2005 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2007 = fma(_2001, _1991, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2009 = fma(_1933, _1997, _2005);
        float _2011 = _1987 * _2007;
        float _2013 = fma(_1835, _2011, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2015 = fma(_1827, _2011, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1979 = _2009;
        _1867 = _2013;
        _1869 = _2015;
    }
    float _2017 = _1979;
    float _2019 = _1867;
    float _2021 = _1869;
    float _2023 = -_758;
    float _2025 = _2023 + _2017;
    int _2027 = _1971 * as_type<int>(_1813);
    int _2029 = _2027 + _1959;
    int _2031 = ~_1951;
    int _2033 = _2031 + 1;
    int _2035 = _2033 + 1;
    int _2037 = _742 * _1965;
    int _2039 = _2037 + _1279;
    float _2041 = -_898;
    float _2043 = _2041 + _2019;
    float _2045 = _2025 * _2025;
    float _2047 = -_948;
    float _2049 = _2047 + _2021;
    int _2051 = _2029 * _2035;
    float _2053 = fma(_2043, _2043, _2045);
    float _2055 = fma(_1831, _1525, _1849);
    float _2057 = fma(_2049, _2049, _2053);
    bool _2059 = !_1275;
    int _2061 = _2059 ? _2039 : (-1);
    float _2063 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2065 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_69.w = _1379;
    float _2069 = sqrt(_2057);
    int _2071 = _2061 * _1951;
    int _2073 = _2071 + _2051;
    float _2075 = _2065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2077 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2079 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2081 = fma(_1823, _1525, _1845);
    float _2083 = _1575 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2085 = float(_2073);
    float _2087 = fma(_1841, _1525, _1853);
    out.m_71.x = _1629;
    float _2089 = -_1411;
    float _2091 = _2089 + _2019;
    float _2093 = -_1411;
    float _2095 = _898 + _2093;
    out.m_73.x = _2075;
    out.m_73.y = _2077;
    out.m_73.z = _2079;
    out.m_73.w = _2083;
    float _2097 = -_1409;
    float _2099 = _2097 + _2017;
    float _2101 = -_1439;
    float _2103 = _2101 + _2021;
    bool _2105 = _2069 > 0.0;
    out.m_75.x = _2085;
    float _2107 = -_1409;
    float _2109 = _758 + _2107;
    float _2111 = -_1439;
    float _2113 = _948 + _2111;
    out.m_77.x = _2081;
    out.m_77.y = _2055;
    out.m_77.z = _2087;
    bool _2115 = !_2105;
    float _2117 = _2077;
    float _2119 = _2079;
    float _2121 = _2075;
    float _2123 = _2091;
    float _2125 = _2103;
    float _2127 = _2099;
    float _2129 = _2083;
    float _2131 = _2109;
    float _2133 = _2095;
    if (!_2115)
    {
        bool _2135 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2137 = _2083;
        if (_2135)
        {
            float _2139 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2137 = _2139;
        }
        float _2141 = _2137;
        if (_2135)
        {
            float _2143 = _520 * _2141;
            _2117 = _2143;
        }
        float _2145 = _2117;
        float _2147 = _2145;
        if (_2135)
        {
            float _2149 = _522 * _2141;
            _2119 = _2149;
        }
        float _2151 = _2119;
        float _2153 = _2151;
        if (_2135)
        {
            float _2155 = _524 * _2141;
            _2121 = _2155;
        }
        float _2157 = _2121;
        float _2159 = _2157;
        if (!_2135)
        {
            float _2161 = _112 + 1.0;
            if (!_176)
            {
                float _2163 = _2161 * _2161;
                float _2165 = _2163 * 0.5;
                _122 = _2165;
            }
            float _2167 = _122;
            float _2169 = _2167;
            if (!_176)
            {
                float _2171 = _2167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2169 = _2171;
            }
            float _2173 = _2169;
            bool _2175 = !_176;
            float _2177 = _2173;
            if (!_2175)
            {
                float _2179 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2181 = log2(_2179);
                float _2183 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2185 = 1.0 + _2183;
                float _2187 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2189 = _2181 * _2161;
                float _2191 = 1.0 / _2185;
                float _2193 = _2187 * 0.693147182464599609375;
                float _2195 = exp2(_2189);
                float _2197 = 1.0 / _2193;
                float _2199 = _2195 + (-1.0);
                float _2201 = -_2199;
                float _2203 = fma(_2201, _2197, _2161);
                float _2205 = _2203 * _2191;
                float _2207 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2177 = _2207;
            }
            float _2209 = _2177;
            float _2211 = _2209 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2213 = _2209 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2215 = _2209 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2217 = _2209;
            if (!_176)
            {
                _2217 = _2161;
            }
            float _2219 = _2217;
            float _2221 = _2211 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2223 = _2211 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2225 = _2211 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2227 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2221);
            float _2229 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2223);
            float _2231 = fma(_2215, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2227);
            bool _2233 = !_176;
            float _2235 = _2219;
            if (!_2233)
            {
                float _2237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2239 = log2(_2237);
                float _2241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2243 = 1.0 + _2241;
                float _2245 = 1.0 / _2243;
                float _2247 = _2239 * _2161;
                float _2249 = exp2(_2247);
                float _2251 = -_2249;
                float _2253 = _2251 + 1.0;
                float _2255 = _2253 * _2245;
                _2235 = _2255;
            }
            float _2257 = _2235;
            float _2259 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2225);
            float _2261 = fma(_2215, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2229);
            float _2263 = fma(_2257, _204, _2231);
            float _2265 = fma(_2215, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2259);
            float _2267 = fma(_2257, _202, _2261);
            float _2269 = -_464;
            float _2271 = _2269 + _2263;
            float _2273 = fma(_2257, _206, _2265);
            float _2275 = -_488;
            float _2277 = _2275 + _2267;
            float _2279 = _2271 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2281 = _2271 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2283 = _2271 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2285 = -_498;
            float _2287 = _2285 + _2273;
            float _2289 = fma(_2277, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2279);
            float _2291 = fma(_2277, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2281);
            float _2293 = fma(_2277, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2283);
            float _2295 = fma(_2287, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2289);
            float _2297 = fma(_2287, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2291);
            float _2299 = fma(_2287, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2293);
            _534 = _2297;
            _536 = _2295;
            _538 = _2299;
            _2147 = _2295;
            _2153 = _2297;
            _2159 = _2299;
        }
        float _2301 = _534;
        float _2303 = _536;
        float _2305 = _538;
        float _2307 = _2147;
        float _2309 = _2153;
        float _2311 = _2159;
        float _2313 = _2301 * _2301;
        float _2315 = rsqrt(_2057);
        float _2317 = fma(_2303, _2303, _2313);
        float _2319 = fma(_2305, _2305, _2317);
        float _2321 = sqrt(_2319);
        float _2323 = _2043 * _2315;
        float _2325 = _2025 * _2315;
        float _2327 = _2049 * _2315;
        bool _2329 = _2321 > 0.0;
        bool _2331 = !_2329;
        _2129 = _2319;
        _540 = _2303;
        _124 = _2325;
        if (!_2331)
        {
            float _2333 = rsqrt(_2319);
            float _2335 = _2333 * _2301;
            float _2337 = _2333 * _2303;
            float _2339 = _2333 * _2305;
            float _2341 = _2325 * _2335;
            float _2343 = fma(_2323, _2337, _2341);
            float _2345 = fma(_2327, _2339, _2343);
            float _2347 = _2345 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2349 = fma(_2307, _2347, _2091);
            float _2351 = fma(_2309, _2347, _2099);
            float _2353 = fma(_2311, _2347, _2103);
            _2123 = _2349;
            _2125 = _2353;
            _2127 = _2351;
            _124 = _2341;
        }
    }
    float _2355 = _2123;
    float _2357 = _2125;
    float _2359 = _2127;
    float _2361 = _2129;
    float _2363 = _540;
    float _2365 = _124;
    float _2367 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2369 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2371 = isnan(0.5);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2377 = _2373 || _2375;
    float _2379 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2367);
    bool _2381 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2383 = isnan(0.5);
    bool _2385 = _2381 || _2383;
    bool _2387 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2389 = _2385 || _2387;
    float _2391 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2379);
    float _2393 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2395 = _2391 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2397 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2393);
    float _2399 = 1.0 / _2395;
    float _2401 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2397);
    float _2403 = _2365;
    float _2405 = _2395;
    float _2407 = _2363;
    if (_2389)
    {
        _2403 = 1.0;
    }
    float _2409 = _2403;
    float _2411 = _2401 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2413 = _2411 + _2395;
    float _2415 = _2409;
    if (_2377)
    {
        _2405 = _2355;
    }
    float _2417 = _2405;
    float _2419 = _2413 * _2399;
    float _2421 = _2419 * 0.5;
    float _2423 = _2399;
    float _2425 = _2421;
    float _2427 = _2417;
    if (_2377)
    {
        _2423 = _2357;
    }
    float _2429 = _2423;
    float _2431 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2433 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2431);
    float _2435 = _2433;
    float _2437 = _2429;
    if (_2377)
    {
        _2425 = _2359;
    }
    float _2439 = _2425;
    float _2441 = 1.0 / _2433;
    float _2443 = _2439;
    if (!_2377)
    {
        float _2445 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2447 = _2109 + _2445;
        float _2449 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2451 = _2095 + _2449;
        float _2453 = -_2109;
        float _2455 = _2453 + _2359;
        float _2457 = -_2113;
        float _2459 = _2457 + _2357;
        float _2461 = _2447 * _2447;
        float _2463 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2465 = _2113 + _2463;
        float _2467 = fma(_2451, _2451, _2461);
        float _2469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2471 = fma(_2465, _2465, _2467);
        float _2473 = sqrt(_2471);
        float _2475 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _2477 = _2473 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2479 = isnan(_2473);
        bool _2481 = _2477 || _2479;
        bool _2483 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2485 = _2481 || _2483;
        float _2487 = precise::min(_2473, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2489 = _2487 * _2469;
        float _2491 = _2475 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2493 = -_2095;
        float _2495 = _2493 + _2355;
        float _2497 = _2491 * _2489;
        float _2499 = _2361;
        float _2501 = _2491;
        _542 = _2455;
        if (_2485)
        {
            float _2503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2499 = _2503;
        }
        float _2505 = _2499;
        if (_2485)
        {
            float _2507 = precise::max(_2473, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2435 = _2507;
        }
        float _2509 = _2435;
        float _2511 = fma(_2455, _2497, _2109);
        float _2513 = fma(_2495, _2497, _2095);
        float _2515 = _2509;
        float _2517 = _2511;
        float _2519 = _2513;
        if (_2485)
        {
            float _2521 = _2509 * _2505;
            _2515 = _2521;
        }
        float _2523 = _2515;
        float _2525 = fma(_2459, _2497, _2113);
        float _2527 = _2523;
        if (_2485)
        {
            float _2529 = _2491 * _2523;
            _2527 = _2529;
        }
        float _2531 = _2527;
        if (!_2485)
        {
            _2501 = _2511;
        }
        float _2533 = _2501;
        float _2535 = _2533;
        if (!_2485)
        {
            _2517 = _2525;
        }
        float _2537 = _2517;
        _2437 = _2537;
        if (_2485)
        {
            float _2539 = fma(_2495, _2531, _2095);
            _2519 = _2539;
        }
        float _2541 = _2519;
        _2427 = _2541;
        if (_2485)
        {
            float _2543 = fma(_2455, _2531, _2109);
            _2535 = _2543;
        }
        float _2545 = _2535;
        _2443 = _2545;
        if (_2485)
        {
            float _2547 = fma(_2459, _2531, _2113);
            _2437 = _2547;
        }
    }
    float _2549 = _542;
    float _2551 = _2443;
    float _2553 = _2427;
    float _2555 = _2437;
    float _2557 = _2549;
    if (_2389)
    {
        _2557 = 1.0;
    }
    float _2559 = _2557;
    float _2561 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2563 = _2441 * _2561;
    float _2565 = _2559;
    if (!_2389)
    {
        float _2567 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2569 = _2567 * 0.15915493667125701904296875;
        float _2571 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2573 = _2569 * 6.283185482025146484375;
        float _2575 = cos(_2573);
        float _2577 = _2571 * 0.15915493667125701904296875;
        float _2579 = _2569 * 6.283185482025146484375;
        float _2581 = sin(_2579);
        float _2583 = 1.0 / _2575;
        float _2585 = _2577 * 6.283185482025146484375;
        float _2587 = cos(_2585);
        float _2589 = _2581 * _2583;
        float _2591 = _2577 * 6.283185482025146484375;
        float _2593 = sin(_2591);
        float _2595 = _2587 * _2589;
        float _2597 = 1.0 / _2595;
        float _2599 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2601 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2599;
        float _2603 = 1.0 / _2601;
        float _2605 = _2593 * _2597;
        float _2607 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2609 = fma(_2563, _2605, _2607);
        float _2611 = _2609 * _2603;
        float _2613 = precise::clamp(_2611, 0.0, 1.0);
        _2407 = _2603;
        _2415 = _2613;
    }
    float _2615 = _2407;
    float _2617 = _2415;
    float _2619 = _2615;
    if (!_2389)
    {
        float _2621 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2623 = _2621 * 0.15915493667125701904296875;
        float _2625 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2627 = _2623 * 6.283185482025146484375;
        float _2629 = cos(_2627);
        float _2631 = _2625 * 0.15915493667125701904296875;
        float _2633 = _2623 * 6.283185482025146484375;
        float _2635 = sin(_2633);
        float _2637 = 1.0 / _2629;
        float _2639 = _2631 * 6.283185482025146484375;
        float _2641 = cos(_2639);
        float _2643 = _2635 * _2637;
        float _2645 = _2631 * 6.283185482025146484375;
        float _2647 = sin(_2645);
        float _2649 = _2641 * _2643;
        float _2651 = 1.0 / _2649;
        float _2653 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2655 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2653;
        float _2657 = 1.0 / _2655;
        float _2659 = _2647 * _2651;
        float _2661 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2663 = fma(_2563, _2659, _2661);
        float _2665 = _2663 * _2657;
        float _2667 = precise::clamp(_2665, 0.0, 1.0);
        float _2669 = -_2667;
        float _2671 = _2669 + 1.0;
        _2619 = _2649;
        _2565 = _2671;
    }
    float _2673 = _2619;
    float _2675 = _2565;
    float _2677 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2679 = _2551 + _2677;
    float _2681 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2683 = _2553 + _2681;
    float _2685 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2687 = _2555 + _2685;
    float _2689 = _2679 * _2679;
    float _2691 = fma(_2683, _2683, _2689);
    float _2693 = fma(_2687, _2687, _2691);
    float _2695 = rsqrt(_2693);
    float _2697 = sqrt(_2693);
    float _2699 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2701 = _2683 * _2699;
    float _2703 = _2687 * _2699;
    float _2705 = _2701 * _2701;
    float _2707 = _2703 * _2703;
    float _2709 = _2705 + _2707;
    float _2711 = sqrt(_2709);
    bool _2713 = _2711 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2717 = _2711 + _2715;
    float _2719 = _2695;
    float _2721 = _2717;
    float _2723 = _2673;
    float _2725 = _2679;
    if (_2713)
    {
        float _2727 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2719 = _2727;
    }
    float _2729 = _2719;
    float _2731 = _2729;
    if (_2713)
    {
        float _2733 = _2717 * _2729;
        _2721 = _2733;
    }
    float _2735 = _2721;
    if (_2713)
    {
        float _2737 = rsqrt(_2709);
        _2731 = _2737;
    }
    float _2739 = _2731;
    float _2741 = _2739;
    if (_2713)
    {
        float _2743 = _2735 * 0.15915493667125701904296875;
        _2723 = _2743;
    }
    float _2745 = _2723;
    float _2747 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2749 = _2687;
    float _2751 = _2745;
    if (_2713)
    {
        float _2753 = _2745 * 6.283185482025146484375;
        float _2755 = sin(_2753);
        _2749 = _2755;
    }
    float _2757 = _2749;
    float _2759 = precise::max(0.0, _2747);
    float _2761 = _498;
    float _2763 = _2759;
    if (_2713)
    {
        float _2765 = _2745 * 6.283185482025146484375;
        float _2767 = cos(_2765);
        _2761 = _2767;
    }
    float _2769 = _2761;
    float _2771 = -_2699;
    float _2773 = -_2759;
    float _2775 = fma(_2679, _2771, _2773);
    if (_2713)
    {
        float _2777 = _2775 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2725 = _2777;
    }
    float _2779 = _2725;
    float _2781 = _2757;
    float _2783 = _2779;
    if (_2713)
    {
        float _2785 = fma(_2757, _2779, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2781 = _2785;
    }
    float _2787 = _2781;
    float _2789 = _2787;
    if (!_2713)
    {
        _2783 = _2775;
    }
    float _2791 = _2783;
    float _2793 = _2791;
    if (_2713)
    {
        float _2795 = _2739 * _2787;
        _1871 = _2795;
    }
    float _2797 = _1871;
    if (!_2713)
    {
        _2741 = _2701;
    }
    float _2799 = _2741;
    float _2801 = _2799;
    float _2803 = _2769;
    if (_2713)
    {
        float _2805 = _2769 + (-1.0);
        _2763 = _2805;
    }
    float _2807 = _2763;
    float _2809 = _2807;
    if (_2713)
    {
        float _2811 = _2701 * _2797;
        _2801 = _2811;
    }
    float _2813 = _2801;
    if (!_2713)
    {
        _2789 = _2705;
    }
    float _2815 = _2789;
    float _2817 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2819 = _2815;
    if (_2713)
    {
        float _2821 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2751 = _2821;
    }
    float _2823 = _2751;
    if (!_2713)
    {
        _2809 = _2703;
    }
    float _2825 = _2809;
    float _2827 = _2825;
    if (_2713)
    {
        float _2829 = _2703 * _2797;
        _2827 = _2829;
    }
    float _2831 = _2827;
    if (_2713)
    {
        float _2833 = _2813 * _2813;
        _2819 = _2833;
    }
    float _2835 = _2819;
    if (_2713)
    {
        float _2837 = fma(_2775, _2769, _2823);
        _2793 = _2837;
    }
    float _2839 = _2793;
    if (!_2713)
    {
        _2803 = _2707;
    }
    float _2841 = _2803;
    float _2843 = _2841;
    if (_2713)
    {
        float _2845 = _2831 * _2831;
        _2843 = _2845;
    }
    float _2847 = _2843;
    float _2849 = fma(_2839, _2839, _2835);
    float _2851 = fma(_2553, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2817);
    float _2853 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2855 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2857 = _2849 + _2847;
    float _2859 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2861 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2863 = fma(_2697, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2861);
    float _2865 = precise::clamp(_2863, 0.0, 1.0);
    float _2867 = fma(_2555, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2851);
    float _2869 = rsqrt(_2857);
    float _2871 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2873 = fma(_2553, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2859);
    float _2875 = -_2865;
    float _2877 = _2875 + 1.0;
    float _2879 = _2867 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2881 = fma(_2553, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2871);
    float _2883 = fma(_2553, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2855);
    float _2885 = abs(_2877);
    float _2887 = log2(_2885);
    float _2889 = fma(_2555, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2873);
    float _2891 = _2879 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2893 = fma(_2555, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2881);
    float _2895 = fma(_2555, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2883);
    float _2897 = _2889 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2899 = -_2891;
    float _2901 = fma(_2899, _2853, 1.0);
    float _2903 = _2893 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2905 = _2869 * _2813;
    float _2907 = _2897 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2909 = _2895 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2911 = _2869 * _2839;
    float _2913 = _2905 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2915 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2907);
    float _2917 = _2869 * _2831;
    float _2919 = log2(_2901);
    float _2921 = -_2913;
    float _2923 = fma(_2911, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2921);
    float _2925 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2915);
    float _2927 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2929 = _2897 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2931 = -_2917;
    float _2933 = fma(_2931, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2923);
    float _2935 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2925);
    float _2937 = _2897 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2939 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2929);
    float _2941 = fma(_2933, -0.5, 0.5);
    float _2943 = exp2(_2927);
    float _2945 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2937);
    float _2947 = fma(_2933, 0.5, 0.5);
    float _2949 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2939);
    float _2951 = _2911 + 1.0;
    float _2953 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2945);
    float _2955 = fma(_2947, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2957 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2949);
    float _2959 = 1.0 / _2935;
    float _2961 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2953);
    float _2963 = fma(_2947, _2955, -0.212114393711090087890625);
    float _2965 = _2919 * 0.693147182464599609375;
    float _2967 = fma(_2947, _2963, 1.570728778839111328125);
    float _2969 = _2965 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2971 = sqrt(_2941);
    float _2973 = -_2911;
    float _2975 = fma(_2943, _2951, _2973);
    float _2977 = _2961 * _2959;
    float _2979 = _2957 * _2959;
    float _2981 = fma(_2975, 0.5, 0.5);
    float _2983 = fma(_2977, 0.5, 0.5);
    float _2985 = fma(_2979, -0.5, 0.5);
    float _2987 = _2971 * 0.636619746685028076171875;
    float3 _7901 = float3(_2983, _2985, _2969);
    float _2989 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7901, float3(0.0), isnan(_7901)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7901, float3(0.0), isnan(_7901)), level(0.0)).x;
    float _2991 = -_2967;
    float _2993 = fma(_2987, _2991, 1.0);
    float3 _7917 = float3(_2983, _2985, _2969);
    float4 _2996 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7917, float3(0.0), isnan(_7917)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7917, float3(0.0), isnan(_7917)), level(0.0)).xyzw;
    float _2998 = _2996.x;
    float _3000 = _2996.y;
    float _3002 = _2996.z;
    float _3004 = _2996.w;
    float2 _7934 = float2(_2993, _2981);
    float3 _3008 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7934, float2(0.0), isnan(_7934)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7934, float2(0.0), isnan(_7934)), level(0.0)).xyz;
    float _3010 = _3008.x;
    float _3012 = _3008.y;
    float _3014 = _3008.z;
    float _3016 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3018 = _2897 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3020 = _2935 * 0.5;
    float _3022 = _2961 + _2935;
    out.m_79.x = _2553;
    out.m_79.y = _2551;
    out.m_79.z = _2555;
    float _3024 = fma(_2903, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3018);
    float _3026 = exp2(_3016);
    float _3028 = _3022 * 0.5;
    bool _3030 = _2697 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3032 = isnan(_2697);
    bool _3034 = _3030 || _3032;
    bool _3036 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3038 = _3034 || _3036;
    float _3040 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3024);
    float _3042 = fma(_2957, -0.5, _3020);
    out.m_81.x = _2095;
    out.m_81.y = _2109;
    out.m_81.z = _2113;
    float _3044 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3040);
    float _3046 = _3044 + _2935;
    out.gl_Position.x = _2961;
    out.gl_Position.y = _2957;
    out.gl_Position.z = _3044;
    out.gl_Position.w = _2935;
    float _3048 = _3046 * 0.5;
    float _3050 = -_3026;
    float _3052 = _3050 + 1.0;
    float _3054 = _2935;
    float _3056 = _3044;
    float _3058 = _2957;
    if (!_3038)
    {
        _2131 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3060 = _2131;
    float _3062 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _3028;
    out.m_83.y = _3042;
    out.m_83.z = _3048;
    out.m_83.w = _2935;
    float _3064 = _3060;
    float _3066 = _3060;
    if (!_3038)
    {
        _2133 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3068 = _2133;
    float _3070 = -_3062;
    float _3072 = _3070 + 1.0;
    float _3074 = _2617 * _2675;
    float _3076 = _3068;
    float _3078 = _3068;
    if (!_3038)
    {
        _3054 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3080 = _3054;
    float _3082 = _3080;
    float _3084 = _3080;
    if (!_3038)
    {
        _3056 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3086 = _3056;
    float _3088 = _3074 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3090 = _3088;
    float _3092 = _3086;
    float _3094 = _3086;
    if (!_3038)
    {
        _3058 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3096 = _3058;
    float _3098 = _528 * _3088;
    float _3100 = _3096;
    float _3102 = _3096;
    if (!_3038)
    {
        _3090 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3104 = _3090;
    float _3106 = _3062 * _2989;
    float _3108 = _3004 * _3106;
    float _3110 = _3014 * _3106;
    float _3112 = fma(_3010, _3108, _2998);
    float _3114 = fma(_3012, _3108, _3000);
    float _3116 = _3004 * _3072;
    float _3118 = fma(_3004, _3110, _3002);
    out.m_85.x = _3112;
    out.m_85.y = _3114;
    out.m_85.z = _3118;
    out.m_85.w = _3116;
    bool _3120 = !_3038;
    float _3122 = _3104;
    float _3124 = _3104;
    if (!_3120)
    {
        bool _3126 = _2697 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3128 = isnan(_2697);
        bool _3130 = _3126 || _3128;
        bool _3132 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3134 = _3130 || _3132;
        if (!_3134)
        {
            float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3138 = _2697 + _3136;
            float _3140 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3142 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3140;
            float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3146 = _3144 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3148 = 1.0 / _3142;
            float _3150 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3152 = _3150 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3154 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3156 = _3154 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3158 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3160 = _3158 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3162 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3164 = _3162 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3166 = _3138 * _3148;
            float _3168 = precise::clamp(_3166, 0.0, 1.0);
            float _3170 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3172 = _3170 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3174 = fma(_3168, _3146, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3176 = fma(_3168, _3172, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3178 = fma(_3168, _3152, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3180 = fma(_3168, _3156, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3182 = fma(_3168, _3160, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3184 = fma(_3168, _3164, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3078 = _3178;
            _3102 = _3182;
            _3066 = _3174;
            _3094 = _3180;
            _3084 = _3176;
            _3124 = _3184;
            _3186 = true;
        }
        else
        {
            bool _3188 = _2697 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3190 = isnan(_2697);
            bool _3192 = _3188 || _3190;
            bool _3194 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3196 = _3192 || _3194;
            if (!_3196)
            {
                _3064 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3198 = _3064;
            _3066 = _3198;
            if (!_3196)
            {
                _3076 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3200 = _3076;
            _3078 = _3200;
            if (!_3196)
            {
                _3082 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3202 = _3082;
            _3084 = _3202;
            if (!_3196)
            {
                _3092 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3204 = _3092;
            _3094 = _3204;
            if (!_3196)
            {
                _3100 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3206 = _3100;
            _3102 = _3206;
            if (!_3196)
            {
                _3122 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3208 = _3122;
            bool _3210 = !_3196;
            _3124 = _3208;
            if (!_3210)
            {
                bool _3212 = _2697 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3214 = isnan(_2697);
                bool _3216 = _3212 || _3214;
                bool _3218 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3220 = _3216 || _3218;
                if (!_3220)
                {
                    float _3222 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3224 = _2697 + _3222;
                    float _3226 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3228 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3226;
                    float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3234 = 1.0 / _3228;
                    float _3236 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3238 = _3236 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3240 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3242 = _3240 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3244 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3246 = _3244 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3248 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3250 = _3248 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3252 = _3224 * _3234;
                    float _3254 = precise::clamp(_3252, 0.0, 1.0);
                    float _3256 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3258 = _3256 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3260 = fma(_3254, _3232, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3262 = fma(_3254, _3258, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3264 = fma(_3254, _3238, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3266 = fma(_3254, _3242, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3268 = fma(_3254, _3246, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3270 = fma(_3254, _3250, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3078 = _3264;
                    _3102 = _3268;
                    _3066 = _3260;
                    _3094 = _3266;
                    _3084 = _3262;
                    _3124 = _3270;
                    _3186 = true;
                }
                else
                {
                    _3078 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3102 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3066 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3094 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3084 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3124 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3186 = false;
    float _3272 = _3078;
    float _3274 = _3102;
    float _3276 = _3066;
    float _3278 = _3094;
    float _3280 = _3084;
    float _3282 = _3124;
    float _3284 = fma(_2055, -0.5, 0.5);
    float _3286 = precise::clamp(_3284, 0.0, 1.0);
    float _3288 = -_3272;
    float _3290 = _3288 + _3274;
    float _3292 = _3098 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3294 = -_3276;
    float _3296 = _3294 + _3278;
    float _3298 = fma(_3286, _3290, _3272);
    out.m_87.x = 0.0;
    float _3300 = -_3280;
    float _3302 = _3300 + _3282;
    float _3304 = fma(_3286, _3296, _3276);
    float _3306 = _3298 * 0.586610972881317138671875;
    out.m_51.x = _3292;
    bool _3308 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3310 = fma(_3286, _3302, _3280);
    float _3312 = fma(_3304, 0.298911988735198974609375, _3306);
    bool _3314 = _2617 > 0.0;
    bool _3316 = isnan(_2617);
    bool _3318 = _3314 || _3316;
    bool _3320 = isnan(0.0);
    bool _3322 = _3318 || _3320;
    float _3324 = fma(_3310, 0.114477999508380889892578125, _3312);
    bool _3326 = _2675 <= 0.0;
    bool _3328 = !_3322;
    bool _3330 = _3326 || _3328;
    float _3332 = -_3324;
    float _3334 = _3304 + _3332;
    float _3336 = -_3324;
    float _3338 = _3298 + _3336;
    float _3340 = -_3324;
    float _3342 = _3310 + _3340;
    float _3344 = fma(_3334, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3324);
    float _3346 = fma(_3338, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3324);
    float _3348 = fma(_3342, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3324);
    bool _3350 = !_3308;
    if (!_3350)
    {
        float _3352 = -_2551;
        float _3354 = _3352 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3356 = -_2553;
        float _3358 = _3356 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3360 = -_2555;
        float _3362 = _3360 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3364 = _3354 * _3354;
        float _3366 = fma(_3358, _3358, _3364);
        float _3368 = fma(_3362, _3362, _3366);
        float _3370 = sqrt(_3368);
        float _3372 = rsqrt(_3368);
        float _3374 = -_3370;
        float _3376 = _3374 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3378 = _3376 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3380 = precise::clamp(_3378, 0.0, 1.0);
        float _3382 = _3358 * _3372;
        float _3384 = _3354 * _3372;
        float _3386 = abs(_3380);
        float _3388 = log2(_3386);
        float _3390 = _3362 * _3372;
        float _3392 = _3382 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3394 = _2055 * _3384;
        float _3396 = -_3384;
        float _3398 = -_3392;
        float _3400 = fma(_3396, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3398);
        float _3402 = fma(_2081, _3382, _3394);
        float _3404 = -_3390;
        float _3406 = fma(_3404, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3400);
        float _3408 = fma(_2087, _3390, _3402);
        float _3410 = precise::clamp(_3408, 0.0, 1.0);
        float _3412 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3414 = _3406 + _3412;
        float _3416 = _3388 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3418 = _3414 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3420 = precise::clamp(_3418, 0.0, 1.0);
        float _3422 = exp2(_3416);
        float _3424 = _3422 * _3420;
        float _3426 = _3410 * _3424;
        float _3428 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3430 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3432 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3428;
        out.m_87.y = _3430;
        out.m_87.z = _3432;
    }
    out.m_69.x = _3344;
    out.m_69.y = _3346;
    out.m_69.z = _3348;
    if (!_3330)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3434 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3434;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

