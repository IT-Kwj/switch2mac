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
    float2 _779 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_779, float2(0.0), isnan(_779))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_779, float2(0.0), isnan(_779))).x;
    float _58 = in.m_42.y;
    float _60 = in.m_42.x;
    float _62 = -_56;
    float _64 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _66 = 1.0 / _64;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = _66 * _68;
    float _72 = _70 * _58;
    float _74 = _70 * _60;
    float _76 = -_72;
    float _78 = _76 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _80 = -_74;
    float _82 = _80 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _84 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _86 = _78 * _78;
    float _88 = -_70;
    float _90 = _88 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _92 = fma(_82, _82, _86);
    float _94 = _72 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _96 = fma(_90, _90, _92);
    float _98 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].x, _94);
    float _100 = _72 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _102 = _72 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _104 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _98);
    float _106 = sqrt(_96);
    float _108 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].x, _100);
    float _110 = _104 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _112 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].x, _84);
    float _114 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _108);
    float _116 = 1.0 / _110;
    float _118 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _112);
    float _120 = _114 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _122 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _124 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _126 = _118 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _130 = _106 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _132 = _106 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _134 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].x, _102);
    bool _136 = !_130;
    int _139 = _136 ? 0 : 1;
    float _141 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
    float _143 = _126 * _116;
    float _145 = _120 * _116;
    float _147 = _141 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _149 = fma(_122, 1.5, _143);
    int _151 = 2;
    if (!_130)
    {
        _151 = 1;
    }
    int _153 = _151;
    float _155 = fma(_124, 1.5, _145);
    float _157 = _147 * _116;
    float _159 = precise::clamp(_157, 0.0, 1.0);
    int _161 = _153;
    if (!_132)
    {
        _161 = _139;
    }
    int _163 = _161;
    float _165 = _72 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _167 = fma(_122, 0.5, _143);
    float _169 = fma(_122, -0.5, _143);
    float _171 = float(_163);
    float _173 = rint(_159);
    float _175 = precise::max(_173, 0.0);
    uint _178 = uint(_175);
    uint _180 = clamp(_178, 0u, 65535u);
    float _182 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[19].x, _165);
    float _184 = fma(_122, -1.5, _143);
    float _186 = _72 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _188 = fma(_124, 0.5, _145);
    float _190 = precise::min(_171, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _192 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].z, _182);
    float _194 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[22].x, _186);
    bool _196 = _190 != 1.0;
    bool _198 = isnan(_190);
    bool _200 = _196 || _198;
    bool _202 = isnan(1.0);
    bool _204 = _200 || _202;
    float _206 = _192 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _208 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].z, _194);
    float3 _1062 = float3(_149, _155, float(int(_180)));
    float3 _1066 = select(_1062, float3(0.0), isnan(_1062));
    float _210 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1066.xy, uint(rint(_1066.z)), 1.0);
    float3 _1074 = float3(_167, _155, float(int(_180)));
    float3 _1076 = select(_1074, float3(0.0), isnan(_1074));
    float _212 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1076.xy, uint(rint(_1076.z)), 1.0);
    float3 _1084 = float3(_169, _155, float(int(_180)));
    float3 _1086 = select(_1084, float3(0.0), isnan(_1084));
    float _214 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1086.xy, uint(rint(_1086.z)), 1.0);
    float3 _1094 = float3(_184, _155, float(int(_180)));
    float3 _1096 = select(_1094, float3(0.0), isnan(_1094));
    float _216 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1096.xy, uint(rint(_1096.z)), 1.0);
    float3 _1104 = float3(_149, _188, float(int(_180)));
    float3 _1106 = select(_1104, float3(0.0), isnan(_1104));
    float _218 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1106.xy, uint(rint(_1106.z)), 1.0);
    float3 _1114 = float3(_167, _188, float(int(_180)));
    float3 _1116 = select(_1114, float3(0.0), isnan(_1114));
    float _220 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1116.xy, uint(rint(_1116.z)), 1.0);
    float _222 = _72 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _224 = _72 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _226 = _206;
    if (_204)
    {
        float _228 = _208 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _226 = _228;
    }
    float _230 = _226;
    bool _232 = _190 != 0.0;
    bool _234 = isnan(_190);
    bool _236 = _232 || _234;
    bool _238 = isnan(0.0);
    bool _240 = _236 || _238;
    float _242 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[20].x, _222);
    float _244 = _72 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _246 = _72 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _248 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[23].x, _224);
    float _250 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].z, _242);
    float _252 = _72 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _254 = _72 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _256 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[17].x, _244);
    float _258 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].z, _248);
    float _260 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[16].x, _246);
    float _262 = _250 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _264 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[21].x, _252);
    float _266 = _262;
    float _268 = _230;
    if (_204)
    {
        float _270 = _258 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _266 = _270;
    }
    float _272 = _266;
    float _274 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].z, _260);
    float _276 = _72 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _278 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[24].x, _254);
    float _280 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].z, _264);
    float _282 = _272;
    if (!_240)
    {
        float _284 = _274 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _268 = _284;
    }
    float _286 = _268;
    float _288 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].z, _256);
    float _290 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[18].x, _276);
    float _292 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].z, _278);
    float _294 = _280 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _296 = _294;
    if (!_240)
    {
        float _298 = _288 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _282 = _298;
    }
    float _300 = _282;
    float _302 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].z, _290);
    if (_204)
    {
        float _304 = _292 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _296 = _304;
    }
    float _306 = _296;
    float _308 = fma(_124, -0.5, _145);
    float _310 = _306;
    if (!_240)
    {
        float _312 = _302 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _310 = _312;
    }
    float _314 = _310;
    float _316 = fma(_124, -1.5, _145);
    float _318 = rint(_190);
    float _320 = precise::max(_318, 0.0);
    uint _322 = uint(_320);
    uint _324 = clamp(_322, 0u, 65535u);
    float _326 = _210 + _212;
    float _328 = _326 + _214;
    float _330 = _328 + _216;
    float3 _1334 = float3(_169, _188, float(int(_180)));
    float3 _1336 = select(_1334, float3(0.0), isnan(_1334));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1336.xy, uint(rint(_1336.z)), 1.0);
    float3 _1344 = float3(_184, _188, float(int(_180)));
    float3 _1346 = select(_1344, float3(0.0), isnan(_1344));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1346.xy, uint(rint(_1346.z)), 1.0);
    float3 _1354 = float3(_149, _308, float(int(_180)));
    float3 _1356 = select(_1354, float3(0.0), isnan(_1354));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1356.xy, uint(rint(_1356.z)), 1.0);
    float3 _1364 = float3(_167, _308, float(int(_180)));
    float3 _1366 = select(_1364, float3(0.0), isnan(_1364));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1366.xy, uint(rint(_1366.z)), 1.0);
    float3 _1374 = float3(_169, _308, float(int(_180)));
    float3 _1376 = select(_1374, float3(0.0), isnan(_1374));
    float _340 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1376.xy, uint(rint(_1376.z)), 1.0);
    float3 _1384 = float3(_184, _308, float(int(_180)));
    float3 _1386 = select(_1384, float3(0.0), isnan(_1384));
    float _342 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1386.xy, uint(rint(_1386.z)), 1.0);
    float _344 = _330 + _218;
    float _346 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _348 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float3 _1407 = float3(_149, _316, float(int(_180)));
    float3 _1409 = select(_1407, float3(0.0), isnan(_1407));
    float _350 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1409.xy, uint(rint(_1409.z)), 1.0);
    float3 _1417 = float3(_167, _316, float(int(_180)));
    float3 _1419 = select(_1417, float3(0.0), isnan(_1417));
    float _352 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1419.xy, uint(rint(_1419.z)), 1.0);
    float _354 = 0.0 + _314;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float3 _1431 = float3(_169, _316, float(int(_180)));
    float3 _1433 = select(_1431, float3(0.0), isnan(_1431));
    float _358 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1433.xy, uint(rint(_1433.z)), 1.0);
    float _360 = _356 * _348;
    float _362 = _356 * _346;
    float _364 = fma(_360, 1.5, _300);
    float _366 = fma(_362, 0.5, _286);
    float _368 = fma(_362, 1.5, _286);
    float3 _1456 = float3(_184, _316, float(int(_180)));
    float3 _1458 = select(_1456, float3(0.0), isnan(_1456));
    float _370 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1458.xy, uint(rint(_1458.z)), 1.0);
    float3 _1466 = float3(_366, _364, float(int(_324)));
    float3 _1468 = select(_1466, float3(0.0), isnan(_1466));
    float _372 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1468.xy, uint(rint(_1468.z)), _356);
    float3 _1477 = float3(_368, _364, float(int(_324)));
    float3 _1479 = select(_1477, float3(0.0), isnan(_1477));
    float _374 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1479.xy, uint(rint(_1479.z)), _356);
    float _376 = _344 + _220;
    float _378 = _376 + _332;
    float _380 = _378 + _334;
    float _382 = fma(_360, -0.5, _300);
    float _384 = _380 + _336;
    float _386 = _384 + _338;
    float _388 = fma(_360, 0.5, _300);
    float _390 = _386 + _340;
    float _392 = _390 + _342;
    float _394 = _392 + _350;
    float _396 = _394 + _352;
    float _398 = _396 + _358;
    float _400 = fma(_362, -0.5, _286);
    float _402 = fma(_362, -1.5, _286);
    float _404 = _398 + _370;
    float3 _1533 = float3(_400, _364, float(int(_324)));
    float3 _1535 = select(_1533, float3(0.0), isnan(_1533));
    float _406 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1535.xy, uint(rint(_1535.z)), _356);
    float3 _1544 = float3(_402, _364, float(int(_324)));
    float3 _1546 = select(_1544, float3(0.0), isnan(_1544));
    float _408 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1546.xy, uint(rint(_1546.z)), _356);
    float _410 = _374 + _372;
    float3 _1558 = float3(_368, _388, float(int(_324)));
    float3 _1560 = select(_1558, float3(0.0), isnan(_1558));
    float _412 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1560.xy, uint(rint(_1560.z)), _356);
    float3 _1569 = float3(_366, _388, float(int(_324)));
    float3 _1571 = select(_1569, float3(0.0), isnan(_1569));
    float _414 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1571.xy, uint(rint(_1571.z)), _356);
    float3 _1580 = float3(_400, _388, float(int(_324)));
    float3 _1582 = select(_1580, float3(0.0), isnan(_1580));
    float _416 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1582.xy, uint(rint(_1582.z)), _356);
    float3 _1591 = float3(_402, _388, float(int(_324)));
    float3 _1593 = select(_1591, float3(0.0), isnan(_1591));
    float _418 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1593.xy, uint(rint(_1593.z)), _356);
    float3 _1602 = float3(_368, _382, float(int(_324)));
    float3 _1604 = select(_1602, float3(0.0), isnan(_1602));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1604.xy, uint(rint(_1604.z)), _356);
    float _422 = fma(_360, -1.5, _300);
    float3 _1616 = float3(_366, _382, float(int(_324)));
    float3 _1618 = select(_1616, float3(0.0), isnan(_1616));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1618.xy, uint(rint(_1618.z)), _356);
    float _426 = _410 + _406;
    float _428 = _426 + _408;
    float _430 = _428 + _412;
    float _432 = _430 + _414;
    float3 _1639 = float3(_400, _382, float(int(_324)));
    float3 _1641 = select(_1639, float3(0.0), isnan(_1639));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1641.xy, uint(rint(_1641.z)), _356);
    float _436 = _432 + _416;
    float3 _1653 = float3(_402, _382, float(int(_324)));
    float3 _1655 = select(_1653, float3(0.0), isnan(_1653));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1655.xy, uint(rint(_1655.z)), _356);
    float3 _1664 = float3(_368, _422, float(int(_324)));
    float3 _1666 = select(_1664, float3(0.0), isnan(_1664));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1666.xy, uint(rint(_1666.z)), _356);
    float3 _1675 = float3(_366, _422, float(int(_324)));
    float3 _1677 = select(_1675, float3(0.0), isnan(_1675));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1677.xy, uint(rint(_1677.z)), _356);
    float _444 = _436 + _418;
    float _446 = _444 + _420;
    float3 _1692 = float3(_400, _422, float(int(_324)));
    float3 _1694 = select(_1692, float3(0.0), isnan(_1692));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1694.xy, uint(rint(_1694.z)), _356);
    float _450 = -_72;
    float _452 = _450 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _454 = -_74;
    float _456 = _454 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _458 = _452 * _452;
    float _460 = fma(_456, _456, _458);
    float _462 = -_70;
    float _464 = _462 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _466 = fma(_464, _464, _460);
    float _468 = sqrt(_466);
    float _470 = _72 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _472 = _72 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _474 = _72 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _476 = _72 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _478 = _72 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _480 = _72 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _482 = _72 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _484 = _72 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _486 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[30].x, _478);
    float _488 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[28].x, _476);
    float _490 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[29].x, _474);
    float _492 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[31].x, _480);
    float _494 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[32].x, _482);
    float _496 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[33].x, _484);
    bool _498 = _468 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _500 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].z, _486);
    bool _502 = _468 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _504 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].z, _496);
    bool _506 = !_498;
    int _508 = _506 ? 0 : 1;
    float _510 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].z, _488);
    float _512 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].z, _492);
    float _514 = _500 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _516 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].z, _490);
    float _518 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].z, _494);
    float _520 = _446 + _424;
    float _522 = _516 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    int _524 = 2;
    float _526 = _514;
    float _528 = _522;
    if (!_498)
    {
        _524 = 1;
    }
    int _530 = _524;
    int _532 = _530;
    if (!_502)
    {
        _532 = _508;
    }
    int _534 = _532;
    float _536 = _72 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _538 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[25].x, _470);
    float _540 = float(_534);
    float _542 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[26].x, _472);
    float _544 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[27].x, _536);
    float _546 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].z, _538);
    float _548 = precise::min(_540, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _550 = _510 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _552 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].z, _544);
    float _554 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].z, _542);
    bool _556 = _548 != 1.0;
    bool _558 = isnan(_548);
    bool _560 = _556 || _558;
    bool _562 = isnan(1.0);
    bool _564 = _560 || _562;
    float _566 = rint(_548);
    float _568 = precise::max(_566, 0.0);
    uint _570 = uint(_568);
    uint _572 = clamp(_570, 0u, 65535u);
    bool _574 = _548 != 0.0;
    bool _576 = isnan(_548);
    bool _578 = _574 || _576;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    float _584 = _550;
    if (_564)
    {
        float _586 = _504 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _526 = _586;
    }
    float _588 = _526;
    float _590 = _588;
    if (_564)
    {
        float _592 = _512 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _584 = _592;
    }
    float _594 = _584;
    float _596 = _594;
    if (!_582)
    {
        float _598 = _552 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _590 = _598;
    }
    float _600 = _590;
    if (!_582)
    {
        float _602 = _546 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _596 = _602;
    }
    float _604 = _596;
    if (_564)
    {
        float _606 = _518 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _528 = _606;
    }
    float _608 = _528;
    float _610 = _608;
    if (!_582)
    {
        float _612 = _554 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _610 = _612;
    }
    float _614 = _610;
    float _616 = 0.0 + _600;
    float _618 = precise::clamp(_616, 0.0, 1.0);
    float _620 = _346 * _618;
    float _622 = _348 * _618;
    float3 _2018 = float3(_402, _422, float(int(_324)));
    float3 _2020 = select(_2018, float3(0.0), isnan(_2018));
    float _624 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2020.xy, uint(rint(_2020.z)), _356);
    float _626 = fma(_620, 0.5, _604);
    float _628 = fma(_622, 1.5, _614);
    float _630 = fma(_622, 0.5, _614);
    float _632 = -_70;
    float _634 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _636 = _632 + _634;
    float3 _2046 = float3(_626, _628, float(int(_572)));
    float3 _2048 = select(_2046, float3(0.0), isnan(_2046));
    float _638 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2048.xy, uint(rint(_2048.z)), _618);
    float _640 = _636 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _642 = precise::clamp(_640, 0.0, 1.0);
    float _644 = _520 + _434;
    float _646 = _644 + _438;
    float _648 = fma(_620, 1.5, _604);
    float _650 = _646 + _440;
    float _652 = fma(_620, -0.5, _604);
    float3 _2078 = float3(_648, _628, float(int(_572)));
    float3 _2080 = select(_2078, float3(0.0), isnan(_2078));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2080.xy, uint(rint(_2080.z)), _618);
    float _656 = _650 + _442;
    float3 _2092 = float3(_652, _628, float(int(_572)));
    float3 _2094 = select(_2092, float3(0.0), isnan(_2092));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2094.xy, uint(rint(_2094.z)), _618);
    float _660 = fma(_620, -1.5, _604);
    float _662 = _656 + _448;
    float3 _2109 = float3(_660, _628, float(int(_572)));
    float3 _2111 = select(_2109, float3(0.0), isnan(_2109));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2111.xy, uint(rint(_2111.z)), _618);
    float3 _2120 = float3(_648, _630, float(int(_572)));
    float3 _2122 = select(_2120, float3(0.0), isnan(_2120));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2122.xy, uint(rint(_2122.z)), _618);
    float3 _2131 = float3(_626, _630, float(int(_572)));
    float3 _2133 = select(_2131, float3(0.0), isnan(_2131));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2133.xy, uint(rint(_2133.z)), _618);
    float _670 = fma(_404, 0.0625, _642);
    float _672 = fma(_622, -0.5, _614);
    float _674 = fma(_622, -1.5, _614);
    float _676 = _654 + _638;
    float _678 = _662 + _624;
    float _680 = _676 + _658;
    float3 _2161 = float3(_652, _630, float(int(_572)));
    float3 _2163 = select(_2161, float3(0.0), isnan(_2161));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2163.xy, uint(rint(_2163.z)), _618);
    float2 _2169 = float2(_52, _54);
    float2 _686 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2169, float2(0.0), isnan(_2169))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2169, float2(0.0), isnan(_2169))).xy;
    float _688 = _686.x;
    float _690 = _686.y;
    float _692 = _680 + _664;
    float _694 = _692 + _666;
    float3 _2190 = float3(_660, _630, float(int(_572)));
    float3 _2192 = select(_2190, float3(0.0), isnan(_2190));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2192.xy, uint(rint(_2192.z)), _618);
    float3 _2201 = float3(_648, _672, float(int(_572)));
    float3 _2203 = select(_2201, float3(0.0), isnan(_2201));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2203.xy, uint(rint(_2203.z)), _618);
    float3 _2212 = float3(_626, _672, float(int(_572)));
    float3 _2214 = select(_2212, float3(0.0), isnan(_2212));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2214.xy, uint(rint(_2214.z)), _618);
    float3 _2223 = float3(_652, _672, float(int(_572)));
    float3 _2225 = select(_2223, float3(0.0), isnan(_2223));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2225.xy, uint(rint(_2225.z)), _618);
    float3 _2234 = float3(_660, _672, float(int(_572)));
    float3 _2236 = select(_2234, float3(0.0), isnan(_2234));
    float _704 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2236.xy, uint(rint(_2236.z)), _618);
    float _706 = _694 + _668;
    float _708 = fma(_688, 2.0, -1.0);
    float _710 = fma(_690, 2.0, -1.0);
    float _712 = _708 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _714 = _710 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _716 = _706 + _682;
    float _718 = fma(_712, 2.0, _52);
    float _720 = fma(_714, 2.0, _54);
    float3 _2272 = float3(_648, _674, float(int(_572)));
    float3 _2274 = select(_2272, float3(0.0), isnan(_2272));
    float _722 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2274.xy, uint(rint(_2274.z)), _618);
    float3 _2283 = float3(_626, _674, float(int(_572)));
    float3 _2285 = select(_2283, float3(0.0), isnan(_2283));
    float _724 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2285.xy, uint(rint(_2285.z)), _618);
    float3 _2294 = float3(_652, _674, float(int(_572)));
    float3 _2296 = select(_2294, float3(0.0), isnan(_2294));
    float _726 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2296.xy, uint(rint(_2296.z)), _618);
    float3 _2305 = float3(_660, _674, float(int(_572)));
    float3 _2307 = select(_2305, float3(0.0), isnan(_2305));
    float _728 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2307.xy, uint(rint(_2307.z)), _618);
    float2 _2313 = float2(_718, _720);
    float _730 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2313, float2(0.0), isnan(_2313))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2313, float2(0.0), isnan(_2313))).x;
    float _732 = _716 + _696;
    float _734 = _678 * 0.0625;
    float _736 = _732 + _698;
    float _738 = _736 + _700;
    float _740 = _738 + _702;
    float _742 = _740 + _704;
    float _744 = -_70;
    float _746 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _748 = _744 + _746;
    float _750 = _748 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _752 = precise::clamp(_750, 0.0, 1.0);
    float _754 = _742 + _722;
    float _756 = _754 + _724;
    float _758 = _756 + _726;
    float _760 = _758 + _728;
    float _762 = _760 * 0.0625;
    float _764 = _762 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _766 = fma(_734, (*spvDescriptorSet0.fp_c3)._m0[49].z, _764);
    float _768 = _752 + _766;
    out.m_45.x = _730;
    out.m_45.y = _670;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _768;
    return out;
}

