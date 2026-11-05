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
    float2 _498 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_498, float2(0.0), isnan(_498))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_498, float2(0.0), isnan(_498))).x;
    float _56 = in.m_40.y;
    float _58 = in.m_40.x;
    float _60 = -_54;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _56;
    float _68 = _64 * _58;
    float _70 = -_66;
    float _72 = _70 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _74 = -_68;
    float _76 = _74 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _78 = -_66;
    float _80 = _78 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _82 = _66 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _84 = _72 * _72;
    float _86 = -_64;
    float _88 = _86 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _90 = _80 * _80;
    float _92 = fma(_76, _76, _84);
    float _94 = -_68;
    float _96 = _94 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _98 = _66 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _100 = _66 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _102 = fma(_88, _88, _92);
    float _104 = -_64;
    float _106 = _104 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _108 = fma(_96, _96, _90);
    float _110 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].x, _82);
    float _112 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].x, _98);
    float _114 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].x, _100);
    float _116 = fma(_106, _106, _108);
    float _118 = sqrt(_102);
    float _120 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[30].z, _110);
    float _122 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[24].z, _112);
    float _124 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[33].z, _114);
    float _126 = _66 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _128 = _120 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _130 = _66 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _132 = sqrt(_116);
    float _134 = _66 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _136 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _138 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _140 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _142 = _66 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _144 = _66 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _146 = _66 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    bool _150 = _118 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _152 = _66 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    bool _154 = _118 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _156 = _66 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    bool _158 = !_150;
    int _161 = _158 ? 0 : 1;
    float _163 = _66 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _165 = _66 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _167 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].x, _126);
    bool _169 = _132 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _171 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].x, _130);
    bool _173 = _132 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _175 = _66 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _177 = !_169;
    int _179 = _177 ? 0 : 1;
    float _181 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].x, _163);
    int _183 = 2;
    int _185 = 2;
    float _187 = _128;
    if (!_150)
    {
        _183 = 1;
    }
    int _189 = _183;
    float _191 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].x, _165);
    int _193 = _189;
    if (!_154)
    {
        _193 = _161;
    }
    int _195 = _193;
    float _197 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[27].z, _167);
    float _199 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].x, _152);
    float _201 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].x, _156);
    float _203 = float(_195);
    float _205 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[20].z, _171);
    if (!_169)
    {
        _185 = 1;
    }
    int _207 = _185;
    float _209 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].x, _142);
    int _211 = _207;
    if (!_173)
    {
        _211 = _179;
    }
    int _213 = _211;
    float _215 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[28].z, _181);
    float _217 = precise::min(_203, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _219 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[29].z, _191);
    float _221 = _66 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    bool _223 = _217 != 1.0;
    bool _225 = isnan(_217);
    bool _227 = _223 || _225;
    bool _229 = isnan(1.0);
    bool _231 = _227 || _229;
    float _233 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _136);
    float _235 = float(_213);
    float _237 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].x, _221);
    bool _239 = _217 != 0.0;
    bool _241 = isnan(_217);
    bool _243 = _239 || _241;
    bool _245 = isnan(0.0);
    bool _247 = _243 || _245;
    float _249 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _138);
    float _251 = precise::min(_235, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _253 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[21].z, _237);
    float _255 = rint(_217);
    float _257 = precise::max(_255, 0.0);
    uint _260 = uint(_257);
    uint _262 = clamp(_260, 0u, 65535u);
    float _264 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].x, _144);
    bool _266 = _251 != 1.0;
    bool _268 = isnan(_251);
    bool _270 = _266 || _268;
    bool _272 = isnan(1.0);
    bool _274 = _270 || _272;
    float _276 = _253 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _278 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    bool _280 = _251 != 0.0;
    bool _282 = isnan(_251);
    bool _284 = _280 || _282;
    bool _286 = isnan(0.0);
    bool _288 = _284 || _286;
    float _290 = _276;
    if (_231)
    {
        float _292 = _122 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _290 = _292;
    }
    float _294 = _290;
    float _296 = _66 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _298 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _278);
    float _300 = rint(_251);
    float _302 = precise::max(_300, 0.0);
    uint _304 = uint(_302);
    uint _306 = clamp(_304, 0u, 65535u);
    float _308 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].x, _175);
    float _310 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].x, _134);
    float _312 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _298);
    float _314 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].x, _296);
    float _316 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _140);
    float _318 = _294;
    if (_274)
    {
        float _320 = _124 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _187 = _320;
    }
    float _322 = _187;
    float _324 = _66 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _326 = _66 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _328 = _312 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _330 = _322;
    if (!_288)
    {
        float _332 = _197 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _330 = _332;
    }
    float _334 = _330;
    float _336 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].x, _324);
    float _338 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].x, _326);
    float _340 = 1.0 / _328;
    float _342 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[31].z, _314);
    float _344 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].x, _146);
    float _346 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[32].z, _338);
    float _348 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[18].z, _310);
    float _350 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[23].z, _336);
    float _352 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[25].z, _199);
    float _354 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[26].z, _201);
    float _356 = _205 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _358 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[19].z, _209);
    float _360 = _215 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _362 = _219 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _364 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _233);
    float _366 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _249);
    float _368 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[22].z, _264);
    float _370 = _360;
    float _372 = _362;
    float _374 = _356;
    if (_274)
    {
        float _376 = _342 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _370 = _376;
    }
    float _378 = _370;
    float _380 = _378;
    if (_274)
    {
        float _382 = _346 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _372 = _382;
    }
    float _384 = _372;
    float _386 = _384;
    if (!_247)
    {
        float _388 = _348 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _318 = _388;
    }
    float _390 = _318;
    float _392 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _316);
    float _394 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[16].z, _344);
    float _396 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[17].z, _308);
    if (!_288)
    {
        float _398 = _352 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _380 = _398;
    }
    float _400 = _380;
    if (!_288)
    {
        float _402 = _354 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _386 = _402;
    }
    float _404 = _386;
    float _406 = 0.0 + _334;
    float _408 = precise::clamp(_406, 0.0, 1.0);
    float _410 = _358 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _412 = _364 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _414 = _366 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _416 = _410;
    if (_231)
    {
        float _418 = _368 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _416 = _418;
    }
    float _420 = _416;
    float _422 = _420;
    if (_231)
    {
        float _424 = _350 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _374 = _424;
    }
    float _426 = _374;
    float _428 = _392 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _430 = _426;
    if (!_247)
    {
        float _432 = _394 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _422 = _432;
    }
    float _434 = _422;
    if (!_247)
    {
        float _436 = _396 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _430 = _436;
    }
    float _438 = _430;
    float _440 = 0.0 + _390;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float3 _1229 = float3(_400, _404, float(int(_306)));
    float3 _1233 = select(_1229, float3(0.0), isnan(_1229));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1233.xy, uint(rint(_1233.z)), _408);
    float _446 = _412 * _340;
    float _448 = _414 * _340;
    float _450 = _428 * _340;
    float _452 = precise::clamp(_450, 0.0, 1.0);
    float3 _1253 = float3(_434, _438, float(int(_262)));
    float3 _1255 = select(_1253, float3(0.0), isnan(_1253));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1255.xy, uint(rint(_1255.z)), _442);
    float3 _1262 = float3(_446, _448, float(0));
    float3 _1264 = select(_1262, float3(0.0), isnan(_1262));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1264.xy, uint(rint(_1264.z)), _452);
    float2 _1270 = float2(_50, _52);
    float _458 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1270, float2(0.0), isnan(_1270))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1270, float2(0.0), isnan(_1270))).x;
    float _460 = -_64;
    float _462 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _464 = _460 + _462;
    float _466 = -_64;
    float _468 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _470 = _466 + _468;
    float _472 = _464 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _474 = precise::clamp(_472, 0.0, 1.0);
    float _476 = _470 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _478 = precise::clamp(_476, 0.0, 1.0);
    float _480 = _444 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _482 = fma(_454, (*spvDescriptorSet0.fp_c3)._m0[49].z, _480);
    float _484 = _474 + _456;
    float _486 = _478 + _482;
    out.m_43.x = _458;
    out.m_43.y = _484;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _486;
    return out;
}

