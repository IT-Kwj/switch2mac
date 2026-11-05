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
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _746 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_746, float2(0.0), isnan(_746))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_746, float2(0.0), isnan(_746))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _60 = -_52;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _54;
    float _68 = _64 * _56;
    float _70 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _74 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _76 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _72);
    float _78 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _74);
    float _80 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _76);
    float _82 = _78 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _84 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _86 = _80 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _88 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _84);
    float _90 = 1.0 / _82;
    float _92 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _94 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _88);
    float _96 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _92);
    float _98 = _94 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _100 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _96);
    float _102 = _100 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _104 = _98 * _90;
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = _86 * _90;
    float _110 = _102 * _90;
    float _112 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _114 = _106 * _58;
    float _116 = _106 * _112;
    float _118 = fma(_114, 1.5, _108);
    float _120 = fma(_114, 0.5, _108);
    float _122 = fma(_114, -0.5, _108);
    float _124 = fma(_114, -1.5, _108);
    float _126 = fma(_116, 1.5, _110);
    float _128 = fma(_116, 0.5, _110);
    float3 _910 = float3(_118, _126, float(0));
    float3 _914 = select(_910, float3(0.0), isnan(_910));
    float _130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _914.xy, uint(rint(_914.z)), _106);
    float3 _921 = float3(_120, _126, float(0));
    float3 _923 = select(_921, float3(0.0), isnan(_921));
    float _132 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _923.xy, uint(rint(_923.z)), _106);
    float3 _930 = float3(_122, _126, float(0));
    float3 _932 = select(_930, float3(0.0), isnan(_930));
    float _134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _932.xy, uint(rint(_932.z)), _106);
    float3 _939 = float3(_124, _126, float(0));
    float3 _941 = select(_939, float3(0.0), isnan(_939));
    float _136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _941.xy, uint(rint(_941.z)), _106);
    float3 _948 = float3(_118, _128, float(0));
    float3 _950 = select(_948, float3(0.0), isnan(_948));
    float _138 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _950.xy, uint(rint(_950.z)), _106);
    float3 _957 = float3(_120, _128, float(0));
    float3 _959 = select(_957, float3(0.0), isnan(_957));
    float _140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _959.xy, uint(rint(_959.z)), _106);
    float _142 = fma(_116, -0.5, _110);
    float _144 = _130 + _132;
    float _146 = _144 + _134;
    float _148 = _146 + _136;
    float3 _978 = float3(_122, _128, float(0));
    float3 _980 = select(_978, float3(0.0), isnan(_978));
    float _150 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _980.xy, uint(rint(_980.z)), _106);
    float _152 = _148 + _138;
    float3 _990 = float3(_124, _128, float(0));
    float3 _992 = select(_990, float3(0.0), isnan(_990));
    float _154 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _992.xy, uint(rint(_992.z)), _106);
    float _156 = _152 + _140;
    float3 _1002 = float3(_118, _142, float(0));
    float3 _1004 = select(_1002, float3(0.0), isnan(_1002));
    float _158 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1004.xy, uint(rint(_1004.z)), _106);
    float3 _1011 = float3(_120, _142, float(0));
    float3 _1013 = select(_1011, float3(0.0), isnan(_1011));
    float _160 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1013.xy, uint(rint(_1013.z)), _106);
    float3 _1020 = float3(_122, _142, float(0));
    float3 _1022 = select(_1020, float3(0.0), isnan(_1020));
    float _162 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1022.xy, uint(rint(_1022.z)), _106);
    float3 _1029 = float3(_124, _142, float(0));
    float3 _1031 = select(_1029, float3(0.0), isnan(_1029));
    float _164 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1031.xy, uint(rint(_1031.z)), _106);
    float _166 = -_66;
    float _168 = _166 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _170 = -_68;
    float _172 = _170 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _174 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _176 = _168 * _168;
    float _178 = fma(_172, _172, _176);
    float _180 = -_64;
    float _182 = _180 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _184 = fma(_182, _182, _178);
    float _186 = _66 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _188 = _66 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _190 = _66 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _192 = _66 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _194 = sqrt(_184);
    float _196 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].x, _186);
    float _198 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].x, _188);
    float _200 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].x, _190);
    float _202 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].x, _192);
    float _204 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[19].z, _196);
    float _206 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[22].z, _198);
    float _208 = _66 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _210 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[21].z, _200);
    float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _214 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[24].z, _202);
    float _216 = _66 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _218 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].x, _208);
    float _220 = _210 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _222 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].x, _216);
    bool _226 = _194 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _228 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[23].z, _218);
    bool _230 = _194 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _232 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[16].z, _222);
    bool _234 = !_226;
    int _237 = _234 ? 0 : 1;
    float _239 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    int _241 = 2;
    float _243 = _212;
    float _245 = _220;
    if (!_226)
    {
        _241 = 1;
    }
    int _247 = _241;
    int _249 = _247;
    if (!_230)
    {
        _249 = _237;
    }
    int _251 = _249;
    float _253 = float(_251);
    float _255 = fma(_116, -1.5, _110);
    float _257 = _66 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _259 = precise::min(_253, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _261 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].x, _257);
    bool _263 = _259 != 1.0;
    bool _265 = isnan(_259);
    bool _267 = _263 || _265;
    bool _269 = isnan(1.0);
    bool _271 = _267 || _269;
    float _273 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[18].z, _261);
    bool _275 = _259 != 0.0;
    bool _277 = isnan(_259);
    bool _279 = _275 || _277;
    bool _281 = isnan(0.0);
    bool _283 = _279 || _281;
    float _285 = rint(_259);
    float _287 = precise::max(_285, 0.0);
    uint _290 = uint(_287);
    uint _292 = clamp(_290, 0u, 65535u);
    if (_271)
    {
        float _294 = _206 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _243 = _294;
    }
    float _296 = _243;
    float _298 = _66 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _300 = _296;
    if (_271)
    {
        float _302 = _214 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _245 = _302;
    }
    float _304 = _245;
    float _306 = _304;
    if (!_283)
    {
        float _308 = _273 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _306 = _308;
    }
    float _310 = _306;
    if (!_283)
    {
        float _312 = _232 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _300 = _312;
    }
    float _314 = _300;
    float _316 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].x, _298);
    float _318 = 0.0 + _310;
    float _320 = precise::clamp(_318, 0.0, 1.0);
    float _322 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[20].z, _316);
    float _324 = _320 * _174;
    float _326 = _322 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _328 = _66 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _330 = _326;
    if (_271)
    {
        float _332 = _228 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _330 = _332;
    }
    float _334 = _330;
    float _336 = fma(_324, 0.5, _314);
    float _338 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].x, _328);
    float _340 = fma(_324, -0.5, _314);
    float _342 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[17].z, _338);
    float _344 = _334;
    if (!_283)
    {
        float _346 = _342 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _344 = _346;
    }
    float _348 = _344;
    float _350 = _320 * _239;
    float _352 = fma(_350, 1.5, _348);
    float _354 = _156 + _150;
    float _356 = _354 + _154;
    float _358 = _356 + _158;
    float _360 = _358 + _160;
    float _362 = _360 + _162;
    float3 _1391 = float3(_118, _255, float(0));
    float3 _1393 = select(_1391, float3(0.0), isnan(_1391));
    float _364 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1393.xy, uint(rint(_1393.z)), _106);
    float _366 = _362 + _164;
    float3 _1403 = float3(_120, _255, float(0));
    float3 _1405 = select(_1403, float3(0.0), isnan(_1403));
    float _368 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1405.xy, uint(rint(_1405.z)), _106);
    float3 _1412 = float3(_122, _255, float(0));
    float3 _1414 = select(_1412, float3(0.0), isnan(_1412));
    float _370 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1414.xy, uint(rint(_1414.z)), _106);
    float3 _1421 = float3(_124, _255, float(0));
    float3 _1423 = select(_1421, float3(0.0), isnan(_1421));
    float _372 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1423.xy, uint(rint(_1423.z)), _106);
    float3 _1432 = float3(_336, _352, float(int(_292)));
    float3 _1434 = select(_1432, float3(0.0), isnan(_1432));
    float _374 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1434.xy, uint(rint(_1434.z)), _320);
    float3 _1443 = float3(_340, _352, float(int(_292)));
    float3 _1445 = select(_1443, float3(0.0), isnan(_1443));
    float _376 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1445.xy, uint(rint(_1445.z)), _320);
    float _378 = fma(_324, 1.5, _314);
    float _380 = fma(_324, -1.5, _314);
    float3 _1460 = float3(_380, _352, float(int(_292)));
    float3 _1462 = select(_1460, float3(0.0), isnan(_1460));
    float _382 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1462.xy, uint(rint(_1462.z)), _320);
    float3 _1471 = float3(_378, _352, float(int(_292)));
    float3 _1473 = select(_1471, float3(0.0), isnan(_1471));
    float _384 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1473.xy, uint(rint(_1473.z)), _320);
    float _386 = _366 + _364;
    float _388 = _386 + _368;
    float _390 = fma(_350, 0.5, _348);
    float3 _1491 = float3(_378, _390, float(int(_292)));
    float3 _1493 = select(_1491, float3(0.0), isnan(_1491));
    float _392 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1493.xy, uint(rint(_1493.z)), _320);
    float3 _1502 = float3(_336, _390, float(int(_292)));
    float3 _1504 = select(_1502, float3(0.0), isnan(_1502));
    float _394 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1504.xy, uint(rint(_1504.z)), _320);
    float3 _1513 = float3(_340, _390, float(int(_292)));
    float3 _1515 = select(_1513, float3(0.0), isnan(_1513));
    float _396 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1515.xy, uint(rint(_1515.z)), _320);
    float3 _1524 = float3(_380, _390, float(int(_292)));
    float3 _1526 = select(_1524, float3(0.0), isnan(_1524));
    float _398 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1526.xy, uint(rint(_1526.z)), _320);
    float _400 = _388 + _370;
    float _402 = _384 + _374;
    float _404 = _400 + _372;
    float _406 = _402 + _376;
    float _408 = fma(_350, -0.5, _348);
    float _410 = fma(_350, -1.5, _348);
    float _412 = _406 + _382;
    float3 _1556 = float3(_336, _408, float(int(_292)));
    float3 _1558 = select(_1556, float3(0.0), isnan(_1556));
    float _414 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1558.xy, uint(rint(_1558.z)), _320);
    float3 _1567 = float3(_378, _408, float(int(_292)));
    float3 _1569 = select(_1567, float3(0.0), isnan(_1567));
    float _416 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1569.xy, uint(rint(_1569.z)), _320);
    float3 _1578 = float3(_340, _408, float(int(_292)));
    float3 _1580 = select(_1578, float3(0.0), isnan(_1578));
    float _418 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1580.xy, uint(rint(_1580.z)), _320);
    float3 _1589 = float3(_380, _408, float(int(_292)));
    float3 _1591 = select(_1589, float3(0.0), isnan(_1589));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1591.xy, uint(rint(_1591.z)), _320);
    float3 _1600 = float3(_378, _410, float(int(_292)));
    float3 _1602 = select(_1600, float3(0.0), isnan(_1600));
    float _422 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1602.xy, uint(rint(_1602.z)), _320);
    float3 _1611 = float3(_336, _410, float(int(_292)));
    float3 _1613 = select(_1611, float3(0.0), isnan(_1611));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1613.xy, uint(rint(_1613.z)), _320);
    float _426 = -_66;
    float _428 = _426 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _430 = -_68;
    float _432 = _430 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _434 = _428 * _428;
    float _436 = fma(_432, _432, _434);
    float _438 = -_64;
    float _440 = _438 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _442 = fma(_440, _440, _436);
    float _444 = _412 + _392;
    float _446 = sqrt(_442);
    float _448 = _66 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _450 = _66 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _452 = _444 + _394;
    float _454 = _66 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _456 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].x, _448);
    float _458 = _66 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _460 = _452 + _396;
    float _462 = _66 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _464 = _66 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _466 = _66 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _468 = _460 + _398;
    float _470 = _66 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _472 = _66 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _474 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].x, _454);
    float _476 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].x, _462);
    bool _478 = _446 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _480 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].x, _450);
    bool _482 = _446 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _484 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[30].z, _456);
    bool _486 = !_478;
    int _488 = _486 ? 0 : 1;
    float _490 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].x, _458);
    float _492 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].x, _464);
    float _494 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].x, _466);
    float _496 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].x, _470);
    float _498 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].x, _472);
    float _500 = _468 + _416;
    float _502 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[33].z, _474);
    float _504 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[27].z, _476);
    int _506 = 2;
    if (!_478)
    {
        _506 = 1;
    }
    int _508 = _506;
    float _510 = _500 + _414;
    int _512 = _508;
    if (!_482)
    {
        _512 = _488;
    }
    int _514 = _512;
    float _516 = _484 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _518 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[28].z, _492);
    float _520 = _510 + _418;
    float _522 = float(_514);
    float _524 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[29].z, _494);
    float _526 = _520 + _420;
    float _528 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[31].z, _496);
    float _530 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[32].z, _498);
    float _532 = precise::min(_522, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _534 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[25].z, _480);
    float3 _1842 = float3(_340, _410, float(int(_292)));
    float3 _1844 = select(_1842, float3(0.0), isnan(_1842));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1844.xy, uint(rint(_1844.z)), _320);
    float _538 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[26].z, _490);
    bool _540 = _532 != 1.0;
    bool _542 = isnan(_532);
    bool _544 = _540 || _542;
    bool _546 = isnan(1.0);
    bool _548 = _544 || _546;
    float _550 = rint(_532);
    float _552 = precise::max(_550, 0.0);
    uint _554 = uint(_552);
    uint _556 = clamp(_554, 0u, 65535u);
    bool _558 = _532 != 0.0;
    bool _560 = isnan(_532);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    float _568 = _518 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _570 = _524 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _572 = _526 + _422;
    float _574 = -_64;
    float _576 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _578 = _574 + _576;
    float _580 = _572 + _424;
    float _582 = _578 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _584 = precise::clamp(_582, 0.0, 1.0);
    float _586 = _516;
    float _588 = _568;
    float _590 = _570;
    if (_548)
    {
        float _592 = _502 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _586 = _592;
    }
    float _594 = _586;
    float _596 = _594;
    if (_548)
    {
        float _598 = _528 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _588 = _598;
    }
    float _600 = _588;
    float _602 = _600;
    if (!_566)
    {
        float _604 = _504 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _596 = _604;
    }
    float _606 = _596;
    if (_548)
    {
        float _608 = _530 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _590 = _608;
    }
    float _610 = _590;
    float _612 = _610;
    if (!_566)
    {
        float _614 = _534 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _602 = _614;
    }
    float _616 = _602;
    if (!_566)
    {
        float _618 = _538 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _612 = _618;
    }
    float _620 = _612;
    float _622 = 0.0 + _606;
    float _624 = precise::clamp(_622, 0.0, 1.0);
    float _626 = _174 * _624;
    float _628 = _239 * _624;
    float _630 = fma(_626, 0.5, _616);
    float _632 = fma(_628, 1.5, _620);
    float _634 = fma(_628, 0.5, _620);
    float _636 = fma(_626, 1.5, _616);
    float3 _2001 = float3(_380, _410, float(int(_292)));
    float3 _2003 = select(_2001, float3(0.0), isnan(_2001));
    float _638 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2003.xy, uint(rint(_2003.z)), _320);
    float3 _2012 = float3(_630, _632, float(int(_556)));
    float3 _2014 = select(_2012, float3(0.0), isnan(_2012));
    float _640 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2014.xy, uint(rint(_2014.z)), _624);
    float _642 = fma(_626, -0.5, _616);
    float3 _2026 = float3(_636, _632, float(int(_556)));
    float3 _2028 = select(_2026, float3(0.0), isnan(_2026));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2028.xy, uint(rint(_2028.z)), _624);
    float3 _2037 = float3(_642, _632, float(int(_556)));
    float3 _2039 = select(_2037, float3(0.0), isnan(_2037));
    float _646 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2039.xy, uint(rint(_2039.z)), _624);
    float3 _2048 = float3(_630, _634, float(int(_556)));
    float3 _2050 = select(_2048, float3(0.0), isnan(_2048));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2050.xy, uint(rint(_2050.z)), _624);
    float _650 = fma(_626, -1.5, _616);
    float _652 = fma(_404, 0.0625, _584);
    float3 _2066 = float3(_650, _632, float(int(_556)));
    float3 _2068 = select(_2066, float3(0.0), isnan(_2066));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2068.xy, uint(rint(_2068.z)), _624);
    float3 _2077 = float3(_636, _634, float(int(_556)));
    float3 _2079 = select(_2077, float3(0.0), isnan(_2077));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2079.xy, uint(rint(_2079.z)), _624);
    float3 _2088 = float3(_642, _634, float(int(_556)));
    float3 _2090 = select(_2088, float3(0.0), isnan(_2088));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2090.xy, uint(rint(_2090.z)), _624);
    float _660 = fma(_628, -0.5, _620);
    float _662 = _580 + _536;
    float3 _2105 = float3(_650, _634, float(int(_556)));
    float3 _2107 = select(_2105, float3(0.0), isnan(_2105));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2107.xy, uint(rint(_2107.z)), _624);
    float3 _2116 = float3(_636, _660, float(int(_556)));
    float3 _2118 = select(_2116, float3(0.0), isnan(_2116));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2118.xy, uint(rint(_2118.z)), _624);
    float3 _2127 = float3(_630, _660, float(int(_556)));
    float3 _2129 = select(_2127, float3(0.0), isnan(_2127));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2129.xy, uint(rint(_2129.z)), _624);
    float _670 = fma(_628, -1.5, _620);
    float3 _2141 = float3(_642, _660, float(int(_556)));
    float3 _2143 = select(_2141, float3(0.0), isnan(_2141));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2143.xy, uint(rint(_2143.z)), _624);
    float3 _2152 = float3(_650, _660, float(int(_556)));
    float3 _2154 = select(_2152, float3(0.0), isnan(_2152));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2154.xy, uint(rint(_2154.z)), _624);
    float3 _2163 = float3(_636, _670, float(int(_556)));
    float3 _2165 = select(_2163, float3(0.0), isnan(_2163));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2165.xy, uint(rint(_2165.z)), _624);
    float3 _2174 = float3(_630, _670, float(int(_556)));
    float3 _2176 = select(_2174, float3(0.0), isnan(_2174));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2176.xy, uint(rint(_2176.z)), _624);
    float3 _2185 = float3(_642, _670, float(int(_556)));
    float3 _2187 = select(_2185, float3(0.0), isnan(_2185));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2187.xy, uint(rint(_2187.z)), _624);
    float3 _2196 = float3(_650, _670, float(int(_556)));
    float3 _2198 = select(_2196, float3(0.0), isnan(_2196));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2198.xy, uint(rint(_2198.z)), _624);
    float _684 = _662 + _638;
    float _686 = _644 + _640;
    float _688 = _686 + _646;
    float _690 = _688 + _654;
    float _692 = _690 + _656;
    float _694 = _692 + _648;
    float _696 = _694 + _658;
    float _698 = -_64;
    float _700 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _702 = _698 + _700;
    float _704 = _684 * 0.0625;
    float _706 = _702 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _708 = precise::clamp(_706, 0.0, 1.0);
    float _710 = _696 + _664;
    float _712 = _710 + _666;
    float _714 = _712 + _668;
    float _716 = _714 + _672;
    float _718 = _716 + _674;
    float _720 = _718 + _676;
    float _722 = _720 + _678;
    float _724 = _722 + _680;
    float _726 = _724 + _682;
    float _728 = _726 * 0.0625;
    float _730 = _728 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _732 = fma(_704, (*spvDescriptorSet0.fp_c3)._m0[49].z, _730);
    float _734 = _708 + _732;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _652;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _734;
    return out;
}

