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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_12 [[id(9)]];
    sampler fp_t_tcb_12Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_A [[id(11)]];
    sampler fp_t_tcb_ASmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
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
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _837 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_837, float2(0.0), isnan(_837)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _854 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_854, float2(0.0), isnan(_854))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_854, float2(0.0), isnan(_854))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_42.x;
    float _76 = in.m_44.y;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _86 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _88 = -_64;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = -_66;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _96 = -_68;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _100 = 1.0 / _90;
    float _102 = 1.0 / _94;
    float _104 = 1.0 / _98;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _100 * _106;
    float _110 = _72 * _108;
    float _112 = _74 * _108;
    float _114 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _116 = _102 * _114;
    float _118 = -_110;
    float _120 = fma(_116, _76, _118);
    float _122 = -_112;
    float _124 = fma(_116, _80, _122);
    float _126 = -_108;
    float _128 = _126 + _116;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _132 = _104 * _130;
    float _134 = _120 * _120;
    float _136 = -_110;
    float _138 = fma(_132, _78, _136);
    float _140 = -_112;
    float _142 = fma(_132, _82, _140);
    float _144 = fma(_124, _124, _134);
    float _146 = -_108;
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
    float _174 = _162 * _168;
    float _176 = _164 * _170;
    float _178 = -_174;
    float _180 = fma(_164, _172, _178);
    float _182 = -_176;
    float _184 = fma(_166, _168, _182);
    float _186 = _166 * _172;
    float _188 = -_70;
    float _190 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _192 = _180 * _180;
    float _194 = -_186;
    float _196 = fma(_162, _170, _194);
    float _198 = fma(_184, _184, _192);
    float _200 = fma(_196, _196, _198);
    float _202 = rsqrt(_200);
    float _204 = _180 * _202;
    float _206 = _184 * _202;
    float _208 = _196 * _202;
    float _210 = _204 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _212 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[35].x, _210);
    float _214 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[35].z, _212);
    float _216 = abs(_214);
    float _218 = -_216;
    float _220 = _218 + 1.0;
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = 1.0 / _190;
    float _226 = abs(_222);
    float _228 = log2(_226);
    float _230 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _232 = _224 * _230;
    float _234 = _232 * _72;
    float _236 = _232 * _74;
    float _238 = _228 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _240 = -_234;
    float _242 = _240 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _244 = -_236;
    float _246 = _244 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _248 = -_232;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _252 = _234 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _254 = _242 * _242;
    float _256 = exp2(_238);
    float _258 = _234 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _260 = fma(_246, _246, _254);
    float _262 = fma(_250, _250, _260);
    float _264 = sqrt(_262);
    float _266 = _256 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _268 = fma(_204, _266, _234);
    float _270 = fma(_206, _266, _236);
    float _272 = fma(_208, _266, _232);
    float _274 = _268 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _276 = _268 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _278 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[3].x, _274);
    float _280 = _268 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _282 = _268 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    bool _286 = _264 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _288 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[3].z, _278);
    bool _290 = _264 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _292 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[1].x, _276);
    float _294 = _288 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _296 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].x, _280);
    float _298 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].x, _282);
    bool _300 = !_286;
    int _303 = _300 ? 0 : 1;
    float _305 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[1].z, _292);
    float _307 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].z, _296);
    float _309 = 1.0 / _294;
    float _311 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].z, _298);
    int _313 = 2;
    if (!_286)
    {
        _313 = 1;
    }
    int _315 = _313;
    float _317 = _307 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    int _319 = _315;
    if (!_290)
    {
        _319 = _303;
    }
    int _321 = _319;
    float _323 = _311 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _325 = _305 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _327 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[24].x, _252);
    float _329 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[24].z, _327);
    float _331 = _317 * _309;
    float _333 = _234 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _335 = _323 * _309;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = _234 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _341 = _325 * _309;
    float _343 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[19].x, _333);
    float _345 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[21].x, _339);
    float _347 = fma(_337, _84, _331);
    float _349 = -_84;
    float _351 = fma(_337, _349, _331);
    float _353 = fma(_337, _86, _341);
    float _355 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[21].z, _345);
    float _357 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[22].x, _258);
    float _359 = _355 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _361 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[19].z, _343);
    float3 _1354 = float3(_347, _353, float(0));
    float3 _1358 = select(_1354, float3(0.0), isnan(_1354));
    float _363 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1358.xy, uint(rint(_1358.z)), _337);
    float3 _1365 = float3(_331, _353, float(0));
    float3 _1367 = select(_1365, float3(0.0), isnan(_1365));
    float _365 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1367.xy, uint(rint(_1367.z)), _337);
    float3 _1374 = float3(_351, _353, float(0));
    float3 _1376 = select(_1374, float3(0.0), isnan(_1374));
    float _367 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1376.xy, uint(rint(_1376.z)), _337);
    float3 _1383 = float3(_347, _341, float(0));
    float3 _1385 = select(_1383, float3(0.0), isnan(_1383));
    float _369 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1385.xy, uint(rint(_1385.z)), _337);
    float _371 = float(_321);
    float _373 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[22].z, _357);
    float _375 = _361 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float3 _1403 = float3(_331, _341, float(0));
    float3 _1405 = select(_1403, float3(0.0), isnan(_1403));
    float _377 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1405.xy, uint(rint(_1405.z)), _337);
    float _379 = precise::min(_371, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _381 = _234 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _383 = _234 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _385 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    bool _387 = _379 != 1.0;
    bool _389 = isnan(_379);
    bool _391 = _387 || _389;
    bool _393 = isnan(1.0);
    bool _395 = _391 || _393;
    float _397 = _234 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _399 = _379 != 0.0;
    bool _401 = isnan(_379);
    bool _403 = _399 || _401;
    bool _405 = isnan(0.0);
    bool _407 = _403 || _405;
    float _409 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[23].x, _383);
    float _411 = -_86;
    float _413 = fma(_337, _411, _341);
    float _415 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[17].x, _397);
    float _417 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[23].z, _409);
    float _419 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _421 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[17].z, _415);
    float _423 = _234 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _425 = rint(_379);
    float _427 = precise::max(_425, 0.0);
    uint _430 = uint(_427);
    uint _432 = clamp(_430, 0u, 65535u);
    float _434 = _359;
    float _436 = _375;
    if (_395)
    {
        float _438 = _329 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _434 = _438;
    }
    float _440 = _434;
    float _442 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[20].x, _381);
    float _444 = _440;
    if (_395)
    {
        float _446 = _373 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _436 = _446;
    }
    float _448 = _436;
    float _450 = _234 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _452 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[18].x, _423);
    float _454 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[20].z, _442);
    float _456 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[16].x, _450);
    float _458 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[18].z, _452);
    float _460 = _454 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _462 = _460;
    float _464 = _448;
    if (_395)
    {
        float _466 = _417 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _462 = _466;
    }
    float _468 = _462;
    float _470 = _468;
    if (!_407)
    {
        float _472 = _421 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _470 = _472;
    }
    float _474 = _470;
    float _476 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[16].z, _456);
    if (!_407)
    {
        float _478 = _458 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _444 = _478;
    }
    float _480 = _444;
    if (!_407)
    {
        float _482 = _476 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _464 = _482;
    }
    float _484 = _464;
    float3 _1606 = float3(_351, _341, float(0));
    float3 _1608 = select(_1606, float3(0.0), isnan(_1606));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1608.xy, uint(rint(_1608.z)), _337);
    float _488 = 0.0 + _480;
    float _490 = precise::clamp(_488, 0.0, 1.0);
    float _492 = fma(_490, _385, _474);
    float3 _1623 = float3(_347, _413, float(0));
    float3 _1625 = select(_1623, float3(0.0), isnan(_1623));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1625.xy, uint(rint(_1625.z)), _337);
    float3 _1632 = float3(_331, _413, float(0));
    float3 _1634 = select(_1632, float3(0.0), isnan(_1632));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1634.xy, uint(rint(_1634.z)), _337);
    float _498 = fma(_490, _419, _484);
    float3 _1645 = float3(_351, _413, float(0));
    float3 _1647 = select(_1645, float3(0.0), isnan(_1645));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1647.xy, uint(rint(_1647.z)), _337);
    float3 _1656 = float3(_484, _492, float(int(_432)));
    float3 _1658 = select(_1656, float3(0.0), isnan(_1656));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1658.xy, uint(rint(_1658.z)), _490);
    float3 _1667 = float3(_498, _492, float(int(_432)));
    float3 _1669 = select(_1667, float3(0.0), isnan(_1667));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1669.xy, uint(rint(_1669.z)), _490);
    float _506 = -_385;
    float _508 = fma(_490, _506, _474);
    float _510 = _363 + _365;
    float _512 = _510 + _367;
    float _514 = _512 + _369;
    float _516 = -_419;
    float _518 = fma(_490, _516, _484);
    float3 _1699 = float3(_518, _492, float(int(_432)));
    float3 _1701 = select(_1699, float3(0.0), isnan(_1699));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1701.xy, uint(rint(_1701.z)), _490);
    float3 _1710 = float3(_498, _474, float(int(_432)));
    float3 _1712 = select(_1710, float3(0.0), isnan(_1710));
    float _522 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1712.xy, uint(rint(_1712.z)), _490);
    float3 _1721 = float3(_484, _474, float(int(_432)));
    float3 _1723 = select(_1721, float3(0.0), isnan(_1721));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1723.xy, uint(rint(_1723.z)), _490);
    float3 _1732 = float3(_518, _474, float(int(_432)));
    float3 _1734 = select(_1732, float3(0.0), isnan(_1732));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1734.xy, uint(rint(_1734.z)), _490);
    float3 _1743 = float3(_498, _508, float(int(_432)));
    float3 _1745 = select(_1743, float3(0.0), isnan(_1743));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1745.xy, uint(rint(_1745.z)), _490);
    float2 _1751 = float2(_56, _58);
    float2 _532 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1751, float2(0.0), isnan(_1751))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1751, float2(0.0), isnan(_1751))).xy;
    float _534 = _532.x;
    float _536 = _532.y;
    float _538 = -_234;
    float _540 = _538 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _542 = _514 + _377;
    float _544 = -_236;
    float _546 = _544 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _548 = _540 * _540;
    float _550 = fma(_546, _546, _548);
    float _552 = -_232;
    float _554 = _552 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _556 = fma(_554, _554, _550);
    float _558 = _234 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _560 = _234 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _562 = _234 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _564 = _234 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _566 = sqrt(_556);
    float _568 = _234 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _570 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[30].x, _562);
    float _572 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[28].x, _560);
    float _574 = _542 + _486;
    float _576 = _504 + _502;
    bool _578 = _566 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _580 = _574 + _494;
    bool _582 = _566 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _584 = _234 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    bool _586 = !_578;
    int _588 = _586 ? 0 : 1;
    float _590 = _580 + _496;
    float _592 = _234 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _594 = _234 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _596 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[32].x, _564);
    float _598 = _590 + _500;
    float _600 = _234 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _602 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[31].x, _594);
    float _604 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[33].x, _568);
    int _606 = 2;
    if (!_578)
    {
        _606 = 1;
    }
    int _608 = _606;
    float _610 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[29].x, _600);
    int _612 = _608;
    if (!_582)
    {
        _612 = _588;
    }
    int _614 = _612;
    float _616 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[25].x, _592);
    float _618 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[30].z, _570);
    float _620 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[33].z, _604);
    float _622 = float(_614);
    float _624 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[26].x, _558);
    float _626 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[27].x, _584);
    float _628 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[28].z, _572);
    float _630 = precise::min(_622, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _632 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[29].z, _610);
    float _634 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[27].z, _626);
    float _636 = _618 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    bool _638 = _630 != 1.0;
    bool _640 = isnan(_630);
    bool _642 = _638 || _640;
    bool _644 = isnan(1.0);
    bool _646 = _642 || _644;
    float _648 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[31].z, _602);
    bool _650 = _630 != 0.0;
    bool _652 = isnan(_630);
    bool _654 = _650 || _652;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    float _660 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[32].z, _596);
    float _662 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[25].z, _616);
    float _664 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[26].z, _624);
    float _666 = _628 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _668 = _632 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _670 = _636;
    float _672 = _666;
    float _674 = _668;
    if (_646)
    {
        float _676 = _620 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _670 = _676;
    }
    float _678 = _670;
    float _680 = _678;
    if (_646)
    {
        float _682 = _648 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _672 = _682;
    }
    float _684 = _672;
    float _686 = _684;
    if (!_658)
    {
        float _688 = _634 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _680 = _688;
    }
    float _690 = _680;
    if (_646)
    {
        float _692 = _660 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _674 = _692;
    }
    float _694 = _674;
    float _696 = _694;
    if (!_658)
    {
        float _698 = _662 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _686 = _698;
    }
    float _700 = _686;
    if (!_658)
    {
        float _702 = _664 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _696 = _702;
    }
    float _704 = _696;
    float _706 = 0.0 + _690;
    float _708 = precise::clamp(_706, 0.0, 1.0);
    float _710 = fma(_385, _708, _704);
    float _712 = fma(_419, _708, _700);
    float _714 = -_419;
    float _716 = fma(_714, _708, _700);
    float3 _2096 = float3(_484, _508, float(int(_432)));
    float3 _2098 = select(_2096, float3(0.0), isnan(_2096));
    float _718 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2098.xy, uint(rint(_2098.z)), _490);
    float _720 = _576 + _520;
    float _722 = _720 + _522;
    float _724 = rint(_630);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    uint _730 = clamp(_728, 0u, 65535u);
    float _732 = _722 + _524;
    float _734 = _732 + _526;
    float _736 = _734 + _528;
    float _738 = fma(_534, 2.0, -1.0);
    float _740 = fma(_536, 2.0, -1.0);
    float3 _2136 = float3(_518, _508, float(int(_432)));
    float3 _2138 = select(_2136, float3(0.0), isnan(_2136));
    float _742 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2138.xy, uint(rint(_2138.z)), _490);
    float _744 = _738 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float3 _2152 = float3(_700, _710, float(int(_730)));
    float3 _2154 = select(_2152, float3(0.0), isnan(_2152));
    float _746 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2154.xy, uint(rint(_2154.z)), _708);
    float3 _2163 = float3(_712, _710, float(int(_730)));
    float3 _2165 = select(_2163, float3(0.0), isnan(_2163));
    float _748 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2165.xy, uint(rint(_2165.z)), _708);
    float _750 = _740 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float3 _2178 = float3(_716, _710, float(int(_730)));
    float3 _2180 = select(_2178, float3(0.0), isnan(_2178));
    float _752 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2180.xy, uint(rint(_2180.z)), _708);
    float3 _2189 = float3(_712, _704, float(int(_730)));
    float3 _2191 = select(_2189, float3(0.0), isnan(_2189));
    float _754 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2191.xy, uint(rint(_2191.z)), _708);
    float _756 = fma(_744, 2.0, _56);
    float _758 = fma(_750, 2.0, _58);
    float3 _2206 = float3(_700, _704, float(int(_730)));
    float3 _2208 = select(_2206, float3(0.0), isnan(_2206));
    float _760 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2208.xy, uint(rint(_2208.z)), _708);
    float _762 = -_385;
    float _764 = fma(_762, _708, _704);
    float3 _2223 = float3(_716, _704, float(int(_730)));
    float3 _2225 = select(_2223, float3(0.0), isnan(_2223));
    float _766 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2225.xy, uint(rint(_2225.z)), _708);
    float3 _2234 = float3(_712, _764, float(int(_730)));
    float3 _2236 = select(_2234, float3(0.0), isnan(_2234));
    float _768 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2236.xy, uint(rint(_2236.z)), _708);
    float3 _2245 = float3(_700, _764, float(int(_730)));
    float3 _2247 = select(_2245, float3(0.0), isnan(_2245));
    float _770 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2247.xy, uint(rint(_2247.z)), _708);
    float3 _2256 = float3(_716, _764, float(int(_730)));
    float3 _2258 = select(_2256, float3(0.0), isnan(_2256));
    float _772 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2258.xy, uint(rint(_2258.z)), _708);
    float2 _2264 = float2(_756, _758);
    float _774 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2264, float2(0.0), isnan(_2264))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2264, float2(0.0), isnan(_2264))).x;
    float _776 = -_232;
    float _778 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _780 = _776 + _778;
    float _782 = _780 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _784 = precise::clamp(_782, 0.0, 1.0);
    float _786 = fma(_598, 0.111111111938953399658203125, _784);
    float _788 = _736 + _718;
    float _790 = _788 + _742;
    float _792 = _748 + _746;
    float _794 = _792 + _752;
    float _796 = _794 + _754;
    float _798 = _796 + _760;
    float _800 = _790 * 0.111111111938953399658203125;
    float _802 = -_232;
    float _804 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _806 = _802 + _804;
    float _808 = _798 + _766;
    float _810 = _806 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _812 = precise::clamp(_810, 0.0, 1.0);
    float _814 = _808 + _768;
    float _816 = _814 + _770;
    float _818 = _816 + _772;
    float _820 = _818 * 0.111111111938953399658203125;
    float _822 = _820 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _824 = fma(_800, (*spvDescriptorSet0.fp_c3)._m0[49].z, _822);
    float _826 = _812 + _824;
    out.m_49.x = _774;
    out.m_49.y = _786;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _826;
    return out;
}

