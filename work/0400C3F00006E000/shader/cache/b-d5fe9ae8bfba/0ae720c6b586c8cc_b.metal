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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
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
    bool _300 = false;
    bool _298 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _815 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_815, float2(0.0), isnan(_815)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _832 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_832, float2(0.0), isnan(_832))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_832, float2(0.0), isnan(_832))).x;
    float2 _840 = float2(_56, _58);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_840, float2(0.0), isnan(_840))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_840, float2(0.0), isnan(_840))).x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_46.y;
    float _82 = in.m_44.x;
    float _84 = in.m_46.x;
    float _86 = -_64;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = -_66;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = -_68;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _98 = 1.0 / _88;
    float _100 = 1.0 / _92;
    float _102 = -_70;
    float _104 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _106 = 1.0 / _96;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _98 * _108;
    float _112 = _74 * _110;
    float _114 = _78 * _110;
    float _116 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _118 = _100 * _116;
    float _120 = 1.0 / _104;
    float _122 = -_112;
    float _124 = fma(_118, _76, _122);
    float _126 = -_114;
    float _128 = fma(_118, _82, _126);
    float _130 = -_110;
    float _132 = _130 + _118;
    float _134 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _136 = _106 * _134;
    float _138 = _124 * _124;
    float _140 = -_112;
    float _142 = fma(_136, _80, _140);
    float _144 = -_114;
    float _146 = fma(_136, _84, _144);
    float _148 = fma(_128, _128, _138);
    float _150 = -_110;
    float _152 = _150 + _136;
    float _154 = _142 * _142;
    float _156 = fma(_132, _132, _148);
    float _158 = fma(_146, _146, _154);
    float _160 = fma(_152, _152, _158);
    float _162 = rsqrt(_156);
    float _164 = rsqrt(_160);
    float _166 = _128 * _162;
    float _168 = _132 * _162;
    float _170 = _124 * _162;
    float _172 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _174 = _120 * _172;
    float _176 = _152 * _164;
    float _178 = _142 * _164;
    float _180 = _146 * _164;
    float _182 = -_174;
    bool _186 = _182 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _188 = _166 * _176;
    float _190 = _168 * _178;
    float _192 = -_174;
    bool _194 = _192 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _196 = -_188;
    float _198 = fma(_168, _180, _196);
    float _200 = -_190;
    float _202 = fma(_170, _176, _200);
    float _204 = _170 * _180;
    float _206 = -_174;
    bool _208 = _206 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _210 = _198 * _198;
    float _212 = -_204;
    float _214 = fma(_166, _178, _212);
    float _216 = fma(_202, _202, _210);
    int _219 = 2;
    if (!_186)
    {
        _219 = 1;
    }
    int _221 = _219;
    float _223 = fma(_214, _214, _216);
    bool _225 = !_186;
    int _227 = _225 ? 0 : 1;
    int _229 = _221;
    if (!_194)
    {
        _229 = _227;
    }
    int _231 = _229;
    float _233 = rsqrt(_223);
    int _235 = _231 + 1;
    uint _238 = uint(_235);
    if (!_208)
    {
        _238 = uint(_231);
    }
    uint _240 = _238;
    uint _242 = min(_240, 2u);
    int _244 = int(_242) << 2;
    float _246 = _198 * _233;
    float _248 = _202 * _233;
    float _250 = _214 * _233;
    float _252 = _174 * _78;
    float _254 = _246 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _256 = uint(int(uint(_244) >> uint(2)));
    uint _258 = uint(int(uint(int(_256)) >> uint(2)));
    int _260 = int(_256) & 3;
    float _262 = (*spvDescriptorSet0.fp_c1)._m0[int(_258)][_260];
    float _264 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[35].x, _254);
    float _266 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[35].z, _264);
    float _268 = abs(_266);
    float _270 = -_268;
    float _272 = _270 + 1.0;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = _174 * _74;
    float _278 = abs(_274);
    float _280 = log2(_278);
    float _282 = _280 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _284 = exp2(_282);
    float _286 = _284 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _288 = fma(_248, _286, _252);
    float _290 = fma(_246, _286, _276);
    float _292 = fma(_250, _286, _174);
    bool _294 = as_type<int>(_262) == 1424;
    if (!_294)
    {
        bool _296 = as_type<int>(_262) == 1696;
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
            float _302 = _290 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _304 = _290 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _306 = _290 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _308 = _290 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _310 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[1].x, _302);
            float _312 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[0].x, _304);
            float _314 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[2].x, _306);
            float _316 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[3].x, _308);
            float _318 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[1].z, _310);
            float _320 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[0].z, _312);
            float _322 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[2].z, _314);
            float _324 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[3].z, _316);
            float _326 = _318 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _328 = _320 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _330 = _322 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _332 = _324 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _334 = _332;
            _336 = _328;
            _338 = _326;
            _340 = _330;
        }
    }
    if ((false || _300) || _298)
    {
        if ((!_300) || _298)
        {
            _298 = false;
            float _342 = _290 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _344 = _290 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _346 = _290 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _348 = _290 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _350 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[5].x, _342);
            float _352 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[4].x, _344);
            float _354 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[6].x, _346);
            float _356 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[7].x, _348);
            float _358 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[5].z, _350);
            float _360 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[4].z, _352);
            float _362 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[6].z, _354);
            float _364 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[7].z, _356);
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _334 = _372;
            _336 = _368;
            _338 = _366;
            _340 = _370;
        }
        if (false || _300)
        {
            _300 = false;
            float _374 = _290 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _376 = _290 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _378 = _290 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _380 = _290 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _382 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[9].x, _374);
            float _384 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[8].x, _376);
            float _386 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[10].x, _378);
            float _388 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[11].x, _380);
            float _390 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[9].z, _382);
            float _392 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[8].z, _384);
            float _394 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[10].z, _386);
            float _396 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[11].z, _388);
            float _398 = _390 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _400 = _392 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _402 = _394 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _404 = _396 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _334 = _404;
            _336 = _400;
            _338 = _398;
            _340 = _402;
        }
    }
    float _406 = _334;
    float _408 = _336;
    float _410 = _338;
    float _412 = _340;
    float _414 = -_276;
    float _416 = _414 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _418 = -_252;
    float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _422 = -_276;
    float _424 = _422 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _426 = 1.0 / _406;
    float _428 = _416 * _416;
    float _430 = -_174;
    float _432 = _430 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _434 = _424 * _424;
    float _436 = fma(_420, _420, _428);
    float _438 = -_252;
    float _440 = _438 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _442 = _276 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _444 = _276 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _446 = fma(_432, _432, _436);
    float _448 = -_174;
    float _450 = _448 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _452 = fma(_440, _440, _434);
    float _454 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[33].x, _442);
    float _456 = _276 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _458 = fma(_450, _450, _452);
    float _460 = sqrt(_446);
    float _462 = _276 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _464 = _276 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _466 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[33].z, _454);
    float _468 = _276 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _470 = _276 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _472 = _276 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _474 = _276 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _476 = sqrt(_458);
    float _478 = _276 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _480 = _276 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _482 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[19].x, _444);
    float _484 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[18].x, _456);
    float _486 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[27].x, _462);
    float _488 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[26].x, _464);
    float _490 = _426 * _408;
    bool _492 = _460 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _494 = _426 * _410;
    bool _496 = _460 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _498 = _426 * _412;
    float _500 = precise::clamp(_498, 0.0, 1.0);
    bool _502 = !_492;
    int _504 = _502 ? 0 : 1;
    float _506 = _276 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _508 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[28].x, _468);
    float _510 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[29].x, _470);
    bool _512 = _476 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _514 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[31].x, _472);
    bool _516 = _476 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _518 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[32].x, _474);
    bool _520 = !_512;
    int _522 = _520 ? 0 : 1;
    float _524 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[20].x, _478);
    int _526 = 2;
    int _528 = 2;
    if (!_492)
    {
        _526 = 1;
    }
    int _530 = _526;
    float _532 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[25].x, _480);
    int _534 = _530;
    if (!_496)
    {
        _534 = _504;
    }
    int _536 = _534;
    float _538 = _276 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _540 = float(int(_240));
    float _542 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[27].z, _486);
    float _544 = float(_536);
    float _546 = _276 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    if (!_512)
    {
        _528 = 1;
    }
    int _548 = _528;
    float _550 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[21].x, _538);
    int _552 = _548;
    if (!_516)
    {
        _552 = _522;
    }
    int _554 = _552;
    float _556 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[24].x, _546);
    float _558 = precise::min(_544, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _560 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[21].z, _550);
    float _562 = float(_554);
    float _564 = _276 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    bool _566 = _558 != 1.0;
    bool _568 = isnan(_558);
    bool _570 = _566 || _568;
    bool _572 = isnan(1.0);
    bool _574 = _570 || _572;
    float _576 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[19].z, _482);
    float _578 = precise::min(_562, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _580 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[30].x, _564);
    bool _582 = _558 != 0.0;
    bool _584 = isnan(_558);
    bool _586 = _582 || _584;
    bool _588 = isnan(0.0);
    bool _590 = _586 || _588;
    float _592 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[17].x, _506);
    bool _594 = _578 != 1.0;
    bool _596 = isnan(_578);
    bool _598 = _594 || _596;
    bool _600 = isnan(1.0);
    bool _602 = _598 || _600;
    float _604 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[30].z, _580);
    float _606 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[24].z, _556);
    bool _608 = _578 != 0.0;
    bool _610 = isnan(_578);
    bool _612 = _608 || _610;
    bool _614 = isnan(0.0);
    bool _616 = _612 || _614;
    float _618 = _560 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _620 = _276 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _622 = rint(_578);
    float _624 = precise::max(_622, 0.0);
    uint _626 = uint(_624);
    uint _628 = clamp(_626, 0u, 65535u);
    float _630 = _618;
    if (_574)
    {
        float _632 = _606 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _630 = _632;
    }
    float _634 = _630;
    float _636 = _276 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _638 = _604 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _640 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[22].x, _620);
    float _642 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[28].z, _508);
    float _644 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[23].x, _636);
    float _646 = _638;
    float _648 = _634;
    if (_602)
    {
        float _650 = _466 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _646 = _650;
    }
    float _652 = _646;
    float _654 = _276 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _656 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[22].z, _640);
    float _658 = rint(_558);
    float _660 = precise::max(_658, 0.0);
    uint _662 = uint(_660);
    uint _664 = clamp(_662, 0u, 65535u);
    float _666 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[29].z, _510);
    float _668 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[23].z, _644);
    float _670 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[31].z, _514);
    float _672 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[32].z, _518);
    float _674 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[16].x, _654);
    float _676 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[18].z, _484);
    float _678 = _652;
    if (!_616)
    {
        float _680 = _542 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _678 = _680;
    }
    float _682 = _678;
    float _684 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[20].z, _524);
    float _686 = _576 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _688 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[25].z, _532);
    float _690 = rint(_540);
    float _692 = precise::max(_690, 0.0);
    uint _694 = uint(_692);
    uint _696 = clamp(_694, 0u, 65535u);
    float _698 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[26].z, _488);
    float _700 = _686;
    if (_574)
    {
        float _702 = _656 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _700 = _702;
    }
    float _704 = _700;
    float _706 = _642 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _708 = _666 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _710 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[17].z, _592);
    float _712 = _706;
    float _714 = _708;
    float _716 = _704;
    if (_602)
    {
        float _718 = _670 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _712 = _718;
    }
    float _720 = _712;
    float _722 = _720;
    if (_602)
    {
        float _724 = _672 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _714 = _724;
    }
    float _726 = _714;
    float _728 = _726;
    if (!_590)
    {
        float _730 = _676 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _648 = _730;
    }
    float _732 = _648;
    float _734 = _684 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _736 = _734;
    if (!_616)
    {
        float _738 = _688 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _722 = _738;
    }
    float _740 = _722;
    float _742 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[16].z, _674);
    if (!_616)
    {
        float _744 = _698 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _728 = _744;
    }
    float _746 = _728;
    float _748 = 0.0 + _682;
    float _750 = precise::clamp(_748, 0.0, 1.0);
    if (_574)
    {
        float _752 = _668 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _736 = _752;
    }
    float _754 = _736;
    float _756 = _754;
    if (!_590)
    {
        float _758 = _710 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _756 = _758;
    }
    float _760 = _756;
    if (!_590)
    {
        float _762 = _742 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _716 = _762;
    }
    float _764 = _716;
    float _766 = 0.0 + _732;
    float _768 = precise::clamp(_766, 0.0, 1.0);
    float3 _2105 = float3(_740, _746, float(int(_628)));
    float3 _2109 = select(_2105, float3(0.0), isnan(_2105));
    float _770 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2109.xy, uint(rint(_2109.z)), _750);
    float3 _2118 = float3(_764, _760, float(int(_664)));
    float3 _2120 = select(_2118, float3(0.0), isnan(_2118));
    float _772 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2120.xy, uint(rint(_2120.z)), _768);
    float3 _2129 = float3(_490, _494, float(int(_696)));
    float3 _2131 = select(_2129, float3(0.0), isnan(_2129));
    float _774 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2131.xy, uint(rint(_2131.z)), _500);
    float _776 = -_174;
    float _778 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _780 = _776 + _778;
    float _782 = -_174;
    float _784 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _786 = _782 + _784;
    float _788 = _780 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _790 = precise::clamp(_788, 0.0, 1.0);
    float _792 = _786 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _794 = precise::clamp(_792, 0.0, 1.0);
    float _796 = _770 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _798 = fma(_772, (*spvDescriptorSet0.fp_c3)._m0[49].z, _796);
    float _800 = _774 + _790;
    float _802 = _798 + _794;
    out.m_49.x = _72;
    out.m_49.y = _800;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _802;
    return out;
}

