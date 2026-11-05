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
    bool _290 = false;
    bool _288 = false;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float2 _908 = float2(_58, _60);
    float3 _64 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_908, float2(0.0), isnan(_908)), int2(0), component::x).xyw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float2 _925 = float2(_58, _60);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_925, float2(0.0), isnan(_925))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_925, float2(0.0), isnan(_925))).x;
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
    float _158 = rsqrt(_154);
    float _160 = -_72;
    float _162 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _164 = _122 * _156;
    float _166 = _126 * _156;
    float _168 = 1.0 / _162;
    float _170 = _118 * _156;
    float _172 = _146 * _158;
    float _174 = _136 * _158;
    float _176 = _140 * _158;
    float _178 = _164 * _172;
    float _180 = _166 * _174;
    float _182 = -_178;
    float _184 = fma(_166, _176, _182);
    float _186 = _170 * _176;
    float _188 = -_180;
    float _190 = fma(_170, _172, _188);
    float _192 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _194 = _168 * _192;
    float _196 = _184 * _184;
    float _198 = -_186;
    float _200 = fma(_164, _174, _198);
    float _202 = _194 * _74;
    float _204 = fma(_190, _190, _196);
    float _206 = -_194;
    bool _210 = _206 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _212 = _194 * _78;
    float _214 = -_194;
    bool _216 = _214 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _218 = fma(_200, _200, _204);
    bool _220 = !_210;
    uint _223 = uint(_220 ? 0 : 1);
    float _225 = rsqrt(_218);
    uint _227 = 2u;
    if (!_210)
    {
        _227 = 1u;
    }
    uint _229 = _227;
    uint _231 = _229;
    if (!_216)
    {
        _231 = _223;
    }
    uint _233 = _231;
    uint _235 = min(_233, 2u);
    int _238 = int(_235) << 2;
    float _240 = _184 * _225;
    float _242 = _190 * _225;
    float _244 = _200 * _225;
    float _246 = _240 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _248 = uint(int(uint(_238) >> uint(2)));
    uint _250 = uint(int(uint(int(_248)) >> uint(2)));
    int _252 = int(_248) & 3;
    float _254 = (*spvDescriptorSet0.fp_c1)._m0[int(_250)][_252];
    float _256 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[35].x, _246);
    float _258 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[35].z, _256);
    float _260 = abs(_258);
    float _262 = -_260;
    float _264 = _262 + 1.0;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = abs(_266);
    float _270 = log2(_268);
    float _272 = _270 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _274 = exp2(_272);
    float _276 = _274 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _278 = fma(_240, _276, _202);
    float _280 = fma(_242, _276, _212);
    float _282 = fma(_244, _276, _194);
    bool _284 = as_type<int>(_254) == 1344;
    if (!_284)
    {
        bool _286 = as_type<int>(_254) == 1616;
        _288 = _286;
        if (!_288)
        {
            _290 = true;
        }
    }
    float _324;
    float _326;
    float _328;
    float _330;
    if (!_288)
    {
        if (!_290)
        {
            float _292 = _278 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _294 = _278 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _296 = _278 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _298 = _278 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _300 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[0].x, _292);
            float _302 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[1].x, _294);
            float _304 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[2].x, _296);
            float _306 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[3].x, _298);
            float _308 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[0].z, _300);
            float _310 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[1].z, _302);
            float _312 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[2].z, _304);
            float _314 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[3].z, _306);
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _318 = _310 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _320 = _312 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _322 = _314 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _324 = _322;
            _326 = _320;
            _328 = _318;
            _330 = _316;
        }
    }
    if ((false || _290) || _288)
    {
        if ((!_290) || _288)
        {
            _288 = false;
            float _332 = _278 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _334 = _278 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _336 = _278 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _338 = _278 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _340 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[4].x, _332);
            float _342 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[5].x, _334);
            float _344 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[6].x, _336);
            float _346 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[7].x, _338);
            float _348 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[4].z, _340);
            float _350 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[5].z, _342);
            float _352 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[6].z, _344);
            float _354 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[7].z, _346);
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _358 = _350 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _360 = _352 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _362 = _354 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _324 = _362;
            _326 = _360;
            _328 = _358;
            _330 = _356;
        }
        if (false || _290)
        {
            _290 = false;
            float _364 = _278 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _366 = _278 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _368 = _278 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _370 = _278 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _372 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[8].x, _364);
            float _374 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[9].x, _366);
            float _376 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[10].x, _368);
            float _378 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[11].x, _370);
            float _380 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[8].z, _372);
            float _382 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[9].z, _374);
            float _384 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[10].z, _376);
            float _386 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[11].z, _378);
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _392 = _384 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _394 = _386 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _324 = _394;
            _326 = _392;
            _328 = _390;
            _330 = _388;
        }
    }
    float _396 = _324;
    float _398 = _326;
    float _400 = _328;
    float _402 = _330;
    float _404 = _202 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _406 = -_202;
    float _408 = _406 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _410 = -_212;
    float _412 = _410 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _414 = -_202;
    float _416 = _414 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _418 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[20].x, _404);
    float _420 = _408 * _408;
    float2 _1564 = float2(_58, _60);
    float2 _424 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1564, float2(0.0), isnan(_1564))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1564, float2(0.0), isnan(_1564))).xy;
    float _426 = _424.x;
    float _428 = _424.y;
    float _430 = -_212;
    float _432 = _430 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _434 = _416 * _416;
    float _436 = fma(_412, _412, _420);
    float _438 = -_194;
    float _440 = _438 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _442 = 1.0 / _396;
    float _444 = fma(_432, _432, _434);
    float _446 = -_194;
    float _448 = _446 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _450 = fma(_440, _440, _436);
    float _452 = float(int(_233));
    float _454 = _202 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _456 = fma(_448, _448, _444);
    float _458 = _202 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _460 = sqrt(_450);
    float _462 = _202 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _464 = _202 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _466 = _202 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _468 = _202 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _470 = _202 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _472 = _202 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _474 = _442 * _398;
    float _476 = precise::clamp(_474, 0.0, 1.0);
    float _478 = sqrt(_456);
    float _480 = _442 * _400;
    float _482 = _202 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _484 = _202 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _486 = _202 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _488 = _202 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _490 = _202 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _492 = _202 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    bool _494 = _460 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _496 = _202 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _498 = _460 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _500 = _202 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _502 = rint(_452);
    float _504 = precise::max(_502, 0.0);
    uint _506 = uint(_504);
    uint _508 = clamp(_506, 0u, 65535u);
    bool _510 = !_494;
    int _512 = _510 ? 0 : 1;
    float _514 = _202 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _516 = _442 * _402;
    bool _518 = _478 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _520 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[19].x, _454);
    bool _522 = _478 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _524 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[22].x, _458);
    float _526 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[23].x, _462);
    int _528 = 2;
    if (!_494)
    {
        _528 = 1;
    }
    int _530 = _528;
    float _532 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[21].x, _464);
    int _534 = _530;
    if (!_498)
    {
        _534 = _512;
    }
    int _536 = _534;
    float _538 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _476;
    float _540 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[24].x, _466);
    float _542 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[16].x, _468);
    float _544 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[17].x, _470);
    float _546 = _538 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _548 = _538 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _550 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[18].x, _472);
    float _552 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[25].x, _482);
    float _554 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[26].x, _484);
    float _556 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[27].x, _486);
    float _558 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[28].x, _488);
    float _560 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[29].x, _490);
    float _562 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[30].x, _492);
    float _564 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[31].x, _496);
    float _566 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[32].x, _500);
    bool _568 = !_518;
    int _570 = _568 ? 0 : 1;
    float _572 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[33].x, _514);
    float _574 = fma(_546, -0.5, _516);
    float _576 = fma(_548, 0.5, _480);
    int _578 = 2;
    if (!_518)
    {
        _578 = 1;
    }
    int _580 = _578;
    int _582 = _580;
    if (!_522)
    {
        _582 = _570;
    }
    int _584 = _582;
    float3 _1888 = float3(_574, _576, float(int(_508)));
    float3 _1892 = select(_1888, float3(0.0), isnan(_1888));
    float _586 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1892.xy, uint(rint(_1892.z)), _476);
    float _588 = float(_536);
    float _590 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[19].z, _520);
    float _592 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[20].z, _418);
    float _594 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[21].z, _532);
    float _596 = precise::min(_588, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _598 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[22].z, _524);
    float _600 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[23].z, _526);
    float _602 = float(_584);
    float _604 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[24].z, _540);
    bool _606 = _596 != 1.0;
    bool _608 = isnan(_596);
    bool _610 = _606 || _608;
    bool _612 = isnan(1.0);
    bool _614 = _610 || _612;
    float _616 = _590 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _618 = _592 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _620 = _594 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _622 = precise::min(_602, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _624 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[18].z, _550);
    float _626 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[30].z, _562);
    float _628 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[33].z, _572);
    bool _630 = _622 != 1.0;
    bool _632 = isnan(_622);
    bool _634 = _630 || _632;
    bool _636 = isnan(1.0);
    bool _638 = _634 || _636;
    float _640 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[16].z, _542);
    bool _642 = _622 != 0.0;
    bool _644 = isnan(_622);
    bool _646 = _642 || _644;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    float _652 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[27].z, _556);
    float _654 = _626 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _656 = _616;
    float _658 = _618;
    float _660 = _620;
    float _662 = _654;
    if (_614)
    {
        float _664 = _598 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _656 = _664;
    }
    float _666 = _656;
    float _668 = _666;
    if (_614)
    {
        float _670 = _600 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _658 = _670;
    }
    float _672 = _658;
    float _674 = _672;
    if (_614)
    {
        float _676 = _604 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _660 = _676;
    }
    float _678 = _660;
    bool _680 = _596 != 0.0;
    bool _682 = isnan(_596);
    bool _684 = _680 || _682;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    float _690 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[17].z, _544);
    float _692 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[29].z, _560);
    float _694 = fma(_546, 0.5, _516);
    float _696 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[28].z, _558);
    float _698 = _678;
    if (_638)
    {
        float _700 = _628 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _662 = _700;
    }
    float _702 = _662;
    float _704 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _706 = _702;
    if (!_650)
    {
        float _708 = _652 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _706 = _708;
    }
    float _710 = _706;
    float _712 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[32].z, _566);
    float _714 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _716 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[31].z, _564);
    float _718 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[26].z, _554);
    float _720 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[25].z, _552);
    if (!_688)
    {
        float _722 = _624 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _698 = _722;
    }
    float _724 = _698;
    if (!_688)
    {
        float _726 = _640 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _668 = _726;
    }
    float _728 = _668;
    if (!_688)
    {
        float _730 = _690 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _674 = _730;
    }
    float _732 = _674;
    float _734 = 0.0 + _710;
    float _736 = precise::clamp(_734, 0.0, 1.0);
    float _738 = 0.0 + _724;
    float _740 = precise::clamp(_738, 0.0, 1.0);
    float _742 = _692 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _744 = _696 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _746 = _742;
    float _748 = _744;
    if (_638)
    {
        float _750 = _712 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _746 = _750;
    }
    float _752 = _746;
    float _754 = _740 * _704;
    float _756 = _740 * _714;
    float _758 = _752;
    if (_638)
    {
        float _760 = _716 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _748 = _760;
    }
    float _762 = _748;
    float _764 = _762;
    if (!_650)
    {
        float _766 = _718 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _758 = _766;
    }
    float _768 = _758;
    float _770 = fma(_548, -0.5, _480);
    if (!_650)
    {
        float _772 = _720 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _764 = _772;
    }
    float _774 = _764;
    float _776 = fma(_754, 0.5, _728);
    float _778 = _704 * _736;
    float _780 = fma(_754, -0.5, _728);
    float _782 = fma(_756, 0.5, _732);
    float _784 = fma(_756, -0.5, _732);
    float _786 = fma(_778, 0.5, _774);
    float _788 = fma(_778, -0.5, _774);
    float _790 = rint(_596);
    float _792 = precise::max(_790, 0.0);
    uint _794 = uint(_792);
    uint _796 = clamp(_794, 0u, 65535u);
    float _798 = _714 * _736;
    float _800 = rint(_622);
    float _802 = precise::max(_800, 0.0);
    uint _804 = uint(_802);
    uint _806 = clamp(_804, 0u, 65535u);
    float _808 = fma(_798, 0.5, _768);
    float _810 = fma(_798, -0.5, _768);
    float3 _2273 = float3(_694, _576, float(int(_508)));
    float3 _2275 = select(_2273, float3(0.0), isnan(_2273));
    float _812 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2275.xy, uint(rint(_2275.z)), _476);
    float _814 = fma(_426, 2.0, -1.0);
    float _816 = fma(_428, 2.0, -1.0);
    float _818 = _814 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _820 = _816 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _822 = fma(_818, 2.0, _58);
    float _824 = fma(_820, 2.0, _60);
    float3 _2305 = float3(_694, _770, float(int(_508)));
    float3 _2307 = select(_2305, float3(0.0), isnan(_2305));
    float _826 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2307.xy, uint(rint(_2307.z)), _476);
    float3 _2316 = float3(_574, _770, float(int(_508)));
    float3 _2318 = select(_2316, float3(0.0), isnan(_2316));
    float _828 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2318.xy, uint(rint(_2318.z)), _476);
    float3 _2327 = float3(_780, _782, float(int(_796)));
    float3 _2329 = select(_2327, float3(0.0), isnan(_2327));
    float _830 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2329.xy, uint(rint(_2329.z)), _740);
    float3 _2338 = float3(_776, _782, float(int(_796)));
    float3 _2340 = select(_2338, float3(0.0), isnan(_2338));
    float _832 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2340.xy, uint(rint(_2340.z)), _740);
    float3 _2349 = float3(_776, _784, float(int(_796)));
    float3 _2351 = select(_2349, float3(0.0), isnan(_2349));
    float _834 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2351.xy, uint(rint(_2351.z)), _740);
    float3 _2360 = float3(_788, _808, float(int(_806)));
    float3 _2362 = select(_2360, float3(0.0), isnan(_2360));
    float _836 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2362.xy, uint(rint(_2362.z)), _736);
    float3 _2371 = float3(_786, _808, float(int(_806)));
    float3 _2373 = select(_2371, float3(0.0), isnan(_2371));
    float _838 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2373.xy, uint(rint(_2373.z)), _736);
    float3 _2382 = float3(_786, _810, float(int(_806)));
    float3 _2384 = select(_2382, float3(0.0), isnan(_2382));
    float _840 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2384.xy, uint(rint(_2384.z)), _736);
    float3 _2393 = float3(_780, _784, float(int(_796)));
    float3 _2395 = select(_2393, float3(0.0), isnan(_2393));
    float _842 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2395.xy, uint(rint(_2395.z)), _740);
    float3 _2404 = float3(_788, _810, float(int(_806)));
    float3 _2406 = select(_2404, float3(0.0), isnan(_2404));
    float _844 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2406.xy, uint(rint(_2406.z)), _736);
    float2 _2412 = float2(_822, _824);
    float _846 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2412, float2(0.0), isnan(_2412))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2412, float2(0.0), isnan(_2412))).x;
    float _848 = -_194;
    float _850 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _852 = _848 + _850;
    float _854 = -_194;
    float _856 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _858 = _854 + _856;
    float _860 = _852 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _862 = precise::clamp(_860, 0.0, 1.0);
    float _864 = _812 + _586;
    float _866 = _864 + _826;
    float _868 = _832 + _830;
    float _870 = _866 + _828;
    float _872 = _838 + _836;
    float _874 = _868 + _834;
    float _876 = fma(_870, 0.25, _862);
    float _878 = _872 + _840;
    float _880 = _874 + _842;
    float _882 = _878 + _844;
    float _884 = _880 * 0.25;
    float _886 = _882 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _888 = _886 * 0.25;
    float _890 = fma(_884, (*spvDescriptorSet0.fp_c3)._m0[49].z, _888);
    float _892 = _858 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _894 = precise::clamp(_892, 0.0, 1.0);
    float _896 = _890 + _894;
    out.m_51.x = _846;
    out.m_51.y = _876;
    out.m_51.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_51.w = _896;
    return out;
}

