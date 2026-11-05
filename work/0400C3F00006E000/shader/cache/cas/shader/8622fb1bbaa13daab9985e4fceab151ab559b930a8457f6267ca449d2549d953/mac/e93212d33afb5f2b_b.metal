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
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_12 [[id(10)]];
    sampler fp_t_tcb_12Smplr [[id(11)]];
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
    float2 _918 = float2(_58, _60);
    float3 _64 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_918, float2(0.0), isnan(_918)), int2(0), component::x).xyw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float2 _935 = float2(_58, _60);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_935, float2(0.0), isnan(_935))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_935, float2(0.0), isnan(_935))).x;
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
    float _190 = -_180;
    float _192 = fma(_170, _172, _190);
    float _194 = _170 * _176;
    float _196 = _184 * _184;
    float _198 = _188 * _74;
    float _200 = -_194;
    float _202 = fma(_166, _174, _200);
    float _204 = fma(_192, _192, _196);
    float _206 = -_188;
    bool _210 = _206 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _212 = _188 * _78;
    float _214 = -_188;
    bool _216 = _214 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _218 = fma(_202, _202, _204);
    float _220 = -_188;
    bool _222 = _220 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _224 = !_210;
    int _227 = _224 ? 0 : 1;
    float _229 = rsqrt(_218);
    int _231 = 2;
    if (!_210)
    {
        _231 = 1;
    }
    int _233 = _231;
    int _235 = _233;
    if (!_216)
    {
        _235 = _227;
    }
    int _237 = _235;
    int _239 = _237 + 1;
    uint _242 = uint(_239);
    if (!_222)
    {
        _242 = uint(_237);
    }
    uint _244 = _242;
    float _246 = _184 * _229;
    float _248 = _192 * _229;
    uint _250 = min(_244, 2u);
    float _252 = _202 * _229;
    float _254 = _246 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _256 = int(_250) << 2;
    float _258 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[35].x, _254);
    uint _260 = uint(int(uint(_256) >> uint(2)));
    uint _262 = uint(int(uint(int(_260)) >> uint(2)));
    int _264 = int(_260) & 3;
    float _266 = (*spvDescriptorSet0.fp_c1)._m0[int(_262)][_264];
    float _268 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[35].z, _258);
    float _270 = abs(_268);
    float _272 = -_270;
    float _274 = _272 + 1.0;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = abs(_276);
    float _280 = log2(_278);
    float _282 = _280 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _284 = exp2(_282);
    float _286 = _284 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _288 = fma(_248, _286, _212);
    float _290 = fma(_246, _286, _198);
    float _292 = fma(_252, _286, _188);
    bool _294 = as_type<int>(_266) == 1392;
    if (!_294)
    {
        bool _296 = as_type<int>(_266) == 1664;
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
            _336 = _330;
            _338 = _328;
            _340 = _326;
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
            _336 = _370;
            _338 = _368;
            _340 = _366;
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
            _336 = _402;
            _338 = _400;
            _340 = _398;
        }
    }
    float _406 = _334;
    float _408 = _336;
    float _410 = _338;
    float _412 = _340;
    float _414 = _198 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _416 = -_198;
    float _418 = _416 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _420 = -_212;
    float _422 = _420 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _424 = -_198;
    float _426 = _424 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _428 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[20].x, _414);
    float _430 = _418 * _418;
    float2 _1590 = float2(_58, _60);
    float2 _434 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1590, float2(0.0), isnan(_1590))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1590, float2(0.0), isnan(_1590))).xy;
    float _436 = _434.x;
    float _438 = _434.y;
    float _440 = -_212;
    float _442 = _440 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _444 = _426 * _426;
    float _446 = fma(_422, _422, _430);
    float _448 = -_188;
    float _450 = _448 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _452 = 1.0 / _406;
    float _454 = fma(_442, _442, _444);
    float _456 = -_188;
    float _458 = _456 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _460 = fma(_450, _450, _446);
    float _462 = float(int(_244));
    float _464 = _198 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _466 = fma(_458, _458, _454);
    float _468 = _198 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _470 = sqrt(_460);
    float _472 = _198 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _474 = _198 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _476 = _198 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _478 = _198 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _480 = _198 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _482 = _198 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _484 = _452 * _408;
    float _486 = precise::clamp(_484, 0.0, 1.0);
    float _488 = sqrt(_466);
    float _490 = _452 * _410;
    float _492 = _198 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _494 = _198 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _496 = _198 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _498 = _198 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _500 = _198 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _502 = _198 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    bool _504 = _470 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _506 = _198 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _508 = _470 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _510 = _198 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _512 = rint(_462);
    float _514 = precise::max(_512, 0.0);
    uint _516 = uint(_514);
    uint _518 = clamp(_516, 0u, 65535u);
    bool _520 = !_504;
    int _522 = _520 ? 0 : 1;
    float _524 = _198 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _526 = _452 * _412;
    bool _528 = _488 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _530 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[19].x, _464);
    bool _532 = _488 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _534 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[22].x, _468);
    float _536 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[23].x, _472);
    int _538 = 2;
    if (!_504)
    {
        _538 = 1;
    }
    int _540 = _538;
    float _542 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[21].x, _474);
    int _544 = _540;
    if (!_508)
    {
        _544 = _522;
    }
    int _546 = _544;
    float _548 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _486;
    float _550 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[24].x, _476);
    float _552 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[16].x, _478);
    float _554 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[17].x, _480);
    float _556 = _548 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _558 = _548 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _560 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[18].x, _482);
    float _562 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[25].x, _492);
    float _564 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[26].x, _494);
    float _566 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[27].x, _496);
    float _568 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[28].x, _498);
    float _570 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[29].x, _500);
    float _572 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[30].x, _502);
    float _574 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[31].x, _506);
    float _576 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[32].x, _510);
    bool _578 = !_528;
    int _580 = _578 ? 0 : 1;
    float _582 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[33].x, _524);
    float _584 = fma(_556, -0.5, _526);
    float _586 = fma(_558, 0.5, _490);
    int _588 = 2;
    if (!_528)
    {
        _588 = 1;
    }
    int _590 = _588;
    int _592 = _590;
    if (!_532)
    {
        _592 = _580;
    }
    int _594 = _592;
    float3 _1914 = float3(_584, _586, float(int(_518)));
    float3 _1918 = select(_1914, float3(0.0), isnan(_1914));
    float _596 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1918.xy, uint(rint(_1918.z)), _486);
    float _598 = float(_546);
    float _600 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[19].z, _530);
    float _602 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[20].z, _428);
    float _604 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[21].z, _542);
    float _606 = precise::min(_598, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _608 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[22].z, _534);
    float _610 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[23].z, _536);
    float _612 = float(_594);
    float _614 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[24].z, _550);
    bool _616 = _606 != 1.0;
    bool _618 = isnan(_606);
    bool _620 = _616 || _618;
    bool _622 = isnan(1.0);
    bool _624 = _620 || _622;
    float _626 = _600 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _628 = _602 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _630 = _604 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _632 = precise::min(_612, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _634 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[18].z, _560);
    float _636 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[30].z, _572);
    float _638 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[33].z, _582);
    bool _640 = _632 != 1.0;
    bool _642 = isnan(_632);
    bool _644 = _640 || _642;
    bool _646 = isnan(1.0);
    bool _648 = _644 || _646;
    float _650 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[16].z, _552);
    bool _652 = _632 != 0.0;
    bool _654 = isnan(_632);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[27].z, _566);
    float _664 = _636 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _666 = _626;
    float _668 = _628;
    float _670 = _630;
    float _672 = _664;
    if (_624)
    {
        float _674 = _608 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _666 = _674;
    }
    float _676 = _666;
    float _678 = _676;
    if (_624)
    {
        float _680 = _610 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _668 = _680;
    }
    float _682 = _668;
    float _684 = _682;
    if (_624)
    {
        float _686 = _614 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _670 = _686;
    }
    float _688 = _670;
    bool _690 = _606 != 0.0;
    bool _692 = isnan(_606);
    bool _694 = _690 || _692;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    float _700 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[17].z, _554);
    float _702 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[29].z, _570);
    float _704 = fma(_556, 0.5, _526);
    float _706 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[28].z, _568);
    float _708 = _688;
    if (_648)
    {
        float _710 = _638 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _672 = _710;
    }
    float _712 = _672;
    float _714 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _716 = _712;
    if (!_660)
    {
        float _718 = _662 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _716 = _718;
    }
    float _720 = _716;
    float _722 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[32].z, _576);
    float _724 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _726 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[31].z, _574);
    float _728 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[26].z, _564);
    float _730 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[25].z, _562);
    if (!_698)
    {
        float _732 = _634 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _708 = _732;
    }
    float _734 = _708;
    if (!_698)
    {
        float _736 = _650 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _678 = _736;
    }
    float _738 = _678;
    if (!_698)
    {
        float _740 = _700 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _684 = _740;
    }
    float _742 = _684;
    float _744 = 0.0 + _720;
    float _746 = precise::clamp(_744, 0.0, 1.0);
    float _748 = 0.0 + _734;
    float _750 = precise::clamp(_748, 0.0, 1.0);
    float _752 = _702 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _754 = _706 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _756 = _752;
    float _758 = _754;
    if (_648)
    {
        float _760 = _722 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _756 = _760;
    }
    float _762 = _756;
    float _764 = _750 * _714;
    float _766 = _750 * _724;
    float _768 = _762;
    if (_648)
    {
        float _770 = _726 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _758 = _770;
    }
    float _772 = _758;
    float _774 = _772;
    if (!_660)
    {
        float _776 = _728 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _768 = _776;
    }
    float _778 = _768;
    float _780 = fma(_558, -0.5, _490);
    if (!_660)
    {
        float _782 = _730 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _774 = _782;
    }
    float _784 = _774;
    float _786 = fma(_764, 0.5, _738);
    float _788 = _714 * _746;
    float _790 = fma(_764, -0.5, _738);
    float _792 = fma(_766, 0.5, _742);
    float _794 = fma(_766, -0.5, _742);
    float _796 = fma(_788, 0.5, _784);
    float _798 = fma(_788, -0.5, _784);
    float _800 = rint(_606);
    float _802 = precise::max(_800, 0.0);
    uint _804 = uint(_802);
    uint _806 = clamp(_804, 0u, 65535u);
    float _808 = _724 * _746;
    float _810 = rint(_632);
    float _812 = precise::max(_810, 0.0);
    uint _814 = uint(_812);
    uint _816 = clamp(_814, 0u, 65535u);
    float _818 = fma(_808, 0.5, _778);
    float _820 = fma(_808, -0.5, _778);
    float3 _2299 = float3(_704, _586, float(int(_518)));
    float3 _2301 = select(_2299, float3(0.0), isnan(_2299));
    float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2301.xy, uint(rint(_2301.z)), _486);
    float _824 = fma(_436, 2.0, -1.0);
    float _826 = fma(_438, 2.0, -1.0);
    float _828 = _824 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _830 = _826 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _832 = fma(_828, 2.0, _58);
    float _834 = fma(_830, 2.0, _60);
    float3 _2331 = float3(_704, _780, float(int(_518)));
    float3 _2333 = select(_2331, float3(0.0), isnan(_2331));
    float _836 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2333.xy, uint(rint(_2333.z)), _486);
    float3 _2342 = float3(_584, _780, float(int(_518)));
    float3 _2344 = select(_2342, float3(0.0), isnan(_2342));
    float _838 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2344.xy, uint(rint(_2344.z)), _486);
    float3 _2353 = float3(_790, _792, float(int(_806)));
    float3 _2355 = select(_2353, float3(0.0), isnan(_2353));
    float _840 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2355.xy, uint(rint(_2355.z)), _750);
    float3 _2364 = float3(_786, _792, float(int(_806)));
    float3 _2366 = select(_2364, float3(0.0), isnan(_2364));
    float _842 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2366.xy, uint(rint(_2366.z)), _750);
    float3 _2375 = float3(_786, _794, float(int(_806)));
    float3 _2377 = select(_2375, float3(0.0), isnan(_2375));
    float _844 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2377.xy, uint(rint(_2377.z)), _750);
    float3 _2386 = float3(_798, _818, float(int(_816)));
    float3 _2388 = select(_2386, float3(0.0), isnan(_2386));
    float _846 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2388.xy, uint(rint(_2388.z)), _746);
    float3 _2397 = float3(_796, _818, float(int(_816)));
    float3 _2399 = select(_2397, float3(0.0), isnan(_2397));
    float _848 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2399.xy, uint(rint(_2399.z)), _746);
    float3 _2408 = float3(_796, _820, float(int(_816)));
    float3 _2410 = select(_2408, float3(0.0), isnan(_2408));
    float _850 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2410.xy, uint(rint(_2410.z)), _746);
    float3 _2419 = float3(_790, _794, float(int(_806)));
    float3 _2421 = select(_2419, float3(0.0), isnan(_2419));
    float _852 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2421.xy, uint(rint(_2421.z)), _750);
    float3 _2430 = float3(_798, _820, float(int(_816)));
    float3 _2432 = select(_2430, float3(0.0), isnan(_2430));
    float _854 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2432.xy, uint(rint(_2432.z)), _746);
    float2 _2438 = float2(_832, _834);
    float _856 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2438, float2(0.0), isnan(_2438))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2438, float2(0.0), isnan(_2438))).x;
    float _858 = -_188;
    float _860 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _862 = _858 + _860;
    float _864 = -_188;
    float _866 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _868 = _864 + _866;
    float _870 = _862 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _872 = precise::clamp(_870, 0.0, 1.0);
    float _874 = _822 + _596;
    float _876 = _874 + _836;
    float _878 = _842 + _840;
    float _880 = _876 + _838;
    float _882 = _848 + _846;
    float _884 = _878 + _844;
    float _886 = fma(_880, 0.25, _872);
    float _888 = _882 + _850;
    float _890 = _884 + _852;
    float _892 = _888 + _854;
    float _894 = _890 * 0.25;
    float _896 = _892 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _898 = _896 * 0.25;
    float _900 = fma(_894, (*spvDescriptorSet0.fp_c3)._m0[49].z, _898);
    float _902 = _868 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _904 = precise::clamp(_902, 0.0, 1.0);
    float _906 = _900 + _904;
    out.m_51.x = _856;
    out.m_51.y = _886;
    out.m_51.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_51.w = _906;
    return out;
}

