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
    texture2d_array<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture3d<float> fp_t_tcb_1C [[id(8)]];
    sampler fp_t_tcb_1CSmplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_8 [[id(10)]];
    sampler fp_t_tcb_8Smplr [[id(11)]];
    texture2d_array<float> fp_t_tcb_C [[id(12)]];
    sampler fp_t_tcb_CSmplr [[id(13)]];
    texture2d_array<float> fp_t_tcb_12 [[id(14)]];
    sampler fp_t_tcb_12Smplr [[id(15)]];
    texture2d<float> fp_t_tcb_10 [[id(16)]];
    sampler fp_t_tcb_10Smplr [[id(17)]];
    texture2d<float> fp_t_tcb_1A [[id(18)]];
    sampler fp_t_tcb_1ASmplr [[id(19)]];
    texture2d<float> fp_t_tcb_E [[id(20)]];
    sampler fp_t_tcb_ESmplr [[id(21)]];
    texture2d<float> fp_t_tcb_14 [[id(22)]];
    sampler fp_t_tcb_14Smplr [[id(23)]];
    sampler fp_t_tcb_ASmplr_w [[id(24)]];
    sampler fp_t_tcb_1CSmplr_w [[id(25)]];
    sampler fp_t_tcb_8Smplr_w [[id(26)]];
    sampler fp_t_tcb_CSmplr_w [[id(27)]];
    sampler fp_t_tcb_12Smplr_w [[id(28)]];
    sampler fp_t_tcb_10Smplr_w [[id(29)]];
    sampler fp_t_tcb_1ASmplr_w [[id(30)]];
    sampler fp_t_tcb_ESmplr_w [[id(31)]];
    sampler fp_t_tcb_14Smplr_w [[id(32)]];
    constant dm_border_t* dm_border [[id(33)]];
};

struct main0_out
{
    float4 m_77 [[color(0)]];
    float4 m_79 [[color(1)]];
};

struct main0_in
{
    float4 m_74 [[user(locn0)]];
    float4 m_66 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_68 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _86 = as_type<int>((*spvDescriptorSet0.fp_c7)._m0[11].z) * as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].z);
    int _88 = _86 + as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].w);
    int _90 = _88 * 96;
    int _92 = _90 + 80;
    uint _95 = uint(int(uint(_92) >> uint(2)));
    float _98 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_95)]);
    int _100 = _90 + 16;
    int _102 = _90 + 24;
    uint _104 = uint(int(uint(_100) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_104)];
    float _106 = as_type<float>(_dmw0.x);
    int _108 = _100 + 4;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    float _112 = as_type<float>(_dmw0.y);
    uint _114 = uint(int(uint(_102) >> uint(2)));
    float _116 = as_type<float>(_dmw0.z);
    int _118 = _102 + 4;
    uint _120 = uint(int(uint(_118) >> uint(2)));
    float _122 = as_type<float>(_dmw0.w);
    float _124 = gl_FragCoord.w;
    float _126 = in.m_66.z;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_68.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_66.w;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_68.y;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    int _150 = _90 + 68;
    float _152 = in.m_68.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    uint _158 = uint(int(uint(_150) >> uint(2)));
    float _160 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_158)]);
    float _162 = 1.0 / _124;
    float _164 = _162 * _130;
    float _166 = _162 * _136;
    float _168 = _162 * _148;
    float _170 = _162 * _156;
    float _172 = _170 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _174 = _172 * (*spvDescriptorSet0.fp_c11)._m0[30].z;
    float _176 = fma(_174, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].z);
    int _178 = as_type<int>(_98) << 6;
    int _180 = _178 + 25912;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    uint _184 = uint(int(uint(int(_182)) >> uint(2)));
    int _186 = int(_182) & 3;
    float _188 = (*spvDescriptorSet0.fp_c9)._m0[int(_184)][_186];
    int _190 = int(_182) + 1;
    uint _192 = uint(int(uint(_190) >> uint(2)));
    int _194 = _190 & 3;
    float _196 = (*spvDescriptorSet0.fp_c9)._m0[int(_192)][_194];
    float _198 = fma(_164, _106, _116);
    float _200 = _162 * _142;
    float _202 = _166 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    int _204 = _178 + 25904;
    uint _206 = uint(int(uint(_204) >> uint(2)));
    uint _208 = uint(int(uint(int(_206)) >> uint(2)));
    int _210 = int(_206) & 3;
    float _212 = (*spvDescriptorSet0.fp_c9)._m0[int(_208)][_210];
    int _214 = int(_206) + 1;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    int _218 = _214 & 3;
    float _220 = (*spvDescriptorSet0.fp_c9)._m0[int(_216)][_218];
    float _222 = _168 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _224 = fma(_200, _112, _122);
    float _226 = _202 * (*spvDescriptorSet0.fp_c11)._m0[30].x;
    float _228 = _222 * (*spvDescriptorSet0.fp_c11)._m0[30].y;
    float _230 = fma(_226, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].x);
    int _232 = _178 + 25920;
    uint _234 = uint(int(uint(_232) >> uint(2)));
    uint _236 = uint(int(uint(int(_234)) >> uint(2)));
    int _238 = int(_234) & 3;
    float _240 = (*spvDescriptorSet0.fp_c9)._m0[int(_236)][_238];
    int _242 = int(_234) + 1;
    uint _244 = uint(int(uint(_242) >> uint(2)));
    int _246 = _242 & 3;
    float _248 = (*spvDescriptorSet0.fp_c9)._m0[int(_244)][_246];
    float _250 = fma(_228, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].y);
    float _252 = _198 * _188;
    float _254 = _224 * _196;
    float2 _1960;
    _1960.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_252, _254));
    _1960.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_252, _254));
    float _256 = _1960.x;
    float _258 = _256 * 256.0;
    int _260 = int(_258);
    float3 _1971 = float3(_230, _250, _176);
    float _262 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_1971, float3(0.0), isnan(_1971))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_1971, float3(0.0), isnan(_1971))).x;
    float _264 = _198 * _212;
    float _266 = _224 * _220;
    float2 _1989;
    _1989.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_264, _266));
    _1989.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_264, _266));
    float _268 = _1989.x;
    float _270 = _268 * 256.0;
    int _272 = int(_270);
    float _274 = _198 * _240;
    float _276 = _224 * _248;
    float2 _2005;
    _2005.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_274, _276));
    _2005.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_274, _276));
    float _278 = _2005.x;
    float _280 = _278 * 256.0;
    int _282 = int(_280);
    int _284 = _178 + 25952;
    uint _286 = uint(int(uint(_284) >> uint(2)));
    uint _288 = uint(int(uint(int(_286)) >> uint(2)));
    int _290 = int(_286) & 3;
    float _292 = (*spvDescriptorSet0.fp_c9)._m0[int(_288)][_290];
    int _294 = _178 + 25936;
    uint _296 = uint(int(uint(_294) >> uint(2)));
    uint _298 = uint(int(uint(int(_296)) >> uint(2)));
    int _300 = int(_296) & 3;
    float _302 = (*spvDescriptorSet0.fp_c9)._m0[int(_298)][_300];
    int _304 = int(_296) + 1;
    uint _306 = uint(int(uint(_304) >> uint(2)));
    int _308 = _304 & 3;
    float _310 = (*spvDescriptorSet0.fp_c9)._m0[int(_306)][_308];
    float _312 = rint(_292);
    float _314 = precise::max(_312, 0.0);
    uint _316 = uint(_314);
    uint _318 = clamp(_316, 0u, 65535u);
    float _320 = precise::max(_160, _310);
    float _322 = float(uint(_260));
    float _324 = _322 * 0.00390625;
    float _326 = precise::max(_320, _324);
    float3 _2088 = float3(_252, _254, float(int(_318)));
    float3 _2090 = select(_2088, float3(0.0), isnan(_2088));
    float3 _330 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2090.xy, uint(rint(_2090.z)), level(_326)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2090.xy, uint(rint(_2090.z)), level(_326)).xyz;
    float _332 = _330.x;
    float _334 = _330.y;
    float _336 = _330.z;
    float _338 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _340 = _170 + _338;
    float _342 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _344 = _166 + _342;
    float _346 = _340 * _340;
    float _348 = fma(_344, _344, _346);
    float _350 = sqrt(_348);
    bool _354 = _350 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _356 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _358 = _350 + _356;
    float _360 = _254;
    float _362 = _358;
    float _364 = _250;
    float _366 = (*spvDescriptorSet0.fp_c11)._m0[45].x;
    if (_354)
    {
        float _368 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _360 = _368;
    }
    float _370 = _360;
    float _372 = _370;
    if (_354)
    {
        float _374 = _358 * _370;
        _362 = _374;
    }
    float _376 = _362;
    float _378 = 0.0;
    if (_354)
    {
        float _380 = _376 * 0.15915493667125701904296875;
        _378 = _380;
    }
    float _382 = _378;
    float _384 = _326;
    if (_354)
    {
        float _386 = _382 * 6.283185482025146484375;
        float _388 = cos(_386);
        _384 = _388;
    }
    float _390 = _384;
    float _392 = _376;
    if (_354)
    {
        float _394 = _382 * 6.283185482025146484375;
        float _396 = sin(_394);
        _392 = _396;
    }
    float _398 = _392;
    float _400 = _254;
    if (_354)
    {
        float _402 = rsqrt(_348);
        _400 = _402;
    }
    float _404 = _400;
    if (_354)
    {
        float _406 = _168 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _372 = _406;
    }
    float _408 = _372;
    float _410 = _408;
    if (_354)
    {
        float _412 = _390 + (-1.0);
        _364 = _412;
    }
    float _414 = _364;
    float _416 = _414;
    if (_354)
    {
        float _418 = _414 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _366 = _418;
    }
    float _420 = _366;
    float _422 = 0.0;
    float _424 = _398;
    if (_354)
    {
        float _426 = fma(_398, _408, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _422 = _426;
    }
    float _428 = _422;
    if (!_354)
    {
        _410 = _168;
    }
    float _430 = _410;
    float _432 = _430;
    if (_354)
    {
        float _434 = fma(_168, _390, _420);
        _432 = _434;
    }
    float _436 = _432;
    if (!_354)
    {
        _416 = _166;
    }
    float _438 = _416;
    float _440 = _404;
    float _442 = _438;
    if (_354)
    {
        float _444 = _404 * _428;
        _440 = _444;
    }
    float _446 = _440;
    float _448 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _450 = _436 + _448;
    if (!_354)
    {
        _424 = _170;
    }
    float _452 = _424;
    float _454 = _452;
    if (_354)
    {
        float _456 = fma(_344, _446, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _442 = _456;
    }
    float _458 = _442;
    if (_354)
    {
        float _460 = fma(_340, _446, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _454 = _460;
    }
    float _462 = _454;
    float _464 = _450 * _450;
    float _466 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _468 = _458 + _466;
    float _470 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _472 = _462 + _470;
    float _474 = fma(_468, _468, _464);
    float _476 = fma(_472, _472, _474);
    float _478 = rsqrt(_476);
    float _480 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _482 = _168 + _480;
    float _484 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _486 = _166 + _484;
    float _488 = _482 * _482;
    float _490 = _478 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _492 = _468 * _490;
    float _494 = _472 * _490;
    float _496 = _492 * _492;
    float _498 = _494 * _494;
    float _500 = fma(_486, _486, _488);
    float _502 = _496 + _498;
    float _504 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _506 = _170 + _504;
    float _508 = sqrt(_502);
    float _510 = in.m_70.x;
    float _512 = gl_FragCoord.w;
    float _514 = _510 * _512;
    float _516 = in.m_70.y;
    float _518 = gl_FragCoord.w;
    float _520 = _516 * _518;
    float _522 = in.m_70.z;
    float _524 = gl_FragCoord.w;
    float _526 = _522 * _524;
    float _528 = fma(_506, _506, _500);
    float _530 = sqrt(_528);
    bool _532 = _508 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _534 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _536 = precise::max(0.0, _534);
    float _538 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _540 = fma(_530, (*spvDescriptorSet0.fp_c9)._m0[63].x, _538);
    float _542 = precise::clamp(_540, 0.0, 1.0);
    float _544 = -_490;
    float _546 = -_536;
    float _548 = fma(_450, _544, _546);
    float _550 = (*spvDescriptorSet0.fp_c9)._m0[63].x;
    float _552 = _542;
    float _554 = _498;
    float _556 = _548;
    float _558 = _494;
    if (!_532)
    {
        _550 = _498;
    }
    float _560 = _550;
    float _562 = -_542;
    float _564 = _562 + 1.0;
    float _566 = _560;
    if (!_532)
    {
        _552 = _496;
    }
    float _568 = _552;
    float _570 = _568;
    if (!_532)
    {
        _554 = _492;
    }
    float _572 = _554;
    bool _574 = !_532;
    float _576 = _572;
    if (!_574)
    {
        float _578 = _492 * _492;
        float _580 = _494 * _494;
        float _582 = _578 + _580;
        float _584 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _586 = sqrt(_582);
        float _588 = rsqrt(_582);
        float _590 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _592 = _586 + _590;
        float _594 = _592 * _584;
        float _596 = _548 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _598 = _594 * 0.15915493667125701904296875;
        float _600 = _598 * 6.283185482025146484375;
        float _602 = sin(_600);
        float _604 = _598 * 6.283185482025146484375;
        float _606 = cos(_604);
        float _608 = fma(_602, _596, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _610 = _588 * _608;
        float _612 = _606 + (-1.0);
        float _614 = _492 * _610;
        float _616 = _494 * _610;
        float _618 = _612 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _620 = fma(_548, _606, _618);
        float _622 = _614 * _614;
        float _624 = _616 * _616;
        _556 = _620;
        _570 = _622;
        _566 = _624;
        _576 = _614;
        _558 = _616;
    }
    float _626 = _556;
    float _628 = _570;
    float _630 = _566;
    float _632 = _576;
    float _634 = _558;
    float _636 = fma(_626, _626, _628);
    float _638 = _168 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _640 = _168 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _642 = abs(_564);
    float _644 = log2(_642);
    float _646 = _636 + _630;
    float _648 = fma(_166, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _638);
    float _650 = fma(_166, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _640);
    float _652 = _162 * _520;
    float _654 = spvFAdd(_530, 9.9999997473787516355514526367188e-06);
    float _656 = fma(_170, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _648);
    float _658 = fma(_170, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _650);
    float _660 = rsqrt(_646);
    float _662 = _162 * _514;
    float _664 = _656 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _666 = _658 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _668 = _162 * _526;
    int _670 = _178 + 25944;
    uint _672 = uint(int(uint(_670) >> uint(2)));
    uint _674 = uint(int(uint(int(_672)) >> uint(2)));
    int _676 = int(_672) & 3;
    float _678 = (*spvDescriptorSet0.fp_c9)._m0[int(_674)][_676];
    float _680 = _652 * _652;
    float _682 = trunc(_664);
    int _684 = int(_682);
    float _686 = _644 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _688 = fma(_662, _662, _680);
    float _690 = in.m_72.w;
    float _692 = gl_FragCoord.w;
    float _694 = _690 * _692;
    float _696 = fma(_668, _668, _688);
    float _698 = trunc(_666);
    int _700 = int(_698);
    float _702 = _660 * _632;
    float _704 = _660 * _626;
    float _706 = _660 * _634;
    float _708 = in.m_74.x;
    float _710 = gl_FragCoord.w;
    float _712 = _708 * _710;
    float _714 = _702 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _716 = precise::max(_160, _302);
    float _718 = exp2(_686);
    float _720 = -_714;
    float _722 = fma(_704, (*spvDescriptorSet0.fp_c9)._m0[69].y, _720);
    int _724 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _726 = _684 + _724;
    int _728 = _726 + 1;
    float _730 = _704 + 1.0;
    float _732 = -_706;
    float _734 = fma(_732, (*spvDescriptorSet0.fp_c9)._m0[69].z, _722);
    bool _736 = _728 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    int _738 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _740 = _700 + _738;
    int _742 = _740 + 1;
    float _744 = fma(_734, -0.5, 0.5);
    float _746 = precise::max(_160, _678);
    float _748 = spvFAdd(_530, 9.9999997473787516355514526367188e-06);
    int _750 = _728 | _742;
    float _752 = rsqrt(_696);
    float _754 = fma(_734, 0.5, 0.5);
    bool _756 = _750 < 0;
    bool _758 = _756 || _736;
    float _760 = -_704;
    float _762 = fma(_718, _730, _760);
    bool _764 = _742 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _766 = _764 || _758;
    float _768 = sqrt(_744);
    float _770 = fma(_754, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _772 = _162 * _694;
    float _774 = fma(_762, 0.5, 0.5);
    float _776 = fma(_754, _770, -0.212114393711090087890625);
    float _778 = fma(_166, 6.2500002968590706586837768554688e-05, 0.5);
    float _780 = precise::clamp(_778, 0.0, 1.0);
    float _782 = 1.0 / _748;
    float _784 = _668 * _752;
    float _786 = fma(_754, _776, 1.570728778839111328125);
    float _788 = fma(_170, 6.2500002968590706586837768554688e-05, 0.5);
    float _790 = precise::clamp(_788, 0.0, 1.0);
    float _792 = _662 * _752;
    float _794 = _652 * _752;
    float _796 = -_772;
    float _798 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _800 = _796 + _798;
    float _802 = _668;
    if (_766)
    {
        _802 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _804 = _802;
    float _806 = 1.0 / _654;
    float _808 = _768 * 0.636619746685028076171875;
    float _810 = _804;
    if (!_766)
    {
        int _812 = _742 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _814 = _812 + _728;
        float _816 = floor(_664);
        int _818 = _814 << 2;
        int _820 = _814 >> 2;
        int _822 = 12 & _818;
        int _824 = _820 << 4;
        int _826 = _824 + _822;
        float _828 = floor(_666);
        int _830 = _826 + 16256;
        uint _832 = uint(int(uint(_830) >> uint(2)));
        uint _834 = uint(int(uint(int(_832)) >> uint(2)));
        int _836 = int(_832) & 3;
        float _838 = (*spvDescriptorSet0.fp_c9)._m0[int(_834)][_836];
        float _840 = -_816;
        float _842 = _664 + _840;
        float _844 = -_828;
        float _846 = _666 + _844;
        float _848 = rint(_838);
        float _850 = precise::max(_848, 0.0);
        uint _852 = uint(_850);
        uint _854 = clamp(_852, 0u, 65535u);
        float3 _2883 = float3(_842, _846, float(int(_854)));
        float3 _2885 = select(_2883, float3(0.0), isnan(_2883));
        float _856 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, _2885.xy, uint(rint(_2885.z))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, _2885.xy, uint(rint(_2885.z))).x;
        int _858 = _814 << 4;
        int _860 = _858 + 17904;
        int _862 = _826 + 24304;
        uint _864 = uint(int(uint(_862) >> uint(2)));
        uint _866 = uint(int(uint(int(_864)) >> uint(2)));
        int _868 = int(_864) & 3;
        float _870 = (*spvDescriptorSet0.fp_c9)._m0[int(_866)][_868];
        uint _872 = uint(int(uint(_860) >> uint(2)));
        uint _874 = uint(int(uint(int(_872)) >> uint(2)));
        int _876 = int(_872) & 3;
        float _878 = (*spvDescriptorSet0.fp_c9)._m0[int(_874)][_876];
        int _880 = int(_872) + 1;
        uint _882 = uint(int(uint(_880) >> uint(2)));
        int _884 = _880 & 3;
        float _886 = (*spvDescriptorSet0.fp_c9)._m0[int(_882)][_884];
        int _888 = _860 + 8;
        uint _890 = uint(int(uint(_888) >> uint(2)));
        uint _892 = uint(int(uint(int(_890)) >> uint(2)));
        int _894 = int(_890) & 3;
        float _896 = (*spvDescriptorSet0.fp_c9)._m0[int(_892)][_894];
        int _898 = int(_890) + 1;
        uint _900 = uint(int(uint(_898) >> uint(2)));
        int _902 = _898 & 3;
        float _904 = (*spvDescriptorSet0.fp_c9)._m0[int(_900)][_902];
        float _906 = _168 * _886;
        float _908 = fma(_166, _878, _906);
        float _910 = 1.0 / _870;
        float _912 = fma(_170, _896, _908);
        float _914 = _912 + _904;
        float _916 = precise::clamp(_914, 0.0, 1.0);
        float _918 = _870 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _920 = -_916;
        float _922 = _920 + _856;
        float _924 = fma(_910, (*spvDescriptorSet0.fp_c13)._m0[4].w, _922);
        float _926 = _918 * _924;
        float _928 = exp2(_926);
        float _930 = 0.0 + _928;
        float _932 = precise::clamp(_930, 0.0, 1.0);
        float _934 = precise::min(_932, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _810 = _934;
    }
    float _936 = _810;
    float _938 = float(uint(_272));
    float _940 = _800 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _942 = precise::clamp(_940, 0.0, 1.0);
    float _944 = float(uint(_282));
    float _946 = -_936;
    float _948 = _946 + 1.0;
    float _950 = _938 * 0.00390625;
    float _952 = _486 * _782;
    float _954 = _944 * 0.00390625;
    float _956 = fma(_942, _948, _936);
    float _958 = -(*spvDescriptorSet0.fp_c9)._m0[1007].x;
    float _960 = _958 + (*spvDescriptorSet0.fp_c9)._m0[1006].x;
    float _962 = precise::max(_716, _950);
    float _964 = _482 * _806;
    float _966 = -(*spvDescriptorSet0.fp_c9)._m0[1007].y;
    float _968 = _966 + (*spvDescriptorSet0.fp_c9)._m0[1006].y;
    float _970 = _792 * _952;
    float _972 = _506 * _782;
    float _974 = fma(_794, 0.5, 0.5);
    float _976 = _482 * _782;
    float _978 = -(*spvDescriptorSet0.fp_c9)._m0[1007].z;
    float _980 = _978 + (*spvDescriptorSet0.fp_c9)._m0[1006].z;
    float _982 = -_964;
    float _984 = -_970;
    float _986 = fma(_794, _982, _984);
    float _988 = fma(_974, _968, (*spvDescriptorSet0.fp_c9)._m0[1007].y);
    float _990 = fma(_974, _960, (*spvDescriptorSet0.fp_c9)._m0[1007].x);
    float _992 = _162 * _712;
    float _994 = _976 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _996 = _988 * 0.715200006961822509765625;
    float _998 = fma(_974, _980, (*spvDescriptorSet0.fp_c9)._m0[1007].z);
    float _1000 = -_786;
    float _1002 = fma(_808, _1000, 1.0);
    float _1004 = _976 + (*spvDescriptorSet0.fp_c9)._m0[67].y;
    float _1006 = fma(_990, 0.2125999927520751953125, _996);
    float _1008 = in.m_74.y;
    float _1010 = gl_FragCoord.w;
    float _1012 = _1008 * _1010;
    float _1014 = fma(_952, (*spvDescriptorSet0.fp_c9)._m0[69].x, _994);
    float _1016 = _952 + (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _1018 = fma(_998, 0.072200000286102294921875, _1006);
    float _1020 = _1004 * _1004;
    float _1022 = fma(_972, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1014);
    float _1024 = _972 + (*spvDescriptorSet0.fp_c9)._m0[67].z;
    float _1026 = -_972;
    float _1028 = fma(_784, _1026, _986);
    float _1030 = precise::clamp(_1028, 0.0, 1.0);
    float _1032 = fma(_1016, _1016, _1020);
    float _1034 = precise::max(_746, _954);
    float _1036 = 1.0 / _1018;
    float _1038 = fma(_1024, _1024, _1032);
    float _1040 = rsqrt(_1038);
    float3 _3193 = float3(_274, _276, float(int(_318)));
    float3 _3195 = select(_3193, float3(0.0), isnan(_3193));
    float3 _1042 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _3195.xy, uint(rint(_3195.z)), level(_1034)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _3195.xy, uint(rint(_3195.z)), level(_1034)).xyz;
    float _1044 = _1042.x;
    float _1046 = _1042.y;
    float _1048 = _1042.z;
    float3 _3211 = float3(_264, _266, float(int(_318)));
    float3 _3213 = select(_3211, float3(0.0), isnan(_3211));
    float2 _1052 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _3213.xy, uint(rint(_3213.z)), level(_962)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _3213.xy, uint(rint(_3213.z)), level(_962)).yz;
    float _1054 = _1052.x;
    float _1056 = _1052.y;
    float _1058 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1060 = _1058 + 1.0;
    float _1062 = _162 * _1012;
    float2 _3233 = float2(_992, _1062);
    float _1064 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3233, float2(0.0), isnan(_3233))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3233, float2(0.0), isnan(_3233))).x;
    float2 _3243 = float2(_780, _790);
    float _1066 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_3243, float2(0.0), isnan(_3243))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_3243, float2(0.0), isnan(_3243))).x;
    float2 _3251 = float2(_992, _1062);
    float3 _1068 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3251, float2(0.0), isnan(_3251))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3251, float2(0.0), isnan(_3251))).xyz;
    float _1070 = _1068.x;
    float _1072 = _1068.y;
    float _1074 = _1068.z;
    float2 _3265 = float2(_1002, _774);
    float3 _1076 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_3265, float2(0.0), isnan(_3265))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_3265, float2(0.0), isnan(_3265))).xyz;
    float _1078 = _1076.x;
    float _1080 = _1076.y;
    float _1082 = _1076.z;
    float _1084 = _794 * _794;
    float _1086 = _1036 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1088 = precise::clamp(_1086, 0.0, 1.0);
    float _1090 = _1004 * _1040;
    float _1092 = fma(_792, _792, _1084);
    float _1094 = abs(_482);
    bool _1096 = _1094 > 0.00999999977648258209228515625;
    float _1098 = _1016 * _1040;
    float _1100 = -(*spvDescriptorSet0.fp_c9)._m0[1001].z;
    float _1102 = _1100 + (*spvDescriptorSet0.fp_c9)._m0[1000].z;
    float _1104 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].x, _1060);
    float _1106 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].y, _1060);
    float _1108 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].z, _1060);
    float _1110 = _792 * (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _1112 = _1090 * (*spvDescriptorSet0.fp_c9)._m0[67].y;
    float _1114 = _1024 * _1040;
    float _1116 = precise::max(_262, 0.25);
    float _1118 = -_794;
    float _1120 = -_1110;
    float _1122 = fma(_1118, (*spvDescriptorSet0.fp_c9)._m0[67].y, _1120);
    float _1124 = fma(_1098, (*spvDescriptorSet0.fp_c9)._m0[67].x, _1112);
    float _1126 = precise::max(0.0, _794);
    float _1128 = _334 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1130 = -_784;
    float _1132 = fma(_1130, (*spvDescriptorSet0.fp_c9)._m0[67].z, _1122);
    float _1134 = precise::clamp(_1132, 0.0, 1.0);
    float _1136 = fma(_784, _784, _1092);
    float _1138 = precise::clamp(_1136, 0.0, 1.0);
    float _1140 = fma(_1088, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _1142 = fma(_1114, (*spvDescriptorSet0.fp_c9)._m0[67].z, _1124);
    float _1144 = precise::clamp(_1142, 0.0, 1.0);
    float _1146 = _1140 * 0.31830990314483642578125;
    float _1148 = fma(_1138, 0.5, 0.5);
    float _1150 = -(*spvDescriptorSet0.fp_c9)._m0[1001].x;
    float _1152 = _1150 + (*spvDescriptorSet0.fp_c9)._m0[1000].x;
    float _1154 = -_1030;
    float _1156 = _1154 + 1.0;
    float _1158 = -(*spvDescriptorSet0.fp_c9)._m0[1001].y;
    float _1160 = _1158 + (*spvDescriptorSet0.fp_c9)._m0[1000].y;
    float _1162 = _990 * _1146;
    float _1164 = _988 * _1146;
    float _1166 = _998 * _1146;
    float _1168 = -_1134;
    float _1170 = _1168 + 1.0;
    float _1172 = fma(_974, _1152, (*spvDescriptorSet0.fp_c9)._m0[1001].x);
    float _1174 = fma(_974, _1160, (*spvDescriptorSet0.fp_c9)._m0[1001].y);
    float _1176 = fma(_974, _1102, (*spvDescriptorSet0.fp_c9)._m0[1001].z);
    float _1178 = _1096 ? _482 : 0.00999999977648258209228515625;
    float _1180 = _1170 * _1170;
    float _1182 = _1156 * _1156;
    float _1184 = _1172 * 0.31830990314483642578125;
    float _1186 = _1180 * _1180;
    float _1188 = _1178 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _1190 = _1182 * _1182;
    float _1192 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1194 = _1170 * _1186;
    float _1196 = precise::min(_1126, 0.100000001490116119384765625);
    float _1198 = _1156 * _1190;
    float _1200 = precise::max(_1188, -127.0);
    float _1202 = -_1192;
    float _1204 = exp2(_1202);
    float _1206 = _1106 * (*spvDescriptorSet0.fp_c11)._m0[39].w;
    float _1208 = _1108 + (-1.0);
    float _1210 = precise::min(_1148, 1.0);
    float _1212 = precise::min(_1206, (*spvDescriptorSet0.fp_c11)._m0[13].x);
    float _1214 = -_1200;
    float _1216 = exp2(_1214);
    float _1218 = -_1212;
    float _1220 = _1218 + 1.0;
    float _1222 = 1.0 / _1200;
    float _1224 = -_1216;
    float _1226 = _1224 + 1.0;
    float _1228 = _1204 * _1226;
    float _1230 = fma(_1196, 10.0, -1.0);
    float _1232 = _644 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1234 = _1228 * _1222;
    float _1236 = _530 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1238 = fma(_1022, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _1240 = _1116 + _1230;
    float _1242 = exp2(_1232);
    float _1244 = in.m_72.x;
    float _1246 = gl_FragCoord.w;
    float _1248 = _1244 * _1246;
    float _1250 = fma(_1238, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1252 = _1234 * _1236;
    float _1254 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1256 = fma(_1254, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1258 = in.m_72.z;
    float _1260 = gl_FragCoord.w;
    float _1262 = _1258 * _1260;
    float _1264 = abs(_1250);
    float _1266 = log2(_1264);
    float _1268 = -_1252;
    float _1270 = exp2(_1268);
    float _1272 = -_1242;
    float _1274 = _1272 + 1.0;
    float _1276 = _1266 * 1.5;
    float _1278 = in.m_72.y;
    float _1280 = gl_FragCoord.w;
    float _1282 = _1278 * _1280;
    float _1284 = exp2(_1276);
    float _1286 = _332 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1288 = -_1270;
    float _1290 = _1288 + 1.0;
    float _1292 = _162 * _1262;
    float _1294 = _1284 * 12.56637096405029296875;
    float _1296 = 1.0 / _1294;
    float _1298 = _1256 * _1296;
    float _1300 = _1274 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1302 = _1290 * _1298;
    float _1304 = -_1300;
    float _1306 = _1304 + 1.0;
    float _1308 = precise::max(_1286, _1184);
    float _1310 = _1300 * _1270;
    float _1312 = _162 * _1248;
    float _1314 = _1270 * _1306;
    float _1316 = _1176 * 0.31830990314483642578125;
    float _1318 = _1174 * 0.31830990314483642578125;
    float _1320 = _336 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1322 = _162 * _1282;
    float _1324 = precise::min(_956, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1326 = precise::max(_1128, _1318);
    float _1328 = precise::max(_1320, _1316);
    float _1330 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1332 = _1324 * _1302;
    float _1334 = _1046 * 0.4774648249149322509765625;
    float _1336 = _1044 * 0.4774648249149322509765625;
    float _1338 = _1048 * 0.4774648249149322509765625;
    float _1340 = _1334 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1342 = _1336 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1344 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1346 = _1054 + (*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1348 = precise::clamp(_1346, 0.0, 1.0);
    float _1350 = fma(_1056, _1330, _1340);
    float _1352 = _1338 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1354 = fma(_1056, _1344, _1342);
    float _1356 = _1348 * _1308;
    float _1358 = _1350 * 0.586610972881317138671875;
    float _1360 = _1348 * _1326;
    float _1362 = _1348 * _1328;
    float _1364 = precise::max(_1342, _1162);
    float _1366 = fma(_1354, 0.298911988735198974609375, _1358);
    float _1368 = precise::max(_1340, _1164);
    float _1370 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1372 = fma(_1064, 2.0, -0.5);
    float _1374 = precise::clamp(_1372, 0.0, 1.0);
    float _1376 = 0.0 + _1066;
    float _1378 = precise::clamp(_1376, 0.0, 1.0);
    float _1380 = fma(_1056, _1370, _1352);
    float _1382 = _1240 * 4.0;
    float _1384 = precise::clamp(_1382, 0.0, 1.0);
    float _1386 = -(*spvDescriptorSet0.fp_c11)._m0[13].y;
    float _1388 = _1386 + (*spvDescriptorSet0.fp_c11)._m0[13].z;
    float _1390 = _1374 * _1220;
    float _1392 = _956 * _1378;
    float _1394 = fma(_1380, 0.114477999508380889892578125, _1366);
    float _1396 = _1030 * (-9.27999973297119140625);
    float _1398 = fma(_1390, _1388, (*spvDescriptorSet0.fp_c11)._m0[13].y);
    float _1400 = _1392 * _1384;
    float _1402 = _1322 * 0.18672408163547515869140625;
    float _1404 = precise::max(_1352, _1166);
    float _1406 = -_1064;
    float _1408 = fma(_1064, _1398, _1406);
    float _1410 = exp2(_1396);
    float _1412 = fma(_1312, 0.095146648585796356201171875, _1402);
    float _1414 = fma(_1400, _1408, _1064);
    float _1416 = _1144 * _1144;
    float _1418 = fma(_1292, 0.0364394821226596832275390625, _1412);
    float _1420 = -_1414;
    float _1422 = _1420 + 1.0;
    float _1424 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1426 = _1414 * _1416;
    float _1428 = _1426 * 2.0;
    float _1430 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1432 = precise::max(_1418, 0.00999999977648258209228515625);
    float _1434 = _1422 * _1422;
    float _1436 = fma(_1414, 0.5, _1428);
    float _1438 = fma(_1056, _1424, _1364);
    float _1440 = fma(_1056, _1430, _1368);
    float _1442 = fma(_1056, _1370, _1404);
    float _1444 = precise::min(_1434, _1410);
    float _1446 = 1.0 / _1432;
    float _1448 = _1436 + (-1.0);
    float _1450 = fma(_1414, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1452 = fma(_1194, _1448, 1.0);
    float _1454 = fma(_1414, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1456 = fma(_1198, _1448, 1.0);
    float _1458 = fma(_1414, -0.572000026702880859375, 1.03999996185302734375);
    float _1460 = fma(_1400, _1208, 1.0);
    float _1462 = fma(_1422, _1444, _1454);
    float _1464 = _1452 * _1456;
    float _1466 = fma(_1414, -0.337748348712921142578125, 1.0);
    float _1468 = fma(_1462, 1.03999996185302734375, _1450);
    float _1470 = precise::clamp(_1468, 0.0, 1.0);
    float _1472 = _1394 * _1446;
    float _1474 = fma(_1462, -1.03999996185302734375, _1458);
    float _1476 = precise::clamp(_1474, 0.0, 1.0);
    float _1478 = fma(_1374, -0.449999988079071044921875, 1.0);
    float _1480 = _1460 * _1470;
    float _1482 = -_1104;
    float _1484 = fma(_1482, (*spvDescriptorSet0.fp_c11)._m0[36].z, 1.0);
    float _1486 = precise::min(_1472, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1488 = _1466 * _1464;
    float _1490 = fma(_1476, 0.039999999105930328369140625, _1480);
    float _1492 = _1070 * _1478;
    float _1494 = precise::max(0.0, _1484);
    float _1496 = _1486 * 0.31830990314483642578125;
    float _1498 = _1134 * _1488;
    float _1500 = -_1492;
    float _1502 = _1070 + _1500;
    float _1504 = _1072 * _1478;
    float _1506 = _1074 * _1478;
    float _1508 = _1490 * _1496;
    float _1510 = fma(_1494, _1502, _1492);
    float _1512 = -_1504;
    float _1514 = _1072 + _1512;
    float _1516 = -_1506;
    float _1518 = _1074 + _1516;
    float _1520 = _1498 * 0.31830990314483642578125;
    float _1522 = -_1070;
    float _1524 = _1522 + _1510;
    float _1526 = fma(_1494, _1514, _1504);
    float _1528 = fma(_1494, _1518, _1506);
    float _1530 = _1312 * _1508;
    float _1532 = fma(_1400, _1524, _1070);
    float _1534 = -_1072;
    float _1536 = _1534 + _1526;
    float _1538 = -_1074;
    float _1540 = _1538 + _1528;
    float _1542 = _1520 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1544 = _1322 * _1508;
    float _1546 = fma(_1400, _1536, _1072);
    float _1548 = fma(_1400, _1540, _1074);
    float _1550 = _1520 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1552 = _1532 * _1542;
    float _1554 = _1356 * _1532;
    float _1556 = _1532 * _1438;
    float _1558 = _1520 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1560 = _1360 * _1546;
    float _1562 = _1546 * _1440;
    float _1564 = _1546 * _1550;
    float _1566 = fma(_956, _1552, _1530);
    float _1568 = _1292 * _1508;
    float _1570 = _1548 * _1558;
    float _1572 = fma(_956, _1564, _1544);
    float _1574 = fma(_1210, _1556, _1566);
    float _1576 = _1362 * _1548;
    float _1578 = fma(_956, _1570, _1568);
    float _1580 = _1548 * _1442;
    float _1582 = _1332 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1584 = fma(_1210, _1562, _1572);
    float _1586 = _1332 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1588 = _1210 * _1554;
    float _1590 = _1210 * _1560;
    float _1592 = _1332 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1594 = precise::max(0.0, _1574);
    float _1596 = _1210 * _1576;
    float _1598 = fma(_1210, _1580, _1578);
    float _1600 = fma(_1078, _1310, _1582);
    float _1602 = fma(_1080, _1310, _1586);
    float _1604 = precise::max(0.0, _1584);
    float _1606 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1608 = _530 + _1606;
    float _1610 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1612 = _530 + _1610;
    float _1614 = fma(_1082, _1310, _1592);
    float _1616 = precise::max(0.0, _1588);
    float _1618 = fma(_1314, _1594, _1600);
    float _1620 = precise::max(0.0, _1590);
    float _1622 = fma(_1314, _1604, _1602);
    float _1624 = precise::max(0.0, _1596);
    float _1626 = _1608 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1628 = precise::clamp(_1626, 0.0, 1.0);
    float _1630 = precise::max(0.0, _1598);
    float _1632 = _1314 * _1616;
    float _1634 = _1314 * _1620;
    float _1636 = _1612 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1638 = precise::clamp(_1636, 0.0, 1.0);
    float _1640 = _1314 * _1624;
    float _1642 = fma(_1314, _1630, _1614);
    float _1644 = fma(_1628, _1632, _1618);
    float _1646 = fma(_1628, _1634, _1622);
    float _1648 = fma(_1638, _1632, _1618);
    float _1650 = fma(_1638, _1634, _1622);
    float _1652 = fma(_1628, _1640, _1642);
    float _1654 = fma(_1638, _1640, _1642);
    out.m_77.x = _1644;
    out.m_77.y = _1646;
    out.m_77.z = _1652;
    out.m_77.w = 1.0;
    out.m_79.x = _1648;
    out.m_79.y = _1650;
    out.m_79.z = _1654;
    out.m_79.w = 1.0;
    return out;
}

