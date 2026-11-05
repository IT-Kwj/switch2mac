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
    float2 _510 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_510, float2(0.0), isnan(_510))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_510, float2(0.0), isnan(_510))).x;
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
    float _102 = _70 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _104 = fma(_84, _84, _94);
    float _106 = _88 * _88;
    float _108 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[30].x, _100);
    float _110 = _70 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _112 = fma(_98, _98, _104);
    float _114 = fma(_92, _92, _106);
    float _116 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _108);
    float _118 = _70 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _120 = fma(_76, _76, _114);
    float _122 = sqrt(_112);
    float _124 = _116 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _126 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _128 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _130 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[24].x, _110);
    float _132 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[33].x, _118);
    float _134 = _70 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _136 = sqrt(_120);
    float _138 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _128);
    float _140 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _130);
    float _142 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _132);
    float _144 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _146 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _138);
    float _148 = _70 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _150 = _70 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    bool _154 = _122 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _156 = _70 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    bool _158 = _122 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _160 = _70 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _162 = !_154;
    int _165 = _162 ? 0 : 1;
    float _167 = _70 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _169 = _70 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _171 = _70 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    bool _173 = _136 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _175 = _70 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    bool _177 = _136 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _179 = _70 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _181 = !_173;
    int _183 = _181 ? 0 : 1;
    float _185 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[27].x, _134);
    int _187 = 2;
    int _189 = 2;
    float _191 = _124;
    if (!_154)
    {
        _187 = 1;
    }
    int _193 = _187;
    float _195 = _146 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    int _197 = _193;
    if (!_158)
    {
        _197 = _165;
    }
    int _199 = _197;
    float _201 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _144);
    float _203 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[28].x, _148);
    float _205 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[29].x, _175);
    float _207 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[25].x, _169);
    if (!_173)
    {
        _189 = 1;
    }
    int _209 = _189;
    float _211 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _201);
    int _213 = _209;
    if (!_177)
    {
        _213 = _183;
    }
    int _215 = _213;
    float _217 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[26].x, _171);
    float _219 = float(_199);
    float _221 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _126);
    float _223 = _70 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _225 = precise::min(_219, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _227 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _221);
    float _229 = float(_215);
    float _231 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[21].x, _223);
    bool _233 = _225 != 1.0;
    bool _235 = isnan(_225);
    bool _237 = _233 || _235;
    bool _239 = isnan(1.0);
    bool _241 = _237 || _239;
    float _243 = _227 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _245 = precise::min(_229, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _247 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _231);
    float _249 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[17].x, _179);
    float _251 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[18].x, _102);
    bool _253 = _245 != 1.0;
    bool _255 = isnan(_245);
    bool _257 = _253 || _255;
    bool _259 = isnan(1.0);
    bool _261 = _257 || _259;
    float _263 = 1.0 / _243;
    float _265 = _247 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _267 = _70 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    bool _269 = _245 != 0.0;
    bool _271 = isnan(_245);
    bool _273 = _269 || _271;
    bool _275 = isnan(0.0);
    bool _277 = _273 || _275;
    float _279 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _185);
    bool _281 = _225 != 0.0;
    bool _283 = isnan(_225);
    bool _285 = _281 || _283;
    bool _287 = isnan(0.0);
    bool _289 = _285 || _287;
    float _291 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _267);
    float _293 = _265;
    if (_241)
    {
        float _295 = _140 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _293 = _295;
    }
    float _297 = _293;
    float _299 = _70 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _301 = rint(_245);
    float _303 = precise::max(_301, 0.0);
    uint _306 = uint(_303);
    uint _308 = clamp(_306, 0u, 65535u);
    float _310 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _291);
    float _312 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[23].x, _167);
    float _314 = _297;
    if (_261)
    {
        float _316 = _142 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _191 = _316;
    }
    float _318 = _191;
    float _320 = _70 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _322 = _70 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _324 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[31].x, _299);
    float _326 = _310 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _328 = _195 * _263;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[32].x, _322);
    float _334 = rint(_225);
    float _336 = precise::max(_334, 0.0);
    uint _338 = uint(_336);
    uint _340 = clamp(_338, 0u, 65535u);
    float _342 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[19].x, _150);
    float _344 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[20].x, _160);
    float _346 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _251);
    float _348 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _203);
    float _350 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _205);
    float _352 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[22].x, _156);
    float _354 = _211 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _356 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _324);
    float _358 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _332);
    float _360 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[16].x, _320);
    float _362 = _318;
    if (!_277)
    {
        float _364 = _279 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _362 = _364;
    }
    float _366 = _362;
    float _368 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _207);
    float _370 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _217);
    float _372 = rint(_330);
    float _374 = precise::max(_372, 0.0);
    uint _376 = uint(_374);
    uint _378 = clamp(_376, 0u, 65535u);
    float _380 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _312);
    if (!_289)
    {
        float _382 = _346 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _314 = _382;
    }
    float _384 = _314;
    float _386 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _342);
    float _388 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _344);
    float _390 = _348 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _392 = _350 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _394 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _352);
    float _396 = _354 * _263;
    float _398 = _326 * _263;
    float _400 = _390;
    float _402 = _392;
    if (_261)
    {
        float _404 = _356 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _400 = _404;
    }
    float _406 = _400;
    float _408 = _406;
    if (_261)
    {
        float _410 = _358 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _402 = _410;
    }
    float _412 = _402;
    float _414 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _360);
    float _416 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _249);
    float _418 = _412;
    if (!_277)
    {
        float _420 = _368 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _408 = _420;
    }
    float _422 = _408;
    if (!_277)
    {
        float _424 = _370 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _418 = _424;
    }
    float _426 = _418;
    float _428 = 0.0 + _366;
    float _430 = precise::clamp(_428, 0.0, 1.0);
    float _432 = _386 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _434 = _388 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _436 = _432;
    float _438 = _434;
    if (_241)
    {
        float _440 = _394 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _436 = _440;
    }
    float _442 = _436;
    float _444 = _442;
    if (_241)
    {
        float _446 = _380 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _438 = _446;
    }
    float _448 = _438;
    float _450 = _448;
    if (!_289)
    {
        float _452 = _414 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _444 = _452;
    }
    float _454 = _444;
    if (!_289)
    {
        float _456 = _416 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _450 = _456;
    }
    float _458 = _450;
    float _460 = 0.0 + _384;
    float _462 = precise::clamp(_460, 0.0, 1.0);
    float3 _1264 = float3(_422, _426, float(int(_308)));
    float3 _1268 = select(_1264, float3(0.0), isnan(_1264));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1268.xy, uint(rint(_1268.z)), _430);
    float3 _1277 = float3(_454, _458, float(int(_340)));
    float3 _1279 = select(_1277, float3(0.0), isnan(_1277));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1279.xy, uint(rint(_1279.z)), _462);
    float3 _1288 = float3(_396, _398, float(int(_378)));
    float3 _1290 = select(_1288, float3(0.0), isnan(_1288));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1290.xy, uint(rint(_1290.z)), 1.0);
    float2 _1295 = float2(_50, _52);
    float _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1295, float2(0.0), isnan(_1295))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1295, float2(0.0), isnan(_1295))).x;
    float _472 = -_68;
    float _474 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _476 = _472 + _474;
    float _478 = -_68;
    float _480 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _482 = _478 + _480;
    float _484 = _476 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _486 = precise::clamp(_484, 0.0, 1.0);
    float _488 = _482 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _490 = precise::clamp(_488, 0.0, 1.0);
    float _492 = _464 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _494 = fma(_466, (*spvDescriptorSet0.fp_c3)._m0[49].z, _492);
    float _496 = _486 + _468;
    float _498 = _490 + _494;
    out.m_43.x = _470;
    out.m_43.y = _496;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _498;
    return out;
}

