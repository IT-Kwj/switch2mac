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
    bool _290 = false;
    bool _288 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _805 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_805, float2(0.0), isnan(_805)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _822 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_822, float2(0.0), isnan(_822))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_822, float2(0.0), isnan(_822))).x;
    float2 _830 = float2(_56, _58);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_830, float2(0.0), isnan(_830))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_830, float2(0.0), isnan(_830))).x;
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
    bool _206 = !_186;
    uint _209 = uint(_206 ? 0 : 1);
    float _211 = _198 * _198;
    float _213 = -_204;
    float _215 = fma(_166, _178, _213);
    float _217 = fma(_202, _202, _211);
    float _219 = fma(_215, _215, _217);
    uint _221 = 2u;
    if (!_186)
    {
        _221 = 1u;
    }
    uint _223 = _221;
    uint _225 = _223;
    if (!_194)
    {
        _225 = _209;
    }
    uint _227 = _225;
    float _229 = rsqrt(_219);
    uint _231 = min(_227, 2u);
    int _234 = int(_231) << 2;
    float _236 = _198 * _229;
    float _238 = _202 * _229;
    float _240 = _215 * _229;
    float _242 = _174 * _78;
    float _244 = _236 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _246 = uint(int(uint(_234) >> uint(2)));
    uint _248 = uint(int(uint(int(_246)) >> uint(2)));
    int _250 = int(_246) & 3;
    float _252 = (*spvDescriptorSet0.fp_c1)._m0[int(_248)][_250];
    float _254 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[35].x, _244);
    float _256 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[35].z, _254);
    float _258 = abs(_256);
    float _260 = -_258;
    float _262 = _260 + 1.0;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = _174 * _74;
    float _268 = abs(_264);
    float _270 = log2(_268);
    float _272 = _270 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _274 = exp2(_272);
    float _276 = _274 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _278 = fma(_238, _276, _242);
    float _280 = fma(_236, _276, _266);
    float _282 = fma(_240, _276, _174);
    bool _284 = as_type<int>(_252) == 1376;
    if (!_284)
    {
        bool _286 = as_type<int>(_252) == 1648;
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
            float _292 = _280 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _294 = _280 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _296 = _280 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _298 = _280 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _300 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[1].x, _292);
            float _302 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[0].x, _294);
            float _304 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[2].x, _296);
            float _306 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[3].x, _298);
            float _308 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[1].z, _300);
            float _310 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[0].z, _302);
            float _312 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[2].z, _304);
            float _314 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[3].z, _306);
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _318 = _310 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _320 = _312 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _322 = _314 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _324 = _322;
            _326 = _318;
            _328 = _316;
            _330 = _320;
        }
    }
    if ((false || _290) || _288)
    {
        if ((!_290) || _288)
        {
            _288 = false;
            float _332 = _280 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _334 = _280 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _336 = _280 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _338 = _280 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _340 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[5].x, _332);
            float _342 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[4].x, _334);
            float _344 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[6].x, _336);
            float _346 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[7].x, _338);
            float _348 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[5].z, _340);
            float _350 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[4].z, _342);
            float _352 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[6].z, _344);
            float _354 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[7].z, _346);
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _358 = _350 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _360 = _352 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _362 = _354 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _324 = _362;
            _326 = _358;
            _328 = _356;
            _330 = _360;
        }
        if (false || _290)
        {
            _290 = false;
            float _364 = _280 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _366 = _280 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _368 = _280 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _370 = _280 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _372 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[9].x, _364);
            float _374 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[8].x, _366);
            float _376 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[10].x, _368);
            float _378 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[11].x, _370);
            float _380 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[9].z, _372);
            float _382 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[8].z, _374);
            float _384 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[10].z, _376);
            float _386 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[11].z, _378);
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _392 = _384 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _394 = _386 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _324 = _394;
            _326 = _390;
            _328 = _388;
            _330 = _392;
        }
    }
    float _396 = _324;
    float _398 = _326;
    float _400 = _328;
    float _402 = _330;
    float _404 = -_266;
    float _406 = _404 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _408 = -_242;
    float _410 = _408 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _412 = -_266;
    float _414 = _412 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _416 = 1.0 / _396;
    float _418 = _406 * _406;
    float _420 = -_174;
    float _422 = _420 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _424 = _414 * _414;
    float _426 = fma(_410, _410, _418);
    float _428 = -_242;
    float _430 = _428 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _432 = _266 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _434 = _266 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _436 = fma(_422, _422, _426);
    float _438 = -_174;
    float _440 = _438 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _442 = fma(_430, _430, _424);
    float _444 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[33].x, _432);
    float _446 = _266 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _448 = fma(_440, _440, _442);
    float _450 = sqrt(_436);
    float _452 = _266 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _454 = _266 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _456 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[33].z, _444);
    float _458 = _266 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _460 = _266 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _462 = _266 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _464 = _266 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _466 = sqrt(_448);
    float _468 = _266 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _470 = _266 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _472 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[19].x, _434);
    float _474 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[18].x, _446);
    float _476 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[27].x, _452);
    float _478 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[26].x, _454);
    float _480 = _416 * _398;
    bool _482 = _450 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _484 = _416 * _400;
    bool _486 = _450 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _488 = _416 * _402;
    float _490 = precise::clamp(_488, 0.0, 1.0);
    bool _492 = !_482;
    int _494 = _492 ? 0 : 1;
    float _496 = _266 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _498 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[28].x, _458);
    float _500 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[29].x, _460);
    bool _502 = _466 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _504 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[31].x, _462);
    bool _506 = _466 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _508 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[32].x, _464);
    bool _510 = !_502;
    int _512 = _510 ? 0 : 1;
    float _514 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[20].x, _468);
    int _516 = 2;
    int _518 = 2;
    if (!_482)
    {
        _516 = 1;
    }
    int _520 = _516;
    float _522 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[25].x, _470);
    int _524 = _520;
    if (!_486)
    {
        _524 = _494;
    }
    int _526 = _524;
    float _528 = _266 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _530 = float(int(_227));
    float _532 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[27].z, _476);
    float _534 = float(_526);
    float _536 = _266 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    if (!_502)
    {
        _518 = 1;
    }
    int _538 = _518;
    float _540 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[21].x, _528);
    int _542 = _538;
    if (!_506)
    {
        _542 = _512;
    }
    int _544 = _542;
    float _546 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[24].x, _536);
    float _548 = precise::min(_534, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _550 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[21].z, _540);
    float _552 = float(_544);
    float _554 = _266 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    bool _556 = _548 != 1.0;
    bool _558 = isnan(_548);
    bool _560 = _556 || _558;
    bool _562 = isnan(1.0);
    bool _564 = _560 || _562;
    float _566 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[19].z, _472);
    float _568 = precise::min(_552, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _570 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[30].x, _554);
    bool _572 = _548 != 0.0;
    bool _574 = isnan(_548);
    bool _576 = _572 || _574;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    float _582 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[17].x, _496);
    bool _584 = _568 != 1.0;
    bool _586 = isnan(_568);
    bool _588 = _584 || _586;
    bool _590 = isnan(1.0);
    bool _592 = _588 || _590;
    float _594 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[30].z, _570);
    float _596 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[24].z, _546);
    bool _598 = _568 != 0.0;
    bool _600 = isnan(_568);
    bool _602 = _598 || _600;
    bool _604 = isnan(0.0);
    bool _606 = _602 || _604;
    float _608 = _550 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _610 = _266 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _612 = rint(_568);
    float _614 = precise::max(_612, 0.0);
    uint _616 = uint(_614);
    uint _618 = clamp(_616, 0u, 65535u);
    float _620 = _608;
    if (_564)
    {
        float _622 = _596 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _620 = _622;
    }
    float _624 = _620;
    float _626 = _266 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _628 = _594 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _630 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[22].x, _610);
    float _632 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[28].z, _498);
    float _634 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[23].x, _626);
    float _636 = _628;
    float _638 = _624;
    if (_592)
    {
        float _640 = _456 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _636 = _640;
    }
    float _642 = _636;
    float _644 = _266 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _646 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[22].z, _630);
    float _648 = rint(_548);
    float _650 = precise::max(_648, 0.0);
    uint _652 = uint(_650);
    uint _654 = clamp(_652, 0u, 65535u);
    float _656 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[29].z, _500);
    float _658 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[23].z, _634);
    float _660 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[31].z, _504);
    float _662 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[32].z, _508);
    float _664 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[16].x, _644);
    float _666 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[18].z, _474);
    float _668 = _642;
    if (!_606)
    {
        float _670 = _532 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _668 = _670;
    }
    float _672 = _668;
    float _674 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[20].z, _514);
    float _676 = _566 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _678 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[25].z, _522);
    float _680 = rint(_530);
    float _682 = precise::max(_680, 0.0);
    uint _684 = uint(_682);
    uint _686 = clamp(_684, 0u, 65535u);
    float _688 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[26].z, _478);
    float _690 = _676;
    if (_564)
    {
        float _692 = _646 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _690 = _692;
    }
    float _694 = _690;
    float _696 = _632 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _698 = _656 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _700 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[17].z, _582);
    float _702 = _696;
    float _704 = _698;
    float _706 = _694;
    if (_592)
    {
        float _708 = _660 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _702 = _708;
    }
    float _710 = _702;
    float _712 = _710;
    if (_592)
    {
        float _714 = _662 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _704 = _714;
    }
    float _716 = _704;
    float _718 = _716;
    if (!_580)
    {
        float _720 = _666 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _638 = _720;
    }
    float _722 = _638;
    float _724 = _674 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _726 = _724;
    if (!_606)
    {
        float _728 = _678 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _712 = _728;
    }
    float _730 = _712;
    float _732 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[16].z, _664);
    if (!_606)
    {
        float _734 = _688 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _718 = _734;
    }
    float _736 = _718;
    float _738 = 0.0 + _672;
    float _740 = precise::clamp(_738, 0.0, 1.0);
    if (_564)
    {
        float _742 = _658 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _726 = _742;
    }
    float _744 = _726;
    float _746 = _744;
    if (!_580)
    {
        float _748 = _700 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _746 = _748;
    }
    float _750 = _746;
    if (!_580)
    {
        float _752 = _732 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _706 = _752;
    }
    float _754 = _706;
    float _756 = 0.0 + _722;
    float _758 = precise::clamp(_756, 0.0, 1.0);
    float3 _2079 = float3(_730, _736, float(int(_618)));
    float3 _2083 = select(_2079, float3(0.0), isnan(_2079));
    float _760 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2083.xy, uint(rint(_2083.z)), _740);
    float3 _2092 = float3(_754, _750, float(int(_654)));
    float3 _2094 = select(_2092, float3(0.0), isnan(_2092));
    float _762 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2094.xy, uint(rint(_2094.z)), _758);
    float3 _2103 = float3(_480, _484, float(int(_686)));
    float3 _2105 = select(_2103, float3(0.0), isnan(_2103));
    float _764 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2105.xy, uint(rint(_2105.z)), _490);
    float _766 = -_174;
    float _768 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _770 = _766 + _768;
    float _772 = -_174;
    float _774 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _776 = _772 + _774;
    float _778 = _770 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _780 = precise::clamp(_778, 0.0, 1.0);
    float _782 = _776 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _784 = precise::clamp(_782, 0.0, 1.0);
    float _786 = _760 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _788 = fma(_762, (*spvDescriptorSet0.fp_c3)._m0[49].z, _786);
    float _790 = _764 + _780;
    float _792 = _788 + _784;
    out.m_49.x = _72;
    out.m_49.y = _790;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _792;
    return out;
}

