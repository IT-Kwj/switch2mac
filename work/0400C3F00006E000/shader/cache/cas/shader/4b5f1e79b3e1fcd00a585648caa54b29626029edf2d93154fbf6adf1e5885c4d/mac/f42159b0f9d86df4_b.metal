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
    texture2d_array<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_A [[id(11)]];
    sampler fp_t_tcb_ASmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _775 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_775, float2(0.0), isnan(_775))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_775, float2(0.0), isnan(_775))).x;
    float _58 = in.m_42.y;
    float _60 = in.m_42.x;
    float _62 = -_56;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].z, _64);
    float _68 = _66 * _58;
    float _70 = _66 * _60;
    float _72 = -_68;
    float _74 = _72 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _76 = -_70;
    float _78 = _76 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _80 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _82 = _74 * _74;
    float _84 = -_66;
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _88 = fma(_78, _78, _82);
    float _90 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _92 = fma(_86, _86, _88);
    float _94 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _90);
    float _96 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _98 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _100 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _94);
    float _102 = sqrt(_92);
    float _104 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _98);
    float _106 = _100 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _108 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _96);
    float _110 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _104);
    float _112 = 1.0 / _106;
    float _114 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _108);
    float _116 = _110 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _118 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _120 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _122 = _114 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _126 = _102 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _128 = _102 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _130 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _80);
    bool _132 = !_126;
    int _135 = _132 ? 0 : 1;
    float _137 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
    float _139 = _122 * _112;
    float _141 = _116 * _112;
    float _143 = _137 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _145 = fma(_118, 1.5, _139);
    int _147 = 2;
    if (!_126)
    {
        _147 = 1;
    }
    int _149 = _147;
    float _151 = fma(_120, 1.5, _141);
    float _153 = _143 * _112;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    int _157 = _149;
    if (!_128)
    {
        _157 = _135;
    }
    int _159 = _157;
    float _161 = _68 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _163 = fma(_118, 0.5, _139);
    float _165 = fma(_118, -0.5, _139);
    float _167 = float(_159);
    float _169 = rint(_155);
    float _171 = precise::max(_169, 0.0);
    uint _174 = uint(_171);
    uint _176 = clamp(_174, 0u, 65535u);
    float _178 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].x, _161);
    float _180 = fma(_118, -1.5, _139);
    float _182 = _68 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _184 = fma(_120, 0.5, _141);
    float _186 = precise::min(_167, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _188 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _178);
    float _190 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].x, _182);
    bool _192 = _186 != 1.0;
    bool _194 = isnan(_186);
    bool _196 = _192 || _194;
    bool _198 = isnan(1.0);
    bool _200 = _196 || _198;
    float _202 = _188 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _204 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _190);
    float3 _1054 = float3(_145, _151, float(int(_176)));
    float3 _1058 = select(_1054, float3(0.0), isnan(_1054));
    float _206 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1058.xy, uint(rint(_1058.z)), 1.0);
    float3 _1066 = float3(_163, _151, float(int(_176)));
    float3 _1068 = select(_1066, float3(0.0), isnan(_1066));
    float _208 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1068.xy, uint(rint(_1068.z)), 1.0);
    float3 _1076 = float3(_165, _151, float(int(_176)));
    float3 _1078 = select(_1076, float3(0.0), isnan(_1076));
    float _210 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1078.xy, uint(rint(_1078.z)), 1.0);
    float3 _1086 = float3(_180, _151, float(int(_176)));
    float3 _1088 = select(_1086, float3(0.0), isnan(_1086));
    float _212 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1088.xy, uint(rint(_1088.z)), 1.0);
    float3 _1096 = float3(_145, _184, float(int(_176)));
    float3 _1098 = select(_1096, float3(0.0), isnan(_1096));
    float _214 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1098.xy, uint(rint(_1098.z)), 1.0);
    float3 _1106 = float3(_163, _184, float(int(_176)));
    float3 _1108 = select(_1106, float3(0.0), isnan(_1106));
    float _216 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1108.xy, uint(rint(_1108.z)), 1.0);
    float _218 = _68 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _220 = _68 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _222 = _202;
    if (_200)
    {
        float _224 = _204 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _222 = _224;
    }
    float _226 = _222;
    bool _228 = _186 != 0.0;
    bool _230 = isnan(_186);
    bool _232 = _228 || _230;
    bool _234 = isnan(0.0);
    bool _236 = _232 || _234;
    float _238 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].x, _218);
    float _240 = _68 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _242 = _68 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _244 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].x, _220);
    float _246 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _238);
    float _248 = _68 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _250 = _68 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _252 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].x, _240);
    float _254 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _244);
    float _256 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].x, _242);
    float _258 = _246 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _260 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].x, _248);
    float _262 = _258;
    float _264 = _226;
    if (_200)
    {
        float _266 = _254 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _262 = _266;
    }
    float _268 = _262;
    float _270 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _256);
    float _272 = _68 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _274 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].x, _250);
    float _276 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _260);
    float _278 = _268;
    if (!_236)
    {
        float _280 = _270 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _264 = _280;
    }
    float _282 = _264;
    float _284 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _252);
    float _286 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].x, _272);
    float _288 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _274);
    float _290 = _276 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _292 = _290;
    if (!_236)
    {
        float _294 = _284 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _278 = _294;
    }
    float _296 = _278;
    float _298 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _286);
    if (_200)
    {
        float _300 = _288 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _292 = _300;
    }
    float _302 = _292;
    float _304 = fma(_120, -0.5, _141);
    float _306 = _302;
    if (!_236)
    {
        float _308 = _298 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _306 = _308;
    }
    float _310 = _306;
    float _312 = fma(_120, -1.5, _141);
    float _314 = rint(_186);
    float _316 = precise::max(_314, 0.0);
    uint _318 = uint(_316);
    uint _320 = clamp(_318, 0u, 65535u);
    float _322 = _206 + _208;
    float _324 = _322 + _210;
    float _326 = _324 + _212;
    float3 _1326 = float3(_165, _184, float(int(_176)));
    float3 _1328 = select(_1326, float3(0.0), isnan(_1326));
    float _328 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1328.xy, uint(rint(_1328.z)), 1.0);
    float3 _1336 = float3(_180, _184, float(int(_176)));
    float3 _1338 = select(_1336, float3(0.0), isnan(_1336));
    float _330 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1338.xy, uint(rint(_1338.z)), 1.0);
    float3 _1346 = float3(_145, _304, float(int(_176)));
    float3 _1348 = select(_1346, float3(0.0), isnan(_1346));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1348.xy, uint(rint(_1348.z)), 1.0);
    float3 _1356 = float3(_163, _304, float(int(_176)));
    float3 _1358 = select(_1356, float3(0.0), isnan(_1356));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1358.xy, uint(rint(_1358.z)), 1.0);
    float3 _1366 = float3(_165, _304, float(int(_176)));
    float3 _1368 = select(_1366, float3(0.0), isnan(_1366));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1368.xy, uint(rint(_1368.z)), 1.0);
    float3 _1376 = float3(_180, _304, float(int(_176)));
    float3 _1378 = select(_1376, float3(0.0), isnan(_1376));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1378.xy, uint(rint(_1378.z)), 1.0);
    float _340 = _326 + _214;
    float _342 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _344 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float3 _1399 = float3(_145, _312, float(int(_176)));
    float3 _1401 = select(_1399, float3(0.0), isnan(_1399));
    float _346 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1401.xy, uint(rint(_1401.z)), 1.0);
    float3 _1409 = float3(_163, _312, float(int(_176)));
    float3 _1411 = select(_1409, float3(0.0), isnan(_1409));
    float _348 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1411.xy, uint(rint(_1411.z)), 1.0);
    float _350 = 0.0 + _310;
    float _352 = precise::clamp(_350, 0.0, 1.0);
    float3 _1423 = float3(_165, _312, float(int(_176)));
    float3 _1425 = select(_1423, float3(0.0), isnan(_1423));
    float _354 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1425.xy, uint(rint(_1425.z)), 1.0);
    float _356 = _352 * _344;
    float _358 = _352 * _342;
    float _360 = fma(_356, 1.5, _296);
    float _362 = fma(_358, 0.5, _282);
    float _364 = fma(_358, 1.5, _282);
    float3 _1448 = float3(_180, _312, float(int(_176)));
    float3 _1450 = select(_1448, float3(0.0), isnan(_1448));
    float _366 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1450.xy, uint(rint(_1450.z)), 1.0);
    float3 _1458 = float3(_362, _360, float(int(_320)));
    float3 _1460 = select(_1458, float3(0.0), isnan(_1458));
    float _368 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1460.xy, uint(rint(_1460.z)), _352);
    float3 _1469 = float3(_364, _360, float(int(_320)));
    float3 _1471 = select(_1469, float3(0.0), isnan(_1469));
    float _370 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1471.xy, uint(rint(_1471.z)), _352);
    float _372 = _340 + _216;
    float _374 = _372 + _328;
    float _376 = _374 + _330;
    float _378 = fma(_356, -0.5, _296);
    float _380 = _376 + _332;
    float _382 = _380 + _334;
    float _384 = fma(_356, 0.5, _296);
    float _386 = _382 + _336;
    float _388 = _386 + _338;
    float _390 = _388 + _346;
    float _392 = _390 + _348;
    float _394 = _392 + _354;
    float _396 = fma(_358, -0.5, _282);
    float _398 = fma(_358, -1.5, _282);
    float _400 = _394 + _366;
    float3 _1525 = float3(_396, _360, float(int(_320)));
    float3 _1527 = select(_1525, float3(0.0), isnan(_1525));
    float _402 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1527.xy, uint(rint(_1527.z)), _352);
    float3 _1536 = float3(_398, _360, float(int(_320)));
    float3 _1538 = select(_1536, float3(0.0), isnan(_1536));
    float _404 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1538.xy, uint(rint(_1538.z)), _352);
    float _406 = _370 + _368;
    float3 _1550 = float3(_364, _384, float(int(_320)));
    float3 _1552 = select(_1550, float3(0.0), isnan(_1550));
    float _408 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1552.xy, uint(rint(_1552.z)), _352);
    float3 _1561 = float3(_362, _384, float(int(_320)));
    float3 _1563 = select(_1561, float3(0.0), isnan(_1561));
    float _410 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1563.xy, uint(rint(_1563.z)), _352);
    float3 _1572 = float3(_396, _384, float(int(_320)));
    float3 _1574 = select(_1572, float3(0.0), isnan(_1572));
    float _412 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1574.xy, uint(rint(_1574.z)), _352);
    float3 _1583 = float3(_398, _384, float(int(_320)));
    float3 _1585 = select(_1583, float3(0.0), isnan(_1583));
    float _414 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1585.xy, uint(rint(_1585.z)), _352);
    float3 _1594 = float3(_364, _378, float(int(_320)));
    float3 _1596 = select(_1594, float3(0.0), isnan(_1594));
    float _416 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1596.xy, uint(rint(_1596.z)), _352);
    float _418 = fma(_356, -1.5, _296);
    float3 _1608 = float3(_362, _378, float(int(_320)));
    float3 _1610 = select(_1608, float3(0.0), isnan(_1608));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1610.xy, uint(rint(_1610.z)), _352);
    float _422 = _406 + _402;
    float _424 = _422 + _404;
    float _426 = _424 + _408;
    float _428 = _426 + _410;
    float3 _1631 = float3(_396, _378, float(int(_320)));
    float3 _1633 = select(_1631, float3(0.0), isnan(_1631));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1633.xy, uint(rint(_1633.z)), _352);
    float _432 = _428 + _412;
    float3 _1645 = float3(_398, _378, float(int(_320)));
    float3 _1647 = select(_1645, float3(0.0), isnan(_1645));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1647.xy, uint(rint(_1647.z)), _352);
    float3 _1656 = float3(_364, _418, float(int(_320)));
    float3 _1658 = select(_1656, float3(0.0), isnan(_1656));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1658.xy, uint(rint(_1658.z)), _352);
    float3 _1667 = float3(_362, _418, float(int(_320)));
    float3 _1669 = select(_1667, float3(0.0), isnan(_1667));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1669.xy, uint(rint(_1669.z)), _352);
    float _440 = _432 + _414;
    float _442 = _440 + _416;
    float3 _1684 = float3(_396, _418, float(int(_320)));
    float3 _1686 = select(_1684, float3(0.0), isnan(_1684));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1686.xy, uint(rint(_1686.z)), _352);
    float _446 = -_68;
    float _448 = _446 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _450 = -_70;
    float _452 = _450 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _454 = _448 * _448;
    float _456 = fma(_452, _452, _454);
    float _458 = -_66;
    float _460 = _458 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _462 = fma(_460, _460, _456);
    float _464 = sqrt(_462);
    float _466 = _68 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _468 = _68 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _470 = _68 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _472 = _68 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _474 = _68 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _476 = _68 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _478 = _68 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _480 = _68 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _482 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].x, _474);
    float _484 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].x, _472);
    float _486 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].x, _470);
    float _488 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].x, _476);
    float _490 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].x, _478);
    float _492 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].x, _480);
    bool _494 = _464 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _496 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _482);
    bool _498 = _464 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _500 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _492);
    bool _502 = !_494;
    int _504 = _502 ? 0 : 1;
    float _506 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _484);
    float _508 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _488);
    float _510 = _496 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _512 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _486);
    float _514 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _490);
    float _516 = _442 + _420;
    float _518 = _512 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    int _520 = 2;
    float _522 = _510;
    float _524 = _518;
    if (!_494)
    {
        _520 = 1;
    }
    int _526 = _520;
    int _528 = _526;
    if (!_498)
    {
        _528 = _504;
    }
    int _530 = _528;
    float _532 = _68 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _534 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].x, _466);
    float _536 = float(_530);
    float _538 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].x, _468);
    float _540 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].x, _532);
    float _542 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _534);
    float _544 = precise::min(_536, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _546 = _506 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _548 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _540);
    float _550 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _538);
    bool _552 = _544 != 1.0;
    bool _554 = isnan(_544);
    bool _556 = _552 || _554;
    bool _558 = isnan(1.0);
    bool _560 = _556 || _558;
    float _562 = rint(_544);
    float _564 = precise::max(_562, 0.0);
    uint _566 = uint(_564);
    uint _568 = clamp(_566, 0u, 65535u);
    bool _570 = _544 != 0.0;
    bool _572 = isnan(_544);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.0);
    bool _578 = _574 || _576;
    float _580 = _546;
    if (_560)
    {
        float _582 = _500 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _522 = _582;
    }
    float _584 = _522;
    float _586 = _584;
    if (_560)
    {
        float _588 = _508 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _580 = _588;
    }
    float _590 = _580;
    float _592 = _590;
    if (!_578)
    {
        float _594 = _548 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _586 = _594;
    }
    float _596 = _586;
    if (!_578)
    {
        float _598 = _542 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _592 = _598;
    }
    float _600 = _592;
    if (_560)
    {
        float _602 = _514 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _524 = _602;
    }
    float _604 = _524;
    float _606 = _604;
    if (!_578)
    {
        float _608 = _550 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _606 = _608;
    }
    float _610 = _606;
    float _612 = 0.0 + _596;
    float _614 = precise::clamp(_612, 0.0, 1.0);
    float _616 = _342 * _614;
    float _618 = _344 * _614;
    float3 _2010 = float3(_398, _418, float(int(_320)));
    float3 _2012 = select(_2010, float3(0.0), isnan(_2010));
    float _620 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2012.xy, uint(rint(_2012.z)), _352);
    float _622 = fma(_616, 0.5, _600);
    float _624 = fma(_618, 1.5, _610);
    float _626 = fma(_618, 0.5, _610);
    float _628 = -_66;
    float _630 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _632 = _628 + _630;
    float3 _2038 = float3(_622, _624, float(int(_568)));
    float3 _2040 = select(_2038, float3(0.0), isnan(_2038));
    float _634 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2040.xy, uint(rint(_2040.z)), _614);
    float _636 = _632 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _638 = precise::clamp(_636, 0.0, 1.0);
    float _640 = _516 + _430;
    float _642 = _640 + _434;
    float _644 = fma(_616, 1.5, _600);
    float _646 = _642 + _436;
    float _648 = fma(_616, -0.5, _600);
    float3 _2070 = float3(_644, _624, float(int(_568)));
    float3 _2072 = select(_2070, float3(0.0), isnan(_2070));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2072.xy, uint(rint(_2072.z)), _614);
    float _652 = _646 + _438;
    float3 _2084 = float3(_648, _624, float(int(_568)));
    float3 _2086 = select(_2084, float3(0.0), isnan(_2084));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2086.xy, uint(rint(_2086.z)), _614);
    float _656 = fma(_616, -1.5, _600);
    float _658 = _652 + _444;
    float3 _2101 = float3(_656, _624, float(int(_568)));
    float3 _2103 = select(_2101, float3(0.0), isnan(_2101));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2103.xy, uint(rint(_2103.z)), _614);
    float3 _2112 = float3(_644, _626, float(int(_568)));
    float3 _2114 = select(_2112, float3(0.0), isnan(_2112));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2114.xy, uint(rint(_2114.z)), _614);
    float3 _2123 = float3(_622, _626, float(int(_568)));
    float3 _2125 = select(_2123, float3(0.0), isnan(_2123));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2125.xy, uint(rint(_2125.z)), _614);
    float _666 = fma(_400, 0.0625, _638);
    float _668 = fma(_618, -0.5, _610);
    float _670 = fma(_618, -1.5, _610);
    float _672 = _650 + _634;
    float _674 = _658 + _620;
    float _676 = _672 + _654;
    float3 _2153 = float3(_648, _626, float(int(_568)));
    float3 _2155 = select(_2153, float3(0.0), isnan(_2153));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2155.xy, uint(rint(_2155.z)), _614);
    float2 _2161 = float2(_52, _54);
    float2 _682 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2161, float2(0.0), isnan(_2161))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2161, float2(0.0), isnan(_2161))).xy;
    float _684 = _682.x;
    float _686 = _682.y;
    float _688 = _676 + _660;
    float _690 = _688 + _662;
    float3 _2182 = float3(_656, _626, float(int(_568)));
    float3 _2184 = select(_2182, float3(0.0), isnan(_2182));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2184.xy, uint(rint(_2184.z)), _614);
    float3 _2193 = float3(_644, _668, float(int(_568)));
    float3 _2195 = select(_2193, float3(0.0), isnan(_2193));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2195.xy, uint(rint(_2195.z)), _614);
    float3 _2204 = float3(_622, _668, float(int(_568)));
    float3 _2206 = select(_2204, float3(0.0), isnan(_2204));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2206.xy, uint(rint(_2206.z)), _614);
    float3 _2215 = float3(_648, _668, float(int(_568)));
    float3 _2217 = select(_2215, float3(0.0), isnan(_2215));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2217.xy, uint(rint(_2217.z)), _614);
    float3 _2226 = float3(_656, _668, float(int(_568)));
    float3 _2228 = select(_2226, float3(0.0), isnan(_2226));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2228.xy, uint(rint(_2228.z)), _614);
    float _702 = _690 + _664;
    float _704 = fma(_684, 2.0, -1.0);
    float _706 = fma(_686, 2.0, -1.0);
    float _708 = _704 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _710 = _706 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _712 = _702 + _678;
    float _714 = fma(_708, 2.0, _52);
    float _716 = fma(_710, 2.0, _54);
    float3 _2264 = float3(_644, _670, float(int(_568)));
    float3 _2266 = select(_2264, float3(0.0), isnan(_2264));
    float _718 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2266.xy, uint(rint(_2266.z)), _614);
    float3 _2275 = float3(_622, _670, float(int(_568)));
    float3 _2277 = select(_2275, float3(0.0), isnan(_2275));
    float _720 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2277.xy, uint(rint(_2277.z)), _614);
    float3 _2286 = float3(_648, _670, float(int(_568)));
    float3 _2288 = select(_2286, float3(0.0), isnan(_2286));
    float _722 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2288.xy, uint(rint(_2288.z)), _614);
    float3 _2297 = float3(_656, _670, float(int(_568)));
    float3 _2299 = select(_2297, float3(0.0), isnan(_2297));
    float _724 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2299.xy, uint(rint(_2299.z)), _614);
    float2 _2305 = float2(_714, _716);
    float _726 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2305, float2(0.0), isnan(_2305))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2305, float2(0.0), isnan(_2305))).x;
    float _728 = _712 + _692;
    float _730 = _674 * 0.0625;
    float _732 = _728 + _694;
    float _734 = _732 + _696;
    float _736 = _734 + _698;
    float _738 = _736 + _700;
    float _740 = -_66;
    float _742 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _744 = _740 + _742;
    float _746 = _744 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _748 = precise::clamp(_746, 0.0, 1.0);
    float _750 = _738 + _718;
    float _752 = _750 + _720;
    float _754 = _752 + _722;
    float _756 = _754 + _724;
    float _758 = _756 * 0.0625;
    float _760 = _758 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _762 = fma(_730, (*spvDescriptorSet0.fp_c3)._m0[49].z, _760);
    float _764 = _748 + _762;
    out.m_45.x = _726;
    out.m_45.y = _666;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _764;
    return out;
}

