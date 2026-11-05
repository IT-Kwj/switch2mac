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
    bool _270 = false;
    bool _268 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _867 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_867, float2(0.0), isnan(_867)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _884 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_884, float2(0.0), isnan(_884))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_884, float2(0.0), isnan(_884))).x;
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
    float _148 = fma(_132, _132, _138);
    float _150 = fma(_136, _136, _140);
    float _152 = -_108;
    bool _154 = _152 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _156 = rsqrt(_148);
    float _158 = rsqrt(_150);
    float _160 = _120 * _156;
    float _162 = _132 * _156;
    float _164 = _112 * _156;
    float _166 = _136 * _158;
    float _168 = _116 * _158;
    float _170 = _124 * _158;
    float _172 = _160 * _166;
    float _174 = _162 * _168;
    float _176 = -_172;
    float _178 = fma(_162, _170, _176);
    float _180 = _164 * _170;
    float _182 = -_174;
    float _184 = fma(_164, _166, _182);
    bool _186 = !_146;
    uint _189 = uint(_186 ? 0 : 1);
    float _191 = _178 * _178;
    float _193 = -_180;
    float _195 = fma(_160, _168, _193);
    float _197 = fma(_184, _184, _191);
    uint _199 = 2u;
    if (!_146)
    {
        _199 = 1u;
    }
    uint _201 = _199;
    uint _203 = _201;
    if (!_154)
    {
        _203 = _189;
    }
    uint _205 = _203;
    float _207 = fma(_195, _195, _197);
    uint _209 = min(_205, 2u);
    float _211 = rsqrt(_207);
    int _214 = int(_209) << 2;
    float _216 = _108 * _70;
    float _218 = _178 * _211;
    float _220 = _184 * _211;
    float _222 = _195 * _211;
    float _224 = _218 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _226 = uint(int(uint(_214) >> uint(2)));
    uint _228 = uint(int(uint(int(_226)) >> uint(2)));
    int _230 = int(_226) & 3;
    float _232 = (*spvDescriptorSet0.fp_c1)._m0[int(_228)][_230];
    float _234 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[35].x, _224);
    float _236 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[35].z, _234);
    float _238 = abs(_236);
    float _240 = -_238;
    float _242 = _240 + 1.0;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = _108 * _72;
    float _248 = abs(_244);
    float _250 = log2(_248);
    float _252 = _250 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _254 = exp2(_252);
    float _256 = _254 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _258 = fma(_220, _256, _246);
    float _260 = fma(_218, _256, _216);
    float _262 = fma(_222, _256, _108);
    bool _264 = as_type<int>(_232) == 1200;
    if (!_264)
    {
        bool _266 = as_type<int>(_232) == 1472;
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
            _306 = _296;
            _308 = _298;
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
            _306 = _336;
            _308 = _338;
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
            _306 = _368;
            _308 = _370;
            _310 = _372;
        }
    }
    float _376 = _304;
    float _378 = _306;
    float _380 = _308;
    float _382 = _310;
    float _384 = -_216;
    float _386 = _384 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _388 = -_246;
    float _390 = _388 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _392 = -_216;
    float _394 = _392 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _396 = _216 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _398 = _386 * _386;
    float _400 = -_108;
    float _402 = _400 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _404 = _394 * _394;
    float _406 = -_108;
    float _408 = _406 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _410 = fma(_390, _390, _398);
    float _412 = _216 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _414 = _216 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _416 = _216 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _418 = fma(_402, _402, _410);
    float _420 = -_246;
    float _422 = _420 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _424 = _216 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _426 = _216 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _428 = _216 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _430 = fma(_422, _422, _404);
    float _432 = sqrt(_418);
    float _434 = _216 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _436 = fma(_408, _408, _430);
    float _438 = _216 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _440 = _216 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _442 = _216 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _444 = _216 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _446 = _216 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _448 = sqrt(_436);
    float _450 = _216 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _452 = _216 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _454 = _216 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _456 = _216 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _458 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[19].x, _412);
    float _460 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[20].x, _416);
    bool _462 = _432 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _464 = 1.0 / _376;
    bool _466 = _432 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _468 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[21].x, _426);
    bool _470 = !_462;
    int _472 = _470 ? 0 : 1;
    float _474 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[22].x, _414);
    float _476 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[23].x, _424);
    float _478 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[24].x, _428);
    float _480 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[19].z, _458);
    bool _482 = _448 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _484 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[20].z, _460);
    float _486 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[21].z, _468);
    float _488 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[29].x, _446);
    int _490 = 2;
    if (!_462)
    {
        _490 = 1;
    }
    int _492 = _490;
    float _494 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[22].z, _474);
    bool _496 = _448 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _498 = _216 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    int _500 = _492;
    if (!_466)
    {
        _500 = _472;
    }
    int _502 = _500;
    float _504 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[26].x, _396);
    bool _506 = !_482;
    int _508 = _506 ? 0 : 1;
    float _510 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[23].z, _476);
    float _512 = float(_502);
    float _514 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[24].z, _478);
    float _516 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[16].x, _434);
    float _518 = precise::min(_512, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _520 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[17].x, _438);
    int _522 = 2;
    if (!_482)
    {
        _522 = 1;
    }
    int _524 = _522;
    float _526 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[18].x, _440);
    int _528 = _524;
    if (!_496)
    {
        _528 = _508;
    }
    int _530 = _528;
    float _532 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[25].x, _442);
    bool _534 = _518 != 1.0;
    bool _536 = isnan(_518);
    bool _538 = _534 || _536;
    bool _540 = isnan(1.0);
    bool _542 = _538 || _540;
    float _544 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[27].x, _498);
    float _546 = float(_530);
    float _548 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[28].x, _444);
    float _550 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[30].x, _450);
    float _552 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[31].x, _452);
    float _554 = precise::min(_546, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _556 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[32].x, _454);
    float _558 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[33].x, _456);
    float _560 = _480 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _562 = _484 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _564 = _486 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _566 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[29].z, _488);
    float _568 = _560;
    float _570 = _562;
    float _572 = _564;
    if (_542)
    {
        float _574 = _494 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _568 = _574;
    }
    float _576 = _568;
    float _578 = _576;
    if (_542)
    {
        float _580 = _510 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _570 = _580;
    }
    float _582 = _570;
    float _584 = _582;
    if (_542)
    {
        float _586 = _514 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _572 = _586;
    }
    float _588 = _572;
    bool _590 = _554 != 1.0;
    bool _592 = isnan(_554);
    bool _594 = _590 || _592;
    bool _596 = isnan(1.0);
    bool _598 = _594 || _596;
    float _600 = _566 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    bool _602 = _518 != 0.0;
    bool _604 = isnan(_518);
    bool _606 = _602 || _604;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    float _612 = _464 * _378;
    bool _614 = _554 != 0.0;
    bool _616 = isnan(_554);
    bool _618 = _614 || _616;
    bool _620 = isnan(0.0);
    bool _622 = _618 || _620;
    float _624 = _464 * _380;
    float _626 = _464 * _382;
    float _628 = precise::clamp(_626, 0.0, 1.0);
    float _630 = float(int(_205));
    float _632 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[30].z, _550);
    float _634 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[28].z, _548);
    float _636 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[33].z, _558);
    float _638 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[18].z, _526);
    float _640 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[31].z, _552);
    float _642 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[27].z, _544);
    float _644 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[32].z, _556);
    float _646 = _632 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _648 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[26].z, _504);
    float _650 = rint(_630);
    float _652 = precise::max(_650, 0.0);
    uint _654 = uint(_652);
    uint _656 = clamp(_654, 0u, 65535u);
    float _658 = _634 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _660 = _646;
    float _662 = _588;
    float _664 = _658;
    float _666 = _600;
    if (_598)
    {
        float _668 = _636 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _660 = _668;
    }
    float _670 = _660;
    float _672 = _670;
    if (!_610)
    {
        float _674 = _638 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _662 = _674;
    }
    float _676 = _662;
    if (_598)
    {
        float _678 = _640 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _664 = _678;
    }
    float _680 = _664;
    float _682 = _680;
    if (!_622)
    {
        float _684 = _642 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _672 = _684;
    }
    float _686 = _672;
    if (_598)
    {
        float _688 = _644 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _666 = _688;
    }
    float _690 = _666;
    float _692 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _628;
    float _694 = _690;
    if (!_622)
    {
        float _696 = _648 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _694 = _696;
    }
    float _698 = _694;
    float _700 = rint(_518);
    float _702 = precise::max(_700, 0.0);
    uint _704 = uint(_702);
    uint _706 = clamp(_704, 0u, 65535u);
    float _708 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[16].z, _516);
    float _710 = 0.0 + _676;
    float _712 = precise::clamp(_710, 0.0, 1.0);
    float _714 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _716 = 0.0 + _686;
    float _718 = precise::clamp(_716, 0.0, 1.0);
    float _720 = _692 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _722 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    if (!_610)
    {
        float _724 = _708 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _578 = _724;
    }
    float _726 = _578;
    float _728 = rint(_554);
    float _730 = precise::max(_728, 0.0);
    uint _732 = uint(_730);
    uint _734 = clamp(_732, 0u, 65535u);
    float _736 = _692 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _738 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[17].z, _520);
    float _740 = _714 * _718;
    float _742 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[25].z, _532);
    float _744 = fma(_720, 0.5, _612);
    float _746 = fma(_720, -0.5, _612);
    float _748 = _712 * _722;
    float _750 = fma(_736, 0.5, _624);
    float _752 = fma(_736, -0.5, _624);
    if (!_610)
    {
        float _754 = _738 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _584 = _754;
    }
    float _756 = _584;
    float _758 = _712 * _714;
    float _760 = fma(_740, 0.5, _698);
    if (!_622)
    {
        float _762 = _742 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _682 = _762;
    }
    float _764 = _682;
    float _766 = _722 * _718;
    float _768 = fma(_740, -0.5, _698);
    float _770 = fma(_748, 0.5, _726);
    float _772 = fma(_748, -0.5, _726);
    float _774 = fma(_758, 0.5, _756);
    float _776 = fma(_758, -0.5, _756);
    float _778 = fma(_766, 0.5, _764);
    float _780 = fma(_766, -0.5, _764);
    float3 _2191 = float3(_746, _750, float(int(_656)));
    float3 _2195 = select(_2191, float3(0.0), isnan(_2191));
    float _782 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2195.xy, uint(rint(_2195.z)), _628);
    float3 _2204 = float3(_744, _750, float(int(_656)));
    float3 _2206 = select(_2204, float3(0.0), isnan(_2204));
    float _784 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2206.xy, uint(rint(_2206.z)), _628);
    float3 _2215 = float3(_744, _752, float(int(_656)));
    float3 _2217 = select(_2215, float3(0.0), isnan(_2215));
    float _786 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2217.xy, uint(rint(_2217.z)), _628);
    float3 _2226 = float3(_746, _752, float(int(_656)));
    float3 _2228 = select(_2226, float3(0.0), isnan(_2226));
    float _788 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2228.xy, uint(rint(_2228.z)), _628);
    float3 _2237 = float3(_772, _774, float(int(_706)));
    float3 _2239 = select(_2237, float3(0.0), isnan(_2237));
    float _790 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2239.xy, uint(rint(_2239.z)), _712);
    float3 _2248 = float3(_770, _774, float(int(_706)));
    float3 _2250 = select(_2248, float3(0.0), isnan(_2248));
    float _792 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2250.xy, uint(rint(_2250.z)), _712);
    float3 _2259 = float3(_780, _760, float(int(_734)));
    float3 _2261 = select(_2259, float3(0.0), isnan(_2259));
    float _794 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2261.xy, uint(rint(_2261.z)), _718);
    float3 _2270 = float3(_778, _760, float(int(_734)));
    float3 _2272 = select(_2270, float3(0.0), isnan(_2270));
    float _796 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2272.xy, uint(rint(_2272.z)), _718);
    float3 _2281 = float3(_770, _776, float(int(_706)));
    float3 _2283 = select(_2281, float3(0.0), isnan(_2281));
    float _798 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2283.xy, uint(rint(_2283.z)), _712);
    float3 _2292 = float3(_778, _768, float(int(_734)));
    float3 _2294 = select(_2292, float3(0.0), isnan(_2292));
    float _800 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2294.xy, uint(rint(_2294.z)), _718);
    float3 _2303 = float3(_772, _776, float(int(_706)));
    float3 _2305 = select(_2303, float3(0.0), isnan(_2303));
    float _802 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2305.xy, uint(rint(_2305.z)), _712);
    float3 _2314 = float3(_780, _768, float(int(_734)));
    float3 _2316 = select(_2314, float3(0.0), isnan(_2314));
    float _804 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2316.xy, uint(rint(_2316.z)), _718);
    float _806 = _784 + _782;
    float _808 = _806 + _786;
    float _810 = -_108;
    float _812 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _814 = _810 + _812;
    float _816 = -_108;
    float _818 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _820 = _816 + _818;
    float _822 = _808 + _788;
    float _824 = _814 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _826 = precise::clamp(_824, 0.0, 1.0);
    float _828 = _820 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _830 = precise::clamp(_828, 0.0, 1.0);
    float _832 = _792 + _790;
    float _834 = fma(_822, 0.25, _826);
    float _836 = _796 + _794;
    float _838 = _832 + _798;
    float _840 = _836 + _800;
    float _842 = _838 + _802;
    float _844 = _840 + _804;
    float _846 = _842 * 0.25;
    float _848 = _844 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _850 = _848 * 0.25;
    float _852 = fma(_846, (*spvDescriptorSet0.fp_c3)._m0[49].z, _850);
    float _854 = _852 + _830;
    out.m_47.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_47.y = _834;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _854;
    return out;
}

