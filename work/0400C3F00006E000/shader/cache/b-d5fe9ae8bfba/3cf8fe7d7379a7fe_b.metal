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
    float2 _498 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_498, float2(0.0), isnan(_498))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_498, float2(0.0), isnan(_498))).x;
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
    float _84 = -_70;
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _88 = _68 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _90 = _78 * _78;
    float _92 = -_68;
    float _94 = _92 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _96 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _98 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _100 = fma(_82, _82, _90);
    float _102 = _94 * _94;
    float _104 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].x, _88);
    float _106 = fma(_74, _74, _100);
    float _108 = -_66;
    float _110 = _108 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _112 = fma(_86, _86, _102);
    float _114 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _104);
    float _116 = _68 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _118 = fma(_110, _110, _112);
    float _120 = sqrt(_106);
    float _122 = _114 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _124 = _68 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _126 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _98);
    float _128 = _68 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _130 = _68 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _132 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].x, _124);
    float _134 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _136 = sqrt(_118);
    float _138 = _68 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _140 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _132);
    float _142 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _144 = _68 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _146 = _68 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _148 = _68 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _150 = _68 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _154 = _120 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _156 = _68 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _158 = _120 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _160 = _68 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    bool _162 = !_154;
    int _165 = _162 ? 0 : 1;
    float _167 = _68 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _169 = _68 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _171 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].x, _128);
    bool _173 = _136 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _175 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].x, _130);
    bool _177 = _136 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _179 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _142);
    bool _181 = !_173;
    int _183 = _181 ? 0 : 1;
    float _185 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _171);
    int _187 = 2;
    int _189 = 2;
    float _191 = _122;
    if (!_154)
    {
        _187 = 1;
    }
    int _193 = _187;
    float _195 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].x, _169);
    int _197 = _193;
    if (!_158)
    {
        _197 = _165;
    }
    int _199 = _197;
    float _201 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _126);
    float _203 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _179);
    float _205 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].x, _146);
    float _207 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].x, _150);
    if (!_173)
    {
        _189 = 1;
    }
    int _209 = _189;
    float _211 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].x, _148);
    int _213 = _209;
    if (!_177)
    {
        _213 = _183;
    }
    int _215 = _213;
    float _217 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].x, _160);
    float _219 = float(_199);
    float _221 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].x, _116);
    float _223 = _68 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _225 = precise::min(_219, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _227 = _68 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _229 = float(_215);
    float _231 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].x, _223);
    bool _233 = _225 != 1.0;
    bool _235 = isnan(_225);
    bool _237 = _233 || _235;
    bool _239 = isnan(1.0);
    bool _241 = _237 || _239;
    float _243 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].x, _227);
    float _245 = precise::min(_229, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _247 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _231);
    bool _249 = _225 != 0.0;
    bool _251 = isnan(_225);
    bool _253 = _249 || _251;
    bool _255 = isnan(0.0);
    bool _257 = _253 || _255;
    float _259 = _68 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _261 = _245 != 1.0;
    bool _263 = isnan(_245);
    bool _265 = _261 || _263;
    bool _267 = isnan(1.0);
    bool _269 = _265 || _267;
    float _271 = _247 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _273 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _96);
    bool _275 = _245 != 0.0;
    bool _277 = isnan(_245);
    bool _279 = _275 || _277;
    bool _281 = isnan(0.0);
    bool _283 = _279 || _281;
    float _285 = _68 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _287 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _221);
    float _289 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _273);
    float _291 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].x, _138);
    float _293 = rint(_245);
    float _295 = precise::max(_293, 0.0);
    uint _298 = uint(_295);
    uint _300 = clamp(_298, 0u, 65535u);
    float _302 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].x, _144);
    float _304 = _289 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _306 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _175);
    float _308 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].x, _259);
    float _310 = _271;
    if (_269)
    {
        float _312 = _140 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _191 = _312;
    }
    float _314 = _191;
    float _316 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _134);
    float _318 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].x, _285);
    float _320 = 1.0 / _304;
    float _322 = _314;
    if (_241)
    {
        float _324 = _287 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _310 = _324;
    }
    float _326 = _310;
    float _328 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _316);
    float _330 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].x, _156);
    float _332 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _302);
    float _334 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _243);
    float _336 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _308);
    float _338 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _318);
    float _340 = rint(_225);
    float _342 = precise::max(_340, 0.0);
    uint _344 = uint(_342);
    uint _346 = clamp(_344, 0u, 65535u);
    float _348 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].x, _167);
    float _350 = _326;
    if (!_283)
    {
        float _352 = _306 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _322 = _352;
    }
    float _354 = _322;
    float _356 = _328 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _358 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _195);
    float _360 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _291);
    if (!_257)
    {
        float _362 = _185 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _350 = _362;
    }
    float _364 = _350;
    float _366 = _201 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _368 = _203 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _370 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _330);
    float _372 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _205);
    float _374 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _207);
    float _376 = _332 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _378 = _334 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _380 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _211);
    float _382 = _376;
    float _384 = _378;
    if (_269)
    {
        float _386 = _336 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _382 = _386;
    }
    float _388 = _382;
    float _390 = _388;
    if (_269)
    {
        float _392 = _338 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _384 = _392;
    }
    float _394 = _384;
    float _396 = _356 * _320;
    float _398 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _217);
    float _400 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _348);
    float _402 = _394;
    if (!_283)
    {
        float _404 = _358 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _390 = _404;
    }
    float _406 = _390;
    if (!_283)
    {
        float _408 = _360 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _402 = _408;
    }
    float _410 = _402;
    float _412 = 0.0 + _354;
    float _414 = precise::clamp(_412, 0.0, 1.0);
    float _416 = _366 * _320;
    float _418 = _368 * _320;
    float _420 = precise::clamp(_418, 0.0, 1.0);
    float _422 = _372 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _424 = _374 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _426 = _422;
    float _428 = _424;
    if (_241)
    {
        float _430 = _380 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _426 = _430;
    }
    float _432 = _426;
    float _434 = _432;
    if (_241)
    {
        float _436 = _370 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _428 = _436;
    }
    float _438 = _428;
    float _440 = _438;
    if (!_257)
    {
        float _442 = _398 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _434 = _442;
    }
    float _444 = _434;
    if (!_257)
    {
        float _446 = _400 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _440 = _446;
    }
    float _448 = _440;
    float _450 = 0.0 + _364;
    float _452 = precise::clamp(_450, 0.0, 1.0);
    float3 _1244 = float3(_406, _410, float(int(_300)));
    float3 _1248 = select(_1244, float3(0.0), isnan(_1244));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1248.xy, uint(rint(_1248.z)), _414);
    float3 _1257 = float3(_444, _448, float(int(_346)));
    float3 _1259 = select(_1257, float3(0.0), isnan(_1257));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1259.xy, uint(rint(_1259.z)), _452);
    float3 _1266 = float3(_416, _396, float(0));
    float3 _1268 = select(_1266, float3(0.0), isnan(_1266));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1268.xy, uint(rint(_1268.z)), _420);
    float _460 = -_66;
    float _462 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _464 = _460 + _462;
    float _466 = -_66;
    float _468 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _470 = _466 + _468;
    float _472 = _464 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _474 = precise::clamp(_472, 0.0, 1.0);
    float _476 = _470 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _478 = precise::clamp(_476, 0.0, 1.0);
    float _480 = _454 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _482 = fma(_456, (*spvDescriptorSet0.fp_c3)._m0[49].z, _480);
    float _484 = _474 + _458;
    float _486 = _478 + _482;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _484;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _486;
    return out;
}

