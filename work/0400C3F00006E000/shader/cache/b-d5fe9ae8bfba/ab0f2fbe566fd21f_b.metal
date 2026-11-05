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
    float2 _1063 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1063, float2(0.0), isnan(_1063)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _1080 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1080, float2(0.0), isnan(_1080))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1080, float2(0.0), isnan(_1080))).x;
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
    float _184 = _176 * _70;
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
    float _210 = -_176;
    bool _212 = _210 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _214 = fma(_192, _192, _204);
    bool _216 = !_202;
    int _219 = _216 ? 0 : 1;
    float _221 = fma(_196, _196, _214);
    int _223 = 2;
    if (!_202)
    {
        _223 = 1;
    }
    int _225 = _223;
    float _227 = rsqrt(_221);
    int _229 = _225;
    if (!_208)
    {
        _229 = _219;
    }
    int _231 = _229;
    int _233 = _231 + 1;
    uint _236 = uint(_233);
    if (!_212)
    {
        _236 = uint(_231);
    }
    uint _238 = _236;
    uint _240 = min(_238, 2u);
    int _242 = int(_240) << 2;
    float _244 = _188 * _227;
    float _246 = _192 * _227;
    float _248 = _196 * _227;
    float _250 = _244 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _252 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[35].x, _250);
    uint _254 = uint(int(uint(_242) >> uint(2)));
    uint _256 = uint(int(uint(int(_254)) >> uint(2)));
    int _258 = int(_254) & 3;
    float _260 = (*spvDescriptorSet0.fp_c1)._m0[int(_256)][_258];
    float _262 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[35].z, _252);
    float _264 = abs(_262);
    float _266 = -_264;
    float _268 = _266 + 1.0;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = _176 * _74;
    float _274 = abs(_270);
    float _276 = log2(_274);
    float _278 = _276 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _280 = exp2(_278);
    float _282 = _280 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _284 = fma(_246, _282, _272);
    float _286 = fma(_244, _282, _184);
    float _288 = fma(_248, _282, _176);
    bool _290 = as_type<int>(_260) == 1392;
    if (!_290)
    {
        bool _292 = as_type<int>(_260) == 1664;
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
            _332 = _326;
            _334 = _322;
            _336 = _324;
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
            _332 = _366;
            _334 = _362;
            _336 = _364;
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
            _332 = _398;
            _334 = _394;
            _336 = _396;
        }
    }
    float _402 = _330;
    float _404 = _332;
    float _406 = _334;
    float _408 = _336;
    float _410 = 1.0 / _402;
    float _412 = float(int(_238));
    float _414 = rint(_412);
    float _416 = precise::max(_414, 0.0);
    uint _418 = uint(_416);
    uint _420 = clamp(_418, 0u, 65535u);
    float _422 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _424 = _410 * _404;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = _410 * _406;
    float _430 = _426 * _422;
    float _432 = _410 * _408;
    float _434 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _436 = fma(_430, 0.5, _428);
    float _438 = _426 * _434;
    float _440 = fma(_430, 1.5, _428);
    float _442 = fma(_430, -0.5, _428);
    float _444 = fma(_430, -1.5, _428);
    float _446 = fma(_438, 1.5, _432);
    float _448 = fma(_438, 0.5, _432);
    float3 _1771 = float3(_436, _446, float(int(_420)));
    float3 _1775 = select(_1771, float3(0.0), isnan(_1771));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1775.xy, uint(rint(_1775.z)), _426);
    float3 _1784 = float3(_440, _446, float(int(_420)));
    float3 _1786 = select(_1784, float3(0.0), isnan(_1784));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1786.xy, uint(rint(_1786.z)), _426);
    float3 _1795 = float3(_442, _446, float(int(_420)));
    float3 _1797 = select(_1795, float3(0.0), isnan(_1795));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1797.xy, uint(rint(_1797.z)), _426);
    float3 _1806 = float3(_444, _446, float(int(_420)));
    float3 _1808 = select(_1806, float3(0.0), isnan(_1806));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1808.xy, uint(rint(_1808.z)), _426);
    float3 _1817 = float3(_440, _448, float(int(_420)));
    float3 _1819 = select(_1817, float3(0.0), isnan(_1817));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1819.xy, uint(rint(_1819.z)), _426);
    float3 _1828 = float3(_436, _448, float(int(_420)));
    float3 _1830 = select(_1828, float3(0.0), isnan(_1828));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1830.xy, uint(rint(_1830.z)), _426);
    float _462 = fma(_438, -0.5, _432);
    float _464 = _452 + _450;
    float _466 = _464 + _454;
    float _468 = _466 + _456;
    float _470 = _468 + _458;
    float3 _1854 = float3(_442, _448, float(int(_420)));
    float3 _1856 = select(_1854, float3(0.0), isnan(_1854));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1856.xy, uint(rint(_1856.z)), _426);
    float3 _1865 = float3(_444, _448, float(int(_420)));
    float3 _1867 = select(_1865, float3(0.0), isnan(_1865));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1867.xy, uint(rint(_1867.z)), _426);
    float3 _1876 = float3(_440, _462, float(int(_420)));
    float3 _1878 = select(_1876, float3(0.0), isnan(_1876));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1878.xy, uint(rint(_1878.z)), _426);
    float3 _1887 = float3(_436, _462, float(int(_420)));
    float3 _1889 = select(_1887, float3(0.0), isnan(_1887));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1889.xy, uint(rint(_1889.z)), _426);
    float3 _1898 = float3(_442, _462, float(int(_420)));
    float3 _1900 = select(_1898, float3(0.0), isnan(_1898));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1900.xy, uint(rint(_1900.z)), _426);
    float3 _1909 = float3(_444, _462, float(int(_420)));
    float3 _1911 = select(_1909, float3(0.0), isnan(_1909));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1911.xy, uint(rint(_1911.z)), _426);
    float _484 = -_184;
    float _486 = _484 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _488 = -_272;
    float _490 = _488 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _492 = _470 + _460;
    float _494 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _496 = _486 * _486;
    float _498 = fma(_490, _490, _496);
    float _500 = -_176;
    float _502 = _500 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _504 = fma(_502, _502, _498);
    float _506 = _184 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _508 = _184 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _510 = _184 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _512 = fma(_438, -1.5, _432);
    float _514 = sqrt(_504);
    float _516 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[22].x, _506);
    float _518 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[20].x, _508);
    float _520 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[23].x, _510);
    float _522 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[22].z, _516);
    float _524 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[20].z, _518);
    float _526 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[23].z, _520);
    bool _528 = _514 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _530 = _514 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _532 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    bool _534 = !_528;
    int _536 = _534 ? 0 : 1;
    int _538 = 2;
    if (!_528)
    {
        _538 = 1;
    }
    int _540 = _538;
    int _542 = _540;
    if (!_530)
    {
        _542 = _536;
    }
    int _544 = _542;
    float _546 = _524 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _548 = _184 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _550 = float(_544);
    float _552 = _184 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _554 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[17].x, _548);
    float _556 = precise::min(_550, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _558 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[19].x, _552);
    float _560 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[17].z, _554);
    bool _562 = _556 != 1.0;
    bool _564 = isnan(_556);
    bool _566 = _562 || _564;
    bool _568 = isnan(1.0);
    bool _570 = _566 || _568;
    float _572 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[19].z, _558);
    bool _574 = _556 != 0.0;
    bool _576 = isnan(_556);
    bool _578 = _574 || _576;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    float _584 = _572 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _586 = _184 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _588 = _584;
    float _590 = _546;
    if (_570)
    {
        float _592 = _522 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _588 = _592;
    }
    float _594 = _588;
    float _596 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[21].x, _586);
    float _598 = _594;
    if (_570)
    {
        float _600 = _526 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _590 = _600;
    }
    float _602 = _590;
    float _604 = _184 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _606 = _184 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _608 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[21].z, _596);
    float _610 = _602;
    if (!_582)
    {
        float _612 = _560 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _610 = _612;
    }
    float _614 = _610;
    float _616 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[24].x, _604);
    float _618 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[16].x, _606);
    float _620 = _608 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _622 = _184 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _624 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[24].z, _616);
    float _626 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[16].z, _618);
    float _628 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[18].x, _622);
    float _630 = _620;
    if (_570)
    {
        float _632 = _624 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _630 = _632;
    }
    float _634 = _630;
    float _636 = _634;
    if (!_582)
    {
        float _638 = _626 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _598 = _638;
    }
    float _640 = _598;
    float _642 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[18].z, _628);
    if (!_582)
    {
        float _644 = _642 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _636 = _644;
    }
    float _646 = _636;
    float _648 = 0.0 + _646;
    float _650 = precise::clamp(_648, 0.0, 1.0);
    float _652 = _650 * _494;
    float _654 = _650 * _532;
    float _656 = fma(_652, 0.5, _640);
    float _658 = fma(_652, 1.5, _640);
    float _660 = fma(_652, -0.5, _640);
    float _662 = fma(_652, -1.5, _640);
    float _664 = fma(_654, 0.5, _614);
    float _666 = _492 + _472;
    float _668 = _666 + _474;
    float _670 = _668 + _476;
    float _672 = _670 + _478;
    float3 _2269 = float3(_440, _512, float(int(_420)));
    float3 _2271 = select(_2269, float3(0.0), isnan(_2269));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2271.xy, uint(rint(_2271.z)), _426);
    float _676 = fma(_654, 1.5, _614);
    float _678 = _672 + _480;
    float _680 = rint(_556);
    float _682 = precise::max(_680, 0.0);
    uint _684 = uint(_682);
    uint _686 = clamp(_684, 0u, 65535u);
    float _688 = _678 + _482;
    float3 _2297 = float3(_436, _512, float(int(_420)));
    float3 _2299 = select(_2297, float3(0.0), isnan(_2297));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2299.xy, uint(rint(_2299.z)), _426);
    float3 _2308 = float3(_442, _512, float(int(_420)));
    float3 _2310 = select(_2308, float3(0.0), isnan(_2308));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2310.xy, uint(rint(_2310.z)), _426);
    float3 _2319 = float3(_444, _512, float(int(_420)));
    float3 _2321 = select(_2319, float3(0.0), isnan(_2319));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2321.xy, uint(rint(_2321.z)), _426);
    float3 _2330 = float3(_656, _676, float(int(_686)));
    float3 _2332 = select(_2330, float3(0.0), isnan(_2330));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2332.xy, uint(rint(_2332.z)), _650);
    float3 _2341 = float3(_658, _676, float(int(_686)));
    float3 _2343 = select(_2341, float3(0.0), isnan(_2341));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2343.xy, uint(rint(_2343.z)), _650);
    float3 _2352 = float3(_660, _676, float(int(_686)));
    float3 _2354 = select(_2352, float3(0.0), isnan(_2352));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2354.xy, uint(rint(_2354.z)), _650);
    float3 _2363 = float3(_662, _676, float(int(_686)));
    float3 _2365 = select(_2363, float3(0.0), isnan(_2363));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2365.xy, uint(rint(_2365.z)), _650);
    float3 _2374 = float3(_658, _664, float(int(_686)));
    float3 _2376 = select(_2374, float3(0.0), isnan(_2374));
    float _704 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2376.xy, uint(rint(_2376.z)), _650);
    float _706 = _688 + _674;
    float _708 = fma(_654, -0.5, _614);
    float _710 = _706 + _690;
    float _712 = _710 + _692;
    float _714 = _712 + _694;
    float _716 = _698 + _696;
    float3 _2403 = float3(_656, _664, float(int(_686)));
    float3 _2405 = select(_2403, float3(0.0), isnan(_2403));
    float _718 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2405.xy, uint(rint(_2405.z)), _650);
    float _720 = _716 + _700;
    float3 _2417 = float3(_660, _664, float(int(_686)));
    float3 _2419 = select(_2417, float3(0.0), isnan(_2417));
    float _722 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2419.xy, uint(rint(_2419.z)), _650);
    float3 _2428 = float3(_662, _664, float(int(_686)));
    float3 _2430 = select(_2428, float3(0.0), isnan(_2428));
    float _724 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2430.xy, uint(rint(_2430.z)), _650);
    float3 _2439 = float3(_658, _708, float(int(_686)));
    float3 _2441 = select(_2439, float3(0.0), isnan(_2439));
    float _726 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2441.xy, uint(rint(_2441.z)), _650);
    float3 _2450 = float3(_656, _708, float(int(_686)));
    float3 _2452 = select(_2450, float3(0.0), isnan(_2450));
    float _728 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2452.xy, uint(rint(_2452.z)), _650);
    float _730 = _720 + _702;
    float _732 = _730 + _704;
    float _734 = _732 + _718;
    float _736 = fma(_654, -1.5, _614);
    float _738 = _734 + _722;
    float3 _2476 = float3(_660, _708, float(int(_686)));
    float3 _2478 = select(_2476, float3(0.0), isnan(_2476));
    float _740 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2478.xy, uint(rint(_2478.z)), _650);
    float3 _2487 = float3(_662, _708, float(int(_686)));
    float3 _2489 = select(_2487, float3(0.0), isnan(_2487));
    float _742 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2489.xy, uint(rint(_2489.z)), _650);
    float3 _2498 = float3(_658, _736, float(int(_686)));
    float3 _2500 = select(_2498, float3(0.0), isnan(_2498));
    float _744 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2500.xy, uint(rint(_2500.z)), _650);
    float3 _2509 = float3(_656, _736, float(int(_686)));
    float3 _2511 = select(_2509, float3(0.0), isnan(_2509));
    float _746 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2511.xy, uint(rint(_2511.z)), _650);
    float3 _2520 = float3(_660, _736, float(int(_686)));
    float3 _2522 = select(_2520, float3(0.0), isnan(_2520));
    float _748 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2522.xy, uint(rint(_2522.z)), _650);
    float _750 = _738 + _724;
    float _752 = _184 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _754 = _184 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _756 = _184 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _758 = _750 + _726;
    float _760 = _184 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _762 = _184 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _764 = _184 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _766 = _184 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _768 = _184 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _770 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[27].x, _754);
    float _772 = _184 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _774 = -_184;
    float _776 = _774 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _778 = -_272;
    float _780 = _778 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _782 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[30].x, _762);
    float _784 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[31].x, _764);
    float _786 = _776 * _776;
    float _788 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[25].x, _760);
    float _790 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[32].x, _766);
    float _792 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[26].x, _752);
    float _794 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[28].x, _756);
    float _796 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[29].x, _768);
    float _798 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[33].x, _772);
    float _800 = fma(_780, _780, _786);
    float _802 = -_176;
    float _804 = _802 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _806 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[28].z, _794);
    float _808 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[29].z, _796);
    float _810 = fma(_804, _804, _800);
    float _812 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[30].z, _782);
    float _814 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[31].z, _784);
    float _816 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[32].z, _790);
    float _818 = _808 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _820 = _812 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _822 = sqrt(_810);
    float _824 = _758 + _728;
    float _826 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[27].z, _770);
    float _828 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[25].z, _788);
    float _830 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[26].z, _792);
    bool _832 = _822 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _834 = _822 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _836 = !_832;
    int _838 = _836 ? 0 : 1;
    int _840 = 2;
    float _842 = _818;
    float _844 = _820;
    if (!_832)
    {
        _840 = 1;
    }
    int _846 = _840;
    int _848 = _846;
    if (!_834)
    {
        _848 = _838;
    }
    int _850 = _848;
    float _852 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[33].z, _798);
    float _854 = _806 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _856 = float(_850);
    float _858 = precise::min(_856, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _860 = _858 != 1.0;
    bool _862 = isnan(_858);
    bool _864 = _860 || _862;
    bool _866 = isnan(1.0);
    bool _868 = _864 || _866;
    float _870 = _854;
    if (_868)
    {
        float _872 = _814 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _870 = _872;
    }
    float _874 = _870;
    float _876 = _874;
    if (_868)
    {
        float _878 = _816 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _842 = _878;
    }
    float _880 = _842;
    float _882 = _880;
    if (_868)
    {
        float _884 = _852 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _844 = _884;
    }
    float _886 = _844;
    bool _888 = _858 != 0.0;
    bool _890 = isnan(_858);
    bool _892 = _888 || _890;
    bool _894 = isnan(0.0);
    bool _896 = _892 || _894;
    float _898 = rint(_858);
    float _900 = precise::max(_898, 0.0);
    uint _902 = uint(_900);
    uint _904 = clamp(_902, 0u, 65535u);
    float _906 = _886;
    if (!_896)
    {
        float _908 = _826 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _906 = _908;
    }
    float _910 = _906;
    if (!_896)
    {
        float _912 = _828 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _876 = _912;
    }
    float _914 = _876;
    if (!_896)
    {
        float _916 = _830 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _882 = _916;
    }
    float _918 = _882;
    float _920 = 0.0 + _910;
    float _922 = precise::clamp(_920, 0.0, 1.0);
    float _924 = _532 * _922;
    float _926 = _494 * _922;
    float _928 = fma(_924, 0.5, _918);
    float _930 = fma(_926, 0.5, _914);
    float _932 = fma(_926, 1.5, _914);
    float _934 = fma(_926, -0.5, _914);
    float _936 = _824 + _740;
    float _938 = fma(_924, 1.5, _918);
    float _940 = _936 + _742;
    float3 _2873 = float3(_662, _736, float(int(_686)));
    float3 _2875 = select(_2873, float3(0.0), isnan(_2873));
    float _942 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2875.xy, uint(rint(_2875.z)), _650);
    float3 _2884 = float3(_930, _938, float(int(_904)));
    float3 _2886 = select(_2884, float3(0.0), isnan(_2884));
    float _944 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2886.xy, uint(rint(_2886.z)), _922);
    float3 _2895 = float3(_932, _938, float(int(_904)));
    float3 _2897 = select(_2895, float3(0.0), isnan(_2895));
    float _946 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2897.xy, uint(rint(_2897.z)), _922);
    float3 _2906 = float3(_934, _938, float(int(_904)));
    float3 _2908 = select(_2906, float3(0.0), isnan(_2906));
    float _948 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2908.xy, uint(rint(_2908.z)), _922);
    float3 _2917 = float3(_930, _928, float(int(_904)));
    float3 _2919 = select(_2917, float3(0.0), isnan(_2917));
    float _950 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2919.xy, uint(rint(_2919.z)), _922);
    float _952 = _940 + _744;
    float _954 = fma(_926, -1.5, _914);
    float _956 = _952 + _746;
    float3 _2937 = float3(_954, _938, float(int(_904)));
    float3 _2939 = select(_2937, float3(0.0), isnan(_2937));
    float _958 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2939.xy, uint(rint(_2939.z)), _922);
    float _960 = _956 + _748;
    float3 _2951 = float3(_932, _928, float(int(_904)));
    float3 _2953 = select(_2951, float3(0.0), isnan(_2951));
    float _962 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2953.xy, uint(rint(_2953.z)), _922);
    float _964 = fma(_924, -0.5, _918);
    float3 _2965 = float3(_934, _928, float(int(_904)));
    float3 _2967 = select(_2965, float3(0.0), isnan(_2965));
    float _966 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2967.xy, uint(rint(_2967.z)), _922);
    float3 _2976 = float3(_954, _928, float(int(_904)));
    float3 _2978 = select(_2976, float3(0.0), isnan(_2976));
    float _968 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2978.xy, uint(rint(_2978.z)), _922);
    float3 _2987 = float3(_932, _964, float(int(_904)));
    float3 _2989 = select(_2987, float3(0.0), isnan(_2987));
    float _970 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2989.xy, uint(rint(_2989.z)), _922);
    float3 _2998 = float3(_930, _964, float(int(_904)));
    float3 _3000 = select(_2998, float3(0.0), isnan(_2998));
    float _972 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _3000.xy, uint(rint(_3000.z)), _922);
    float _974 = fma(_924, -1.5, _918);
    float3 _3012 = float3(_934, _964, float(int(_904)));
    float3 _3014 = select(_3012, float3(0.0), isnan(_3012));
    float _976 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _3014.xy, uint(rint(_3014.z)), _922);
    float3 _3023 = float3(_954, _964, float(int(_904)));
    float3 _3025 = select(_3023, float3(0.0), isnan(_3023));
    float _978 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _3025.xy, uint(rint(_3025.z)), _922);
    float3 _3034 = float3(_932, _974, float(int(_904)));
    float3 _3036 = select(_3034, float3(0.0), isnan(_3034));
    float _980 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _3036.xy, uint(rint(_3036.z)), _922);
    float3 _3045 = float3(_930, _974, float(int(_904)));
    float3 _3047 = select(_3045, float3(0.0), isnan(_3045));
    float _982 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _3047.xy, uint(rint(_3047.z)), _922);
    float3 _3056 = float3(_934, _974, float(int(_904)));
    float3 _3058 = select(_3056, float3(0.0), isnan(_3056));
    float _984 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _3058.xy, uint(rint(_3058.z)), _922);
    float _986 = _960 + _942;
    float3 _3070 = float3(_954, _974, float(int(_904)));
    float3 _3072 = select(_3070, float3(0.0), isnan(_3070));
    float _988 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _3072.xy, uint(rint(_3072.z)), _922);
    float _990 = _946 + _944;
    float _992 = _990 + _948;
    float _994 = _992 + _958;
    float _996 = _986 * 0.0625;
    float _998 = _994 + _962;
    float _1000 = _998 + _950;
    float _1002 = -_176;
    float _1004 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _1006 = _1002 + _1004;
    float _1008 = _1000 + _966;
    float _1010 = -_176;
    float _1012 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _1014 = _1010 + _1012;
    float _1016 = _1006 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _1018 = precise::clamp(_1016, 0.0, 1.0);
    float _1020 = _1008 + _968;
    float _1022 = _1014 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _1024 = precise::clamp(_1022, 0.0, 1.0);
    float _1026 = _1020 + _970;
    float _1028 = fma(_714, 0.0625, _1024);
    float _1030 = _1026 + _972;
    float _1032 = _1030 + _976;
    float _1034 = _1032 + _978;
    float _1036 = _1034 + _980;
    float _1038 = _1036 + _982;
    float _1040 = _1038 + _984;
    float _1042 = _1040 + _988;
    float _1044 = _1042 * 0.0625;
    float _1046 = _1044 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _1048 = fma(_996, (*spvDescriptorSet0.fp_c3)._m0[49].z, _1046);
    float _1050 = _1048 + _1018;
    out.m_47.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_47.y = _1028;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _1050;
    return out;
}

