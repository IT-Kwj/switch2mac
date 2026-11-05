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
    bool _286 = false;
    bool _284 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _1053 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1053, float2(0.0), isnan(_1053)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _1070 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1070, float2(0.0), isnan(_1070))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1070, float2(0.0), isnan(_1070))).x;
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
    float _170 = _136 * _160;
    float _172 = _140 * _160;
    float _174 = _162 * _168;
    float _176 = _164 * _170;
    float _178 = -_174;
    float _180 = fma(_164, _172, _178);
    float _182 = _166 * _172;
    float _184 = -_176;
    float _186 = fma(_166, _168, _184);
    float _188 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _190 = _150 * _188;
    float _192 = _180 * _180;
    float _194 = -_182;
    float _196 = fma(_162, _170, _194);
    float _198 = _190 * _70;
    float _200 = fma(_186, _186, _192);
    float _202 = -_190;
    bool _206 = _202 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _208 = -_190;
    bool _210 = _208 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _212 = fma(_196, _196, _200);
    bool _214 = !_206;
    uint _217 = uint(_214 ? 0 : 1);
    float _219 = rsqrt(_212);
    uint _221 = 2u;
    if (!_206)
    {
        _221 = 1u;
    }
    uint _223 = _221;
    uint _225 = _223;
    if (!_210)
    {
        _225 = _217;
    }
    uint _227 = _225;
    uint _229 = min(_227, 2u);
    float _231 = _180 * _219;
    float _233 = _186 * _219;
    int _236 = int(_229) << 2;
    float _238 = _196 * _219;
    float _240 = _231 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _242 = _190 * _74;
    uint _244 = uint(int(uint(_236) >> uint(2)));
    uint _246 = uint(int(uint(int(_244)) >> uint(2)));
    int _248 = int(_244) & 3;
    float _250 = (*spvDescriptorSet0.fp_c1)._m0[int(_246)][_248];
    float _252 = fma(_233, (*spvDescriptorSet0.fp_c3)._m0[35].x, _240);
    float _254 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[35].z, _252);
    float _256 = abs(_254);
    float _258 = -_256;
    float _260 = _258 + 1.0;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = abs(_262);
    float _266 = log2(_264);
    float _268 = _266 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _270 = exp2(_268);
    float _272 = _270 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _274 = fma(_233, _272, _242);
    float _276 = fma(_231, _272, _198);
    float _278 = fma(_238, _272, _190);
    bool _280 = as_type<int>(_250) == 1344;
    if (!_280)
    {
        bool _282 = as_type<int>(_250) == 1616;
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
            _322 = _316;
            _324 = _312;
            _326 = _314;
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
            _322 = _356;
            _324 = _352;
            _326 = _354;
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
            _322 = _388;
            _324 = _384;
            _326 = _386;
        }
    }
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = _326;
    float _400 = 1.0 / _392;
    float _402 = float(int(_227));
    float _404 = rint(_402);
    float _406 = precise::max(_404, 0.0);
    uint _408 = uint(_406);
    uint _410 = clamp(_408, 0u, 65535u);
    float _412 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _414 = _400 * _394;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = _400 * _396;
    float _420 = _416 * _412;
    float _422 = _400 * _398;
    float _424 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _426 = fma(_420, 0.5, _418);
    float _428 = _416 * _424;
    float _430 = fma(_420, 1.5, _418);
    float _432 = fma(_420, -0.5, _418);
    float _434 = fma(_420, -1.5, _418);
    float _436 = fma(_428, 1.5, _422);
    float _438 = fma(_428, 0.5, _422);
    float3 _1745 = float3(_426, _436, float(int(_410)));
    float3 _1749 = select(_1745, float3(0.0), isnan(_1745));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1749.xy, uint(rint(_1749.z)), _416);
    float3 _1758 = float3(_430, _436, float(int(_410)));
    float3 _1760 = select(_1758, float3(0.0), isnan(_1758));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1760.xy, uint(rint(_1760.z)), _416);
    float3 _1769 = float3(_432, _436, float(int(_410)));
    float3 _1771 = select(_1769, float3(0.0), isnan(_1769));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1771.xy, uint(rint(_1771.z)), _416);
    float3 _1780 = float3(_434, _436, float(int(_410)));
    float3 _1782 = select(_1780, float3(0.0), isnan(_1780));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1782.xy, uint(rint(_1782.z)), _416);
    float3 _1791 = float3(_430, _438, float(int(_410)));
    float3 _1793 = select(_1791, float3(0.0), isnan(_1791));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1793.xy, uint(rint(_1793.z)), _416);
    float3 _1802 = float3(_426, _438, float(int(_410)));
    float3 _1804 = select(_1802, float3(0.0), isnan(_1802));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1804.xy, uint(rint(_1804.z)), _416);
    float _452 = fma(_428, -0.5, _422);
    float _454 = _442 + _440;
    float _456 = _454 + _444;
    float _458 = _456 + _446;
    float _460 = _458 + _448;
    float3 _1828 = float3(_432, _438, float(int(_410)));
    float3 _1830 = select(_1828, float3(0.0), isnan(_1828));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1830.xy, uint(rint(_1830.z)), _416);
    float3 _1839 = float3(_434, _438, float(int(_410)));
    float3 _1841 = select(_1839, float3(0.0), isnan(_1839));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1841.xy, uint(rint(_1841.z)), _416);
    float3 _1850 = float3(_430, _452, float(int(_410)));
    float3 _1852 = select(_1850, float3(0.0), isnan(_1850));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1852.xy, uint(rint(_1852.z)), _416);
    float3 _1861 = float3(_426, _452, float(int(_410)));
    float3 _1863 = select(_1861, float3(0.0), isnan(_1861));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1863.xy, uint(rint(_1863.z)), _416);
    float3 _1872 = float3(_432, _452, float(int(_410)));
    float3 _1874 = select(_1872, float3(0.0), isnan(_1872));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1874.xy, uint(rint(_1874.z)), _416);
    float3 _1883 = float3(_434, _452, float(int(_410)));
    float3 _1885 = select(_1883, float3(0.0), isnan(_1883));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1885.xy, uint(rint(_1885.z)), _416);
    float _474 = -_198;
    float _476 = _474 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _478 = -_242;
    float _480 = _478 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _482 = _460 + _450;
    float _484 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _486 = _476 * _476;
    float _488 = fma(_480, _480, _486);
    float _490 = -_190;
    float _492 = _490 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _494 = fma(_492, _492, _488);
    float _496 = _198 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _498 = _198 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _500 = _198 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _502 = fma(_428, -1.5, _422);
    float _504 = sqrt(_494);
    float _506 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[22].x, _496);
    float _508 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[20].x, _498);
    float _510 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[23].x, _500);
    float _512 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[22].z, _506);
    float _514 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[20].z, _508);
    float _516 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[23].z, _510);
    bool _518 = _504 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _520 = _504 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _522 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    bool _524 = !_518;
    int _526 = _524 ? 0 : 1;
    int _528 = 2;
    if (!_518)
    {
        _528 = 1;
    }
    int _530 = _528;
    int _532 = _530;
    if (!_520)
    {
        _532 = _526;
    }
    int _534 = _532;
    float _536 = _514 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _538 = _198 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _540 = float(_534);
    float _542 = _198 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _544 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[17].x, _538);
    float _546 = precise::min(_540, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _548 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[19].x, _542);
    float _550 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[17].z, _544);
    bool _552 = _546 != 1.0;
    bool _554 = isnan(_546);
    bool _556 = _552 || _554;
    bool _558 = isnan(1.0);
    bool _560 = _556 || _558;
    float _562 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[19].z, _548);
    bool _564 = _546 != 0.0;
    bool _566 = isnan(_546);
    bool _568 = _564 || _566;
    bool _570 = isnan(0.0);
    bool _572 = _568 || _570;
    float _574 = _562 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _576 = _198 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _578 = _574;
    float _580 = _536;
    if (_560)
    {
        float _582 = _512 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _578 = _582;
    }
    float _584 = _578;
    float _586 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[21].x, _576);
    float _588 = _584;
    if (_560)
    {
        float _590 = _516 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _580 = _590;
    }
    float _592 = _580;
    float _594 = _198 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _596 = _198 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _598 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[21].z, _586);
    float _600 = _592;
    if (!_572)
    {
        float _602 = _550 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _600 = _602;
    }
    float _604 = _600;
    float _606 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[24].x, _594);
    float _608 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[16].x, _596);
    float _610 = _598 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _612 = _198 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _614 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[24].z, _606);
    float _616 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[16].z, _608);
    float _618 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[18].x, _612);
    float _620 = _610;
    if (_560)
    {
        float _622 = _614 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _620 = _622;
    }
    float _624 = _620;
    float _626 = _624;
    if (!_572)
    {
        float _628 = _616 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _588 = _628;
    }
    float _630 = _588;
    float _632 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[18].z, _618);
    if (!_572)
    {
        float _634 = _632 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _626 = _634;
    }
    float _636 = _626;
    float _638 = 0.0 + _636;
    float _640 = precise::clamp(_638, 0.0, 1.0);
    float _642 = _640 * _484;
    float _644 = _640 * _522;
    float _646 = fma(_642, 0.5, _630);
    float _648 = fma(_642, 1.5, _630);
    float _650 = fma(_642, -0.5, _630);
    float _652 = fma(_642, -1.5, _630);
    float _654 = fma(_644, 0.5, _604);
    float _656 = _482 + _462;
    float _658 = _656 + _464;
    float _660 = _658 + _466;
    float _662 = _660 + _468;
    float3 _2243 = float3(_430, _502, float(int(_410)));
    float3 _2245 = select(_2243, float3(0.0), isnan(_2243));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2245.xy, uint(rint(_2245.z)), _416);
    float _666 = fma(_644, 1.5, _604);
    float _668 = _662 + _470;
    float _670 = rint(_546);
    float _672 = precise::max(_670, 0.0);
    uint _674 = uint(_672);
    uint _676 = clamp(_674, 0u, 65535u);
    float _678 = _668 + _472;
    float3 _2271 = float3(_426, _502, float(int(_410)));
    float3 _2273 = select(_2271, float3(0.0), isnan(_2271));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2273.xy, uint(rint(_2273.z)), _416);
    float3 _2282 = float3(_432, _502, float(int(_410)));
    float3 _2284 = select(_2282, float3(0.0), isnan(_2282));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2284.xy, uint(rint(_2284.z)), _416);
    float3 _2293 = float3(_434, _502, float(int(_410)));
    float3 _2295 = select(_2293, float3(0.0), isnan(_2293));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2295.xy, uint(rint(_2295.z)), _416);
    float3 _2304 = float3(_646, _666, float(int(_676)));
    float3 _2306 = select(_2304, float3(0.0), isnan(_2304));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2306.xy, uint(rint(_2306.z)), _640);
    float3 _2315 = float3(_648, _666, float(int(_676)));
    float3 _2317 = select(_2315, float3(0.0), isnan(_2315));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2317.xy, uint(rint(_2317.z)), _640);
    float3 _2326 = float3(_650, _666, float(int(_676)));
    float3 _2328 = select(_2326, float3(0.0), isnan(_2326));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2328.xy, uint(rint(_2328.z)), _640);
    float3 _2337 = float3(_652, _666, float(int(_676)));
    float3 _2339 = select(_2337, float3(0.0), isnan(_2337));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2339.xy, uint(rint(_2339.z)), _640);
    float3 _2348 = float3(_648, _654, float(int(_676)));
    float3 _2350 = select(_2348, float3(0.0), isnan(_2348));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2350.xy, uint(rint(_2350.z)), _640);
    float _696 = _678 + _664;
    float _698 = fma(_644, -0.5, _604);
    float _700 = _696 + _680;
    float _702 = _700 + _682;
    float _704 = _702 + _684;
    float _706 = _688 + _686;
    float3 _2377 = float3(_646, _654, float(int(_676)));
    float3 _2379 = select(_2377, float3(0.0), isnan(_2377));
    float _708 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2379.xy, uint(rint(_2379.z)), _640);
    float _710 = _706 + _690;
    float3 _2391 = float3(_650, _654, float(int(_676)));
    float3 _2393 = select(_2391, float3(0.0), isnan(_2391));
    float _712 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2393.xy, uint(rint(_2393.z)), _640);
    float3 _2402 = float3(_652, _654, float(int(_676)));
    float3 _2404 = select(_2402, float3(0.0), isnan(_2402));
    float _714 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2404.xy, uint(rint(_2404.z)), _640);
    float3 _2413 = float3(_648, _698, float(int(_676)));
    float3 _2415 = select(_2413, float3(0.0), isnan(_2413));
    float _716 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2415.xy, uint(rint(_2415.z)), _640);
    float3 _2424 = float3(_646, _698, float(int(_676)));
    float3 _2426 = select(_2424, float3(0.0), isnan(_2424));
    float _718 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2426.xy, uint(rint(_2426.z)), _640);
    float _720 = _710 + _692;
    float _722 = _720 + _694;
    float _724 = _722 + _708;
    float _726 = fma(_644, -1.5, _604);
    float _728 = _724 + _712;
    float3 _2450 = float3(_650, _698, float(int(_676)));
    float3 _2452 = select(_2450, float3(0.0), isnan(_2450));
    float _730 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2452.xy, uint(rint(_2452.z)), _640);
    float3 _2461 = float3(_652, _698, float(int(_676)));
    float3 _2463 = select(_2461, float3(0.0), isnan(_2461));
    float _732 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2463.xy, uint(rint(_2463.z)), _640);
    float3 _2472 = float3(_648, _726, float(int(_676)));
    float3 _2474 = select(_2472, float3(0.0), isnan(_2472));
    float _734 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2474.xy, uint(rint(_2474.z)), _640);
    float3 _2483 = float3(_646, _726, float(int(_676)));
    float3 _2485 = select(_2483, float3(0.0), isnan(_2483));
    float _736 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2485.xy, uint(rint(_2485.z)), _640);
    float3 _2494 = float3(_650, _726, float(int(_676)));
    float3 _2496 = select(_2494, float3(0.0), isnan(_2494));
    float _738 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2496.xy, uint(rint(_2496.z)), _640);
    float _740 = _728 + _714;
    float _742 = _198 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _744 = _198 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _746 = _198 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _748 = _740 + _716;
    float _750 = _198 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _752 = _198 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _754 = _198 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _756 = _198 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _758 = _198 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _760 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[27].x, _744);
    float _762 = _198 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _764 = -_198;
    float _766 = _764 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _768 = -_242;
    float _770 = _768 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _772 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[30].x, _752);
    float _774 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[31].x, _754);
    float _776 = _766 * _766;
    float _778 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[25].x, _750);
    float _780 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[32].x, _756);
    float _782 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[26].x, _742);
    float _784 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[28].x, _746);
    float _786 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[29].x, _758);
    float _788 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[33].x, _762);
    float _790 = fma(_770, _770, _776);
    float _792 = -_190;
    float _794 = _792 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _796 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[28].z, _784);
    float _798 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[29].z, _786);
    float _800 = fma(_794, _794, _790);
    float _802 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[30].z, _772);
    float _804 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[31].z, _774);
    float _806 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[32].z, _780);
    float _808 = _798 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _810 = _802 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _812 = sqrt(_800);
    float _814 = _748 + _718;
    float _816 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[27].z, _760);
    float _818 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[25].z, _778);
    float _820 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[26].z, _782);
    bool _822 = _812 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _824 = _812 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _826 = !_822;
    int _828 = _826 ? 0 : 1;
    int _830 = 2;
    float _832 = _808;
    float _834 = _810;
    if (!_822)
    {
        _830 = 1;
    }
    int _836 = _830;
    int _838 = _836;
    if (!_824)
    {
        _838 = _828;
    }
    int _840 = _838;
    float _842 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[33].z, _788);
    float _844 = _796 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _846 = float(_840);
    float _848 = precise::min(_846, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _850 = _848 != 1.0;
    bool _852 = isnan(_848);
    bool _854 = _850 || _852;
    bool _856 = isnan(1.0);
    bool _858 = _854 || _856;
    float _860 = _844;
    if (_858)
    {
        float _862 = _804 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _860 = _862;
    }
    float _864 = _860;
    float _866 = _864;
    if (_858)
    {
        float _868 = _806 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _832 = _868;
    }
    float _870 = _832;
    float _872 = _870;
    if (_858)
    {
        float _874 = _842 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _834 = _874;
    }
    float _876 = _834;
    bool _878 = _848 != 0.0;
    bool _880 = isnan(_848);
    bool _882 = _878 || _880;
    bool _884 = isnan(0.0);
    bool _886 = _882 || _884;
    float _888 = rint(_848);
    float _890 = precise::max(_888, 0.0);
    uint _892 = uint(_890);
    uint _894 = clamp(_892, 0u, 65535u);
    float _896 = _876;
    if (!_886)
    {
        float _898 = _816 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _896 = _898;
    }
    float _900 = _896;
    if (!_886)
    {
        float _902 = _818 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _866 = _902;
    }
    float _904 = _866;
    if (!_886)
    {
        float _906 = _820 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _872 = _906;
    }
    float _908 = _872;
    float _910 = 0.0 + _900;
    float _912 = precise::clamp(_910, 0.0, 1.0);
    float _914 = _522 * _912;
    float _916 = _484 * _912;
    float _918 = fma(_914, 0.5, _908);
    float _920 = fma(_916, 0.5, _904);
    float _922 = fma(_916, 1.5, _904);
    float _924 = fma(_916, -0.5, _904);
    float _926 = _814 + _730;
    float _928 = fma(_914, 1.5, _908);
    float _930 = _926 + _732;
    float3 _2847 = float3(_652, _726, float(int(_676)));
    float3 _2849 = select(_2847, float3(0.0), isnan(_2847));
    float _932 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2849.xy, uint(rint(_2849.z)), _640);
    float3 _2858 = float3(_920, _928, float(int(_894)));
    float3 _2860 = select(_2858, float3(0.0), isnan(_2858));
    float _934 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2860.xy, uint(rint(_2860.z)), _912);
    float3 _2869 = float3(_922, _928, float(int(_894)));
    float3 _2871 = select(_2869, float3(0.0), isnan(_2869));
    float _936 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2871.xy, uint(rint(_2871.z)), _912);
    float3 _2880 = float3(_924, _928, float(int(_894)));
    float3 _2882 = select(_2880, float3(0.0), isnan(_2880));
    float _938 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2882.xy, uint(rint(_2882.z)), _912);
    float3 _2891 = float3(_920, _918, float(int(_894)));
    float3 _2893 = select(_2891, float3(0.0), isnan(_2891));
    float _940 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2893.xy, uint(rint(_2893.z)), _912);
    float _942 = _930 + _734;
    float _944 = fma(_916, -1.5, _904);
    float _946 = _942 + _736;
    float3 _2911 = float3(_944, _928, float(int(_894)));
    float3 _2913 = select(_2911, float3(0.0), isnan(_2911));
    float _948 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2913.xy, uint(rint(_2913.z)), _912);
    float _950 = _946 + _738;
    float3 _2925 = float3(_922, _918, float(int(_894)));
    float3 _2927 = select(_2925, float3(0.0), isnan(_2925));
    float _952 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2927.xy, uint(rint(_2927.z)), _912);
    float _954 = fma(_914, -0.5, _908);
    float3 _2939 = float3(_924, _918, float(int(_894)));
    float3 _2941 = select(_2939, float3(0.0), isnan(_2939));
    float _956 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2941.xy, uint(rint(_2941.z)), _912);
    float3 _2950 = float3(_944, _918, float(int(_894)));
    float3 _2952 = select(_2950, float3(0.0), isnan(_2950));
    float _958 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2952.xy, uint(rint(_2952.z)), _912);
    float3 _2961 = float3(_922, _954, float(int(_894)));
    float3 _2963 = select(_2961, float3(0.0), isnan(_2961));
    float _960 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2963.xy, uint(rint(_2963.z)), _912);
    float3 _2972 = float3(_920, _954, float(int(_894)));
    float3 _2974 = select(_2972, float3(0.0), isnan(_2972));
    float _962 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2974.xy, uint(rint(_2974.z)), _912);
    float _964 = fma(_914, -1.5, _908);
    float3 _2986 = float3(_924, _954, float(int(_894)));
    float3 _2988 = select(_2986, float3(0.0), isnan(_2986));
    float _966 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2988.xy, uint(rint(_2988.z)), _912);
    float3 _2997 = float3(_944, _954, float(int(_894)));
    float3 _2999 = select(_2997, float3(0.0), isnan(_2997));
    float _968 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2999.xy, uint(rint(_2999.z)), _912);
    float3 _3008 = float3(_922, _964, float(int(_894)));
    float3 _3010 = select(_3008, float3(0.0), isnan(_3008));
    float _970 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _3010.xy, uint(rint(_3010.z)), _912);
    float3 _3019 = float3(_920, _964, float(int(_894)));
    float3 _3021 = select(_3019, float3(0.0), isnan(_3019));
    float _972 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _3021.xy, uint(rint(_3021.z)), _912);
    float3 _3030 = float3(_924, _964, float(int(_894)));
    float3 _3032 = select(_3030, float3(0.0), isnan(_3030));
    float _974 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _3032.xy, uint(rint(_3032.z)), _912);
    float _976 = _950 + _932;
    float3 _3044 = float3(_944, _964, float(int(_894)));
    float3 _3046 = select(_3044, float3(0.0), isnan(_3044));
    float _978 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _3046.xy, uint(rint(_3046.z)), _912);
    float _980 = _936 + _934;
    float _982 = _980 + _938;
    float _984 = _982 + _948;
    float _986 = _976 * 0.0625;
    float _988 = _984 + _952;
    float _990 = _988 + _940;
    float _992 = -_190;
    float _994 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _996 = _992 + _994;
    float _998 = _990 + _956;
    float _1000 = -_190;
    float _1002 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _1004 = _1000 + _1002;
    float _1006 = _996 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _1008 = precise::clamp(_1006, 0.0, 1.0);
    float _1010 = _998 + _958;
    float _1012 = _1004 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _1014 = precise::clamp(_1012, 0.0, 1.0);
    float _1016 = _1010 + _960;
    float _1018 = fma(_704, 0.0625, _1014);
    float _1020 = _1016 + _962;
    float _1022 = _1020 + _966;
    float _1024 = _1022 + _968;
    float _1026 = _1024 + _970;
    float _1028 = _1026 + _972;
    float _1030 = _1028 + _974;
    float _1032 = _1030 + _978;
    float _1034 = _1032 * 0.0625;
    float _1036 = _1034 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _1038 = fma(_986, (*spvDescriptorSet0.fp_c3)._m0[49].z, _1036);
    float _1040 = _1038 + _1008;
    out.m_47.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_47.y = _1018;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _1040;
    return out;
}

