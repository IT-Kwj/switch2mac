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
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _756 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_756, float2(0.0), isnan(_756))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_756, float2(0.0), isnan(_756))).x;
    float _56 = in.m_40.y;
    float _58 = in.m_40.x;
    float _60 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _62 = -_54;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].z, _64);
    float _68 = _66 * _56;
    float _70 = _66 * _58;
    float _72 = -_68;
    float _74 = _72 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _76 = -_70;
    float _78 = _76 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _80 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _82 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _84 = _74 * _74;
    float _86 = -_66;
    float _88 = _86 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _90 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _80);
    float _92 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _82);
    float _94 = fma(_78, _78, _84);
    float _96 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _90);
    float _98 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _92);
    float _100 = fma(_88, _88, _94);
    float _102 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _104 = _96 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _106 = _98 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _108 = _68 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _110 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _102);
    float _112 = sqrt(_100);
    float _114 = _68 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _116 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].x, _108);
    float _118 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _110);
    float _120 = _68 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _122 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].x, _114);
    float _124 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _116);
    float _126 = _118 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _128 = 1.0 / _104;
    float _130 = _68 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _132 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _122);
    float _134 = _124 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _136 = _68 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _138 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].x, _120);
    float _140 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].x, _130);
    float _142 = _132 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    bool _146 = _112 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _148 = _68 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _150 = _112 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _152 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].x, _136);
    bool _154 = !_146;
    int _157 = _154 ? 0 : 1;
    float _159 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _138);
    float _161 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _140);
    float _163 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].x, _148);
    float _165 = _126 * _128;
    float _167 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _169 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _152);
    float _171 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _163);
    float _173 = _68 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    int _175 = 2;
    float _177 = _134;
    float _179 = _142;
    if (!_146)
    {
        _175 = 1;
    }
    int _181 = _175;
    float _183 = _169 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    int _185 = _181;
    float _187 = _183;
    if (!_150)
    {
        _185 = _157;
    }
    int _189 = _185;
    float _191 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _193 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].x, _173);
    float _195 = float(_189);
    float _197 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _191);
    float _199 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _193);
    float _201 = precise::min(_195, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _203 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _197);
    bool _205 = _201 != 1.0;
    bool _207 = isnan(_201);
    bool _209 = _205 || _207;
    bool _211 = isnan(1.0);
    bool _213 = _209 || _211;
    float _215 = _203 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    bool _217 = _201 != 0.0;
    bool _219 = isnan(_201);
    bool _221 = _217 || _219;
    bool _223 = isnan(0.0);
    bool _225 = _221 || _223;
    float _227 = _215 * _128;
    float _229 = _106 * _128;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = fma(_60, 0.5, _165);
    float _235 = _68 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _237 = fma(_167, 1.5, _227);
    float _239 = fma(_167, 0.5, _227);
    float _241 = rint(_231);
    float _243 = precise::max(_241, 0.0);
    uint _246 = uint(_243);
    uint _248 = clamp(_246, 0u, 65535u);
    if (_213)
    {
        float _250 = _159 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _177 = _250;
    }
    float _252 = _177;
    float _254 = _252;
    if (_213)
    {
        float _256 = _161 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _179 = _256;
    }
    float _258 = _179;
    float _260 = fma(_60, -0.5, _165);
    float _262 = fma(_60, 1.5, _165);
    float _264 = fma(_60, -1.5, _165);
    float _266 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].x, _235);
    float _268 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _266);
    float3 _1166 = float3(_233, _237, float(int(_248)));
    float3 _1170 = select(_1166, float3(0.0), isnan(_1166));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1170.xy, uint(rint(_1170.z)), 1.0);
    float3 _1178 = float3(_260, _237, float(int(_248)));
    float3 _1180 = select(_1178, float3(0.0), isnan(_1178));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1180.xy, uint(rint(_1180.z)), 1.0);
    float3 _1188 = float3(_262, _237, float(int(_248)));
    float3 _1190 = select(_1188, float3(0.0), isnan(_1188));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1190.xy, uint(rint(_1190.z)), 1.0);
    float3 _1198 = float3(_264, _237, float(int(_248)));
    float3 _1200 = select(_1198, float3(0.0), isnan(_1198));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1200.xy, uint(rint(_1200.z)), 1.0);
    float3 _1208 = float3(_233, _239, float(int(_248)));
    float3 _1210 = select(_1208, float3(0.0), isnan(_1208));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1210.xy, uint(rint(_1210.z)), 1.0);
    float3 _1218 = float3(_262, _239, float(int(_248)));
    float3 _1220 = select(_1218, float3(0.0), isnan(_1218));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1220.xy, uint(rint(_1220.z)), 1.0);
    float3 _1228 = float3(_260, _239, float(int(_248)));
    float3 _1230 = select(_1228, float3(0.0), isnan(_1228));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1230.xy, uint(rint(_1230.z)), 1.0);
    float3 _1238 = float3(_264, _239, float(int(_248)));
    float3 _1240 = select(_1238, float3(0.0), isnan(_1238));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1240.xy, uint(rint(_1240.z)), 1.0);
    float _286 = _258;
    if (!_225)
    {
        float _288 = _171 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _286 = _288;
    }
    float _290 = _286;
    float _292 = fma(_167, -0.5, _227);
    float _294 = fma(_167, -1.5, _227);
    float _296 = _68 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    if (_213)
    {
        float _298 = _199 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _187 = _298;
    }
    float _300 = _187;
    float _302 = _300;
    if (!_225)
    {
        float _304 = _268 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _254 = _304;
    }
    float _306 = _254;
    float _308 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].x, _296);
    float _310 = rint(_201);
    float _312 = precise::max(_310, 0.0);
    uint _314 = uint(_312);
    uint _316 = clamp(_314, 0u, 65535u);
    float _318 = _274 + _270;
    float _320 = _318 + _272;
    float _322 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _308);
    float _324 = _320 + _276;
    if (!_225)
    {
        float _326 = _322 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _302 = _326;
    }
    float _328 = _302;
    float _330 = _324 + _280;
    float _332 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float3 _1335 = float3(_233, _292, float(int(_248)));
    float3 _1337 = select(_1335, float3(0.0), isnan(_1335));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1337.xy, uint(rint(_1337.z)), 1.0);
    float3 _1345 = float3(_260, _292, float(int(_248)));
    float3 _1347 = select(_1345, float3(0.0), isnan(_1345));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1347.xy, uint(rint(_1347.z)), 1.0);
    float3 _1355 = float3(_262, _292, float(int(_248)));
    float3 _1357 = select(_1355, float3(0.0), isnan(_1355));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1357.xy, uint(rint(_1357.z)), 1.0);
    float3 _1365 = float3(_264, _292, float(int(_248)));
    float3 _1367 = select(_1365, float3(0.0), isnan(_1365));
    float _340 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1367.xy, uint(rint(_1367.z)), 1.0);
    float3 _1375 = float3(_262, _294, float(int(_248)));
    float3 _1377 = select(_1375, float3(0.0), isnan(_1375));
    float _342 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1377.xy, uint(rint(_1377.z)), 1.0);
    float _344 = _330 + _278;
    float _346 = 0.0 + _328;
    float _348 = precise::clamp(_346, 0.0, 1.0);
    float3 _1392 = float3(_233, _294, float(int(_248)));
    float3 _1394 = select(_1392, float3(0.0), isnan(_1392));
    float _350 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1394.xy, uint(rint(_1394.z)), 1.0);
    float3 _1402 = float3(_260, _294, float(int(_248)));
    float3 _1404 = select(_1402, float3(0.0), isnan(_1402));
    float _352 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1404.xy, uint(rint(_1404.z)), 1.0);
    float _354 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _356 = _348 * _332;
    float _358 = _348 * _354;
    float _360 = fma(_356, 1.5, _306);
    float _362 = fma(_356, -1.5, _306);
    float _364 = fma(_356, -0.5, _306);
    float _366 = fma(_356, 0.5, _306);
    float _368 = fma(_358, 1.5, _290);
    float3 _1438 = float3(_366, _368, float(int(_316)));
    float3 _1440 = select(_1438, float3(0.0), isnan(_1438));
    float _370 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1440.xy, uint(rint(_1440.z)), _348);
    float3 _1449 = float3(_364, _368, float(int(_316)));
    float3 _1451 = select(_1449, float3(0.0), isnan(_1449));
    float _372 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1451.xy, uint(rint(_1451.z)), _348);
    float3 _1460 = float3(_362, _368, float(int(_316)));
    float3 _1462 = select(_1460, float3(0.0), isnan(_1460));
    float _374 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1462.xy, uint(rint(_1462.z)), _348);
    float3 _1471 = float3(_360, _368, float(int(_316)));
    float3 _1473 = select(_1471, float3(0.0), isnan(_1471));
    float _376 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1473.xy, uint(rint(_1473.z)), _348);
    float3 _1482 = float3(_264, _294, float(int(_248)));
    float3 _1484 = select(_1482, float3(0.0), isnan(_1482));
    float _378 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1484.xy, uint(rint(_1484.z)), 1.0);
    float _380 = _344 + _282;
    float _382 = _380 + _284;
    float _384 = fma(_358, 0.5, _290);
    float _386 = fma(_358, -0.5, _290);
    float _388 = _382 + _338;
    float _390 = _388 + _334;
    float _392 = _390 + _336;
    float _394 = _392 + _340;
    float _396 = _394 + _342;
    float3 _1519 = float3(_360, _384, float(int(_316)));
    float3 _1521 = select(_1519, float3(0.0), isnan(_1519));
    float _398 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1521.xy, uint(rint(_1521.z)), _348);
    float _400 = _396 + _350;
    float _402 = _400 + _352;
    float _404 = _376 + _370;
    float _406 = _402 + _378;
    float3 _1542 = float3(_366, _384, float(int(_316)));
    float3 _1544 = select(_1542, float3(0.0), isnan(_1542));
    float _408 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1544.xy, uint(rint(_1544.z)), _348);
    float _410 = _404 + _372;
    float _412 = _410 + _374;
    float3 _1559 = float3(_364, _384, float(int(_316)));
    float3 _1561 = select(_1559, float3(0.0), isnan(_1559));
    float _414 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1561.xy, uint(rint(_1561.z)), _348);
    float3 _1570 = float3(_362, _384, float(int(_316)));
    float3 _1572 = select(_1570, float3(0.0), isnan(_1570));
    float _416 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1572.xy, uint(rint(_1572.z)), _348);
    float3 _1581 = float3(_360, _386, float(int(_316)));
    float3 _1583 = select(_1581, float3(0.0), isnan(_1581));
    float _418 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1583.xy, uint(rint(_1583.z)), _348);
    float3 _1592 = float3(_366, _386, float(int(_316)));
    float3 _1594 = select(_1592, float3(0.0), isnan(_1592));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1594.xy, uint(rint(_1594.z)), _348);
    float _422 = -_68;
    float _424 = _422 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _426 = -_70;
    float _428 = _426 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _430 = _68 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _432 = _424 * _424;
    float _434 = _68 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _436 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].x, _430);
    float _438 = fma(_428, _428, _432);
    float _440 = -_66;
    float _442 = _440 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _444 = _68 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _446 = _68 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _448 = _68 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _450 = fma(_442, _442, _438);
    float _452 = _68 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _454 = _68 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _456 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].x, _444);
    float _458 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].x, _448);
    float _460 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].x, _446);
    float _462 = sqrt(_450);
    float _464 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _456);
    float _466 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].x, _452);
    float _468 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].x, _454);
    float _470 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _436);
    float _472 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _466);
    float _474 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _468);
    float _476 = _472 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    bool _478 = _462 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _480 = _462 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _482 = _68 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    bool _484 = !_478;
    int _486 = _484 ? 0 : 1;
    float _488 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].x, _482);
    float _490 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _488);
    int _492 = 2;
    float _494 = _476;
    if (!_478)
    {
        _492 = 1;
    }
    int _496 = _492;
    int _498 = _496;
    if (!_480)
    {
        _498 = _486;
    }
    int _500 = _498;
    float _502 = _68 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _504 = float(_500);
    float _506 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].x, _502);
    float _508 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].x, _434);
    float _510 = fma(_358, -1.5, _290);
    float _512 = precise::min(_504, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _514 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _506);
    float _516 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _508);
    bool _518 = _512 != 1.0;
    bool _520 = isnan(_512);
    bool _522 = _518 || _520;
    bool _524 = isnan(1.0);
    bool _526 = _522 || _524;
    float _528 = _516 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _530 = _464 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _532 = _528;
    float _534 = _530;
    if (_526)
    {
        float _536 = _474 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _532 = _536;
    }
    float _538 = _532;
    float _540 = _538;
    if (_526)
    {
        float _542 = _470 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _494 = _542;
    }
    float _544 = _494;
    float _546 = _544;
    if (_526)
    {
        float _548 = _490 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _534 = _548;
    }
    float _550 = _534;
    bool _552 = _512 != 0.0;
    bool _554 = isnan(_512);
    bool _556 = _552 || _554;
    bool _558 = isnan(0.0);
    bool _560 = _556 || _558;
    float _562 = _412 + _398;
    float _564 = _562 + _408;
    float _566 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _458);
    float _568 = _564 + _414;
    float _570 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _460);
    float _572 = _568 + _416;
    float _574 = _572 + _418;
    float _576 = _574 + _420;
    float3 _1887 = float3(_364, _386, float(int(_316)));
    float3 _1889 = select(_1887, float3(0.0), isnan(_1887));
    float _578 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1889.xy, uint(rint(_1889.z)), _348);
    float3 _1898 = float3(_362, _386, float(int(_316)));
    float3 _1900 = select(_1898, float3(0.0), isnan(_1898));
    float _580 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1900.xy, uint(rint(_1900.z)), _348);
    float3 _1909 = float3(_360, _510, float(int(_316)));
    float3 _1911 = select(_1909, float3(0.0), isnan(_1909));
    float _582 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1911.xy, uint(rint(_1911.z)), _348);
    float3 _1920 = float3(_366, _510, float(int(_316)));
    float3 _1922 = select(_1920, float3(0.0), isnan(_1920));
    float _584 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1922.xy, uint(rint(_1922.z)), _348);
    float3 _1931 = float3(_364, _510, float(int(_316)));
    float3 _1933 = select(_1931, float3(0.0), isnan(_1931));
    float _586 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1933.xy, uint(rint(_1933.z)), _348);
    float3 _1942 = float3(_362, _510, float(int(_316)));
    float3 _1944 = select(_1942, float3(0.0), isnan(_1942));
    float _588 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1944.xy, uint(rint(_1944.z)), _348);
    float _590 = rint(_512);
    float _592 = precise::max(_590, 0.0);
    uint _594 = uint(_592);
    uint _596 = clamp(_594, 0u, 65535u);
    float _598 = _550;
    if (!_560)
    {
        float _600 = _514 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _598 = _600;
    }
    float _602 = _598;
    if (!_560)
    {
        float _604 = _566 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _546 = _604;
    }
    float _606 = _546;
    if (!_560)
    {
        float _608 = _570 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _540 = _608;
    }
    float _610 = _540;
    float _612 = 0.0 + _602;
    float _614 = precise::clamp(_612, 0.0, 1.0);
    float _616 = _332 * _614;
    float _618 = _354 * _614;
    float _620 = fma(_616, 0.5, _606);
    float _622 = fma(_616, -0.5, _606);
    float _624 = fma(_618, 1.5, _610);
    float _626 = _576 + _578;
    float _628 = -_66;
    float _630 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _632 = _628 + _630;
    float _634 = _626 + _580;
    float _636 = fma(_618, 0.5, _610);
    float _638 = _632 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _640 = precise::clamp(_638, 0.0, 1.0);
    float _642 = _634 + _582;
    float _644 = fma(_616, 1.5, _606);
    float _646 = fma(_616, -1.5, _606);
    float3 _2043 = float3(_620, _624, float(int(_596)));
    float3 _2045 = select(_2043, float3(0.0), isnan(_2043));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2045.xy, uint(rint(_2045.z)), _614);
    float3 _2054 = float3(_644, _624, float(int(_596)));
    float3 _2056 = select(_2054, float3(0.0), isnan(_2054));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2056.xy, uint(rint(_2056.z)), _614);
    float3 _2065 = float3(_622, _624, float(int(_596)));
    float3 _2067 = select(_2065, float3(0.0), isnan(_2065));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2067.xy, uint(rint(_2067.z)), _614);
    float3 _2076 = float3(_646, _624, float(int(_596)));
    float3 _2078 = select(_2076, float3(0.0), isnan(_2076));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2078.xy, uint(rint(_2078.z)), _614);
    float3 _2087 = float3(_644, _636, float(int(_596)));
    float3 _2089 = select(_2087, float3(0.0), isnan(_2087));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2089.xy, uint(rint(_2089.z)), _614);
    float _658 = _642 + _584;
    float3 _2101 = float3(_620, _636, float(int(_596)));
    float3 _2103 = select(_2101, float3(0.0), isnan(_2101));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2103.xy, uint(rint(_2103.z)), _614);
    float _662 = fma(_406, 0.0625, _640);
    float _664 = _658 + _586;
    float3 _2119 = float3(_622, _636, float(int(_596)));
    float3 _2121 = select(_2119, float3(0.0), isnan(_2119));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2121.xy, uint(rint(_2121.z)), _614);
    float3 _2130 = float3(_646, _636, float(int(_596)));
    float3 _2132 = select(_2130, float3(0.0), isnan(_2130));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2132.xy, uint(rint(_2132.z)), _614);
    float _670 = fma(_618, -0.5, _610);
    float3 _2144 = float3(_644, _670, float(int(_596)));
    float3 _2146 = select(_2144, float3(0.0), isnan(_2144));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2146.xy, uint(rint(_2146.z)), _614);
    float3 _2155 = float3(_620, _670, float(int(_596)));
    float3 _2157 = select(_2155, float3(0.0), isnan(_2155));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2157.xy, uint(rint(_2157.z)), _614);
    float3 _2166 = float3(_622, _670, float(int(_596)));
    float3 _2168 = select(_2166, float3(0.0), isnan(_2166));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2168.xy, uint(rint(_2168.z)), _614);
    float3 _2177 = float3(_646, _670, float(int(_596)));
    float3 _2179 = select(_2177, float3(0.0), isnan(_2177));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2179.xy, uint(rint(_2179.z)), _614);
    float _680 = fma(_618, -1.5, _610);
    float3 _2191 = float3(_644, _680, float(int(_596)));
    float3 _2193 = select(_2191, float3(0.0), isnan(_2191));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2193.xy, uint(rint(_2193.z)), _614);
    float _684 = in.m_38.x;
    float3 _2204 = float3(_620, _680, float(int(_596)));
    float3 _2206 = select(_2204, float3(0.0), isnan(_2204));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2206.xy, uint(rint(_2206.z)), _614);
    float3 _2215 = float3(_622, _680, float(int(_596)));
    float3 _2217 = select(_2215, float3(0.0), isnan(_2215));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2217.xy, uint(rint(_2217.z)), _614);
    float3 _2226 = float3(_646, _680, float(int(_596)));
    float3 _2228 = select(_2226, float3(0.0), isnan(_2226));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2228.xy, uint(rint(_2228.z)), _614);
    float2 _2234 = float2(_684, _52);
    float _692 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2234, float2(0.0), isnan(_2234))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2234, float2(0.0), isnan(_2234))).x;
    float _694 = _664 + _588;
    float _696 = -_66;
    float _698 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _700 = _696 + _698;
    float _702 = _694 * 0.0625;
    float _704 = _700 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _706 = precise::clamp(_704, 0.0, 1.0);
    float _708 = _650 + _648;
    float _710 = _708 + _652;
    float _712 = _710 + _654;
    float _714 = _712 + _656;
    float _716 = _714 + _660;
    float _718 = _716 + _666;
    float _720 = _718 + _668;
    float _722 = _720 + _672;
    float _724 = _722 + _674;
    float _726 = _724 + _676;
    float _728 = _726 + _678;
    float _730 = _728 + _682;
    float _732 = _730 + _686;
    float _734 = _732 + _688;
    float _736 = _734 + _690;
    float _738 = _736 * 0.0625;
    float _740 = _738 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _742 = fma(_702, (*spvDescriptorSet0.fp_c3)._m0[49].z, _740);
    float _744 = _706 + _742;
    out.m_43.x = _692;
    out.m_43.y = _662;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _744;
    return out;
}

