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
    bool _288 = false;
    bool _286 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _887 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_887, float2(0.0), isnan(_887)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _904 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_904, float2(0.0), isnan(_904))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_904, float2(0.0), isnan(_904))).x;
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
    float _164 = _124 * _154;
    float _166 = 1.0 / _160;
    float _168 = _116 * _154;
    float _170 = _144 * _156;
    float _172 = _134 * _156;
    float _174 = _138 * _156;
    float _176 = _162 * _170;
    float _178 = _164 * _172;
    float _180 = -_176;
    float _182 = fma(_164, _174, _180);
    float _184 = _168 * _174;
    float _186 = -_178;
    float _188 = fma(_168, _170, _186);
    float _190 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _192 = _166 * _190;
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
    bool _216 = !_208;
    uint _219 = uint(_216 ? 0 : 1);
    float _221 = rsqrt(_214);
    uint _223 = 2u;
    if (!_208)
    {
        _223 = 1u;
    }
    uint _225 = _223;
    uint _227 = _225;
    if (!_212)
    {
        _227 = _219;
    }
    uint _229 = _227;
    uint _231 = min(_229, 2u);
    int _234 = int(_231) << 2;
    float _236 = _182 * _221;
    float _238 = _188 * _221;
    float _240 = _198 * _221;
    float _242 = _236 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _244 = uint(int(uint(_234) >> uint(2)));
    uint _246 = uint(int(uint(int(_244)) >> uint(2)));
    int _248 = int(_244) & 3;
    float _250 = (*spvDescriptorSet0.fp_c1)._m0[int(_246)][_248];
    float _252 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[35].x, _242);
    float _254 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[35].z, _252);
    float _256 = abs(_254);
    float _258 = -_256;
    float _260 = _258 + 1.0;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = _192 * _76;
    float _266 = abs(_262);
    float _268 = log2(_266);
    float _270 = _268 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _272 = exp2(_270);
    float _274 = _272 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _276 = fma(_238, _274, _264);
    float _278 = fma(_236, _274, _200);
    float _280 = fma(_240, _274, _192);
    bool _282 = as_type<int>(_250) == 1344;
    if (!_282)
    {
        bool _284 = as_type<int>(_250) == 1616;
        _286 = _284;
        if (!_286)
        {
            _288 = true;
        }
    }
    float _322;
    float _324;
    float _326;
    float _328;
    if (!_286)
    {
        if (!_288)
        {
            float _290 = _278 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _292 = _278 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _294 = _278 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _296 = _278 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _298 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[0].x, _290);
            float _300 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[1].x, _292);
            float _302 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[2].x, _294);
            float _304 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[3].x, _296);
            float _306 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[0].z, _298);
            float _308 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[1].z, _300);
            float _310 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[2].z, _302);
            float _312 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[3].z, _304);
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _318 = _310 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _320 = _312 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _322 = _320;
            _324 = _318;
            _326 = _314;
            _328 = _316;
        }
    }
    if ((false || _288) || _286)
    {
        if ((!_288) || _286)
        {
            _286 = false;
            float _330 = _278 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _332 = _278 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _334 = _278 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _336 = _278 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _338 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[4].x, _330);
            float _340 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[5].x, _332);
            float _342 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[6].x, _334);
            float _344 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[7].x, _336);
            float _346 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[4].z, _338);
            float _348 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[5].z, _340);
            float _350 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[6].z, _342);
            float _352 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[7].z, _344);
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _358 = _350 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _360 = _352 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _322 = _360;
            _324 = _358;
            _326 = _354;
            _328 = _356;
        }
        if (false || _288)
        {
            _288 = false;
            float _362 = _278 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _364 = _278 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _366 = _278 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _368 = _278 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _370 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[8].x, _362);
            float _372 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[9].x, _364);
            float _374 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[10].x, _366);
            float _376 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[11].x, _368);
            float _378 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[8].z, _370);
            float _380 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[9].z, _372);
            float _382 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[10].z, _374);
            float _384 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[11].z, _376);
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _392 = _384 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _322 = _392;
            _324 = _390;
            _326 = _386;
            _328 = _388;
        }
    }
    float _394 = _322;
    float _396 = _324;
    float _398 = _326;
    float _400 = _328;
    float _402 = 1.0 / _394;
    float _404 = float(int(_229));
    float _406 = rint(_404);
    float _408 = precise::max(_406, 0.0);
    uint _410 = uint(_408);
    uint _412 = clamp(_410, 0u, 65535u);
    float _414 = _402 * _396;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = _402 * _398;
    float _420 = _402 * _400;
    float _422 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _416;
    float _424 = _422 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _426 = _422 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _428 = fma(_424, -0.5, _418);
    float _430 = fma(_426, 0.5, _420);
    float3 _1561 = float3(_428, _430, float(int(_412)));
    float3 _1565 = select(_1561, float3(0.0), isnan(_1561));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1565.xy, uint(rint(_1565.z)), _416);
    float _434 = -_200;
    float _436 = _434 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _438 = -_264;
    float _440 = _438 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _442 = -_192;
    float _444 = _442 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _446 = _200 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _448 = _436 * _436;
    float _450 = -_192;
    float _452 = _450 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _454 = _200 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _456 = _200 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _458 = fma(_440, _440, _448);
    float _460 = -_264;
    float _462 = _460 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _464 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[19].x, _454);
    float _466 = _200 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _468 = fma(_452, _452, _458);
    float _470 = -_200;
    float _472 = _470 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _474 = _200 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _476 = _200 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _478 = _200 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _480 = _200 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _482 = sqrt(_468);
    float _484 = _472 * _472;
    float _486 = _200 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _488 = _200 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _490 = fma(_462, _462, _484);
    float _492 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[22].x, _446);
    float _494 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[23].x, _456);
    float _496 = _200 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _498 = fma(_444, _444, _490);
    float _500 = _200 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _502 = _200 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _504 = _200 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _506 = _200 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _508 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[19].z, _464);
    float _510 = sqrt(_498);
    bool _512 = _482 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _514 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[21].x, _466);
    bool _516 = _482 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _518 = _200 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _520 = !_512;
    int _522 = _520 ? 0 : 1;
    float _524 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[22].z, _492);
    float _526 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[16].x, _474);
    float _528 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[24].x, _518);
    float _530 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[17].x, _476);
    float _532 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[18].x, _478);
    float _534 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[25].x, _500);
    float _536 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[26].x, _480);
    float _538 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[27].x, _486);
    int _540 = 2;
    if (!_512)
    {
        _540 = 1;
    }
    int _542 = _540;
    float _544 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[28].x, _488);
    int _546 = _542;
    if (!_516)
    {
        _546 = _522;
    }
    int _548 = _546;
    float _550 = _200 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _552 = _510 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _554 = _200 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _556 = float(_548);
    float _558 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[20].x, _550);
    bool _560 = _510 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _562 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[29].x, _496);
    float _564 = precise::min(_556, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _566 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[30].x, _502);
    bool _568 = !_552;
    int _570 = _568 ? 0 : 1;
    float _572 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[31].x, _504);
    bool _574 = _564 != 1.0;
    bool _576 = isnan(_564);
    bool _578 = _574 || _576;
    bool _580 = isnan(1.0);
    bool _582 = _578 || _580;
    float _584 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[32].x, _506);
    float _586 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[33].x, _554);
    int _588 = 2;
    if (!_552)
    {
        _588 = 1;
    }
    int _590 = _588;
    float _592 = _508 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _594 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[20].z, _558);
    int _596 = _590;
    float _598 = _592;
    if (!_560)
    {
        _596 = _570;
    }
    int _600 = _596;
    float _602 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[21].z, _514);
    float _604 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[23].z, _494);
    float _606 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[18].z, _532);
    float _608 = float(_600);
    float _610 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[28].z, _544);
    if (_582)
    {
        float _612 = _524 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _598 = _612;
    }
    float _614 = _598;
    float _616 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[24].z, _528);
    float _618 = _594 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _620 = precise::min(_608, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _622 = _602 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _624 = _618;
    float _626 = _622;
    float _628 = _614;
    if (_582)
    {
        float _630 = _604 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _624 = _630;
    }
    float _632 = _624;
    float _634 = _632;
    if (_582)
    {
        float _636 = _616 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _626 = _636;
    }
    float _638 = _626;
    bool _640 = _564 != 0.0;
    bool _642 = isnan(_564);
    bool _644 = _640 || _642;
    bool _646 = isnan(0.0);
    bool _648 = _644 || _646;
    float _650 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[31].z, _572);
    bool _652 = _620 != 1.0;
    bool _654 = isnan(_620);
    bool _656 = _652 || _654;
    bool _658 = isnan(1.0);
    bool _660 = _656 || _658;
    float _662 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[25].z, _534);
    bool _664 = _620 != 0.0;
    bool _666 = isnan(_620);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    float _674 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[29].z, _562);
    float _676 = _610 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _678 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[32].z, _584);
    float _680 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[30].z, _566);
    float _682 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[26].z, _536);
    float _684 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[33].z, _586);
    float _686 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[16].z, _526);
    float _688 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _690 = _638;
    float _692 = _676;
    if (!_648)
    {
        float _694 = _606 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _690 = _694;
    }
    float _696 = _690;
    float _698 = _674 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _700 = _698;
    if (_660)
    {
        float _702 = _650 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _692 = _702;
    }
    float _704 = _692;
    float _706 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[27].z, _538);
    float _708 = _704;
    if (!_672)
    {
        float _710 = _662 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _708 = _710;
    }
    float _712 = _708;
    float _714 = 0.0 + _696;
    float _716 = precise::clamp(_714, 0.0, 1.0);
    if (_660)
    {
        float _718 = _678 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _700 = _718;
    }
    float _720 = _700;
    float _722 = _680 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _724 = _720;
    float _726 = _722;
    if (!_672)
    {
        float _728 = _682 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _724 = _728;
    }
    float _730 = _724;
    float _732 = fma(_424, 0.5, _418);
    if (_660)
    {
        float _734 = _684 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _726 = _734;
    }
    float _736 = _726;
    float _738 = _736;
    if (!_648)
    {
        float _740 = _686 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _628 = _740;
    }
    float _742 = _628;
    float _744 = rint(_564);
    float _746 = precise::max(_744, 0.0);
    uint _748 = uint(_746);
    uint _750 = clamp(_748, 0u, 65535u);
    float _752 = _716 * _688;
    if (!_672)
    {
        float _754 = _706 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _738 = _754;
    }
    float _756 = _738;
    float _758 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[17].z, _530);
    float _760 = fma(_426, -0.5, _420);
    float _762 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _764 = fma(_752, 0.5, _742);
    float _766 = 0.0 + _756;
    float _768 = precise::clamp(_766, 0.0, 1.0);
    float _770 = fma(_752, -0.5, _742);
    if (!_648)
    {
        float _772 = _758 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _634 = _772;
    }
    float _774 = _634;
    float _776 = rint(_620);
    float _778 = precise::max(_776, 0.0);
    uint _780 = uint(_778);
    uint _782 = clamp(_780, 0u, 65535u);
    float _784 = _716 * _762;
    float _786 = _688 * _768;
    float _788 = _762 * _768;
    float _790 = fma(_784, 0.5, _774);
    float _792 = fma(_784, -0.5, _774);
    float _794 = fma(_786, 0.5, _712);
    float _796 = fma(_786, -0.5, _712);
    float _798 = fma(_788, 0.5, _730);
    float _800 = fma(_788, -0.5, _730);
    float3 _2240 = float3(_732, _430, float(int(_412)));
    float3 _2242 = select(_2240, float3(0.0), isnan(_2240));
    float _802 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2242.xy, uint(rint(_2242.z)), _416);
    float3 _2251 = float3(_732, _760, float(int(_412)));
    float3 _2253 = select(_2251, float3(0.0), isnan(_2251));
    float _804 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2253.xy, uint(rint(_2253.z)), _416);
    float3 _2262 = float3(_428, _760, float(int(_412)));
    float3 _2264 = select(_2262, float3(0.0), isnan(_2262));
    float _806 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2264.xy, uint(rint(_2264.z)), _416);
    float3 _2273 = float3(_770, _790, float(int(_750)));
    float3 _2275 = select(_2273, float3(0.0), isnan(_2273));
    float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2275.xy, uint(rint(_2275.z)), _716);
    float3 _2284 = float3(_764, _790, float(int(_750)));
    float3 _2286 = select(_2284, float3(0.0), isnan(_2284));
    float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2286.xy, uint(rint(_2286.z)), _716);
    float3 _2295 = float3(_764, _792, float(int(_750)));
    float3 _2297 = select(_2295, float3(0.0), isnan(_2295));
    float _812 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2297.xy, uint(rint(_2297.z)), _716);
    float3 _2306 = float3(_770, _792, float(int(_750)));
    float3 _2308 = select(_2306, float3(0.0), isnan(_2306));
    float _814 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2308.xy, uint(rint(_2308.z)), _716);
    float3 _2317 = float3(_796, _798, float(int(_782)));
    float3 _2319 = select(_2317, float3(0.0), isnan(_2317));
    float _816 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2319.xy, uint(rint(_2319.z)), _768);
    float3 _2328 = float3(_794, _798, float(int(_782)));
    float3 _2330 = select(_2328, float3(0.0), isnan(_2328));
    float _818 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2330.xy, uint(rint(_2330.z)), _768);
    float3 _2339 = float3(_794, _800, float(int(_782)));
    float3 _2341 = select(_2339, float3(0.0), isnan(_2339));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2341.xy, uint(rint(_2341.z)), _768);
    float3 _2350 = float3(_796, _800, float(int(_782)));
    float3 _2352 = select(_2350, float3(0.0), isnan(_2350));
    float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2352.xy, uint(rint(_2352.z)), _768);
    float2 _2358 = float2(_56, _58);
    float _824 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2358, float2(0.0), isnan(_2358))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2358, float2(0.0), isnan(_2358))).x;
    float _826 = -_192;
    float _828 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _830 = _826 + _828;
    float _832 = -_192;
    float _834 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _836 = _832 + _834;
    float _838 = _830 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _840 = precise::clamp(_838, 0.0, 1.0);
    float _842 = _802 + _432;
    float _844 = _842 + _804;
    float _846 = _844 + _806;
    float _848 = _810 + _808;
    float _850 = fma(_846, 0.25, _840);
    float _852 = _848 + _812;
    float _854 = _818 + _816;
    float _856 = _852 + _814;
    float _858 = _856 * 0.25;
    float _860 = _854 + _820;
    float _862 = _860 + _822;
    float _864 = _862 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _866 = _864 * 0.25;
    float _868 = fma(_858, (*spvDescriptorSet0.fp_c3)._m0[49].z, _866);
    float _870 = _836 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _872 = precise::clamp(_870, 0.0, 1.0);
    float _874 = _868 + _872;
    out.m_49.x = _824;
    out.m_49.y = _850;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _874;
    return out;
}

