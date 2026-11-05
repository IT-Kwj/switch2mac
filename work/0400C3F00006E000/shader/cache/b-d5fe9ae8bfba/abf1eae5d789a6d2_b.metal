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
    bool _286 = false;
    bool _284 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _801 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_801, float2(0.0), isnan(_801)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _818 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_818, float2(0.0), isnan(_818))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_818, float2(0.0), isnan(_818))).x;
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
    float _150 = 1.0 / _100;
    float _152 = fma(_126, _126, _142);
    float _154 = fma(_140, _140, _148);
    float _156 = fma(_146, _146, _154);
    float _158 = rsqrt(_152);
    float _160 = rsqrt(_156);
    float _162 = _122 * _158;
    float _164 = _126 * _158;
    float _166 = _118 * _158;
    float _168 = _146 * _160;
    float _170 = _140 * _160;
    float _172 = _136 * _160;
    float _174 = _162 * _168;
    float _176 = _164 * _172;
    float _178 = -_174;
    float _180 = fma(_164, _170, _178);
    float _182 = _166 * _170;
    float _184 = -_176;
    float _186 = fma(_166, _168, _184);
    float _188 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _190 = _150 * _188;
    float _192 = _180 * _180;
    float _194 = -_182;
    float _196 = fma(_162, _172, _194);
    float _198 = _190 * _74;
    float _200 = fma(_186, _186, _192);
    float _202 = -_190;
    bool _206 = _202 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _208 = _190 * _70;
    float _210 = -_190;
    bool _212 = _210 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _214 = fma(_196, _196, _200);
    bool _216 = !_206;
    uint _219 = uint(_216 ? 0 : 1);
    float _221 = rsqrt(_214);
    uint _223 = 2u;
    if (!_206)
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
    float _236 = _180 * _221;
    float _238 = _186 * _221;
    float _240 = _196 * _221;
    uint _242 = uint(int(uint(_234) >> uint(2)));
    uint _244 = uint(int(uint(int(_242)) >> uint(2)));
    int _246 = int(_242) & 3;
    float _248 = (*spvDescriptorSet0.fp_c1)._m0[int(_244)][_246];
    float _250 = _236 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _252 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[35].x, _250);
    float _254 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[35].z, _252);
    float _256 = abs(_254);
    float _258 = -_256;
    float _260 = _258 + 1.0;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = abs(_262);
    float _266 = log2(_264);
    float _268 = _266 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _270 = exp2(_268);
    float _272 = _270 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _274 = fma(_238, _272, _198);
    float _276 = fma(_236, _272, _208);
    float _278 = fma(_240, _272, _190);
    bool _280 = as_type<int>(_248) == 1344;
    if (!_280)
    {
        bool _282 = as_type<int>(_248) == 1616;
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
            _322 = _314;
            _324 = _312;
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
            _322 = _354;
            _324 = _352;
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
            _322 = _386;
            _324 = _384;
            _326 = _388;
        }
    }
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = _326;
    float _400 = -_208;
    float _402 = _400 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _404 = -_198;
    float _406 = _404 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _408 = -_208;
    float _410 = _408 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _412 = _402 * _402;
    float _414 = -_190;
    float _416 = _414 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _418 = _410 * _410;
    float _420 = 1.0 / _392;
    float _422 = fma(_406, _406, _412);
    float _424 = -_198;
    float _426 = _424 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _428 = _208 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _430 = _208 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _432 = fma(_416, _416, _422);
    float _434 = -_190;
    float _436 = _434 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _438 = fma(_426, _426, _418);
    float _440 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[33].x, _428);
    float _442 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[18].x, _430);
    float _444 = _208 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _446 = fma(_436, _436, _438);
    float _448 = sqrt(_432);
    float _450 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[33].z, _440);
    float _452 = _208 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _454 = _208 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _456 = _208 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _458 = _208 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _460 = _208 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _462 = sqrt(_446);
    float _464 = _208 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _466 = _208 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _468 = _208 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _470 = _208 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _472 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[20].x, _454);
    float _474 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[23].x, _456);
    float _476 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[25].x, _460);
    bool _478 = _448 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _480 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[26].x, _464);
    bool _482 = _448 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _484 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[27].x, _466);
    bool _486 = !_478;
    int _488 = _486 ? 0 : 1;
    float _490 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[28].x, _468);
    float _492 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[29].x, _470);
    float _494 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[27].z, _484);
    bool _496 = _462 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _498 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[28].z, _490);
    bool _500 = _462 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _502 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[29].z, _492);
    bool _504 = !_496;
    int _506 = _504 ? 0 : 1;
    float _508 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[20].z, _472);
    int _510 = 2;
    int _512 = 2;
    if (!_478)
    {
        _510 = 1;
    }
    int _514 = _510;
    float _516 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[25].z, _476);
    int _518 = _514;
    if (!_482)
    {
        _518 = _488;
    }
    int _520 = _518;
    float _522 = _208 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _524 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[26].z, _480);
    float _526 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[23].z, _474);
    float _528 = float(_520);
    float _530 = _208 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    if (!_496)
    {
        _512 = 1;
    }
    int _532 = _512;
    float _534 = _420 * _394;
    int _536 = _532;
    if (!_500)
    {
        _536 = _506;
    }
    int _538 = _536;
    float _540 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[21].x, _522);
    float _542 = precise::min(_528, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _544 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[24].x, _530);
    float _546 = float(_538);
    float _548 = _208 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    bool _550 = _542 != 1.0;
    bool _552 = isnan(_542);
    bool _554 = _550 || _552;
    bool _556 = isnan(1.0);
    bool _558 = _554 || _556;
    float _560 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[21].z, _540);
    float _562 = precise::min(_546, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _564 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[30].x, _548);
    float _566 = _208 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _568 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[24].z, _544);
    bool _570 = _562 != 1.0;
    bool _572 = isnan(_562);
    bool _574 = _570 || _572;
    bool _576 = isnan(1.0);
    bool _578 = _574 || _576;
    float _580 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[30].z, _564);
    float _582 = _208 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _584 = _208 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    bool _586 = _562 != 0.0;
    bool _588 = isnan(_562);
    bool _590 = _586 || _588;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    float _596 = _560 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _598 = _580 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _600 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[16].x, _566);
    bool _602 = _542 != 0.0;
    bool _604 = isnan(_542);
    bool _606 = _602 || _604;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    float _612 = _596;
    float _614 = _598;
    if (_558)
    {
        float _616 = _568 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _612 = _616;
    }
    float _618 = _612;
    float _620 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[18].z, _442);
    float _622 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[19].x, _444);
    float _624 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[22].x, _452);
    float _626 = _618;
    if (_578)
    {
        float _628 = _450 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _614 = _628;
    }
    float _630 = _614;
    float _632 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[17].x, _458);
    float _634 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[31].x, _582);
    float _636 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[32].x, _584);
    float _638 = _420 * _396;
    float _640 = float(int(_229));
    float _642 = rint(_562);
    float _644 = precise::max(_642, 0.0);
    uint _646 = uint(_644);
    uint _648 = clamp(_646, 0u, 65535u);
    float _650 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[19].z, _622);
    float _652 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[22].z, _624);
    float _654 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[31].z, _634);
    float _656 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[32].z, _636);
    float _658 = _630;
    if (!_594)
    {
        float _660 = _494 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _658 = _660;
    }
    float _662 = _658;
    float _664 = _650 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _666 = _664;
    if (!_610)
    {
        float _668 = _620 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _626 = _668;
    }
    float _670 = _626;
    float _672 = rint(_542);
    float _674 = precise::max(_672, 0.0);
    uint _676 = uint(_674);
    uint _678 = clamp(_676, 0u, 65535u);
    if (_558)
    {
        float _680 = _652 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _666 = _680;
    }
    float _682 = _666;
    float _684 = _498 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _686 = _502 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _688 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[17].z, _632);
    float _690 = _684;
    float _692 = _686;
    float _694 = _682;
    if (_578)
    {
        float _696 = _654 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _690 = _696;
    }
    float _698 = _690;
    float _700 = _698;
    if (_578)
    {
        float _702 = _656 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _692 = _702;
    }
    float _704 = _692;
    float _706 = _508 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _708 = rint(_640);
    float _710 = precise::max(_708, 0.0);
    uint _712 = uint(_710);
    uint _714 = clamp(_712, 0u, 65535u);
    float _716 = _704;
    float _718 = _706;
    if (!_594)
    {
        float _720 = _516 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _700 = _720;
    }
    float _722 = _700;
    float _724 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[16].z, _600);
    if (!_594)
    {
        float _726 = _524 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _716 = _726;
    }
    float _728 = _716;
    float _730 = 0.0 + _662;
    float _732 = precise::clamp(_730, 0.0, 1.0);
    if (_558)
    {
        float _734 = _526 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _718 = _734;
    }
    float _736 = _718;
    float _738 = _736;
    if (!_610)
    {
        float _740 = _688 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _738 = _740;
    }
    float _742 = _738;
    if (!_610)
    {
        float _744 = _724 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _694 = _744;
    }
    float _746 = _694;
    float _748 = 0.0 + _670;
    float _750 = precise::clamp(_748, 0.0, 1.0);
    float3 _2062 = float3(_722, _728, float(int(_648)));
    float3 _2066 = select(_2062, float3(0.0), isnan(_2062));
    float _752 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2066.xy, uint(rint(_2066.z)), _732);
    float _754 = _420 * _398;
    float _756 = precise::clamp(_754, 0.0, 1.0);
    float3 _2080 = float3(_746, _742, float(int(_678)));
    float3 _2082 = select(_2080, float3(0.0), isnan(_2080));
    float _758 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2082.xy, uint(rint(_2082.z)), _750);
    float3 _2091 = float3(_638, _534, float(int(_714)));
    float3 _2093 = select(_2091, float3(0.0), isnan(_2091));
    float _760 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2093.xy, uint(rint(_2093.z)), _756);
    float _762 = -_190;
    float _764 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _766 = _762 + _764;
    float _768 = -_190;
    float _770 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _772 = _768 + _770;
    float _774 = _766 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _776 = precise::clamp(_774, 0.0, 1.0);
    float _778 = _752 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _780 = fma(_758, (*spvDescriptorSet0.fp_c3)._m0[49].z, _778);
    float _782 = _772 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _784 = precise::clamp(_782, 0.0, 1.0);
    float _786 = _760 + _776;
    float _788 = _780 + _784;
    out.m_47.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_47.y = _786;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _788;
    return out;
}

