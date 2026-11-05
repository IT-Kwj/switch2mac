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
    texture2d_array<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
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
    float2 _502 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_502, float2(0.0), isnan(_502))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_502, float2(0.0), isnan(_502))).x;
    float _56 = in.m_40.y;
    float _58 = in.m_40.x;
    float _60 = -_54;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = _68 * _56;
    float _72 = _68 * _58;
    float _74 = -_68;
    float _76 = _74 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _78 = -_70;
    float _80 = _78 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _82 = -_72;
    float _84 = _82 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _86 = -_70;
    float _88 = _86 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _90 = -_72;
    float _92 = _90 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _94 = _80 * _80;
    float _96 = -_68;
    float _98 = _96 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _100 = _70 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _102 = _70 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _104 = fma(_84, _84, _94);
    float _106 = _88 * _88;
    float _108 = _70 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _110 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[30].x, _100);
    float _112 = fma(_98, _98, _104);
    float _114 = fma(_92, _92, _106);
    float _116 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[24].x, _108);
    float _118 = fma(_76, _76, _114);
    float _120 = sqrt(_112);
    float _122 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[33].x, _102);
    float _124 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _110);
    float _126 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _116);
    float _128 = _70 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _130 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _122);
    float _132 = _124 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _134 = _70 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _136 = sqrt(_118);
    float _138 = _70 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _140 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _142 = _70 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _144 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _146 = _70 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _148 = _70 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _150 = _70 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    bool _154 = _120 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _156 = _70 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    bool _158 = _120 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _160 = _70 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    bool _162 = !_154;
    int _165 = _162 ? 0 : 1;
    float _167 = _70 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _169 = _70 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _171 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[27].x, _128);
    bool _173 = _136 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _175 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[20].x, _134);
    bool _177 = _136 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _179 = _70 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _181 = !_173;
    int _183 = _181 ? 0 : 1;
    float _185 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[28].x, _167);
    int _187 = 2;
    int _189 = 2;
    float _191 = _132;
    if (!_154)
    {
        _187 = 1;
    }
    int _193 = _187;
    float _195 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[29].x, _169);
    int _197 = _193;
    if (!_158)
    {
        _197 = _165;
    }
    int _199 = _197;
    float _201 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _171);
    float _203 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[25].x, _156);
    float _205 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[26].x, _160);
    float _207 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _175);
    if (!_173)
    {
        _189 = 1;
    }
    int _209 = _189;
    float _211 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[19].x, _146);
    int _213 = _209;
    if (!_177)
    {
        _213 = _183;
    }
    int _215 = _213;
    float _217 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _185);
    float _219 = float(_199);
    float _221 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _195);
    float _223 = _70 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _225 = precise::min(_219, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _227 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _140);
    float _229 = float(_215);
    float _231 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[21].x, _223);
    bool _233 = _225 != 1.0;
    bool _235 = isnan(_225);
    bool _237 = _233 || _235;
    bool _239 = isnan(1.0);
    bool _241 = _237 || _239;
    float _243 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _142);
    float _245 = precise::min(_229, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _247 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _231);
    bool _249 = _225 != 0.0;
    bool _251 = isnan(_225);
    bool _253 = _249 || _251;
    bool _255 = isnan(0.0);
    bool _257 = _253 || _255;
    float _259 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[22].x, _148);
    bool _261 = _245 != 1.0;
    bool _263 = isnan(_245);
    bool _265 = _261 || _263;
    bool _267 = isnan(1.0);
    bool _269 = _265 || _267;
    float _271 = _247 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _273 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    bool _275 = _245 != 0.0;
    bool _277 = isnan(_245);
    bool _279 = _275 || _277;
    bool _281 = isnan(0.0);
    bool _283 = _279 || _281;
    float _285 = rint(_225);
    float _287 = precise::max(_285, 0.0);
    uint _290 = uint(_287);
    uint _292 = clamp(_290, 0u, 65535u);
    float _294 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _144);
    float _296 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _273);
    float _298 = _271;
    if (_241)
    {
        float _300 = _126 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _298 = _300;
    }
    float _302 = _298;
    float _304 = _70 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _306 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[17].x, _179);
    float _308 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _296);
    float _310 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[18].x, _138);
    float _312 = rint(_245);
    float _314 = precise::max(_312, 0.0);
    uint _316 = uint(_314);
    uint _318 = clamp(_316, 0u, 65535u);
    float _320 = _302;
    if (_269)
    {
        float _322 = _130 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _191 = _322;
    }
    float _324 = _191;
    float _326 = _70 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _328 = _70 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _330 = _308 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _332 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[31].x, _304);
    float _334 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[23].x, _326);
    float _336 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[32].x, _328);
    float _338 = 1.0 / _330;
    float _340 = _324;
    if (!_283)
    {
        float _342 = _201 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _340 = _342;
    }
    float _344 = _340;
    float _346 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _332);
    float _348 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _336);
    float _350 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[16].x, _150);
    float _352 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _310);
    float _354 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _334);
    float _356 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _203);
    float _358 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _205);
    float _360 = _207 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _362 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _211);
    float _364 = _217 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _366 = _221 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _368 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _227);
    float _370 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _243);
    float _372 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _259);
    float _374 = _364;
    float _376 = _366;
    float _378 = _360;
    if (_269)
    {
        float _380 = _346 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _374 = _380;
    }
    float _382 = _374;
    float _384 = _382;
    if (_269)
    {
        float _386 = _348 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _376 = _386;
    }
    float _388 = _376;
    float _390 = _388;
    if (!_257)
    {
        float _392 = _352 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _320 = _392;
    }
    float _394 = _320;
    float _396 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _294);
    float _398 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _350);
    float _400 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _306);
    if (!_283)
    {
        float _402 = _356 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _384 = _402;
    }
    float _404 = _384;
    if (!_283)
    {
        float _406 = _358 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _390 = _406;
    }
    float _408 = _390;
    float _410 = 0.0 + _344;
    float _412 = precise::clamp(_410, 0.0, 1.0);
    float _414 = _362 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _416 = _368 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _418 = _370 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _420 = _414;
    if (_241)
    {
        float _422 = _372 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _420 = _422;
    }
    float _424 = _420;
    float _426 = _424;
    if (_241)
    {
        float _428 = _354 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _378 = _428;
    }
    float _430 = _378;
    float _432 = _396 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _434 = _430;
    if (!_257)
    {
        float _436 = _398 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _426 = _436;
    }
    float _438 = _426;
    if (!_257)
    {
        float _440 = _400 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _434 = _440;
    }
    float _442 = _434;
    float _444 = 0.0 + _394;
    float _446 = precise::clamp(_444, 0.0, 1.0);
    float3 _1237 = float3(_404, _408, float(int(_318)));
    float3 _1241 = select(_1237, float3(0.0), isnan(_1237));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1241.xy, uint(rint(_1241.z)), _412);
    float _450 = _416 * _338;
    float _452 = _418 * _338;
    float _454 = _432 * _338;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    float3 _1261 = float3(_438, _442, float(int(_292)));
    float3 _1263 = select(_1261, float3(0.0), isnan(_1261));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1263.xy, uint(rint(_1263.z)), _446);
    float3 _1270 = float3(_450, _452, float(0));
    float3 _1272 = select(_1270, float3(0.0), isnan(_1270));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1272.xy, uint(rint(_1272.z)), _456);
    float2 _1278 = float2(_50, _52);
    float _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1278, float2(0.0), isnan(_1278))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1278, float2(0.0), isnan(_1278))).x;
    float _464 = -_68;
    float _466 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _468 = _464 + _466;
    float _470 = -_68;
    float _472 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _474 = _470 + _472;
    float _476 = _468 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _478 = precise::clamp(_476, 0.0, 1.0);
    float _480 = _474 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _482 = precise::clamp(_480, 0.0, 1.0);
    float _484 = _448 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _486 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[49].z, _484);
    float _488 = _478 + _460;
    float _490 = _482 + _486;
    out.m_43.x = _462;
    out.m_43.y = _488;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _490;
    return out;
}

