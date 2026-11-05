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
    float2 _760 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_760, float2(0.0), isnan(_760))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_760, float2(0.0), isnan(_760))).x;
    float _56 = in.m_40.y;
    float _58 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _60 = in.m_40.x;
    float _62 = -_54;
    float _64 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _66 = 1.0 / _64;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = _66 * _68;
    float _72 = _70 * _56;
    float _74 = _70 * _60;
    float _76 = -_72;
    float _78 = _76 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _80 = -_74;
    float _82 = _80 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _84 = _72 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _86 = _72 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _88 = _78 * _78;
    float _90 = -_70;
    float _92 = _90 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _94 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].x, _84);
    float _96 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].x, _86);
    float _98 = fma(_82, _82, _88);
    float _100 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _94);
    float _102 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _96);
    float _104 = fma(_92, _92, _98);
    float _106 = _72 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _108 = _100 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _110 = _102 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _112 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].x, _106);
    float _114 = sqrt(_104);
    float _116 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _112);
    float _118 = _116 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _120 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _122 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].x, _120);
    float _124 = 1.0 / _118;
    float _126 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _122);
    bool _130 = _114 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _132 = _114 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _134 = _126 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _136 = !_130;
    int _139 = _136 ? 0 : 1;
    float _141 = _134 * _124;
    float _143 = _108 * _124;
    float _145 = _110 * _124;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    int _151 = 2;
    if (!_130)
    {
        _151 = 1;
    }
    int _153 = _151;
    float _155 = _147 * _58;
    float _157 = _147 * _149;
    int _159 = _153;
    if (!_132)
    {
        _159 = _139;
    }
    int _161 = _159;
    float _163 = fma(_155, 1.5, _141);
    float _165 = fma(_157, 1.5, _143);
    float _167 = fma(_155, 0.5, _141);
    float _169 = fma(_155, -0.5, _141);
    float3 _979 = float3(_163, _165, float(0));
    float3 _983 = select(_979, float3(0.0), isnan(_979));
    float _171 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _983.xy, uint(rint(_983.z)), _147);
    float3 _990 = float3(_167, _165, float(0));
    float3 _992 = select(_990, float3(0.0), isnan(_990));
    float _173 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _992.xy, uint(rint(_992.z)), _147);
    float _175 = fma(_157, 0.5, _143);
    float3 _1002 = float3(_169, _165, float(0));
    float3 _1004 = select(_1002, float3(0.0), isnan(_1002));
    float _177 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1004.xy, uint(rint(_1004.z)), _147);
    float3 _1011 = float3(_163, _175, float(0));
    float3 _1013 = select(_1011, float3(0.0), isnan(_1011));
    float _179 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1013.xy, uint(rint(_1013.z)), _147);
    float _181 = float(_161);
    float _183 = _72 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _185 = _72 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _187 = _72 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _189 = precise::min(_181, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _191 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[19].x, _183);
    float _193 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[22].x, _185);
    float _195 = fma(_155, -1.5, _141);
    bool _197 = _189 != 1.0;
    bool _199 = isnan(_189);
    bool _201 = _197 || _199;
    bool _203 = isnan(1.0);
    bool _205 = _201 || _203;
    float _207 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].z, _191);
    float _209 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].z, _193);
    float _211 = _72 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _213 = _189 != 0.0;
    bool _215 = isnan(_189);
    bool _217 = _213 || _215;
    bool _219 = isnan(0.0);
    bool _221 = _217 || _219;
    float _223 = _207 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _225 = _72 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _227 = _72 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _229 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[21].x, _187);
    float _231 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[24].x, _211);
    float _233 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[20].x, _225);
    float _235 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[16].x, _227);
    float _237 = _223;
    if (_205)
    {
        float _239 = _209 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _237 = _239;
    }
    float _241 = _237;
    float _243 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].z, _229);
    float3 _1141 = float3(_195, _165, float(0));
    float3 _1143 = select(_1141, float3(0.0), isnan(_1141));
    float _245 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1143.xy, uint(rint(_1143.z)), _147);
    float _247 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].z, _231);
    float _249 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].z, _233);
    float _251 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].z, _235);
    float _253 = _243 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _255 = _253;
    float _257 = _241;
    if (_205)
    {
        float _259 = _247 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _255 = _259;
    }
    float _261 = _255;
    float3 _1180 = float3(_167, _175, float(0));
    float3 _1182 = select(_1180, float3(0.0), isnan(_1180));
    float _263 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1182.xy, uint(rint(_1182.z)), _147);
    float _265 = _249 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _267 = _265;
    float _269 = _261;
    if (!_221)
    {
        float _271 = _251 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _257 = _271;
    }
    float _273 = _257;
    float _275 = fma(_157, -0.5, _143);
    float _277 = fma(_157, -1.5, _143);
    float _279 = _72 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _281 = _72 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _283 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[17].x, _279);
    float _285 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[23].x, _281);
    float _287 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].z, _283);
    float _289 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].z, _285);
    if (_205)
    {
        float _291 = _289 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _267 = _291;
    }
    float _293 = _267;
    float _295 = _171 + _173;
    float _297 = _295 + _177;
    float3 _1256 = float3(_169, _175, float(0));
    float3 _1258 = select(_1256, float3(0.0), isnan(_1256));
    float _299 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1258.xy, uint(rint(_1258.z)), _147);
    float3 _1265 = float3(_195, _175, float(0));
    float3 _1267 = select(_1265, float3(0.0), isnan(_1265));
    float _301 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1267.xy, uint(rint(_1267.z)), _147);
    float3 _1274 = float3(_163, _275, float(0));
    float3 _1276 = select(_1274, float3(0.0), isnan(_1274));
    float _303 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1276.xy, uint(rint(_1276.z)), _147);
    float _305 = _293;
    if (!_221)
    {
        float _307 = _287 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _305 = _307;
    }
    float _309 = _305;
    float _311 = _72 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _313 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _315 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[18].x, _311);
    float _317 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].z, _315);
    if (!_221)
    {
        float _319 = _317 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _269 = _319;
    }
    float _321 = _269;
    float _323 = _297 + _245;
    float3 _1327 = float3(_167, _275, float(0));
    float3 _1329 = select(_1327, float3(0.0), isnan(_1327));
    float _325 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1329.xy, uint(rint(_1329.z)), _147);
    float _327 = _323 + _179;
    float _329 = 0.0 + _321;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = _327 + _263;
    float _335 = _333 + _299;
    float _337 = _335 + _301;
    float _339 = rint(_189);
    float _341 = precise::max(_339, 0.0);
    uint _344 = uint(_341);
    uint _346 = clamp(_344, 0u, 65535u);
    float3 _1362 = float3(_169, _275, float(0));
    float3 _1364 = select(_1362, float3(0.0), isnan(_1362));
    float _348 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1364.xy, uint(rint(_1364.z)), _147);
    float3 _1371 = float3(_195, _275, float(0));
    float3 _1373 = select(_1371, float3(0.0), isnan(_1371));
    float _350 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1373.xy, uint(rint(_1373.z)), _147);
    float3 _1380 = float3(_163, _277, float(0));
    float3 _1382 = select(_1380, float3(0.0), isnan(_1380));
    float _352 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1382.xy, uint(rint(_1382.z)), _147);
    float3 _1389 = float3(_167, _277, float(0));
    float3 _1391 = select(_1389, float3(0.0), isnan(_1389));
    float _354 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1391.xy, uint(rint(_1391.z)), _147);
    float _356 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _358 = _331 * _313;
    float _360 = _331 * _356;
    float _362 = fma(_358, 1.5, _273);
    float _364 = fma(_358, 0.5, _273);
    float _366 = fma(_358, -0.5, _273);
    float _368 = fma(_358, -1.5, _273);
    float _370 = fma(_360, 1.5, _309);
    float3 _1424 = float3(_169, _277, float(0));
    float3 _1426 = select(_1424, float3(0.0), isnan(_1424));
    float _372 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1426.xy, uint(rint(_1426.z)), _147);
    float3 _1435 = float3(_364, _370, float(int(_346)));
    float3 _1437 = select(_1435, float3(0.0), isnan(_1435));
    float _374 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1437.xy, uint(rint(_1437.z)), _331);
    float3 _1446 = float3(_366, _370, float(int(_346)));
    float3 _1448 = select(_1446, float3(0.0), isnan(_1446));
    float _376 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1448.xy, uint(rint(_1448.z)), _331);
    float3 _1457 = float3(_368, _370, float(int(_346)));
    float3 _1459 = select(_1457, float3(0.0), isnan(_1457));
    float _378 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1459.xy, uint(rint(_1459.z)), _331);
    float3 _1468 = float3(_362, _370, float(int(_346)));
    float3 _1470 = select(_1468, float3(0.0), isnan(_1468));
    float _380 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1470.xy, uint(rint(_1470.z)), _331);
    float3 _1477 = float3(_195, _277, float(0));
    float3 _1479 = select(_1477, float3(0.0), isnan(_1477));
    float _382 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1479.xy, uint(rint(_1479.z)), _147);
    float _384 = _337 + _303;
    float _386 = _384 + _325;
    float _388 = fma(_360, 0.5, _309);
    float _390 = _386 + _348;
    float _392 = _390 + _350;
    float _394 = _392 + _352;
    float _396 = _394 + _354;
    float _398 = _396 + _372;
    float _400 = fma(_360, -0.5, _309);
    float _402 = _380 + _374;
    float _404 = _398 + _382;
    float _406 = _402 + _376;
    float3 _1524 = float3(_362, _388, float(int(_346)));
    float3 _1526 = select(_1524, float3(0.0), isnan(_1524));
    float _408 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1526.xy, uint(rint(_1526.z)), _331);
    float _410 = _406 + _378;
    float3 _1538 = float3(_364, _388, float(int(_346)));
    float3 _1540 = select(_1538, float3(0.0), isnan(_1538));
    float _412 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1540.xy, uint(rint(_1540.z)), _331);
    float3 _1549 = float3(_366, _388, float(int(_346)));
    float3 _1551 = select(_1549, float3(0.0), isnan(_1549));
    float _414 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1551.xy, uint(rint(_1551.z)), _331);
    float3 _1560 = float3(_368, _388, float(int(_346)));
    float3 _1562 = select(_1560, float3(0.0), isnan(_1560));
    float _416 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1562.xy, uint(rint(_1562.z)), _331);
    float3 _1571 = float3(_362, _400, float(int(_346)));
    float3 _1573 = select(_1571, float3(0.0), isnan(_1571));
    float _418 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1573.xy, uint(rint(_1573.z)), _331);
    float3 _1582 = float3(_364, _400, float(int(_346)));
    float3 _1584 = select(_1582, float3(0.0), isnan(_1582));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1584.xy, uint(rint(_1584.z)), _331);
    float _422 = -_72;
    float _424 = _422 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _426 = -_74;
    float _428 = _426 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _430 = _72 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _432 = _72 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _434 = _424 * _424;
    float _436 = _72 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _438 = _72 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _440 = fma(_428, _428, _434);
    float _442 = -_70;
    float _444 = _442 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _446 = _72 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _448 = _72 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _450 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[28].x, _438);
    float _452 = fma(_444, _444, _440);
    float _454 = _72 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _456 = _72 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _458 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[26].x, _446);
    float _460 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].z, _450);
    float _462 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[31].x, _454);
    float _464 = sqrt(_452);
    float _466 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[30].x, _432);
    float _468 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].z, _462);
    float _470 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[33].x, _448);
    float _472 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].z, _466);
    float _474 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].z, _470);
    bool _476 = _464 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _478 = _464 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _480 = !_476;
    int _482 = _480 ? 0 : 1;
    int _484 = 2;
    if (!_476)
    {
        _484 = 1;
    }
    int _486 = _484;
    int _488 = _486;
    if (!_478)
    {
        _488 = _482;
    }
    int _490 = _488;
    float _492 = _72 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _494 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[25].x, _492);
    float _496 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[27].x, _436);
    float _498 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[29].x, _430);
    float _500 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[32].x, _456);
    float _502 = fma(_360, -1.5, _309);
    float _504 = _460 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _506 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].z, _498);
    float _508 = float(_490);
    float _510 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].z, _500);
    float _512 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].z, _494);
    float _514 = precise::min(_508, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _516 = _514 != 1.0;
    bool _518 = isnan(_514);
    bool _520 = _516 || _518;
    bool _522 = isnan(1.0);
    bool _524 = _520 || _522;
    float _526 = _504;
    if (_524)
    {
        float _528 = _468 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _526 = _528;
    }
    float _530 = _526;
    float _532 = _410 + _408;
    float _534 = _506 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _536 = _534;
    float _538 = _530;
    if (_524)
    {
        float _540 = _510 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _536 = _540;
    }
    float _542 = _536;
    float _544 = _532 + _412;
    float _546 = _544 + _414;
    float _548 = _546 + _416;
    float _550 = _472 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _552 = _550;
    float _554 = _542;
    if (_524)
    {
        float _556 = _474 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _552 = _556;
    }
    float _558 = _552;
    float _560 = _548 + _418;
    float _562 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].z, _458);
    float _564 = _560 + _420;
    float _566 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].z, _496);
    float3 _1866 = float3(_366, _400, float(int(_346)));
    float3 _1868 = select(_1866, float3(0.0), isnan(_1866));
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1868.xy, uint(rint(_1868.z)), _331);
    float3 _1877 = float3(_368, _400, float(int(_346)));
    float3 _1879 = select(_1877, float3(0.0), isnan(_1877));
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1879.xy, uint(rint(_1879.z)), _331);
    float3 _1888 = float3(_362, _502, float(int(_346)));
    float3 _1890 = select(_1888, float3(0.0), isnan(_1888));
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1890.xy, uint(rint(_1890.z)), _331);
    float3 _1899 = float3(_364, _502, float(int(_346)));
    float3 _1901 = select(_1899, float3(0.0), isnan(_1899));
    float _574 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1901.xy, uint(rint(_1901.z)), _331);
    bool _576 = _514 != 0.0;
    bool _578 = isnan(_514);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float3 _1921 = float3(_366, _502, float(int(_346)));
    float3 _1923 = select(_1921, float3(0.0), isnan(_1921));
    float _586 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1923.xy, uint(rint(_1923.z)), _331);
    float3 _1932 = float3(_368, _502, float(int(_346)));
    float3 _1934 = select(_1932, float3(0.0), isnan(_1932));
    float _588 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1934.xy, uint(rint(_1934.z)), _331);
    float _590 = -_70;
    float _592 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _594 = _590 + _592;
    float _596 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _598 = _594 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _600 = precise::clamp(_598, 0.0, 1.0);
    float _602 = _558;
    if (!_584)
    {
        float _604 = _562 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _554 = _604;
    }
    float _606 = _554;
    if (!_584)
    {
        float _608 = _566 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _602 = _608;
    }
    float _610 = _602;
    if (!_584)
    {
        float _612 = _512 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _538 = _612;
    }
    float _614 = _538;
    float _616 = 0.0 + _610;
    float _618 = precise::clamp(_616, 0.0, 1.0);
    float _620 = _596 * _618;
    float _622 = _356 * _618;
    float _624 = fma(_620, 1.5, _614);
    float _626 = fma(_620, -1.5, _614);
    float _628 = _564 + _568;
    float _630 = fma(_620, -0.5, _614);
    float _632 = rint(_514);
    float _634 = precise::max(_632, 0.0);
    uint _636 = uint(_634);
    uint _638 = clamp(_636, 0u, 65535u);
    float _640 = _628 + _570;
    float _642 = fma(_620, 0.5, _614);
    float _644 = fma(_622, 1.5, _606);
    float _646 = _640 + _572;
    float _648 = _646 + _574;
    float _650 = fma(_622, 0.5, _606);
    float3 _2041 = float3(_642, _644, float(int(_638)));
    float3 _2043 = select(_2041, float3(0.0), isnan(_2041));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2043.xy, uint(rint(_2043.z)), _618);
    float3 _2052 = float3(_624, _644, float(int(_638)));
    float3 _2054 = select(_2052, float3(0.0), isnan(_2052));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2054.xy, uint(rint(_2054.z)), _618);
    float3 _2063 = float3(_630, _644, float(int(_638)));
    float3 _2065 = select(_2063, float3(0.0), isnan(_2063));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2065.xy, uint(rint(_2065.z)), _618);
    float3 _2074 = float3(_626, _644, float(int(_638)));
    float3 _2076 = select(_2074, float3(0.0), isnan(_2074));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2076.xy, uint(rint(_2076.z)), _618);
    float3 _2085 = float3(_624, _650, float(int(_638)));
    float3 _2087 = select(_2085, float3(0.0), isnan(_2085));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2087.xy, uint(rint(_2087.z)), _618);
    float3 _2096 = float3(_642, _650, float(int(_638)));
    float3 _2098 = select(_2096, float3(0.0), isnan(_2096));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2098.xy, uint(rint(_2098.z)), _618);
    float _664 = fma(_404, 0.0625, _600);
    float _666 = _648 + _586;
    float3 _2114 = float3(_630, _650, float(int(_638)));
    float3 _2116 = select(_2114, float3(0.0), isnan(_2114));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2116.xy, uint(rint(_2116.z)), _618);
    float3 _2125 = float3(_626, _650, float(int(_638)));
    float3 _2127 = select(_2125, float3(0.0), isnan(_2125));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2127.xy, uint(rint(_2127.z)), _618);
    float _672 = fma(_622, -0.5, _606);
    float3 _2139 = float3(_624, _672, float(int(_638)));
    float3 _2141 = select(_2139, float3(0.0), isnan(_2139));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2141.xy, uint(rint(_2141.z)), _618);
    float3 _2150 = float3(_642, _672, float(int(_638)));
    float3 _2152 = select(_2150, float3(0.0), isnan(_2150));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2152.xy, uint(rint(_2152.z)), _618);
    float3 _2161 = float3(_630, _672, float(int(_638)));
    float3 _2163 = select(_2161, float3(0.0), isnan(_2161));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2163.xy, uint(rint(_2163.z)), _618);
    float3 _2172 = float3(_626, _672, float(int(_638)));
    float3 _2174 = select(_2172, float3(0.0), isnan(_2172));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2174.xy, uint(rint(_2174.z)), _618);
    float _682 = fma(_622, -1.5, _606);
    float3 _2186 = float3(_624, _682, float(int(_638)));
    float3 _2188 = select(_2186, float3(0.0), isnan(_2186));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2188.xy, uint(rint(_2188.z)), _618);
    float _686 = in.m_38.x;
    float _688 = in.m_38.y;
    float3 _2201 = float3(_642, _682, float(int(_638)));
    float3 _2203 = select(_2201, float3(0.0), isnan(_2201));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2203.xy, uint(rint(_2203.z)), _618);
    float3 _2212 = float3(_630, _682, float(int(_638)));
    float3 _2214 = select(_2212, float3(0.0), isnan(_2212));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2214.xy, uint(rint(_2214.z)), _618);
    float3 _2223 = float3(_626, _682, float(int(_638)));
    float3 _2225 = select(_2223, float3(0.0), isnan(_2223));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2225.xy, uint(rint(_2225.z)), _618);
    float2 _2231 = float2(_686, _688);
    float _696 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2231, float2(0.0), isnan(_2231))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2231, float2(0.0), isnan(_2231))).x;
    float _698 = _666 + _588;
    float _700 = -_70;
    float _702 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _704 = _700 + _702;
    float _706 = _698 * 0.0625;
    float _708 = _704 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _710 = precise::clamp(_708, 0.0, 1.0);
    float _712 = _654 + _652;
    float _714 = _712 + _656;
    float _716 = _714 + _658;
    float _718 = _716 + _660;
    float _720 = _718 + _662;
    float _722 = _720 + _668;
    float _724 = _722 + _670;
    float _726 = _724 + _674;
    float _728 = _726 + _676;
    float _730 = _728 + _678;
    float _732 = _730 + _680;
    float _734 = _732 + _684;
    float _736 = _734 + _690;
    float _738 = _736 + _692;
    float _740 = _738 + _694;
    float _742 = _740 * 0.0625;
    float _744 = _742 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _746 = fma(_706, (*spvDescriptorSet0.fp_c3)._m0[49].z, _744);
    float _748 = _710 + _746;
    out.m_43.x = _696;
    out.m_43.y = _664;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _748;
    return out;
}

