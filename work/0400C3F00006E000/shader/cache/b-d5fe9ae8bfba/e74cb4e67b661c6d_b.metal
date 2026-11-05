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
    texture2d<float> fp_t_tcb_1A [[id(12)]];
    sampler fp_t_tcb_1ASmplr [[id(13)]];
    texture3d<float> fp_t_tcb_1C [[id(14)]];
    sampler fp_t_tcb_1CSmplr [[id(15)]];
    texture2d<float> fp_t_tcb_E [[id(16)]];
    sampler fp_t_tcb_ESmplr [[id(17)]];
    texture2d<float> fp_t_tcb_10 [[id(18)]];
    sampler fp_t_tcb_10Smplr [[id(19)]];
    texture2d_array<float> fp_t_tcb_12 [[id(20)]];
    sampler fp_t_tcb_12Smplr [[id(21)]];
    texture2d<float> fp_t_tcb_14 [[id(22)]];
    sampler fp_t_tcb_14Smplr [[id(23)]];
    sampler fp_t_tcb_8Smplr_w [[id(24)]];
    sampler fp_t_tcb_ASmplr_w [[id(25)]];
    sampler fp_t_tcb_CSmplr_w [[id(26)]];
    sampler fp_t_tcb_1ASmplr_w [[id(27)]];
    sampler fp_t_tcb_1CSmplr_w [[id(28)]];
    sampler fp_t_tcb_ESmplr_w [[id(29)]];
    sampler fp_t_tcb_10Smplr_w [[id(30)]];
    sampler fp_t_tcb_12Smplr_w [[id(31)]];
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
    float4 m_72 [[user(locn1)]];
    float4 m_66 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
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
    int _112 = _92 + 8;
    int _114 = _92 + 16;
    int _116 = _92 + 24;
    uint _118 = uint(int(uint(_112) >> uint(2)));
    float _120 = as_type<float>(_dmw0.z);
    int _122 = _112 + 4;
    uint _124 = uint(int(uint(_122) >> uint(2)));
    float _126 = as_type<float>(_dmw0.w);
    uint _128 = uint(int(uint(_114) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_128)];
    float _130 = as_type<float>(_dmw1.x);
    int _132 = _114 + 4;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw1.y);
    uint _138 = uint(int(uint(_116) >> uint(2)));
    float _140 = as_type<float>(_dmw1.z);
    int _142 = _116 + 4;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>(_dmw1.w);
    float _148 = gl_FragCoord.w;
    float _150 = in.m_66.z;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_66.w;
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
    float _228 = fma(_164, _106, _126);
    float _230 = fma(_164, _136, _146);
    float _232 = _224 * _176;
    float _234 = _226 * _176;
    float _236 = _228 * _184;
    float _238 = _230 * _184;
    float _240 = _226 * _194;
    float _242 = _230 * _202;
    float2 _2011;
    _2011.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_234, _238));
    _2011.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_234, _238));
    float _244 = _2011.x;
    float _246 = _244 * 256.0;
    int _248 = int(_246);
    float2 _2022;
    _2022.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_232, _236));
    _2022.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_232, _236));
    float _250 = _2022.x;
    float _252 = _250 * 256.0;
    int _254 = int(_252);
    float2 _2032;
    _2032.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_240, _242));
    _2032.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_240, _242));
    float _256 = _2032.x;
    float _258 = _256 * 256.0;
    int _260 = int(_258);
    float _262 = _226 * _212;
    float _264 = _230 * _220;
    float2 _2048;
    _2048.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_262, _264));
    _2048.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_262, _264));
    float _266 = _2048.x;
    float _268 = _266 * 256.0;
    int _270 = int(_268);
    int _272 = _92 + 68;
    int _274 = _166 + 25936;
    uint _276 = uint(int(uint(_274) >> uint(2)));
    uint _278 = uint(int(uint(int(_276)) >> uint(2)));
    int _280 = int(_276) & 3;
    float _282 = (*spvDescriptorSet0.fp_c9)._m0[int(_278)][_280];
    int _284 = int(_276) + 1;
    uint _286 = uint(int(uint(_284) >> uint(2)));
    int _288 = _284 & 3;
    float _290 = (*spvDescriptorSet0.fp_c9)._m0[int(_286)][_288];
    int _292 = _92 + 64;
    uint _294 = uint(int(uint(_272) >> uint(2)));
    float _296 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_294)]);
    uint _298 = uint(int(uint(_292) >> uint(2)));
    float _300 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_298)]);
    float _302 = in.m_68.z;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_68.x;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_68.y;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    int _320 = _166 + 25944;
    uint _322 = uint(int(uint(_320) >> uint(2)));
    uint _324 = uint(int(uint(int(_322)) >> uint(2)));
    int _326 = int(_322) & 3;
    float _328 = (*spvDescriptorSet0.fp_c9)._m0[int(_324)][_326];
    float _330 = in.m_70.z;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = in.m_72.y;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_72.x;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    int _348 = _166 + 25952;
    uint _350 = uint(int(uint(_348) >> uint(2)));
    uint _352 = uint(int(uint(int(_350)) >> uint(2)));
    int _354 = int(_350) & 3;
    float _356 = (*spvDescriptorSet0.fp_c9)._m0[int(_352)][_354];
    float _358 = _162 * _306;
    float _360 = _162 * _312;
    float _362 = _162 * _318;
    float _364 = rint(_356);
    float _366 = precise::max(_364, 0.0);
    uint _368 = uint(_366);
    uint _370 = clamp(_368, 0u, 65535u);
    float _372 = _358 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _374 = _360 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _376 = _362 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _378 = _372 * (*spvDescriptorSet0.fp_c11)._m0[30].z;
    float _380 = _374 * (*spvDescriptorSet0.fp_c11)._m0[30].x;
    float _382 = _376 * (*spvDescriptorSet0.fp_c11)._m0[30].y;
    float _384 = _162 * _346;
    float _386 = _162 * _334;
    float _388 = float(uint(_254));
    float _390 = precise::max(_296, _290);
    float _392 = precise::max(_296, _282);
    float _394 = precise::max(_300, _282);
    float _396 = in.m_70.w;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = _388 * 0.00390625;
    float _404 = float(uint(_270));
    float _406 = float(uint(_248));
    float _408 = precise::max(_394, _402);
    float _410 = float(uint(_260));
    float _412 = _404 * 0.00390625;
    float _414 = precise::max(_296, _328);
    float _416 = fma(_378, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].z);
    float _418 = _406 * 0.00390625;
    float _420 = fma(_380, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].x);
    float _422 = fma(_382, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].y);
    float _424 = _410 * 0.00390625;
    float _426 = fma(_360, 6.2500002968590706586837768554688e-05, 0.5);
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = fma(_358, 6.2500002968590706586837768554688e-05, 0.5);
    float _432 = precise::clamp(_430, 0.0, 1.0);
    float _434 = precise::max(_414, _412);
    float _436 = _162 * _340;
    float _438 = precise::max(_392, _418);
    float _440 = precise::max(_390, _424);
    float2 _2324 = float2(_428, _432);
    float _442 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2324, float2(0.0), isnan(_2324))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2324, float2(0.0), isnan(_2324))).x;
    float3 _2335 = float3(_420, _422, _416);
    float _444 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2335, float3(0.0), isnan(_2335))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2335, float3(0.0), isnan(_2335))).x;
    float _446 = _162 * _400;
    float2 _2348 = float2(_384, _436);
    float3 _450 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2348, float2(0.0), isnan(_2348))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2348, float2(0.0), isnan(_2348))).xyz;
    float _452 = _450.x;
    float _454 = _450.y;
    float _456 = _450.z;
    float2 _2362 = float2(_386, _446);
    float3 _458 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2362, float2(0.0), isnan(_2362))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2362, float2(0.0), isnan(_2362))).xyz;
    float _460 = _458.x;
    float _462 = _458.y;
    float _464 = _458.z;
    float3 _2379 = float3(_234, _238, float(int(_370)));
    float3 _2381 = select(_2379, float3(0.0), isnan(_2379));
    float2 _468 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2381.xy, uint(rint(_2381.z)), level(_438)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2381.xy, uint(rint(_2381.z)), level(_438)).yz;
    float _470 = _468.x;
    float _472 = _468.y;
    float3 _2395 = float3(_232, _236, float(int(_370)));
    float3 _2397 = select(_2395, float3(0.0), isnan(_2395));
    float _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2397.xy, uint(rint(_2397.z)), level(_408)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2397.xy, uint(rint(_2397.z)), level(_408)).x;
    float3 _2407 = float3(_240, _242, float(int(_370)));
    float3 _2409 = select(_2407, float3(0.0), isnan(_2407));
    float3 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2409.xy, uint(rint(_2409.z)), level(_440)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2409.xy, uint(rint(_2409.z)), level(_440)).xyz;
    float _478 = _476.x;
    float _480 = _476.y;
    float _482 = _476.z;
    float3 _2425 = float3(_262, _264, float(int(_370)));
    float3 _2427 = select(_2425, float3(0.0), isnan(_2425));
    float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2427.xy, uint(rint(_2427.z)), level(_434)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2427.xy, uint(rint(_2427.z)), level(_434)).xyz;
    float _486 = _484.x;
    float _488 = _484.y;
    float _490 = _484.z;
    float _492 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _494 = _358 + _492;
    float _496 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _498 = _360 + _496;
    float _500 = _494 * _494;
    float _502 = fma(_498, _498, _500);
    float _504 = sqrt(_502);
    bool _508 = _504 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _510 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _512 = _504 + _510;
    float _514 = _422;
    float _516 = _512;
    float _518 = _408;
    float _520 = _240;
    float _522 = _232;
    if (_508)
    {
        float _524 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _514 = _524;
    }
    float _526 = _514;
    if (_508)
    {
        float _528 = _512 * _526;
        _516 = _528;
    }
    float _530 = _516;
    float _532 = _530;
    if (_508)
    {
        float _534 = _530 * 0.15915493667125701904296875;
        _518 = _534;
    }
    float _536 = _518;
    float _538 = _438;
    if (_508)
    {
        float _540 = _536 * 6.283185482025146484375;
        float _542 = cos(_540);
        _538 = _542;
    }
    float _544 = _538;
    float _546 = _238;
    if (_508)
    {
        float _548 = _536 * 6.283185482025146484375;
        float _550 = sin(_548);
        _546 = _550;
    }
    float _552 = _546;
    if (_508)
    {
        float _554 = _362 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _520 = _554;
    }
    float _556 = _520;
    float _558 = as_type<float>(_370);
    float _560 = _556;
    if (_508)
    {
        float _562 = rsqrt(_502);
        _558 = _562;
    }
    float _564 = _558;
    float _566 = _544;
    if (_508)
    {
        float _568 = _544 + (-1.0);
        _532 = _568;
    }
    float _570 = _532;
    float _572 = _552;
    float _574 = _570;
    if (_508)
    {
        float _576 = fma(_552, _556, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _522 = _576;
    }
    float _578 = _522;
    if (_508)
    {
        float _580 = _570 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _560 = _580;
    }
    float _582 = _560;
    if (!_508)
    {
        _572 = _362;
    }
    float _584 = _572;
    float _586 = _584;
    if (_508)
    {
        float _588 = fma(_362, _544, _582);
        _586 = _588;
    }
    float _590 = _586;
    float _592 = _564;
    if (_508)
    {
        float _594 = _564 * _578;
        _592 = _594;
    }
    float _596 = _592;
    if (!_508)
    {
        _574 = _360;
    }
    float _598 = _574;
    float _600 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _602 = _590 + _600;
    float _604 = _598;
    if (_508)
    {
        float _606 = fma(_498, _596, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _604 = _606;
    }
    float _608 = _604;
    if (!_508)
    {
        _566 = _358;
    }
    float _610 = _566;
    float _612 = _610;
    if (_508)
    {
        float _614 = fma(_494, _596, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _612 = _614;
    }
    float _616 = _612;
    float _618 = _602 * _602;
    float _620 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _622 = _608 + _620;
    float _624 = in.m_74.y;
    float _626 = gl_FragCoord.w;
    float _628 = _624 * _626;
    float _630 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _632 = _616 + _630;
    float _634 = fma(_622, _622, _618);
    float _636 = in.m_74.x;
    float _638 = gl_FragCoord.w;
    float _640 = _636 * _638;
    float _642 = fma(_632, _632, _634);
    float _644 = in.m_74.z;
    float _646 = gl_FragCoord.w;
    float _648 = _644 * _646;
    float _650 = rsqrt(_642);
    float _652 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _654 = _362 + _652;
    float _656 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _658 = _360 + _656;
    float _660 = _654 * _654;
    float _662 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _664 = _358 + _662;
    float _666 = fma(_658, _658, _660);
    float _668 = fma(_664, _664, _666);
    float _670 = _650 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _672 = _622 * _670;
    float _674 = _632 * _670;
    float _676 = _162 * _628;
    float _678 = sqrt(_668);
    float _680 = _672 * _672;
    float _682 = _674 * _674;
    float _684 = _676 * _676;
    float _686 = _162 * _640;
    float _688 = _680 + _682;
    float _690 = fma(_686, _686, _684);
    float _692 = sqrt(_688);
    float _694 = _162 * _648;
    float _696 = spvFAdd(_678, 9.9999997473787516355514526367188e-06);
    float _698 = fma(_694, _694, _690);
    float _700 = 1.0 / _696;
    float _702 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    bool _704 = _692 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _706 = rsqrt(_698);
    float _708 = precise::max(0.0, _702);
    float _710 = -_670;
    float _712 = -_708;
    float _714 = fma(_602, _710, _712);
    float _716 = _658 * _700;
    float _718 = _664 * _700;
    float _720 = _654 * _700;
    float _722 = _700;
    float _724 = _680;
    float _726 = _714;
    float _728 = _682;
    float _730 = _672;
    if (!_704)
    {
        _722 = _680;
    }
    float _732 = _722;
    float _734 = _732;
    if (!_704)
    {
        _724 = _674;
    }
    float _736 = _724;
    float _738 = _686 * _706;
    float _740 = _676 * _706;
    float _742 = _694 * _706;
    bool _744 = !_704;
    float _746 = _736;
    if (!_744)
    {
        float _748 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _750 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _752 = _692 + _750;
        float _754 = rsqrt(_688);
        float _756 = _752 * _748;
        float _758 = _714 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _760 = _756 * 0.15915493667125701904296875;
        float _762 = _760 * 6.283185482025146484375;
        float _764 = sin(_762);
        float _766 = _760 * 6.283185482025146484375;
        float _768 = cos(_766);
        float _770 = fma(_764, _758, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _772 = _754 * _770;
        float _774 = _768 + (-1.0);
        float _776 = _672 * _772;
        float _778 = _674 * _772;
        float _780 = _774 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _782 = _778 * _778;
        float _784 = fma(_714, _768, _780);
        float _786 = _776 * _776;
        _726 = _784;
        _734 = _786;
        _728 = _782;
        _730 = _776;
        _746 = _778;
    }
    float _788 = _726;
    float _790 = _734;
    float _792 = _728;
    float _794 = _730;
    float _796 = _746;
    float _798 = _720 + (*spvDescriptorSet0.fp_c9)._m0[67].y;
    float _800 = _720 + (*spvDescriptorSet0.fp_c9)._m0[67].y;
    float _802 = _716 + (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _804 = _798 * _798;
    float _806 = _800 * _800;
    float _808 = fma(_788, _788, _790);
    float _810 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _812 = fma(_678, (*spvDescriptorSet0.fp_c9)._m0[63].x, _810);
    float _814 = precise::clamp(_812, 0.0, 1.0);
    float _816 = fma(_802, _802, _804);
    float _818 = fma(_802, _802, _806);
    float _820 = _808 + _792;
    float _822 = -_814;
    float _824 = _822 + 1.0;
    float _826 = _718 + (*spvDescriptorSet0.fp_c9)._m0[67].z;
    float _828 = _718 + (*spvDescriptorSet0.fp_c9)._m0[67].z;
    float _830 = rsqrt(_820);
    float _832 = _362 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _834 = fma(_826, _826, _816);
    float _836 = fma(_828, _828, _818);
    float _838 = fma(_360, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _832);
    float _840 = abs(_824);
    float _842 = log2(_840);
    float _844 = rsqrt(_834);
    float _846 = _830 * _788;
    float _848 = _830 * _794;
    float _850 = _830 * _796;
    float _852 = _846 + 1.0;
    float _854 = _848 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _856 = _738 * _716;
    float _858 = _842 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _860 = rsqrt(_836);
    float _862 = -_720;
    float _864 = -_856;
    float _866 = fma(_740, _862, _864);
    float _868 = _720 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _870 = _826 * _844;
    float _872 = exp2(_858);
    float _874 = _362 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _876 = fma(_716, (*spvDescriptorSet0.fp_c9)._m0[69].x, _868);
    float _878 = fma(_360, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _874);
    float _880 = _800 * _860;
    float _882 = fma(_358, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _878);
    float _884 = _880 * (*spvDescriptorSet0.fp_c9)._m0[67].y;
    float _886 = _882 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _888 = -_846;
    float _890 = fma(_872, _852, _888);
    float _892 = fma(_358, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _838);
    float _894 = -_854;
    float _896 = fma(_846, (*spvDescriptorSet0.fp_c9)._m0[69].y, _894);
    float _898 = _716 + (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _900 = _892 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _902 = -_850;
    float _904 = fma(_902, (*spvDescriptorSet0.fp_c9)._m0[69].z, _896);
    float _906 = _898 * _860;
    float _908 = trunc(_900);
    int _910 = int(_908);
    float _912 = in.m_76.x;
    float _914 = gl_FragCoord.w;
    float _916 = _912 * _914;
    float _918 = in.m_76.y;
    float _920 = gl_FragCoord.w;
    float _922 = _918 * _920;
    float _924 = fma(_904, 0.5, 0.5);
    float _926 = fma(_906, (*spvDescriptorSet0.fp_c9)._m0[67].x, _884);
    float _928 = fma(_718, (*spvDescriptorSet0.fp_c9)._m0[69].z, _876);
    float _930 = -_718;
    float _932 = fma(_742, _930, _866);
    float _934 = precise::clamp(_932, 0.0, 1.0);
    float _936 = fma(_924, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _938 = trunc(_886);
    int _940 = int(_938);
    float _942 = fma(_904, -0.5, 0.5);
    float _944 = _454 * _462;
    float _946 = fma(_924, _936, -0.212114393711090087890625);
    float _948 = fma(_870, (*spvDescriptorSet0.fp_c9)._m0[67].z, _926);
    float _950 = precise::clamp(_948, 0.0, 1.0);
    float _952 = in.m_76.z;
    float _954 = gl_FragCoord.w;
    float _956 = _952 * _954;
    float _958 = fma(_924, _946, 1.570728778839111328125);
    int _960 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _962 = _910 + _960;
    int _964 = _962 + 1;
    float _966 = in.m_76.w;
    float _968 = gl_FragCoord.w;
    float _970 = _966 * _968;
    float _972 = sqrt(_942);
    bool _974 = _964 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    int _976 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _978 = _940 + _976;
    int _980 = _978 + 1;
    int _982 = _964 | _980;
    bool _984 = _982 < 0;
    bool _986 = _984 || _974;
    float _988 = _972 * 0.636619746685028076171875;
    bool _990 = _980 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _992 = _990 || _986;
    float _994 = -_958;
    float _996 = fma(_988, _994, 1.0);
    float _998 = _452 * _460;
    float _1000 = as_type<float>(_982);
    if (_992)
    {
        _1000 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _1002 = _1000;
    float _1004 = _1002;
    if (!_992)
    {
        int _1006 = _980 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _1008 = _1006 + _964;
        float _1010 = floor(_886);
        int _1012 = _1008 << 2;
        int _1014 = _1008 >> 2;
        int _1016 = 12 & _1012;
        int _1018 = _1014 << 4;
        int _1020 = _1018 + _1016;
        float _1022 = floor(_900);
        int _1024 = _1020 + 16256;
        uint _1026 = uint(int(uint(_1024) >> uint(2)));
        uint _1028 = uint(int(uint(int(_1026)) >> uint(2)));
        int _1030 = int(_1026) & 3;
        float _1032 = (*spvDescriptorSet0.fp_c9)._m0[int(_1028)][_1030];
        float _1034 = -_1010;
        float _1036 = _886 + _1034;
        float _1038 = -_1022;
        float _1040 = _900 + _1038;
        float _1042 = rint(_1032);
        float _1044 = precise::max(_1042, 0.0);
        uint _1046 = uint(_1044);
        uint _1048 = clamp(_1046, 0u, 65535u);
        float3 _3294 = float3(_1040, _1036, float(int(_1048)));
        float3 _3296 = select(_3294, float3(0.0), isnan(_3294));
        float _1050 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, _3296.xy, uint(rint(_3296.z))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, _3296.xy, uint(rint(_3296.z))).x;
        int _1052 = _1008 << 4;
        int _1054 = _1052 + 17904;
        int _1056 = _1020 + 24304;
        uint _1058 = uint(int(uint(_1056) >> uint(2)));
        uint _1060 = uint(int(uint(int(_1058)) >> uint(2)));
        int _1062 = int(_1058) & 3;
        float _1064 = (*spvDescriptorSet0.fp_c9)._m0[int(_1060)][_1062];
        uint _1066 = uint(int(uint(_1054) >> uint(2)));
        uint _1068 = uint(int(uint(int(_1066)) >> uint(2)));
        int _1070 = int(_1066) & 3;
        float _1072 = (*spvDescriptorSet0.fp_c9)._m0[int(_1068)][_1070];
        int _1074 = int(_1066) + 1;
        uint _1076 = uint(int(uint(_1074) >> uint(2)));
        int _1078 = _1074 & 3;
        float _1080 = (*spvDescriptorSet0.fp_c9)._m0[int(_1076)][_1078];
        int _1082 = _1054 + 8;
        uint _1084 = uint(int(uint(_1082) >> uint(2)));
        uint _1086 = uint(int(uint(int(_1084)) >> uint(2)));
        int _1088 = int(_1084) & 3;
        float _1090 = (*spvDescriptorSet0.fp_c9)._m0[int(_1086)][_1088];
        int _1092 = int(_1084) + 1;
        uint _1094 = uint(int(uint(_1092) >> uint(2)));
        int _1096 = _1092 & 3;
        float _1098 = (*spvDescriptorSet0.fp_c9)._m0[int(_1094)][_1096];
        float _1100 = _362 * _1080;
        float _1102 = fma(_360, _1072, _1100);
        float _1104 = 1.0 / _1064;
        float _1106 = fma(_358, _1090, _1102);
        float _1108 = _1106 + _1098;
        float _1110 = precise::clamp(_1108, 0.0, 1.0);
        float _1112 = _1064 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _1114 = -_1110;
        float _1116 = _1114 + _1050;
        float _1118 = fma(_1104, (*spvDescriptorSet0.fp_c13)._m0[4].w, _1116);
        float _1120 = _1112 * _1118;
        float _1122 = exp2(_1120);
        float _1124 = 0.0 + _1122;
        float _1126 = precise::clamp(_1124, 0.0, 1.0);
        float _1128 = precise::min(_1126, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _1004 = _1128;
    }
    float _1130 = _1004;
    float _1132 = _162 * _970;
    float _1134 = _162 * _922;
    float _1136 = _162 * _916;
    float _1138 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1140 = _1138 + 1.0;
    float _1142 = _162 * _956;
    float _1144 = -(*spvDescriptorSet0.fp_c9)._m0[1007].y;
    float _1146 = _1144 + (*spvDescriptorSet0.fp_c9)._m0[1006].y;
    float _1148 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].x, _1140);
    float _1150 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].y, _1140);
    float _1152 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].z, _1140);
    float _1154 = fma(_740, 0.5, 0.5);
    float _1156 = _456 * _464;
    float _1158 = -(*spvDescriptorSet0.fp_c9)._m0[1007].x;
    float _1160 = _1158 + (*spvDescriptorSet0.fp_c9)._m0[1006].x;
    float _1162 = fma(_1154, _1146, (*spvDescriptorSet0.fp_c9)._m0[1007].y);
    float _1164 = _740 * _740;
    float _1166 = -(*spvDescriptorSet0.fp_c9)._m0[1007].z;
    float _1168 = _1166 + (*spvDescriptorSet0.fp_c9)._m0[1006].z;
    float _1170 = fma(_1154, _1160, (*spvDescriptorSet0.fp_c9)._m0[1007].x);
    float _1172 = _1162 * 0.715200006961822509765625;
    float _1174 = -_1132;
    float _1176 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _1178 = _1174 + _1176;
    float _1180 = fma(_1154, _1168, (*spvDescriptorSet0.fp_c9)._m0[1007].z);
    float _1182 = fma(_738, _738, _1164);
    float _1184 = fma(_1170, 0.2125999927520751953125, _1172);
    float _1186 = _1178 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1188 = precise::clamp(_1186, 0.0, 1.0);
    float _1190 = _738 * (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _1192 = fma(_742, _742, _1182);
    float _1194 = precise::clamp(_1192, 0.0, 1.0);
    float _1196 = fma(_1180, 0.072200000286102294921875, _1184);
    float _1198 = -_740;
    float _1200 = -_1190;
    float _1202 = fma(_1198, (*spvDescriptorSet0.fp_c9)._m0[67].y, _1200);
    float _1204 = -_1130;
    float _1206 = _1204 + 1.0;
    float _1208 = precise::max(0.0, _740);
    float _1210 = 1.0 / _1196;
    float _1212 = -_742;
    float _1214 = fma(_1212, (*spvDescriptorSet0.fp_c9)._m0[67].z, _1202);
    float _1216 = precise::clamp(_1214, 0.0, 1.0);
    float _1218 = fma(_1188, _1206, _1130);
    float _1220 = fma(_890, 0.5, 0.5);
    float _1222 = fma(_1194, 0.5, 0.5);
    float _1224 = -(*spvDescriptorSet0.fp_c9)._m0[1001].z;
    float _1226 = _1224 + (*spvDescriptorSet0.fp_c9)._m0[1000].z;
    float _1228 = -(*spvDescriptorSet0.fp_c9)._m0[1001].x;
    float _1230 = _1228 + (*spvDescriptorSet0.fp_c9)._m0[1000].x;
    float _1232 = -(*spvDescriptorSet0.fp_c9)._m0[1001].y;
    float _1234 = _1232 + (*spvDescriptorSet0.fp_c9)._m0[1000].y;
    float _1236 = precise::min(_1208, 0.100000001490116119384765625);
    float _1238 = fma(_1154, _1230, (*spvDescriptorSet0.fp_c9)._m0[1001].x);
    float _1240 = _1150 * (*spvDescriptorSet0.fp_c11)._m0[39].w;
    float _1242 = fma(_1154, _1234, (*spvDescriptorSet0.fp_c9)._m0[1001].y);
    float _1244 = fma(_1154, _1226, (*spvDescriptorSet0.fp_c9)._m0[1001].z);
    float _1246 = _1210 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1248 = precise::clamp(_1246, 0.0, 1.0);
    float _1250 = precise::min(_1240, (*spvDescriptorSet0.fp_c11)._m0[13].x);
    float _1252 = fma(_1248, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _1254 = _1252 * 0.31830990314483642578125;
    float _1256 = -_1250;
    float _1258 = _1256 + 1.0;
    float _1260 = fma((*spvDescriptorSet0.fp_c11)._m0[45].w, 2.0, -0.5);
    float _1262 = precise::clamp(_1260, 0.0, 1.0);
    float _1264 = _1170 * _1254;
    float _1266 = _1162 * _1254;
    float _1268 = _1180 * _1254;
    float _1270 = -_1148;
    float _1272 = fma(_1270, (*spvDescriptorSet0.fp_c11)._m0[36].z, 1.0);
    float _1274 = _1262 * _1258;
    float _1276 = fma(_1262, -0.449999988079071044921875, 1.0);
    float _1278 = fma(_1236, 10.0, -1.0);
    float2 _3688 = float2(_996, _1220);
    float3 _1280 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_3688, float2(0.0), isnan(_3688))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_3688, float2(0.0), isnan(_3688))).xyz;
    float _1282 = _1280.x;
    float _1284 = _1280.y;
    float _1286 = _1280.z;
    float _1288 = -(*spvDescriptorSet0.fp_c11)._m0[13].y;
    float _1290 = _1288 + (*spvDescriptorSet0.fp_c11)._m0[13].z;
    float _1292 = -_934;
    float _1294 = _1292 + 1.0;
    float _1296 = abs(_654);
    bool _1298 = _1296 > 0.00999999977648258209228515625;
    float _1300 = _842 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1302 = fma(_1274, _1290, (*spvDescriptorSet0.fp_c11)._m0[13].y);
    float _1304 = _1294 * _1294;
    float _1306 = _1298 ? _654 : 0.00999999977648258209228515625;
    float _1308 = _1242 * 0.31830990314483642578125;
    float _1310 = -(*spvDescriptorSet0.fp_c11)._m0[45].w;
    float _1312 = fma(_1302, (*spvDescriptorSet0.fp_c11)._m0[45].w, _1310);
    float _1314 = _1304 * _1304;
    float _1316 = precise::max(_444, 0.25);
    float _1318 = exp2(_1300);
    float _1320 = _480 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1322 = _1294 * _1314;
    float _1324 = -_1216;
    float _1326 = _1324 + 1.0;
    float _1328 = _1316 + _1278;
    float _1330 = precise::max(0.0, _1272);
    float _1332 = _488 * 0.4774648249149322509765625;
    float _1334 = _1326 * _1326;
    float _1336 = 0.0 + _442;
    float _1338 = precise::clamp(_1336, 0.0, 1.0);
    float _1340 = _950 * _950;
    float _1342 = _1152 + (-1.0);
    float _1344 = _1334 * _1334;
    float _1346 = _1306 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _1348 = _474 * _1338;
    float _1350 = _1326 * _1344;
    float _1352 = precise::min(_1222, 1.0);
    float _1354 = precise::max(_1346, -127.0);
    float _1356 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1358 = -_1354;
    float _1360 = exp2(_1358);
    float _1362 = -_1356;
    float _1364 = exp2(_1362);
    float _1366 = -_1360;
    float _1368 = _1366 + 1.0;
    float _1370 = 1.0 / _1354;
    float _1372 = _678 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1374 = _1364 * _1368;
    float _1376 = _1328 * 4.0;
    float _1378 = precise::clamp(_1376, 0.0, 1.0);
    float _1380 = _1134 * 0.18672408163547515869140625;
    float _1382 = fma(_928, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _1384 = _1348 * _1378;
    float _1386 = _1374 * _1370;
    float _1388 = fma(_1382, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1390 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1392 = fma(_1390, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1394 = _1276 * (*spvDescriptorSet0.fp_c11)._m0[8].z;
    float _1396 = _1386 * _1372;
    float _1398 = fma(_1384, _1312, (*spvDescriptorSet0.fp_c11)._m0[45].w);
    float _1400 = fma(_1384, _1342, 1.0);
    float _1402 = abs(_1388);
    float _1404 = log2(_1402);
    float _1406 = _1398 * _1340;
    float _1408 = _1406 * 2.0;
    float _1410 = fma(_1398, 0.5, _1408);
    float _1412 = -_1396;
    float _1414 = exp2(_1412);
    float _1416 = _1410 + (-1.0);
    float _1418 = fma(_1350, _1416, 1.0);
    float _1420 = fma(_1322, _1416, 1.0);
    float _1422 = _1404 * 1.5;
    float _1424 = _1418 * _1420;
    float _1426 = exp2(_1422);
    float _1428 = _1426 * 12.56637096405029296875;
    float _1430 = -_1414;
    float _1432 = _1430 + 1.0;
    float _1434 = 1.0 / _1428;
    float _1436 = _1392 * _1434;
    float _1438 = _1238 * 0.31830990314483642578125;
    float _1440 = _1244 * 0.31830990314483642578125;
    float _1442 = _482 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1444 = _1432 * _1436;
    float _1446 = precise::min(_1218, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1448 = -_1318;
    float _1450 = _1448 + 1.0;
    float _1452 = precise::max(_1320, _1308);
    float _1454 = _1446 * _1444;
    float _1456 = _1450 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1458 = _478 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1460 = -_1456;
    float _1462 = _1460 + 1.0;
    float _1464 = _1456 * _1414;
    float _1466 = _1276 * (*spvDescriptorSet0.fp_c11)._m0[8].x;
    float _1468 = precise::max(_1458, _1438);
    float _1470 = _1414 * _1462;
    float _1472 = _470 + (*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1474 = precise::clamp(_1472, 0.0, 1.0);
    float _1476 = -_1466;
    float _1478 = _1476 + (*spvDescriptorSet0.fp_c11)._m0[8].x;
    float _1480 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1482 = fma(_1330, _1478, _1466);
    float _1484 = precise::max(_1442, _1440);
    float _1486 = _1332 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1488 = _486 * 0.4774648249149322509765625;
    float _1490 = _1474 * _1468;
    float _1492 = _1474 * _1452;
    float _1494 = fma(_472, _1480, _1486);
    float _1496 = _1488 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1498 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1500 = _1474 * _1484;
    float _1502 = _1494 * 0.586610972881317138671875;
    float _1504 = -_1394;
    float _1506 = _1504 + (*spvDescriptorSet0.fp_c11)._m0[8].z;
    float _1508 = fma(_472, _1498, _1496);
    float _1510 = precise::max(_1486, _1266);
    float _1512 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1514 = fma(_1508, 0.298911988735198974609375, _1502);
    float _1516 = _1276 * (*spvDescriptorSet0.fp_c11)._m0[8].y;
    float _1518 = fma(_472, _1480, _1510);
    float _1520 = -(*spvDescriptorSet0.fp_c11)._m0[8].x;
    float _1522 = _1482 + _1520;
    float _1524 = -_1516;
    float _1526 = _1524 + (*spvDescriptorSet0.fp_c11)._m0[8].y;
    float _1528 = fma(_1330, _1526, _1516);
    float _1530 = fma(_1330, _1506, _1394);
    float _1532 = precise::max(_1496, _1264);
    float _1534 = _934 * (-9.27999973297119140625);
    float _1536 = _490 * 0.4774648249149322509765625;
    float _1538 = fma(_1136, 0.095146648585796356201171875, _1380);
    float _1540 = -(*spvDescriptorSet0.fp_c11)._m0[8].z;
    float _1542 = _1530 + _1540;
    float _1544 = exp2(_1534);
    float _1546 = _1536 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1548 = fma(_1142, 0.0364394821226596832275390625, _1538);
    float _1550 = -_1398;
    float _1552 = _1550 + 1.0;
    float _1554 = fma(_472, _1498, _1532);
    float _1556 = fma(_472, _1512, _1546);
    float _1558 = precise::max(_1546, _1268);
    float _1560 = _1552 * _1552;
    float _1562 = precise::max(_1548, 0.00999999977648258209228515625);
    float _1564 = fma(_1556, 0.114477999508380889892578125, _1514);
    float _1566 = fma(_1384, _1542, (*spvDescriptorSet0.fp_c11)._m0[8].z);
    float _1568 = 1.0 / _1562;
    float _1570 = fma(_472, _1512, _1558);
    float _1572 = fma(_1384, _1522, (*spvDescriptorSet0.fp_c11)._m0[8].x);
    float _1574 = _1500 * _1566;
    float _1576 = precise::min(_1560, _1544);
    float _1578 = fma(_1398, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1580 = _1566 * _1570;
    float _1582 = fma(_1552, _1576, _1578);
    float _1584 = fma(_1398, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1586 = fma(_1398, -0.572000026702880859375, 1.03999996185302734375);
    float _1588 = fma(_1582, 1.03999996185302734375, _1584);
    float _1590 = precise::clamp(_1588, 0.0, 1.0);
    float _1592 = _1564 * _1568;
    float _1594 = fma(_1582, -1.03999996185302734375, _1586);
    float _1596 = precise::clamp(_1594, 0.0, 1.0);
    float _1598 = _1400 * _1590;
    float _1600 = precise::min(_1592, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1602 = -(*spvDescriptorSet0.fp_c11)._m0[8].y;
    float _1604 = _1528 + _1602;
    float _1606 = fma(_1398, -0.337748348712921142578125, 1.0);
    float _1608 = fma(_1596, 0.039999999105930328369140625, _1598);
    float _1610 = _1600 * 0.31830990314483642578125;
    float _1612 = _1606 * _1424;
    float _1614 = _1608 * _1610;
    float _1616 = _1216 * _1612;
    float _1618 = fma(_1384, _1604, (*spvDescriptorSet0.fp_c11)._m0[8].y);
    float _1620 = _1136 * _1614;
    float _1622 = _1616 * 0.31830990314483642578125;
    float _1624 = _1134 * _1614;
    float _1626 = _1142 * _1614;
    float _1628 = (*spvDescriptorSet0.fp_c11)._m0[35].x * 1.60000002384185791015625;
    float _1630 = _1622 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1632 = _1622 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1634 = _1622 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1636 = _1156 * _1628;
    float _1638 = _1618 * _1630;
    float _1640 = _1618 * _1352;
    float _1642 = _998 * _1628;
    float _1644 = _1572 * _1632;
    float _1646 = fma(_474, _1638, _1624);
    float _1648 = _1572 * _1352;
    float _1650 = _1454 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1652 = _1566 * _1634;
    float _1654 = fma(_1518, _1640, _1646);
    float _1656 = fma(_1490, _1648, _1642);
    float _1658 = fma(_474, _1644, _1620);
    float _1660 = _1454 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1662 = _944 * _1628;
    float _1664 = fma(_474, _1652, _1626);
    float _1666 = fma(_1554, _1648, _1658);
    float _1668 = _1454 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1670 = fma(_1492, _1640, _1662);
    float _1672 = fma(_1352, _1574, _1636);
    float _1674 = fma(_1352, _1580, _1664);
    float _1676 = precise::max(0.0, _1666);
    float _1678 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1680 = _678 + _1678;
    float _1682 = precise::max(0.0, _1670);
    float _1684 = precise::max(0.0, _1672);
    float _1686 = _1680 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1688 = precise::clamp(_1686, 0.0, 1.0);
    float _1690 = precise::max(0.0, _1674);
    float _1692 = _1470 * _1682;
    float _1694 = _1470 * _1684;
    float _1696 = fma(_1282, _1464, _1650);
    float _1698 = precise::max(0.0, _1654);
    float _1700 = fma(_1284, _1464, _1660);
    float _1702 = fma(_1286, _1464, _1668);
    float _1704 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1706 = _678 + _1704;
    float _1708 = fma(_1470, _1676, _1696);
    float _1710 = fma(_1470, _1698, _1700);
    float _1712 = precise::max(0.0, _1656);
    float _1714 = _1706 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1716 = precise::clamp(_1714, 0.0, 1.0);
    float _1718 = fma(_1470, _1690, _1702);
    float _1720 = _1470 * _1712;
    float _1722 = fma(_1716, _1720, _1708);
    float _1724 = fma(_1688, _1720, _1708);
    float _1726 = fma(_1716, _1692, _1710);
    float _1728 = fma(_1688, _1692, _1710);
    float _1730 = fma(_1716, _1694, _1718);
    float _1732 = fma(_1688, _1694, _1718);
    out.m_79.x = _1722;
    out.m_79.y = _1726;
    out.m_79.z = _1730;
    out.m_79.w = 1.0;
    out.m_81.x = _1724;
    out.m_81.y = _1728;
    out.m_81.z = _1732;
    out.m_81.w = 1.0;
    return out;
}

