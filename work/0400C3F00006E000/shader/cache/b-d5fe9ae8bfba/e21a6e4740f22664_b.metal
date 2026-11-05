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
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
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
    float2 _584 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_584, float2(0.0), isnan(_584))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_584, float2(0.0), isnan(_584))).x;
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
    float _76 = _74 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _78 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _80 = -_70;
    float _82 = _80 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _84 = -_72;
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _88 = -_70;
    float _90 = _88 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _92 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _78);
    float _94 = _82 * _82;
    float _96 = _90 * _90;
    float _98 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _92);
    float _100 = fma(_86, _86, _94);
    float _102 = -_72;
    float _104 = _102 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _106 = _98 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _108 = fma(_76, _76, _100);
    float _110 = fma(_104, _104, _96);
    float _112 = -_68;
    float _114 = _112 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _116 = 1.0 / _106;
    float _118 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _120 = fma(_114, _114, _110);
    float _122 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _118);
    float _124 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _126 = sqrt(_120);
    float _128 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _122);
    float _130 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _124);
    float _132 = _70 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _134 = _128 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _136 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _130);
    float _138 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _132);
    float _140 = sqrt(_108);
    float _142 = _134 * _116;
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = _136 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _148 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _138);
    float _150 = _146 * _116;
    float _152 = _148 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    bool _156 = _126 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _158 = _152 * _116;
    bool _160 = _126 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _162 = !_156;
    int _165 = _162 ? 0 : 1;
    float _167 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _144;
    bool _169 = _140 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _171 = _140 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _173 = _167 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    int _175 = 2;
    if (!_156)
    {
        _175 = 1;
    }
    int _177 = _175;
    float _179 = fma(_173, 0.5, _150);
    float _181 = fma(_173, -0.5, _150);
    float _183 = _167 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    bool _185 = !_169;
    int _187 = _185 ? 0 : 1;
    float _189 = fma(_183, 0.5, _158);
    int _191 = 2;
    int _193 = _177;
    if (!_169)
    {
        _191 = 1;
    }
    int _195 = _191;
    float3 _838 = float3(_179, _189, float(0));
    float3 _842 = select(_838, float3(0.0), isnan(_838));
    float _197 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _842.xy, uint(rint(_842.z)), _144);
    float3 _849 = float3(_181, _189, float(0));
    float3 _851 = select(_849, float3(0.0), isnan(_849));
    float _199 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _851.xy, uint(rint(_851.z)), _144);
    float _201 = _70 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _203 = _70 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    int _205 = _195;
    if (!_160)
    {
        _193 = _165;
    }
    int _207 = _193;
    float _209 = _70 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    if (!_171)
    {
        _205 = _187;
    }
    int _211 = _205;
    float _213 = _70 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _215 = _70 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _217 = _70 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _219 = float(_211);
    float _221 = _70 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _223 = _70 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _225 = _70 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _227 = precise::min(_219, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _229 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[22].x, _201);
    float _231 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[31].x, _203);
    float _233 = _70 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _235 = _227 != 1.0;
    bool _237 = isnan(_227);
    bool _239 = _235 || _237;
    bool _241 = isnan(1.0);
    bool _243 = _239 || _241;
    float _245 = _70 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _247 = float(_207);
    float _249 = _70 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _251 = _70 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _253 = _70 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _255 = precise::min(_247, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _257 = _70 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _259 = _70 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _261 = _70 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    bool _263 = _255 != 1.0;
    bool _265 = isnan(_255);
    bool _267 = _263 || _265;
    bool _269 = isnan(1.0);
    bool _271 = _267 || _269;
    float _273 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[19].x, _213);
    float _275 = _70 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    bool _277 = _227 != 0.0;
    bool _279 = isnan(_227);
    bool _281 = _277 || _279;
    bool _283 = isnan(0.0);
    bool _285 = _281 || _283;
    float _287 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[28].x, _209);
    bool _289 = _255 != 0.0;
    bool _291 = isnan(_255);
    bool _293 = _289 || _291;
    bool _295 = isnan(0.0);
    bool _297 = _293 || _295;
    float _299 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[20].x, _215);
    float _301 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[21].x, _221);
    float _303 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[30].x, _259);
    float _305 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _273);
    float _307 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[23].x, _217);
    float _309 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[24].x, _223);
    float _311 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[16].x, _225);
    float _313 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[17].x, _233);
    float _315 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[18].x, _245);
    float _317 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[25].x, _249);
    float _319 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[26].x, _251);
    float _321 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[27].x, _253);
    float _323 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[29].x, _257);
    float _325 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[32].x, _261);
    float _327 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _229);
    float _329 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[33].x, _275);
    float _331 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _287);
    float _333 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _231);
    float _335 = _305 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _337 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _301);
    float _339 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _303);
    float _341 = _335;
    if (_243)
    {
        float _343 = _327 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _341 = _343;
    }
    float _345 = _341;
    float _347 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _309);
    float _349 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _329);
    float _351 = _331 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _353 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _315);
    float _355 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _321);
    float _357 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _299);
    float _359 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _323);
    float _361 = _351;
    float _363 = _345;
    if (_271)
    {
        float _365 = _333 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _361 = _365;
    }
    float _367 = _361;
    float _369 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _325);
    float _371 = _337 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _373 = _339 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _375 = rint(_227);
    float _377 = precise::max(_375, 0.0);
    uint _380 = uint(_377);
    uint _382 = clamp(_380, 0u, 65535u);
    float _384 = _371;
    float _386 = _373;
    float _388 = _367;
    if (_243)
    {
        float _390 = _347 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _384 = _390;
    }
    float _392 = _384;
    float _394 = _392;
    if (_271)
    {
        float _396 = _349 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _386 = _396;
    }
    float _398 = _386;
    float _400 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _319);
    float _402 = _398;
    if (!_285)
    {
        float _404 = _353 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _394 = _404;
    }
    float _406 = _394;
    if (!_297)
    {
        float _408 = _355 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _402 = _408;
    }
    float _410 = _402;
    float _412 = _357 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _414 = _359 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _416 = _414;
    float _418 = _412;
    if (_271)
    {
        float _420 = _369 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _416 = _420;
    }
    float _422 = _416;
    float _424 = fma(_183, -0.5, _158);
    float _426 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _307);
    float _428 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _317);
    float _430 = _422;
    if (!_297)
    {
        float _432 = _400 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _430 = _432;
    }
    float _434 = _430;
    float _436 = rint(_255);
    float _438 = precise::max(_436, 0.0);
    uint _440 = uint(_438);
    uint _442 = clamp(_440, 0u, 65535u);
    float _444 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _311);
    float _446 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _313);
    float _448 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _450 = 0.0 + _406;
    float _452 = precise::clamp(_450, 0.0, 1.0);
    float _454 = 0.0 + _410;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    float _458 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    if (_243)
    {
        float _460 = _426 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _418 = _460;
    }
    float _462 = _418;
    float _464 = _462;
    if (!_297)
    {
        float _466 = _428 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _388 = _466;
    }
    float _468 = _388;
    if (!_285)
    {
        float _470 = _444 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _363 = _470;
    }
    float _472 = _363;
    if (!_285)
    {
        float _474 = _446 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _464 = _474;
    }
    float _476 = _464;
    float _478 = _452 * _448;
    float _480 = _448 * _456;
    float _482 = _452 * _458;
    float _484 = _458 * _456;
    float _486 = fma(_478, 0.5, _472);
    float _488 = fma(_480, 0.5, _468);
    float _490 = fma(_478, -0.5, _472);
    float _492 = fma(_482, 0.5, _476);
    float _494 = fma(_480, -0.5, _468);
    float _496 = fma(_482, -0.5, _476);
    float _498 = fma(_484, 0.5, _434);
    float _500 = fma(_484, -0.5, _434);
    float3 _1422 = float3(_179, _424, float(0));
    float3 _1424 = select(_1422, float3(0.0), isnan(_1422));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1424.xy, uint(rint(_1424.z)), _144);
    float3 _1431 = float3(_181, _424, float(0));
    float3 _1433 = select(_1431, float3(0.0), isnan(_1431));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1433.xy, uint(rint(_1433.z)), _144);
    float3 _1442 = float3(_490, _492, float(int(_382)));
    float3 _1444 = select(_1442, float3(0.0), isnan(_1442));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1444.xy, uint(rint(_1444.z)), _452);
    float3 _1453 = float3(_486, _492, float(int(_382)));
    float3 _1455 = select(_1453, float3(0.0), isnan(_1453));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1455.xy, uint(rint(_1455.z)), _452);
    float3 _1464 = float3(_486, _496, float(int(_382)));
    float3 _1466 = select(_1464, float3(0.0), isnan(_1464));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1466.xy, uint(rint(_1466.z)), _452);
    float3 _1475 = float3(_494, _498, float(int(_442)));
    float3 _1477 = select(_1475, float3(0.0), isnan(_1475));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1477.xy, uint(rint(_1477.z)), _456);
    float3 _1486 = float3(_488, _498, float(int(_442)));
    float3 _1488 = select(_1486, float3(0.0), isnan(_1486));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1488.xy, uint(rint(_1488.z)), _456);
    float3 _1497 = float3(_488, _500, float(int(_442)));
    float3 _1499 = select(_1497, float3(0.0), isnan(_1497));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1499.xy, uint(rint(_1499.z)), _456);
    float3 _1508 = float3(_490, _496, float(int(_382)));
    float3 _1510 = select(_1508, float3(0.0), isnan(_1508));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1510.xy, uint(rint(_1510.z)), _452);
    float3 _1519 = float3(_494, _500, float(int(_442)));
    float3 _1521 = select(_1519, float3(0.0), isnan(_1519));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1521.xy, uint(rint(_1521.z)), _456);
    float2 _1527 = float2(_50, _52);
    float _522 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1527, float2(0.0), isnan(_1527))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1527, float2(0.0), isnan(_1527))).x;
    float _524 = -_68;
    float _526 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _528 = _524 + _526;
    float _530 = _528 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _532 = precise::clamp(_530, 0.0, 1.0);
    float _534 = _197 + _199;
    float _536 = -_68;
    float _538 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _540 = _536 + _538;
    float _542 = _540 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _544 = precise::clamp(_542, 0.0, 1.0);
    float _546 = _534 + _502;
    float _548 = _508 + _506;
    float _550 = _546 + _504;
    float _552 = _548 + _510;
    float _554 = fma(_550, 0.25, _544);
    float _556 = _514 + _512;
    float _558 = _556 + _516;
    float _560 = _552 + _518;
    float _562 = _558 + _520;
    float _564 = _560 * 0.25;
    float _566 = _562 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _568 = _566 * 0.25;
    float _570 = fma(_564, (*spvDescriptorSet0.fp_c3)._m0[49].z, _568);
    float _572 = _532 + _570;
    out.m_43.x = _522;
    out.m_43.y = _554;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _572;
    return out;
}

