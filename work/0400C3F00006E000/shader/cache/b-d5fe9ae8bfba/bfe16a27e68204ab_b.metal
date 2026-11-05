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
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _296 = false;
    bool _294 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _893 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_893, float2(0.0), isnan(_893)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _910 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_910, float2(0.0), isnan(_910))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_910, float2(0.0), isnan(_910))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_42.y;
    float _74 = in.m_40.x;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_64;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = -_66;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = 1.0 / _84;
    float _96 = 1.0 / _88;
    float _98 = -_68;
    float _100 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _102 = 1.0 / _92;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = _94 * _104;
    float _108 = _70 * _106;
    float _110 = _74 * _106;
    float _112 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _114 = _96 * _112;
    float _116 = -_108;
    float _118 = fma(_114, _72, _116);
    float _120 = -_110;
    float _122 = fma(_114, _78, _120);
    float _124 = -_106;
    float _126 = _124 + _114;
    float _128 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _130 = _102 * _128;
    float _132 = _118 * _118;
    float _134 = -_108;
    float _136 = fma(_130, _76, _134);
    float _138 = -_110;
    float _140 = fma(_130, _80, _138);
    float _142 = fma(_122, _122, _132);
    float _144 = -_106;
    float _146 = _144 + _130;
    float _148 = _136 * _136;
    float _150 = fma(_126, _126, _142);
    float _152 = fma(_140, _140, _148);
    float _154 = 1.0 / _100;
    float _156 = fma(_146, _146, _152);
    float _158 = rsqrt(_150);
    float _160 = rsqrt(_156);
    float _162 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _164 = _154 * _162;
    float _166 = -_164;
    bool _170 = _166 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _172 = _122 * _158;
    float _174 = _126 * _158;
    float _176 = _118 * _158;
    float _178 = -_164;
    bool _180 = _178 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _182 = -_164;
    bool _184 = _182 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _186 = _146 * _160;
    float _188 = _136 * _160;
    float _190 = _140 * _160;
    float _192 = _172 * _186;
    float _194 = _174 * _188;
    float _196 = _176 * _190;
    float _198 = -_192;
    float _200 = fma(_174, _190, _198);
    float _202 = -_194;
    float _204 = fma(_176, _186, _202);
    float _206 = -_196;
    float _208 = fma(_172, _188, _206);
    float _210 = _200 * _200;
    int _213 = 2;
    if (!_170)
    {
        _213 = 1;
    }
    int _215 = _213;
    float _217 = fma(_204, _204, _210);
    bool _219 = !_170;
    int _221 = _219 ? 0 : 1;
    float _223 = fma(_208, _208, _217);
    int _225 = _215;
    if (!_180)
    {
        _225 = _221;
    }
    int _227 = _225;
    int _229 = _227 + 1;
    float _231 = rsqrt(_223);
    uint _234 = uint(_229);
    if (!_184)
    {
        _234 = uint(_227);
    }
    uint _236 = _234;
    uint _238 = min(_236, 2u);
    int _240 = int(_238) << 2;
    float _242 = _200 * _231;
    float _244 = _204 * _231;
    float _246 = _208 * _231;
    float _248 = _164 * _70;
    float _250 = _242 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _252 = uint(int(uint(_240) >> uint(2)));
    uint _254 = uint(int(uint(int(_252)) >> uint(2)));
    int _256 = int(_252) & 3;
    float _258 = (*spvDescriptorSet0.fp_c1)._m0[int(_254)][_256];
    float _260 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[35].x, _250);
    float _262 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[35].z, _260);
    float _264 = abs(_262);
    float _266 = -_264;
    float _268 = _266 + 1.0;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = _164 * _74;
    float _274 = abs(_270);
    float _276 = log2(_274);
    float _278 = _276 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _280 = exp2(_278);
    float _282 = _280 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _284 = fma(_244, _282, _272);
    float _286 = fma(_242, _282, _248);
    float _288 = fma(_246, _282, _164);
    bool _290 = as_type<int>(_258) == 1392;
    if (!_290)
    {
        bool _292 = as_type<int>(_258) == 1664;
        _294 = _292;
        if (!_294)
        {
            _296 = true;
        }
    }
    float _330;
    float _332;
    float _334;
    float _336;
    if (!_294)
    {
        if (!_296)
        {
            float _298 = _286 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _300 = _286 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _302 = _286 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _304 = _286 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _306 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[0].x, _298);
            float _308 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[1].x, _300);
            float _310 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[2].x, _302);
            float _312 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[3].x, _304);
            float _314 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[0].z, _306);
            float _316 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[1].z, _308);
            float _318 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[2].z, _310);
            float _320 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[3].z, _312);
            float _322 = _314 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _324 = _316 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _326 = _318 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _328 = _320 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _330 = _328;
            _332 = _322;
            _334 = _324;
            _336 = _326;
        }
    }
    if ((false || _296) || _294)
    {
        if ((!_296) || _294)
        {
            _294 = false;
            float _338 = _286 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _340 = _286 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _342 = _286 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _344 = _286 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _346 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[4].x, _338);
            float _348 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[5].x, _340);
            float _350 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[6].x, _342);
            float _352 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[7].x, _344);
            float _354 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[4].z, _346);
            float _356 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[5].z, _348);
            float _358 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[6].z, _350);
            float _360 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[7].z, _352);
            float _362 = _354 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _364 = _356 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _330 = _368;
            _332 = _362;
            _334 = _364;
            _336 = _366;
        }
        if (false || _296)
        {
            _296 = false;
            float _370 = _286 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _372 = _286 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _374 = _286 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _376 = _286 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _378 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[8].x, _370);
            float _380 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[9].x, _372);
            float _382 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[10].x, _374);
            float _384 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[11].x, _376);
            float _386 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[8].z, _378);
            float _388 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[9].z, _380);
            float _390 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[10].z, _382);
            float _392 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[11].z, _384);
            float _394 = _386 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _396 = _388 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _398 = _390 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _400 = _392 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _330 = _400;
            _332 = _394;
            _334 = _396;
            _336 = _398;
        }
    }
    float _402 = _330;
    float _404 = _332;
    float _406 = _334;
    float _408 = _336;
    float _410 = -_248;
    float _412 = _410 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _414 = -_272;
    float _416 = _414 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _418 = -_248;
    float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _422 = _248 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _424 = _412 * _412;
    float _426 = -_164;
    float _428 = _426 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _430 = _420 * _420;
    float _432 = -_164;
    float _434 = _432 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _436 = fma(_416, _416, _424);
    float _438 = _248 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _440 = _248 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _442 = _248 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _444 = fma(_428, _428, _436);
    float _446 = -_272;
    float _448 = _446 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _450 = _248 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _452 = _248 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _454 = _248 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _456 = fma(_448, _448, _430);
    float _458 = sqrt(_444);
    float _460 = _248 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _462 = fma(_434, _434, _456);
    float _464 = _248 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _466 = _248 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _468 = _248 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _470 = _248 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _472 = _248 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _474 = sqrt(_462);
    float _476 = _248 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _478 = _248 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _480 = _248 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _482 = _248 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _484 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[19].x, _438);
    float _486 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[20].x, _442);
    bool _488 = _458 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _490 = 1.0 / _402;
    bool _492 = _458 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _494 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[21].x, _452);
    bool _496 = !_488;
    int _498 = _496 ? 0 : 1;
    float _500 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[22].x, _440);
    float _502 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[23].x, _450);
    float _504 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[24].x, _454);
    float _506 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[19].z, _484);
    bool _508 = _474 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _510 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[20].z, _486);
    float _512 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[21].z, _494);
    float _514 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[29].x, _472);
    int _516 = 2;
    if (!_488)
    {
        _516 = 1;
    }
    int _518 = _516;
    float _520 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[22].z, _500);
    bool _522 = _474 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _524 = _248 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    int _526 = _518;
    if (!_492)
    {
        _526 = _498;
    }
    int _528 = _526;
    float _530 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[26].x, _422);
    bool _532 = !_508;
    int _534 = _532 ? 0 : 1;
    float _536 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[23].z, _502);
    float _538 = float(_528);
    float _540 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[24].z, _504);
    float _542 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[16].x, _460);
    float _544 = precise::min(_538, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _546 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[17].x, _464);
    int _548 = 2;
    if (!_508)
    {
        _548 = 1;
    }
    int _550 = _548;
    float _552 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[18].x, _466);
    int _554 = _550;
    if (!_522)
    {
        _554 = _534;
    }
    int _556 = _554;
    float _558 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[25].x, _468);
    bool _560 = _544 != 1.0;
    bool _562 = isnan(_544);
    bool _564 = _560 || _562;
    bool _566 = isnan(1.0);
    bool _568 = _564 || _566;
    float _570 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[27].x, _524);
    float _572 = float(_556);
    float _574 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[28].x, _470);
    float _576 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[30].x, _476);
    float _578 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[31].x, _478);
    float _580 = precise::min(_572, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _582 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[32].x, _480);
    float _584 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[33].x, _482);
    float _586 = _506 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _588 = _510 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _590 = _512 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _592 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[29].z, _514);
    float _594 = _586;
    float _596 = _588;
    float _598 = _590;
    if (_568)
    {
        float _600 = _520 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _594 = _600;
    }
    float _602 = _594;
    float _604 = _602;
    if (_568)
    {
        float _606 = _536 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _596 = _606;
    }
    float _608 = _596;
    float _610 = _608;
    if (_568)
    {
        float _612 = _540 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _598 = _612;
    }
    float _614 = _598;
    bool _616 = _580 != 1.0;
    bool _618 = isnan(_580);
    bool _620 = _616 || _618;
    bool _622 = isnan(1.0);
    bool _624 = _620 || _622;
    float _626 = _592 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    bool _628 = _544 != 0.0;
    bool _630 = isnan(_544);
    bool _632 = _628 || _630;
    bool _634 = isnan(0.0);
    bool _636 = _632 || _634;
    float _638 = _490 * _404;
    bool _640 = _580 != 0.0;
    bool _642 = isnan(_580);
    bool _644 = _640 || _642;
    bool _646 = isnan(0.0);
    bool _648 = _644 || _646;
    float _650 = _490 * _406;
    float _652 = _490 * _408;
    float _654 = precise::clamp(_652, 0.0, 1.0);
    float _656 = float(int(_236));
    float _658 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[30].z, _576);
    float _660 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[28].z, _574);
    float _662 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[33].z, _584);
    float _664 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[18].z, _552);
    float _666 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[31].z, _578);
    float _668 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[27].z, _570);
    float _670 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[32].z, _582);
    float _672 = _658 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _674 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[26].z, _530);
    float _676 = rint(_656);
    float _678 = precise::max(_676, 0.0);
    uint _680 = uint(_678);
    uint _682 = clamp(_680, 0u, 65535u);
    float _684 = _660 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _686 = _672;
    float _688 = _614;
    float _690 = _684;
    float _692 = _626;
    if (_624)
    {
        float _694 = _662 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _686 = _694;
    }
    float _696 = _686;
    float _698 = _696;
    if (!_636)
    {
        float _700 = _664 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _688 = _700;
    }
    float _702 = _688;
    if (_624)
    {
        float _704 = _666 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _690 = _704;
    }
    float _706 = _690;
    float _708 = _706;
    if (!_648)
    {
        float _710 = _668 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _698 = _710;
    }
    float _712 = _698;
    if (_624)
    {
        float _714 = _670 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _692 = _714;
    }
    float _716 = _692;
    float _718 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _654;
    float _720 = _716;
    if (!_648)
    {
        float _722 = _674 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _720 = _722;
    }
    float _724 = _720;
    float _726 = rint(_544);
    float _728 = precise::max(_726, 0.0);
    uint _730 = uint(_728);
    uint _732 = clamp(_730, 0u, 65535u);
    float _734 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[16].z, _542);
    float _736 = 0.0 + _702;
    float _738 = precise::clamp(_736, 0.0, 1.0);
    float _740 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _742 = 0.0 + _712;
    float _744 = precise::clamp(_742, 0.0, 1.0);
    float _746 = _718 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _748 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    if (!_636)
    {
        float _750 = _734 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _604 = _750;
    }
    float _752 = _604;
    float _754 = rint(_580);
    float _756 = precise::max(_754, 0.0);
    uint _758 = uint(_756);
    uint _760 = clamp(_758, 0u, 65535u);
    float _762 = _718 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _764 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[17].z, _546);
    float _766 = _740 * _744;
    float _768 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[25].z, _558);
    float _770 = fma(_746, 0.5, _638);
    float _772 = fma(_746, -0.5, _638);
    float _774 = _738 * _748;
    float _776 = fma(_762, 0.5, _650);
    float _778 = fma(_762, -0.5, _650);
    if (!_636)
    {
        float _780 = _764 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _610 = _780;
    }
    float _782 = _610;
    float _784 = _738 * _740;
    float _786 = fma(_766, 0.5, _724);
    if (!_648)
    {
        float _788 = _768 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _708 = _788;
    }
    float _790 = _708;
    float _792 = _748 * _744;
    float _794 = fma(_766, -0.5, _724);
    float _796 = fma(_774, 0.5, _752);
    float _798 = fma(_774, -0.5, _752);
    float _800 = fma(_784, 0.5, _782);
    float _802 = fma(_784, -0.5, _782);
    float _804 = fma(_792, 0.5, _790);
    float _806 = fma(_792, -0.5, _790);
    float3 _2249 = float3(_772, _776, float(int(_682)));
    float3 _2253 = select(_2249, float3(0.0), isnan(_2249));
    float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2253.xy, uint(rint(_2253.z)), _654);
    float3 _2262 = float3(_770, _776, float(int(_682)));
    float3 _2264 = select(_2262, float3(0.0), isnan(_2262));
    float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2264.xy, uint(rint(_2264.z)), _654);
    float3 _2273 = float3(_770, _778, float(int(_682)));
    float3 _2275 = select(_2273, float3(0.0), isnan(_2273));
    float _812 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2275.xy, uint(rint(_2275.z)), _654);
    float3 _2284 = float3(_772, _778, float(int(_682)));
    float3 _2286 = select(_2284, float3(0.0), isnan(_2284));
    float _814 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2286.xy, uint(rint(_2286.z)), _654);
    float3 _2295 = float3(_798, _800, float(int(_732)));
    float3 _2297 = select(_2295, float3(0.0), isnan(_2295));
    float _816 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2297.xy, uint(rint(_2297.z)), _738);
    float3 _2306 = float3(_796, _800, float(int(_732)));
    float3 _2308 = select(_2306, float3(0.0), isnan(_2306));
    float _818 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2308.xy, uint(rint(_2308.z)), _738);
    float3 _2317 = float3(_806, _786, float(int(_760)));
    float3 _2319 = select(_2317, float3(0.0), isnan(_2317));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2319.xy, uint(rint(_2319.z)), _744);
    float3 _2328 = float3(_804, _786, float(int(_760)));
    float3 _2330 = select(_2328, float3(0.0), isnan(_2328));
    float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2330.xy, uint(rint(_2330.z)), _744);
    float3 _2339 = float3(_796, _802, float(int(_732)));
    float3 _2341 = select(_2339, float3(0.0), isnan(_2339));
    float _824 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2341.xy, uint(rint(_2341.z)), _738);
    float3 _2350 = float3(_804, _794, float(int(_760)));
    float3 _2352 = select(_2350, float3(0.0), isnan(_2350));
    float _826 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2352.xy, uint(rint(_2352.z)), _744);
    float3 _2361 = float3(_798, _802, float(int(_732)));
    float3 _2363 = select(_2361, float3(0.0), isnan(_2361));
    float _828 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2363.xy, uint(rint(_2363.z)), _738);
    float3 _2372 = float3(_806, _794, float(int(_760)));
    float3 _2374 = select(_2372, float3(0.0), isnan(_2372));
    float _830 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2374.xy, uint(rint(_2374.z)), _744);
    float _832 = _810 + _808;
    float _834 = _832 + _812;
    float _836 = -_164;
    float _838 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _840 = _836 + _838;
    float _842 = -_164;
    float _844 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _846 = _842 + _844;
    float _848 = _834 + _814;
    float _850 = _840 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _852 = precise::clamp(_850, 0.0, 1.0);
    float _854 = _846 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _856 = precise::clamp(_854, 0.0, 1.0);
    float _858 = _818 + _816;
    float _860 = fma(_848, 0.25, _852);
    float _862 = _822 + _820;
    float _864 = _858 + _824;
    float _866 = _862 + _826;
    float _868 = _864 + _828;
    float _870 = _866 + _830;
    float _872 = _868 * 0.25;
    float _874 = _870 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _876 = _874 * 0.25;
    float _878 = fma(_872, (*spvDescriptorSet0.fp_c3)._m0[49].z, _876);
    float _880 = _878 + _856;
    out.m_47.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_47.y = _860;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _880;
    return out;
}

