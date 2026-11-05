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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c11 [[id(3)]];
    constant _16* fp_c4 [[id(4)]];
    const device _29* fp_s0 [[id(5)]];
    texture2d_array<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    texture2d<float> fp_t_tcb_16 [[id(12)]];
    sampler fp_t_tcb_16Smplr [[id(13)]];
    texture2d<float> fp_t_tcb_1A [[id(14)]];
    sampler fp_t_tcb_1ASmplr [[id(15)]];
    texture3d<float> fp_t_tcb_1E [[id(16)]];
    sampler fp_t_tcb_1ESmplr [[id(17)]];
    texture2d_array<float> fp_t_tcb_10 [[id(18)]];
    sampler fp_t_tcb_10Smplr [[id(19)]];
    texture2d<float> fp_t_tcb_E [[id(20)]];
    sampler fp_t_tcb_ESmplr [[id(21)]];
    texture2d<float> fp_t_tcb_1C [[id(22)]];
    sampler fp_t_tcb_1CSmplr [[id(23)]];
    texture3d<float> fp_t_tcb_20 [[id(24)]];
    sampler fp_t_tcb_20Smplr [[id(25)]];
    texture2d<float> fp_t_tcb_12 [[id(26)]];
    sampler fp_t_tcb_12Smplr [[id(27)]];
    texture2d<float> fp_t_tcb_14 [[id(28)]];
    sampler fp_t_tcb_14Smplr [[id(29)]];
    sampler fp_t_tcb_8Smplr_w [[id(30)]];
    sampler fp_t_tcb_ASmplr_w [[id(31)]];
    sampler fp_t_tcb_CSmplr_w [[id(32)]];
    sampler fp_t_tcb_16Smplr_w [[id(33)]];
    sampler fp_t_tcb_1ASmplr_w [[id(34)]];
    sampler fp_t_tcb_1ESmplr_w [[id(35)]];
    sampler fp_t_tcb_10Smplr_w [[id(36)]];
    sampler fp_t_tcb_ESmplr_w [[id(37)]];
    sampler fp_t_tcb_1CSmplr_w [[id(38)]];
    sampler fp_t_tcb_20Smplr_w [[id(39)]];
    sampler fp_t_tcb_12Smplr_w [[id(40)]];
    sampler fp_t_tcb_14Smplr_w [[id(41)]];
    constant dm_border_t* dm_border [[id(42)]];
};

struct main0_out
{
    float4 m_81 [[color(0)]];
    float4 m_83 [[color(1)]];
};

struct main0_in
{
    float4 m_70 [[user(locn1)]];
    float4 m_76 [[user(locn3)]];
    float4 m_72 [[user(locn4)]];
    float4 m_78 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _90 = as_type<int>((*spvDescriptorSet0.fp_c7)._m0[11].z) * as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].z);
    int _92 = _90 + as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].w);
    int _94 = _92 * 96;
    int _96 = _94 + 80;
    uint _99 = uint(int(uint(_94) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_99)];
    float _102 = as_type<float>(_dmw0.x);
    int _104 = _94 + 4;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    float _108 = as_type<float>(_dmw0.y);
    uint _110 = uint(int(uint(_96) >> uint(2)));
    float _112 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_110)]);
    int _114 = _94 + 8;
    int _116 = _94 + 16;
    int _118 = _94 + 24;
    uint _120 = uint(int(uint(_114) >> uint(2)));
    float _122 = as_type<float>(_dmw0.z);
    int _124 = _114 + 4;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    float _128 = as_type<float>(_dmw0.w);
    uint _130 = uint(int(uint(_116) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_130)];
    float _132 = as_type<float>(_dmw1.x);
    int _134 = _116 + 4;
    uint _136 = uint(int(uint(_134) >> uint(2)));
    float _138 = as_type<float>(_dmw1.y);
    uint _140 = uint(int(uint(_118) >> uint(2)));
    float _142 = as_type<float>(_dmw1.z);
    int _144 = _118 + 4;
    uint _146 = uint(int(uint(_144) >> uint(2)));
    float _148 = as_type<float>(_dmw1.w);
    float _150 = gl_FragCoord.w;
    float _152 = in.m_70.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_70.w;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = gl_FragCoord.y;
    float _166 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _168 = _164 / _166;
    float _170 = 1.0 / _150;
    float _172 = _170 * _156;
    float _174 = _170 * _162;
    float _176 = _168 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    int _178 = as_type<int>(_112) << 6;
    float _180 = gl_FragCoord.x;
    float _182 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _184 = _180 / _182;
    int _186 = _178 + 25904;
    uint _188 = uint(int(uint(_186) >> uint(2)));
    uint _190 = uint(int(uint(int(_188)) >> uint(2)));
    int _192 = int(_188) & 3;
    float _194 = (*spvDescriptorSet0.fp_c9)._m0[int(_190)][_192];
    int _196 = int(_188) + 1;
    uint _198 = uint(int(uint(_196) >> uint(2)));
    int _200 = _196 & 3;
    float _202 = (*spvDescriptorSet0.fp_c9)._m0[int(_198)][_200];
    int _204 = _178 + 25912;
    uint _206 = uint(int(uint(_204) >> uint(2)));
    uint _208 = uint(int(uint(int(_206)) >> uint(2)));
    int _210 = int(_206) & 3;
    float _212 = (*spvDescriptorSet0.fp_c9)._m0[int(_208)][_210];
    int _214 = int(_206) + 1;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    int _218 = _214 & 3;
    float _220 = (*spvDescriptorSet0.fp_c9)._m0[int(_216)][_218];
    int _222 = _178 + 25920;
    uint _224 = uint(int(uint(_222) >> uint(2)));
    uint _226 = uint(int(uint(int(_224)) >> uint(2)));
    int _228 = int(_224) & 3;
    float _230 = (*spvDescriptorSet0.fp_c9)._m0[int(_226)][_228];
    int _232 = int(_224) + 1;
    uint _234 = uint(int(uint(_232) >> uint(2)));
    int _236 = _232 & 3;
    float _238 = (*spvDescriptorSet0.fp_c9)._m0[int(_234)][_236];
    float _240 = fma(_172, _102, _122);
    float _242 = fma(_172, _132, _142);
    float _244 = fma(_174, _138, _148);
    float _246 = fma(_174, _108, _128);
    float _248 = _242 * _194;
    float _250 = _244 * _202;
    float _252 = _240 * _194;
    float _254 = _246 * _202;
    float _256 = _184 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _258 = _242 * _212;
    float _260 = _244 * _220;
    float _262 = _242 * _230;
    float _264 = _244 * _238;
    float2 _1670;
    _1670.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_248, _250));
    _1670.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_248, _250));
    float _266 = _1670.x;
    float _268 = _266 * 256.0;
    int _270 = int(_268);
    float2 _1681;
    _1681.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_252, _254));
    _1681.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_252, _254));
    float _272 = _1681.x;
    float _274 = _272 * 256.0;
    int _276 = int(_274);
    float2 _1691;
    _1691.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_258, _260));
    _1691.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_258, _260));
    float _278 = _1691.x;
    float _280 = _278 * 256.0;
    int _282 = int(_280);
    float2 _1701;
    _1701.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_262, _264));
    _1701.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_262, _264));
    float _284 = _1701.x;
    float _286 = _284 * 256.0;
    int _288 = int(_286);
    float2 _1710 = float2(_256, _176);
    float2 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1710, float2(0.0), isnan(_1710))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1710, float2(0.0), isnan(_1710))).xy;
    float _294 = _292.x;
    float _296 = _292.y;
    int _298 = _94 + 68;
    int _300 = _94 + 64;
    float _302 = in.m_72.z;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_72.x;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_72.y;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    uint _320 = uint(int(uint(_298) >> uint(2)));
    float _322 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_320)]);
    uint _324 = uint(int(uint(_300) >> uint(2)));
    float _326 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_324)]);
    float _328 = _170 * _306;
    float _330 = _170 * _312;
    float _332 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _334 = _328 + _332;
    float _336 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _338 = _330 + _336;
    float _340 = _334 * _334;
    float _342 = fma(_338, _338, _340);
    float _344 = sqrt(_342);
    bool _348 = _344 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _350 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _352 = _344 + _350;
    float _354 = _340;
    float _356 = _352;
    float _358 = _212;
    if (_348)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _354 = _360;
    }
    float _362 = _354;
    if (_348)
    {
        float _364 = _352 * _362;
        _356 = _364;
    }
    float _366 = _356;
    float _368 = 0.0;
    if (_348)
    {
        float _370 = _366 * 0.15915493667125701904296875;
        _368 = _370;
    }
    float _372 = _368;
    float _374 = _366;
    if (_348)
    {
        float _376 = _372 * 6.283185482025146484375;
        float _378 = cos(_376);
        _374 = _378;
    }
    float _380 = _374;
    float _382 = _362;
    if (_348)
    {
        float _384 = _372 * 6.283185482025146484375;
        float _386 = sin(_384);
        _382 = _386;
    }
    float _388 = _382;
    float _390 = _170 * _318;
    float _392 = _220;
    if (_348)
    {
        float _394 = rsqrt(_342);
        _392 = _394;
    }
    float _396 = _392;
    float _398 = 0.0;
    if (_348)
    {
        float _400 = _390 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _398 = _400;
    }
    float _402 = _398;
    float _404 = _402;
    float _406 = _380;
    if (_348)
    {
        float _408 = _380 + (-1.0);
        _358 = _408;
    }
    float _410 = _358;
    float _412 = _410;
    if (_348)
    {
        float _414 = _410 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _412 = _414;
    }
    float _416 = _412;
    float _418 = 0.0;
    float _420 = _388;
    if (_348)
    {
        float _422 = fma(_388, _402, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _418 = _422;
    }
    float _424 = _418;
    if (!_348)
    {
        _420 = _390;
    }
    float _426 = _420;
    float _428 = _426;
    if (_348)
    {
        float _430 = fma(_390, _380, _416);
        _428 = _430;
    }
    float _432 = _428;
    if (!_348)
    {
        _404 = _330;
    }
    float _434 = _404;
    float _436 = _396;
    float _438 = _434;
    if (_348)
    {
        float _440 = _396 * _424;
        _436 = _440;
    }
    float _442 = _436;
    float _444 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _446 = _432 + _444;
    float _448 = _446;
    if (_348)
    {
        float _450 = fma(_338, _442, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _438 = _450;
    }
    float _452 = _438;
    if (!_348)
    {
        _406 = _328;
    }
    float _454 = _406;
    float _456 = _454;
    if (_348)
    {
        float _458 = fma(_334, _442, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _456 = _458;
    }
    float _460 = _456;
    float _462 = _446 * _446;
    float _464 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _466 = _452 + _464;
    float _468 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _470 = _460 + _468;
    float _472 = fma(_466, _466, _462);
    float _474 = fma(_470, _470, _472);
    float _476 = rsqrt(_474);
    float _478 = _476 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _480 = _466 * _478;
    float _482 = _470 * _478;
    float _484 = _480 * _480;
    float _486 = _482 * _482;
    float _488 = _484 + _486;
    float _490 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _492 = _390 + _490;
    float _494 = sqrt(_488);
    float _496 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _498 = _330 + _496;
    float _500 = _492 * _492;
    float _502 = fma(_498, _498, _500);
    float _504 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _506 = _328 + _504;
    float _508 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _510 = fma(_506, _506, _502);
    bool _512 = _494 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _514 = sqrt(_510);
    float _516 = precise::max(0.0, _508);
    float _518 = -_478;
    float _520 = -_516;
    float _522 = fma(_446, _518, _520);
    float _524 = _516;
    float _526 = _508;
    float _528 = _484;
    if (!_512)
    {
        _448 = _486;
    }
    float _530 = _448;
    float _532 = _530;
    if (!_512)
    {
        _524 = _480;
    }
    float _534 = _524;
    float _536 = 0.0;
    float _538 = _534;
    if (!_512)
    {
        _536 = _522;
    }
    float _540 = _536;
    float _542 = _540;
    if (!_512)
    {
        _526 = _482;
    }
    float _544 = _526;
    bool _546 = !_512;
    float _548 = _544;
    if (!_546)
    {
        float _550 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _552 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _554 = _494 + _552;
        float _556 = rsqrt(_488);
        float _558 = _554 * _550;
        float _560 = _522 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _562 = _558 * 0.15915493667125701904296875;
        float _564 = _562 * 6.283185482025146484375;
        float _566 = sin(_564);
        float _568 = _562 * 6.283185482025146484375;
        float _570 = cos(_568);
        float _572 = fma(_566, _560, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _574 = _556 * _572;
        float _576 = _570 + (-1.0);
        float _578 = _480 * _574;
        float _580 = _576 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _582 = _482 * _574;
        float _584 = fma(_522, _570, _580);
        float _586 = _578 * _578;
        float _588 = _582 * _582;
        _542 = _584;
        _528 = _586;
        _532 = _588;
        _538 = _578;
        _548 = _582;
    }
    float _590 = _542;
    float _592 = _528;
    float _594 = _532;
    float _596 = _538;
    float _598 = _548;
    float _600 = fma(_590, _590, _592);
    float _602 = in.m_74.w;
    float _604 = gl_FragCoord.w;
    float _606 = _602 * _604;
    int _608 = _178 + 25944;
    uint _610 = uint(int(uint(_608) >> uint(2)));
    uint _612 = uint(int(uint(int(_610)) >> uint(2)));
    int _614 = int(_610) & 3;
    float _616 = (*spvDescriptorSet0.fp_c9)._m0[int(_612)][_614];
    float _618 = _600 + _594;
    float _620 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _622 = fma(_514, (*spvDescriptorSet0.fp_c9)._m0[63].x, _620);
    float _624 = precise::clamp(_622, 0.0, 1.0);
    float _626 = rsqrt(_618);
    float _628 = float(uint(_276));
    float _630 = -_624;
    float _632 = _630 + 1.0;
    int _634 = _178 + 25936;
    uint _636 = uint(int(uint(_634) >> uint(2)));
    uint _638 = uint(int(uint(int(_636)) >> uint(2)));
    int _640 = int(_636) & 3;
    float _642 = (*spvDescriptorSet0.fp_c9)._m0[int(_638)][_640];
    int _644 = int(_636) + 1;
    uint _646 = uint(int(uint(_644) >> uint(2)));
    int _648 = _644 & 3;
    float _650 = (*spvDescriptorSet0.fp_c9)._m0[int(_646)][_648];
    float _652 = float(uint(_270));
    float _654 = abs(_632);
    float _656 = log2(_654);
    float _658 = float(uint(_282));
    float _660 = fma(_296, 2.0, -1.0);
    float _662 = float(uint(_288));
    float _664 = _658 * 0.00390625;
    float _666 = fma(_660, (*spvDescriptorSet0.fp_c9)._m0[983].w, _176);
    float _668 = _626 * _596;
    float _670 = _626 * _590;
    float _672 = _626 * _598;
    float _674 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[62].z;
    float _676 = _668 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _678 = precise::max(_322, _616);
    float _680 = -_676;
    float _682 = fma(_670, (*spvDescriptorSet0.fp_c9)._m0[69].y, _680);
    float _684 = _656 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _686 = _170 * _606;
    float _688 = -_672;
    float _690 = fma(_688, (*spvDescriptorSet0.fp_c9)._m0[69].z, _682);
    float _692 = exp2(_684);
    float _694 = _686 * (*spvDescriptorSet0.fp_c9)._m0[62].y;
    float _696 = fma(_690, -0.5, 0.5);
    float _698 = fma(_690, 0.5, 0.5);
    float _700 = -_694;
    float _702 = fma(_674, _700, 1.0);
    float _704 = precise::max(_322, _650);
    float _706 = fma(_698, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _708 = precise::max(_326, _642);
    float _710 = _670 + 1.0;
    float _712 = precise::max(_322, _642);
    float _714 = fma(_698, _706, -0.212114393711090087890625);
    float _716 = sqrt(_696);
    float _718 = -_670;
    float _720 = fma(_692, _710, _718);
    float _722 = fma(_698, _714, 1.570728778839111328125);
    float _724 = _330 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _726 = fma(_330, 6.2500002968590706586837768554688e-05, 0.5);
    float _728 = precise::clamp(_726, 0.0, 1.0);
    float _730 = fma(_328, 6.2500002968590706586837768554688e-05, 0.5);
    float _732 = precise::clamp(_730, 0.0, 1.0);
    float _734 = _328 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    int _736 = _178 + 25952;
    uint _738 = uint(int(uint(_736) >> uint(2)));
    uint _740 = uint(int(uint(int(_738)) >> uint(2)));
    int _742 = int(_738) & 3;
    float _744 = (*spvDescriptorSet0.fp_c9)._m0[int(_740)][_742];
    float _746 = _390 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _748 = log2(_702);
    float _750 = _734 * (*spvDescriptorSet0.fp_c11)._m0[30].z;
    float _752 = _724 * (*spvDescriptorSet0.fp_c11)._m0[30].x;
    float _754 = _746 * (*spvDescriptorSet0.fp_c11)._m0[30].y;
    float _756 = precise::max(_704, _664);
    float _758 = _716 * 0.636619746685028076171875;
    float _760 = _628 * 0.00390625;
    float _762 = fma(_294, 2.0, -1.0);
    float _764 = fma(_750, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].z);
    float2 _2444 = float2(_256, _176);
    float _766 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2444, float2(0.0), isnan(_2444))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2444, float2(0.0), isnan(_2444))).x;
    float _768 = -_722;
    float _770 = fma(_758, _768, 1.0);
    float _772 = fma(_754, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].y);
    float _774 = _652 * 0.00390625;
    float _776 = precise::max(_708, _760);
    float _778 = fma(_752, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].x);
    float _780 = _662 * 0.00390625;
    float _782 = precise::max(_712, _774);
    float _784 = _748 * 0.693147182464599609375;
    float _786 = fma(_762, (*spvDescriptorSet0.fp_c9)._m0[983].z, _256);
    float _788 = rint(_744);
    float _790 = precise::max(_788, 0.0);
    uint _792 = uint(_790);
    uint _794 = clamp(_792, 0u, 65535u);
    float _796 = fma(_720, 0.5, 0.5);
    float3 _2500 = float3(_778, _772, _764);
    float _798 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_2500, float3(0.0), isnan(_2500))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_2500, float3(0.0), isnan(_2500))).x;
    float _800 = _784 * (*spvDescriptorSet0.fp_c9)._m0[62].w;
    float _802 = precise::max(_678, _780);
    int _804 = 1 & as_type<int>((*spvDescriptorSet0.fp_c9)._m0[40].w);
    bool _806 = _804 != 0;
    float3 _2527 = float3(_258, _260, float(int(_794)));
    float3 _2529 = select(_2527, float3(0.0), isnan(_2527));
    float3 _810 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2529.xy, uint(rint(_2529.z)), level(_756)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2529.xy, uint(rint(_2529.z)), level(_756)).xyz;
    float _812 = _810.x;
    float _814 = _810.y;
    float _816 = _810.z;
    float3 _2545 = float3(_262, _264, float(int(_794)));
    float3 _2547 = select(_2545, float3(0.0), isnan(_2545));
    float3 _818 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2547.xy, uint(rint(_2547.z)), level(_802)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2547.xy, uint(rint(_2547.z)), level(_802)).xyz;
    float _820 = _818.x;
    float _822 = _818.y;
    float _824 = _818.z;
    bool _826 = !_806;
    float _828 = _826 ? _256 : _786;
    float3 _2569 = float3(_248, _250, float(int(_794)));
    float3 _2571 = select(_2569, float3(0.0), isnan(_2569));
    float2 _830 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2571.xy, uint(rint(_2571.z)), level(_782)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2571.xy, uint(rint(_2571.z)), level(_782)).yz;
    float _832 = _830.x;
    float _834 = _830.y;
    bool _836 = !_806;
    float _838 = _836 ? _176 : _666;
    float3 _2589 = float3(_828, _838, float(1));
    float3 _2591 = select(_2589, float3(0.0), isnan(_2589));
    float2 _840 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _2591.xy, uint(rint(_2591.z))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _2591.xy, uint(rint(_2591.z))).xy;
    float _842 = _840.x;
    float _844 = _840.y;
    float2 _2601 = float2(_728, _732);
    float4 _847 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2601, float2(0.0), isnan(_2601))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2601, float2(0.0), isnan(_2601))).xyzw;
    float _849 = _847.x;
    float _851 = _847.y;
    float _853 = _847.z;
    float _855 = _847.w;
    float2 _2617 = float2(_728, _732);
    float _857 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2617, float2(0.0), isnan(_2617))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2617, float2(0.0), isnan(_2617))).x;
    float3 _2626 = float3(_828, _838, float(0));
    float3 _2628 = select(_2626, float3(0.0), isnan(_2626));
    float _859 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _2628.xy, uint(rint(_2628.z))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _2628.xy, uint(rint(_2628.z))).z;
    float3 _2637 = float3(_252, _254, float(int(_794)));
    float3 _2639 = select(_2637, float3(0.0), isnan(_2637));
    float _861 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2639.xy, uint(rint(_2639.z)), level(_776)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2639.xy, uint(rint(_2639.z)), level(_776)).x;
    float3 _2647 = float3(_256, _176, _800);
    float _863 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, select(_2647, float3(0.0), isnan(_2647))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, select(_2647, float3(0.0), isnan(_2647))).x;
    float2 _2655 = float2(_786, _666);
    float4 _865 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2655, float2(0.0), isnan(_2655))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2655, float2(0.0), isnan(_2655))).xyzw;
    float _867 = _865.x;
    float _869 = _865.y;
    float _871 = _865.z;
    float _873 = _865.w;
    float2 _2671 = float2(_770, _796);
    float3 _875 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2671, float2(0.0), isnan(_2671))), spvDescriptorSet0.dm_border, 11u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2671, float2(0.0), isnan(_2671))).xyz;
    float _877 = _875.x;
    float _879 = _875.y;
    float _881 = _875.z;
    float _883 = in.m_76.y;
    float _885 = gl_FragCoord.w;
    float _887 = _883 * _885;
    float _889 = in.m_76.x;
    float _891 = gl_FragCoord.w;
    float _893 = _889 * _891;
    float _895 = in.m_76.z;
    float _897 = gl_FragCoord.w;
    float _899 = _895 * _897;
    float _901 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _903 = _390 + _901;
    float _905 = _656 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _907 = _903 * _903;
    float _909 = -(*spvDescriptorSet0.fp_c9)._m0[1007].z;
    float _911 = _909 + (*spvDescriptorSet0.fp_c9)._m0[1006].z;
    float _913 = in.m_78.x;
    float _915 = gl_FragCoord.w;
    float _917 = _913 * _915;
    float _919 = fma(_338, _338, _907);
    float _921 = _256 + (*spvDescriptorSet0.fp_c9)._m0[992].x;
    float _923 = exp2(_905);
    float _925 = fma(_334, _334, _919);
    float _927 = -(*spvDescriptorSet0.fp_c9)._m0[1001].y;
    float _929 = _927 + (*spvDescriptorSet0.fp_c9)._m0[1000].y;
    float _931 = -(*spvDescriptorSet0.fp_c9)._m0[1001].x;
    float _933 = _931 + (*spvDescriptorSet0.fp_c9)._m0[1000].x;
    float _935 = sqrt(_925);
    float _937 = -(*spvDescriptorSet0.fp_c9)._m0[1001].z;
    float _939 = _937 + (*spvDescriptorSet0.fp_c9)._m0[1000].z;
    float _941 = -_923;
    float _943 = _941 + 1.0;
    float _945 = _170 * _887;
    float _947 = _170 * _893;
    float _949 = _170 * _899;
    float _951 = _943 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _953 = _945 * _945;
    float _955 = fma(_947, _947, _953);
    float _957 = _170 * _917;
    float _959 = fma(_949, _949, _955);
    float _961 = -(*spvDescriptorSet0.fp_c9)._m0[1007].x;
    float _963 = _961 + (*spvDescriptorSet0.fp_c9)._m0[1006].x;
    float _965 = rsqrt(_959);
    float _967 = _947 * _965;
    float _969 = _945 * _965;
    float _971 = _949 * _965;
    float _973 = -(*spvDescriptorSet0.fp_c9)._m0[1007].y;
    float _975 = _973 + (*spvDescriptorSet0.fp_c9)._m0[1006].y;
    float _977 = fma(_969, 0.5, 0.5);
    float _979 = fma(_977, _975, (*spvDescriptorSet0.fp_c9)._m0[1007].y);
    float _981 = fma(_977, _963, (*spvDescriptorSet0.fp_c9)._m0[1007].x);
    float _983 = fma(_977, _911, (*spvDescriptorSet0.fp_c9)._m0[1007].z);
    float _985 = _969 * _969;
    float _987 = _979 * 0.715200006961822509765625;
    float _989 = fma(_977, _933, (*spvDescriptorSet0.fp_c9)._m0[1001].x);
    float _991 = -_176;
    float _993 = _991 + 1.0;
    float _995 = fma(_967, _967, _985);
    float _997 = fma(_981, 0.2125999927520751953125, _987);
    float _999 = _993 + (*spvDescriptorSet0.fp_c9)._m0[992].y;
    float _1001 = fma(_971, _971, _995);
    float _1003 = precise::clamp(_1001, 0.0, 1.0);
    float _1005 = fma(_983, 0.072200000286102294921875, _997);
    float _1007 = fma(_999, 2.0, -1.0);
    float _1009 = precise::max(0.0, _969);
    float _1011 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1013 = _1011 + 1.0;
    float _1015 = fma(_1003, 0.5, 0.5);
    float _1017 = 1.0 / _1005;
    float _1019 = fma(_921, 2.0, -1.0);
    float _1021 = fma(_977, _929, (*spvDescriptorSet0.fp_c9)._m0[1001].y);
    float _1023 = fma(_977, _939, (*spvDescriptorSet0.fp_c9)._m0[1001].z);
    float _1025 = _1017 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = fma(_1027, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _1031 = _1007 * (*spvDescriptorSet0.fp_c4)._m0[17].y;
    float _1033 = _1029 * 0.31830990314483642578125;
    float _1035 = _981 * _1033;
    float _1037 = _979 * _1033;
    float _1039 = _983 * _1033;
    float _1041 = -_766;
    float _1043 = fma(_1041, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
    float _1045 = precise::min(_1009, 0.100000001490116119384765625);
    float _1047 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].x, _1013);
    float _1049 = _989 * 0.31830990314483642578125;
    float _1051 = _1019 * (*spvDescriptorSet0.fp_c4)._m0[17].x;
    float _1053 = _1023 * 0.31830990314483642578125;
    float _1055 = 1.0 / _1043;
    float _1057 = fma(_1045, 10.0, -1.0);
    float _1059 = -_1047;
    float _1061 = fma(_1059, (*spvDescriptorSet0.fp_c11)._m0[36].z, 1.0);
    float _1063 = precise::max(0.0, _1061);
    float _1065 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _1067 = _1055 * _1065;
    float _1069 = precise::max(_798, 0.25);
    float _1071 = _1067 * _1031;
    float _1073 = _1069 + _1057;
    float _1075 = -(*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _1077 = _1071 * _1075;
    float _1079 = _1073 * 4.0;
    float _1081 = precise::clamp(_1079, 0.0, 1.0);
    float _1083 = _812 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1085 = _814 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1087 = _1067 * _1051;
    float _1089 = _816 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1091 = _822 * 0.4774648249149322509765625;
    float _1093 = precise::max(_1083, _1049);
    float _1095 = _1021 * 0.31830990314483642578125;
    float _1097 = _820 * 0.4774648249149322509765625;
    float _1099 = -(*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _1101 = _1071 * _1099;
    float _1103 = -_1087;
    float _1105 = fma(_1103, (*spvDescriptorSet0.fp_c4)._m0[12].x, _1077);
    float _1107 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _1109 = _1071 * _1107;
    float _1111 = _1097 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1113 = precise::max(_1089, _1053);
    float _1115 = -_1087;
    float _1117 = fma(_1115, (*spvDescriptorSet0.fp_c4)._m0[11].x, _1101);
    float _1119 = fma(_1067, (*spvDescriptorSet0.fp_c4)._m0[12].z, _1105);
    float _1121 = -_1087;
    float _1123 = fma(_1121, (*spvDescriptorSet0.fp_c4)._m0[13].x, _1109);
    float _1125 = _824 * 0.4774648249149322509765625;
    float _1127 = fma(_1067, (*spvDescriptorSet0.fp_c4)._m0[11].z, _1117);
    float _1129 = _1119 + (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _1131 = fma(_1067, (*spvDescriptorSet0.fp_c4)._m0[13].z, _1123);
    float _1133 = _1091 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1135 = _1127 + (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _1137 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _1139 = _1129 + _1137;
    float _1141 = precise::max(_1085, _1095);
    float _1143 = _832 + (*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1145 = precise::clamp(_1143, 0.0, 1.0);
    float _1147 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _1149 = _1135 + _1147;
    float _1151 = _1139 * _1139;
    float _1153 = precise::max(_1111, _1035);
    float _1155 = _1131 + (*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _1157 = precise::max(_1133, _1037);
    float _1159 = fma(_1149, _1149, _1151);
    float _1161 = _1125 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1163 = fma(_1145, _1093, _1153);
    float _1165 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _1167 = _1155 + _1165;
    float _1169 = fma(_1145, _1141, _1157);
    float _1171 = _844 * 2.0;
    float _1173 = precise::clamp(_1171, 0.0, 1.0);
    float _1175 = precise::max(_1161, _1039);
    float _1177 = fma(_1167, _1167, _1159);
    float _1179 = _834 * 0.2820948064327239990234375;
    float _1181 = -_798;
    float _1183 = fma(_957, 2.0, _1181);
    float _1185 = fma(_1145, _1113, _1175);
    float _1187 = _855 * 4.0;
    float _1189 = precise::clamp(_1187, 0.0, 1.0);
    float _1191 = -_842;
    float _1193 = _1191 + 1.0;
    float _1195 = fma(_1179, (*spvDescriptorSet0.fp_c9)._m0[991].z, _1185);
    float _1197 = fma(_1173, 0.300000011920928955078125, 0.699999988079071044921875);
    float _1199 = _1189 * _1183;
    float _1201 = precise::clamp(_1199, 0.0, 1.0);
    float _1203 = -_1193;
    float _1205 = fma(_1203, (*spvDescriptorSet0.fp_c11)._m0[46].z, 1.0);
    float _1207 = 0.0 + _857;
    float _1209 = precise::clamp(_1207, 0.0, 1.0);
    float _1211 = _798 + _1197;
    float _1213 = precise::clamp(_1211, 0.0, 1.0);
    float _1215 = fma(_1173, -0.00040000001899898052215576171875, 0.00040000001899898052215576171875);
    float _1217 = sqrt(_1177);
    float _1219 = precise::min(_1205, 1.0);
    float _1221 = -_1197;
    float _1223 = _1221 + _1213;
    float _1225 = -_1215;
    float _1227 = _849 + _1225;
    float _1229 = -_1215;
    float _1231 = _853 + _1229;
    float _1233 = precise::min(_859, _1219);
    float _1235 = fma(_1201, _1223, _1197);
    float _1237 = -_1215;
    float _1239 = _851 + _1237;
    float _1241 = fma(_1201, _1227, _1215);
    float _1243 = fma(_1201, _1231, _1215);
    float _1245 = fma(_1235, 2.0, -0.5);
    float _1247 = precise::clamp(_1245, 0.0, 1.0);
    float _1249 = fma(_1201, _1239, _1215);
    float _1251 = _861 * _1209;
    float _1253 = fma(_1179, (*spvDescriptorSet0.fp_c9)._m0[991].x, _1163);
    float _1255 = fma(_1247, -0.449999988079071044921875, 1.0);
    float _1257 = precise::min(_1015, _1233);
    float _1259 = _1251 * _1081;
    float _1261 = fma(_1179, (*spvDescriptorSet0.fp_c9)._m0[991].y, _1169);
    float _1263 = _1241 * _1255;
    float _1265 = _1249 * _1255;
    float _1267 = _1243 * _1255;
    float _1269 = _873 * _863;
    float _1271 = -_1263;
    float _1273 = _1241 + _1271;
    float _1275 = -_1265;
    float _1277 = _1249 + _1275;
    float _1279 = -_1267;
    float _1281 = _1243 + _1279;
    float _1283 = -_951;
    float _1285 = _1283 + 1.0;
    float _1287 = fma(_1063, _1273, _1263);
    float _1289 = fma(_1063, _1277, _1265);
    float _1291 = fma(_1063, _1281, _1267);
    float _1293 = _951 * _1269;
    float _1295 = -_1241;
    float _1297 = _1295 + _1287;
    float _1299 = 1.0 / (*spvDescriptorSet0.fp_c11)._m0[40].x;
    float _1301 = -_1249;
    float _1303 = _1301 + _1289;
    float _1305 = -_1243;
    float _1307 = _1305 + _1291;
    float _1309 = fma(_1259, _1297, _1241);
    float _1311 = -_935;
    float _1313 = _1217 + _1311;
    float _1315 = fma(_1259, _1303, _1249);
    float _1317 = fma(_1259, _1307, _1243);
    float _1319 = _1309 * _1253;
    float _1321 = fma(_881, _1293, _871);
    float _1323 = _1315 * _1261;
    float _1325 = _1317 * _1195;
    float _1327 = _1257 * _1319;
    float _1329 = _1257 * _1323;
    float _1331 = _1257 * _1325;
    float _1333 = _873 * _1285;
    float _1335 = precise::max(0.0, _1327);
    float _1337 = fma(_877, _1293, _867);
    float _1339 = _1313 * _1299;
    float _1341 = precise::clamp(_1339, 0.0, 1.0);
    float _1343 = precise::max(0.0, _1329);
    float _1345 = fma(_879, _1293, _869);
    float _1347 = precise::max(0.0, _1331);
    float _1349 = fma(_1333, _1335, _1337);
    float _1351 = -_1341;
    float _1353 = _1351 + 1.0;
    float _1355 = fma(_1333, _1343, _1345);
    float _1357 = fma(_1333, _1347, _1321);
    float _1359 = -_1353;
    float _1361 = fma(_1359, _1353, 1.0);
    out.m_81.x = _1349;
    out.m_81.y = _1355;
    out.m_81.z = _1357;
    out.m_81.w = _1361;
    out.m_83.x = (*spvDescriptorSet0.fp_c11)._m0[44].z;
    return out;
}

