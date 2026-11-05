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
    bool _270 = false;
    bool _268 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _785 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_785, float2(0.0), isnan(_785)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _802 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_802, float2(0.0), isnan(_802))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_802, float2(0.0), isnan(_802))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].z, _84);
    float _88 = -_64;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_66;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = _70 * _86;
    float _102 = _72 * _86;
    float _104 = -_68;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[46].z, _106);
    float _110 = -_100;
    float _112 = fma(_92, _74, _110);
    float _114 = -_100;
    float _116 = fma(_98, _76, _114);
    float _118 = -_102;
    float _120 = fma(_92, _78, _118);
    float _122 = -_102;
    float _124 = fma(_98, _80, _122);
    float _126 = _112 * _112;
    float _128 = _116 * _116;
    float _130 = -_86;
    float _132 = _130 + _92;
    float _134 = -_86;
    float _136 = _134 + _98;
    float _138 = fma(_120, _120, _126);
    float _140 = fma(_124, _124, _128);
    float _142 = -_108;
    bool _146 = _142 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _148 = _108 * _72;
    float _150 = fma(_132, _132, _138);
    float _152 = fma(_136, _136, _140);
    float _154 = -_108;
    bool _156 = _154 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _158 = _108 * _70;
    float _160 = rsqrt(_150);
    float _162 = rsqrt(_152);
    float _164 = _120 * _160;
    float _166 = _132 * _160;
    float _168 = _112 * _160;
    float _170 = _136 * _162;
    float _172 = _116 * _162;
    float _174 = _124 * _162;
    float _176 = _164 * _170;
    float _178 = _166 * _172;
    float _180 = -_176;
    float _182 = fma(_166, _174, _180);
    float _184 = _168 * _174;
    float _186 = -_178;
    float _188 = fma(_168, _170, _186);
    bool _190 = !_146;
    uint _193 = uint(_190 ? 0 : 1);
    float _195 = _182 * _182;
    float _197 = -_184;
    float _199 = fma(_164, _172, _197);
    float _201 = fma(_188, _188, _195);
    float _203 = fma(_199, _199, _201);
    uint _205 = 2u;
    if (!_146)
    {
        _205 = 1u;
    }
    uint _207 = _205;
    uint _209 = _207;
    if (!_156)
    {
        _209 = _193;
    }
    uint _211 = _209;
    float _213 = rsqrt(_203);
    uint _215 = min(_211, 2u);
    int _218 = int(_215) << 2;
    uint _220 = uint(int(uint(_218) >> uint(2)));
    uint _222 = uint(int(uint(int(_220)) >> uint(2)));
    int _224 = int(_220) & 3;
    float _226 = (*spvDescriptorSet0.fp_c1)._m0[int(_222)][_224];
    float _228 = _182 * _213;
    float _230 = _188 * _213;
    float _232 = _199 * _213;
    float _234 = _228 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _236 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[35].x, _234);
    float _238 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[35].z, _236);
    float _240 = abs(_238);
    float _242 = -_240;
    float _244 = _242 + 1.0;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = abs(_246);
    float _250 = log2(_248);
    float _252 = _250 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _254 = exp2(_252);
    float _256 = _254 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _258 = fma(_230, _256, _148);
    float _260 = fma(_228, _256, _158);
    float _262 = fma(_232, _256, _108);
    bool _264 = as_type<int>(_226) == 1200;
    if (!_264)
    {
        bool _266 = as_type<int>(_226) == 1472;
        _268 = _266;
        if (!_268)
        {
            _270 = true;
        }
    }
    float _304;
    float _306;
    float _308;
    float _310;
    if (!_268)
    {
        if (!_270)
        {
            float _272 = _260 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _274 = _260 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _276 = _260 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _278 = _260 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _280 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].x, _272);
            float _282 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[1].x, _274);
            float _284 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[2].x, _276);
            float _286 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[3].x, _278);
            float _288 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].z, _280);
            float _290 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[1].z, _282);
            float _292 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[2].z, _284);
            float _294 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[3].z, _286);
            float _296 = _288 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _302 = _294 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _304 = _302;
            _306 = _298;
            _308 = _296;
            _310 = _300;
        }
    }
    if ((false || _270) || _268)
    {
        if ((!_270) || _268)
        {
            _268 = false;
            float _312 = _260 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _314 = _260 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _316 = _260 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _318 = _260 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _320 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[4].x, _312);
            float _322 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[5].x, _314);
            float _324 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[6].x, _316);
            float _326 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[7].x, _318);
            float _328 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[4].z, _320);
            float _330 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[5].z, _322);
            float _332 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[6].z, _324);
            float _334 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[7].z, _326);
            float _336 = _328 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _338 = _330 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _342 = _334 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _304 = _342;
            _306 = _338;
            _308 = _336;
            _310 = _340;
        }
        if (false || _270)
        {
            _270 = false;
            float _344 = _260 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _346 = _260 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _348 = _260 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _350 = _260 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _352 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[8].x, _344);
            float _354 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[9].x, _346);
            float _356 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[10].x, _348);
            float _358 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[11].x, _350);
            float _360 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[8].z, _352);
            float _362 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[9].z, _354);
            float _364 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[10].z, _356);
            float _366 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[11].z, _358);
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _374 = _366 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _304 = _374;
            _306 = _370;
            _308 = _368;
            _310 = _372;
        }
    }
    float _376 = _304;
    float _378 = _306;
    float _380 = _308;
    float _382 = _310;
    float _384 = -_158;
    float _386 = _384 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _388 = -_148;
    float _390 = _388 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _392 = -_158;
    float _394 = _392 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _396 = _386 * _386;
    float _398 = -_108;
    float _400 = _398 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _402 = _394 * _394;
    float _404 = 1.0 / _376;
    float _406 = fma(_390, _390, _396);
    float _408 = -_148;
    float _410 = _408 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _412 = _158 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _414 = _158 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _416 = fma(_400, _400, _406);
    float _418 = -_108;
    float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _422 = fma(_410, _410, _402);
    float _424 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[33].x, _412);
    float _426 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[18].x, _414);
    float _428 = _158 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _430 = fma(_420, _420, _422);
    float _432 = sqrt(_416);
    float _434 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[33].z, _424);
    float _436 = _158 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _438 = _158 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _440 = _158 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _442 = _158 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _444 = _158 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _446 = sqrt(_430);
    float _448 = _158 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _450 = _158 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _452 = _158 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _454 = _158 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _456 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[20].x, _438);
    float _458 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[23].x, _440);
    float _460 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[25].x, _444);
    bool _462 = _432 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _464 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[26].x, _448);
    bool _466 = _432 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _468 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[27].x, _450);
    bool _470 = !_462;
    int _472 = _470 ? 0 : 1;
    float _474 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[28].x, _452);
    float _476 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[29].x, _454);
    float _478 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[27].z, _468);
    bool _480 = _446 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _482 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[28].z, _474);
    bool _484 = _446 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _486 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[29].z, _476);
    bool _488 = !_480;
    int _490 = _488 ? 0 : 1;
    float _492 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[20].z, _456);
    int _494 = 2;
    int _496 = 2;
    if (!_462)
    {
        _494 = 1;
    }
    int _498 = _494;
    float _500 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[25].z, _460);
    int _502 = _498;
    if (!_466)
    {
        _502 = _472;
    }
    int _504 = _502;
    float _506 = _158 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _508 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[26].z, _464);
    float _510 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[23].z, _458);
    float _512 = float(_504);
    float _514 = _158 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    if (!_480)
    {
        _496 = 1;
    }
    int _516 = _496;
    float _518 = _404 * _378;
    int _520 = _516;
    if (!_484)
    {
        _520 = _490;
    }
    int _522 = _520;
    float _524 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[21].x, _506);
    float _526 = precise::min(_512, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _528 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[24].x, _514);
    float _530 = float(_522);
    float _532 = _158 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    bool _534 = _526 != 1.0;
    bool _536 = isnan(_526);
    bool _538 = _534 || _536;
    bool _540 = isnan(1.0);
    bool _542 = _538 || _540;
    float _544 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[21].z, _524);
    float _546 = precise::min(_530, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _548 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[30].x, _532);
    float _550 = _158 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _552 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[24].z, _528);
    bool _554 = _546 != 1.0;
    bool _556 = isnan(_546);
    bool _558 = _554 || _556;
    bool _560 = isnan(1.0);
    bool _562 = _558 || _560;
    float _564 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[30].z, _548);
    float _566 = _158 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _568 = _158 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    bool _570 = _546 != 0.0;
    bool _572 = isnan(_546);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.0);
    bool _578 = _574 || _576;
    float _580 = _544 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _582 = _564 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _584 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[16].x, _550);
    bool _586 = _526 != 0.0;
    bool _588 = isnan(_526);
    bool _590 = _586 || _588;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    float _596 = _580;
    float _598 = _582;
    if (_542)
    {
        float _600 = _552 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _596 = _600;
    }
    float _602 = _596;
    float _604 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[18].z, _426);
    float _606 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[19].x, _428);
    float _608 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[22].x, _436);
    float _610 = _602;
    if (_562)
    {
        float _612 = _434 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _598 = _612;
    }
    float _614 = _598;
    float _616 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[17].x, _442);
    float _618 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[31].x, _566);
    float _620 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[32].x, _568);
    float _622 = _404 * _380;
    float _624 = float(int(_211));
    float _626 = rint(_546);
    float _628 = precise::max(_626, 0.0);
    uint _630 = uint(_628);
    uint _632 = clamp(_630, 0u, 65535u);
    float _634 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[19].z, _606);
    float _636 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[22].z, _608);
    float _638 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[31].z, _618);
    float _640 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[32].z, _620);
    float _642 = _614;
    if (!_578)
    {
        float _644 = _478 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _642 = _644;
    }
    float _646 = _642;
    float _648 = _634 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _650 = _648;
    if (!_594)
    {
        float _652 = _604 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _610 = _652;
    }
    float _654 = _610;
    float _656 = rint(_526);
    float _658 = precise::max(_656, 0.0);
    uint _660 = uint(_658);
    uint _662 = clamp(_660, 0u, 65535u);
    if (_542)
    {
        float _664 = _636 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _650 = _664;
    }
    float _666 = _650;
    float _668 = _482 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _670 = _486 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _672 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[17].z, _616);
    float _674 = _668;
    float _676 = _670;
    float _678 = _666;
    if (_562)
    {
        float _680 = _638 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _674 = _680;
    }
    float _682 = _674;
    float _684 = _682;
    if (_562)
    {
        float _686 = _640 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _676 = _686;
    }
    float _688 = _676;
    float _690 = _492 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _692 = rint(_624);
    float _694 = precise::max(_692, 0.0);
    uint _696 = uint(_694);
    uint _698 = clamp(_696, 0u, 65535u);
    float _700 = _688;
    float _702 = _690;
    if (!_578)
    {
        float _704 = _500 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _684 = _704;
    }
    float _706 = _684;
    float _708 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[16].z, _584);
    if (!_578)
    {
        float _710 = _508 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _700 = _710;
    }
    float _712 = _700;
    float _714 = 0.0 + _646;
    float _716 = precise::clamp(_714, 0.0, 1.0);
    if (_542)
    {
        float _718 = _510 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _702 = _718;
    }
    float _720 = _702;
    float _722 = _720;
    if (!_594)
    {
        float _724 = _672 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _722 = _724;
    }
    float _726 = _722;
    if (!_594)
    {
        float _728 = _708 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _678 = _728;
    }
    float _730 = _678;
    float _732 = 0.0 + _654;
    float _734 = precise::clamp(_732, 0.0, 1.0);
    float3 _2030 = float3(_706, _712, float(int(_632)));
    float3 _2034 = select(_2030, float3(0.0), isnan(_2030));
    float _736 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2034.xy, uint(rint(_2034.z)), _716);
    float _738 = _404 * _382;
    float _740 = precise::clamp(_738, 0.0, 1.0);
    float3 _2048 = float3(_730, _726, float(int(_662)));
    float3 _2050 = select(_2048, float3(0.0), isnan(_2048));
    float _742 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2050.xy, uint(rint(_2050.z)), _734);
    float3 _2059 = float3(_622, _518, float(int(_698)));
    float3 _2061 = select(_2059, float3(0.0), isnan(_2059));
    float _744 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2061.xy, uint(rint(_2061.z)), _740);
    float _746 = -_108;
    float _748 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _750 = _746 + _748;
    float _752 = -_108;
    float _754 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _756 = _752 + _754;
    float _758 = _750 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _760 = precise::clamp(_758, 0.0, 1.0);
    float _762 = _736 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _764 = fma(_742, (*spvDescriptorSet0.fp_c3)._m0[49].z, _762);
    float _766 = _756 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _768 = precise::clamp(_766, 0.0, 1.0);
    float _770 = _744 + _760;
    float _772 = _764 + _768;
    out.m_47.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_47.y = _770;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _772;
    return out;
}

