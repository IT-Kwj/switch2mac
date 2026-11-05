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
    float2 _506 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_506, float2(0.0), isnan(_506))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_506, float2(0.0), isnan(_506))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _54;
    float _70 = _66 * _56;
    float _72 = -_66;
    float _74 = _72 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _76 = -_68;
    float _78 = _76 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _80 = -_70;
    float _82 = _80 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _84 = -_68;
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _88 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _90 = _78 * _78;
    float _92 = _68 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _94 = _86 * _86;
    float _96 = -_66;
    float _98 = _96 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _100 = fma(_82, _82, _90);
    float _102 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _88);
    float _104 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].x, _92);
    float _106 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _108 = fma(_74, _74, _100);
    float _110 = -_70;
    float _112 = _110 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _114 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _102);
    float _116 = _68 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _118 = _68 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _120 = fma(_112, _112, _94);
    float _122 = sqrt(_108);
    float _124 = _114 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _126 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _106);
    float _128 = fma(_98, _98, _120);
    float _130 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _132 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _134 = _68 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _136 = _68 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _138 = 1.0 / _124;
    float _140 = _68 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _142 = _68 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _144 = _68 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _146 = _68 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _148 = _68 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _150 = _68 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _152 = _68 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _154 = sqrt(_128);
    bool _158 = _122 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _160 = _68 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _162 = _122 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _164 = _68 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _166 = !_158;
    int _169 = _166 ? 0 : 1;
    float _171 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].x, _116);
    float _173 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].x, _118);
    float _175 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].x, _164);
    float _177 = _68 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _179 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _126);
    float _181 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _171);
    float _183 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _175);
    float _185 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _132);
    int _187 = 2;
    if (!_158)
    {
        _187 = 1;
    }
    int _189 = _187;
    float _191 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].x, _136);
    bool _193 = _154 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _195 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].x, _140);
    bool _197 = _154 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _199 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].x, _142);
    int _201 = _189;
    if (!_162)
    {
        _201 = _169;
    }
    int _203 = _201;
    float _205 = _68 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _207 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].x, _144);
    float _209 = float(_203);
    float _211 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].x, _205);
    bool _213 = !_193;
    int _215 = _213 ? 0 : 1;
    float _217 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].x, _148);
    float _219 = precise::min(_209, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _221 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _211);
    int _223 = 2;
    if (!_193)
    {
        _223 = 1;
    }
    int _225 = _223;
    float _227 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].x, _150);
    int _229 = _225;
    if (!_197)
    {
        _229 = _215;
    }
    int _231 = _229;
    float _233 = _68 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    bool _235 = _219 != 1.0;
    bool _237 = isnan(_219);
    bool _239 = _235 || _237;
    bool _241 = isnan(1.0);
    bool _243 = _239 || _241;
    float _245 = _68 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _247 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].x, _233);
    float _249 = _221 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _251 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].x, _134);
    float _253 = float(_231);
    float _255 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].x, _146);
    float _257 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].x, _245);
    float _259 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].x, _160);
    float _261 = precise::min(_253, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _263 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].x, _152);
    bool _265 = _219 != 0.0;
    bool _267 = isnan(_219);
    bool _269 = _265 || _267;
    bool _271 = isnan(0.0);
    bool _273 = _269 || _271;
    float _275 = _249;
    if (_243)
    {
        float _277 = _183 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _275 = _277;
    }
    float _279 = _275;
    bool _281 = _261 != 1.0;
    bool _283 = isnan(_261);
    bool _285 = _281 || _283;
    bool _287 = isnan(1.0);
    bool _289 = _285 || _287;
    float _291 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _130);
    bool _293 = _261 != 0.0;
    bool _295 = isnan(_261);
    bool _297 = _293 || _295;
    bool _299 = isnan(0.0);
    bool _301 = _297 || _299;
    float _303 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].x, _177);
    float _305 = _179 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _307 = rint(_261);
    float _309 = precise::max(_307, 0.0);
    uint _312 = uint(_309);
    uint _314 = clamp(_312, 0u, 65535u);
    float _316 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _291);
    float _318 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _185);
    float _320 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _104);
    float _322 = _305 * _138;
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float _326 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _257);
    float _328 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _247);
    float _330 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _251);
    float _332 = rint(_219);
    float _334 = precise::max(_332, 0.0);
    uint _336 = uint(_334);
    uint _338 = clamp(_336, 0u, 65535u);
    float _340 = _316 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _342 = _318 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _344 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _263);
    float _346 = _320 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _348 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _173);
    float _350 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _259);
    float _352 = _346;
    float _354 = _279;
    if (_289)
    {
        float _356 = _326 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _352 = _356;
    }
    float _358 = _352;
    float _360 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _199);
    float _362 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _303);
    float _364 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _217);
    float _366 = _358;
    if (!_301)
    {
        float _368 = _328 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _366 = _368;
    }
    float _370 = _366;
    float _372 = _330 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _374 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _227);
    float _376 = rint(_324);
    float _378 = precise::max(_376, 0.0);
    uint _380 = uint(_378);
    uint _382 = clamp(_380, 0u, 65535u);
    float _384 = _340 * _138;
    float _386 = _342 * _138;
    float _388 = _344 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _390 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _195);
    float _392 = _348 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _394 = _388;
    float _396 = _392;
    float _398 = _372;
    if (_289)
    {
        float _400 = _350 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _394 = _400;
    }
    float _402 = _394;
    float _404 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _191);
    float _406 = _402;
    if (_289)
    {
        float _408 = _362 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _396 = _408;
    }
    float _410 = _396;
    float _412 = _410;
    if (!_301)
    {
        float _414 = _364 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _406 = _414;
    }
    float _416 = _406;
    if (!_273)
    {
        float _418 = _181 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _354 = _418;
    }
    float _420 = _354;
    float _422 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _207);
    float _424 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _255);
    if (!_301)
    {
        float _426 = _374 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _412 = _426;
    }
    float _428 = _412;
    float _430 = 0.0 + _370;
    float _432 = precise::clamp(_430, 0.0, 1.0);
    float _434 = _390 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _436 = _434;
    if (_243)
    {
        float _438 = _404 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _398 = _438;
    }
    float _440 = _398;
    float _442 = _440;
    if (_243)
    {
        float _444 = _360 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _436 = _444;
    }
    float _446 = _436;
    float _448 = _446;
    if (!_273)
    {
        float _450 = _422 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _442 = _450;
    }
    float _452 = _442;
    if (!_273)
    {
        float _454 = _424 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _448 = _454;
    }
    float _456 = _448;
    float _458 = 0.0 + _420;
    float _460 = precise::clamp(_458, 0.0, 1.0);
    float3 _1260 = float3(_416, _428, float(int(_314)));
    float3 _1264 = select(_1260, float3(0.0), isnan(_1260));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1264.xy, uint(rint(_1264.z)), _432);
    float3 _1273 = float3(_452, _456, float(int(_338)));
    float3 _1275 = select(_1273, float3(0.0), isnan(_1273));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1275.xy, uint(rint(_1275.z)), _460);
    float3 _1284 = float3(_384, _386, float(int(_382)));
    float3 _1286 = select(_1284, float3(0.0), isnan(_1284));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1286.xy, uint(rint(_1286.z)), 1.0);
    float _468 = -_66;
    float _470 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _472 = _468 + _470;
    float _474 = -_66;
    float _476 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _478 = _474 + _476;
    float _480 = _472 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _482 = precise::clamp(_480, 0.0, 1.0);
    float _484 = _478 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _486 = precise::clamp(_484, 0.0, 1.0);
    float _488 = _462 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _490 = fma(_464, (*spvDescriptorSet0.fp_c3)._m0[49].z, _488);
    float _492 = _482 + _466;
    float _494 = _486 + _490;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _492;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _494;
    return out;
}

