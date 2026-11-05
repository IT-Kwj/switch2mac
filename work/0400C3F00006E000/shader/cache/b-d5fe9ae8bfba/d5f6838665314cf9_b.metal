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
    bool _274 = false;
    bool _272 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _789 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_789, float2(0.0), isnan(_789)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _806 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_806, float2(0.0), isnan(_806))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_806, float2(0.0), isnan(_806))).x;
    float2 _814 = float2(_56, _58);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_814, float2(0.0), isnan(_814))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_814, float2(0.0), isnan(_814))).x;
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
    bool _160 = !_150;
    uint _163 = uint(_160 ? 0 : 1);
    float _165 = rsqrt(_152);
    float _167 = rsqrt(_154);
    float _169 = _124 * _165;
    float _171 = _136 * _165;
    float _173 = _116 * _165;
    float _175 = _140 * _167;
    float _177 = _128 * _167;
    float _179 = _120 * _167;
    float _181 = _169 * _175;
    float _183 = _173 * _177;
    float _185 = _171 * _179;
    float _187 = -_181;
    float _189 = fma(_171, _177, _187);
    float _191 = -_183;
    float _193 = fma(_169, _179, _191);
    float _195 = -_185;
    float _197 = fma(_173, _175, _195);
    float _199 = _189 * _189;
    float _201 = fma(_197, _197, _199);
    float _203 = fma(_193, _193, _201);
    uint _205 = 2u;
    if (!_150)
    {
        _205 = 1u;
    }
    uint _207 = _205;
    float _209 = rsqrt(_203);
    uint _211 = _207;
    if (!_158)
    {
        _211 = _163;
    }
    uint _213 = _211;
    uint _215 = min(_213, 2u);
    int _218 = int(_215) << 2;
    uint _220 = uint(int(uint(_218) >> uint(2)));
    uint _222 = uint(int(uint(int(_220)) >> uint(2)));
    int _224 = int(_220) & 3;
    float _226 = (*spvDescriptorSet0.fp_c1)._m0[int(_222)][_224];
    float _228 = _189 * _209;
    float _230 = _197 * _209;
    float _232 = _193 * _209;
    float _234 = _108 * _76;
    float _236 = _228 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _238 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[35].x, _236);
    float _240 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[35].z, _238);
    float _242 = abs(_240);
    float _244 = -_242;
    float _246 = _244 + 1.0;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = _108 * _74;
    float _252 = abs(_248);
    float _254 = log2(_252);
    float _256 = _254 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _258 = exp2(_256);
    float _260 = _258 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _262 = fma(_230, _260, _234);
    float _264 = fma(_228, _260, _250);
    float _266 = fma(_232, _260, _108);
    bool _268 = as_type<int>(_226) == 1232;
    if (!_268)
    {
        bool _270 = as_type<int>(_226) == 1504;
        _272 = _270;
        if (!_272)
        {
            _274 = true;
        }
    }
    float _308;
    float _310;
    float _312;
    float _314;
    if (!_272)
    {
        if (!_274)
        {
            float _276 = _264 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _278 = _264 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _280 = _264 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _282 = _264 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _284 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[1].x, _276);
            float _286 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].x, _278);
            float _288 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[2].x, _280);
            float _290 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[3].x, _282);
            float _292 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[1].z, _284);
            float _294 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].z, _286);
            float _296 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[2].z, _288);
            float _298 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[3].z, _290);
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _302 = _294 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _304 = _296 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _306 = _298 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _308 = _306;
            _310 = _302;
            _312 = _300;
            _314 = _304;
        }
    }
    if ((false || _274) || _272)
    {
        if ((!_274) || _272)
        {
            _272 = false;
            float _316 = _264 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _318 = _264 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _320 = _264 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _322 = _264 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _324 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[5].x, _316);
            float _326 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[4].x, _318);
            float _328 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[6].x, _320);
            float _330 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[7].x, _322);
            float _332 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[5].z, _324);
            float _334 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[4].z, _326);
            float _336 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[6].z, _328);
            float _338 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[7].z, _330);
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _342 = _334 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _344 = _336 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _346 = _338 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _308 = _346;
            _310 = _342;
            _312 = _340;
            _314 = _344;
        }
        if (false || _274)
        {
            _274 = false;
            float _348 = _264 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _350 = _264 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _352 = _264 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _354 = _264 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _356 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[9].x, _348);
            float _358 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[8].x, _350);
            float _360 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[10].x, _352);
            float _362 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[11].x, _354);
            float _364 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[9].z, _356);
            float _366 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[8].z, _358);
            float _368 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[10].z, _360);
            float _370 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[11].z, _362);
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _374 = _366 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _376 = _368 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _378 = _370 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _308 = _378;
            _310 = _374;
            _312 = _372;
            _314 = _376;
        }
    }
    float _380 = _308;
    float _382 = _310;
    float _384 = _312;
    float _386 = _314;
    float _388 = -_250;
    float _390 = _388 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _392 = -_234;
    float _394 = _392 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _396 = -_250;
    float _398 = _396 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _400 = 1.0 / _380;
    float _402 = _390 * _390;
    float _404 = -_108;
    float _406 = _404 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _408 = _398 * _398;
    float _410 = fma(_394, _394, _402);
    float _412 = -_234;
    float _414 = _412 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _416 = _250 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _418 = _250 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _420 = fma(_406, _406, _410);
    float _422 = -_108;
    float _424 = _422 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _426 = fma(_414, _414, _408);
    float _428 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[33].x, _416);
    float _430 = _250 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _432 = fma(_424, _424, _426);
    float _434 = sqrt(_420);
    float _436 = _250 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _438 = _250 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _440 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[33].z, _428);
    float _442 = _250 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _444 = _250 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _446 = _250 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _448 = _250 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _450 = sqrt(_432);
    float _452 = _250 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _454 = _250 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _456 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[19].x, _418);
    float _458 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[18].x, _430);
    float _460 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[27].x, _436);
    float _462 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[26].x, _438);
    float _464 = _400 * _382;
    bool _466 = _434 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _468 = _400 * _384;
    bool _470 = _434 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _472 = _400 * _386;
    float _474 = precise::clamp(_472, 0.0, 1.0);
    bool _476 = !_466;
    int _478 = _476 ? 0 : 1;
    float _480 = _250 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _482 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[28].x, _442);
    float _484 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[29].x, _444);
    bool _486 = _450 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _488 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[31].x, _446);
    bool _490 = _450 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _492 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[32].x, _448);
    bool _494 = !_486;
    int _496 = _494 ? 0 : 1;
    float _498 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[20].x, _452);
    int _500 = 2;
    int _502 = 2;
    if (!_466)
    {
        _500 = 1;
    }
    int _504 = _500;
    float _506 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[25].x, _454);
    int _508 = _504;
    if (!_470)
    {
        _508 = _478;
    }
    int _510 = _508;
    float _512 = _250 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _514 = float(int(_213));
    float _516 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[27].z, _460);
    float _518 = float(_510);
    float _520 = _250 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    if (!_486)
    {
        _502 = 1;
    }
    int _522 = _502;
    float _524 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[21].x, _512);
    int _526 = _522;
    if (!_490)
    {
        _526 = _496;
    }
    int _528 = _526;
    float _530 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[24].x, _520);
    float _532 = precise::min(_518, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _534 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[21].z, _524);
    float _536 = float(_528);
    float _538 = _250 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    bool _540 = _532 != 1.0;
    bool _542 = isnan(_532);
    bool _544 = _540 || _542;
    bool _546 = isnan(1.0);
    bool _548 = _544 || _546;
    float _550 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[19].z, _456);
    float _552 = precise::min(_536, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _554 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[30].x, _538);
    bool _556 = _532 != 0.0;
    bool _558 = isnan(_532);
    bool _560 = _556 || _558;
    bool _562 = isnan(0.0);
    bool _564 = _560 || _562;
    float _566 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[17].x, _480);
    bool _568 = _552 != 1.0;
    bool _570 = isnan(_552);
    bool _572 = _568 || _570;
    bool _574 = isnan(1.0);
    bool _576 = _572 || _574;
    float _578 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[30].z, _554);
    float _580 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[24].z, _530);
    bool _582 = _552 != 0.0;
    bool _584 = isnan(_552);
    bool _586 = _582 || _584;
    bool _588 = isnan(0.0);
    bool _590 = _586 || _588;
    float _592 = _534 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _594 = _250 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _596 = rint(_552);
    float _598 = precise::max(_596, 0.0);
    uint _600 = uint(_598);
    uint _602 = clamp(_600, 0u, 65535u);
    float _604 = _592;
    if (_548)
    {
        float _606 = _580 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _604 = _606;
    }
    float _608 = _604;
    float _610 = _250 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _612 = _578 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _614 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[22].x, _594);
    float _616 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[28].z, _482);
    float _618 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[23].x, _610);
    float _620 = _612;
    float _622 = _608;
    if (_576)
    {
        float _624 = _440 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _620 = _624;
    }
    float _626 = _620;
    float _628 = _250 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _630 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[22].z, _614);
    float _632 = rint(_532);
    float _634 = precise::max(_632, 0.0);
    uint _636 = uint(_634);
    uint _638 = clamp(_636, 0u, 65535u);
    float _640 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[29].z, _484);
    float _642 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[23].z, _618);
    float _644 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[31].z, _488);
    float _646 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[32].z, _492);
    float _648 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[16].x, _628);
    float _650 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[18].z, _458);
    float _652 = _626;
    if (!_590)
    {
        float _654 = _516 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _652 = _654;
    }
    float _656 = _652;
    float _658 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[20].z, _498);
    float _660 = _550 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _662 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[25].z, _506);
    float _664 = rint(_514);
    float _666 = precise::max(_664, 0.0);
    uint _668 = uint(_666);
    uint _670 = clamp(_668, 0u, 65535u);
    float _672 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[26].z, _462);
    float _674 = _660;
    if (_548)
    {
        float _676 = _630 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _674 = _676;
    }
    float _678 = _674;
    float _680 = _616 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _682 = _640 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _684 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[17].z, _566);
    float _686 = _680;
    float _688 = _682;
    float _690 = _678;
    if (_576)
    {
        float _692 = _644 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _686 = _692;
    }
    float _694 = _686;
    float _696 = _694;
    if (_576)
    {
        float _698 = _646 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _688 = _698;
    }
    float _700 = _688;
    float _702 = _700;
    if (!_564)
    {
        float _704 = _650 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _622 = _704;
    }
    float _706 = _622;
    float _708 = _658 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _710 = _708;
    if (!_590)
    {
        float _712 = _662 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _696 = _712;
    }
    float _714 = _696;
    float _716 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[16].z, _648);
    if (!_590)
    {
        float _718 = _672 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _702 = _718;
    }
    float _720 = _702;
    float _722 = 0.0 + _656;
    float _724 = precise::clamp(_722, 0.0, 1.0);
    if (_548)
    {
        float _726 = _642 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _710 = _726;
    }
    float _728 = _710;
    float _730 = _728;
    if (!_564)
    {
        float _732 = _684 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _730 = _732;
    }
    float _734 = _730;
    if (!_564)
    {
        float _736 = _716 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _690 = _736;
    }
    float _738 = _690;
    float _740 = 0.0 + _706;
    float _742 = precise::clamp(_740, 0.0, 1.0);
    float3 _2047 = float3(_714, _720, float(int(_602)));
    float3 _2051 = select(_2047, float3(0.0), isnan(_2047));
    float _744 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2051.xy, uint(rint(_2051.z)), _724);
    float3 _2060 = float3(_738, _734, float(int(_638)));
    float3 _2062 = select(_2060, float3(0.0), isnan(_2060));
    float _746 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2062.xy, uint(rint(_2062.z)), _742);
    float3 _2071 = float3(_464, _468, float(int(_670)));
    float3 _2073 = select(_2071, float3(0.0), isnan(_2071));
    float _748 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2073.xy, uint(rint(_2073.z)), _474);
    float _750 = -_108;
    float _752 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _754 = _750 + _752;
    float _756 = -_108;
    float _758 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _760 = _756 + _758;
    float _762 = _754 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _764 = precise::clamp(_762, 0.0, 1.0);
    float _766 = _760 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _768 = precise::clamp(_766, 0.0, 1.0);
    float _770 = _744 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _772 = fma(_746, (*spvDescriptorSet0.fp_c3)._m0[49].z, _770);
    float _774 = _748 + _764;
    float _776 = _772 + _768;
    out.m_49.x = _72;
    out.m_49.y = _774;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _776;
    return out;
}

