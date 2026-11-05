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
    texture2d_array<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    texture2d<float> fp_t_tcb_1C [[id(12)]];
    sampler fp_t_tcb_1CSmplr [[id(13)]];
    texture3d<float> fp_t_tcb_1E [[id(14)]];
    sampler fp_t_tcb_1ESmplr [[id(15)]];
    texture2d<float> fp_t_tcb_10 [[id(16)]];
    sampler fp_t_tcb_10Smplr [[id(17)]];
    texture2d<float> fp_t_tcb_E [[id(18)]];
    sampler fp_t_tcb_ESmplr [[id(19)]];
    texture2d<float> fp_t_tcb_12 [[id(20)]];
    sampler fp_t_tcb_12Smplr [[id(21)]];
    texture2d<float> fp_t_tcb_16 [[id(22)]];
    sampler fp_t_tcb_16Smplr [[id(23)]];
    texture2d_array<float> fp_t_tcb_14 [[id(24)]];
    sampler fp_t_tcb_14Smplr [[id(25)]];
    sampler fp_t_tcb_8Smplr_w [[id(26)]];
    sampler fp_t_tcb_ASmplr_w [[id(27)]];
    sampler fp_t_tcb_CSmplr_w [[id(28)]];
    sampler fp_t_tcb_1CSmplr_w [[id(29)]];
    sampler fp_t_tcb_1ESmplr_w [[id(30)]];
    sampler fp_t_tcb_10Smplr_w [[id(31)]];
    sampler fp_t_tcb_ESmplr_w [[id(32)]];
    sampler fp_t_tcb_12Smplr_w [[id(33)]];
    sampler fp_t_tcb_16Smplr_w [[id(34)]];
    sampler fp_t_tcb_14Smplr_w [[id(35)]];
    constant dm_border_t* dm_border [[id(36)]];
};

struct main0_out
{
    float4 m_79 [[color(0)]];
    float4 m_81 [[color(1)]];
};

struct main0_in
{
    float4 m_72 [[user(locn0)]];
    float4 m_68 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
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
    int _112 = _92 + 8;
    int _114 = _92 + 24;
    int _116 = _92 + 16;
    uint _118 = uint(int(uint(_112) >> uint(2)));
    float _120 = as_type<float>(_dmw0.z);
    int _122 = _112 + 4;
    uint _124 = uint(int(uint(_122) >> uint(2)));
    float _126 = as_type<float>(_dmw0.w);
    uint _128 = uint(int(uint(_116) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_128)];
    float _130 = as_type<float>(_dmw1.x);
    int _132 = _116 + 4;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw1.y);
    uint _138 = uint(int(uint(_114) >> uint(2)));
    float _140 = as_type<float>(_dmw1.z);
    int _142 = _114 + 4;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>(_dmw1.w);
    float _148 = gl_FragCoord.w;
    float _150 = in.m_68.z;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_68.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = 1.0 / _148;
    float _164 = _162 * _160;
    int _166 = as_type<int>(_110) << 6;
    int _168 = _166 + 25904;
    uint _170 = uint(int(uint(_168) >> uint(2)));
    uint _172 = uint(int(uint(int(_170)) >> uint(2)));
    int _174 = int(_170) & 3;
    float _176 = (*spvDescriptorSet0.fp_c9)._m0[int(_172)][_174];
    int _178 = int(_170) + 1;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    int _182 = _178 & 3;
    float _184 = (*spvDescriptorSet0.fp_c9)._m0[int(_180)][_182];
    int _186 = _166 + 25912;
    uint _188 = uint(int(uint(_186) >> uint(2)));
    uint _190 = uint(int(uint(int(_188)) >> uint(2)));
    int _192 = int(_188) & 3;
    float _194 = (*spvDescriptorSet0.fp_c9)._m0[int(_190)][_192];
    int _196 = int(_188) + 1;
    uint _198 = uint(int(uint(_196) >> uint(2)));
    int _200 = _196 & 3;
    float _202 = (*spvDescriptorSet0.fp_c9)._m0[int(_198)][_200];
    int _204 = _166 + 25920;
    uint _206 = uint(int(uint(_204) >> uint(2)));
    uint _208 = uint(int(uint(int(_206)) >> uint(2)));
    int _210 = int(_206) & 3;
    float _212 = (*spvDescriptorSet0.fp_c9)._m0[int(_208)][_210];
    int _214 = int(_206) + 1;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    int _218 = _214 & 3;
    float _220 = (*spvDescriptorSet0.fp_c9)._m0[int(_216)][_218];
    float _222 = _162 * _154;
    float _224 = fma(_222, _100, _120);
    float _226 = fma(_222, _130, _140);
    float _228 = fma(_164, _136, _146);
    float _230 = fma(_164, _106, _126);
    float _232 = _224 * _176;
    float _234 = _226 * _176;
    float _236 = _228 * _184;
    float _238 = _230 * _184;
    float _240 = _226 * _194;
    float _242 = _228 * _202;
    float2 _2003;
    _2003.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_234, _236));
    _2003.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_234, _236));
    float _244 = _2003.x;
    float _246 = _244 * 256.0;
    int _248 = int(_246);
    float2 _2014;
    _2014.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_232, _238));
    _2014.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_232, _238));
    float _250 = _2014.x;
    float _252 = _250 * 256.0;
    int _254 = int(_252);
    float _256 = _226 * _212;
    float _258 = _228 * _220;
    float2 _2030;
    _2030.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_240, _242));
    _2030.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_240, _242));
    float _260 = _2030.x;
    float _262 = _260 * 256.0;
    int _264 = int(_262);
    float2 _2040;
    _2040.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_256, _258));
    _2040.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_256, _258));
    float _266 = _2040.x;
    float _268 = _266 * 256.0;
    int _270 = int(_268);
    float _272 = in.m_70.z;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_70.x;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = _162 * _276;
    float _286 = _162 * _282;
    float _288 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _290 = _284 + _288;
    float _292 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _294 = _286 + _292;
    float _296 = _290 * _290;
    float _298 = fma(_294, _294, _296);
    float _300 = sqrt(_298);
    int _302 = _92 + 68;
    int _304 = _92 + 64;
    uint _306 = uint(int(uint(_302) >> uint(2)));
    float _308 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_306)]);
    float _310 = in.m_70.y;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _318 = _286 + _316;
    uint _320 = uint(int(uint(_304) >> uint(2)));
    float _322 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_320)]);
    bool _326 = _300 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _328 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _330 = _300 + _328;
    float _332 = as_type<float>(_302);
    float _334 = _330;
    float _336 = _282;
    if (_326)
    {
        float _338 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _332 = _338;
    }
    float _340 = _332;
    if (_326)
    {
        float _342 = _330 * _340;
        _334 = _342;
    }
    float _344 = _334;
    float _346 = 0.0;
    float _348 = _344;
    if (_326)
    {
        float _350 = _344 * 0.15915493667125701904296875;
        _346 = _350;
    }
    float _352 = _346;
    float _354 = _220;
    if (_326)
    {
        float _356 = _352 * 6.283185482025146484375;
        float _358 = cos(_356);
        _354 = _358;
    }
    float _360 = _354;
    float _362 = _340;
    if (_326)
    {
        float _364 = _352 * 6.283185482025146484375;
        float _366 = sin(_364);
        _362 = _366;
    }
    float _368 = _362;
    float _370 = _162 * _314;
    float _372 = 0.0;
    if (_326)
    {
        float _374 = rsqrt(_298);
        _372 = _374;
    }
    float _376 = _372;
    if (_326)
    {
        float _378 = _370 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _348 = _378;
    }
    float _380 = _348;
    float _382 = _380;
    if (_326)
    {
        float _384 = _360 + (-1.0);
        _336 = _384;
    }
    float _386 = _336;
    float _388 = 0.0;
    float _390 = _386;
    if (_326)
    {
        float _392 = _386 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _388 = _392;
    }
    float _394 = _388;
    float _396 = 0.0;
    float _398 = _368;
    if (_326)
    {
        float _400 = fma(_368, _380, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _396 = _400;
    }
    float _402 = _396;
    if (!_326)
    {
        _382 = _370;
    }
    float _404 = _382;
    float _406 = _404;
    if (_326)
    {
        float _408 = fma(_370, _360, _394);
        _406 = _408;
    }
    float _410 = _406;
    if (!_326)
    {
        _390 = _286;
    }
    float _412 = _390;
    float _414 = _376;
    float _416 = _412;
    if (_326)
    {
        float _418 = _376 * _402;
        _414 = _418;
    }
    float _420 = _414;
    float _422 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _424 = _410 + _422;
    float _426 = _424;
    if (!_326)
    {
        _398 = _284;
    }
    float _428 = _398;
    float _430 = _428;
    if (_326)
    {
        float _432 = fma(_294, _420, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _416 = _432;
    }
    float _434 = _416;
    if (_326)
    {
        float _436 = fma(_290, _420, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _430 = _436;
    }
    float _438 = _430;
    float _440 = _424 * _424;
    float _442 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _444 = _434 + _442;
    float _446 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _448 = _438 + _446;
    float _450 = fma(_444, _444, _440);
    float _452 = fma(_448, _448, _450);
    float _454 = rsqrt(_452);
    float _456 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _458 = _370 + _456;
    float _460 = _458 * _458;
    float _462 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _464 = _284 + _462;
    float _466 = fma(_318, _318, _460);
    float _468 = fma(_464, _464, _466);
    float _470 = _454 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _472 = _444 * _470;
    float _474 = _448 * _470;
    float _476 = sqrt(_468);
    float _478 = _472 * _472;
    float _480 = _474 * _474;
    float _482 = _478 + _480;
    float _484 = sqrt(_482);
    float _486 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _488 = fma(_476, (*spvDescriptorSet0.fp_c9)._m0[63].x, _486);
    float _490 = precise::clamp(_488, 0.0, 1.0);
    float _492 = -_490;
    float _494 = _492 + 1.0;
    float _496 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    bool _498 = _484 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _500 = abs(_494);
    float _502 = log2(_500);
    float _504 = precise::max(0.0, _496);
    float _506 = -_470;
    float _508 = -_504;
    float _510 = fma(_424, _506, _508);
    float _512 = _504;
    float _514 = _496;
    float _516 = _478;
    float _518 = _480;
    if (!_498)
    {
        _426 = _472;
    }
    float _520 = _426;
    float _522 = _520;
    if (!_498)
    {
        _512 = _510;
    }
    float _524 = _512;
    float _526 = _524;
    if (!_498)
    {
        _514 = _474;
    }
    float _528 = _514;
    bool _530 = !_498;
    float _532 = _528;
    if (!_530)
    {
        float _534 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _536 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _538 = _484 + _536;
        float _540 = _510 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _542 = rsqrt(_482);
        float _544 = _538 * _534;
        float _546 = _544 * 0.15915493667125701904296875;
        float _548 = _546 * 6.283185482025146484375;
        float _550 = sin(_548);
        float _552 = _546 * 6.283185482025146484375;
        float _554 = cos(_552);
        float _556 = fma(_550, _540, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _558 = _542 * _556;
        float _560 = _554 + (-1.0);
        float _562 = _472 * _558;
        float _564 = _560 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _566 = _474 * _558;
        float _568 = fma(_510, _554, _564);
        float _570 = _562 * _562;
        float _572 = _566 * _566;
        _526 = _568;
        _516 = _570;
        _518 = _572;
        _522 = _562;
        _532 = _566;
    }
    float _574 = _526;
    float _576 = _516;
    float _578 = _518;
    float _580 = _522;
    float _582 = _532;
    float _584 = fma(_574, _574, _576);
    int _586 = _166 + 25936;
    uint _588 = uint(int(uint(_586) >> uint(2)));
    uint _590 = uint(int(uint(int(_588)) >> uint(2)));
    int _592 = int(_588) & 3;
    float _594 = (*spvDescriptorSet0.fp_c9)._m0[int(_590)][_592];
    int _596 = int(_588) + 1;
    uint _598 = uint(int(uint(_596) >> uint(2)));
    int _600 = _596 & 3;
    float _602 = (*spvDescriptorSet0.fp_c9)._m0[int(_598)][_600];
    float _604 = _584 + _578;
    float _606 = _502 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    int _608 = _166 + 25944;
    uint _610 = uint(int(uint(_608) >> uint(2)));
    uint _612 = uint(int(uint(int(_610)) >> uint(2)));
    int _614 = int(_610) & 3;
    float _616 = (*spvDescriptorSet0.fp_c9)._m0[int(_612)][_614];
    float _618 = rsqrt(_604);
    float _620 = float(uint(_248));
    float _622 = float(uint(_264));
    float _624 = float(uint(_270));
    float _626 = exp2(_606);
    int _628 = _166 + 25952;
    uint _630 = uint(int(uint(_628) >> uint(2)));
    uint _632 = uint(int(uint(int(_630)) >> uint(2)));
    int _634 = int(_630) & 3;
    float _636 = (*spvDescriptorSet0.fp_c9)._m0[int(_632)][_634];
    float _638 = precise::max(_308, _602);
    float _640 = _618 * _580;
    float _642 = _618 * _574;
    float _644 = _618 * _582;
    float _646 = precise::max(_308, _594);
    float _648 = _640 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _650 = precise::max(_322, _594);
    float _652 = _642 + 1.0;
    float _654 = precise::max(_308, _616);
    float _656 = -_648;
    float _658 = fma(_642, (*spvDescriptorSet0.fp_c9)._m0[69].y, _656);
    float _660 = in.m_72.y;
    float _662 = gl_FragCoord.w;
    float _664 = _660 * _662;
    float _666 = -_642;
    float _668 = fma(_626, _652, _666);
    float _670 = _286 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _672 = -_644;
    float _674 = fma(_672, (*spvDescriptorSet0.fp_c9)._m0[69].z, _658);
    float _676 = _284 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _678 = in.m_72.x;
    float _680 = gl_FragCoord.w;
    float _682 = _678 * _680;
    float _684 = _670 * (*spvDescriptorSet0.fp_c11)._m0[30].x;
    float _686 = fma(_674, -0.5, 0.5);
    float _688 = fma(_674, 0.5, 0.5);
    float _690 = _370 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _692 = fma(_684, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].x);
    float _694 = float(uint(_254));
    float _696 = fma(_688, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _698 = sqrt(_686);
    float _700 = _620 * 0.00390625;
    float _702 = _676 * (*spvDescriptorSet0.fp_c11)._m0[30].z;
    float _704 = fma(_688, _696, -0.212114393711090087890625);
    float _706 = _690 * (*spvDescriptorSet0.fp_c11)._m0[30].y;
    float _708 = fma(_702, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].z);
    float _710 = fma(_688, _704, 1.570728778839111328125);
    float _712 = _694 * 0.00390625;
    float _714 = precise::max(_646, _700);
    float _716 = _622 * 0.00390625;
    float _718 = _624 * 0.00390625;
    float _720 = fma(_706, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].y);
    float _722 = precise::max(_650, _712);
    float _724 = rint(_636);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    uint _730 = clamp(_728, 0u, 65535u);
    float _732 = precise::max(_638, _716);
    float _734 = _698 * 0.636619746685028076171875;
    float _736 = precise::max(_654, _718);
    float _738 = _162 * _664;
    float _740 = -_710;
    float _742 = fma(_734, _740, 1.0);
    float _744 = _162 * _682;
    float _746 = fma(_668, 0.5, 0.5);
    float _748 = fma(_286, 6.2500002968590706586837768554688e-05, 0.5);
    float _750 = precise::clamp(_748, 0.0, 1.0);
    float _752 = fma(_284, 6.2500002968590706586837768554688e-05, 0.5);
    float _754 = precise::clamp(_752, 0.0, 1.0);
    float2 _2789 = float2(_750, _754);
    float _756 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2789, float2(0.0), isnan(_2789))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2789, float2(0.0), isnan(_2789))).x;
    float3 _2800 = float3(_692, _720, _708);
    float _758 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_2800, float3(0.0), isnan(_2800))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_2800, float3(0.0), isnan(_2800))).x;
    float2 _2810 = float2(_744, _738);
    float _760 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2810, float2(0.0), isnan(_2810))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2810, float2(0.0), isnan(_2810))).x;
    float2 _2818 = float2(_744, _738);
    float3 _764 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2818, float2(0.0), isnan(_2818))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2818, float2(0.0), isnan(_2818))).xyz;
    float _766 = _764.x;
    float _768 = _764.y;
    float _770 = _764.z;
    float2 _2832 = float2(_744, _738);
    float3 _772 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2832, float2(0.0), isnan(_2832))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2832, float2(0.0), isnan(_2832))).xyz;
    float _774 = _772.x;
    float _776 = _772.y;
    float _778 = _772.z;
    float2 _2846 = float2(_742, _746);
    float3 _780 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2846, float2(0.0), isnan(_2846))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2846, float2(0.0), isnan(_2846))).xyz;
    float _782 = _780.x;
    float _784 = _780.y;
    float _786 = _780.z;
    float3 _2863 = float3(_234, _236, float(int(_730)));
    float3 _2865 = select(_2863, float3(0.0), isnan(_2863));
    float2 _790 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2865.xy, uint(rint(_2865.z)), level(_714)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2865.xy, uint(rint(_2865.z)), level(_714)).yz;
    float _792 = _790.x;
    float _794 = _790.y;
    float3 _2879 = float3(_232, _238, float(int(_730)));
    float3 _2881 = select(_2879, float3(0.0), isnan(_2879));
    float _796 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2881.xy, uint(rint(_2881.z)), level(_722)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2881.xy, uint(rint(_2881.z)), level(_722)).x;
    float3 _2891 = float3(_240, _242, float(int(_730)));
    float3 _2893 = select(_2891, float3(0.0), isnan(_2891));
    float3 _798 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2893.xy, uint(rint(_2893.z)), level(_732)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2893.xy, uint(rint(_2893.z)), level(_732)).xyz;
    float _800 = _798.x;
    float _802 = _798.y;
    float _804 = _798.z;
    float3 _2909 = float3(_256, _258, float(int(_730)));
    float3 _2911 = select(_2909, float3(0.0), isnan(_2909));
    float3 _806 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2911.xy, uint(rint(_2911.z)), level(_736)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2911.xy, uint(rint(_2911.z)), level(_736)).xyz;
    float _808 = _806.x;
    float _810 = _806.y;
    float _812 = _806.z;
    float _814 = in.m_74.y;
    float _816 = gl_FragCoord.w;
    float _818 = _814 * _816;
    float _820 = in.m_74.x;
    float _822 = gl_FragCoord.w;
    float _824 = _820 * _822;
    float _826 = _370 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _828 = in.m_74.z;
    float _830 = gl_FragCoord.w;
    float _832 = _828 * _830;
    float _834 = _370 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _836 = abs(_458);
    bool _838 = _836 > 0.00999999977648258209228515625;
    float _840 = fma(_286, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _826);
    float _842 = fma(_286, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _834);
    float _844 = fma(_284, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _840);
    float _846 = fma(_284, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _842);
    float _848 = _844 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _850 = _846 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _852 = trunc(_848);
    int _854 = int(_852);
    float _856 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _858 = _856 + 1.0;
    float _860 = trunc(_850);
    int _862 = int(_860);
    float _864 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].x, _858);
    float _866 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].y, _858);
    float _868 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].z, _858);
    float _870 = _162 * _818;
    float _872 = _162 * _824;
    int _874 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _876 = _854 + _874;
    int _878 = _876 + 1;
    float _880 = _162 * _832;
    float _882 = _870 * _870;
    bool _884 = _878 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    float _886 = fma(_872, _872, _882);
    int _888 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _890 = _862 + _888;
    int _892 = _890 + 1;
    float _894 = fma(_880, _880, _886);
    int _896 = _878 | _892;
    bool _898 = _896 < 0;
    bool _900 = _898 || _884;
    float _902 = rsqrt(_894);
    float _904 = _838 ? _458 : 0.00999999977648258209228515625;
    bool _906 = _892 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _908 = _906 || _900;
    float _910 = _904 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _912 = precise::max(_910, -127.0);
    float _914 = _872 * _902;
    float _916 = _870 * _902;
    float _918 = _880 * _902;
    float _920 = _902;
    if (_908)
    {
        _920 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _922 = _920;
    float _924 = _922;
    if (!_908)
    {
        int _926 = _892 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _928 = _926 + _878;
        float _930 = floor(_848);
        int _932 = _928 << 2;
        int _934 = _928 >> 2;
        int _936 = 12 & _932;
        int _938 = _934 << 4;
        int _940 = _938 + _936;
        float _942 = floor(_850);
        int _944 = _940 + 16256;
        uint _946 = uint(int(uint(_944) >> uint(2)));
        uint _948 = uint(int(uint(int(_946)) >> uint(2)));
        int _950 = int(_946) & 3;
        float _952 = (*spvDescriptorSet0.fp_c9)._m0[int(_948)][_950];
        float _954 = -_930;
        float _956 = _848 + _954;
        float _958 = -_942;
        float _960 = _850 + _958;
        float _962 = rint(_952);
        float _964 = precise::max(_962, 0.0);
        uint _966 = uint(_964);
        uint _968 = clamp(_966, 0u, 65535u);
        float3 _3176 = float3(_956, _960, float(int(_968)));
        float3 _3178 = select(_3176, float3(0.0), isnan(_3176));
        float _970 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, _3178.xy, uint(rint(_3178.z))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, _3178.xy, uint(rint(_3178.z))).x;
        int _972 = _928 << 4;
        int _974 = _972 + 17904;
        int _976 = _940 + 24304;
        uint _978 = uint(int(uint(_976) >> uint(2)));
        uint _980 = uint(int(uint(int(_978)) >> uint(2)));
        int _982 = int(_978) & 3;
        float _984 = (*spvDescriptorSet0.fp_c9)._m0[int(_980)][_982];
        uint _986 = uint(int(uint(_974) >> uint(2)));
        uint _988 = uint(int(uint(int(_986)) >> uint(2)));
        int _990 = int(_986) & 3;
        float _992 = (*spvDescriptorSet0.fp_c9)._m0[int(_988)][_990];
        int _994 = int(_986) + 1;
        uint _996 = uint(int(uint(_994) >> uint(2)));
        int _998 = _994 & 3;
        float _1000 = (*spvDescriptorSet0.fp_c9)._m0[int(_996)][_998];
        int _1002 = _974 + 8;
        uint _1004 = uint(int(uint(_1002) >> uint(2)));
        uint _1006 = uint(int(uint(int(_1004)) >> uint(2)));
        int _1008 = int(_1004) & 3;
        float _1010 = (*spvDescriptorSet0.fp_c9)._m0[int(_1006)][_1008];
        int _1012 = int(_1004) + 1;
        uint _1014 = uint(int(uint(_1012) >> uint(2)));
        int _1016 = _1012 & 3;
        float _1018 = (*spvDescriptorSet0.fp_c9)._m0[int(_1014)][_1016];
        float _1020 = _370 * _1000;
        float _1022 = fma(_286, _992, _1020);
        float _1024 = 1.0 / _984;
        float _1026 = fma(_284, _1010, _1022);
        float _1028 = _1026 + _1018;
        float _1030 = precise::clamp(_1028, 0.0, 1.0);
        float _1032 = -_1030;
        float _1034 = _1032 + _970;
        float _1036 = _984 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _1038 = fma(_1024, (*spvDescriptorSet0.fp_c13)._m0[4].w, _1034);
        float _1040 = _1036 * _1038;
        float _1042 = exp2(_1040);
        float _1044 = 0.0 + _1042;
        float _1046 = precise::clamp(_1044, 0.0, 1.0);
        float _1048 = precise::min(_1046, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _924 = _1048;
    }
    float _1050 = _924;
    float _1052 = spvFAdd(_476, 9.9999997473787516355514526367188e-06);
    float _1054 = -_912;
    float _1056 = exp2(_1054);
    float _1058 = fma(_916, 0.5, 0.5);
    float _1060 = _916 * _916;
    float _1062 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1064 = 1.0 / _1052;
    float _1066 = -(*spvDescriptorSet0.fp_c9)._m0[1001].y;
    float _1068 = _1066 + (*spvDescriptorSet0.fp_c9)._m0[1000].y;
    float _1070 = -(*spvDescriptorSet0.fp_c9)._m0[1001].z;
    float _1072 = _1070 + (*spvDescriptorSet0.fp_c9)._m0[1000].z;
    float _1074 = -(*spvDescriptorSet0.fp_c9)._m0[1001].x;
    float _1076 = _1074 + (*spvDescriptorSet0.fp_c9)._m0[1000].x;
    float _1078 = -(*spvDescriptorSet0.fp_c9)._m0[1007].x;
    float _1080 = _1078 + (*spvDescriptorSet0.fp_c9)._m0[1006].x;
    float _1082 = -(*spvDescriptorSet0.fp_c9)._m0[1007].y;
    float _1084 = _1082 + (*spvDescriptorSet0.fp_c9)._m0[1006].y;
    float _1086 = -_1062;
    float _1088 = exp2(_1086);
    float _1090 = -(*spvDescriptorSet0.fp_c9)._m0[1007].z;
    float _1092 = _1090 + (*spvDescriptorSet0.fp_c9)._m0[1006].z;
    float _1094 = fma(_1058, _1068, (*spvDescriptorSet0.fp_c9)._m0[1001].y);
    float _1096 = fma(_1058, _1072, (*spvDescriptorSet0.fp_c9)._m0[1001].z);
    float _1098 = fma(_1058, _1076, (*spvDescriptorSet0.fp_c9)._m0[1001].x);
    float _1100 = fma(_1058, _1080, (*spvDescriptorSet0.fp_c9)._m0[1007].x);
    float _1102 = fma(_1058, _1084, (*spvDescriptorSet0.fp_c9)._m0[1007].y);
    float _1104 = _458 * _1064;
    float _1106 = fma(_1058, _1092, (*spvDescriptorSet0.fp_c9)._m0[1007].z);
    float _1108 = -_1056;
    float _1110 = _1108 + 1.0;
    float _1112 = _318 * _1064;
    float _1114 = _464 * _1064;
    float _1116 = _1104 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _1118 = fma(_914, _914, _1060);
    float _1120 = 1.0 / _912;
    float _1122 = fma(_1112, (*spvDescriptorSet0.fp_c9)._m0[69].x, _1116);
    float _1124 = _1088 * _1110;
    float _1126 = _914 * _1112;
    float _1128 = fma(_918, _918, _1118);
    float _1130 = precise::clamp(_1128, 0.0, 1.0);
    float _1132 = fma(_1114, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1122);
    float _1134 = _1098 * 0.31830990314483642578125;
    float _1136 = -_1104;
    float _1138 = -_1126;
    float _1140 = fma(_916, _1136, _1138);
    float _1142 = _1104 + (*spvDescriptorSet0.fp_c9)._m0[67].y;
    float _1144 = fma(_1132, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _1146 = _914 * (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _1148 = _1112 + (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _1150 = _1142 * _1142;
    float _1152 = fma(_1144, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1154 = fma(_1130, 0.5, 0.5);
    float _1156 = -_916;
    float _1158 = -_1146;
    float _1160 = fma(_1156, (*spvDescriptorSet0.fp_c9)._m0[67].y, _1158);
    float _1162 = fma(_1148, _1148, _1150);
    float _1164 = _1114 + (*spvDescriptorSet0.fp_c9)._m0[67].z;
    float _1166 = -_1114;
    float _1168 = fma(_918, _1166, _1140);
    float _1170 = precise::clamp(_1168, 0.0, 1.0);
    float _1172 = abs(_1152);
    float _1174 = log2(_1172);
    float _1176 = -_918;
    float _1178 = fma(_1176, (*spvDescriptorSet0.fp_c9)._m0[67].z, _1160);
    float _1180 = precise::clamp(_1178, 0.0, 1.0);
    float _1182 = fma(_1164, _1164, _1162);
    float _1184 = _1102 * 0.715200006961822509765625;
    float _1186 = in.m_76.w;
    float _1188 = gl_FragCoord.w;
    float _1190 = _1186 * _1188;
    float _1192 = -_1180;
    float _1194 = _1192 + 1.0;
    float _1196 = _1124 * _1120;
    float _1198 = fma(_1100, 0.2125999927520751953125, _1184);
    float _1200 = rsqrt(_1182);
    float _1202 = _1194 * _1194;
    float _1204 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1206 = fma(_1204, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1208 = fma(_1106, 0.072200000286102294921875, _1198);
    float _1210 = _800 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1212 = _1202 * _1202;
    float _1214 = _802 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1216 = _1094 * 0.31830990314483642578125;
    float _1218 = _1174 * 1.5;
    float _1220 = 1.0 / _1208;
    float _1222 = _1194 * _1212;
    float _1224 = _1096 * 0.31830990314483642578125;
    float _1226 = _804 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1228 = precise::max(_1210, _1134);
    float _1230 = _866 * (*spvDescriptorSet0.fp_c11)._m0[39].w;
    float _1232 = precise::max(_1214, _1216);
    float _1234 = _1142 * _1200;
    float _1236 = exp2(_1218);
    float _1238 = _476 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1240 = _1164 * _1200;
    float _1242 = _1148 * _1200;
    float _1244 = _1234 * (*spvDescriptorSet0.fp_c9)._m0[67].y;
    float _1246 = _1196 * _1238;
    float _1248 = _792 + (*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1250 = precise::clamp(_1248, 0.0, 1.0);
    float _1252 = _1220 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1254 = precise::clamp(_1252, 0.0, 1.0);
    float _1256 = fma(_1242, (*spvDescriptorSet0.fp_c9)._m0[67].x, _1244);
    float _1258 = precise::max(0.0, _916);
    float _1260 = -_1246;
    float _1262 = exp2(_1260);
    float _1264 = fma(_1254, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _1266 = _162 * _1190;
    float _1268 = _810 * 0.4774648249149322509765625;
    float _1270 = precise::max(_1226, _1224);
    float _1272 = _1236 * 12.56637096405029296875;
    float _1274 = _1264 * 0.31830990314483642578125;
    float _1276 = -_1266;
    float _1278 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _1280 = _1276 + _1278;
    float _1282 = _1250 * _1228;
    float _1284 = _1102 * _1274;
    float _1286 = 1.0 / _1272;
    float _1288 = _1106 * _1274;
    float _1290 = _1280 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1292 = precise::clamp(_1290, 0.0, 1.0);
    float _1294 = -_1050;
    float _1296 = _1294 + 1.0;
    float _1298 = _1100 * _1274;
    float _1300 = _808 * 0.4774648249149322509765625;
    float _1302 = fma(_1292, _1296, _1050);
    float _1304 = precise::min(_1258, 0.100000001490116119384765625);
    float _1306 = -_1170;
    float _1308 = _1306 + 1.0;
    float _1310 = -_1262;
    float _1312 = _1310 + 1.0;
    float _1314 = precise::min(_1230, (*spvDescriptorSet0.fp_c11)._m0[13].x);
    float _1316 = _1250 * _1232;
    float _1318 = _1308 * _1308;
    float _1320 = fma(_1304, 10.0, -1.0);
    float _1322 = _1250 * _1270;
    float _1324 = _1206 * _1286;
    float _1326 = precise::min(_1302, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1328 = fma(_1240, (*spvDescriptorSet0.fp_c9)._m0[67].z, _1256);
    float _1330 = precise::clamp(_1328, 0.0, 1.0);
    float _1332 = in.m_76.x;
    float _1334 = gl_FragCoord.w;
    float _1336 = _1332 * _1334;
    float _1338 = _1312 * _1324;
    float _1340 = precise::max(_758, 0.25);
    float _1342 = _1318 * _1318;
    float _1344 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1346 = in.m_76.y;
    float _1348 = gl_FragCoord.w;
    float _1350 = _1346 * _1348;
    float _1352 = _1326 * _1338;
    float _1354 = _1340 + _1320;
    float _1356 = _1308 * _1342;
    float _1358 = in.m_76.z;
    float _1360 = gl_FragCoord.w;
    float _1362 = _1358 * _1360;
    float _1364 = _502 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1366 = _1268 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1368 = _1354 * 4.0;
    float _1370 = precise::clamp(_1368, 0.0, 1.0);
    float _1372 = 0.0 + _756;
    float _1374 = precise::clamp(_1372, 0.0, 1.0);
    float _1376 = _1300 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1378 = -_1314;
    float _1380 = _1378 + 1.0;
    float _1382 = fma(_760, 2.0, -0.5);
    float _1384 = precise::clamp(_1382, 0.0, 1.0);
    float _1386 = _796 * _1374;
    float _1388 = fma(_794, _1344, _1366);
    float _1390 = _1170 * (-9.27999973297119140625);
    float _1392 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1394 = _812 * 0.4774648249149322509765625;
    float _1396 = -(*spvDescriptorSet0.fp_c11)._m0[13].y;
    float _1398 = _1396 + (*spvDescriptorSet0.fp_c11)._m0[13].z;
    float _1400 = _1384 * _1380;
    float _1402 = _1388 * 0.586610972881317138671875;
    float _1404 = fma(_794, _1392, _1376);
    float _1406 = _1394 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1408 = fma(_1400, _1398, (*spvDescriptorSet0.fp_c11)._m0[13].y);
    float _1410 = _1386 * _1370;
    float _1412 = fma(_1404, 0.298911988735198974609375, _1402);
    float _1414 = _162 * _1336;
    float _1416 = -_760;
    float _1418 = fma(_760, _1408, _1416);
    float _1420 = precise::max(_1376, _1298);
    float _1422 = exp2(_1364);
    float _1424 = _162 * _1350;
    float _1426 = fma(_1410, _1418, _760);
    float _1428 = fma(_794, _1392, _1420);
    float _1430 = precise::min(_1154, 1.0);
    float _1432 = _162 * _1362;
    float _1434 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1436 = _1424 * 0.18672408163547515869140625;
    float _1438 = -_1426;
    float _1440 = _1438 + 1.0;
    float _1442 = fma(_1426, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1444 = fma(_794, _1434, _1406);
    float _1446 = fma(_1414, 0.095146648585796356201171875, _1436);
    float _1448 = exp2(_1390);
    float _1450 = fma(_1444, 0.114477999508380889892578125, _1412);
    float _1452 = fma(_1432, 0.0364394821226596832275390625, _1446);
    float _1454 = precise::max(_1366, _1284);
    float _1456 = -_1422;
    float _1458 = _1456 + 1.0;
    float _1460 = precise::max(_1406, _1288);
    float _1462 = precise::max(_1452, 0.00999999977648258209228515625);
    float _1464 = _1440 * _1440;
    float _1466 = fma(_794, _1344, _1454);
    float _1468 = fma(_794, _1434, _1460);
    float _1470 = 1.0 / _1462;
    float _1472 = _1458 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1474 = precise::min(_1464, _1448);
    float _1476 = (*spvDescriptorSet0.fp_c11)._m0[46].y * 16.0;
    float _1478 = precise::clamp(_1476, 0.0, 1.0);
    float _1480 = (*spvDescriptorSet0.fp_c11)._m0[46].y * 0.319999992847442626953125;
    float _1482 = -_1472;
    float _1484 = _1482 + 1.0;
    float _1486 = _1472 * _1262;
    float _1488 = fma(_1440, _1474, _1442);
    float _1490 = fma(_1426, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1492 = -_1478;
    float _1494 = fma(_1478, _868, _1492);
    float _1496 = fma(_1426, -0.572000026702880859375, 1.03999996185302734375);
    float _1498 = fma(_1488, 1.03999996185302734375, _1490);
    float _1500 = precise::clamp(_1498, 0.0, 1.0);
    float _1502 = _1330 * _1330;
    float _1504 = fma(_1410, _1494, _1478);
    float _1506 = _1450 * _1470;
    float _1508 = -_864;
    float _1510 = fma(_1508, (*spvDescriptorSet0.fp_c11)._m0[36].z, 1.0);
    float _1512 = _1426 * _1502;
    float _1514 = _1512 * 2.0;
    float _1516 = fma(_1384, -0.449999988079071044921875, 1.0);
    float _1518 = fma(_1488, -1.03999996185302734375, _1496);
    float _1520 = precise::clamp(_1518, 0.0, 1.0);
    float _1522 = precise::min(_1506, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1524 = _1504 * _1500;
    float _1526 = _776 * 0.715200006961822509765625;
    float _1528 = fma(_1426, 0.5, _1514);
    float _1530 = fma(_1520, _1480, _1524);
    float _1532 = _1522 * 0.31830990314483642578125;
    float _1534 = fma(_774, 0.2125999927520751953125, _1526);
    float _1536 = _1528 + (-1.0);
    float _1538 = fma(_1426, -0.337748348712921142578125, 1.0);
    float _1540 = _1530 * _1532;
    float _1542 = fma(_778, 0.072200000286102294921875, _1534);
    float _1544 = fma(_1222, _1536, 1.0);
    float _1546 = fma(_1356, _1536, 1.0);
    float _1548 = _1414 * _1540;
    float _1550 = _1424 * _1540;
    float _1552 = _1432 * _1540;
    float _1554 = _766 * _1516;
    float _1556 = precise::max(0.0, _1510);
    float _1558 = 1.0 / _1542;
    float _1560 = _1544 * _1546;
    float _1562 = _768 * _1516;
    float _1564 = -_1554;
    float _1566 = _766 + _1564;
    float _1568 = _770 * _1516;
    float _1570 = _1538 * _1560;
    float _1572 = -_1562;
    float _1574 = _768 + _1572;
    float _1576 = fma(_1556, _1566, _1554);
    float _1578 = -_1568;
    float _1580 = _770 + _1578;
    float _1582 = _1180 * _1570;
    float _1584 = fma(_1556, _1574, _1562);
    float _1586 = -_766;
    float _1588 = _1586 + _1576;
    float _1590 = fma(_1556, _1580, _1568);
    float _1592 = _1582 * 0.31830990314483642578125;
    float _1594 = -_768;
    float _1596 = _1594 + _1584;
    float _1598 = fma(_1410, _1588, _766);
    float _1600 = _1558 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1602 = precise::clamp(_1600, 0.0, 1.0);
    float _1604 = _1592 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1606 = fma(_1410, _1596, _768);
    float _1608 = -_770;
    float _1610 = _1608 + _1590;
    float _1612 = _1592 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1614 = fma(_1602, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _1616 = _1598 * _1604;
    float _1618 = fma(_1410, _1610, _770);
    float _1620 = _1606 * _1612;
    float _1622 = _1614 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1624 = fma(_796, _1616, _1548);
    float _1626 = _1598 * _1430;
    float _1628 = _1592 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1630 = _1618 * _1468;
    float _1632 = _774 * _1622;
    float _1634 = _776 * _1622;
    float _1636 = _778 * _1622;
    float _1638 = fma(_1428, _1626, _1624);
    float _1640 = _1352 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1642 = _1618 * _1628;
    float _1644 = fma(_796, _1620, _1550);
    float _1646 = _1606 * _1430;
    float _1648 = fma(_782, _1486, _1640);
    float _1650 = precise::max(0.0, _1638);
    float _1652 = _1262 * _1484;
    float _1654 = _1322 * _1618;
    float _1656 = fma(_796, _1642, _1552);
    float _1658 = fma(_1282, _1626, _1632);
    float _1660 = _1352 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1662 = _1352 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1664 = fma(_1466, _1646, _1644);
    float _1666 = fma(_1316, _1646, _1634);
    float _1668 = fma(_1430, _1630, _1656);
    float _1670 = fma(_1430, _1654, _1636);
    float _1672 = fma(_784, _1486, _1660);
    float _1674 = fma(_1652, _1650, _1648);
    float _1676 = fma(_786, _1486, _1662);
    float _1678 = precise::max(0.0, _1658);
    float _1680 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1682 = _476 + _1680;
    float _1684 = precise::max(0.0, _1664);
    float _1686 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1688 = _476 + _1686;
    float _1690 = precise::max(0.0, _1666);
    float _1692 = _1682 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1694 = precise::clamp(_1692, 0.0, 1.0);
    float _1696 = precise::max(0.0, _1670);
    float _1698 = _1652 * _1678;
    float _1700 = precise::max(0.0, _1668);
    float _1702 = _1688 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1704 = precise::clamp(_1702, 0.0, 1.0);
    float _1706 = fma(_1652, _1684, _1672);
    float _1708 = _1652 * _1690;
    float _1710 = _1652 * _1696;
    float _1712 = fma(_1652, _1700, _1676);
    float _1714 = fma(_1694, _1698, _1674);
    float _1716 = fma(_1704, _1698, _1674);
    float _1718 = fma(_1694, _1708, _1706);
    float _1720 = fma(_1704, _1708, _1706);
    float _1722 = fma(_1694, _1710, _1712);
    float _1724 = fma(_1704, _1710, _1712);
    out.m_79.x = _1714;
    out.m_79.y = _1718;
    out.m_79.z = _1722;
    out.m_79.w = 1.0;
    out.m_81.x = _1716;
    out.m_81.y = _1720;
    out.m_81.z = _1724;
    out.m_81.w = 1.0;
    return out;
}

