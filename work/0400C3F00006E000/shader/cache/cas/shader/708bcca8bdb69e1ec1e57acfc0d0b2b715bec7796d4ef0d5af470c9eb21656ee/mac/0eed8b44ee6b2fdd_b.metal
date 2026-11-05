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
    texture2d_array<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
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
    float2 _811 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_811, float2(0.0), isnan(_811)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _828 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_828, float2(0.0), isnan(_828))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_828, float2(0.0), isnan(_828))).x;
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
    float _174 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _176 = _116 * _174;
    float _178 = _162 * _168;
    float _180 = _164 * _170;
    float _182 = _166 * _172;
    float _184 = _176 * _74;
    float _186 = -_178;
    float _188 = fma(_164, _172, _186);
    float _190 = -_180;
    float _192 = fma(_166, _168, _190);
    float _194 = -_182;
    float _196 = fma(_162, _170, _194);
    float _198 = -_176;
    bool _202 = _198 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _204 = _188 * _188;
    float _206 = -_176;
    bool _208 = _206 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _210 = _176 * _70;
    float _212 = -_176;
    bool _214 = _212 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _216 = fma(_192, _192, _204);
    float _218 = fma(_196, _196, _216);
    bool _220 = !_202;
    int _223 = _220 ? 0 : 1;
    float _225 = rsqrt(_218);
    int _227 = 2;
    if (!_202)
    {
        _227 = 1;
    }
    int _229 = _227;
    int _231 = _229;
    if (!_208)
    {
        _231 = _223;
    }
    int _233 = _231;
    int _235 = _233 + 1;
    uint _238 = uint(_235);
    if (!_214)
    {
        _238 = uint(_233);
    }
    uint _240 = _238;
    uint _242 = min(_240, 2u);
    float _244 = _188 * _225;
    float _246 = _192 * _225;
    int _248 = int(_242) << 2;
    float _250 = _196 * _225;
    float _252 = _244 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _254 = uint(int(uint(_248) >> uint(2)));
    uint _256 = uint(int(uint(int(_254)) >> uint(2)));
    int _258 = int(_254) & 3;
    float _260 = (*spvDescriptorSet0.fp_c1)._m0[int(_256)][_258];
    float _262 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[35].x, _252);
    float _264 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[35].z, _262);
    float _266 = abs(_264);
    float _268 = -_266;
    float _270 = _268 + 1.0;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = abs(_272);
    float _276 = log2(_274);
    float _278 = _276 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _280 = exp2(_278);
    float _282 = _280 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _284 = fma(_246, _282, _184);
    float _286 = fma(_244, _282, _210);
    float _288 = fma(_250, _282, _176);
    bool _290 = as_type<int>(_260) == 1392;
    if (!_290)
    {
        bool _292 = as_type<int>(_260) == 1664;
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
            _332 = _324;
            _334 = _322;
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
            _332 = _364;
            _334 = _362;
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
            _332 = _396;
            _334 = _394;
            _336 = _398;
        }
    }
    float _402 = _330;
    float _404 = _332;
    float _406 = _334;
    float _408 = _336;
    float _410 = -_210;
    float _412 = _410 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _414 = -_184;
    float _416 = _414 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _418 = -_210;
    float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _422 = _412 * _412;
    float _424 = -_176;
    float _426 = _424 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _428 = _420 * _420;
    float _430 = 1.0 / _402;
    float _432 = fma(_416, _416, _422);
    float _434 = -_184;
    float _436 = _434 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _438 = _210 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _440 = _210 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _442 = fma(_426, _426, _432);
    float _444 = -_176;
    float _446 = _444 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _448 = fma(_436, _436, _428);
    float _450 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[33].x, _438);
    float _452 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[18].x, _440);
    float _454 = _210 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _456 = fma(_446, _446, _448);
    float _458 = sqrt(_442);
    float _460 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[33].z, _450);
    float _462 = _210 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _464 = _210 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _466 = _210 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _468 = _210 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _470 = _210 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _472 = sqrt(_456);
    float _474 = _210 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _476 = _210 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _478 = _210 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _480 = _210 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _482 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[20].x, _464);
    float _484 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[23].x, _466);
    float _486 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[25].x, _470);
    bool _488 = _458 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _490 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[26].x, _474);
    bool _492 = _458 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _494 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[27].x, _476);
    bool _496 = !_488;
    int _498 = _496 ? 0 : 1;
    float _500 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[28].x, _478);
    float _502 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[29].x, _480);
    float _504 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[27].z, _494);
    bool _506 = _472 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _508 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[28].z, _500);
    bool _510 = _472 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _512 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[29].z, _502);
    bool _514 = !_506;
    int _516 = _514 ? 0 : 1;
    float _518 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[20].z, _482);
    int _520 = 2;
    int _522 = 2;
    if (!_488)
    {
        _520 = 1;
    }
    int _524 = _520;
    float _526 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[25].z, _486);
    int _528 = _524;
    if (!_492)
    {
        _528 = _498;
    }
    int _530 = _528;
    float _532 = _210 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _534 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[26].z, _490);
    float _536 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[23].z, _484);
    float _538 = float(_530);
    float _540 = _210 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    if (!_506)
    {
        _522 = 1;
    }
    int _542 = _522;
    float _544 = _430 * _404;
    int _546 = _542;
    if (!_510)
    {
        _546 = _516;
    }
    int _548 = _546;
    float _550 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[21].x, _532);
    float _552 = precise::min(_538, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _554 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[24].x, _540);
    float _556 = float(_548);
    float _558 = _210 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    bool _560 = _552 != 1.0;
    bool _562 = isnan(_552);
    bool _564 = _560 || _562;
    bool _566 = isnan(1.0);
    bool _568 = _564 || _566;
    float _570 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[21].z, _550);
    float _572 = precise::min(_556, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _574 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[30].x, _558);
    float _576 = _210 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _578 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[24].z, _554);
    bool _580 = _572 != 1.0;
    bool _582 = isnan(_572);
    bool _584 = _580 || _582;
    bool _586 = isnan(1.0);
    bool _588 = _584 || _586;
    float _590 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[30].z, _574);
    float _592 = _210 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _594 = _210 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    bool _596 = _572 != 0.0;
    bool _598 = isnan(_572);
    bool _600 = _596 || _598;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    float _606 = _570 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _608 = _590 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _610 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[16].x, _576);
    bool _612 = _552 != 0.0;
    bool _614 = isnan(_552);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    float _622 = _606;
    float _624 = _608;
    if (_568)
    {
        float _626 = _578 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _622 = _626;
    }
    float _628 = _622;
    float _630 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[18].z, _452);
    float _632 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[19].x, _454);
    float _634 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[22].x, _462);
    float _636 = _628;
    if (_588)
    {
        float _638 = _460 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _624 = _638;
    }
    float _640 = _624;
    float _642 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[17].x, _468);
    float _644 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[31].x, _592);
    float _646 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[32].x, _594);
    float _648 = _430 * _406;
    float _650 = float(int(_240));
    float _652 = rint(_572);
    float _654 = precise::max(_652, 0.0);
    uint _656 = uint(_654);
    uint _658 = clamp(_656, 0u, 65535u);
    float _660 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[19].z, _632);
    float _662 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[22].z, _634);
    float _664 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[31].z, _644);
    float _666 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[32].z, _646);
    float _668 = _640;
    if (!_604)
    {
        float _670 = _504 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _668 = _670;
    }
    float _672 = _668;
    float _674 = _660 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _676 = _674;
    if (!_620)
    {
        float _678 = _630 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _636 = _678;
    }
    float _680 = _636;
    float _682 = rint(_552);
    float _684 = precise::max(_682, 0.0);
    uint _686 = uint(_684);
    uint _688 = clamp(_686, 0u, 65535u);
    if (_568)
    {
        float _690 = _662 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _676 = _690;
    }
    float _692 = _676;
    float _694 = _508 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _696 = _512 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _698 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[17].z, _642);
    float _700 = _694;
    float _702 = _696;
    float _704 = _692;
    if (_588)
    {
        float _706 = _664 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _700 = _706;
    }
    float _708 = _700;
    float _710 = _708;
    if (_588)
    {
        float _712 = _666 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _702 = _712;
    }
    float _714 = _702;
    float _716 = _518 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _718 = rint(_650);
    float _720 = precise::max(_718, 0.0);
    uint _722 = uint(_720);
    uint _724 = clamp(_722, 0u, 65535u);
    float _726 = _714;
    float _728 = _716;
    if (!_604)
    {
        float _730 = _526 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _710 = _730;
    }
    float _732 = _710;
    float _734 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[16].z, _610);
    if (!_604)
    {
        float _736 = _534 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _726 = _736;
    }
    float _738 = _726;
    float _740 = 0.0 + _672;
    float _742 = precise::clamp(_740, 0.0, 1.0);
    if (_568)
    {
        float _744 = _536 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _728 = _744;
    }
    float _746 = _728;
    float _748 = _746;
    if (!_620)
    {
        float _750 = _698 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _748 = _750;
    }
    float _752 = _748;
    if (!_620)
    {
        float _754 = _734 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _704 = _754;
    }
    float _756 = _704;
    float _758 = 0.0 + _680;
    float _760 = precise::clamp(_758, 0.0, 1.0);
    float3 _2088 = float3(_732, _738, float(int(_658)));
    float3 _2092 = select(_2088, float3(0.0), isnan(_2088));
    float _762 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2092.xy, uint(rint(_2092.z)), _742);
    float _764 = _430 * _408;
    float _766 = precise::clamp(_764, 0.0, 1.0);
    float3 _2106 = float3(_756, _752, float(int(_688)));
    float3 _2108 = select(_2106, float3(0.0), isnan(_2106));
    float _768 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2108.xy, uint(rint(_2108.z)), _760);
    float3 _2117 = float3(_648, _544, float(int(_724)));
    float3 _2119 = select(_2117, float3(0.0), isnan(_2117));
    float _770 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2119.xy, uint(rint(_2119.z)), _766);
    float _772 = -_176;
    float _774 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _776 = _772 + _774;
    float _778 = -_176;
    float _780 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _782 = _778 + _780;
    float _784 = _776 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _786 = precise::clamp(_784, 0.0, 1.0);
    float _788 = _762 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _790 = fma(_768, (*spvDescriptorSet0.fp_c3)._m0[49].z, _788);
    float _792 = _782 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _794 = precise::clamp(_792, 0.0, 1.0);
    float _796 = _770 + _786;
    float _798 = _790 + _794;
    out.m_47.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_47.y = _796;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _798;
    return out;
}

