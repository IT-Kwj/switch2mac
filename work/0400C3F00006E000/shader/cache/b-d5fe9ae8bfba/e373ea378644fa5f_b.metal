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
    texture2d<float> fp_t_tcb_16 [[id(12)]];
    sampler fp_t_tcb_16Smplr [[id(13)]];
    texture3d<float> fp_t_tcb_18 [[id(14)]];
    sampler fp_t_tcb_18Smplr [[id(15)]];
    texture2d_array<float> fp_t_tcb_E [[id(16)]];
    sampler fp_t_tcb_ESmplr [[id(17)]];
    texture2d<float> fp_t_tcb_10 [[id(18)]];
    sampler fp_t_tcb_10Smplr [[id(19)]];
    sampler fp_t_tcb_8Smplr_w [[id(20)]];
    sampler fp_t_tcb_ASmplr_w [[id(21)]];
    sampler fp_t_tcb_CSmplr_w [[id(22)]];
    sampler fp_t_tcb_16Smplr_w [[id(23)]];
    sampler fp_t_tcb_18Smplr_w [[id(24)]];
    sampler fp_t_tcb_ESmplr_w [[id(25)]];
    sampler fp_t_tcb_10Smplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_71 [[color(0)]];
    float4 m_73 [[color(1)]];
};

struct main0_in
{
    float4 m_62 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _80 = as_type<int>((*spvDescriptorSet0.fp_c7)._m0[11].z) * as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].z);
    int _82 = _80 + as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].w);
    int _84 = _82 * 96;
    int _86 = _84 + 80;
    uint _89 = uint(int(uint(_84) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_89)];
    float _92 = as_type<float>(_dmw0.x);
    int _94 = _84 + 4;
    uint _96 = uint(int(uint(_94) >> uint(2)));
    float _98 = as_type<float>(_dmw0.y);
    uint _100 = uint(int(uint(_86) >> uint(2)));
    float _102 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_100)]);
    int _104 = _84 + 8;
    int _106 = _84 + 16;
    int _108 = _84 + 24;
    uint _110 = uint(int(uint(_104) >> uint(2)));
    float _112 = as_type<float>(_dmw0.z);
    int _114 = _104 + 4;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    float _118 = as_type<float>(_dmw0.w);
    uint _120 = uint(int(uint(_106) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_120)];
    float _122 = as_type<float>(_dmw1.x);
    int _124 = _106 + 4;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    float _128 = as_type<float>(_dmw1.y);
    uint _130 = uint(int(uint(_108) >> uint(2)));
    float _132 = as_type<float>(_dmw1.z);
    int _134 = _108 + 4;
    uint _136 = uint(int(uint(_134) >> uint(2)));
    float _138 = as_type<float>(_dmw1.w);
    float _140 = gl_FragCoord.w;
    float _142 = in.m_62.z;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_62.w;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = 1.0 / _140;
    float _156 = _154 * _146;
    int _158 = as_type<int>(_102) << 6;
    int _160 = _158 + 25904;
    uint _162 = uint(int(uint(_160) >> uint(2)));
    uint _164 = uint(int(uint(int(_162)) >> uint(2)));
    int _166 = int(_162) & 3;
    float _168 = (*spvDescriptorSet0.fp_c9)._m0[int(_164)][_166];
    int _170 = int(_162) + 1;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    int _174 = _170 & 3;
    float _176 = (*spvDescriptorSet0.fp_c9)._m0[int(_172)][_174];
    int _178 = _158 + 25912;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    uint _182 = uint(int(uint(int(_180)) >> uint(2)));
    int _184 = int(_180) & 3;
    float _186 = (*spvDescriptorSet0.fp_c9)._m0[int(_182)][_184];
    int _188 = int(_180) + 1;
    uint _190 = uint(int(uint(_188) >> uint(2)));
    int _192 = _188 & 3;
    float _194 = (*spvDescriptorSet0.fp_c9)._m0[int(_190)][_192];
    int _196 = _158 + 25920;
    uint _198 = uint(int(uint(_196) >> uint(2)));
    uint _200 = uint(int(uint(int(_198)) >> uint(2)));
    int _202 = int(_198) & 3;
    float _204 = (*spvDescriptorSet0.fp_c9)._m0[int(_200)][_202];
    int _206 = int(_198) + 1;
    uint _208 = uint(int(uint(_206) >> uint(2)));
    int _210 = _206 & 3;
    float _212 = (*spvDescriptorSet0.fp_c9)._m0[int(_208)][_210];
    float _214 = _154 * _152;
    float _216 = fma(_156, _92, _112);
    float _218 = fma(_156, _122, _132);
    float _220 = fma(_214, _98, _118);
    float _222 = fma(_214, _128, _138);
    float _224 = _216 * _168;
    float _226 = _220 * _176;
    float _228 = _218 * _168;
    float _230 = _222 * _176;
    float _232 = _218 * _186;
    float _234 = _222 * _194;
    float2 _1957;
    _1957.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_228, _230));
    _1957.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_228, _230));
    float _236 = _1957.x;
    float _238 = _236 * 256.0;
    int _240 = int(_238);
    float2 _1968;
    _1968.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_224, _226));
    _1968.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_224, _226));
    float _242 = _1968.x;
    float _244 = _242 * 256.0;
    int _246 = int(_244);
    float _248 = _218 * _204;
    float _250 = _222 * _212;
    float2 _1984;
    _1984.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_232, _234));
    _1984.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_232, _234));
    float _252 = _1984.x;
    float _254 = _252 * 256.0;
    int _256 = int(_254);
    float2 _1994;
    _1994.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_248, _250));
    _1994.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_248, _250));
    float _258 = _1994.x;
    float _260 = _258 * 256.0;
    int _262 = int(_260);
    int _264 = _84 + 68;
    float _266 = in.m_64.z;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    int _272 = _84 + 64;
    float _274 = in.m_64.x;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    int _280 = _158 + 25936;
    uint _282 = uint(int(uint(_280) >> uint(2)));
    uint _284 = uint(int(uint(int(_282)) >> uint(2)));
    int _286 = int(_282) & 3;
    float _288 = (*spvDescriptorSet0.fp_c9)._m0[int(_284)][_286];
    int _290 = int(_282) + 1;
    uint _292 = uint(int(uint(_290) >> uint(2)));
    int _294 = _290 & 3;
    float _296 = (*spvDescriptorSet0.fp_c9)._m0[int(_292)][_294];
    uint _298 = uint(int(uint(_264) >> uint(2)));
    float _300 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_298)]);
    uint _302 = uint(int(uint(_272) >> uint(2)));
    float _304 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_302)]);
    float _306 = in.m_64.y;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    int _312 = _158 + 25952;
    uint _314 = uint(int(uint(_312) >> uint(2)));
    uint _316 = uint(int(uint(int(_314)) >> uint(2)));
    int _318 = int(_314) & 3;
    float _320 = (*spvDescriptorSet0.fp_c9)._m0[int(_316)][_318];
    int _322 = _158 + 25944;
    uint _324 = uint(int(uint(_322) >> uint(2)));
    uint _326 = uint(int(uint(int(_324)) >> uint(2)));
    int _328 = int(_324) & 3;
    float _330 = (*spvDescriptorSet0.fp_c9)._m0[int(_326)][_328];
    float _332 = _154 * _270;
    float _334 = _154 * _278;
    float _336 = _154 * _310;
    float _338 = _334 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _340 = rint(_320);
    float _342 = precise::max(_340, 0.0);
    uint _344 = uint(_342);
    uint _346 = clamp(_344, 0u, 65535u);
    float _348 = _338 * (*spvDescriptorSet0.fp_c11)._m0[30].x;
    float _350 = fma(_348, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].x);
    float _352 = float(uint(_240));
    float _354 = precise::max(_300, _296);
    float _356 = precise::max(_300, _288);
    float _358 = precise::max(_304, _288);
    float _360 = _332 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _362 = _336 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _364 = _360 * (*spvDescriptorSet0.fp_c11)._m0[30].z;
    float _366 = _362 * (*spvDescriptorSet0.fp_c11)._m0[30].y;
    float _368 = fma(_364, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].z);
    float _370 = float(uint(_246));
    float _372 = float(uint(_262));
    float _374 = float(uint(_256));
    float _376 = precise::max(_300, _330);
    float _378 = _370 * 0.00390625;
    float _380 = _372 * 0.00390625;
    float _382 = _374 * 0.00390625;
    float _384 = _352 * 0.00390625;
    float _386 = fma(_334, 6.2500002968590706586837768554688e-05, 0.5);
    float _388 = precise::clamp(_386, 0.0, 1.0);
    float _390 = fma(_332, 6.2500002968590706586837768554688e-05, 0.5);
    float _392 = precise::clamp(_390, 0.0, 1.0);
    float _394 = precise::max(_376, _380);
    float _396 = fma(_366, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].y);
    float _398 = precise::max(_354, _382);
    float _400 = precise::max(_356, _384);
    float2 _2230 = float2(_388, _392);
    float _402 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2230, float2(0.0), isnan(_2230))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2230, float2(0.0), isnan(_2230))).x;
    float3 _2241 = float3(_350, _396, _368);
    float _404 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2241, float3(0.0), isnan(_2241))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2241, float3(0.0), isnan(_2241))).x;
    float _406 = precise::max(_358, _378);
    float3 _2257 = float3(_228, _230, float(int(_346)));
    float3 _2259 = select(_2257, float3(0.0), isnan(_2257));
    float2 _410 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2259.xy, uint(rint(_2259.z)), level(_400)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2259.xy, uint(rint(_2259.z)), level(_400)).yz;
    float _412 = _410.x;
    float _414 = _410.y;
    float3 _2273 = float3(_224, _226, float(int(_346)));
    float3 _2275 = select(_2273, float3(0.0), isnan(_2273));
    float _416 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2275.xy, uint(rint(_2275.z)), level(_406)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2275.xy, uint(rint(_2275.z)), level(_406)).x;
    float3 _2285 = float3(_232, _234, float(int(_346)));
    float3 _2287 = select(_2285, float3(0.0), isnan(_2285));
    float3 _420 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2287.xy, uint(rint(_2287.z)), level(_398)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2287.xy, uint(rint(_2287.z)), level(_398)).xyz;
    float _422 = _420.x;
    float _424 = _420.y;
    float _426 = _420.z;
    float3 _2303 = float3(_248, _250, float(int(_346)));
    float3 _2305 = select(_2303, float3(0.0), isnan(_2303));
    float3 _428 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2305.xy, uint(rint(_2305.z)), level(_394)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2305.xy, uint(rint(_2305.z)), level(_394)).xyz;
    float _430 = _428.x;
    float _432 = _428.y;
    float _434 = _428.z;
    float _436 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _438 = _332 + _436;
    float _440 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _442 = _334 + _440;
    float _444 = _438 * _438;
    float _446 = fma(_442, _442, _444);
    float _448 = sqrt(_446);
    float _450 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _452 = _336 + _450;
    bool _456 = _448 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _458 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _460 = _334 + _458;
    float _462 = _452 * _452;
    float _464 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _466 = _332 + _464;
    float _468 = _392;
    float _470 = _230;
    float _472 = _232;
    float _474 = _388;
    float _476 = _154;
    if (_456)
    {
        float _478 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _468 = _478;
    }
    float _480 = _468;
    float _482 = fma(_460, _460, _462);
    float _484 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _486 = _448 + _484;
    float _488 = fma(_466, _466, _482);
    float _490 = sqrt(_488);
    float _492 = _486;
    if (_456)
    {
        float _494 = _486 * _480;
        _492 = _494;
    }
    float _496 = _492;
    float _498 = _496;
    if (_456)
    {
        float _500 = _496 * 0.15915493667125701904296875;
        _498 = _500;
    }
    float _502 = _498;
    float _504 = in.m_66.y;
    float _506 = gl_FragCoord.w;
    float _508 = _504 * _506;
    float _510 = _462;
    if (_456)
    {
        float _512 = _502 * 6.283185482025146484375;
        float _514 = sin(_512);
        _510 = _514;
    }
    float _516 = _510;
    float _518 = in.m_66.x;
    float _520 = gl_FragCoord.w;
    float _522 = _518 * _520;
    float _524 = in.m_66.z;
    float _526 = gl_FragCoord.w;
    float _528 = _524 * _526;
    float _530 = spvFAdd(_490, 9.9999997473787516355514526367188e-06);
    if (_456)
    {
        float _532 = _336 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _470 = _532;
    }
    float _534 = _470;
    float _536 = _406;
    if (_456)
    {
        float _538 = _502 * 6.283185482025146484375;
        float _540 = cos(_538);
        _536 = _540;
    }
    float _542 = _536;
    float _544 = _516;
    if (_456)
    {
        float _546 = fma(_516, _534, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _544 = _546;
    }
    float _548 = _544;
    float _550 = _446;
    float _552 = _548;
    if (_456)
    {
        float _554 = rsqrt(_446);
        _550 = _554;
    }
    float _556 = _550;
    float _558 = spvFAdd(_490, 9.9999997473787516355514526367188e-06);
    float _560 = 1.0 / _530;
    float _562 = _542;
    if (_456)
    {
        float _564 = _542 + (-1.0);
        _472 = _564;
    }
    float _566 = _472;
    float _568 = 1.0 / _558;
    float _570 = _566;
    if (_456)
    {
        float _572 = _566 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _570 = _572;
    }
    float _574 = _570;
    float _576 = _556;
    if (_456)
    {
        float _578 = _556 * _548;
        _552 = _578;
    }
    float _580 = _552;
    float _582 = _154 * _508;
    if (!_456)
    {
        _474 = _336;
    }
    float _584 = _474;
    float _586 = _584;
    if (_456)
    {
        float _588 = fma(_336, _542, _574);
        _586 = _588;
    }
    float _590 = _586;
    float _592 = _460 * _560;
    float _594 = _466 * _560;
    float _596 = _452 * _560;
    if (!_456)
    {
        _576 = _334;
    }
    float _598 = _576;
    float _600 = _154 * _522;
    float _602 = _598;
    if (!_456)
    {
        _562 = _332;
    }
    float _604 = _562;
    float _606 = _582 * _582;
    float _608 = _604;
    if (_456)
    {
        float _610 = fma(_442, _580, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _602 = _610;
    }
    float _612 = _602;
    if (_456)
    {
        float _614 = fma(_438, _580, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _608 = _614;
    }
    float _616 = _608;
    float _618 = _596 + (*spvDescriptorSet0.fp_c9)._m0[67].y;
    float _620 = _452 * _568;
    float _622 = _154 * _528;
    float _624 = fma(_600, _600, _606);
    float _626 = _592 + (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _628 = _618 * _618;
    float _630 = _620 + (*spvDescriptorSet0.fp_c9)._m0[67].y;
    float _632 = fma(_622, _622, _624);
    float _634 = _594 + (*spvDescriptorSet0.fp_c9)._m0[67].z;
    float _636 = fma(_626, _626, _628);
    float _638 = _630 * _630;
    float _640 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _642 = _590 + _640;
    float _644 = fma(_634, _634, _636);
    float _646 = rsqrt(_632);
    float _648 = fma(_626, _626, _638);
    float _650 = _594 + (*spvDescriptorSet0.fp_c9)._m0[67].z;
    float _652 = _642 * _642;
    float _654 = fma(_650, _650, _648);
    float _656 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _658 = _612 + _656;
    float _660 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _662 = _616 + _660;
    float _664 = fma(_658, _658, _652);
    float _666 = rsqrt(_644);
    float _668 = fma(_662, _662, _664);
    float _670 = _600 * _646;
    float _672 = _582 * _646;
    float _674 = _622 * _646;
    float _676 = rsqrt(_654);
    float _678 = _620 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _680 = _670 * _592;
    float _682 = rsqrt(_668);
    float _684 = fma(_592, (*spvDescriptorSet0.fp_c9)._m0[69].x, _678);
    float _686 = -_620;
    float _688 = -_680;
    float _690 = fma(_672, _686, _688);
    float _692 = _592 + (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _694 = _618 * _666;
    float _696 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _698 = _692 * _676;
    float _700 = _694 * (*spvDescriptorSet0.fp_c9)._m0[67].y;
    float _702 = _634 * _666;
    float _704 = precise::max(0.0, _696);
    float _706 = _682 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _708 = fma(_698, (*spvDescriptorSet0.fp_c9)._m0[67].x, _700);
    float _710 = fma(_594, (*spvDescriptorSet0.fp_c9)._m0[69].z, _684);
    float _712 = _658 * _706;
    float _714 = _662 * _706;
    float _716 = -_594;
    float _718 = fma(_674, _716, _690);
    float _720 = precise::clamp(_718, 0.0, 1.0);
    float _722 = -_706;
    float _724 = -_704;
    float _726 = fma(_642, _722, _724);
    float _728 = _712 * _712;
    float _730 = _714 * _714;
    float _732 = in.m_68.z;
    float _734 = gl_FragCoord.w;
    float _736 = _732 * _734;
    float _738 = in.m_68.x;
    float _740 = gl_FragCoord.w;
    float _742 = _738 * _740;
    float _744 = _728 + _730;
    float _746 = in.m_68.y;
    float _748 = gl_FragCoord.w;
    float _750 = _746 * _748;
    float _752 = in.m_68.w;
    float _754 = gl_FragCoord.w;
    float _756 = _752 * _754;
    float _758 = sqrt(_744);
    float _760 = fma(_702, (*spvDescriptorSet0.fp_c9)._m0[67].z, _708);
    float _762 = precise::clamp(_760, 0.0, 1.0);
    bool _764 = _758 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _766 = _154 * _736;
    float _768 = _154 * _742;
    float _770 = _154 * _750;
    float _772 = _154 * _756;
    float _774 = _726;
    float _776 = _728;
    float _778 = _712;
    float _780 = _714;
    if (!_764)
    {
        _476 = _730;
    }
    float _782 = _476;
    bool _784 = !_764;
    float _786 = _782;
    if (!_784)
    {
        float _788 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _790 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _792 = _758 + _790;
        float _794 = rsqrt(_744);
        float _796 = _792 * _788;
        float _798 = _726 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _800 = _796 * 0.15915493667125701904296875;
        float _802 = _800 * 6.283185482025146484375;
        float _804 = sin(_802);
        float _806 = _800 * 6.283185482025146484375;
        float _808 = cos(_806);
        float _810 = fma(_804, _798, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _812 = _794 * _810;
        float _814 = _808 + (-1.0);
        float _816 = _712 * _812;
        float _818 = _714 * _812;
        float _820 = _814 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _822 = _818 * _818;
        float _824 = fma(_726, _808, _820);
        float _826 = _816 * _816;
        _774 = _824;
        _776 = _826;
        _786 = _822;
        _778 = _816;
        _780 = _818;
    }
    float _828 = _774;
    float _830 = _776;
    float _832 = _786;
    float _834 = _778;
    float _836 = _780;
    float _838 = fma(_828, _828, _830);
    float _840 = _336 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _842 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _844 = fma(_490, (*spvDescriptorSet0.fp_c9)._m0[63].x, _842);
    float _846 = precise::clamp(_844, 0.0, 1.0);
    float _848 = _838 + _832;
    float _850 = fma(_334, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _840);
    float _852 = -_846;
    float _854 = _852 + 1.0;
    float _856 = rsqrt(_848);
    float _858 = fma(_332, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _850);
    float _860 = _858 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _862 = abs(_854);
    float _864 = log2(_862);
    float _866 = _856 * _834;
    float _868 = _856 * _828;
    float _870 = _856 * _836;
    float _872 = _866 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _874 = _864 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _876 = -_872;
    float _878 = fma(_868, (*spvDescriptorSet0.fp_c9)._m0[69].y, _876);
    float _880 = -_870;
    float _882 = fma(_880, (*spvDescriptorSet0.fp_c9)._m0[69].z, _878);
    float _884 = exp2(_874);
    float _886 = _868 + 1.0;
    float _888 = fma(_882, -0.5, 0.5);
    float _890 = sqrt(_888);
    float _892 = -_868;
    float _894 = fma(_884, _886, _892);
    float _896 = _336 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _898 = fma(_882, 0.5, 0.5);
    float _900 = fma(_334, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _896);
    float _902 = fma(_898, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _904 = fma(_332, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _900);
    float _906 = _890 * 0.636619746685028076171875;
    float _908 = trunc(_860);
    int _910 = int(_908);
    float _912 = fma(_898, _902, -0.212114393711090087890625);
    float _914 = _904 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _916 = fma(_898, _912, 1.570728778839111328125);
    float _918 = trunc(_914);
    int _920 = int(_918);
    float _922 = -_916;
    float _924 = fma(_906, _922, 1.0);
    int _926 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _928 = _910 + _926;
    int _930 = _928 + 1;
    bool _932 = _930 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    int _934 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _936 = _920 + _934;
    int _938 = _936 + 1;
    int _940 = _930 | _938;
    bool _942 = _940 < 0;
    bool _944 = _942 || _932;
    bool _946 = _938 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _948 = _946 || _944;
    float _950 = as_type<float>(_940);
    if (_948)
    {
        _950 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _952 = _950;
    float _954 = _952;
    if (!_948)
    {
        float _956 = floor(_914);
        int _958 = _938 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _960 = _958 + _930;
        int _962 = _960 << 2;
        int _964 = _960 >> 2;
        float _966 = floor(_860);
        int _968 = 12 & _962;
        int _970 = _960 << 4;
        int _972 = _970 + 17904;
        int _974 = _964 << 4;
        int _976 = _974 + _968;
        float _978 = -_956;
        float _980 = _914 + _978;
        uint _982 = uint(int(uint(_972) >> uint(2)));
        uint _984 = uint(int(uint(int(_982)) >> uint(2)));
        int _986 = int(_982) & 3;
        float _988 = (*spvDescriptorSet0.fp_c9)._m0[int(_984)][_986];
        int _990 = int(_982) + 1;
        uint _992 = uint(int(uint(_990) >> uint(2)));
        int _994 = _990 & 3;
        float _996 = (*spvDescriptorSet0.fp_c9)._m0[int(_992)][_994];
        float _998 = -_966;
        float _1000 = _860 + _998;
        float _1002 = _336 * _996;
        float _1004 = fma(_334, _988, _1002);
        int _1006 = _976 + 16256;
        uint _1008 = uint(int(uint(_1006) >> uint(2)));
        uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
        int _1012 = int(_1008) & 3;
        float _1014 = (*spvDescriptorSet0.fp_c9)._m0[int(_1010)][_1012];
        float _1016 = rint(_1014);
        float _1018 = precise::max(_1016, 0.0);
        uint _1020 = uint(_1018);
        uint _1022 = clamp(_1020, 0u, 65535u);
        float3 _3217 = float3(_1000, _980, float(int(_1022)));
        float3 _3219 = select(_3217, float3(0.0), isnan(_3217));
        float _1024 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3219.xy, uint(rint(_3219.z))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3219.xy, uint(rint(_3219.z))).x;
        int _1026 = _976 + 24304;
        uint _1028 = uint(int(uint(_1026) >> uint(2)));
        uint _1030 = uint(int(uint(int(_1028)) >> uint(2)));
        int _1032 = int(_1028) & 3;
        float _1034 = (*spvDescriptorSet0.fp_c9)._m0[int(_1030)][_1032];
        int _1036 = _972 + 8;
        uint _1038 = uint(int(uint(_1036) >> uint(2)));
        uint _1040 = uint(int(uint(int(_1038)) >> uint(2)));
        int _1042 = int(_1038) & 3;
        float _1044 = (*spvDescriptorSet0.fp_c9)._m0[int(_1040)][_1042];
        int _1046 = int(_1038) + 1;
        uint _1048 = uint(int(uint(_1046) >> uint(2)));
        int _1050 = _1046 & 3;
        float _1052 = (*spvDescriptorSet0.fp_c9)._m0[int(_1048)][_1050];
        float _1054 = 1.0 / _1034;
        float _1056 = fma(_332, _1044, _1004);
        float _1058 = _1056 + _1052;
        float _1060 = precise::clamp(_1058, 0.0, 1.0);
        float _1062 = -_1060;
        float _1064 = _1062 + _1024;
        float _1066 = _1034 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _1068 = fma(_1054, (*spvDescriptorSet0.fp_c13)._m0[4].w, _1064);
        float _1070 = _1066 * _1068;
        float _1072 = exp2(_1070);
        float _1074 = 0.0 + _1072;
        float _1076 = precise::clamp(_1074, 0.0, 1.0);
        float _1078 = precise::min(_1076, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _954 = _1078;
    }
    float _1080 = _954;
    float _1082 = -_772;
    float _1084 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _1086 = _1082 + _1084;
    float _1088 = -_1080;
    float _1090 = _1088 + 1.0;
    float _1092 = fma(_672, 0.5, 0.5);
    float _1094 = _1086 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1096 = precise::clamp(_1094, 0.0, 1.0);
    float _1098 = _672 * _672;
    float _1100 = fma(_1096, _1090, _1080);
    float _1102 = -(*spvDescriptorSet0.fp_c9)._m0[1007].y;
    float _1104 = _1102 + (*spvDescriptorSet0.fp_c9)._m0[1006].y;
    float _1106 = -(*spvDescriptorSet0.fp_c9)._m0[1007].x;
    float _1108 = _1106 + (*spvDescriptorSet0.fp_c9)._m0[1006].x;
    float _1110 = fma(_670, _670, _1098);
    float _1112 = -(*spvDescriptorSet0.fp_c9)._m0[1007].z;
    float _1114 = _1112 + (*spvDescriptorSet0.fp_c9)._m0[1006].z;
    float _1116 = fma(_1092, _1104, (*spvDescriptorSet0.fp_c9)._m0[1007].y);
    float _1118 = fma(_1092, _1108, (*spvDescriptorSet0.fp_c9)._m0[1007].x);
    float _1120 = _670 * (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _1122 = fma(_1092, _1114, (*spvDescriptorSet0.fp_c9)._m0[1007].z);
    float _1124 = _1116 * 0.715200006961822509765625;
    float _1126 = fma(_674, _674, _1110);
    float _1128 = precise::clamp(_1126, 0.0, 1.0);
    float _1130 = -_672;
    float _1132 = -_1120;
    float _1134 = fma(_1130, (*spvDescriptorSet0.fp_c9)._m0[67].y, _1132);
    float _1136 = precise::max(0.0, _672);
    float _1138 = fma(_1118, 0.2125999927520751953125, _1124);
    float _1140 = -_674;
    float _1142 = fma(_1140, (*spvDescriptorSet0.fp_c9)._m0[67].z, _1134);
    float _1144 = precise::clamp(_1142, 0.0, 1.0);
    float _1146 = fma(_1122, 0.072200000286102294921875, _1138);
    float _1148 = -(*spvDescriptorSet0.fp_c9)._m0[1001].z;
    float _1150 = _1148 + (*spvDescriptorSet0.fp_c9)._m0[1000].z;
    float _1152 = precise::min(_1136, 0.100000001490116119384765625);
    float _1154 = -(*spvDescriptorSet0.fp_c9)._m0[1001].x;
    float _1156 = _1154 + (*spvDescriptorSet0.fp_c9)._m0[1000].x;
    float _1158 = 1.0 / _1146;
    float _1160 = -(*spvDescriptorSet0.fp_c9)._m0[1001].y;
    float _1162 = _1160 + (*spvDescriptorSet0.fp_c9)._m0[1000].y;
    float _1164 = fma(_1092, _1156, (*spvDescriptorSet0.fp_c9)._m0[1001].x);
    float _1166 = fma(_1092, _1162, (*spvDescriptorSet0.fp_c9)._m0[1001].y);
    float _1168 = fma(_894, 0.5, 0.5);
    float _1170 = fma(_1128, 0.5, 0.5);
    float _1172 = fma(_1092, _1150, (*spvDescriptorSet0.fp_c9)._m0[1001].z);
    float _1174 = _1158 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1176 = precise::clamp(_1174, 0.0, 1.0);
    float _1178 = fma(_1176, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _1180 = fma(_1152, 10.0, -1.0);
    float _1182 = _1178 * 0.31830990314483642578125;
    float _1184 = precise::max(_404, 0.25);
    float _1186 = _1118 * _1182;
    float _1188 = _1116 * _1182;
    float _1190 = _1184 + _1180;
    float2 _3503 = float2(_924, _1168);
    float3 _1192 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3503, float2(0.0), isnan(_3503))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3503, float2(0.0), isnan(_3503))).xyz;
    float _1194 = _1192.x;
    float _1196 = _1192.y;
    float _1198 = _1192.z;
    float _1200 = _1164 * 0.31830990314483642578125;
    float _1202 = _422 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1204 = _426 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1206 = _1122 * _1182;
    float _1208 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1210 = _1208 + 1.0;
    float _1212 = _1166 * 0.31830990314483642578125;
    float _1214 = precise::max(_1202, _1200);
    float _1216 = _424 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1218 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].y, _1210);
    float _1220 = _1172 * 0.31830990314483642578125;
    float _1222 = 0.0 + _402;
    float _1224 = precise::clamp(_1222, 0.0, 1.0);
    float _1226 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].x, _1210);
    float _1228 = precise::max(_1216, _1212);
    float _1230 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].z, _1210);
    float _1232 = precise::max(_1204, _1220);
    float _1234 = _1190 * 4.0;
    float _1236 = precise::clamp(_1234, 0.0, 1.0);
    float _1238 = _416 * _1224;
    float _1240 = _1218 * (*spvDescriptorSet0.fp_c11)._m0[39].w;
    float _1242 = _720 * (-9.27999973297119140625);
    float _1244 = _1238 * _1236;
    float _1246 = -_720;
    float _1248 = _1246 + 1.0;
    float _1250 = precise::min(_1240, (*spvDescriptorSet0.fp_c11)._m0[13].x);
    float _1252 = _430 * 0.4774648249149322509765625;
    float _1254 = fma((*spvDescriptorSet0.fp_c11)._m0[45].w, 2.0, -0.5);
    float _1256 = precise::clamp(_1254, 0.0, 1.0);
    float _1258 = abs(_452);
    bool _1260 = _1258 > 0.00999999977648258209228515625;
    float _1262 = -_1250;
    float _1264 = _1262 + 1.0;
    float _1266 = _1252 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1268 = fma(_1256, -0.449999988079071044921875, 1.0);
    float _1270 = -_1226;
    float _1272 = fma(_1270, (*spvDescriptorSet0.fp_c11)._m0[36].z, 1.0);
    float _1274 = _1256 * _1264;
    float _1276 = precise::max(0.0, _1272);
    float _1278 = -(*spvDescriptorSet0.fp_c11)._m0[13].y;
    float _1280 = _1278 + (*spvDescriptorSet0.fp_c11)._m0[13].z;
    float _1282 = precise::max(_1266, _1186);
    float _1284 = _1260 ? _452 : 0.00999999977648258209228515625;
    float _1286 = fma(_1274, _1280, (*spvDescriptorSet0.fp_c11)._m0[13].y);
    float _1288 = precise::min(_1100, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1290 = -(*spvDescriptorSet0.fp_c11)._m0[45].w;
    float _1292 = fma(_1286, (*spvDescriptorSet0.fp_c11)._m0[45].w, _1290);
    float _1294 = _1284 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _1296 = exp2(_1242);
    float _1298 = fma(_1244, _1292, (*spvDescriptorSet0.fp_c11)._m0[45].w);
    float _1300 = -_1298;
    float _1302 = _1300 + 1.0;
    float _1304 = fma(_1298, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1306 = _1302 * _1302;
    float _1308 = _1268 * (*spvDescriptorSet0.fp_c11)._m0[8].z;
    float _1310 = precise::min(_1306, _1296);
    float _1312 = fma(_1298, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1314 = fma(_1302, _1310, _1312);
    float _1316 = _412 + (*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1318 = precise::clamp(_1316, 0.0, 1.0);
    float _1320 = _1318 * _1214;
    float _1322 = _1268 * (*spvDescriptorSet0.fp_c11)._m0[8].x;
    float _1324 = _1318 * _1228;
    float _1326 = _1318 * _1232;
    float _1328 = _1268 * (*spvDescriptorSet0.fp_c11)._m0[8].y;
    float _1330 = -_1322;
    float _1332 = _1330 + (*spvDescriptorSet0.fp_c11)._m0[8].x;
    float _1334 = fma(_1276, _1332, _1322);
    float _1336 = -_1328;
    float _1338 = _1336 + (*spvDescriptorSet0.fp_c11)._m0[8].y;
    float _1340 = fma(_1276, _1338, _1328);
    float _1342 = -(*spvDescriptorSet0.fp_c11)._m0[8].y;
    float _1344 = _1340 + _1342;
    float _1346 = fma(_1298, -0.572000026702880859375, 1.03999996185302734375);
    float _1348 = fma(_1314, -1.03999996185302734375, _1346);
    float _1350 = precise::clamp(_1348, 0.0, 1.0);
    float _1352 = fma(_1314, 1.03999996185302734375, _1304);
    float _1354 = precise::clamp(_1352, 0.0, 1.0);
    float _1356 = -_1308;
    float _1358 = _1356 + (*spvDescriptorSet0.fp_c11)._m0[8].z;
    float _1360 = fma(_1276, _1358, _1308);
    float _1362 = -(*spvDescriptorSet0.fp_c11)._m0[8].z;
    float _1364 = _1360 + _1362;
    float _1366 = (*spvDescriptorSet0.fp_c11)._m0[46].y * 16.0;
    float _1368 = precise::clamp(_1366, 0.0, 1.0);
    float _1370 = -_1368;
    float _1372 = fma(_1368, _1230, _1370);
    float _1374 = (*spvDescriptorSet0.fp_c11)._m0[46].y * 0.319999992847442626953125;
    float _1376 = fma(_1244, _1372, _1368);
    float _1378 = _1376 * _1354;
    float _1380 = _762 * _762;
    float _1382 = -_1144;
    float _1384 = _1382 + 1.0;
    float _1386 = fma(_1350, _1374, _1378);
    float _1388 = _1248 * _1248;
    float _1390 = _1298 * _1380;
    float _1392 = _1390 * 2.0;
    float _1394 = _1388 * _1388;
    float _1396 = fma(_1298, 0.5, _1392);
    float _1398 = fma(_1298, -0.337748348712921142578125, 1.0);
    float _1400 = _1248 * _1394;
    float _1402 = _1384 * _1384;
    float _1404 = _1396 + (-1.0);
    float _1406 = _1402 * _1402;
    float _1408 = _1384 * _1406;
    float _1410 = fma(_1400, _1404, 1.0);
    float _1412 = fma(_1408, _1404, 1.0);
    float _1414 = _432 * 0.4774648249149322509765625;
    float _1416 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1418 = _1412 * _1410;
    float _1420 = _1414 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1422 = fma(_414, _1416, _1266);
    float _1424 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1426 = _434 * 0.4774648249149322509765625;
    float _1428 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1430 = precise::max(_1420, _1188);
    float _1432 = fma(_414, _1424, _1420);
    float _1434 = _1426 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1436 = precise::max(_1294, -127.0);
    float _1438 = _1398 * _1418;
    float _1440 = _1432 * 0.586610972881317138671875;
    float _1442 = -_1436;
    float _1444 = exp2(_1442);
    float _1446 = _1144 * _1438;
    float _1448 = fma(_1422, 0.298911988735198974609375, _1440);
    float _1450 = fma(_414, _1428, _1434);
    float _1452 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1454 = precise::max(_1434, _1206);
    float _1456 = _1446 * 0.31830990314483642578125;
    float _1458 = fma(_1450, 0.114477999508380889892578125, _1448);
    float _1460 = _770 * 0.18672408163547515869140625;
    float _1462 = fma(_414, _1424, _1430);
    float _1464 = -_1452;
    float _1466 = exp2(_1464);
    float _1468 = fma(_1244, _1344, (*spvDescriptorSet0.fp_c11)._m0[8].y);
    float _1470 = fma(_768, 0.095146648585796356201171875, _1460);
    float _1472 = _1456 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1474 = fma(_766, 0.0364394821226596832275390625, _1470);
    float _1476 = precise::max(_1474, 0.00999999977648258209228515625);
    float _1478 = 1.0 / _1476;
    float _1480 = _1458 * _1478;
    float _1482 = -_1444;
    float _1484 = _1482 + 1.0;
    float _1486 = _1466 * _1484;
    float _1488 = precise::min(_1480, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1490 = 1.0 / _1436;
    float _1492 = fma(_710, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _1494 = _1488 * 0.31830990314483642578125;
    float _1496 = _1386 * _1494;
    float _1498 = -(*spvDescriptorSet0.fp_c11)._m0[8].x;
    float _1500 = _1334 + _1498;
    float _1502 = _766 * _1496;
    float _1504 = fma(_1244, _1500, (*spvDescriptorSet0.fp_c11)._m0[8].x);
    float _1506 = fma(_1244, _1364, (*spvDescriptorSet0.fp_c11)._m0[8].z);
    float _1508 = _768 * _1496;
    float _1510 = _1486 * _1490;
    float _1512 = fma(_1492, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1514 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1516 = fma(_1514, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1518 = _1320 * _1504;
    float _1520 = _1506 * _1472;
    float _1522 = abs(_1512);
    float _1524 = log2(_1522);
    float _1526 = fma(_416, _1520, _1502);
    float _1528 = _1524 * 1.5;
    float _1530 = exp2(_1528);
    float _1532 = _1530 * 12.56637096405029296875;
    float _1534 = 1.0 / _1532;
    float _1536 = _1516 * _1534;
    float _1538 = _490 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1540 = _1510 * _1538;
    float _1542 = _864 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1544 = -_1540;
    float _1546 = exp2(_1544);
    float _1548 = exp2(_1542);
    float _1550 = -_1546;
    float _1552 = _1550 + 1.0;
    float _1554 = _1552 * _1536;
    float _1556 = -_1548;
    float _1558 = _1556 + 1.0;
    float _1560 = _1288 * _1554;
    float _1562 = _1558 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1564 = -_1562;
    float _1566 = _1564 + 1.0;
    float _1568 = _1562 * _1546;
    float _1570 = _1546 * _1566;
    float _1572 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1574 = fma(_414, _1572, _1282);
    float _1576 = fma(_414, _1428, _1454);
    float _1578 = _770 * _1496;
    float _1580 = _1456 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1582 = _1504 * _1574;
    float _1584 = _1468 * _1462;
    float _1586 = _1504 * _1580;
    float _1588 = _1456 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1590 = _1324 * _1468;
    float _1592 = fma(_416, _1586, _1508);
    float _1594 = _1468 * _1588;
    float _1596 = precise::min(_1170, 1.0);
    float _1598 = _1326 * _1506;
    float _1600 = _1506 * _1576;
    float _1602 = fma(_416, _1594, _1578);
    float _1604 = fma(_1596, _1582, _1592);
    float _1606 = fma(_1596, _1600, _1526);
    float _1608 = _1596 * _1518;
    float _1610 = _1560 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1612 = fma(_1596, _1584, _1602);
    float _1614 = _1560 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1616 = _1596 * _1590;
    float _1618 = _1596 * _1598;
    float _1620 = fma(_1196, _1568, _1610);
    float _1622 = precise::max(0.0, _1604);
    float _1624 = fma(_1194, _1568, _1614);
    float _1626 = precise::max(0.0, _1608);
    float _1628 = _1560 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1630 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1632 = _490 + _1630;
    float _1634 = precise::max(0.0, _1612);
    float _1636 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1638 = _490 + _1636;
    float _1640 = precise::max(0.0, _1616);
    float _1642 = fma(_1198, _1568, _1628);
    float _1644 = precise::max(0.0, _1618);
    float _1646 = fma(_1570, _1622, _1624);
    float _1648 = precise::max(0.0, _1606);
    float _1650 = _1632 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1652 = precise::clamp(_1650, 0.0, 1.0);
    float _1654 = _1570 * _1626;
    float _1656 = _1638 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1658 = precise::clamp(_1656, 0.0, 1.0);
    float _1660 = fma(_1570, _1634, _1620);
    float _1662 = _1570 * _1640;
    float _1664 = _1570 * _1644;
    float _1666 = fma(_1570, _1648, _1642);
    float _1668 = fma(_1652, _1654, _1646);
    float _1670 = fma(_1658, _1654, _1646);
    float _1672 = fma(_1652, _1662, _1660);
    float _1674 = fma(_1658, _1662, _1660);
    float _1676 = fma(_1652, _1664, _1666);
    float _1678 = fma(_1658, _1664, _1666);
    out.m_71.x = _1668;
    out.m_71.y = _1672;
    out.m_71.z = _1676;
    out.m_71.w = (*spvDescriptorSet0.fp_c11)._m0[34].w;
    out.m_73.x = _1670;
    out.m_73.y = _1674;
    out.m_73.z = _1678;
    out.m_73.w = (*spvDescriptorSet0.fp_c11)._m0[34].w;
    return out;
}

