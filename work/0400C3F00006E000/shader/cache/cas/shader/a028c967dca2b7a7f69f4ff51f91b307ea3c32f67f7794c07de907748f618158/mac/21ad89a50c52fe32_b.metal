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
    texture2d_array<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_12 [[id(8)]];
    sampler fp_t_tcb_12Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    texture2d<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0), center_no_perspective]];
    float4 m_48 [[user(locn1), center_no_perspective]];
    float4 m_46 [[user(locn2), center_no_perspective]];
    float4 m_42 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _274 = false;
    bool _272 = false;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float2 _1062 = float2(_58, _60);
    float3 _64 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1062, float2(0.0), isnan(_1062)), int2(0), component::x).xyw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float2 _1079 = float2(_58, _60);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1079, float2(0.0), isnan(_1079))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1079, float2(0.0), isnan(_1079))).x;
    float _74 = in.m_44.y;
    float _76 = in.m_44.x;
    float _78 = in.m_46.y;
    float _80 = in.m_48.y;
    float _82 = in.m_46.x;
    float _84 = in.m_48.x;
    float _86 = -_66;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_68;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = -_70;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].z, _100);
    float _104 = _74 * _90;
    float _106 = _76 * _90;
    float _108 = -_104;
    float _110 = fma(_96, _78, _108);
    float _112 = -_104;
    float _114 = fma(_102, _80, _112);
    float _116 = -_106;
    float _118 = fma(_96, _82, _116);
    float _120 = -_106;
    float _122 = fma(_102, _84, _120);
    float _124 = _110 * _110;
    float _126 = _114 * _114;
    float _128 = -_90;
    float _130 = _128 + _96;
    float _132 = -_90;
    float _134 = _132 + _102;
    float _136 = fma(_118, _118, _124);
    float _138 = fma(_122, _122, _126);
    float _140 = fma(_130, _130, _136);
    float _142 = fma(_134, _134, _138);
    float _144 = rsqrt(_140);
    float _146 = rsqrt(_142);
    float _148 = _118 * _144;
    float _150 = _130 * _144;
    float _152 = _110 * _144;
    float _154 = _134 * _146;
    float _156 = _114 * _146;
    float _158 = _122 * _146;
    float _160 = _148 * _154;
    float _162 = _150 * _156;
    float _164 = -_160;
    float _166 = fma(_150, _158, _164);
    float _168 = _152 * _158;
    float _170 = -_162;
    float _172 = fma(_152, _154, _170);
    float _174 = -_72;
    float _176 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _178 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[46].z, _176);
    float _180 = _166 * _166;
    float _182 = -_168;
    float _184 = fma(_148, _156, _182);
    float _186 = _178 * _76;
    float _188 = fma(_172, _172, _180);
    float _190 = -_178;
    bool _194 = _190 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _196 = -_178;
    bool _198 = _196 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _200 = fma(_184, _184, _188);
    bool _202 = !_194;
    uint _205 = uint(_202 ? 0 : 1);
    float _207 = rsqrt(_200);
    uint _209 = 2u;
    if (!_194)
    {
        _209 = 1u;
    }
    uint _211 = _209;
    uint _213 = _211;
    if (!_198)
    {
        _213 = _205;
    }
    uint _215 = _213;
    uint _217 = min(_215, 2u);
    float _219 = _166 * _207;
    float _221 = _172 * _207;
    int _224 = int(_217) << 2;
    float _226 = _184 * _207;
    float _228 = _219 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _230 = uint(int(uint(_224) >> uint(2)));
    uint _232 = uint(int(uint(int(_230)) >> uint(2)));
    int _234 = int(_230) & 3;
    float _236 = (*spvDescriptorSet0.fp_c1)._m0[int(_232)][_234];
    float _238 = fma(_221, (*spvDescriptorSet0.fp_c3)._m0[35].x, _228);
    float _240 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[35].z, _238);
    float _242 = abs(_240);
    float _244 = -_242;
    float _246 = _244 + 1.0;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = _178 * _74;
    float _252 = abs(_248);
    float _254 = log2(_252);
    float _256 = _254 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _258 = exp2(_256);
    float _260 = _258 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _262 = fma(_221, _260, _186);
    float _264 = fma(_219, _260, _250);
    float _266 = fma(_226, _260, _178);
    bool _268 = as_type<int>(_236) == 1216;
    if (!_268)
    {
        bool _270 = as_type<int>(_236) == 1488;
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
            float _276 = _264 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _278 = _264 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _280 = _264 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _282 = _264 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _284 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].x, _276);
            float _286 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[1].x, _278);
            float _288 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[2].x, _280);
            float _290 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[3].x, _282);
            float _292 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].z, _284);
            float _294 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[1].z, _286);
            float _296 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[2].z, _288);
            float _298 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[3].z, _290);
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _302 = _294 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _304 = _296 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _306 = _298 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _308 = _306;
            _310 = _304;
            _312 = _300;
            _314 = _302;
        }
    }
    if ((false || _274) || _272)
    {
        if ((!_274) || _272)
        {
            _272 = false;
            float _316 = _264 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _318 = _264 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _320 = _264 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _322 = _264 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _324 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[4].x, _316);
            float _326 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[5].x, _318);
            float _328 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[6].x, _320);
            float _330 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[7].x, _322);
            float _332 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[4].z, _324);
            float _334 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[5].z, _326);
            float _336 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[6].z, _328);
            float _338 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[7].z, _330);
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _342 = _334 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _344 = _336 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _346 = _338 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _308 = _346;
            _310 = _344;
            _312 = _340;
            _314 = _342;
        }
        if (false || _274)
        {
            _274 = false;
            float _348 = _264 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _350 = _264 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _352 = _264 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _354 = _264 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _356 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[8].x, _348);
            float _358 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[9].x, _350);
            float _360 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[10].x, _352);
            float _362 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[11].x, _354);
            float _364 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[8].z, _356);
            float _366 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[9].z, _358);
            float _368 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[10].z, _360);
            float _370 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[11].z, _362);
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _374 = _366 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _376 = _368 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _378 = _370 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _308 = _378;
            _310 = _376;
            _312 = _372;
            _314 = _374;
        }
    }
    float _380 = _308;
    float _382 = _310;
    float _384 = _312;
    float _386 = _314;
    float _388 = 1.0 / _380;
    float _390 = float(int(_215));
    float _392 = rint(_390);
    float _394 = precise::max(_392, 0.0);
    uint _396 = uint(_394);
    uint _398 = clamp(_396, 0u, 65535u);
    float _400 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _402 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _404 = _388 * _382;
    float _406 = precise::clamp(_404, 0.0, 1.0);
    float _408 = _388 * _384;
    float _410 = _388 * _386;
    float _412 = _406 * _400;
    float _414 = _406 * _402;
    float _416 = fma(_412, 0.5, _408);
    float _418 = fma(_414, 1.5, _410);
    float _420 = fma(_412, 1.5, _408);
    float _422 = fma(_412, -0.5, _408);
    float _424 = fma(_412, -1.5, _408);
    float3 _1735 = float3(_416, _418, float(int(_398)));
    float3 _1739 = select(_1735, float3(0.0), isnan(_1735));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1739.xy, uint(rint(_1739.z)), _406);
    float3 _1748 = float3(_420, _418, float(int(_398)));
    float3 _1750 = select(_1748, float3(0.0), isnan(_1748));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1750.xy, uint(rint(_1750.z)), _406);
    float3 _1759 = float3(_422, _418, float(int(_398)));
    float3 _1761 = select(_1759, float3(0.0), isnan(_1759));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1761.xy, uint(rint(_1761.z)), _406);
    float _432 = fma(_414, 0.5, _410);
    float3 _1773 = float3(_424, _418, float(int(_398)));
    float3 _1775 = select(_1773, float3(0.0), isnan(_1773));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1775.xy, uint(rint(_1775.z)), _406);
    float3 _1784 = float3(_420, _432, float(int(_398)));
    float3 _1786 = select(_1784, float3(0.0), isnan(_1784));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1786.xy, uint(rint(_1786.z)), _406);
    float3 _1795 = float3(_416, _432, float(int(_398)));
    float3 _1797 = select(_1795, float3(0.0), isnan(_1795));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1797.xy, uint(rint(_1797.z)), _406);
    float _440 = _428 + _426;
    float _442 = _440 + _430;
    float _444 = _442 + _434;
    float _446 = _444 + _436;
    float _448 = _446 + _438;
    float _450 = fma(_414, -0.5, _410);
    float3 _1824 = float3(_422, _432, float(int(_398)));
    float3 _1826 = select(_1824, float3(0.0), isnan(_1824));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1826.xy, uint(rint(_1826.z)), _406);
    float3 _1835 = float3(_424, _432, float(int(_398)));
    float3 _1837 = select(_1835, float3(0.0), isnan(_1835));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1837.xy, uint(rint(_1837.z)), _406);
    float3 _1846 = float3(_420, _450, float(int(_398)));
    float3 _1848 = select(_1846, float3(0.0), isnan(_1846));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1848.xy, uint(rint(_1848.z)), _406);
    float3 _1857 = float3(_416, _450, float(int(_398)));
    float3 _1859 = select(_1857, float3(0.0), isnan(_1857));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1859.xy, uint(rint(_1859.z)), _406);
    float3 _1868 = float3(_422, _450, float(int(_398)));
    float3 _1870 = select(_1868, float3(0.0), isnan(_1868));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1870.xy, uint(rint(_1870.z)), _406);
    float3 _1879 = float3(_424, _450, float(int(_398)));
    float3 _1881 = select(_1879, float3(0.0), isnan(_1879));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1881.xy, uint(rint(_1881.z)), _406);
    float _464 = -_250;
    float _466 = _464 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _468 = fma(_414, -1.5, _410);
    float _470 = -_186;
    float _472 = _470 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _474 = _466 * _466;
    float _476 = -_178;
    float _478 = _476 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _480 = fma(_472, _472, _474);
    float _482 = fma(_478, _478, _480);
    float _484 = sqrt(_482);
    bool _486 = _484 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _488 = _484 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _490 = !_486;
    int _492 = _490 ? 0 : 1;
    float _494 = _250 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _496 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[22].x, _494);
    float _498 = _250 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    int _500 = 2;
    if (!_486)
    {
        _500 = 1;
    }
    int _502 = _500;
    float _504 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[22].z, _496);
    int _506 = _502;
    if (!_488)
    {
        _506 = _492;
    }
    int _508 = _506;
    float _510 = float(_508);
    float _512 = _250 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _514 = precise::min(_510, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _516 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[19].x, _512);
    float _518 = _250 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _520 = _514 != 1.0;
    bool _522 = isnan(_514);
    bool _524 = _520 || _522;
    bool _526 = isnan(1.0);
    bool _528 = _524 || _526;
    float _530 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[19].z, _516);
    float _532 = _530 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _534 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[20].x, _518);
    float3 _2017 = float3(_420, _468, float(int(_398)));
    float3 _2019 = select(_2017, float3(0.0), isnan(_2017));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2019.xy, uint(rint(_2019.z)), _406);
    float _538 = _250 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _540 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[20].z, _534);
    float _542 = _532;
    if (_528)
    {
        float _544 = _504 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _542 = _544;
    }
    float _546 = _542;
    float _548 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[23].x, _498);
    float _550 = _250 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _552 = _540 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _554 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[21].x, _538);
    float _556 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[23].z, _548);
    float _558 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[21].z, _554);
    float _560 = _552;
    float _562 = _546;
    if (_528)
    {
        float _564 = _556 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _560 = _564;
    }
    float _566 = _560;
    float _568 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[24].x, _550);
    float _570 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[24].z, _568);
    float3 _2098 = float3(_416, _468, float(int(_398)));
    float3 _2100 = select(_2098, float3(0.0), isnan(_2098));
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2100.xy, uint(rint(_2100.z)), _406);
    float3 _2109 = float3(_422, _468, float(int(_398)));
    float3 _2111 = select(_2109, float3(0.0), isnan(_2109));
    float _574 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2111.xy, uint(rint(_2111.z)), _406);
    float _576 = _558 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _578 = _576;
    float _580 = _566;
    if (_528)
    {
        float _582 = _570 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _578 = _582;
    }
    float _584 = _578;
    bool _586 = _514 != 0.0;
    bool _588 = isnan(_514);
    bool _590 = _586 || _588;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    float _596 = _250 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _598 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[16].x, _596);
    float _600 = _250 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _602 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[16].z, _598);
    float _604 = _584;
    if (!_594)
    {
        float _606 = _602 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _562 = _606;
    }
    float _608 = _562;
    float _610 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[17].x, _600);
    float _612 = _250 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _614 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[17].z, _610);
    if (!_594)
    {
        float _616 = _614 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _580 = _616;
    }
    float _618 = _580;
    float _620 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[18].x, _612);
    float _622 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _624 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[18].z, _620);
    if (!_594)
    {
        float _626 = _624 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _604 = _626;
    }
    float _628 = _604;
    float _630 = 0.0 + _628;
    float _632 = precise::clamp(_630, 0.0, 1.0);
    float _634 = _448 + _452;
    float _636 = _634 + _454;
    float _638 = rint(_514);
    float _640 = precise::max(_638, 0.0);
    uint _642 = uint(_640);
    uint _644 = clamp(_642, 0u, 65535u);
    float _646 = _636 + _456;
    float _648 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _650 = _632 * _622;
    float _652 = _646 + _458;
    float _654 = fma(_650, 1.5, _618);
    float _656 = _652 + _460;
    float _658 = _632 * _648;
    float _660 = fma(_658, 0.5, _608);
    float _662 = fma(_658, -0.5, _608);
    float3 _2274 = float3(_424, _468, float(int(_398)));
    float3 _2276 = select(_2274, float3(0.0), isnan(_2274));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2276.xy, uint(rint(_2276.z)), _406);
    float3 _2285 = float3(_660, _654, float(int(_644)));
    float3 _2287 = select(_2285, float3(0.0), isnan(_2285));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2287.xy, uint(rint(_2287.z)), _632);
    float3 _2296 = float3(_662, _654, float(int(_644)));
    float3 _2298 = select(_2296, float3(0.0), isnan(_2296));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2298.xy, uint(rint(_2298.z)), _632);
    float _670 = _656 + _462;
    float _672 = fma(_658, 1.5, _608);
    float _674 = fma(_658, -1.5, _608);
    float _676 = fma(_650, 0.5, _618);
    float _678 = _670 + _536;
    float _680 = _678 + _572;
    float _682 = _680 + _574;
    float3 _2328 = float3(_674, _654, float(int(_644)));
    float3 _2330 = select(_2328, float3(0.0), isnan(_2328));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2330.xy, uint(rint(_2330.z)), _632);
    float3 _2339 = float3(_672, _654, float(int(_644)));
    float3 _2341 = select(_2339, float3(0.0), isnan(_2339));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2341.xy, uint(rint(_2341.z)), _632);
    float3 _2350 = float3(_672, _676, float(int(_644)));
    float3 _2352 = select(_2350, float3(0.0), isnan(_2350));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2352.xy, uint(rint(_2352.z)), _632);
    float3 _2361 = float3(_660, _676, float(int(_644)));
    float3 _2363 = select(_2361, float3(0.0), isnan(_2361));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2363.xy, uint(rint(_2363.z)), _632);
    float3 _2372 = float3(_662, _676, float(int(_644)));
    float3 _2374 = select(_2372, float3(0.0), isnan(_2372));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2374.xy, uint(rint(_2374.z)), _632);
    float3 _2383 = float3(_674, _676, float(int(_644)));
    float3 _2385 = select(_2383, float3(0.0), isnan(_2383));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2385.xy, uint(rint(_2385.z)), _632);
    float _696 = fma(_650, -1.5, _618);
    float _698 = _682 + _664;
    float _700 = _686 + _666;
    float _702 = _700 + _668;
    float _704 = _702 + _684;
    float _706 = fma(_650, -0.5, _618);
    float _708 = _704 + _688;
    float3 _2415 = float3(_672, _706, float(int(_644)));
    float3 _2417 = select(_2415, float3(0.0), isnan(_2415));
    float _710 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2417.xy, uint(rint(_2417.z)), _632);
    float _712 = _708 + _690;
    float3 _2429 = float3(_660, _706, float(int(_644)));
    float3 _2431 = select(_2429, float3(0.0), isnan(_2429));
    float _714 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2431.xy, uint(rint(_2431.z)), _632);
    float _716 = _712 + _692;
    float3 _2443 = float3(_662, _706, float(int(_644)));
    float3 _2445 = select(_2443, float3(0.0), isnan(_2443));
    float _718 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2445.xy, uint(rint(_2445.z)), _632);
    float3 _2454 = float3(_674, _706, float(int(_644)));
    float3 _2456 = select(_2454, float3(0.0), isnan(_2454));
    float _720 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2456.xy, uint(rint(_2456.z)), _632);
    float3 _2465 = float3(_672, _696, float(int(_644)));
    float3 _2467 = select(_2465, float3(0.0), isnan(_2465));
    float _722 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2467.xy, uint(rint(_2467.z)), _632);
    float3 _2476 = float3(_660, _696, float(int(_644)));
    float3 _2478 = select(_2476, float3(0.0), isnan(_2476));
    float _724 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2478.xy, uint(rint(_2478.z)), _632);
    float3 _2487 = float3(_662, _696, float(int(_644)));
    float3 _2489 = select(_2487, float3(0.0), isnan(_2487));
    float _726 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2489.xy, uint(rint(_2489.z)), _632);
    float _728 = _250 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _730 = _250 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _732 = _250 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _734 = _250 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _736 = _250 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _738 = _250 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _740 = _250 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _742 = _250 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _744 = _250 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _746 = _716 + _694;
    float _748 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[25].x, _730);
    float _750 = -_250;
    float _752 = _750 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _754 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[29].x, _728);
    float _756 = -_186;
    float _758 = _756 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _760 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[27].x, _734);
    float _762 = _752 * _752;
    float _764 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[28].x, _736);
    float _766 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[26].x, _732);
    float _768 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[30].x, _738);
    float _770 = fma(_758, _758, _762);
    float _772 = -_178;
    float _774 = _772 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _776 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[31].x, _740);
    float _778 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[32].x, _742);
    float _780 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[33].x, _744);
    float _782 = fma(_774, _774, _770);
    float _784 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[28].z, _764);
    float _786 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[29].z, _754);
    float _788 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[30].z, _768);
    float _790 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[31].z, _776);
    float _792 = sqrt(_782);
    float _794 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[32].z, _778);
    float _796 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[33].z, _780);
    float _798 = _784 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _800 = _786 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _802 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[27].z, _760);
    float _804 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[25].z, _748);
    float _806 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[26].z, _766);
    bool _808 = _792 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _810 = _792 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _812 = !_808;
    int _814 = _812 ? 0 : 1;
    int _816 = 2;
    float _818 = _798;
    float _820 = _800;
    if (!_808)
    {
        _816 = 1;
    }
    int _822 = _816;
    int _824 = _822;
    if (!_810)
    {
        _824 = _814;
    }
    int _826 = _824;
    float _828 = _788 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _830 = float(_826);
    float _832 = precise::min(_830, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _834 = _832 != 1.0;
    bool _836 = isnan(_832);
    bool _838 = _834 || _836;
    bool _840 = isnan(1.0);
    bool _842 = _838 || _840;
    float _844 = _828;
    if (_842)
    {
        float _846 = _790 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _818 = _846;
    }
    float _848 = _818;
    float _850 = _848;
    if (_842)
    {
        float _852 = _794 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _820 = _852;
    }
    float _854 = _820;
    float _856 = _854;
    if (_842)
    {
        float _858 = _796 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _844 = _858;
    }
    float _860 = _844;
    bool _862 = _832 != 0.0;
    bool _864 = isnan(_832);
    bool _866 = _862 || _864;
    bool _868 = isnan(0.0);
    bool _870 = _866 || _868;
    float _872 = rint(_832);
    float _874 = precise::max(_872, 0.0);
    uint _876 = uint(_874);
    uint _878 = clamp(_876, 0u, 65535u);
    float _880 = _860;
    if (!_870)
    {
        float _882 = _802 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _880 = _882;
    }
    float _884 = _880;
    if (!_870)
    {
        float _886 = _804 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _850 = _886;
    }
    float _888 = _850;
    if (!_870)
    {
        float _890 = _806 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _856 = _890;
    }
    float _892 = _856;
    float _894 = 0.0 + _884;
    float _896 = precise::clamp(_894, 0.0, 1.0);
    float _898 = _746 + _710;
    float _900 = _648 * _896;
    float _902 = _898 + _714;
    float _904 = fma(_900, 0.5, _888);
    float _906 = fma(_900, -0.5, _888);
    float _908 = fma(_900, -1.5, _888);
    float _910 = _902 + _718;
    float _912 = _622 * _896;
    float3 _2831 = float3(_674, _696, float(int(_644)));
    float3 _2833 = select(_2831, float3(0.0), isnan(_2831));
    float _914 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2833.xy, uint(rint(_2833.z)), _632);
    float _916 = fma(_912, 1.5, _892);
    float3 _2845 = float3(_904, _916, float(int(_878)));
    float3 _2847 = select(_2845, float3(0.0), isnan(_2845));
    float _918 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2847.xy, uint(rint(_2847.z)), _896);
    float3 _2856 = float3(_906, _916, float(int(_878)));
    float3 _2858 = select(_2856, float3(0.0), isnan(_2856));
    float _920 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2858.xy, uint(rint(_2858.z)), _896);
    float3 _2867 = float3(_908, _916, float(int(_878)));
    float3 _2869 = select(_2867, float3(0.0), isnan(_2867));
    float _922 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2869.xy, uint(rint(_2869.z)), _896);
    float _924 = fma(_900, 1.5, _888);
    float _926 = fma(_912, 0.5, _892);
    float3 _2884 = float3(_924, _916, float(int(_878)));
    float3 _2886 = select(_2884, float3(0.0), isnan(_2884));
    float _928 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2886.xy, uint(rint(_2886.z)), _896);
    float3 _2895 = float3(_924, _926, float(int(_878)));
    float3 _2897 = select(_2895, float3(0.0), isnan(_2895));
    float _930 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2897.xy, uint(rint(_2897.z)), _896);
    float3 _2906 = float3(_904, _926, float(int(_878)));
    float3 _2908 = select(_2906, float3(0.0), isnan(_2906));
    float _932 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2908.xy, uint(rint(_2908.z)), _896);
    float3 _2917 = float3(_906, _926, float(int(_878)));
    float3 _2919 = select(_2917, float3(0.0), isnan(_2917));
    float _934 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2919.xy, uint(rint(_2919.z)), _896);
    float2 _2925 = float2(_58, _60);
    float2 _938 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2925, float2(0.0), isnan(_2925))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2925, float2(0.0), isnan(_2925))).xy;
    float _940 = _938.x;
    float _942 = _938.y;
    float _944 = _910 + _720;
    float _946 = _944 + _722;
    float _948 = _946 + _724;
    float _950 = _948 + _726;
    float _952 = fma(_912, -0.5, _892);
    float _954 = _950 + _914;
    float _956 = _928 + _918;
    float _958 = _956 + _920;
    float _960 = _958 + _922;
    float _962 = _960 + _930;
    float3 _2970 = float3(_908, _926, float(int(_878)));
    float3 _2972 = select(_2970, float3(0.0), isnan(_2970));
    float _964 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2972.xy, uint(rint(_2972.z)), _896);
    float3 _2981 = float3(_924, _952, float(int(_878)));
    float3 _2983 = select(_2981, float3(0.0), isnan(_2981));
    float _966 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2983.xy, uint(rint(_2983.z)), _896);
    float3 _2992 = float3(_904, _952, float(int(_878)));
    float3 _2994 = select(_2992, float3(0.0), isnan(_2992));
    float _968 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2994.xy, uint(rint(_2994.z)), _896);
    float3 _3003 = float3(_906, _952, float(int(_878)));
    float3 _3005 = select(_3003, float3(0.0), isnan(_3003));
    float _970 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3005.xy, uint(rint(_3005.z)), _896);
    float _972 = _962 + _932;
    float _974 = fma(_912, -1.5, _892);
    float _976 = _972 + _934;
    float _978 = fma(_940, 2.0, -1.0);
    float _980 = fma(_942, 2.0, -1.0);
    float _982 = _978 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _984 = _980 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _986 = fma(_982, 2.0, _58);
    float _988 = fma(_984, 2.0, _60);
    float3 _3044 = float3(_908, _952, float(int(_878)));
    float3 _3046 = select(_3044, float3(0.0), isnan(_3044));
    float _990 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3046.xy, uint(rint(_3046.z)), _896);
    float3 _3055 = float3(_924, _974, float(int(_878)));
    float3 _3057 = select(_3055, float3(0.0), isnan(_3055));
    float _992 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3057.xy, uint(rint(_3057.z)), _896);
    float3 _3066 = float3(_904, _974, float(int(_878)));
    float3 _3068 = select(_3066, float3(0.0), isnan(_3066));
    float _994 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3068.xy, uint(rint(_3068.z)), _896);
    float3 _3077 = float3(_906, _974, float(int(_878)));
    float3 _3079 = select(_3077, float3(0.0), isnan(_3077));
    float _996 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3079.xy, uint(rint(_3079.z)), _896);
    float3 _3088 = float3(_908, _974, float(int(_878)));
    float3 _3090 = select(_3088, float3(0.0), isnan(_3088));
    float _998 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3090.xy, uint(rint(_3090.z)), _896);
    float2 _3096 = float2(_986, _988);
    float _1000 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_3096, float2(0.0), isnan(_3096))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_3096, float2(0.0), isnan(_3096))).x;
    float _1002 = _954 * 0.0625;
    float _1004 = _976 + _964;
    float _1006 = _1004 + _966;
    float _1008 = _1006 + _968;
    float _1010 = _1008 + _970;
    float _1012 = _1010 + _990;
    float _1014 = _1012 + _992;
    float _1016 = _1014 + _994;
    float _1018 = -_178;
    float _1020 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _1022 = _1018 + _1020;
    float _1024 = -_178;
    float _1026 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _1028 = _1024 + _1026;
    float _1030 = _1016 + _996;
    float _1032 = _1022 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _1034 = precise::clamp(_1032, 0.0, 1.0);
    float _1036 = _1028 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _1038 = precise::clamp(_1036, 0.0, 1.0);
    float _1040 = _1030 + _998;
    float _1042 = fma(_698, 0.0625, _1034);
    float _1044 = _1040 * 0.0625;
    float _1046 = _1044 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _1048 = fma(_1002, (*spvDescriptorSet0.fp_c3)._m0[49].z, _1046);
    float _1050 = _1048 + _1038;
    out.m_51.x = _1000;
    out.m_51.y = _1042;
    out.m_51.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_51.w = _1050;
    return out;
}

