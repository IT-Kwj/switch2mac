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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_12 [[id(6)]];
    sampler fp_t_tcb_12Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_E [[id(10)]];
    sampler fp_t_tcb_ESmplr [[id(11)]];
    texture2d<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0), center_no_perspective]];
    float4 m_48 [[user(locn1), center_no_perspective]];
    float4 m_46 [[user(locn2), center_no_perspective]];
    float4 m_42 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _300 = false;
    bool _298 = false;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float2 _836 = float2(_58, _60);
    float3 _64 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_836, float2(0.0), isnan(_836)), int2(0), component::x).xyw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float2 _853 = float2(_58, _60);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_853, float2(0.0), isnan(_853))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_853, float2(0.0), isnan(_853))).x;
    float _74 = in.m_44.y;
    float _76 = in.m_46.y;
    float _78 = in.m_44.x;
    float _80 = in.m_48.y;
    float _82 = in.m_46.x;
    float _84 = in.m_48.x;
    float _86 = -_66;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = -_68;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = -_70;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _98 = 1.0 / _88;
    float _100 = 1.0 / _92;
    float _102 = 1.0 / _96;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = _98 * _104;
    float _108 = _74 * _106;
    float _110 = _78 * _106;
    float _112 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _114 = _100 * _112;
    float _116 = -_108;
    float _118 = fma(_114, _76, _116);
    float _120 = -_110;
    float _122 = fma(_114, _82, _120);
    float _124 = -_106;
    float _126 = _124 + _114;
    float _128 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _130 = _102 * _128;
    float _132 = _118 * _118;
    float _134 = -_108;
    float _136 = fma(_130, _80, _134);
    float _138 = -_110;
    float _140 = fma(_130, _84, _138);
    float _142 = fma(_122, _122, _132);
    float _144 = -_106;
    float _146 = _144 + _130;
    float _148 = _136 * _136;
    float _150 = fma(_126, _126, _142);
    float _152 = fma(_140, _140, _148);
    float _154 = fma(_146, _146, _152);
    float _156 = rsqrt(_150);
    float _158 = -_72;
    float _160 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _162 = rsqrt(_154);
    float _164 = 1.0 / _160;
    float _166 = _122 * _156;
    float _168 = _126 * _156;
    float _170 = _118 * _156;
    float _172 = _146 * _162;
    float _174 = _136 * _162;
    float _176 = _140 * _162;
    float _178 = _166 * _172;
    float _180 = _168 * _174;
    float _182 = -_178;
    float _184 = fma(_168, _176, _182);
    float _186 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _188 = _164 * _186;
    float _190 = _170 * _176;
    float _192 = -_180;
    float _194 = fma(_170, _172, _192);
    float _196 = _184 * _184;
    float _198 = -_190;
    float _200 = fma(_166, _174, _198);
    float _202 = -_188;
    bool _206 = _202 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _208 = fma(_194, _194, _196);
    float _210 = -_188;
    bool _212 = _210 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _214 = _188 * _74;
    float _216 = -_188;
    bool _218 = _216 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _220 = fma(_200, _200, _208);
    bool _222 = !_206;
    int _225 = _222 ? 0 : 1;
    float _227 = rsqrt(_220);
    int _229 = 2;
    if (!_206)
    {
        _229 = 1;
    }
    int _231 = _229;
    int _233 = _231;
    if (!_212)
    {
        _233 = _225;
    }
    int _235 = _233;
    int _237 = _235 + 1;
    uint _240 = uint(_237);
    if (!_218)
    {
        _240 = uint(_235);
    }
    uint _242 = _240;
    float _244 = _184 * _227;
    uint _246 = min(_242, 2u);
    float _248 = _194 * _227;
    float _250 = _200 * _227;
    float _252 = _244 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _254 = int(_246) << 2;
    float _256 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[35].x, _252);
    uint _258 = uint(int(uint(_254) >> uint(2)));
    uint _260 = uint(int(uint(int(_258)) >> uint(2)));
    int _262 = int(_258) & 3;
    float _264 = (*spvDescriptorSet0.fp_c1)._m0[int(_260)][_262];
    float _266 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[35].z, _256);
    float _268 = abs(_266);
    float _270 = -_268;
    float _272 = _270 + 1.0;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = _188 * _78;
    float _278 = abs(_274);
    float _280 = log2(_278);
    float _282 = _280 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _284 = exp2(_282);
    float _286 = _284 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _288 = fma(_248, _286, _276);
    float _290 = fma(_244, _286, _214);
    float _292 = fma(_250, _286, _188);
    bool _294 = as_type<int>(_264) == 1392;
    if (!_294)
    {
        bool _296 = as_type<int>(_264) == 1664;
        _298 = _296;
        if (!_298)
        {
            _300 = true;
        }
    }
    float _334;
    float _336;
    float _338;
    float _340;
    if (!_298)
    {
        if (!_300)
        {
            float _302 = _290 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _304 = _290 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _306 = _290 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _308 = _290 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _310 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[0].x, _302);
            float _312 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[1].x, _304);
            float _314 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[2].x, _306);
            float _316 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[3].x, _308);
            float _318 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[0].z, _310);
            float _320 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[1].z, _312);
            float _322 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[2].z, _314);
            float _324 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[3].z, _316);
            float _326 = _318 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _328 = _320 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _330 = _322 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _332 = _324 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _334 = _332;
            _336 = _326;
            _338 = _330;
            _340 = _328;
        }
    }
    if ((false || _300) || _298)
    {
        if ((!_300) || _298)
        {
            _298 = false;
            float _342 = _290 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _344 = _290 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _346 = _290 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _348 = _290 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _350 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[4].x, _342);
            float _352 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[5].x, _344);
            float _354 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[6].x, _346);
            float _356 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[7].x, _348);
            float _358 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[4].z, _350);
            float _360 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[5].z, _352);
            float _362 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[6].z, _354);
            float _364 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[7].z, _356);
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _334 = _372;
            _336 = _366;
            _338 = _370;
            _340 = _368;
        }
        if (false || _300)
        {
            _300 = false;
            float _374 = _290 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _376 = _290 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _378 = _290 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _380 = _290 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _382 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[8].x, _374);
            float _384 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[9].x, _376);
            float _386 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[10].x, _378);
            float _388 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[11].x, _380);
            float _390 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[8].z, _382);
            float _392 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[9].z, _384);
            float _394 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[10].z, _386);
            float _396 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[11].z, _388);
            float _398 = _390 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _400 = _392 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _402 = _394 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _404 = _396 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _334 = _404;
            _336 = _398;
            _338 = _402;
            _340 = _400;
        }
    }
    float _406 = _334;
    float _408 = _336;
    float _410 = _338;
    float _412 = _340;
    float _414 = -_214;
    float _416 = _414 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _418 = -_276;
    float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _422 = -_214;
    float _424 = _422 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _426 = _416 * _416;
    float _428 = -_188;
    float _430 = _428 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _432 = _424 * _424;
    float _434 = _214 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _436 = fma(_420, _420, _426);
    float _438 = -_276;
    float _440 = _438 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _442 = _214 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _444 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[33].x, _434);
    float _446 = fma(_430, _430, _436);
    float _448 = -_188;
    float _450 = _448 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _452 = fma(_440, _440, _432);
    float _454 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[33].z, _444);
    float _456 = _214 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _458 = fma(_450, _450, _452);
    float _460 = sqrt(_446);
    float _462 = _214 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _464 = _214 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _466 = _214 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _468 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[20].x, _442);
    float _470 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[19].x, _456);
    float _472 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[17].x, _462);
    float _474 = _214 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _476 = sqrt(_458);
    float _478 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[20].z, _468);
    float _480 = _214 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _482 = _214 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _484 = _214 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _486 = _214 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _488 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[19].z, _470);
    float _490 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[17].z, _472);
    bool _492 = _460 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _494 = 1.0 / _406;
    bool _496 = _460 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _498 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[16].x, _480);
    bool _500 = !_492;
    int _502 = _500 ? 0 : 1;
    float _504 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[29].x, _482);
    float _506 = float(int(_242));
    float _508 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[31].x, _484);
    bool _510 = _476 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _512 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[32].x, _486);
    bool _514 = _476 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _516 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[29].z, _504);
    bool _518 = !_510;
    int _520 = _518 ? 0 : 1;
    float _522 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[32].z, _512);
    int _524 = 2;
    int _526 = 2;
    if (!_492)
    {
        _524 = 1;
    }
    int _528 = _524;
    float _530 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[31].z, _508);
    int _532 = _528;
    if (!_496)
    {
        _532 = _502;
    }
    int _534 = _532;
    float _536 = _214 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _538 = _494 * _408;
    float _540 = _494 * _410;
    float _542 = precise::clamp(_540, 0.0, 1.0);
    float _544 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[16].z, _498);
    if (!_510)
    {
        _526 = 1;
    }
    int _546 = _526;
    float _548 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[21].x, _536);
    int _550 = _546;
    if (!_514)
    {
        _550 = _520;
    }
    int _552 = _550;
    float _554 = float(_534);
    float _556 = _214 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _558 = float(_552);
    float _560 = _214 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _562 = precise::min(_554, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _564 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[24].x, _556);
    float _566 = precise::min(_558, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _568 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[30].x, _560);
    bool _570 = _562 != 1.0;
    bool _572 = isnan(_562);
    bool _574 = _570 || _572;
    bool _576 = isnan(1.0);
    bool _578 = _574 || _576;
    float _580 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[21].z, _548);
    bool _582 = _566 != 1.0;
    bool _584 = isnan(_566);
    bool _586 = _582 || _584;
    bool _588 = isnan(1.0);
    bool _590 = _586 || _588;
    float _592 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[30].z, _568);
    float _594 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[24].z, _564);
    float _596 = _580 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _598 = _214 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _600 = _592 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    bool _602 = _562 != 0.0;
    bool _604 = isnan(_562);
    bool _606 = _602 || _604;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    float _612 = _214 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _614 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[22].x, _598);
    bool _616 = _566 != 0.0;
    bool _618 = isnan(_566);
    bool _620 = _616 || _618;
    bool _622 = isnan(0.0);
    bool _624 = _620 || _622;
    float _626 = rint(_562);
    float _628 = precise::max(_626, 0.0);
    uint _630 = uint(_628);
    uint _632 = clamp(_630, 0u, 65535u);
    float _634 = _596;
    float _636 = _600;
    if (_578)
    {
        float _638 = _594 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _634 = _638;
    }
    float _640 = _634;
    float _642 = _214 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _644 = _640;
    if (_590)
    {
        float _646 = _454 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _636 = _646;
    }
    float _648 = _636;
    float _650 = _214 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _652 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[26].x, _474);
    float _654 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[23].x, _642);
    float _656 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[27].x, _612);
    float _658 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[18].x, _650);
    float _660 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[25].x, _464);
    float _662 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[28].x, _466);
    float _664 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[22].z, _614);
    float _666 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[23].z, _654);
    float _668 = _478 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _670 = _488 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _672 = _670;
    float _674 = _668;
    float _676 = _648;
    if (_578)
    {
        float _678 = _664 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _672 = _678;
    }
    float _680 = _672;
    float _682 = _680;
    if (_578)
    {
        float _684 = _666 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _674 = _684;
    }
    float _686 = _674;
    float _688 = _686;
    if (!_610)
    {
        float _690 = _490 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _688 = _690;
    }
    float _692 = _688;
    float _694 = rint(_566);
    float _696 = precise::max(_694, 0.0);
    uint _698 = uint(_696);
    uint _700 = clamp(_698, 0u, 65535u);
    float2 _1991 = float2(_58, _60);
    float2 _704 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1991, float2(0.0), isnan(_1991))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1991, float2(0.0), isnan(_1991))).xy;
    float _706 = _704.x;
    float _708 = _704.y;
    float _710 = _494 * _412;
    float _712 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[27].z, _656);
    float _714 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[18].z, _658);
    float _716 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[28].z, _662);
    float _718 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[26].z, _652);
    if (!_624)
    {
        float _720 = _712 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _676 = _720;
    }
    float _722 = _676;
    float _724 = rint(_506);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    uint _730 = clamp(_728, 0u, 65535u);
    float _732 = _516 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _734 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[25].z, _660);
    float _736 = _732;
    if (!_610)
    {
        float _738 = _714 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _644 = _738;
    }
    float _740 = _644;
    if (_590)
    {
        float _742 = _522 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _736 = _742;
    }
    float _744 = _736;
    float _746 = _716 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _748 = _744;
    float _750 = _746;
    if (!_624)
    {
        float _752 = _718 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _748 = _752;
    }
    float _754 = _748;
    if (_590)
    {
        float _756 = _530 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _750 = _756;
    }
    float _758 = _750;
    float _760 = _758;
    if (!_610)
    {
        float _762 = _544 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _682 = _762;
    }
    float _764 = _682;
    if (!_624)
    {
        float _766 = _734 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _760 = _766;
    }
    float _768 = _760;
    float _770 = 0.0 + _722;
    float _772 = precise::clamp(_770, 0.0, 1.0);
    float _774 = 0.0 + _740;
    float _776 = precise::clamp(_774, 0.0, 1.0);
    float3 _2130 = float3(_768, _754, float(int(_700)));
    float3 _2134 = select(_2130, float3(0.0), isnan(_2130));
    float _778 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2134.xy, uint(rint(_2134.z)), _772);
    float3 _2143 = float3(_764, _692, float(int(_632)));
    float3 _2145 = select(_2143, float3(0.0), isnan(_2143));
    float _780 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2145.xy, uint(rint(_2145.z)), _776);
    float3 _2154 = float3(_538, _710, float(int(_730)));
    float3 _2156 = select(_2154, float3(0.0), isnan(_2154));
    float _782 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2156.xy, uint(rint(_2156.z)), _542);
    float _784 = fma(_706, 2.0, -1.0);
    float _786 = fma(_708, 2.0, -1.0);
    float _788 = _784 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _790 = _786 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _792 = fma(_788, 2.0, _58);
    float _794 = fma(_790, 2.0, _60);
    float2 _2183 = float2(_792, _794);
    float _796 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2183, float2(0.0), isnan(_2183))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2183, float2(0.0), isnan(_2183))).x;
    float _798 = -_188;
    float _800 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _802 = _798 + _800;
    float _804 = -_188;
    float _806 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _808 = _804 + _806;
    float _810 = _802 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _812 = precise::clamp(_810, 0.0, 1.0);
    float _814 = _808 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _816 = precise::clamp(_814, 0.0, 1.0);
    float _818 = _778 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _820 = _782 + _812;
    float _822 = fma(_780, (*spvDescriptorSet0.fp_c3)._m0[49].z, _818);
    float _824 = _822 + _816;
    out.m_51.x = _796;
    out.m_51.y = _820;
    out.m_51.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_51.w = _824;
    return out;
}

