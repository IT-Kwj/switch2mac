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
    float4 m_65 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    float _106 = as_type<float>(_98);
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    if (!_102)
    {
        out.m_45.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1658 = as_type<float>(_114);
        out.gl_Position.z = _1658;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_47.w;
    float _120 = in.m_49.x;
    float _122 = in.m_49.y;
    bool _124 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_118);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_118;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.x = _120;
    out.m_51.y = _122;
    float _138 = _122;
    if (_132)
    {
        float _140 = float(_98);
        _106 = _140;
    }
    float _142 = _106;
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
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _116 = as_type<int>(_154);
    }
    int _156 = _116;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1736 = as_type<float>(_156);
        out.gl_Position.z = _1736;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _160 = _136 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _162 = in.m_53.x;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _166 = _164 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _170 = _168 != 0;
    float _172 = in.m_55.x;
    float _174 = in.m_55.y;
    float _176 = in.m_55.z;
    float _178 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _180 = in.m_53.z;
    int _182 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _184 = _182 != 0;
    float _186 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _178);
    float _188 = _160 * _158;
    bool _190 = !_166;
    int _192 = _190 ? 0 : 1;
    float _194 = in.m_53.y;
    float _196 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[20].x, _188);
    int _198 = abs(_192);
    float _200 = in.m_42.x;
    float _202 = in.m_42.y;
    float _204 = in.m_42.z;
    float _206 = floor(_196);
    float _208 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _186);
    float _210 = rsqrt(_208);
    float _212 = -_206;
    float _214 = _196 + _212;
    float _216 = _196 * 6.283185482025146484375;
    float _218 = _216 * 0.15915493667125701904296875;
    float _220 = _202 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _222 = _202 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _224 = _202 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _226 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[4].x, _220);
    float _228 = _218 * 6.283185482025146484375;
    float _230 = cos(_228);
    float _232 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[5].x, _222);
    float _234 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[6].x, _224);
    bool _236 = !_184;
    int _238 = _236 ? 0 : 1;
    float _240 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[4].z, _226);
    float _242 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].z, _232);
    float _244 = float(_198);
    float _246 = -_214;
    float _248 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _250 = abs(_238);
    float _252 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[6].z, _234);
    bool _254 = _214 < 0.5;
    float _256 = float(_254);
    float _258 = abs(_248);
    float _260 = _244 * _258;
    float _262 = float(_250);
    float _264 = fma(_230, 0.5, 0.5);
    float _266 = -_256;
    float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _270 = _242 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _272 = -_264;
    float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _276 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.166666686534881591796875;
    float _278 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _280 = _270 + _278;
    float _282 = fma(_262, _274, _260);
    bool _284 = !_170;
    int _286 = _284 ? 0 : 1;
    float _288 = _240 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _290 = _252 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _292 = ceil(_276);
    int _294 = abs(_286);
    float _296 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _298 = _288 + _296;
    float _300 = _280 * _280;
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _304 = _290 + _302;
    float _306 = fma(_298, _298, _300);
    float _308 = float(_294);
    float _310 = fma(_304, _304, _306);
    float _312 = abs(_268);
    float _314 = fma(_308, _312, _282);
    float _316 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = rsqrt(_310);
    float _320 = _210 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _322 = _292 * 0.20000000298023223876953125;
    float _324 = _314 * _316;
    float _326 = _210 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _328 = _320 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _330 = fma(_174, 0.5, _322);
    float _332 = _324 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _334 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[8].y, _328);
    float _336 = _330 * 6.283185482025146484375;
    float _338 = _332 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _340 = _336 * 0.15915493667125701904296875;
    bool _342 = _334 > 0.0;
    float _344 = _338 * _318;
    bool _346 = _334 >= 0.0;
    bool _348 = isnan(_334);
    bool _350 = _346 || _348;
    bool _352 = isnan(0.0);
    bool _354 = _350 || _352;
    float _356 = _280 * _344;
    float _358 = _298 * _344;
    float _360 = _304 * _344;
    float _362 = _340 * 6.283185482025146484375;
    float _364 = sin(_362);
    float _366 = -_356;
    float _368 = _280 + _366;
    float _370 = -_358;
    float _372 = _298 + _370;
    float _374 = -_360;
    float _376 = _304 + _374;
    int _378 = _354 ? 0 : 1;
    float _380 = _368 * _368;
    int _382 = ~_378;
    int _384 = _382 + 1;
    int _386 = _384 + 1;
    float _388 = fma(_372, _372, _380);
    int _390 = _386;
    float _392 = _356;
    if (!_342)
    {
        int _394 = ~_378;
        int _396 = _394 + 1;
        _390 = _396;
    }
    int _398 = _390;
    float _400 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _402 = fma(_376, _376, _388);
    float _404 = float(_398);
    float _406 = _194 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = fma(_364, 0.20000000298023223876953125, 1.0);
    float _410 = _314 * _400;
    float _412 = sqrt(_402);
    float _414 = 0.0 + _404;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = _314 * _406;
    float _420 = _408 * _172;
    float _422 = _408 * _176;
    float _424 = fma(_416, -3.1415927410125732421875, 3.1415927410125732421875);
    float _426 = _410 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _420);
    float _430 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _422);
    float _432 = _424 * 0.15915493667125701904296875;
    float _434 = _408 * _174;
    float _436 = _318 * _412;
    float _438 = _432 * 6.283185482025146484375;
    float _440 = sin(_438);
    float _442 = _436 * _426;
    float _444 = _332 * _436;
    float _446 = _418 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _448 = _430 * _442;
    float _450 = _428 * _444;
    float _452 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _434);
    float _454 = _436 * _446;
    float _456 = _432 * 6.283185482025146484375;
    float _458 = cos(_456);
    float _460 = _448 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _462 = -_356;
    float _464 = _270 + _462;
    float _466 = _452 * _454;
    float _468 = _448 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _470 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[8].x, _460);
    float _472 = _464 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _474 = -_360;
    float _476 = _290 + _474;
    float _478 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[10].x, _468);
    float _480 = -_466;
    float _482 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[8].z, _470);
    float _484 = -_358;
    float _486 = _288 + _484;
    float _488 = _448 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _490 = -_466;
    float _492 = fma(_490, (*spvDescriptorSet0.vp_c10)._m0[10].z, _478);
    float _494 = _482 * _440;
    float _496 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[11].x, _472);
    float _498 = _482 * _458;
    float _500 = -_494;
    float _502 = fma(_492, _458, _500);
    float _504 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[11].z, _496);
    float _506 = fma(_492, _440, _498);
    float _508 = _290 + _502;
    float _510 = _504 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _512 = _464 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _514 = _288 + _506;
    float _516 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _518 = _508 + _516;
    float _520 = 1.0 / _510;
    float _522 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[10].x, _512);
    float _524 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _526 = _514 + _524;
    float _528 = _518 * _518;
    float _530 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[10].z, _522);
    float _532 = fma(_526, _526, _528);
    float _534 = _530 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _536 = sqrt(_532);
    float _538 = _534 + _510;
    float _540 = _538 * _520;
    float _542 = _540 * 0.5;
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _546 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[30].w, _544);
    float _548 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[9].x, _488);
    float _550 = 1.0 / _546;
    float _552 = -_466;
    float _554 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[9].z, _548);
    bool _556 = _536 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _558 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _560 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.5);
    bool _566 = _562 || _564;
    float _568 = _270 + _554;
    bool _570 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _572 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.5);
    bool _578 = _574 || _576;
    float _580 = _512;
    float _582 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _584 = _568;
    float _586 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _588 = _436;
    float _590 = _526;
    float _592 = _464;
    float _594 = _486;
    if (!_556)
    {
        _580 = _514;
    }
    float _596 = _580;
    float _598 = _596;
    if (!_556)
    {
        _582 = _508;
    }
    float _600 = _582;
    bool _602 = !_556;
    float _604 = _600;
    if (!_602)
    {
        float _606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _608 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _610 = _536 + _608;
        float _612 = rsqrt(_532);
        float _614 = _610 * _606;
        float _616 = _568 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _618 = _614 * 0.15915493667125701904296875;
        float _620 = _618 * 6.283185482025146484375;
        float _622 = cos(_620);
        float _624 = _618 * 6.283185482025146484375;
        float _626 = sin(_624);
        float _628 = _622 + (-1.0);
        float _630 = _628 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _632 = fma(_626, _616, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _634 = fma(_568, _622, _630);
        float _636 = _612 * _632;
        float _638 = fma(_526, _636, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _640 = fma(_518, _636, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _598 = _638;
        _604 = _640;
        _584 = _634;
        _586 = _626;
    }
    float _642 = _598;
    float _644 = _604;
    float _646 = _584;
    float _648 = _586;
    float _650 = -_358;
    float _652 = _650 + _642;
    float _654 = -_360;
    float _656 = _654 + _644;
    float _658 = -_356;
    float _660 = _658 + _646;
    float _662 = _648;
    float _664 = _652;
    float _666 = _660;
    if (_566)
    {
        _662 = 1.0;
    }
    float _668 = _662;
    float _670 = _668;
    if (_578)
    {
        _392 = _652;
    }
    float _672 = _392;
    float _674 = _672;
    if (_578)
    {
        _664 = _656;
    }
    float _676 = _664;
    float _678 = _676;
    if (!_578)
    {
        float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _682 = _464 + _680;
        float _684 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _686 = _486 + _684;
        float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _690 = -_290;
        float _692 = _690 + _644;
        float _694 = _682 * _682;
        float _696 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _698 = _476 + _696;
        float _700 = -_288;
        float _702 = _700 + _642;
        float _704 = -_270;
        float _706 = _704 + _646;
        float _708 = fma(_686, _686, _694);
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _712 = fma(_698, _698, _708);
        float _714 = sqrt(_712);
        float _716 = 1.0 / _436;
        float _718 = _710 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _720 = precise::min(_714, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _722 = _720 * _688;
        float _724 = _722 * _716;
        float _726 = _718 * _724;
        float _728 = _692 * _724;
        float _730 = fma(_702, _726, _486);
        float _732 = fma(_706, _726, _464);
        float _734 = fma(_718, _728, _476);
        _666 = _732;
        _674 = _730;
        _678 = _734;
        _588 = _716;
    }
    float _736 = _666;
    float _738 = _674;
    float _740 = _678;
    float _742 = _588;
    float _744 = _742;
    if (_566)
    {
        _590 = 1.0;
    }
    float _746 = _590;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _750 = _550 * _748;
    float _752 = _746;
    if (!_566)
    {
        float _754 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _756 = _754 * 0.15915493667125701904296875;
        float _758 = _756 * 6.283185482025146484375;
        float _760 = cos(_758);
        float _762 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _764 = _762 * 0.15915493667125701904296875;
        float _766 = _756 * 6.283185482025146484375;
        float _768 = sin(_766);
        float _770 = 1.0 / _760;
        float _772 = _764 * 6.283185482025146484375;
        float _774 = cos(_772);
        float _776 = _768 * _770;
        float _778 = _764 * 6.283185482025146484375;
        float _780 = sin(_778);
        float _782 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _784 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _782;
        float _786 = _774 * _776;
        float _788 = 1.0 / _784;
        float _790 = 1.0 / _786;
        float _792 = _780 * _790;
        float _794 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _796 = fma(_750, _792, _794);
        float _798 = _796 * _788;
        float _800 = precise::clamp(_798, 0.0, 1.0);
        _592 = _764;
        _744 = _788;
        _670 = _800;
    }
    float _802 = _592;
    float _804 = _744;
    float _806 = _670;
    float _808 = _804;
    float _810 = _802;
    if (!_566)
    {
        float _812 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _814 = _812 * 0.15915493667125701904296875;
        float _816 = _814 * 6.283185482025146484375;
        float _818 = cos(_816);
        float _820 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _822 = _820 * 0.15915493667125701904296875;
        float _824 = _814 * 6.283185482025146484375;
        float _826 = sin(_824);
        float _828 = 1.0 / _818;
        float _830 = _822 * 6.283185482025146484375;
        float _832 = cos(_830);
        float _834 = _826 * _828;
        float _836 = _822 * 6.283185482025146484375;
        float _838 = sin(_836);
        float _840 = _832 * _834;
        float _842 = 1.0 / _840;
        float _844 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _846 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _844;
        float _848 = 1.0 / _846;
        float _850 = _838 * _842;
        float _852 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _854 = fma(_750, _850, _852);
        float _856 = _854 * _848;
        float _858 = precise::clamp(_856, 0.0, 1.0);
        float _860 = -_858;
        float _862 = _860 + 1.0;
        _808 = _842;
        _810 = _828;
        _752 = _862;
    }
    float _864 = _808;
    float _866 = _810;
    float _868 = _752;
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _872 = _736 + _870;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _876 = _738 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _880 = _740 + _878;
    float _882 = _872 * _872;
    float _884 = fma(_876, _876, _882);
    float _886 = fma(_880, _880, _884);
    float _888 = rsqrt(_886);
    float _890 = _888 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _892 = _876 * _890;
    float _894 = _880 * _890;
    float _896 = _892 * _892;
    float _898 = _894 * _894;
    float _900 = _896 + _898;
    float _902 = sqrt(_900);
    bool _904 = _902 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _906 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _908 = _902 + _906;
    float _910 = _888;
    float _912 = _866;
    float _914 = _908;
    float _916 = _890;
    if (_904)
    {
        float _918 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _910 = _918;
    }
    float _920 = _910;
    if (_904)
    {
        float _922 = rsqrt(_900);
        _912 = _922;
    }
    float _924 = _912;
    float _926 = _924;
    if (_904)
    {
        float _928 = _908 * _920;
        _914 = _928;
    }
    float _930 = _914;
    if (_904)
    {
        float _932 = _930 * 0.15915493667125701904296875;
        _594 = _932;
    }
    float _934 = _594;
    float _936 = _880;
    if (_904)
    {
        float _938 = _934 * 6.283185482025146484375;
        float _940 = sin(_938);
        _936 = _940;
    }
    float _942 = _936;
    float _944 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _946 = precise::max(0.0, _944);
    float _948 = _864;
    float _950 = _946;
    float _952 = _944;
    if (_904)
    {
        float _954 = _934 * 6.283185482025146484375;
        float _956 = cos(_954);
        _948 = _956;
    }
    float _958 = _948;
    float _960 = -_890;
    float _962 = -_946;
    float _964 = fma(_872, _960, _962);
    float _966 = _964;
    if (_904)
    {
        float _968 = _964 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _950 = _968;
    }
    float _970 = _950;
    float _972 = sqrt(_886);
    float _974 = _970;
    float _976 = _942;
    if (_904)
    {
        float _978 = fma(_942, _970, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _974 = _978;
    }
    float _980 = _974;
    float _982 = _980;
    if (!_904)
    {
        _976 = _892;
    }
    float _984 = _976;
    float _986 = _984;
    float _988 = _958;
    if (_904)
    {
        float _990 = _958 + (-1.0);
        _952 = _990;
    }
    float _992 = _952;
    float _994 = _992;
    if (_904)
    {
        float _996 = _924 * _980;
        _916 = _996;
    }
    float _998 = _916;
    if (!_904)
    {
        _982 = _896;
    }
    float _1000 = _982;
    float _1002 = _1000;
    if (_904)
    {
        float _1004 = _992 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _926 = _1004;
    }
    float _1006 = _926;
    if (_904)
    {
        float _1008 = _892 * _998;
        _986 = _1008;
    }
    float _1010 = _986;
    if (!_904)
    {
        _994 = _894;
    }
    float _1012 = _994;
    float _1014 = _1012;
    if (_904)
    {
        float _1016 = _894 * _998;
        _1014 = _1016;
    }
    float _1018 = _1014;
    if (_904)
    {
        float _1020 = fma(_964, _958, _1006);
        _966 = _1020;
    }
    float _1022 = _966;
    if (_904)
    {
        float _1024 = _1010 * _1010;
        _1002 = _1024;
    }
    float _1026 = _1002;
    if (!_904)
    {
        _988 = _898;
    }
    float _1028 = _988;
    float _1030 = _1028;
    if (_904)
    {
        float _1032 = _1018 * _1018;
        _1030 = _1032;
    }
    float _1034 = _1030;
    float _1036 = fma(_1022, _1022, _1026);
    float _1038 = _736 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1040 = _1036 + _1034;
    float _1042 = _736 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1046 = fma(_972, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1044);
    float _1048 = precise::clamp(_1046, 0.0, 1.0);
    float _1050 = _736 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1052 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1054 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1042);
    float _1056 = rsqrt(_1040);
    float _1058 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1050);
    float _1060 = -_1048;
    float _1062 = _1060 + 1.0;
    float _1064 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1054);
    float _1066 = _736 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1068 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1058);
    float _1070 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1038);
    float _1072 = _1064 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1074 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1066);
    float _1076 = abs(_1062);
    float _1078 = log2(_1076);
    float _1080 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1082 = _1072 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1084 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1074);
    float _1086 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1070);
    float _1088 = -_1082;
    float _1090 = fma(_1088, _1052, 1.0);
    float _1092 = _1056 * _1010;
    float _1094 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1096 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1098 = _1056 * _1022;
    float _1100 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1102 = _1056 * _1018;
    float _1104 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1096);
    float _1106 = _1086 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1108 = -_1100;
    float _1110 = fma(_1098, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1108);
    float _1112 = _1078 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1114 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1104);
    float _1116 = log2(_1090);
    float _1118 = -_1102;
    float _1120 = fma(_1118, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1110);
    float _1122 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1124 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1114);
    float _1126 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1128 = fma(_1120, -0.5, 0.5);
    float _1130 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1122);
    float _1132 = fma(_1120, 0.5, 0.5);
    float _1134 = exp2(_1112);
    float _1136 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1126);
    float _1138 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1130);
    float _1140 = _1098 + 1.0;
    float _1142 = fma(_1132, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1144 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1136);
    float _1146 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1138);
    float _1148 = 1.0 / _1124;
    float _1150 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1144);
    float _1152 = _1116 * 0.693147182464599609375;
    float _1154 = fma(_1132, _1142, -0.212114393711090087890625);
    float _1156 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1158 = fma(_1132, _1154, 1.570728778839111328125);
    float _1160 = sqrt(_1128);
    float _1162 = -_1098;
    float _1164 = fma(_1134, _1140, _1162);
    float _1166 = fma(_1164, 0.5, 0.5);
    float _1168 = _1146 * _1148;
    float _1170 = _1150 * _1148;
    float _1172 = fma(_1168, 0.5, 0.5);
    float _1174 = fma(_1170, -0.5, 0.5);
    float _1176 = _1160 * 0.636619746685028076171875;
    float3 _3302 = float3(_1172, _1174, _1156);
    float _1178 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3302, float3(0.0), isnan(_3302)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3302, float3(0.0), isnan(_3302)), level(0.0)).x;
    float3 _3313 = float3(_1172, _1174, _1156);
    float4 _1181 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3313, float3(0.0), isnan(_3313)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3313, float3(0.0), isnan(_3313)), level(0.0)).xyzw;
    float _1183 = _1181.x;
    float _1185 = _1181.y;
    float _1187 = _1181.z;
    float _1189 = _1181.w;
    float _1191 = -_1158;
    float _1193 = fma(_1176, _1191, 1.0);
    float2 _3335 = float2(_1193, _1166);
    float3 _1197 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3335, float2(0.0), isnan(_3335)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3335, float2(0.0), isnan(_3335)), level(0.0)).xyz;
    float _1199 = _1197.x;
    float _1201 = _1197.y;
    float _1203 = _1197.z;
    float _1205 = in.m_49.w;
    float _1207 = _1078 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1209 = _434 != 0.0;
    bool _1211 = isnan(_434);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan(0.0);
    bool _1217 = _1213 || _1215;
    float _1219 = in.m_57.y;
    int _1221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1223 = _1221 != 0;
    float _1225 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1229 = _1227 != 0;
    float _1231 = in.m_57.x;
    int _1233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1235 = _1233 != 0;
    float _1237 = exp2(_1207);
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1241 = _1239 != 0;
    float _1243 = in.m_59.x;
    float _1245 = in.m_59.y;
    float _1247 = in.m_59.z;
    float _1249 = in.m_59.w;
    bool _1251 = _420 == 0.0;
    bool _1253 = !_1217;
    bool _1255 = _1251 && _1253;
    out.m_61.y = _434;
    int _1257 = 0;
    bool _1259 = _1235;
    if (_1223)
    {
        float _1261 = in.m_49.z;
        _1257 = as_type<int>(_1261);
    }
    int _1263 = _1257;
    bool _1265 = _422 == 0.0;
    bool _1267 = _1265 && _1255;
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1273 = _1205 > 0.5;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1277 = in.m_63.x;
    float _1279 = in.m_63.y;
    float _1281 = in.m_63.z;
    float _1283 = -_1219;
    float _1285 = _1283 + 1.0;
    bool _1287 = _122 > 0.5;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1291 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1293 = _1271 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1295 = _1273 ? as_type<int>(_1285) : as_type<int>(_1219);
    float _1297 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1299 = _1273;
    float _1301 = _1219;
    float _1303 = _1285;
    float _1305 = _1297;
    float _1307 = _1291;
    float _1309 = _1293;
    if (_1229)
    {
        bool _1311 = _120 > 0.5;
        _1299 = _1311;
    }
    bool _1313 = _1299;
    int _1315 = 0;
    if (_1229)
    {
        float _1317 = -_1231;
        float _1319 = _1317 + 1.0;
        _1315 = as_type<int>(_1319);
    }
    int _1321 = _1315;
    float _1323 = _1235 ? as_type<float>(_1295) : _1219;
    float _1325 = -_1237;
    float _1327 = _1325 + 1.0;
    if (_1241)
    {
        float _1329 = _1287 ? _1285 : _1219;
        _1301 = _1329;
    }
    float _1331 = _1301;
    out.m_65.x = _1291;
    out.m_65.y = _1293;
    out.m_65.z = _1297;
    out.m_65.w = _1289;
    float _1333 = 0.0;
    if (!_1229)
    {
        _1333 = _1231;
    }
    float _1335 = _1333;
    float _1337 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1339 = _1335;
    if (!_1223)
    {
        _138 = _1231;
    }
    float _1341 = _138;
    out.m_67.x = _738;
    out.m_67.y = _736;
    out.m_67.z = _740;
    int _1343 = _1263;
    float _1345 = _1341;
    if (_1223)
    {
        bool _1347 = as_type<float>(_1263) > 0.5;
        _1259 = _1347;
    }
    bool _1349 = _1259;
    if (_1223)
    {
        float _1351 = -_1231;
        float _1353 = _1351 + 1.0;
        _1343 = as_type<int>(_1353);
    }
    int _1355 = _1343;
    if (_1229)
    {
        float _1357 = _1313 ? as_type<float>(_1321) : _1231;
        _1339 = _1357;
    }
    float _1359 = _1339;
    float _1361 = _1277;
    if (_1267)
    {
        _1303 = _1277;
    }
    float _1363 = _1303;
    float _1365 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1367 = 0.0;
    float _1369 = _1363;
    if (_1267)
    {
        _1367 = _1279;
    }
    float _1371 = _1367;
    float _1373 = _1247 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1375 = _1371;
    if (_1267)
    {
        _1305 = _1281;
    }
    float _1377 = _1305;
    float _1379 = _1377;
    if (_1267)
    {
        _1307 = _1363;
    }
    float _1381 = _1307;
    float _1383 = _1381;
    if (!_1267)
    {
        _1369 = _1277;
    }
    float _1385 = _1369;
    if (_1267)
    {
        _1309 = _1371;
    }
    float _1387 = _1309;
    float _1389 = _1387;
    if (_1267)
    {
        _1361 = _1377;
    }
    float _1391 = _1361;
    float _1393 = _1391;
    if (!_1267)
    {
        float _1395 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1385);
        _1383 = _1395;
    }
    float _1397 = _1383;
    if (!_1267)
    {
        _1375 = _1279;
    }
    float _1399 = _1375;
    float _1401 = _1247 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (!_1267)
    {
        _1379 = _1281;
    }
    float _1403 = _1379;
    float _1405 = _1247 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_1223)
    {
        float _1407 = _1349 ? as_type<float>(_1355) : _1231;
        _1345 = _1407;
    }
    float _1409 = _1345;
    float _1411 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1373);
    float _1413 = _1247 * _1385;
    if (!_1267)
    {
        float _1415 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1403);
        _1393 = _1415;
    }
    float _1417 = _1393;
    float _1419 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1401);
    float _1421 = _1245 * _1403;
    float _1423 = _1243 * _1399;
    float _1425 = -_1413;
    float _1427 = fma(_1243, _1403, _1425);
    float _1429 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1431 = -_1245;
    float _1433 = fma(_1431, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1419);
    float _1435 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1405);
    if (!_1267)
    {
        float _1437 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1399);
        _1389 = _1437;
    }
    float _1439 = _1389;
    float _1441 = -_1421;
    float _1443 = fma(_1247, _1399, _1441);
    float _1445 = -_1423;
    float _1447 = fma(_1245, _1385, _1445);
    float _1449 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1451 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1455 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1429);
    float _1457 = _1433 * _440;
    float _1459 = -_1245;
    float _1461 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1435);
    float _1463 = _1433 * _458;
    float _1465 = _1447 * _1249;
    float _1467 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1449);
    float _1469 = -_1457;
    float _1471 = fma(_1461, _458, _1469);
    float _1473 = fma(_1461, _440, _1463);
    float _1475 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1451);
    float _1477 = _1427 * _1249;
    float _1479 = _1443 * _1249;
    float _1481 = -_1245;
    float _1483 = fma(_1481, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1411);
    float _1485 = _1465 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1487 = _1465 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1489 = _1465 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1491 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1225);
    float _1493 = fma(_1479, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1485);
    float _1495 = fma(_1479, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1487);
    float _1497 = fma(_1479, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1489);
    out.m_69.x = _1473;
    out.m_69.y = _1483;
    out.m_69.z = _1471;
    float _1499 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1503 = -_1439;
    float _1505 = fma(_1503, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1475);
    float _1507 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1491);
    float _1509 = _1499 * _1453;
    bool _1511 = _806 > 0.0;
    bool _1513 = isnan(_806);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan(0.0);
    bool _1519 = _1515 || _1517;
    float _1521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1523 = _868 <= 0.0;
    bool _1525 = !_1519;
    bool _1527 = _1523 || _1525;
    float _1529 = -_1439;
    float _1531 = fma(_1529, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1455);
    float _1533 = -_1439;
    float _1535 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1467);
    float _1537 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1539 = -_1477;
    float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1493);
    float _1543 = _1531 * _440;
    float _1545 = _1531 * _458;
    float _1547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1549 = _1337 * _1501;
    float _1551 = -_1543;
    float _1553 = fma(_1505, _458, _1551);
    float _1555 = fma(_1505, _440, _1545);
    float _1557 = _806 * _868;
    float _1559 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1507);
    float _1561 = -_1477;
    float _1563 = fma(_1561, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1495);
    float _1565 = -_1477;
    float _1567 = fma(_1565, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1497);
    out.m_71.x = _1555;
    out.m_71.y = _1535;
    out.m_71.z = _1553;
    float _1569 = _1365 * _1521;
    float _1571 = _1557 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1573 = _1559 + _1124;
    out.m_73.x = _1541;
    out.m_73.y = _1563;
    out.m_73.z = _1567;
    float _1575 = _1571 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1577 = _1537 * _1547;
    float _1579 = _1573 * 0.5;
    out.m_45.x = _1575;
    float _1581 = _1327 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.x = _1569;
    out.m_75.y = _1509;
    out.m_75.z = _1577;
    out.m_75.w = _1549;
    out.gl_Position.x = _1146;
    out.gl_Position.y = _1150;
    out.gl_Position.z = _1559;
    out.gl_Position.w = _1124;
    out.m_77.z = _1579;
    out.m_77.w = _1124;
    float _1583 = -_1581;
    float _1585 = _1583 + 1.0;
    float _1587 = _1581 * _1178;
    float _1589 = _1189 * _1587;
    float _1591 = _1203 * _1587;
    float _1593 = fma(_1199, _1589, _1183);
    float _1595 = fma(_1201, _1589, _1185);
    float _1597 = _1189 * _1585;
    float _1599 = fma(_1189, _1591, _1187);
    out.m_79.x = _1593;
    out.m_79.y = _1595;
    out.m_79.z = _1599;
    out.m_79.w = _1597;
    if (!_1527)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1601 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1601;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    float _106 = as_type<float>(_98);
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    if (!_102)
    {
        out.m_45.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1658 = as_type<float>(_114);
        out.gl_Position.z = _1658;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_47.w;
    float _120 = in.m_49.x;
    float _122 = in.m_49.y;
    bool _124 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_118);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_118;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.x = _120;
    out.m_51.y = _122;
    float _138 = _122;
    if (_132)
    {
        float _140 = float(_98);
        _106 = _140;
    }
    float _142 = _106;
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
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _116 = as_type<int>(_154);
    }
    int _156 = _116;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1736 = as_type<float>(_156);
        out.gl_Position.z = _1736;
    }
    if (_148)
    {
        return out;
    }
    float _158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _160 = _136 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _162 = in.m_53.x;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _166 = _164 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _170 = _168 != 0;
    float _172 = in.m_55.x;
    float _174 = in.m_55.y;
    float _176 = in.m_55.z;
    float _178 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _180 = in.m_53.z;
    int _182 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _184 = _182 != 0;
    float _186 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _178);
    float _188 = _160 * _158;
    bool _190 = !_166;
    int _192 = _190 ? 0 : 1;
    float _194 = in.m_53.y;
    float _196 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[20].x, _188);
    int _198 = abs(_192);
    float _200 = in.m_42.x;
    float _202 = in.m_42.y;
    float _204 = in.m_42.z;
    float _206 = floor(_196);
    float _208 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _186);
    float _210 = rsqrt(_208);
    float _212 = -_206;
    float _214 = _196 + _212;
    float _216 = _196 * 6.283185482025146484375;
    float _218 = _216 * 0.15915493667125701904296875;
    float _220 = _202 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _222 = _202 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _224 = _202 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _226 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[4].x, _220);
    float _228 = _218 * 6.283185482025146484375;
    float _230 = cos(_228);
    float _232 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[5].x, _222);
    float _234 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[6].x, _224);
    bool _236 = !_184;
    int _238 = _236 ? 0 : 1;
    float _240 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[4].z, _226);
    float _242 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].z, _232);
    float _244 = float(_198);
    float _246 = -_214;
    float _248 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _250 = abs(_238);
    float _252 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[6].z, _234);
    bool _254 = _214 < 0.5;
    float _256 = float(_254);
    float _258 = abs(_248);
    float _260 = _244 * _258;
    float _262 = float(_250);
    float _264 = fma(_230, 0.5, 0.5);
    float _266 = -_256;
    float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _270 = _242 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _272 = -_264;
    float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _276 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.166666686534881591796875;
    float _278 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _280 = _270 + _278;
    float _282 = fma(_262, _274, _260);
    bool _284 = !_170;
    int _286 = _284 ? 0 : 1;
    float _288 = _240 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _290 = _252 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _292 = ceil(_276);
    int _294 = abs(_286);
    float _296 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _298 = _288 + _296;
    float _300 = _280 * _280;
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _304 = _290 + _302;
    float _306 = fma(_298, _298, _300);
    float _308 = float(_294);
    float _310 = fma(_304, _304, _306);
    float _312 = abs(_268);
    float _314 = fma(_308, _312, _282);
    float _316 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = rsqrt(_310);
    float _320 = _210 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _322 = _292 * 0.20000000298023223876953125;
    float _324 = _314 * _316;
    float _326 = _210 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _328 = _320 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _330 = fma(_174, 0.5, _322);
    float _332 = _324 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _334 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[8].y, _328);
    float _336 = _330 * 6.283185482025146484375;
    float _338 = _332 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _340 = _336 * 0.15915493667125701904296875;
    bool _342 = _334 > 0.0;
    float _344 = _338 * _318;
    bool _346 = _334 >= 0.0;
    bool _348 = isnan(_334);
    bool _350 = _346 || _348;
    bool _352 = isnan(0.0);
    bool _354 = _350 || _352;
    float _356 = _280 * _344;
    float _358 = _298 * _344;
    float _360 = _304 * _344;
    float _362 = _340 * 6.283185482025146484375;
    float _364 = sin(_362);
    float _366 = -_356;
    float _368 = _280 + _366;
    float _370 = -_358;
    float _372 = _298 + _370;
    float _374 = -_360;
    float _376 = _304 + _374;
    int _378 = _354 ? 0 : 1;
    float _380 = _368 * _368;
    int _382 = ~_378;
    int _384 = _382 + 1;
    int _386 = _384 + 1;
    float _388 = fma(_372, _372, _380);
    int _390 = _386;
    float _392 = _356;
    if (!_342)
    {
        int _394 = ~_378;
        int _396 = _394 + 1;
        _390 = _396;
    }
    int _398 = _390;
    float _400 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _402 = fma(_376, _376, _388);
    float _404 = float(_398);
    float _406 = _194 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = fma(_364, 0.20000000298023223876953125, 1.0);
    float _410 = _314 * _400;
    float _412 = sqrt(_402);
    float _414 = 0.0 + _404;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = _314 * _406;
    float _420 = _408 * _172;
    float _422 = _408 * _176;
    float _424 = fma(_416, -3.1415927410125732421875, 3.1415927410125732421875);
    float _426 = _410 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _420);
    float _430 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _422);
    float _432 = _424 * 0.15915493667125701904296875;
    float _434 = _408 * _174;
    float _436 = _318 * _412;
    float _438 = _432 * 6.283185482025146484375;
    float _440 = sin(_438);
    float _442 = _436 * _426;
    float _444 = _332 * _436;
    float _446 = _418 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _448 = _430 * _442;
    float _450 = _428 * _444;
    float _452 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _434);
    float _454 = _436 * _446;
    float _456 = _432 * 6.283185482025146484375;
    float _458 = cos(_456);
    float _460 = _448 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _462 = -_356;
    float _464 = _270 + _462;
    float _466 = _452 * _454;
    float _468 = _448 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _470 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[8].x, _460);
    float _472 = _464 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _474 = -_360;
    float _476 = _290 + _474;
    float _478 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[10].x, _468);
    float _480 = -_466;
    float _482 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[8].z, _470);
    float _484 = -_358;
    float _486 = _288 + _484;
    float _488 = _448 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _490 = -_466;
    float _492 = fma(_490, (*spvDescriptorSet0.vp_c10)._m0[10].z, _478);
    float _494 = _482 * _440;
    float _496 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[11].x, _472);
    float _498 = _482 * _458;
    float _500 = -_494;
    float _502 = fma(_492, _458, _500);
    float _504 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[11].z, _496);
    float _506 = fma(_492, _440, _498);
    float _508 = _290 + _502;
    float _510 = _504 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _512 = _464 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _514 = _288 + _506;
    float _516 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _518 = _508 + _516;
    float _520 = 1.0 / _510;
    float _522 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[10].x, _512);
    float _524 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _526 = _514 + _524;
    float _528 = _518 * _518;
    float _530 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[10].z, _522);
    float _532 = fma(_526, _526, _528);
    float _534 = _530 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _536 = sqrt(_532);
    float _538 = _534 + _510;
    float _540 = _538 * _520;
    float _542 = _540 * 0.5;
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _546 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[30].w, _544);
    float _548 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[9].x, _488);
    float _550 = 1.0 / _546;
    float _552 = -_466;
    float _554 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[9].z, _548);
    bool _556 = _536 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _558 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _560 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.5);
    bool _566 = _562 || _564;
    float _568 = _270 + _554;
    bool _570 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _572 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.5);
    bool _578 = _574 || _576;
    float _580 = _512;
    float _582 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _584 = _568;
    float _586 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _588 = _436;
    float _590 = _526;
    float _592 = _464;
    float _594 = _486;
    if (!_556)
    {
        _580 = _514;
    }
    float _596 = _580;
    float _598 = _596;
    if (!_556)
    {
        _582 = _508;
    }
    float _600 = _582;
    bool _602 = !_556;
    float _604 = _600;
    if (!_602)
    {
        float _606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _608 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _610 = _536 + _608;
        float _612 = rsqrt(_532);
        float _614 = _610 * _606;
        float _616 = _568 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _618 = _614 * 0.15915493667125701904296875;
        float _620 = _618 * 6.283185482025146484375;
        float _622 = cos(_620);
        float _624 = _618 * 6.283185482025146484375;
        float _626 = sin(_624);
        float _628 = _622 + (-1.0);
        float _630 = _628 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _632 = fma(_626, _616, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _634 = fma(_568, _622, _630);
        float _636 = _612 * _632;
        float _638 = fma(_526, _636, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _640 = fma(_518, _636, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _598 = _638;
        _604 = _640;
        _584 = _634;
        _586 = _626;
    }
    float _642 = _598;
    float _644 = _604;
    float _646 = _584;
    float _648 = _586;
    float _650 = -_358;
    float _652 = _650 + _642;
    float _654 = -_360;
    float _656 = _654 + _644;
    float _658 = -_356;
    float _660 = _658 + _646;
    float _662 = _648;
    float _664 = _652;
    float _666 = _660;
    if (_566)
    {
        _662 = 1.0;
    }
    float _668 = _662;
    float _670 = _668;
    if (_578)
    {
        _392 = _652;
    }
    float _672 = _392;
    float _674 = _672;
    if (_578)
    {
        _664 = _656;
    }
    float _676 = _664;
    float _678 = _676;
    if (!_578)
    {
        float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _682 = _464 + _680;
        float _684 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _686 = _486 + _684;
        float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _690 = -_290;
        float _692 = _690 + _644;
        float _694 = _682 * _682;
        float _696 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _698 = _476 + _696;
        float _700 = -_288;
        float _702 = _700 + _642;
        float _704 = -_270;
        float _706 = _704 + _646;
        float _708 = fma(_686, _686, _694);
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _712 = fma(_698, _698, _708);
        float _714 = sqrt(_712);
        float _716 = 1.0 / _436;
        float _718 = _710 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _720 = precise::min(_714, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _722 = _720 * _688;
        float _724 = _722 * _716;
        float _726 = _718 * _724;
        float _728 = _692 * _724;
        float _730 = fma(_702, _726, _486);
        float _732 = fma(_706, _726, _464);
        float _734 = fma(_718, _728, _476);
        _666 = _732;
        _674 = _730;
        _678 = _734;
        _588 = _716;
    }
    float _736 = _666;
    float _738 = _674;
    float _740 = _678;
    float _742 = _588;
    float _744 = _742;
    if (_566)
    {
        _590 = 1.0;
    }
    float _746 = _590;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _750 = _550 * _748;
    float _752 = _746;
    if (!_566)
    {
        float _754 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _756 = _754 * 0.15915493667125701904296875;
        float _758 = _756 * 6.283185482025146484375;
        float _760 = cos(_758);
        float _762 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _764 = _762 * 0.15915493667125701904296875;
        float _766 = _756 * 6.283185482025146484375;
        float _768 = sin(_766);
        float _770 = 1.0 / _760;
        float _772 = _764 * 6.283185482025146484375;
        float _774 = cos(_772);
        float _776 = _768 * _770;
        float _778 = _764 * 6.283185482025146484375;
        float _780 = sin(_778);
        float _782 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _784 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _782;
        float _786 = _774 * _776;
        float _788 = 1.0 / _784;
        float _790 = 1.0 / _786;
        float _792 = _780 * _790;
        float _794 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _796 = fma(_750, _792, _794);
        float _798 = _796 * _788;
        float _800 = precise::clamp(_798, 0.0, 1.0);
        _592 = _764;
        _744 = _788;
        _670 = _800;
    }
    float _802 = _592;
    float _804 = _744;
    float _806 = _670;
    float _808 = _804;
    float _810 = _802;
    if (!_566)
    {
        float _812 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _814 = _812 * 0.15915493667125701904296875;
        float _816 = _814 * 6.283185482025146484375;
        float _818 = cos(_816);
        float _820 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _822 = _820 * 0.15915493667125701904296875;
        float _824 = _814 * 6.283185482025146484375;
        float _826 = sin(_824);
        float _828 = 1.0 / _818;
        float _830 = _822 * 6.283185482025146484375;
        float _832 = cos(_830);
        float _834 = _826 * _828;
        float _836 = _822 * 6.283185482025146484375;
        float _838 = sin(_836);
        float _840 = _832 * _834;
        float _842 = 1.0 / _840;
        float _844 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _846 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _844;
        float _848 = 1.0 / _846;
        float _850 = _838 * _842;
        float _852 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _854 = fma(_750, _850, _852);
        float _856 = _854 * _848;
        float _858 = precise::clamp(_856, 0.0, 1.0);
        float _860 = -_858;
        float _862 = _860 + 1.0;
        _808 = _842;
        _810 = _828;
        _752 = _862;
    }
    float _864 = _808;
    float _866 = _810;
    float _868 = _752;
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _872 = _736 + _870;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _876 = _738 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _880 = _740 + _878;
    float _882 = _872 * _872;
    float _884 = fma(_876, _876, _882);
    float _886 = fma(_880, _880, _884);
    float _888 = rsqrt(_886);
    float _890 = _888 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _892 = _876 * _890;
    float _894 = _880 * _890;
    float _896 = _892 * _892;
    float _898 = _894 * _894;
    float _900 = _896 + _898;
    float _902 = sqrt(_900);
    bool _904 = _902 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _906 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _908 = _902 + _906;
    float _910 = _888;
    float _912 = _866;
    float _914 = _908;
    float _916 = _890;
    if (_904)
    {
        float _918 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _910 = _918;
    }
    float _920 = _910;
    if (_904)
    {
        float _922 = rsqrt(_900);
        _912 = _922;
    }
    float _924 = _912;
    float _926 = _924;
    if (_904)
    {
        float _928 = _908 * _920;
        _914 = _928;
    }
    float _930 = _914;
    if (_904)
    {
        float _932 = _930 * 0.15915493667125701904296875;
        _594 = _932;
    }
    float _934 = _594;
    float _936 = _880;
    if (_904)
    {
        float _938 = _934 * 6.283185482025146484375;
        float _940 = sin(_938);
        _936 = _940;
    }
    float _942 = _936;
    float _944 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _946 = precise::max(0.0, _944);
    float _948 = _864;
    float _950 = _946;
    float _952 = _944;
    if (_904)
    {
        float _954 = _934 * 6.283185482025146484375;
        float _956 = cos(_954);
        _948 = _956;
    }
    float _958 = _948;
    float _960 = -_890;
    float _962 = -_946;
    float _964 = fma(_872, _960, _962);
    float _966 = _964;
    if (_904)
    {
        float _968 = _964 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _950 = _968;
    }
    float _970 = _950;
    float _972 = sqrt(_886);
    float _974 = _970;
    float _976 = _942;
    if (_904)
    {
        float _978 = fma(_942, _970, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _974 = _978;
    }
    float _980 = _974;
    float _982 = _980;
    if (!_904)
    {
        _976 = _892;
    }
    float _984 = _976;
    float _986 = _984;
    float _988 = _958;
    if (_904)
    {
        float _990 = _958 + (-1.0);
        _952 = _990;
    }
    float _992 = _952;
    float _994 = _992;
    if (_904)
    {
        float _996 = _924 * _980;
        _916 = _996;
    }
    float _998 = _916;
    if (!_904)
    {
        _982 = _896;
    }
    float _1000 = _982;
    float _1002 = _1000;
    if (_904)
    {
        float _1004 = _992 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _926 = _1004;
    }
    float _1006 = _926;
    if (_904)
    {
        float _1008 = _892 * _998;
        _986 = _1008;
    }
    float _1010 = _986;
    if (!_904)
    {
        _994 = _894;
    }
    float _1012 = _994;
    float _1014 = _1012;
    if (_904)
    {
        float _1016 = _894 * _998;
        _1014 = _1016;
    }
    float _1018 = _1014;
    if (_904)
    {
        float _1020 = fma(_964, _958, _1006);
        _966 = _1020;
    }
    float _1022 = _966;
    if (_904)
    {
        float _1024 = _1010 * _1010;
        _1002 = _1024;
    }
    float _1026 = _1002;
    if (!_904)
    {
        _988 = _898;
    }
    float _1028 = _988;
    float _1030 = _1028;
    if (_904)
    {
        float _1032 = _1018 * _1018;
        _1030 = _1032;
    }
    float _1034 = _1030;
    float _1036 = fma(_1022, _1022, _1026);
    float _1038 = _736 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1040 = _1036 + _1034;
    float _1042 = _736 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1046 = fma(_972, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1044);
    float _1048 = precise::clamp(_1046, 0.0, 1.0);
    float _1050 = _736 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1052 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1054 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1042);
    float _1056 = rsqrt(_1040);
    float _1058 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1050);
    float _1060 = -_1048;
    float _1062 = _1060 + 1.0;
    float _1064 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1054);
    float _1066 = _736 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1068 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1058);
    float _1070 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1038);
    float _1072 = _1064 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1074 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1066);
    float _1076 = abs(_1062);
    float _1078 = log2(_1076);
    float _1080 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1082 = _1072 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1084 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1074);
    float _1086 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1070);
    float _1088 = -_1082;
    float _1090 = fma(_1088, _1052, 1.0);
    float _1092 = _1056 * _1010;
    float _1094 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1096 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1098 = _1056 * _1022;
    float _1100 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1102 = _1056 * _1018;
    float _1104 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1096);
    float _1106 = _1086 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1108 = -_1100;
    float _1110 = fma(_1098, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1108);
    float _1112 = _1078 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1114 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1104);
    float _1116 = log2(_1090);
    float _1118 = -_1102;
    float _1120 = fma(_1118, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1110);
    float _1122 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1124 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1114);
    float _1126 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1128 = fma(_1120, -0.5, 0.5);
    float _1130 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1122);
    float _1132 = fma(_1120, 0.5, 0.5);
    float _1134 = exp2(_1112);
    float _1136 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1126);
    float _1138 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1130);
    float _1140 = _1098 + 1.0;
    float _1142 = fma(_1132, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1144 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1136);
    float _1146 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1138);
    float _1148 = 1.0 / _1124;
    float _1150 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1144);
    float _1152 = _1116 * 0.693147182464599609375;
    float _1154 = fma(_1132, _1142, -0.212114393711090087890625);
    float _1156 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1158 = fma(_1132, _1154, 1.570728778839111328125);
    float _1160 = sqrt(_1128);
    float _1162 = -_1098;
    float _1164 = fma(_1134, _1140, _1162);
    float _1166 = fma(_1164, 0.5, 0.5);
    float _1168 = _1146 * _1148;
    float _1170 = _1150 * _1148;
    float _1172 = fma(_1168, 0.5, 0.5);
    float _1174 = fma(_1170, -0.5, 0.5);
    float _1176 = _1160 * 0.636619746685028076171875;
    float3 _3302 = float3(_1172, _1174, _1156);
    float _1178 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3302, float3(0.0), isnan(_3302)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3302, float3(0.0), isnan(_3302)), level(0.0)).x;
    float3 _3313 = float3(_1172, _1174, _1156);
    float4 _1181 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3313, float3(0.0), isnan(_3313)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3313, float3(0.0), isnan(_3313)), level(0.0)).xyzw;
    float _1183 = _1181.x;
    float _1185 = _1181.y;
    float _1187 = _1181.z;
    float _1189 = _1181.w;
    float _1191 = -_1158;
    float _1193 = fma(_1176, _1191, 1.0);
    float2 _3335 = float2(_1193, _1166);
    float3 _1197 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3335, float2(0.0), isnan(_3335)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3335, float2(0.0), isnan(_3335)), level(0.0)).xyz;
    float _1199 = _1197.x;
    float _1201 = _1197.y;
    float _1203 = _1197.z;
    float _1205 = in.m_49.w;
    float _1207 = _1078 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1209 = _434 != 0.0;
    bool _1211 = isnan(_434);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan(0.0);
    bool _1217 = _1213 || _1215;
    float _1219 = in.m_57.y;
    int _1221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1223 = _1221 != 0;
    float _1225 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1229 = _1227 != 0;
    float _1231 = in.m_57.x;
    int _1233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1235 = _1233 != 0;
    float _1237 = exp2(_1207);
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1241 = _1239 != 0;
    float _1243 = in.m_59.x;
    float _1245 = in.m_59.y;
    float _1247 = in.m_59.z;
    float _1249 = in.m_59.w;
    bool _1251 = _420 == 0.0;
    bool _1253 = !_1217;
    bool _1255 = _1251 && _1253;
    out.m_61.y = _434;
    int _1257 = 0;
    bool _1259 = _1235;
    if (_1223)
    {
        float _1261 = in.m_49.z;
        _1257 = as_type<int>(_1261);
    }
    int _1263 = _1257;
    bool _1265 = _422 == 0.0;
    bool _1267 = _1265 && _1255;
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1273 = _1205 > 0.5;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1277 = in.m_63.x;
    float _1279 = in.m_63.y;
    float _1281 = in.m_63.z;
    float _1283 = -_1219;
    float _1285 = _1283 + 1.0;
    bool _1287 = _122 > 0.5;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1291 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1293 = _1271 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1295 = _1273 ? as_type<int>(_1285) : as_type<int>(_1219);
    float _1297 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1299 = _1273;
    float _1301 = _1219;
    float _1303 = _1285;
    float _1305 = _1297;
    float _1307 = _1291;
    float _1309 = _1293;
    if (_1229)
    {
        bool _1311 = _120 > 0.5;
        _1299 = _1311;
    }
    bool _1313 = _1299;
    int _1315 = 0;
    if (_1229)
    {
        float _1317 = -_1231;
        float _1319 = _1317 + 1.0;
        _1315 = as_type<int>(_1319);
    }
    int _1321 = _1315;
    float _1323 = _1235 ? as_type<float>(_1295) : _1219;
    float _1325 = -_1237;
    float _1327 = _1325 + 1.0;
    if (_1241)
    {
        float _1329 = _1287 ? _1285 : _1219;
        _1301 = _1329;
    }
    float _1331 = _1301;
    out.m_65.x = _1291;
    out.m_65.y = _1293;
    out.m_65.z = _1297;
    out.m_65.w = _1289;
    float _1333 = 0.0;
    if (!_1229)
    {
        _1333 = _1231;
    }
    float _1335 = _1333;
    float _1337 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1339 = _1335;
    if (!_1223)
    {
        _138 = _1231;
    }
    float _1341 = _138;
    out.m_67.x = _738;
    out.m_67.y = _736;
    out.m_67.z = _740;
    int _1343 = _1263;
    float _1345 = _1341;
    if (_1223)
    {
        bool _1347 = as_type<float>(_1263) > 0.5;
        _1259 = _1347;
    }
    bool _1349 = _1259;
    if (_1223)
    {
        float _1351 = -_1231;
        float _1353 = _1351 + 1.0;
        _1343 = as_type<int>(_1353);
    }
    int _1355 = _1343;
    if (_1229)
    {
        float _1357 = _1313 ? as_type<float>(_1321) : _1231;
        _1339 = _1357;
    }
    float _1359 = _1339;
    float _1361 = _1277;
    if (_1267)
    {
        _1303 = _1277;
    }
    float _1363 = _1303;
    float _1365 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1367 = 0.0;
    float _1369 = _1363;
    if (_1267)
    {
        _1367 = _1279;
    }
    float _1371 = _1367;
    float _1373 = _1247 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1375 = _1371;
    if (_1267)
    {
        _1305 = _1281;
    }
    float _1377 = _1305;
    float _1379 = _1377;
    if (_1267)
    {
        _1307 = _1363;
    }
    float _1381 = _1307;
    float _1383 = _1381;
    if (!_1267)
    {
        _1369 = _1277;
    }
    float _1385 = _1369;
    if (_1267)
    {
        _1309 = _1371;
    }
    float _1387 = _1309;
    float _1389 = _1387;
    if (_1267)
    {
        _1361 = _1377;
    }
    float _1391 = _1361;
    float _1393 = _1391;
    if (!_1267)
    {
        float _1395 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1385);
        _1383 = _1395;
    }
    float _1397 = _1383;
    if (!_1267)
    {
        _1375 = _1279;
    }
    float _1399 = _1375;
    float _1401 = _1247 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (!_1267)
    {
        _1379 = _1281;
    }
    float _1403 = _1379;
    float _1405 = _1247 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_1223)
    {
        float _1407 = _1349 ? as_type<float>(_1355) : _1231;
        _1345 = _1407;
    }
    float _1409 = _1345;
    float _1411 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1373);
    float _1413 = _1247 * _1385;
    if (!_1267)
    {
        float _1415 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1403);
        _1393 = _1415;
    }
    float _1417 = _1393;
    float _1419 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1401);
    float _1421 = _1245 * _1403;
    float _1423 = _1243 * _1399;
    float _1425 = -_1413;
    float _1427 = fma(_1243, _1403, _1425);
    float _1429 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1431 = -_1245;
    float _1433 = fma(_1431, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1419);
    float _1435 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1405);
    if (!_1267)
    {
        float _1437 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1399);
        _1389 = _1437;
    }
    float _1439 = _1389;
    float _1441 = -_1421;
    float _1443 = fma(_1247, _1399, _1441);
    float _1445 = -_1423;
    float _1447 = fma(_1245, _1385, _1445);
    float _1449 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1451 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1455 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1429);
    float _1457 = _1433 * _440;
    float _1459 = -_1245;
    float _1461 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1435);
    float _1463 = _1433 * _458;
    float _1465 = _1447 * _1249;
    float _1467 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1449);
    float _1469 = -_1457;
    float _1471 = fma(_1461, _458, _1469);
    float _1473 = fma(_1461, _440, _1463);
    float _1475 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1451);
    float _1477 = _1427 * _1249;
    float _1479 = _1443 * _1249;
    float _1481 = -_1245;
    float _1483 = fma(_1481, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1411);
    float _1485 = _1465 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1487 = _1465 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1489 = _1465 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1491 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1225);
    float _1493 = fma(_1479, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1485);
    float _1495 = fma(_1479, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1487);
    float _1497 = fma(_1479, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1489);
    out.m_69.x = _1473;
    out.m_69.y = _1483;
    out.m_69.z = _1471;
    float _1499 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1503 = -_1439;
    float _1505 = fma(_1503, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1475);
    float _1507 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1491);
    float _1509 = _1499 * _1453;
    bool _1511 = _806 > 0.0;
    bool _1513 = isnan(_806);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan(0.0);
    bool _1519 = _1515 || _1517;
    float _1521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1523 = _868 <= 0.0;
    bool _1525 = !_1519;
    bool _1527 = _1523 || _1525;
    float _1529 = -_1439;
    float _1531 = fma(_1529, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1455);
    float _1533 = -_1439;
    float _1535 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1467);
    float _1537 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1539 = -_1477;
    float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1493);
    float _1543 = _1531 * _440;
    float _1545 = _1531 * _458;
    float _1547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1549 = _1337 * _1501;
    float _1551 = -_1543;
    float _1553 = fma(_1505, _458, _1551);
    float _1555 = fma(_1505, _440, _1545);
    float _1557 = _806 * _868;
    float _1559 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1507);
    float _1561 = -_1477;
    float _1563 = fma(_1561, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1495);
    float _1565 = -_1477;
    float _1567 = fma(_1565, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1497);
    out.m_71.x = _1555;
    out.m_71.y = _1535;
    out.m_71.z = _1553;
    float _1569 = _1365 * _1521;
    float _1571 = _1557 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1573 = _1559 + _1124;
    out.m_73.x = _1541;
    out.m_73.y = _1563;
    out.m_73.z = _1567;
    float _1575 = _1571 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1577 = _1537 * _1547;
    float _1579 = _1573 * 0.5;
    out.m_45.x = _1575;
    float _1581 = _1327 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.x = _1569;
    out.m_75.y = _1509;
    out.m_75.z = _1577;
    out.m_75.w = _1549;
    out.gl_Position.x = _1146;
    out.gl_Position.y = _1150;
    out.gl_Position.z = _1559;
    out.gl_Position.w = _1124;
    out.m_77.z = _1579;
    out.m_77.w = _1124;
    float _1583 = -_1581;
    float _1585 = _1583 + 1.0;
    float _1587 = _1581 * _1178;
    float _1589 = _1189 * _1587;
    float _1591 = _1203 * _1587;
    float _1593 = fma(_1199, _1589, _1183);
    float _1595 = fma(_1201, _1589, _1185);
    float _1597 = _1189 * _1585;
    float _1599 = fma(_1189, _1591, _1187);
    out.m_79.x = _1593;
    out.m_79.y = _1595;
    out.m_79.z = _1599;
    out.m_79.w = _1597;
    if (!_1527)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1601 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1601;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    float _106 = as_type<float>(_98);
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    if (!_102)
    {
        out.m_45.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1658 = as_type<float>(_114);
        out.gl_Position.z = _1658;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_47.w;
    float _120 = in.m_49.x;
    float _122 = in.m_49.y;
    bool _124 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_118);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_118;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.x = _120;
    out.m_51.y = _122;
    float _138 = _122;
    if (_132)
    {
        float _140 = float(_98);
        _106 = _140;
    }
    float _142 = _106;
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
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _116 = as_type<int>(_154);
    }
    int _156 = _116;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1736 = as_type<float>(_156);
        out.gl_Position.z = _1736;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _160 = _136 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _162 = in.m_53.x;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _166 = _164 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _170 = _168 != 0;
    float _172 = in.m_55.x;
    float _174 = in.m_55.y;
    float _176 = in.m_55.z;
    float _178 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _180 = in.m_53.z;
    int _182 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _184 = _182 != 0;
    float _186 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _178);
    float _188 = _160 * _158;
    bool _190 = !_166;
    int _192 = _190 ? 0 : 1;
    float _194 = in.m_53.y;
    float _196 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[20].x, _188);
    int _198 = abs(_192);
    float _200 = in.m_42.x;
    float _202 = in.m_42.y;
    float _204 = in.m_42.z;
    float _206 = floor(_196);
    float _208 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _186);
    float _210 = rsqrt(_208);
    float _212 = -_206;
    float _214 = _196 + _212;
    float _216 = _196 * 6.283185482025146484375;
    float _218 = _216 * 0.15915493667125701904296875;
    float _220 = _202 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _222 = _202 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _224 = _202 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _226 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[4].x, _220);
    float _228 = _218 * 6.283185482025146484375;
    float _230 = cos(_228);
    float _232 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[5].x, _222);
    float _234 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[6].x, _224);
    bool _236 = !_184;
    int _238 = _236 ? 0 : 1;
    float _240 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[4].z, _226);
    float _242 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].z, _232);
    float _244 = float(_198);
    float _246 = -_214;
    float _248 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _250 = abs(_238);
    float _252 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[6].z, _234);
    bool _254 = _214 < 0.5;
    float _256 = float(_254);
    float _258 = abs(_248);
    float _260 = _244 * _258;
    float _262 = float(_250);
    float _264 = fma(_230, 0.5, 0.5);
    float _266 = -_256;
    float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _270 = _242 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _272 = -_264;
    float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _276 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.166666686534881591796875;
    float _278 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _280 = _270 + _278;
    float _282 = fma(_262, _274, _260);
    bool _284 = !_170;
    int _286 = _284 ? 0 : 1;
    float _288 = _240 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _290 = _252 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _292 = ceil(_276);
    int _294 = abs(_286);
    float _296 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _298 = _288 + _296;
    float _300 = _280 * _280;
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _304 = _290 + _302;
    float _306 = fma(_298, _298, _300);
    float _308 = float(_294);
    float _310 = fma(_304, _304, _306);
    float _312 = abs(_268);
    float _314 = fma(_308, _312, _282);
    float _316 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = rsqrt(_310);
    float _320 = _210 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _322 = _292 * 0.20000000298023223876953125;
    float _324 = _314 * _316;
    float _326 = _210 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _328 = _320 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _330 = fma(_174, 0.5, _322);
    float _332 = _324 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _334 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[8].y, _328);
    float _336 = _330 * 6.283185482025146484375;
    float _338 = _332 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _340 = _336 * 0.15915493667125701904296875;
    bool _342 = _334 > 0.0;
    float _344 = _338 * _318;
    bool _346 = _334 >= 0.0;
    bool _348 = isnan(_334);
    bool _350 = _346 || _348;
    bool _352 = isnan(0.0);
    bool _354 = _350 || _352;
    float _356 = _280 * _344;
    float _358 = _298 * _344;
    float _360 = _304 * _344;
    float _362 = _340 * 6.283185482025146484375;
    float _364 = sin(_362);
    float _366 = -_356;
    float _368 = _280 + _366;
    float _370 = -_358;
    float _372 = _298 + _370;
    float _374 = -_360;
    float _376 = _304 + _374;
    int _378 = _354 ? 0 : 1;
    float _380 = _368 * _368;
    int _382 = ~_378;
    int _384 = _382 + 1;
    int _386 = _384 + 1;
    float _388 = fma(_372, _372, _380);
    int _390 = _386;
    float _392 = _356;
    if (!_342)
    {
        int _394 = ~_378;
        int _396 = _394 + 1;
        _390 = _396;
    }
    int _398 = _390;
    float _400 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _402 = fma(_376, _376, _388);
    float _404 = float(_398);
    float _406 = _194 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = fma(_364, 0.20000000298023223876953125, 1.0);
    float _410 = _314 * _400;
    float _412 = sqrt(_402);
    float _414 = 0.0 + _404;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = _314 * _406;
    float _420 = _408 * _172;
    float _422 = _408 * _176;
    float _424 = fma(_416, -3.1415927410125732421875, 3.1415927410125732421875);
    float _426 = _410 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _420);
    float _430 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _422);
    float _432 = _424 * 0.15915493667125701904296875;
    float _434 = _408 * _174;
    float _436 = _318 * _412;
    float _438 = _432 * 6.283185482025146484375;
    float _440 = sin(_438);
    float _442 = _436 * _426;
    float _444 = _332 * _436;
    float _446 = _418 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _448 = _430 * _442;
    float _450 = _428 * _444;
    float _452 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _434);
    float _454 = _436 * _446;
    float _456 = _432 * 6.283185482025146484375;
    float _458 = cos(_456);
    float _460 = _448 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _462 = -_356;
    float _464 = _270 + _462;
    float _466 = _452 * _454;
    float _468 = _448 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _470 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[8].x, _460);
    float _472 = _464 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _474 = -_360;
    float _476 = _290 + _474;
    float _478 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[10].x, _468);
    float _480 = -_466;
    float _482 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[8].z, _470);
    float _484 = -_358;
    float _486 = _288 + _484;
    float _488 = _448 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _490 = -_466;
    float _492 = fma(_490, (*spvDescriptorSet0.vp_c10)._m0[10].z, _478);
    float _494 = _482 * _440;
    float _496 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[11].x, _472);
    float _498 = _482 * _458;
    float _500 = -_494;
    float _502 = fma(_492, _458, _500);
    float _504 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[11].z, _496);
    float _506 = fma(_492, _440, _498);
    float _508 = _290 + _502;
    float _510 = _504 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _512 = _464 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _514 = _288 + _506;
    float _516 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _518 = _508 + _516;
    float _520 = 1.0 / _510;
    float _522 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[10].x, _512);
    float _524 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _526 = _514 + _524;
    float _528 = _518 * _518;
    float _530 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[10].z, _522);
    float _532 = fma(_526, _526, _528);
    float _534 = _530 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _536 = sqrt(_532);
    float _538 = _534 + _510;
    float _540 = _538 * _520;
    float _542 = _540 * 0.5;
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _546 = fma(_542, (*spvDescriptorSet0.vp_c8)._m0[30].w, _544);
    float _548 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[9].x, _488);
    float _550 = 1.0 / _546;
    float _552 = -_466;
    float _554 = fma(_552, (*spvDescriptorSet0.vp_c10)._m0[9].z, _548);
    bool _556 = _536 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _558 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _560 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.5);
    bool _566 = _562 || _564;
    float _568 = _270 + _554;
    bool _570 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _572 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.5);
    bool _578 = _574 || _576;
    float _580 = _512;
    float _582 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _584 = _568;
    float _586 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _588 = _436;
    float _590 = _526;
    float _592 = _464;
    float _594 = _486;
    if (!_556)
    {
        _580 = _514;
    }
    float _596 = _580;
    float _598 = _596;
    if (!_556)
    {
        _582 = _508;
    }
    float _600 = _582;
    bool _602 = !_556;
    float _604 = _600;
    if (!_602)
    {
        float _606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _608 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _610 = _536 + _608;
        float _612 = rsqrt(_532);
        float _614 = _610 * _606;
        float _616 = _568 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _618 = _614 * 0.15915493667125701904296875;
        float _620 = _618 * 6.283185482025146484375;
        float _622 = cos(_620);
        float _624 = _618 * 6.283185482025146484375;
        float _626 = sin(_624);
        float _628 = _622 + (-1.0);
        float _630 = _628 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _632 = fma(_626, _616, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _634 = fma(_568, _622, _630);
        float _636 = _612 * _632;
        float _638 = fma(_526, _636, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _640 = fma(_518, _636, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _598 = _638;
        _604 = _640;
        _584 = _634;
        _586 = _626;
    }
    float _642 = _598;
    float _644 = _604;
    float _646 = _584;
    float _648 = _586;
    float _650 = -_358;
    float _652 = _650 + _642;
    float _654 = -_360;
    float _656 = _654 + _644;
    float _658 = -_356;
    float _660 = _658 + _646;
    float _662 = _648;
    float _664 = _652;
    float _666 = _660;
    if (_566)
    {
        _662 = 1.0;
    }
    float _668 = _662;
    float _670 = _668;
    if (_578)
    {
        _392 = _652;
    }
    float _672 = _392;
    float _674 = _672;
    if (_578)
    {
        _664 = _656;
    }
    float _676 = _664;
    float _678 = _676;
    if (!_578)
    {
        float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _682 = _464 + _680;
        float _684 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _686 = _486 + _684;
        float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _690 = -_290;
        float _692 = _690 + _644;
        float _694 = _682 * _682;
        float _696 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _698 = _476 + _696;
        float _700 = -_288;
        float _702 = _700 + _642;
        float _704 = -_270;
        float _706 = _704 + _646;
        float _708 = fma(_686, _686, _694);
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _712 = fma(_698, _698, _708);
        float _714 = sqrt(_712);
        float _716 = 1.0 / _436;
        float _718 = _710 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _720 = precise::min(_714, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _722 = _720 * _688;
        float _724 = _722 * _716;
        float _726 = _718 * _724;
        float _728 = _692 * _724;
        float _730 = fma(_702, _726, _486);
        float _732 = fma(_706, _726, _464);
        float _734 = fma(_718, _728, _476);
        _666 = _732;
        _674 = _730;
        _678 = _734;
        _588 = _716;
    }
    float _736 = _666;
    float _738 = _674;
    float _740 = _678;
    float _742 = _588;
    float _744 = _742;
    if (_566)
    {
        _590 = 1.0;
    }
    float _746 = _590;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _750 = _550 * _748;
    float _752 = _746;
    if (!_566)
    {
        float _754 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _756 = _754 * 0.15915493667125701904296875;
        float _758 = _756 * 6.283185482025146484375;
        float _760 = cos(_758);
        float _762 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _764 = _762 * 0.15915493667125701904296875;
        float _766 = _756 * 6.283185482025146484375;
        float _768 = sin(_766);
        float _770 = 1.0 / _760;
        float _772 = _764 * 6.283185482025146484375;
        float _774 = cos(_772);
        float _776 = _768 * _770;
        float _778 = _764 * 6.283185482025146484375;
        float _780 = sin(_778);
        float _782 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _784 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _782;
        float _786 = _774 * _776;
        float _788 = 1.0 / _784;
        float _790 = 1.0 / _786;
        float _792 = _780 * _790;
        float _794 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _796 = fma(_750, _792, _794);
        float _798 = _796 * _788;
        float _800 = precise::clamp(_798, 0.0, 1.0);
        _592 = _764;
        _744 = _788;
        _670 = _800;
    }
    float _802 = _592;
    float _804 = _744;
    float _806 = _670;
    float _808 = _804;
    float _810 = _802;
    if (!_566)
    {
        float _812 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _814 = _812 * 0.15915493667125701904296875;
        float _816 = _814 * 6.283185482025146484375;
        float _818 = cos(_816);
        float _820 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _822 = _820 * 0.15915493667125701904296875;
        float _824 = _814 * 6.283185482025146484375;
        float _826 = sin(_824);
        float _828 = 1.0 / _818;
        float _830 = _822 * 6.283185482025146484375;
        float _832 = cos(_830);
        float _834 = _826 * _828;
        float _836 = _822 * 6.283185482025146484375;
        float _838 = sin(_836);
        float _840 = _832 * _834;
        float _842 = 1.0 / _840;
        float _844 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _846 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _844;
        float _848 = 1.0 / _846;
        float _850 = _838 * _842;
        float _852 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _854 = fma(_750, _850, _852);
        float _856 = _854 * _848;
        float _858 = precise::clamp(_856, 0.0, 1.0);
        float _860 = -_858;
        float _862 = _860 + 1.0;
        _808 = _842;
        _810 = _828;
        _752 = _862;
    }
    float _864 = _808;
    float _866 = _810;
    float _868 = _752;
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _872 = _736 + _870;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _876 = _738 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _880 = _740 + _878;
    float _882 = _872 * _872;
    float _884 = fma(_876, _876, _882);
    float _886 = fma(_880, _880, _884);
    float _888 = rsqrt(_886);
    float _890 = _888 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _892 = _876 * _890;
    float _894 = _880 * _890;
    float _896 = _892 * _892;
    float _898 = _894 * _894;
    float _900 = _896 + _898;
    float _902 = sqrt(_900);
    bool _904 = _902 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _906 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _908 = _902 + _906;
    float _910 = _888;
    float _912 = _866;
    float _914 = _908;
    float _916 = _890;
    if (_904)
    {
        float _918 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _910 = _918;
    }
    float _920 = _910;
    if (_904)
    {
        float _922 = rsqrt(_900);
        _912 = _922;
    }
    float _924 = _912;
    float _926 = _924;
    if (_904)
    {
        float _928 = _908 * _920;
        _914 = _928;
    }
    float _930 = _914;
    if (_904)
    {
        float _932 = _930 * 0.15915493667125701904296875;
        _594 = _932;
    }
    float _934 = _594;
    float _936 = _880;
    if (_904)
    {
        float _938 = _934 * 6.283185482025146484375;
        float _940 = sin(_938);
        _936 = _940;
    }
    float _942 = _936;
    float _944 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _946 = precise::max(0.0, _944);
    float _948 = _864;
    float _950 = _946;
    float _952 = _944;
    if (_904)
    {
        float _954 = _934 * 6.283185482025146484375;
        float _956 = cos(_954);
        _948 = _956;
    }
    float _958 = _948;
    float _960 = -_890;
    float _962 = -_946;
    float _964 = fma(_872, _960, _962);
    float _966 = _964;
    if (_904)
    {
        float _968 = _964 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _950 = _968;
    }
    float _970 = _950;
    float _972 = sqrt(_886);
    float _974 = _970;
    float _976 = _942;
    if (_904)
    {
        float _978 = fma(_942, _970, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _974 = _978;
    }
    float _980 = _974;
    float _982 = _980;
    if (!_904)
    {
        _976 = _892;
    }
    float _984 = _976;
    float _986 = _984;
    float _988 = _958;
    if (_904)
    {
        float _990 = _958 + (-1.0);
        _952 = _990;
    }
    float _992 = _952;
    float _994 = _992;
    if (_904)
    {
        float _996 = _924 * _980;
        _916 = _996;
    }
    float _998 = _916;
    if (!_904)
    {
        _982 = _896;
    }
    float _1000 = _982;
    float _1002 = _1000;
    if (_904)
    {
        float _1004 = _992 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _926 = _1004;
    }
    float _1006 = _926;
    if (_904)
    {
        float _1008 = _892 * _998;
        _986 = _1008;
    }
    float _1010 = _986;
    if (!_904)
    {
        _994 = _894;
    }
    float _1012 = _994;
    float _1014 = _1012;
    if (_904)
    {
        float _1016 = _894 * _998;
        _1014 = _1016;
    }
    float _1018 = _1014;
    if (_904)
    {
        float _1020 = fma(_964, _958, _1006);
        _966 = _1020;
    }
    float _1022 = _966;
    if (_904)
    {
        float _1024 = _1010 * _1010;
        _1002 = _1024;
    }
    float _1026 = _1002;
    if (!_904)
    {
        _988 = _898;
    }
    float _1028 = _988;
    float _1030 = _1028;
    if (_904)
    {
        float _1032 = _1018 * _1018;
        _1030 = _1032;
    }
    float _1034 = _1030;
    float _1036 = fma(_1022, _1022, _1026);
    float _1038 = _736 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1040 = _1036 + _1034;
    float _1042 = _736 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1046 = fma(_972, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1044);
    float _1048 = precise::clamp(_1046, 0.0, 1.0);
    float _1050 = _736 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1052 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1054 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1042);
    float _1056 = rsqrt(_1040);
    float _1058 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1050);
    float _1060 = -_1048;
    float _1062 = _1060 + 1.0;
    float _1064 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1054);
    float _1066 = _736 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1068 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1058);
    float _1070 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1038);
    float _1072 = _1064 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1074 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1066);
    float _1076 = abs(_1062);
    float _1078 = log2(_1076);
    float _1080 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1082 = _1072 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1084 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1074);
    float _1086 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1070);
    float _1088 = -_1082;
    float _1090 = fma(_1088, _1052, 1.0);
    float _1092 = _1056 * _1010;
    float _1094 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1096 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1098 = _1056 * _1022;
    float _1100 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1102 = _1056 * _1018;
    float _1104 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1096);
    float _1106 = _1086 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1108 = -_1100;
    float _1110 = fma(_1098, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1108);
    float _1112 = _1078 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1114 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1104);
    float _1116 = log2(_1090);
    float _1118 = -_1102;
    float _1120 = fma(_1118, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1110);
    float _1122 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1124 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1114);
    float _1126 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1128 = fma(_1120, -0.5, 0.5);
    float _1130 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1122);
    float _1132 = fma(_1120, 0.5, 0.5);
    float _1134 = exp2(_1112);
    float _1136 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1126);
    float _1138 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1130);
    float _1140 = _1098 + 1.0;
    float _1142 = fma(_1132, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1144 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1136);
    float _1146 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1138);
    float _1148 = 1.0 / _1124;
    float _1150 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1144);
    float _1152 = _1116 * 0.693147182464599609375;
    float _1154 = fma(_1132, _1142, -0.212114393711090087890625);
    float _1156 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1158 = fma(_1132, _1154, 1.570728778839111328125);
    float _1160 = sqrt(_1128);
    float _1162 = -_1098;
    float _1164 = fma(_1134, _1140, _1162);
    float _1166 = fma(_1164, 0.5, 0.5);
    float _1168 = _1146 * _1148;
    float _1170 = _1150 * _1148;
    float _1172 = fma(_1168, 0.5, 0.5);
    float _1174 = fma(_1170, -0.5, 0.5);
    float _1176 = _1160 * 0.636619746685028076171875;
    float3 _3302 = float3(_1172, _1174, _1156);
    float _1178 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3302, float3(0.0), isnan(_3302)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3302, float3(0.0), isnan(_3302)), level(0.0)).x;
    float3 _3313 = float3(_1172, _1174, _1156);
    float4 _1181 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3313, float3(0.0), isnan(_3313)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3313, float3(0.0), isnan(_3313)), level(0.0)).xyzw;
    float _1183 = _1181.x;
    float _1185 = _1181.y;
    float _1187 = _1181.z;
    float _1189 = _1181.w;
    float _1191 = -_1158;
    float _1193 = fma(_1176, _1191, 1.0);
    float2 _3335 = float2(_1193, _1166);
    float3 _1197 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3335, float2(0.0), isnan(_3335)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3335, float2(0.0), isnan(_3335)), level(0.0)).xyz;
    float _1199 = _1197.x;
    float _1201 = _1197.y;
    float _1203 = _1197.z;
    float _1205 = in.m_49.w;
    float _1207 = _1078 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1209 = _434 != 0.0;
    bool _1211 = isnan(_434);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan(0.0);
    bool _1217 = _1213 || _1215;
    float _1219 = in.m_57.y;
    int _1221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1223 = _1221 != 0;
    float _1225 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1229 = _1227 != 0;
    float _1231 = in.m_57.x;
    int _1233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1235 = _1233 != 0;
    float _1237 = exp2(_1207);
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1241 = _1239 != 0;
    float _1243 = in.m_59.x;
    float _1245 = in.m_59.y;
    float _1247 = in.m_59.z;
    float _1249 = in.m_59.w;
    bool _1251 = _420 == 0.0;
    bool _1253 = !_1217;
    bool _1255 = _1251 && _1253;
    out.m_61.y = _434;
    int _1257 = 0;
    bool _1259 = _1235;
    if (_1223)
    {
        float _1261 = in.m_49.z;
        _1257 = as_type<int>(_1261);
    }
    int _1263 = _1257;
    bool _1265 = _422 == 0.0;
    bool _1267 = _1265 && _1255;
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1273 = _1205 > 0.5;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1277 = in.m_63.x;
    float _1279 = in.m_63.y;
    float _1281 = in.m_63.z;
    float _1283 = -_1219;
    float _1285 = _1283 + 1.0;
    bool _1287 = _122 > 0.5;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1291 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1293 = _1271 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1295 = _1273 ? as_type<int>(_1285) : as_type<int>(_1219);
    float _1297 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1299 = _1273;
    float _1301 = _1219;
    float _1303 = _1285;
    float _1305 = _1297;
    float _1307 = _1291;
    float _1309 = _1293;
    if (_1229)
    {
        bool _1311 = _120 > 0.5;
        _1299 = _1311;
    }
    bool _1313 = _1299;
    int _1315 = 0;
    if (_1229)
    {
        float _1317 = -_1231;
        float _1319 = _1317 + 1.0;
        _1315 = as_type<int>(_1319);
    }
    int _1321 = _1315;
    float _1323 = _1235 ? as_type<float>(_1295) : _1219;
    float _1325 = -_1237;
    float _1327 = _1325 + 1.0;
    if (_1241)
    {
        float _1329 = _1287 ? _1285 : _1219;
        _1301 = _1329;
    }
    float _1331 = _1301;
    out.m_65.x = _1291;
    out.m_65.y = _1293;
    out.m_65.z = _1297;
    out.m_65.w = _1289;
    float _1333 = 0.0;
    if (!_1229)
    {
        _1333 = _1231;
    }
    float _1335 = _1333;
    float _1337 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1339 = _1335;
    if (!_1223)
    {
        _138 = _1231;
    }
    float _1341 = _138;
    out.m_67.x = _738;
    out.m_67.y = _736;
    out.m_67.z = _740;
    int _1343 = _1263;
    float _1345 = _1341;
    if (_1223)
    {
        bool _1347 = as_type<float>(_1263) > 0.5;
        _1259 = _1347;
    }
    bool _1349 = _1259;
    if (_1223)
    {
        float _1351 = -_1231;
        float _1353 = _1351 + 1.0;
        _1343 = as_type<int>(_1353);
    }
    int _1355 = _1343;
    if (_1229)
    {
        float _1357 = _1313 ? as_type<float>(_1321) : _1231;
        _1339 = _1357;
    }
    float _1359 = _1339;
    float _1361 = _1277;
    if (_1267)
    {
        _1303 = _1277;
    }
    float _1363 = _1303;
    float _1365 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1367 = 0.0;
    float _1369 = _1363;
    if (_1267)
    {
        _1367 = _1279;
    }
    float _1371 = _1367;
    float _1373 = _1247 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1375 = _1371;
    if (_1267)
    {
        _1305 = _1281;
    }
    float _1377 = _1305;
    float _1379 = _1377;
    if (_1267)
    {
        _1307 = _1363;
    }
    float _1381 = _1307;
    float _1383 = _1381;
    if (!_1267)
    {
        _1369 = _1277;
    }
    float _1385 = _1369;
    if (_1267)
    {
        _1309 = _1371;
    }
    float _1387 = _1309;
    float _1389 = _1387;
    if (_1267)
    {
        _1361 = _1377;
    }
    float _1391 = _1361;
    float _1393 = _1391;
    if (!_1267)
    {
        float _1395 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1385);
        _1383 = _1395;
    }
    float _1397 = _1383;
    if (!_1267)
    {
        _1375 = _1279;
    }
    float _1399 = _1375;
    float _1401 = _1247 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (!_1267)
    {
        _1379 = _1281;
    }
    float _1403 = _1379;
    float _1405 = _1247 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (_1223)
    {
        float _1407 = _1349 ? as_type<float>(_1355) : _1231;
        _1345 = _1407;
    }
    float _1409 = _1345;
    float _1411 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1373);
    float _1413 = _1247 * _1385;
    if (!_1267)
    {
        float _1415 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1403);
        _1393 = _1415;
    }
    float _1417 = _1393;
    float _1419 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1401);
    float _1421 = _1245 * _1403;
    float _1423 = _1243 * _1399;
    float _1425 = -_1413;
    float _1427 = fma(_1243, _1403, _1425);
    float _1429 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1431 = -_1245;
    float _1433 = fma(_1431, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1419);
    float _1435 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1405);
    if (!_1267)
    {
        float _1437 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1399);
        _1389 = _1437;
    }
    float _1439 = _1389;
    float _1441 = -_1421;
    float _1443 = fma(_1247, _1399, _1441);
    float _1445 = -_1423;
    float _1447 = fma(_1245, _1385, _1445);
    float _1449 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1451 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1455 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1429);
    float _1457 = _1433 * _440;
    float _1459 = -_1245;
    float _1461 = fma(_1459, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1435);
    float _1463 = _1433 * _458;
    float _1465 = _1447 * _1249;
    float _1467 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1449);
    float _1469 = -_1457;
    float _1471 = fma(_1461, _458, _1469);
    float _1473 = fma(_1461, _440, _1463);
    float _1475 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1451);
    float _1477 = _1427 * _1249;
    float _1479 = _1443 * _1249;
    float _1481 = -_1245;
    float _1483 = fma(_1481, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1411);
    float _1485 = _1465 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1487 = _1465 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1489 = _1465 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1491 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1225);
    float _1493 = fma(_1479, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1485);
    float _1495 = fma(_1479, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1487);
    float _1497 = fma(_1479, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1489);
    out.m_69.x = _1473;
    out.m_69.y = _1483;
    out.m_69.z = _1471;
    float _1499 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1503 = -_1439;
    float _1505 = fma(_1503, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1475);
    float _1507 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1491);
    float _1509 = _1499 * _1453;
    bool _1511 = _806 > 0.0;
    bool _1513 = isnan(_806);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan(0.0);
    bool _1519 = _1515 || _1517;
    float _1521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1523 = _868 <= 0.0;
    bool _1525 = !_1519;
    bool _1527 = _1523 || _1525;
    float _1529 = -_1439;
    float _1531 = fma(_1529, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1455);
    float _1533 = -_1439;
    float _1535 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1467);
    float _1537 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1539 = -_1477;
    float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1493);
    float _1543 = _1531 * _440;
    float _1545 = _1531 * _458;
    float _1547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1549 = _1337 * _1501;
    float _1551 = -_1543;
    float _1553 = fma(_1505, _458, _1551);
    float _1555 = fma(_1505, _440, _1545);
    float _1557 = _806 * _868;
    float _1559 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1507);
    float _1561 = -_1477;
    float _1563 = fma(_1561, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1495);
    float _1565 = -_1477;
    float _1567 = fma(_1565, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1497);
    out.m_71.x = _1555;
    out.m_71.y = _1535;
    out.m_71.z = _1553;
    float _1569 = _1365 * _1521;
    float _1571 = _1557 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1573 = _1559 + _1124;
    out.m_73.x = _1541;
    out.m_73.y = _1563;
    out.m_73.z = _1567;
    float _1575 = _1571 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1577 = _1537 * _1547;
    float _1579 = _1573 * 0.5;
    out.m_45.x = _1575;
    float _1581 = _1327 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.x = _1569;
    out.m_75.y = _1509;
    out.m_75.z = _1577;
    out.m_75.w = _1549;
    out.gl_Position.x = _1146;
    out.gl_Position.y = _1150;
    out.gl_Position.z = _1559;
    out.gl_Position.w = _1124;
    out.m_77.z = _1579;
    out.m_77.w = _1124;
    float _1583 = -_1581;
    float _1585 = _1583 + 1.0;
    float _1587 = _1581 * _1178;
    float _1589 = _1189 * _1587;
    float _1591 = _1203 * _1587;
    float _1593 = fma(_1199, _1589, _1183);
    float _1595 = fma(_1201, _1589, _1185);
    float _1597 = _1189 * _1585;
    float _1599 = fma(_1189, _1591, _1187);
    out.m_79.x = _1593;
    out.m_79.y = _1595;
    out.m_79.z = _1599;
    out.m_79.w = _1597;
    if (!_1527)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1601 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1601;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

