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
    bool _286 = false;
    bool _284 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _883 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_883, float2(0.0), isnan(_883)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _900 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_900, float2(0.0), isnan(_900))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_900, float2(0.0), isnan(_900))).x;
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
    float _116 = 1.0 / _100;
    float _118 = -_108;
    float _120 = fma(_114, _72, _118);
    float _122 = -_110;
    float _124 = fma(_114, _78, _122);
    float _126 = -_106;
    float _128 = _126 + _114;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _132 = _102 * _130;
    float _134 = _120 * _120;
    float _136 = -_108;
    float _138 = fma(_132, _76, _136);
    float _140 = -_110;
    float _142 = fma(_132, _80, _140);
    float _144 = fma(_124, _124, _134);
    float _146 = -_106;
    float _148 = _146 + _132;
    float _150 = _138 * _138;
    float _152 = fma(_128, _128, _144);
    float _154 = fma(_142, _142, _150);
    float _156 = fma(_148, _148, _154);
    float _158 = rsqrt(_152);
    float _160 = rsqrt(_156);
    float _162 = _124 * _158;
    float _164 = _128 * _158;
    float _166 = _120 * _158;
    float _168 = _148 * _160;
    float _170 = _138 * _160;
    float _172 = _142 * _160;
    float _174 = _162 * _168;
    float _176 = _164 * _170;
    float _178 = _166 * _172;
    float _180 = -_174;
    float _182 = fma(_164, _172, _180);
    float _184 = -_176;
    float _186 = fma(_166, _168, _184);
    float _188 = -_178;
    float _190 = fma(_162, _170, _188);
    float _192 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _194 = _116 * _192;
    float _196 = _182 * _182;
    float _198 = fma(_186, _186, _196);
    float _200 = -_194;
    bool _204 = _200 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _206 = -_194;
    bool _208 = _206 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _210 = fma(_190, _190, _198);
    bool _212 = !_204;
    uint _215 = uint(_212 ? 0 : 1);
    float _217 = rsqrt(_210);
    uint _219 = 2u;
    if (!_204)
    {
        _219 = 1u;
    }
    uint _221 = _219;
    uint _223 = _221;
    if (!_208)
    {
        _223 = _215;
    }
    uint _225 = _223;
    float _227 = _194 * _70;
    float _229 = _182 * _217;
    uint _231 = min(_225, 2u);
    float _233 = _186 * _217;
    float _235 = _190 * _217;
    float _237 = _229 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _240 = int(_231) << 2;
    float _242 = fma(_233, (*spvDescriptorSet0.fp_c3)._m0[35].x, _237);
    uint _244 = uint(int(uint(_240) >> uint(2)));
    uint _246 = uint(int(uint(int(_244)) >> uint(2)));
    int _248 = int(_244) & 3;
    float _250 = (*spvDescriptorSet0.fp_c1)._m0[int(_246)][_248];
    float _252 = fma(_235, (*spvDescriptorSet0.fp_c3)._m0[35].z, _242);
    float _254 = abs(_252);
    float _256 = -_254;
    float _258 = _256 + 1.0;
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = _194 * _74;
    float _264 = abs(_260);
    float _266 = log2(_264);
    float _268 = _266 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _270 = exp2(_268);
    float _272 = _270 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _274 = fma(_233, _272, _262);
    float _276 = fma(_229, _272, _227);
    float _278 = fma(_235, _272, _194);
    bool _280 = as_type<int>(_250) == 1344;
    if (!_280)
    {
        bool _282 = as_type<int>(_250) == 1616;
        _284 = _282;
        if (!_284)
        {
            _286 = true;
        }
    }
    float _320;
    float _322;
    float _324;
    float _326;
    if (!_284)
    {
        if (!_286)
        {
            float _288 = _276 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _290 = _276 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _292 = _276 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _294 = _276 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _296 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].x, _288);
            float _298 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[1].x, _290);
            float _300 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[2].x, _292);
            float _302 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[3].x, _294);
            float _304 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[0].z, _296);
            float _306 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[1].z, _298);
            float _308 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[2].z, _300);
            float _310 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[3].z, _302);
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _318 = _310 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _320 = _318;
            _322 = _312;
            _324 = _314;
            _326 = _316;
        }
    }
    if ((false || _286) || _284)
    {
        if ((!_286) || _284)
        {
            _284 = false;
            float _328 = _276 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _330 = _276 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _332 = _276 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _334 = _276 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _336 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[4].x, _328);
            float _338 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[5].x, _330);
            float _340 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[6].x, _332);
            float _342 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[7].x, _334);
            float _344 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[4].z, _336);
            float _346 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[5].z, _338);
            float _348 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[6].z, _340);
            float _350 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[7].z, _342);
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _358 = _350 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _320 = _358;
            _322 = _352;
            _324 = _354;
            _326 = _356;
        }
        if (false || _286)
        {
            _286 = false;
            float _360 = _276 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _362 = _276 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _364 = _276 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _366 = _276 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _368 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[8].x, _360);
            float _370 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[9].x, _362);
            float _372 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[10].x, _364);
            float _374 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[11].x, _366);
            float _376 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[8].z, _368);
            float _378 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[9].z, _370);
            float _380 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[10].z, _372);
            float _382 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[11].z, _374);
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _320 = _390;
            _322 = _384;
            _324 = _386;
            _326 = _388;
        }
    }
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = _326;
    float _400 = -_227;
    float _402 = _400 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _404 = -_262;
    float _406 = _404 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _408 = -_227;
    float _410 = _408 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _412 = _227 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _414 = _402 * _402;
    float _416 = -_194;
    float _418 = _416 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _420 = _410 * _410;
    float _422 = -_194;
    float _424 = _422 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _426 = fma(_406, _406, _414);
    float _428 = _227 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _430 = _227 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _432 = _227 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _434 = fma(_418, _418, _426);
    float _436 = -_262;
    float _438 = _436 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _440 = _227 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _442 = _227 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _444 = _227 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _446 = fma(_438, _438, _420);
    float _448 = sqrt(_434);
    float _450 = _227 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _452 = fma(_424, _424, _446);
    float _454 = _227 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _456 = _227 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _458 = _227 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _460 = _227 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _462 = _227 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _464 = sqrt(_452);
    float _466 = _227 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _468 = _227 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _470 = _227 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _472 = _227 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _474 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[19].x, _428);
    float _476 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[20].x, _432);
    bool _478 = _448 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _480 = 1.0 / _392;
    bool _482 = _448 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _484 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[21].x, _442);
    bool _486 = !_478;
    int _488 = _486 ? 0 : 1;
    float _490 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[22].x, _430);
    float _492 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[23].x, _440);
    float _494 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[24].x, _444);
    float _496 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[19].z, _474);
    bool _498 = _464 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _500 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[20].z, _476);
    float _502 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[21].z, _484);
    float _504 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[29].x, _462);
    int _506 = 2;
    if (!_478)
    {
        _506 = 1;
    }
    int _508 = _506;
    float _510 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[22].z, _490);
    bool _512 = _464 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _514 = _227 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    int _516 = _508;
    if (!_482)
    {
        _516 = _488;
    }
    int _518 = _516;
    float _520 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[26].x, _412);
    bool _522 = !_498;
    int _524 = _522 ? 0 : 1;
    float _526 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[23].z, _492);
    float _528 = float(_518);
    float _530 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[24].z, _494);
    float _532 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[16].x, _450);
    float _534 = precise::min(_528, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _536 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[17].x, _454);
    int _538 = 2;
    if (!_498)
    {
        _538 = 1;
    }
    int _540 = _538;
    float _542 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[18].x, _456);
    int _544 = _540;
    if (!_512)
    {
        _544 = _524;
    }
    int _546 = _544;
    float _548 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[25].x, _458);
    bool _550 = _534 != 1.0;
    bool _552 = isnan(_534);
    bool _554 = _550 || _552;
    bool _556 = isnan(1.0);
    bool _558 = _554 || _556;
    float _560 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[27].x, _514);
    float _562 = float(_546);
    float _564 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[28].x, _460);
    float _566 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[30].x, _466);
    float _568 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[31].x, _468);
    float _570 = precise::min(_562, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _572 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[32].x, _470);
    float _574 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[33].x, _472);
    float _576 = _496 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _578 = _500 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _580 = _502 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _582 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[29].z, _504);
    float _584 = _576;
    float _586 = _578;
    float _588 = _580;
    if (_558)
    {
        float _590 = _510 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _584 = _590;
    }
    float _592 = _584;
    float _594 = _592;
    if (_558)
    {
        float _596 = _526 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _586 = _596;
    }
    float _598 = _586;
    float _600 = _598;
    if (_558)
    {
        float _602 = _530 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _588 = _602;
    }
    float _604 = _588;
    bool _606 = _570 != 1.0;
    bool _608 = isnan(_570);
    bool _610 = _606 || _608;
    bool _612 = isnan(1.0);
    bool _614 = _610 || _612;
    float _616 = _582 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    bool _618 = _534 != 0.0;
    bool _620 = isnan(_534);
    bool _622 = _618 || _620;
    bool _624 = isnan(0.0);
    bool _626 = _622 || _624;
    float _628 = _480 * _394;
    bool _630 = _570 != 0.0;
    bool _632 = isnan(_570);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    float _640 = _480 * _396;
    float _642 = _480 * _398;
    float _644 = precise::clamp(_642, 0.0, 1.0);
    float _646 = float(int(_225));
    float _648 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[30].z, _566);
    float _650 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[28].z, _564);
    float _652 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[33].z, _574);
    float _654 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[18].z, _542);
    float _656 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[31].z, _568);
    float _658 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[27].z, _560);
    float _660 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[32].z, _572);
    float _662 = _648 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _664 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[26].z, _520);
    float _666 = rint(_646);
    float _668 = precise::max(_666, 0.0);
    uint _670 = uint(_668);
    uint _672 = clamp(_670, 0u, 65535u);
    float _674 = _650 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _676 = _662;
    float _678 = _604;
    float _680 = _674;
    float _682 = _616;
    if (_614)
    {
        float _684 = _652 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _676 = _684;
    }
    float _686 = _676;
    float _688 = _686;
    if (!_626)
    {
        float _690 = _654 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _678 = _690;
    }
    float _692 = _678;
    if (_614)
    {
        float _694 = _656 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _680 = _694;
    }
    float _696 = _680;
    float _698 = _696;
    if (!_638)
    {
        float _700 = _658 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _688 = _700;
    }
    float _702 = _688;
    if (_614)
    {
        float _704 = _660 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _682 = _704;
    }
    float _706 = _682;
    float _708 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _644;
    float _710 = _706;
    if (!_638)
    {
        float _712 = _664 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _710 = _712;
    }
    float _714 = _710;
    float _716 = rint(_534);
    float _718 = precise::max(_716, 0.0);
    uint _720 = uint(_718);
    uint _722 = clamp(_720, 0u, 65535u);
    float _724 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[16].z, _532);
    float _726 = 0.0 + _692;
    float _728 = precise::clamp(_726, 0.0, 1.0);
    float _730 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _732 = 0.0 + _702;
    float _734 = precise::clamp(_732, 0.0, 1.0);
    float _736 = _708 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _738 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    if (!_626)
    {
        float _740 = _724 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _594 = _740;
    }
    float _742 = _594;
    float _744 = rint(_570);
    float _746 = precise::max(_744, 0.0);
    uint _748 = uint(_746);
    uint _750 = clamp(_748, 0u, 65535u);
    float _752 = _708 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _754 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[17].z, _536);
    float _756 = _730 * _734;
    float _758 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[25].z, _548);
    float _760 = fma(_736, 0.5, _628);
    float _762 = fma(_736, -0.5, _628);
    float _764 = _728 * _738;
    float _766 = fma(_752, 0.5, _640);
    float _768 = fma(_752, -0.5, _640);
    if (!_626)
    {
        float _770 = _754 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _600 = _770;
    }
    float _772 = _600;
    float _774 = _728 * _730;
    float _776 = fma(_756, 0.5, _714);
    if (!_638)
    {
        float _778 = _758 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _698 = _778;
    }
    float _780 = _698;
    float _782 = _738 * _734;
    float _784 = fma(_756, -0.5, _714);
    float _786 = fma(_764, 0.5, _742);
    float _788 = fma(_764, -0.5, _742);
    float _790 = fma(_774, 0.5, _772);
    float _792 = fma(_774, -0.5, _772);
    float _794 = fma(_782, 0.5, _780);
    float _796 = fma(_782, -0.5, _780);
    float3 _2223 = float3(_762, _766, float(int(_672)));
    float3 _2227 = select(_2223, float3(0.0), isnan(_2223));
    float _798 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2227.xy, uint(rint(_2227.z)), _644);
    float3 _2236 = float3(_760, _766, float(int(_672)));
    float3 _2238 = select(_2236, float3(0.0), isnan(_2236));
    float _800 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2238.xy, uint(rint(_2238.z)), _644);
    float3 _2247 = float3(_760, _768, float(int(_672)));
    float3 _2249 = select(_2247, float3(0.0), isnan(_2247));
    float _802 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2249.xy, uint(rint(_2249.z)), _644);
    float3 _2258 = float3(_762, _768, float(int(_672)));
    float3 _2260 = select(_2258, float3(0.0), isnan(_2258));
    float _804 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2260.xy, uint(rint(_2260.z)), _644);
    float3 _2269 = float3(_788, _790, float(int(_722)));
    float3 _2271 = select(_2269, float3(0.0), isnan(_2269));
    float _806 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2271.xy, uint(rint(_2271.z)), _728);
    float3 _2280 = float3(_786, _790, float(int(_722)));
    float3 _2282 = select(_2280, float3(0.0), isnan(_2280));
    float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2282.xy, uint(rint(_2282.z)), _728);
    float3 _2291 = float3(_796, _776, float(int(_750)));
    float3 _2293 = select(_2291, float3(0.0), isnan(_2291));
    float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2293.xy, uint(rint(_2293.z)), _734);
    float3 _2302 = float3(_794, _776, float(int(_750)));
    float3 _2304 = select(_2302, float3(0.0), isnan(_2302));
    float _812 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2304.xy, uint(rint(_2304.z)), _734);
    float3 _2313 = float3(_786, _792, float(int(_722)));
    float3 _2315 = select(_2313, float3(0.0), isnan(_2313));
    float _814 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2315.xy, uint(rint(_2315.z)), _728);
    float3 _2324 = float3(_794, _784, float(int(_750)));
    float3 _2326 = select(_2324, float3(0.0), isnan(_2324));
    float _816 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2326.xy, uint(rint(_2326.z)), _734);
    float3 _2335 = float3(_788, _792, float(int(_722)));
    float3 _2337 = select(_2335, float3(0.0), isnan(_2335));
    float _818 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2337.xy, uint(rint(_2337.z)), _728);
    float3 _2346 = float3(_796, _784, float(int(_750)));
    float3 _2348 = select(_2346, float3(0.0), isnan(_2346));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2348.xy, uint(rint(_2348.z)), _734);
    float _822 = _800 + _798;
    float _824 = _822 + _802;
    float _826 = -_194;
    float _828 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _830 = _826 + _828;
    float _832 = -_194;
    float _834 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _836 = _832 + _834;
    float _838 = _824 + _804;
    float _840 = _830 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _842 = precise::clamp(_840, 0.0, 1.0);
    float _844 = _836 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _846 = precise::clamp(_844, 0.0, 1.0);
    float _848 = _808 + _806;
    float _850 = fma(_838, 0.25, _842);
    float _852 = _812 + _810;
    float _854 = _848 + _814;
    float _856 = _852 + _816;
    float _858 = _854 + _818;
    float _860 = _856 + _820;
    float _862 = _858 * 0.25;
    float _864 = _860 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _866 = _864 * 0.25;
    float _868 = fma(_862, (*spvDescriptorSet0.fp_c3)._m0[49].z, _866);
    float _870 = _868 + _846;
    out.m_47.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_47.y = _850;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _870;
    return out;
}

