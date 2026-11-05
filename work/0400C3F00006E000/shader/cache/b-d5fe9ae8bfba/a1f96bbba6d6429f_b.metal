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
    bool _284 = false;
    bool _282 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _799 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_799, float2(0.0), isnan(_799)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _816 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_816, float2(0.0), isnan(_816))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_816, float2(0.0), isnan(_816))).x;
    float2 _824 = float2(_56, _58);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_824, float2(0.0), isnan(_824))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_824, float2(0.0), isnan(_824))).x;
    float _74 = in.m_42.y;
    float _76 = in.m_42.x;
    float _78 = in.m_44.y;
    float _80 = in.m_46.y;
    float _82 = in.m_44.x;
    float _84 = in.m_46.x;
    float _86 = -_64;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_66;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = -_68;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].z, _100);
    float _104 = -_70;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[46].z, _106);
    float _110 = _74 * _90;
    float _112 = _76 * _90;
    float _114 = -_110;
    float _116 = fma(_96, _78, _114);
    float _118 = -_110;
    float _120 = fma(_102, _80, _118);
    float _122 = -_112;
    float _124 = fma(_96, _82, _122);
    float _126 = -_112;
    float _128 = fma(_102, _84, _126);
    float _130 = _116 * _116;
    float _132 = _120 * _120;
    float _134 = -_90;
    float _136 = _134 + _96;
    float _138 = -_90;
    float _140 = _138 + _102;
    float _142 = fma(_124, _124, _130);
    float _144 = fma(_128, _128, _132);
    float _146 = -_108;
    bool _150 = _146 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _152 = fma(_136, _136, _142);
    float _154 = fma(_140, _140, _144);
    float _156 = -_108;
    bool _158 = _156 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _160 = -_108;
    bool _162 = _160 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _164 = rsqrt(_152);
    int _167 = 2;
    if (!_150)
    {
        _167 = 1;
    }
    int _169 = _167;
    float _171 = rsqrt(_154);
    float _173 = _124 * _164;
    float _175 = _136 * _164;
    float _177 = _116 * _164;
    float _179 = _140 * _171;
    float _181 = _120 * _171;
    float _183 = _128 * _171;
    float _185 = _173 * _179;
    float _187 = _175 * _181;
    float _189 = _177 * _183;
    float _191 = -_185;
    float _193 = fma(_175, _183, _191);
    float _195 = -_187;
    float _197 = fma(_177, _179, _195);
    float _199 = -_189;
    float _201 = fma(_173, _181, _199);
    float _203 = _193 * _193;
    float _205 = fma(_197, _197, _203);
    float _207 = fma(_201, _201, _205);
    bool _209 = !_150;
    int _211 = _209 ? 0 : 1;
    float _213 = rsqrt(_207);
    int _215 = _169;
    if (!_158)
    {
        _215 = _211;
    }
    int _217 = _215;
    int _219 = _217 + 1;
    uint _222 = uint(_219);
    if (!_162)
    {
        _222 = uint(_217);
    }
    uint _224 = _222;
    float _226 = _108 * _76;
    uint _228 = min(_224, 2u);
    int _230 = int(_228) << 2;
    float _232 = _193 * _213;
    float _234 = _197 * _213;
    float _236 = _201 * _213;
    float _238 = _232 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _240 = uint(int(uint(_230) >> uint(2)));
    uint _242 = uint(int(uint(int(_240)) >> uint(2)));
    int _244 = int(_240) & 3;
    float _246 = (*spvDescriptorSet0.fp_c1)._m0[int(_242)][_244];
    float _248 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[35].x, _238);
    float _250 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[35].z, _248);
    float _252 = abs(_250);
    float _254 = -_252;
    float _256 = _254 + 1.0;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = _108 * _74;
    float _262 = abs(_258);
    float _264 = log2(_262);
    float _266 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _268 = exp2(_266);
    float _270 = _268 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _272 = fma(_234, _270, _226);
    float _274 = fma(_232, _270, _260);
    float _276 = fma(_236, _270, _108);
    bool _278 = as_type<int>(_246) == 1280;
    if (!_278)
    {
        bool _280 = as_type<int>(_246) == 1552;
        _282 = _280;
        if (!_282)
        {
            _284 = true;
        }
    }
    float _318;
    float _320;
    float _322;
    float _324;
    if (!_282)
    {
        if (!_284)
        {
            float _286 = _274 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _288 = _274 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _290 = _274 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _292 = _274 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _294 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[1].x, _286);
            float _296 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].x, _288);
            float _298 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].x, _290);
            float _300 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[3].x, _292);
            float _302 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[1].z, _294);
            float _304 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[0].z, _296);
            float _306 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[2].z, _298);
            float _308 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[3].z, _300);
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _318 = _316;
            _320 = _312;
            _322 = _310;
            _324 = _314;
        }
    }
    if ((false || _284) || _282)
    {
        if ((!_284) || _282)
        {
            _282 = false;
            float _326 = _274 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _328 = _274 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _330 = _274 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _332 = _274 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _334 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[5].x, _326);
            float _336 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[4].x, _328);
            float _338 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[6].x, _330);
            float _340 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[7].x, _332);
            float _342 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[5].z, _334);
            float _344 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[4].z, _336);
            float _346 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[6].z, _338);
            float _348 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[7].z, _340);
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _318 = _356;
            _320 = _352;
            _322 = _350;
            _324 = _354;
        }
        if (false || _284)
        {
            _284 = false;
            float _358 = _274 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _360 = _274 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _362 = _274 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _364 = _274 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _366 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[9].x, _358);
            float _368 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[8].x, _360);
            float _370 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[10].x, _362);
            float _372 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[11].x, _364);
            float _374 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[9].z, _366);
            float _376 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[8].z, _368);
            float _378 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[10].z, _370);
            float _380 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[11].z, _372);
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _318 = _388;
            _320 = _384;
            _322 = _382;
            _324 = _386;
        }
    }
    float _390 = _318;
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = -_260;
    float _400 = _398 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _402 = -_226;
    float _404 = _402 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _406 = -_260;
    float _408 = _406 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _410 = 1.0 / _390;
    float _412 = _400 * _400;
    float _414 = -_108;
    float _416 = _414 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _418 = _408 * _408;
    float _420 = fma(_404, _404, _412);
    float _422 = -_226;
    float _424 = _422 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _426 = _260 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _428 = _260 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _430 = fma(_416, _416, _420);
    float _432 = -_108;
    float _434 = _432 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _436 = fma(_424, _424, _418);
    float _438 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[33].x, _426);
    float _440 = _260 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _442 = fma(_434, _434, _436);
    float _444 = sqrt(_430);
    float _446 = _260 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _448 = _260 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _450 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[33].z, _438);
    float _452 = _260 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _454 = _260 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _456 = _260 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _458 = _260 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _460 = sqrt(_442);
    float _462 = _260 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _464 = _260 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _466 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[19].x, _428);
    float _468 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[18].x, _440);
    float _470 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[27].x, _446);
    float _472 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[26].x, _448);
    float _474 = _410 * _392;
    bool _476 = _444 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _478 = _410 * _394;
    bool _480 = _444 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _482 = _410 * _396;
    float _484 = precise::clamp(_482, 0.0, 1.0);
    bool _486 = !_476;
    int _488 = _486 ? 0 : 1;
    float _490 = _260 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _492 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[28].x, _452);
    float _494 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[29].x, _454);
    bool _496 = _460 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _498 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[31].x, _456);
    bool _500 = _460 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _502 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[32].x, _458);
    bool _504 = !_496;
    int _506 = _504 ? 0 : 1;
    float _508 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[20].x, _462);
    int _510 = 2;
    int _512 = 2;
    if (!_476)
    {
        _510 = 1;
    }
    int _514 = _510;
    float _516 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[25].x, _464);
    int _518 = _514;
    if (!_480)
    {
        _518 = _488;
    }
    int _520 = _518;
    float _522 = _260 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _524 = float(int(_224));
    float _526 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[27].z, _470);
    float _528 = float(_520);
    float _530 = _260 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    if (!_496)
    {
        _512 = 1;
    }
    int _532 = _512;
    float _534 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[21].x, _522);
    int _536 = _532;
    if (!_500)
    {
        _536 = _506;
    }
    int _538 = _536;
    float _540 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[24].x, _530);
    float _542 = precise::min(_528, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _544 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[21].z, _534);
    float _546 = float(_538);
    float _548 = _260 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    bool _550 = _542 != 1.0;
    bool _552 = isnan(_542);
    bool _554 = _550 || _552;
    bool _556 = isnan(1.0);
    bool _558 = _554 || _556;
    float _560 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[19].z, _466);
    float _562 = precise::min(_546, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _564 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[30].x, _548);
    bool _566 = _542 != 0.0;
    bool _568 = isnan(_542);
    bool _570 = _566 || _568;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    float _576 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[17].x, _490);
    bool _578 = _562 != 1.0;
    bool _580 = isnan(_562);
    bool _582 = _578 || _580;
    bool _584 = isnan(1.0);
    bool _586 = _582 || _584;
    float _588 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[30].z, _564);
    float _590 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[24].z, _540);
    bool _592 = _562 != 0.0;
    bool _594 = isnan(_562);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    float _602 = _544 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _604 = _260 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _606 = rint(_562);
    float _608 = precise::max(_606, 0.0);
    uint _610 = uint(_608);
    uint _612 = clamp(_610, 0u, 65535u);
    float _614 = _602;
    if (_558)
    {
        float _616 = _590 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _614 = _616;
    }
    float _618 = _614;
    float _620 = _260 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _622 = _588 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _624 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[22].x, _604);
    float _626 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[28].z, _492);
    float _628 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[23].x, _620);
    float _630 = _622;
    float _632 = _618;
    if (_586)
    {
        float _634 = _450 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _630 = _634;
    }
    float _636 = _630;
    float _638 = _260 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _640 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[22].z, _624);
    float _642 = rint(_542);
    float _644 = precise::max(_642, 0.0);
    uint _646 = uint(_644);
    uint _648 = clamp(_646, 0u, 65535u);
    float _650 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[29].z, _494);
    float _652 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[23].z, _628);
    float _654 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[31].z, _498);
    float _656 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[32].z, _502);
    float _658 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[16].x, _638);
    float _660 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[18].z, _468);
    float _662 = _636;
    if (!_600)
    {
        float _664 = _526 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _662 = _664;
    }
    float _666 = _662;
    float _668 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[20].z, _508);
    float _670 = _560 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _672 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[25].z, _516);
    float _674 = rint(_524);
    float _676 = precise::max(_674, 0.0);
    uint _678 = uint(_676);
    uint _680 = clamp(_678, 0u, 65535u);
    float _682 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[26].z, _472);
    float _684 = _670;
    if (_558)
    {
        float _686 = _640 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _684 = _686;
    }
    float _688 = _684;
    float _690 = _626 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _692 = _650 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _694 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[17].z, _576);
    float _696 = _690;
    float _698 = _692;
    float _700 = _688;
    if (_586)
    {
        float _702 = _654 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _696 = _702;
    }
    float _704 = _696;
    float _706 = _704;
    if (_586)
    {
        float _708 = _656 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _698 = _708;
    }
    float _710 = _698;
    float _712 = _710;
    if (!_574)
    {
        float _714 = _660 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _632 = _714;
    }
    float _716 = _632;
    float _718 = _668 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _720 = _718;
    if (!_600)
    {
        float _722 = _672 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _706 = _722;
    }
    float _724 = _706;
    float _726 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[16].z, _658);
    if (!_600)
    {
        float _728 = _682 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _712 = _728;
    }
    float _730 = _712;
    float _732 = 0.0 + _666;
    float _734 = precise::clamp(_732, 0.0, 1.0);
    if (_558)
    {
        float _736 = _652 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _720 = _736;
    }
    float _738 = _720;
    float _740 = _738;
    if (!_574)
    {
        float _742 = _694 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _740 = _742;
    }
    float _744 = _740;
    if (!_574)
    {
        float _746 = _726 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _700 = _746;
    }
    float _748 = _700;
    float _750 = 0.0 + _716;
    float _752 = precise::clamp(_750, 0.0, 1.0);
    float3 _2073 = float3(_724, _730, float(int(_612)));
    float3 _2077 = select(_2073, float3(0.0), isnan(_2073));
    float _754 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2077.xy, uint(rint(_2077.z)), _734);
    float3 _2086 = float3(_748, _744, float(int(_648)));
    float3 _2088 = select(_2086, float3(0.0), isnan(_2086));
    float _756 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2088.xy, uint(rint(_2088.z)), _752);
    float3 _2097 = float3(_474, _478, float(int(_680)));
    float3 _2099 = select(_2097, float3(0.0), isnan(_2097));
    float _758 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2099.xy, uint(rint(_2099.z)), _484);
    float _760 = -_108;
    float _762 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _764 = _760 + _762;
    float _766 = -_108;
    float _768 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _770 = _766 + _768;
    float _772 = _764 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _774 = precise::clamp(_772, 0.0, 1.0);
    float _776 = _770 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _778 = precise::clamp(_776, 0.0, 1.0);
    float _780 = _754 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _782 = fma(_756, (*spvDescriptorSet0.fp_c3)._m0[49].z, _780);
    float _784 = _758 + _774;
    float _786 = _782 + _778;
    out.m_49.x = _72;
    out.m_49.y = _784;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _786;
    return out;
}

