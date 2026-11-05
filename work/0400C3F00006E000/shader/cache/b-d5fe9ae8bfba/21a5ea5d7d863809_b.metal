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
    bool _284 = false;
    bool _282 = false;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float2 _1072 = float2(_58, _60);
    float3 _64 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1072, float2(0.0), isnan(_1072)), int2(0), component::x).xyw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float2 _1089 = float2(_58, _60);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1089, float2(0.0), isnan(_1089))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1089, float2(0.0), isnan(_1089))).x;
    float _74 = in.m_44.y;
    float _76 = in.m_46.y;
    float _78 = in.m_44.x;
    float _80 = in.m_48.y;
    float _82 = in.m_46.x;
    float _84 = in.m_48.x;
    float _86 = -_66;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_68;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = _74 * _90;
    float _100 = _78 * _90;
    float _102 = -_98;
    float _104 = fma(_96, _76, _102);
    float _106 = -_70;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[46].z, _108);
    float _112 = -_100;
    float _114 = fma(_96, _82, _112);
    float _116 = -_90;
    float _118 = _116 + _96;
    float _120 = _104 * _104;
    float _122 = -_98;
    float _124 = fma(_110, _80, _122);
    float _126 = -_100;
    float _128 = fma(_110, _84, _126);
    float _130 = -_90;
    float _132 = _130 + _110;
    float _134 = fma(_114, _114, _120);
    float _136 = _124 * _124;
    float _138 = -_72;
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _142 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[46].z, _140);
    float _144 = fma(_118, _118, _134);
    float _146 = fma(_128, _128, _136);
    float _148 = _142 * _78;
    float _150 = -_142;
    bool _154 = _150 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _156 = fma(_132, _132, _146);
    float _158 = rsqrt(_144);
    float _160 = -_142;
    bool _162 = _160 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _164 = -_142;
    bool _166 = _164 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _168 = rsqrt(_156);
    int _171 = 2;
    if (!_154)
    {
        _171 = 1;
    }
    int _173 = _171;
    float _175 = _114 * _158;
    float _177 = _118 * _158;
    float _179 = _104 * _158;
    float _181 = _132 * _168;
    float _183 = _124 * _168;
    float _185 = _128 * _168;
    float _187 = _175 * _181;
    float _189 = _177 * _183;
    float _191 = _179 * _185;
    float _193 = -_187;
    float _195 = fma(_177, _185, _193);
    float _197 = -_189;
    float _199 = fma(_179, _181, _197);
    float _201 = -_191;
    float _203 = fma(_175, _183, _201);
    float _205 = _195 * _195;
    float _207 = fma(_199, _199, _205);
    bool _209 = !_154;
    int _211 = _209 ? 0 : 1;
    float _213 = fma(_203, _203, _207);
    int _215 = _173;
    if (!_162)
    {
        _215 = _211;
    }
    int _217 = _215;
    int _219 = _217 + 1;
    float _221 = rsqrt(_213);
    uint _224 = uint(_219);
    if (!_166)
    {
        _224 = uint(_217);
    }
    uint _226 = _224;
    float _228 = _195 * _221;
    uint _230 = min(_226, 2u);
    float _232 = _199 * _221;
    float _234 = _203 * _221;
    float _236 = _228 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _238 = int(_230) << 2;
    float _240 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[35].x, _236);
    uint _242 = uint(int(uint(_238) >> uint(2)));
    uint _244 = uint(int(uint(int(_242)) >> uint(2)));
    int _246 = int(_242) & 3;
    float _248 = (*spvDescriptorSet0.fp_c1)._m0[int(_244)][_246];
    float _250 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[35].z, _240);
    float _252 = abs(_250);
    float _254 = -_252;
    float _256 = _254 + 1.0;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = _142 * _74;
    float _262 = abs(_258);
    float _264 = log2(_262);
    float _266 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _268 = exp2(_266);
    float _270 = _268 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _272 = fma(_232, _270, _148);
    float _274 = fma(_228, _270, _260);
    float _276 = fma(_234, _270, _142);
    bool _278 = as_type<int>(_248) == 1264;
    if (!_278)
    {
        bool _280 = as_type<int>(_248) == 1536;
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
            float _286 = _274 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _288 = _274 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _290 = _274 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _292 = _274 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _294 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].x, _286);
            float _296 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[1].x, _288);
            float _298 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].x, _290);
            float _300 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[3].x, _292);
            float _302 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[0].z, _294);
            float _304 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[1].z, _296);
            float _306 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[2].z, _298);
            float _308 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[3].z, _300);
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _318 = _316;
            _320 = _314;
            _322 = _310;
            _324 = _312;
        }
    }
    if ((false || _284) || _282)
    {
        if ((!_284) || _282)
        {
            _282 = false;
            float _326 = _274 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _328 = _274 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _330 = _274 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _332 = _274 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _334 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[4].x, _326);
            float _336 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[5].x, _328);
            float _338 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[6].x, _330);
            float _340 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[7].x, _332);
            float _342 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[4].z, _334);
            float _344 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[5].z, _336);
            float _346 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[6].z, _338);
            float _348 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[7].z, _340);
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _318 = _356;
            _320 = _354;
            _322 = _350;
            _324 = _352;
        }
        if (false || _284)
        {
            _284 = false;
            float _358 = _274 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _360 = _274 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _362 = _274 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _364 = _274 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _366 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[8].x, _358);
            float _368 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[9].x, _360);
            float _370 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[10].x, _362);
            float _372 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[11].x, _364);
            float _374 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[8].z, _366);
            float _376 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[9].z, _368);
            float _378 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[10].z, _370);
            float _380 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[11].z, _372);
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _318 = _388;
            _320 = _386;
            _322 = _382;
            _324 = _384;
        }
    }
    float _390 = _318;
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = 1.0 / _390;
    float _400 = float(int(_226));
    float _402 = rint(_400);
    float _404 = precise::max(_402, 0.0);
    uint _406 = uint(_404);
    uint _408 = clamp(_406, 0u, 65535u);
    float _410 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _412 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _414 = _398 * _392;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = _398 * _394;
    float _420 = _398 * _396;
    float _422 = _416 * _410;
    float _424 = _416 * _412;
    float _426 = fma(_422, 0.5, _418);
    float _428 = fma(_424, 1.5, _420);
    float _430 = fma(_422, 1.5, _418);
    float _432 = fma(_422, -0.5, _418);
    float _434 = fma(_422, -1.5, _418);
    float3 _1761 = float3(_426, _428, float(int(_408)));
    float3 _1765 = select(_1761, float3(0.0), isnan(_1761));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1765.xy, uint(rint(_1765.z)), _416);
    float3 _1774 = float3(_430, _428, float(int(_408)));
    float3 _1776 = select(_1774, float3(0.0), isnan(_1774));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1776.xy, uint(rint(_1776.z)), _416);
    float3 _1785 = float3(_432, _428, float(int(_408)));
    float3 _1787 = select(_1785, float3(0.0), isnan(_1785));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1787.xy, uint(rint(_1787.z)), _416);
    float _442 = fma(_424, 0.5, _420);
    float3 _1799 = float3(_434, _428, float(int(_408)));
    float3 _1801 = select(_1799, float3(0.0), isnan(_1799));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1801.xy, uint(rint(_1801.z)), _416);
    float3 _1810 = float3(_430, _442, float(int(_408)));
    float3 _1812 = select(_1810, float3(0.0), isnan(_1810));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1812.xy, uint(rint(_1812.z)), _416);
    float3 _1821 = float3(_426, _442, float(int(_408)));
    float3 _1823 = select(_1821, float3(0.0), isnan(_1821));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1823.xy, uint(rint(_1823.z)), _416);
    float _450 = _438 + _436;
    float _452 = _450 + _440;
    float _454 = _452 + _444;
    float _456 = _454 + _446;
    float _458 = _456 + _448;
    float _460 = fma(_424, -0.5, _420);
    float3 _1850 = float3(_432, _442, float(int(_408)));
    float3 _1852 = select(_1850, float3(0.0), isnan(_1850));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1852.xy, uint(rint(_1852.z)), _416);
    float3 _1861 = float3(_434, _442, float(int(_408)));
    float3 _1863 = select(_1861, float3(0.0), isnan(_1861));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1863.xy, uint(rint(_1863.z)), _416);
    float3 _1872 = float3(_430, _460, float(int(_408)));
    float3 _1874 = select(_1872, float3(0.0), isnan(_1872));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1874.xy, uint(rint(_1874.z)), _416);
    float3 _1883 = float3(_426, _460, float(int(_408)));
    float3 _1885 = select(_1883, float3(0.0), isnan(_1883));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1885.xy, uint(rint(_1885.z)), _416);
    float3 _1894 = float3(_432, _460, float(int(_408)));
    float3 _1896 = select(_1894, float3(0.0), isnan(_1894));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1896.xy, uint(rint(_1896.z)), _416);
    float3 _1905 = float3(_434, _460, float(int(_408)));
    float3 _1907 = select(_1905, float3(0.0), isnan(_1905));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1907.xy, uint(rint(_1907.z)), _416);
    float _474 = -_260;
    float _476 = _474 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _478 = fma(_424, -1.5, _420);
    float _480 = -_148;
    float _482 = _480 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _484 = _476 * _476;
    float _486 = -_142;
    float _488 = _486 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _490 = fma(_482, _482, _484);
    float _492 = fma(_488, _488, _490);
    float _494 = sqrt(_492);
    bool _496 = _494 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _498 = _494 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _500 = !_496;
    int _502 = _500 ? 0 : 1;
    float _504 = _260 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _506 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[22].x, _504);
    float _508 = _260 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    int _510 = 2;
    if (!_496)
    {
        _510 = 1;
    }
    int _512 = _510;
    float _514 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[22].z, _506);
    int _516 = _512;
    if (!_498)
    {
        _516 = _502;
    }
    int _518 = _516;
    float _520 = float(_518);
    float _522 = _260 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _524 = precise::min(_520, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _526 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[19].x, _522);
    float _528 = _260 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _530 = _524 != 1.0;
    bool _532 = isnan(_524);
    bool _534 = _530 || _532;
    bool _536 = isnan(1.0);
    bool _538 = _534 || _536;
    float _540 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[19].z, _526);
    float _542 = _540 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _544 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[20].x, _528);
    float3 _2043 = float3(_430, _478, float(int(_408)));
    float3 _2045 = select(_2043, float3(0.0), isnan(_2043));
    float _546 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2045.xy, uint(rint(_2045.z)), _416);
    float _548 = _260 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _550 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[20].z, _544);
    float _552 = _542;
    if (_538)
    {
        float _554 = _514 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _552 = _554;
    }
    float _556 = _552;
    float _558 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[23].x, _508);
    float _560 = _260 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _562 = _550 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _564 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[21].x, _548);
    float _566 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[23].z, _558);
    float _568 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[21].z, _564);
    float _570 = _562;
    float _572 = _556;
    if (_538)
    {
        float _574 = _566 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _570 = _574;
    }
    float _576 = _570;
    float _578 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[24].x, _560);
    float _580 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[24].z, _578);
    float3 _2124 = float3(_426, _478, float(int(_408)));
    float3 _2126 = select(_2124, float3(0.0), isnan(_2124));
    float _582 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2126.xy, uint(rint(_2126.z)), _416);
    float3 _2135 = float3(_432, _478, float(int(_408)));
    float3 _2137 = select(_2135, float3(0.0), isnan(_2135));
    float _584 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2137.xy, uint(rint(_2137.z)), _416);
    float _586 = _568 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _588 = _586;
    float _590 = _576;
    if (_538)
    {
        float _592 = _580 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _588 = _592;
    }
    float _594 = _588;
    bool _596 = _524 != 0.0;
    bool _598 = isnan(_524);
    bool _600 = _596 || _598;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    float _606 = _260 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _608 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[16].x, _606);
    float _610 = _260 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _612 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[16].z, _608);
    float _614 = _594;
    if (!_604)
    {
        float _616 = _612 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _572 = _616;
    }
    float _618 = _572;
    float _620 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[17].x, _610);
    float _622 = _260 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _624 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[17].z, _620);
    if (!_604)
    {
        float _626 = _624 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _590 = _626;
    }
    float _628 = _590;
    float _630 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[18].x, _622);
    float _632 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _634 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[18].z, _630);
    if (!_604)
    {
        float _636 = _634 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _614 = _636;
    }
    float _638 = _614;
    float _640 = 0.0 + _638;
    float _642 = precise::clamp(_640, 0.0, 1.0);
    float _644 = _458 + _462;
    float _646 = _644 + _464;
    float _648 = rint(_524);
    float _650 = precise::max(_648, 0.0);
    uint _652 = uint(_650);
    uint _654 = clamp(_652, 0u, 65535u);
    float _656 = _646 + _466;
    float _658 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _660 = _642 * _632;
    float _662 = _656 + _468;
    float _664 = fma(_660, 1.5, _628);
    float _666 = _662 + _470;
    float _668 = _642 * _658;
    float _670 = fma(_668, 0.5, _618);
    float _672 = fma(_668, -0.5, _618);
    float3 _2300 = float3(_434, _478, float(int(_408)));
    float3 _2302 = select(_2300, float3(0.0), isnan(_2300));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2302.xy, uint(rint(_2302.z)), _416);
    float3 _2311 = float3(_670, _664, float(int(_654)));
    float3 _2313 = select(_2311, float3(0.0), isnan(_2311));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2313.xy, uint(rint(_2313.z)), _642);
    float3 _2322 = float3(_672, _664, float(int(_654)));
    float3 _2324 = select(_2322, float3(0.0), isnan(_2322));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2324.xy, uint(rint(_2324.z)), _642);
    float _680 = _666 + _472;
    float _682 = fma(_668, 1.5, _618);
    float _684 = fma(_668, -1.5, _618);
    float _686 = fma(_660, 0.5, _628);
    float _688 = _680 + _546;
    float _690 = _688 + _582;
    float _692 = _690 + _584;
    float3 _2354 = float3(_684, _664, float(int(_654)));
    float3 _2356 = select(_2354, float3(0.0), isnan(_2354));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2356.xy, uint(rint(_2356.z)), _642);
    float3 _2365 = float3(_682, _664, float(int(_654)));
    float3 _2367 = select(_2365, float3(0.0), isnan(_2365));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2367.xy, uint(rint(_2367.z)), _642);
    float3 _2376 = float3(_682, _686, float(int(_654)));
    float3 _2378 = select(_2376, float3(0.0), isnan(_2376));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2378.xy, uint(rint(_2378.z)), _642);
    float3 _2387 = float3(_670, _686, float(int(_654)));
    float3 _2389 = select(_2387, float3(0.0), isnan(_2387));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2389.xy, uint(rint(_2389.z)), _642);
    float3 _2398 = float3(_672, _686, float(int(_654)));
    float3 _2400 = select(_2398, float3(0.0), isnan(_2398));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2400.xy, uint(rint(_2400.z)), _642);
    float3 _2409 = float3(_684, _686, float(int(_654)));
    float3 _2411 = select(_2409, float3(0.0), isnan(_2409));
    float _704 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2411.xy, uint(rint(_2411.z)), _642);
    float _706 = fma(_660, -1.5, _628);
    float _708 = _692 + _674;
    float _710 = _696 + _676;
    float _712 = _710 + _678;
    float _714 = _712 + _694;
    float _716 = fma(_660, -0.5, _628);
    float _718 = _714 + _698;
    float3 _2441 = float3(_682, _716, float(int(_654)));
    float3 _2443 = select(_2441, float3(0.0), isnan(_2441));
    float _720 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2443.xy, uint(rint(_2443.z)), _642);
    float _722 = _718 + _700;
    float3 _2455 = float3(_670, _716, float(int(_654)));
    float3 _2457 = select(_2455, float3(0.0), isnan(_2455));
    float _724 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2457.xy, uint(rint(_2457.z)), _642);
    float _726 = _722 + _702;
    float3 _2469 = float3(_672, _716, float(int(_654)));
    float3 _2471 = select(_2469, float3(0.0), isnan(_2469));
    float _728 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2471.xy, uint(rint(_2471.z)), _642);
    float3 _2480 = float3(_684, _716, float(int(_654)));
    float3 _2482 = select(_2480, float3(0.0), isnan(_2480));
    float _730 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2482.xy, uint(rint(_2482.z)), _642);
    float3 _2491 = float3(_682, _706, float(int(_654)));
    float3 _2493 = select(_2491, float3(0.0), isnan(_2491));
    float _732 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2493.xy, uint(rint(_2493.z)), _642);
    float3 _2502 = float3(_670, _706, float(int(_654)));
    float3 _2504 = select(_2502, float3(0.0), isnan(_2502));
    float _734 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2504.xy, uint(rint(_2504.z)), _642);
    float3 _2513 = float3(_672, _706, float(int(_654)));
    float3 _2515 = select(_2513, float3(0.0), isnan(_2513));
    float _736 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2515.xy, uint(rint(_2515.z)), _642);
    float _738 = _260 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _740 = _260 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _742 = _260 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _744 = _260 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _746 = _260 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _748 = _260 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _750 = _260 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _752 = _260 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _754 = _260 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _756 = _726 + _704;
    float _758 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[25].x, _740);
    float _760 = -_260;
    float _762 = _760 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _764 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[29].x, _738);
    float _766 = -_148;
    float _768 = _766 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _770 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[27].x, _744);
    float _772 = _762 * _762;
    float _774 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[28].x, _746);
    float _776 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[26].x, _742);
    float _778 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[30].x, _748);
    float _780 = fma(_768, _768, _772);
    float _782 = -_142;
    float _784 = _782 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _786 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[31].x, _750);
    float _788 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[32].x, _752);
    float _790 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[33].x, _754);
    float _792 = fma(_784, _784, _780);
    float _794 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[28].z, _774);
    float _796 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[29].z, _764);
    float _798 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[30].z, _778);
    float _800 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[31].z, _786);
    float _802 = sqrt(_792);
    float _804 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[32].z, _788);
    float _806 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[33].z, _790);
    float _808 = _794 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _810 = _796 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _812 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[27].z, _770);
    float _814 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[25].z, _758);
    float _816 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[26].z, _776);
    bool _818 = _802 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _820 = _802 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _822 = !_818;
    int _824 = _822 ? 0 : 1;
    int _826 = 2;
    float _828 = _808;
    float _830 = _810;
    if (!_818)
    {
        _826 = 1;
    }
    int _832 = _826;
    int _834 = _832;
    if (!_820)
    {
        _834 = _824;
    }
    int _836 = _834;
    float _838 = _798 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _840 = float(_836);
    float _842 = precise::min(_840, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _844 = _842 != 1.0;
    bool _846 = isnan(_842);
    bool _848 = _844 || _846;
    bool _850 = isnan(1.0);
    bool _852 = _848 || _850;
    float _854 = _838;
    if (_852)
    {
        float _856 = _800 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _828 = _856;
    }
    float _858 = _828;
    float _860 = _858;
    if (_852)
    {
        float _862 = _804 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _830 = _862;
    }
    float _864 = _830;
    float _866 = _864;
    if (_852)
    {
        float _868 = _806 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _854 = _868;
    }
    float _870 = _854;
    bool _872 = _842 != 0.0;
    bool _874 = isnan(_842);
    bool _876 = _872 || _874;
    bool _878 = isnan(0.0);
    bool _880 = _876 || _878;
    float _882 = rint(_842);
    float _884 = precise::max(_882, 0.0);
    uint _886 = uint(_884);
    uint _888 = clamp(_886, 0u, 65535u);
    float _890 = _870;
    if (!_880)
    {
        float _892 = _812 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _890 = _892;
    }
    float _894 = _890;
    if (!_880)
    {
        float _896 = _814 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _860 = _896;
    }
    float _898 = _860;
    if (!_880)
    {
        float _900 = _816 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _866 = _900;
    }
    float _902 = _866;
    float _904 = 0.0 + _894;
    float _906 = precise::clamp(_904, 0.0, 1.0);
    float _908 = _756 + _720;
    float _910 = _658 * _906;
    float _912 = _908 + _724;
    float _914 = fma(_910, 0.5, _898);
    float _916 = fma(_910, -0.5, _898);
    float _918 = fma(_910, -1.5, _898);
    float _920 = _912 + _728;
    float _922 = _632 * _906;
    float3 _2857 = float3(_684, _706, float(int(_654)));
    float3 _2859 = select(_2857, float3(0.0), isnan(_2857));
    float _924 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2859.xy, uint(rint(_2859.z)), _642);
    float _926 = fma(_922, 1.5, _902);
    float3 _2871 = float3(_914, _926, float(int(_888)));
    float3 _2873 = select(_2871, float3(0.0), isnan(_2871));
    float _928 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2873.xy, uint(rint(_2873.z)), _906);
    float3 _2882 = float3(_916, _926, float(int(_888)));
    float3 _2884 = select(_2882, float3(0.0), isnan(_2882));
    float _930 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2884.xy, uint(rint(_2884.z)), _906);
    float3 _2893 = float3(_918, _926, float(int(_888)));
    float3 _2895 = select(_2893, float3(0.0), isnan(_2893));
    float _932 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2895.xy, uint(rint(_2895.z)), _906);
    float _934 = fma(_910, 1.5, _898);
    float _936 = fma(_922, 0.5, _902);
    float3 _2910 = float3(_934, _926, float(int(_888)));
    float3 _2912 = select(_2910, float3(0.0), isnan(_2910));
    float _938 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2912.xy, uint(rint(_2912.z)), _906);
    float3 _2921 = float3(_934, _936, float(int(_888)));
    float3 _2923 = select(_2921, float3(0.0), isnan(_2921));
    float _940 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2923.xy, uint(rint(_2923.z)), _906);
    float3 _2932 = float3(_914, _936, float(int(_888)));
    float3 _2934 = select(_2932, float3(0.0), isnan(_2932));
    float _942 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2934.xy, uint(rint(_2934.z)), _906);
    float3 _2943 = float3(_916, _936, float(int(_888)));
    float3 _2945 = select(_2943, float3(0.0), isnan(_2943));
    float _944 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2945.xy, uint(rint(_2945.z)), _906);
    float2 _2951 = float2(_58, _60);
    float2 _948 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2951, float2(0.0), isnan(_2951))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2951, float2(0.0), isnan(_2951))).xy;
    float _950 = _948.x;
    float _952 = _948.y;
    float _954 = _920 + _730;
    float _956 = _954 + _732;
    float _958 = _956 + _734;
    float _960 = _958 + _736;
    float _962 = fma(_922, -0.5, _902);
    float _964 = _960 + _924;
    float _966 = _938 + _928;
    float _968 = _966 + _930;
    float _970 = _968 + _932;
    float _972 = _970 + _940;
    float3 _2996 = float3(_918, _936, float(int(_888)));
    float3 _2998 = select(_2996, float3(0.0), isnan(_2996));
    float _974 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2998.xy, uint(rint(_2998.z)), _906);
    float3 _3007 = float3(_934, _962, float(int(_888)));
    float3 _3009 = select(_3007, float3(0.0), isnan(_3007));
    float _976 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3009.xy, uint(rint(_3009.z)), _906);
    float3 _3018 = float3(_914, _962, float(int(_888)));
    float3 _3020 = select(_3018, float3(0.0), isnan(_3018));
    float _978 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3020.xy, uint(rint(_3020.z)), _906);
    float3 _3029 = float3(_916, _962, float(int(_888)));
    float3 _3031 = select(_3029, float3(0.0), isnan(_3029));
    float _980 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3031.xy, uint(rint(_3031.z)), _906);
    float _982 = _972 + _942;
    float _984 = fma(_922, -1.5, _902);
    float _986 = _982 + _944;
    float _988 = fma(_950, 2.0, -1.0);
    float _990 = fma(_952, 2.0, -1.0);
    float _992 = _988 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _994 = _990 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _996 = fma(_992, 2.0, _58);
    float _998 = fma(_994, 2.0, _60);
    float3 _3070 = float3(_918, _962, float(int(_888)));
    float3 _3072 = select(_3070, float3(0.0), isnan(_3070));
    float _1000 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3072.xy, uint(rint(_3072.z)), _906);
    float3 _3081 = float3(_934, _984, float(int(_888)));
    float3 _3083 = select(_3081, float3(0.0), isnan(_3081));
    float _1002 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3083.xy, uint(rint(_3083.z)), _906);
    float3 _3092 = float3(_914, _984, float(int(_888)));
    float3 _3094 = select(_3092, float3(0.0), isnan(_3092));
    float _1004 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3094.xy, uint(rint(_3094.z)), _906);
    float3 _3103 = float3(_916, _984, float(int(_888)));
    float3 _3105 = select(_3103, float3(0.0), isnan(_3103));
    float _1006 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3105.xy, uint(rint(_3105.z)), _906);
    float3 _3114 = float3(_918, _984, float(int(_888)));
    float3 _3116 = select(_3114, float3(0.0), isnan(_3114));
    float _1008 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3116.xy, uint(rint(_3116.z)), _906);
    float2 _3122 = float2(_996, _998);
    float _1010 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_3122, float2(0.0), isnan(_3122))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_3122, float2(0.0), isnan(_3122))).x;
    float _1012 = _964 * 0.0625;
    float _1014 = _986 + _974;
    float _1016 = _1014 + _976;
    float _1018 = _1016 + _978;
    float _1020 = _1018 + _980;
    float _1022 = _1020 + _1000;
    float _1024 = _1022 + _1002;
    float _1026 = _1024 + _1004;
    float _1028 = -_142;
    float _1030 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _1032 = _1028 + _1030;
    float _1034 = -_142;
    float _1036 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _1038 = _1034 + _1036;
    float _1040 = _1026 + _1006;
    float _1042 = _1032 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _1044 = precise::clamp(_1042, 0.0, 1.0);
    float _1046 = _1038 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _1048 = precise::clamp(_1046, 0.0, 1.0);
    float _1050 = _1040 + _1008;
    float _1052 = fma(_708, 0.0625, _1044);
    float _1054 = _1050 * 0.0625;
    float _1056 = _1054 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _1058 = fma(_1012, (*spvDescriptorSet0.fp_c3)._m0[49].z, _1056);
    float _1060 = _1058 + _1048;
    out.m_51.x = _1010;
    out.m_51.y = _1052;
    out.m_51.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_51.w = _1060;
    return out;
}

