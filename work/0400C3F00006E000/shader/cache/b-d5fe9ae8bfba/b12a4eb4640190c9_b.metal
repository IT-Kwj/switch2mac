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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_12 [[id(5)]];
    sampler fp_t_tcb_12Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
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
    float2 _531 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_531, float2(0.0), isnan(_531))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_531, float2(0.0), isnan(_531))).x;
    float2 _542 = float2(_52, _54);
    float2 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_542, float2(0.0), isnan(_542))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_542, float2(0.0), isnan(_542))).xy;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = in.m_42.y;
    float _68 = in.m_42.x;
    float _70 = -_56;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _74 = 1.0 / _72;
    float _76 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _78 = _74 * _76;
    float _80 = _78 * _66;
    float _82 = _78 * _68;
    float _84 = -_78;
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _88 = -_80;
    float _90 = _88 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _92 = -_82;
    float _94 = _92 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _96 = -_80;
    float _98 = _96 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _100 = _80 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _102 = _90 * _90;
    float _104 = _80 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _106 = _98 * _98;
    float _108 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[30].x, _100);
    float _110 = fma(_94, _94, _102);
    float _112 = -_82;
    float _114 = _112 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _116 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[33].x, _104);
    float _118 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[30].z, _108);
    float _120 = fma(_86, _86, _110);
    float _122 = fma(_114, _114, _106);
    float _124 = -_78;
    float _126 = _124 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _128 = _80 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _130 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[33].z, _116);
    float _132 = sqrt(_120);
    float _134 = fma(_126, _126, _122);
    float _136 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[2].x, _128);
    float _138 = _80 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _140 = _80 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _142 = _80 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _144 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].z, _136);
    float _146 = _80 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _148 = sqrt(_134);
    float _150 = _80 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _152 = _80 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _154 = _80 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _156 = _80 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _158 = _80 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _160 = _80 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _162 = _80 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    bool _166 = _132 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _168 = _80 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _170 = _132 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _172 = _144 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    bool _174 = !_166;
    int _177 = _174 ? 0 : 1;
    float _179 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[0].x, _140);
    float _181 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[1].x, _142);
    float _183 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[19].x, _146);
    bool _185 = _148 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _187 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[22].x, _150);
    bool _189 = _148 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _191 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[16].x, _154);
    bool _193 = !_185;
    int _195 = _193 ? 0 : 1;
    float _197 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[17].x, _156);
    int _199 = 2;
    int _201 = 2;
    if (!_166)
    {
        _199 = 1;
    }
    int _203 = _199;
    float _205 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[25].x, _158);
    int _207 = _203;
    if (!_170)
    {
        _207 = _177;
    }
    int _209 = _207;
    float _211 = _80 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _213 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[28].x, _160);
    float _215 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[29].x, _162);
    float _217 = float(_209);
    float _219 = _80 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _221 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[21].x, _211);
    if (!_185)
    {
        _201 = 1;
    }
    int _223 = _201;
    float _225 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[31].x, _168);
    float _227 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[24].x, _219);
    float _229 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[21].z, _221);
    int _231 = _223;
    if (!_189)
    {
        _231 = _195;
    }
    int _233 = _231;
    float _235 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[29].z, _215);
    float _237 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[24].z, _227);
    float _239 = _229 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _241 = _118 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _243 = _80 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _245 = float(_233);
    float _247 = _80 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _249 = precise::min(_217, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _251 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[3].x, _243);
    float _253 = precise::min(_245, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _255 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[18].x, _247);
    bool _257 = _249 != 1.0;
    bool _259 = isnan(_249);
    bool _261 = _257 || _259;
    bool _263 = isnan(1.0);
    bool _265 = _261 || _263;
    float _267 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[3].z, _251);
    bool _269 = _253 != 1.0;
    bool _271 = isnan(_253);
    bool _273 = _269 || _271;
    bool _275 = isnan(1.0);
    bool _277 = _273 || _275;
    float _279 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[18].z, _255);
    bool _281 = _249 != 0.0;
    bool _283 = isnan(_249);
    bool _285 = _281 || _283;
    bool _287 = isnan(0.0);
    bool _289 = _285 || _287;
    float _291 = _267 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    bool _293 = _253 != 0.0;
    bool _295 = isnan(_253);
    bool _297 = _293 || _295;
    bool _299 = isnan(0.0);
    bool _301 = _297 || _299;
    float _303 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[20].x, _138);
    float _305 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[23].x, _152);
    float _307 = rint(_253);
    float _309 = precise::max(_307, 0.0);
    uint _312 = uint(_309);
    uint _314 = clamp(_312, 0u, 65535u);
    float _316 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[28].z, _213);
    float _318 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[31].z, _225);
    float _320 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[25].z, _205);
    float _322 = _239;
    float _324 = _241;
    if (_265)
    {
        float _326 = _237 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _322 = _326;
    }
    float _328 = _322;
    float _330 = _80 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _332 = _328;
    if (_277)
    {
        float _334 = _130 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _324 = _334;
    }
    float _336 = _324;
    float _338 = _80 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _340 = 1.0 / _291;
    float _342 = _80 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _344 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[27].x, _330);
    float _346 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[26].x, _338);
    float _348 = _336;
    if (!_289)
    {
        float _350 = _279 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _332 = _350;
    }
    float _352 = _332;
    float _354 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[32].x, _342);
    float _356 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[27].z, _344);
    float _358 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[26].z, _346);
    float _360 = rint(_249);
    float _362 = precise::max(_360, 0.0);
    uint _364 = uint(_362);
    uint _366 = clamp(_364, 0u, 65535u);
    float _368 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[32].z, _354);
    if (!_301)
    {
        float _370 = _356 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _348 = _370;
    }
    float _372 = _348;
    float _374 = _235 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _376 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[20].z, _303);
    float _378 = _374;
    if (_277)
    {
        float _380 = _368 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _378 = _380;
    }
    float _382 = _378;
    float _384 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[0].z, _179);
    float _386 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[23].z, _305);
    float _388 = _172 * _340;
    float _390 = precise::clamp(_388, 0.0, 1.0);
    float _392 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[1].z, _181);
    float _394 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[19].z, _183);
    float _396 = _316 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _398 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[17].z, _197);
    float _400 = rint(_390);
    float _402 = precise::max(_400, 0.0);
    uint _404 = uint(_402);
    uint _406 = clamp(_404, 0u, 65535u);
    float _408 = _382;
    float _410 = _396;
    if (!_301)
    {
        float _412 = _358 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _408 = _412;
    }
    float _414 = _408;
    float _416 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[22].z, _187);
    if (_277)
    {
        float _418 = _318 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _410 = _418;
    }
    float _420 = _410;
    float _422 = _376 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _424 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[16].z, _191);
    float _426 = _420;
    float _428 = _422;
    if (!_301)
    {
        float _430 = _320 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _426 = _430;
    }
    float _432 = _426;
    float _434 = 0.0 + _372;
    float _436 = precise::clamp(_434, 0.0, 1.0);
    float _438 = _384 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    if (_265)
    {
        float _440 = _386 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _428 = _440;
    }
    float _442 = _428;
    float _444 = _392 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _446 = _394 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _448 = _442;
    float _450 = _446;
    if (!_289)
    {
        float _452 = _398 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _448 = _452;
    }
    float _454 = _448;
    float _456 = fma(_62, 2.0, -1.0);
    if (_265)
    {
        float _458 = _416 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _450 = _458;
    }
    float _460 = _450;
    float _462 = _460;
    if (!_289)
    {
        float _464 = _424 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _462 = _464;
    }
    float _466 = _462;
    float _468 = fma(_64, 2.0, -1.0);
    float _470 = 0.0 + _352;
    float _472 = precise::clamp(_470, 0.0, 1.0);
    float3 _1297 = float3(_432, _414, float(int(_314)));
    float3 _1301 = select(_1297, float3(0.0), isnan(_1297));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1301.xy, uint(rint(_1301.z)), _436);
    float _476 = _438 * _340;
    float _478 = _444 * _340;
    float _480 = _456 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _482 = _468 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float3 _1325 = float3(_466, _454, float(int(_366)));
    float3 _1327 = select(_1325, float3(0.0), isnan(_1325));
    float _484 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1327.xy, uint(rint(_1327.z)), _472);
    float _486 = fma(_480, 2.0, _52);
    float _488 = fma(_482, 2.0, _54);
    float3 _1342 = float3(_476, _478, float(int(_406)));
    float3 _1344 = select(_1342, float3(0.0), isnan(_1342));
    float _490 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1344.xy, uint(rint(_1344.z)), 1.0);
    float2 _1349 = float2(_486, _488);
    float _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1349, float2(0.0), isnan(_1349))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1349, float2(0.0), isnan(_1349))).x;
    float _494 = -_78;
    float _496 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _498 = _494 + _496;
    float _500 = -_78;
    float _502 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _504 = _500 + _502;
    float _506 = _498 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _508 = precise::clamp(_506, 0.0, 1.0);
    float _510 = _504 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _512 = precise::clamp(_510, 0.0, 1.0);
    float _514 = _474 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _516 = fma(_484, (*spvDescriptorSet0.fp_c3)._m0[49].z, _514);
    float _518 = _508 + _490;
    float _520 = _512 + _516;
    out.m_45.x = _492;
    out.m_45.y = _518;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _520;
    return out;
}

