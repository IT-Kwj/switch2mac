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
    bool _290 = false;
    bool _288 = false;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float2 _826 = float2(_58, _60);
    float3 _64 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_826, float2(0.0), isnan(_826)), int2(0), component::x).xyw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float2 _843 = float2(_58, _60);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_843, float2(0.0), isnan(_843))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_843, float2(0.0), isnan(_843))).x;
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
    float _212 = -_194;
    bool _214 = _212 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _216 = fma(_200, _200, _204);
    bool _218 = !_210;
    uint _221 = uint(_218 ? 0 : 1);
    float _223 = rsqrt(_216);
    uint _225 = 2u;
    if (!_210)
    {
        _225 = 1u;
    }
    uint _227 = _225;
    uint _229 = _227;
    if (!_214)
    {
        _229 = _221;
    }
    uint _231 = _229;
    float _233 = _184 * _223;
    uint _235 = min(_231, 2u);
    float _237 = _190 * _223;
    float _239 = _200 * _223;
    float _241 = _233 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _244 = int(_235) << 2;
    float _246 = fma(_237, (*spvDescriptorSet0.fp_c3)._m0[35].x, _241);
    uint _248 = uint(int(uint(_244) >> uint(2)));
    uint _250 = uint(int(uint(int(_248)) >> uint(2)));
    int _252 = int(_248) & 3;
    float _254 = (*spvDescriptorSet0.fp_c1)._m0[int(_250)][_252];
    float _256 = fma(_239, (*spvDescriptorSet0.fp_c3)._m0[35].z, _246);
    float _258 = abs(_256);
    float _260 = -_258;
    float _262 = _260 + 1.0;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = _194 * _78;
    float _268 = abs(_264);
    float _270 = log2(_268);
    float _272 = _270 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _274 = exp2(_272);
    float _276 = _274 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _278 = fma(_237, _276, _266);
    float _280 = fma(_233, _276, _202);
    float _282 = fma(_239, _276, _194);
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
            float _292 = _280 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _294 = _280 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _296 = _280 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _298 = _280 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _300 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[0].x, _292);
            float _302 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[1].x, _294);
            float _304 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[2].x, _296);
            float _306 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[3].x, _298);
            float _308 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[0].z, _300);
            float _310 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[1].z, _302);
            float _312 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[2].z, _304);
            float _314 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[3].z, _306);
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _318 = _310 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _320 = _312 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _322 = _314 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _324 = _322;
            _326 = _316;
            _328 = _320;
            _330 = _318;
        }
    }
    if ((false || _290) || _288)
    {
        if ((!_290) || _288)
        {
            _288 = false;
            float _332 = _280 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _334 = _280 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _336 = _280 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _338 = _280 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _340 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[4].x, _332);
            float _342 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[5].x, _334);
            float _344 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[6].x, _336);
            float _346 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[7].x, _338);
            float _348 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[4].z, _340);
            float _350 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[5].z, _342);
            float _352 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[6].z, _344);
            float _354 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[7].z, _346);
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _358 = _350 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _360 = _352 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _362 = _354 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _324 = _362;
            _326 = _356;
            _328 = _360;
            _330 = _358;
        }
        if (false || _290)
        {
            _290 = false;
            float _364 = _280 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _366 = _280 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _368 = _280 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _370 = _280 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _372 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[8].x, _364);
            float _374 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[9].x, _366);
            float _376 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[10].x, _368);
            float _378 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[11].x, _370);
            float _380 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[8].z, _372);
            float _382 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[9].z, _374);
            float _384 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[10].z, _376);
            float _386 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[11].z, _378);
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _392 = _384 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _394 = _386 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _324 = _394;
            _326 = _388;
            _328 = _392;
            _330 = _390;
        }
    }
    float _396 = _324;
    float _398 = _326;
    float _400 = _328;
    float _402 = _330;
    float _404 = -_202;
    float _406 = _404 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _408 = -_266;
    float _410 = _408 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _412 = -_202;
    float _414 = _412 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _416 = _406 * _406;
    float _418 = -_194;
    float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _422 = _414 * _414;
    float _424 = _202 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _426 = fma(_410, _410, _416);
    float _428 = -_266;
    float _430 = _428 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _432 = _202 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _434 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[33].x, _424);
    float _436 = fma(_420, _420, _426);
    float _438 = -_194;
    float _440 = _438 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _442 = fma(_430, _430, _422);
    float _444 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[33].z, _434);
    float _446 = _202 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _448 = fma(_440, _440, _442);
    float _450 = sqrt(_436);
    float _452 = _202 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _454 = _202 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _456 = _202 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _458 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[20].x, _432);
    float _460 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[19].x, _446);
    float _462 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[17].x, _452);
    float _464 = _202 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _466 = sqrt(_448);
    float _468 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[20].z, _458);
    float _470 = _202 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _472 = _202 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _474 = _202 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _476 = _202 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _478 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[19].z, _460);
    float _480 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[17].z, _462);
    bool _482 = _450 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _484 = 1.0 / _396;
    bool _486 = _450 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _488 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[16].x, _470);
    bool _490 = !_482;
    int _492 = _490 ? 0 : 1;
    float _494 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[29].x, _472);
    float _496 = float(int(_231));
    float _498 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[31].x, _474);
    bool _500 = _466 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _502 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[32].x, _476);
    bool _504 = _466 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _506 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[29].z, _494);
    bool _508 = !_500;
    int _510 = _508 ? 0 : 1;
    float _512 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[32].z, _502);
    int _514 = 2;
    int _516 = 2;
    if (!_482)
    {
        _514 = 1;
    }
    int _518 = _514;
    float _520 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[31].z, _498);
    int _522 = _518;
    if (!_486)
    {
        _522 = _492;
    }
    int _524 = _522;
    float _526 = _202 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _528 = _484 * _398;
    float _530 = _484 * _400;
    float _532 = precise::clamp(_530, 0.0, 1.0);
    float _534 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[16].z, _488);
    if (!_500)
    {
        _516 = 1;
    }
    int _536 = _516;
    float _538 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[21].x, _526);
    int _540 = _536;
    if (!_504)
    {
        _540 = _510;
    }
    int _542 = _540;
    float _544 = float(_524);
    float _546 = _202 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _548 = float(_542);
    float _550 = _202 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _552 = precise::min(_544, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _554 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[24].x, _546);
    float _556 = precise::min(_548, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _558 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[30].x, _550);
    bool _560 = _552 != 1.0;
    bool _562 = isnan(_552);
    bool _564 = _560 || _562;
    bool _566 = isnan(1.0);
    bool _568 = _564 || _566;
    float _570 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[21].z, _538);
    bool _572 = _556 != 1.0;
    bool _574 = isnan(_556);
    bool _576 = _572 || _574;
    bool _578 = isnan(1.0);
    bool _580 = _576 || _578;
    float _582 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[30].z, _558);
    float _584 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[24].z, _554);
    float _586 = _570 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _588 = _202 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _590 = _582 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    bool _592 = _552 != 0.0;
    bool _594 = isnan(_552);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    float _602 = _202 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _604 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[22].x, _588);
    bool _606 = _556 != 0.0;
    bool _608 = isnan(_556);
    bool _610 = _606 || _608;
    bool _612 = isnan(0.0);
    bool _614 = _610 || _612;
    float _616 = rint(_552);
    float _618 = precise::max(_616, 0.0);
    uint _620 = uint(_618);
    uint _622 = clamp(_620, 0u, 65535u);
    float _624 = _586;
    float _626 = _590;
    if (_568)
    {
        float _628 = _584 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _624 = _628;
    }
    float _630 = _624;
    float _632 = _202 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _634 = _630;
    if (_580)
    {
        float _636 = _444 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _626 = _636;
    }
    float _638 = _626;
    float _640 = _202 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _642 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[26].x, _464);
    float _644 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[23].x, _632);
    float _646 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[27].x, _602);
    float _648 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[18].x, _640);
    float _650 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[25].x, _454);
    float _652 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[28].x, _456);
    float _654 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[22].z, _604);
    float _656 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[23].z, _644);
    float _658 = _468 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _660 = _478 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _662 = _660;
    float _664 = _658;
    float _666 = _638;
    if (_568)
    {
        float _668 = _654 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _662 = _668;
    }
    float _670 = _662;
    float _672 = _670;
    if (_568)
    {
        float _674 = _656 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _664 = _674;
    }
    float _676 = _664;
    float _678 = _676;
    if (!_600)
    {
        float _680 = _480 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _678 = _680;
    }
    float _682 = _678;
    float _684 = rint(_556);
    float _686 = precise::max(_684, 0.0);
    uint _688 = uint(_686);
    uint _690 = clamp(_688, 0u, 65535u);
    float2 _1965 = float2(_58, _60);
    float2 _694 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1965, float2(0.0), isnan(_1965))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1965, float2(0.0), isnan(_1965))).xy;
    float _696 = _694.x;
    float _698 = _694.y;
    float _700 = _484 * _402;
    float _702 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[27].z, _646);
    float _704 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[18].z, _648);
    float _706 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[28].z, _652);
    float _708 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[26].z, _642);
    if (!_614)
    {
        float _710 = _702 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _666 = _710;
    }
    float _712 = _666;
    float _714 = rint(_496);
    float _716 = precise::max(_714, 0.0);
    uint _718 = uint(_716);
    uint _720 = clamp(_718, 0u, 65535u);
    float _722 = _506 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _724 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[25].z, _650);
    float _726 = _722;
    if (!_600)
    {
        float _728 = _704 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _634 = _728;
    }
    float _730 = _634;
    if (_580)
    {
        float _732 = _512 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _726 = _732;
    }
    float _734 = _726;
    float _736 = _706 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _738 = _734;
    float _740 = _736;
    if (!_614)
    {
        float _742 = _708 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _738 = _742;
    }
    float _744 = _738;
    if (_580)
    {
        float _746 = _520 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _740 = _746;
    }
    float _748 = _740;
    float _750 = _748;
    if (!_600)
    {
        float _752 = _534 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _672 = _752;
    }
    float _754 = _672;
    if (!_614)
    {
        float _756 = _724 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _750 = _756;
    }
    float _758 = _750;
    float _760 = 0.0 + _712;
    float _762 = precise::clamp(_760, 0.0, 1.0);
    float _764 = 0.0 + _730;
    float _766 = precise::clamp(_764, 0.0, 1.0);
    float3 _2104 = float3(_758, _744, float(int(_690)));
    float3 _2108 = select(_2104, float3(0.0), isnan(_2104));
    float _768 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2108.xy, uint(rint(_2108.z)), _762);
    float3 _2117 = float3(_754, _682, float(int(_622)));
    float3 _2119 = select(_2117, float3(0.0), isnan(_2117));
    float _770 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2119.xy, uint(rint(_2119.z)), _766);
    float3 _2128 = float3(_528, _700, float(int(_720)));
    float3 _2130 = select(_2128, float3(0.0), isnan(_2128));
    float _772 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2130.xy, uint(rint(_2130.z)), _532);
    float _774 = fma(_696, 2.0, -1.0);
    float _776 = fma(_698, 2.0, -1.0);
    float _778 = _774 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _780 = _776 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _782 = fma(_778, 2.0, _58);
    float _784 = fma(_780, 2.0, _60);
    float2 _2157 = float2(_782, _784);
    float _786 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2157, float2(0.0), isnan(_2157))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2157, float2(0.0), isnan(_2157))).x;
    float _788 = -_194;
    float _790 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _792 = _788 + _790;
    float _794 = -_194;
    float _796 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _798 = _794 + _796;
    float _800 = _792 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _802 = precise::clamp(_800, 0.0, 1.0);
    float _804 = _798 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _806 = precise::clamp(_804, 0.0, 1.0);
    float _808 = _768 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _810 = _772 + _802;
    float _812 = fma(_770, (*spvDescriptorSet0.fp_c3)._m0[49].z, _808);
    float _814 = _812 + _806;
    out.m_51.x = _786;
    out.m_51.y = _810;
    out.m_51.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_51.w = _814;
    return out;
}

