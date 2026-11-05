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
    float2 _1057 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1057, float2(0.0), isnan(_1057)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _1074 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1074, float2(0.0), isnan(_1074))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1074, float2(0.0), isnan(_1074))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_42.x;
    float _76 = in.m_44.y;
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
    float _108 = _74 * _104;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = _98 * _110;
    float _114 = -_106;
    float _116 = fma(_112, _76, _114);
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
    float _172 = _138 * _156;
    float _174 = _134 * _156;
    float _176 = _162 * _170;
    float _178 = _164 * _174;
    float _180 = -_176;
    float _182 = fma(_164, _172, _180);
    float _184 = _168 * _172;
    float _186 = -_178;
    float _188 = fma(_168, _170, _186);
    float _190 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _192 = _166 * _190;
    float _194 = _182 * _182;
    float _196 = -_184;
    float _198 = fma(_162, _174, _196);
    float _200 = _192 * _74;
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
    int _236 = int(_233) << 2;
    float _238 = _182 * _223;
    float _240 = _188 * _223;
    float _242 = _198 * _223;
    float _244 = _238 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _246 = uint(int(uint(_236) >> uint(2)));
    uint _248 = uint(int(uint(int(_246)) >> uint(2)));
    int _250 = int(_246) & 3;
    float _252 = (*spvDescriptorSet0.fp_c1)._m0[int(_248)][_250];
    float _254 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[35].x, _244);
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
    float _276 = fma(_240, _274, _200);
    float _278 = fma(_238, _274, _210);
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
    float _404 = float(int(_231));
    float _406 = rint(_404);
    float _408 = precise::max(_406, 0.0);
    uint _410 = uint(_408);
    uint _412 = clamp(_410, 0u, 65535u);
    float _414 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _416 = _402 * _396;
    float _418 = precise::clamp(_416, 0.0, 1.0);
    float _420 = _402 * _398;
    float _422 = _402 * _400;
    float _424 = _418 * _414;
    float _426 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _428 = fma(_424, 0.5, _420);
    float _430 = _418 * _426;
    float _432 = fma(_424, 1.5, _420);
    float _434 = fma(_424, -0.5, _420);
    float _436 = fma(_424, -1.5, _420);
    float _438 = fma(_430, 1.5, _422);
    float _440 = fma(_430, 0.5, _422);
    float3 _1749 = float3(_428, _438, float(int(_412)));
    float3 _1753 = select(_1749, float3(0.0), isnan(_1749));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1753.xy, uint(rint(_1753.z)), _418);
    float3 _1762 = float3(_432, _438, float(int(_412)));
    float3 _1764 = select(_1762, float3(0.0), isnan(_1762));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1764.xy, uint(rint(_1764.z)), _418);
    float3 _1773 = float3(_434, _438, float(int(_412)));
    float3 _1775 = select(_1773, float3(0.0), isnan(_1773));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1775.xy, uint(rint(_1775.z)), _418);
    float3 _1784 = float3(_436, _438, float(int(_412)));
    float3 _1786 = select(_1784, float3(0.0), isnan(_1784));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1786.xy, uint(rint(_1786.z)), _418);
    float3 _1795 = float3(_432, _440, float(int(_412)));
    float3 _1797 = select(_1795, float3(0.0), isnan(_1795));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1797.xy, uint(rint(_1797.z)), _418);
    float3 _1806 = float3(_428, _440, float(int(_412)));
    float3 _1808 = select(_1806, float3(0.0), isnan(_1806));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1808.xy, uint(rint(_1808.z)), _418);
    float _454 = _444 + _442;
    float _456 = _454 + _446;
    float _458 = _456 + _448;
    float _460 = _458 + _450;
    float _462 = _460 + _452;
    float _464 = fma(_430, -0.5, _422);
    float3 _1835 = float3(_434, _440, float(int(_412)));
    float3 _1837 = select(_1835, float3(0.0), isnan(_1835));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1837.xy, uint(rint(_1837.z)), _418);
    float3 _1846 = float3(_436, _440, float(int(_412)));
    float3 _1848 = select(_1846, float3(0.0), isnan(_1846));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1848.xy, uint(rint(_1848.z)), _418);
    float3 _1857 = float3(_432, _464, float(int(_412)));
    float3 _1859 = select(_1857, float3(0.0), isnan(_1857));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1859.xy, uint(rint(_1859.z)), _418);
    float3 _1868 = float3(_428, _464, float(int(_412)));
    float3 _1870 = select(_1868, float3(0.0), isnan(_1868));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1870.xy, uint(rint(_1870.z)), _418);
    float3 _1879 = float3(_434, _464, float(int(_412)));
    float3 _1881 = select(_1879, float3(0.0), isnan(_1879));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1881.xy, uint(rint(_1881.z)), _418);
    float3 _1890 = float3(_436, _464, float(int(_412)));
    float3 _1892 = select(_1890, float3(0.0), isnan(_1890));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1892.xy, uint(rint(_1892.z)), _418);
    float _478 = fma(_430, -1.5, _422);
    float _480 = -_210;
    float _482 = _480 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _484 = -_200;
    float _486 = _484 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _488 = _482 * _482;
    float _490 = fma(_486, _486, _488);
    float _492 = -_192;
    float _494 = _492 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _496 = fma(_494, _494, _490);
    float _498 = sqrt(_496);
    bool _500 = _498 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _502 = _498 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _504 = !_500;
    int _506 = _504 ? 0 : 1;
    int _508 = 2;
    if (!_500)
    {
        _508 = 1;
    }
    int _510 = _508;
    int _512 = _510;
    if (!_502)
    {
        _512 = _506;
    }
    int _514 = _512;
    float _516 = _210 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _518 = float(_514);
    float _520 = _210 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _522 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[19].x, _516);
    float _524 = _210 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _526 = precise::min(_518, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _528 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[22].x, _520);
    float _530 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[19].z, _522);
    float _532 = _210 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _534 = _526 != 1.0;
    bool _536 = isnan(_526);
    bool _538 = _534 || _536;
    bool _540 = isnan(1.0);
    bool _542 = _538 || _540;
    float _544 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[22].z, _528);
    float _546 = _530 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _548 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[23].x, _532);
    float _550 = _210 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _552 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[23].z, _548);
    float _554 = _546;
    if (_542)
    {
        float _556 = _544 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _554 = _556;
    }
    float _558 = _554;
    float _560 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[20].x, _524);
    float _562 = _210 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _564 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[20].z, _560);
    float _566 = _564 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _568 = _566;
    float _570 = _558;
    if (_542)
    {
        float _572 = _552 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _568 = _572;
    }
    float _574 = _568;
    float _576 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[24].x, _550);
    float _578 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[21].x, _562);
    float3 _2088 = float3(_432, _478, float(int(_412)));
    float3 _2090 = select(_2088, float3(0.0), isnan(_2088));
    float _580 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2090.xy, uint(rint(_2090.z)), _418);
    float _582 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[24].z, _576);
    float _584 = _210 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _586 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[21].z, _578);
    float _588 = _586 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _590 = _588;
    float _592 = _574;
    if (_542)
    {
        float _594 = _582 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _590 = _594;
    }
    float _596 = _590;
    bool _598 = _526 != 0.0;
    bool _600 = isnan(_526);
    bool _602 = _598 || _600;
    bool _604 = isnan(0.0);
    bool _606 = _602 || _604;
    float _608 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[16].x, _584);
    float _610 = _210 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _612 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[16].z, _608);
    float _614 = _596;
    if (!_606)
    {
        float _616 = _612 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _570 = _616;
    }
    float _618 = _570;
    float _620 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[17].x, _610);
    float _622 = _210 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _624 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[17].z, _620);
    if (!_606)
    {
        float _626 = _624 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _592 = _626;
    }
    float _628 = _592;
    float _630 = _462 + _466;
    float _632 = _630 + _468;
    float _634 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[18].x, _622);
    float _636 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _638 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _640 = _632 + _470;
    float _642 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[18].z, _634);
    float _644 = rint(_526);
    float _646 = precise::max(_644, 0.0);
    uint _648 = uint(_646);
    uint _650 = clamp(_648, 0u, 65535u);
    float _652 = _640 + _472;
    if (!_606)
    {
        float _654 = _642 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _614 = _654;
    }
    float _656 = _614;
    float _658 = _652 + _474;
    float _660 = 0.0 + _656;
    float _662 = precise::clamp(_660, 0.0, 1.0);
    float _664 = _662 * _638;
    float3 _2251 = float3(_428, _478, float(int(_412)));
    float3 _2253 = select(_2251, float3(0.0), isnan(_2251));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2253.xy, uint(rint(_2253.z)), _418);
    float3 _2262 = float3(_434, _478, float(int(_412)));
    float3 _2264 = select(_2262, float3(0.0), isnan(_2262));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2264.xy, uint(rint(_2264.z)), _418);
    float3 _2273 = float3(_436, _478, float(int(_412)));
    float3 _2275 = select(_2273, float3(0.0), isnan(_2273));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2275.xy, uint(rint(_2275.z)), _418);
    float _672 = _662 * _636;
    float _674 = fma(_664, 1.5, _628);
    float _676 = fma(_672, 0.5, _618);
    float _678 = fma(_672, -0.5, _618);
    float3 _2296 = float3(_676, _674, float(int(_650)));
    float3 _2298 = select(_2296, float3(0.0), isnan(_2296));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2298.xy, uint(rint(_2298.z)), _662);
    float3 _2307 = float3(_678, _674, float(int(_650)));
    float3 _2309 = select(_2307, float3(0.0), isnan(_2307));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2309.xy, uint(rint(_2309.z)), _662);
    float _684 = _658 + _476;
    float _686 = fma(_664, 0.5, _628);
    float _688 = fma(_672, -1.5, _618);
    float _690 = _684 + _580;
    float _692 = _690 + _666;
    float _694 = fma(_672, 1.5, _618);
    float _696 = _692 + _668;
    float3 _2339 = float3(_688, _674, float(int(_650)));
    float3 _2341 = select(_2339, float3(0.0), isnan(_2339));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2341.xy, uint(rint(_2341.z)), _662);
    float3 _2350 = float3(_694, _674, float(int(_650)));
    float3 _2352 = select(_2350, float3(0.0), isnan(_2350));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2352.xy, uint(rint(_2352.z)), _662);
    float3 _2361 = float3(_694, _686, float(int(_650)));
    float3 _2363 = select(_2361, float3(0.0), isnan(_2361));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2363.xy, uint(rint(_2363.z)), _662);
    float3 _2372 = float3(_676, _686, float(int(_650)));
    float3 _2374 = select(_2372, float3(0.0), isnan(_2372));
    float _704 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2374.xy, uint(rint(_2374.z)), _662);
    float3 _2383 = float3(_678, _686, float(int(_650)));
    float3 _2385 = select(_2383, float3(0.0), isnan(_2383));
    float _706 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2385.xy, uint(rint(_2385.z)), _662);
    float3 _2394 = float3(_688, _686, float(int(_650)));
    float3 _2396 = select(_2394, float3(0.0), isnan(_2394));
    float _708 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2396.xy, uint(rint(_2396.z)), _662);
    float _710 = _696 + _670;
    float _712 = fma(_664, -0.5, _628);
    float _714 = fma(_664, -1.5, _628);
    float3 _2414 = float3(_694, _712, float(int(_650)));
    float3 _2416 = select(_2414, float3(0.0), isnan(_2414));
    float _716 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2416.xy, uint(rint(_2416.z)), _662);
    float _718 = _700 + _680;
    float _720 = _718 + _682;
    float _722 = _720 + _698;
    float _724 = _722 + _702;
    float _726 = _724 + _704;
    float _728 = _726 + _706;
    float3 _2443 = float3(_676, _712, float(int(_650)));
    float3 _2445 = select(_2443, float3(0.0), isnan(_2443));
    float _730 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2445.xy, uint(rint(_2445.z)), _662);
    float3 _2454 = float3(_678, _712, float(int(_650)));
    float3 _2456 = select(_2454, float3(0.0), isnan(_2454));
    float _732 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2456.xy, uint(rint(_2456.z)), _662);
    float3 _2465 = float3(_688, _712, float(int(_650)));
    float3 _2467 = select(_2465, float3(0.0), isnan(_2465));
    float _734 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2467.xy, uint(rint(_2467.z)), _662);
    float3 _2476 = float3(_694, _714, float(int(_650)));
    float3 _2478 = select(_2476, float3(0.0), isnan(_2476));
    float _736 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2478.xy, uint(rint(_2478.z)), _662);
    float3 _2487 = float3(_676, _714, float(int(_650)));
    float3 _2489 = select(_2487, float3(0.0), isnan(_2487));
    float _738 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2489.xy, uint(rint(_2489.z)), _662);
    float _740 = _210 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _742 = _728 + _708;
    float _744 = _210 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _746 = _210 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _748 = _210 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _750 = _210 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _752 = _742 + _716;
    float _754 = _210 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _756 = -_210;
    float _758 = _756 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _760 = _210 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _762 = _210 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _764 = _210 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _766 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[29].x, _740);
    float _768 = -_200;
    float _770 = _768 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _772 = _758 * _758;
    float _774 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[28].x, _744);
    float _776 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[25].x, _746);
    float _778 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[26].x, _748);
    float _780 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[27].x, _750);
    float _782 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[30].x, _764);
    float _784 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[31].x, _760);
    float _786 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[32].x, _754);
    float _788 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[33].x, _762);
    float _790 = fma(_770, _770, _772);
    float _792 = -_192;
    float _794 = _792 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _796 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[28].z, _774);
    float _798 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[29].z, _766);
    float _800 = fma(_794, _794, _790);
    float _802 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[30].z, _782);
    float _804 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[31].z, _784);
    float _806 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[32].z, _786);
    float _808 = _798 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _810 = _802 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _812 = sqrt(_800);
    float _814 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[25].z, _776);
    float _816 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[27].z, _780);
    float _818 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[26].z, _778);
    bool _820 = _812 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _822 = _812 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _824 = !_820;
    int _826 = _824 ? 0 : 1;
    int _828 = 2;
    float _830 = _808;
    float _832 = _810;
    if (!_820)
    {
        _828 = 1;
    }
    int _834 = _828;
    int _836 = _834;
    if (!_822)
    {
        _836 = _826;
    }
    int _838 = _836;
    float _840 = float(_838);
    float _842 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[33].z, _788);
    float _844 = _796 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _846 = precise::min(_840, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _848 = _846 != 1.0;
    bool _850 = isnan(_846);
    bool _852 = _848 || _850;
    bool _854 = isnan(1.0);
    bool _856 = _852 || _854;
    float _858 = _844;
    if (_856)
    {
        float _860 = _804 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _858 = _860;
    }
    float _862 = _858;
    float _864 = _862;
    if (_856)
    {
        float _866 = _806 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _830 = _866;
    }
    float _868 = _830;
    float _870 = _868;
    if (_856)
    {
        float _872 = _842 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _832 = _872;
    }
    float _874 = _832;
    bool _876 = _846 != 0.0;
    bool _878 = isnan(_846);
    bool _880 = _876 || _878;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    float _886 = _874;
    if (!_884)
    {
        float _888 = _814 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _864 = _888;
    }
    float _890 = _864;
    if (!_884)
    {
        float _892 = _816 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _886 = _892;
    }
    float _894 = _886;
    float _896 = rint(_846);
    float _898 = precise::max(_896, 0.0);
    uint _900 = uint(_898);
    uint _902 = clamp(_900, 0u, 65535u);
    if (!_884)
    {
        float _904 = _818 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _870 = _904;
    }
    float _906 = _870;
    float _908 = 0.0 + _894;
    float _910 = precise::clamp(_908, 0.0, 1.0);
    float _912 = _636 * _910;
    float _914 = _638 * _910;
    float _916 = fma(_912, 0.5, _890);
    float _918 = fma(_914, 1.5, _906);
    float _920 = fma(_912, 1.5, _890);
    float _922 = fma(_914, 0.5, _906);
    float _924 = _752 + _730;
    float _926 = _924 + _732;
    float _928 = _926 + _734;
    float3 _2837 = float3(_678, _714, float(int(_650)));
    float3 _2839 = select(_2837, float3(0.0), isnan(_2837));
    float _930 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2839.xy, uint(rint(_2839.z)), _662);
    float3 _2848 = float3(_688, _714, float(int(_650)));
    float3 _2850 = select(_2848, float3(0.0), isnan(_2848));
    float _932 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2850.xy, uint(rint(_2850.z)), _662);
    float3 _2859 = float3(_916, _918, float(int(_902)));
    float3 _2861 = select(_2859, float3(0.0), isnan(_2859));
    float _934 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2861.xy, uint(rint(_2861.z)), _910);
    float3 _2870 = float3(_920, _918, float(int(_902)));
    float3 _2872 = select(_2870, float3(0.0), isnan(_2870));
    float _936 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2872.xy, uint(rint(_2872.z)), _910);
    float3 _2881 = float3(_916, _922, float(int(_902)));
    float3 _2883 = select(_2881, float3(0.0), isnan(_2881));
    float _938 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2883.xy, uint(rint(_2883.z)), _910);
    float _940 = fma(_912, -0.5, _890);
    float _942 = fma(_912, -1.5, _890);
    float3 _2898 = float3(_940, _918, float(int(_902)));
    float3 _2900 = select(_2898, float3(0.0), isnan(_2898));
    float _944 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2900.xy, uint(rint(_2900.z)), _910);
    float3 _2909 = float3(_942, _918, float(int(_902)));
    float3 _2911 = select(_2909, float3(0.0), isnan(_2909));
    float _946 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2911.xy, uint(rint(_2911.z)), _910);
    float3 _2920 = float3(_920, _922, float(int(_902)));
    float3 _2922 = select(_2920, float3(0.0), isnan(_2920));
    float _948 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2922.xy, uint(rint(_2922.z)), _910);
    float3 _2931 = float3(_940, _922, float(int(_902)));
    float3 _2933 = select(_2931, float3(0.0), isnan(_2931));
    float _950 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2933.xy, uint(rint(_2933.z)), _910);
    float3 _2942 = float3(_942, _922, float(int(_902)));
    float3 _2944 = select(_2942, float3(0.0), isnan(_2942));
    float _952 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2944.xy, uint(rint(_2944.z)), _910);
    float _954 = fma(_914, -1.5, _906);
    float _956 = fma(_914, -0.5, _906);
    float3 _2959 = float3(_916, _956, float(int(_902)));
    float3 _2961 = select(_2959, float3(0.0), isnan(_2959));
    float _958 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2961.xy, uint(rint(_2961.z)), _910);
    float3 _2970 = float3(_940, _956, float(int(_902)));
    float3 _2972 = select(_2970, float3(0.0), isnan(_2970));
    float _960 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2972.xy, uint(rint(_2972.z)), _910);
    float3 _2981 = float3(_920, _956, float(int(_902)));
    float3 _2983 = select(_2981, float3(0.0), isnan(_2981));
    float _962 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2983.xy, uint(rint(_2983.z)), _910);
    float3 _2992 = float3(_942, _956, float(int(_902)));
    float3 _2994 = select(_2992, float3(0.0), isnan(_2992));
    float _964 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2994.xy, uint(rint(_2994.z)), _910);
    float3 _3003 = float3(_920, _954, float(int(_902)));
    float3 _3005 = select(_3003, float3(0.0), isnan(_3003));
    float _966 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _3005.xy, uint(rint(_3005.z)), _910);
    float3 _3014 = float3(_916, _954, float(int(_902)));
    float3 _3016 = select(_3014, float3(0.0), isnan(_3014));
    float _968 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _3016.xy, uint(rint(_3016.z)), _910);
    float3 _3025 = float3(_940, _954, float(int(_902)));
    float3 _3027 = select(_3025, float3(0.0), isnan(_3025));
    float _970 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _3027.xy, uint(rint(_3027.z)), _910);
    float3 _3036 = float3(_942, _954, float(int(_902)));
    float3 _3038 = select(_3036, float3(0.0), isnan(_3036));
    float _972 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _3038.xy, uint(rint(_3038.z)), _910);
    float2 _3044 = float2(_56, _58);
    float _974 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_3044, float2(0.0), isnan(_3044))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_3044, float2(0.0), isnan(_3044))).x;
    float _976 = _928 + _736;
    float _978 = -_192;
    float _980 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _982 = _978 + _980;
    float _984 = -_192;
    float _986 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _988 = _984 + _986;
    float _990 = _976 + _738;
    float _992 = _982 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _994 = precise::clamp(_992, 0.0, 1.0);
    float _996 = fma(_710, 0.0625, _994);
    float _998 = _990 + _930;
    float _1000 = _936 + _934;
    float _1002 = _998 + _932;
    float _1004 = _1000 + _944;
    float _1006 = _1004 + _946;
    float _1008 = _1006 + _948;
    float _1010 = _1008 + _938;
    float _1012 = _1010 + _950;
    float _1014 = _1012 + _952;
    float _1016 = _1014 + _962;
    float _1018 = _1016 + _958;
    float _1020 = _1018 + _960;
    float _1022 = _1020 + _964;
    float _1024 = _1022 + _966;
    float _1026 = _1024 + _968;
    float _1028 = _1026 + _970;
    float _1030 = _1028 + _972;
    float _1032 = _1030 * 0.0625;
    float _1034 = _1002 * 0.0625;
    float _1036 = _1032 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _1038 = fma(_1034, (*spvDescriptorSet0.fp_c3)._m0[49].z, _1036);
    float _1040 = _988 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _1042 = precise::clamp(_1040, 0.0, 1.0);
    float _1044 = _1038 + _1042;
    out.m_49.x = _974;
    out.m_49.y = _996;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _1044;
    return out;
}

