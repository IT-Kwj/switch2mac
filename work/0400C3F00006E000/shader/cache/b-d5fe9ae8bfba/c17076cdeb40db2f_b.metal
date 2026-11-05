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
    float2 _949 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_949, float2(0.0), isnan(_949)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _966 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_966, float2(0.0), isnan(_966))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_966, float2(0.0), isnan(_966))).x;
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
    float _200 = _192 * _76;
    float _202 = fma(_188, _188, _194);
    float _204 = -_192;
    bool _208 = _204 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _210 = _192 * _72;
    float _212 = -_192;
    bool _214 = _212 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _216 = fma(_198, _198, _202);
    bool _218 = !_208;
    uint _221 = uint(_218 ? 0 : 1);
    float _223 = rsqrt(_216);
    uint _225 = 2u;
    if (!_208)
    {
        _225 = 1u;
    }
    uint _227 = _225;
    uint _229 = _227;
    if (!_214)
    {
        _229 = _221;
    }
    uint _231 = _229;
    uint _233 = min(_231, 2u);
    float _235 = _182 * _223;
    float _237 = _188 * _223;
    int _240 = int(_233) << 2;
    float _242 = _198 * _223;
    float _244 = _235 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _246 = uint(int(uint(_240) >> uint(2)));
    uint _248 = uint(int(uint(int(_246)) >> uint(2)));
    int _250 = int(_246) & 3;
    float _252 = (*spvDescriptorSet0.fp_c1)._m0[int(_248)][_250];
    float _254 = fma(_237, (*spvDescriptorSet0.fp_c3)._m0[35].x, _244);
    float _256 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[35].z, _254);
    float _258 = abs(_256);
    float _260 = -_258;
    float _262 = _260 + 1.0;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = abs(_264);
    float _268 = log2(_266);
    float _270 = _268 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _272 = exp2(_270);
    float _274 = _272 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _276 = fma(_237, _274, _200);
    float _278 = fma(_235, _274, _210);
    float _280 = fma(_242, _274, _192);
    bool _282 = as_type<int>(_252) == 1344;
    if (!_282)
    {
        bool _284 = as_type<int>(_252) == 1616;
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
            _326 = _316;
            _328 = _314;
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
            _326 = _356;
            _328 = _354;
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
            _326 = _388;
            _328 = _386;
        }
    }
    float _394 = _322;
    float _396 = _324;
    float _398 = _326;
    float _400 = _328;
    float _402 = float(int(_231));
    float _404 = 1.0 / _394;
    float _406 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _408 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _410 = rint(_402);
    float _412 = precise::max(_410, 0.0);
    uint _414 = uint(_412);
    uint _416 = clamp(_414, 0u, 65535u);
    float _418 = _404 * _396;
    float _420 = precise::clamp(_418, 0.0, 1.0);
    float _422 = _404 * _398;
    float _424 = _404 * _400;
    float _426 = fma(_420, _406, _422);
    float _428 = fma(_420, _408, _424);
    float _430 = -_408;
    float _432 = fma(_420, _430, _424);
    float3 _1627 = float3(_424, _426, float(int(_416)));
    float3 _1631 = select(_1627, float3(0.0), isnan(_1627));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1631.xy, uint(rint(_1631.z)), _420);
    float3 _1640 = float3(_428, _426, float(int(_416)));
    float3 _1642 = select(_1640, float3(0.0), isnan(_1640));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1642.xy, uint(rint(_1642.z)), _420);
    float3 _1651 = float3(_432, _426, float(int(_416)));
    float3 _1653 = select(_1651, float3(0.0), isnan(_1651));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1653.xy, uint(rint(_1653.z)), _420);
    float3 _1662 = float3(_428, _422, float(int(_416)));
    float3 _1664 = select(_1662, float3(0.0), isnan(_1662));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1664.xy, uint(rint(_1664.z)), _420);
    float3 _1673 = float3(_424, _422, float(int(_416)));
    float3 _1675 = select(_1673, float3(0.0), isnan(_1673));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1675.xy, uint(rint(_1675.z)), _420);
    float3 _1684 = float3(_432, _422, float(int(_416)));
    float3 _1686 = select(_1684, float3(0.0), isnan(_1684));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1686.xy, uint(rint(_1686.z)), _420);
    float _446 = -_210;
    float _448 = _446 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _450 = -_200;
    float _452 = _450 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _454 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _456 = -_406;
    float _458 = fma(_420, _456, _422);
    float _460 = _448 * _448;
    float _462 = _210 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _464 = _210 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _466 = fma(_452, _452, _460);
    float _468 = -_192;
    float _470 = _468 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _472 = _210 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _474 = _210 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _476 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[24].x, _462);
    float _478 = fma(_470, _470, _466);
    float _480 = _210 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _482 = _210 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _484 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[22].x, _472);
    float _486 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[23].x, _474);
    float _488 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[19].x, _480);
    float _490 = sqrt(_478);
    float _492 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[20].x, _482);
    float _494 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[22].z, _484);
    float _496 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[19].z, _488);
    float _498 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[23].z, _486);
    float _500 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[20].z, _492);
    float _502 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[18].x, _464);
    float _504 = _496 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _506 = _210 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _508 = _500 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _510 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[24].z, _476);
    float _512 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[18].z, _502);
    float _514 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    bool _516 = _490 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _518 = _490 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _520 = !_516;
    int _522 = _520 ? 0 : 1;
    int _524 = 2;
    float _526 = _504;
    float _528 = _508;
    if (!_516)
    {
        _524 = 1;
    }
    int _530 = _524;
    int _532 = _530;
    if (!_518)
    {
        _532 = _522;
    }
    int _534 = _532;
    float _536 = float(_534);
    float _538 = precise::min(_536, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _540 = _538 != 1.0;
    bool _542 = isnan(_538);
    bool _544 = _540 || _542;
    bool _546 = isnan(1.0);
    bool _548 = _544 || _546;
    bool _550 = _538 != 0.0;
    bool _552 = isnan(_538);
    bool _554 = _550 || _552;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    float _560 = rint(_538);
    float _562 = precise::max(_560, 0.0);
    uint _564 = uint(_562);
    uint _566 = clamp(_564, 0u, 65535u);
    if (_548)
    {
        float _568 = _494 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _526 = _568;
    }
    float _570 = _526;
    float _572 = _210 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _574 = _570;
    if (_548)
    {
        float _576 = _498 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _528 = _576;
    }
    float _578 = _528;
    float _580 = _210 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _582 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[21].x, _572);
    float _584 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[17].x, _580);
    float _586 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[21].z, _582);
    float _588 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[16].x, _506);
    float _590 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[17].z, _584);
    float _592 = _586 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _594 = _592;
    float _596 = _578;
    if (_548)
    {
        float _598 = _510 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _594 = _598;
    }
    float _600 = _594;
    float _602 = _600;
    if (!_558)
    {
        float _604 = _512 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _602 = _604;
    }
    float _606 = _602;
    float _608 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[16].z, _588);
    if (!_558)
    {
        float _610 = _590 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _596 = _610;
    }
    float _612 = _596;
    float _614 = 0.0 + _606;
    float _616 = precise::clamp(_614, 0.0, 1.0);
    if (!_558)
    {
        float _618 = _608 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _574 = _618;
    }
    float _620 = _574;
    float3 _2019 = float3(_428, _458, float(int(_416)));
    float3 _2021 = select(_2019, float3(0.0), isnan(_2019));
    float _622 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2021.xy, uint(rint(_2021.z)), _420);
    float _624 = fma(_616, _514, _612);
    float _626 = _436 + _434;
    float _628 = _626 + _438;
    float3 _2040 = float3(_424, _458, float(int(_416)));
    float3 _2042 = select(_2040, float3(0.0), isnan(_2040));
    float _630 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2042.xy, uint(rint(_2042.z)), _420);
    float3 _2051 = float3(_432, _458, float(int(_416)));
    float3 _2053 = select(_2051, float3(0.0), isnan(_2051));
    float _632 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2053.xy, uint(rint(_2053.z)), _420);
    float3 _2062 = float3(_620, _624, float(int(_566)));
    float3 _2064 = select(_2062, float3(0.0), isnan(_2062));
    float _634 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2064.xy, uint(rint(_2064.z)), _616);
    float _636 = _628 + _440;
    float _638 = -_454;
    float _640 = fma(_616, _638, _620);
    float3 _2082 = float3(_640, _624, float(int(_566)));
    float3 _2084 = select(_2082, float3(0.0), isnan(_2082));
    float _642 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2084.xy, uint(rint(_2084.z)), _616);
    float3 _2093 = float3(_620, _612, float(int(_566)));
    float3 _2095 = select(_2093, float3(0.0), isnan(_2093));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2095.xy, uint(rint(_2095.z)), _616);
    float _646 = _636 + _442;
    float _648 = -_514;
    float _650 = fma(_616, _648, _612);
    float _652 = _646 + _444;
    float _654 = fma(_616, _454, _620);
    float3 _2120 = float3(_654, _612, float(int(_566)));
    float3 _2122 = select(_2120, float3(0.0), isnan(_2120));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2122.xy, uint(rint(_2122.z)), _616);
    float3 _2131 = float3(_654, _624, float(int(_566)));
    float3 _2133 = select(_2131, float3(0.0), isnan(_2131));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2133.xy, uint(rint(_2133.z)), _616);
    float3 _2142 = float3(_640, _612, float(int(_566)));
    float3 _2144 = select(_2142, float3(0.0), isnan(_2142));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2144.xy, uint(rint(_2144.z)), _616);
    float3 _2153 = float3(_654, _650, float(int(_566)));
    float3 _2155 = select(_2153, float3(0.0), isnan(_2153));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2155.xy, uint(rint(_2155.z)), _616);
    float3 _2164 = float3(_620, _650, float(int(_566)));
    float3 _2166 = select(_2164, float3(0.0), isnan(_2164));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2166.xy, uint(rint(_2166.z)), _616);
    float3 _2175 = float3(_640, _650, float(int(_566)));
    float3 _2177 = select(_2175, float3(0.0), isnan(_2175));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2177.xy, uint(rint(_2177.z)), _616);
    float _668 = _210 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _670 = _210 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _672 = _210 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _674 = _210 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _676 = _210 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _678 = _210 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _680 = _210 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _682 = _210 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _684 = -_200;
    float _686 = _684 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _688 = _210 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _690 = -_210;
    float _692 = _690 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _694 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[27].x, _674);
    float _696 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[28].x, _672);
    float _698 = _692 * _692;
    float _700 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[29].x, _688);
    float _702 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[30].x, _668);
    float _704 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[31].x, _678);
    float _706 = fma(_686, _686, _698);
    float _708 = -_192;
    float _710 = _708 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _712 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[32].x, _680);
    float _714 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[33].x, _682);
    float _716 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[28].z, _696);
    float _718 = fma(_710, _710, _706);
    float _720 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[29].z, _700);
    float _722 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[30].z, _702);
    float _724 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[31].z, _704);
    float _726 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[32].z, _712);
    float _728 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[33].z, _714);
    float _730 = sqrt(_718);
    float _732 = _716 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _734 = _722 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _736 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[26].x, _676);
    float _738 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[27].z, _694);
    float _740 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[25].x, _670);
    float _742 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[26].z, _736);
    float _744 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[25].z, _740);
    bool _746 = _730 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _748 = _730 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _750 = !_746;
    int _752 = _750 ? 0 : 1;
    int _754 = 2;
    float _756 = _732;
    float _758 = _734;
    if (!_746)
    {
        _754 = 1;
    }
    int _760 = _754;
    int _762 = _760;
    if (!_748)
    {
        _762 = _752;
    }
    int _764 = _762;
    float _766 = float(_764);
    float _768 = _720 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _770 = precise::min(_766, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _772 = _770 != 1.0;
    bool _774 = isnan(_770);
    bool _776 = _772 || _774;
    bool _778 = isnan(1.0);
    bool _780 = _776 || _778;
    float _782 = _768;
    if (_780)
    {
        float _784 = _724 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _756 = _784;
    }
    float _786 = _756;
    float _788 = _786;
    if (_780)
    {
        float _790 = _726 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _782 = _790;
    }
    float _792 = _782;
    float _794 = _792;
    if (_780)
    {
        float _796 = _728 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _758 = _796;
    }
    float _798 = _758;
    bool _800 = _770 != 0.0;
    bool _802 = isnan(_770);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    float _810 = rint(_770);
    float _812 = precise::max(_810, 0.0);
    uint _814 = uint(_812);
    uint _816 = clamp(_814, 0u, 65535u);
    float _818 = _798;
    if (!_808)
    {
        float _820 = _738 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _818 = _820;
    }
    float _822 = _818;
    if (!_808)
    {
        float _824 = _742 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _794 = _824;
    }
    float _826 = _794;
    if (!_808)
    {
        float _828 = _744 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _788 = _828;
    }
    float _830 = _788;
    float _832 = 0.0 + _822;
    float _834 = precise::clamp(_832, 0.0, 1.0);
    float _836 = fma(_514, _834, _826);
    float _838 = -_454;
    float _840 = fma(_838, _834, _830);
    float _842 = fma(_454, _834, _830);
    float3 _2506 = float3(_830, _836, float(int(_816)));
    float3 _2508 = select(_2506, float3(0.0), isnan(_2506));
    float _844 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2508.xy, uint(rint(_2508.z)), _834);
    float3 _2517 = float3(_840, _836, float(int(_816)));
    float3 _2519 = select(_2517, float3(0.0), isnan(_2517));
    float _846 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2519.xy, uint(rint(_2519.z)), _834);
    float3 _2528 = float3(_842, _836, float(int(_816)));
    float3 _2530 = select(_2528, float3(0.0), isnan(_2528));
    float _848 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2530.xy, uint(rint(_2530.z)), _834);
    float3 _2539 = float3(_842, _826, float(int(_816)));
    float3 _2541 = select(_2539, float3(0.0), isnan(_2539));
    float _850 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2541.xy, uint(rint(_2541.z)), _834);
    float3 _2550 = float3(_830, _826, float(int(_816)));
    float3 _2552 = select(_2550, float3(0.0), isnan(_2550));
    float _852 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2552.xy, uint(rint(_2552.z)), _834);
    float _854 = -_514;
    float _856 = fma(_854, _834, _826);
    float3 _2567 = float3(_840, _826, float(int(_816)));
    float3 _2569 = select(_2567, float3(0.0), isnan(_2567));
    float _858 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2569.xy, uint(rint(_2569.z)), _834);
    float3 _2578 = float3(_842, _856, float(int(_816)));
    float3 _2580 = select(_2578, float3(0.0), isnan(_2578));
    float _860 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2580.xy, uint(rint(_2580.z)), _834);
    float3 _2589 = float3(_830, _856, float(int(_816)));
    float3 _2591 = select(_2589, float3(0.0), isnan(_2589));
    float _862 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2591.xy, uint(rint(_2591.z)), _834);
    float3 _2600 = float3(_840, _856, float(int(_816)));
    float3 _2602 = select(_2600, float3(0.0), isnan(_2600));
    float _864 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2602.xy, uint(rint(_2602.z)), _834);
    float2 _2608 = float2(_56, _58);
    float _866 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2608, float2(0.0), isnan(_2608))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2608, float2(0.0), isnan(_2608))).x;
    float _868 = _652 + _622;
    float _870 = -_192;
    float _872 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _874 = _870 + _872;
    float _876 = -_192;
    float _878 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _880 = _876 + _878;
    float _882 = _874 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _884 = precise::clamp(_882, 0.0, 1.0);
    float _886 = _868 + _630;
    float _888 = _886 + _632;
    float _890 = _658 + _634;
    float _892 = _890 + _642;
    float _894 = _892 + _656;
    float _896 = _894 + _644;
    float _898 = _896 + _660;
    float _900 = _898 + _662;
    float _902 = _900 + _664;
    float _904 = fma(_888, 0.111111111938953399658203125, _884);
    float _906 = _902 + _666;
    float _908 = _906 * 0.111111111938953399658203125;
    float _910 = _848 + _844;
    float _912 = _910 + _846;
    float _914 = _912 + _850;
    float _916 = _914 + _852;
    float _918 = _916 + _858;
    float _920 = _918 + _860;
    float _922 = _920 + _862;
    float _924 = _922 + _864;
    float _926 = _924 * 0.111111111938953399658203125;
    float _928 = _926 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _930 = fma(_908, (*spvDescriptorSet0.fp_c3)._m0[49].z, _928);
    float _932 = _880 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _934 = precise::clamp(_932, 0.0, 1.0);
    float _936 = _930 + _934;
    out.m_49.x = _866;
    out.m_49.y = _904;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _936;
    return out;
}

