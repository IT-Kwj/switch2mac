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
    texture2d<float> fp_t_tcb_1A [[id(12)]];
    sampler fp_t_tcb_1ASmplr [[id(13)]];
    texture3d<float> fp_t_tcb_1E [[id(14)]];
    sampler fp_t_tcb_1ESmplr [[id(15)]];
    texture2d<float> fp_t_tcb_16 [[id(16)]];
    sampler fp_t_tcb_16Smplr [[id(17)]];
    texture2d<float> fp_t_tcb_1C [[id(18)]];
    sampler fp_t_tcb_1CSmplr [[id(19)]];
    texture2d<float> fp_t_tcb_E [[id(20)]];
    sampler fp_t_tcb_ESmplr [[id(21)]];
    texture2d_array<float> fp_t_tcb_10 [[id(22)]];
    sampler fp_t_tcb_10Smplr [[id(23)]];
    texture3d<float> fp_t_tcb_20 [[id(24)]];
    sampler fp_t_tcb_20Smplr [[id(25)]];
    texture2d<float> fp_t_tcb_14 [[id(26)]];
    sampler fp_t_tcb_14Smplr [[id(27)]];
    texture2d<float> fp_t_tcb_12 [[id(28)]];
    sampler fp_t_tcb_12Smplr [[id(29)]];
    sampler fp_t_tcb_8Smplr_w [[id(30)]];
    sampler fp_t_tcb_ASmplr_w [[id(31)]];
    sampler fp_t_tcb_CSmplr_w [[id(32)]];
    sampler fp_t_tcb_1ASmplr_w [[id(33)]];
    sampler fp_t_tcb_1ESmplr_w [[id(34)]];
    sampler fp_t_tcb_16Smplr_w [[id(35)]];
    sampler fp_t_tcb_1CSmplr_w [[id(36)]];
    sampler fp_t_tcb_ESmplr_w [[id(37)]];
    sampler fp_t_tcb_10Smplr_w [[id(38)]];
    sampler fp_t_tcb_20Smplr_w [[id(39)]];
    sampler fp_t_tcb_14Smplr_w [[id(40)]];
    sampler fp_t_tcb_12Smplr_w [[id(41)]];
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
    float4 m_74 [[user(locn3)]];
    float4 m_72 [[user(locn4)]];
    float4 m_78 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _90 = as_type<int>((*spvDescriptorSet0.fp_c7)._m0[11].z) * as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].z);
    int _92 = _90 + as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].w);
    int _94 = _92 * 96;
    int _96 = _94 + 80;
    uint _99 = uint(int(uint(_96) >> uint(2)));
    float _102 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_99)]);
    int _104 = _94 + 16;
    int _106 = _94 + 24;
    uint _108 = uint(int(uint(_104) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_108)];
    float _110 = as_type<float>(_dmw1.x);
    int _112 = _104 + 4;
    uint _114 = uint(int(uint(_112) >> uint(2)));
    float _116 = as_type<float>(_dmw1.y);
    uint _118 = uint(int(uint(_106) >> uint(2)));
    float _120 = as_type<float>(_dmw1.z);
    int _122 = _106 + 4;
    uint _124 = uint(int(uint(_122) >> uint(2)));
    float _126 = as_type<float>(_dmw1.w);
    float _128 = gl_FragCoord.w;
    float _130 = in.m_70.z;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_70.w;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = 1.0 / _128;
    float _144 = _142 * _134;
    float _146 = _142 * _140;
    int _148 = as_type<int>(_102) << 6;
    int _150 = _148 + 25904;
    uint _152 = uint(int(uint(_150) >> uint(2)));
    uint _154 = uint(int(uint(int(_152)) >> uint(2)));
    int _156 = int(_152) & 3;
    float _158 = (*spvDescriptorSet0.fp_c9)._m0[int(_154)][_156];
    int _160 = int(_152) + 1;
    uint _162 = uint(int(uint(_160) >> uint(2)));
    int _164 = _160 & 3;
    float _166 = (*spvDescriptorSet0.fp_c9)._m0[int(_162)][_164];
    float _168 = fma(_144, _110, _120);
    int _170 = _148 + 25912;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    uint _174 = uint(int(uint(int(_172)) >> uint(2)));
    int _176 = int(_172) & 3;
    float _178 = (*spvDescriptorSet0.fp_c9)._m0[int(_174)][_176];
    int _180 = int(_172) + 1;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    int _184 = _180 & 3;
    float _186 = (*spvDescriptorSet0.fp_c9)._m0[int(_182)][_184];
    float _188 = fma(_146, _116, _126);
    int _190 = _148 + 25920;
    uint _192 = uint(int(uint(_190) >> uint(2)));
    uint _194 = uint(int(uint(int(_192)) >> uint(2)));
    int _196 = int(_192) & 3;
    float _198 = (*spvDescriptorSet0.fp_c9)._m0[int(_194)][_196];
    int _200 = int(_192) + 1;
    uint _202 = uint(int(uint(_200) >> uint(2)));
    int _204 = _200 & 3;
    float _206 = (*spvDescriptorSet0.fp_c9)._m0[int(_202)][_204];
    float _208 = _168 * _158;
    float _210 = _188 * _166;
    float2 _1537;
    _1537.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_208, _210));
    _1537.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_208, _210));
    float _212 = _1537.x;
    float _214 = _212 * 256.0;
    int _216 = int(_214);
    float _218 = _168 * _178;
    float _220 = _188 * _186;
    float2 _1554;
    _1554.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_218, _220));
    _1554.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_218, _220));
    float _222 = _1554.x;
    float _224 = _222 * 256.0;
    int _226 = int(_224);
    float _228 = _168 * _198;
    float _230 = _188 * _206;
    float2 _1570;
    _1570.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_228, _230));
    _1570.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_228, _230));
    float _232 = _1570.x;
    float _234 = _232 * 256.0;
    int _236 = int(_234);
    int _238 = _94 + 8;
    uint _240 = uint(int(uint(_94) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_240)];
    float _242 = as_type<float>(_dmw0.x);
    int _244 = _94 + 4;
    uint _246 = uint(int(uint(_244) >> uint(2)));
    float _248 = as_type<float>(_dmw0.y);
    int _250 = _94 + 68;
    float _252 = in.m_72.z;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_72.x;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = in.m_72.y;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    uint _270 = uint(int(uint(_238) >> uint(2)));
    float _272 = as_type<float>(_dmw0.z);
    int _274 = _238 + 4;
    uint _276 = uint(int(uint(_274) >> uint(2)));
    float _278 = as_type<float>(_dmw0.w);
    int _280 = _148 + 25936;
    uint _282 = uint(int(uint(_280) >> uint(2)));
    uint _284 = uint(int(uint(int(_282)) >> uint(2)));
    int _286 = int(_282) & 3;
    float _288 = (*spvDescriptorSet0.fp_c9)._m0[int(_284)][_286];
    int _290 = int(_282) + 1;
    uint _292 = uint(int(uint(_290) >> uint(2)));
    int _294 = _290 & 3;
    float _296 = (*spvDescriptorSet0.fp_c9)._m0[int(_292)][_294];
    uint _298 = uint(int(uint(_250) >> uint(2)));
    float _300 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_298)]);
    float _302 = gl_FragCoord.x;
    float _304 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _306 = _302 / _304;
    float _308 = gl_FragCoord.y;
    float _310 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _312 = _308 / _310;
    int _314 = _148 + 25944;
    uint _316 = uint(int(uint(_314) >> uint(2)));
    uint _318 = uint(int(uint(int(_316)) >> uint(2)));
    int _320 = int(_316) & 3;
    float _322 = (*spvDescriptorSet0.fp_c9)._m0[int(_318)][_320];
    int _324 = _148 + 25952;
    uint _326 = uint(int(uint(_324) >> uint(2)));
    uint _328 = uint(int(uint(int(_326)) >> uint(2)));
    int _330 = int(_326) & 3;
    float _332 = (*spvDescriptorSet0.fp_c9)._m0[int(_328)][_330];
    float _334 = _142 * _256;
    float _336 = _142 * _262;
    float _338 = _142 * _268;
    float _340 = _306 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _342 = _312 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float _344 = rint(_332);
    float _346 = precise::max(_344, 0.0);
    uint _348 = uint(_346);
    uint _350 = clamp(_348, 0u, 65535u);
    float _352 = fma(_144, _242, _272);
    float _354 = _334 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _356 = _336 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _358 = _338 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _360 = fma(_146, _248, _278);
    float _362 = _354 * (*spvDescriptorSet0.fp_c11)._m0[30].z;
    float _364 = _356 * (*spvDescriptorSet0.fp_c11)._m0[30].x;
    float _366 = _358 * (*spvDescriptorSet0.fp_c11)._m0[30].y;
    float _368 = precise::max(_300, _296);
    float _370 = fma(_362, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].z);
    float _372 = fma(_364, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].x);
    float _374 = fma(_366, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].y);
    float _376 = float(uint(_236));
    float _378 = _352 * _158;
    float _380 = precise::max(_300, _322);
    float _382 = _360 * _166;
    float _384 = precise::max(_300, _288);
    float _386 = _376 * 0.00390625;
    int _388 = _94 + 64;
    float _390 = precise::max(_380, _386);
    uint _392 = uint(int(uint(_388) >> uint(2)));
    float _394 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_392)]);
    float2 _1849 = float2(_340, _342);
    float _396 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_1849, float2(0.0), isnan(_1849))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_1849, float2(0.0), isnan(_1849))).x;
    float2 _1860;
    _1860.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_378, _382));
    _1860.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_378, _382));
    float _398 = _1860.x;
    float _400 = _398 * 256.0;
    int _402 = int(_400);
    float3 _1870 = float3(_372, _374, _370);
    float _404 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1870, float3(0.0), isnan(_1870))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1870, float3(0.0), isnan(_1870))).x;
    float2 _1880 = float2(_340, _342);
    float2 _408 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1880, float2(0.0), isnan(_1880))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1880, float2(0.0), isnan(_1880))).xy;
    float _410 = _408.x;
    float _412 = _408.y;
    float _414 = float(uint(_216));
    float _416 = float(uint(_226));
    float _418 = _414 * 0.00390625;
    float _420 = _416 * 0.00390625;
    float _422 = precise::max(_384, _418);
    float _424 = precise::max(_368, _420);
    float3 _1911 = float3(_208, _210, float(int(_350)));
    float3 _1913 = select(_1911, float3(0.0), isnan(_1911));
    float2 _426 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1913.xy, uint(rint(_1913.z)), level(_422)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1913.xy, uint(rint(_1913.z)), level(_422)).yz;
    float _428 = _426.x;
    float _430 = _426.y;
    float3 _1927 = float3(_218, _220, float(int(_350)));
    float3 _1929 = select(_1927, float3(0.0), isnan(_1927));
    float3 _434 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1929.xy, uint(rint(_1929.z)), level(_424)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1929.xy, uint(rint(_1929.z)), level(_424)).xyz;
    float _436 = _434.x;
    float _438 = _434.y;
    float _440 = _434.z;
    float3 _1945 = float3(_228, _230, float(int(_350)));
    float3 _1947 = select(_1945, float3(0.0), isnan(_1945));
    float3 _442 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _1947.xy, uint(rint(_1947.z)), level(_390)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _1947.xy, uint(rint(_1947.z)), level(_390)).xyz;
    float _444 = _442.x;
    float _446 = _442.y;
    float _448 = _442.z;
    float _450 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _452 = _334 + _450;
    float _454 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _456 = _336 + _454;
    float _458 = _452 * _452;
    float _460 = fma(_456, _456, _458);
    float _462 = sqrt(_460);
    bool _466 = _462 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _468 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _470 = _462 + _468;
    float _472 = _372;
    float _474 = _470;
    float _476 = as_type<float>(_350);
    float _478 = _228;
    if (_466)
    {
        float _480 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _472 = _480;
    }
    float _482 = _472;
    if (_466)
    {
        float _484 = _470 * _482;
        _474 = _484;
    }
    float _486 = _474;
    float _488 = 0.0;
    float _490 = _486;
    if (_466)
    {
        float _492 = _486 * 0.15915493667125701904296875;
        _488 = _492;
    }
    float _494 = _488;
    float _496 = _482;
    if (_466)
    {
        float _498 = _494 * 6.283185482025146484375;
        float _500 = cos(_498);
        _496 = _500;
    }
    float _502 = _496;
    float _504 = _208;
    if (_466)
    {
        float _506 = _494 * 6.283185482025146484375;
        float _508 = sin(_506);
        _504 = _508;
    }
    float _510 = _504;
    float _512 = _218;
    if (_466)
    {
        float _514 = rsqrt(_460);
        _512 = _514;
    }
    float _516 = _512;
    if (_466)
    {
        float _518 = _338 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _476 = _518;
    }
    float _520 = _476;
    float _522 = _520;
    if (_466)
    {
        float _524 = _502 + (-1.0);
        _478 = _524;
    }
    float _526 = _478;
    float _528 = in.m_74.y;
    float _530 = gl_FragCoord.w;
    float _532 = _528 * _530;
    float _534 = 0.0;
    if (_466)
    {
        float _536 = _526 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _534 = _536;
    }
    float _538 = _534;
    float _540 = 0.0;
    float _542 = _510;
    if (_466)
    {
        float _544 = fma(_510, _520, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _540 = _544;
    }
    float _546 = _540;
    if (!_466)
    {
        _490 = _338;
    }
    float _548 = _490;
    float _550 = _548;
    if (_466)
    {
        float _552 = fma(_338, _502, _538);
        _550 = _552;
    }
    float _554 = _550;
    float _556 = in.m_74.x;
    float _558 = gl_FragCoord.w;
    float _560 = _556 * _558;
    if (!_466)
    {
        _522 = _336;
    }
    float _562 = _522;
    float _564 = _516;
    float _566 = _562;
    if (_466)
    {
        float _568 = _516 * _546;
        _564 = _568;
    }
    float _570 = _564;
    float _572 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _574 = _554 + _572;
    float _576 = in.m_74.z;
    float _578 = gl_FragCoord.w;
    float _580 = _576 * _578;
    if (_466)
    {
        float _582 = fma(_456, _570, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _566 = _582;
    }
    float _584 = _566;
    if (!_466)
    {
        _542 = _334;
    }
    float _586 = _542;
    float _588 = _586;
    if (_466)
    {
        float _590 = fma(_452, _570, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _588 = _590;
    }
    float _592 = _588;
    float _594 = _574 * _574;
    float _596 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _598 = _584 + _596;
    float _600 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _602 = _592 + _600;
    float _604 = fma(_598, _598, _594);
    float _606 = fma(_602, _602, _604);
    float _608 = rsqrt(_606);
    float _610 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _612 = _338 + _610;
    float _614 = _142 * _532;
    float _616 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _618 = _336 + _616;
    float _620 = _612 * _612;
    float _622 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _624 = _142 * _560;
    float _626 = _614 * _614;
    float _628 = fma(_618, _618, _620);
    float _630 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _632 = _334 + _630;
    float _634 = fma(_336, 6.2500002968590706586837768554688e-05, 0.5);
    float _636 = precise::clamp(_634, 0.0, 1.0);
    float _638 = _142 * _580;
    float _640 = fma(_624, _624, _626);
    float _642 = fma(_334, 6.2500002968590706586837768554688e-05, 0.5);
    float _644 = precise::clamp(_642, 0.0, 1.0);
    float _646 = precise::max(0.0, _622);
    float _648 = _608 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _650 = fma(_638, _638, _640);
    float _652 = _598 * _648;
    float _654 = _602 * _648;
    float _656 = fma(_632, _632, _628);
    float _658 = rsqrt(_650);
    float _660 = in.m_76.w;
    float _662 = gl_FragCoord.w;
    float _664 = _660 * _662;
    float _666 = _624 * _658;
    float _668 = _614 * _658;
    float _670 = _638 * _658;
    float _672 = _340 + (*spvDescriptorSet0.fp_c9)._m0[992].x;
    float _674 = fma(_672, 2.0, -1.0);
    float _676 = _674 * (*spvDescriptorSet0.fp_c4)._m0[17].x;
    float _678 = _142 * _664;
    float _680 = precise::max(_394, _288);
    float _682 = -_648;
    float _684 = -_646;
    float _686 = fma(_574, _682, _684);
    float _688 = -_342;
    float _690 = _688 + 1.0;
    float _692 = -_396;
    float _694 = fma(_692, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
    float _696 = _652 * _652;
    float _698 = _690 + (*spvDescriptorSet0.fp_c9)._m0[992].y;
    float _700 = _654 * _654;
    float _702 = 1.0 / _694;
    float _704 = in.m_78.x;
    float _706 = gl_FragCoord.w;
    float _708 = _704 * _706;
    float _710 = float(uint(_402));
    float _712 = _696 + _700;
    float _714 = sqrt(_712);
    float _716 = fma(_698, 2.0, -1.0);
    float _718 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _720 = _702 * _718;
    float _722 = _716 * (*spvDescriptorSet0.fp_c4)._m0[17].y;
    float _724 = _710 * 0.00390625;
    float _726 = _720 * _722;
    float _728 = _720 * _676;
    float _730 = precise::max(_680, _724);
    bool _732 = _714 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _734 = -(*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _736 = _726 * _734;
    float _738 = -(*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _740 = _726 * _738;
    float _742 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _744 = _726 * _742;
    float _746 = -_728;
    float _748 = fma(_746, (*spvDescriptorSet0.fp_c4)._m0[11].x, _736);
    float _750 = -_728;
    float _752 = fma(_750, (*spvDescriptorSet0.fp_c4)._m0[12].x, _740);
    float _754 = -_728;
    float _756 = fma(_754, (*spvDescriptorSet0.fp_c4)._m0[13].x, _744);
    float _758 = fma(_720, (*spvDescriptorSet0.fp_c4)._m0[11].z, _748);
    float _760 = fma(_720, (*spvDescriptorSet0.fp_c4)._m0[12].z, _752);
    float _762 = _142 * _708;
    int _764 = 1 & as_type<int>((*spvDescriptorSet0.fp_c9)._m0[40].w);
    bool _766 = _764 != 0;
    float _768 = fma(_720, (*spvDescriptorSet0.fp_c4)._m0[13].z, _756);
    bool _770 = !_732;
    float _772 = _686;
    float _774 = _696;
    float _776 = _700;
    float _778 = _652;
    float _780 = _654;
    if (!_770)
    {
        float _782 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _784 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _786 = _714 + _784;
        float _788 = _686 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _790 = rsqrt(_712);
        float _792 = _786 * _782;
        float _794 = _792 * 0.15915493667125701904296875;
        float _796 = _794 * 6.283185482025146484375;
        float _798 = sin(_796);
        float _800 = _794 * 6.283185482025146484375;
        float _802 = cos(_800);
        float _804 = fma(_798, _788, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _806 = _790 * _804;
        float _808 = _802 + (-1.0);
        float _810 = _652 * _806;
        float _812 = _654 * _806;
        float _814 = _808 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _816 = _810 * _810;
        float _818 = fma(_686, _802, _814);
        float _820 = _812 * _812;
        _772 = _818;
        _774 = _816;
        _776 = _820;
        _778 = _810;
        _780 = _812;
    }
    float _822 = _772;
    float _824 = _774;
    float _826 = _776;
    float _828 = _778;
    float _830 = _780;
    float _832 = fma(_822, _822, _824);
    float _834 = sqrt(_656);
    float _836 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[62].z;
    float _838 = _832 + _826;
    float _840 = _678 * (*spvDescriptorSet0.fp_c9)._m0[62].y;
    float _842 = rsqrt(_838);
    float _844 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _846 = fma(_834, (*spvDescriptorSet0.fp_c9)._m0[63].x, _844);
    float _848 = precise::clamp(_846, 0.0, 1.0);
    float _850 = -_848;
    float _852 = _850 + 1.0;
    float _854 = _842 * _828;
    float _856 = _842 * _822;
    float _858 = _842 * _830;
    float _860 = fma(_412, 2.0, -1.0);
    float _862 = fma(_410, 2.0, -1.0);
    float _864 = abs(_852);
    float _866 = log2(_864);
    float _868 = fma(_860, (*spvDescriptorSet0.fp_c9)._m0[983].w, _342);
    float _870 = fma(_862, (*spvDescriptorSet0.fp_c9)._m0[983].z, _340);
    float3 _2596 = float3(_378, _382, float(int(_350)));
    float3 _2598 = select(_2596, float3(0.0), isnan(_2596));
    float _872 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2598.xy, uint(rint(_2598.z)), level(_730)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2598.xy, uint(rint(_2598.z)), level(_730)).x;
    float2 _2605 = float2(_636, _644);
    float _874 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2605, float2(0.0), isnan(_2605))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2605, float2(0.0), isnan(_2605))).x;
    float2 _2613 = float2(_636, _644);
    float4 _877 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2613, float2(0.0), isnan(_2613))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2613, float2(0.0), isnan(_2613))).xyzw;
    float _879 = _877.x;
    float _881 = _877.y;
    float _883 = _877.z;
    float _885 = _877.w;
    bool _887 = !_766;
    float _889 = _887 ? _342 : _868;
    float _891 = _854 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    bool _893 = !_766;
    float _895 = _893 ? _340 : _870;
    float3 _2647 = float3(_895, _889, float(1));
    float3 _2649 = select(_2647, float3(0.0), isnan(_2647));
    float _897 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _2649.xy, uint(rint(_2649.z))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _2649.xy, uint(rint(_2649.z))).x;
    float _899 = -_891;
    float _901 = fma(_856, (*spvDescriptorSet0.fp_c9)._m0[69].y, _899);
    float _903 = _866 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _905 = -_840;
    float _907 = fma(_905, _836, 1.0);
    float _909 = -_858;
    float _911 = fma(_909, (*spvDescriptorSet0.fp_c9)._m0[69].z, _901);
    float _913 = log2(_907);
    float _915 = fma(_911, -0.5, 0.5);
    float _917 = fma(_911, 0.5, 0.5);
    float _919 = sqrt(_915);
    float _921 = fma(_917, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _923 = _856 + 1.0;
    float _925 = fma(_917, _921, -0.212114393711090087890625);
    float _927 = exp2(_903);
    float _929 = fma(_917, _925, 1.570728778839111328125);
    float _931 = _913 * 0.693147182464599609375;
    float _933 = _919 * 0.636619746685028076171875;
    float _935 = _931 * (*spvDescriptorSet0.fp_c9)._m0[62].w;
    float _937 = -_929;
    float _939 = fma(_933, _937, 1.0);
    float _941 = -_856;
    float _943 = fma(_927, _923, _941);
    float _945 = fma(_943, 0.5, 0.5);
    float3 _2727 = float3(_340, _342, _935);
    float _947 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, select(_2727, float3(0.0), isnan(_2727))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, select(_2727, float3(0.0), isnan(_2727))).x;
    float2 _2735 = float2(_939, _945);
    float3 _949 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2735, float2(0.0), isnan(_2735))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2735, float2(0.0), isnan(_2735))).xyz;
    float _951 = _949.x;
    float _953 = _949.y;
    float _955 = _949.z;
    float2 _2749 = float2(_870, _868);
    float4 _957 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2749, float2(0.0), isnan(_2749))), spvDescriptorSet0.dm_border, 11u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2749, float2(0.0), isnan(_2749))).xyzw;
    float _959 = _957.x;
    float _961 = _957.y;
    float _963 = _957.z;
    float _965 = _957.w;
    float _967 = _668 * _668;
    float _969 = fma(_668, 0.5, 0.5);
    float _971 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _973 = _338 + _971;
    float _975 = -(*spvDescriptorSet0.fp_c9)._m0[1001].x;
    float _977 = _975 + (*spvDescriptorSet0.fp_c9)._m0[1000].x;
    float _979 = fma(_666, _666, _967);
    float _981 = _973 * _973;
    float _983 = _436 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _985 = fma(_969, _977, (*spvDescriptorSet0.fp_c9)._m0[1001].x);
    float _987 = fma(_670, _670, _979);
    float _989 = precise::clamp(_987, 0.0, 1.0);
    float _991 = -(*spvDescriptorSet0.fp_c9)._m0[1007].y;
    float _993 = _991 + (*spvDescriptorSet0.fp_c9)._m0[1006].y;
    float _995 = _985 * 0.31830990314483642578125;
    float _997 = fma(_456, _456, _981);
    float _999 = fma(_989, 0.5, 0.5);
    float _1001 = -(*spvDescriptorSet0.fp_c9)._m0[1007].x;
    float _1003 = _1001 + (*spvDescriptorSet0.fp_c9)._m0[1006].x;
    float _1005 = precise::max(_983, _995);
    float _1007 = fma(_969, _993, (*spvDescriptorSet0.fp_c9)._m0[1007].y);
    float _1009 = fma(_969, _1003, (*spvDescriptorSet0.fp_c9)._m0[1007].x);
    float _1011 = -(*spvDescriptorSet0.fp_c9)._m0[1007].z;
    float _1013 = _1011 + (*spvDescriptorSet0.fp_c9)._m0[1006].z;
    float _1015 = _1007 * 0.715200006961822509765625;
    float _1017 = -(*spvDescriptorSet0.fp_c9)._m0[1001].y;
    float _1019 = _1017 + (*spvDescriptorSet0.fp_c9)._m0[1000].y;
    float _1021 = fma(_969, _1013, (*spvDescriptorSet0.fp_c9)._m0[1007].z);
    float _1023 = fma(_1009, 0.2125999927520751953125, _1015);
    float _1025 = fma(_452, _452, _997);
    float _1027 = -(*spvDescriptorSet0.fp_c9)._m0[1001].z;
    float _1029 = _1027 + (*spvDescriptorSet0.fp_c9)._m0[1000].z;
    float _1031 = fma(_969, _1019, (*spvDescriptorSet0.fp_c9)._m0[1001].y);
    float _1033 = fma(_1021, 0.072200000286102294921875, _1023);
    float _1035 = fma(_969, _1029, (*spvDescriptorSet0.fp_c9)._m0[1001].z);
    float _1037 = _438 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1039 = 1.0 / _1033;
    float _1041 = _1031 * 0.31830990314483642578125;
    float _1043 = precise::max(0.0, _668);
    float _1045 = _760 + (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _1047 = _758 + (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _1049 = precise::max(_1037, _1041);
    float _1051 = _446 * 0.4774648249149322509765625;
    float _1053 = precise::min(_1043, 0.100000001490116119384765625);
    float _1055 = _768 + (*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _1057 = precise::max(_404, 0.25);
    float _1059 = sqrt(_1025);
    float _1061 = _448 * 0.4774648249149322509765625;
    float _1063 = fma(_1053, 10.0, -1.0);
    float _1065 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _1067 = _1055 + _1065;
    float _1069 = _440 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1071 = _1039 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1073 = precise::clamp(_1071, 0.0, 1.0);
    float _1075 = _428 + (*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1077 = precise::clamp(_1075, 0.0, 1.0);
    float _1079 = _1061 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1081 = _866 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1083 = fma(_1073, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _1085 = _1083 * 0.31830990314483642578125;
    float _1087 = exp2(_1081);
    float _1089 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1091 = _1089 + 1.0;
    float _1093 = _430 * 0.2820948064327239990234375;
    float _1095 = _1009 * _1085;
    float _1097 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _1099 = _1045 + _1097;
    float _1101 = _1057 + _1063;
    float _1103 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _1105 = _1047 + _1103;
    float _1107 = _444 * 0.4774648249149322509765625;
    float _1109 = _1099 * _1099;
    float _1111 = _1007 * _1085;
    float _1113 = _1021 * _1085;
    float _1115 = _1107 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1117 = fma(_1105, _1105, _1109);
    float _1119 = _1035 * 0.31830990314483642578125;
    float _1121 = _1051 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1123 = precise::max(_1079, _1113);
    float _1125 = _1101 * 4.0;
    float _1127 = precise::clamp(_1125, 0.0, 1.0);
    float _1129 = precise::max(_1115, _1095);
    float _1131 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].x, _1091);
    float _1133 = precise::max(_1121, _1111);
    float _1135 = fma(_1067, _1067, _1117);
    float _1137 = -_404;
    float _1139 = fma(_762, 2.0, _1137);
    float _1141 = _404 + 1.0;
    float _1143 = precise::clamp(_1141, 0.0, 1.0);
    float _1145 = precise::max(_1069, _1119);
    float _1147 = fma(_1077, _1049, _1133);
    float _1149 = fma(_1077, _1005, _1129);
    float _1151 = sqrt(_1135);
    float _1153 = _1143 + (-1.0);
    float _1155 = fma(_1077, _1145, _1123);
    float _1157 = -_1131;
    float _1159 = fma(_1157, (*spvDescriptorSet0.fp_c11)._m0[36].z, 1.0);
    float _1161 = -_1087;
    float _1163 = _1161 + 1.0;
    float _1165 = fma(_1093, (*spvDescriptorSet0.fp_c9)._m0[991].y, _1147);
    float _1167 = _1163 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1169 = -_1059;
    float _1171 = _1151 + _1169;
    float _1173 = 0.0 + _874;
    float _1175 = precise::clamp(_1173, 0.0, 1.0);
    float _1177 = _885 * 4.0;
    float _1179 = precise::clamp(_1177, 0.0, 1.0);
    float _1181 = _872 * _1175;
    float _1183 = _1179 * _1139;
    float _1185 = precise::clamp(_1183, 0.0, 1.0);
    float _1187 = fma(_1093, (*spvDescriptorSet0.fp_c9)._m0[991].x, _1149);
    float _1189 = fma(_1093, (*spvDescriptorSet0.fp_c9)._m0[991].z, _1155);
    float _1191 = _1181 * _1127;
    float _1193 = _1185 * _1153;
    float _1195 = -_897;
    float _1197 = _1195 + 1.0;
    float _1199 = _879 * _1185;
    float _1201 = _881 * _1185;
    float _1203 = fma(_1193, 2.0, 1.5);
    float _1205 = precise::clamp(_1203, 0.0, 1.0);
    float _1207 = -_1197;
    float _1209 = fma(_1207, (*spvDescriptorSet0.fp_c11)._m0[46].z, 1.0);
    float _1211 = _883 * _1185;
    float _1213 = precise::max(0.0, _1159);
    float _1215 = fma(_1205, -0.449999988079071044921875, 1.0);
    float _1217 = precise::min(_1209, 1.0);
    float _1219 = _1199 * _1215;
    float _1221 = _1201 * _1215;
    float _1223 = _1211 * _1215;
    float _1225 = -_1219;
    float _1227 = _1199 + _1225;
    float _1229 = -_1221;
    float _1231 = _1201 + _1229;
    float _1233 = -_1223;
    float _1235 = _1211 + _1233;
    float _1237 = fma(_1213, _1227, _1219);
    float _1239 = fma(_1213, _1231, _1221);
    float _1241 = fma(_1213, _1235, _1223);
    float _1243 = precise::min(_1217, 1.0);
    float _1245 = -_1199;
    float _1247 = _1245 + _1237;
    float _1249 = -_1201;
    float _1251 = _1249 + _1239;
    float _1253 = -_1211;
    float _1255 = _1253 + _1241;
    float _1257 = precise::min(_999, _1243);
    float _1259 = fma(_1191, _1247, _1199);
    float _1261 = fma(_1191, _1251, _1201);
    float _1263 = 1.0 / (*spvDescriptorSet0.fp_c11)._m0[40].x;
    float _1265 = fma(_1191, _1255, _1211);
    float _1267 = _1259 * _1187;
    float _1269 = _1261 * _1165;
    float _1271 = -_1167;
    float _1273 = _1271 + 1.0;
    float _1275 = _1265 * _1189;
    float _1277 = _1257 * _1267;
    float _1279 = _1257 * _1269;
    float _1281 = _1257 * _1275;
    float _1283 = precise::max(0.0, _1277);
    float _1285 = precise::max(0.0, _1279);
    float _1287 = _1171 * _1263;
    float _1289 = precise::clamp(_1287, 0.0, 1.0);
    float _1291 = _965 * _947;
    float _1293 = _965 * _1273;
    float _1295 = precise::max(0.0, _1281);
    float _1297 = _1167 * _1291;
    float _1299 = fma(_951, _1297, _959);
    float _1301 = fma(_953, _1297, _961);
    float _1303 = fma(_955, _1297, _963);
    float _1305 = fma(_1293, _1283, _1299);
    float _1307 = -_1289;
    float _1309 = _1307 + 1.0;
    float _1311 = fma(_1293, _1285, _1301);
    float _1313 = fma(_1293, _1295, _1303);
    float _1315 = -_1309;
    float _1317 = fma(_1315, _1309, 1.0);
    out.m_81.x = _1305;
    out.m_81.y = _1311;
    out.m_81.z = _1313;
    out.m_81.w = _1317;
    out.m_83.x = (*spvDescriptorSet0.fp_c11)._m0[44].z;
    return out;
}

