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
    bool _298 = false;
    bool _296 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _959 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_959, float2(0.0), isnan(_959)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _976 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_976, float2(0.0), isnan(_976))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_976, float2(0.0), isnan(_976))).x;
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
    float _162 = 1.0 / _160;
    float _164 = _120 * _154;
    float _166 = _124 * _154;
    float _168 = _116 * _154;
    float _170 = _144 * _156;
    float _172 = _134 * _156;
    float _174 = _138 * _156;
    float _176 = _164 * _170;
    float _178 = _166 * _172;
    float _180 = -_176;
    float _182 = fma(_166, _174, _180);
    float _184 = _168 * _174;
    float _186 = -_178;
    float _188 = fma(_168, _170, _186);
    float _190 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _192 = _162 * _190;
    float _194 = _182 * _182;
    float _196 = -_184;
    float _198 = fma(_164, _172, _196);
    float _200 = _192 * _76;
    float _202 = fma(_188, _188, _194);
    float _204 = -_192;
    bool _208 = _204 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _210 = _192 * _72;
    float _212 = -_192;
    bool _214 = _212 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _216 = fma(_198, _198, _202);
    float _218 = -_192;
    bool _220 = _218 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _222 = !_208;
    int _225 = _222 ? 0 : 1;
    float _227 = rsqrt(_216);
    int _229 = 2;
    if (!_208)
    {
        _229 = 1;
    }
    int _231 = _229;
    int _233 = _231;
    if (!_214)
    {
        _233 = _225;
    }
    int _235 = _233;
    int _237 = _235 + 1;
    uint _240 = uint(_237);
    if (!_220)
    {
        _240 = uint(_235);
    }
    uint _242 = _240;
    float _244 = _182 * _227;
    float _246 = _188 * _227;
    uint _248 = min(_242, 2u);
    float _250 = _198 * _227;
    float _252 = _244 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _254 = int(_248) << 2;
    float _256 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[35].x, _252);
    uint _258 = uint(int(uint(_254) >> uint(2)));
    uint _260 = uint(int(uint(int(_258)) >> uint(2)));
    int _262 = int(_258) & 3;
    float _264 = (*spvDescriptorSet0.fp_c1)._m0[int(_260)][_262];
    float _266 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[35].z, _256);
    float _268 = abs(_266);
    float _270 = -_268;
    float _272 = _270 + 1.0;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = abs(_274);
    float _278 = log2(_276);
    float _280 = _278 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _282 = exp2(_280);
    float _284 = _282 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _286 = fma(_246, _284, _200);
    float _288 = fma(_244, _284, _210);
    float _290 = fma(_250, _284, _192);
    bool _292 = as_type<int>(_264) == 1392;
    if (!_292)
    {
        bool _294 = as_type<int>(_264) == 1664;
        _296 = _294;
        if (!_296)
        {
            _298 = true;
        }
    }
    float _332;
    float _334;
    float _336;
    float _338;
    if (!_296)
    {
        if (!_298)
        {
            float _300 = _288 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _302 = _288 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _304 = _288 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _306 = _288 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _308 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[0].x, _300);
            float _310 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[1].x, _302);
            float _312 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[2].x, _304);
            float _314 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[3].x, _306);
            float _316 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[0].z, _308);
            float _318 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[1].z, _310);
            float _320 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[2].z, _312);
            float _322 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[3].z, _314);
            float _324 = _316 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _326 = _318 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _328 = _320 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _330 = _322 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _332 = _330;
            _334 = _328;
            _336 = _326;
            _338 = _324;
        }
    }
    if ((false || _298) || _296)
    {
        if ((!_298) || _296)
        {
            _296 = false;
            float _340 = _288 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _342 = _288 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _344 = _288 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _346 = _288 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _348 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[4].x, _340);
            float _350 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[5].x, _342);
            float _352 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[6].x, _344);
            float _354 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[7].x, _346);
            float _356 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[4].z, _348);
            float _358 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[5].z, _350);
            float _360 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[6].z, _352);
            float _362 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[7].z, _354);
            float _364 = _356 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _332 = _370;
            _334 = _368;
            _336 = _366;
            _338 = _364;
        }
        if (false || _298)
        {
            _298 = false;
            float _372 = _288 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _374 = _288 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _376 = _288 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _378 = _288 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _380 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[8].x, _372);
            float _382 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[9].x, _374);
            float _384 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[10].x, _376);
            float _386 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[11].x, _378);
            float _388 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[8].z, _380);
            float _390 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[9].z, _382);
            float _392 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[10].z, _384);
            float _394 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[11].z, _386);
            float _396 = _388 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _398 = _390 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _400 = _392 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _402 = _394 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _332 = _402;
            _334 = _400;
            _336 = _398;
            _338 = _396;
        }
    }
    float _404 = _332;
    float _406 = _334;
    float _408 = _336;
    float _410 = _338;
    float _412 = float(int(_242));
    float _414 = 1.0 / _404;
    float _416 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _418 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _420 = rint(_412);
    float _422 = precise::max(_420, 0.0);
    uint _424 = uint(_422);
    uint _426 = clamp(_424, 0u, 65535u);
    float _428 = _414 * _406;
    float _430 = precise::clamp(_428, 0.0, 1.0);
    float _432 = _414 * _408;
    float _434 = _414 * _410;
    float _436 = fma(_430, _416, _432);
    float _438 = fma(_430, _418, _434);
    float _440 = -_418;
    float _442 = fma(_430, _440, _434);
    float3 _1653 = float3(_434, _436, float(int(_426)));
    float3 _1657 = select(_1653, float3(0.0), isnan(_1653));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1657.xy, uint(rint(_1657.z)), _430);
    float3 _1666 = float3(_438, _436, float(int(_426)));
    float3 _1668 = select(_1666, float3(0.0), isnan(_1666));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1668.xy, uint(rint(_1668.z)), _430);
    float3 _1677 = float3(_442, _436, float(int(_426)));
    float3 _1679 = select(_1677, float3(0.0), isnan(_1677));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1679.xy, uint(rint(_1679.z)), _430);
    float3 _1688 = float3(_438, _432, float(int(_426)));
    float3 _1690 = select(_1688, float3(0.0), isnan(_1688));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1690.xy, uint(rint(_1690.z)), _430);
    float3 _1699 = float3(_434, _432, float(int(_426)));
    float3 _1701 = select(_1699, float3(0.0), isnan(_1699));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1701.xy, uint(rint(_1701.z)), _430);
    float3 _1710 = float3(_442, _432, float(int(_426)));
    float3 _1712 = select(_1710, float3(0.0), isnan(_1710));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1712.xy, uint(rint(_1712.z)), _430);
    float _456 = -_210;
    float _458 = _456 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _460 = -_200;
    float _462 = _460 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _464 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _466 = -_416;
    float _468 = fma(_430, _466, _432);
    float _470 = _458 * _458;
    float _472 = _210 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _474 = _210 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _476 = fma(_462, _462, _470);
    float _478 = -_192;
    float _480 = _478 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _482 = _210 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _484 = _210 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _486 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[24].x, _472);
    float _488 = fma(_480, _480, _476);
    float _490 = _210 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _492 = _210 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _494 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[22].x, _482);
    float _496 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[23].x, _484);
    float _498 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[19].x, _490);
    float _500 = sqrt(_488);
    float _502 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[20].x, _492);
    float _504 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[22].z, _494);
    float _506 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[19].z, _498);
    float _508 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[23].z, _496);
    float _510 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[20].z, _502);
    float _512 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[18].x, _474);
    float _514 = _506 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _516 = _210 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _518 = _510 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _520 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[24].z, _486);
    float _522 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[18].z, _512);
    float _524 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    bool _526 = _500 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _528 = _500 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _530 = !_526;
    int _532 = _530 ? 0 : 1;
    int _534 = 2;
    float _536 = _514;
    float _538 = _518;
    if (!_526)
    {
        _534 = 1;
    }
    int _540 = _534;
    int _542 = _540;
    if (!_528)
    {
        _542 = _532;
    }
    int _544 = _542;
    float _546 = float(_544);
    float _548 = precise::min(_546, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _550 = _548 != 1.0;
    bool _552 = isnan(_548);
    bool _554 = _550 || _552;
    bool _556 = isnan(1.0);
    bool _558 = _554 || _556;
    bool _560 = _548 != 0.0;
    bool _562 = isnan(_548);
    bool _564 = _560 || _562;
    bool _566 = isnan(0.0);
    bool _568 = _564 || _566;
    float _570 = rint(_548);
    float _572 = precise::max(_570, 0.0);
    uint _574 = uint(_572);
    uint _576 = clamp(_574, 0u, 65535u);
    if (_558)
    {
        float _578 = _504 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _536 = _578;
    }
    float _580 = _536;
    float _582 = _210 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _584 = _580;
    if (_558)
    {
        float _586 = _508 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _538 = _586;
    }
    float _588 = _538;
    float _590 = _210 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _592 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[21].x, _582);
    float _594 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[17].x, _590);
    float _596 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[21].z, _592);
    float _598 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[16].x, _516);
    float _600 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[17].z, _594);
    float _602 = _596 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _604 = _602;
    float _606 = _588;
    if (_558)
    {
        float _608 = _520 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _604 = _608;
    }
    float _610 = _604;
    float _612 = _610;
    if (!_568)
    {
        float _614 = _522 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _612 = _614;
    }
    float _616 = _612;
    float _618 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[16].z, _598);
    if (!_568)
    {
        float _620 = _600 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _606 = _620;
    }
    float _622 = _606;
    float _624 = 0.0 + _616;
    float _626 = precise::clamp(_624, 0.0, 1.0);
    if (!_568)
    {
        float _628 = _618 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _584 = _628;
    }
    float _630 = _584;
    float3 _2045 = float3(_438, _468, float(int(_426)));
    float3 _2047 = select(_2045, float3(0.0), isnan(_2045));
    float _632 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2047.xy, uint(rint(_2047.z)), _430);
    float _634 = fma(_626, _524, _622);
    float _636 = _446 + _444;
    float _638 = _636 + _448;
    float3 _2066 = float3(_434, _468, float(int(_426)));
    float3 _2068 = select(_2066, float3(0.0), isnan(_2066));
    float _640 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2068.xy, uint(rint(_2068.z)), _430);
    float3 _2077 = float3(_442, _468, float(int(_426)));
    float3 _2079 = select(_2077, float3(0.0), isnan(_2077));
    float _642 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2079.xy, uint(rint(_2079.z)), _430);
    float3 _2088 = float3(_630, _634, float(int(_576)));
    float3 _2090 = select(_2088, float3(0.0), isnan(_2088));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2090.xy, uint(rint(_2090.z)), _626);
    float _646 = _638 + _450;
    float _648 = -_464;
    float _650 = fma(_626, _648, _630);
    float3 _2108 = float3(_650, _634, float(int(_576)));
    float3 _2110 = select(_2108, float3(0.0), isnan(_2108));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2110.xy, uint(rint(_2110.z)), _626);
    float3 _2119 = float3(_630, _622, float(int(_576)));
    float3 _2121 = select(_2119, float3(0.0), isnan(_2119));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2121.xy, uint(rint(_2121.z)), _626);
    float _656 = _646 + _452;
    float _658 = -_524;
    float _660 = fma(_626, _658, _622);
    float _662 = _656 + _454;
    float _664 = fma(_626, _464, _630);
    float3 _2146 = float3(_664, _622, float(int(_576)));
    float3 _2148 = select(_2146, float3(0.0), isnan(_2146));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2148.xy, uint(rint(_2148.z)), _626);
    float3 _2157 = float3(_664, _634, float(int(_576)));
    float3 _2159 = select(_2157, float3(0.0), isnan(_2157));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2159.xy, uint(rint(_2159.z)), _626);
    float3 _2168 = float3(_650, _622, float(int(_576)));
    float3 _2170 = select(_2168, float3(0.0), isnan(_2168));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2170.xy, uint(rint(_2170.z)), _626);
    float3 _2179 = float3(_664, _660, float(int(_576)));
    float3 _2181 = select(_2179, float3(0.0), isnan(_2179));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2181.xy, uint(rint(_2181.z)), _626);
    float3 _2190 = float3(_630, _660, float(int(_576)));
    float3 _2192 = select(_2190, float3(0.0), isnan(_2190));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2192.xy, uint(rint(_2192.z)), _626);
    float3 _2201 = float3(_650, _660, float(int(_576)));
    float3 _2203 = select(_2201, float3(0.0), isnan(_2201));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2203.xy, uint(rint(_2203.z)), _626);
    float _678 = _210 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _680 = _210 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _682 = _210 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _684 = _210 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _686 = _210 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _688 = _210 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _690 = _210 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _692 = _210 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _694 = -_200;
    float _696 = _694 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _698 = _210 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _700 = -_210;
    float _702 = _700 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _704 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[27].x, _684);
    float _706 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[28].x, _682);
    float _708 = _702 * _702;
    float _710 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[29].x, _698);
    float _712 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[30].x, _678);
    float _714 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[31].x, _688);
    float _716 = fma(_696, _696, _708);
    float _718 = -_192;
    float _720 = _718 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _722 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[32].x, _690);
    float _724 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[33].x, _692);
    float _726 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[28].z, _706);
    float _728 = fma(_720, _720, _716);
    float _730 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[29].z, _710);
    float _732 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[30].z, _712);
    float _734 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[31].z, _714);
    float _736 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[32].z, _722);
    float _738 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[33].z, _724);
    float _740 = sqrt(_728);
    float _742 = _726 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _744 = _732 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _746 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[26].x, _686);
    float _748 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[27].z, _704);
    float _750 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[25].x, _680);
    float _752 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[26].z, _746);
    float _754 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[25].z, _750);
    bool _756 = _740 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _758 = _740 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _760 = !_756;
    int _762 = _760 ? 0 : 1;
    int _764 = 2;
    float _766 = _742;
    float _768 = _744;
    if (!_756)
    {
        _764 = 1;
    }
    int _770 = _764;
    int _772 = _770;
    if (!_758)
    {
        _772 = _762;
    }
    int _774 = _772;
    float _776 = float(_774);
    float _778 = _730 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _780 = precise::min(_776, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _782 = _780 != 1.0;
    bool _784 = isnan(_780);
    bool _786 = _782 || _784;
    bool _788 = isnan(1.0);
    bool _790 = _786 || _788;
    float _792 = _778;
    if (_790)
    {
        float _794 = _734 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _766 = _794;
    }
    float _796 = _766;
    float _798 = _796;
    if (_790)
    {
        float _800 = _736 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _792 = _800;
    }
    float _802 = _792;
    float _804 = _802;
    if (_790)
    {
        float _806 = _738 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _768 = _806;
    }
    float _808 = _768;
    bool _810 = _780 != 0.0;
    bool _812 = isnan(_780);
    bool _814 = _810 || _812;
    bool _816 = isnan(0.0);
    bool _818 = _814 || _816;
    float _820 = rint(_780);
    float _822 = precise::max(_820, 0.0);
    uint _824 = uint(_822);
    uint _826 = clamp(_824, 0u, 65535u);
    float _828 = _808;
    if (!_818)
    {
        float _830 = _748 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _828 = _830;
    }
    float _832 = _828;
    if (!_818)
    {
        float _834 = _752 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _804 = _834;
    }
    float _836 = _804;
    if (!_818)
    {
        float _838 = _754 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _798 = _838;
    }
    float _840 = _798;
    float _842 = 0.0 + _832;
    float _844 = precise::clamp(_842, 0.0, 1.0);
    float _846 = fma(_524, _844, _836);
    float _848 = -_464;
    float _850 = fma(_848, _844, _840);
    float _852 = fma(_464, _844, _840);
    float3 _2532 = float3(_840, _846, float(int(_826)));
    float3 _2534 = select(_2532, float3(0.0), isnan(_2532));
    float _854 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2534.xy, uint(rint(_2534.z)), _844);
    float3 _2543 = float3(_850, _846, float(int(_826)));
    float3 _2545 = select(_2543, float3(0.0), isnan(_2543));
    float _856 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2545.xy, uint(rint(_2545.z)), _844);
    float3 _2554 = float3(_852, _846, float(int(_826)));
    float3 _2556 = select(_2554, float3(0.0), isnan(_2554));
    float _858 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2556.xy, uint(rint(_2556.z)), _844);
    float3 _2565 = float3(_852, _836, float(int(_826)));
    float3 _2567 = select(_2565, float3(0.0), isnan(_2565));
    float _860 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2567.xy, uint(rint(_2567.z)), _844);
    float3 _2576 = float3(_840, _836, float(int(_826)));
    float3 _2578 = select(_2576, float3(0.0), isnan(_2576));
    float _862 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2578.xy, uint(rint(_2578.z)), _844);
    float _864 = -_524;
    float _866 = fma(_864, _844, _836);
    float3 _2593 = float3(_850, _836, float(int(_826)));
    float3 _2595 = select(_2593, float3(0.0), isnan(_2593));
    float _868 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2595.xy, uint(rint(_2595.z)), _844);
    float3 _2604 = float3(_852, _866, float(int(_826)));
    float3 _2606 = select(_2604, float3(0.0), isnan(_2604));
    float _870 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2606.xy, uint(rint(_2606.z)), _844);
    float3 _2615 = float3(_840, _866, float(int(_826)));
    float3 _2617 = select(_2615, float3(0.0), isnan(_2615));
    float _872 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2617.xy, uint(rint(_2617.z)), _844);
    float3 _2626 = float3(_850, _866, float(int(_826)));
    float3 _2628 = select(_2626, float3(0.0), isnan(_2626));
    float _874 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2628.xy, uint(rint(_2628.z)), _844);
    float2 _2634 = float2(_56, _58);
    float _876 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2634, float2(0.0), isnan(_2634))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2634, float2(0.0), isnan(_2634))).x;
    float _878 = _662 + _632;
    float _880 = -_192;
    float _882 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _884 = _880 + _882;
    float _886 = -_192;
    float _888 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _890 = _886 + _888;
    float _892 = _884 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _894 = precise::clamp(_892, 0.0, 1.0);
    float _896 = _878 + _640;
    float _898 = _896 + _642;
    float _900 = _668 + _644;
    float _902 = _900 + _652;
    float _904 = _902 + _666;
    float _906 = _904 + _654;
    float _908 = _906 + _670;
    float _910 = _908 + _672;
    float _912 = _910 + _674;
    float _914 = fma(_898, 0.111111111938953399658203125, _894);
    float _916 = _912 + _676;
    float _918 = _916 * 0.111111111938953399658203125;
    float _920 = _858 + _854;
    float _922 = _920 + _856;
    float _924 = _922 + _860;
    float _926 = _924 + _862;
    float _928 = _926 + _868;
    float _930 = _928 + _870;
    float _932 = _930 + _872;
    float _934 = _932 + _874;
    float _936 = _934 * 0.111111111938953399658203125;
    float _938 = _936 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _940 = fma(_918, (*spvDescriptorSet0.fp_c3)._m0[49].z, _938);
    float _942 = _890 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _944 = precise::clamp(_942, 0.0, 1.0);
    float _946 = _940 + _944;
    out.m_49.x = _876;
    out.m_49.y = _914;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _946;
    return out;
}

