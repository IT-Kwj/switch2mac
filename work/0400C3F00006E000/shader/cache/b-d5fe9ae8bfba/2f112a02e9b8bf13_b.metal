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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_46 [[user(locn1), center_no_perspective]];
    float4 m_44 [[user(locn2), center_no_perspective]];
    float4 m_40 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _298 = false;
    bool _296 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _897 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_897, float2(0.0), isnan(_897)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _914 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_914, float2(0.0), isnan(_914))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_914, float2(0.0), isnan(_914))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_44.y;
    float _76 = in.m_42.x;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = -_64;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_66;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = -_68;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _96 = 1.0 / _86;
    float _98 = 1.0 / _90;
    float _100 = 1.0 / _94;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = _96 * _102;
    float _106 = _72 * _104;
    float _108 = _76 * _104;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = _98 * _110;
    float _114 = -_106;
    float _116 = fma(_112, _74, _114);
    float _118 = -_108;
    float _120 = fma(_112, _80, _118);
    float _122 = -_104;
    float _124 = _122 + _112;
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _128 = _100 * _126;
    float _130 = _116 * _116;
    float _132 = -_106;
    float _134 = fma(_128, _78, _132);
    float _136 = -_108;
    float _138 = fma(_128, _82, _136);
    float _140 = fma(_120, _120, _130);
    float _142 = -_104;
    float _144 = _142 + _128;
    float _146 = _134 * _134;
    float _148 = fma(_124, _124, _140);
    float _150 = fma(_138, _138, _146);
    float _152 = fma(_144, _144, _150);
    float _154 = rsqrt(_148);
    float _156 = rsqrt(_152);
    float _158 = -_70;
    float _160 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _162 = _120 * _154;
    float _164 = 1.0 / _160;
    float _166 = _124 * _154;
    float _168 = _116 * _154;
    float _170 = _144 * _156;
    float _172 = _134 * _156;
    float _174 = _138 * _156;
    float _176 = _162 * _170;
    float _178 = _166 * _172;
    float _180 = -_176;
    float _182 = fma(_166, _174, _180);
    float _184 = _168 * _174;
    float _186 = -_178;
    float _188 = fma(_168, _170, _186);
    float _190 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _192 = _164 * _190;
    float _194 = _182 * _182;
    float _196 = -_184;
    float _198 = fma(_162, _172, _196);
    float _200 = _192 * _72;
    float _202 = fma(_188, _188, _194);
    float _204 = -_192;
    bool _208 = _204 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _210 = -_192;
    bool _212 = _210 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _214 = fma(_198, _198, _202);
    float _216 = -_192;
    bool _218 = _216 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _220 = !_208;
    int _223 = _220 ? 0 : 1;
    float _225 = rsqrt(_214);
    int _227 = 2;
    if (!_208)
    {
        _227 = 1;
    }
    int _229 = _227;
    int _231 = _229;
    if (!_212)
    {
        _231 = _223;
    }
    int _233 = _231;
    int _235 = _233 + 1;
    uint _238 = uint(_235);
    if (!_218)
    {
        _238 = uint(_233);
    }
    uint _240 = _238;
    float _242 = _182 * _225;
    uint _244 = min(_240, 2u);
    float _246 = _188 * _225;
    float _248 = _198 * _225;
    float _250 = _242 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _252 = int(_244) << 2;
    float _254 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[35].x, _250);
    uint _256 = uint(int(uint(_252) >> uint(2)));
    uint _258 = uint(int(uint(int(_256)) >> uint(2)));
    int _260 = int(_256) & 3;
    float _262 = (*spvDescriptorSet0.fp_c1)._m0[int(_258)][_260];
    float _264 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[35].z, _254);
    float _266 = abs(_264);
    float _268 = -_266;
    float _270 = _268 + 1.0;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = _192 * _76;
    float _276 = abs(_272);
    float _278 = log2(_276);
    float _280 = _278 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _282 = exp2(_280);
    float _284 = _282 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _286 = fma(_246, _284, _274);
    float _288 = fma(_242, _284, _200);
    float _290 = fma(_248, _284, _192);
    bool _292 = as_type<int>(_262) == 1392;
    if (!_292)
    {
        bool _294 = as_type<int>(_262) == 1664;
        _296 = _294;
        if (!_296)
        {
            _298 = true;
        }
    }
    float _332;
    float _334;
    float _336;
    float _338;
    if (!_296)
    {
        if (!_298)
        {
            float _300 = _288 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _302 = _288 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _304 = _288 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _306 = _288 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _308 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[0].x, _300);
            float _310 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[1].x, _302);
            float _312 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[2].x, _304);
            float _314 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[3].x, _306);
            float _316 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[0].z, _308);
            float _318 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[1].z, _310);
            float _320 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[2].z, _312);
            float _322 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[3].z, _314);
            float _324 = _316 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _326 = _318 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _328 = _320 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _330 = _322 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _332 = _330;
            _334 = _328;
            _336 = _324;
            _338 = _326;
        }
    }
    if ((false || _298) || _296)
    {
        if ((!_298) || _296)
        {
            _296 = false;
            float _340 = _288 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _342 = _288 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _344 = _288 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _346 = _288 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _348 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[4].x, _340);
            float _350 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[5].x, _342);
            float _352 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[6].x, _344);
            float _354 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[7].x, _346);
            float _356 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[4].z, _348);
            float _358 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[5].z, _350);
            float _360 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[6].z, _352);
            float _362 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[7].z, _354);
            float _364 = _356 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _332 = _370;
            _334 = _368;
            _336 = _364;
            _338 = _366;
        }
        if (false || _298)
        {
            _298 = false;
            float _372 = _288 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _374 = _288 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _376 = _288 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _378 = _288 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _380 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[8].x, _372);
            float _382 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[9].x, _374);
            float _384 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[10].x, _376);
            float _386 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[11].x, _378);
            float _388 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[8].z, _380);
            float _390 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[9].z, _382);
            float _392 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[10].z, _384);
            float _394 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[11].z, _386);
            float _396 = _388 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _398 = _390 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _400 = _392 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _402 = _394 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _332 = _402;
            _334 = _400;
            _336 = _396;
            _338 = _398;
        }
    }
    float _404 = _332;
    float _406 = _334;
    float _408 = _336;
    float _410 = _338;
    float _412 = 1.0 / _404;
    float _414 = float(int(_240));
    float _416 = rint(_414);
    float _418 = precise::max(_416, 0.0);
    uint _420 = uint(_418);
    uint _422 = clamp(_420, 0u, 65535u);
    float _424 = _412 * _406;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = _412 * _408;
    float _430 = _412 * _410;
    float _432 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _426;
    float _434 = _432 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _436 = _432 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _438 = fma(_434, -0.5, _428);
    float _440 = fma(_436, 0.5, _430);
    float3 _1587 = float3(_438, _440, float(int(_422)));
    float3 _1591 = select(_1587, float3(0.0), isnan(_1587));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1591.xy, uint(rint(_1591.z)), _426);
    float _444 = -_200;
    float _446 = _444 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _448 = -_274;
    float _450 = _448 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _452 = -_192;
    float _454 = _452 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _456 = _200 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _458 = _446 * _446;
    float _460 = -_192;
    float _462 = _460 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _464 = _200 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _466 = _200 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _468 = fma(_450, _450, _458);
    float _470 = -_274;
    float _472 = _470 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _474 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[19].x, _464);
    float _476 = _200 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _478 = fma(_462, _462, _468);
    float _480 = -_200;
    float _482 = _480 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _484 = _200 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _486 = _200 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _488 = _200 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _490 = _200 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _492 = sqrt(_478);
    float _494 = _482 * _482;
    float _496 = _200 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _498 = _200 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _500 = fma(_472, _472, _494);
    float _502 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[22].x, _456);
    float _504 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[23].x, _466);
    float _506 = _200 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _508 = fma(_454, _454, _500);
    float _510 = _200 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _512 = _200 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _514 = _200 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _516 = _200 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _518 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[19].z, _474);
    float _520 = sqrt(_508);
    bool _522 = _492 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _524 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[21].x, _476);
    bool _526 = _492 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _528 = _200 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _530 = !_522;
    int _532 = _530 ? 0 : 1;
    float _534 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[22].z, _502);
    float _536 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[16].x, _484);
    float _538 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[24].x, _528);
    float _540 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[17].x, _486);
    float _542 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[18].x, _488);
    float _544 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[25].x, _510);
    float _546 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[26].x, _490);
    float _548 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[27].x, _496);
    int _550 = 2;
    if (!_522)
    {
        _550 = 1;
    }
    int _552 = _550;
    float _554 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[28].x, _498);
    int _556 = _552;
    if (!_526)
    {
        _556 = _532;
    }
    int _558 = _556;
    float _560 = _200 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _562 = _520 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _564 = _200 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _566 = float(_558);
    float _568 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[20].x, _560);
    bool _570 = _520 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _572 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[29].x, _506);
    float _574 = precise::min(_566, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _576 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[30].x, _512);
    bool _578 = !_562;
    int _580 = _578 ? 0 : 1;
    float _582 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[31].x, _514);
    bool _584 = _574 != 1.0;
    bool _586 = isnan(_574);
    bool _588 = _584 || _586;
    bool _590 = isnan(1.0);
    bool _592 = _588 || _590;
    float _594 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[32].x, _516);
    float _596 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[33].x, _564);
    int _598 = 2;
    if (!_562)
    {
        _598 = 1;
    }
    int _600 = _598;
    float _602 = _518 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _604 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[20].z, _568);
    int _606 = _600;
    float _608 = _602;
    if (!_570)
    {
        _606 = _580;
    }
    int _610 = _606;
    float _612 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[21].z, _524);
    float _614 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[23].z, _504);
    float _616 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[18].z, _542);
    float _618 = float(_610);
    float _620 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[28].z, _554);
    if (_592)
    {
        float _622 = _534 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _608 = _622;
    }
    float _624 = _608;
    float _626 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[24].z, _538);
    float _628 = _604 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _630 = precise::min(_618, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _632 = _612 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _634 = _628;
    float _636 = _632;
    float _638 = _624;
    if (_592)
    {
        float _640 = _614 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _634 = _640;
    }
    float _642 = _634;
    float _644 = _642;
    if (_592)
    {
        float _646 = _626 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _636 = _646;
    }
    float _648 = _636;
    bool _650 = _574 != 0.0;
    bool _652 = isnan(_574);
    bool _654 = _650 || _652;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    float _660 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[31].z, _582);
    bool _662 = _630 != 1.0;
    bool _664 = isnan(_630);
    bool _666 = _662 || _664;
    bool _668 = isnan(1.0);
    bool _670 = _666 || _668;
    float _672 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[25].z, _544);
    bool _674 = _630 != 0.0;
    bool _676 = isnan(_630);
    bool _678 = _674 || _676;
    bool _680 = isnan(0.0);
    bool _682 = _678 || _680;
    float _684 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[29].z, _572);
    float _686 = _620 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _688 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[32].z, _594);
    float _690 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[30].z, _576);
    float _692 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[26].z, _546);
    float _694 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[33].z, _596);
    float _696 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[16].z, _536);
    float _698 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _700 = _648;
    float _702 = _686;
    if (!_658)
    {
        float _704 = _616 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _700 = _704;
    }
    float _706 = _700;
    float _708 = _684 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _710 = _708;
    if (_670)
    {
        float _712 = _660 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _702 = _712;
    }
    float _714 = _702;
    float _716 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[27].z, _548);
    float _718 = _714;
    if (!_682)
    {
        float _720 = _672 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _718 = _720;
    }
    float _722 = _718;
    float _724 = 0.0 + _706;
    float _726 = precise::clamp(_724, 0.0, 1.0);
    if (_670)
    {
        float _728 = _688 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _710 = _728;
    }
    float _730 = _710;
    float _732 = _690 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _734 = _730;
    float _736 = _732;
    if (!_682)
    {
        float _738 = _692 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _734 = _738;
    }
    float _740 = _734;
    float _742 = fma(_434, 0.5, _428);
    if (_670)
    {
        float _744 = _694 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _736 = _744;
    }
    float _746 = _736;
    float _748 = _746;
    if (!_658)
    {
        float _750 = _696 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _638 = _750;
    }
    float _752 = _638;
    float _754 = rint(_574);
    float _756 = precise::max(_754, 0.0);
    uint _758 = uint(_756);
    uint _760 = clamp(_758, 0u, 65535u);
    float _762 = _726 * _698;
    if (!_682)
    {
        float _764 = _716 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _748 = _764;
    }
    float _766 = _748;
    float _768 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[17].z, _540);
    float _770 = fma(_436, -0.5, _430);
    float _772 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _774 = fma(_762, 0.5, _752);
    float _776 = 0.0 + _766;
    float _778 = precise::clamp(_776, 0.0, 1.0);
    float _780 = fma(_762, -0.5, _752);
    if (!_658)
    {
        float _782 = _768 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _644 = _782;
    }
    float _784 = _644;
    float _786 = rint(_630);
    float _788 = precise::max(_786, 0.0);
    uint _790 = uint(_788);
    uint _792 = clamp(_790, 0u, 65535u);
    float _794 = _726 * _772;
    float _796 = _698 * _778;
    float _798 = _772 * _778;
    float _800 = fma(_794, 0.5, _784);
    float _802 = fma(_794, -0.5, _784);
    float _804 = fma(_796, 0.5, _722);
    float _806 = fma(_796, -0.5, _722);
    float _808 = fma(_798, 0.5, _740);
    float _810 = fma(_798, -0.5, _740);
    float3 _2266 = float3(_742, _440, float(int(_422)));
    float3 _2268 = select(_2266, float3(0.0), isnan(_2266));
    float _812 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2268.xy, uint(rint(_2268.z)), _426);
    float3 _2277 = float3(_742, _770, float(int(_422)));
    float3 _2279 = select(_2277, float3(0.0), isnan(_2277));
    float _814 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2279.xy, uint(rint(_2279.z)), _426);
    float3 _2288 = float3(_438, _770, float(int(_422)));
    float3 _2290 = select(_2288, float3(0.0), isnan(_2288));
    float _816 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2290.xy, uint(rint(_2290.z)), _426);
    float3 _2299 = float3(_780, _800, float(int(_760)));
    float3 _2301 = select(_2299, float3(0.0), isnan(_2299));
    float _818 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2301.xy, uint(rint(_2301.z)), _726);
    float3 _2310 = float3(_774, _800, float(int(_760)));
    float3 _2312 = select(_2310, float3(0.0), isnan(_2310));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2312.xy, uint(rint(_2312.z)), _726);
    float3 _2321 = float3(_774, _802, float(int(_760)));
    float3 _2323 = select(_2321, float3(0.0), isnan(_2321));
    float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2323.xy, uint(rint(_2323.z)), _726);
    float3 _2332 = float3(_780, _802, float(int(_760)));
    float3 _2334 = select(_2332, float3(0.0), isnan(_2332));
    float _824 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2334.xy, uint(rint(_2334.z)), _726);
    float3 _2343 = float3(_806, _808, float(int(_792)));
    float3 _2345 = select(_2343, float3(0.0), isnan(_2343));
    float _826 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2345.xy, uint(rint(_2345.z)), _778);
    float3 _2354 = float3(_804, _808, float(int(_792)));
    float3 _2356 = select(_2354, float3(0.0), isnan(_2354));
    float _828 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2356.xy, uint(rint(_2356.z)), _778);
    float3 _2365 = float3(_804, _810, float(int(_792)));
    float3 _2367 = select(_2365, float3(0.0), isnan(_2365));
    float _830 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2367.xy, uint(rint(_2367.z)), _778);
    float3 _2376 = float3(_806, _810, float(int(_792)));
    float3 _2378 = select(_2376, float3(0.0), isnan(_2376));
    float _832 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2378.xy, uint(rint(_2378.z)), _778);
    float2 _2384 = float2(_56, _58);
    float _834 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2384, float2(0.0), isnan(_2384))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2384, float2(0.0), isnan(_2384))).x;
    float _836 = -_192;
    float _838 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _840 = _836 + _838;
    float _842 = -_192;
    float _844 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _846 = _842 + _844;
    float _848 = _840 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _850 = precise::clamp(_848, 0.0, 1.0);
    float _852 = _812 + _442;
    float _854 = _852 + _814;
    float _856 = _854 + _816;
    float _858 = _820 + _818;
    float _860 = fma(_856, 0.25, _850);
    float _862 = _858 + _822;
    float _864 = _828 + _826;
    float _866 = _862 + _824;
    float _868 = _866 * 0.25;
    float _870 = _864 + _830;
    float _872 = _870 + _832;
    float _874 = _872 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _876 = _874 * 0.25;
    float _878 = fma(_868, (*spvDescriptorSet0.fp_c3)._m0[49].z, _876);
    float _880 = _846 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _882 = precise::clamp(_880, 0.0, 1.0);
    float _884 = _878 + _882;
    out.m_49.x = _834;
    out.m_49.y = _860;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _884;
    return out;
}

