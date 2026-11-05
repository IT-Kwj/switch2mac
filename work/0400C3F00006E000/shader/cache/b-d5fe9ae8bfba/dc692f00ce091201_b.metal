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
    float2 _667 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_667, float2(0.0), isnan(_667))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_667, float2(0.0), isnan(_667))).x;
    float _58 = in.m_42.y;
    float _60 = in.m_42.x;
    float _62 = -_56;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].z, _64);
    float _68 = _66 * _58;
    float _70 = _66 * _60;
    float _72 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _74 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _76 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _72);
    float _78 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _74);
    float _80 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _76);
    float _82 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _78);
    float _84 = _80 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _86 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _88 = _82 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _90 = 1.0 / _84;
    float _92 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _86);
    float _94 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _92);
    float _96 = _94 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _98 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _100 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _98);
    float _102 = _96 * _90;
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = _88 * _90;
    float _108 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _100);
    float _110 = rint(_104);
    float _112 = precise::max(_110, 0.0);
    uint _115 = uint(_112);
    uint _117 = clamp(_115, 0u, 65535u);
    float _119 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _106);
    float _121 = _108 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _123 = _121 * _90;
    float _125 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _123);
    float _127 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _129 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _127, _123);
    float3 _825 = float3(_125, _119, float(int(_117)));
    float3 _829 = select(_825, float3(0.0), isnan(_825));
    float _131 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _829.xy, uint(rint(_829.z)), 1.0);
    float3 _837 = float3(_123, _119, float(int(_117)));
    float3 _839 = select(_837, float3(0.0), isnan(_837));
    float _133 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _839.xy, uint(rint(_839.z)), 1.0);
    float3 _847 = float3(_129, _119, float(int(_117)));
    float3 _849 = select(_847, float3(0.0), isnan(_847));
    float _135 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _849.xy, uint(rint(_849.z)), 1.0);
    float3 _857 = float3(_125, _106, float(int(_117)));
    float3 _859 = select(_857, float3(0.0), isnan(_857));
    float _137 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _859.xy, uint(rint(_859.z)), 1.0);
    float _139 = -_68;
    float _141 = _139 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _143 = -_70;
    float _145 = _143 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _147 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _149 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _151 = _141 * _141;
    float _153 = fma(_145, _145, _151);
    float _155 = -_66;
    float _157 = _155 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _159 = fma(_157, _157, _153);
    float _161 = _68 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _163 = _68 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _165 = _68 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _167 = sqrt(_159);
    float _169 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].x, _161);
    float _171 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].x, _163);
    float _173 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].x, _165);
    float _175 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _169);
    float _177 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _171);
    float _179 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _173);
    float _181 = _175 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _183 = _68 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _185 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].x, _183);
    bool _189 = _167 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _191 = _167 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _193 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _185);
    bool _195 = !_189;
    int _198 = _195 ? 0 : 1;
    float _200 = _68 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _202 = _193 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _204 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].x, _200);
    int _206 = 2;
    float _208 = _181;
    float _210 = _202;
    if (!_189)
    {
        _206 = 1;
    }
    int _212 = _206;
    float _214 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _204);
    int _216 = _212;
    if (!_191)
    {
        _216 = _198;
    }
    int _218 = _216;
    float _220 = _68 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _222 = float(_218);
    float _224 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].x, _220);
    float _226 = precise::min(_222, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _228 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _224);
    bool _230 = _226 != 1.0;
    bool _232 = isnan(_226);
    bool _234 = _230 || _232;
    bool _236 = isnan(1.0);
    bool _238 = _234 || _236;
    float _240 = _228 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    bool _242 = _226 != 0.0;
    bool _244 = isnan(_226);
    bool _246 = _242 || _244;
    bool _248 = isnan(0.0);
    bool _250 = _246 || _248;
    float _252 = _68 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _254 = rint(_226);
    float _256 = precise::max(_254, 0.0);
    uint _258 = uint(_256);
    uint _260 = clamp(_258, 0u, 65535u);
    float _262 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].x, _252);
    float _264 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _262);
    float _266 = _240;
    if (_238)
    {
        float _268 = _177 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _208 = _268;
    }
    float _270 = _208;
    float _272 = _68 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _274 = _270;
    if (_238)
    {
        float _276 = _179 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _266 = _276;
    }
    float _278 = _266;
    float _280 = _68 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _282 = _278;
    if (!_250)
    {
        float _284 = _264 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _282 = _284;
    }
    float _286 = _282;
    float _288 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].x, _272);
    float _290 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _292 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _290, _106);
    float _294 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].x, _280);
    float _296 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _288);
    float _298 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _294);
    if (_238)
    {
        float _300 = _296 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _210 = _300;
    }
    float _302 = _210;
    float _304 = _302;
    if (!_250)
    {
        float _306 = _214 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _304 = _306;
    }
    float _308 = _304;
    if (!_250)
    {
        float _310 = _298 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _274 = _310;
    }
    float _312 = _274;
    float3 _1189 = float3(_123, _106, float(int(_117)));
    float3 _1191 = select(_1189, float3(0.0), isnan(_1189));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1191.xy, uint(rint(_1191.z)), 1.0);
    float _316 = 0.0 + _312;
    float _318 = precise::clamp(_316, 0.0, 1.0);
    float3 _1203 = float3(_129, _106, float(int(_117)));
    float3 _1205 = select(_1203, float3(0.0), isnan(_1203));
    float _320 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1205.xy, uint(rint(_1205.z)), 1.0);
    float3 _1213 = float3(_125, _292, float(int(_117)));
    float3 _1215 = select(_1213, float3(0.0), isnan(_1213));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1215.xy, uint(rint(_1215.z)), 1.0);
    float _324 = fma(_318, _147, _308);
    float _326 = fma(_318, _149, _286);
    float3 _1231 = float3(_123, _292, float(int(_117)));
    float3 _1233 = select(_1231, float3(0.0), isnan(_1231));
    float _328 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1233.xy, uint(rint(_1233.z)), 1.0);
    float3 _1241 = float3(_129, _292, float(int(_117)));
    float3 _1243 = select(_1241, float3(0.0), isnan(_1241));
    float _330 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1243.xy, uint(rint(_1243.z)), 1.0);
    float3 _1251 = float3(_286, _324, float(int(_260)));
    float3 _1253 = select(_1251, float3(0.0), isnan(_1251));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1253.xy, uint(rint(_1253.z)), _318);
    float3 _1262 = float3(_326, _324, float(int(_260)));
    float3 _1264 = select(_1262, float3(0.0), isnan(_1262));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1264.xy, uint(rint(_1264.z)), _318);
    float _336 = -_147;
    float _338 = fma(_318, _336, _308);
    float _340 = _131 + _133;
    float _342 = _340 + _135;
    float _344 = _342 + _137;
    float _346 = -_149;
    float _348 = fma(_318, _346, _286);
    float3 _1294 = float3(_348, _324, float(int(_260)));
    float3 _1296 = select(_1294, float3(0.0), isnan(_1294));
    float _350 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1296.xy, uint(rint(_1296.z)), _318);
    float3 _1305 = float3(_326, _308, float(int(_260)));
    float3 _1307 = select(_1305, float3(0.0), isnan(_1305));
    float _352 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1307.xy, uint(rint(_1307.z)), _318);
    float3 _1316 = float3(_286, _308, float(int(_260)));
    float3 _1318 = select(_1316, float3(0.0), isnan(_1316));
    float _354 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1318.xy, uint(rint(_1318.z)), _318);
    float3 _1327 = float3(_348, _308, float(int(_260)));
    float3 _1329 = select(_1327, float3(0.0), isnan(_1327));
    float _356 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1329.xy, uint(rint(_1329.z)), _318);
    float3 _1338 = float3(_326, _338, float(int(_260)));
    float3 _1340 = select(_1338, float3(0.0), isnan(_1338));
    float _358 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1340.xy, uint(rint(_1340.z)), _318);
    float2 _1346 = float2(_52, _54);
    float2 _362 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1346, float2(0.0), isnan(_1346))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1346, float2(0.0), isnan(_1346))).xy;
    float _364 = _362.x;
    float _366 = _362.y;
    float _368 = -_68;
    float _370 = _368 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _372 = _370 * _370;
    float _374 = _68 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _376 = _68 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _378 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].x, _374);
    float _380 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].x, _376);
    float _382 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _378);
    float _384 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _380);
    float _386 = _344 + _314;
    float _388 = -_70;
    float _390 = _388 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _392 = _386 + _320;
    float _394 = fma(_390, _390, _372);
    float _396 = -_66;
    float _398 = _396 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _400 = _392 + _322;
    float _402 = _68 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _404 = fma(_398, _398, _394);
    float _406 = _334 + _332;
    float _408 = _68 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _410 = _400 + _328;
    float _412 = _68 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _414 = _68 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _416 = sqrt(_404);
    float _418 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].x, _408);
    float _420 = _410 + _330;
    float _422 = _68 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _424 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].x, _412);
    float _426 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].x, _414);
    float _428 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].x, _402);
    float _430 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].x, _422);
    float _432 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _418);
    float _434 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _426);
    float _436 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _428);
    float _438 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _430);
    float _440 = _434 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    bool _442 = _416 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _444 = _416 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _446 = _432 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    bool _448 = !_442;
    int _450 = _448 ? 0 : 1;
    int _452 = 2;
    float _454 = _440;
    float _456 = _446;
    if (!_442)
    {
        _452 = 1;
    }
    int _458 = _452;
    int _460 = _458;
    if (!_444)
    {
        _460 = _450;
    }
    int _462 = _460;
    float _464 = _68 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _466 = _68 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _468 = float(_462);
    float _470 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].x, _464);
    float _472 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].x, _466);
    float _474 = precise::min(_468, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _476 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _424);
    float _478 = _438 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _480 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _472);
    bool _482 = _474 != 1.0;
    bool _484 = isnan(_474);
    bool _486 = _482 || _484;
    bool _488 = isnan(1.0);
    bool _490 = _486 || _488;
    float _492 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _470);
    bool _494 = _474 != 0.0;
    bool _496 = isnan(_474);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    float _504 = _478;
    if (_490)
    {
        float _506 = _384 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _504 = _506;
    }
    float _508 = _504;
    float _510 = _508;
    if (_490)
    {
        float _512 = _480 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _454 = _512;
    }
    float _514 = _454;
    float _516 = _514;
    if (!_502)
    {
        float _518 = _382 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _510 = _518;
    }
    float _520 = _510;
    if (!_502)
    {
        float _522 = _492 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _516 = _522;
    }
    float _524 = _516;
    float _526 = rint(_474);
    float _528 = precise::max(_526, 0.0);
    uint _530 = uint(_528);
    uint _532 = clamp(_530, 0u, 65535u);
    if (_490)
    {
        float _534 = _476 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _456 = _534;
    }
    float _536 = _456;
    float _538 = _536;
    if (!_502)
    {
        float _540 = _436 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _538 = _540;
    }
    float _542 = _538;
    float _544 = 0.0 + _524;
    float _546 = precise::clamp(_544, 0.0, 1.0);
    float _548 = -_149;
    float _550 = fma(_548, _546, _542);
    float _552 = _406 + _350;
    float _554 = _552 + _352;
    float _556 = _554 + _354;
    float _558 = _556 + _356;
    float _560 = _558 + _358;
    float _562 = fma(_147, _546, _520);
    float _564 = fma(_364, 2.0, -1.0);
    float _566 = fma(_366, 2.0, -1.0);
    float _568 = fma(_149, _546, _542);
    float _570 = _566 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _572 = _564 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float3 _1729 = float3(_286, _338, float(int(_260)));
    float3 _1731 = select(_1729, float3(0.0), isnan(_1729));
    float _574 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1731.xy, uint(rint(_1731.z)), _318);
    float3 _1740 = float3(_348, _338, float(int(_260)));
    float3 _1742 = select(_1740, float3(0.0), isnan(_1740));
    float _576 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1742.xy, uint(rint(_1742.z)), _318);
    float3 _1751 = float3(_542, _562, float(int(_532)));
    float3 _1753 = select(_1751, float3(0.0), isnan(_1751));
    float _578 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1753.xy, uint(rint(_1753.z)), _546);
    float3 _1762 = float3(_568, _562, float(int(_532)));
    float3 _1764 = select(_1762, float3(0.0), isnan(_1762));
    float _580 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1764.xy, uint(rint(_1764.z)), _546);
    float3 _1773 = float3(_550, _562, float(int(_532)));
    float3 _1775 = select(_1773, float3(0.0), isnan(_1773));
    float _582 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1775.xy, uint(rint(_1775.z)), _546);
    float3 _1784 = float3(_568, _520, float(int(_532)));
    float3 _1786 = select(_1784, float3(0.0), isnan(_1784));
    float _584 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1786.xy, uint(rint(_1786.z)), _546);
    float _586 = fma(_572, 2.0, _52);
    float _588 = fma(_570, 2.0, _54);
    float _590 = -_147;
    float _592 = fma(_590, _546, _520);
    float3 _1807 = float3(_542, _520, float(int(_532)));
    float3 _1809 = select(_1807, float3(0.0), isnan(_1807));
    float _594 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1809.xy, uint(rint(_1809.z)), _546);
    float3 _1818 = float3(_550, _520, float(int(_532)));
    float3 _1820 = select(_1818, float3(0.0), isnan(_1818));
    float _596 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1820.xy, uint(rint(_1820.z)), _546);
    float3 _1829 = float3(_568, _592, float(int(_532)));
    float3 _1831 = select(_1829, float3(0.0), isnan(_1829));
    float _598 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1831.xy, uint(rint(_1831.z)), _546);
    float3 _1840 = float3(_542, _592, float(int(_532)));
    float3 _1842 = select(_1840, float3(0.0), isnan(_1840));
    float _600 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1842.xy, uint(rint(_1842.z)), _546);
    float3 _1851 = float3(_550, _592, float(int(_532)));
    float3 _1853 = select(_1851, float3(0.0), isnan(_1851));
    float _602 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1853.xy, uint(rint(_1853.z)), _546);
    float2 _1859 = float2(_586, _588);
    float _604 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1859, float2(0.0), isnan(_1859))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1859, float2(0.0), isnan(_1859))).x;
    float _606 = -_66;
    float _608 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _610 = _606 + _608;
    float _612 = -_66;
    float _614 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _616 = _612 + _614;
    float _618 = _610 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _620 = precise::clamp(_618, 0.0, 1.0);
    float _622 = _616 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _624 = precise::clamp(_622, 0.0, 1.0);
    float _626 = _560 + _574;
    float _628 = fma(_420, 0.111111111938953399658203125, _620);
    float _630 = _580 + _578;
    float _632 = _626 + _576;
    float _634 = _630 + _582;
    float _636 = _632 * 0.111111111938953399658203125;
    float _638 = _634 + _584;
    float _640 = _638 + _594;
    float _642 = _640 + _596;
    float _644 = _642 + _598;
    float _646 = _644 + _600;
    float _648 = _646 + _602;
    float _650 = _648 * 0.111111111938953399658203125;
    float _652 = _650 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _654 = fma(_636, (*spvDescriptorSet0.fp_c3)._m0[49].z, _652);
    float _656 = _624 + _654;
    out.m_45.x = _604;
    out.m_45.y = _628;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _656;
    return out;
}

