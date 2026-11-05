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
    bool _296 = false;
    bool _294 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _955 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_955, float2(0.0), isnan(_955)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _972 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_972, float2(0.0), isnan(_972))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_972, float2(0.0), isnan(_972))).x;
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
    bool _218 = !_202;
    int _221 = _218 ? 0 : 1;
    float _223 = fma(_196, _196, _216);
    int _225 = 2;
    if (!_202)
    {
        _225 = 1;
    }
    int _227 = _225;
    float _229 = rsqrt(_223);
    int _231 = _227;
    if (!_208)
    {
        _231 = _221;
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
    int _244 = int(_242) << 2;
    float _246 = _188 * _229;
    float _248 = _192 * _229;
    float _250 = _196 * _229;
    uint _252 = uint(int(uint(_244) >> uint(2)));
    uint _254 = uint(int(uint(int(_252)) >> uint(2)));
    int _256 = int(_252) & 3;
    float _258 = (*spvDescriptorSet0.fp_c1)._m0[int(_254)][_256];
    float _260 = _246 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _262 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[35].x, _260);
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
    float _284 = fma(_248, _282, _184);
    float _286 = fma(_246, _282, _210);
    float _288 = fma(_250, _282, _176);
    bool _290 = as_type<int>(_258) == 1392;
    if (!_290)
    {
        bool _292 = as_type<int>(_258) == 1664;
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
            _334 = _326;
            _336 = _322;
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
            _334 = _366;
            _336 = _362;
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
            _334 = _398;
            _336 = _394;
        }
    }
    float _402 = _330;
    float _404 = _332;
    float _406 = _334;
    float _408 = _336;
    float _410 = float(int(_240));
    float _412 = 1.0 / _402;
    float _414 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _416 = rint(_410);
    float _418 = precise::max(_416, 0.0);
    uint _420 = uint(_418);
    uint _422 = clamp(_420, 0u, 65535u);
    float _424 = _412 * _404;
    float _426 = _412 * _406;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = _412 * _408;
    float _432 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _434 = fma(_428, _414, _424);
    float _436 = fma(_428, _432, _430);
    float _438 = -_432;
    float _440 = fma(_428, _438, _430);
    float3 _1649 = float3(_430, _434, float(int(_422)));
    float3 _1653 = select(_1649, float3(0.0), isnan(_1649));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1653.xy, uint(rint(_1653.z)), _428);
    float3 _1662 = float3(_436, _434, float(int(_422)));
    float3 _1664 = select(_1662, float3(0.0), isnan(_1662));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1664.xy, uint(rint(_1664.z)), _428);
    float3 _1673 = float3(_440, _434, float(int(_422)));
    float3 _1675 = select(_1673, float3(0.0), isnan(_1673));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1675.xy, uint(rint(_1675.z)), _428);
    float _448 = -_414;
    float _450 = fma(_428, _448, _424);
    float3 _1690 = float3(_436, _424, float(int(_422)));
    float3 _1692 = select(_1690, float3(0.0), isnan(_1690));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1692.xy, uint(rint(_1692.z)), _428);
    float3 _1701 = float3(_430, _424, float(int(_422)));
    float3 _1703 = select(_1701, float3(0.0), isnan(_1701));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1703.xy, uint(rint(_1703.z)), _428);
    float3 _1712 = float3(_440, _424, float(int(_422)));
    float3 _1714 = select(_1712, float3(0.0), isnan(_1712));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1714.xy, uint(rint(_1714.z)), _428);
    float3 _1723 = float3(_436, _450, float(int(_422)));
    float3 _1725 = select(_1723, float3(0.0), isnan(_1723));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1725.xy, uint(rint(_1725.z)), _428);
    float _460 = -_210;
    float _462 = _460 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _464 = -_184;
    float _466 = _464 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _468 = _210 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _470 = _462 * _462;
    float _472 = fma(_466, _466, _470);
    float _474 = -_176;
    float _476 = _474 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _478 = fma(_476, _476, _472);
    float _480 = sqrt(_478);
    float _482 = _210 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _484 = _480 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _486 = _480 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _488 = !_484;
    int _490 = _488 ? 0 : 1;
    int _492 = 2;
    if (!_484)
    {
        _492 = 1;
    }
    int _494 = _492;
    int _496 = _494;
    if (!_486)
    {
        _496 = _490;
    }
    int _498 = _496;
    float _500 = _210 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _502 = _210 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _504 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[22].x, _468);
    float _506 = float(_498);
    float _508 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[21].x, _500);
    float _510 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[19].x, _502);
    float _512 = _210 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _514 = precise::min(_506, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _516 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[21].z, _508);
    float _518 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[24].x, _482);
    float _520 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[19].z, _510);
    bool _522 = _514 != 1.0;
    bool _524 = isnan(_514);
    bool _526 = _522 || _524;
    bool _528 = isnan(1.0);
    bool _530 = _526 || _528;
    float _532 = _210 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _534 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[22].z, _504);
    float _536 = _516 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _538 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[20].x, _512);
    float _540 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[24].z, _518);
    float _542 = _520 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    bool _544 = _514 != 0.0;
    bool _546 = isnan(_514);
    bool _548 = _544 || _546;
    bool _550 = isnan(0.0);
    bool _552 = _548 || _550;
    float _554 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[23].x, _532);
    float _556 = _210 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _558 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[20].z, _538);
    float _560 = _210 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _562 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[23].z, _554);
    float _564 = _536;
    float _566 = _542;
    if (_530)
    {
        float _568 = _540 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _564 = _568;
    }
    float _570 = _564;
    float _572 = _570;
    if (_530)
    {
        float _574 = _534 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _566 = _574;
    }
    float _576 = _566;
    float _578 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[18].x, _556);
    float _580 = rint(_514);
    float _582 = precise::max(_580, 0.0);
    uint _584 = uint(_582);
    uint _586 = clamp(_584, 0u, 65535u);
    float _588 = _210 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _590 = _558 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _592 = _590;
    float _594 = _576;
    if (_530)
    {
        float _596 = _562 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _592 = _596;
    }
    float _598 = _592;
    float _600 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[17].x, _560);
    float _602 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[18].z, _578);
    float _604 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[16].x, _588);
    float _606 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _608 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[17].z, _600);
    float _610 = _598;
    if (!_552)
    {
        float _612 = _602 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _572 = _612;
    }
    float _614 = _572;
    float _616 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[16].z, _604);
    float _618 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    if (!_552)
    {
        float _620 = _608 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _610 = _620;
    }
    float _622 = _610;
    float _624 = 0.0 + _614;
    float _626 = precise::clamp(_624, 0.0, 1.0);
    if (!_552)
    {
        float _628 = _616 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _594 = _628;
    }
    float _630 = _594;
    float _632 = fma(_626, _618, _622);
    float _634 = -_606;
    float _636 = fma(_626, _634, _630);
    float _638 = fma(_626, _606, _630);
    float _640 = _444 + _442;
    float3 _2069 = float3(_430, _450, float(int(_422)));
    float3 _2071 = select(_2069, float3(0.0), isnan(_2069));
    float _642 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2071.xy, uint(rint(_2071.z)), _428);
    float3 _2080 = float3(_440, _450, float(int(_422)));
    float3 _2082 = select(_2080, float3(0.0), isnan(_2080));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2082.xy, uint(rint(_2082.z)), _428);
    float3 _2091 = float3(_630, _632, float(int(_586)));
    float3 _2093 = select(_2091, float3(0.0), isnan(_2091));
    float _646 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2093.xy, uint(rint(_2093.z)), _626);
    float _648 = _640 + _446;
    float3 _2105 = float3(_636, _632, float(int(_586)));
    float3 _2107 = select(_2105, float3(0.0), isnan(_2105));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2107.xy, uint(rint(_2107.z)), _626);
    float3 _2116 = float3(_638, _622, float(int(_586)));
    float3 _2118 = select(_2116, float3(0.0), isnan(_2116));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2118.xy, uint(rint(_2118.z)), _626);
    float3 _2127 = float3(_638, _632, float(int(_586)));
    float3 _2129 = select(_2127, float3(0.0), isnan(_2127));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2129.xy, uint(rint(_2129.z)), _626);
    float _656 = _648 + _452;
    float _658 = -_618;
    float _660 = fma(_626, _658, _622);
    float _662 = _656 + _454;
    float _664 = _662 + _456;
    float _666 = _664 + _458;
    float3 _2156 = float3(_630, _622, float(int(_586)));
    float3 _2158 = select(_2156, float3(0.0), isnan(_2156));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2158.xy, uint(rint(_2158.z)), _626);
    float3 _2167 = float3(_636, _622, float(int(_586)));
    float3 _2169 = select(_2167, float3(0.0), isnan(_2167));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2169.xy, uint(rint(_2169.z)), _626);
    float3 _2178 = float3(_638, _660, float(int(_586)));
    float3 _2180 = select(_2178, float3(0.0), isnan(_2178));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2180.xy, uint(rint(_2180.z)), _626);
    float3 _2189 = float3(_630, _660, float(int(_586)));
    float3 _2191 = select(_2189, float3(0.0), isnan(_2189));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2191.xy, uint(rint(_2191.z)), _626);
    float _676 = _210 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _678 = _210 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _680 = _210 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _682 = _210 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _684 = _210 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _686 = _210 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _688 = _210 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _690 = _210 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _692 = _210 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _694 = -_210;
    float _696 = _694 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _698 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[27].x, _680);
    float _700 = -_184;
    float _702 = _700 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _704 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[25].x, _676);
    float _706 = _696 * _696;
    float _708 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[26].x, _678);
    float _710 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[28].x, _692);
    float _712 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[29].x, _686);
    float _714 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[30].x, _684);
    float _716 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[31].x, _688);
    float _718 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[32].x, _690);
    float _720 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[33].x, _682);
    float _722 = fma(_702, _702, _706);
    float _724 = -_176;
    float _726 = _724 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _728 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[28].z, _710);
    float _730 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[29].z, _712);
    float _732 = fma(_726, _726, _722);
    float _734 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[30].z, _714);
    float _736 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[31].z, _716);
    float _738 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[32].z, _718);
    float _740 = _730 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _742 = _734 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _744 = sqrt(_732);
    float _746 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[27].z, _698);
    float _748 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[26].z, _708);
    float _750 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[25].z, _704);
    bool _752 = _744 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _754 = _744 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _756 = !_752;
    int _758 = _756 ? 0 : 1;
    int _760 = 2;
    float _762 = _740;
    float _764 = _742;
    if (!_752)
    {
        _760 = 1;
    }
    int _766 = _760;
    int _768 = _766;
    if (!_754)
    {
        _768 = _758;
    }
    int _770 = _768;
    float _772 = float(_770);
    float _774 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[33].z, _720);
    float _776 = _728 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _778 = precise::min(_772, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _780 = _778 != 1.0;
    bool _782 = isnan(_778);
    bool _784 = _780 || _782;
    bool _786 = isnan(1.0);
    bool _788 = _784 || _786;
    float _790 = _776;
    if (_788)
    {
        float _792 = _736 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _790 = _792;
    }
    float _794 = _790;
    float _796 = _794;
    if (_788)
    {
        float _798 = _738 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _762 = _798;
    }
    float _800 = _762;
    float _802 = _800;
    if (_788)
    {
        float _804 = _774 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _764 = _804;
    }
    float _806 = _764;
    bool _808 = _778 != 0.0;
    bool _810 = isnan(_778);
    bool _812 = _808 || _810;
    bool _814 = isnan(0.0);
    bool _816 = _812 || _814;
    float _818 = rint(_778);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    uint _824 = clamp(_822, 0u, 65535u);
    float _826 = _806;
    if (!_816)
    {
        float _828 = _746 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _826 = _828;
    }
    float _830 = _826;
    if (!_816)
    {
        float _832 = _748 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _802 = _832;
    }
    float _834 = _802;
    if (!_816)
    {
        float _836 = _750 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _796 = _836;
    }
    float _838 = _796;
    float _840 = 0.0 + _830;
    float _842 = precise::clamp(_840, 0.0, 1.0);
    float _844 = fma(_618, _842, _834);
    float _846 = fma(_606, _842, _838);
    float3 _2514 = float3(_636, _660, float(int(_586)));
    float3 _2516 = select(_2514, float3(0.0), isnan(_2514));
    float _848 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2516.xy, uint(rint(_2516.z)), _626);
    float _850 = -_606;
    float _852 = fma(_850, _842, _838);
    float3 _2531 = float3(_838, _844, float(int(_824)));
    float3 _2533 = select(_2531, float3(0.0), isnan(_2531));
    float _854 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2533.xy, uint(rint(_2533.z)), _842);
    float3 _2542 = float3(_846, _844, float(int(_824)));
    float3 _2544 = select(_2542, float3(0.0), isnan(_2542));
    float _856 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2544.xy, uint(rint(_2544.z)), _842);
    float3 _2553 = float3(_852, _844, float(int(_824)));
    float3 _2555 = select(_2553, float3(0.0), isnan(_2553));
    float _858 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2555.xy, uint(rint(_2555.z)), _842);
    float3 _2564 = float3(_846, _834, float(int(_824)));
    float3 _2566 = select(_2564, float3(0.0), isnan(_2564));
    float _860 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2566.xy, uint(rint(_2566.z)), _842);
    float _862 = -_618;
    float _864 = fma(_862, _842, _834);
    float3 _2581 = float3(_838, _834, float(int(_824)));
    float3 _2583 = select(_2581, float3(0.0), isnan(_2581));
    float _866 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2583.xy, uint(rint(_2583.z)), _842);
    float3 _2592 = float3(_852, _834, float(int(_824)));
    float3 _2594 = select(_2592, float3(0.0), isnan(_2592));
    float _868 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2594.xy, uint(rint(_2594.z)), _842);
    float3 _2603 = float3(_846, _864, float(int(_824)));
    float3 _2605 = select(_2603, float3(0.0), isnan(_2603));
    float _870 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2605.xy, uint(rint(_2605.z)), _842);
    float3 _2614 = float3(_838, _864, float(int(_824)));
    float3 _2616 = select(_2614, float3(0.0), isnan(_2614));
    float _872 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2616.xy, uint(rint(_2616.z)), _842);
    float3 _2625 = float3(_852, _864, float(int(_824)));
    float3 _2627 = select(_2625, float3(0.0), isnan(_2625));
    float _874 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2627.xy, uint(rint(_2627.z)), _842);
    float _876 = _666 + _642;
    float _878 = _876 + _644;
    float _880 = -_176;
    float _882 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _884 = _880 + _882;
    float _886 = _654 + _646;
    float _888 = _884 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _890 = precise::clamp(_888, 0.0, 1.0);
    float _892 = _886 + _650;
    float _894 = fma(_878, 0.111111111938953399658203125, _890);
    float _896 = -_176;
    float _898 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _900 = _896 + _898;
    float _902 = _892 + _652;
    float _904 = _900 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _906 = precise::clamp(_904, 0.0, 1.0);
    float _908 = _902 + _668;
    float _910 = _908 + _670;
    float _912 = _910 + _672;
    float _914 = _912 + _674;
    float _916 = _914 + _848;
    float _918 = _856 + _854;
    float _920 = _916 * 0.111111111938953399658203125;
    float _922 = _918 + _858;
    float _924 = _922 + _860;
    float _926 = _924 + _866;
    float _928 = _926 + _868;
    float _930 = _928 + _870;
    float _932 = _930 + _872;
    float _934 = _932 + _874;
    float _936 = _934 * 0.111111111938953399658203125;
    float _938 = _936 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _940 = fma(_920, (*spvDescriptorSet0.fp_c3)._m0[49].z, _938);
    float _942 = _940 + _906;
    out.m_47.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_47.y = _894;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _942;
    return out;
}

