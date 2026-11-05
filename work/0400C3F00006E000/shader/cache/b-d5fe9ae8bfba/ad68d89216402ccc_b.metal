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
    float _58 = in.m_40.x;
    float _60 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _62 = -_54;
    float _64 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _66 = 1.0 / _64;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = _66 * _68;
    float _72 = _70 * _56;
    float _74 = _70 * _58;
    float _76 = -_72;
    float _78 = _76 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _80 = -_74;
    float _82 = _80 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _84 = _72 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _86 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _88 = _78 * _78;
    float _90 = -_70;
    float _92 = _90 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _94 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].x, _84);
    float _96 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].x, _86);
    float _98 = fma(_82, _82, _88);
    float _100 = _72 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _102 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _94);
    float _104 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _96);
    float _106 = fma(_92, _92, _98);
    float _108 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].x, _100);
    float _110 = _102 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _112 = _104 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _114 = _72 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _116 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _108);
    float _118 = sqrt(_106);
    float _120 = _72 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _122 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[19].x, _114);
    float _124 = _116 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _126 = _72 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _128 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[20].x, _120);
    float _130 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].z, _122);
    float _132 = _72 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _134 = 1.0 / _110;
    float _136 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].z, _128);
    float _138 = _130 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _140 = _72 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _142 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[22].x, _126);
    float _144 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[23].x, _132);
    float _146 = _136 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _148 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[21].x, _140);
    bool _152 = _118 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _154 = _72 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _156 = _118 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _158 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].z, _142);
    bool _160 = !_152;
    int _163 = _160 ? 0 : 1;
    float _165 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].z, _144);
    float _167 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[17].x, _154);
    float _169 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].z, _148);
    float _171 = _112 * _134;
    float _173 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _175 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].z, _167);
    float _177 = _169 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _179 = _72 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    int _181 = 2;
    float _183 = _138;
    float _185 = _146;
    float _187 = _177;
    if (!_152)
    {
        _181 = 1;
    }
    int _189 = _181;
    int _191 = _189;
    if (!_156)
    {
        _191 = _163;
    }
    int _193 = _191;
    float _195 = _72 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _197 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[24].x, _179);
    float _199 = float(_193);
    float _201 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].x, _195);
    float _203 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].z, _197);
    float _205 = precise::min(_199, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _207 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _201);
    bool _209 = _205 != 1.0;
    bool _211 = isnan(_205);
    bool _213 = _209 || _211;
    bool _215 = isnan(1.0);
    bool _217 = _213 || _215;
    float _219 = _207 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    bool _221 = _205 != 0.0;
    bool _223 = isnan(_205);
    bool _225 = _221 || _223;
    bool _227 = isnan(0.0);
    bool _229 = _225 || _227;
    float _231 = _219 * _134;
    float _233 = _124 * _134;
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = fma(_60, 0.5, _171);
    float _239 = _72 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _241 = fma(_173, 1.5, _231);
    float _243 = fma(_173, 0.5, _231);
    float _245 = rint(_235);
    float _247 = precise::max(_245, 0.0);
    uint _250 = uint(_247);
    uint _252 = clamp(_250, 0u, 65535u);
    if (_217)
    {
        float _254 = _158 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _183 = _254;
    }
    float _256 = _183;
    float _258 = _256;
    if (_217)
    {
        float _260 = _165 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _185 = _260;
    }
    float _262 = _185;
    float _264 = fma(_60, -0.5, _171);
    float _266 = fma(_60, 1.5, _171);
    float _268 = fma(_60, -1.5, _171);
    float _270 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[16].x, _239);
    float _272 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].z, _270);
    float3 _1174 = float3(_237, _241, float(int(_252)));
    float3 _1178 = select(_1174, float3(0.0), isnan(_1174));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1178.xy, uint(rint(_1178.z)), 1.0);
    float3 _1186 = float3(_264, _241, float(int(_252)));
    float3 _1188 = select(_1186, float3(0.0), isnan(_1186));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1188.xy, uint(rint(_1188.z)), 1.0);
    float3 _1196 = float3(_266, _241, float(int(_252)));
    float3 _1198 = select(_1196, float3(0.0), isnan(_1196));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1198.xy, uint(rint(_1198.z)), 1.0);
    float3 _1206 = float3(_268, _241, float(int(_252)));
    float3 _1208 = select(_1206, float3(0.0), isnan(_1206));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1208.xy, uint(rint(_1208.z)), 1.0);
    float3 _1216 = float3(_237, _243, float(int(_252)));
    float3 _1218 = select(_1216, float3(0.0), isnan(_1216));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1218.xy, uint(rint(_1218.z)), 1.0);
    float3 _1226 = float3(_266, _243, float(int(_252)));
    float3 _1228 = select(_1226, float3(0.0), isnan(_1226));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1228.xy, uint(rint(_1228.z)), 1.0);
    float3 _1236 = float3(_264, _243, float(int(_252)));
    float3 _1238 = select(_1236, float3(0.0), isnan(_1236));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1238.xy, uint(rint(_1238.z)), 1.0);
    float3 _1246 = float3(_268, _243, float(int(_252)));
    float3 _1248 = select(_1246, float3(0.0), isnan(_1246));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1248.xy, uint(rint(_1248.z)), 1.0);
    float _290 = _262;
    if (!_229)
    {
        float _292 = _175 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _290 = _292;
    }
    float _294 = _290;
    float _296 = fma(_173, -0.5, _231);
    float _298 = fma(_173, -1.5, _231);
    float _300 = _72 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    if (_217)
    {
        float _302 = _203 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _187 = _302;
    }
    float _304 = _187;
    float _306 = _304;
    if (!_229)
    {
        float _308 = _272 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _258 = _308;
    }
    float _310 = _258;
    float _312 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[18].x, _300);
    float _314 = rint(_205);
    float _316 = precise::max(_314, 0.0);
    uint _318 = uint(_316);
    uint _320 = clamp(_318, 0u, 65535u);
    float _322 = _278 + _274;
    float _324 = _322 + _276;
    float _326 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].z, _312);
    float _328 = _324 + _280;
    if (!_229)
    {
        float _330 = _326 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _306 = _330;
    }
    float _332 = _306;
    float _334 = _328 + _284;
    float _336 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float3 _1343 = float3(_237, _296, float(int(_252)));
    float3 _1345 = select(_1343, float3(0.0), isnan(_1343));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1345.xy, uint(rint(_1345.z)), 1.0);
    float3 _1353 = float3(_264, _296, float(int(_252)));
    float3 _1355 = select(_1353, float3(0.0), isnan(_1353));
    float _340 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1355.xy, uint(rint(_1355.z)), 1.0);
    float3 _1363 = float3(_266, _296, float(int(_252)));
    float3 _1365 = select(_1363, float3(0.0), isnan(_1363));
    float _342 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1365.xy, uint(rint(_1365.z)), 1.0);
    float3 _1373 = float3(_268, _296, float(int(_252)));
    float3 _1375 = select(_1373, float3(0.0), isnan(_1373));
    float _344 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1375.xy, uint(rint(_1375.z)), 1.0);
    float3 _1383 = float3(_266, _298, float(int(_252)));
    float3 _1385 = select(_1383, float3(0.0), isnan(_1383));
    float _346 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1385.xy, uint(rint(_1385.z)), 1.0);
    float _348 = _334 + _282;
    float _350 = 0.0 + _332;
    float _352 = precise::clamp(_350, 0.0, 1.0);
    float3 _1400 = float3(_237, _298, float(int(_252)));
    float3 _1402 = select(_1400, float3(0.0), isnan(_1400));
    float _354 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1402.xy, uint(rint(_1402.z)), 1.0);
    float3 _1410 = float3(_264, _298, float(int(_252)));
    float3 _1412 = select(_1410, float3(0.0), isnan(_1410));
    float _356 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1412.xy, uint(rint(_1412.z)), 1.0);
    float _358 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _360 = _352 * _336;
    float _362 = _352 * _358;
    float _364 = fma(_360, 1.5, _310);
    float _366 = fma(_360, -1.5, _310);
    float _368 = fma(_360, -0.5, _310);
    float _370 = fma(_360, 0.5, _310);
    float _372 = fma(_362, 1.5, _294);
    float3 _1446 = float3(_370, _372, float(int(_320)));
    float3 _1448 = select(_1446, float3(0.0), isnan(_1446));
    float _374 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1448.xy, uint(rint(_1448.z)), _352);
    float3 _1457 = float3(_368, _372, float(int(_320)));
    float3 _1459 = select(_1457, float3(0.0), isnan(_1457));
    float _376 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1459.xy, uint(rint(_1459.z)), _352);
    float3 _1468 = float3(_366, _372, float(int(_320)));
    float3 _1470 = select(_1468, float3(0.0), isnan(_1468));
    float _378 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1470.xy, uint(rint(_1470.z)), _352);
    float3 _1479 = float3(_364, _372, float(int(_320)));
    float3 _1481 = select(_1479, float3(0.0), isnan(_1479));
    float _380 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1481.xy, uint(rint(_1481.z)), _352);
    float3 _1490 = float3(_268, _298, float(int(_252)));
    float3 _1492 = select(_1490, float3(0.0), isnan(_1490));
    float _382 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1492.xy, uint(rint(_1492.z)), 1.0);
    float _384 = _348 + _286;
    float _386 = _384 + _288;
    float _388 = fma(_362, 0.5, _294);
    float _390 = fma(_362, -0.5, _294);
    float _392 = _386 + _342;
    float _394 = _392 + _338;
    float _396 = _394 + _340;
    float _398 = _396 + _344;
    float _400 = _398 + _346;
    float3 _1527 = float3(_364, _388, float(int(_320)));
    float3 _1529 = select(_1527, float3(0.0), isnan(_1527));
    float _402 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1529.xy, uint(rint(_1529.z)), _352);
    float _404 = _400 + _354;
    float _406 = _404 + _356;
    float _408 = _380 + _374;
    float _410 = _406 + _382;
    float3 _1550 = float3(_370, _388, float(int(_320)));
    float3 _1552 = select(_1550, float3(0.0), isnan(_1550));
    float _412 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1552.xy, uint(rint(_1552.z)), _352);
    float _414 = _408 + _376;
    float _416 = _414 + _378;
    float3 _1567 = float3(_368, _388, float(int(_320)));
    float3 _1569 = select(_1567, float3(0.0), isnan(_1567));
    float _418 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1569.xy, uint(rint(_1569.z)), _352);
    float3 _1578 = float3(_366, _388, float(int(_320)));
    float3 _1580 = select(_1578, float3(0.0), isnan(_1578));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1580.xy, uint(rint(_1580.z)), _352);
    float3 _1589 = float3(_364, _390, float(int(_320)));
    float3 _1591 = select(_1589, float3(0.0), isnan(_1589));
    float _422 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1591.xy, uint(rint(_1591.z)), _352);
    float3 _1600 = float3(_370, _390, float(int(_320)));
    float3 _1602 = select(_1600, float3(0.0), isnan(_1600));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1602.xy, uint(rint(_1602.z)), _352);
    float _426 = -_72;
    float _428 = _426 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _430 = -_74;
    float _432 = _430 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _434 = _72 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _436 = _428 * _428;
    float _438 = _72 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _440 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[31].x, _434);
    float _442 = fma(_432, _432, _436);
    float _444 = -_70;
    float _446 = _444 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _448 = _72 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _450 = _72 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _452 = _72 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _454 = fma(_446, _446, _442);
    float _456 = _72 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _458 = _72 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _460 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[30].x, _448);
    float _462 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[25].x, _452);
    float _464 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[26].x, _450);
    float _466 = sqrt(_454);
    float _468 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].z, _460);
    float _470 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[28].x, _456);
    float _472 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[32].x, _458);
    float _474 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].z, _440);
    float _476 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].z, _470);
    float _478 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].z, _472);
    float _480 = _476 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    bool _482 = _466 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _484 = _466 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _486 = _72 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    bool _488 = !_482;
    int _490 = _488 ? 0 : 1;
    float _492 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[33].x, _486);
    float _494 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].z, _492);
    int _496 = 2;
    float _498 = _480;
    if (!_482)
    {
        _496 = 1;
    }
    int _500 = _496;
    int _502 = _500;
    if (!_484)
    {
        _502 = _490;
    }
    int _504 = _502;
    float _506 = _72 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _508 = float(_504);
    float _510 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[27].x, _506);
    float _512 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[29].x, _438);
    float _514 = fma(_362, -1.5, _294);
    float _516 = precise::min(_508, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _518 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].z, _510);
    float _520 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].z, _512);
    bool _522 = _516 != 1.0;
    bool _524 = isnan(_516);
    bool _526 = _522 || _524;
    bool _528 = isnan(1.0);
    bool _530 = _526 || _528;
    float _532 = _520 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _534 = _468 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _536 = _532;
    float _538 = _534;
    if (_530)
    {
        float _540 = _478 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _536 = _540;
    }
    float _542 = _536;
    float _544 = _542;
    if (_530)
    {
        float _546 = _474 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _498 = _546;
    }
    float _548 = _498;
    float _550 = _548;
    if (_530)
    {
        float _552 = _494 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _538 = _552;
    }
    float _554 = _538;
    bool _556 = _516 != 0.0;
    bool _558 = isnan(_516);
    bool _560 = _556 || _558;
    bool _562 = isnan(0.0);
    bool _564 = _560 || _562;
    float _566 = _416 + _402;
    float _568 = _566 + _412;
    float _570 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].z, _462);
    float _572 = _568 + _418;
    float _574 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].z, _464);
    float _576 = _572 + _420;
    float _578 = _576 + _422;
    float _580 = _578 + _424;
    float3 _1895 = float3(_368, _390, float(int(_320)));
    float3 _1897 = select(_1895, float3(0.0), isnan(_1895));
    float _582 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1897.xy, uint(rint(_1897.z)), _352);
    float3 _1906 = float3(_366, _390, float(int(_320)));
    float3 _1908 = select(_1906, float3(0.0), isnan(_1906));
    float _584 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1908.xy, uint(rint(_1908.z)), _352);
    float3 _1917 = float3(_364, _514, float(int(_320)));
    float3 _1919 = select(_1917, float3(0.0), isnan(_1917));
    float _586 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1919.xy, uint(rint(_1919.z)), _352);
    float3 _1928 = float3(_370, _514, float(int(_320)));
    float3 _1930 = select(_1928, float3(0.0), isnan(_1928));
    float _588 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1930.xy, uint(rint(_1930.z)), _352);
    float3 _1939 = float3(_368, _514, float(int(_320)));
    float3 _1941 = select(_1939, float3(0.0), isnan(_1939));
    float _590 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1941.xy, uint(rint(_1941.z)), _352);
    float3 _1950 = float3(_366, _514, float(int(_320)));
    float3 _1952 = select(_1950, float3(0.0), isnan(_1950));
    float _592 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1952.xy, uint(rint(_1952.z)), _352);
    float _594 = rint(_516);
    float _596 = precise::max(_594, 0.0);
    uint _598 = uint(_596);
    uint _600 = clamp(_598, 0u, 65535u);
    float _602 = _554;
    if (!_564)
    {
        float _604 = _518 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _602 = _604;
    }
    float _606 = _602;
    if (!_564)
    {
        float _608 = _570 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _550 = _608;
    }
    float _610 = _550;
    if (!_564)
    {
        float _612 = _574 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _544 = _612;
    }
    float _614 = _544;
    float _616 = 0.0 + _606;
    float _618 = precise::clamp(_616, 0.0, 1.0);
    float _620 = _336 * _618;
    float _622 = _358 * _618;
    float _624 = fma(_620, 0.5, _610);
    float _626 = fma(_620, -0.5, _610);
    float _628 = fma(_622, 1.5, _614);
    float _630 = _580 + _582;
    float _632 = -_70;
    float _634 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _636 = _632 + _634;
    float _638 = _630 + _584;
    float _640 = fma(_622, 0.5, _614);
    float _642 = _636 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _644 = precise::clamp(_642, 0.0, 1.0);
    float _646 = _638 + _586;
    float _648 = fma(_620, 1.5, _610);
    float _650 = fma(_620, -1.5, _610);
    float3 _2051 = float3(_624, _628, float(int(_600)));
    float3 _2053 = select(_2051, float3(0.0), isnan(_2051));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2053.xy, uint(rint(_2053.z)), _618);
    float3 _2062 = float3(_648, _628, float(int(_600)));
    float3 _2064 = select(_2062, float3(0.0), isnan(_2062));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2064.xy, uint(rint(_2064.z)), _618);
    float3 _2073 = float3(_626, _628, float(int(_600)));
    float3 _2075 = select(_2073, float3(0.0), isnan(_2073));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2075.xy, uint(rint(_2075.z)), _618);
    float3 _2084 = float3(_650, _628, float(int(_600)));
    float3 _2086 = select(_2084, float3(0.0), isnan(_2084));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2086.xy, uint(rint(_2086.z)), _618);
    float3 _2095 = float3(_648, _640, float(int(_600)));
    float3 _2097 = select(_2095, float3(0.0), isnan(_2095));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2097.xy, uint(rint(_2097.z)), _618);
    float _662 = _646 + _588;
    float3 _2109 = float3(_624, _640, float(int(_600)));
    float3 _2111 = select(_2109, float3(0.0), isnan(_2109));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2111.xy, uint(rint(_2111.z)), _618);
    float _666 = fma(_410, 0.0625, _644);
    float _668 = _662 + _590;
    float3 _2127 = float3(_626, _640, float(int(_600)));
    float3 _2129 = select(_2127, float3(0.0), isnan(_2127));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2129.xy, uint(rint(_2129.z)), _618);
    float3 _2138 = float3(_650, _640, float(int(_600)));
    float3 _2140 = select(_2138, float3(0.0), isnan(_2138));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2140.xy, uint(rint(_2140.z)), _618);
    float _674 = fma(_622, -0.5, _614);
    float3 _2152 = float3(_648, _674, float(int(_600)));
    float3 _2154 = select(_2152, float3(0.0), isnan(_2152));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2154.xy, uint(rint(_2154.z)), _618);
    float3 _2163 = float3(_624, _674, float(int(_600)));
    float3 _2165 = select(_2163, float3(0.0), isnan(_2163));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2165.xy, uint(rint(_2165.z)), _618);
    float3 _2174 = float3(_626, _674, float(int(_600)));
    float3 _2176 = select(_2174, float3(0.0), isnan(_2174));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2176.xy, uint(rint(_2176.z)), _618);
    float3 _2185 = float3(_650, _674, float(int(_600)));
    float3 _2187 = select(_2185, float3(0.0), isnan(_2185));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2187.xy, uint(rint(_2187.z)), _618);
    float _684 = fma(_622, -1.5, _614);
    float3 _2199 = float3(_648, _684, float(int(_600)));
    float3 _2201 = select(_2199, float3(0.0), isnan(_2199));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2201.xy, uint(rint(_2201.z)), _618);
    float _688 = in.m_38.x;
    float3 _2212 = float3(_624, _684, float(int(_600)));
    float3 _2214 = select(_2212, float3(0.0), isnan(_2212));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2214.xy, uint(rint(_2214.z)), _618);
    float3 _2223 = float3(_626, _684, float(int(_600)));
    float3 _2225 = select(_2223, float3(0.0), isnan(_2223));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2225.xy, uint(rint(_2225.z)), _618);
    float3 _2234 = float3(_650, _684, float(int(_600)));
    float3 _2236 = select(_2234, float3(0.0), isnan(_2234));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2236.xy, uint(rint(_2236.z)), _618);
    float2 _2242 = float2(_688, _52);
    float _696 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2242, float2(0.0), isnan(_2242))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2242, float2(0.0), isnan(_2242))).x;
    float _698 = _668 + _592;
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
    float _720 = _718 + _664;
    float _722 = _720 + _670;
    float _724 = _722 + _672;
    float _726 = _724 + _676;
    float _728 = _726 + _678;
    float _730 = _728 + _680;
    float _732 = _730 + _682;
    float _734 = _732 + _686;
    float _736 = _734 + _690;
    float _738 = _736 + _692;
    float _740 = _738 + _694;
    float _742 = _740 * 0.0625;
    float _744 = _742 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _746 = fma(_706, (*spvDescriptorSet0.fp_c3)._m0[49].z, _744);
    float _748 = _710 + _746;
    out.m_43.x = _696;
    out.m_43.y = _666;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _748;
    return out;
}

