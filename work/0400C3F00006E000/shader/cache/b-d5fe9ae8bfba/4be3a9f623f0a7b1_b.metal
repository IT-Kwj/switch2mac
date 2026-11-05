#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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

struct _31
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c7 [[id(1)]];
    constant _16* fp_c11 [[id(2)]];
    constant _16* fp_c4 [[id(3)]];
    constant _16* fp_c13 [[id(4)]];
    const device _31* fp_s0 [[id(5)]];
    texture2d_array<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    texture2d<float> fp_t_tcb_1C [[id(10)]];
    sampler fp_t_tcb_1CSmplr [[id(11)]];
    texture2d_array<float> fp_t_tcb_C [[id(12)]];
    sampler fp_t_tcb_CSmplr [[id(13)]];
    texture2d<float> fp_t_tcb_10 [[id(14)]];
    sampler fp_t_tcb_10Smplr [[id(15)]];
    texture3d<float> fp_t_tcb_1E [[id(16)]];
    sampler fp_t_tcb_1ESmplr [[id(17)]];
    texture2d<float> fp_t_tcb_12 [[id(18)]];
    sampler fp_t_tcb_12Smplr [[id(19)]];
    texture2d<float> fp_t_tcb_16 [[id(20)]];
    sampler fp_t_tcb_16Smplr [[id(21)]];
    texture2d_array<float> fp_t_tcb_14 [[id(22)]];
    sampler fp_t_tcb_14Smplr [[id(23)]];
    sampler fp_t_tcb_8Smplr_w [[id(24)]];
    sampler fp_t_tcb_ESmplr_w [[id(25)]];
    sampler fp_t_tcb_1CSmplr_w [[id(26)]];
    sampler fp_t_tcb_CSmplr_w [[id(27)]];
    sampler fp_t_tcb_10Smplr_w [[id(28)]];
    sampler fp_t_tcb_1ESmplr_w [[id(29)]];
    sampler fp_t_tcb_12Smplr_w [[id(30)]];
    sampler fp_t_tcb_16Smplr_w [[id(31)]];
    sampler fp_t_tcb_14Smplr_w [[id(32)]];
    constant dm_border_t* dm_border [[id(33)]];
};

struct main0_out
{
    float4 m_79 [[color(0)]];
    float4 m_81 [[color(1)]];
};

struct main0_in
{
    float4 m_70 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_66 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c7)._m0[11].z) * as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].z);
    int _90 = _88 + as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].w);
    int _92 = _90 * 96;
    int _94 = _92 + 80;
    uint _97 = uint(int(uint(_92) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_97)];
    float _100 = as_type<float>(_dmw0.x);
    int _102 = _92 + 4;
    uint _104 = uint(int(uint(_102) >> uint(2)));
    float _106 = as_type<float>(_dmw0.y);
    uint _108 = uint(int(uint(_94) >> uint(2)));
    float _110 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_108)]);
    int _112 = _92 + 24;
    int _114 = _92 + 16;
    uint _116 = uint(int(uint(_112) >> uint(2)));
    float _118 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_116)]);
    int _120 = _112 + 4;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    float _124 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_122)]);
    uint _126 = uint(int(uint(_114) >> uint(2)));
    float _128 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_126)]);
    int _130 = _114 + 4;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    float _134 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_132)]);
    int _136 = _92 + 8;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>(_dmw0.z);
    int _142 = _136 + 4;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>(_dmw0.w);
    float _148 = gl_FragCoord.w;
    float _150 = in.m_66.z;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_66.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = 1.0 / _148;
    float _164 = _162 * _154;
    float _166 = _162 * _160;
    int _168 = as_type<int>(_110) << 6;
    int _170 = _168 + 25904;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    uint _174 = uint(int(uint(int(_172)) >> uint(2)));
    int _176 = int(_172) & 3;
    float _178 = (*spvDescriptorSet0.fp_c9)._m0[int(_174)][_176];
    int _180 = int(_172) + 1;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    int _184 = _180 & 3;
    float _186 = (*spvDescriptorSet0.fp_c9)._m0[int(_182)][_184];
    float _188 = fma(_164, _128, _118);
    float _190 = fma(_166, _134, _124);
    float _192 = _188 * _178;
    float _194 = _190 * _186;
    float2 _1608;
    _1608.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_192, _194));
    _1608.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_192, _194));
    float _196 = _1608.x;
    float _198 = _196 * 256.0;
    int _200 = int(_198);
    float _202 = in.m_68.x;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_68.z;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_70.x;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_70.y;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    int _226 = _168 + 25920;
    uint _228 = uint(int(uint(_226) >> uint(2)));
    uint _230 = uint(int(uint(int(_228)) >> uint(2)));
    int _232 = int(_228) & 3;
    float _234 = (*spvDescriptorSet0.fp_c9)._m0[int(_230)][_232];
    int _236 = int(_228) + 1;
    uint _238 = uint(int(uint(_236) >> uint(2)));
    int _240 = _236 & 3;
    float _242 = (*spvDescriptorSet0.fp_c9)._m0[int(_238)][_240];
    float _244 = fma(_164, _100, _140);
    float _246 = fma(_166, _106, _146);
    float _248 = _244 * _178;
    float _250 = _246 * _186;
    float _252 = _162 * _206;
    float _254 = _162 * _212;
    float _256 = _162 * _218;
    float _258 = _162 * _224;
    float _260 = fma(_252, 6.2500002968590706586837768554688e-05, 0.5);
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = fma(_254, 6.2500002968590706586837768554688e-05, 0.5);
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = _188 * _234;
    float _270 = _190 * _242;
    float2 _1720 = float2(_256, _258);
    float _272 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1720, float2(0.0), isnan(_1720))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1720, float2(0.0), isnan(_1720))).x;
    float2 _1730 = float2(_262, _266);
    float _274 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_1730, float2(0.0), isnan(_1730))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_1730, float2(0.0), isnan(_1730))).x;
    float2 _1739;
    _1739.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_248, _250));
    _1739.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_248, _250));
    float _276 = _1739.x;
    float _278 = _276 * 256.0;
    int _280 = int(_278);
    float2 _1749;
    _1749.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_268, _270));
    _1749.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_268, _270));
    float _282 = _1749.x;
    float _284 = _282 * 256.0;
    int _286 = int(_284);
    int _288 = _92 + 68;
    uint _290 = uint(int(uint(_288) >> uint(2)));
    float _292 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_290)]);
    int _294 = _92 + 64;
    float _296 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _298 = _254 + _296;
    float _300 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _302 = _252 + _300;
    float _304 = _298 * _298;
    float _306 = in.m_68.y;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_72.y;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_72.x;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = fma(_302, _302, _304);
    float _326 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _328 = _252 + _326;
    float _330 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _332 = _254 + _330;
    uint _334 = uint(int(uint(_294) >> uint(2)));
    float _336 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_334)]);
    float _338 = sqrt(_324);
    bool _342 = _338 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _344 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _346 = _338 + _344;
    float _348 = 0.0;
    float _350 = _346;
    if (_342)
    {
        float _352 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _348 = _352;
    }
    float _354 = _348;
    float _356 = _162 * _310;
    float _358 = in.m_72.z;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _366 = _356 + _364;
    float _368 = _366 * _366;
    float _370 = fma(_328, _328, _368);
    float _372 = _316;
    float _374 = _354;
    if (_342)
    {
        float _376 = _346 * _354;
        _350 = _376;
    }
    float _378 = _350;
    float _380 = fma(_332, _332, _370);
    float _382 = 0.0;
    if (_342)
    {
        float _384 = _378 * 0.15915493667125701904296875;
        _382 = _384;
    }
    float _386 = _382;
    float _388 = _370;
    if (_342)
    {
        float _390 = _386 * 6.283185482025146484375;
        float _392 = cos(_390);
        _388 = _392;
    }
    float _394 = _388;
    float _396 = _162 * _316;
    float _398 = _378;
    if (_342)
    {
        float _400 = _386 * 6.283185482025146484375;
        float _402 = sin(_400);
        _398 = _402;
    }
    float _404 = _398;
    float _406 = _162 * _322;
    float _408 = _324;
    if (_342)
    {
        float _410 = rsqrt(_324);
        _408 = _410;
    }
    float _412 = _408;
    float _414 = _396 * _396;
    if (_342)
    {
        float _416 = _356 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _372 = _416;
    }
    float _418 = _372;
    float _420 = _418;
    float _422 = _394;
    if (_342)
    {
        float _424 = _394 + (-1.0);
        _374 = _424;
    }
    float _426 = _374;
    float _428 = _162 * _362;
    float _430 = fma(_406, _406, _414);
    float _432 = _426;
    float _434 = _430;
    if (_342)
    {
        float _436 = _426 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _432 = _436;
    }
    float _438 = _432;
    float _440 = sqrt(_380);
    float _442 = _404;
    if (_342)
    {
        float _444 = fma(_404, _418, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _420 = _444;
    }
    float _446 = _420;
    float _448 = fma(_428, _428, _430);
    float _450 = _446;
    if (!_342)
    {
        _434 = _356;
    }
    float _452 = _434;
    float _454 = _452;
    if (_342)
    {
        float _456 = fma(_356, _394, _438);
        _454 = _456;
    }
    float _458 = _454;
    if (!_342)
    {
        _422 = _252;
    }
    float _460 = _422;
    float _462 = _460;
    if (_342)
    {
        float _464 = _412 * _446;
        _450 = _464;
    }
    float _466 = _450;
    if (!_342)
    {
        _442 = _254;
    }
    float _468 = _442;
    float _470 = _468;
    if (_342)
    {
        float _472 = fma(_302, _466, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _462 = _472;
    }
    float _474 = _462;
    float _476 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _478 = _458 + _476;
    if (_342)
    {
        float _480 = fma(_298, _466, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _470 = _480;
    }
    float _482 = _470;
    float _484 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _486 = _474 + _484;
    float _488 = _478 * _478;
    float _490 = spvFAdd(_440, 9.9999997473787516355514526367188e-06);
    float _492 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _494 = _482 + _492;
    float _496 = fma(_486, _486, _488);
    float _498 = rsqrt(_448);
    float _500 = fma(_494, _494, _496);
    float _502 = spvFAdd(_440, 9.9999997473787516355514526367188e-06);
    float _504 = 1.0 / _490;
    float _506 = spvFAdd(_440, 9.9999997473787516355514526367188e-06);
    float _508 = rsqrt(_500);
    float _510 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _512 = _252 + _510;
    float _514 = _406 * _498;
    float _516 = 1.0 / _502;
    float _518 = _512 * _504;
    float _520 = 1.0 / _506;
    float _522 = _514 * _518;
    float _524 = _396 * _498;
    float _526 = _366 * _504;
    float _528 = _508 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _530 = -_526;
    float _532 = -_522;
    float _534 = fma(_524, _530, _532);
    float _536 = _486 * _528;
    float _538 = _494 * _528;
    float _540 = _332 * _516;
    float _542 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _544 = _252 + _542;
    float _546 = _428 * _498;
    float _548 = _536 * _536;
    float _550 = _538 * _538;
    float _552 = _366 * _520;
    float _554 = _544 * _520;
    float _556 = _548 + _550;
    float _558 = _552 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    int _560 = _168 + 25936;
    uint _562 = uint(int(uint(_560) >> uint(2)));
    uint _564 = uint(int(uint(int(_562)) >> uint(2)));
    int _566 = int(_562) & 3;
    float _568 = (*spvDescriptorSet0.fp_c9)._m0[int(_564)][_566];
    float _570 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _572 = fma(_554, (*spvDescriptorSet0.fp_c9)._m0[69].x, _558);
    float _574 = sqrt(_556);
    float _576 = precise::max(0.0, _570);
    float _578 = -_528;
    float _580 = -_576;
    float _582 = fma(_478, _578, _580);
    int _584 = _168 + 25952;
    uint _586 = uint(int(uint(_584) >> uint(2)));
    uint _588 = uint(int(uint(int(_586)) >> uint(2)));
    int _590 = int(_586) & 3;
    float _592 = (*spvDescriptorSet0.fp_c9)._m0[int(_588)][_590];
    bool _594 = _574 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _596 = float(uint(_200));
    float _598 = _596 * 0.00390625;
    float _600 = precise::max(_292, _568);
    float _602 = precise::max(_600, _598);
    float _604 = _598;
    float _606 = _550;
    float _608 = _548;
    float _610 = _536;
    float _612 = _538;
    if (!_594)
    {
        _604 = _550;
    }
    float _614 = _604;
    float _616 = _614;
    if (!_594)
    {
        _606 = _548;
    }
    float _618 = _606;
    float _620 = _618;
    if (!_594)
    {
        _608 = _582;
    }
    float _622 = _608;
    bool _624 = !_594;
    float _626 = _622;
    if (!_624)
    {
        float _628 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _630 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _632 = _574 + _630;
        float _634 = rsqrt(_556);
        float _636 = _632 * _628;
        float _638 = _582 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _640 = _636 * 0.15915493667125701904296875;
        float _642 = _640 * 6.283185482025146484375;
        float _644 = sin(_642);
        float _646 = _640 * 6.283185482025146484375;
        float _648 = cos(_646);
        float _650 = fma(_644, _638, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _652 = _634 * _650;
        float _654 = _648 + (-1.0);
        float _656 = _536 * _652;
        float _658 = _538 * _652;
        float _660 = _654 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _662 = _656 * _656;
        float _664 = fma(_582, _648, _660);
        float _666 = _658 * _658;
        _626 = _664;
        _620 = _662;
        _616 = _666;
        _610 = _656;
        _612 = _658;
    }
    float _668 = _626;
    float _670 = _620;
    float _672 = _616;
    float _674 = _610;
    float _676 = _612;
    float _678 = fma(_668, _668, _670);
    float _680 = rint(_592);
    float _682 = precise::max(_680, 0.0);
    uint _684 = uint(_682);
    uint _686 = clamp(_684, 0u, 65535u);
    int _688 = _168 + 25944;
    uint _690 = uint(int(uint(_688) >> uint(2)));
    uint _692 = uint(int(uint(int(_690)) >> uint(2)));
    int _694 = int(_690) & 3;
    float _696 = (*spvDescriptorSet0.fp_c9)._m0[int(_692)][_694];
    float _698 = _678 + _672;
    float _700 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _702 = fma(_440, (*spvDescriptorSet0.fp_c9)._m0[63].x, _700);
    float _704 = precise::clamp(_702, 0.0, 1.0);
    float _706 = rsqrt(_698);
    float _708 = -_704;
    float _710 = _708 + 1.0;
    float _712 = abs(_710);
    float _714 = log2(_712);
    float3 _2402 = float3(_192, _194, float(int(_686)));
    float3 _2406 = select(_2402, float3(0.0), isnan(_2402));
    float _716 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2406.xy, uint(rint(_2406.z)), level(_602)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2406.xy, uint(rint(_2406.z)), level(_602)).z;
    float _718 = precise::max(_336, _568);
    float _720 = -_540;
    float _722 = fma(_546, _720, _534);
    float _724 = precise::clamp(_722, 0.0, 1.0);
    float _726 = fma(_540, (*spvDescriptorSet0.fp_c9)._m0[69].z, _572);
    float _728 = float(uint(_280));
    float _730 = in.m_70.z;
    float _732 = gl_FragCoord.w;
    float _734 = _730 * _732;
    float _736 = _706 * _674;
    float _738 = _706 * _668;
    float _740 = _706 * _676;
    float _742 = _254 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _744 = _736 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _746 = _728 * 0.00390625;
    float _748 = in.m_74.x;
    float _750 = gl_FragCoord.w;
    float _752 = _748 * _750;
    float _754 = _742 * (*spvDescriptorSet0.fp_c11)._m0[30].z;
    float _756 = -_744;
    float _758 = fma(_738, (*spvDescriptorSet0.fp_c9)._m0[69].y, _756);
    float _760 = _714 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _762 = _356 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _764 = _738 + 1.0;
    float _766 = in.m_70.w;
    float _768 = gl_FragCoord.w;
    float _770 = _766 * _768;
    float _772 = float(uint(_286));
    float _774 = _762 * (*spvDescriptorSet0.fp_c11)._m0[30].y;
    float _776 = exp2(_760);
    float _778 = -_740;
    float _780 = fma(_778, (*spvDescriptorSet0.fp_c9)._m0[69].z, _758);
    float _782 = _252 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _784 = _772 * 0.00390625;
    float _786 = precise::max(_292, _696);
    float _788 = _782 * (*spvDescriptorSet0.fp_c11)._m0[30].x;
    float _790 = precise::max(_786, _784);
    float _792 = fma(_754, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].z);
    float _794 = fma(_788, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].x);
    float _796 = fma(_774, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].y);
    float _798 = -_738;
    float _800 = fma(_776, _764, _798);
    float _802 = precise::max(_718, _746);
    float _804 = in.m_74.y;
    float _806 = gl_FragCoord.w;
    float _808 = _804 * _806;
    float _810 = _162 * _734;
    float _812 = fma(_800, 0.5, 0.5);
    float _814 = fma(_780, 0.5, 0.5);
    float _816 = fma(_780, -0.5, 0.5);
    float _818 = _162 * _752;
    float _820 = sqrt(_816);
    float _822 = fma(_814, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _824 = _162 * _770;
    float _826 = fma(_814, _822, -0.212114393711090087890625);
    float _828 = fma(_814, _826, 1.570728778839111328125);
    float _830 = _820 * 0.636619746685028076171875;
    float _832 = -_828;
    float _834 = fma(_830, _832, 1.0);
    float _836 = _162 * _808;
    float2 _2603 = float2(_818, _836);
    float3 _840 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2603, float2(0.0), isnan(_2603))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2603, float2(0.0), isnan(_2603))).xyz;
    float _842 = _840.x;
    float _844 = _840.y;
    float _846 = _840.z;
    float3 _2618 = float3(_794, _796, _792);
    float _848 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_2618, float3(0.0), isnan(_2618))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_2618, float3(0.0), isnan(_2618))).x;
    float2 _2626 = float2(_810, _824);
    float3 _850 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2626, float2(0.0), isnan(_2626))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2626, float2(0.0), isnan(_2626))).xyz;
    float _852 = _850.x;
    float _854 = _850.y;
    float _856 = _850.z;
    float2 _2640 = float2(_834, _812);
    float3 _858 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2640, float2(0.0), isnan(_2640))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2640, float2(0.0), isnan(_2640))).xyz;
    float _860 = _858.x;
    float _862 = _858.y;
    float _864 = _858.z;
    float3 _2657 = float3(_248, _250, float(int(_686)));
    float3 _2659 = select(_2657, float3(0.0), isnan(_2657));
    float _866 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2659.xy, uint(rint(_2659.z)), level(_802)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2659.xy, uint(rint(_2659.z)), level(_802)).x;
    float3 _2669 = float3(_268, _270, float(int(_686)));
    float3 _2671 = select(_2669, float3(0.0), isnan(_2669));
    float3 _868 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2671.xy, uint(rint(_2671.z)), level(_790)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2671.xy, uint(rint(_2671.z)), level(_790)).xyz;
    float _870 = _868.x;
    float _872 = _868.y;
    float _874 = _868.z;
    float _876 = in.m_76.x;
    float _878 = gl_FragCoord.w;
    float _880 = _876 * _878;
    float _882 = in.m_76.y;
    float _884 = gl_FragCoord.w;
    float _886 = _882 * _884;
    float _888 = in.m_76.z;
    float _890 = gl_FragCoord.w;
    float _892 = _888 * _890;
    float _894 = _356 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _896 = in.m_76.w;
    float _898 = gl_FragCoord.w;
    float _900 = _896 * _898;
    float _902 = _356 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _904 = fma(_252, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _894);
    float _906 = fma(_252, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _902);
    float _908 = fma(_254, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _904);
    float _910 = fma(_254, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _906);
    float _912 = _162 * _880;
    float _914 = _908 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _916 = _910 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _918 = _162 * _886;
    float _920 = trunc(_916);
    int _922 = int(_920);
    float _924 = _162 * _892;
    float _926 = _162 * _900;
    float _928 = trunc(_914);
    int _930 = int(_928);
    int _932 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _934 = _922 + _932;
    int _936 = _934 + 1;
    int _938 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _940 = _930 + _938;
    int _942 = _940 + 1;
    bool _944 = _942 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    int _946 = _942 | _936;
    bool _948 = _946 < 0;
    bool _950 = _948 || _944;
    bool _952 = _936 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _954 = _952 || _950;
    float _956 = as_type<float>(_946);
    if (_954)
    {
        _956 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _958 = _956;
    float _960 = _842 * _852;
    float _962 = _844 * _854;
    float _964 = _846 * _856;
    float _966 = _958;
    if (!_954)
    {
        int _968 = _936 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _970 = _968 + _942;
        float _972 = floor(_914);
        int _974 = _970 << 2;
        int _976 = _970 >> 2;
        int _978 = 12 & _974;
        int _980 = _976 << 4;
        int _982 = _980 + _978;
        float _984 = floor(_916);
        int _986 = _982 + 16256;
        uint _988 = uint(int(uint(_986) >> uint(2)));
        uint _990 = uint(int(uint(int(_988)) >> uint(2)));
        int _992 = int(_988) & 3;
        float _994 = (*spvDescriptorSet0.fp_c9)._m0[int(_990)][_992];
        float _996 = -_972;
        float _998 = _914 + _996;
        float _1000 = -_984;
        float _1002 = _916 + _1000;
        float _1004 = rint(_994);
        float _1006 = precise::max(_1004, 0.0);
        uint _1008 = uint(_1006);
        uint _1010 = clamp(_1008, 0u, 65535u);
        float3 _2893 = float3(_998, _1002, float(int(_1010)));
        float3 _2895 = select(_2893, float3(0.0), isnan(_2893));
        float _1012 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, _2895.xy, uint(rint(_2895.z))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, _2895.xy, uint(rint(_2895.z))).x;
        int _1014 = _970 << 4;
        int _1016 = _1014 + 17904;
        int _1018 = _982 + 24304;
        uint _1020 = uint(int(uint(_1018) >> uint(2)));
        uint _1022 = uint(int(uint(int(_1020)) >> uint(2)));
        int _1024 = int(_1020) & 3;
        float _1026 = (*spvDescriptorSet0.fp_c9)._m0[int(_1022)][_1024];
        uint _1028 = uint(int(uint(_1016) >> uint(2)));
        uint _1030 = uint(int(uint(int(_1028)) >> uint(2)));
        int _1032 = int(_1028) & 3;
        float _1034 = (*spvDescriptorSet0.fp_c9)._m0[int(_1030)][_1032];
        int _1036 = int(_1028) + 1;
        uint _1038 = uint(int(uint(_1036) >> uint(2)));
        int _1040 = _1036 & 3;
        float _1042 = (*spvDescriptorSet0.fp_c9)._m0[int(_1038)][_1040];
        int _1044 = _1016 + 8;
        uint _1046 = uint(int(uint(_1044) >> uint(2)));
        uint _1048 = uint(int(uint(int(_1046)) >> uint(2)));
        int _1050 = int(_1046) & 3;
        float _1052 = (*spvDescriptorSet0.fp_c9)._m0[int(_1048)][_1050];
        int _1054 = int(_1046) + 1;
        uint _1056 = uint(int(uint(_1054) >> uint(2)));
        int _1058 = _1054 & 3;
        float _1060 = (*spvDescriptorSet0.fp_c9)._m0[int(_1056)][_1058];
        float _1062 = _356 * _1042;
        float _1064 = fma(_252, _1034, _1062);
        float _1066 = 1.0 / _1026;
        float _1068 = fma(_254, _1052, _1064);
        float _1070 = _1068 + _1060;
        float _1072 = precise::clamp(_1070, 0.0, 1.0);
        float _1074 = _1026 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _1076 = -_1072;
        float _1078 = _1076 + _1012;
        float _1080 = fma(_1066, (*spvDescriptorSet0.fp_c13)._m0[4].w, _1078);
        float _1082 = _1074 * _1080;
        float _1084 = exp2(_1082);
        float _1086 = 0.0 + _1084;
        float _1088 = precise::clamp(_1086, 0.0, 1.0);
        float _1090 = precise::min(_1088, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _966 = _1090;
    }
    float _1092 = _966;
    float _1094 = -_926;
    float _1096 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _1098 = _1094 + _1096;
    float _1100 = abs(_366);
    bool _1102 = _1100 > 0.00999999977648258209228515625;
    float _1104 = fma(_726, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _1106 = _1102 ? _366 : 0.00999999977648258209228515625;
    float _1108 = _716 * 0.2820948064327239990234375;
    float _1110 = fma(_1104, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1112 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1114 = _1106 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _1116 = precise::max(0.0, _524);
    float _1118 = 0.0 + _274;
    float _1120 = precise::clamp(_1118, 0.0, 1.0);
    float _1122 = abs(_1110);
    float _1124 = log2(_1122);
    float _1126 = precise::max(_1114, -127.0);
    float _1128 = _870 * 0.4774648249149322509765625;
    float _1130 = precise::min(_1116, 0.100000001490116119384765625);
    float _1132 = _872 * 0.4774648249149322509765625;
    float _1134 = _724 * (-9.27999973297119140625);
    float _1136 = _866 * _1120;
    float _1138 = _714 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1140 = -_1126;
    float _1142 = exp2(_1140);
    float _1144 = _874 * 0.4774648249149322509765625;
    float _1146 = _1124 * 1.5;
    float _1148 = -_1112;
    float _1150 = exp2(_1148);
    float _1152 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1154 = _1152 + 1.0;
    float _1156 = exp2(_1146);
    float _1158 = 1.0 / _1126;
    float _1160 = _1156 * 12.56637096405029296875;
    float _1162 = -_1142;
    float _1164 = _1162 + 1.0;
    float _1166 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].y, _1154);
    float _1168 = _918 * 0.18672408163547515869140625;
    float _1170 = exp2(_1134);
    float _1172 = _1150 * _1164;
    float _1174 = fma(_1130, 10.0, -1.0);
    float _1176 = precise::max(_848, 0.25);
    float _1178 = fma(_912, 0.095146648585796356201171875, _1168);
    float _1180 = _1172 * _1158;
    float _1182 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1184 = fma(_1182, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1186 = _1098 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1188 = precise::clamp(_1186, 0.0, 1.0);
    float _1190 = 1.0 / _1160;
    float _1192 = -_1092;
    float _1194 = _1192 + 1.0;
    float _1196 = _1166 * (*spvDescriptorSet0.fp_c11)._m0[39].w;
    float _1198 = fma(_924, 0.0364394821226596832275390625, _1178);
    float _1200 = fma(_1188, _1194, _1092);
    float _1202 = _1176 + _1174;
    float _1204 = precise::min(_1196, (*spvDescriptorSet0.fp_c11)._m0[13].x);
    float _1206 = exp2(_1138);
    float _1208 = precise::max(_1198, 0.00999999977648258209228515625);
    float _1210 = fma(_272, 2.0, -0.5);
    float _1212 = precise::clamp(_1210, 0.0, 1.0);
    float _1214 = -_1204;
    float _1216 = _1214 + 1.0;
    float _1218 = _1108 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1220 = _1202 * 4.0;
    float _1222 = precise::clamp(_1220, 0.0, 1.0);
    float _1224 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].z, _1154);
    float _1226 = _1184 * _1190;
    float _1228 = _440 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1230 = _1212 * _1216;
    float _1232 = -(*spvDescriptorSet0.fp_c11)._m0[13].y;
    float _1234 = _1232 + (*spvDescriptorSet0.fp_c11)._m0[13].z;
    float _1236 = _1108 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1238 = _1180 * _1228;
    float _1240 = fma(_1128, (*spvDescriptorSet0.fp_c9)._m0[68].x, _1218);
    float _1242 = fma(_1230, _1234, (*spvDescriptorSet0.fp_c11)._m0[13].y);
    float _1244 = fma(_1132, (*spvDescriptorSet0.fp_c9)._m0[68].y, _1236);
    float _1246 = -_1238;
    float _1248 = exp2(_1246);
    float _1250 = _1136 * _1222;
    float _1252 = -_272;
    float _1254 = fma(_272, _1242, _1252);
    float _1256 = _1244 * 0.586610972881317138671875;
    float _1258 = _1108 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1260 = fma(_1250, _1254, _272);
    float _1262 = fma(_1240, 0.298911988735198974609375, _1256);
    float _1264 = 1.0 / _1208;
    float _1266 = fma(_1144, (*spvDescriptorSet0.fp_c9)._m0[68].z, _1258);
    float _1268 = -_1260;
    float _1270 = _1268 + 1.0;
    float _1272 = -_1206;
    float _1274 = _1272 + 1.0;
    float _1276 = fma(_1266, 0.114477999508380889892578125, _1262);
    float _1278 = _1270 * _1270;
    float _1280 = -_1248;
    float _1282 = _1280 + 1.0;
    float _1284 = fma(_1260, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1286 = _1274 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1288 = precise::min(_1278, _1170);
    float _1290 = _1224 + (-1.0);
    float _1292 = _1282 * _1226;
    float _1294 = fma(_1260, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1296 = _1276 * _1264;
    float _1298 = fma(_1270, _1288, _1284);
    float _1300 = fma(_1250, _1290, 1.0);
    float _1302 = precise::min(_1200, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1304 = fma(_1260, -0.572000026702880859375, 1.03999996185302734375);
    float _1306 = fma(_1298, 1.03999996185302734375, _1294);
    float _1308 = precise::clamp(_1306, 0.0, 1.0);
    float _1310 = precise::min(_1296, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1312 = _1302 * _1292;
    float _1314 = -_1286;
    float _1316 = _1314 + 1.0;
    float _1318 = fma(_1298, -1.03999996185302734375, _1304);
    float _1320 = precise::clamp(_1318, 0.0, 1.0);
    float _1322 = _1300 * _1308;
    float _1324 = _1310 * 0.31830990314483642578125;
    float _1326 = _1286 * _1248;
    float _1328 = _1248 * _1316;
    float _1330 = fma(_1320, 0.039999999105930328369140625, _1322);
    float _1332 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1334 = _440 + _1332;
    float _1336 = _1330 * _1324;
    float _1338 = _1312 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1340 = (*spvDescriptorSet0.fp_c11)._m0[35].x * 1.60000002384185791015625;
    float _1342 = _1334 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1344 = precise::clamp(_1342, 0.0, 1.0);
    float _1346 = _912 * _1336;
    float _1348 = _918 * _1336;
    float _1350 = _924 * _1336;
    float _1352 = _960 * _1340;
    float _1354 = _1312 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1356 = _1312 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1358 = _962 * _1340;
    float _1360 = _964 * _1340;
    float _1362 = fma(_860, _1326, _1338);
    float _1364 = fma(_862, _1326, _1354);
    float _1366 = precise::max(0.0, _1346);
    float _1368 = fma(_864, _1326, _1356);
    float _1370 = precise::max(0.0, _1352);
    float _1372 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1374 = _440 + _1372;
    float _1376 = precise::max(0.0, _1348);
    float _1378 = fma(_1328, _1366, _1362);
    float _1380 = precise::max(0.0, _1358);
    float _1382 = _1374 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1384 = precise::clamp(_1382, 0.0, 1.0);
    float _1386 = precise::max(0.0, _1360);
    float _1388 = _1328 * _1370;
    float _1390 = precise::max(0.0, _1350);
    float _1392 = fma(_1328, _1376, _1364);
    float _1394 = _1328 * _1380;
    float _1396 = _1328 * _1386;
    float _1398 = fma(_1384, _1388, _1378);
    float _1400 = fma(_1328, _1390, _1368);
    float _1402 = fma(_1344, _1388, _1378);
    float _1404 = fma(_1384, _1394, _1392);
    float _1406 = fma(_1344, _1394, _1392);
    float _1408 = fma(_1384, _1396, _1400);
    float _1410 = fma(_1344, _1396, _1400);
    out.m_79.x = _1398;
    out.m_79.y = _1404;
    out.m_79.z = _1408;
    out.m_79.w = 1.0;
    out.m_81.x = _1402;
    out.m_81.y = _1406;
    out.m_81.z = _1410;
    out.m_81.w = 1.0;
    return out;
}

