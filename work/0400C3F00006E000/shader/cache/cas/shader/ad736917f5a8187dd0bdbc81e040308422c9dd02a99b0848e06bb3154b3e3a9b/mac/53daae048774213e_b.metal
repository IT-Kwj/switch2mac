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
    bool _3174 = false;
    bool _564 = false;
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
        float _3491 = as_type<float>(_132);
        out.gl_Position.z = _3491;
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
        float _3546 = as_type<float>(_158);
        out.gl_Position.z = _3546;
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
    float _300 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].x, _294);
    float _302 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].y, _296);
    float _304 = fma(_216, 0.5, 0.5);
    float _306 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _308 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].z, _298);
    bool _310 = _220 < 0.5;
    float _312 = float(_310);
    float _314 = -_220;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _318 = -_304;
    float _320 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _322 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].x, _300);
    float _324 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].y, _302);
    float _326 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].z, _308);
    float _328 = _304;
    float _330 = _302;
    if (!_176)
    {
        float _332 = _112 * _112;
        float _334 = _332 * 0.5;
        _328 = _334;
    }
    float _336 = _328;
    float _338 = fma(_280, _202, _322);
    float _340 = fma(_280, _204, _324);
    float _342 = -_312;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _346 = fma(_280, _206, _326);
    float _348 = _336;
    if (!_176)
    {
        _330 = _112;
    }
    float _350 = _330;
    float _352 = _350;
    if (!_176)
    {
        float _354 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
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
    float _420 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _422 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _424 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _428 = _426 != 0;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _432 = _430 != 0;
    float _434 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _436 = fma(_338, _282, _288);
    float _438 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[8].y, _424);
    float _440 = fma(_340, _282, _290);
    float _442 = fma(_346, _282, _292);
    float _444 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _446 = !_428;
    int _448 = _446 ? 0 : 1;
    float _450 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[8].x, _434);
    float _452 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[10].y, _438);
    float _454 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[8].z, _444);
    int _456 = abs(_448);
    float _458 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[10].x, _450);
    bool _460 = !_180;
    int _462 = _460 ? 0 : 1;
    float _464 = fma(_416, _204, _452);
    float _466 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[10].z, _454);
    float _468 = float(_456);
    float _470 = 1.0 / _146;
    int _472 = abs(_462);
    float _474 = -_464;
    float _476 = _340 + _474;
    bool _478 = !_432;
    int _480 = _478 ? 0 : 1;
    float _482 = fma(_416, _202, _458);
    bool _484 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _486 = fma(_416, _206, _466);
    float _488 = abs(_316);
    float _490 = _468 * _488;
    int _492 = abs(_480);
    float _494 = _476 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _496 = _476 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _498 = -_482;
    float _500 = _338 + _498;
    float _502 = _476 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _504 = float(_472);
    float _506 = -_486;
    float _508 = _346 + _506;
    float _510 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[4].x, _494);
    float _512 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[5].x, _496);
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[6].x, _502);
    float _516 = float(_492);
    float _518 = fma(_504, _320, _490);
    float _520 = fma(_508, (*spvDescriptorSet0.vp_c10)._m0[4].z, _510);
    float _522 = fma(_508, (*spvDescriptorSet0.vp_c10)._m0[5].z, _512);
    float _524 = fma(_508, (*spvDescriptorSet0.vp_c10)._m0[6].z, _514);
    float _526 = abs(_344);
    float _528 = fma(_516, _526, _518);
    float _530 = _112 * _470;
    bool _532 = !_484;
    float _534 = _530;
    float _536 = _522;
    float _538 = _520;
    float _540 = _524;
    float _542 = _520;
    float _544 = _482;
    float _546 = _486;
    float _562;
    if (!_532)
    {
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _550 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[12].x, _112);
        float _554 = _552 * _548;
        float _556 = floor(_554);
        float _558 = -_556;
        float _560 = _554 + _558;
        _562 = _560;
        _564 = true;
    }
    else
    {
        _562 = _530;
    }
    _564 = false;
    float _566 = _562;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _570 = _566 + _568;
    float _572 = in.m_55.x;
    float _574 = in.m_55.y;
    float _576 = in.m_55.z;
    bool _578 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _580 = isnan(_566);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _590;
    bool _594 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _596 = isnan(_566);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -_588;
    float _608 = _606 + 1.0;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _610;
    float _614 = 1.0 / _592;
    bool _616 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _618 = _604 * _608;
    float _620 = -_604;
    float _622 = _620 + 1.0;
    float _624 = _570 * _614;
    float _626 = fma(_612, _624, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _632;
    float _636 = _626 * _618;
    float _638 = fma(_630, _624, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _640 = fma(_634, _624, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _642 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].x, _636);
    float _644 = _638 * _618;
    float _646 = _640 * _618;
    float _648 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[144].x, _642);
    float _650 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].y, _644);
    float _652 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].z, _646);
    float _654 = _648 * _572;
    float _656 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[144].y, _650);
    float _658 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[144].z, _652);
    float _660 = _656 * _574;
    float _662 = _658 * _576;
    bool _664 = !_616;
    float _666 = _622;
    if (!_664)
    {
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _670 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[11].y, _112);
        float _674 = _672 * _668;
        float _676 = floor(_674);
        float _678 = -_676;
        float _680 = _674 + _678;
        _534 = _680;
    }
    float _682 = _534;
    float _684 = in.m_57.x;
    float _686 = _160 * 2.0;
    float _688 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _690 = int(_688);
    float _692 = in.m_53.y;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _696 = _694 != 0;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _700 = _682 + _698;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _704 = _702 != 0;
    float _706 = in.m_57.y;
    bool _708 = _160 > 0.5;
    bool _710 = _708 && _696;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _714 = _682 + _712;
    float _716 = floor(_686);
    float _718 = in.m_53.z;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _722 = _682 + _720;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _728 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _730 = int(_728);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _740 = _684;
    if (_696)
    {
        _666 = _684;
    }
    float _742 = _666;
    float _744 = _654 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _746 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _748 = log2(_746);
    bool _750 = _692 > 0.5;
    float _752 = _742;
    if (_710)
    {
        float _754 = -_742;
        float _756 = _754 + 1.0;
        _752 = _756;
    }
    float _758 = _752;
    float _760 = _692 * 2.0;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _762;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _772 = _770 != 0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _776 = _774 != 0;
    float _778 = -_706;
    float _780 = _778 + 1.0;
    float _782 = _706;
    if (_696)
    {
        _740 = _758;
    }
    float _784 = _740;
    float _786 = _440 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _790 = _788 != 0;
    float _792 = 1.0 / _726;
    bool _794 = !_772;
    int _796 = _794 ? 0 : 1;
    float _798 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[5].x, _786);
    bool _800 = _716 >= 0.0;
    bool _802 = isnan(_716);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    float _810 = _718 * 2.0;
    if (_704)
    {
        float _812 = _750 ? _780 : _706;
        _782 = _812;
    }
    float _814 = _782;
    float _816 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[5].z, _798);
    int _818 = _808 ? 0 : 1;
    float _820 = floor(_760);
    bool _822 = _716 > 0.0;
    float _824 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _826 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _828 = float(_690);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _836 = _834 != 0;
    float _838 = _440 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _840 = 1.0 / _828;
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _844 = _842 != 0;
    float _846 = _440 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _848 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[4].x, _838);
    float _850 = _692 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _852 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _854 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[6].x, _846);
    float _856 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[4].z, _848);
    float _858 = 1.0 / _832;
    float _860 = fma(_850, -2.0, _732);
    float _862 = -_734;
    float _864 = fma(_852, 2.0, _862);
    float _866 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[6].z, _854);
    int _868 = ~_818;
    int _870 = _868 + 1;
    int _872 = _870 + 1;
    float _874 = _764 * _792;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _876;
    float _880 = _112 * _840;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _886 = _872;
    if (!_822)
    {
        int _888 = ~_818;
        int _890 = _888 + 1;
        _886 = _890;
    }
    int _892 = _886;
    float _894 = 1.0 / _738;
    float _896 = float(uint(_730));
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _904 = _884 * _858;
    float _906 = _112 * _748;
    float _908 = 1.0 / _896;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _912 = _898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _914 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _916 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _918 = !_836;
    float _920 = _918 ? 7.345489978790283203125 : 1.0;
    float _922 = _856 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _924 = trunc(_880);
    int _926 = int(_924);
    out.m_59.x = _912;
    out.m_59.y = _914;
    out.m_59.z = _916;
    out.m_59.w = _910;
    bool _928 = _820 >= 0.0;
    bool _930 = isnan(_820);
    bool _932 = _928 || _930;
    bool _934 = isnan(0.0);
    bool _936 = _932 || _934;
    float _938 = _878 * _894;
    bool _940 = !_768;
    int _942 = _940 ? 0 : 1;
    float _944 = _920 * _160;
    bool _946 = !_776;
    int _948 = _946 ? 0 : 1;
    float _950 = fma(_938, _700, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _952 = floor(_810);
    float _954 = _866 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _958 = _956 != 0;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _962 = _960 != 0;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _966 = _964 != 0;
    float _968 = fma(_874, _722, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _970 = as_type<int>(_908) + (-2);
    float _972 = _160 + _718;
    float _974 = exp2(_906);
    float _976 = float(_730);
    float _978 = _692 + _718;
    float _980 = _160 + _692;
    float _982 = _972 + (-1.0);
    int _984 = _936 ? 0 : 1;
    float _986 = _112 * _976;
    float _988 = _978 + (-1.0);
    float _990 = _980 + (-1.0);
    bool _992 = _952 >= 0.0;
    bool _994 = isnan(_952);
    bool _996 = _992 || _994;
    bool _998 = isnan(0.0);
    bool _1000 = _996 || _998;
    float _1002 = _986 * _470;
    float _1004 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1006 = float(uint(_926));
    float _1008 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1010 = !_958;
    int _1012 = _1010 ? 0 : 1;
    float _1014 = floor(_944);
    float _1016 = -_974;
    float _1018 = _1016 + 1.0;
    float _1020 = as_type<float>(_970) * _1006;
    bool _1022 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1024 = isnan(0.0);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1030 = _1026 || _1028;
    float _1032 = _1030 ? _1018 : 0.0;
    float _1034 = trunc(_1020);
    float _1036 = precise::max(_1034, 0.0);
    uint _1039 = uint(_1036);
    bool _1041 = _952 > 0.0;
    float _1043 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1045 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1047 = isnan(_682);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1053 = _1049 || _1051;
    float _1055 = float(_1053);
    bool _1057 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1059 = isnan(_682);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(_1065);
    int _1069 = _1000 ? 0 : 1;
    float _1071 = -_1055;
    float _1073 = _1071 + 1.0;
    int _1075 = ~_730;
    int _1077 = _1075 + 1;
    float _1079 = -_1014;
    float _1081 = _944 + _1079;
    bool _1083 = _820 > 0.0;
    float _1085 = _1067 * _1073;
    bool _1087 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1089 = isnan(_682);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1095 = _1091 || _1093;
    float _1097 = float(_1095);
    float _1099 = -_1067;
    float _1101 = _1099 + 1.0;
    float _1103 = _1081 * _976;
    bool _1105 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1107 = isnan(_682);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1113 = _1109 || _1111;
    float _1115 = float(_1113);
    float _1117 = _1097 * _1101;
    float _1119 = -_1097;
    float _1121 = _1119 + 1.0;
    int _1123 = _1077 * int(_1039);
    int _1125 = _1123 + _926;
    bool _1127 = !_962;
    int _1129 = _1127 ? 0 : 1;
    float _1131 = trunc(_1002);
    int _1133 = int(_1131);
    float _1135 = _1115 * _1121;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1139 = 1.0 + _1137;
    float _1141 = float(uint(_1125));
    float _1143 = fma(_904, _714, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1145 = _950 * _1135;
    float _1147 = -_1115;
    float _1149 = _1147 + 1.0;
    int _1151 = abs(_1129);
    float _1153 = 1.0 / _1139;
    float _1155 = as_type<float>(_970) * _1141;
    float _1157 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1145);
    float _1159 = float(_892);
    float _1161 = in.m_61.x;
    float _1163 = in.m_61.y;
    float _1165 = in.m_61.z;
    float _1167 = float(_1151);
    int _1169 = ~_1069;
    int _1171 = _1169 + 1;
    int _1173 = _1171 + 1;
    float _1175 = trunc(_1155);
    float _1177 = precise::max(_1175, 0.0);
    uint _1179 = uint(_1177);
    int _1181 = abs(_1012);
    float _1183 = _1167 * _1159;
    int _1185 = _1173;
    if (!_1041)
    {
        int _1187 = ~_1069;
        int _1189 = _1187 + 1;
        _1185 = _1189;
    }
    int _1191 = _1185;
    float _1193 = fma(_1143, _1117, _1157);
    int _1195 = ~_984;
    int _1197 = _1195 + 1;
    int _1199 = _1197 + 1;
    float _1201 = _1183 * (-2.0);
    int _1203 = _1199;
    if (!_1083)
    {
        int _1205 = ~_984;
        int _1207 = _1205 + 1;
        _1203 = _1207;
    }
    int _1209 = _1203;
    float _1211 = _1032 * _1153;
    float _1213 = float(_926);
    float _1215 = fma(_1043, _1201, _1043);
    float _1217 = float(_1181);
    float _1219 = _692 + (-0.5);
    bool _1221 = _1213 >= _976;
    bool _1223 = isnan(_1213);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan(_976);
    bool _1229 = _1225 || _1227;
    float _1231 = float(_1229);
    float _1233 = fma(_968, _1085, _1193);
    float _1235 = float(_1191);
    int _1237 = ~_730;
    int _1239 = _1237 + 1;
    int _1241 = int(_1039) + int(_1179);
    float _1243 = _1217 * _1235;
    float _1245 = fma(_1201, _1163, _1163);
    bool _1247 = !_790;
    int _1249 = _1247 ? 0 : 1;
    int _1251 = _1239 * _1241;
    int _1253 = _1251 + _926;
    float _1255 = trunc(_1103);
    int _1257 = int(_1255);
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1261 = _1243 * (-2.0);
    bool _1263 = !_966;
    int _1265 = _1263 ? 0 : 1;
    float _1267 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1245);
    bool _1269 = uint(_1253) >= uint(_730);
    float _1271 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1259);
    int _1273 = abs(_1249);
    float _1275 = trunc(_1231);
    int _1277 = int(_1275);
    bool _1279 = !_1269;
    int _1281 = _1279 ? 0 : (-1);
    float _1283 = fma(_1261, _1161, _1161);
    float _1285 = _816 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1287 = ~_1241;
    int _1289 = _1287 + _1281;
    int _1291 = _1289 + 1;
    float _1293 = fma(_1008, _1261, _1008);
    int _1295 = _1257 * _1273;
    int _1297 = _1295 + _926;
    float _1299 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1301 = _1285 + _1299;
    int _1303 = _730 * _1291;
    int _1305 = _1303 + _926;
    bool _1307 = _730 == 0;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1313 = _922 + _1311;
    float _1315 = _1301 * _1301;
    float _1317 = _160 + (-0.5);
    int _1319 = ~_1277;
    int _1321 = _1319 + 1;
    int _1323 = _1321 + 1;
    float _1325 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1309);
    bool _1327 = !_1307;
    int _1329 = _1327 ? _1305 : (-1);
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1333 = _954 + _1331;
    bool _1335 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1337 = isnan(1.0);
    bool _1339 = _1335 || _1337;
    bool _1341 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1343 = _1339 || _1341;
    float _1345 = fma(_1313, _1313, _1315);
    int _1347 = abs(_1265);
    float _1349 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1283);
    int _1351 = _1329 * _1323;
    int _1353 = _730 + (-1);
    float _1355 = fma(_1333, _1333, _1345);
    bool _1357 = !_1343;
    float _1359 = _1357 ? _112 : _1211;
    float _1361 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1271);
    float _1363 = float(_1347);
    int _1365 = _1277 * _1353;
    int _1367 = _1365 + _1351;
    float _1369 = float(_1209);
    float _1371 = rsqrt(_1355);
    int _1373 = abs(_796);
    float _1375 = fma(_1359, _1215, _1267);
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1379 = _1377 != 0;
    float _1381 = _1363 * _1369;
    int _1383 = abs(_942);
    int _1385 = _1367 * _1373;
    bool _1387 = !_1379;
    int _1389 = _1387 ? 0 : 1;
    float _1391 = sqrt(_1355);
    float _1393 = _1375 * 0.15915493667125701904296875;
    float _1395 = fma(_1359, _1293, _1349);
    int _1397 = abs(_1389);
    float _1399 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1325);
    float _1401 = float(uint(_1297));
    float _1403 = _1395 * 0.15915493667125701904296875;
    int _1405 = ~_730;
    int _1407 = _1405 + 1;
    float _1409 = _1393 * 6.283185482025146484375;
    float _1411 = sin(_1409);
    int _1413 = abs(_948);
    float _1415 = as_type<float>(_970) * _1401;
    float _1417 = _744 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1419 = _1133 * _1383;
    int _1421 = _1419 + _1385;
    float _1423 = _1381 * (-2.0);
    float _1425 = _1391 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _1427 = _1297 * _1413;
    int _1429 = _1427 + _1421;
    float _1431 = _1393 * 6.283185482025146484375;
    float _1433 = cos(_1431);
    int _1435 = _1257 * _1397;
    int _1437 = _1435 + _1429;
    float _1439 = fma(_1004, _1423, _1004);
    float _1441 = fma(_1423, _1165, _1165);
    float _1443 = _718 + (-0.5);
    float _1445 = precise::min(_1417, _1425);
    float _1447 = trunc(_1415);
    float _1449 = precise::max(_1447, 0.0);
    uint _1451 = uint(_1449);
    float _1453 = float(uint(_1437));
    float _1455 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1441);
    float _1457 = in.m_63.x;
    float _1459 = in.m_63.y;
    float _1461 = in.m_63.z;
    float _1463 = _1371 * _1445;
    float _1465 = as_type<float>(_970) * _1453;
    float _1467 = fma(_1359, _1439, _1455);
    float _1469 = _1301 * _1463;
    float _1471 = _1313 * _1463;
    float _1473 = trunc(_1465);
    float _1475 = precise::max(_1473, 0.0);
    uint _1477 = uint(_1475);
    int _1479 = ~_730;
    int _1481 = _1479 + 1;
    float _1483 = -_1469;
    float _1485 = _1301 + _1483;
    float _1487 = -_1471;
    float _1489 = _1313 + _1487;
    float _1491 = _1467 * 0.15915493667125701904296875;
    float _1493 = _1485 * _1485;
    int _1495 = _1407 * int(_1451);
    int _1497 = _1495 + _1297;
    float _1499 = _1403 * 6.283185482025146484375;
    float _1501 = sin(_1499);
    float _1503 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1505 = _1333 * _1463;
    float _1507 = fma(_1489, _1489, _1493);
    float _1509 = float(uint(_1497));
    float _1511 = in.m_65.x;
    float _1513 = in.m_65.y;
    float _1515 = in.m_65.z;
    float _1517 = -_1505;
    float _1519 = _1333 + _1517;
    float _1521 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _860);
    int _1523 = _1481 * int(_1477);
    int _1525 = _1523 + _1437;
    bool _1527 = _1459 != 0.0;
    bool _1529 = isnan(_1459);
    bool _1531 = _1527 || _1529;
    bool _1533 = isnan(0.0);
    bool _1535 = _1531 || _1533;
    float _1537 = _1403 * 6.283185482025146484375;
    float _1539 = cos(_1537);
    float _1541 = fma(_1519, _1519, _1507);
    float _1543 = -_1521;
    float _1545 = fma(_1361, _1503, _1543);
    float _1547 = float(uint(_1525));
    float _1549 = as_type<float>(_970) * _1509;
    bool _1551 = _1457 == 0.0;
    bool _1553 = !_1535;
    bool _1555 = _1551 && _1553;
    float _1557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1461);
    float _1559 = as_type<float>(_970) * _1547;
    float _1561 = _1491 * 6.283185482025146484375;
    float _1563 = sin(_1561);
    bool _1565 = _1461 == 0.0;
    bool _1567 = _1565 && _1555;
    float _1569 = -_112;
    float _1571 = fma(_1569, (*spvDescriptorSet0.vp_c9)._m0[76].x, _864);
    float _1573 = _1545 + 0.5;
    float _1575 = _1501 * _1411;
    float _1577 = fma(_1399, _824, _1571);
    float _1579 = _1539 * _1433;
    float _1581 = sqrt(_1541);
    float _1583 = _1501 * _1433;
    float _1585 = _1577 + 0.5;
    float _1587 = _1515;
    float _1589 = _1513;
    float _1591 = _1511;
    if (!_1567)
    {
        float _1593 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1515);
        _1587 = _1593;
    }
    float _1595 = _1587;
    float _1597 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1233);
    float _1599 = trunc(_1559);
    float _1601 = precise::max(_1599, 0.0);
    uint _1603 = uint(_1601);
    float _1605 = fma(_1563, _1579, _1575);
    float _1607 = _1539 * _1411;
    float _1609 = fma(_1563, _1575, _1579);
    int _1611 = ~_730;
    int _1613 = _1611 + 1;
    out.m_67.x = _1585;
    out.m_67.y = _1573;
    if (!_1567)
    {
        float _1615 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1513);
        _1589 = _1615;
    }
    float _1617 = _1589;
    if (!_1567)
    {
        float _1619 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1511);
        _1591 = _1619;
    }
    float _1621 = _1591;
    float _1623 = _1491 * 6.283185482025146484375;
    float _1625 = cos(_1623);
    float _1627 = _1371 * _1581;
    float _1629 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1459);
    float _1631 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1457);
    float _1633 = _744 * _1627;
    float _1635 = _662 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1637 = int(_1477) + int(_1603);
    float _1639 = -_1607;
    float _1641 = fma(_1563, _1583, _1639);
    float _1643 = -_1583;
    float _1645 = fma(_1563, _1607, _1643);
    float _1647 = _826 * _1627;
    float _1649 = _1635 * _1627;
    int _1651 = _1613 * _1637;
    int _1653 = _1651 + _1437;
    float _1655 = trunc(_1549);
    float _1657 = precise::max(_1655, 0.0);
    uint _1659 = uint(_1657);
    float _1661 = _1647 * _1629;
    float _1663 = _1539 * _1625;
    float _1665 = _1649 * _1557;
    bool _1667 = uint(_1653) >= uint(_730);
    float _1669 = _1501 * _1625;
    float _1671 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1673 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1675 = !_1667;
    int _1677 = _1675 ? 0 : (-1);
    float _1679 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1681 = -_1563;
    float _1683 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1671);
    float _1685 = -_1563;
    float _1687 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1673);
    int _1689 = ~_1637;
    int _1691 = _1689 + _1677;
    int _1693 = _1691 + 1;
    float _1695 = -_1563;
    float _1697 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1679);
    float _1699 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1683);
    float _1701 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1687);
    float _1703 = _1433 * _1625;
    int _1705 = _730 * _1693;
    int _1707 = _1705 + _1437;
    float _1709 = -_1661;
    float _1711 = _1563 * _1709;
    float _1713 = _1663 * _1661;
    float _1715 = _1633 * _1631;
    float _1717 = _1669 * _1661;
    bool _1719 = !_1307;
    int _1721 = _1719 ? _1707 : (-1);
    float _1723 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1697);
    int _1725 = int(_1451) + int(_1659);
    float _1727 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1729 = ~_730;
    int _1731 = _1729 + 1;
    float _1733 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1735 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1737 = fma(_1703, _1715, _1711);
    float _1739 = fma(_1605, _1715, _1713);
    float _1741 = _1411 * _1625;
    float _1743 = fma(_1641, _1715, _1717);
    float _1745 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1747 = _1721 >> 31;
    float _1749 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1727);
    float _1751 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1733);
    float _1753 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1735);
    float _1755 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1757 = _1731 * _1725;
    int _1759 = _1757 + _1297;
    float _1761 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1745);
    int _1763 = _1747 & 3;
    float _1765 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1767 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1755);
    float _1769 = fma(_1645, _1665, _1739);
    float _1771 = fma(_1741, _1665, _1737);
    bool _1773 = uint(_1759) >= uint(_730);
    float _1775 = _1701 * _1617;
    int _1777 = _1721 + _1763;
    float _1779 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1781 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1765);
    float _1783 = fma(_1609, _1665, _1743);
    int _1785 = _1777 >> 2;
    float _1787 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1779);
    float _1789 = _1699 * _1617;
    float _1791 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1793 = _1785 << 4;
    int _1795 = _1793 + 368;
    float _1797 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1787);
    float _1799 = _1723 * _1617;
    float _1801 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1791);
    uint _1803 = uint(int(uint(_1795) >> uint(2)));
    uint _1805 = uint(int(uint(int(_1803)) >> uint(2)));
    int _1807 = int(_1803) & 3;
    float _1809 = (*spvDescriptorSet0.vp_c9)._m0[int(_1805)][_1807];
    int _1811 = int(_1803) + 1;
    uint _1813 = uint(int(uint(_1811) >> uint(2)));
    int _1815 = _1811 & 3;
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[int(_1813)][_1815];
    float _1819 = _1797 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1821 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1749);
    float _1823 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1801);
    float _1825 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1751);
    float _1827 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1753);
    float _1829 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1761);
    float _1831 = _1823 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1833 = _1795 + 8;
    uint _1835 = uint(int(uint(_1833) >> uint(2)));
    uint _1837 = uint(int(uint(int(_1835)) >> uint(2)));
    int _1839 = int(_1835) & 3;
    float _1841 = (*spvDescriptorSet0.vp_c9)._m0[int(_1837)][_1839];
    int _1843 = int(_1835) + 1;
    uint _1845 = uint(int(uint(_1843) >> uint(2)));
    int _1847 = _1843 & 3;
    float _1849 = (*spvDescriptorSet0.vp_c9)._m0[int(_1845)][_1847];
    float _1851 = _954 + _1819;
    int _1853 = _1721 & 3;
    bool _1855 = _1853 != 0;
    float _1857 = _922 + _1831;
    int _1859 = _1721 & 3;
    bool _1861 = _1859 != 0;
    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1865 = _1851 + _1863;
    bool _1867 = uint(_1853) > 1u;
    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1871 = _1857 + _1869;
    float _1873 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1767);
    float _1875 = _1865 * _1865;
    float _1877 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1781);
    float _1879 = fma(_1821, _1621, _1775);
    int _1881 = _1861 ? 0 : 1;
    float _1883 = fma(_1871, _1871, _1875);
    bool _1885 = uint(_1853) >= 2u;
    float _1887 = fma(_1825, _1621, _1789);
    int _1889 = ~_1881;
    int _1891 = _1889 + 1;
    int _1893 = _1891 + 1;
    float _1895 = sqrt(_1883);
    int _1897 = _1885 ? 0 : 1;
    float _1899 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1901 = _1893;
    float _1903 = as_type<float>(_1853);
    float _1905 = _1857;
    if (!_1867)
    {
        int _1907 = ~_1881;
        int _1909 = _1907 + 1;
        _1901 = _1909;
    }
    int _1911 = _1901;
    float _1913 = fma(_1827, _1621, _1799);
    bool _1915 = _1853 != 3;
    float _1917 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1899);
    bool _1919 = !_1855;
    int _1921 = _1919 ? 0 : 1;
    int _1923 = abs(_1911);
    int _1925 = abs(_1921);
    float _1927 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1917);
    bool _1929 = _1853 != 3;
    int _1931 = ~_1923;
    int _1933 = _1931 + 1;
    int _1935 = _1933 + 1;
    float _1937 = _1927 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1939 = ~_1897;
    int _1941 = _1939 + 1;
    int _1943 = _1941 + 1;
    float _1945 = _1285 + _1937;
    bool _1947 = _1895 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1949 = _1935 * as_type<int>(_1817);
    int _1951 = _1943;
    if (_1915)
    {
        int _1953 = ~_1897;
        int _1955 = _1953 + 1;
        _1951 = _1955;
    }
    int _1957 = _1951;
    bool _1959 = !_1929;
    int _1961 = _1959 ? 0 : (-1);
    int _1963 = ~_1925;
    int _1965 = _1963 + 1;
    int _1967 = _1965 + 1;
    int _1969 = abs(_1957);
    bool _1971 = !_844;
    int _1973 = _1971 ? 0 : 1;
    int _1975 = _1967 * as_type<int>(_1809);
    int _1977 = _1975 + _1949;
    int _1979 = abs(_1961);
    int _1981 = ~_1969;
    int _1983 = _1981 + 1;
    int _1985 = _1983 + 1;
    int _1987 = abs(_1973);
    bool _1989 = !_1773;
    int _1991 = _1989 ? 0 : (-1);
    int _1993 = _1985 * as_type<int>(_1841);
    int _1995 = _1993 + _1977;
    float _1997 = as_type<float>(_1985);
    if (!_1947)
    {
        _1903 = _1857;
    }
    float _1999 = _1903;
    int _2001 = ~_1725;
    int _2003 = _2001 + _1991;
    int _2005 = _2003 + 1;
    float _2007 = _1999;
    if (!_1947)
    {
        _1905 = _1851;
    }
    float _2009 = _1905;
    int _2011 = ~_1979;
    int _2013 = _2011 + 1;
    int _2015 = _2013 + 1;
    float _2017 = _2009;
    if (!_1947)
    {
        _1997 = _1945;
    }
    float _2019 = _1997;
    bool _2021 = !_1947;
    float _2023 = _2019;
    if (!_2021)
    {
        float _2025 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2027 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2029 = _1895 + _2027;
        float _2031 = rsqrt(_1883);
        float _2033 = _2029 * _2025;
        float _2035 = _1945 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2037 = _2033 * 0.15915493667125701904296875;
        float _2039 = _2037 * 6.283185482025146484375;
        float _2041 = cos(_2039);
        float _2043 = _2037 * 6.283185482025146484375;
        float _2045 = sin(_2043);
        float _2047 = _2041 + (-1.0);
        float _2049 = _2047 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2051 = fma(_2045, _2035, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2053 = fma(_1945, _2041, _2049);
        float _2055 = _2031 * _2051;
        float _2057 = fma(_1871, _2055, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2059 = fma(_1865, _2055, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2023 = _2053;
        _2007 = _2057;
        _2017 = _2059;
    }
    float _2061 = _2023;
    float _2063 = _2007;
    float _2065 = _2017;
    float _2067 = -_1285;
    float _2069 = _2067 + _2061;
    int _2071 = ~_1987;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    int _2077 = _2015 * as_type<int>(_1849);
    int _2079 = _2077 + _1995;
    float _2081 = -_922;
    float _2083 = _2081 + _2063;
    float _2085 = _2069 * _2069;
    int _2087 = _730 * _2005;
    int _2089 = _2087 + _1297;
    float _2091 = -_954;
    float _2093 = _2091 + _2065;
    int _2095 = _2079 * _2075;
    float _2097 = fma(_2083, _2083, _2085);
    out.m_69.w = _1445;
    bool _2099 = !_1307;
    int _2101 = _2099 ? _2089 : (-1);
    float _2103 = fma(_2093, _2093, _2097);
    float _2105 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2107 = sqrt(_2103);
    int _2109 = _2101 * _1987;
    int _2111 = _2109 + _2095;
    float _2113 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2115 = _1597 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2119 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2121 = _2113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2123 = fma(_1829, _1595, _1879);
    float _2125 = _2117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2127 = fma(_1873, _1595, _1887);
    float _2129 = float(_2111);
    float _2131 = fma(_1877, _1595, _1913);
    out.m_71.x = _1633;
    float _2133 = -_1471;
    float _2135 = _2133 + _2063;
    float _2137 = -_1471;
    float _2139 = _922 + _2137;
    out.m_73.x = _2119;
    out.m_73.y = _2121;
    out.m_73.z = _2125;
    out.m_73.w = _2115;
    bool _2141 = _2107 > 0.0;
    float _2143 = -_1469;
    float _2145 = _2143 + _2061;
    float _2147 = -_1505;
    float _2149 = _2147 + _2065;
    out.m_75.x = _2129;
    float _2151 = -_1469;
    float _2153 = _1285 + _2151;
    float _2155 = -_1505;
    float _2157 = _954 + _2155;
    out.m_77.x = _2123;
    out.m_77.y = _2127;
    out.m_77.z = _2131;
    bool _2159 = !_2141;
    float _2161 = _2115;
    float _2163 = _2119;
    float _2165 = _2121;
    float _2167 = _2135;
    float _2169 = _2149;
    float _2171 = _2145;
    float _2173 = _2157;
    float _2175 = _2153;
    float _2177 = _2139;
    if (!_2159)
    {
        bool _2179 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2181 = _2125;
        if (_2179)
        {
            float _2183 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2181 = _2183;
        }
        float _2185 = _2181;
        if (_2179)
        {
            float _2187 = _520 * _2185;
            _2161 = _2187;
        }
        float _2189 = _2161;
        float _2191 = _2189;
        if (_2179)
        {
            float _2193 = _522 * _2185;
            _2163 = _2193;
        }
        float _2195 = _2163;
        float _2197 = _2195;
        if (_2179)
        {
            float _2199 = _524 * _2185;
            _2165 = _2199;
        }
        float _2201 = _2165;
        float _2203 = _2201;
        if (!_2179)
        {
            float _2205 = _112 + 1.0;
            if (!_176)
            {
                float _2207 = _2205 * _2205;
                float _2209 = _2207 * 0.5;
                _122 = _2209;
            }
            float _2211 = _122;
            float _2213 = _2211;
            if (!_176)
            {
                float _2215 = _2211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2213 = _2215;
            }
            float _2217 = _2213;
            bool _2219 = !_176;
            float _2221 = _2217;
            if (!_2219)
            {
                float _2223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2225 = log2(_2223);
                float _2227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2229 = 1.0 + _2227;
                float _2231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2233 = _2225 * _2205;
                float _2235 = 1.0 / _2229;
                float _2237 = _2231 * 0.693147182464599609375;
                float _2239 = exp2(_2233);
                float _2241 = 1.0 / _2237;
                float _2243 = _2239 + (-1.0);
                float _2245 = -_2243;
                float _2247 = fma(_2245, _2241, _2205);
                float _2249 = _2247 * _2235;
                float _2251 = _2249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2221 = _2251;
            }
            float _2253 = _2221;
            float _2255 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2257 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2259 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2261 = _2253;
            if (!_176)
            {
                _2261 = _2205;
            }
            float _2263 = _2261;
            float _2265 = _2255 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2267 = _2255 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2269 = _2255 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2271 = fma(_2257, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2265);
            float _2273 = fma(_2257, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2267);
            float _2275 = fma(_2259, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2271);
            bool _2277 = !_176;
            float _2279 = _2263;
            if (!_2277)
            {
                float _2281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2283 = log2(_2281);
                float _2285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2287 = 1.0 + _2285;
                float _2289 = 1.0 / _2287;
                float _2291 = _2283 * _2205;
                float _2293 = exp2(_2291);
                float _2295 = -_2293;
                float _2297 = _2295 + 1.0;
                float _2299 = _2297 * _2289;
                _2279 = _2299;
            }
            float _2301 = _2279;
            float _2303 = fma(_2257, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2269);
            float _2305 = fma(_2301, _204, _2275);
            float _2307 = fma(_2259, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2273);
            float _2309 = fma(_2259, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2303);
            float _2311 = -_464;
            float _2313 = _2311 + _2305;
            float _2315 = fma(_2301, _202, _2307);
            float _2317 = fma(_2301, _206, _2309);
            float _2319 = _2313 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2321 = _2313 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2323 = -_482;
            float _2325 = _2323 + _2315;
            float _2327 = _2313 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2329 = -_486;
            float _2331 = _2329 + _2317;
            float _2333 = fma(_2325, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2319);
            float _2335 = fma(_2325, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2321);
            float _2337 = fma(_2325, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2327);
            float _2339 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2333);
            float _2341 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2335);
            float _2343 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2337);
            _536 = _2341;
            _538 = _2339;
            _540 = _2343;
            _2191 = _2339;
            _2197 = _2341;
            _2203 = _2343;
        }
        float _2345 = _536;
        float _2347 = _538;
        float _2349 = _540;
        float _2351 = _2191;
        float _2353 = _2197;
        float _2355 = _2203;
        float _2357 = _2345 * _2345;
        float _2359 = rsqrt(_2103);
        float _2361 = fma(_2347, _2347, _2357);
        float _2363 = fma(_2349, _2349, _2361);
        float _2365 = sqrt(_2363);
        float _2367 = _2083 * _2359;
        float _2369 = _2069 * _2359;
        float _2371 = _2093 * _2359;
        bool _2373 = _2365 > 0.0;
        bool _2375 = !_2373;
        _542 = _2347;
        _124 = _2367;
        _544 = _2363;
        if (!_2375)
        {
            float _2377 = rsqrt(_2363);
            float _2379 = _2377 * _2345;
            float _2381 = _2377 * _2347;
            float _2383 = _2377 * _2349;
            float _2385 = _2369 * _2379;
            float _2387 = fma(_2367, _2381, _2385);
            float _2389 = fma(_2371, _2383, _2387);
            float _2391 = _2389 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2393 = fma(_2351, _2391, _2135);
            float _2395 = fma(_2353, _2391, _2145);
            float _2397 = fma(_2355, _2391, _2149);
            _2167 = _2393;
            _2169 = _2397;
            _2171 = _2395;
        }
    }
    float _2399 = _2167;
    float _2401 = _2169;
    float _2403 = _2171;
    float _2405 = _542;
    float _2407 = _124;
    float _2409 = _544;
    float _2411 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2413 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2415 = isnan(0.5);
    bool _2417 = _2413 || _2415;
    bool _2419 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2421 = _2417 || _2419;
    float _2423 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2411);
    bool _2425 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2427 = isnan(0.5);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2433 = _2429 || _2431;
    float _2435 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2423);
    float _2437 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2439 = _2435 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2441 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2437);
    float _2443 = 1.0 / _2439;
    float _2445 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2441);
    float _2447 = _2407;
    float _2449 = _2439;
    float _2451 = _2409;
    float _2453 = _2405;
    if (_2433)
    {
        _2447 = 1.0;
    }
    float _2455 = _2447;
    float _2457 = _2445 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2459 = _2457 + _2439;
    float _2461 = _2455;
    if (_2421)
    {
        _2449 = _2399;
    }
    float _2463 = _2449;
    float _2465 = _2459 * _2443;
    float _2467 = _2465 * 0.5;
    float _2469 = _2443;
    float _2471 = _2467;
    float _2473 = _2463;
    if (_2421)
    {
        _2469 = _2401;
    }
    float _2475 = _2469;
    float _2477 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2479 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2477);
    float _2481 = _2475;
    if (_2421)
    {
        _2471 = _2403;
    }
    float _2483 = _2471;
    float _2485 = 1.0 / _2479;
    float _2487 = _2483;
    if (!_2421)
    {
        float _2489 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2491 = _2153 + _2489;
        float _2493 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2495 = _2139 + _2493;
        float _2497 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2499 = _2491 * _2491;
        float _2501 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2503 = _2157 + _2501;
        float _2505 = fma(_2495, _2495, _2499);
        float _2507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2509 = fma(_2503, _2503, _2505);
        float _2511 = sqrt(_2509);
        float _2513 = _2497 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2515 = -_2153;
        float _2517 = _2515 + _2403;
        float _2519 = precise::min(_2511, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2521 = _2519 * _2507;
        float _2523 = -_2139;
        float _2525 = _2523 + _2399;
        float _2527 = _2513 * _2521;
        float _2529 = -_2157;
        float _2531 = _2529 + _2401;
        float _2533 = fma(_2525, _2527, _2139);
        float _2535 = fma(_2517, _2527, _2153);
        float _2537 = fma(_2531, _2527, _2157);
        _2487 = _2535;
        _2473 = _2533;
        _2481 = _2537;
    }
    float _2539 = _2487;
    float _2541 = _2473;
    float _2543 = _2481;
    if (_2433)
    {
        _2451 = 1.0;
    }
    float _2545 = _2451;
    float _2547 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2549 = _2485 * _2547;
    float _2551 = _2545;
    if (!_2433)
    {
        float _2553 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2555 = _2553 * 0.15915493667125701904296875;
        float _2557 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2559 = _2555 * 6.283185482025146484375;
        float _2561 = cos(_2559);
        float _2563 = _2557 * 0.15915493667125701904296875;
        float _2565 = _2555 * 6.283185482025146484375;
        float _2567 = sin(_2565);
        float _2569 = 1.0 / _2561;
        float _2571 = _2563 * 6.283185482025146484375;
        float _2573 = cos(_2571);
        float _2575 = _2567 * _2569;
        float _2577 = _2563 * 6.283185482025146484375;
        float _2579 = sin(_2577);
        float _2581 = _2573 * _2575;
        float _2583 = 1.0 / _2581;
        float _2585 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2587 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2585;
        float _2589 = 1.0 / _2587;
        float _2591 = _2579 * _2583;
        float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2595 = fma(_2549, _2591, _2593);
        float _2597 = _2595 * _2589;
        float _2599 = precise::clamp(_2597, 0.0, 1.0);
        _546 = _2589;
        _2461 = _2599;
    }
    float _2601 = _546;
    float _2603 = _2461;
    float _2605 = _2601;
    if (!_2433)
    {
        float _2607 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2609 = _2607 * 0.15915493667125701904296875;
        float _2611 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2613 = _2609 * 6.283185482025146484375;
        float _2615 = cos(_2613);
        float _2617 = _2611 * 0.15915493667125701904296875;
        float _2619 = _2609 * 6.283185482025146484375;
        float _2621 = sin(_2619);
        float _2623 = 1.0 / _2615;
        float _2625 = _2617 * 6.283185482025146484375;
        float _2627 = cos(_2625);
        float _2629 = _2621 * _2623;
        float _2631 = _2617 * 6.283185482025146484375;
        float _2633 = sin(_2631);
        float _2635 = _2627 * _2629;
        float _2637 = 1.0 / _2635;
        float _2639 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2641 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2639;
        float _2643 = 1.0 / _2641;
        float _2645 = _2633 * _2637;
        float _2647 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2649 = fma(_2549, _2645, _2647);
        float _2651 = _2649 * _2643;
        float _2653 = precise::clamp(_2651, 0.0, 1.0);
        float _2655 = -_2653;
        float _2657 = _2655 + 1.0;
        _2453 = _2645;
        _2605 = _2635;
        _2551 = _2657;
    }
    float _2659 = _2453;
    float _2661 = _2605;
    float _2663 = _2551;
    float _2665 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2667 = _2539 + _2665;
    float _2669 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2671 = _2541 + _2669;
    float _2673 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2675 = _2543 + _2673;
    float _2677 = _2667 * _2667;
    float _2679 = fma(_2671, _2671, _2677);
    float _2681 = fma(_2675, _2675, _2679);
    float _2683 = rsqrt(_2681);
    float _2685 = sqrt(_2681);
    float _2687 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2689 = _2671 * _2687;
    float _2691 = _2675 * _2687;
    float _2693 = _2689 * _2689;
    float _2695 = _2691 * _2691;
    float _2697 = _2693 + _2695;
    float _2699 = sqrt(_2697);
    bool _2701 = _2699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2705 = _2699 + _2703;
    float _2707 = _2683;
    float _2709 = _2705;
    float _2711 = _2659;
    float _2713 = _2667;
    float _2715 = _2687;
    if (_2701)
    {
        float _2717 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2707 = _2717;
    }
    float _2719 = _2707;
    float _2721 = _2719;
    if (_2701)
    {
        float _2723 = _2705 * _2719;
        _2709 = _2723;
    }
    float _2725 = _2709;
    if (_2701)
    {
        float _2727 = rsqrt(_2697);
        _2721 = _2727;
    }
    float _2729 = _2721;
    float _2731 = _2729;
    if (_2701)
    {
        float _2733 = _2725 * 0.15915493667125701904296875;
        _2711 = _2733;
    }
    float _2735 = _2711;
    float _2737 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2739 = _2675;
    float _2741 = _2735;
    if (_2701)
    {
        float _2743 = _2735 * 6.283185482025146484375;
        float _2745 = sin(_2743);
        _2739 = _2745;
    }
    float _2747 = _2739;
    float _2749 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2751 = _2539 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2753 = precise::max(0.0, _2737);
    float _2755 = _2661;
    float _2757 = _2753;
    if (_2701)
    {
        float _2759 = _2735 * 6.283185482025146484375;
        float _2761 = cos(_2759);
        _2755 = _2761;
    }
    float _2763 = _2755;
    float _2765 = -_2687;
    float _2767 = -_2753;
    float _2769 = fma(_2667, _2765, _2767);
    if (_2701)
    {
        float _2771 = _2769 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2713 = _2771;
    }
    float _2773 = _2713;
    float _2775 = _2747;
    float _2777 = _2773;
    if (_2701)
    {
        float _2779 = fma(_2747, _2773, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2775 = _2779;
    }
    float _2781 = _2775;
    float _2783 = _2781;
    if (!_2701)
    {
        _2777 = _2769;
    }
    float _2785 = _2777;
    float _2787 = _2785;
    if (_2701)
    {
        float _2789 = _2729 * _2781;
        _2715 = _2789;
    }
    float _2791 = _2715;
    if (!_2701)
    {
        _2731 = _2689;
    }
    float _2793 = _2731;
    float _2795 = _2793;
    float _2797 = _2763;
    if (_2701)
    {
        float _2799 = _2763 + (-1.0);
        _2757 = _2799;
    }
    float _2801 = _2757;
    float _2803 = _2801;
    if (_2701)
    {
        float _2805 = _2689 * _2791;
        _2795 = _2805;
    }
    float _2807 = _2795;
    if (!_2701)
    {
        _2783 = _2693;
    }
    float _2809 = _2783;
    float _2811 = _2539 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2813 = _2809;
    if (_2701)
    {
        float _2815 = _2801 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2741 = _2815;
    }
    float _2817 = _2741;
    if (!_2701)
    {
        _2803 = _2691;
    }
    float _2819 = _2803;
    float _2821 = _2819;
    if (_2701)
    {
        float _2823 = _2691 * _2791;
        _2821 = _2823;
    }
    float _2825 = _2821;
    if (_2701)
    {
        float _2827 = _2807 * _2807;
        _2813 = _2827;
    }
    float _2829 = _2813;
    if (_2701)
    {
        float _2831 = fma(_2769, _2763, _2817);
        _2787 = _2831;
    }
    float _2833 = _2787;
    if (!_2701)
    {
        _2797 = _2695;
    }
    float _2835 = _2797;
    float _2837 = _2835;
    if (_2701)
    {
        float _2839 = _2825 * _2825;
        _2837 = _2839;
    }
    float _2841 = _2837;
    float _2843 = _2539 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2845 = fma(_2833, _2833, _2829);
    float _2847 = fma(_2541, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2811);
    float _2849 = fma(_2541, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2843);
    float _2851 = _2845 + _2841;
    float _2853 = fma(_2541, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2751);
    float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2857 = fma(_2685, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2855);
    float _2859 = precise::clamp(_2857, 0.0, 1.0);
    float _2861 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2849);
    float _2863 = rsqrt(_2851);
    float _2865 = _2539 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2867 = -_2859;
    float _2869 = _2867 + 1.0;
    float _2871 = _2861 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2873 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2847);
    float _2875 = fma(_2541, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2865);
    float _2877 = _2871 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2879 = abs(_2869);
    float _2881 = log2(_2879);
    float _2883 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2853);
    float _2885 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2875);
    float _2887 = -_2877;
    float _2889 = fma(_2887, _2749, 1.0);
    float _2891 = _2883 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2893 = _2885 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2895 = _2873 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2897 = _2863 * _2807;
    float _2899 = _2891 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2901 = _2863 * _2833;
    float _2903 = _2863 * _2825;
    float _2905 = _2897 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2907 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2899);
    float _2909 = log2(_2889);
    float _2911 = _2891 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2913 = -_2905;
    float _2915 = fma(_2901, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2913);
    float _2917 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2919 = fma(_2871, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2907);
    float _2921 = -_2903;
    float _2923 = fma(_2921, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2915);
    float _2925 = _2891 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2927 = exp2(_2917);
    float _2929 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2919);
    float _2931 = fma(_2923, -0.5, 0.5);
    float _2933 = fma(_2923, 0.5, 0.5);
    float _2935 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2925);
    float _2937 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2911);
    float _2939 = _2901 + 1.0;
    float _2941 = fma(_2933, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2943 = 1.0 / _2929;
    float _2945 = fma(_2871, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2935);
    float _2947 = fma(_2871, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2937);
    float _2949 = fma(_2933, _2941, -0.212114393711090087890625);
    float _2951 = _2909 * 0.693147182464599609375;
    float _2953 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2945);
    float _2955 = fma(_2933, _2949, 1.570728778839111328125);
    float _2957 = sqrt(_2931);
    float _2959 = -_2901;
    float _2961 = fma(_2927, _2939, _2959);
    float _2963 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2947);
    float _2965 = _2951 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2967 = fma(_2961, 0.5, 0.5);
    float _2969 = _2953 * _2943;
    float _2971 = _2963 * _2943;
    float _2973 = fma(_2969, 0.5, 0.5);
    float _2975 = fma(_2971, -0.5, 0.5);
    float _2977 = _2957 * 0.636619746685028076171875;
    float3 _7868 = float3(_2973, _2975, _2965);
    float _2979 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7868, float3(0.0), isnan(_7868)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7868, float3(0.0), isnan(_7868)), level(0.0)).x;
    float _2981 = -_2955;
    float _2983 = fma(_2977, _2981, 1.0);
    float3 _7884 = float3(_2973, _2975, _2965);
    float4 _2986 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7884, float3(0.0), isnan(_7884)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7884, float3(0.0), isnan(_7884)), level(0.0)).xyzw;
    float _2988 = _2986.x;
    float _2990 = _2986.y;
    float _2992 = _2986.z;
    float _2994 = _2986.w;
    float2 _7901 = float2(_2983, _2967);
    float3 _2998 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7901, float2(0.0), isnan(_7901)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7901, float2(0.0), isnan(_7901)), level(0.0)).xyz;
    float _3000 = _2998.x;
    float _3002 = _2998.y;
    float _3004 = _2998.z;
    float _3006 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3008 = _2891 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3010 = _2929 * 0.5;
    float _3012 = _2953 + _2929;
    float _3014 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3008);
    float _3016 = exp2(_3006);
    float _3018 = _3012 * 0.5;
    out.m_79.x = _2541;
    out.m_79.y = _2539;
    out.m_79.z = _2543;
    float _3020 = fma(_2871, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3014);
    float _3022 = fma(_2963, -0.5, _3010);
    bool _3024 = _2685 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3026 = isnan(_2685);
    bool _3028 = _3024 || _3026;
    bool _3030 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3032 = _3028 || _3030;
    float _3034 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3020);
    out.m_81.x = _2139;
    out.m_81.y = _2153;
    out.m_81.z = _2157;
    float _3036 = _3034 + _2929;
    out.gl_Position.x = _2953;
    out.gl_Position.y = _2963;
    out.gl_Position.z = _3034;
    out.gl_Position.w = _2929;
    float _3038 = _3036 * 0.5;
    float _3040 = -_3016;
    float _3042 = _3040 + 1.0;
    float _3044 = _3042 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _3018;
    out.m_83.y = _3022;
    out.m_83.z = _3038;
    out.m_83.w = _2929;
    float _3046 = _2953;
    float _3048 = _2963;
    if (!_3032)
    {
        _2173 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3050 = _2173;
    float _3052 = -_3044;
    float _3054 = _3052 + 1.0;
    float _3056 = _3050;
    float _3058 = _3050;
    if (!_3032)
    {
        _2175 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3060 = _2175;
    float _3062 = _3060;
    float _3064 = _3060;
    if (!_3032)
    {
        _3046 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3066 = _3046;
    float _3068 = _3066;
    float _3070 = _3066;
    if (!_3032)
    {
        _3048 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3072 = _3048;
    float _3074 = _3072;
    float _3076 = _3072;
    if (!_3032)
    {
        _2177 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3078 = _2177;
    float _3080 = _3044 * _2979;
    float _3082 = _2603 * _2663;
    float _3084 = _2994 * _3080;
    float _3086 = _2994 * _3054;
    float _3088 = _3082 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3090 = _3004 * _3080;
    float _3092 = fma(_3000, _3084, _2988);
    float _3094 = fma(_3002, _3084, _2990);
    float _3096 = _528 * _3088;
    float _3098 = fma(_2994, _3090, _2992);
    float _3100 = _3088;
    float _3102 = _3078;
    float _3104 = _3078;
    if (!_3032)
    {
        _3100 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3106 = _3100;
    out.m_85.x = _3092;
    out.m_85.y = _3094;
    out.m_85.z = _3098;
    out.m_85.w = _3086;
    bool _3108 = !_3032;
    float _3110 = _3106;
    float _3112 = _3106;
    if (!_3108)
    {
        bool _3114 = _2685 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3116 = isnan(_2685);
        bool _3118 = _3114 || _3116;
        bool _3120 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3122 = _3118 || _3120;
        if (!_3122)
        {
            float _3124 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3126 = _2685 + _3124;
            float _3128 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3130 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3128;
            float _3132 = 1.0 / _3130;
            float _3134 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3136 = _3134 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3138 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3140 = _3138 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3142 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3144 = _3142 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3146 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3148 = _3146 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3150 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3152 = _3150 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3154 = _3126 * _3132;
            float _3156 = precise::clamp(_3154, 0.0, 1.0);
            float _3158 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3160 = _3158 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3162 = fma(_3156, _3136, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3164 = fma(_3156, _3160, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3166 = fma(_3156, _3140, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3168 = fma(_3156, _3144, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3170 = fma(_3156, _3148, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3172 = fma(_3156, _3152, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3076 = _3164;
            _3104 = _3170;
            _3070 = _3162;
            _3064 = _3168;
            _3058 = _3166;
            _3112 = _3172;
            _3174 = true;
        }
        else
        {
            bool _3176 = _2685 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3178 = isnan(_2685);
            bool _3180 = _3176 || _3178;
            bool _3182 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3184 = _3180 || _3182;
            if (!_3184)
            {
                _3068 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3186 = _3068;
            _3070 = _3186;
            if (!_3184)
            {
                _3074 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3188 = _3074;
            _3076 = _3188;
            if (!_3184)
            {
                _3056 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3190 = _3056;
            _3058 = _3190;
            if (!_3184)
            {
                _3062 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3192 = _3062;
            _3064 = _3192;
            if (!_3184)
            {
                _3102 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3194 = _3102;
            _3104 = _3194;
            if (!_3184)
            {
                _3110 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3196 = _3110;
            bool _3198 = !_3184;
            _3112 = _3196;
            if (!_3198)
            {
                bool _3200 = _2685 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3202 = isnan(_2685);
                bool _3204 = _3200 || _3202;
                bool _3206 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3208 = _3204 || _3206;
                if (!_3208)
                {
                    float _3210 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3212 = _2685 + _3210;
                    float _3214 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3216 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3214;
                    float _3218 = 1.0 / _3216;
                    float _3220 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3222 = _3220 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3224 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3226 = _3224 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3228 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3230 = _3228 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3232 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3234 = _3232 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3236 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3238 = _3236 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3240 = _3212 * _3218;
                    float _3242 = precise::clamp(_3240, 0.0, 1.0);
                    float _3244 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3246 = _3244 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3248 = fma(_3242, _3222, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3250 = fma(_3242, _3246, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3252 = fma(_3242, _3226, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3254 = fma(_3242, _3230, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3256 = fma(_3242, _3234, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3258 = fma(_3242, _3238, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3076 = _3250;
                    _3104 = _3256;
                    _3070 = _3248;
                    _3064 = _3254;
                    _3058 = _3252;
                    _3112 = _3258;
                    _3174 = true;
                }
                else
                {
                    _3076 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3104 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3070 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3064 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3058 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3112 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3174 = false;
    float _3260 = _3076;
    float _3262 = _3104;
    float _3264 = _3070;
    float _3266 = _3064;
    float _3268 = _3058;
    float _3270 = _3112;
    float _3272 = fma(_2127, -0.5, 0.5);
    float _3274 = precise::clamp(_3272, 0.0, 1.0);
    float _3276 = -_3260;
    float _3278 = _3276 + _3262;
    float _3280 = _3096 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3282 = -_3264;
    float _3284 = _3282 + _3266;
    out.m_87.x = 0.0;
    float _3286 = fma(_3274, _3278, _3260);
    float _3288 = fma(_3274, _3284, _3264);
    out.m_51.x = _3280;
    float _3290 = -_3268;
    float _3292 = _3290 + _3270;
    float _3294 = _3286 * 0.586610972881317138671875;
    bool _3296 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3298 = fma(_3274, _3292, _3268);
    float _3300 = fma(_3288, 0.298911988735198974609375, _3294);
    bool _3302 = _2603 > 0.0;
    bool _3304 = isnan(_2603);
    bool _3306 = _3302 || _3304;
    bool _3308 = isnan(0.0);
    bool _3310 = _3306 || _3308;
    float _3312 = fma(_3298, 0.114477999508380889892578125, _3300);
    bool _3314 = _2663 <= 0.0;
    bool _3316 = !_3310;
    bool _3318 = _3314 || _3316;
    float _3320 = -_3312;
    float _3322 = _3288 + _3320;
    float _3324 = -_3312;
    float _3326 = _3286 + _3324;
    float _3328 = -_3312;
    float _3330 = _3298 + _3328;
    float _3332 = fma(_3322, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3312);
    float _3334 = fma(_3326, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3312);
    float _3336 = fma(_3330, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3312);
    bool _3338 = !_3296;
    if (!_3338)
    {
        float _3340 = -_2539;
        float _3342 = _3340 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3344 = -_2541;
        float _3346 = _3344 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3348 = -_2543;
        float _3350 = _3348 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3352 = _3342 * _3342;
        float _3354 = fma(_3346, _3346, _3352);
        float _3356 = fma(_3350, _3350, _3354);
        float _3358 = sqrt(_3356);
        float _3360 = rsqrt(_3356);
        float _3362 = -_3358;
        float _3364 = _3362 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3366 = _3364 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3368 = precise::clamp(_3366, 0.0, 1.0);
        float _3370 = _3346 * _3360;
        float _3372 = _3342 * _3360;
        float _3374 = abs(_3368);
        float _3376 = log2(_3374);
        float _3378 = _3350 * _3360;
        float _3380 = _3370 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3382 = _2127 * _3372;
        float _3384 = -_3372;
        float _3386 = -_3380;
        float _3388 = fma(_3384, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3386);
        float _3390 = fma(_2123, _3370, _3382);
        float _3392 = -_3378;
        float _3394 = fma(_3392, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3388);
        float _3396 = fma(_2131, _3378, _3390);
        float _3398 = precise::clamp(_3396, 0.0, 1.0);
        float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3402 = _3394 + _3400;
        float _3404 = _3376 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3406 = _3402 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3408 = precise::clamp(_3406, 0.0, 1.0);
        float _3410 = exp2(_3404);
        float _3412 = _3410 * _3408;
        float _3414 = _3398 * _3412;
        float _3416 = _3414 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3418 = _3414 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3420 = _3414 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3416;
        out.m_87.y = _3418;
        out.m_87.z = _3420;
    }
    out.m_69.x = _3332;
    out.m_69.y = _3334;
    out.m_69.z = _3336;
    if (!_3318)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3422 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3422;
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
    bool _3174 = false;
    bool _564 = false;
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
        float _3491 = as_type<float>(_132);
        out.gl_Position.z = _3491;
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
        float _3546 = as_type<float>(_158);
        out.gl_Position.z = _3546;
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
    float _300 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].x, _294);
    float _302 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].y, _296);
    float _304 = fma(_216, 0.5, 0.5);
    float _306 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _308 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].z, _298);
    bool _310 = _220 < 0.5;
    float _312 = float(_310);
    float _314 = -_220;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _318 = -_304;
    float _320 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _322 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].x, _300);
    float _324 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].y, _302);
    float _326 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].z, _308);
    float _328 = _304;
    float _330 = _302;
    if (!_176)
    {
        float _332 = _112 * _112;
        float _334 = _332 * 0.5;
        _328 = _334;
    }
    float _336 = _328;
    float _338 = fma(_280, _202, _322);
    float _340 = fma(_280, _204, _324);
    float _342 = -_312;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _346 = fma(_280, _206, _326);
    float _348 = _336;
    if (!_176)
    {
        _330 = _112;
    }
    float _350 = _330;
    float _352 = _350;
    if (!_176)
    {
        float _354 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
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
    float _420 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _422 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _424 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _428 = _426 != 0;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _432 = _430 != 0;
    float _434 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _436 = fma(_338, _282, _288);
    float _438 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[8].y, _424);
    float _440 = fma(_340, _282, _290);
    float _442 = fma(_346, _282, _292);
    float _444 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _446 = !_428;
    int _448 = _446 ? 0 : 1;
    float _450 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[8].x, _434);
    float _452 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[10].y, _438);
    float _454 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[8].z, _444);
    int _456 = abs(_448);
    float _458 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[10].x, _450);
    bool _460 = !_180;
    int _462 = _460 ? 0 : 1;
    float _464 = fma(_416, _204, _452);
    float _466 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[10].z, _454);
    float _468 = float(_456);
    float _470 = 1.0 / _146;
    int _472 = abs(_462);
    float _474 = -_464;
    float _476 = _340 + _474;
    bool _478 = !_432;
    int _480 = _478 ? 0 : 1;
    float _482 = fma(_416, _202, _458);
    bool _484 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _486 = fma(_416, _206, _466);
    float _488 = abs(_316);
    float _490 = _468 * _488;
    int _492 = abs(_480);
    float _494 = _476 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _496 = _476 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _498 = -_482;
    float _500 = _338 + _498;
    float _502 = _476 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _504 = float(_472);
    float _506 = -_486;
    float _508 = _346 + _506;
    float _510 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[4].x, _494);
    float _512 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[5].x, _496);
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[6].x, _502);
    float _516 = float(_492);
    float _518 = fma(_504, _320, _490);
    float _520 = fma(_508, (*spvDescriptorSet0.vp_c10)._m0[4].z, _510);
    float _522 = fma(_508, (*spvDescriptorSet0.vp_c10)._m0[5].z, _512);
    float _524 = fma(_508, (*spvDescriptorSet0.vp_c10)._m0[6].z, _514);
    float _526 = abs(_344);
    float _528 = fma(_516, _526, _518);
    float _530 = _112 * _470;
    bool _532 = !_484;
    float _534 = _530;
    float _536 = _522;
    float _538 = _520;
    float _540 = _524;
    float _542 = _520;
    float _544 = _482;
    float _546 = _486;
    float _562;
    if (!_532)
    {
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _550 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[12].x, _112);
        float _554 = _552 * _548;
        float _556 = floor(_554);
        float _558 = -_556;
        float _560 = _554 + _558;
        _562 = _560;
        _564 = true;
    }
    else
    {
        _562 = _530;
    }
    _564 = false;
    float _566 = _562;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _570 = _566 + _568;
    float _572 = in.m_55.x;
    float _574 = in.m_55.y;
    float _576 = in.m_55.z;
    bool _578 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _580 = isnan(_566);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _590;
    bool _594 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _596 = isnan(_566);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -_588;
    float _608 = _606 + 1.0;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _610;
    float _614 = 1.0 / _592;
    bool _616 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _618 = _604 * _608;
    float _620 = -_604;
    float _622 = _620 + 1.0;
    float _624 = _570 * _614;
    float _626 = fma(_612, _624, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _632;
    float _636 = _626 * _618;
    float _638 = fma(_630, _624, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _640 = fma(_634, _624, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _642 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].x, _636);
    float _644 = _638 * _618;
    float _646 = _640 * _618;
    float _648 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[144].x, _642);
    float _650 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].y, _644);
    float _652 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].z, _646);
    float _654 = _648 * _572;
    float _656 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[144].y, _650);
    float _658 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[144].z, _652);
    float _660 = _656 * _574;
    float _662 = _658 * _576;
    bool _664 = !_616;
    float _666 = _622;
    if (!_664)
    {
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _670 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[11].y, _112);
        float _674 = _672 * _668;
        float _676 = floor(_674);
        float _678 = -_676;
        float _680 = _674 + _678;
        _534 = _680;
    }
    float _682 = _534;
    float _684 = in.m_57.x;
    float _686 = _160 * 2.0;
    float _688 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _690 = int(_688);
    float _692 = in.m_53.y;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _696 = _694 != 0;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _700 = _682 + _698;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _704 = _702 != 0;
    float _706 = in.m_57.y;
    bool _708 = _160 > 0.5;
    bool _710 = _708 && _696;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _714 = _682 + _712;
    float _716 = floor(_686);
    float _718 = in.m_53.z;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _722 = _682 + _720;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _728 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _730 = int(_728);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _740 = _684;
    if (_696)
    {
        _666 = _684;
    }
    float _742 = _666;
    float _744 = _654 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _746 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _748 = log2(_746);
    bool _750 = _692 > 0.5;
    float _752 = _742;
    if (_710)
    {
        float _754 = -_742;
        float _756 = _754 + 1.0;
        _752 = _756;
    }
    float _758 = _752;
    float _760 = _692 * 2.0;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _762;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _772 = _770 != 0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _776 = _774 != 0;
    float _778 = -_706;
    float _780 = _778 + 1.0;
    float _782 = _706;
    if (_696)
    {
        _740 = _758;
    }
    float _784 = _740;
    float _786 = _440 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _790 = _788 != 0;
    float _792 = 1.0 / _726;
    bool _794 = !_772;
    int _796 = _794 ? 0 : 1;
    float _798 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[5].x, _786);
    bool _800 = _716 >= 0.0;
    bool _802 = isnan(_716);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    float _810 = _718 * 2.0;
    if (_704)
    {
        float _812 = _750 ? _780 : _706;
        _782 = _812;
    }
    float _814 = _782;
    float _816 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[5].z, _798);
    int _818 = _808 ? 0 : 1;
    float _820 = floor(_760);
    bool _822 = _716 > 0.0;
    float _824 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _826 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _828 = float(_690);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _836 = _834 != 0;
    float _838 = _440 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _840 = 1.0 / _828;
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _844 = _842 != 0;
    float _846 = _440 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _848 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[4].x, _838);
    float _850 = _692 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _852 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _854 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[6].x, _846);
    float _856 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[4].z, _848);
    float _858 = 1.0 / _832;
    float _860 = fma(_850, -2.0, _732);
    float _862 = -_734;
    float _864 = fma(_852, 2.0, _862);
    float _866 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[6].z, _854);
    int _868 = ~_818;
    int _870 = _868 + 1;
    int _872 = _870 + 1;
    float _874 = _764 * _792;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _876;
    float _880 = _112 * _840;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _886 = _872;
    if (!_822)
    {
        int _888 = ~_818;
        int _890 = _888 + 1;
        _886 = _890;
    }
    int _892 = _886;
    float _894 = 1.0 / _738;
    float _896 = float(uint(_730));
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _904 = _884 * _858;
    float _906 = _112 * _748;
    float _908 = 1.0 / _896;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _912 = _898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _914 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _916 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _918 = !_836;
    float _920 = _918 ? 7.345489978790283203125 : 1.0;
    float _922 = _856 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _924 = trunc(_880);
    int _926 = int(_924);
    out.m_59.x = _912;
    out.m_59.y = _914;
    out.m_59.z = _916;
    out.m_59.w = _910;
    bool _928 = _820 >= 0.0;
    bool _930 = isnan(_820);
    bool _932 = _928 || _930;
    bool _934 = isnan(0.0);
    bool _936 = _932 || _934;
    float _938 = _878 * _894;
    bool _940 = !_768;
    int _942 = _940 ? 0 : 1;
    float _944 = _920 * _160;
    bool _946 = !_776;
    int _948 = _946 ? 0 : 1;
    float _950 = fma(_938, _700, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _952 = floor(_810);
    float _954 = _866 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _958 = _956 != 0;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _962 = _960 != 0;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _966 = _964 != 0;
    float _968 = fma(_874, _722, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _970 = as_type<int>(_908) + (-2);
    float _972 = _160 + _718;
    float _974 = exp2(_906);
    float _976 = float(_730);
    float _978 = _692 + _718;
    float _980 = _160 + _692;
    float _982 = _972 + (-1.0);
    int _984 = _936 ? 0 : 1;
    float _986 = _112 * _976;
    float _988 = _978 + (-1.0);
    float _990 = _980 + (-1.0);
    bool _992 = _952 >= 0.0;
    bool _994 = isnan(_952);
    bool _996 = _992 || _994;
    bool _998 = isnan(0.0);
    bool _1000 = _996 || _998;
    float _1002 = _986 * _470;
    float _1004 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1006 = float(uint(_926));
    float _1008 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1010 = !_958;
    int _1012 = _1010 ? 0 : 1;
    float _1014 = floor(_944);
    float _1016 = -_974;
    float _1018 = _1016 + 1.0;
    float _1020 = as_type<float>(_970) * _1006;
    bool _1022 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1024 = isnan(0.0);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1030 = _1026 || _1028;
    float _1032 = _1030 ? _1018 : 0.0;
    float _1034 = trunc(_1020);
    float _1036 = precise::max(_1034, 0.0);
    uint _1039 = uint(_1036);
    bool _1041 = _952 > 0.0;
    float _1043 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1045 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1047 = isnan(_682);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1053 = _1049 || _1051;
    float _1055 = float(_1053);
    bool _1057 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1059 = isnan(_682);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(_1065);
    int _1069 = _1000 ? 0 : 1;
    float _1071 = -_1055;
    float _1073 = _1071 + 1.0;
    int _1075 = ~_730;
    int _1077 = _1075 + 1;
    float _1079 = -_1014;
    float _1081 = _944 + _1079;
    bool _1083 = _820 > 0.0;
    float _1085 = _1067 * _1073;
    bool _1087 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1089 = isnan(_682);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1095 = _1091 || _1093;
    float _1097 = float(_1095);
    float _1099 = -_1067;
    float _1101 = _1099 + 1.0;
    float _1103 = _1081 * _976;
    bool _1105 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1107 = isnan(_682);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1113 = _1109 || _1111;
    float _1115 = float(_1113);
    float _1117 = _1097 * _1101;
    float _1119 = -_1097;
    float _1121 = _1119 + 1.0;
    int _1123 = _1077 * int(_1039);
    int _1125 = _1123 + _926;
    bool _1127 = !_962;
    int _1129 = _1127 ? 0 : 1;
    float _1131 = trunc(_1002);
    int _1133 = int(_1131);
    float _1135 = _1115 * _1121;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1139 = 1.0 + _1137;
    float _1141 = float(uint(_1125));
    float _1143 = fma(_904, _714, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1145 = _950 * _1135;
    float _1147 = -_1115;
    float _1149 = _1147 + 1.0;
    int _1151 = abs(_1129);
    float _1153 = 1.0 / _1139;
    float _1155 = as_type<float>(_970) * _1141;
    float _1157 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1145);
    float _1159 = float(_892);
    float _1161 = in.m_61.x;
    float _1163 = in.m_61.y;
    float _1165 = in.m_61.z;
    float _1167 = float(_1151);
    int _1169 = ~_1069;
    int _1171 = _1169 + 1;
    int _1173 = _1171 + 1;
    float _1175 = trunc(_1155);
    float _1177 = precise::max(_1175, 0.0);
    uint _1179 = uint(_1177);
    int _1181 = abs(_1012);
    float _1183 = _1167 * _1159;
    int _1185 = _1173;
    if (!_1041)
    {
        int _1187 = ~_1069;
        int _1189 = _1187 + 1;
        _1185 = _1189;
    }
    int _1191 = _1185;
    float _1193 = fma(_1143, _1117, _1157);
    int _1195 = ~_984;
    int _1197 = _1195 + 1;
    int _1199 = _1197 + 1;
    float _1201 = _1183 * (-2.0);
    int _1203 = _1199;
    if (!_1083)
    {
        int _1205 = ~_984;
        int _1207 = _1205 + 1;
        _1203 = _1207;
    }
    int _1209 = _1203;
    float _1211 = _1032 * _1153;
    float _1213 = float(_926);
    float _1215 = fma(_1043, _1201, _1043);
    float _1217 = float(_1181);
    float _1219 = _692 + (-0.5);
    bool _1221 = _1213 >= _976;
    bool _1223 = isnan(_1213);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan(_976);
    bool _1229 = _1225 || _1227;
    float _1231 = float(_1229);
    float _1233 = fma(_968, _1085, _1193);
    float _1235 = float(_1191);
    int _1237 = ~_730;
    int _1239 = _1237 + 1;
    int _1241 = int(_1039) + int(_1179);
    float _1243 = _1217 * _1235;
    float _1245 = fma(_1201, _1163, _1163);
    bool _1247 = !_790;
    int _1249 = _1247 ? 0 : 1;
    int _1251 = _1239 * _1241;
    int _1253 = _1251 + _926;
    float _1255 = trunc(_1103);
    int _1257 = int(_1255);
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1261 = _1243 * (-2.0);
    bool _1263 = !_966;
    int _1265 = _1263 ? 0 : 1;
    float _1267 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1245);
    bool _1269 = uint(_1253) >= uint(_730);
    float _1271 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1259);
    int _1273 = abs(_1249);
    float _1275 = trunc(_1231);
    int _1277 = int(_1275);
    bool _1279 = !_1269;
    int _1281 = _1279 ? 0 : (-1);
    float _1283 = fma(_1261, _1161, _1161);
    float _1285 = _816 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1287 = ~_1241;
    int _1289 = _1287 + _1281;
    int _1291 = _1289 + 1;
    float _1293 = fma(_1008, _1261, _1008);
    int _1295 = _1257 * _1273;
    int _1297 = _1295 + _926;
    float _1299 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1301 = _1285 + _1299;
    int _1303 = _730 * _1291;
    int _1305 = _1303 + _926;
    bool _1307 = _730 == 0;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1313 = _922 + _1311;
    float _1315 = _1301 * _1301;
    float _1317 = _160 + (-0.5);
    int _1319 = ~_1277;
    int _1321 = _1319 + 1;
    int _1323 = _1321 + 1;
    float _1325 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1309);
    bool _1327 = !_1307;
    int _1329 = _1327 ? _1305 : (-1);
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1333 = _954 + _1331;
    bool _1335 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1337 = isnan(1.0);
    bool _1339 = _1335 || _1337;
    bool _1341 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1343 = _1339 || _1341;
    float _1345 = fma(_1313, _1313, _1315);
    int _1347 = abs(_1265);
    float _1349 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1283);
    int _1351 = _1329 * _1323;
    int _1353 = _730 + (-1);
    float _1355 = fma(_1333, _1333, _1345);
    bool _1357 = !_1343;
    float _1359 = _1357 ? _112 : _1211;
    float _1361 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1271);
    float _1363 = float(_1347);
    int _1365 = _1277 * _1353;
    int _1367 = _1365 + _1351;
    float _1369 = float(_1209);
    float _1371 = rsqrt(_1355);
    int _1373 = abs(_796);
    float _1375 = fma(_1359, _1215, _1267);
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1379 = _1377 != 0;
    float _1381 = _1363 * _1369;
    int _1383 = abs(_942);
    int _1385 = _1367 * _1373;
    bool _1387 = !_1379;
    int _1389 = _1387 ? 0 : 1;
    float _1391 = sqrt(_1355);
    float _1393 = _1375 * 0.15915493667125701904296875;
    float _1395 = fma(_1359, _1293, _1349);
    int _1397 = abs(_1389);
    float _1399 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1325);
    float _1401 = float(uint(_1297));
    float _1403 = _1395 * 0.15915493667125701904296875;
    int _1405 = ~_730;
    int _1407 = _1405 + 1;
    float _1409 = _1393 * 6.283185482025146484375;
    float _1411 = sin(_1409);
    int _1413 = abs(_948);
    float _1415 = as_type<float>(_970) * _1401;
    float _1417 = _744 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1419 = _1133 * _1383;
    int _1421 = _1419 + _1385;
    float _1423 = _1381 * (-2.0);
    float _1425 = _1391 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _1427 = _1297 * _1413;
    int _1429 = _1427 + _1421;
    float _1431 = _1393 * 6.283185482025146484375;
    float _1433 = cos(_1431);
    int _1435 = _1257 * _1397;
    int _1437 = _1435 + _1429;
    float _1439 = fma(_1004, _1423, _1004);
    float _1441 = fma(_1423, _1165, _1165);
    float _1443 = _718 + (-0.5);
    float _1445 = precise::min(_1417, _1425);
    float _1447 = trunc(_1415);
    float _1449 = precise::max(_1447, 0.0);
    uint _1451 = uint(_1449);
    float _1453 = float(uint(_1437));
    float _1455 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1441);
    float _1457 = in.m_63.x;
    float _1459 = in.m_63.y;
    float _1461 = in.m_63.z;
    float _1463 = _1371 * _1445;
    float _1465 = as_type<float>(_970) * _1453;
    float _1467 = fma(_1359, _1439, _1455);
    float _1469 = _1301 * _1463;
    float _1471 = _1313 * _1463;
    float _1473 = trunc(_1465);
    float _1475 = precise::max(_1473, 0.0);
    uint _1477 = uint(_1475);
    int _1479 = ~_730;
    int _1481 = _1479 + 1;
    float _1483 = -_1469;
    float _1485 = _1301 + _1483;
    float _1487 = -_1471;
    float _1489 = _1313 + _1487;
    float _1491 = _1467 * 0.15915493667125701904296875;
    float _1493 = _1485 * _1485;
    int _1495 = _1407 * int(_1451);
    int _1497 = _1495 + _1297;
    float _1499 = _1403 * 6.283185482025146484375;
    float _1501 = sin(_1499);
    float _1503 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1505 = _1333 * _1463;
    float _1507 = fma(_1489, _1489, _1493);
    float _1509 = float(uint(_1497));
    float _1511 = in.m_65.x;
    float _1513 = in.m_65.y;
    float _1515 = in.m_65.z;
    float _1517 = -_1505;
    float _1519 = _1333 + _1517;
    float _1521 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _860);
    int _1523 = _1481 * int(_1477);
    int _1525 = _1523 + _1437;
    bool _1527 = _1459 != 0.0;
    bool _1529 = isnan(_1459);
    bool _1531 = _1527 || _1529;
    bool _1533 = isnan(0.0);
    bool _1535 = _1531 || _1533;
    float _1537 = _1403 * 6.283185482025146484375;
    float _1539 = cos(_1537);
    float _1541 = fma(_1519, _1519, _1507);
    float _1543 = -_1521;
    float _1545 = fma(_1361, _1503, _1543);
    float _1547 = float(uint(_1525));
    float _1549 = as_type<float>(_970) * _1509;
    bool _1551 = _1457 == 0.0;
    bool _1553 = !_1535;
    bool _1555 = _1551 && _1553;
    float _1557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1461);
    float _1559 = as_type<float>(_970) * _1547;
    float _1561 = _1491 * 6.283185482025146484375;
    float _1563 = sin(_1561);
    bool _1565 = _1461 == 0.0;
    bool _1567 = _1565 && _1555;
    float _1569 = -_112;
    float _1571 = fma(_1569, (*spvDescriptorSet0.vp_c9)._m0[76].x, _864);
    float _1573 = _1545 + 0.5;
    float _1575 = _1501 * _1411;
    float _1577 = fma(_1399, _824, _1571);
    float _1579 = _1539 * _1433;
    float _1581 = sqrt(_1541);
    float _1583 = _1501 * _1433;
    float _1585 = _1577 + 0.5;
    float _1587 = _1515;
    float _1589 = _1513;
    float _1591 = _1511;
    if (!_1567)
    {
        float _1593 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1515);
        _1587 = _1593;
    }
    float _1595 = _1587;
    float _1597 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1233);
    float _1599 = trunc(_1559);
    float _1601 = precise::max(_1599, 0.0);
    uint _1603 = uint(_1601);
    float _1605 = fma(_1563, _1579, _1575);
    float _1607 = _1539 * _1411;
    float _1609 = fma(_1563, _1575, _1579);
    int _1611 = ~_730;
    int _1613 = _1611 + 1;
    out.m_67.x = _1585;
    out.m_67.y = _1573;
    if (!_1567)
    {
        float _1615 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1513);
        _1589 = _1615;
    }
    float _1617 = _1589;
    if (!_1567)
    {
        float _1619 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1511);
        _1591 = _1619;
    }
    float _1621 = _1591;
    float _1623 = _1491 * 6.283185482025146484375;
    float _1625 = cos(_1623);
    float _1627 = _1371 * _1581;
    float _1629 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1459);
    float _1631 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1457);
    float _1633 = _744 * _1627;
    float _1635 = _662 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1637 = int(_1477) + int(_1603);
    float _1639 = -_1607;
    float _1641 = fma(_1563, _1583, _1639);
    float _1643 = -_1583;
    float _1645 = fma(_1563, _1607, _1643);
    float _1647 = _826 * _1627;
    float _1649 = _1635 * _1627;
    int _1651 = _1613 * _1637;
    int _1653 = _1651 + _1437;
    float _1655 = trunc(_1549);
    float _1657 = precise::max(_1655, 0.0);
    uint _1659 = uint(_1657);
    float _1661 = _1647 * _1629;
    float _1663 = _1539 * _1625;
    float _1665 = _1649 * _1557;
    bool _1667 = uint(_1653) >= uint(_730);
    float _1669 = _1501 * _1625;
    float _1671 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1673 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1675 = !_1667;
    int _1677 = _1675 ? 0 : (-1);
    float _1679 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1681 = -_1563;
    float _1683 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1671);
    float _1685 = -_1563;
    float _1687 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1673);
    int _1689 = ~_1637;
    int _1691 = _1689 + _1677;
    int _1693 = _1691 + 1;
    float _1695 = -_1563;
    float _1697 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1679);
    float _1699 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1683);
    float _1701 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1687);
    float _1703 = _1433 * _1625;
    int _1705 = _730 * _1693;
    int _1707 = _1705 + _1437;
    float _1709 = -_1661;
    float _1711 = _1563 * _1709;
    float _1713 = _1663 * _1661;
    float _1715 = _1633 * _1631;
    float _1717 = _1669 * _1661;
    bool _1719 = !_1307;
    int _1721 = _1719 ? _1707 : (-1);
    float _1723 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1697);
    int _1725 = int(_1451) + int(_1659);
    float _1727 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1729 = ~_730;
    int _1731 = _1729 + 1;
    float _1733 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1735 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1737 = fma(_1703, _1715, _1711);
    float _1739 = fma(_1605, _1715, _1713);
    float _1741 = _1411 * _1625;
    float _1743 = fma(_1641, _1715, _1717);
    float _1745 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1747 = _1721 >> 31;
    float _1749 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1727);
    float _1751 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1733);
    float _1753 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1735);
    float _1755 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1757 = _1731 * _1725;
    int _1759 = _1757 + _1297;
    float _1761 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1745);
    int _1763 = _1747 & 3;
    float _1765 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1767 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1755);
    float _1769 = fma(_1645, _1665, _1739);
    float _1771 = fma(_1741, _1665, _1737);
    bool _1773 = uint(_1759) >= uint(_730);
    float _1775 = _1701 * _1617;
    int _1777 = _1721 + _1763;
    float _1779 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1781 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1765);
    float _1783 = fma(_1609, _1665, _1743);
    int _1785 = _1777 >> 2;
    float _1787 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1779);
    float _1789 = _1699 * _1617;
    float _1791 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1793 = _1785 << 4;
    int _1795 = _1793 + 368;
    float _1797 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1787);
    float _1799 = _1723 * _1617;
    float _1801 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1791);
    uint _1803 = uint(int(uint(_1795) >> uint(2)));
    uint _1805 = uint(int(uint(int(_1803)) >> uint(2)));
    int _1807 = int(_1803) & 3;
    float _1809 = (*spvDescriptorSet0.vp_c9)._m0[int(_1805)][_1807];
    int _1811 = int(_1803) + 1;
    uint _1813 = uint(int(uint(_1811) >> uint(2)));
    int _1815 = _1811 & 3;
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[int(_1813)][_1815];
    float _1819 = _1797 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1821 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1749);
    float _1823 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1801);
    float _1825 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1751);
    float _1827 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1753);
    float _1829 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1761);
    float _1831 = _1823 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1833 = _1795 + 8;
    uint _1835 = uint(int(uint(_1833) >> uint(2)));
    uint _1837 = uint(int(uint(int(_1835)) >> uint(2)));
    int _1839 = int(_1835) & 3;
    float _1841 = (*spvDescriptorSet0.vp_c9)._m0[int(_1837)][_1839];
    int _1843 = int(_1835) + 1;
    uint _1845 = uint(int(uint(_1843) >> uint(2)));
    int _1847 = _1843 & 3;
    float _1849 = (*spvDescriptorSet0.vp_c9)._m0[int(_1845)][_1847];
    float _1851 = _954 + _1819;
    int _1853 = _1721 & 3;
    bool _1855 = _1853 != 0;
    float _1857 = _922 + _1831;
    int _1859 = _1721 & 3;
    bool _1861 = _1859 != 0;
    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1865 = _1851 + _1863;
    bool _1867 = uint(_1853) > 1u;
    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1871 = _1857 + _1869;
    float _1873 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1767);
    float _1875 = _1865 * _1865;
    float _1877 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1781);
    float _1879 = fma(_1821, _1621, _1775);
    int _1881 = _1861 ? 0 : 1;
    float _1883 = fma(_1871, _1871, _1875);
    bool _1885 = uint(_1853) >= 2u;
    float _1887 = fma(_1825, _1621, _1789);
    int _1889 = ~_1881;
    int _1891 = _1889 + 1;
    int _1893 = _1891 + 1;
    float _1895 = sqrt(_1883);
    int _1897 = _1885 ? 0 : 1;
    float _1899 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1901 = _1893;
    float _1903 = as_type<float>(_1853);
    float _1905 = _1857;
    if (!_1867)
    {
        int _1907 = ~_1881;
        int _1909 = _1907 + 1;
        _1901 = _1909;
    }
    int _1911 = _1901;
    float _1913 = fma(_1827, _1621, _1799);
    bool _1915 = _1853 != 3;
    float _1917 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1899);
    bool _1919 = !_1855;
    int _1921 = _1919 ? 0 : 1;
    int _1923 = abs(_1911);
    int _1925 = abs(_1921);
    float _1927 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1917);
    bool _1929 = _1853 != 3;
    int _1931 = ~_1923;
    int _1933 = _1931 + 1;
    int _1935 = _1933 + 1;
    float _1937 = _1927 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1939 = ~_1897;
    int _1941 = _1939 + 1;
    int _1943 = _1941 + 1;
    float _1945 = _1285 + _1937;
    bool _1947 = _1895 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1949 = _1935 * as_type<int>(_1817);
    int _1951 = _1943;
    if (_1915)
    {
        int _1953 = ~_1897;
        int _1955 = _1953 + 1;
        _1951 = _1955;
    }
    int _1957 = _1951;
    bool _1959 = !_1929;
    int _1961 = _1959 ? 0 : (-1);
    int _1963 = ~_1925;
    int _1965 = _1963 + 1;
    int _1967 = _1965 + 1;
    int _1969 = abs(_1957);
    bool _1971 = !_844;
    int _1973 = _1971 ? 0 : 1;
    int _1975 = _1967 * as_type<int>(_1809);
    int _1977 = _1975 + _1949;
    int _1979 = abs(_1961);
    int _1981 = ~_1969;
    int _1983 = _1981 + 1;
    int _1985 = _1983 + 1;
    int _1987 = abs(_1973);
    bool _1989 = !_1773;
    int _1991 = _1989 ? 0 : (-1);
    int _1993 = _1985 * as_type<int>(_1841);
    int _1995 = _1993 + _1977;
    float _1997 = as_type<float>(_1985);
    if (!_1947)
    {
        _1903 = _1857;
    }
    float _1999 = _1903;
    int _2001 = ~_1725;
    int _2003 = _2001 + _1991;
    int _2005 = _2003 + 1;
    float _2007 = _1999;
    if (!_1947)
    {
        _1905 = _1851;
    }
    float _2009 = _1905;
    int _2011 = ~_1979;
    int _2013 = _2011 + 1;
    int _2015 = _2013 + 1;
    float _2017 = _2009;
    if (!_1947)
    {
        _1997 = _1945;
    }
    float _2019 = _1997;
    bool _2021 = !_1947;
    float _2023 = _2019;
    if (!_2021)
    {
        float _2025 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2027 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2029 = _1895 + _2027;
        float _2031 = rsqrt(_1883);
        float _2033 = _2029 * _2025;
        float _2035 = _1945 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2037 = _2033 * 0.15915493667125701904296875;
        float _2039 = _2037 * 6.283185482025146484375;
        float _2041 = cos(_2039);
        float _2043 = _2037 * 6.283185482025146484375;
        float _2045 = sin(_2043);
        float _2047 = _2041 + (-1.0);
        float _2049 = _2047 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2051 = fma(_2045, _2035, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2053 = fma(_1945, _2041, _2049);
        float _2055 = _2031 * _2051;
        float _2057 = fma(_1871, _2055, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2059 = fma(_1865, _2055, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2023 = _2053;
        _2007 = _2057;
        _2017 = _2059;
    }
    float _2061 = _2023;
    float _2063 = _2007;
    float _2065 = _2017;
    float _2067 = -_1285;
    float _2069 = _2067 + _2061;
    int _2071 = ~_1987;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    int _2077 = _2015 * as_type<int>(_1849);
    int _2079 = _2077 + _1995;
    float _2081 = -_922;
    float _2083 = _2081 + _2063;
    float _2085 = _2069 * _2069;
    int _2087 = _730 * _2005;
    int _2089 = _2087 + _1297;
    float _2091 = -_954;
    float _2093 = _2091 + _2065;
    int _2095 = _2079 * _2075;
    float _2097 = fma(_2083, _2083, _2085);
    out.m_69.w = _1445;
    bool _2099 = !_1307;
    int _2101 = _2099 ? _2089 : (-1);
    float _2103 = fma(_2093, _2093, _2097);
    float _2105 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2107 = sqrt(_2103);
    int _2109 = _2101 * _1987;
    int _2111 = _2109 + _2095;
    float _2113 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2115 = _1597 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2119 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2121 = _2113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2123 = fma(_1829, _1595, _1879);
    float _2125 = _2117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2127 = fma(_1873, _1595, _1887);
    float _2129 = float(_2111);
    float _2131 = fma(_1877, _1595, _1913);
    out.m_71.x = _1633;
    float _2133 = -_1471;
    float _2135 = _2133 + _2063;
    float _2137 = -_1471;
    float _2139 = _922 + _2137;
    out.m_73.x = _2119;
    out.m_73.y = _2121;
    out.m_73.z = _2125;
    out.m_73.w = _2115;
    bool _2141 = _2107 > 0.0;
    float _2143 = -_1469;
    float _2145 = _2143 + _2061;
    float _2147 = -_1505;
    float _2149 = _2147 + _2065;
    out.m_75.x = _2129;
    float _2151 = -_1469;
    float _2153 = _1285 + _2151;
    float _2155 = -_1505;
    float _2157 = _954 + _2155;
    out.m_77.x = _2123;
    out.m_77.y = _2127;
    out.m_77.z = _2131;
    bool _2159 = !_2141;
    float _2161 = _2115;
    float _2163 = _2119;
    float _2165 = _2121;
    float _2167 = _2135;
    float _2169 = _2149;
    float _2171 = _2145;
    float _2173 = _2157;
    float _2175 = _2153;
    float _2177 = _2139;
    if (!_2159)
    {
        bool _2179 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2181 = _2125;
        if (_2179)
        {
            float _2183 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2181 = _2183;
        }
        float _2185 = _2181;
        if (_2179)
        {
            float _2187 = _520 * _2185;
            _2161 = _2187;
        }
        float _2189 = _2161;
        float _2191 = _2189;
        if (_2179)
        {
            float _2193 = _522 * _2185;
            _2163 = _2193;
        }
        float _2195 = _2163;
        float _2197 = _2195;
        if (_2179)
        {
            float _2199 = _524 * _2185;
            _2165 = _2199;
        }
        float _2201 = _2165;
        float _2203 = _2201;
        if (!_2179)
        {
            float _2205 = _112 + 1.0;
            if (!_176)
            {
                float _2207 = _2205 * _2205;
                float _2209 = _2207 * 0.5;
                _122 = _2209;
            }
            float _2211 = _122;
            float _2213 = _2211;
            if (!_176)
            {
                float _2215 = _2211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2213 = _2215;
            }
            float _2217 = _2213;
            bool _2219 = !_176;
            float _2221 = _2217;
            if (!_2219)
            {
                float _2223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2225 = log2(_2223);
                float _2227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2229 = 1.0 + _2227;
                float _2231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2233 = _2225 * _2205;
                float _2235 = 1.0 / _2229;
                float _2237 = _2231 * 0.693147182464599609375;
                float _2239 = exp2(_2233);
                float _2241 = 1.0 / _2237;
                float _2243 = _2239 + (-1.0);
                float _2245 = -_2243;
                float _2247 = fma(_2245, _2241, _2205);
                float _2249 = _2247 * _2235;
                float _2251 = _2249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2221 = _2251;
            }
            float _2253 = _2221;
            float _2255 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2257 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2259 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2261 = _2253;
            if (!_176)
            {
                _2261 = _2205;
            }
            float _2263 = _2261;
            float _2265 = _2255 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2267 = _2255 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2269 = _2255 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2271 = fma(_2257, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2265);
            float _2273 = fma(_2257, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2267);
            float _2275 = fma(_2259, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2271);
            bool _2277 = !_176;
            float _2279 = _2263;
            if (!_2277)
            {
                float _2281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2283 = log2(_2281);
                float _2285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2287 = 1.0 + _2285;
                float _2289 = 1.0 / _2287;
                float _2291 = _2283 * _2205;
                float _2293 = exp2(_2291);
                float _2295 = -_2293;
                float _2297 = _2295 + 1.0;
                float _2299 = _2297 * _2289;
                _2279 = _2299;
            }
            float _2301 = _2279;
            float _2303 = fma(_2257, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2269);
            float _2305 = fma(_2301, _204, _2275);
            float _2307 = fma(_2259, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2273);
            float _2309 = fma(_2259, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2303);
            float _2311 = -_464;
            float _2313 = _2311 + _2305;
            float _2315 = fma(_2301, _202, _2307);
            float _2317 = fma(_2301, _206, _2309);
            float _2319 = _2313 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2321 = _2313 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2323 = -_482;
            float _2325 = _2323 + _2315;
            float _2327 = _2313 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2329 = -_486;
            float _2331 = _2329 + _2317;
            float _2333 = fma(_2325, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2319);
            float _2335 = fma(_2325, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2321);
            float _2337 = fma(_2325, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2327);
            float _2339 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2333);
            float _2341 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2335);
            float _2343 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2337);
            _536 = _2341;
            _538 = _2339;
            _540 = _2343;
            _2191 = _2339;
            _2197 = _2341;
            _2203 = _2343;
        }
        float _2345 = _536;
        float _2347 = _538;
        float _2349 = _540;
        float _2351 = _2191;
        float _2353 = _2197;
        float _2355 = _2203;
        float _2357 = _2345 * _2345;
        float _2359 = rsqrt(_2103);
        float _2361 = fma(_2347, _2347, _2357);
        float _2363 = fma(_2349, _2349, _2361);
        float _2365 = sqrt(_2363);
        float _2367 = _2083 * _2359;
        float _2369 = _2069 * _2359;
        float _2371 = _2093 * _2359;
        bool _2373 = _2365 > 0.0;
        bool _2375 = !_2373;
        _542 = _2347;
        _124 = _2367;
        _544 = _2363;
        if (!_2375)
        {
            float _2377 = rsqrt(_2363);
            float _2379 = _2377 * _2345;
            float _2381 = _2377 * _2347;
            float _2383 = _2377 * _2349;
            float _2385 = _2369 * _2379;
            float _2387 = fma(_2367, _2381, _2385);
            float _2389 = fma(_2371, _2383, _2387);
            float _2391 = _2389 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2393 = fma(_2351, _2391, _2135);
            float _2395 = fma(_2353, _2391, _2145);
            float _2397 = fma(_2355, _2391, _2149);
            _2167 = _2393;
            _2169 = _2397;
            _2171 = _2395;
        }
    }
    float _2399 = _2167;
    float _2401 = _2169;
    float _2403 = _2171;
    float _2405 = _542;
    float _2407 = _124;
    float _2409 = _544;
    float _2411 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2413 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2415 = isnan(0.5);
    bool _2417 = _2413 || _2415;
    bool _2419 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2421 = _2417 || _2419;
    float _2423 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2411);
    bool _2425 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2427 = isnan(0.5);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2433 = _2429 || _2431;
    float _2435 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2423);
    float _2437 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2439 = _2435 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2441 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2437);
    float _2443 = 1.0 / _2439;
    float _2445 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2441);
    float _2447 = _2407;
    float _2449 = _2439;
    float _2451 = _2409;
    float _2453 = _2405;
    if (_2433)
    {
        _2447 = 1.0;
    }
    float _2455 = _2447;
    float _2457 = _2445 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2459 = _2457 + _2439;
    float _2461 = _2455;
    if (_2421)
    {
        _2449 = _2399;
    }
    float _2463 = _2449;
    float _2465 = _2459 * _2443;
    float _2467 = _2465 * 0.5;
    float _2469 = _2443;
    float _2471 = _2467;
    float _2473 = _2463;
    if (_2421)
    {
        _2469 = _2401;
    }
    float _2475 = _2469;
    float _2477 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2479 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2477);
    float _2481 = _2475;
    if (_2421)
    {
        _2471 = _2403;
    }
    float _2483 = _2471;
    float _2485 = 1.0 / _2479;
    float _2487 = _2483;
    if (!_2421)
    {
        float _2489 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2491 = _2153 + _2489;
        float _2493 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2495 = _2139 + _2493;
        float _2497 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2499 = _2491 * _2491;
        float _2501 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2503 = _2157 + _2501;
        float _2505 = fma(_2495, _2495, _2499);
        float _2507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2509 = fma(_2503, _2503, _2505);
        float _2511 = sqrt(_2509);
        float _2513 = _2497 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2515 = -_2153;
        float _2517 = _2515 + _2403;
        float _2519 = precise::min(_2511, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2521 = _2519 * _2507;
        float _2523 = -_2139;
        float _2525 = _2523 + _2399;
        float _2527 = _2513 * _2521;
        float _2529 = -_2157;
        float _2531 = _2529 + _2401;
        float _2533 = fma(_2525, _2527, _2139);
        float _2535 = fma(_2517, _2527, _2153);
        float _2537 = fma(_2531, _2527, _2157);
        _2487 = _2535;
        _2473 = _2533;
        _2481 = _2537;
    }
    float _2539 = _2487;
    float _2541 = _2473;
    float _2543 = _2481;
    if (_2433)
    {
        _2451 = 1.0;
    }
    float _2545 = _2451;
    float _2547 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2549 = _2485 * _2547;
    float _2551 = _2545;
    if (!_2433)
    {
        float _2553 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2555 = _2553 * 0.15915493667125701904296875;
        float _2557 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2559 = _2555 * 6.283185482025146484375;
        float _2561 = cos(_2559);
        float _2563 = _2557 * 0.15915493667125701904296875;
        float _2565 = _2555 * 6.283185482025146484375;
        float _2567 = sin(_2565);
        float _2569 = 1.0 / _2561;
        float _2571 = _2563 * 6.283185482025146484375;
        float _2573 = cos(_2571);
        float _2575 = _2567 * _2569;
        float _2577 = _2563 * 6.283185482025146484375;
        float _2579 = sin(_2577);
        float _2581 = _2573 * _2575;
        float _2583 = 1.0 / _2581;
        float _2585 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2587 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2585;
        float _2589 = 1.0 / _2587;
        float _2591 = _2579 * _2583;
        float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2595 = fma(_2549, _2591, _2593);
        float _2597 = _2595 * _2589;
        float _2599 = precise::clamp(_2597, 0.0, 1.0);
        _546 = _2589;
        _2461 = _2599;
    }
    float _2601 = _546;
    float _2603 = _2461;
    float _2605 = _2601;
    if (!_2433)
    {
        float _2607 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2609 = _2607 * 0.15915493667125701904296875;
        float _2611 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2613 = _2609 * 6.283185482025146484375;
        float _2615 = cos(_2613);
        float _2617 = _2611 * 0.15915493667125701904296875;
        float _2619 = _2609 * 6.283185482025146484375;
        float _2621 = sin(_2619);
        float _2623 = 1.0 / _2615;
        float _2625 = _2617 * 6.283185482025146484375;
        float _2627 = cos(_2625);
        float _2629 = _2621 * _2623;
        float _2631 = _2617 * 6.283185482025146484375;
        float _2633 = sin(_2631);
        float _2635 = _2627 * _2629;
        float _2637 = 1.0 / _2635;
        float _2639 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2641 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2639;
        float _2643 = 1.0 / _2641;
        float _2645 = _2633 * _2637;
        float _2647 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2649 = fma(_2549, _2645, _2647);
        float _2651 = _2649 * _2643;
        float _2653 = precise::clamp(_2651, 0.0, 1.0);
        float _2655 = -_2653;
        float _2657 = _2655 + 1.0;
        _2453 = _2645;
        _2605 = _2635;
        _2551 = _2657;
    }
    float _2659 = _2453;
    float _2661 = _2605;
    float _2663 = _2551;
    float _2665 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2667 = _2539 + _2665;
    float _2669 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2671 = _2541 + _2669;
    float _2673 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2675 = _2543 + _2673;
    float _2677 = _2667 * _2667;
    float _2679 = fma(_2671, _2671, _2677);
    float _2681 = fma(_2675, _2675, _2679);
    float _2683 = rsqrt(_2681);
    float _2685 = sqrt(_2681);
    float _2687 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2689 = _2671 * _2687;
    float _2691 = _2675 * _2687;
    float _2693 = _2689 * _2689;
    float _2695 = _2691 * _2691;
    float _2697 = _2693 + _2695;
    float _2699 = sqrt(_2697);
    bool _2701 = _2699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2705 = _2699 + _2703;
    float _2707 = _2683;
    float _2709 = _2705;
    float _2711 = _2659;
    float _2713 = _2667;
    float _2715 = _2687;
    if (_2701)
    {
        float _2717 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2707 = _2717;
    }
    float _2719 = _2707;
    float _2721 = _2719;
    if (_2701)
    {
        float _2723 = _2705 * _2719;
        _2709 = _2723;
    }
    float _2725 = _2709;
    if (_2701)
    {
        float _2727 = rsqrt(_2697);
        _2721 = _2727;
    }
    float _2729 = _2721;
    float _2731 = _2729;
    if (_2701)
    {
        float _2733 = _2725 * 0.15915493667125701904296875;
        _2711 = _2733;
    }
    float _2735 = _2711;
    float _2737 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2739 = _2675;
    float _2741 = _2735;
    if (_2701)
    {
        float _2743 = _2735 * 6.283185482025146484375;
        float _2745 = sin(_2743);
        _2739 = _2745;
    }
    float _2747 = _2739;
    float _2749 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2751 = _2539 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2753 = precise::max(0.0, _2737);
    float _2755 = _2661;
    float _2757 = _2753;
    if (_2701)
    {
        float _2759 = _2735 * 6.283185482025146484375;
        float _2761 = cos(_2759);
        _2755 = _2761;
    }
    float _2763 = _2755;
    float _2765 = -_2687;
    float _2767 = -_2753;
    float _2769 = fma(_2667, _2765, _2767);
    if (_2701)
    {
        float _2771 = _2769 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2713 = _2771;
    }
    float _2773 = _2713;
    float _2775 = _2747;
    float _2777 = _2773;
    if (_2701)
    {
        float _2779 = fma(_2747, _2773, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2775 = _2779;
    }
    float _2781 = _2775;
    float _2783 = _2781;
    if (!_2701)
    {
        _2777 = _2769;
    }
    float _2785 = _2777;
    float _2787 = _2785;
    if (_2701)
    {
        float _2789 = _2729 * _2781;
        _2715 = _2789;
    }
    float _2791 = _2715;
    if (!_2701)
    {
        _2731 = _2689;
    }
    float _2793 = _2731;
    float _2795 = _2793;
    float _2797 = _2763;
    if (_2701)
    {
        float _2799 = _2763 + (-1.0);
        _2757 = _2799;
    }
    float _2801 = _2757;
    float _2803 = _2801;
    if (_2701)
    {
        float _2805 = _2689 * _2791;
        _2795 = _2805;
    }
    float _2807 = _2795;
    if (!_2701)
    {
        _2783 = _2693;
    }
    float _2809 = _2783;
    float _2811 = _2539 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2813 = _2809;
    if (_2701)
    {
        float _2815 = _2801 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2741 = _2815;
    }
    float _2817 = _2741;
    if (!_2701)
    {
        _2803 = _2691;
    }
    float _2819 = _2803;
    float _2821 = _2819;
    if (_2701)
    {
        float _2823 = _2691 * _2791;
        _2821 = _2823;
    }
    float _2825 = _2821;
    if (_2701)
    {
        float _2827 = _2807 * _2807;
        _2813 = _2827;
    }
    float _2829 = _2813;
    if (_2701)
    {
        float _2831 = fma(_2769, _2763, _2817);
        _2787 = _2831;
    }
    float _2833 = _2787;
    if (!_2701)
    {
        _2797 = _2695;
    }
    float _2835 = _2797;
    float _2837 = _2835;
    if (_2701)
    {
        float _2839 = _2825 * _2825;
        _2837 = _2839;
    }
    float _2841 = _2837;
    float _2843 = _2539 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2845 = fma(_2833, _2833, _2829);
    float _2847 = fma(_2541, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2811);
    float _2849 = fma(_2541, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2843);
    float _2851 = _2845 + _2841;
    float _2853 = fma(_2541, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2751);
    float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2857 = fma(_2685, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2855);
    float _2859 = precise::clamp(_2857, 0.0, 1.0);
    float _2861 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2849);
    float _2863 = rsqrt(_2851);
    float _2865 = _2539 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2867 = -_2859;
    float _2869 = _2867 + 1.0;
    float _2871 = _2861 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2873 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2847);
    float _2875 = fma(_2541, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2865);
    float _2877 = _2871 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2879 = abs(_2869);
    float _2881 = log2(_2879);
    float _2883 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2853);
    float _2885 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2875);
    float _2887 = -_2877;
    float _2889 = fma(_2887, _2749, 1.0);
    float _2891 = _2883 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2893 = _2885 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2895 = _2873 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2897 = _2863 * _2807;
    float _2899 = _2891 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2901 = _2863 * _2833;
    float _2903 = _2863 * _2825;
    float _2905 = _2897 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2907 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2899);
    float _2909 = log2(_2889);
    float _2911 = _2891 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2913 = -_2905;
    float _2915 = fma(_2901, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2913);
    float _2917 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2919 = fma(_2871, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2907);
    float _2921 = -_2903;
    float _2923 = fma(_2921, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2915);
    float _2925 = _2891 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2927 = exp2(_2917);
    float _2929 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2919);
    float _2931 = fma(_2923, -0.5, 0.5);
    float _2933 = fma(_2923, 0.5, 0.5);
    float _2935 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2925);
    float _2937 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2911);
    float _2939 = _2901 + 1.0;
    float _2941 = fma(_2933, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2943 = 1.0 / _2929;
    float _2945 = fma(_2871, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2935);
    float _2947 = fma(_2871, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2937);
    float _2949 = fma(_2933, _2941, -0.212114393711090087890625);
    float _2951 = _2909 * 0.693147182464599609375;
    float _2953 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2945);
    float _2955 = fma(_2933, _2949, 1.570728778839111328125);
    float _2957 = sqrt(_2931);
    float _2959 = -_2901;
    float _2961 = fma(_2927, _2939, _2959);
    float _2963 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2947);
    float _2965 = _2951 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2967 = fma(_2961, 0.5, 0.5);
    float _2969 = _2953 * _2943;
    float _2971 = _2963 * _2943;
    float _2973 = fma(_2969, 0.5, 0.5);
    float _2975 = fma(_2971, -0.5, 0.5);
    float _2977 = _2957 * 0.636619746685028076171875;
    float3 _7868 = float3(_2973, _2975, _2965);
    float _2979 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7868, float3(0.0), isnan(_7868)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7868, float3(0.0), isnan(_7868)), level(0.0)).x;
    float _2981 = -_2955;
    float _2983 = fma(_2977, _2981, 1.0);
    float3 _7884 = float3(_2973, _2975, _2965);
    float4 _2986 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7884, float3(0.0), isnan(_7884)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7884, float3(0.0), isnan(_7884)), level(0.0)).xyzw;
    float _2988 = _2986.x;
    float _2990 = _2986.y;
    float _2992 = _2986.z;
    float _2994 = _2986.w;
    float2 _7901 = float2(_2983, _2967);
    float3 _2998 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7901, float2(0.0), isnan(_7901)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7901, float2(0.0), isnan(_7901)), level(0.0)).xyz;
    float _3000 = _2998.x;
    float _3002 = _2998.y;
    float _3004 = _2998.z;
    float _3006 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3008 = _2891 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3010 = _2929 * 0.5;
    float _3012 = _2953 + _2929;
    float _3014 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3008);
    float _3016 = exp2(_3006);
    float _3018 = _3012 * 0.5;
    out.m_79.x = _2541;
    out.m_79.y = _2539;
    out.m_79.z = _2543;
    float _3020 = fma(_2871, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3014);
    float _3022 = fma(_2963, -0.5, _3010);
    bool _3024 = _2685 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3026 = isnan(_2685);
    bool _3028 = _3024 || _3026;
    bool _3030 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3032 = _3028 || _3030;
    float _3034 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3020);
    out.m_81.x = _2139;
    out.m_81.y = _2153;
    out.m_81.z = _2157;
    float _3036 = _3034 + _2929;
    out.gl_Position.x = _2953;
    out.gl_Position.y = _2963;
    out.gl_Position.z = _3034;
    out.gl_Position.w = _2929;
    float _3038 = _3036 * 0.5;
    float _3040 = -_3016;
    float _3042 = _3040 + 1.0;
    float _3044 = _3042 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _3018;
    out.m_83.y = _3022;
    out.m_83.z = _3038;
    out.m_83.w = _2929;
    float _3046 = _2953;
    float _3048 = _2963;
    if (!_3032)
    {
        _2173 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3050 = _2173;
    float _3052 = -_3044;
    float _3054 = _3052 + 1.0;
    float _3056 = _3050;
    float _3058 = _3050;
    if (!_3032)
    {
        _2175 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3060 = _2175;
    float _3062 = _3060;
    float _3064 = _3060;
    if (!_3032)
    {
        _3046 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3066 = _3046;
    float _3068 = _3066;
    float _3070 = _3066;
    if (!_3032)
    {
        _3048 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3072 = _3048;
    float _3074 = _3072;
    float _3076 = _3072;
    if (!_3032)
    {
        _2177 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3078 = _2177;
    float _3080 = _3044 * _2979;
    float _3082 = _2603 * _2663;
    float _3084 = _2994 * _3080;
    float _3086 = _2994 * _3054;
    float _3088 = _3082 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3090 = _3004 * _3080;
    float _3092 = fma(_3000, _3084, _2988);
    float _3094 = fma(_3002, _3084, _2990);
    float _3096 = _528 * _3088;
    float _3098 = fma(_2994, _3090, _2992);
    float _3100 = _3088;
    float _3102 = _3078;
    float _3104 = _3078;
    if (!_3032)
    {
        _3100 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3106 = _3100;
    out.m_85.x = _3092;
    out.m_85.y = _3094;
    out.m_85.z = _3098;
    out.m_85.w = _3086;
    bool _3108 = !_3032;
    float _3110 = _3106;
    float _3112 = _3106;
    if (!_3108)
    {
        bool _3114 = _2685 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3116 = isnan(_2685);
        bool _3118 = _3114 || _3116;
        bool _3120 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3122 = _3118 || _3120;
        if (!_3122)
        {
            float _3124 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3126 = _2685 + _3124;
            float _3128 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3130 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3128;
            float _3132 = 1.0 / _3130;
            float _3134 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3136 = _3134 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3138 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3140 = _3138 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3142 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3144 = _3142 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3146 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3148 = _3146 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3150 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3152 = _3150 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3154 = _3126 * _3132;
            float _3156 = precise::clamp(_3154, 0.0, 1.0);
            float _3158 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3160 = _3158 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3162 = fma(_3156, _3136, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3164 = fma(_3156, _3160, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3166 = fma(_3156, _3140, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3168 = fma(_3156, _3144, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3170 = fma(_3156, _3148, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3172 = fma(_3156, _3152, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3076 = _3164;
            _3104 = _3170;
            _3070 = _3162;
            _3064 = _3168;
            _3058 = _3166;
            _3112 = _3172;
            _3174 = true;
        }
        else
        {
            bool _3176 = _2685 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3178 = isnan(_2685);
            bool _3180 = _3176 || _3178;
            bool _3182 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3184 = _3180 || _3182;
            if (!_3184)
            {
                _3068 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3186 = _3068;
            _3070 = _3186;
            if (!_3184)
            {
                _3074 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3188 = _3074;
            _3076 = _3188;
            if (!_3184)
            {
                _3056 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3190 = _3056;
            _3058 = _3190;
            if (!_3184)
            {
                _3062 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3192 = _3062;
            _3064 = _3192;
            if (!_3184)
            {
                _3102 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3194 = _3102;
            _3104 = _3194;
            if (!_3184)
            {
                _3110 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3196 = _3110;
            bool _3198 = !_3184;
            _3112 = _3196;
            if (!_3198)
            {
                bool _3200 = _2685 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3202 = isnan(_2685);
                bool _3204 = _3200 || _3202;
                bool _3206 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3208 = _3204 || _3206;
                if (!_3208)
                {
                    float _3210 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3212 = _2685 + _3210;
                    float _3214 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3216 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3214;
                    float _3218 = 1.0 / _3216;
                    float _3220 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3222 = _3220 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3224 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3226 = _3224 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3228 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3230 = _3228 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3232 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3234 = _3232 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3236 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3238 = _3236 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3240 = _3212 * _3218;
                    float _3242 = precise::clamp(_3240, 0.0, 1.0);
                    float _3244 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3246 = _3244 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3248 = fma(_3242, _3222, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3250 = fma(_3242, _3246, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3252 = fma(_3242, _3226, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3254 = fma(_3242, _3230, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3256 = fma(_3242, _3234, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3258 = fma(_3242, _3238, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3076 = _3250;
                    _3104 = _3256;
                    _3070 = _3248;
                    _3064 = _3254;
                    _3058 = _3252;
                    _3112 = _3258;
                    _3174 = true;
                }
                else
                {
                    _3076 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3104 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3070 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3064 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3058 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3112 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3174 = false;
    float _3260 = _3076;
    float _3262 = _3104;
    float _3264 = _3070;
    float _3266 = _3064;
    float _3268 = _3058;
    float _3270 = _3112;
    float _3272 = fma(_2127, -0.5, 0.5);
    float _3274 = precise::clamp(_3272, 0.0, 1.0);
    float _3276 = -_3260;
    float _3278 = _3276 + _3262;
    float _3280 = _3096 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3282 = -_3264;
    float _3284 = _3282 + _3266;
    out.m_87.x = 0.0;
    float _3286 = fma(_3274, _3278, _3260);
    float _3288 = fma(_3274, _3284, _3264);
    out.m_51.x = _3280;
    float _3290 = -_3268;
    float _3292 = _3290 + _3270;
    float _3294 = _3286 * 0.586610972881317138671875;
    bool _3296 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3298 = fma(_3274, _3292, _3268);
    float _3300 = fma(_3288, 0.298911988735198974609375, _3294);
    bool _3302 = _2603 > 0.0;
    bool _3304 = isnan(_2603);
    bool _3306 = _3302 || _3304;
    bool _3308 = isnan(0.0);
    bool _3310 = _3306 || _3308;
    float _3312 = fma(_3298, 0.114477999508380889892578125, _3300);
    bool _3314 = _2663 <= 0.0;
    bool _3316 = !_3310;
    bool _3318 = _3314 || _3316;
    float _3320 = -_3312;
    float _3322 = _3288 + _3320;
    float _3324 = -_3312;
    float _3326 = _3286 + _3324;
    float _3328 = -_3312;
    float _3330 = _3298 + _3328;
    float _3332 = fma(_3322, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3312);
    float _3334 = fma(_3326, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3312);
    float _3336 = fma(_3330, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3312);
    bool _3338 = !_3296;
    if (!_3338)
    {
        float _3340 = -_2539;
        float _3342 = _3340 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3344 = -_2541;
        float _3346 = _3344 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3348 = -_2543;
        float _3350 = _3348 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3352 = _3342 * _3342;
        float _3354 = fma(_3346, _3346, _3352);
        float _3356 = fma(_3350, _3350, _3354);
        float _3358 = sqrt(_3356);
        float _3360 = rsqrt(_3356);
        float _3362 = -_3358;
        float _3364 = _3362 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3366 = _3364 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3368 = precise::clamp(_3366, 0.0, 1.0);
        float _3370 = _3346 * _3360;
        float _3372 = _3342 * _3360;
        float _3374 = abs(_3368);
        float _3376 = log2(_3374);
        float _3378 = _3350 * _3360;
        float _3380 = _3370 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3382 = _2127 * _3372;
        float _3384 = -_3372;
        float _3386 = -_3380;
        float _3388 = fma(_3384, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3386);
        float _3390 = fma(_2123, _3370, _3382);
        float _3392 = -_3378;
        float _3394 = fma(_3392, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3388);
        float _3396 = fma(_2131, _3378, _3390);
        float _3398 = precise::clamp(_3396, 0.0, 1.0);
        float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3402 = _3394 + _3400;
        float _3404 = _3376 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3406 = _3402 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3408 = precise::clamp(_3406, 0.0, 1.0);
        float _3410 = exp2(_3404);
        float _3412 = _3410 * _3408;
        float _3414 = _3398 * _3412;
        float _3416 = _3414 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3418 = _3414 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3420 = _3414 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3416;
        out.m_87.y = _3418;
        out.m_87.z = _3420;
    }
    out.m_69.x = _3332;
    out.m_69.y = _3334;
    out.m_69.z = _3336;
    if (!_3318)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3422 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3422;
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
    bool _3174 = false;
    bool _564 = false;
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
        float _3491 = as_type<float>(_132);
        out.gl_Position.z = _3491;
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
        float _3546 = as_type<float>(_158);
        out.gl_Position.z = _3546;
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
    float _300 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].x, _294);
    float _302 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].y, _296);
    float _304 = fma(_216, 0.5, 0.5);
    float _306 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _308 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].z, _298);
    bool _310 = _220 < 0.5;
    float _312 = float(_310);
    float _314 = -_220;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _318 = -_304;
    float _320 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _322 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].x, _300);
    float _324 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].y, _302);
    float _326 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].z, _308);
    float _328 = _304;
    float _330 = _302;
    if (!_176)
    {
        float _332 = _112 * _112;
        float _334 = _332 * 0.5;
        _328 = _334;
    }
    float _336 = _328;
    float _338 = fma(_280, _202, _322);
    float _340 = fma(_280, _204, _324);
    float _342 = -_312;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _346 = fma(_280, _206, _326);
    float _348 = _336;
    if (!_176)
    {
        _330 = _112;
    }
    float _350 = _330;
    float _352 = _350;
    if (!_176)
    {
        float _354 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
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
    float _420 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _422 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _424 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _428 = _426 != 0;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _432 = _430 != 0;
    float _434 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _436 = fma(_338, _282, _288);
    float _438 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[8].y, _424);
    float _440 = fma(_340, _282, _290);
    float _442 = fma(_346, _282, _292);
    float _444 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _446 = !_428;
    int _448 = _446 ? 0 : 1;
    float _450 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[8].x, _434);
    float _452 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[10].y, _438);
    float _454 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[8].z, _444);
    int _456 = abs(_448);
    float _458 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[10].x, _450);
    bool _460 = !_180;
    int _462 = _460 ? 0 : 1;
    float _464 = fma(_416, _204, _452);
    float _466 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[10].z, _454);
    float _468 = float(_456);
    float _470 = 1.0 / _146;
    int _472 = abs(_462);
    float _474 = -_464;
    float _476 = _340 + _474;
    bool _478 = !_432;
    int _480 = _478 ? 0 : 1;
    float _482 = fma(_416, _202, _458);
    bool _484 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _486 = fma(_416, _206, _466);
    float _488 = abs(_316);
    float _490 = _468 * _488;
    int _492 = abs(_480);
    float _494 = _476 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _496 = _476 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _498 = -_482;
    float _500 = _338 + _498;
    float _502 = _476 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _504 = float(_472);
    float _506 = -_486;
    float _508 = _346 + _506;
    float _510 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[4].x, _494);
    float _512 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[5].x, _496);
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[6].x, _502);
    float _516 = float(_492);
    float _518 = fma(_504, _320, _490);
    float _520 = fma(_508, (*spvDescriptorSet0.vp_c10)._m0[4].z, _510);
    float _522 = fma(_508, (*spvDescriptorSet0.vp_c10)._m0[5].z, _512);
    float _524 = fma(_508, (*spvDescriptorSet0.vp_c10)._m0[6].z, _514);
    float _526 = abs(_344);
    float _528 = fma(_516, _526, _518);
    float _530 = _112 * _470;
    bool _532 = !_484;
    float _534 = _530;
    float _536 = _522;
    float _538 = _520;
    float _540 = _524;
    float _542 = _520;
    float _544 = _482;
    float _546 = _486;
    float _562;
    if (!_532)
    {
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _550 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[12].x, _112);
        float _554 = _552 * _548;
        float _556 = floor(_554);
        float _558 = -_556;
        float _560 = _554 + _558;
        _562 = _560;
        _564 = true;
    }
    else
    {
        _562 = _530;
    }
    _564 = false;
    float _566 = _562;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _570 = _566 + _568;
    float _572 = in.m_55.x;
    float _574 = in.m_55.y;
    float _576 = in.m_55.z;
    bool _578 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _580 = isnan(_566);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _590;
    bool _594 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _596 = isnan(_566);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -_588;
    float _608 = _606 + 1.0;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _610;
    float _614 = 1.0 / _592;
    bool _616 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _618 = _604 * _608;
    float _620 = -_604;
    float _622 = _620 + 1.0;
    float _624 = _570 * _614;
    float _626 = fma(_612, _624, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _632;
    float _636 = _626 * _618;
    float _638 = fma(_630, _624, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _640 = fma(_634, _624, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _642 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].x, _636);
    float _644 = _638 * _618;
    float _646 = _640 * _618;
    float _648 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[144].x, _642);
    float _650 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].y, _644);
    float _652 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].z, _646);
    float _654 = _648 * _572;
    float _656 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[144].y, _650);
    float _658 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[144].z, _652);
    float _660 = _656 * _574;
    float _662 = _658 * _576;
    bool _664 = !_616;
    float _666 = _622;
    if (!_664)
    {
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _670 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[11].y, _112);
        float _674 = _672 * _668;
        float _676 = floor(_674);
        float _678 = -_676;
        float _680 = _674 + _678;
        _534 = _680;
    }
    float _682 = _534;
    float _684 = in.m_57.x;
    float _686 = _160 * 2.0;
    float _688 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _690 = int(_688);
    float _692 = in.m_53.y;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _696 = _694 != 0;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _700 = _682 + _698;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _704 = _702 != 0;
    float _706 = in.m_57.y;
    bool _708 = _160 > 0.5;
    bool _710 = _708 && _696;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _714 = _682 + _712;
    float _716 = floor(_686);
    float _718 = in.m_53.z;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _722 = _682 + _720;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _728 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _730 = int(_728);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _740 = _684;
    if (_696)
    {
        _666 = _684;
    }
    float _742 = _666;
    float _744 = _654 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _746 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _748 = log2(_746);
    bool _750 = _692 > 0.5;
    float _752 = _742;
    if (_710)
    {
        float _754 = -_742;
        float _756 = _754 + 1.0;
        _752 = _756;
    }
    float _758 = _752;
    float _760 = _692 * 2.0;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _762;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _772 = _770 != 0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _776 = _774 != 0;
    float _778 = -_706;
    float _780 = _778 + 1.0;
    float _782 = _706;
    if (_696)
    {
        _740 = _758;
    }
    float _784 = _740;
    float _786 = _440 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _790 = _788 != 0;
    float _792 = 1.0 / _726;
    bool _794 = !_772;
    int _796 = _794 ? 0 : 1;
    float _798 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[5].x, _786);
    bool _800 = _716 >= 0.0;
    bool _802 = isnan(_716);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    float _810 = _718 * 2.0;
    if (_704)
    {
        float _812 = _750 ? _780 : _706;
        _782 = _812;
    }
    float _814 = _782;
    float _816 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[5].z, _798);
    int _818 = _808 ? 0 : 1;
    float _820 = floor(_760);
    bool _822 = _716 > 0.0;
    float _824 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _826 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _828 = float(_690);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _836 = _834 != 0;
    float _838 = _440 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _840 = 1.0 / _828;
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _844 = _842 != 0;
    float _846 = _440 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _848 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[4].x, _838);
    float _850 = _692 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _852 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _854 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[6].x, _846);
    float _856 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[4].z, _848);
    float _858 = 1.0 / _832;
    float _860 = fma(_850, -2.0, _732);
    float _862 = -_734;
    float _864 = fma(_852, 2.0, _862);
    float _866 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[6].z, _854);
    int _868 = ~_818;
    int _870 = _868 + 1;
    int _872 = _870 + 1;
    float _874 = _764 * _792;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _876;
    float _880 = _112 * _840;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _886 = _872;
    if (!_822)
    {
        int _888 = ~_818;
        int _890 = _888 + 1;
        _886 = _890;
    }
    int _892 = _886;
    float _894 = 1.0 / _738;
    float _896 = float(uint(_730));
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _904 = _884 * _858;
    float _906 = _112 * _748;
    float _908 = 1.0 / _896;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _912 = _898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _914 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _916 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _918 = !_836;
    float _920 = _918 ? 7.345489978790283203125 : 1.0;
    float _922 = _856 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _924 = trunc(_880);
    int _926 = int(_924);
    out.m_59.x = _912;
    out.m_59.y = _914;
    out.m_59.z = _916;
    out.m_59.w = _910;
    bool _928 = _820 >= 0.0;
    bool _930 = isnan(_820);
    bool _932 = _928 || _930;
    bool _934 = isnan(0.0);
    bool _936 = _932 || _934;
    float _938 = _878 * _894;
    bool _940 = !_768;
    int _942 = _940 ? 0 : 1;
    float _944 = _920 * _160;
    bool _946 = !_776;
    int _948 = _946 ? 0 : 1;
    float _950 = fma(_938, _700, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _952 = floor(_810);
    float _954 = _866 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _958 = _956 != 0;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _962 = _960 != 0;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _966 = _964 != 0;
    float _968 = fma(_874, _722, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _970 = as_type<int>(_908) + (-2);
    float _972 = _160 + _718;
    float _974 = exp2(_906);
    float _976 = float(_730);
    float _978 = _692 + _718;
    float _980 = _160 + _692;
    float _982 = _972 + (-1.0);
    int _984 = _936 ? 0 : 1;
    float _986 = _112 * _976;
    float _988 = _978 + (-1.0);
    float _990 = _980 + (-1.0);
    bool _992 = _952 >= 0.0;
    bool _994 = isnan(_952);
    bool _996 = _992 || _994;
    bool _998 = isnan(0.0);
    bool _1000 = _996 || _998;
    float _1002 = _986 * _470;
    float _1004 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1006 = float(uint(_926));
    float _1008 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1010 = !_958;
    int _1012 = _1010 ? 0 : 1;
    float _1014 = floor(_944);
    float _1016 = -_974;
    float _1018 = _1016 + 1.0;
    float _1020 = as_type<float>(_970) * _1006;
    bool _1022 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1024 = isnan(0.0);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1030 = _1026 || _1028;
    float _1032 = _1030 ? _1018 : 0.0;
    float _1034 = trunc(_1020);
    float _1036 = precise::max(_1034, 0.0);
    uint _1039 = uint(_1036);
    bool _1041 = _952 > 0.0;
    float _1043 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1045 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1047 = isnan(_682);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1053 = _1049 || _1051;
    float _1055 = float(_1053);
    bool _1057 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1059 = isnan(_682);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(_1065);
    int _1069 = _1000 ? 0 : 1;
    float _1071 = -_1055;
    float _1073 = _1071 + 1.0;
    int _1075 = ~_730;
    int _1077 = _1075 + 1;
    float _1079 = -_1014;
    float _1081 = _944 + _1079;
    bool _1083 = _820 > 0.0;
    float _1085 = _1067 * _1073;
    bool _1087 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1089 = isnan(_682);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1095 = _1091 || _1093;
    float _1097 = float(_1095);
    float _1099 = -_1067;
    float _1101 = _1099 + 1.0;
    float _1103 = _1081 * _976;
    bool _1105 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1107 = isnan(_682);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1113 = _1109 || _1111;
    float _1115 = float(_1113);
    float _1117 = _1097 * _1101;
    float _1119 = -_1097;
    float _1121 = _1119 + 1.0;
    int _1123 = _1077 * int(_1039);
    int _1125 = _1123 + _926;
    bool _1127 = !_962;
    int _1129 = _1127 ? 0 : 1;
    float _1131 = trunc(_1002);
    int _1133 = int(_1131);
    float _1135 = _1115 * _1121;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1139 = 1.0 + _1137;
    float _1141 = float(uint(_1125));
    float _1143 = fma(_904, _714, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1145 = _950 * _1135;
    float _1147 = -_1115;
    float _1149 = _1147 + 1.0;
    int _1151 = abs(_1129);
    float _1153 = 1.0 / _1139;
    float _1155 = as_type<float>(_970) * _1141;
    float _1157 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1145);
    float _1159 = float(_892);
    float _1161 = in.m_61.x;
    float _1163 = in.m_61.y;
    float _1165 = in.m_61.z;
    float _1167 = float(_1151);
    int _1169 = ~_1069;
    int _1171 = _1169 + 1;
    int _1173 = _1171 + 1;
    float _1175 = trunc(_1155);
    float _1177 = precise::max(_1175, 0.0);
    uint _1179 = uint(_1177);
    int _1181 = abs(_1012);
    float _1183 = _1167 * _1159;
    int _1185 = _1173;
    if (!_1041)
    {
        int _1187 = ~_1069;
        int _1189 = _1187 + 1;
        _1185 = _1189;
    }
    int _1191 = _1185;
    float _1193 = fma(_1143, _1117, _1157);
    int _1195 = ~_984;
    int _1197 = _1195 + 1;
    int _1199 = _1197 + 1;
    float _1201 = _1183 * (-2.0);
    int _1203 = _1199;
    if (!_1083)
    {
        int _1205 = ~_984;
        int _1207 = _1205 + 1;
        _1203 = _1207;
    }
    int _1209 = _1203;
    float _1211 = _1032 * _1153;
    float _1213 = float(_926);
    float _1215 = fma(_1043, _1201, _1043);
    float _1217 = float(_1181);
    float _1219 = _692 + (-0.5);
    bool _1221 = _1213 >= _976;
    bool _1223 = isnan(_1213);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan(_976);
    bool _1229 = _1225 || _1227;
    float _1231 = float(_1229);
    float _1233 = fma(_968, _1085, _1193);
    float _1235 = float(_1191);
    int _1237 = ~_730;
    int _1239 = _1237 + 1;
    int _1241 = int(_1039) + int(_1179);
    float _1243 = _1217 * _1235;
    float _1245 = fma(_1201, _1163, _1163);
    bool _1247 = !_790;
    int _1249 = _1247 ? 0 : 1;
    int _1251 = _1239 * _1241;
    int _1253 = _1251 + _926;
    float _1255 = trunc(_1103);
    int _1257 = int(_1255);
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1261 = _1243 * (-2.0);
    bool _1263 = !_966;
    int _1265 = _1263 ? 0 : 1;
    float _1267 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1245);
    bool _1269 = uint(_1253) >= uint(_730);
    float _1271 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1259);
    int _1273 = abs(_1249);
    float _1275 = trunc(_1231);
    int _1277 = int(_1275);
    bool _1279 = !_1269;
    int _1281 = _1279 ? 0 : (-1);
    float _1283 = fma(_1261, _1161, _1161);
    float _1285 = _816 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1287 = ~_1241;
    int _1289 = _1287 + _1281;
    int _1291 = _1289 + 1;
    float _1293 = fma(_1008, _1261, _1008);
    int _1295 = _1257 * _1273;
    int _1297 = _1295 + _926;
    float _1299 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1301 = _1285 + _1299;
    int _1303 = _730 * _1291;
    int _1305 = _1303 + _926;
    bool _1307 = _730 == 0;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1313 = _922 + _1311;
    float _1315 = _1301 * _1301;
    float _1317 = _160 + (-0.5);
    int _1319 = ~_1277;
    int _1321 = _1319 + 1;
    int _1323 = _1321 + 1;
    float _1325 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1309);
    bool _1327 = !_1307;
    int _1329 = _1327 ? _1305 : (-1);
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1333 = _954 + _1331;
    bool _1335 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1337 = isnan(1.0);
    bool _1339 = _1335 || _1337;
    bool _1341 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1343 = _1339 || _1341;
    float _1345 = fma(_1313, _1313, _1315);
    int _1347 = abs(_1265);
    float _1349 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1283);
    int _1351 = _1329 * _1323;
    int _1353 = _730 + (-1);
    float _1355 = fma(_1333, _1333, _1345);
    bool _1357 = !_1343;
    float _1359 = _1357 ? _112 : _1211;
    float _1361 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1271);
    float _1363 = float(_1347);
    int _1365 = _1277 * _1353;
    int _1367 = _1365 + _1351;
    float _1369 = float(_1209);
    float _1371 = rsqrt(_1355);
    int _1373 = abs(_796);
    float _1375 = fma(_1359, _1215, _1267);
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1379 = _1377 != 0;
    float _1381 = _1363 * _1369;
    int _1383 = abs(_942);
    int _1385 = _1367 * _1373;
    bool _1387 = !_1379;
    int _1389 = _1387 ? 0 : 1;
    float _1391 = sqrt(_1355);
    float _1393 = _1375 * 0.15915493667125701904296875;
    float _1395 = fma(_1359, _1293, _1349);
    int _1397 = abs(_1389);
    float _1399 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1325);
    float _1401 = float(uint(_1297));
    float _1403 = _1395 * 0.15915493667125701904296875;
    int _1405 = ~_730;
    int _1407 = _1405 + 1;
    float _1409 = _1393 * 6.283185482025146484375;
    float _1411 = sin(_1409);
    int _1413 = abs(_948);
    float _1415 = as_type<float>(_970) * _1401;
    float _1417 = _744 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1419 = _1133 * _1383;
    int _1421 = _1419 + _1385;
    float _1423 = _1381 * (-2.0);
    float _1425 = _1391 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _1427 = _1297 * _1413;
    int _1429 = _1427 + _1421;
    float _1431 = _1393 * 6.283185482025146484375;
    float _1433 = cos(_1431);
    int _1435 = _1257 * _1397;
    int _1437 = _1435 + _1429;
    float _1439 = fma(_1004, _1423, _1004);
    float _1441 = fma(_1423, _1165, _1165);
    float _1443 = _718 + (-0.5);
    float _1445 = precise::min(_1417, _1425);
    float _1447 = trunc(_1415);
    float _1449 = precise::max(_1447, 0.0);
    uint _1451 = uint(_1449);
    float _1453 = float(uint(_1437));
    float _1455 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1441);
    float _1457 = in.m_63.x;
    float _1459 = in.m_63.y;
    float _1461 = in.m_63.z;
    float _1463 = _1371 * _1445;
    float _1465 = as_type<float>(_970) * _1453;
    float _1467 = fma(_1359, _1439, _1455);
    float _1469 = _1301 * _1463;
    float _1471 = _1313 * _1463;
    float _1473 = trunc(_1465);
    float _1475 = precise::max(_1473, 0.0);
    uint _1477 = uint(_1475);
    int _1479 = ~_730;
    int _1481 = _1479 + 1;
    float _1483 = -_1469;
    float _1485 = _1301 + _1483;
    float _1487 = -_1471;
    float _1489 = _1313 + _1487;
    float _1491 = _1467 * 0.15915493667125701904296875;
    float _1493 = _1485 * _1485;
    int _1495 = _1407 * int(_1451);
    int _1497 = _1495 + _1297;
    float _1499 = _1403 * 6.283185482025146484375;
    float _1501 = sin(_1499);
    float _1503 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1505 = _1333 * _1463;
    float _1507 = fma(_1489, _1489, _1493);
    float _1509 = float(uint(_1497));
    float _1511 = in.m_65.x;
    float _1513 = in.m_65.y;
    float _1515 = in.m_65.z;
    float _1517 = -_1505;
    float _1519 = _1333 + _1517;
    float _1521 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _860);
    int _1523 = _1481 * int(_1477);
    int _1525 = _1523 + _1437;
    bool _1527 = _1459 != 0.0;
    bool _1529 = isnan(_1459);
    bool _1531 = _1527 || _1529;
    bool _1533 = isnan(0.0);
    bool _1535 = _1531 || _1533;
    float _1537 = _1403 * 6.283185482025146484375;
    float _1539 = cos(_1537);
    float _1541 = fma(_1519, _1519, _1507);
    float _1543 = -_1521;
    float _1545 = fma(_1361, _1503, _1543);
    float _1547 = float(uint(_1525));
    float _1549 = as_type<float>(_970) * _1509;
    bool _1551 = _1457 == 0.0;
    bool _1553 = !_1535;
    bool _1555 = _1551 && _1553;
    float _1557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1461);
    float _1559 = as_type<float>(_970) * _1547;
    float _1561 = _1491 * 6.283185482025146484375;
    float _1563 = sin(_1561);
    bool _1565 = _1461 == 0.0;
    bool _1567 = _1565 && _1555;
    float _1569 = -_112;
    float _1571 = fma(_1569, (*spvDescriptorSet0.vp_c9)._m0[76].x, _864);
    float _1573 = _1545 + 0.5;
    float _1575 = _1501 * _1411;
    float _1577 = fma(_1399, _824, _1571);
    float _1579 = _1539 * _1433;
    float _1581 = sqrt(_1541);
    float _1583 = _1501 * _1433;
    float _1585 = _1577 + 0.5;
    float _1587 = _1515;
    float _1589 = _1513;
    float _1591 = _1511;
    if (!_1567)
    {
        float _1593 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1515);
        _1587 = _1593;
    }
    float _1595 = _1587;
    float _1597 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1233);
    float _1599 = trunc(_1559);
    float _1601 = precise::max(_1599, 0.0);
    uint _1603 = uint(_1601);
    float _1605 = fma(_1563, _1579, _1575);
    float _1607 = _1539 * _1411;
    float _1609 = fma(_1563, _1575, _1579);
    int _1611 = ~_730;
    int _1613 = _1611 + 1;
    out.m_67.x = _1585;
    out.m_67.y = _1573;
    if (!_1567)
    {
        float _1615 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1513);
        _1589 = _1615;
    }
    float _1617 = _1589;
    if (!_1567)
    {
        float _1619 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1511);
        _1591 = _1619;
    }
    float _1621 = _1591;
    float _1623 = _1491 * 6.283185482025146484375;
    float _1625 = cos(_1623);
    float _1627 = _1371 * _1581;
    float _1629 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1459);
    float _1631 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1457);
    float _1633 = _744 * _1627;
    float _1635 = _662 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1637 = int(_1477) + int(_1603);
    float _1639 = -_1607;
    float _1641 = fma(_1563, _1583, _1639);
    float _1643 = -_1583;
    float _1645 = fma(_1563, _1607, _1643);
    float _1647 = _826 * _1627;
    float _1649 = _1635 * _1627;
    int _1651 = _1613 * _1637;
    int _1653 = _1651 + _1437;
    float _1655 = trunc(_1549);
    float _1657 = precise::max(_1655, 0.0);
    uint _1659 = uint(_1657);
    float _1661 = _1647 * _1629;
    float _1663 = _1539 * _1625;
    float _1665 = _1649 * _1557;
    bool _1667 = uint(_1653) >= uint(_730);
    float _1669 = _1501 * _1625;
    float _1671 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1673 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1675 = !_1667;
    int _1677 = _1675 ? 0 : (-1);
    float _1679 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1681 = -_1563;
    float _1683 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1671);
    float _1685 = -_1563;
    float _1687 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1673);
    int _1689 = ~_1637;
    int _1691 = _1689 + _1677;
    int _1693 = _1691 + 1;
    float _1695 = -_1563;
    float _1697 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1679);
    float _1699 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1683);
    float _1701 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1687);
    float _1703 = _1433 * _1625;
    int _1705 = _730 * _1693;
    int _1707 = _1705 + _1437;
    float _1709 = -_1661;
    float _1711 = _1563 * _1709;
    float _1713 = _1663 * _1661;
    float _1715 = _1633 * _1631;
    float _1717 = _1669 * _1661;
    bool _1719 = !_1307;
    int _1721 = _1719 ? _1707 : (-1);
    float _1723 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1697);
    int _1725 = int(_1451) + int(_1659);
    float _1727 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1729 = ~_730;
    int _1731 = _1729 + 1;
    float _1733 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1735 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1737 = fma(_1703, _1715, _1711);
    float _1739 = fma(_1605, _1715, _1713);
    float _1741 = _1411 * _1625;
    float _1743 = fma(_1641, _1715, _1717);
    float _1745 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1747 = _1721 >> 31;
    float _1749 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1727);
    float _1751 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1733);
    float _1753 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1735);
    float _1755 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1757 = _1731 * _1725;
    int _1759 = _1757 + _1297;
    float _1761 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1745);
    int _1763 = _1747 & 3;
    float _1765 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1767 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1755);
    float _1769 = fma(_1645, _1665, _1739);
    float _1771 = fma(_1741, _1665, _1737);
    bool _1773 = uint(_1759) >= uint(_730);
    float _1775 = _1701 * _1617;
    int _1777 = _1721 + _1763;
    float _1779 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1781 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1765);
    float _1783 = fma(_1609, _1665, _1743);
    int _1785 = _1777 >> 2;
    float _1787 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1779);
    float _1789 = _1699 * _1617;
    float _1791 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1793 = _1785 << 4;
    int _1795 = _1793 + 368;
    float _1797 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1787);
    float _1799 = _1723 * _1617;
    float _1801 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1791);
    uint _1803 = uint(int(uint(_1795) >> uint(2)));
    uint _1805 = uint(int(uint(int(_1803)) >> uint(2)));
    int _1807 = int(_1803) & 3;
    float _1809 = (*spvDescriptorSet0.vp_c9)._m0[int(_1805)][_1807];
    int _1811 = int(_1803) + 1;
    uint _1813 = uint(int(uint(_1811) >> uint(2)));
    int _1815 = _1811 & 3;
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[int(_1813)][_1815];
    float _1819 = _1797 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1821 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1749);
    float _1823 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1801);
    float _1825 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1751);
    float _1827 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1753);
    float _1829 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1761);
    float _1831 = _1823 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1833 = _1795 + 8;
    uint _1835 = uint(int(uint(_1833) >> uint(2)));
    uint _1837 = uint(int(uint(int(_1835)) >> uint(2)));
    int _1839 = int(_1835) & 3;
    float _1841 = (*spvDescriptorSet0.vp_c9)._m0[int(_1837)][_1839];
    int _1843 = int(_1835) + 1;
    uint _1845 = uint(int(uint(_1843) >> uint(2)));
    int _1847 = _1843 & 3;
    float _1849 = (*spvDescriptorSet0.vp_c9)._m0[int(_1845)][_1847];
    float _1851 = _954 + _1819;
    int _1853 = _1721 & 3;
    bool _1855 = _1853 != 0;
    float _1857 = _922 + _1831;
    int _1859 = _1721 & 3;
    bool _1861 = _1859 != 0;
    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1865 = _1851 + _1863;
    bool _1867 = uint(_1853) > 1u;
    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1871 = _1857 + _1869;
    float _1873 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1767);
    float _1875 = _1865 * _1865;
    float _1877 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1781);
    float _1879 = fma(_1821, _1621, _1775);
    int _1881 = _1861 ? 0 : 1;
    float _1883 = fma(_1871, _1871, _1875);
    bool _1885 = uint(_1853) >= 2u;
    float _1887 = fma(_1825, _1621, _1789);
    int _1889 = ~_1881;
    int _1891 = _1889 + 1;
    int _1893 = _1891 + 1;
    float _1895 = sqrt(_1883);
    int _1897 = _1885 ? 0 : 1;
    float _1899 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1901 = _1893;
    float _1903 = as_type<float>(_1853);
    float _1905 = _1857;
    if (!_1867)
    {
        int _1907 = ~_1881;
        int _1909 = _1907 + 1;
        _1901 = _1909;
    }
    int _1911 = _1901;
    float _1913 = fma(_1827, _1621, _1799);
    bool _1915 = _1853 != 3;
    float _1917 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1899);
    bool _1919 = !_1855;
    int _1921 = _1919 ? 0 : 1;
    int _1923 = abs(_1911);
    int _1925 = abs(_1921);
    float _1927 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1917);
    bool _1929 = _1853 != 3;
    int _1931 = ~_1923;
    int _1933 = _1931 + 1;
    int _1935 = _1933 + 1;
    float _1937 = _1927 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1939 = ~_1897;
    int _1941 = _1939 + 1;
    int _1943 = _1941 + 1;
    float _1945 = _1285 + _1937;
    bool _1947 = _1895 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1949 = _1935 * as_type<int>(_1817);
    int _1951 = _1943;
    if (_1915)
    {
        int _1953 = ~_1897;
        int _1955 = _1953 + 1;
        _1951 = _1955;
    }
    int _1957 = _1951;
    bool _1959 = !_1929;
    int _1961 = _1959 ? 0 : (-1);
    int _1963 = ~_1925;
    int _1965 = _1963 + 1;
    int _1967 = _1965 + 1;
    int _1969 = abs(_1957);
    bool _1971 = !_844;
    int _1973 = _1971 ? 0 : 1;
    int _1975 = _1967 * as_type<int>(_1809);
    int _1977 = _1975 + _1949;
    int _1979 = abs(_1961);
    int _1981 = ~_1969;
    int _1983 = _1981 + 1;
    int _1985 = _1983 + 1;
    int _1987 = abs(_1973);
    bool _1989 = !_1773;
    int _1991 = _1989 ? 0 : (-1);
    int _1993 = _1985 * as_type<int>(_1841);
    int _1995 = _1993 + _1977;
    float _1997 = as_type<float>(_1985);
    if (!_1947)
    {
        _1903 = _1857;
    }
    float _1999 = _1903;
    int _2001 = ~_1725;
    int _2003 = _2001 + _1991;
    int _2005 = _2003 + 1;
    float _2007 = _1999;
    if (!_1947)
    {
        _1905 = _1851;
    }
    float _2009 = _1905;
    int _2011 = ~_1979;
    int _2013 = _2011 + 1;
    int _2015 = _2013 + 1;
    float _2017 = _2009;
    if (!_1947)
    {
        _1997 = _1945;
    }
    float _2019 = _1997;
    bool _2021 = !_1947;
    float _2023 = _2019;
    if (!_2021)
    {
        float _2025 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2027 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2029 = _1895 + _2027;
        float _2031 = rsqrt(_1883);
        float _2033 = _2029 * _2025;
        float _2035 = _1945 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2037 = _2033 * 0.15915493667125701904296875;
        float _2039 = _2037 * 6.283185482025146484375;
        float _2041 = cos(_2039);
        float _2043 = _2037 * 6.283185482025146484375;
        float _2045 = sin(_2043);
        float _2047 = _2041 + (-1.0);
        float _2049 = _2047 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2051 = fma(_2045, _2035, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2053 = fma(_1945, _2041, _2049);
        float _2055 = _2031 * _2051;
        float _2057 = fma(_1871, _2055, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2059 = fma(_1865, _2055, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2023 = _2053;
        _2007 = _2057;
        _2017 = _2059;
    }
    float _2061 = _2023;
    float _2063 = _2007;
    float _2065 = _2017;
    float _2067 = -_1285;
    float _2069 = _2067 + _2061;
    int _2071 = ~_1987;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    int _2077 = _2015 * as_type<int>(_1849);
    int _2079 = _2077 + _1995;
    float _2081 = -_922;
    float _2083 = _2081 + _2063;
    float _2085 = _2069 * _2069;
    int _2087 = _730 * _2005;
    int _2089 = _2087 + _1297;
    float _2091 = -_954;
    float _2093 = _2091 + _2065;
    int _2095 = _2079 * _2075;
    float _2097 = fma(_2083, _2083, _2085);
    out.m_69.w = _1445;
    bool _2099 = !_1307;
    int _2101 = _2099 ? _2089 : (-1);
    float _2103 = fma(_2093, _2093, _2097);
    float _2105 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2107 = sqrt(_2103);
    int _2109 = _2101 * _1987;
    int _2111 = _2109 + _2095;
    float _2113 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2115 = _1597 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2119 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2121 = _2113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2123 = fma(_1829, _1595, _1879);
    float _2125 = _2117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2127 = fma(_1873, _1595, _1887);
    float _2129 = float(_2111);
    float _2131 = fma(_1877, _1595, _1913);
    out.m_71.x = _1633;
    float _2133 = -_1471;
    float _2135 = _2133 + _2063;
    float _2137 = -_1471;
    float _2139 = _922 + _2137;
    out.m_73.x = _2119;
    out.m_73.y = _2121;
    out.m_73.z = _2125;
    out.m_73.w = _2115;
    bool _2141 = _2107 > 0.0;
    float _2143 = -_1469;
    float _2145 = _2143 + _2061;
    float _2147 = -_1505;
    float _2149 = _2147 + _2065;
    out.m_75.x = _2129;
    float _2151 = -_1469;
    float _2153 = _1285 + _2151;
    float _2155 = -_1505;
    float _2157 = _954 + _2155;
    out.m_77.x = _2123;
    out.m_77.y = _2127;
    out.m_77.z = _2131;
    bool _2159 = !_2141;
    float _2161 = _2115;
    float _2163 = _2119;
    float _2165 = _2121;
    float _2167 = _2135;
    float _2169 = _2149;
    float _2171 = _2145;
    float _2173 = _2157;
    float _2175 = _2153;
    float _2177 = _2139;
    if (!_2159)
    {
        bool _2179 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2181 = _2125;
        if (_2179)
        {
            float _2183 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2181 = _2183;
        }
        float _2185 = _2181;
        if (_2179)
        {
            float _2187 = _520 * _2185;
            _2161 = _2187;
        }
        float _2189 = _2161;
        float _2191 = _2189;
        if (_2179)
        {
            float _2193 = _522 * _2185;
            _2163 = _2193;
        }
        float _2195 = _2163;
        float _2197 = _2195;
        if (_2179)
        {
            float _2199 = _524 * _2185;
            _2165 = _2199;
        }
        float _2201 = _2165;
        float _2203 = _2201;
        if (!_2179)
        {
            float _2205 = _112 + 1.0;
            if (!_176)
            {
                float _2207 = _2205 * _2205;
                float _2209 = _2207 * 0.5;
                _122 = _2209;
            }
            float _2211 = _122;
            float _2213 = _2211;
            if (!_176)
            {
                float _2215 = _2211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2213 = _2215;
            }
            float _2217 = _2213;
            bool _2219 = !_176;
            float _2221 = _2217;
            if (!_2219)
            {
                float _2223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2225 = log2(_2223);
                float _2227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2229 = 1.0 + _2227;
                float _2231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2233 = _2225 * _2205;
                float _2235 = 1.0 / _2229;
                float _2237 = _2231 * 0.693147182464599609375;
                float _2239 = exp2(_2233);
                float _2241 = 1.0 / _2237;
                float _2243 = _2239 + (-1.0);
                float _2245 = -_2243;
                float _2247 = fma(_2245, _2241, _2205);
                float _2249 = _2247 * _2235;
                float _2251 = _2249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2221 = _2251;
            }
            float _2253 = _2221;
            float _2255 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2257 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2259 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2261 = _2253;
            if (!_176)
            {
                _2261 = _2205;
            }
            float _2263 = _2261;
            float _2265 = _2255 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2267 = _2255 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2269 = _2255 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2271 = fma(_2257, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2265);
            float _2273 = fma(_2257, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2267);
            float _2275 = fma(_2259, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2271);
            bool _2277 = !_176;
            float _2279 = _2263;
            if (!_2277)
            {
                float _2281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2283 = log2(_2281);
                float _2285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2287 = 1.0 + _2285;
                float _2289 = 1.0 / _2287;
                float _2291 = _2283 * _2205;
                float _2293 = exp2(_2291);
                float _2295 = -_2293;
                float _2297 = _2295 + 1.0;
                float _2299 = _2297 * _2289;
                _2279 = _2299;
            }
            float _2301 = _2279;
            float _2303 = fma(_2257, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2269);
            float _2305 = fma(_2301, _204, _2275);
            float _2307 = fma(_2259, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2273);
            float _2309 = fma(_2259, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2303);
            float _2311 = -_464;
            float _2313 = _2311 + _2305;
            float _2315 = fma(_2301, _202, _2307);
            float _2317 = fma(_2301, _206, _2309);
            float _2319 = _2313 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2321 = _2313 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2323 = -_482;
            float _2325 = _2323 + _2315;
            float _2327 = _2313 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2329 = -_486;
            float _2331 = _2329 + _2317;
            float _2333 = fma(_2325, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2319);
            float _2335 = fma(_2325, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2321);
            float _2337 = fma(_2325, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2327);
            float _2339 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2333);
            float _2341 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2335);
            float _2343 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2337);
            _536 = _2341;
            _538 = _2339;
            _540 = _2343;
            _2191 = _2339;
            _2197 = _2341;
            _2203 = _2343;
        }
        float _2345 = _536;
        float _2347 = _538;
        float _2349 = _540;
        float _2351 = _2191;
        float _2353 = _2197;
        float _2355 = _2203;
        float _2357 = _2345 * _2345;
        float _2359 = rsqrt(_2103);
        float _2361 = fma(_2347, _2347, _2357);
        float _2363 = fma(_2349, _2349, _2361);
        float _2365 = sqrt(_2363);
        float _2367 = _2083 * _2359;
        float _2369 = _2069 * _2359;
        float _2371 = _2093 * _2359;
        bool _2373 = _2365 > 0.0;
        bool _2375 = !_2373;
        _542 = _2347;
        _124 = _2367;
        _544 = _2363;
        if (!_2375)
        {
            float _2377 = rsqrt(_2363);
            float _2379 = _2377 * _2345;
            float _2381 = _2377 * _2347;
            float _2383 = _2377 * _2349;
            float _2385 = _2369 * _2379;
            float _2387 = fma(_2367, _2381, _2385);
            float _2389 = fma(_2371, _2383, _2387);
            float _2391 = _2389 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2393 = fma(_2351, _2391, _2135);
            float _2395 = fma(_2353, _2391, _2145);
            float _2397 = fma(_2355, _2391, _2149);
            _2167 = _2393;
            _2169 = _2397;
            _2171 = _2395;
        }
    }
    float _2399 = _2167;
    float _2401 = _2169;
    float _2403 = _2171;
    float _2405 = _542;
    float _2407 = _124;
    float _2409 = _544;
    float _2411 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2413 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2415 = isnan(0.5);
    bool _2417 = _2413 || _2415;
    bool _2419 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2421 = _2417 || _2419;
    float _2423 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2411);
    bool _2425 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2427 = isnan(0.5);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2433 = _2429 || _2431;
    float _2435 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2423);
    float _2437 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2439 = _2435 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2441 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2437);
    float _2443 = 1.0 / _2439;
    float _2445 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2441);
    float _2447 = _2407;
    float _2449 = _2439;
    float _2451 = _2409;
    float _2453 = _2405;
    if (_2433)
    {
        _2447 = 1.0;
    }
    float _2455 = _2447;
    float _2457 = _2445 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2459 = _2457 + _2439;
    float _2461 = _2455;
    if (_2421)
    {
        _2449 = _2399;
    }
    float _2463 = _2449;
    float _2465 = _2459 * _2443;
    float _2467 = _2465 * 0.5;
    float _2469 = _2443;
    float _2471 = _2467;
    float _2473 = _2463;
    if (_2421)
    {
        _2469 = _2401;
    }
    float _2475 = _2469;
    float _2477 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2479 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2477);
    float _2481 = _2475;
    if (_2421)
    {
        _2471 = _2403;
    }
    float _2483 = _2471;
    float _2485 = 1.0 / _2479;
    float _2487 = _2483;
    if (!_2421)
    {
        float _2489 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2491 = _2153 + _2489;
        float _2493 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2495 = _2139 + _2493;
        float _2497 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2499 = _2491 * _2491;
        float _2501 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2503 = _2157 + _2501;
        float _2505 = fma(_2495, _2495, _2499);
        float _2507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2509 = fma(_2503, _2503, _2505);
        float _2511 = sqrt(_2509);
        float _2513 = _2497 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2515 = -_2153;
        float _2517 = _2515 + _2403;
        float _2519 = precise::min(_2511, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2521 = _2519 * _2507;
        float _2523 = -_2139;
        float _2525 = _2523 + _2399;
        float _2527 = _2513 * _2521;
        float _2529 = -_2157;
        float _2531 = _2529 + _2401;
        float _2533 = fma(_2525, _2527, _2139);
        float _2535 = fma(_2517, _2527, _2153);
        float _2537 = fma(_2531, _2527, _2157);
        _2487 = _2535;
        _2473 = _2533;
        _2481 = _2537;
    }
    float _2539 = _2487;
    float _2541 = _2473;
    float _2543 = _2481;
    if (_2433)
    {
        _2451 = 1.0;
    }
    float _2545 = _2451;
    float _2547 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2549 = _2485 * _2547;
    float _2551 = _2545;
    if (!_2433)
    {
        float _2553 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2555 = _2553 * 0.15915493667125701904296875;
        float _2557 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2559 = _2555 * 6.283185482025146484375;
        float _2561 = cos(_2559);
        float _2563 = _2557 * 0.15915493667125701904296875;
        float _2565 = _2555 * 6.283185482025146484375;
        float _2567 = sin(_2565);
        float _2569 = 1.0 / _2561;
        float _2571 = _2563 * 6.283185482025146484375;
        float _2573 = cos(_2571);
        float _2575 = _2567 * _2569;
        float _2577 = _2563 * 6.283185482025146484375;
        float _2579 = sin(_2577);
        float _2581 = _2573 * _2575;
        float _2583 = 1.0 / _2581;
        float _2585 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2587 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2585;
        float _2589 = 1.0 / _2587;
        float _2591 = _2579 * _2583;
        float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2595 = fma(_2549, _2591, _2593);
        float _2597 = _2595 * _2589;
        float _2599 = precise::clamp(_2597, 0.0, 1.0);
        _546 = _2589;
        _2461 = _2599;
    }
    float _2601 = _546;
    float _2603 = _2461;
    float _2605 = _2601;
    if (!_2433)
    {
        float _2607 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2609 = _2607 * 0.15915493667125701904296875;
        float _2611 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2613 = _2609 * 6.283185482025146484375;
        float _2615 = cos(_2613);
        float _2617 = _2611 * 0.15915493667125701904296875;
        float _2619 = _2609 * 6.283185482025146484375;
        float _2621 = sin(_2619);
        float _2623 = 1.0 / _2615;
        float _2625 = _2617 * 6.283185482025146484375;
        float _2627 = cos(_2625);
        float _2629 = _2621 * _2623;
        float _2631 = _2617 * 6.283185482025146484375;
        float _2633 = sin(_2631);
        float _2635 = _2627 * _2629;
        float _2637 = 1.0 / _2635;
        float _2639 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2641 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2639;
        float _2643 = 1.0 / _2641;
        float _2645 = _2633 * _2637;
        float _2647 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2649 = fma(_2549, _2645, _2647);
        float _2651 = _2649 * _2643;
        float _2653 = precise::clamp(_2651, 0.0, 1.0);
        float _2655 = -_2653;
        float _2657 = _2655 + 1.0;
        _2453 = _2645;
        _2605 = _2635;
        _2551 = _2657;
    }
    float _2659 = _2453;
    float _2661 = _2605;
    float _2663 = _2551;
    float _2665 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2667 = _2539 + _2665;
    float _2669 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2671 = _2541 + _2669;
    float _2673 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2675 = _2543 + _2673;
    float _2677 = _2667 * _2667;
    float _2679 = fma(_2671, _2671, _2677);
    float _2681 = fma(_2675, _2675, _2679);
    float _2683 = rsqrt(_2681);
    float _2685 = sqrt(_2681);
    float _2687 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2689 = _2671 * _2687;
    float _2691 = _2675 * _2687;
    float _2693 = _2689 * _2689;
    float _2695 = _2691 * _2691;
    float _2697 = _2693 + _2695;
    float _2699 = sqrt(_2697);
    bool _2701 = _2699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2705 = _2699 + _2703;
    float _2707 = _2683;
    float _2709 = _2705;
    float _2711 = _2659;
    float _2713 = _2667;
    float _2715 = _2687;
    if (_2701)
    {
        float _2717 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2707 = _2717;
    }
    float _2719 = _2707;
    float _2721 = _2719;
    if (_2701)
    {
        float _2723 = _2705 * _2719;
        _2709 = _2723;
    }
    float _2725 = _2709;
    if (_2701)
    {
        float _2727 = rsqrt(_2697);
        _2721 = _2727;
    }
    float _2729 = _2721;
    float _2731 = _2729;
    if (_2701)
    {
        float _2733 = _2725 * 0.15915493667125701904296875;
        _2711 = _2733;
    }
    float _2735 = _2711;
    float _2737 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2739 = _2675;
    float _2741 = _2735;
    if (_2701)
    {
        float _2743 = _2735 * 6.283185482025146484375;
        float _2745 = sin(_2743);
        _2739 = _2745;
    }
    float _2747 = _2739;
    float _2749 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2751 = _2539 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2753 = precise::max(0.0, _2737);
    float _2755 = _2661;
    float _2757 = _2753;
    if (_2701)
    {
        float _2759 = _2735 * 6.283185482025146484375;
        float _2761 = cos(_2759);
        _2755 = _2761;
    }
    float _2763 = _2755;
    float _2765 = -_2687;
    float _2767 = -_2753;
    float _2769 = fma(_2667, _2765, _2767);
    if (_2701)
    {
        float _2771 = _2769 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2713 = _2771;
    }
    float _2773 = _2713;
    float _2775 = _2747;
    float _2777 = _2773;
    if (_2701)
    {
        float _2779 = fma(_2747, _2773, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2775 = _2779;
    }
    float _2781 = _2775;
    float _2783 = _2781;
    if (!_2701)
    {
        _2777 = _2769;
    }
    float _2785 = _2777;
    float _2787 = _2785;
    if (_2701)
    {
        float _2789 = _2729 * _2781;
        _2715 = _2789;
    }
    float _2791 = _2715;
    if (!_2701)
    {
        _2731 = _2689;
    }
    float _2793 = _2731;
    float _2795 = _2793;
    float _2797 = _2763;
    if (_2701)
    {
        float _2799 = _2763 + (-1.0);
        _2757 = _2799;
    }
    float _2801 = _2757;
    float _2803 = _2801;
    if (_2701)
    {
        float _2805 = _2689 * _2791;
        _2795 = _2805;
    }
    float _2807 = _2795;
    if (!_2701)
    {
        _2783 = _2693;
    }
    float _2809 = _2783;
    float _2811 = _2539 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2813 = _2809;
    if (_2701)
    {
        float _2815 = _2801 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2741 = _2815;
    }
    float _2817 = _2741;
    if (!_2701)
    {
        _2803 = _2691;
    }
    float _2819 = _2803;
    float _2821 = _2819;
    if (_2701)
    {
        float _2823 = _2691 * _2791;
        _2821 = _2823;
    }
    float _2825 = _2821;
    if (_2701)
    {
        float _2827 = _2807 * _2807;
        _2813 = _2827;
    }
    float _2829 = _2813;
    if (_2701)
    {
        float _2831 = fma(_2769, _2763, _2817);
        _2787 = _2831;
    }
    float _2833 = _2787;
    if (!_2701)
    {
        _2797 = _2695;
    }
    float _2835 = _2797;
    float _2837 = _2835;
    if (_2701)
    {
        float _2839 = _2825 * _2825;
        _2837 = _2839;
    }
    float _2841 = _2837;
    float _2843 = _2539 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2845 = fma(_2833, _2833, _2829);
    float _2847 = fma(_2541, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2811);
    float _2849 = fma(_2541, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2843);
    float _2851 = _2845 + _2841;
    float _2853 = fma(_2541, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2751);
    float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2857 = fma(_2685, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2855);
    float _2859 = precise::clamp(_2857, 0.0, 1.0);
    float _2861 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2849);
    float _2863 = rsqrt(_2851);
    float _2865 = _2539 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2867 = -_2859;
    float _2869 = _2867 + 1.0;
    float _2871 = _2861 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2873 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2847);
    float _2875 = fma(_2541, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2865);
    float _2877 = _2871 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2879 = abs(_2869);
    float _2881 = log2(_2879);
    float _2883 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2853);
    float _2885 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2875);
    float _2887 = -_2877;
    float _2889 = fma(_2887, _2749, 1.0);
    float _2891 = _2883 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2893 = _2885 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2895 = _2873 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2897 = _2863 * _2807;
    float _2899 = _2891 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2901 = _2863 * _2833;
    float _2903 = _2863 * _2825;
    float _2905 = _2897 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2907 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2899);
    float _2909 = log2(_2889);
    float _2911 = _2891 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2913 = -_2905;
    float _2915 = fma(_2901, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2913);
    float _2917 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2919 = fma(_2871, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2907);
    float _2921 = -_2903;
    float _2923 = fma(_2921, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2915);
    float _2925 = _2891 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2927 = exp2(_2917);
    float _2929 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2919);
    float _2931 = fma(_2923, -0.5, 0.5);
    float _2933 = fma(_2923, 0.5, 0.5);
    float _2935 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2925);
    float _2937 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2911);
    float _2939 = _2901 + 1.0;
    float _2941 = fma(_2933, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2943 = 1.0 / _2929;
    float _2945 = fma(_2871, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2935);
    float _2947 = fma(_2871, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2937);
    float _2949 = fma(_2933, _2941, -0.212114393711090087890625);
    float _2951 = _2909 * 0.693147182464599609375;
    float _2953 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2945);
    float _2955 = fma(_2933, _2949, 1.570728778839111328125);
    float _2957 = sqrt(_2931);
    float _2959 = -_2901;
    float _2961 = fma(_2927, _2939, _2959);
    float _2963 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2947);
    float _2965 = _2951 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2967 = fma(_2961, 0.5, 0.5);
    float _2969 = _2953 * _2943;
    float _2971 = _2963 * _2943;
    float _2973 = fma(_2969, 0.5, 0.5);
    float _2975 = fma(_2971, -0.5, 0.5);
    float _2977 = _2957 * 0.636619746685028076171875;
    float3 _7868 = float3(_2973, _2975, _2965);
    float _2979 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7868, float3(0.0), isnan(_7868)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7868, float3(0.0), isnan(_7868)), level(0.0)).x;
    float _2981 = -_2955;
    float _2983 = fma(_2977, _2981, 1.0);
    float3 _7884 = float3(_2973, _2975, _2965);
    float4 _2986 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7884, float3(0.0), isnan(_7884)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7884, float3(0.0), isnan(_7884)), level(0.0)).xyzw;
    float _2988 = _2986.x;
    float _2990 = _2986.y;
    float _2992 = _2986.z;
    float _2994 = _2986.w;
    float2 _7901 = float2(_2983, _2967);
    float3 _2998 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7901, float2(0.0), isnan(_7901)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7901, float2(0.0), isnan(_7901)), level(0.0)).xyz;
    float _3000 = _2998.x;
    float _3002 = _2998.y;
    float _3004 = _2998.z;
    float _3006 = _2881 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3008 = _2891 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3010 = _2929 * 0.5;
    float _3012 = _2953 + _2929;
    float _3014 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3008);
    float _3016 = exp2(_3006);
    float _3018 = _3012 * 0.5;
    out.m_79.x = _2541;
    out.m_79.y = _2539;
    out.m_79.z = _2543;
    float _3020 = fma(_2871, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3014);
    float _3022 = fma(_2963, -0.5, _3010);
    bool _3024 = _2685 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3026 = isnan(_2685);
    bool _3028 = _3024 || _3026;
    bool _3030 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3032 = _3028 || _3030;
    float _3034 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3020);
    out.m_81.x = _2139;
    out.m_81.y = _2153;
    out.m_81.z = _2157;
    float _3036 = _3034 + _2929;
    out.gl_Position.x = _2953;
    out.gl_Position.y = _2963;
    out.gl_Position.z = _3034;
    out.gl_Position.w = _2929;
    float _3038 = _3036 * 0.5;
    float _3040 = -_3016;
    float _3042 = _3040 + 1.0;
    float _3044 = _3042 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _3018;
    out.m_83.y = _3022;
    out.m_83.z = _3038;
    out.m_83.w = _2929;
    float _3046 = _2953;
    float _3048 = _2963;
    if (!_3032)
    {
        _2173 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3050 = _2173;
    float _3052 = -_3044;
    float _3054 = _3052 + 1.0;
    float _3056 = _3050;
    float _3058 = _3050;
    if (!_3032)
    {
        _2175 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3060 = _2175;
    float _3062 = _3060;
    float _3064 = _3060;
    if (!_3032)
    {
        _3046 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3066 = _3046;
    float _3068 = _3066;
    float _3070 = _3066;
    if (!_3032)
    {
        _3048 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3072 = _3048;
    float _3074 = _3072;
    float _3076 = _3072;
    if (!_3032)
    {
        _2177 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3078 = _2177;
    float _3080 = _3044 * _2979;
    float _3082 = _2603 * _2663;
    float _3084 = _2994 * _3080;
    float _3086 = _2994 * _3054;
    float _3088 = _3082 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3090 = _3004 * _3080;
    float _3092 = fma(_3000, _3084, _2988);
    float _3094 = fma(_3002, _3084, _2990);
    float _3096 = _528 * _3088;
    float _3098 = fma(_2994, _3090, _2992);
    float _3100 = _3088;
    float _3102 = _3078;
    float _3104 = _3078;
    if (!_3032)
    {
        _3100 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3106 = _3100;
    out.m_85.x = _3092;
    out.m_85.y = _3094;
    out.m_85.z = _3098;
    out.m_85.w = _3086;
    bool _3108 = !_3032;
    float _3110 = _3106;
    float _3112 = _3106;
    if (!_3108)
    {
        bool _3114 = _2685 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3116 = isnan(_2685);
        bool _3118 = _3114 || _3116;
        bool _3120 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3122 = _3118 || _3120;
        if (!_3122)
        {
            float _3124 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3126 = _2685 + _3124;
            float _3128 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3130 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3128;
            float _3132 = 1.0 / _3130;
            float _3134 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3136 = _3134 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3138 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3140 = _3138 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3142 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3144 = _3142 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3146 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3148 = _3146 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3150 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3152 = _3150 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3154 = _3126 * _3132;
            float _3156 = precise::clamp(_3154, 0.0, 1.0);
            float _3158 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3160 = _3158 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3162 = fma(_3156, _3136, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3164 = fma(_3156, _3160, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3166 = fma(_3156, _3140, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3168 = fma(_3156, _3144, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3170 = fma(_3156, _3148, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3172 = fma(_3156, _3152, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3076 = _3164;
            _3104 = _3170;
            _3070 = _3162;
            _3064 = _3168;
            _3058 = _3166;
            _3112 = _3172;
            _3174 = true;
        }
        else
        {
            bool _3176 = _2685 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3178 = isnan(_2685);
            bool _3180 = _3176 || _3178;
            bool _3182 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3184 = _3180 || _3182;
            if (!_3184)
            {
                _3068 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3186 = _3068;
            _3070 = _3186;
            if (!_3184)
            {
                _3074 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3188 = _3074;
            _3076 = _3188;
            if (!_3184)
            {
                _3056 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3190 = _3056;
            _3058 = _3190;
            if (!_3184)
            {
                _3062 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3192 = _3062;
            _3064 = _3192;
            if (!_3184)
            {
                _3102 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3194 = _3102;
            _3104 = _3194;
            if (!_3184)
            {
                _3110 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3196 = _3110;
            bool _3198 = !_3184;
            _3112 = _3196;
            if (!_3198)
            {
                bool _3200 = _2685 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3202 = isnan(_2685);
                bool _3204 = _3200 || _3202;
                bool _3206 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3208 = _3204 || _3206;
                if (!_3208)
                {
                    float _3210 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3212 = _2685 + _3210;
                    float _3214 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3216 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3214;
                    float _3218 = 1.0 / _3216;
                    float _3220 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3222 = _3220 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3224 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3226 = _3224 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3228 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3230 = _3228 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3232 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3234 = _3232 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3236 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3238 = _3236 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3240 = _3212 * _3218;
                    float _3242 = precise::clamp(_3240, 0.0, 1.0);
                    float _3244 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3246 = _3244 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3248 = fma(_3242, _3222, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3250 = fma(_3242, _3246, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3252 = fma(_3242, _3226, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3254 = fma(_3242, _3230, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3256 = fma(_3242, _3234, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3258 = fma(_3242, _3238, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3076 = _3250;
                    _3104 = _3256;
                    _3070 = _3248;
                    _3064 = _3254;
                    _3058 = _3252;
                    _3112 = _3258;
                    _3174 = true;
                }
                else
                {
                    _3076 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3104 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3070 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3064 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3058 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3112 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3174 = false;
    float _3260 = _3076;
    float _3262 = _3104;
    float _3264 = _3070;
    float _3266 = _3064;
    float _3268 = _3058;
    float _3270 = _3112;
    float _3272 = fma(_2127, -0.5, 0.5);
    float _3274 = precise::clamp(_3272, 0.0, 1.0);
    float _3276 = -_3260;
    float _3278 = _3276 + _3262;
    float _3280 = _3096 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3282 = -_3264;
    float _3284 = _3282 + _3266;
    out.m_87.x = 0.0;
    float _3286 = fma(_3274, _3278, _3260);
    float _3288 = fma(_3274, _3284, _3264);
    out.m_51.x = _3280;
    float _3290 = -_3268;
    float _3292 = _3290 + _3270;
    float _3294 = _3286 * 0.586610972881317138671875;
    bool _3296 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3298 = fma(_3274, _3292, _3268);
    float _3300 = fma(_3288, 0.298911988735198974609375, _3294);
    bool _3302 = _2603 > 0.0;
    bool _3304 = isnan(_2603);
    bool _3306 = _3302 || _3304;
    bool _3308 = isnan(0.0);
    bool _3310 = _3306 || _3308;
    float _3312 = fma(_3298, 0.114477999508380889892578125, _3300);
    bool _3314 = _2663 <= 0.0;
    bool _3316 = !_3310;
    bool _3318 = _3314 || _3316;
    float _3320 = -_3312;
    float _3322 = _3288 + _3320;
    float _3324 = -_3312;
    float _3326 = _3286 + _3324;
    float _3328 = -_3312;
    float _3330 = _3298 + _3328;
    float _3332 = fma(_3322, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3312);
    float _3334 = fma(_3326, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3312);
    float _3336 = fma(_3330, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3312);
    bool _3338 = !_3296;
    if (!_3338)
    {
        float _3340 = -_2539;
        float _3342 = _3340 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3344 = -_2541;
        float _3346 = _3344 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3348 = -_2543;
        float _3350 = _3348 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3352 = _3342 * _3342;
        float _3354 = fma(_3346, _3346, _3352);
        float _3356 = fma(_3350, _3350, _3354);
        float _3358 = sqrt(_3356);
        float _3360 = rsqrt(_3356);
        float _3362 = -_3358;
        float _3364 = _3362 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3366 = _3364 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3368 = precise::clamp(_3366, 0.0, 1.0);
        float _3370 = _3346 * _3360;
        float _3372 = _3342 * _3360;
        float _3374 = abs(_3368);
        float _3376 = log2(_3374);
        float _3378 = _3350 * _3360;
        float _3380 = _3370 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3382 = _2127 * _3372;
        float _3384 = -_3372;
        float _3386 = -_3380;
        float _3388 = fma(_3384, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3386);
        float _3390 = fma(_2123, _3370, _3382);
        float _3392 = -_3378;
        float _3394 = fma(_3392, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3388);
        float _3396 = fma(_2131, _3378, _3390);
        float _3398 = precise::clamp(_3396, 0.0, 1.0);
        float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3402 = _3394 + _3400;
        float _3404 = _3376 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3406 = _3402 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3408 = precise::clamp(_3406, 0.0, 1.0);
        float _3410 = exp2(_3404);
        float _3412 = _3410 * _3408;
        float _3414 = _3398 * _3412;
        float _3416 = _3414 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3418 = _3414 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3420 = _3414 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3416;
        out.m_87.y = _3418;
        out.m_87.z = _3420;
    }
    out.m_69.x = _3332;
    out.m_69.y = _3334;
    out.m_69.z = _3336;
    if (!_3318)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3422 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3422;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

