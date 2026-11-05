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
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _502 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_502, float2(0.0), isnan(_502))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_502, float2(0.0), isnan(_502))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _54;
    float _66 = _62 * _56;
    float _68 = -_64;
    float _70 = _68 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _72 = -_66;
    float _74 = _72 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _76 = -_64;
    float _78 = _76 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _80 = -_66;
    float _82 = _80 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _84 = _70 * _70;
    float _86 = -_62;
    float _88 = _86 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _90 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _92 = _64 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _94 = fma(_74, _74, _84);
    float _96 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _98 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _90);
    float _100 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].x, _92);
    float _102 = fma(_88, _88, _94);
    float _104 = _78 * _78;
    float _106 = -_62;
    float _108 = _106 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _110 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _98);
    float _112 = _64 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _114 = fma(_82, _82, _104);
    float _116 = sqrt(_102);
    float _118 = _110 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _120 = fma(_108, _108, _114);
    float _122 = _64 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _124 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _96);
    float _126 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _128 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _130 = 1.0 / _118;
    float _132 = _64 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _134 = _64 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _136 = _64 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _138 = _64 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _140 = _64 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _142 = _64 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _144 = _64 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _146 = sqrt(_120);
    bool _150 = _116 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _152 = _64 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    bool _154 = _116 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _156 = _64 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    bool _158 = !_150;
    int _161 = _158 ? 0 : 1;
    float _163 = _64 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _165 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].x, _112);
    float _167 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].x, _122);
    float _169 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _124);
    float _171 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _128);
    float _173 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[18].z, _165);
    float _175 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].x, _134);
    float _177 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].x, _136);
    int _179 = 2;
    if (!_150)
    {
        _179 = 1;
    }
    int _181 = _179;
    float _183 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].x, _138);
    bool _185 = _146 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _187 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].x, _140);
    bool _189 = _146 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _191 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].x, _144);
    int _193 = _181;
    if (!_154)
    {
        _193 = _161;
    }
    int _195 = _193;
    float _197 = _64 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _199 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].x, _152);
    float _201 = float(_195);
    float _203 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].x, _197);
    bool _205 = !_185;
    int _207 = _205 ? 0 : 1;
    float _209 = _64 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _211 = precise::min(_201, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _213 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[21].z, _203);
    int _215 = 2;
    if (!_185)
    {
        _215 = 1;
    }
    int _217 = _215;
    float _219 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].x, _209);
    int _221 = _217;
    if (!_189)
    {
        _221 = _207;
    }
    int _223 = _221;
    float _225 = _64 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    bool _227 = _211 != 1.0;
    bool _229 = isnan(_211);
    bool _231 = _227 || _229;
    bool _233 = isnan(1.0);
    bool _235 = _231 || _233;
    float _237 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[24].z, _219);
    float _239 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].x, _225);
    float _241 = _64 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _243 = _64 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _245 = float(_223);
    float _247 = _213 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _249 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].x, _132);
    float _251 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].x, _142);
    float _253 = precise::min(_245, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _255 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].x, _156);
    float _257 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].x, _243);
    float _259 = _247;
    if (_235)
    {
        float _261 = _237 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _259 = _261;
    }
    float _263 = _259;
    bool _265 = _253 != 1.0;
    bool _267 = isnan(_253);
    bool _269 = _265 || _267;
    bool _271 = isnan(1.0);
    bool _273 = _269 || _271;
    float _275 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _126);
    bool _277 = _253 != 0.0;
    bool _279 = isnan(_253);
    bool _281 = _277 || _279;
    bool _283 = isnan(0.0);
    bool _285 = _281 || _283;
    float _287 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].x, _163);
    float _289 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].x, _241);
    float _291 = _169 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    bool _293 = _211 != 0.0;
    bool _295 = isnan(_211);
    bool _297 = _293 || _295;
    bool _299 = isnan(0.0);
    bool _301 = _297 || _299;
    float _303 = rint(_253);
    float _305 = precise::max(_303, 0.0);
    uint _308 = uint(_305);
    uint _310 = clamp(_308, 0u, 65535u);
    float _312 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _275);
    float _314 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _171);
    float _316 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[30].z, _100);
    float _318 = _291 * _130;
    float _320 = precise::clamp(_318, 0.0, 1.0);
    float _322 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[33].z, _257);
    float _324 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[27].z, _239);
    float _326 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[19].z, _249);
    float _328 = rint(_211);
    float _330 = precise::max(_328, 0.0);
    uint _332 = uint(_330);
    uint _334 = clamp(_332, 0u, 65535u);
    float _336 = _312 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _338 = _314 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _340 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[28].z, _255);
    float _342 = _316 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _344 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[29].z, _167);
    float _346 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[31].z, _287);
    float _348 = _342;
    float _350 = _263;
    if (_273)
    {
        float _352 = _322 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _348 = _352;
    }
    float _354 = _348;
    float _356 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[23].z, _183);
    float _358 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[32].z, _289);
    float _360 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[25].z, _191);
    float _362 = _354;
    if (!_285)
    {
        float _364 = _324 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _362 = _364;
    }
    float _366 = _362;
    float _368 = _326 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _370 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[26].z, _199);
    float _372 = rint(_320);
    float _374 = precise::max(_372, 0.0);
    uint _376 = uint(_374);
    uint _378 = clamp(_376, 0u, 65535u);
    float _380 = _336 * _130;
    float _382 = _338 * _130;
    float _384 = _340 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _386 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[20].z, _177);
    float _388 = _344 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _390 = _384;
    float _392 = _388;
    float _394 = _368;
    if (_273)
    {
        float _396 = _346 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _390 = _396;
    }
    float _398 = _390;
    float _400 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[22].z, _175);
    float _402 = _398;
    if (_273)
    {
        float _404 = _358 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _392 = _404;
    }
    float _406 = _392;
    float _408 = _406;
    if (!_285)
    {
        float _410 = _360 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _402 = _410;
    }
    float _412 = _402;
    if (!_301)
    {
        float _414 = _173 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _350 = _414;
    }
    float _416 = _350;
    float _418 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[16].z, _187);
    float _420 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[17].z, _251);
    if (!_285)
    {
        float _422 = _370 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _408 = _422;
    }
    float _424 = _408;
    float _426 = 0.0 + _366;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = _386 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _432 = _430;
    if (_235)
    {
        float _434 = _400 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _394 = _434;
    }
    float _436 = _394;
    float _438 = _436;
    if (_235)
    {
        float _440 = _356 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _432 = _440;
    }
    float _442 = _432;
    float _444 = _442;
    if (!_301)
    {
        float _446 = _418 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _438 = _446;
    }
    float _448 = _438;
    if (!_301)
    {
        float _450 = _420 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _444 = _450;
    }
    float _452 = _444;
    float _454 = 0.0 + _416;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    float3 _1252 = float3(_412, _424, float(int(_310)));
    float3 _1256 = select(_1252, float3(0.0), isnan(_1252));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1256.xy, uint(rint(_1256.z)), _428);
    float3 _1265 = float3(_448, _452, float(int(_334)));
    float3 _1267 = select(_1265, float3(0.0), isnan(_1265));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1267.xy, uint(rint(_1267.z)), _456);
    float3 _1276 = float3(_380, _382, float(int(_378)));
    float3 _1278 = select(_1276, float3(0.0), isnan(_1276));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1278.xy, uint(rint(_1278.z)), 1.0);
    float _464 = -_62;
    float _466 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _468 = _464 + _466;
    float _470 = -_62;
    float _472 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _474 = _470 + _472;
    float _476 = _468 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _478 = precise::clamp(_476, 0.0, 1.0);
    float _480 = _474 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _482 = precise::clamp(_480, 0.0, 1.0);
    float _484 = _458 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _486 = fma(_460, (*spvDescriptorSet0.fp_c3)._m0[49].z, _484);
    float _488 = _478 + _462;
    float _490 = _482 + _486;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _488;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _490;
    return out;
}

