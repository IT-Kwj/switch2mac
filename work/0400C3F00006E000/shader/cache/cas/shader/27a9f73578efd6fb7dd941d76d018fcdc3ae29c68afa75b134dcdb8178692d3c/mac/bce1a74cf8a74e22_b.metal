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
    float _62 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _64 = -_56;
    float _66 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _68 = 1.0 / _66;
    float _70 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _72 = _68 * _70;
    float _74 = _72 * _58;
    float _76 = _72 * _60;
    float _78 = -_74;
    float _80 = _78 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _82 = -_76;
    float _84 = _82 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _86 = _74 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _88 = _74 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _90 = _80 * _80;
    float _92 = -_72;
    float _94 = _92 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _96 = fma(_84, _84, _90);
    float _98 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].x, _88);
    float _100 = fma(_94, _94, _96);
    float _102 = _74 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _104 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].z, _98);
    float _106 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[3].x, _102);
    float _108 = sqrt(_100);
    float _110 = _74 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _112 = _104 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _114 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].z, _106);
    float _116 = _114 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _118 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[0].x, _110);
    float _120 = 1.0 / _116;
    float _122 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].z, _118);
    bool _126 = _108 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _128 = _122 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _130 = _108 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _132 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[1].x, _86);
    bool _134 = !_126;
    int _137 = _134 ? 0 : 1;
    float _139 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].z, _132);
    float _141 = _139 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _143 = _128 * _120;
    int _145 = 2;
    if (!_126)
    {
        _145 = 1;
    }
    int _147 = _145;
    float _149 = _112 * _120;
    float _151 = precise::clamp(_149, 0.0, 1.0);
    int _153 = _147;
    if (!_130)
    {
        _153 = _137;
    }
    int _155 = _153;
    float _157 = _141 * _120;
    float _159 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _161 = fma(_151, _62, _157);
    float _163 = fma(_151, _159, _143);
    float _165 = -_159;
    float _167 = fma(_151, _165, _143);
    float3 _879 = float3(_163, _161, float(0));
    float3 _883 = select(_879, float3(0.0), isnan(_879));
    float _169 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _883.xy, uint(rint(_883.z)), _151);
    float3 _890 = float3(_143, _161, float(0));
    float3 _892 = select(_890, float3(0.0), isnan(_890));
    float _171 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _892.xy, uint(rint(_892.z)), _151);
    float3 _899 = float3(_167, _161, float(0));
    float3 _901 = select(_899, float3(0.0), isnan(_899));
    float _173 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _901.xy, uint(rint(_901.z)), _151);
    float3 _908 = float3(_163, _157, float(0));
    float3 _910 = select(_908, float3(0.0), isnan(_908));
    float _175 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _910.xy, uint(rint(_910.z)), _151);
    float _177 = float(_155);
    float3 _919 = float3(_143, _157, float(0));
    float3 _921 = select(_919, float3(0.0), isnan(_919));
    float _179 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _921.xy, uint(rint(_921.z)), _151);
    float _181 = _74 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _183 = precise::min(_177, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _185 = _74 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _187 = _74 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _189 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[21].x, _181);
    float _191 = _74 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    bool _193 = _183 != 1.0;
    bool _195 = isnan(_183);
    bool _197 = _193 || _195;
    bool _199 = isnan(1.0);
    bool _201 = _197 || _199;
    float _203 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[19].x, _185);
    float _205 = _74 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _207 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[22].x, _191);
    bool _209 = _183 != 0.0;
    bool _211 = isnan(_183);
    bool _213 = _209 || _211;
    bool _215 = isnan(0.0);
    bool _217 = _213 || _215;
    float _219 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[19].z, _203);
    float _221 = _74 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _223 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[22].z, _207);
    float _225 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[20].x, _205);
    float _227 = _74 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _229 = _219 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _231 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[23].x, _187);
    float _233 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[20].z, _225);
    float _235 = _229;
    if (_201)
    {
        float _237 = _223 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _235 = _237;
    }
    float _239 = _235;
    float _241 = _74 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _243 = _74 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _245 = _233 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _247 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[16].x, _227);
    float _249 = rint(_183);
    float _251 = precise::max(_249, 0.0);
    uint _254 = uint(_251);
    uint _256 = clamp(_254, 0u, 65535u);
    float _258 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[24].x, _221);
    float _260 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[23].z, _231);
    float _262 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[16].z, _247);
    float _264 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[18].x, _241);
    float _266 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[17].x, _243);
    float _268 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[21].z, _189);
    float _270 = _239;
    float _272 = _245;
    if (!_217)
    {
        float _274 = _262 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _270 = _274;
    }
    float _276 = _270;
    float _278 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[24].z, _258);
    float _280 = -_62;
    float _282 = fma(_151, _280, _157);
    float _284 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[18].z, _264);
    float _286 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[17].z, _266);
    if (_201)
    {
        float _288 = _260 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _272 = _288;
    }
    float _290 = _272;
    float _292 = _268 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float3 _1148 = float3(_167, _157, float(0));
    float3 _1150 = select(_1148, float3(0.0), isnan(_1148));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1150.xy, uint(rint(_1150.z)), _151);
    float _296 = _292;
    float _298 = _290;
    if (_201)
    {
        float _300 = _278 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _296 = _300;
    }
    float _302 = _296;
    float _304 = _302;
    if (!_217)
    {
        float _306 = _284 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _304 = _306;
    }
    float _308 = _304;
    if (!_217)
    {
        float _310 = _286 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _298 = _310;
    }
    float _312 = _298;
    float _314 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _316 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _318 = 0.0 + _308;
    float _320 = precise::clamp(_318, 0.0, 1.0);
    float3 _1203 = float3(_163, _282, float(0));
    float3 _1205 = select(_1203, float3(0.0), isnan(_1203));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1205.xy, uint(rint(_1205.z)), _151);
    float _324 = fma(_320, _316, _312);
    float3 _1216 = float3(_143, _282, float(0));
    float3 _1218 = select(_1216, float3(0.0), isnan(_1216));
    float _326 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1218.xy, uint(rint(_1218.z)), _151);
    float _328 = fma(_320, _314, _276);
    float3 _1229 = float3(_167, _282, float(0));
    float3 _1231 = select(_1229, float3(0.0), isnan(_1229));
    float _330 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1231.xy, uint(rint(_1231.z)), _151);
    float3 _1240 = float3(_276, _324, float(int(_256)));
    float3 _1242 = select(_1240, float3(0.0), isnan(_1240));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1242.xy, uint(rint(_1242.z)), _320);
    float3 _1251 = float3(_328, _324, float(int(_256)));
    float3 _1253 = select(_1251, float3(0.0), isnan(_1251));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1253.xy, uint(rint(_1253.z)), _320);
    float _336 = -_314;
    float _338 = fma(_320, _336, _276);
    float _340 = -_316;
    float _342 = fma(_320, _340, _312);
    float _344 = _169 + _171;
    float _346 = _344 + _173;
    float _348 = _346 + _175;
    float3 _1283 = float3(_338, _324, float(int(_256)));
    float3 _1285 = select(_1283, float3(0.0), isnan(_1283));
    float _350 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1285.xy, uint(rint(_1285.z)), _320);
    float3 _1294 = float3(_328, _312, float(int(_256)));
    float3 _1296 = select(_1294, float3(0.0), isnan(_1294));
    float _352 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1296.xy, uint(rint(_1296.z)), _320);
    float3 _1305 = float3(_276, _312, float(int(_256)));
    float3 _1307 = select(_1305, float3(0.0), isnan(_1305));
    float _354 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1307.xy, uint(rint(_1307.z)), _320);
    float3 _1316 = float3(_338, _312, float(int(_256)));
    float3 _1318 = select(_1316, float3(0.0), isnan(_1316));
    float _356 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1318.xy, uint(rint(_1318.z)), _320);
    float3 _1327 = float3(_328, _342, float(int(_256)));
    float3 _1329 = select(_1327, float3(0.0), isnan(_1327));
    float _358 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1329.xy, uint(rint(_1329.z)), _320);
    float2 _1335 = float2(_52, _54);
    float2 _362 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1335, float2(0.0), isnan(_1335))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1335, float2(0.0), isnan(_1335))).xy;
    float _364 = _362.x;
    float _366 = _362.y;
    float _368 = -_74;
    float _370 = _368 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _372 = _348 + _179;
    float _374 = -_76;
    float _376 = _374 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _378 = _370 * _370;
    float _380 = fma(_376, _376, _378);
    float _382 = -_72;
    float _384 = _382 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _386 = _74 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _388 = fma(_384, _384, _380);
    float _390 = sqrt(_388);
    float _392 = _74 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _394 = _74 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _396 = _74 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _398 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[29].x, _386);
    float _400 = _372 + _294;
    bool _402 = _390 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _404 = _390 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _406 = _74 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    bool _408 = !_402;
    int _410 = _408 ? 0 : 1;
    float _412 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[30].x, _396);
    float _414 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[29].z, _398);
    float _416 = _400 + _322;
    float _418 = _74 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _420 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[30].z, _412);
    float _422 = _416 + _326;
    int _424 = 2;
    if (!_402)
    {
        _424 = 1;
    }
    int _426 = _424;
    float _428 = _74 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    int _430 = _426;
    if (!_404)
    {
        _430 = _410;
    }
    int _432 = _430;
    float _434 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[31].x, _418);
    float _436 = _422 + _330;
    float _438 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[25].x, _392);
    float _440 = float(_432);
    float _442 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[32].x, _428);
    float _444 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[31].z, _434);
    float _446 = _334 + _332;
    float _448 = precise::min(_440, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _450 = _74 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _452 = _74 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _454 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[28].x, _406);
    bool _456 = _448 != 1.0;
    bool _458 = isnan(_448);
    bool _460 = _456 || _458;
    bool _462 = isnan(1.0);
    bool _464 = _460 || _462;
    float _466 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[26].x, _450);
    bool _468 = _448 != 0.0;
    bool _470 = isnan(_448);
    bool _472 = _468 || _470;
    bool _474 = isnan(0.0);
    bool _476 = _472 || _474;
    float _478 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[33].x, _452);
    float _480 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[27].x, _394);
    float _482 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[28].z, _454);
    float _484 = rint(_448);
    float _486 = precise::max(_484, 0.0);
    uint _488 = uint(_486);
    uint _490 = clamp(_488, 0u, 65535u);
    float _492 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[33].z, _478);
    float _494 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[27].z, _480);
    float _496 = _420 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _498 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[32].z, _442);
    float _500 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[26].z, _466);
    float _502 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[25].z, _438);
    float _504 = _496;
    if (_464)
    {
        float _506 = _492 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _504 = _506;
    }
    float _508 = _504;
    float _510 = _414 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _512 = _508;
    float _514 = _510;
    if (!_476)
    {
        float _516 = _494 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _512 = _516;
    }
    float _518 = _512;
    float _520 = _482 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _522 = _520;
    if (_464)
    {
        float _524 = _498 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _514 = _524;
    }
    float _526 = _514;
    float _528 = _526;
    if (_464)
    {
        float _530 = _444 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _522 = _530;
    }
    float _532 = _522;
    float _534 = _532;
    if (!_476)
    {
        float _536 = _500 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _528 = _536;
    }
    float _538 = _528;
    float _540 = 0.0 + _518;
    float _542 = precise::clamp(_540, 0.0, 1.0);
    if (!_476)
    {
        float _544 = _502 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _534 = _544;
    }
    float _546 = _534;
    float _548 = _446 + _350;
    float _550 = _548 + _352;
    float _552 = _550 + _354;
    float _554 = fma(_364, 2.0, -1.0);
    float _556 = fma(_366, 2.0, -1.0);
    float _558 = _552 + _356;
    float _560 = fma(_316, _542, _538);
    float _562 = _558 + _358;
    float _564 = fma(_314, _542, _546);
    float _566 = -_314;
    float _568 = fma(_566, _542, _546);
    float _570 = _556 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float3 _1714 = float3(_276, _342, float(int(_256)));
    float3 _1716 = select(_1714, float3(0.0), isnan(_1714));
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1716.xy, uint(rint(_1716.z)), _320);
    float3 _1725 = float3(_338, _342, float(int(_256)));
    float3 _1727 = select(_1725, float3(0.0), isnan(_1725));
    float _574 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1727.xy, uint(rint(_1727.z)), _320);
    float3 _1736 = float3(_546, _560, float(int(_490)));
    float3 _1738 = select(_1736, float3(0.0), isnan(_1736));
    float _576 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1738.xy, uint(rint(_1738.z)), _542);
    float3 _1747 = float3(_564, _560, float(int(_490)));
    float3 _1749 = select(_1747, float3(0.0), isnan(_1747));
    float _578 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1749.xy, uint(rint(_1749.z)), _542);
    float3 _1758 = float3(_568, _560, float(int(_490)));
    float3 _1760 = select(_1758, float3(0.0), isnan(_1758));
    float _580 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1760.xy, uint(rint(_1760.z)), _542);
    float3 _1769 = float3(_564, _538, float(int(_490)));
    float3 _1771 = select(_1769, float3(0.0), isnan(_1769));
    float _582 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1771.xy, uint(rint(_1771.z)), _542);
    float _584 = _554 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _586 = fma(_570, 2.0, _54);
    float _588 = fma(_584, 2.0, _52);
    float3 _1790 = float3(_546, _538, float(int(_490)));
    float3 _1792 = select(_1790, float3(0.0), isnan(_1790));
    float _590 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1792.xy, uint(rint(_1792.z)), _542);
    float _592 = -_316;
    float _594 = fma(_592, _542, _538);
    float3 _1807 = float3(_568, _538, float(int(_490)));
    float3 _1809 = select(_1807, float3(0.0), isnan(_1807));
    float _596 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1809.xy, uint(rint(_1809.z)), _542);
    float3 _1818 = float3(_564, _594, float(int(_490)));
    float3 _1820 = select(_1818, float3(0.0), isnan(_1818));
    float _598 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1820.xy, uint(rint(_1820.z)), _542);
    float3 _1829 = float3(_546, _594, float(int(_490)));
    float3 _1831 = select(_1829, float3(0.0), isnan(_1829));
    float _600 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1831.xy, uint(rint(_1831.z)), _542);
    float3 _1840 = float3(_568, _594, float(int(_490)));
    float3 _1842 = select(_1840, float3(0.0), isnan(_1840));
    float _602 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1842.xy, uint(rint(_1842.z)), _542);
    float2 _1848 = float2(_588, _586);
    float _604 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1848, float2(0.0), isnan(_1848))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1848, float2(0.0), isnan(_1848))).x;
    float _606 = -_72;
    float _608 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _610 = _606 + _608;
    float _612 = _610 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _614 = precise::clamp(_612, 0.0, 1.0);
    float _616 = fma(_436, 0.111111111938953399658203125, _614);
    float _618 = -_72;
    float _620 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _622 = _618 + _620;
    float _624 = _622 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _626 = precise::clamp(_624, 0.0, 1.0);
    float _628 = _562 + _572;
    float _630 = _578 + _576;
    float _632 = _628 + _574;
    float _634 = _630 + _580;
    float _636 = _632 * 0.111111111938953399658203125;
    float _638 = _634 + _582;
    float _640 = _638 + _590;
    float _642 = _640 + _596;
    float _644 = _642 + _598;
    float _646 = _644 + _600;
    float _648 = _646 + _602;
    float _650 = _648 * 0.111111111938953399658203125;
    float _652 = _650 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _654 = fma(_636, (*spvDescriptorSet0.fp_c3)._m0[49].z, _652);
    float _656 = _626 + _654;
    out.m_45.x = _604;
    out.m_45.y = _616;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _656;
    return out;
}

