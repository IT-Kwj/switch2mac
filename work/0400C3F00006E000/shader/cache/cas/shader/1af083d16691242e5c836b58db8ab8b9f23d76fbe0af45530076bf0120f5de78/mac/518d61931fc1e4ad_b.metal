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
    texture3d<float> fp_t_tcb_1A [[id(12)]];
    sampler fp_t_tcb_1ASmplr [[id(13)]];
    texture2d<float> fp_t_tcb_18 [[id(14)]];
    sampler fp_t_tcb_18Smplr [[id(15)]];
    texture2d<float> fp_t_tcb_12 [[id(16)]];
    sampler fp_t_tcb_12Smplr [[id(17)]];
    texture2d<float> fp_t_tcb_E [[id(18)]];
    sampler fp_t_tcb_ESmplr [[id(19)]];
    texture2d_array<float> fp_t_tcb_10 [[id(20)]];
    sampler fp_t_tcb_10Smplr [[id(21)]];
    sampler fp_t_tcb_8Smplr_w [[id(22)]];
    sampler fp_t_tcb_ASmplr_w [[id(23)]];
    sampler fp_t_tcb_CSmplr_w [[id(24)]];
    sampler fp_t_tcb_1ASmplr_w [[id(25)]];
    sampler fp_t_tcb_18Smplr_w [[id(26)]];
    sampler fp_t_tcb_12Smplr_w [[id(27)]];
    sampler fp_t_tcb_ESmplr_w [[id(28)]];
    sampler fp_t_tcb_10Smplr_w [[id(29)]];
    constant dm_border_t* dm_border [[id(30)]];
};

struct main0_out
{
    float4 m_75 [[color(0)]];
    float4 m_77 [[color(1)]];
};

struct main0_in
{
    float4 m_64 [[user(locn4)]];
    float4 m_68 [[user(locn6)]];
    float4 m_66 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _84 = as_type<int>((*spvDescriptorSet0.fp_c7)._m0[11].z) * as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].z);
    int _86 = _84 + as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].w);
    int _88 = _86 * 96;
    int _90 = _88 + 80;
    uint _93 = uint(int(uint(_88) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_93)];
    float _96 = as_type<float>(_dmw0.x);
    int _98 = _88 + 4;
    uint _100 = uint(int(uint(_98) >> uint(2)));
    float _102 = as_type<float>(_dmw0.y);
    uint _104 = uint(int(uint(_90) >> uint(2)));
    float _106 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_104)]);
    int _108 = _88 + 16;
    int _110 = _88 + 24;
    uint _112 = uint(int(uint(_108) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_112)];
    float _114 = as_type<float>(_dmw1.x);
    int _116 = _108 + 4;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>(_dmw1.y);
    uint _122 = uint(int(uint(_110) >> uint(2)));
    float _124 = as_type<float>(_dmw1.z);
    int _126 = _110 + 4;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    float _130 = as_type<float>(_dmw1.w);
    int _132 = _88 + 8;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw0.z);
    int _138 = _132 + 4;
    uint _140 = uint(int(uint(_138) >> uint(2)));
    float _142 = as_type<float>(_dmw0.w);
    float _144 = gl_FragCoord.w;
    float _146 = in.m_64.z;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_64.w;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = 1.0 / _144;
    float _160 = _158 * _156;
    int _162 = as_type<int>(_106) << 6;
    int _164 = _162 + 25904;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    uint _168 = uint(int(uint(int(_166)) >> uint(2)));
    int _170 = int(_166) & 3;
    float _172 = (*spvDescriptorSet0.fp_c9)._m0[int(_168)][_170];
    int _174 = int(_166) + 1;
    uint _176 = uint(int(uint(_174) >> uint(2)));
    int _178 = _174 & 3;
    float _180 = (*spvDescriptorSet0.fp_c9)._m0[int(_176)][_178];
    float _182 = _158 * _150;
    float _184 = fma(_182, _114, _124);
    float _186 = fma(_160, _120, _130);
    float _188 = _184 * _172;
    float _190 = _186 * _180;
    float2 _1692;
    _1692.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_188, _190));
    _1692.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_188, _190));
    float _192 = _1692.x;
    float _194 = _192 * 256.0;
    int _196 = int(_194);
    float _198 = in.m_66.z;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_66.x;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_66.y;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    int _216 = _162 + 25912;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    uint _220 = uint(int(uint(int(_218)) >> uint(2)));
    int _222 = int(_218) & 3;
    float _224 = (*spvDescriptorSet0.fp_c9)._m0[int(_220)][_222];
    int _226 = int(_218) + 1;
    uint _228 = uint(int(uint(_226) >> uint(2)));
    int _230 = _226 & 3;
    float _232 = (*spvDescriptorSet0.fp_c9)._m0[int(_228)][_230];
    int _234 = _162 + 25920;
    uint _236 = uint(int(uint(_234) >> uint(2)));
    uint _238 = uint(int(uint(int(_236)) >> uint(2)));
    int _240 = int(_236) & 3;
    float _242 = (*spvDescriptorSet0.fp_c9)._m0[int(_238)][_240];
    int _244 = int(_236) + 1;
    uint _246 = uint(int(uint(_244) >> uint(2)));
    int _248 = _244 & 3;
    float _250 = (*spvDescriptorSet0.fp_c9)._m0[int(_246)][_248];
    float _252 = fma(_182, _96, _136);
    float _254 = fma(_160, _102, _142);
    float _256 = _252 * _172;
    float _258 = _254 * _180;
    float _260 = _158 * _202;
    float _262 = _158 * _208;
    float _264 = _158 * _214;
    float _266 = _260 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _268 = _262 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _270 = _264 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _272 = _266 * (*spvDescriptorSet0.fp_c11)._m0[30].z;
    float _274 = _268 * (*spvDescriptorSet0.fp_c11)._m0[30].x;
    float _276 = _270 * (*spvDescriptorSet0.fp_c11)._m0[30].y;
    float _278 = _184 * _224;
    float _280 = _186 * _232;
    float _282 = fma(_272, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].z);
    float _284 = _184 * _242;
    float _286 = _186 * _250;
    float _288 = fma(_274, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].x);
    float _290 = fma(_276, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].y);
    float2 _1866;
    _1866.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_256, _258));
    _1866.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_256, _258));
    float _292 = _1866.x;
    float _294 = _292 * 256.0;
    int _296 = int(_294);
    float2 _1876;
    _1876.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_278, _280));
    _1876.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_278, _280));
    float _298 = _1876.x;
    float _300 = _298 * 256.0;
    int _302 = int(_300);
    float2 _1886;
    _1886.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_284, _286));
    _1886.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_284, _286));
    float _304 = _1886.x;
    float _306 = _304 * 256.0;
    int _308 = int(_306);
    float3 _1896 = float3(_288, _290, _282);
    float _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_1896, float3(0.0), isnan(_1896))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_1896, float3(0.0), isnan(_1896))).x;
    int _312 = _88 + 68;
    int _314 = _88 + 64;
    uint _316 = uint(int(uint(_312) >> uint(2)));
    float _318 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_316)]);
    uint _320 = uint(int(uint(_314) >> uint(2)));
    float _322 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_320)]);
    float _324 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _326 = _260 + _324;
    float _328 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _330 = _262 + _328;
    float _332 = _326 * _326;
    float _334 = fma(_330, _330, _332);
    float _336 = sqrt(_334);
    bool _340 = _336 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _342 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _344 = _336 + _342;
    float _346 = _184;
    float _348 = _344;
    float _350 = _288;
    float _352 = _276;
    if (_340)
    {
        float _354 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _346 = _354;
    }
    float _356 = _346;
    float _358 = _356;
    if (_340)
    {
        float _360 = _344 * _356;
        _348 = _360;
    }
    float _362 = _348;
    float _364 = 0.0;
    if (_340)
    {
        float _366 = _362 * 0.15915493667125701904296875;
        _364 = _366;
    }
    float _368 = _364;
    float _370 = _290;
    float _372 = _368;
    if (_340)
    {
        float _374 = _368 * 6.283185482025146484375;
        float _376 = cos(_374);
        _370 = _376;
    }
    float _378 = _370;
    float _380 = _362;
    if (_340)
    {
        float _382 = _368 * 6.283185482025146484375;
        float _384 = sin(_382);
        _380 = _384;
    }
    float _386 = _380;
    float _388 = 0.0;
    if (_340)
    {
        float _390 = rsqrt(_334);
        _388 = _390;
    }
    float _392 = _388;
    if (_340)
    {
        float _394 = _264 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _358 = _394;
    }
    float _396 = _358;
    float _398 = _396;
    if (_340)
    {
        float _400 = _378 + (-1.0);
        _350 = _400;
    }
    float _402 = _350;
    if (!_340)
    {
        _352 = _264;
    }
    float _404 = _352;
    float _406 = 0.0;
    float _408 = _404;
    if (_340)
    {
        float _410 = _402 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _406 = _410;
    }
    float _412 = _406;
    float _414 = _386;
    if (_340)
    {
        float _416 = fma(_386, _396, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _414 = _416;
    }
    float _418 = _414;
    float _420 = _418;
    if (_340)
    {
        float _422 = fma(_264, _378, _412);
        _408 = _422;
    }
    float _424 = _408;
    if (!_340)
    {
        _398 = _262;
    }
    float _426 = _398;
    float _428 = _392;
    float _430 = _426;
    if (_340)
    {
        float _432 = _392 * _418;
        _428 = _432;
    }
    float _434 = _428;
    if (!_340)
    {
        _420 = _260;
    }
    float _436 = _420;
    float _438 = _436;
    if (_340)
    {
        float _440 = fma(_330, _434, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _430 = _440;
    }
    float _442 = _430;
    float _444 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _446 = _424 + _444;
    float _448 = _446;
    if (_340)
    {
        float _450 = fma(_326, _434, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _438 = _450;
    }
    float _452 = _438;
    float _454 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _456 = _442 + _454;
    float _458 = _446 * _446;
    float _460 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _462 = _452 + _460;
    float _464 = fma(_456, _456, _458);
    float _466 = fma(_462, _462, _464);
    float _468 = rsqrt(_466);
    float _470 = _468 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _472 = _456 * _470;
    float _474 = _462 * _470;
    float _476 = _472 * _472;
    float _478 = _474 * _474;
    float _480 = _476 + _478;
    float _482 = sqrt(_480);
    bool _484 = _482 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _486 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _488 = _482 + _486;
    float _490 = _412;
    float _492 = _466;
    float _494 = _470;
    float _496 = _472;
    float _498 = _474;
    float _500 = _476;
    float _502 = _478;
    if (_484)
    {
        float _504 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _490 = _504;
    }
    float _506 = _490;
    if (_484)
    {
        float _508 = _488 * _506;
        _492 = _508;
    }
    float _510 = _492;
    if (_484)
    {
        float _512 = _510 * 0.15915493667125701904296875;
        _372 = _512;
    }
    float _514 = _372;
    float _516 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _518 = _510;
    if (_484)
    {
        float _520 = _514 * 6.283185482025146484375;
        float _522 = cos(_520);
        _518 = _522;
    }
    float _524 = _518;
    float _526 = precise::max(0.0, _516);
    float _528 = _506;
    float _530 = _526;
    if (_484)
    {
        float _532 = _514 * 6.283185482025146484375;
        float _534 = sin(_532);
        _528 = _534;
    }
    float _536 = _528;
    float _538 = -_470;
    float _540 = -_526;
    float _542 = fma(_446, _538, _540);
    float _544 = _434;
    if (_484)
    {
        float _546 = rsqrt(_480);
        _544 = _546;
    }
    float _548 = _544;
    if (_484)
    {
        float _550 = _542 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _494 = _550;
    }
    float _552 = _494;
    float _554 = _552;
    if (_484)
    {
        float _556 = _524 + (-1.0);
        _448 = _556;
    }
    float _558 = _448;
    float _560 = _558;
    if (_484)
    {
        float _562 = fma(_536, _552, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _530 = _562;
    }
    float _564 = _530;
    float _566 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _568 = _264 + _566;
    float _570 = 0.0;
    if (_484)
    {
        float _572 = _558 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _570 = _572;
    }
    float _574 = _570;
    if (!_484)
    {
        _554 = _542;
    }
    float _576 = _554;
    float _578 = _576;
    if (_484)
    {
        float _580 = _548 * _564;
        _560 = _580;
    }
    float _582 = _560;
    float _584 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _586 = _262 + _584;
    float _588 = _568 * _568;
    if (_484)
    {
        float _590 = fma(_542, _524, _574);
        _578 = _590;
    }
    float _592 = _578;
    float _594 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _596 = _260 + _594;
    float _598 = fma(_586, _586, _588);
    if (_484)
    {
        float _600 = _472 * _582;
        _496 = _600;
    }
    float _602 = _496;
    float _604 = fma(_596, _596, _598);
    if (_484)
    {
        float _606 = _474 * _582;
        _498 = _606;
    }
    float _608 = _498;
    if (_484)
    {
        float _610 = _602 * _602;
        _500 = _610;
    }
    float _612 = _500;
    float _614 = sqrt(_604);
    if (_484)
    {
        float _616 = _608 * _608;
        _502 = _616;
    }
    float _618 = _502;
    float _620 = fma(_592, _592, _612);
    float _622 = _620 + _618;
    float _624 = rsqrt(_622);
    int _626 = _162 + 25952;
    uint _628 = uint(int(uint(_626) >> uint(2)));
    uint _630 = uint(int(uint(int(_628)) >> uint(2)));
    int _632 = int(_628) & 3;
    float _634 = (*spvDescriptorSet0.fp_c9)._m0[int(_630)][_632];
    float _636 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _638 = fma(_614, (*spvDescriptorSet0.fp_c9)._m0[63].x, _636);
    float _640 = precise::clamp(_638, 0.0, 1.0);
    int _642 = _162 + 25936;
    uint _644 = uint(int(uint(_642) >> uint(2)));
    uint _646 = uint(int(uint(int(_644)) >> uint(2)));
    int _648 = int(_644) & 3;
    float _650 = (*spvDescriptorSet0.fp_c9)._m0[int(_646)][_648];
    int _652 = int(_644) + 1;
    uint _654 = uint(int(uint(_652) >> uint(2)));
    int _656 = _652 & 3;
    float _658 = (*spvDescriptorSet0.fp_c9)._m0[int(_654)][_656];
    float _660 = -_640;
    float _662 = _660 + 1.0;
    int _664 = _162 + 25944;
    uint _666 = uint(int(uint(_664) >> uint(2)));
    uint _668 = uint(int(uint(int(_666)) >> uint(2)));
    int _670 = int(_666) & 3;
    float _672 = (*spvDescriptorSet0.fp_c9)._m0[int(_668)][_670];
    float _674 = abs(_662);
    float _676 = log2(_674);
    float _678 = _624 * _602;
    float _680 = _624 * _592;
    float _682 = _678 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _684 = _624 * _608;
    float _686 = -_682;
    float _688 = fma(_680, (*spvDescriptorSet0.fp_c9)._m0[69].y, _686);
    float _690 = rint(_634);
    float _692 = precise::max(_690, 0.0);
    uint _694 = uint(_692);
    uint _696 = clamp(_694, 0u, 65535u);
    float _698 = -_684;
    float _700 = fma(_698, (*spvDescriptorSet0.fp_c9)._m0[69].z, _688);
    float _702 = float(uint(_196));
    float _704 = precise::max(_318, _658);
    float _706 = precise::max(_318, _650);
    float _708 = _676 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _710 = precise::max(_322, _650);
    float _712 = precise::max(_318, _672);
    float _714 = fma(_700, -0.5, 0.5);
    float _716 = _702 * 0.00390625;
    float _718 = exp2(_708);
    float _720 = fma(_700, 0.5, 0.5);
    float _722 = precise::max(_706, _716);
    float _724 = sqrt(_714);
    float _726 = fma(_720, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float3 _2555 = float3(_188, _190, float(int(_696)));
    float3 _2557 = select(_2555, float3(0.0), isnan(_2555));
    float2 _730 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2557.xy, uint(rint(_2557.z)), level(_722)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2557.xy, uint(rint(_2557.z)), level(_722)).yz;
    float _732 = _730.x;
    float _734 = _730.y;
    float _736 = float(uint(_302));
    float _738 = _680 + 1.0;
    float _740 = fma(_720, _726, -0.212114393711090087890625);
    float _742 = _736 * 0.00390625;
    float _744 = -_680;
    float _746 = fma(_718, _738, _744);
    float _748 = fma(_720, _740, 1.570728778839111328125);
    float _750 = _724 * 0.636619746685028076171875;
    float _752 = fma(_262, 6.2500002968590706586837768554688e-05, 0.5);
    float _754 = precise::clamp(_752, 0.0, 1.0);
    float _756 = precise::max(_704, _742);
    float _758 = -_748;
    float _760 = fma(_750, _758, 1.0);
    float _762 = fma(_746, 0.5, 0.5);
    float _764 = fma(_260, 6.2500002968590706586837768554688e-05, 0.5);
    float _766 = precise::clamp(_764, 0.0, 1.0);
    float2 _2611 = float2(_754, _766);
    float _768 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2611, float2(0.0), isnan(_2611))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2611, float2(0.0), isnan(_2611))).x;
    float2 _2621 = float2(_760, _762);
    float3 _772 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2621, float2(0.0), isnan(_2621))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2621, float2(0.0), isnan(_2621))).xyz;
    float _774 = _772.x;
    float _776 = _772.y;
    float _778 = _772.z;
    float _780 = float(uint(_296));
    float _782 = float(uint(_308));
    float _784 = _780 * 0.00390625;
    float _786 = _782 * 0.00390625;
    float _788 = precise::max(_710, _784);
    float _790 = precise::max(_712, _786);
    float3 _2654 = float3(_256, _258, float(int(_696)));
    float3 _2656 = select(_2654, float3(0.0), isnan(_2654));
    float _792 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2656.xy, uint(rint(_2656.z)), level(_788)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2656.xy, uint(rint(_2656.z)), level(_788)).x;
    float2 _2663 = float2(_754, _766);
    float4 _795 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2663, float2(0.0), isnan(_2663))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2663, float2(0.0), isnan(_2663))).xyzw;
    float _797 = _795.x;
    float _799 = _795.y;
    float _801 = _795.z;
    float _803 = _795.w;
    float3 _2682 = float3(_278, _280, float(int(_696)));
    float3 _2684 = select(_2682, float3(0.0), isnan(_2682));
    float3 _805 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2684.xy, uint(rint(_2684.z)), level(_756)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2684.xy, uint(rint(_2684.z)), level(_756)).xyz;
    float _807 = _805.x;
    float _809 = _805.y;
    float _811 = _805.z;
    float3 _2700 = float3(_284, _286, float(int(_696)));
    float3 _2702 = select(_2700, float3(0.0), isnan(_2700));
    float3 _813 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2702.xy, uint(rint(_2702.z)), level(_790)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2702.xy, uint(rint(_2702.z)), level(_790)).xyz;
    float _815 = _813.x;
    float _817 = _813.y;
    float _819 = _813.z;
    float _821 = in.m_68.y;
    float _823 = gl_FragCoord.w;
    float _825 = _821 * _823;
    float _827 = in.m_68.z;
    float _829 = gl_FragCoord.w;
    float _831 = _827 * _829;
    float _833 = in.m_68.x;
    float _835 = gl_FragCoord.w;
    float _837 = _833 * _835;
    float _839 = spvFAdd(_614, 9.9999997473787516355514526367188e-06);
    float _841 = 1.0 / _839;
    float _843 = _158 * _825;
    float _845 = _843 * _843;
    float _847 = _158 * _831;
    float _849 = _158 * _837;
    float _851 = fma(_849, _849, _845);
    float _853 = fma(_847, _847, _851);
    float _855 = in.m_70.x;
    float _857 = gl_FragCoord.w;
    float _859 = _855 * _857;
    float _861 = in.m_72.w;
    float _863 = gl_FragCoord.w;
    float _865 = _861 * _863;
    float _867 = rsqrt(_853);
    float _869 = _568 * _841;
    float _871 = _586 * _841;
    float _873 = _596 * _841;
    float _875 = _869 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _877 = fma(_871, (*spvDescriptorSet0.fp_c9)._m0[69].x, _875);
    float _879 = fma(_873, (*spvDescriptorSet0.fp_c9)._m0[69].z, _877);
    float _881 = _264 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _883 = _849 * _867;
    float _885 = _843 * _867;
    float _887 = _847 * _867;
    float _889 = _264 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _891 = fma(_262, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _881);
    float _893 = fma(_262, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _889);
    float _895 = fma(_260, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _891);
    float _897 = fma(_260, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _893);
    float _899 = _895 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _901 = _158 * _859;
    float _903 = _897 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _905 = _158 * _865;
    float _907 = trunc(_899);
    int _909 = int(_907);
    float _911 = trunc(_903);
    int _913 = int(_911);
    int _915 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _917 = _909 + _915;
    int _919 = _917 + 1;
    int _921 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _923 = _913 + _921;
    int _925 = _923 + 1;
    bool _927 = _925 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    int _929 = _925 | _919;
    bool _931 = _929 < 0;
    bool _933 = _931 || _927;
    bool _935 = _919 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _937 = _935 || _933;
    float _939 = as_type<float>(_929);
    if (_937)
    {
        _939 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _941 = _939;
    float _943 = _941;
    if (!_937)
    {
        int _945 = _919 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _947 = _945 + _925;
        float _949 = floor(_903);
        int _951 = _947 << 2;
        int _953 = _947 >> 2;
        int _955 = 12 & _951;
        int _957 = _947 << 4;
        int _959 = _957 + 17904;
        int _961 = _953 << 4;
        int _963 = _961 + _955;
        int _965 = _963 + 16256;
        uint _967 = uint(int(uint(_965) >> uint(2)));
        uint _969 = uint(int(uint(int(_967)) >> uint(2)));
        int _971 = int(_967) & 3;
        float _973 = (*spvDescriptorSet0.fp_c9)._m0[int(_969)][_971];
        float _975 = -_949;
        float _977 = _903 + _975;
        float _979 = floor(_899);
        float _981 = -_979;
        float _983 = _899 + _981;
        uint _985 = uint(int(uint(_959) >> uint(2)));
        uint _987 = uint(int(uint(int(_985)) >> uint(2)));
        int _989 = int(_985) & 3;
        float _991 = (*spvDescriptorSet0.fp_c9)._m0[int(_987)][_989];
        int _993 = int(_985) + 1;
        uint _995 = uint(int(uint(_993) >> uint(2)));
        int _997 = _993 & 3;
        float _999 = (*spvDescriptorSet0.fp_c9)._m0[int(_995)][_997];
        float _1001 = rint(_973);
        float _1003 = precise::max(_1001, 0.0);
        uint _1005 = uint(_1003);
        uint _1007 = clamp(_1005, 0u, 65535u);
        float3 _3008 = float3(_977, _983, float(int(_1007)));
        float3 _3010 = select(_3008, float3(0.0), isnan(_3008));
        float _1009 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _3010.xy, uint(rint(_3010.z))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _3010.xy, uint(rint(_3010.z))).x;
        float _1011 = _264 * _999;
        float _1013 = fma(_262, _991, _1011);
        int _1015 = _959 + 8;
        uint _1017 = uint(int(uint(_1015) >> uint(2)));
        uint _1019 = uint(int(uint(int(_1017)) >> uint(2)));
        int _1021 = int(_1017) & 3;
        float _1023 = (*spvDescriptorSet0.fp_c9)._m0[int(_1019)][_1021];
        int _1025 = int(_1017) + 1;
        uint _1027 = uint(int(uint(_1025) >> uint(2)));
        int _1029 = _1025 & 3;
        float _1031 = (*spvDescriptorSet0.fp_c9)._m0[int(_1027)][_1029];
        int _1033 = _963 + 24304;
        uint _1035 = uint(int(uint(_1033) >> uint(2)));
        uint _1037 = uint(int(uint(int(_1035)) >> uint(2)));
        int _1039 = int(_1035) & 3;
        float _1041 = (*spvDescriptorSet0.fp_c9)._m0[int(_1037)][_1039];
        float _1043 = fma(_260, _1023, _1013);
        float _1045 = _1043 + _1031;
        float _1047 = precise::clamp(_1045, 0.0, 1.0);
        float _1049 = 1.0 / _1041;
        float _1051 = _1041 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _1053 = -_1047;
        float _1055 = _1053 + _1009;
        float _1057 = fma(_1049, (*spvDescriptorSet0.fp_c13)._m0[4].w, _1055);
        float _1059 = _1051 * _1057;
        float _1061 = exp2(_1059);
        float _1063 = 0.0 + _1061;
        float _1065 = precise::clamp(_1063, 0.0, 1.0);
        float _1067 = precise::min(_1065, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _943 = _1067;
    }
    float _1069 = _943;
    float _1071 = -_905;
    float _1073 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _1075 = _1071 + _1073;
    float _1077 = -_1069;
    float _1079 = _1077 + 1.0;
    float _1081 = _803 * 4.0;
    float _1083 = precise::clamp(_1081, 0.0, 1.0);
    float _1085 = _1075 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1087 = precise::clamp(_1085, 0.0, 1.0);
    float _1089 = _807 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1091 = -(*spvDescriptorSet0.fp_c9)._m0[1007].y;
    float _1093 = _1091 + (*spvDescriptorSet0.fp_c9)._m0[1006].y;
    float _1095 = fma(_1087, _1079, _1069);
    float _1097 = fma(_885, 0.5, 0.5);
    float _1099 = _815 * 0.4774648249149322509765625;
    float _1101 = -(*spvDescriptorSet0.fp_c9)._m0[1007].x;
    float _1103 = _1101 + (*spvDescriptorSet0.fp_c9)._m0[1006].x;
    float _1105 = fma(_1097, _1093, (*spvDescriptorSet0.fp_c9)._m0[1007].y);
    float _1107 = -(*spvDescriptorSet0.fp_c9)._m0[1007].z;
    float _1109 = _1107 + (*spvDescriptorSet0.fp_c9)._m0[1006].z;
    float _1111 = -(*spvDescriptorSet0.fp_c9)._m0[1001].x;
    float _1113 = _1111 + (*spvDescriptorSet0.fp_c9)._m0[1000].x;
    float _1115 = fma(_1097, _1103, (*spvDescriptorSet0.fp_c9)._m0[1007].x);
    float _1117 = _1105 * 0.715200006961822509765625;
    float _1119 = fma(_1097, _1109, (*spvDescriptorSet0.fp_c9)._m0[1007].z);
    float _1121 = -(*spvDescriptorSet0.fp_c9)._m0[1001].z;
    float _1123 = _1121 + (*spvDescriptorSet0.fp_c9)._m0[1000].z;
    float _1125 = fma(_1097, _1113, (*spvDescriptorSet0.fp_c9)._m0[1001].x);
    float _1127 = fma(_1115, 0.2125999927520751953125, _1117);
    float _1129 = _885 * _885;
    float _1131 = precise::max(0.0, _885);
    float _1133 = _817 * 0.4774648249149322509765625;
    float _1135 = fma(_1119, 0.072200000286102294921875, _1127);
    float _1137 = fma(_883, _883, _1129);
    float _1139 = abs(_568);
    bool _1141 = _1139 > 0.00999999977648258209228515625;
    float _1143 = _1099 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1145 = 1.0 / _1135;
    float _1147 = fma(_887, _887, _1137);
    float _1149 = precise::clamp(_1147, 0.0, 1.0);
    float _1151 = _819 * 0.4774648249149322509765625;
    float _1153 = fma(_1149, 0.5, 0.5);
    float _1155 = -(*spvDescriptorSet0.fp_c9)._m0[1001].y;
    float _1157 = _1155 + (*spvDescriptorSet0.fp_c9)._m0[1000].y;
    float _1159 = _1151 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1161 = _734 * 0.2820948064327239990234375;
    float _1163 = fma(_1097, _1157, (*spvDescriptorSet0.fp_c9)._m0[1001].y);
    float _1165 = fma(_1097, _1123, (*spvDescriptorSet0.fp_c9)._m0[1001].z);
    float _1167 = precise::min(_1095, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1169 = _1145 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1171 = precise::clamp(_1169, 0.0, 1.0);
    float _1173 = precise::min(_1153, 1.0);
    float _1175 = fma(_1171, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _1177 = fma(_879, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _1179 = _1175 * 0.31830990314483642578125;
    float _1181 = fma(_1177, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1183 = _1105 * _1179;
    float _1185 = _1115 * _1179;
    float _1187 = _1119 * _1179;
    float _1189 = abs(_1181);
    float _1191 = log2(_1189);
    float _1193 = _1125 * 0.31830990314483642578125;
    float _1195 = -_310;
    float _1197 = fma(_901, 2.0, _1195);
    float _1199 = precise::max(_1143, _1185);
    float _1201 = _1083 * _1197;
    float _1203 = precise::clamp(_1201, 0.0, 1.0);
    float _1205 = precise::min(_1131, 0.100000001490116119384765625);
    float _1207 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1209 = precise::max(_1089, _1193);
    float _1211 = _797 * _1203;
    float _1213 = _801 * _1203;
    float _1215 = fma(_1161, (*spvDescriptorSet0.fp_c9)._m0[991].x, _1199);
    float _1217 = -_1207;
    float _1219 = exp2(_1217);
    float _1221 = precise::max(_1159, _1187);
    float _1223 = _1191 * 1.5;
    float _1225 = fma(_1161, (*spvDescriptorSet0.fp_c9)._m0[991].z, _1221);
    float _1227 = exp2(_1223);
    float _1229 = _1227 * 12.56637096405029296875;
    float _1231 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1233 = _1231 + 1.0;
    float _1235 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].x, _1233);
    float _1237 = 1.0 / _1229;
    float _1239 = fma(_1205, 10.0, -1.0);
    float _1241 = _1141 ? _568 : 0.00999999977648258209228515625;
    float _1243 = precise::max(_310, 0.25);
    float _1245 = _1241 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _1247 = _310 + 1.0;
    float _1249 = precise::clamp(_1247, 0.0, 1.0);
    float _1251 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1253 = fma(_1251, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1255 = -_1235;
    float _1257 = fma(_1255, (*spvDescriptorSet0.fp_c11)._m0[36].z, 1.0);
    float _1259 = _1243 + _1239;
    float _1261 = precise::max(_1245, -127.0);
    float _1263 = _676 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1265 = _1249 + (-1.0);
    float _1267 = precise::max(0.0, _1257);
    float _1269 = _1253 * _1237;
    float _1271 = 1.0 / _1261;
    float _1273 = -_1261;
    float _1275 = exp2(_1273);
    float _1277 = exp2(_1263);
    float _1279 = -_1275;
    float _1281 = _1279 + 1.0;
    float _1283 = _1219 * _1281;
    float _1285 = _1283 * _1271;
    float _1287 = _614 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1289 = _1285 * _1287;
    float _1291 = -_1289;
    float _1293 = exp2(_1291);
    float _1295 = -_1293;
    float _1297 = _1295 + 1.0;
    float _1299 = _1297 * _1269;
    float _1301 = -_1277;
    float _1303 = _1301 + 1.0;
    float _1305 = _1167 * _1299;
    float _1307 = _1303 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1309 = -_1307;
    float _1311 = _1309 + 1.0;
    float _1313 = _1307 * _1293;
    float _1315 = _1163 * 0.31830990314483642578125;
    float _1317 = _811 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1319 = _1293 * _1311;
    float _1321 = _1165 * 0.31830990314483642578125;
    float _1323 = _732 + (*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1325 = precise::clamp(_1323, 0.0, 1.0);
    float _1327 = _809 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1329 = _1203 * _1265;
    float _1331 = _1133 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1333 = precise::max(_1317, _1321);
    float _1335 = _1325 * _1209;
    float _1337 = fma(_1329, 2.0, 1.5);
    float _1339 = precise::clamp(_1337, 0.0, 1.0);
    float _1341 = precise::max(_1327, _1315);
    float _1343 = _799 * _1203;
    float _1345 = _1325 * _1333;
    float _1347 = fma(_1339, -0.449999988079071044921875, 1.0);
    float _1349 = precise::max(_1331, _1183);
    float _1351 = _1325 * _1341;
    float _1353 = 0.0 + _768;
    float _1355 = precise::clamp(_1353, 0.0, 1.0);
    float _1357 = _1211 * _1347;
    float _1359 = fma(_1161, (*spvDescriptorSet0.fp_c9)._m0[991].y, _1349);
    float _1361 = _792 * _1355;
    float _1363 = -_1357;
    float _1365 = _1211 + _1363;
    float _1367 = _1259 * 4.0;
    float _1369 = precise::clamp(_1367, 0.0, 1.0);
    float _1371 = _1305 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1373 = fma(_1267, _1365, _1357);
    float _1375 = _1343 * _1347;
    float _1377 = _1213 * _1347;
    float _1379 = _1361 * _1369;
    float _1381 = -_1211;
    float _1383 = _1381 + _1373;
    float _1385 = -_1375;
    float _1387 = _1343 + _1385;
    float _1389 = -_1377;
    float _1391 = _1213 + _1389;
    float _1393 = fma(_774, _1313, _1371);
    float _1395 = fma(_1379, _1383, _1211);
    float _1397 = fma(_1267, _1387, _1375);
    float _1399 = fma(_1267, _1391, _1377);
    float _1401 = _1395 * _1215;
    float _1403 = -_1343;
    float _1405 = _1403 + _1397;
    float _1407 = -_1213;
    float _1409 = _1407 + _1399;
    float _1411 = _1335 * _1395;
    float _1413 = _1173 * _1401;
    float _1415 = fma(_1379, _1405, _1343);
    float _1417 = fma(_1379, _1409, _1213);
    float _1419 = _1351 * _1415;
    float _1421 = _1415 * _1359;
    float _1423 = _1345 * _1417;
    float _1425 = _1417 * _1225;
    float _1427 = _1173 * _1411;
    float _1429 = _1305 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1431 = precise::max(0.0, _1413);
    float _1433 = _1173 * _1419;
    float _1435 = _1173 * _1421;
    float _1437 = _1173 * _1423;
    float _1439 = _1173 * _1425;
    float _1441 = _1305 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1443 = fma(_776, _1313, _1429);
    float _1445 = precise::max(0.0, _1427);
    float _1447 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1449 = _614 + _1447;
    float _1451 = fma(_1319, _1431, _1393);
    float _1453 = precise::max(0.0, _1435);
    float _1455 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1457 = _614 + _1455;
    float _1459 = precise::max(0.0, _1433);
    float _1461 = fma(_778, _1313, _1441);
    float _1463 = precise::max(0.0, _1437);
    float _1465 = _1449 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1467 = precise::clamp(_1465, 0.0, 1.0);
    float _1469 = precise::max(0.0, _1439);
    float _1471 = _1319 * _1445;
    float _1473 = _1457 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1475 = precise::clamp(_1473, 0.0, 1.0);
    float _1477 = fma(_1319, _1453, _1443);
    float _1479 = _1319 * _1459;
    float _1481 = _1319 * _1463;
    float _1483 = fma(_1319, _1469, _1461);
    float _1485 = fma(_1467, _1471, _1451);
    float _1487 = fma(_1475, _1471, _1451);
    float _1489 = fma(_1467, _1479, _1477);
    float _1491 = fma(_1475, _1479, _1477);
    float _1493 = fma(_1467, _1481, _1483);
    float _1495 = fma(_1475, _1481, _1483);
    out.m_75.x = _1485;
    out.m_75.y = _1489;
    out.m_75.z = _1493;
    out.m_75.w = 0.0;
    out.m_77.x = _1487;
    out.m_77.y = _1491;
    out.m_77.z = _1495;
    out.m_77.w = 0.0;
    return out;
}

