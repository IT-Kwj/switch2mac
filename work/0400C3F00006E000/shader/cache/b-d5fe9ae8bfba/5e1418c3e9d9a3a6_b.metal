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
    float2 _1979;
    _1979.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_228, _230));
    _1979.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_228, _230));
    float _236 = _1979.x;
    float _238 = _236 * 256.0;
    int _240 = int(_238);
    float2 _1990;
    _1990.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_224, _226));
    _1990.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_224, _226));
    float _242 = _1990.x;
    float _244 = _242 * 256.0;
    int _246 = int(_244);
    float _248 = _218 * _204;
    float _250 = _222 * _212;
    float2 _2006;
    _2006.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_232, _234));
    _2006.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_232, _234));
    float _252 = _2006.x;
    float _254 = _252 * 256.0;
    int _256 = int(_254);
    float2 _2016;
    _2016.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_248, _250));
    _2016.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_248, _250));
    float _258 = _2016.x;
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
    float _402 = precise::max(_358, _378);
    float2 _2255 = float2(_388, _392);
    float _404 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2255, float2(0.0), isnan(_2255))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2255, float2(0.0), isnan(_2255))).x;
    float3 _2266 = float3(_350, _396, _368);
    float _406 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2266, float3(0.0), isnan(_2266))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2266, float3(0.0), isnan(_2266))).x;
    float3 _2279 = float3(_228, _230, float(int(_346)));
    float3 _2281 = select(_2279, float3(0.0), isnan(_2279));
    float2 _410 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2281.xy, uint(rint(_2281.z)), level(_400)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2281.xy, uint(rint(_2281.z)), level(_400)).yz;
    float _412 = _410.x;
    float _414 = _410.y;
    float3 _2295 = float3(_224, _226, float(int(_346)));
    float3 _2297 = select(_2295, float3(0.0), isnan(_2295));
    float _416 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2297.xy, uint(rint(_2297.z)), level(_402)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2297.xy, uint(rint(_2297.z)), level(_402)).x;
    float3 _2307 = float3(_232, _234, float(int(_346)));
    float3 _2309 = select(_2307, float3(0.0), isnan(_2307));
    float3 _420 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2309.xy, uint(rint(_2309.z)), level(_398)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2309.xy, uint(rint(_2309.z)), level(_398)).xyz;
    float _422 = _420.x;
    float _424 = _420.y;
    float _426 = _420.z;
    float3 _2325 = float3(_248, _250, float(int(_346)));
    float3 _2327 = select(_2325, float3(0.0), isnan(_2325));
    float3 _428 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2327.xy, uint(rint(_2327.z)), level(_394)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2327.xy, uint(rint(_2327.z)), level(_394)).xyz;
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
    float _454 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _456 = _334 + _454;
    float _458 = _452 * _452;
    bool _462 = _448 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _464 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _466 = _332 + _464;
    float _468 = fma(_456, _456, _458);
    float _470 = in.m_66.y;
    float _472 = gl_FragCoord.w;
    float _474 = _470 * _472;
    float _476 = fma(_466, _466, _468);
    float _478 = _400;
    float _480 = _224;
    float _482 = as_type<float>(_346);
    float _484 = _392;
    float _486 = _154;
    if (_462)
    {
        float _488 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _478 = _488;
    }
    float _490 = _478;
    float _492 = in.m_66.x;
    float _494 = gl_FragCoord.w;
    float _496 = _492 * _494;
    float _498 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _500 = _448 + _498;
    float _502 = sqrt(_476);
    float _504 = in.m_66.z;
    float _506 = gl_FragCoord.w;
    float _508 = _504 * _506;
    float _510 = _500;
    if (_462)
    {
        float _512 = _500 * _490;
        _510 = _512;
    }
    float _514 = _510;
    if (_462)
    {
        float _516 = _514 * 0.15915493667125701904296875;
        _480 = _516;
    }
    float _518 = _480;
    float _520 = _490;
    float _522 = _518;
    if (_462)
    {
        float _524 = _518 * 6.283185482025146484375;
        float _526 = sin(_524);
        _520 = _526;
    }
    float _528 = _520;
    float _530 = spvFAdd(_502, 9.9999997473787516355514526367188e-06);
    if (_462)
    {
        float _532 = _336 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _482 = _532;
    }
    float _534 = _482;
    float _536 = _458;
    if (_462)
    {
        float _538 = _518 * 6.283185482025146484375;
        float _540 = cos(_538);
        _536 = _540;
    }
    float _542 = _536;
    float _544 = _154 * _474;
    float _546 = 1.0 / _530;
    float _548 = _528;
    if (_462)
    {
        float _550 = fma(_528, _534, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _548 = _550;
    }
    float _552 = _548;
    float _554 = _154 * _496;
    float _556 = _544 * _544;
    float _558 = _446;
    float _560 = _556;
    float _562 = _508;
    float _564 = _552;
    if (_462)
    {
        float _566 = rsqrt(_446);
        _558 = _566;
    }
    float _568 = _558;
    float _570 = fma(_554, _554, _556);
    if (_462)
    {
        float _572 = _542 + (-1.0);
        _560 = _572;
    }
    float _574 = _560;
    float _576 = _154 * _508;
    float _578 = 0.0;
    if (_462)
    {
        float _580 = _574 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _578 = _580;
    }
    float _582 = _578;
    float _584 = _456 * _546;
    float _586 = _466 * _546;
    float _588 = _452 * _546;
    if (!_462)
    {
        _562 = _336;
    }
    float _590 = _562;
    float _592 = _590;
    if (_462)
    {
        float _594 = fma(_336, _542, _582);
        _592 = _594;
    }
    float _596 = _592;
    float _598 = _588 + (*spvDescriptorSet0.fp_c9)._m0[67].y;
    if (_462)
    {
        float _600 = _568 * _552;
        _564 = _600;
    }
    float _602 = _564;
    if (!_462)
    {
        _522 = _334;
    }
    float _604 = _522;
    float _606 = _584 + (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _608 = _604;
    if (_462)
    {
        float _610 = fma(_442, _602, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _608 = _610;
    }
    float _612 = _608;
    float _614 = _598 * _598;
    float _616 = _588 + (*spvDescriptorSet0.fp_c9)._m0[67].y;
    float _618 = fma(_576, _576, _570);
    float _620 = fma(_606, _606, _614);
    float _622 = _616 * _616;
    if (!_462)
    {
        _484 = _332;
    }
    float _624 = _484;
    float _626 = _624;
    if (_462)
    {
        float _628 = fma(_438, _602, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _626 = _628;
    }
    float _630 = _626;
    float _632 = rsqrt(_618);
    float _634 = fma(_606, _606, _622);
    float _636 = _586 + (*spvDescriptorSet0.fp_c9)._m0[67].z;
    float _638 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _640 = _596 + _638;
    float _642 = _586 + (*spvDescriptorSet0.fp_c9)._m0[67].z;
    float _644 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _646 = _612 + _644;
    float _648 = fma(_636, _636, _634);
    float _650 = _640 * _640;
    float _652 = fma(_642, _642, _620);
    float _654 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _656 = _630 + _654;
    float _658 = fma(_646, _646, _650);
    float _660 = rsqrt(_652);
    float _662 = fma(_656, _656, _658);
    float _664 = _554 * _632;
    float _666 = _544 * _632;
    float _668 = _576 * _632;
    float _670 = rsqrt(_648);
    float _672 = _588 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _674 = _664 * _584;
    float _676 = rsqrt(_662);
    float _678 = fma(_584, (*spvDescriptorSet0.fp_c9)._m0[69].x, _672);
    float _680 = -_588;
    float _682 = -_674;
    float _684 = fma(_666, _680, _682);
    float _686 = fma(_586, (*spvDescriptorSet0.fp_c9)._m0[69].z, _678);
    float _688 = -_586;
    float _690 = fma(_668, _688, _684);
    float _692 = precise::clamp(_690, 0.0, 1.0);
    float _694 = _584 + (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _696 = _598 * _660;
    float _698 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _700 = _694 * _670;
    float _702 = _696 * (*spvDescriptorSet0.fp_c9)._m0[67].y;
    float _704 = precise::max(0.0, _698);
    float _706 = _676 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _708 = _642 * _660;
    float _710 = fma(_700, (*spvDescriptorSet0.fp_c9)._m0[67].x, _702);
    float _712 = _646 * _706;
    float _714 = _656 * _706;
    float _716 = _712 * _712;
    float _718 = _714 * _714;
    float _720 = -_706;
    float _722 = -_704;
    float _724 = fma(_640, _720, _722);
    float _726 = in.m_68.x;
    float _728 = gl_FragCoord.w;
    float _730 = _726 * _728;
    float _732 = in.m_68.z;
    float _734 = gl_FragCoord.w;
    float _736 = _732 * _734;
    float _738 = _716 + _718;
    float _740 = in.m_68.y;
    float _742 = gl_FragCoord.w;
    float _744 = _740 * _742;
    float _746 = in.m_68.w;
    float _748 = gl_FragCoord.w;
    float _750 = _746 * _748;
    float _752 = sqrt(_738);
    float _754 = fma(_708, (*spvDescriptorSet0.fp_c9)._m0[67].z, _710);
    float _756 = precise::clamp(_754, 0.0, 1.0);
    bool _758 = _752 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _760 = _154 * _730;
    float _762 = _154 * _736;
    float _764 = _154 * _744;
    float _766 = _154 * _750;
    float _768 = _724;
    float _770 = _716;
    float _772 = _712;
    float _774 = _714;
    if (!_758)
    {
        _486 = _718;
    }
    float _776 = _486;
    bool _778 = !_758;
    float _780 = _776;
    if (!_778)
    {
        float _782 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _784 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _786 = _752 + _784;
        float _788 = rsqrt(_738);
        float _790 = _786 * _782;
        float _792 = _724 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _794 = _790 * 0.15915493667125701904296875;
        float _796 = _794 * 6.283185482025146484375;
        float _798 = sin(_796);
        float _800 = _794 * 6.283185482025146484375;
        float _802 = cos(_800);
        float _804 = fma(_798, _792, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _806 = _788 * _804;
        float _808 = _802 + (-1.0);
        float _810 = _712 * _806;
        float _812 = _714 * _806;
        float _814 = _808 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _816 = _812 * _812;
        float _818 = fma(_724, _802, _814);
        float _820 = _810 * _810;
        _768 = _818;
        _770 = _820;
        _780 = _816;
        _772 = _810;
        _774 = _812;
    }
    float _822 = _768;
    float _824 = _770;
    float _826 = _780;
    float _828 = _772;
    float _830 = _774;
    float _832 = fma(_822, _822, _824);
    float _834 = _336 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _836 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _838 = fma(_502, (*spvDescriptorSet0.fp_c9)._m0[63].x, _836);
    float _840 = precise::clamp(_838, 0.0, 1.0);
    float _842 = _832 + _826;
    float _844 = fma(_334, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _834);
    float _846 = -_840;
    float _848 = _846 + 1.0;
    float _850 = rsqrt(_842);
    float _852 = fma(_332, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _844);
    float _854 = _852 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _856 = abs(_848);
    float _858 = log2(_856);
    float _860 = _850 * _828;
    float _862 = _850 * _822;
    float _864 = _850 * _830;
    float _866 = _860 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _868 = _858 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _870 = -_866;
    float _872 = fma(_862, (*spvDescriptorSet0.fp_c9)._m0[69].y, _870);
    float _874 = -_864;
    float _876 = fma(_874, (*spvDescriptorSet0.fp_c9)._m0[69].z, _872);
    float _878 = exp2(_868);
    float _880 = _862 + 1.0;
    float _882 = fma(_876, -0.5, 0.5);
    float _884 = sqrt(_882);
    float _886 = -_862;
    float _888 = fma(_878, _880, _886);
    float _890 = _336 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _892 = fma(_876, 0.5, 0.5);
    float _894 = fma(_334, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _890);
    float _896 = fma(_892, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _898 = fma(_332, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _894);
    float _900 = _884 * 0.636619746685028076171875;
    float _902 = trunc(_854);
    int _904 = int(_902);
    float _906 = fma(_892, _896, -0.212114393711090087890625);
    float _908 = _898 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _910 = fma(_892, _906, 1.570728778839111328125);
    float _912 = trunc(_908);
    int _914 = int(_912);
    float _916 = -_910;
    float _918 = fma(_900, _916, 1.0);
    int _920 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _922 = _904 + _920;
    int _924 = _922 + 1;
    bool _926 = _924 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    int _928 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _930 = _914 + _928;
    int _932 = _930 + 1;
    int _934 = _924 | _932;
    bool _936 = _934 < 0;
    bool _938 = _936 || _926;
    bool _940 = _932 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _942 = _940 || _938;
    float _944 = as_type<float>(_934);
    if (_942)
    {
        _944 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _946 = _944;
    float _948 = _946;
    if (!_942)
    {
        float _950 = floor(_908);
        int _952 = _932 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _954 = _952 + _924;
        int _956 = _954 << 2;
        int _958 = _954 >> 2;
        float _960 = floor(_854);
        int _962 = 12 & _956;
        int _964 = _954 << 4;
        int _966 = _964 + 17904;
        int _968 = _958 << 4;
        int _970 = _968 + _962;
        float _972 = -_950;
        float _974 = _908 + _972;
        uint _976 = uint(int(uint(_966) >> uint(2)));
        uint _978 = uint(int(uint(int(_976)) >> uint(2)));
        int _980 = int(_976) & 3;
        float _982 = (*spvDescriptorSet0.fp_c9)._m0[int(_978)][_980];
        int _984 = int(_976) + 1;
        uint _986 = uint(int(uint(_984) >> uint(2)));
        int _988 = _984 & 3;
        float _990 = (*spvDescriptorSet0.fp_c9)._m0[int(_986)][_988];
        float _992 = -_960;
        float _994 = _854 + _992;
        float _996 = _336 * _990;
        float _998 = fma(_334, _982, _996);
        int _1000 = _970 + 16256;
        uint _1002 = uint(int(uint(_1000) >> uint(2)));
        uint _1004 = uint(int(uint(int(_1002)) >> uint(2)));
        int _1006 = int(_1002) & 3;
        float _1008 = (*spvDescriptorSet0.fp_c9)._m0[int(_1004)][_1006];
        float _1010 = rint(_1008);
        float _1012 = precise::max(_1010, 0.0);
        uint _1014 = uint(_1012);
        uint _1016 = clamp(_1014, 0u, 65535u);
        float3 _3232 = float3(_994, _974, float(int(_1016)));
        float3 _3234 = select(_3232, float3(0.0), isnan(_3232));
        float _1018 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3234.xy, uint(rint(_3234.z))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3234.xy, uint(rint(_3234.z))).x;
        int _1020 = _970 + 24304;
        uint _1022 = uint(int(uint(_1020) >> uint(2)));
        uint _1024 = uint(int(uint(int(_1022)) >> uint(2)));
        int _1026 = int(_1022) & 3;
        float _1028 = (*spvDescriptorSet0.fp_c9)._m0[int(_1024)][_1026];
        int _1030 = _966 + 8;
        uint _1032 = uint(int(uint(_1030) >> uint(2)));
        uint _1034 = uint(int(uint(int(_1032)) >> uint(2)));
        int _1036 = int(_1032) & 3;
        float _1038 = (*spvDescriptorSet0.fp_c9)._m0[int(_1034)][_1036];
        int _1040 = int(_1032) + 1;
        uint _1042 = uint(int(uint(_1040) >> uint(2)));
        int _1044 = _1040 & 3;
        float _1046 = (*spvDescriptorSet0.fp_c9)._m0[int(_1042)][_1044];
        float _1048 = 1.0 / _1028;
        float _1050 = fma(_332, _1038, _998);
        float _1052 = _1050 + _1046;
        float _1054 = precise::clamp(_1052, 0.0, 1.0);
        float _1056 = -_1054;
        float _1058 = _1056 + _1018;
        float _1060 = _1028 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _1062 = fma(_1048, (*spvDescriptorSet0.fp_c13)._m0[4].w, _1058);
        float _1064 = _1060 * _1062;
        float _1066 = exp2(_1064);
        float _1068 = 0.0 + _1066;
        float _1070 = precise::clamp(_1068, 0.0, 1.0);
        float _1072 = precise::min(_1070, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _948 = _1072;
    }
    float _1074 = _948;
    float _1076 = -_766;
    float _1078 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _1080 = _1076 + _1078;
    float _1082 = -_1074;
    float _1084 = _1082 + 1.0;
    float _1086 = _666 * _666;
    float _1088 = _1080 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1090 = precise::clamp(_1088, 0.0, 1.0);
    float _1092 = fma(_666, 0.5, 0.5);
    float _1094 = fma(_664, _664, _1086);
    float _1096 = fma(_1090, _1084, _1074);
    float _1098 = -(*spvDescriptorSet0.fp_c9)._m0[1007].y;
    float _1100 = _1098 + (*spvDescriptorSet0.fp_c9)._m0[1006].y;
    float _1102 = -(*spvDescriptorSet0.fp_c9)._m0[1007].x;
    float _1104 = _1102 + (*spvDescriptorSet0.fp_c9)._m0[1006].x;
    float _1106 = _664 * (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _1108 = fma(_1092, _1100, (*spvDescriptorSet0.fp_c9)._m0[1007].y);
    float _1110 = -(*spvDescriptorSet0.fp_c9)._m0[1007].z;
    float _1112 = _1110 + (*spvDescriptorSet0.fp_c9)._m0[1006].z;
    float _1114 = fma(_1092, _1104, (*spvDescriptorSet0.fp_c9)._m0[1007].x);
    float _1116 = _1108 * 0.715200006961822509765625;
    float _1118 = fma(_1092, _1112, (*spvDescriptorSet0.fp_c9)._m0[1007].z);
    float _1120 = fma(_1114, 0.2125999927520751953125, _1116);
    float _1122 = -_666;
    float _1124 = -_1106;
    float _1126 = fma(_1122, (*spvDescriptorSet0.fp_c9)._m0[67].y, _1124);
    float _1128 = -(*spvDescriptorSet0.fp_c9)._m0[1001].y;
    float _1130 = _1128 + (*spvDescriptorSet0.fp_c9)._m0[1000].y;
    float _1132 = -(*spvDescriptorSet0.fp_c9)._m0[1001].x;
    float _1134 = _1132 + (*spvDescriptorSet0.fp_c9)._m0[1000].x;
    float _1136 = fma(_1118, 0.072200000286102294921875, _1120);
    float _1138 = -(*spvDescriptorSet0.fp_c9)._m0[1001].z;
    float _1140 = _1138 + (*spvDescriptorSet0.fp_c9)._m0[1000].z;
    float _1142 = -_668;
    float _1144 = fma(_1142, (*spvDescriptorSet0.fp_c9)._m0[67].z, _1126);
    float _1146 = precise::clamp(_1144, 0.0, 1.0);
    float _1148 = fma(_668, _668, _1094);
    float _1150 = precise::clamp(_1148, 0.0, 1.0);
    float _1152 = fma(_1092, _1130, (*spvDescriptorSet0.fp_c9)._m0[1001].y);
    float _1154 = fma(_1092, _1134, (*spvDescriptorSet0.fp_c9)._m0[1001].x);
    float _1156 = 1.0 / _1136;
    float _1158 = fma(_1092, _1140, (*spvDescriptorSet0.fp_c9)._m0[1001].z);
    float _1160 = fma(_888, 0.5, 0.5);
    float _1162 = fma(_1150, 0.5, 0.5);
    float _1164 = precise::max(0.0, _666);
    float _1166 = precise::min(_1164, 0.100000001490116119384765625);
    float _1168 = _1156 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1170 = precise::clamp(_1168, 0.0, 1.0);
    float _1172 = fma(_1170, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _1174 = _1172 * 0.31830990314483642578125;
    float _1176 = fma(_1166, 10.0, -1.0);
    float _1178 = precise::max(_406, 0.25);
    float _1180 = _1108 * _1174;
    float _1182 = _1118 * _1174;
    float _1184 = _1114 * _1174;
    float2 _3518 = float2(_918, _1160);
    float3 _1186 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3518, float2(0.0), isnan(_3518))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3518, float2(0.0), isnan(_3518))).xyz;
    float _1188 = _1186.x;
    float _1190 = _1186.y;
    float _1192 = _1186.z;
    float _1194 = _1154 * 0.31830990314483642578125;
    float _1196 = _422 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1198 = _1158 * 0.31830990314483642578125;
    float _1200 = _426 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1202 = _1152 * 0.31830990314483642578125;
    float _1204 = _424 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1206 = precise::max(_1196, _1194);
    float _1208 = _432 * 0.4774648249149322509765625;
    float _1210 = precise::max(_1200, _1198);
    float _1212 = _1178 + _1176;
    float _1214 = _412 + (*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1216 = precise::clamp(_1214, 0.0, 1.0);
    float _1218 = precise::max(_1204, _1202);
    float _1220 = _430 * 0.4774648249149322509765625;
    float _1222 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1224 = _1222 + 1.0;
    float _1226 = _1208 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1228 = _1216 * _1206;
    float _1230 = _1216 * _1218;
    float _1232 = _1216 * _1210;
    float _1234 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1236 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].y, _1224);
    float _1238 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1240 = _1220 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1242 = fma(_414, _1234, _1226);
    float _1244 = 0.0 + _404;
    float _1246 = precise::clamp(_1244, 0.0, 1.0);
    float _1248 = _1236 * (*spvDescriptorSet0.fp_c11)._m0[39].w;
    float _1250 = fma(_414, _1238, _1240);
    float _1252 = precise::max(_1240, _1184);
    float _1254 = _1212 * 4.0;
    float _1256 = precise::clamp(_1254, 0.0, 1.0);
    float _1258 = _1242 * 0.586610972881317138671875;
    float _1260 = _416 * _1246;
    float _1262 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].x, _1224);
    float _1264 = fma(_1250, 0.298911988735198974609375, _1258);
    float _1266 = precise::min(_1248, (*spvDescriptorSet0.fp_c11)._m0[13].x);
    float _1268 = _1260 * _1256;
    float _1270 = fma((*spvDescriptorSet0.fp_c11)._m0[45].w, 2.0, -0.5);
    float _1272 = precise::clamp(_1270, 0.0, 1.0);
    float _1274 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1276 = -_1266;
    float _1278 = _1276 + 1.0;
    float _1280 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].z, _1224);
    float _1282 = fma(_1272, -0.449999988079071044921875, 1.0);
    float _1284 = -_1262;
    float _1286 = fma(_1284, (*spvDescriptorSet0.fp_c11)._m0[36].z, 1.0);
    float _1288 = _1272 * _1278;
    float _1290 = _1282 * (*spvDescriptorSet0.fp_c11)._m0[8].z;
    float _1292 = precise::max(_1226, _1180);
    float _1294 = _1280 + (-1.0);
    float _1296 = abs(_452);
    bool _1298 = _1296 > 0.00999999977648258209228515625;
    float _1300 = -(*spvDescriptorSet0.fp_c11)._m0[13].y;
    float _1302 = _1300 + (*spvDescriptorSet0.fp_c11)._m0[13].z;
    float _1304 = _756 * _756;
    float _1306 = precise::min(_1096, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1308 = fma(_1288, _1302, (*spvDescriptorSet0.fp_c11)._m0[13].y);
    float _1310 = _1282 * (*spvDescriptorSet0.fp_c11)._m0[8].x;
    float _1312 = _1298 ? _452 : 0.00999999977648258209228515625;
    float _1314 = -(*spvDescriptorSet0.fp_c11)._m0[45].w;
    float _1316 = fma(_1308, (*spvDescriptorSet0.fp_c11)._m0[45].w, _1314);
    float _1318 = precise::max(_1286, (*spvDescriptorSet0.fp_c11)._m0[44].w);
    float _1320 = -_1310;
    float _1322 = _1320 + (*spvDescriptorSet0.fp_c11)._m0[8].x;
    float _1324 = _1312 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _1326 = fma(_1318, _1322, _1310);
    float _1328 = _1282 * (*spvDescriptorSet0.fp_c11)._m0[8].y;
    float _1330 = -_1328;
    float _1332 = _1330 + (*spvDescriptorSet0.fp_c11)._m0[8].y;
    float _1334 = fma(_1318, _1332, _1328);
    float _1336 = -_1290;
    float _1338 = _1336 + (*spvDescriptorSet0.fp_c11)._m0[8].z;
    float _1340 = fma(_1318, _1338, _1290);
    float _1342 = _434 * 0.4774648249149322509765625;
    float _1344 = _692 * (-9.27999973297119140625);
    float _1346 = -_692;
    float _1348 = _1346 + 1.0;
    float _1350 = -(*spvDescriptorSet0.fp_c11)._m0[8].z;
    float _1352 = _1340 + _1350;
    float _1354 = _1342 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1356 = exp2(_1344);
    float _1358 = fma(_414, _1274, _1354);
    float _1360 = fma(_1268, _1316, (*spvDescriptorSet0.fp_c11)._m0[45].w);
    float _1362 = fma(_1268, _1352, (*spvDescriptorSet0.fp_c11)._m0[8].z);
    float _1364 = precise::max(_1354, _1182);
    float _1366 = fma(_1358, 0.114477999508380889892578125, _1264);
    float _1368 = -_1360;
    float _1370 = _1368 + 1.0;
    float _1372 = fma(_1360, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1374 = _1360 * _1304;
    float _1376 = _1374 * 2.0;
    float _1378 = _1370 * _1370;
    float _1380 = fma(_1360, 0.5, _1376);
    float _1382 = precise::min(_1378, _1356);
    float _1384 = -(*spvDescriptorSet0.fp_c11)._m0[8].x;
    float _1386 = _1326 + _1384;
    float _1388 = -(*spvDescriptorSet0.fp_c11)._m0[8].y;
    float _1390 = _1334 + _1388;
    float _1392 = _1380 + (-1.0);
    float _1394 = fma(_1268, _1386, (*spvDescriptorSet0.fp_c11)._m0[8].x);
    float _1396 = fma(_1360, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1398 = fma(_1268, _1390, (*spvDescriptorSet0.fp_c11)._m0[8].y);
    float _1400 = fma(_1370, _1382, _1396);
    float _1402 = fma(_1268, _1294, 1.0);
    float _1404 = _1398 + (-0.039999999105930328369140625);
    float _1406 = fma(_1400, 1.03999996185302734375, _1372);
    float _1408 = precise::clamp(_1406, 0.0, 1.0);
    float _1410 = fma(_1360, -0.572000026702880859375, 1.03999996185302734375);
    float _1412 = _1402 * _1408;
    float _1414 = _1394 + (-0.039999999105930328369140625);
    float _1416 = fma(_1400, -1.03999996185302734375, _1410);
    float _1418 = precise::clamp(_1416, 0.0, 1.0);
    float _1420 = _1362 + (-0.039999999105930328369140625);
    float _1422 = fma(_1414, (*spvDescriptorSet0.fp_c11)._m0[44].w, 0.039999999105930328369140625);
    float _1424 = fma(_1404, (*spvDescriptorSet0.fp_c11)._m0[44].w, 0.039999999105930328369140625);
    float _1426 = fma(_1420, (*spvDescriptorSet0.fp_c11)._m0[44].w, 0.039999999105930328369140625);
    float _1428 = -(*spvDescriptorSet0.fp_c11)._m0[44].w;
    float _1430 = _1428 + 1.0;
    float _1432 = fma(_1422, _1418, _1412);
    float _1434 = fma(_1424, _1418, _1412);
    float _1436 = fma(_1426, _1418, _1412);
    float _1438 = _1348 * _1348;
    float _1440 = _1438 * _1438;
    float _1442 = -_1146;
    float _1444 = _1442 + 1.0;
    float _1446 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1448 = _1348 * _1440;
    float _1450 = _1444 * _1444;
    float _1452 = -_1446;
    float _1454 = exp2(_1452);
    float _1456 = _1450 * _1450;
    float _1458 = _1444 * _1456;
    float _1460 = precise::max(_1324, -127.0);
    float _1462 = fma(_1458, _1392, 1.0);
    float _1464 = -_1460;
    float _1466 = exp2(_1464);
    float _1468 = 1.0 / _1460;
    float _1470 = -_1466;
    float _1472 = _1470 + 1.0;
    float _1474 = _1454 * _1472;
    float _1476 = _502 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1478 = _1474 * _1468;
    float _1480 = _1478 * _1476;
    float _1482 = fma(_686, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _1484 = fma(_1482, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1486 = -_1480;
    float _1488 = exp2(_1486);
    float _1490 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1492 = fma(_1490, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1494 = abs(_1484);
    float _1496 = log2(_1494);
    float _1498 = -_1488;
    float _1500 = _1498 + 1.0;
    float _1502 = _1496 * 1.5;
    float _1504 = fma(_1448, _1392, 1.0);
    float _1506 = _764 * 0.18672408163547515869140625;
    float _1508 = _858 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1510 = _1462 * _1504;
    float _1512 = exp2(_1502);
    float _1514 = fma(_760, 0.095146648585796356201171875, _1506);
    float _1516 = fma(_762, 0.0364394821226596832275390625, _1514);
    float _1518 = exp2(_1508);
    float _1520 = precise::max(_1516, 0.00999999977648258209228515625);
    float _1522 = _1512 * 12.56637096405029296875;
    float _1524 = 1.0 / _1520;
    float _1526 = 1.0 / _1522;
    float _1528 = _1366 * _1524;
    float _1530 = precise::min(_1528, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1532 = fma(_1360, -0.337748348712921142578125, 1.0);
    float _1534 = _1492 * _1526;
    float _1536 = _1532 * _1510;
    float _1538 = _1530 * 0.31830990314483642578125;
    float _1540 = _1500 * _1534;
    float _1542 = -_1518;
    float _1544 = _1542 + 1.0;
    float _1546 = _1146 * _1536;
    float _1548 = _1394 * _1430;
    float _1550 = _1306 * _1540;
    float _1552 = _1544 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1554 = _1546 * 0.31830990314483642578125;
    float _1556 = _1398 * _1430;
    float _1558 = _1228 * _1548;
    float _1560 = -_1552;
    float _1562 = _1560 + 1.0;
    float _1564 = _1552 * _1488;
    float _1566 = _1554 * _1430;
    float _1568 = _1488 * _1562;
    float _1570 = _1230 * _1556;
    float _1572 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1574 = _1566 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1576 = fma(_414, _1572, _1292);
    float _1578 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1580 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1582 = _1398 * _1574;
    float _1584 = _1556 * _1576;
    float _1586 = fma(_414, _1578, _1252);
    float _1588 = fma(_414, _1580, _1364);
    float _1590 = _760 * _1538;
    float _1592 = _764 * _1538;
    float _1594 = _762 * _1538;
    float _1596 = _1548 * _1586;
    float _1598 = _1432 * _1590;
    float _1600 = _1434 * _1592;
    float _1602 = _1566 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1604 = _1436 * _1594;
    float _1606 = _1566 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1608 = _1362 * _1430;
    float _1610 = _1394 * _1602;
    float _1612 = fma(_416, _1582, _1600);
    float _1614 = _1362 * _1606;
    float _1616 = _1550 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1618 = fma(_416, _1610, _1598);
    float _1620 = precise::min(_1162, 1.0);
    float _1622 = _1232 * _1608;
    float _1624 = _1608 * _1588;
    float _1626 = fma(_416, _1614, _1604);
    float _1628 = fma(_1620, _1596, _1618);
    float _1630 = fma(_1620, _1584, _1612);
    float _1632 = _1620 * _1570;
    float _1634 = _1550 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1636 = _1620 * _1558;
    float _1638 = fma(_1188, _1564, _1616);
    float _1640 = _1620 * _1622;
    float _1642 = fma(_1620, _1624, _1626);
    float _1644 = precise::max(0.0, _1630);
    float _1646 = fma(_1190, _1564, _1634);
    float _1648 = precise::max(0.0, _1628);
    float _1650 = _1550 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1652 = precise::max(0.0, _1636);
    float _1654 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1656 = _502 + _1654;
    float _1658 = fma(_1568, _1644, _1646);
    float _1660 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1662 = _502 + _1660;
    float _1664 = precise::max(0.0, _1632);
    float _1666 = fma(_1192, _1564, _1650);
    float _1668 = precise::max(0.0, _1640);
    float _1670 = fma(_1568, _1648, _1638);
    float _1672 = precise::max(0.0, _1642);
    float _1674 = _1656 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1676 = precise::clamp(_1674, 0.0, 1.0);
    float _1678 = _1568 * _1652;
    float _1680 = _1662 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1682 = precise::clamp(_1680, 0.0, 1.0);
    float _1684 = _1568 * _1664;
    float _1686 = _1568 * _1668;
    float _1688 = fma(_1568, _1672, _1666);
    float _1690 = fma(_1676, _1678, _1670);
    float _1692 = fma(_1682, _1678, _1670);
    float _1694 = fma(_1676, _1684, _1658);
    float _1696 = fma(_1682, _1684, _1658);
    float _1698 = fma(_1676, _1686, _1688);
    float _1700 = fma(_1682, _1686, _1688);
    out.m_71.x = _1690;
    out.m_71.y = _1694;
    out.m_71.z = _1698;
    out.m_71.w = 1.0;
    out.m_73.x = _1692;
    out.m_73.y = _1696;
    out.m_73.z = _1700;
    out.m_73.w = 1.0;
    return out;
}

