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
    float2 _754 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_754, float2(0.0), isnan(_754))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_754, float2(0.0), isnan(_754))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _54;
    float _70 = _66 * _56;
    float _72 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _74 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _76 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _78 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _72);
    float _80 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _76);
    float _82 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _78);
    float _84 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _80);
    float _86 = _82 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _88 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _74);
    float _90 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _92 = _84 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _94 = 1.0 / _86;
    float _96 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _88);
    float _98 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _90);
    float _100 = _96 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _102 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _98);
    float _104 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _106 = _102 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _108 = _100 * _94;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = _106 * _94;
    float _114 = _92 * _94;
    float _116 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _118 = fma(_104, 0.5, _112);
    float _120 = rint(_110);
    float _122 = precise::max(_120, 0.0);
    uint _125 = uint(_122);
    uint _127 = clamp(_125, 0u, 65535u);
    float _129 = fma(_104, 1.5, _112);
    float _131 = fma(_104, -0.5, _112);
    float _133 = fma(_104, -1.5, _112);
    float _135 = fma(_116, 1.5, _114);
    float _137 = fma(_116, 0.5, _114);
    float3 _928 = float3(_129, _135, float(int(_127)));
    float3 _932 = select(_928, float3(0.0), isnan(_928));
    float _139 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _932.xy, uint(rint(_932.z)), 1.0);
    float3 _940 = float3(_118, _135, float(int(_127)));
    float3 _942 = select(_940, float3(0.0), isnan(_940));
    float _141 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _942.xy, uint(rint(_942.z)), 1.0);
    float3 _950 = float3(_131, _135, float(int(_127)));
    float3 _952 = select(_950, float3(0.0), isnan(_950));
    float _143 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _952.xy, uint(rint(_952.z)), 1.0);
    float3 _960 = float3(_133, _135, float(int(_127)));
    float3 _962 = select(_960, float3(0.0), isnan(_960));
    float _145 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _962.xy, uint(rint(_962.z)), 1.0);
    float3 _970 = float3(_129, _137, float(int(_127)));
    float3 _972 = select(_970, float3(0.0), isnan(_970));
    float _147 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _972.xy, uint(rint(_972.z)), 1.0);
    float3 _980 = float3(_118, _137, float(int(_127)));
    float3 _982 = select(_980, float3(0.0), isnan(_980));
    float _149 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _982.xy, uint(rint(_982.z)), 1.0);
    float _151 = fma(_116, -0.5, _114);
    float3 _993 = float3(_131, _137, float(int(_127)));
    float3 _995 = select(_993, float3(0.0), isnan(_993));
    float _153 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _995.xy, uint(rint(_995.z)), 1.0);
    float3 _1003 = float3(_133, _137, float(int(_127)));
    float3 _1005 = select(_1003, float3(0.0), isnan(_1003));
    float _155 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1005.xy, uint(rint(_1005.z)), 1.0);
    float3 _1013 = float3(_129, _151, float(int(_127)));
    float3 _1015 = select(_1013, float3(0.0), isnan(_1013));
    float _157 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1015.xy, uint(rint(_1015.z)), 1.0);
    float3 _1023 = float3(_118, _151, float(int(_127)));
    float3 _1025 = select(_1023, float3(0.0), isnan(_1023));
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1025.xy, uint(rint(_1025.z)), 1.0);
    float3 _1033 = float3(_131, _151, float(int(_127)));
    float3 _1035 = select(_1033, float3(0.0), isnan(_1033));
    float _161 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1035.xy, uint(rint(_1035.z)), 1.0);
    float3 _1043 = float3(_133, _151, float(int(_127)));
    float3 _1045 = select(_1043, float3(0.0), isnan(_1043));
    float _163 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1045.xy, uint(rint(_1045.z)), 1.0);
    float _165 = -_68;
    float _167 = _165 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _169 = -_70;
    float _171 = _169 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _173 = _167 * _167;
    float _175 = fma(_171, _171, _173);
    float _177 = -_66;
    float _179 = _177 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _181 = fma(_179, _179, _175);
    float _183 = _68 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _185 = _68 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _187 = sqrt(_181);
    float _189 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].x, _183);
    float _191 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].x, _185);
    float _193 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _189);
    float _195 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _191);
    bool _199 = _187 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _201 = _187 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _203 = _68 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _205 = !_199;
    int _208 = _205 ? 0 : 1;
    float _210 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].x, _203);
    float _212 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _210);
    int _214 = 2;
    if (!_199)
    {
        _214 = 1;
    }
    int _216 = _214;
    int _218 = _216;
    if (!_201)
    {
        _218 = _208;
    }
    int _220 = _218;
    float _222 = _195 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _224 = float(_220);
    float _226 = _68 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _228 = precise::min(_224, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _230 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].x, _226);
    bool _232 = _228 != 1.0;
    bool _234 = isnan(_228);
    bool _236 = _232 || _234;
    bool _238 = isnan(1.0);
    bool _240 = _236 || _238;
    float _242 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _230);
    bool _244 = _228 != 0.0;
    bool _246 = isnan(_228);
    bool _248 = _244 || _246;
    bool _250 = isnan(0.0);
    bool _252 = _248 || _250;
    float _254 = _222;
    if (_240)
    {
        float _256 = _212 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _254 = _256;
    }
    float _258 = _254;
    float _260 = _139 + _141;
    float _262 = _68 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _264 = _260 + _143;
    float _266 = _242 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _268 = _68 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _270 = _266;
    float _272 = _258;
    if (_240)
    {
        float _274 = _193 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _270 = _274;
    }
    float _276 = _270;
    float _278 = _264 + _145;
    float _280 = _68 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _282 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].x, _268);
    float _284 = _68 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _286 = _278 + _147;
    float _288 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].x, _280);
    float _290 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _282);
    float _292 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].x, _284);
    float _294 = _286 + _149;
    float _296 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _288);
    float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _300 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _292);
    float _302 = _294 + _153;
    float _304 = _298;
    float _306 = _276;
    if (_240)
    {
        float _308 = _296 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _304 = _308;
    }
    float _310 = _304;
    float _312 = fma(_116, -1.5, _114);
    float _314 = _68 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _316 = _302 + _155;
    float _318 = _310;
    if (!_252)
    {
        float _320 = _300 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _318 = _320;
    }
    float _322 = _318;
    float _324 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].x, _314);
    float _326 = _316 + _157;
    float _328 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].x, _262);
    float _330 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _324);
    float _332 = _326 + _159;
    float _334 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _328);
    if (!_252)
    {
        float _336 = _330 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _272 = _336;
    }
    float _338 = _272;
    float _340 = rint(_228);
    float _342 = precise::max(_340, 0.0);
    uint _344 = uint(_342);
    uint _346 = clamp(_344, 0u, 65535u);
    float _348 = _332 + _161;
    if (!_252)
    {
        float _350 = _334 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _306 = _350;
    }
    float _352 = _306;
    float _354 = 0.0 + _338;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float3 _1399 = float3(_129, _312, float(int(_127)));
    float3 _1401 = select(_1399, float3(0.0), isnan(_1399));
    float _360 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1401.xy, uint(rint(_1401.z)), 1.0);
    float _362 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _364 = _348 + _163;
    float _366 = _356 * _358;
    float3 _1420 = float3(_118, _312, float(int(_127)));
    float3 _1422 = select(_1420, float3(0.0), isnan(_1420));
    float _368 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1422.xy, uint(rint(_1422.z)), 1.0);
    float3 _1430 = float3(_131, _312, float(int(_127)));
    float3 _1432 = select(_1430, float3(0.0), isnan(_1430));
    float _370 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1432.xy, uint(rint(_1432.z)), 1.0);
    float3 _1440 = float3(_133, _312, float(int(_127)));
    float3 _1442 = select(_1440, float3(0.0), isnan(_1440));
    float _372 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1442.xy, uint(rint(_1442.z)), 1.0);
    float _374 = _356 * _362;
    float _376 = fma(_366, 0.5, _352);
    float _378 = fma(_366, -0.5, _352);
    float _380 = fma(_374, 1.5, _322);
    float3 _1462 = float3(_376, _380, float(int(_346)));
    float3 _1464 = select(_1462, float3(0.0), isnan(_1462));
    float _382 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1464.xy, uint(rint(_1464.z)), _356);
    float3 _1473 = float3(_378, _380, float(int(_346)));
    float3 _1475 = select(_1473, float3(0.0), isnan(_1473));
    float _384 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1475.xy, uint(rint(_1475.z)), _356);
    float _386 = fma(_366, 1.5, _352);
    float _388 = fma(_366, -1.5, _352);
    float3 _1490 = float3(_388, _380, float(int(_346)));
    float3 _1492 = select(_1490, float3(0.0), isnan(_1490));
    float _390 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1492.xy, uint(rint(_1492.z)), _356);
    float3 _1501 = float3(_386, _380, float(int(_346)));
    float3 _1503 = select(_1501, float3(0.0), isnan(_1501));
    float _392 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1503.xy, uint(rint(_1503.z)), _356);
    float _394 = fma(_374, 0.5, _322);
    float _396 = _364 + _360;
    float _398 = _396 + _368;
    float3 _1521 = float3(_386, _394, float(int(_346)));
    float3 _1523 = select(_1521, float3(0.0), isnan(_1521));
    float _400 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1523.xy, uint(rint(_1523.z)), _356);
    float3 _1532 = float3(_376, _394, float(int(_346)));
    float3 _1534 = select(_1532, float3(0.0), isnan(_1532));
    float _402 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1534.xy, uint(rint(_1534.z)), _356);
    float3 _1543 = float3(_378, _394, float(int(_346)));
    float3 _1545 = select(_1543, float3(0.0), isnan(_1543));
    float _404 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1545.xy, uint(rint(_1545.z)), _356);
    float3 _1554 = float3(_388, _394, float(int(_346)));
    float3 _1556 = select(_1554, float3(0.0), isnan(_1554));
    float _406 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1556.xy, uint(rint(_1556.z)), _356);
    float _408 = _398 + _370;
    float _410 = _408 + _372;
    float _412 = _392 + _382;
    float _414 = fma(_374, -0.5, _322);
    float _416 = fma(_374, -1.5, _322);
    float _418 = _412 + _384;
    float _420 = _418 + _390;
    float3 _1586 = float3(_376, _414, float(int(_346)));
    float3 _1588 = select(_1586, float3(0.0), isnan(_1586));
    float _422 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1588.xy, uint(rint(_1588.z)), _356);
    float3 _1597 = float3(_386, _414, float(int(_346)));
    float3 _1599 = select(_1597, float3(0.0), isnan(_1597));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1599.xy, uint(rint(_1599.z)), _356);
    float3 _1608 = float3(_378, _414, float(int(_346)));
    float3 _1610 = select(_1608, float3(0.0), isnan(_1608));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1610.xy, uint(rint(_1610.z)), _356);
    float3 _1619 = float3(_388, _414, float(int(_346)));
    float3 _1621 = select(_1619, float3(0.0), isnan(_1619));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1621.xy, uint(rint(_1621.z)), _356);
    float3 _1630 = float3(_386, _416, float(int(_346)));
    float3 _1632 = select(_1630, float3(0.0), isnan(_1630));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1632.xy, uint(rint(_1632.z)), _356);
    float3 _1641 = float3(_376, _416, float(int(_346)));
    float3 _1643 = select(_1641, float3(0.0), isnan(_1641));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1643.xy, uint(rint(_1643.z)), _356);
    float _434 = -_68;
    float _436 = _434 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _438 = -_70;
    float _440 = _438 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _442 = _68 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _444 = _436 * _436;
    float _446 = _68 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _448 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].x, _442);
    float _450 = fma(_440, _440, _444);
    float _452 = -_66;
    float _454 = _452 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _456 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].x, _446);
    float _458 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _448);
    float _460 = _420 + _400;
    float _462 = fma(_454, _454, _450);
    float _464 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _456);
    float _466 = _460 + _402;
    float _468 = _68 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _470 = _68 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _472 = sqrt(_462);
    float _474 = _466 + _404;
    float _476 = _68 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _478 = _68 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _480 = _68 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _482 = _474 + _406;
    float _484 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].x, _476);
    float _486 = _68 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _488 = _68 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _490 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].x, _468);
    float _492 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _484);
    float _494 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].x, _470);
    float _496 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].x, _478);
    float _498 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].x, _480);
    float _500 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].x, _486);
    float _502 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].x, _488);
    bool _504 = _472 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _506 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _496);
    bool _508 = _472 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _510 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _498);
    bool _512 = !_504;
    int _514 = _512 ? 0 : 1;
    float _516 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _500);
    float _518 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _502);
    float _520 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _490);
    float _522 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _494);
    float _524 = _506 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _526 = _510 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    int _528 = 2;
    float _530 = _524;
    float _532 = _526;
    if (!_504)
    {
        _528 = 1;
    }
    int _534 = _528;
    int _536 = _534;
    if (!_508)
    {
        _536 = _514;
    }
    int _538 = _536;
    float _540 = _482 + _424;
    float _542 = float(_538);
    float _544 = _492 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _546 = _540 + _422;
    float _548 = precise::min(_542, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _550 = _546 + _426;
    float _552 = -_66;
    float _554 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _556 = _552 + _554;
    bool _558 = _548 != 1.0;
    bool _560 = isnan(_548);
    bool _562 = _558 || _560;
    bool _564 = isnan(1.0);
    bool _566 = _562 || _564;
    float _568 = rint(_548);
    float _570 = precise::max(_568, 0.0);
    uint _572 = uint(_570);
    uint _574 = clamp(_572, 0u, 65535u);
    bool _576 = _548 != 0.0;
    bool _578 = isnan(_548);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = _550 + _428;
    float _588 = _556 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _590 = precise::clamp(_588, 0.0, 1.0);
    float _592 = _586 + _430;
    float _594 = _592 + _432;
    float _596 = _544;
    if (_566)
    {
        float _598 = _458 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _596 = _598;
    }
    float _600 = _596;
    float _602 = _600;
    if (_566)
    {
        float _604 = _516 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _530 = _604;
    }
    float _606 = _530;
    float _608 = _606;
    if (!_584)
    {
        float _610 = _464 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _602 = _610;
    }
    float _612 = _602;
    if (_566)
    {
        float _614 = _518 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _532 = _614;
    }
    float _616 = _532;
    float _618 = _616;
    if (!_584)
    {
        float _620 = _520 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _608 = _620;
    }
    float _622 = _608;
    float _624 = 0.0 + _612;
    float _626 = precise::clamp(_624, 0.0, 1.0);
    float3 _1992 = float3(_378, _416, float(int(_346)));
    float3 _1994 = select(_1992, float3(0.0), isnan(_1992));
    float _628 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1994.xy, uint(rint(_1994.z)), _356);
    if (!_584)
    {
        float _630 = _522 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _618 = _630;
    }
    float _632 = _618;
    float _634 = _358 * _626;
    float _636 = _362 * _626;
    float _638 = fma(_634, 0.5, _622);
    float _640 = fma(_636, 1.5, _632);
    float _642 = fma(_636, 0.5, _632);
    float _644 = fma(_634, 1.5, _622);
    float3 _2031 = float3(_388, _416, float(int(_346)));
    float3 _2033 = select(_2031, float3(0.0), isnan(_2031));
    float _646 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2033.xy, uint(rint(_2033.z)), _356);
    float3 _2042 = float3(_638, _640, float(int(_574)));
    float3 _2044 = select(_2042, float3(0.0), isnan(_2042));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2044.xy, uint(rint(_2044.z)), _626);
    float _650 = fma(_634, -0.5, _622);
    float3 _2056 = float3(_644, _640, float(int(_574)));
    float3 _2058 = select(_2056, float3(0.0), isnan(_2056));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2058.xy, uint(rint(_2058.z)), _626);
    float3 _2067 = float3(_650, _640, float(int(_574)));
    float3 _2069 = select(_2067, float3(0.0), isnan(_2067));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2069.xy, uint(rint(_2069.z)), _626);
    float3 _2078 = float3(_638, _642, float(int(_574)));
    float3 _2080 = select(_2078, float3(0.0), isnan(_2078));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2080.xy, uint(rint(_2080.z)), _626);
    float _658 = fma(_634, -1.5, _622);
    float _660 = fma(_410, 0.0625, _590);
    float3 _2096 = float3(_658, _640, float(int(_574)));
    float3 _2098 = select(_2096, float3(0.0), isnan(_2096));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2098.xy, uint(rint(_2098.z)), _626);
    float3 _2107 = float3(_644, _642, float(int(_574)));
    float3 _2109 = select(_2107, float3(0.0), isnan(_2107));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2109.xy, uint(rint(_2109.z)), _626);
    float3 _2118 = float3(_650, _642, float(int(_574)));
    float3 _2120 = select(_2118, float3(0.0), isnan(_2118));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2120.xy, uint(rint(_2120.z)), _626);
    float _668 = fma(_636, -0.5, _632);
    float _670 = _594 + _628;
    float3 _2135 = float3(_658, _642, float(int(_574)));
    float3 _2137 = select(_2135, float3(0.0), isnan(_2135));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2137.xy, uint(rint(_2137.z)), _626);
    float3 _2146 = float3(_644, _668, float(int(_574)));
    float3 _2148 = select(_2146, float3(0.0), isnan(_2146));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2148.xy, uint(rint(_2148.z)), _626);
    float3 _2157 = float3(_638, _668, float(int(_574)));
    float3 _2159 = select(_2157, float3(0.0), isnan(_2157));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2159.xy, uint(rint(_2159.z)), _626);
    float _678 = fma(_636, -1.5, _632);
    float3 _2171 = float3(_650, _668, float(int(_574)));
    float3 _2173 = select(_2171, float3(0.0), isnan(_2171));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2173.xy, uint(rint(_2173.z)), _626);
    float3 _2182 = float3(_658, _668, float(int(_574)));
    float3 _2184 = select(_2182, float3(0.0), isnan(_2182));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2184.xy, uint(rint(_2184.z)), _626);
    float _684 = _670 + _646;
    float3 _2196 = float3(_644, _678, float(int(_574)));
    float3 _2198 = select(_2196, float3(0.0), isnan(_2196));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2198.xy, uint(rint(_2198.z)), _626);
    float3 _2207 = float3(_638, _678, float(int(_574)));
    float3 _2209 = select(_2207, float3(0.0), isnan(_2207));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2209.xy, uint(rint(_2209.z)), _626);
    float3 _2218 = float3(_650, _678, float(int(_574)));
    float3 _2220 = select(_2218, float3(0.0), isnan(_2218));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2220.xy, uint(rint(_2220.z)), _626);
    float3 _2229 = float3(_658, _678, float(int(_574)));
    float3 _2231 = select(_2229, float3(0.0), isnan(_2229));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2231.xy, uint(rint(_2231.z)), _626);
    float _694 = _652 + _648;
    float _696 = _694 + _654;
    float _698 = _696 + _662;
    float _700 = _698 + _664;
    float _702 = _700 + _656;
    float _704 = _702 + _666;
    float _706 = -_66;
    float _708 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _710 = _706 + _708;
    float _712 = _684 * 0.0625;
    float _714 = _710 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _716 = precise::clamp(_714, 0.0, 1.0);
    float _718 = _704 + _672;
    float _720 = _718 + _674;
    float _722 = _720 + _676;
    float _724 = _722 + _680;
    float _726 = _724 + _682;
    float _728 = _726 + _686;
    float _730 = _728 + _688;
    float _732 = _730 + _690;
    float _734 = _732 + _692;
    float _736 = _734 * 0.0625;
    float _738 = _736 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _740 = fma(_712, (*spvDescriptorSet0.fp_c3)._m0[49].z, _738);
    float _742 = _716 + _740;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _660;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _742;
    return out;
}

