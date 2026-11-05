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
    float2 _750 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_750, float2(0.0), isnan(_750))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_750, float2(0.0), isnan(_750))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _60 = -_52;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _54;
    float _68 = _64 * _56;
    float _70 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _74 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _76 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _74);
    float _78 = _76 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _80 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _72);
    float _82 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _84 = 1.0 / _78;
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _80);
    float _88 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _90 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _82);
    float _92 = _86 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _94 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _88);
    float _96 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _90);
    float _98 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _94);
    float _100 = _96 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _102 = _98 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _104 = _92 * _84;
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = _100 * _84;
    float _110 = _102 * _84;
    float _112 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _114 = rint(_106);
    float _116 = precise::max(_114, 0.0);
    uint _119 = uint(_116);
    uint _121 = clamp(_119, 0u, 65535u);
    float _123 = fma(_58, 1.5, _108);
    float _125 = fma(_58, 0.5, _108);
    float _127 = fma(_112, 1.5, _110);
    float _129 = fma(_58, -0.5, _108);
    float _131 = fma(_58, -1.5, _108);
    float _133 = fma(_112, 0.5, _110);
    float3 _920 = float3(_123, _127, float(int(_121)));
    float3 _924 = select(_920, float3(0.0), isnan(_920));
    float _135 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _924.xy, uint(rint(_924.z)), 1.0);
    float3 _932 = float3(_125, _127, float(int(_121)));
    float3 _934 = select(_932, float3(0.0), isnan(_932));
    float _137 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _934.xy, uint(rint(_934.z)), 1.0);
    float3 _942 = float3(_129, _127, float(int(_121)));
    float3 _944 = select(_942, float3(0.0), isnan(_942));
    float _139 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _944.xy, uint(rint(_944.z)), 1.0);
    float3 _952 = float3(_131, _127, float(int(_121)));
    float3 _954 = select(_952, float3(0.0), isnan(_952));
    float _141 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _954.xy, uint(rint(_954.z)), 1.0);
    float3 _962 = float3(_123, _133, float(int(_121)));
    float3 _964 = select(_962, float3(0.0), isnan(_962));
    float _143 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _964.xy, uint(rint(_964.z)), 1.0);
    float3 _972 = float3(_125, _133, float(int(_121)));
    float3 _974 = select(_972, float3(0.0), isnan(_972));
    float _145 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _974.xy, uint(rint(_974.z)), 1.0);
    float _147 = fma(_112, -0.5, _110);
    float3 _985 = float3(_129, _133, float(int(_121)));
    float3 _987 = select(_985, float3(0.0), isnan(_985));
    float _149 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _987.xy, uint(rint(_987.z)), 1.0);
    float3 _995 = float3(_131, _133, float(int(_121)));
    float3 _997 = select(_995, float3(0.0), isnan(_995));
    float _151 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _997.xy, uint(rint(_997.z)), 1.0);
    float3 _1005 = float3(_123, _147, float(int(_121)));
    float3 _1007 = select(_1005, float3(0.0), isnan(_1005));
    float _153 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1007.xy, uint(rint(_1007.z)), 1.0);
    float3 _1015 = float3(_125, _147, float(int(_121)));
    float3 _1017 = select(_1015, float3(0.0), isnan(_1015));
    float _155 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1017.xy, uint(rint(_1017.z)), 1.0);
    float3 _1025 = float3(_129, _147, float(int(_121)));
    float3 _1027 = select(_1025, float3(0.0), isnan(_1025));
    float _157 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1027.xy, uint(rint(_1027.z)), 1.0);
    float3 _1035 = float3(_131, _147, float(int(_121)));
    float3 _1037 = select(_1035, float3(0.0), isnan(_1035));
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1037.xy, uint(rint(_1037.z)), 1.0);
    float _161 = -_66;
    float _163 = _161 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _165 = -_68;
    float _167 = _165 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _169 = _163 * _163;
    float _171 = fma(_167, _167, _169);
    float _173 = -_64;
    float _175 = _173 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _177 = fma(_175, _175, _171);
    float _179 = _66 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _181 = _66 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _183 = sqrt(_177);
    float _185 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].x, _179);
    float _187 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].x, _181);
    float _189 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[22].z, _185);
    float _191 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[21].z, _187);
    bool _195 = _183 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _197 = _183 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _199 = _66 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _201 = !_195;
    int _204 = _201 ? 0 : 1;
    float _206 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].x, _199);
    float _208 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[24].z, _206);
    int _210 = 2;
    if (!_195)
    {
        _210 = 1;
    }
    int _212 = _210;
    int _214 = _212;
    if (!_197)
    {
        _214 = _204;
    }
    int _216 = _214;
    float _218 = _191 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _220 = float(_216);
    float _222 = _66 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _224 = precise::min(_220, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _226 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].x, _222);
    bool _228 = _224 != 1.0;
    bool _230 = isnan(_224);
    bool _232 = _228 || _230;
    bool _234 = isnan(1.0);
    bool _236 = _232 || _234;
    float _238 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[19].z, _226);
    bool _240 = _224 != 0.0;
    bool _242 = isnan(_224);
    bool _244 = _240 || _242;
    bool _246 = isnan(0.0);
    bool _248 = _244 || _246;
    float _250 = _218;
    if (_236)
    {
        float _252 = _208 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _250 = _252;
    }
    float _254 = _250;
    float _256 = _135 + _137;
    float _258 = _66 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _260 = _256 + _139;
    float _262 = _238 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _264 = _66 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _266 = _262;
    float _268 = _254;
    if (_236)
    {
        float _270 = _189 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _266 = _270;
    }
    float _272 = _266;
    float _274 = _260 + _141;
    float _276 = _66 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _278 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].x, _264);
    float _280 = _66 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _282 = _274 + _143;
    float _284 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].x, _276);
    float _286 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[20].z, _278);
    float _288 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].x, _280);
    float _290 = _282 + _145;
    float _292 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[23].z, _284);
    float _294 = _286 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _296 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[17].z, _288);
    float _298 = _290 + _149;
    float _300 = _294;
    float _302 = _272;
    if (_236)
    {
        float _304 = _292 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _300 = _304;
    }
    float _306 = _300;
    float _308 = fma(_112, -1.5, _110);
    float _310 = _66 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _312 = _298 + _151;
    float _314 = _306;
    if (!_248)
    {
        float _316 = _296 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _314 = _316;
    }
    float _318 = _314;
    float _320 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].x, _310);
    float _322 = _312 + _153;
    float _324 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].x, _258);
    float _326 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[18].z, _320);
    float _328 = _322 + _155;
    float _330 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[16].z, _324);
    if (!_248)
    {
        float _332 = _326 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _268 = _332;
    }
    float _334 = _268;
    float _336 = rint(_224);
    float _338 = precise::max(_336, 0.0);
    uint _340 = uint(_338);
    uint _342 = clamp(_340, 0u, 65535u);
    float _344 = _328 + _157;
    if (!_248)
    {
        float _346 = _330 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _302 = _346;
    }
    float _348 = _302;
    float _350 = 0.0 + _334;
    float _352 = precise::clamp(_350, 0.0, 1.0);
    float _354 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float3 _1391 = float3(_123, _308, float(int(_121)));
    float3 _1393 = select(_1391, float3(0.0), isnan(_1391));
    float _356 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1393.xy, uint(rint(_1393.z)), 1.0);
    float _358 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _360 = _344 + _159;
    float _362 = _352 * _354;
    float3 _1412 = float3(_125, _308, float(int(_121)));
    float3 _1414 = select(_1412, float3(0.0), isnan(_1412));
    float _364 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1414.xy, uint(rint(_1414.z)), 1.0);
    float3 _1422 = float3(_129, _308, float(int(_121)));
    float3 _1424 = select(_1422, float3(0.0), isnan(_1422));
    float _366 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1424.xy, uint(rint(_1424.z)), 1.0);
    float3 _1432 = float3(_131, _308, float(int(_121)));
    float3 _1434 = select(_1432, float3(0.0), isnan(_1432));
    float _368 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1434.xy, uint(rint(_1434.z)), 1.0);
    float _370 = _352 * _358;
    float _372 = fma(_362, 0.5, _348);
    float _374 = fma(_362, -0.5, _348);
    float _376 = fma(_370, 1.5, _318);
    float3 _1454 = float3(_372, _376, float(int(_342)));
    float3 _1456 = select(_1454, float3(0.0), isnan(_1454));
    float _378 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1456.xy, uint(rint(_1456.z)), _352);
    float3 _1465 = float3(_374, _376, float(int(_342)));
    float3 _1467 = select(_1465, float3(0.0), isnan(_1465));
    float _380 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1467.xy, uint(rint(_1467.z)), _352);
    float _382 = fma(_362, 1.5, _348);
    float _384 = fma(_362, -1.5, _348);
    float3 _1482 = float3(_384, _376, float(int(_342)));
    float3 _1484 = select(_1482, float3(0.0), isnan(_1482));
    float _386 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1484.xy, uint(rint(_1484.z)), _352);
    float3 _1493 = float3(_382, _376, float(int(_342)));
    float3 _1495 = select(_1493, float3(0.0), isnan(_1493));
    float _388 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1495.xy, uint(rint(_1495.z)), _352);
    float _390 = fma(_370, 0.5, _318);
    float _392 = _360 + _356;
    float _394 = _392 + _364;
    float3 _1513 = float3(_382, _390, float(int(_342)));
    float3 _1515 = select(_1513, float3(0.0), isnan(_1513));
    float _396 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1515.xy, uint(rint(_1515.z)), _352);
    float3 _1524 = float3(_372, _390, float(int(_342)));
    float3 _1526 = select(_1524, float3(0.0), isnan(_1524));
    float _398 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1526.xy, uint(rint(_1526.z)), _352);
    float3 _1535 = float3(_374, _390, float(int(_342)));
    float3 _1537 = select(_1535, float3(0.0), isnan(_1535));
    float _400 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1537.xy, uint(rint(_1537.z)), _352);
    float3 _1546 = float3(_384, _390, float(int(_342)));
    float3 _1548 = select(_1546, float3(0.0), isnan(_1546));
    float _402 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1548.xy, uint(rint(_1548.z)), _352);
    float _404 = _394 + _366;
    float _406 = _404 + _368;
    float _408 = _388 + _378;
    float _410 = fma(_370, -0.5, _318);
    float _412 = fma(_370, -1.5, _318);
    float _414 = _408 + _380;
    float _416 = _414 + _386;
    float3 _1578 = float3(_372, _410, float(int(_342)));
    float3 _1580 = select(_1578, float3(0.0), isnan(_1578));
    float _418 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1580.xy, uint(rint(_1580.z)), _352);
    float3 _1589 = float3(_382, _410, float(int(_342)));
    float3 _1591 = select(_1589, float3(0.0), isnan(_1589));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1591.xy, uint(rint(_1591.z)), _352);
    float3 _1600 = float3(_374, _410, float(int(_342)));
    float3 _1602 = select(_1600, float3(0.0), isnan(_1600));
    float _422 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1602.xy, uint(rint(_1602.z)), _352);
    float3 _1611 = float3(_384, _410, float(int(_342)));
    float3 _1613 = select(_1611, float3(0.0), isnan(_1611));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1613.xy, uint(rint(_1613.z)), _352);
    float3 _1622 = float3(_382, _412, float(int(_342)));
    float3 _1624 = select(_1622, float3(0.0), isnan(_1622));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1624.xy, uint(rint(_1624.z)), _352);
    float3 _1633 = float3(_372, _412, float(int(_342)));
    float3 _1635 = select(_1633, float3(0.0), isnan(_1633));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1635.xy, uint(rint(_1635.z)), _352);
    float _430 = -_66;
    float _432 = _430 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _434 = -_68;
    float _436 = _434 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _438 = _66 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _440 = _432 * _432;
    float _442 = _66 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _444 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].x, _438);
    float _446 = fma(_436, _436, _440);
    float _448 = -_64;
    float _450 = _448 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _452 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].x, _442);
    float _454 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[33].z, _444);
    float _456 = _416 + _396;
    float _458 = fma(_450, _450, _446);
    float _460 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[27].z, _452);
    float _462 = _456 + _398;
    float _464 = _66 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _466 = _66 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _468 = sqrt(_458);
    float _470 = _462 + _400;
    float _472 = _66 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _474 = _66 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _476 = _66 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _478 = _470 + _402;
    float _480 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].x, _472);
    float _482 = _66 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _484 = _66 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _486 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].x, _464);
    float _488 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[30].z, _480);
    float _490 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].x, _466);
    float _492 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].x, _474);
    float _494 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].x, _476);
    float _496 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].x, _482);
    float _498 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].x, _484);
    bool _500 = _468 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _502 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[28].z, _492);
    bool _504 = _468 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _506 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[29].z, _494);
    bool _508 = !_500;
    int _510 = _508 ? 0 : 1;
    float _512 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[31].z, _496);
    float _514 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[32].z, _498);
    float _516 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[25].z, _486);
    float _518 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[26].z, _490);
    float _520 = _502 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _522 = _506 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    int _524 = 2;
    float _526 = _520;
    float _528 = _522;
    if (!_500)
    {
        _524 = 1;
    }
    int _530 = _524;
    int _532 = _530;
    if (!_504)
    {
        _532 = _510;
    }
    int _534 = _532;
    float _536 = _478 + _420;
    float _538 = float(_534);
    float _540 = _488 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _542 = _536 + _418;
    float _544 = precise::min(_538, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _546 = _542 + _422;
    float _548 = -_64;
    float _550 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _552 = _548 + _550;
    bool _554 = _544 != 1.0;
    bool _556 = isnan(_544);
    bool _558 = _554 || _556;
    bool _560 = isnan(1.0);
    bool _562 = _558 || _560;
    float _564 = rint(_544);
    float _566 = precise::max(_564, 0.0);
    uint _568 = uint(_566);
    uint _570 = clamp(_568, 0u, 65535u);
    bool _572 = _544 != 0.0;
    bool _574 = isnan(_544);
    bool _576 = _572 || _574;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    float _582 = _546 + _424;
    float _584 = _552 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _586 = precise::clamp(_584, 0.0, 1.0);
    float _588 = _582 + _426;
    float _590 = _588 + _428;
    float _592 = _540;
    if (_562)
    {
        float _594 = _454 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _592 = _594;
    }
    float _596 = _592;
    float _598 = _596;
    if (_562)
    {
        float _600 = _512 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _526 = _600;
    }
    float _602 = _526;
    float _604 = _602;
    if (!_580)
    {
        float _606 = _460 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _598 = _606;
    }
    float _608 = _598;
    if (_562)
    {
        float _610 = _514 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _528 = _610;
    }
    float _612 = _528;
    float _614 = _612;
    if (!_580)
    {
        float _616 = _516 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _604 = _616;
    }
    float _618 = _604;
    float _620 = 0.0 + _608;
    float _622 = precise::clamp(_620, 0.0, 1.0);
    float3 _1984 = float3(_374, _412, float(int(_342)));
    float3 _1986 = select(_1984, float3(0.0), isnan(_1984));
    float _624 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1986.xy, uint(rint(_1986.z)), _352);
    if (!_580)
    {
        float _626 = _518 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _614 = _626;
    }
    float _628 = _614;
    float _630 = _354 * _622;
    float _632 = _358 * _622;
    float _634 = fma(_630, 0.5, _618);
    float _636 = fma(_632, 1.5, _628);
    float _638 = fma(_632, 0.5, _628);
    float _640 = fma(_630, 1.5, _618);
    float3 _2023 = float3(_384, _412, float(int(_342)));
    float3 _2025 = select(_2023, float3(0.0), isnan(_2023));
    float _642 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2025.xy, uint(rint(_2025.z)), _352);
    float3 _2034 = float3(_634, _636, float(int(_570)));
    float3 _2036 = select(_2034, float3(0.0), isnan(_2034));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2036.xy, uint(rint(_2036.z)), _622);
    float _646 = fma(_630, -0.5, _618);
    float3 _2048 = float3(_640, _636, float(int(_570)));
    float3 _2050 = select(_2048, float3(0.0), isnan(_2048));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2050.xy, uint(rint(_2050.z)), _622);
    float3 _2059 = float3(_646, _636, float(int(_570)));
    float3 _2061 = select(_2059, float3(0.0), isnan(_2059));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2061.xy, uint(rint(_2061.z)), _622);
    float3 _2070 = float3(_634, _638, float(int(_570)));
    float3 _2072 = select(_2070, float3(0.0), isnan(_2070));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2072.xy, uint(rint(_2072.z)), _622);
    float _654 = fma(_630, -1.5, _618);
    float _656 = fma(_406, 0.0625, _586);
    float3 _2088 = float3(_654, _636, float(int(_570)));
    float3 _2090 = select(_2088, float3(0.0), isnan(_2088));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2090.xy, uint(rint(_2090.z)), _622);
    float3 _2099 = float3(_640, _638, float(int(_570)));
    float3 _2101 = select(_2099, float3(0.0), isnan(_2099));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2101.xy, uint(rint(_2101.z)), _622);
    float3 _2110 = float3(_646, _638, float(int(_570)));
    float3 _2112 = select(_2110, float3(0.0), isnan(_2110));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2112.xy, uint(rint(_2112.z)), _622);
    float _664 = fma(_632, -0.5, _628);
    float _666 = _590 + _624;
    float3 _2127 = float3(_654, _638, float(int(_570)));
    float3 _2129 = select(_2127, float3(0.0), isnan(_2127));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2129.xy, uint(rint(_2129.z)), _622);
    float3 _2138 = float3(_640, _664, float(int(_570)));
    float3 _2140 = select(_2138, float3(0.0), isnan(_2138));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2140.xy, uint(rint(_2140.z)), _622);
    float3 _2149 = float3(_634, _664, float(int(_570)));
    float3 _2151 = select(_2149, float3(0.0), isnan(_2149));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2151.xy, uint(rint(_2151.z)), _622);
    float _674 = fma(_632, -1.5, _628);
    float3 _2163 = float3(_646, _664, float(int(_570)));
    float3 _2165 = select(_2163, float3(0.0), isnan(_2163));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2165.xy, uint(rint(_2165.z)), _622);
    float3 _2174 = float3(_654, _664, float(int(_570)));
    float3 _2176 = select(_2174, float3(0.0), isnan(_2174));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2176.xy, uint(rint(_2176.z)), _622);
    float _680 = _666 + _642;
    float3 _2188 = float3(_640, _674, float(int(_570)));
    float3 _2190 = select(_2188, float3(0.0), isnan(_2188));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2190.xy, uint(rint(_2190.z)), _622);
    float3 _2199 = float3(_634, _674, float(int(_570)));
    float3 _2201 = select(_2199, float3(0.0), isnan(_2199));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2201.xy, uint(rint(_2201.z)), _622);
    float3 _2210 = float3(_646, _674, float(int(_570)));
    float3 _2212 = select(_2210, float3(0.0), isnan(_2210));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2212.xy, uint(rint(_2212.z)), _622);
    float3 _2221 = float3(_654, _674, float(int(_570)));
    float3 _2223 = select(_2221, float3(0.0), isnan(_2221));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2223.xy, uint(rint(_2223.z)), _622);
    float _690 = _648 + _644;
    float _692 = _690 + _650;
    float _694 = _692 + _658;
    float _696 = _694 + _660;
    float _698 = _696 + _652;
    float _700 = _698 + _662;
    float _702 = -_64;
    float _704 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _706 = _702 + _704;
    float _708 = _680 * 0.0625;
    float _710 = _706 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _712 = precise::clamp(_710, 0.0, 1.0);
    float _714 = _700 + _668;
    float _716 = _714 + _670;
    float _718 = _716 + _672;
    float _720 = _718 + _676;
    float _722 = _720 + _678;
    float _724 = _722 + _682;
    float _726 = _724 + _684;
    float _728 = _726 + _686;
    float _730 = _728 + _688;
    float _732 = _730 * 0.0625;
    float _734 = _732 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _736 = fma(_708, (*spvDescriptorSet0.fp_c3)._m0[49].z, _734);
    float _738 = _712 + _736;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _656;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _738;
    return out;
}

