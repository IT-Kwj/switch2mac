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
    float2 _671 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_671, float2(0.0), isnan(_671))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_671, float2(0.0), isnan(_671))).x;
    float _58 = in.m_42.y;
    float _60 = in.m_42.x;
    float _62 = -_56;
    float _64 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _66 = 1.0 / _64;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = _66 * _68;
    float _72 = _70 * _58;
    float _74 = _70 * _60;
    float _76 = _72 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _78 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _80 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].x, _76);
    float _82 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].x, _78);
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _80);
    float _86 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _82);
    float _88 = _84 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _90 = _72 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _92 = _86 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _94 = 1.0 / _88;
    float _96 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].x, _90);
    float _98 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _96);
    float _100 = _98 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _102 = _72 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _104 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].x, _102);
    float _106 = _100 * _94;
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _104);
    float _112 = rint(_108);
    float _114 = precise::max(_112, 0.0);
    uint _117 = uint(_114);
    uint _119 = clamp(_117, 0u, 65535u);
    float _121 = _110 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _123 = _121 * _94;
    float _125 = _92 * _94;
    float _127 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _123);
    float _129 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _125);
    float _131 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _133 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _131, _125);
    float3 _833 = float3(_129, _127, float(int(_119)));
    float3 _837 = select(_833, float3(0.0), isnan(_833));
    float _135 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _837.xy, uint(rint(_837.z)), 1.0);
    float3 _845 = float3(_125, _127, float(int(_119)));
    float3 _847 = select(_845, float3(0.0), isnan(_845));
    float _137 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _847.xy, uint(rint(_847.z)), 1.0);
    float3 _855 = float3(_133, _127, float(int(_119)));
    float3 _857 = select(_855, float3(0.0), isnan(_855));
    float _139 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _857.xy, uint(rint(_857.z)), 1.0);
    float3 _865 = float3(_129, _123, float(int(_119)));
    float3 _867 = select(_865, float3(0.0), isnan(_865));
    float _141 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _867.xy, uint(rint(_867.z)), 1.0);
    float _143 = -_72;
    float _145 = _143 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _147 = -_74;
    float _149 = _147 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _151 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _153 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _155 = _145 * _145;
    float _157 = fma(_149, _149, _155);
    float _159 = -_70;
    float _161 = _159 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _163 = fma(_161, _161, _157);
    float _165 = _72 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _167 = _72 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _169 = _72 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _171 = sqrt(_163);
    float _173 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[21].x, _165);
    float _175 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[24].x, _167);
    float _177 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[22].x, _169);
    float _179 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].z, _173);
    float _181 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].z, _175);
    float _183 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].z, _177);
    float _185 = _179 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _187 = _72 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _189 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[20].x, _187);
    bool _193 = _171 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _195 = _171 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _197 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].z, _189);
    bool _199 = !_193;
    int _202 = _199 ? 0 : 1;
    float _204 = _72 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _206 = _197 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _208 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[17].x, _204);
    int _210 = 2;
    float _212 = _185;
    float _214 = _206;
    if (!_193)
    {
        _210 = 1;
    }
    int _216 = _210;
    float _218 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].z, _208);
    int _220 = _216;
    if (!_195)
    {
        _220 = _202;
    }
    int _222 = _220;
    float _224 = _72 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _226 = float(_222);
    float _228 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[19].x, _224);
    float _230 = precise::min(_226, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _232 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].z, _228);
    bool _234 = _230 != 1.0;
    bool _236 = isnan(_230);
    bool _238 = _234 || _236;
    bool _240 = isnan(1.0);
    bool _242 = _238 || _240;
    float _244 = _232 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    bool _246 = _230 != 0.0;
    bool _248 = isnan(_230);
    bool _250 = _246 || _248;
    bool _252 = isnan(0.0);
    bool _254 = _250 || _252;
    float _256 = _72 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _258 = rint(_230);
    float _260 = precise::max(_258, 0.0);
    uint _262 = uint(_260);
    uint _264 = clamp(_262, 0u, 65535u);
    float _266 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[16].x, _256);
    float _268 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].z, _266);
    float _270 = _244;
    if (_242)
    {
        float _272 = _181 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _212 = _272;
    }
    float _274 = _212;
    float _276 = _72 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _278 = _274;
    if (_242)
    {
        float _280 = _183 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _270 = _280;
    }
    float _282 = _270;
    float _284 = _72 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _286 = _282;
    if (!_254)
    {
        float _288 = _268 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _286 = _288;
    }
    float _290 = _286;
    float _292 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[23].x, _276);
    float _294 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _296 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _294, _123);
    float _298 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[18].x, _284);
    float _300 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].z, _292);
    float _302 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].z, _298);
    if (_242)
    {
        float _304 = _300 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _214 = _304;
    }
    float _306 = _214;
    float _308 = _306;
    if (!_254)
    {
        float _310 = _218 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _308 = _310;
    }
    float _312 = _308;
    if (!_254)
    {
        float _314 = _302 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _278 = _314;
    }
    float _316 = _278;
    float3 _1197 = float3(_125, _123, float(int(_119)));
    float3 _1199 = select(_1197, float3(0.0), isnan(_1197));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1199.xy, uint(rint(_1199.z)), 1.0);
    float _320 = 0.0 + _316;
    float _322 = precise::clamp(_320, 0.0, 1.0);
    float3 _1211 = float3(_133, _123, float(int(_119)));
    float3 _1213 = select(_1211, float3(0.0), isnan(_1211));
    float _324 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1213.xy, uint(rint(_1213.z)), 1.0);
    float3 _1221 = float3(_129, _296, float(int(_119)));
    float3 _1223 = select(_1221, float3(0.0), isnan(_1221));
    float _326 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1223.xy, uint(rint(_1223.z)), 1.0);
    float _328 = fma(_322, _151, _312);
    float _330 = fma(_322, _153, _290);
    float3 _1239 = float3(_125, _296, float(int(_119)));
    float3 _1241 = select(_1239, float3(0.0), isnan(_1239));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1241.xy, uint(rint(_1241.z)), 1.0);
    float3 _1249 = float3(_133, _296, float(int(_119)));
    float3 _1251 = select(_1249, float3(0.0), isnan(_1249));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1251.xy, uint(rint(_1251.z)), 1.0);
    float3 _1259 = float3(_290, _328, float(int(_264)));
    float3 _1261 = select(_1259, float3(0.0), isnan(_1259));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1261.xy, uint(rint(_1261.z)), _322);
    float3 _1270 = float3(_330, _328, float(int(_264)));
    float3 _1272 = select(_1270, float3(0.0), isnan(_1270));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1272.xy, uint(rint(_1272.z)), _322);
    float _340 = -_151;
    float _342 = fma(_322, _340, _312);
    float _344 = _135 + _137;
    float _346 = _344 + _139;
    float _348 = _346 + _141;
    float _350 = -_153;
    float _352 = fma(_322, _350, _290);
    float3 _1302 = float3(_352, _328, float(int(_264)));
    float3 _1304 = select(_1302, float3(0.0), isnan(_1302));
    float _354 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1304.xy, uint(rint(_1304.z)), _322);
    float3 _1313 = float3(_330, _312, float(int(_264)));
    float3 _1315 = select(_1313, float3(0.0), isnan(_1313));
    float _356 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1315.xy, uint(rint(_1315.z)), _322);
    float3 _1324 = float3(_290, _312, float(int(_264)));
    float3 _1326 = select(_1324, float3(0.0), isnan(_1324));
    float _358 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1326.xy, uint(rint(_1326.z)), _322);
    float3 _1335 = float3(_352, _312, float(int(_264)));
    float3 _1337 = select(_1335, float3(0.0), isnan(_1335));
    float _360 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1337.xy, uint(rint(_1337.z)), _322);
    float3 _1346 = float3(_330, _342, float(int(_264)));
    float3 _1348 = select(_1346, float3(0.0), isnan(_1346));
    float _362 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1348.xy, uint(rint(_1348.z)), _322);
    float2 _1354 = float2(_52, _54);
    float2 _366 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1354, float2(0.0), isnan(_1354))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1354, float2(0.0), isnan(_1354))).xy;
    float _368 = _366.x;
    float _370 = _366.y;
    float _372 = -_72;
    float _374 = _372 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _376 = _374 * _374;
    float _378 = _72 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _380 = _72 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _382 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[26].x, _378);
    float _384 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[32].x, _380);
    float _386 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].z, _382);
    float _388 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].z, _384);
    float _390 = _348 + _318;
    float _392 = -_74;
    float _394 = _392 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _396 = _390 + _324;
    float _398 = fma(_394, _394, _376);
    float _400 = -_70;
    float _402 = _400 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _404 = _396 + _326;
    float _406 = _72 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _408 = fma(_402, _402, _398);
    float _410 = _338 + _336;
    float _412 = _72 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _414 = _404 + _332;
    float _416 = _72 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _418 = _72 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _420 = sqrt(_408);
    float _422 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[28].x, _412);
    float _424 = _414 + _334;
    float _426 = _72 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _428 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[31].x, _416);
    float _430 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[30].x, _418);
    float _432 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[25].x, _406);
    float _434 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[29].x, _426);
    float _436 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].z, _422);
    float _438 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].z, _430);
    float _440 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].z, _432);
    float _442 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].z, _434);
    float _444 = _438 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    bool _446 = _420 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _448 = _420 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _450 = _436 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    bool _452 = !_446;
    int _454 = _452 ? 0 : 1;
    int _456 = 2;
    float _458 = _444;
    float _460 = _450;
    if (!_446)
    {
        _456 = 1;
    }
    int _462 = _456;
    int _464 = _462;
    if (!_448)
    {
        _464 = _454;
    }
    int _466 = _464;
    float _468 = _72 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _470 = _72 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _472 = float(_466);
    float _474 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[27].x, _468);
    float _476 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[33].x, _470);
    float _478 = precise::min(_472, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _480 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].z, _428);
    float _482 = _442 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _484 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].z, _476);
    bool _486 = _478 != 1.0;
    bool _488 = isnan(_478);
    bool _490 = _486 || _488;
    bool _492 = isnan(1.0);
    bool _494 = _490 || _492;
    float _496 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].z, _474);
    bool _498 = _478 != 0.0;
    bool _500 = isnan(_478);
    bool _502 = _498 || _500;
    bool _504 = isnan(0.0);
    bool _506 = _502 || _504;
    float _508 = _482;
    if (_494)
    {
        float _510 = _388 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _508 = _510;
    }
    float _512 = _508;
    float _514 = _512;
    if (_494)
    {
        float _516 = _484 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _458 = _516;
    }
    float _518 = _458;
    float _520 = _518;
    if (!_506)
    {
        float _522 = _386 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _514 = _522;
    }
    float _524 = _514;
    if (!_506)
    {
        float _526 = _496 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _520 = _526;
    }
    float _528 = _520;
    float _530 = rint(_478);
    float _532 = precise::max(_530, 0.0);
    uint _534 = uint(_532);
    uint _536 = clamp(_534, 0u, 65535u);
    if (_494)
    {
        float _538 = _480 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _460 = _538;
    }
    float _540 = _460;
    float _542 = _540;
    if (!_506)
    {
        float _544 = _440 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _542 = _544;
    }
    float _546 = _542;
    float _548 = 0.0 + _528;
    float _550 = precise::clamp(_548, 0.0, 1.0);
    float _552 = -_153;
    float _554 = fma(_552, _550, _546);
    float _556 = _410 + _354;
    float _558 = _556 + _356;
    float _560 = _558 + _358;
    float _562 = _560 + _360;
    float _564 = _562 + _362;
    float _566 = fma(_151, _550, _524);
    float _568 = fma(_368, 2.0, -1.0);
    float _570 = fma(_370, 2.0, -1.0);
    float _572 = fma(_153, _550, _546);
    float _574 = _570 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _576 = _568 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float3 _1737 = float3(_290, _342, float(int(_264)));
    float3 _1739 = select(_1737, float3(0.0), isnan(_1737));
    float _578 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1739.xy, uint(rint(_1739.z)), _322);
    float3 _1748 = float3(_352, _342, float(int(_264)));
    float3 _1750 = select(_1748, float3(0.0), isnan(_1748));
    float _580 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1750.xy, uint(rint(_1750.z)), _322);
    float3 _1759 = float3(_546, _566, float(int(_536)));
    float3 _1761 = select(_1759, float3(0.0), isnan(_1759));
    float _582 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1761.xy, uint(rint(_1761.z)), _550);
    float3 _1770 = float3(_572, _566, float(int(_536)));
    float3 _1772 = select(_1770, float3(0.0), isnan(_1770));
    float _584 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1772.xy, uint(rint(_1772.z)), _550);
    float3 _1781 = float3(_554, _566, float(int(_536)));
    float3 _1783 = select(_1781, float3(0.0), isnan(_1781));
    float _586 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1783.xy, uint(rint(_1783.z)), _550);
    float3 _1792 = float3(_572, _524, float(int(_536)));
    float3 _1794 = select(_1792, float3(0.0), isnan(_1792));
    float _588 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1794.xy, uint(rint(_1794.z)), _550);
    float _590 = fma(_576, 2.0, _52);
    float _592 = fma(_574, 2.0, _54);
    float _594 = -_151;
    float _596 = fma(_594, _550, _524);
    float3 _1815 = float3(_546, _524, float(int(_536)));
    float3 _1817 = select(_1815, float3(0.0), isnan(_1815));
    float _598 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1817.xy, uint(rint(_1817.z)), _550);
    float3 _1826 = float3(_554, _524, float(int(_536)));
    float3 _1828 = select(_1826, float3(0.0), isnan(_1826));
    float _600 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1828.xy, uint(rint(_1828.z)), _550);
    float3 _1837 = float3(_572, _596, float(int(_536)));
    float3 _1839 = select(_1837, float3(0.0), isnan(_1837));
    float _602 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1839.xy, uint(rint(_1839.z)), _550);
    float3 _1848 = float3(_546, _596, float(int(_536)));
    float3 _1850 = select(_1848, float3(0.0), isnan(_1848));
    float _604 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1850.xy, uint(rint(_1850.z)), _550);
    float3 _1859 = float3(_554, _596, float(int(_536)));
    float3 _1861 = select(_1859, float3(0.0), isnan(_1859));
    float _606 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1861.xy, uint(rint(_1861.z)), _550);
    float2 _1867 = float2(_590, _592);
    float _608 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1867, float2(0.0), isnan(_1867))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1867, float2(0.0), isnan(_1867))).x;
    float _610 = -_70;
    float _612 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _614 = _610 + _612;
    float _616 = -_70;
    float _618 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _620 = _616 + _618;
    float _622 = _614 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _624 = precise::clamp(_622, 0.0, 1.0);
    float _626 = _620 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _628 = precise::clamp(_626, 0.0, 1.0);
    float _630 = _564 + _578;
    float _632 = fma(_424, 0.111111111938953399658203125, _624);
    float _634 = _584 + _582;
    float _636 = _630 + _580;
    float _638 = _634 + _586;
    float _640 = _636 * 0.111111111938953399658203125;
    float _642 = _638 + _588;
    float _644 = _642 + _598;
    float _646 = _644 + _600;
    float _648 = _646 + _602;
    float _650 = _648 + _604;
    float _652 = _650 + _606;
    float _654 = _652 * 0.111111111938953399658203125;
    float _656 = _654 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _658 = fma(_640, (*spvDescriptorSet0.fp_c3)._m0[49].z, _656);
    float _660 = _628 + _658;
    out.m_45.x = _608;
    out.m_45.y = _632;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _660;
    return out;
}

