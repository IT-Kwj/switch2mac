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
    float2 _506 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_506, float2(0.0), isnan(_506))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_506, float2(0.0), isnan(_506))).x;
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
    float _92 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].x, _82);
    float _94 = fma(_76, _76, _84);
    float _96 = -_68;
    float _98 = _96 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _100 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[30].z, _92);
    float _102 = fma(_88, _88, _94);
    float _104 = -_64;
    float _106 = _104 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _108 = fma(_98, _98, _90);
    float _110 = _100 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _112 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _114 = _66 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _116 = fma(_106, _106, _108);
    float _118 = sqrt(_102);
    float _120 = _66 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _122 = _66 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _124 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _126 = _66 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _128 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].x, _120);
    float _130 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].x, _122);
    float _132 = sqrt(_116);
    float _134 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _124);
    float _136 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[24].z, _128);
    float _138 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[33].z, _130);
    float _140 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _142 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
    float _144 = _66 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _146 = _66 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    bool _150 = _118 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _152 = _66 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    bool _154 = _118 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _156 = _66 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _158 = !_150;
    int _161 = _158 ? 0 : 1;
    float _163 = _66 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _165 = _66 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _167 = _66 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    bool _169 = _132 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _171 = _66 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    bool _173 = _132 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _175 = _66 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _177 = !_169;
    int _179 = _177 ? 0 : 1;
    float _181 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].x, _126);
    int _183 = 2;
    int _185 = 2;
    float _187 = _110;
    if (!_150)
    {
        _183 = 1;
    }
    int _189 = _183;
    float _191 = _142 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    int _193 = _189;
    if (!_154)
    {
        _193 = _161;
    }
    int _195 = _193;
    float _197 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _140);
    float _199 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].x, _144);
    float _201 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].x, _171);
    float _203 = float(_195);
    float _205 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _197);
    if (!_169)
    {
        _185 = 1;
    }
    int _207 = _185;
    float _209 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].x, _165);
    int _211 = _207;
    if (!_173)
    {
        _211 = _179;
    }
    int _213 = _211;
    float _215 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _112);
    float _217 = precise::min(_203, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _219 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].x, _175);
    float _221 = _66 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _223 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _215);
    bool _225 = _217 != 1.0;
    bool _227 = isnan(_217);
    bool _229 = _225 || _227;
    bool _231 = isnan(1.0);
    bool _233 = _229 || _231;
    float _235 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].x, _114);
    float _237 = float(_213);
    float _239 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].x, _221);
    float _241 = _223 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    bool _243 = _217 != 0.0;
    bool _245 = isnan(_217);
    bool _247 = _243 || _245;
    bool _249 = isnan(0.0);
    bool _251 = _247 || _249;
    float _253 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].x, _167);
    float _255 = precise::min(_237, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _257 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[21].z, _239);
    float _259 = 1.0 / _241;
    float _261 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[27].z, _181);
    bool _263 = _255 != 1.0;
    bool _265 = isnan(_255);
    bool _267 = _263 || _265;
    bool _269 = isnan(1.0);
    bool _271 = _267 || _269;
    float _273 = _257 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _275 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _277 = _273;
    if (_233)
    {
        float _279 = _136 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _277 = _279;
    }
    float _281 = _277;
    bool _283 = _255 != 0.0;
    bool _285 = isnan(_255);
    bool _287 = _283 || _285;
    bool _289 = isnan(0.0);
    bool _291 = _287 || _289;
    float _293 = _66 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _295 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _275);
    float _297 = rint(_255);
    float _299 = precise::max(_297, 0.0);
    uint _302 = uint(_299);
    uint _304 = clamp(_302, 0u, 65535u);
    float _306 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].x, _163);
    float _308 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].x, _293);
    float _310 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _295);
    float _312 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].x, _146);
    float _314 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].x, _156);
    float _316 = _281;
    if (_271)
    {
        float _318 = _138 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _187 = _318;
    }
    float _320 = _187;
    float _322 = _66 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _324 = _66 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _326 = _310 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _328 = _191 * _259;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = rint(_217);
    float _334 = precise::max(_332, 0.0);
    uint _336 = uint(_334);
    uint _338 = clamp(_336, 0u, 65535u);
    float _340 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].x, _324);
    float _342 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[18].z, _235);
    float _344 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[28].z, _199);
    float _346 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[29].z, _201);
    float _348 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].x, _152);
    float _350 = _205 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _352 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[31].z, _308);
    float _354 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[32].z, _340);
    float _356 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].x, _322);
    float _358 = _320;
    if (!_291)
    {
        float _360 = _261 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _358 = _360;
    }
    float _362 = _358;
    float _364 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[25].z, _209);
    float _366 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[26].z, _253);
    float _368 = rint(_330);
    float _370 = precise::max(_368, 0.0);
    uint _372 = uint(_370);
    uint _374 = clamp(_372, 0u, 65535u);
    float _376 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[23].z, _306);
    if (!_251)
    {
        float _378 = _342 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _316 = _378;
    }
    float _380 = _316;
    float _382 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[19].z, _312);
    float _384 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[20].z, _314);
    float _386 = _344 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _388 = _346 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _390 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[22].z, _348);
    float _392 = _350 * _259;
    float _394 = _326 * _259;
    float _396 = _386;
    float _398 = _388;
    if (_271)
    {
        float _400 = _352 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _396 = _400;
    }
    float _402 = _396;
    float _404 = _402;
    if (_271)
    {
        float _406 = _354 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _398 = _406;
    }
    float _408 = _398;
    float _410 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[16].z, _356);
    float _412 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[17].z, _219);
    float _414 = _408;
    if (!_291)
    {
        float _416 = _364 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _404 = _416;
    }
    float _418 = _404;
    if (!_291)
    {
        float _420 = _366 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _414 = _420;
    }
    float _422 = _414;
    float _424 = 0.0 + _362;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = _382 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _430 = _384 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _432 = _428;
    float _434 = _430;
    if (_233)
    {
        float _436 = _390 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _432 = _436;
    }
    float _438 = _432;
    float _440 = _438;
    if (_233)
    {
        float _442 = _376 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _434 = _442;
    }
    float _444 = _434;
    float _446 = _444;
    if (!_251)
    {
        float _448 = _410 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _440 = _448;
    }
    float _450 = _440;
    if (!_251)
    {
        float _452 = _412 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _446 = _452;
    }
    float _454 = _446;
    float _456 = 0.0 + _380;
    float _458 = precise::clamp(_456, 0.0, 1.0);
    float3 _1256 = float3(_418, _422, float(int(_304)));
    float3 _1260 = select(_1256, float3(0.0), isnan(_1256));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1260.xy, uint(rint(_1260.z)), _426);
    float3 _1269 = float3(_450, _454, float(int(_338)));
    float3 _1271 = select(_1269, float3(0.0), isnan(_1269));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1271.xy, uint(rint(_1271.z)), _458);
    float3 _1280 = float3(_392, _394, float(int(_374)));
    float3 _1282 = select(_1280, float3(0.0), isnan(_1280));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1282.xy, uint(rint(_1282.z)), 1.0);
    float2 _1287 = float2(_50, _52);
    float _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1287, float2(0.0), isnan(_1287))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1287, float2(0.0), isnan(_1287))).x;
    float _468 = -_64;
    float _470 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _472 = _468 + _470;
    float _474 = -_64;
    float _476 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _478 = _474 + _476;
    float _480 = _472 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _482 = precise::clamp(_480, 0.0, 1.0);
    float _484 = _478 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _486 = precise::clamp(_484, 0.0, 1.0);
    float _488 = _460 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _490 = fma(_462, (*spvDescriptorSet0.fp_c3)._m0[49].z, _488);
    float _492 = _482 + _464;
    float _494 = _486 + _490;
    out.m_43.x = _466;
    out.m_43.y = _492;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _494;
    return out;
}

