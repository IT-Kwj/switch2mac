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
    float2 _494 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_494, float2(0.0), isnan(_494))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_494, float2(0.0), isnan(_494))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _54;
    float _66 = _62 * _56;
    float _68 = -_62;
    float _70 = _68 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _72 = -_64;
    float _74 = _72 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _76 = -_66;
    float _78 = _76 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _80 = -_64;
    float _82 = _80 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _84 = -_66;
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _88 = _74 * _74;
    float _90 = _64 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _92 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _94 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _96 = fma(_78, _78, _88);
    float _98 = _82 * _82;
    float _100 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].x, _90);
    float _102 = fma(_70, _70, _96);
    float _104 = -_62;
    float _106 = _104 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _108 = fma(_86, _86, _98);
    float _110 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[30].z, _100);
    float _112 = _64 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _114 = fma(_106, _106, _108);
    float _116 = sqrt(_102);
    float _118 = _110 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _120 = _64 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _122 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _94);
    float _124 = _64 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _126 = _64 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _128 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].x, _120);
    float _130 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _132 = sqrt(_114);
    float _134 = _64 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _136 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[33].z, _128);
    float _138 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _140 = _64 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _142 = _64 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _144 = _64 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _146 = _64 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _150 = _116 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _152 = _64 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _154 = _116 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _156 = _64 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    bool _158 = !_150;
    int _161 = _158 ? 0 : 1;
    float _163 = _64 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _165 = _64 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _167 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].x, _124);
    bool _169 = _132 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _171 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].x, _126);
    bool _173 = _132 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _175 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _138);
    bool _177 = !_169;
    int _179 = _177 ? 0 : 1;
    float _181 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[18].z, _167);
    int _183 = 2;
    int _185 = 2;
    float _187 = _118;
    if (!_150)
    {
        _183 = 1;
    }
    int _189 = _183;
    float _191 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].x, _165);
    int _193 = _189;
    if (!_154)
    {
        _193 = _161;
    }
    int _195 = _193;
    float _197 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _122);
    float _199 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _175);
    float _201 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].x, _142);
    float _203 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].x, _146);
    if (!_169)
    {
        _185 = 1;
    }
    int _205 = _185;
    float _207 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].x, _144);
    int _209 = _205;
    if (!_173)
    {
        _209 = _179;
    }
    int _211 = _209;
    float _213 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].x, _156);
    float _215 = float(_195);
    float _217 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].x, _112);
    float _219 = _64 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _221 = precise::min(_215, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _223 = _64 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _225 = float(_211);
    float _227 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].x, _219);
    bool _229 = _221 != 1.0;
    bool _231 = isnan(_221);
    bool _233 = _229 || _231;
    bool _235 = isnan(1.0);
    bool _237 = _233 || _235;
    float _239 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].x, _223);
    float _241 = precise::min(_225, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _243 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[21].z, _227);
    bool _245 = _221 != 0.0;
    bool _247 = isnan(_221);
    bool _249 = _245 || _247;
    bool _251 = isnan(0.0);
    bool _253 = _249 || _251;
    float _255 = _64 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _257 = _241 != 1.0;
    bool _259 = isnan(_241);
    bool _261 = _257 || _259;
    bool _263 = isnan(1.0);
    bool _265 = _261 || _263;
    float _267 = _243 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _269 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _92);
    bool _271 = _241 != 0.0;
    bool _273 = isnan(_241);
    bool _275 = _271 || _273;
    bool _277 = isnan(0.0);
    bool _279 = _275 || _277;
    float _281 = _64 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _283 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[24].z, _217);
    float _285 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _269);
    float _287 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].x, _134);
    float _289 = rint(_241);
    float _291 = precise::max(_289, 0.0);
    uint _294 = uint(_291);
    uint _296 = clamp(_294, 0u, 65535u);
    float _298 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].x, _140);
    float _300 = _285 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _302 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[27].z, _171);
    float _304 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].x, _255);
    float _306 = _267;
    if (_265)
    {
        float _308 = _136 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _187 = _308;
    }
    float _310 = _187;
    float _312 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _130);
    float _314 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].x, _281);
    float _316 = 1.0 / _300;
    float _318 = _310;
    if (_237)
    {
        float _320 = _283 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _306 = _320;
    }
    float _322 = _306;
    float _324 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _312);
    float _326 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].x, _152);
    float _328 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[28].z, _298);
    float _330 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[29].z, _239);
    float _332 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[31].z, _304);
    float _334 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[32].z, _314);
    float _336 = rint(_221);
    float _338 = precise::max(_336, 0.0);
    uint _340 = uint(_338);
    uint _342 = clamp(_340, 0u, 65535u);
    float _344 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].x, _163);
    float _346 = _322;
    if (!_279)
    {
        float _348 = _302 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _318 = _348;
    }
    float _350 = _318;
    float _352 = _324 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _354 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[25].z, _191);
    float _356 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[26].z, _287);
    if (!_253)
    {
        float _358 = _181 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _346 = _358;
    }
    float _360 = _346;
    float _362 = _197 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _364 = _199 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _366 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[23].z, _326);
    float _368 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[19].z, _201);
    float _370 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[20].z, _203);
    float _372 = _328 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _374 = _330 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _376 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[22].z, _207);
    float _378 = _372;
    float _380 = _374;
    if (_265)
    {
        float _382 = _332 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _378 = _382;
    }
    float _384 = _378;
    float _386 = _384;
    if (_265)
    {
        float _388 = _334 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _380 = _388;
    }
    float _390 = _380;
    float _392 = _352 * _316;
    float _394 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[16].z, _213);
    float _396 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[17].z, _344);
    float _398 = _390;
    if (!_279)
    {
        float _400 = _354 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _386 = _400;
    }
    float _402 = _386;
    if (!_279)
    {
        float _404 = _356 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _398 = _404;
    }
    float _406 = _398;
    float _408 = 0.0 + _350;
    float _410 = precise::clamp(_408, 0.0, 1.0);
    float _412 = _362 * _316;
    float _414 = _364 * _316;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = _368 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _420 = _370 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _422 = _418;
    float _424 = _420;
    if (_237)
    {
        float _426 = _376 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _422 = _426;
    }
    float _428 = _422;
    float _430 = _428;
    if (_237)
    {
        float _432 = _366 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _424 = _432;
    }
    float _434 = _424;
    float _436 = _434;
    if (!_253)
    {
        float _438 = _394 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _430 = _438;
    }
    float _440 = _430;
    if (!_253)
    {
        float _442 = _396 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _436 = _442;
    }
    float _444 = _436;
    float _446 = 0.0 + _360;
    float _448 = precise::clamp(_446, 0.0, 1.0);
    float3 _1236 = float3(_402, _406, float(int(_296)));
    float3 _1240 = select(_1236, float3(0.0), isnan(_1236));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1240.xy, uint(rint(_1240.z)), _410);
    float3 _1249 = float3(_440, _444, float(int(_342)));
    float3 _1251 = select(_1249, float3(0.0), isnan(_1249));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1251.xy, uint(rint(_1251.z)), _448);
    float3 _1258 = float3(_412, _392, float(0));
    float3 _1260 = select(_1258, float3(0.0), isnan(_1258));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1260.xy, uint(rint(_1260.z)), _416);
    float _456 = -_62;
    float _458 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _460 = _456 + _458;
    float _462 = -_62;
    float _464 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _466 = _462 + _464;
    float _468 = _460 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _470 = precise::clamp(_468, 0.0, 1.0);
    float _472 = _466 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _474 = precise::clamp(_472, 0.0, 1.0);
    float _476 = _450 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _478 = fma(_452, (*spvDescriptorSet0.fp_c3)._m0[49].z, _476);
    float _480 = _470 + _454;
    float _482 = _474 + _478;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _480;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _482;
    return out;
}

