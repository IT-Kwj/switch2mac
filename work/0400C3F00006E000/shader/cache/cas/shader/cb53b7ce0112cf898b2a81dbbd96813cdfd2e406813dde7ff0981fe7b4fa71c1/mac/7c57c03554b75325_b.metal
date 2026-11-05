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
    float2 _580 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_580, float2(0.0), isnan(_580))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_580, float2(0.0), isnan(_580))).x;
    float _56 = in.m_40.y;
    float _58 = in.m_40.x;
    float _60 = -_54;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _56;
    float _68 = _64 * _58;
    float _70 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _72 = -_66;
    float _74 = _72 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _76 = -_68;
    float _78 = _76 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _80 = -_66;
    float _82 = _80 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _84 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _86 = _74 * _74;
    float _88 = _82 * _82;
    float _90 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _84);
    float _92 = fma(_78, _78, _86);
    float _94 = -_68;
    float _96 = _94 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _100 = -_64;
    float _102 = _100 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _104 = fma(_96, _96, _88);
    float _106 = -_64;
    float _108 = _106 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _110 = 1.0 / _98;
    float _112 = fma(_102, _102, _92);
    float _114 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _116 = fma(_108, _108, _104);
    float _118 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _114);
    float _120 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _122 = sqrt(_116);
    float _124 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _126 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _118);
    float _128 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _120);
    float _130 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _124);
    float _132 = _126 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _134 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _128);
    float _136 = sqrt(_112);
    float _138 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _130);
    float _140 = _132 * _110;
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = _134 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _148 = _144 * _110;
    bool _152 = _122 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _154 = _146 * _110;
    bool _156 = _122 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _158 = !_152;
    int _161 = _158 ? 0 : 1;
    float _163 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _142;
    bool _165 = _136 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _167 = _136 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _169 = _163 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    int _171 = 2;
    if (!_152)
    {
        _171 = 1;
    }
    int _173 = _171;
    float _175 = fma(_169, 0.5, _148);
    float _177 = fma(_169, -0.5, _148);
    float _179 = _163 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    bool _181 = !_165;
    int _183 = _181 ? 0 : 1;
    float _185 = fma(_179, 0.5, _154);
    int _187 = 2;
    int _189 = _173;
    if (!_165)
    {
        _187 = 1;
    }
    int _191 = _187;
    float3 _830 = float3(_175, _185, float(0));
    float3 _834 = select(_830, float3(0.0), isnan(_830));
    float _193 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _834.xy, uint(rint(_834.z)), _142);
    float3 _841 = float3(_177, _185, float(0));
    float3 _843 = select(_841, float3(0.0), isnan(_841));
    float _195 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _843.xy, uint(rint(_843.z)), _142);
    float _197 = _66 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _199 = _66 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    int _201 = _191;
    if (!_156)
    {
        _189 = _161;
    }
    int _203 = _189;
    float _205 = _66 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    if (!_167)
    {
        _201 = _183;
    }
    int _207 = _201;
    float _209 = _66 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _211 = _66 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _213 = _66 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _215 = float(_207);
    float _217 = _66 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _219 = _66 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _221 = _66 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _223 = precise::min(_215, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _225 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].x, _197);
    float _227 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].x, _199);
    float _229 = _66 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _231 = _223 != 1.0;
    bool _233 = isnan(_223);
    bool _235 = _231 || _233;
    bool _237 = isnan(1.0);
    bool _239 = _235 || _237;
    float _241 = _66 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _243 = float(_203);
    float _245 = _66 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _247 = _66 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _249 = _66 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _251 = precise::min(_243, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _253 = _66 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _255 = _66 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _257 = _66 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    bool _259 = _251 != 1.0;
    bool _261 = isnan(_251);
    bool _263 = _259 || _261;
    bool _265 = isnan(1.0);
    bool _267 = _263 || _265;
    float _269 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].x, _209);
    float _271 = _66 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    bool _273 = _223 != 0.0;
    bool _275 = isnan(_223);
    bool _277 = _273 || _275;
    bool _279 = isnan(0.0);
    bool _281 = _277 || _279;
    float _283 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].x, _205);
    bool _285 = _251 != 0.0;
    bool _287 = isnan(_251);
    bool _289 = _285 || _287;
    bool _291 = isnan(0.0);
    bool _293 = _289 || _291;
    float _295 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].x, _211);
    float _297 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].x, _217);
    float _299 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].x, _255);
    float _301 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[19].z, _269);
    float _303 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].x, _213);
    float _305 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].x, _219);
    float _307 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].x, _221);
    float _309 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].x, _229);
    float _311 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].x, _241);
    float _313 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].x, _245);
    float _315 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].x, _247);
    float _317 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].x, _249);
    float _319 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].x, _253);
    float _321 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].x, _257);
    float _323 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[22].z, _225);
    float _325 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].x, _271);
    float _327 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[28].z, _283);
    float _329 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[31].z, _227);
    float _331 = _301 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _333 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[21].z, _297);
    float _335 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[30].z, _299);
    float _337 = _331;
    if (_239)
    {
        float _339 = _323 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _337 = _339;
    }
    float _341 = _337;
    float _343 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[24].z, _305);
    float _345 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[33].z, _325);
    float _347 = _327 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _349 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[18].z, _311);
    float _351 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[27].z, _317);
    float _353 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[20].z, _295);
    float _355 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[29].z, _319);
    float _357 = _347;
    float _359 = _341;
    if (_267)
    {
        float _361 = _329 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _357 = _361;
    }
    float _363 = _357;
    float _365 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[32].z, _321);
    float _367 = _333 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _369 = _335 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _371 = rint(_223);
    float _373 = precise::max(_371, 0.0);
    uint _376 = uint(_373);
    uint _378 = clamp(_376, 0u, 65535u);
    float _380 = _367;
    float _382 = _369;
    float _384 = _363;
    if (_239)
    {
        float _386 = _343 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _380 = _386;
    }
    float _388 = _380;
    float _390 = _388;
    if (_267)
    {
        float _392 = _345 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _382 = _392;
    }
    float _394 = _382;
    float _396 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[26].z, _315);
    float _398 = _394;
    if (!_281)
    {
        float _400 = _349 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _390 = _400;
    }
    float _402 = _390;
    if (!_293)
    {
        float _404 = _351 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _398 = _404;
    }
    float _406 = _398;
    float _408 = _353 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _410 = _355 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _412 = _410;
    float _414 = _408;
    if (_267)
    {
        float _416 = _365 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _412 = _416;
    }
    float _418 = _412;
    float _420 = fma(_179, -0.5, _154);
    float _422 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[23].z, _303);
    float _424 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[25].z, _313);
    float _426 = _418;
    if (!_293)
    {
        float _428 = _396 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _426 = _428;
    }
    float _430 = _426;
    float _432 = rint(_251);
    float _434 = precise::max(_432, 0.0);
    uint _436 = uint(_434);
    uint _438 = clamp(_436, 0u, 65535u);
    float _440 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[16].z, _307);
    float _442 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[17].z, _309);
    float _444 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _446 = 0.0 + _402;
    float _448 = precise::clamp(_446, 0.0, 1.0);
    float _450 = 0.0 + _406;
    float _452 = precise::clamp(_450, 0.0, 1.0);
    float _454 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    if (_239)
    {
        float _456 = _422 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _414 = _456;
    }
    float _458 = _414;
    float _460 = _458;
    if (!_293)
    {
        float _462 = _424 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _384 = _462;
    }
    float _464 = _384;
    if (!_281)
    {
        float _466 = _440 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _359 = _466;
    }
    float _468 = _359;
    if (!_281)
    {
        float _470 = _442 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _460 = _470;
    }
    float _472 = _460;
    float _474 = _448 * _444;
    float _476 = _444 * _452;
    float _478 = _448 * _454;
    float _480 = _454 * _452;
    float _482 = fma(_474, 0.5, _468);
    float _484 = fma(_476, 0.5, _464);
    float _486 = fma(_474, -0.5, _468);
    float _488 = fma(_478, 0.5, _472);
    float _490 = fma(_476, -0.5, _464);
    float _492 = fma(_478, -0.5, _472);
    float _494 = fma(_480, 0.5, _430);
    float _496 = fma(_480, -0.5, _430);
    float3 _1414 = float3(_175, _420, float(0));
    float3 _1416 = select(_1414, float3(0.0), isnan(_1414));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1416.xy, uint(rint(_1416.z)), _142);
    float3 _1423 = float3(_177, _420, float(0));
    float3 _1425 = select(_1423, float3(0.0), isnan(_1423));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1425.xy, uint(rint(_1425.z)), _142);
    float3 _1434 = float3(_486, _488, float(int(_378)));
    float3 _1436 = select(_1434, float3(0.0), isnan(_1434));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1436.xy, uint(rint(_1436.z)), _448);
    float3 _1445 = float3(_482, _488, float(int(_378)));
    float3 _1447 = select(_1445, float3(0.0), isnan(_1445));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1447.xy, uint(rint(_1447.z)), _448);
    float3 _1456 = float3(_482, _492, float(int(_378)));
    float3 _1458 = select(_1456, float3(0.0), isnan(_1456));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1458.xy, uint(rint(_1458.z)), _448);
    float3 _1467 = float3(_490, _494, float(int(_438)));
    float3 _1469 = select(_1467, float3(0.0), isnan(_1467));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1469.xy, uint(rint(_1469.z)), _452);
    float3 _1478 = float3(_484, _494, float(int(_438)));
    float3 _1480 = select(_1478, float3(0.0), isnan(_1478));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1480.xy, uint(rint(_1480.z)), _452);
    float3 _1489 = float3(_484, _496, float(int(_438)));
    float3 _1491 = select(_1489, float3(0.0), isnan(_1489));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1491.xy, uint(rint(_1491.z)), _452);
    float3 _1500 = float3(_486, _492, float(int(_378)));
    float3 _1502 = select(_1500, float3(0.0), isnan(_1500));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1502.xy, uint(rint(_1502.z)), _448);
    float3 _1511 = float3(_490, _496, float(int(_438)));
    float3 _1513 = select(_1511, float3(0.0), isnan(_1511));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1513.xy, uint(rint(_1513.z)), _452);
    float2 _1519 = float2(_50, _52);
    float _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1519, float2(0.0), isnan(_1519))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1519, float2(0.0), isnan(_1519))).x;
    float _520 = -_64;
    float _522 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _524 = _520 + _522;
    float _526 = _524 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _528 = precise::clamp(_526, 0.0, 1.0);
    float _530 = _193 + _195;
    float _532 = -_64;
    float _534 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _536 = _532 + _534;
    float _538 = _536 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _540 = precise::clamp(_538, 0.0, 1.0);
    float _542 = _530 + _498;
    float _544 = _504 + _502;
    float _546 = _542 + _500;
    float _548 = _544 + _506;
    float _550 = fma(_546, 0.25, _540);
    float _552 = _510 + _508;
    float _554 = _552 + _512;
    float _556 = _548 + _514;
    float _558 = _554 + _516;
    float _560 = _556 * 0.25;
    float _562 = _558 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _564 = _562 * 0.25;
    float _566 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[49].z, _564);
    float _568 = _528 + _566;
    out.m_43.x = _518;
    out.m_43.y = _550;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _568;
    return out;
}

