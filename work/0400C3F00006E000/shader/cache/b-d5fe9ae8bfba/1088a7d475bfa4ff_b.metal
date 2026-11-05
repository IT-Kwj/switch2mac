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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
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
    float4 m_73 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_63 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
    float4 m_51 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _110 = 0;
    if (!_104)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1952 = as_type<float>(_114);
        out.gl_Position.z = _1952;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _118 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_91);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = float(_96);
    bool _130 = _100 >= _128;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_49.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _116 = as_type<int>(_140);
    }
    int _142 = _116;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2008 = as_type<float>(_142);
        out.gl_Position.z = _2008;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_51.x;
    float _146 = in.m_51.y;
    float _148 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _152 = _150 != 0;
    float _154 = in.m_53.x;
    float _156 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c10)._m0[8].y, _148);
    float _158 = in.m_53.w;
    float _160 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c10)._m0[10].y, _156);
    float _162 = in.m_53.y;
    float _164 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _166 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _164;
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = rsqrt(_160);
    bool _176 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _178 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _180 = _176 || _178;
    bool _182 = isnan(1.0);
    bool _184 = _180 || _182;
    float _186 = in.m_57.x;
    float _188 = in.m_57.y;
    float _190 = in.m_57.z;
    float _192 = _144 * _144;
    float _194 = _146 * 12.98980045318603515625;
    float _196 = abs(_144);
    float _198 = log2(_196);
    float _200 = _146 * 78.233001708984375;
    float _202 = in.m_53.z;
    float _204 = fma(_154, 78.233001708984375, _194);
    float _206 = fma(_192, -0.980000019073486328125, 1.0);
    float _208 = in.m_51.z;
    float _210 = fma(_158, 12.98980045318603515625, _200);
    float _212 = _204 * 0.15915493667125701904296875;
    float _214 = in.m_57.w;
    float _216 = fma(_162, 78.233001708984375, _194);
    float _218 = _210 * 0.15915493667125701904296875;
    float _220 = _212 * 6.283185482025146484375;
    float _222 = sin(_220);
    float _224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _168);
    float _226 = _198 * 0.800000011920928955078125;
    float _228 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _170);
    float _230 = _216 * 0.15915493667125701904296875;
    float _232 = _186 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _234 = _218 * 6.283185482025146484375;
    float _236 = sin(_234);
    float _238 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _240 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _238;
    float _242 = _188 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _244 = _190 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _246 = _232 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _248 = _240 * _240;
    float _250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _172);
    float _252 = _230 * 6.283185482025146484375;
    float _254 = sin(_252);
    float _256 = _242 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _258 = _244 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _260 = fma(_166, _166, _248);
    float _262 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _264 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _262;
    float _266 = _256 * _228;
    float _268 = _246 * _224;
    float _270 = fma(_264, _264, _260);
    float _272 = _258 * _250;
    float _274 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _276 = in.m_44.x;
    float _278 = in.m_44.y;
    float _280 = in.m_44.z;
    float _282 = _266 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _284 = exp2(_226);
    float _286 = _236 * 43758.546875;
    float _288 = in.m_42.x;
    float _290 = in.m_42.y;
    float _292 = in.m_42.z;
    float _294 = _222 * 43758.546875;
    float _296 = _254 * 43758.546875;
    float _298 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].z, _274);
    float _300 = _266 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _302 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[24].x, _282);
    float _304 = _266 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _306 = _202 * 78.233001708984375;
    float _308 = sqrt(_270);
    float _310 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[25].x, _300);
    float _312 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[26].x, _304);
    float _314 = fma(_208, 12.98980045318603515625, _306);
    float _316 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _318 = fma(_272, (*spvDescriptorSet0.vp_c8)._m0[24].z, _302);
    float _320 = fma(_272, (*spvDescriptorSet0.vp_c8)._m0[25].z, _310);
    float _322 = floor(_286);
    float _324 = fma(_272, (*spvDescriptorSet0.vp_c8)._m0[26].z, _312);
    float _326 = _272;
    float _328 = (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _330 = _316;
    float _332 = _154;
    if (!_184)
    {
        float _334 = _316 * _316;
        float _336 = _334 * 0.5;
        _326 = _336;
    }
    float _338 = _326;
    float _340 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _298);
    float _342 = fma(_284, 820.0, _100);
    float _344 = _284;
    if (!_152)
    {
        _328 = _202;
    }
    float _346 = _328;
    float _348 = _314 * 0.15915493667125701904296875;
    float _350 = _346;
    if (!_184)
    {
        float _352 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _344 = _352;
    }
    float _354 = _344;
    float _356 = floor(_294);
    float _358 = floor(_296);
    bool _360 = !_184;
    float _362 = _354;
    if (!_360)
    {
        float _364 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _366 = log2(_364);
        float _368 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _370 = _368 + 1.0;
        float _372 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _374 = _316 * _366;
        float _376 = 1.0 / _370;
        float _378 = _372 * 0.693147182464599609375;
        float _380 = exp2(_374);
        float _382 = 1.0 / _378;
        float _384 = _380 + (-1.0);
        float _386 = -_384;
        float _388 = fma(_386, _382, _316);
        float _390 = _388 * _376;
        float _392 = _390 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _362 = _392;
    }
    float _394 = _362;
    bool _396 = !_184;
    if (!_396)
    {
        float _398 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _400 = log2(_398);
        float _402 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _404 = _402 + 1.0;
        float _406 = 1.0 / _404;
        float _408 = _316 * _400;
        float _410 = exp2(_408);
        float _412 = -_410;
        float _414 = _412 + 1.0;
        float _416 = _414 * _406;
        _330 = _416;
    }
    float _418 = _330;
    float _420 = _348 * 6.283185482025146484375;
    float _422 = sin(_420);
    float _424 = precise::max(_308, 250.0);
    float _426 = _342 * 0.0050000003539025783538818359375;
    float _428 = -_358;
    float _430 = _296 + _428;
    float _432 = -_356;
    float _434 = _294 + _432;
    float _436 = _394 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _438 = precise::min(_424, 400.0);
    float _440 = _426 * 0.15915493667125701904296875;
    float _442 = -_322;
    float _444 = _286 + _442;
    float _446 = _394 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _448 = _394 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _450 = fma(_438, 0.0033333334140479564666748046875, -0.33333337306976318359375);
    float _452 = fma(_418, _278, _436);
    float _454 = fma(_418, _276, _446);
    float _456 = _440 * 6.283185482025146484375;
    float _458 = cos(_456);
    float _460 = fma(_418, _280, _448);
    float _462 = _422 * 43758.546875;
    float _464 = _444 * 6.283185482025146484375;
    float _466 = _100 + 800.0;
    float _468 = _434 * 6.283185482025146484375;
    float _470 = fma(_454, _214, _288);
    float _472 = fma(_100, 0.1500000059604644775390625, _464);
    float _474 = _440 * 6.283185482025146484375;
    float _476 = sin(_474);
    float _478 = fma(_452, _214, _290);
    float _480 = fma(_460, _214, _292);
    float _482 = _174 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _484 = fma(_466, 0.00120000005699694156646728515625, _468);
    float _486 = _174 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _488 = _472 * 0.15915493667125701904296875;
    float _490 = _174 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _492 = floor(_462);
    float _494 = -_458;
    float _496 = _494 + 1.0;
    float _498 = _430 * 6.283185482025146484375;
    float _500 = fma(_342, 0.00120000005699694156646728515625, _468);
    float _502 = _484 * 0.15915493667125701904296875;
    float _504 = _482 * _496;
    float _506 = _486 * _486;
    float _508 = fma(_342, 0.00999999977648258209228515625, _498);
    float _510 = _482 * _476;
    float _512 = _490 * _476;
    float _514 = _488 * 6.283185482025146484375;
    float _516 = sin(_514);
    float _518 = _486 * _476;
    float _520 = fma(_482, _504, _458);
    float _522 = _500 * 0.15915493667125701904296875;
    float _524 = _490 * _496;
    float _526 = fma(_496, _506, _458);
    float _528 = -_492;
    float _530 = _462 + _528;
    float _532 = _508 * 0.15915493667125701904296875;
    float _534 = _502 * 6.283185482025146484375;
    float _536 = sin(_534);
    float _538 = fma(_490, _504, _518);
    float _540 = _530 * 6.283185482025146484375;
    float _542 = -_518;
    float _544 = fma(_490, _504, _542);
    float _546 = -_512;
    float _548 = fma(_486, _504, _546);
    float _550 = fma(_342, 0.02700000070035457611083984375, _498);
    float _552 = fma(_486, _504, _512);
    float _554 = fma(_490, _524, _458);
    float _556 = _320 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _558 = _522 * 6.283185482025146484375;
    float _560 = sin(_558);
    float _562 = fma(_486, _524, _510);
    float _564 = -_510;
    float _566 = fma(_486, _524, _564);
    float _568 = fma(_342, -0.02300000004470348358154296875, _540);
    float _570 = fma(_466, 0.02700000070035457611083984375, _498);
    float _572 = _550 * 0.15915493667125701904296875;
    float _574 = _478 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _576 = _478 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _578 = _532 * 6.283185482025146484375;
    float _580 = sin(_578);
    float _582 = _318 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _584 = _556 * _544;
    float _586 = _568 * 0.15915493667125701904296875;
    float _588 = _570 * 0.15915493667125701904296875;
    float _590 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[4].x, _574);
    float _592 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[5].x, _576);
    float _594 = _572 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = _478 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _600 = _556 * _562;
    float _602 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[4].z, _590);
    float _604 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[5].z, _592);
    float _606 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[6].x, _598);
    float _608 = fma(_582, _520, _584);
    float _610 = _556 * _554;
    float _612 = _586 * 6.283185482025146484375;
    float _614 = sin(_612);
    float _616 = fma(_466, 0.00999999977648258209228515625, _498);
    float _618 = fma(_516, 0.119999997317790985107421875, 1.0);
    float _620 = _536 * 0.1500000059604644775390625;
    float _622 = fma(_582, _538, _610);
    float _624 = _324 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _626 = _560 * 0.1500000059604644775390625;
    float _628 = fma(_466, 0.00200000009499490261077880859375, _620);
    float _630 = fma(_582, _548, _600);
    float _632 = fma(_624, _552, _608);
    float _634 = _588 * 6.283185482025146484375;
    float _636 = sin(_634);
    float _638 = fma(_146, 6.283185482025146484375, _628);
    float _640 = _616 * 0.15915493667125701904296875;
    float _642 = fma(_624, _566, _622);
    float _644 = fma(_342, 0.00200000009499490261077880859375, _626);
    float _646 = _638 * (-0.15915493667125701904296875);
    float _648 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[6].z, _606);
    float _650 = rsqrt(_340);
    float _652 = fma(_146, 6.283185482025146484375, _644);
    float _654 = _596 * 5.30000019073486328125;
    float _656 = fma(_614, 0.1500000059604644775390625, 1.0);
    float _658 = fma(_624, _526, _630);
    float _660 = _648 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _662 = fma(_580, 13.69999980926513671875, _654);
    float _664 = _206 * _656;
    float _666 = _640 * 6.283185482025146484375;
    float _668 = sin(_666);
    float _670 = _602 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _672 = _604 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _674 = _620 * 300.0;
    float _676 = _636 * 5.30000019073486328125;
    float _678 = fma(_582, _618, _670);
    float _680 = fma(_556, _618, _672);
    float _682 = _664 * _450;
    float _684 = _646 * 6.283185482025146484375;
    float _686 = cos(_684);
    float _688 = fma(_624, _618, _660);
    float _690 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[8].z, _678);
    float _692 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[9].z, _680);
    float _694 = fma(_632, _682, _670);
    float _696 = fma(_642, _682, _672);
    float _698 = fma(_658, _682, _660);
    float _700 = _652 * 0.15915493667125701904296875;
    float _702 = _646 * 6.283185482025146484375;
    float _704 = sin(_702);
    float _706 = fma(_668, 13.69999980926513671875, _676);
    float _708 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[10].z, _688);
    float _710 = _650 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _712 = _650 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _714 = _650 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _716 = _626 * 300.0;
    float _718 = -_670;
    float _720 = _718 + _690;
    float _722 = -_686;
    float _724 = _722 + 1.0;
    float _726 = _710 * _710;
    float _728 = _700 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[8].z, _694);
    float _734 = _712 * _724;
    float _736 = fma(_726, _724, _686);
    float _738 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[9].z, _696);
    float _740 = _638 * 0.15915493667125701904296875;
    float _742 = _712 * _704;
    float _744 = _710 * _704;
    float _746 = _714 * _704;
    float _748 = _714 * _724;
    float _750 = fma(_712, _734, _686);
    float _752 = fma(_714, _734, _744);
    float _754 = -_744;
    float _756 = fma(_714, _734, _754);
    float _758 = fma(_714, _748, _686);
    float _760 = fma(_710, _748, _742);
    float _762 = _700 * 6.283185482025146484375;
    float _764 = cos(_762);
    float _766 = -_742;
    float _768 = fma(_710, _748, _766);
    float _770 = -_672;
    float _772 = _770 + _692;
    float _774 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[10].z, _698);
    float _776 = -_746;
    float _778 = fma(_710, _734, _776);
    float _780 = _662 + 280.0;
    float _782 = _758 * _772;
    float _784 = _756 * _772;
    float _786 = _760 * _772;
    float _788 = fma(_710, _734, _746);
    float _790 = fma(_752, _720, _782);
    float _792 = fma(_750, _720, _784);
    float _794 = fma(_778, _720, _786);
    float _796 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[8].x, _732);
    float _798 = -_660;
    float _800 = _798 + _708;
    float _802 = _740 * 6.283185482025146484375;
    float _804 = cos(_802);
    float _806 = -_764;
    float _808 = _806 + 1.0;
    float _810 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[9].x, _738);
    float _812 = _710 * _730;
    float _814 = fma(_768, _800, _790);
    float _816 = _712 * _808;
    float _818 = _712 * _730;
    float _820 = _714 * _808;
    float _822 = _740 * 6.283185482025146484375;
    float _824 = sin(_822);
    float _826 = -_812;
    float _828 = fma(_714, _816, _826);
    float _830 = -_672;
    float _832 = _830 + _810;
    float _834 = -_670;
    float _836 = _834 + _796;
    float _838 = _714 * _730;
    float _840 = fma(_710, _820, _818);
    float _842 = fma(_712, _816, _764);
    float _844 = _828 * _832;
    float _846 = -_838;
    float _848 = fma(_710, _816, _846);
    float _850 = _840 * _832;
    float _852 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[10].x, _774);
    float _854 = fma(_842, _836, _844);
    float _856 = -_804;
    float _858 = _856 + 1.0;
    float _860 = fma(_788, _800, _792);
    float _862 = in.m_51.w;
    float _864 = _706 + 280.0;
    float _866 = _672 + _814;
    float _868 = fma(_848, _836, _850);
    float _870 = _712 * _824;
    float _872 = _714 * _824;
    float _874 = _710 * _824;
    float _876 = fma(_808, _726, _764);
    float _878 = fma(_726, _858, _804);
    float _880 = fma(_736, _800, _794);
    float _882 = _714 * _858;
    float _884 = _670 + _860;
    float _886 = fma(_864, (*spvDescriptorSet0.vp_c10)._m0[9].x, _866);
    float _888 = _712 * _858;
    float _890 = fma(_710, _882, _870);
    float _892 = fma(_864, (*spvDescriptorSet0.vp_c10)._m0[8].x, _884);
    float _894 = -_672;
    float _896 = _894 + _886;
    float _898 = _660 + _880;
    float _900 = -_874;
    float _902 = fma(_714, _888, _900);
    float _904 = -_872;
    float _906 = fma(_710, _888, _904);
    float _908 = -_670;
    float _910 = _908 + _892;
    float _912 = _890 * _896;
    float _914 = fma(_864, (*spvDescriptorSet0.vp_c10)._m0[10].x, _898);
    float _916 = fma(_712, _888, _804);
    float _918 = _902 * _896;
    float _920 = fma(_906, _910, _912);
    float _922 = -_660;
    float _924 = _922 + _914;
    float _926 = -_660;
    float _928 = _926 + _852;
    float _930 = fma(_916, _910, _918);
    float _932 = fma(_710, _888, _872);
    float _934 = fma(_878, _924, _920);
    float _936 = fma(_876, _928, _868);
    float _938 = fma(_710, _816, _838);
    float _940 = fma(_932, _924, _930);
    float _942 = -_862;
    float _944 = _942 + 1.0;
    float _946 = _660 + _934;
    float _948 = fma(_938, _928, _854);
    float _950 = _660 + _936;
    float _952 = _670 + _940;
    float _954 = _946 * _944;
    float _956 = _670 + _948;
    float _958 = fma(_714, _816, _812);
    float _960 = _952 * _944;
    float _962 = fma(_950, _862, _954);
    float _964 = in.m_59.x;
    float _966 = fma(_714, _882, _804);
    float _968 = fma(_956, _862, _960);
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _972 = _962 + _970;
    float _974 = fma(_714, _820, _764);
    float _976 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _978 = _968 + _976;
    float _980 = _972 * _972;
    float _982 = fma(_714, _888, _874);
    float _984 = _966 * _896;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _988 = _986 != 0;
    float _990 = fma(_978, _978, _980);
    float _992 = _974 * _832;
    float _994 = -_870;
    float _996 = fma(_710, _882, _994);
    float _998 = fma(_982, _910, _984);
    float _1000 = sqrt(_990);
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1004 = _1002 != 0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1008 = _1006 != 0;
    float _1010 = -_818;
    float _1012 = fma(_710, _820, _1010);
    float _1014 = fma(_958, _836, _992);
    float _1016 = fma(_996, _924, _998);
    bool _1018 = _162 > 0.5;
    float _1020 = fma(_1012, _928, _1014);
    float _1022 = _672 + _1016;
    float _1024 = _952;
    int _1026 = as_type<int>(_672);
    int _1028 = as_type<int>(_710);
    float _1030 = _1020;
    float _1032 = _882;
    float _1034 = _962;
    float _1036 = _1012;
    float _1038 = _978;
    bool _1040 = _1018;
    float _1042 = _964;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_988)
    {
        _1024 = _964;
    }
    float _1046 = _1024;
    float _1048 = _672 + _1020;
    float _1050 = _1022 * _944;
    float _1052 = _1048;
    float _1054 = _1046;
    if (_1004)
    {
        float _1056 = -_964;
        float _1058 = _1056 + 1.0;
        _1026 = as_type<int>(_1058);
    }
    int _1060 = _1026;
    float _1062 = as_type<float>(_1060);
    if (_1008)
    {
        float _1064 = -_964;
        float _1066 = _1064 + 1.0;
        _1028 = as_type<int>(_1066);
    }
    int _1068 = _1028;
    bool _1070 = _1000 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1072 = fma(_1048, _862, _1050);
    if (!_1004)
    {
        _1030 = _964;
    }
    float _1074 = _1030;
    float _1076 = _1074;
    if (!_1008)
    {
        _1032 = _964;
    }
    float _1078 = _1032;
    float _1080 = _1078;
    if (_1004)
    {
        float _1082 = _1018 ? as_type<float>(_1060) : _964;
        _1076 = _1082;
    }
    float _1084 = _1076;
    if (_1008)
    {
        float _1086 = _1018 ? as_type<float>(_1068) : _964;
        _1080 = _1086;
    }
    float _1088 = _1080;
    if (!_1070)
    {
        _1062 = _968;
    }
    float _1090 = _1062;
    float _1092 = _1090;
    if (!_1070)
    {
        _1052 = _1072;
    }
    float _1094 = _1052;
    bool _1096 = !_1070;
    float _1098 = _1094;
    if (!_1096)
    {
        float _1100 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1102 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1104 = _1000 + _1102;
        float _1106 = _1072 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1108 = rsqrt(_990);
        float _1110 = _1104 * _1100;
        float _1112 = _1110 * 0.15915493667125701904296875;
        float _1114 = _1112 * 6.283185482025146484375;
        float _1116 = cos(_1114);
        float _1118 = _1112 * 6.283185482025146484375;
        float _1120 = sin(_1118);
        float _1122 = _1116 + (-1.0);
        float _1124 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1126 = fma(_1120, _1106, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1128 = fma(_1072, _1116, _1124);
        float _1130 = _1108 * _1126;
        float _1132 = fma(_978, _1130, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1134 = fma(_972, _1130, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1098 = _1128;
        _1092 = _1132;
        _1034 = _1134;
    }
    float _1136 = _1098;
    float _1138 = _1092;
    float _1140 = _1034;
    float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1144 = _1136 + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1148 = _1138 + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1152 = _1140 + _1150;
    float _1154 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1156 = _1144 * _1144;
    float _1158 = fma(_1148, _1148, _1156);
    float _1160 = precise::max(0.0, _1154);
    float _1162 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1164 = fma(_1152, _1152, _1158);
    float _1166 = rsqrt(_1164);
    float _1168 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1170 = _1148 * _1168;
    float _1172 = _1152 * _1168;
    float _1174 = -_1168;
    float _1176 = -_1160;
    float _1178 = fma(_1144, _1174, _1176);
    float _1180 = _1170 * _1170;
    float _1182 = _1172 * _1172;
    float _1184 = _1180 + _1182;
    float _1186 = sqrt(_1184);
    bool _1188 = _1186 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1192 = _1186 + _1190;
    float _1194 = _1152;
    float _1196 = _1144;
    float _1198 = _1158;
    float _1200 = _1192;
    float _1202 = _1178;
    if (_1188)
    {
        float _1204 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1194 = _1204;
    }
    float _1206 = _1194;
    if (_1188)
    {
        float _1208 = _1178 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1196 = _1208;
    }
    float _1210 = _1196;
    float _1212 = _1210;
    if (_1188)
    {
        float _1214 = rsqrt(_1184);
        _1198 = _1214;
    }
    float _1216 = _1198;
    float _1218 = _1206;
    float _1220 = _1216;
    if (_1188)
    {
        float _1222 = _1192 * _1206;
        _1200 = _1222;
    }
    float _1224 = _1200;
    if (!_1188)
    {
        _1218 = _1170;
    }
    float _1226 = _1218;
    float _1228 = _1226;
    if (_1188)
    {
        float _1230 = _1224 * 0.15915493667125701904296875;
        _1036 = _1230;
    }
    float _1232 = _1036;
    float _1234 = _1224;
    if (_1188)
    {
        float _1236 = _1232 * 6.283185482025146484375;
        float _1238 = sin(_1236);
        _1234 = _1238;
    }
    float _1240 = _1234;
    float _1242 = _1166;
    if (_1188)
    {
        float _1244 = _1232 * 6.283185482025146484375;
        float _1246 = cos(_1244);
        _1242 = _1246;
    }
    float _1248 = _1242;
    float _1250 = _1240;
    if (_1188)
    {
        float _1252 = fma(_1240, _1210, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1212 = _1252;
    }
    float _1254 = _1212;
    float _1256 = sqrt(_1164);
    float _1258 = _1254;
    if (_1188)
    {
        float _1260 = _1216 * _1254;
        _1038 = _1260;
    }
    float _1262 = _1038;
    if (!_1188)
    {
        _1258 = _1180;
    }
    float _1264 = _1258;
    float _1266 = _1264;
    float _1268 = _1248;
    if (_1188)
    {
        float _1270 = _1248 + (-1.0);
        _1250 = _1270;
    }
    float _1272 = _1250;
    float _1274 = _1272;
    if (_1188)
    {
        float _1276 = _1170 * _1262;
        _1228 = _1276;
    }
    float _1278 = _1228;
    if (_1188)
    {
        float _1280 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1220 = _1280;
    }
    float _1282 = _1220;
    if (!_1188)
    {
        _1274 = _1172;
    }
    float _1284 = _1274;
    float _1286 = _1284;
    if (_1188)
    {
        float _1288 = _1172 * _1262;
        _1286 = _1288;
    }
    float _1290 = _1286;
    if (_1188)
    {
        float _1292 = _1278 * _1278;
        _1266 = _1292;
    }
    float _1294 = _1266;
    if (_1188)
    {
        float _1296 = fma(_1178, _1248, _1282);
        _1202 = _1296;
    }
    float _1298 = _1202;
    if (!_1188)
    {
        _1268 = _1182;
    }
    float _1300 = _1268;
    float _1302 = _1300;
    if (_1188)
    {
        float _1304 = _1290 * _1290;
        _1302 = _1304;
    }
    float _1306 = _1302;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1310 = fma(_1256, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1308);
    float _1312 = precise::clamp(_1310, 0.0, 1.0);
    float _1314 = fma(_1298, _1298, _1294);
    float _1316 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1318 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1320 = -_1312;
    float _1322 = _1320 + 1.0;
    float _1324 = _1314 + _1306;
    float _1326 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1328 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1316);
    float _1330 = abs(_1322);
    float _1332 = log2(_1330);
    float _1334 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1318);
    float _1336 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1326);
    float _1338 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1328);
    float _1340 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1336);
    float _1342 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1344 = rsqrt(_1324);
    float _1346 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1350 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1342);
    float _1352 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1354 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1350);
    float _1356 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1358 = -_1352;
    float _1360 = fma(_1358, _1162, 1.0);
    float _1362 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1364 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1366 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1334);
    float _1368 = exp2(_1356);
    float _1370 = _1344 * _1278;
    float _1372 = _1344 * _1298;
    float _1374 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1364);
    float _1376 = _1344 * _1290;
    float _1378 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1380 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1382 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1374);
    float _1384 = log2(_1360);
    float _1386 = -_1378;
    float _1388 = fma(_1372, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1386);
    float _1390 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1392 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1382);
    float _1394 = -_1376;
    float _1396 = fma(_1394, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1388);
    float _1398 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1400 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1390);
    float _1402 = 1.0 / _1392;
    float _1404 = fma(_1396, -0.5, 0.5);
    float _1406 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1398);
    float _1408 = fma(_1396, 0.5, 0.5);
    float _1410 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1400);
    float _1412 = _1372 + 1.0;
    float _1414 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1406);
    float _1416 = fma(_1408, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1418 = sqrt(_1404);
    float _1420 = -_1372;
    float _1422 = fma(_1368, _1412, _1420);
    float _1424 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1414);
    float _1426 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1410);
    float _1428 = fma(_1408, _1416, -0.212114393711090087890625);
    float _1430 = _1384 * 0.693147182464599609375;
    float _1432 = fma(_1422, 0.5, 0.5);
    float _1434 = _1424 * _1402;
    float _1436 = _1426 * _1402;
    float _1438 = fma(_1408, _1428, 1.570728778839111328125);
    float _1440 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1442 = fma(_1434, 0.5, 0.5);
    float _1444 = fma(_1436, -0.5, 0.5);
    float _1446 = _1418 * 0.636619746685028076171875;
    float3 _4073 = float3(_1442, _1444, _1440);
    float _1448 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4073, float3(0.0), isnan(_4073)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4073, float3(0.0), isnan(_4073)), level(0.0)).x;
    float _1450 = -_1438;
    float _1452 = fma(_1446, _1450, 1.0);
    float3 _4089 = float3(_1442, _1444, _1440);
    float4 _1455 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4089, float3(0.0), isnan(_4089)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4089, float3(0.0), isnan(_4089)), level(0.0)).xyzw;
    float _1457 = _1455.x;
    float _1459 = _1455.y;
    float _1461 = _1455.z;
    float _1463 = _1455.w;
    float2 _4106 = float2(_1452, _1432);
    float3 _1467 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4106, float2(0.0), isnan(_4106)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4106, float2(0.0), isnan(_4106)), level(0.0)).xyz;
    float _1469 = _1467.x;
    float _1471 = _1467.y;
    float _1473 = _1467.z;
    float _1475 = in.m_59.y;
    float _1477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1479 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1481 = _158 > 0.5;
    out.m_61.x = _144;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1487 = _1485 != 0;
    float _1489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1491 = _154 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1493 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1479);
    int _1495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1497 = _1495 != 0;
    float _1499 = -_1483;
    float _1501 = fma(_1491, 2.0, _1499);
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1505 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1511 = _1509 != 0;
    float _1513 = fma(_1505, -2.0, _1503);
    float _1515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1519 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1507);
    float _1521 = -_1475;
    float _1523 = _1521 + 1.0;
    float _1525 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_61.w = _862;
    int _1527 = _1481 ? as_type<int>(_1523) : as_type<int>(_1475);
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1533 = _1531 != 0;
    int _1535 = 0;
    bool _1537 = _1497;
    int _1539 = as_type<int>(_1519);
    float _1541 = _1513;
    if (_1511)
    {
        float _1543 = -_964;
        float _1545 = _1543 + 1.0;
        _1535 = as_type<int>(_1545);
    }
    int _1547 = _1535;
    float _1549 = _1487 ? as_type<float>(_1527) : _1475;
    float _1551 = _1477 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1553 = _1018 ? as_type<int>(_1523) : as_type<int>(_1475);
    float _1555 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1529);
    if (_1511)
    {
        bool _1557 = _202 > 0.5;
        _1040 = _1557;
    }
    bool _1559 = _1040;
    float _1561 = fma(_1551, _1549, -0.5);
    float _1563 = _1497 ? as_type<float>(_1553) : _1475;
    float _1565 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1569 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1513);
    float _1571 = _1563;
    if (_988)
    {
        bool _1573 = _154 > 0.5;
        _1537 = _1573;
    }
    bool _1575 = _1537;
    float _1577 = fma(_1565, _1563, -0.5);
    if (!_152)
    {
        _1571 = _162;
    }
    float _1579 = _1571;
    float _1581 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1517);
    float _1583 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1519);
    float _1585 = _1579;
    if (_988)
    {
        float _1587 = -_964;
        float _1589 = _1587 + 1.0;
        _1539 = as_type<int>(_1589);
    }
    int _1591 = _1539;
    float _1593 = as_type<float>(_1591);
    if (!_152)
    {
        _1541 = _1579;
    }
    float _1595 = _1541;
    float _1597 = _1515 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1599 = _1595;
    if (_152)
    {
        _1585 = _162;
    }
    float _1601 = _1585;
    float _1603 = -_1569;
    float _1605 = fma(_1583, _1577, _1603);
    float _1607 = exp2(_1525);
    if (_988)
    {
        float _1609 = _1575 ? as_type<float>(_1591) : _964;
        _1054 = _1609;
    }
    float _1611 = _1054;
    float _1613 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    if (!_152)
    {
        _1593 = _1595;
    }
    float _1615 = _1593;
    float _1617 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1619 = _1615;
    if (_152)
    {
        _1599 = _154;
    }
    float _1621 = _1599;
    float _1623 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1625 = _1567;
    float _1627 = _1621;
    if (_1511)
    {
        float _1629 = _1559 ? as_type<float>(_1547) : _964;
        _1042 = _1629;
    }
    float _1631 = _1042;
    float _1633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    if (!_152)
    {
        _1625 = _346;
    }
    float _1635 = _1625;
    float _1637 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1493);
    float _1639 = _1635;
    if (_152)
    {
        _350 = _202;
    }
    float _1641 = _350;
    out.m_63.x = _1138;
    out.m_63.y = _1136;
    out.m_63.z = _1140;
    bool _1643 = _202 > 0.5;
    float _1645 = fma(_1621, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1617);
    float _1647 = fma(_1623, _1611, -0.5);
    if (_152)
    {
        _1619 = _154;
    }
    float _1649 = _1619;
    float _1651 = fma(_1597, _1631, -0.5);
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1657 = _1655 != 0;
    float _1659 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_152)
    {
        _1044 = _154;
    }
    float _1661 = _1044;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1665 = _1661;
    float _1667 = _1663;
    if (_152)
    {
        _1665 = _1641;
    }
    float _1669 = _1665;
    float _1671 = -_1653;
    float _1673 = fma(_1659, 2.0, _1671);
    int _1675 = _1643 ? as_type<int>(_1523) : as_type<int>(_1475);
    float _1677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1679 = _1669;
    if (_152)
    {
        _1627 = _1601;
    }
    float _1681 = _1627;
    float _1683 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1663);
    float _1685 = _1681;
    if (!_152)
    {
        _1679 = _1635;
    }
    float _1687 = _1679;
    float _1689 = -_100;
    float _1691 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1673);
    float _1693 = _1687;
    if (_152)
    {
        _1667 = _1641;
    }
    float _1695 = _1667;
    float _1697 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1683);
    float _1699 = _1695;
    if (_152)
    {
        _1639 = _1601;
    }
    float _1701 = _1639;
    float _1703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_152)
    {
        _1693 = _1601;
    }
    float _1705 = _1693;
    float _1707 = _1697 * (-0.15915493667125701904296875);
    if (!_152)
    {
        _1699 = _1601;
    }
    float _1709 = _1699;
    float _1711 = -_1607;
    float _1713 = _1711 + 1.0;
    float _1715 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1637);
    float _1717 = _1533 ? as_type<float>(_1675) : _1475;
    float _1719 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1723 = _1657 ? as_type<float>(_1675) : _1475;
    float _1725 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1727 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1555);
    float _1729 = -_100;
    float _1731 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1501);
    float _1733 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1735 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1721);
    if (!_152)
    {
        _1685 = _154;
    }
    float _1737 = _1685;
    float _1739 = fma(_1727, _1647, _1731);
    float _1741 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1733);
    float _1743 = _1707 * 6.283185482025146484375;
    float _1745 = cos(_1743);
    if (!_152)
    {
        _332 = _1641;
    }
    float _1747 = _332;
    float _1749 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1725);
    float _1751 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1735);
    float _1753 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1755 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1757 = _1751 * (-0.15915493667125701904296875);
    float _1759 = _1707 * 6.283185482025146484375;
    float _1761 = sin(_1759);
    float _1763 = _1747 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1767 = _1737 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1769 = _1705 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1771 = -_1753;
    float _1773 = fma(_1763, 2.0, _1771);
    float _1775 = fma(_1719, _1717, -0.5);
    float _1777 = fma(_1767, -2.0, _1755);
    float _1779 = _1757 * 6.283185482025146484375;
    float _1781 = sin(_1779);
    float _1783 = fma(_1769, -2.0, _1765);
    float _1785 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1787 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1741);
    float _1789 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1581);
    float _1791 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1645);
    float _1793 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1749);
    float _1795 = -_100;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1773);
    float _1799 = _1757 * 6.283185482025146484375;
    float _1801 = cos(_1799);
    float _1803 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1777);
    float _1805 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1783);
    float _1807 = _1745 * _1561;
    float _1809 = fma(_1785, _1084, -0.5);
    float _1811 = _1723 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1813 = _1761 * _1561;
    float _1815 = fma(_1761, _1651, _1807);
    float _1817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1819 = _1781 * _1775;
    float _1821 = _1811 * _1633;
    float _1823 = -_1805;
    float _1825 = fma(_1793, _1815, _1823);
    float _1827 = -_1813;
    float _1829 = fma(_1745, _1651, _1827);
    float _1831 = _1739 + 0.5;
    float _1833 = _1825 + 0.5;
    float _1835 = _1801 * _1775;
    float _1837 = -_1819;
    float _1839 = fma(_1801, _1809, _1837);
    float _1841 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1843 = fma(_1791, _1829, _1691);
    float _1845 = fma(_1781, _1809, _1835);
    float _1847 = fma(_1787, _1839, _1797);
    float _1849 = _1605 + 0.5;
    out.m_65.w = _1841;
    float _1851 = -_1803;
    float _1853 = fma(_1789, _1845, _1851);
    float _1855 = _1613 * _1817;
    float _1857 = _1847 + 0.5;
    float _1859 = _1853 + 0.5;
    float _1861 = _1715 + _1392;
    float _1863 = _1713 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1865 = _1843 + 0.5;
    out.m_67.x = _1857;
    out.m_67.y = _1859;
    float _1867 = _1861 * 0.5;
    float _1869 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _1855;
    out.m_69.y = _1821;
    out.m_71.x = _1831;
    out.m_71.y = _1849;
    out.m_71.z = _1865;
    out.m_71.w = _1833;
    float _1871 = -_1863;
    float _1873 = _1871 + 1.0;
    out.gl_Position.x = _1424;
    out.gl_Position.y = _1426;
    out.gl_Position.z = _1715;
    out.gl_Position.w = _1392;
    out.m_73.z = _1867;
    out.m_73.w = _1392;
    out.m_49.x = _1869;
    float _1875 = _1863 * _1448;
    float _1877 = _1463 * _1875;
    float _1879 = _1473 * _1875;
    float _1881 = fma(_1469, _1877, _1457);
    float _1883 = fma(_1471, _1877, _1459);
    float _1885 = _1463 * _1873;
    float _1887 = fma(_1463, _1879, _1461);
    out.m_75.x = _1881;
    out.m_75.y = _1883;
    out.m_75.z = _1887;
    out.m_75.w = _1885;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _110 = 0;
    if (!_104)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1952 = as_type<float>(_114);
        out.gl_Position.z = _1952;
    }
    if (!_104)
    {
        return out;
    }
    bool _118 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_91);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = float(_96);
    bool _130 = _100 >= _128;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_49.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _116 = as_type<int>(_140);
    }
    int _142 = _116;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2008 = as_type<float>(_142);
        out.gl_Position.z = _2008;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_51.x;
    float _146 = in.m_51.y;
    float _148 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _152 = _150 != 0;
    float _154 = in.m_53.x;
    float _156 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c10)._m0[8].y, _148);
    float _158 = in.m_53.w;
    float _160 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c10)._m0[10].y, _156);
    float _162 = in.m_53.y;
    float _164 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _166 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _164;
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = rsqrt(_160);
    bool _176 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _178 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _180 = _176 || _178;
    bool _182 = isnan(1.0);
    bool _184 = _180 || _182;
    float _186 = in.m_57.x;
    float _188 = in.m_57.y;
    float _190 = in.m_57.z;
    float _192 = _144 * _144;
    float _194 = _146 * 12.98980045318603515625;
    float _196 = abs(_144);
    float _198 = log2(_196);
    float _200 = _146 * 78.233001708984375;
    float _202 = in.m_53.z;
    float _204 = fma(_154, 78.233001708984375, _194);
    float _206 = fma(_192, -0.980000019073486328125, 1.0);
    float _208 = in.m_51.z;
    float _210 = fma(_158, 12.98980045318603515625, _200);
    float _212 = _204 * 0.15915493667125701904296875;
    float _214 = in.m_57.w;
    float _216 = fma(_162, 78.233001708984375, _194);
    float _218 = _210 * 0.15915493667125701904296875;
    float _220 = _212 * 6.283185482025146484375;
    float _222 = sin(_220);
    float _224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _168);
    float _226 = _198 * 0.800000011920928955078125;
    float _228 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _170);
    float _230 = _216 * 0.15915493667125701904296875;
    float _232 = _186 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _234 = _218 * 6.283185482025146484375;
    float _236 = sin(_234);
    float _238 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _240 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _238;
    float _242 = _188 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _244 = _190 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _246 = _232 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _248 = _240 * _240;
    float _250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _172);
    float _252 = _230 * 6.283185482025146484375;
    float _254 = sin(_252);
    float _256 = _242 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _258 = _244 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _260 = fma(_166, _166, _248);
    float _262 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _264 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _262;
    float _266 = _256 * _228;
    float _268 = _246 * _224;
    float _270 = fma(_264, _264, _260);
    float _272 = _258 * _250;
    float _274 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _276 = in.m_44.x;
    float _278 = in.m_44.y;
    float _280 = in.m_44.z;
    float _282 = _266 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _284 = exp2(_226);
    float _286 = _236 * 43758.546875;
    float _288 = in.m_42.x;
    float _290 = in.m_42.y;
    float _292 = in.m_42.z;
    float _294 = _222 * 43758.546875;
    float _296 = _254 * 43758.546875;
    float _298 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].z, _274);
    float _300 = _266 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _302 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[24].x, _282);
    float _304 = _266 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _306 = _202 * 78.233001708984375;
    float _308 = sqrt(_270);
    float _310 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[25].x, _300);
    float _312 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[26].x, _304);
    float _314 = fma(_208, 12.98980045318603515625, _306);
    float _316 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _318 = fma(_272, (*spvDescriptorSet0.vp_c8)._m0[24].z, _302);
    float _320 = fma(_272, (*spvDescriptorSet0.vp_c8)._m0[25].z, _310);
    float _322 = floor(_286);
    float _324 = fma(_272, (*spvDescriptorSet0.vp_c8)._m0[26].z, _312);
    float _326 = _272;
    float _328 = (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _330 = _316;
    float _332 = _154;
    if (!_184)
    {
        float _334 = _316 * _316;
        float _336 = _334 * 0.5;
        _326 = _336;
    }
    float _338 = _326;
    float _340 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _298);
    float _342 = fma(_284, 820.0, _100);
    float _344 = _284;
    if (!_152)
    {
        _328 = _202;
    }
    float _346 = _328;
    float _348 = _314 * 0.15915493667125701904296875;
    float _350 = _346;
    if (!_184)
    {
        float _352 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _344 = _352;
    }
    float _354 = _344;
    float _356 = floor(_294);
    float _358 = floor(_296);
    bool _360 = !_184;
    float _362 = _354;
    if (!_360)
    {
        float _364 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _366 = log2(_364);
        float _368 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _370 = _368 + 1.0;
        float _372 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _374 = _316 * _366;
        float _376 = 1.0 / _370;
        float _378 = _372 * 0.693147182464599609375;
        float _380 = exp2(_374);
        float _382 = 1.0 / _378;
        float _384 = _380 + (-1.0);
        float _386 = -_384;
        float _388 = fma(_386, _382, _316);
        float _390 = _388 * _376;
        float _392 = _390 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _362 = _392;
    }
    float _394 = _362;
    bool _396 = !_184;
    if (!_396)
    {
        float _398 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _400 = log2(_398);
        float _402 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _404 = _402 + 1.0;
        float _406 = 1.0 / _404;
        float _408 = _316 * _400;
        float _410 = exp2(_408);
        float _412 = -_410;
        float _414 = _412 + 1.0;
        float _416 = _414 * _406;
        _330 = _416;
    }
    float _418 = _330;
    float _420 = _348 * 6.283185482025146484375;
    float _422 = sin(_420);
    float _424 = precise::max(_308, 250.0);
    float _426 = _342 * 0.0050000003539025783538818359375;
    float _428 = -_358;
    float _430 = _296 + _428;
    float _432 = -_356;
    float _434 = _294 + _432;
    float _436 = _394 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _438 = precise::min(_424, 400.0);
    float _440 = _426 * 0.15915493667125701904296875;
    float _442 = -_322;
    float _444 = _286 + _442;
    float _446 = _394 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _448 = _394 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _450 = fma(_438, 0.0033333334140479564666748046875, -0.33333337306976318359375);
    float _452 = fma(_418, _278, _436);
    float _454 = fma(_418, _276, _446);
    float _456 = _440 * 6.283185482025146484375;
    float _458 = cos(_456);
    float _460 = fma(_418, _280, _448);
    float _462 = _422 * 43758.546875;
    float _464 = _444 * 6.283185482025146484375;
    float _466 = _100 + 800.0;
    float _468 = _434 * 6.283185482025146484375;
    float _470 = fma(_454, _214, _288);
    float _472 = fma(_100, 0.1500000059604644775390625, _464);
    float _474 = _440 * 6.283185482025146484375;
    float _476 = sin(_474);
    float _478 = fma(_452, _214, _290);
    float _480 = fma(_460, _214, _292);
    float _482 = _174 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _484 = fma(_466, 0.00120000005699694156646728515625, _468);
    float _486 = _174 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _488 = _472 * 0.15915493667125701904296875;
    float _490 = _174 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _492 = floor(_462);
    float _494 = -_458;
    float _496 = _494 + 1.0;
    float _498 = _430 * 6.283185482025146484375;
    float _500 = fma(_342, 0.00120000005699694156646728515625, _468);
    float _502 = _484 * 0.15915493667125701904296875;
    float _504 = _482 * _496;
    float _506 = _486 * _486;
    float _508 = fma(_342, 0.00999999977648258209228515625, _498);
    float _510 = _482 * _476;
    float _512 = _490 * _476;
    float _514 = _488 * 6.283185482025146484375;
    float _516 = sin(_514);
    float _518 = _486 * _476;
    float _520 = fma(_482, _504, _458);
    float _522 = _500 * 0.15915493667125701904296875;
    float _524 = _490 * _496;
    float _526 = fma(_496, _506, _458);
    float _528 = -_492;
    float _530 = _462 + _528;
    float _532 = _508 * 0.15915493667125701904296875;
    float _534 = _502 * 6.283185482025146484375;
    float _536 = sin(_534);
    float _538 = fma(_490, _504, _518);
    float _540 = _530 * 6.283185482025146484375;
    float _542 = -_518;
    float _544 = fma(_490, _504, _542);
    float _546 = -_512;
    float _548 = fma(_486, _504, _546);
    float _550 = fma(_342, 0.02700000070035457611083984375, _498);
    float _552 = fma(_486, _504, _512);
    float _554 = fma(_490, _524, _458);
    float _556 = _320 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _558 = _522 * 6.283185482025146484375;
    float _560 = sin(_558);
    float _562 = fma(_486, _524, _510);
    float _564 = -_510;
    float _566 = fma(_486, _524, _564);
    float _568 = fma(_342, -0.02300000004470348358154296875, _540);
    float _570 = fma(_466, 0.02700000070035457611083984375, _498);
    float _572 = _550 * 0.15915493667125701904296875;
    float _574 = _478 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _576 = _478 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _578 = _532 * 6.283185482025146484375;
    float _580 = sin(_578);
    float _582 = _318 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _584 = _556 * _544;
    float _586 = _568 * 0.15915493667125701904296875;
    float _588 = _570 * 0.15915493667125701904296875;
    float _590 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[4].x, _574);
    float _592 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[5].x, _576);
    float _594 = _572 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = _478 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _600 = _556 * _562;
    float _602 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[4].z, _590);
    float _604 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[5].z, _592);
    float _606 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[6].x, _598);
    float _608 = fma(_582, _520, _584);
    float _610 = _556 * _554;
    float _612 = _586 * 6.283185482025146484375;
    float _614 = sin(_612);
    float _616 = fma(_466, 0.00999999977648258209228515625, _498);
    float _618 = fma(_516, 0.119999997317790985107421875, 1.0);
    float _620 = _536 * 0.1500000059604644775390625;
    float _622 = fma(_582, _538, _610);
    float _624 = _324 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _626 = _560 * 0.1500000059604644775390625;
    float _628 = fma(_466, 0.00200000009499490261077880859375, _620);
    float _630 = fma(_582, _548, _600);
    float _632 = fma(_624, _552, _608);
    float _634 = _588 * 6.283185482025146484375;
    float _636 = sin(_634);
    float _638 = fma(_146, 6.283185482025146484375, _628);
    float _640 = _616 * 0.15915493667125701904296875;
    float _642 = fma(_624, _566, _622);
    float _644 = fma(_342, 0.00200000009499490261077880859375, _626);
    float _646 = _638 * (-0.15915493667125701904296875);
    float _648 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[6].z, _606);
    float _650 = rsqrt(_340);
    float _652 = fma(_146, 6.283185482025146484375, _644);
    float _654 = _596 * 5.30000019073486328125;
    float _656 = fma(_614, 0.1500000059604644775390625, 1.0);
    float _658 = fma(_624, _526, _630);
    float _660 = _648 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _662 = fma(_580, 13.69999980926513671875, _654);
    float _664 = _206 * _656;
    float _666 = _640 * 6.283185482025146484375;
    float _668 = sin(_666);
    float _670 = _602 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _672 = _604 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _674 = _620 * 300.0;
    float _676 = _636 * 5.30000019073486328125;
    float _678 = fma(_582, _618, _670);
    float _680 = fma(_556, _618, _672);
    float _682 = _664 * _450;
    float _684 = _646 * 6.283185482025146484375;
    float _686 = cos(_684);
    float _688 = fma(_624, _618, _660);
    float _690 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[8].z, _678);
    float _692 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[9].z, _680);
    float _694 = fma(_632, _682, _670);
    float _696 = fma(_642, _682, _672);
    float _698 = fma(_658, _682, _660);
    float _700 = _652 * 0.15915493667125701904296875;
    float _702 = _646 * 6.283185482025146484375;
    float _704 = sin(_702);
    float _706 = fma(_668, 13.69999980926513671875, _676);
    float _708 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[10].z, _688);
    float _710 = _650 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _712 = _650 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _714 = _650 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _716 = _626 * 300.0;
    float _718 = -_670;
    float _720 = _718 + _690;
    float _722 = -_686;
    float _724 = _722 + 1.0;
    float _726 = _710 * _710;
    float _728 = _700 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[8].z, _694);
    float _734 = _712 * _724;
    float _736 = fma(_726, _724, _686);
    float _738 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[9].z, _696);
    float _740 = _638 * 0.15915493667125701904296875;
    float _742 = _712 * _704;
    float _744 = _710 * _704;
    float _746 = _714 * _704;
    float _748 = _714 * _724;
    float _750 = fma(_712, _734, _686);
    float _752 = fma(_714, _734, _744);
    float _754 = -_744;
    float _756 = fma(_714, _734, _754);
    float _758 = fma(_714, _748, _686);
    float _760 = fma(_710, _748, _742);
    float _762 = _700 * 6.283185482025146484375;
    float _764 = cos(_762);
    float _766 = -_742;
    float _768 = fma(_710, _748, _766);
    float _770 = -_672;
    float _772 = _770 + _692;
    float _774 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[10].z, _698);
    float _776 = -_746;
    float _778 = fma(_710, _734, _776);
    float _780 = _662 + 280.0;
    float _782 = _758 * _772;
    float _784 = _756 * _772;
    float _786 = _760 * _772;
    float _788 = fma(_710, _734, _746);
    float _790 = fma(_752, _720, _782);
    float _792 = fma(_750, _720, _784);
    float _794 = fma(_778, _720, _786);
    float _796 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[8].x, _732);
    float _798 = -_660;
    float _800 = _798 + _708;
    float _802 = _740 * 6.283185482025146484375;
    float _804 = cos(_802);
    float _806 = -_764;
    float _808 = _806 + 1.0;
    float _810 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[9].x, _738);
    float _812 = _710 * _730;
    float _814 = fma(_768, _800, _790);
    float _816 = _712 * _808;
    float _818 = _712 * _730;
    float _820 = _714 * _808;
    float _822 = _740 * 6.283185482025146484375;
    float _824 = sin(_822);
    float _826 = -_812;
    float _828 = fma(_714, _816, _826);
    float _830 = -_672;
    float _832 = _830 + _810;
    float _834 = -_670;
    float _836 = _834 + _796;
    float _838 = _714 * _730;
    float _840 = fma(_710, _820, _818);
    float _842 = fma(_712, _816, _764);
    float _844 = _828 * _832;
    float _846 = -_838;
    float _848 = fma(_710, _816, _846);
    float _850 = _840 * _832;
    float _852 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[10].x, _774);
    float _854 = fma(_842, _836, _844);
    float _856 = -_804;
    float _858 = _856 + 1.0;
    float _860 = fma(_788, _800, _792);
    float _862 = in.m_51.w;
    float _864 = _706 + 280.0;
    float _866 = _672 + _814;
    float _868 = fma(_848, _836, _850);
    float _870 = _712 * _824;
    float _872 = _714 * _824;
    float _874 = _710 * _824;
    float _876 = fma(_808, _726, _764);
    float _878 = fma(_726, _858, _804);
    float _880 = fma(_736, _800, _794);
    float _882 = _714 * _858;
    float _884 = _670 + _860;
    float _886 = fma(_864, (*spvDescriptorSet0.vp_c10)._m0[9].x, _866);
    float _888 = _712 * _858;
    float _890 = fma(_710, _882, _870);
    float _892 = fma(_864, (*spvDescriptorSet0.vp_c10)._m0[8].x, _884);
    float _894 = -_672;
    float _896 = _894 + _886;
    float _898 = _660 + _880;
    float _900 = -_874;
    float _902 = fma(_714, _888, _900);
    float _904 = -_872;
    float _906 = fma(_710, _888, _904);
    float _908 = -_670;
    float _910 = _908 + _892;
    float _912 = _890 * _896;
    float _914 = fma(_864, (*spvDescriptorSet0.vp_c10)._m0[10].x, _898);
    float _916 = fma(_712, _888, _804);
    float _918 = _902 * _896;
    float _920 = fma(_906, _910, _912);
    float _922 = -_660;
    float _924 = _922 + _914;
    float _926 = -_660;
    float _928 = _926 + _852;
    float _930 = fma(_916, _910, _918);
    float _932 = fma(_710, _888, _872);
    float _934 = fma(_878, _924, _920);
    float _936 = fma(_876, _928, _868);
    float _938 = fma(_710, _816, _838);
    float _940 = fma(_932, _924, _930);
    float _942 = -_862;
    float _944 = _942 + 1.0;
    float _946 = _660 + _934;
    float _948 = fma(_938, _928, _854);
    float _950 = _660 + _936;
    float _952 = _670 + _940;
    float _954 = _946 * _944;
    float _956 = _670 + _948;
    float _958 = fma(_714, _816, _812);
    float _960 = _952 * _944;
    float _962 = fma(_950, _862, _954);
    float _964 = in.m_59.x;
    float _966 = fma(_714, _882, _804);
    float _968 = fma(_956, _862, _960);
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _972 = _962 + _970;
    float _974 = fma(_714, _820, _764);
    float _976 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _978 = _968 + _976;
    float _980 = _972 * _972;
    float _982 = fma(_714, _888, _874);
    float _984 = _966 * _896;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _988 = _986 != 0;
    float _990 = fma(_978, _978, _980);
    float _992 = _974 * _832;
    float _994 = -_870;
    float _996 = fma(_710, _882, _994);
    float _998 = fma(_982, _910, _984);
    float _1000 = sqrt(_990);
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1004 = _1002 != 0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1008 = _1006 != 0;
    float _1010 = -_818;
    float _1012 = fma(_710, _820, _1010);
    float _1014 = fma(_958, _836, _992);
    float _1016 = fma(_996, _924, _998);
    bool _1018 = _162 > 0.5;
    float _1020 = fma(_1012, _928, _1014);
    float _1022 = _672 + _1016;
    float _1024 = _952;
    int _1026 = as_type<int>(_672);
    int _1028 = as_type<int>(_710);
    float _1030 = _1020;
    float _1032 = _882;
    float _1034 = _962;
    float _1036 = _1012;
    float _1038 = _978;
    bool _1040 = _1018;
    float _1042 = _964;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_988)
    {
        _1024 = _964;
    }
    float _1046 = _1024;
    float _1048 = _672 + _1020;
    float _1050 = _1022 * _944;
    float _1052 = _1048;
    float _1054 = _1046;
    if (_1004)
    {
        float _1056 = -_964;
        float _1058 = _1056 + 1.0;
        _1026 = as_type<int>(_1058);
    }
    int _1060 = _1026;
    float _1062 = as_type<float>(_1060);
    if (_1008)
    {
        float _1064 = -_964;
        float _1066 = _1064 + 1.0;
        _1028 = as_type<int>(_1066);
    }
    int _1068 = _1028;
    bool _1070 = _1000 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1072 = fma(_1048, _862, _1050);
    if (!_1004)
    {
        _1030 = _964;
    }
    float _1074 = _1030;
    float _1076 = _1074;
    if (!_1008)
    {
        _1032 = _964;
    }
    float _1078 = _1032;
    float _1080 = _1078;
    if (_1004)
    {
        float _1082 = _1018 ? as_type<float>(_1060) : _964;
        _1076 = _1082;
    }
    float _1084 = _1076;
    if (_1008)
    {
        float _1086 = _1018 ? as_type<float>(_1068) : _964;
        _1080 = _1086;
    }
    float _1088 = _1080;
    if (!_1070)
    {
        _1062 = _968;
    }
    float _1090 = _1062;
    float _1092 = _1090;
    if (!_1070)
    {
        _1052 = _1072;
    }
    float _1094 = _1052;
    bool _1096 = !_1070;
    float _1098 = _1094;
    if (!_1096)
    {
        float _1100 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1102 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1104 = _1000 + _1102;
        float _1106 = _1072 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1108 = rsqrt(_990);
        float _1110 = _1104 * _1100;
        float _1112 = _1110 * 0.15915493667125701904296875;
        float _1114 = _1112 * 6.283185482025146484375;
        float _1116 = cos(_1114);
        float _1118 = _1112 * 6.283185482025146484375;
        float _1120 = sin(_1118);
        float _1122 = _1116 + (-1.0);
        float _1124 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1126 = fma(_1120, _1106, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1128 = fma(_1072, _1116, _1124);
        float _1130 = _1108 * _1126;
        float _1132 = fma(_978, _1130, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1134 = fma(_972, _1130, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1098 = _1128;
        _1092 = _1132;
        _1034 = _1134;
    }
    float _1136 = _1098;
    float _1138 = _1092;
    float _1140 = _1034;
    float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1144 = _1136 + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1148 = _1138 + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1152 = _1140 + _1150;
    float _1154 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1156 = _1144 * _1144;
    float _1158 = fma(_1148, _1148, _1156);
    float _1160 = precise::max(0.0, _1154);
    float _1162 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1164 = fma(_1152, _1152, _1158);
    float _1166 = rsqrt(_1164);
    float _1168 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1170 = _1148 * _1168;
    float _1172 = _1152 * _1168;
    float _1174 = -_1168;
    float _1176 = -_1160;
    float _1178 = fma(_1144, _1174, _1176);
    float _1180 = _1170 * _1170;
    float _1182 = _1172 * _1172;
    float _1184 = _1180 + _1182;
    float _1186 = sqrt(_1184);
    bool _1188 = _1186 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1192 = _1186 + _1190;
    float _1194 = _1152;
    float _1196 = _1144;
    float _1198 = _1158;
    float _1200 = _1192;
    float _1202 = _1178;
    if (_1188)
    {
        float _1204 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1194 = _1204;
    }
    float _1206 = _1194;
    if (_1188)
    {
        float _1208 = _1178 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1196 = _1208;
    }
    float _1210 = _1196;
    float _1212 = _1210;
    if (_1188)
    {
        float _1214 = rsqrt(_1184);
        _1198 = _1214;
    }
    float _1216 = _1198;
    float _1218 = _1206;
    float _1220 = _1216;
    if (_1188)
    {
        float _1222 = _1192 * _1206;
        _1200 = _1222;
    }
    float _1224 = _1200;
    if (!_1188)
    {
        _1218 = _1170;
    }
    float _1226 = _1218;
    float _1228 = _1226;
    if (_1188)
    {
        float _1230 = _1224 * 0.15915493667125701904296875;
        _1036 = _1230;
    }
    float _1232 = _1036;
    float _1234 = _1224;
    if (_1188)
    {
        float _1236 = _1232 * 6.283185482025146484375;
        float _1238 = sin(_1236);
        _1234 = _1238;
    }
    float _1240 = _1234;
    float _1242 = _1166;
    if (_1188)
    {
        float _1244 = _1232 * 6.283185482025146484375;
        float _1246 = cos(_1244);
        _1242 = _1246;
    }
    float _1248 = _1242;
    float _1250 = _1240;
    if (_1188)
    {
        float _1252 = fma(_1240, _1210, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1212 = _1252;
    }
    float _1254 = _1212;
    float _1256 = sqrt(_1164);
    float _1258 = _1254;
    if (_1188)
    {
        float _1260 = _1216 * _1254;
        _1038 = _1260;
    }
    float _1262 = _1038;
    if (!_1188)
    {
        _1258 = _1180;
    }
    float _1264 = _1258;
    float _1266 = _1264;
    float _1268 = _1248;
    if (_1188)
    {
        float _1270 = _1248 + (-1.0);
        _1250 = _1270;
    }
    float _1272 = _1250;
    float _1274 = _1272;
    if (_1188)
    {
        float _1276 = _1170 * _1262;
        _1228 = _1276;
    }
    float _1278 = _1228;
    if (_1188)
    {
        float _1280 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1220 = _1280;
    }
    float _1282 = _1220;
    if (!_1188)
    {
        _1274 = _1172;
    }
    float _1284 = _1274;
    float _1286 = _1284;
    if (_1188)
    {
        float _1288 = _1172 * _1262;
        _1286 = _1288;
    }
    float _1290 = _1286;
    if (_1188)
    {
        float _1292 = _1278 * _1278;
        _1266 = _1292;
    }
    float _1294 = _1266;
    if (_1188)
    {
        float _1296 = fma(_1178, _1248, _1282);
        _1202 = _1296;
    }
    float _1298 = _1202;
    if (!_1188)
    {
        _1268 = _1182;
    }
    float _1300 = _1268;
    float _1302 = _1300;
    if (_1188)
    {
        float _1304 = _1290 * _1290;
        _1302 = _1304;
    }
    float _1306 = _1302;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1310 = fma(_1256, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1308);
    float _1312 = precise::clamp(_1310, 0.0, 1.0);
    float _1314 = fma(_1298, _1298, _1294);
    float _1316 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1318 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1320 = -_1312;
    float _1322 = _1320 + 1.0;
    float _1324 = _1314 + _1306;
    float _1326 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1328 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1316);
    float _1330 = abs(_1322);
    float _1332 = log2(_1330);
    float _1334 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1318);
    float _1336 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1326);
    float _1338 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1328);
    float _1340 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1336);
    float _1342 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1344 = rsqrt(_1324);
    float _1346 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1350 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1342);
    float _1352 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1354 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1350);
    float _1356 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1358 = -_1352;
    float _1360 = fma(_1358, _1162, 1.0);
    float _1362 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1364 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1366 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1334);
    float _1368 = exp2(_1356);
    float _1370 = _1344 * _1278;
    float _1372 = _1344 * _1298;
    float _1374 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1364);
    float _1376 = _1344 * _1290;
    float _1378 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1380 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1382 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1374);
    float _1384 = log2(_1360);
    float _1386 = -_1378;
    float _1388 = fma(_1372, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1386);
    float _1390 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1392 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1382);
    float _1394 = -_1376;
    float _1396 = fma(_1394, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1388);
    float _1398 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1400 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1390);
    float _1402 = 1.0 / _1392;
    float _1404 = fma(_1396, -0.5, 0.5);
    float _1406 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1398);
    float _1408 = fma(_1396, 0.5, 0.5);
    float _1410 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1400);
    float _1412 = _1372 + 1.0;
    float _1414 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1406);
    float _1416 = fma(_1408, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1418 = sqrt(_1404);
    float _1420 = -_1372;
    float _1422 = fma(_1368, _1412, _1420);
    float _1424 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1414);
    float _1426 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1410);
    float _1428 = fma(_1408, _1416, -0.212114393711090087890625);
    float _1430 = _1384 * 0.693147182464599609375;
    float _1432 = fma(_1422, 0.5, 0.5);
    float _1434 = _1424 * _1402;
    float _1436 = _1426 * _1402;
    float _1438 = fma(_1408, _1428, 1.570728778839111328125);
    float _1440 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1442 = fma(_1434, 0.5, 0.5);
    float _1444 = fma(_1436, -0.5, 0.5);
    float _1446 = _1418 * 0.636619746685028076171875;
    float3 _4073 = float3(_1442, _1444, _1440);
    float _1448 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4073, float3(0.0), isnan(_4073)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4073, float3(0.0), isnan(_4073)), level(0.0)).x;
    float _1450 = -_1438;
    float _1452 = fma(_1446, _1450, 1.0);
    float3 _4089 = float3(_1442, _1444, _1440);
    float4 _1455 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4089, float3(0.0), isnan(_4089)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4089, float3(0.0), isnan(_4089)), level(0.0)).xyzw;
    float _1457 = _1455.x;
    float _1459 = _1455.y;
    float _1461 = _1455.z;
    float _1463 = _1455.w;
    float2 _4106 = float2(_1452, _1432);
    float3 _1467 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4106, float2(0.0), isnan(_4106)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4106, float2(0.0), isnan(_4106)), level(0.0)).xyz;
    float _1469 = _1467.x;
    float _1471 = _1467.y;
    float _1473 = _1467.z;
    float _1475 = in.m_59.y;
    float _1477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1479 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1481 = _158 > 0.5;
    out.m_61.x = _144;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1487 = _1485 != 0;
    float _1489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1491 = _154 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1493 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1479);
    int _1495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1497 = _1495 != 0;
    float _1499 = -_1483;
    float _1501 = fma(_1491, 2.0, _1499);
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1505 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1511 = _1509 != 0;
    float _1513 = fma(_1505, -2.0, _1503);
    float _1515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1519 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1507);
    float _1521 = -_1475;
    float _1523 = _1521 + 1.0;
    float _1525 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_61.w = _862;
    int _1527 = _1481 ? as_type<int>(_1523) : as_type<int>(_1475);
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1533 = _1531 != 0;
    int _1535 = 0;
    bool _1537 = _1497;
    int _1539 = as_type<int>(_1519);
    float _1541 = _1513;
    if (_1511)
    {
        float _1543 = -_964;
        float _1545 = _1543 + 1.0;
        _1535 = as_type<int>(_1545);
    }
    int _1547 = _1535;
    float _1549 = _1487 ? as_type<float>(_1527) : _1475;
    float _1551 = _1477 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1553 = _1018 ? as_type<int>(_1523) : as_type<int>(_1475);
    float _1555 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1529);
    if (_1511)
    {
        bool _1557 = _202 > 0.5;
        _1040 = _1557;
    }
    bool _1559 = _1040;
    float _1561 = fma(_1551, _1549, -0.5);
    float _1563 = _1497 ? as_type<float>(_1553) : _1475;
    float _1565 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1569 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1513);
    float _1571 = _1563;
    if (_988)
    {
        bool _1573 = _154 > 0.5;
        _1537 = _1573;
    }
    bool _1575 = _1537;
    float _1577 = fma(_1565, _1563, -0.5);
    if (!_152)
    {
        _1571 = _162;
    }
    float _1579 = _1571;
    float _1581 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1517);
    float _1583 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1519);
    float _1585 = _1579;
    if (_988)
    {
        float _1587 = -_964;
        float _1589 = _1587 + 1.0;
        _1539 = as_type<int>(_1589);
    }
    int _1591 = _1539;
    float _1593 = as_type<float>(_1591);
    if (!_152)
    {
        _1541 = _1579;
    }
    float _1595 = _1541;
    float _1597 = _1515 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1599 = _1595;
    if (_152)
    {
        _1585 = _162;
    }
    float _1601 = _1585;
    float _1603 = -_1569;
    float _1605 = fma(_1583, _1577, _1603);
    float _1607 = exp2(_1525);
    if (_988)
    {
        float _1609 = _1575 ? as_type<float>(_1591) : _964;
        _1054 = _1609;
    }
    float _1611 = _1054;
    float _1613 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    if (!_152)
    {
        _1593 = _1595;
    }
    float _1615 = _1593;
    float _1617 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1619 = _1615;
    if (_152)
    {
        _1599 = _154;
    }
    float _1621 = _1599;
    float _1623 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1625 = _1567;
    float _1627 = _1621;
    if (_1511)
    {
        float _1629 = _1559 ? as_type<float>(_1547) : _964;
        _1042 = _1629;
    }
    float _1631 = _1042;
    float _1633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    if (!_152)
    {
        _1625 = _346;
    }
    float _1635 = _1625;
    float _1637 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1493);
    float _1639 = _1635;
    if (_152)
    {
        _350 = _202;
    }
    float _1641 = _350;
    out.m_63.x = _1138;
    out.m_63.y = _1136;
    out.m_63.z = _1140;
    bool _1643 = _202 > 0.5;
    float _1645 = fma(_1621, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1617);
    float _1647 = fma(_1623, _1611, -0.5);
    if (_152)
    {
        _1619 = _154;
    }
    float _1649 = _1619;
    float _1651 = fma(_1597, _1631, -0.5);
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1657 = _1655 != 0;
    float _1659 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_152)
    {
        _1044 = _154;
    }
    float _1661 = _1044;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1665 = _1661;
    float _1667 = _1663;
    if (_152)
    {
        _1665 = _1641;
    }
    float _1669 = _1665;
    float _1671 = -_1653;
    float _1673 = fma(_1659, 2.0, _1671);
    int _1675 = _1643 ? as_type<int>(_1523) : as_type<int>(_1475);
    float _1677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1679 = _1669;
    if (_152)
    {
        _1627 = _1601;
    }
    float _1681 = _1627;
    float _1683 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1663);
    float _1685 = _1681;
    if (!_152)
    {
        _1679 = _1635;
    }
    float _1687 = _1679;
    float _1689 = -_100;
    float _1691 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1673);
    float _1693 = _1687;
    if (_152)
    {
        _1667 = _1641;
    }
    float _1695 = _1667;
    float _1697 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1683);
    float _1699 = _1695;
    if (_152)
    {
        _1639 = _1601;
    }
    float _1701 = _1639;
    float _1703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_152)
    {
        _1693 = _1601;
    }
    float _1705 = _1693;
    float _1707 = _1697 * (-0.15915493667125701904296875);
    if (!_152)
    {
        _1699 = _1601;
    }
    float _1709 = _1699;
    float _1711 = -_1607;
    float _1713 = _1711 + 1.0;
    float _1715 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1637);
    float _1717 = _1533 ? as_type<float>(_1675) : _1475;
    float _1719 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1723 = _1657 ? as_type<float>(_1675) : _1475;
    float _1725 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1727 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1555);
    float _1729 = -_100;
    float _1731 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1501);
    float _1733 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1735 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1721);
    if (!_152)
    {
        _1685 = _154;
    }
    float _1737 = _1685;
    float _1739 = fma(_1727, _1647, _1731);
    float _1741 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1733);
    float _1743 = _1707 * 6.283185482025146484375;
    float _1745 = cos(_1743);
    if (!_152)
    {
        _332 = _1641;
    }
    float _1747 = _332;
    float _1749 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1725);
    float _1751 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1735);
    float _1753 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1755 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1757 = _1751 * (-0.15915493667125701904296875);
    float _1759 = _1707 * 6.283185482025146484375;
    float _1761 = sin(_1759);
    float _1763 = _1747 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1767 = _1737 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1769 = _1705 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1771 = -_1753;
    float _1773 = fma(_1763, 2.0, _1771);
    float _1775 = fma(_1719, _1717, -0.5);
    float _1777 = fma(_1767, -2.0, _1755);
    float _1779 = _1757 * 6.283185482025146484375;
    float _1781 = sin(_1779);
    float _1783 = fma(_1769, -2.0, _1765);
    float _1785 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1787 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1741);
    float _1789 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1581);
    float _1791 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1645);
    float _1793 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1749);
    float _1795 = -_100;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1773);
    float _1799 = _1757 * 6.283185482025146484375;
    float _1801 = cos(_1799);
    float _1803 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1777);
    float _1805 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1783);
    float _1807 = _1745 * _1561;
    float _1809 = fma(_1785, _1084, -0.5);
    float _1811 = _1723 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1813 = _1761 * _1561;
    float _1815 = fma(_1761, _1651, _1807);
    float _1817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1819 = _1781 * _1775;
    float _1821 = _1811 * _1633;
    float _1823 = -_1805;
    float _1825 = fma(_1793, _1815, _1823);
    float _1827 = -_1813;
    float _1829 = fma(_1745, _1651, _1827);
    float _1831 = _1739 + 0.5;
    float _1833 = _1825 + 0.5;
    float _1835 = _1801 * _1775;
    float _1837 = -_1819;
    float _1839 = fma(_1801, _1809, _1837);
    float _1841 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1843 = fma(_1791, _1829, _1691);
    float _1845 = fma(_1781, _1809, _1835);
    float _1847 = fma(_1787, _1839, _1797);
    float _1849 = _1605 + 0.5;
    out.m_65.w = _1841;
    float _1851 = -_1803;
    float _1853 = fma(_1789, _1845, _1851);
    float _1855 = _1613 * _1817;
    float _1857 = _1847 + 0.5;
    float _1859 = _1853 + 0.5;
    float _1861 = _1715 + _1392;
    float _1863 = _1713 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1865 = _1843 + 0.5;
    out.m_67.x = _1857;
    out.m_67.y = _1859;
    float _1867 = _1861 * 0.5;
    float _1869 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _1855;
    out.m_69.y = _1821;
    out.m_71.x = _1831;
    out.m_71.y = _1849;
    out.m_71.z = _1865;
    out.m_71.w = _1833;
    float _1871 = -_1863;
    float _1873 = _1871 + 1.0;
    out.gl_Position.x = _1424;
    out.gl_Position.y = _1426;
    out.gl_Position.z = _1715;
    out.gl_Position.w = _1392;
    out.m_73.z = _1867;
    out.m_73.w = _1392;
    out.m_49.x = _1869;
    float _1875 = _1863 * _1448;
    float _1877 = _1463 * _1875;
    float _1879 = _1473 * _1875;
    float _1881 = fma(_1469, _1877, _1457);
    float _1883 = fma(_1471, _1877, _1459);
    float _1885 = _1463 * _1873;
    float _1887 = fma(_1463, _1879, _1461);
    out.m_75.x = _1881;
    out.m_75.y = _1883;
    out.m_75.z = _1887;
    out.m_75.w = _1885;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _110 = 0;
    if (!_104)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1952 = as_type<float>(_114);
        out.gl_Position.z = _1952;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _118 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_91);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = float(_96);
    bool _130 = _100 >= _128;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_49.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _116 = as_type<int>(_140);
    }
    int _142 = _116;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2008 = as_type<float>(_142);
        out.gl_Position.z = _2008;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_51.x;
    float _146 = in.m_51.y;
    float _148 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _152 = _150 != 0;
    float _154 = in.m_53.x;
    float _156 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c10)._m0[8].y, _148);
    float _158 = in.m_53.w;
    float _160 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c10)._m0[10].y, _156);
    float _162 = in.m_53.y;
    float _164 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _166 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _164;
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = rsqrt(_160);
    bool _176 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _178 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _180 = _176 || _178;
    bool _182 = isnan(1.0);
    bool _184 = _180 || _182;
    float _186 = in.m_57.x;
    float _188 = in.m_57.y;
    float _190 = in.m_57.z;
    float _192 = _144 * _144;
    float _194 = _146 * 12.98980045318603515625;
    float _196 = abs(_144);
    float _198 = log2(_196);
    float _200 = _146 * 78.233001708984375;
    float _202 = in.m_53.z;
    float _204 = fma(_154, 78.233001708984375, _194);
    float _206 = fma(_192, -0.980000019073486328125, 1.0);
    float _208 = in.m_51.z;
    float _210 = fma(_158, 12.98980045318603515625, _200);
    float _212 = _204 * 0.15915493667125701904296875;
    float _214 = in.m_57.w;
    float _216 = fma(_162, 78.233001708984375, _194);
    float _218 = _210 * 0.15915493667125701904296875;
    float _220 = _212 * 6.283185482025146484375;
    float _222 = sin(_220);
    float _224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _168);
    float _226 = _198 * 0.800000011920928955078125;
    float _228 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _170);
    float _230 = _216 * 0.15915493667125701904296875;
    float _232 = _186 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _234 = _218 * 6.283185482025146484375;
    float _236 = sin(_234);
    float _238 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _240 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _238;
    float _242 = _188 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _244 = _190 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _246 = _232 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _248 = _240 * _240;
    float _250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _172);
    float _252 = _230 * 6.283185482025146484375;
    float _254 = sin(_252);
    float _256 = _242 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _258 = _244 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _260 = fma(_166, _166, _248);
    float _262 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _264 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _262;
    float _266 = _256 * _228;
    float _268 = _246 * _224;
    float _270 = fma(_264, _264, _260);
    float _272 = _258 * _250;
    float _274 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _276 = in.m_44.x;
    float _278 = in.m_44.y;
    float _280 = in.m_44.z;
    float _282 = _266 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _284 = exp2(_226);
    float _286 = _236 * 43758.546875;
    float _288 = in.m_42.x;
    float _290 = in.m_42.y;
    float _292 = in.m_42.z;
    float _294 = _222 * 43758.546875;
    float _296 = _254 * 43758.546875;
    float _298 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].z, _274);
    float _300 = _266 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _302 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[24].x, _282);
    float _304 = _266 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _306 = _202 * 78.233001708984375;
    float _308 = sqrt(_270);
    float _310 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[25].x, _300);
    float _312 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[26].x, _304);
    float _314 = fma(_208, 12.98980045318603515625, _306);
    float _316 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _318 = fma(_272, (*spvDescriptorSet0.vp_c8)._m0[24].z, _302);
    float _320 = fma(_272, (*spvDescriptorSet0.vp_c8)._m0[25].z, _310);
    float _322 = floor(_286);
    float _324 = fma(_272, (*spvDescriptorSet0.vp_c8)._m0[26].z, _312);
    float _326 = _272;
    float _328 = (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _330 = _316;
    float _332 = _154;
    if (!_184)
    {
        float _334 = _316 * _316;
        float _336 = _334 * 0.5;
        _326 = _336;
    }
    float _338 = _326;
    float _340 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _298);
    float _342 = fma(_284, 820.0, _100);
    float _344 = _284;
    if (!_152)
    {
        _328 = _202;
    }
    float _346 = _328;
    float _348 = _314 * 0.15915493667125701904296875;
    float _350 = _346;
    if (!_184)
    {
        float _352 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _344 = _352;
    }
    float _354 = _344;
    float _356 = floor(_294);
    float _358 = floor(_296);
    bool _360 = !_184;
    float _362 = _354;
    if (!_360)
    {
        float _364 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _366 = log2(_364);
        float _368 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _370 = _368 + 1.0;
        float _372 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _374 = _316 * _366;
        float _376 = 1.0 / _370;
        float _378 = _372 * 0.693147182464599609375;
        float _380 = exp2(_374);
        float _382 = 1.0 / _378;
        float _384 = _380 + (-1.0);
        float _386 = -_384;
        float _388 = fma(_386, _382, _316);
        float _390 = _388 * _376;
        float _392 = _390 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _362 = _392;
    }
    float _394 = _362;
    bool _396 = !_184;
    if (!_396)
    {
        float _398 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _400 = log2(_398);
        float _402 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _404 = _402 + 1.0;
        float _406 = 1.0 / _404;
        float _408 = _316 * _400;
        float _410 = exp2(_408);
        float _412 = -_410;
        float _414 = _412 + 1.0;
        float _416 = _414 * _406;
        _330 = _416;
    }
    float _418 = _330;
    float _420 = _348 * 6.283185482025146484375;
    float _422 = sin(_420);
    float _424 = precise::max(_308, 250.0);
    float _426 = _342 * 0.0050000003539025783538818359375;
    float _428 = -_358;
    float _430 = _296 + _428;
    float _432 = -_356;
    float _434 = _294 + _432;
    float _436 = _394 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _438 = precise::min(_424, 400.0);
    float _440 = _426 * 0.15915493667125701904296875;
    float _442 = -_322;
    float _444 = _286 + _442;
    float _446 = _394 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _448 = _394 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _450 = fma(_438, 0.0033333334140479564666748046875, -0.33333337306976318359375);
    float _452 = fma(_418, _278, _436);
    float _454 = fma(_418, _276, _446);
    float _456 = _440 * 6.283185482025146484375;
    float _458 = cos(_456);
    float _460 = fma(_418, _280, _448);
    float _462 = _422 * 43758.546875;
    float _464 = _444 * 6.283185482025146484375;
    float _466 = _100 + 800.0;
    float _468 = _434 * 6.283185482025146484375;
    float _470 = fma(_454, _214, _288);
    float _472 = fma(_100, 0.1500000059604644775390625, _464);
    float _474 = _440 * 6.283185482025146484375;
    float _476 = sin(_474);
    float _478 = fma(_452, _214, _290);
    float _480 = fma(_460, _214, _292);
    float _482 = _174 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _484 = fma(_466, 0.00120000005699694156646728515625, _468);
    float _486 = _174 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _488 = _472 * 0.15915493667125701904296875;
    float _490 = _174 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _492 = floor(_462);
    float _494 = -_458;
    float _496 = _494 + 1.0;
    float _498 = _430 * 6.283185482025146484375;
    float _500 = fma(_342, 0.00120000005699694156646728515625, _468);
    float _502 = _484 * 0.15915493667125701904296875;
    float _504 = _482 * _496;
    float _506 = _486 * _486;
    float _508 = fma(_342, 0.00999999977648258209228515625, _498);
    float _510 = _482 * _476;
    float _512 = _490 * _476;
    float _514 = _488 * 6.283185482025146484375;
    float _516 = sin(_514);
    float _518 = _486 * _476;
    float _520 = fma(_482, _504, _458);
    float _522 = _500 * 0.15915493667125701904296875;
    float _524 = _490 * _496;
    float _526 = fma(_496, _506, _458);
    float _528 = -_492;
    float _530 = _462 + _528;
    float _532 = _508 * 0.15915493667125701904296875;
    float _534 = _502 * 6.283185482025146484375;
    float _536 = sin(_534);
    float _538 = fma(_490, _504, _518);
    float _540 = _530 * 6.283185482025146484375;
    float _542 = -_518;
    float _544 = fma(_490, _504, _542);
    float _546 = -_512;
    float _548 = fma(_486, _504, _546);
    float _550 = fma(_342, 0.02700000070035457611083984375, _498);
    float _552 = fma(_486, _504, _512);
    float _554 = fma(_490, _524, _458);
    float _556 = _320 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _558 = _522 * 6.283185482025146484375;
    float _560 = sin(_558);
    float _562 = fma(_486, _524, _510);
    float _564 = -_510;
    float _566 = fma(_486, _524, _564);
    float _568 = fma(_342, -0.02300000004470348358154296875, _540);
    float _570 = fma(_466, 0.02700000070035457611083984375, _498);
    float _572 = _550 * 0.15915493667125701904296875;
    float _574 = _478 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _576 = _478 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _578 = _532 * 6.283185482025146484375;
    float _580 = sin(_578);
    float _582 = _318 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _584 = _556 * _544;
    float _586 = _568 * 0.15915493667125701904296875;
    float _588 = _570 * 0.15915493667125701904296875;
    float _590 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[4].x, _574);
    float _592 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[5].x, _576);
    float _594 = _572 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = _478 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _600 = _556 * _562;
    float _602 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[4].z, _590);
    float _604 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[5].z, _592);
    float _606 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[6].x, _598);
    float _608 = fma(_582, _520, _584);
    float _610 = _556 * _554;
    float _612 = _586 * 6.283185482025146484375;
    float _614 = sin(_612);
    float _616 = fma(_466, 0.00999999977648258209228515625, _498);
    float _618 = fma(_516, 0.119999997317790985107421875, 1.0);
    float _620 = _536 * 0.1500000059604644775390625;
    float _622 = fma(_582, _538, _610);
    float _624 = _324 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _626 = _560 * 0.1500000059604644775390625;
    float _628 = fma(_466, 0.00200000009499490261077880859375, _620);
    float _630 = fma(_582, _548, _600);
    float _632 = fma(_624, _552, _608);
    float _634 = _588 * 6.283185482025146484375;
    float _636 = sin(_634);
    float _638 = fma(_146, 6.283185482025146484375, _628);
    float _640 = _616 * 0.15915493667125701904296875;
    float _642 = fma(_624, _566, _622);
    float _644 = fma(_342, 0.00200000009499490261077880859375, _626);
    float _646 = _638 * (-0.15915493667125701904296875);
    float _648 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[6].z, _606);
    float _650 = rsqrt(_340);
    float _652 = fma(_146, 6.283185482025146484375, _644);
    float _654 = _596 * 5.30000019073486328125;
    float _656 = fma(_614, 0.1500000059604644775390625, 1.0);
    float _658 = fma(_624, _526, _630);
    float _660 = _648 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _662 = fma(_580, 13.69999980926513671875, _654);
    float _664 = _206 * _656;
    float _666 = _640 * 6.283185482025146484375;
    float _668 = sin(_666);
    float _670 = _602 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _672 = _604 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _674 = _620 * 300.0;
    float _676 = _636 * 5.30000019073486328125;
    float _678 = fma(_582, _618, _670);
    float _680 = fma(_556, _618, _672);
    float _682 = _664 * _450;
    float _684 = _646 * 6.283185482025146484375;
    float _686 = cos(_684);
    float _688 = fma(_624, _618, _660);
    float _690 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[8].z, _678);
    float _692 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[9].z, _680);
    float _694 = fma(_632, _682, _670);
    float _696 = fma(_642, _682, _672);
    float _698 = fma(_658, _682, _660);
    float _700 = _652 * 0.15915493667125701904296875;
    float _702 = _646 * 6.283185482025146484375;
    float _704 = sin(_702);
    float _706 = fma(_668, 13.69999980926513671875, _676);
    float _708 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[10].z, _688);
    float _710 = _650 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _712 = _650 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _714 = _650 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _716 = _626 * 300.0;
    float _718 = -_670;
    float _720 = _718 + _690;
    float _722 = -_686;
    float _724 = _722 + 1.0;
    float _726 = _710 * _710;
    float _728 = _700 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[8].z, _694);
    float _734 = _712 * _724;
    float _736 = fma(_726, _724, _686);
    float _738 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[9].z, _696);
    float _740 = _638 * 0.15915493667125701904296875;
    float _742 = _712 * _704;
    float _744 = _710 * _704;
    float _746 = _714 * _704;
    float _748 = _714 * _724;
    float _750 = fma(_712, _734, _686);
    float _752 = fma(_714, _734, _744);
    float _754 = -_744;
    float _756 = fma(_714, _734, _754);
    float _758 = fma(_714, _748, _686);
    float _760 = fma(_710, _748, _742);
    float _762 = _700 * 6.283185482025146484375;
    float _764 = cos(_762);
    float _766 = -_742;
    float _768 = fma(_710, _748, _766);
    float _770 = -_672;
    float _772 = _770 + _692;
    float _774 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[10].z, _698);
    float _776 = -_746;
    float _778 = fma(_710, _734, _776);
    float _780 = _662 + 280.0;
    float _782 = _758 * _772;
    float _784 = _756 * _772;
    float _786 = _760 * _772;
    float _788 = fma(_710, _734, _746);
    float _790 = fma(_752, _720, _782);
    float _792 = fma(_750, _720, _784);
    float _794 = fma(_778, _720, _786);
    float _796 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[8].x, _732);
    float _798 = -_660;
    float _800 = _798 + _708;
    float _802 = _740 * 6.283185482025146484375;
    float _804 = cos(_802);
    float _806 = -_764;
    float _808 = _806 + 1.0;
    float _810 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[9].x, _738);
    float _812 = _710 * _730;
    float _814 = fma(_768, _800, _790);
    float _816 = _712 * _808;
    float _818 = _712 * _730;
    float _820 = _714 * _808;
    float _822 = _740 * 6.283185482025146484375;
    float _824 = sin(_822);
    float _826 = -_812;
    float _828 = fma(_714, _816, _826);
    float _830 = -_672;
    float _832 = _830 + _810;
    float _834 = -_670;
    float _836 = _834 + _796;
    float _838 = _714 * _730;
    float _840 = fma(_710, _820, _818);
    float _842 = fma(_712, _816, _764);
    float _844 = _828 * _832;
    float _846 = -_838;
    float _848 = fma(_710, _816, _846);
    float _850 = _840 * _832;
    float _852 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[10].x, _774);
    float _854 = fma(_842, _836, _844);
    float _856 = -_804;
    float _858 = _856 + 1.0;
    float _860 = fma(_788, _800, _792);
    float _862 = in.m_51.w;
    float _864 = _706 + 280.0;
    float _866 = _672 + _814;
    float _868 = fma(_848, _836, _850);
    float _870 = _712 * _824;
    float _872 = _714 * _824;
    float _874 = _710 * _824;
    float _876 = fma(_808, _726, _764);
    float _878 = fma(_726, _858, _804);
    float _880 = fma(_736, _800, _794);
    float _882 = _714 * _858;
    float _884 = _670 + _860;
    float _886 = fma(_864, (*spvDescriptorSet0.vp_c10)._m0[9].x, _866);
    float _888 = _712 * _858;
    float _890 = fma(_710, _882, _870);
    float _892 = fma(_864, (*spvDescriptorSet0.vp_c10)._m0[8].x, _884);
    float _894 = -_672;
    float _896 = _894 + _886;
    float _898 = _660 + _880;
    float _900 = -_874;
    float _902 = fma(_714, _888, _900);
    float _904 = -_872;
    float _906 = fma(_710, _888, _904);
    float _908 = -_670;
    float _910 = _908 + _892;
    float _912 = _890 * _896;
    float _914 = fma(_864, (*spvDescriptorSet0.vp_c10)._m0[10].x, _898);
    float _916 = fma(_712, _888, _804);
    float _918 = _902 * _896;
    float _920 = fma(_906, _910, _912);
    float _922 = -_660;
    float _924 = _922 + _914;
    float _926 = -_660;
    float _928 = _926 + _852;
    float _930 = fma(_916, _910, _918);
    float _932 = fma(_710, _888, _872);
    float _934 = fma(_878, _924, _920);
    float _936 = fma(_876, _928, _868);
    float _938 = fma(_710, _816, _838);
    float _940 = fma(_932, _924, _930);
    float _942 = -_862;
    float _944 = _942 + 1.0;
    float _946 = _660 + _934;
    float _948 = fma(_938, _928, _854);
    float _950 = _660 + _936;
    float _952 = _670 + _940;
    float _954 = _946 * _944;
    float _956 = _670 + _948;
    float _958 = fma(_714, _816, _812);
    float _960 = _952 * _944;
    float _962 = fma(_950, _862, _954);
    float _964 = in.m_59.x;
    float _966 = fma(_714, _882, _804);
    float _968 = fma(_956, _862, _960);
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _972 = _962 + _970;
    float _974 = fma(_714, _820, _764);
    float _976 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _978 = _968 + _976;
    float _980 = _972 * _972;
    float _982 = fma(_714, _888, _874);
    float _984 = _966 * _896;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _988 = _986 != 0;
    float _990 = fma(_978, _978, _980);
    float _992 = _974 * _832;
    float _994 = -_870;
    float _996 = fma(_710, _882, _994);
    float _998 = fma(_982, _910, _984);
    float _1000 = sqrt(_990);
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1004 = _1002 != 0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1008 = _1006 != 0;
    float _1010 = -_818;
    float _1012 = fma(_710, _820, _1010);
    float _1014 = fma(_958, _836, _992);
    float _1016 = fma(_996, _924, _998);
    bool _1018 = _162 > 0.5;
    float _1020 = fma(_1012, _928, _1014);
    float _1022 = _672 + _1016;
    float _1024 = _952;
    int _1026 = as_type<int>(_672);
    int _1028 = as_type<int>(_710);
    float _1030 = _1020;
    float _1032 = _882;
    float _1034 = _962;
    float _1036 = _1012;
    float _1038 = _978;
    bool _1040 = _1018;
    float _1042 = _964;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_988)
    {
        _1024 = _964;
    }
    float _1046 = _1024;
    float _1048 = _672 + _1020;
    float _1050 = _1022 * _944;
    float _1052 = _1048;
    float _1054 = _1046;
    if (_1004)
    {
        float _1056 = -_964;
        float _1058 = _1056 + 1.0;
        _1026 = as_type<int>(_1058);
    }
    int _1060 = _1026;
    float _1062 = as_type<float>(_1060);
    if (_1008)
    {
        float _1064 = -_964;
        float _1066 = _1064 + 1.0;
        _1028 = as_type<int>(_1066);
    }
    int _1068 = _1028;
    bool _1070 = _1000 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1072 = fma(_1048, _862, _1050);
    if (!_1004)
    {
        _1030 = _964;
    }
    float _1074 = _1030;
    float _1076 = _1074;
    if (!_1008)
    {
        _1032 = _964;
    }
    float _1078 = _1032;
    float _1080 = _1078;
    if (_1004)
    {
        float _1082 = _1018 ? as_type<float>(_1060) : _964;
        _1076 = _1082;
    }
    float _1084 = _1076;
    if (_1008)
    {
        float _1086 = _1018 ? as_type<float>(_1068) : _964;
        _1080 = _1086;
    }
    float _1088 = _1080;
    if (!_1070)
    {
        _1062 = _968;
    }
    float _1090 = _1062;
    float _1092 = _1090;
    if (!_1070)
    {
        _1052 = _1072;
    }
    float _1094 = _1052;
    bool _1096 = !_1070;
    float _1098 = _1094;
    if (!_1096)
    {
        float _1100 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1102 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1104 = _1000 + _1102;
        float _1106 = _1072 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1108 = rsqrt(_990);
        float _1110 = _1104 * _1100;
        float _1112 = _1110 * 0.15915493667125701904296875;
        float _1114 = _1112 * 6.283185482025146484375;
        float _1116 = cos(_1114);
        float _1118 = _1112 * 6.283185482025146484375;
        float _1120 = sin(_1118);
        float _1122 = _1116 + (-1.0);
        float _1124 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1126 = fma(_1120, _1106, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1128 = fma(_1072, _1116, _1124);
        float _1130 = _1108 * _1126;
        float _1132 = fma(_978, _1130, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1134 = fma(_972, _1130, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1098 = _1128;
        _1092 = _1132;
        _1034 = _1134;
    }
    float _1136 = _1098;
    float _1138 = _1092;
    float _1140 = _1034;
    float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1144 = _1136 + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1148 = _1138 + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1152 = _1140 + _1150;
    float _1154 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1156 = _1144 * _1144;
    float _1158 = fma(_1148, _1148, _1156);
    float _1160 = precise::max(0.0, _1154);
    float _1162 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1164 = fma(_1152, _1152, _1158);
    float _1166 = rsqrt(_1164);
    float _1168 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1170 = _1148 * _1168;
    float _1172 = _1152 * _1168;
    float _1174 = -_1168;
    float _1176 = -_1160;
    float _1178 = fma(_1144, _1174, _1176);
    float _1180 = _1170 * _1170;
    float _1182 = _1172 * _1172;
    float _1184 = _1180 + _1182;
    float _1186 = sqrt(_1184);
    bool _1188 = _1186 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1192 = _1186 + _1190;
    float _1194 = _1152;
    float _1196 = _1144;
    float _1198 = _1158;
    float _1200 = _1192;
    float _1202 = _1178;
    if (_1188)
    {
        float _1204 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1194 = _1204;
    }
    float _1206 = _1194;
    if (_1188)
    {
        float _1208 = _1178 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1196 = _1208;
    }
    float _1210 = _1196;
    float _1212 = _1210;
    if (_1188)
    {
        float _1214 = rsqrt(_1184);
        _1198 = _1214;
    }
    float _1216 = _1198;
    float _1218 = _1206;
    float _1220 = _1216;
    if (_1188)
    {
        float _1222 = _1192 * _1206;
        _1200 = _1222;
    }
    float _1224 = _1200;
    if (!_1188)
    {
        _1218 = _1170;
    }
    float _1226 = _1218;
    float _1228 = _1226;
    if (_1188)
    {
        float _1230 = _1224 * 0.15915493667125701904296875;
        _1036 = _1230;
    }
    float _1232 = _1036;
    float _1234 = _1224;
    if (_1188)
    {
        float _1236 = _1232 * 6.283185482025146484375;
        float _1238 = sin(_1236);
        _1234 = _1238;
    }
    float _1240 = _1234;
    float _1242 = _1166;
    if (_1188)
    {
        float _1244 = _1232 * 6.283185482025146484375;
        float _1246 = cos(_1244);
        _1242 = _1246;
    }
    float _1248 = _1242;
    float _1250 = _1240;
    if (_1188)
    {
        float _1252 = fma(_1240, _1210, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1212 = _1252;
    }
    float _1254 = _1212;
    float _1256 = sqrt(_1164);
    float _1258 = _1254;
    if (_1188)
    {
        float _1260 = _1216 * _1254;
        _1038 = _1260;
    }
    float _1262 = _1038;
    if (!_1188)
    {
        _1258 = _1180;
    }
    float _1264 = _1258;
    float _1266 = _1264;
    float _1268 = _1248;
    if (_1188)
    {
        float _1270 = _1248 + (-1.0);
        _1250 = _1270;
    }
    float _1272 = _1250;
    float _1274 = _1272;
    if (_1188)
    {
        float _1276 = _1170 * _1262;
        _1228 = _1276;
    }
    float _1278 = _1228;
    if (_1188)
    {
        float _1280 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1220 = _1280;
    }
    float _1282 = _1220;
    if (!_1188)
    {
        _1274 = _1172;
    }
    float _1284 = _1274;
    float _1286 = _1284;
    if (_1188)
    {
        float _1288 = _1172 * _1262;
        _1286 = _1288;
    }
    float _1290 = _1286;
    if (_1188)
    {
        float _1292 = _1278 * _1278;
        _1266 = _1292;
    }
    float _1294 = _1266;
    if (_1188)
    {
        float _1296 = fma(_1178, _1248, _1282);
        _1202 = _1296;
    }
    float _1298 = _1202;
    if (!_1188)
    {
        _1268 = _1182;
    }
    float _1300 = _1268;
    float _1302 = _1300;
    if (_1188)
    {
        float _1304 = _1290 * _1290;
        _1302 = _1304;
    }
    float _1306 = _1302;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1310 = fma(_1256, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1308);
    float _1312 = precise::clamp(_1310, 0.0, 1.0);
    float _1314 = fma(_1298, _1298, _1294);
    float _1316 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1318 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1320 = -_1312;
    float _1322 = _1320 + 1.0;
    float _1324 = _1314 + _1306;
    float _1326 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1328 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1316);
    float _1330 = abs(_1322);
    float _1332 = log2(_1330);
    float _1334 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1318);
    float _1336 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1326);
    float _1338 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1328);
    float _1340 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1336);
    float _1342 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1344 = rsqrt(_1324);
    float _1346 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1350 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1342);
    float _1352 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1354 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1350);
    float _1356 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1358 = -_1352;
    float _1360 = fma(_1358, _1162, 1.0);
    float _1362 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1364 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1366 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1334);
    float _1368 = exp2(_1356);
    float _1370 = _1344 * _1278;
    float _1372 = _1344 * _1298;
    float _1374 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1364);
    float _1376 = _1344 * _1290;
    float _1378 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1380 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1382 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1374);
    float _1384 = log2(_1360);
    float _1386 = -_1378;
    float _1388 = fma(_1372, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1386);
    float _1390 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1392 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1382);
    float _1394 = -_1376;
    float _1396 = fma(_1394, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1388);
    float _1398 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1400 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1390);
    float _1402 = 1.0 / _1392;
    float _1404 = fma(_1396, -0.5, 0.5);
    float _1406 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1398);
    float _1408 = fma(_1396, 0.5, 0.5);
    float _1410 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1400);
    float _1412 = _1372 + 1.0;
    float _1414 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1406);
    float _1416 = fma(_1408, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1418 = sqrt(_1404);
    float _1420 = -_1372;
    float _1422 = fma(_1368, _1412, _1420);
    float _1424 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1414);
    float _1426 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1410);
    float _1428 = fma(_1408, _1416, -0.212114393711090087890625);
    float _1430 = _1384 * 0.693147182464599609375;
    float _1432 = fma(_1422, 0.5, 0.5);
    float _1434 = _1424 * _1402;
    float _1436 = _1426 * _1402;
    float _1438 = fma(_1408, _1428, 1.570728778839111328125);
    float _1440 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1442 = fma(_1434, 0.5, 0.5);
    float _1444 = fma(_1436, -0.5, 0.5);
    float _1446 = _1418 * 0.636619746685028076171875;
    float3 _4073 = float3(_1442, _1444, _1440);
    float _1448 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4073, float3(0.0), isnan(_4073)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4073, float3(0.0), isnan(_4073)), level(0.0)).x;
    float _1450 = -_1438;
    float _1452 = fma(_1446, _1450, 1.0);
    float3 _4089 = float3(_1442, _1444, _1440);
    float4 _1455 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4089, float3(0.0), isnan(_4089)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4089, float3(0.0), isnan(_4089)), level(0.0)).xyzw;
    float _1457 = _1455.x;
    float _1459 = _1455.y;
    float _1461 = _1455.z;
    float _1463 = _1455.w;
    float2 _4106 = float2(_1452, _1432);
    float3 _1467 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4106, float2(0.0), isnan(_4106)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4106, float2(0.0), isnan(_4106)), level(0.0)).xyz;
    float _1469 = _1467.x;
    float _1471 = _1467.y;
    float _1473 = _1467.z;
    float _1475 = in.m_59.y;
    float _1477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1479 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1481 = _158 > 0.5;
    out.m_61.x = _144;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1487 = _1485 != 0;
    float _1489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1491 = _154 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1493 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1479);
    int _1495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1497 = _1495 != 0;
    float _1499 = -_1483;
    float _1501 = fma(_1491, 2.0, _1499);
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1505 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1511 = _1509 != 0;
    float _1513 = fma(_1505, -2.0, _1503);
    float _1515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1519 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1507);
    float _1521 = -_1475;
    float _1523 = _1521 + 1.0;
    float _1525 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_61.w = _862;
    int _1527 = _1481 ? as_type<int>(_1523) : as_type<int>(_1475);
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1533 = _1531 != 0;
    int _1535 = 0;
    bool _1537 = _1497;
    int _1539 = as_type<int>(_1519);
    float _1541 = _1513;
    if (_1511)
    {
        float _1543 = -_964;
        float _1545 = _1543 + 1.0;
        _1535 = as_type<int>(_1545);
    }
    int _1547 = _1535;
    float _1549 = _1487 ? as_type<float>(_1527) : _1475;
    float _1551 = _1477 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1553 = _1018 ? as_type<int>(_1523) : as_type<int>(_1475);
    float _1555 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1529);
    if (_1511)
    {
        bool _1557 = _202 > 0.5;
        _1040 = _1557;
    }
    bool _1559 = _1040;
    float _1561 = fma(_1551, _1549, -0.5);
    float _1563 = _1497 ? as_type<float>(_1553) : _1475;
    float _1565 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1569 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1513);
    float _1571 = _1563;
    if (_988)
    {
        bool _1573 = _154 > 0.5;
        _1537 = _1573;
    }
    bool _1575 = _1537;
    float _1577 = fma(_1565, _1563, -0.5);
    if (!_152)
    {
        _1571 = _162;
    }
    float _1579 = _1571;
    float _1581 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1517);
    float _1583 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1519);
    float _1585 = _1579;
    if (_988)
    {
        float _1587 = -_964;
        float _1589 = _1587 + 1.0;
        _1539 = as_type<int>(_1589);
    }
    int _1591 = _1539;
    float _1593 = as_type<float>(_1591);
    if (!_152)
    {
        _1541 = _1579;
    }
    float _1595 = _1541;
    float _1597 = _1515 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1599 = _1595;
    if (_152)
    {
        _1585 = _162;
    }
    float _1601 = _1585;
    float _1603 = -_1569;
    float _1605 = fma(_1583, _1577, _1603);
    float _1607 = exp2(_1525);
    if (_988)
    {
        float _1609 = _1575 ? as_type<float>(_1591) : _964;
        _1054 = _1609;
    }
    float _1611 = _1054;
    float _1613 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    if (!_152)
    {
        _1593 = _1595;
    }
    float _1615 = _1593;
    float _1617 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1619 = _1615;
    if (_152)
    {
        _1599 = _154;
    }
    float _1621 = _1599;
    float _1623 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1625 = _1567;
    float _1627 = _1621;
    if (_1511)
    {
        float _1629 = _1559 ? as_type<float>(_1547) : _964;
        _1042 = _1629;
    }
    float _1631 = _1042;
    float _1633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    if (!_152)
    {
        _1625 = _346;
    }
    float _1635 = _1625;
    float _1637 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1493);
    float _1639 = _1635;
    if (_152)
    {
        _350 = _202;
    }
    float _1641 = _350;
    out.m_63.x = _1138;
    out.m_63.y = _1136;
    out.m_63.z = _1140;
    bool _1643 = _202 > 0.5;
    float _1645 = fma(_1621, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1617);
    float _1647 = fma(_1623, _1611, -0.5);
    if (_152)
    {
        _1619 = _154;
    }
    float _1649 = _1619;
    float _1651 = fma(_1597, _1631, -0.5);
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1657 = _1655 != 0;
    float _1659 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_152)
    {
        _1044 = _154;
    }
    float _1661 = _1044;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1665 = _1661;
    float _1667 = _1663;
    if (_152)
    {
        _1665 = _1641;
    }
    float _1669 = _1665;
    float _1671 = -_1653;
    float _1673 = fma(_1659, 2.0, _1671);
    int _1675 = _1643 ? as_type<int>(_1523) : as_type<int>(_1475);
    float _1677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1679 = _1669;
    if (_152)
    {
        _1627 = _1601;
    }
    float _1681 = _1627;
    float _1683 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1663);
    float _1685 = _1681;
    if (!_152)
    {
        _1679 = _1635;
    }
    float _1687 = _1679;
    float _1689 = -_100;
    float _1691 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1673);
    float _1693 = _1687;
    if (_152)
    {
        _1667 = _1641;
    }
    float _1695 = _1667;
    float _1697 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1683);
    float _1699 = _1695;
    if (_152)
    {
        _1639 = _1601;
    }
    float _1701 = _1639;
    float _1703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_152)
    {
        _1693 = _1601;
    }
    float _1705 = _1693;
    float _1707 = _1697 * (-0.15915493667125701904296875);
    if (!_152)
    {
        _1699 = _1601;
    }
    float _1709 = _1699;
    float _1711 = -_1607;
    float _1713 = _1711 + 1.0;
    float _1715 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1637);
    float _1717 = _1533 ? as_type<float>(_1675) : _1475;
    float _1719 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1723 = _1657 ? as_type<float>(_1675) : _1475;
    float _1725 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1727 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1555);
    float _1729 = -_100;
    float _1731 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1501);
    float _1733 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1735 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1721);
    if (!_152)
    {
        _1685 = _154;
    }
    float _1737 = _1685;
    float _1739 = fma(_1727, _1647, _1731);
    float _1741 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1733);
    float _1743 = _1707 * 6.283185482025146484375;
    float _1745 = cos(_1743);
    if (!_152)
    {
        _332 = _1641;
    }
    float _1747 = _332;
    float _1749 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1725);
    float _1751 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1735);
    float _1753 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1755 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1757 = _1751 * (-0.15915493667125701904296875);
    float _1759 = _1707 * 6.283185482025146484375;
    float _1761 = sin(_1759);
    float _1763 = _1747 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1767 = _1737 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1769 = _1705 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1771 = -_1753;
    float _1773 = fma(_1763, 2.0, _1771);
    float _1775 = fma(_1719, _1717, -0.5);
    float _1777 = fma(_1767, -2.0, _1755);
    float _1779 = _1757 * 6.283185482025146484375;
    float _1781 = sin(_1779);
    float _1783 = fma(_1769, -2.0, _1765);
    float _1785 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1787 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1741);
    float _1789 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1581);
    float _1791 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1645);
    float _1793 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1749);
    float _1795 = -_100;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1773);
    float _1799 = _1757 * 6.283185482025146484375;
    float _1801 = cos(_1799);
    float _1803 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1777);
    float _1805 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1783);
    float _1807 = _1745 * _1561;
    float _1809 = fma(_1785, _1084, -0.5);
    float _1811 = _1723 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1813 = _1761 * _1561;
    float _1815 = fma(_1761, _1651, _1807);
    float _1817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1819 = _1781 * _1775;
    float _1821 = _1811 * _1633;
    float _1823 = -_1805;
    float _1825 = fma(_1793, _1815, _1823);
    float _1827 = -_1813;
    float _1829 = fma(_1745, _1651, _1827);
    float _1831 = _1739 + 0.5;
    float _1833 = _1825 + 0.5;
    float _1835 = _1801 * _1775;
    float _1837 = -_1819;
    float _1839 = fma(_1801, _1809, _1837);
    float _1841 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1843 = fma(_1791, _1829, _1691);
    float _1845 = fma(_1781, _1809, _1835);
    float _1847 = fma(_1787, _1839, _1797);
    float _1849 = _1605 + 0.5;
    out.m_65.w = _1841;
    float _1851 = -_1803;
    float _1853 = fma(_1789, _1845, _1851);
    float _1855 = _1613 * _1817;
    float _1857 = _1847 + 0.5;
    float _1859 = _1853 + 0.5;
    float _1861 = _1715 + _1392;
    float _1863 = _1713 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1865 = _1843 + 0.5;
    out.m_67.x = _1857;
    out.m_67.y = _1859;
    float _1867 = _1861 * 0.5;
    float _1869 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _1855;
    out.m_69.y = _1821;
    out.m_71.x = _1831;
    out.m_71.y = _1849;
    out.m_71.z = _1865;
    out.m_71.w = _1833;
    float _1871 = -_1863;
    float _1873 = _1871 + 1.0;
    out.gl_Position.x = _1424;
    out.gl_Position.y = _1426;
    out.gl_Position.z = _1715;
    out.gl_Position.w = _1392;
    out.m_73.z = _1867;
    out.m_73.w = _1392;
    out.m_49.x = _1869;
    float _1875 = _1863 * _1448;
    float _1877 = _1463 * _1875;
    float _1879 = _1473 * _1875;
    float _1881 = fma(_1469, _1877, _1457);
    float _1883 = fma(_1471, _1877, _1459);
    float _1885 = _1463 * _1873;
    float _1887 = fma(_1463, _1879, _1461);
    out.m_75.x = _1881;
    out.m_75.y = _1883;
    out.m_75.z = _1887;
    out.m_75.w = _1885;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

