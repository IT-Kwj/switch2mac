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
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_12 [[id(9)]];
    sampler fp_t_tcb_12Smplr [[id(10)]];
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
    float2 _607 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_607, float2(0.0), isnan(_607))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_607, float2(0.0), isnan(_607))).x;
    float2 _618 = float2(_52, _54);
    float2 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_618, float2(0.0), isnan(_618))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_618, float2(0.0), isnan(_618))).xy;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = in.m_42.y;
    float _68 = in.m_42.x;
    float _70 = -_56;
    float _72 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _74 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[46].z, _72);
    float _76 = _74 * _66;
    float _78 = _74 * _68;
    float _80 = -_76;
    float _82 = _80 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _84 = -_78;
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _88 = -_76;
    float _90 = _88 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _92 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _94 = _82 * _82;
    float _96 = -_74;
    float _98 = _96 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _100 = _90 * _90;
    float _102 = _76 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _104 = fma(_86, _86, _94);
    float _106 = _76 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _108 = _76 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _110 = _76 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _112 = fma(_98, _98, _104);
    float _114 = -_78;
    float _116 = _114 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _118 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _120 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _122 = _76 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _124 = fma(_116, _116, _100);
    float _126 = sqrt(_112);
    float _128 = -_74;
    float _130 = _128 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _132 = _76 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _134 = _76 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _136 = _76 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _138 = fma(_130, _130, _124);
    float _140 = _76 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _142 = _76 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _144 = _76 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _146 = _76 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _148 = sqrt(_138);
    float _150 = _76 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _152 = _76 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _154 = _76 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _156 = _76 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _160 = _126 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _162 = _76 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    bool _164 = _126 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _166 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[0].x, _92);
    bool _168 = !_160;
    int _171 = _168 ? 0 : 1;
    float _173 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[3].x, _102);
    float _175 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[19].x, _106);
    float _177 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[20].x, _108);
    float _179 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[23].x, _110);
    float _181 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[1].x, _118);
    float _183 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].x, _120);
    bool _185 = _148 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _187 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[22].x, _122);
    int _189 = 2;
    if (!_160)
    {
        _189 = 1;
    }
    int _191 = _189;
    float _193 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[24].x, _132);
    bool _195 = _148 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _197 = _76 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _199 = _76 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    int _201 = _191;
    if (!_164)
    {
        _201 = _171;
    }
    int _203 = _201;
    float _205 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[16].x, _134);
    bool _207 = !_185;
    int _209 = _207 ? 0 : 1;
    float _211 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[21].x, _197);
    float _213 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[17].x, _136);
    float _215 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[18].x, _140);
    float _217 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[25].x, _142);
    float _219 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[26].x, _144);
    float _221 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[27].x, _146);
    float _223 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[28].x, _150);
    float _225 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[29].x, _152);
    float _227 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[30].x, _154);
    float _229 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[31].x, _156);
    float _231 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[32].x, _162);
    float _233 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].z, _173);
    float _235 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[33].x, _199);
    float _237 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[20].z, _177);
    float _239 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].z, _166);
    int _241 = 2;
    if (!_185)
    {
        _241 = 1;
    }
    int _243 = _241;
    float _245 = _233 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    int _247 = _243;
    if (!_195)
    {
        _247 = _209;
    }
    int _249 = _247;
    float _251 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].z, _181);
    float _253 = float(_203);
    float _255 = _239 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _257 = 1.0 / _245;
    float _259 = precise::min(_253, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _261 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[19].z, _175);
    float _263 = float(_249);
    float _265 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[21].z, _211);
    bool _267 = _259 != 1.0;
    bool _269 = isnan(_259);
    bool _271 = _267 || _269;
    bool _273 = isnan(1.0);
    bool _275 = _271 || _273;
    float _277 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[22].z, _187);
    float _279 = precise::min(_263, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _281 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[23].z, _179);
    bool _283 = _259 != 0.0;
    bool _285 = isnan(_259);
    bool _287 = _283 || _285;
    bool _289 = isnan(0.0);
    bool _291 = _287 || _289;
    float _293 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[24].z, _193);
    bool _295 = _279 != 1.0;
    bool _297 = isnan(_279);
    bool _299 = _295 || _297;
    bool _301 = isnan(1.0);
    bool _303 = _299 || _301;
    float _305 = _261 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _307 = _237 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _309 = _265 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _311 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[29].z, _225);
    float _313 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[32].z, _231);
    float _315 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].z, _183);
    float _317 = _305;
    float _319 = _307;
    float _321 = _309;
    if (_275)
    {
        float _323 = _277 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _317 = _323;
    }
    float _325 = _317;
    float _327 = _325;
    if (_275)
    {
        float _329 = _281 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _319 = _329;
    }
    float _331 = _319;
    float _333 = _331;
    if (_275)
    {
        float _335 = _293 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _321 = _335;
    }
    float _337 = _321;
    bool _339 = _279 != 0.0;
    bool _341 = isnan(_279);
    bool _343 = _339 || _341;
    bool _345 = isnan(0.0);
    bool _347 = _343 || _345;
    float _349 = _311 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _351 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[18].z, _215);
    float _353 = _251 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _355 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[28].z, _223);
    float _357 = _349;
    float _359 = _337;
    if (_303)
    {
        float _361 = _313 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _357 = _361;
    }
    float _363 = _357;
    float _365 = _315 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _367 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[31].z, _229);
    float _369 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[17].z, _213);
    float _371 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[16].z, _205);
    float _373 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[30].z, _227);
    float _375 = _363;
    if (!_291)
    {
        float _377 = _351 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _359 = _377;
    }
    float _379 = _359;
    float _381 = _353 * _257;
    float _383 = _355 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _385 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[33].z, _235);
    float _387 = _255 * _257;
    float _389 = _365 * _257;
    float _391 = precise::clamp(_389, 0.0, 1.0);
    float _393 = _383;
    if (_303)
    {
        float _395 = _367 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _393 = _395;
    }
    float _397 = _393;
    float _399 = _397;
    if (!_291)
    {
        float _401 = _369 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _333 = _401;
    }
    float _403 = _333;
    float _405 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[27].z, _221);
    if (!_291)
    {
        float _407 = _371 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _327 = _407;
    }
    float _409 = _327;
    float _411 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[25].z, _217);
    float _413 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _415 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _417 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _419 = _373 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _421 = 0.0 + _379;
    float _423 = precise::clamp(_421, 0.0, 1.0);
    float _425 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _427 = _419;
    if (_303)
    {
        float _429 = _385 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _427 = _429;
    }
    float _431 = _427;
    float _433 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[26].z, _219);
    float _435 = _431;
    if (!_347)
    {
        float _437 = _405 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _435 = _437;
    }
    float _439 = _435;
    if (!_347)
    {
        float _441 = _411 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _399 = _441;
    }
    float _443 = _399;
    float _445 = rint(_391);
    float _447 = precise::max(_445, 0.0);
    uint _450 = uint(_447);
    uint _452 = clamp(_450, 0u, 65535u);
    float _454 = _423 * _425;
    if (!_347)
    {
        float _456 = _433 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _375 = _456;
    }
    float _458 = _375;
    float _460 = fma(_413, 0.5, _387);
    float _462 = 0.0 + _439;
    float _464 = precise::clamp(_462, 0.0, 1.0);
    float _466 = fma(_413, -0.5, _387);
    float _468 = _423 * _417;
    float _470 = rint(_259);
    float _472 = precise::max(_470, 0.0);
    uint _474 = uint(_472);
    uint _476 = clamp(_474, 0u, 65535u);
    float _478 = fma(_454, 0.5, _403);
    float _480 = fma(_454, -0.5, _403);
    float _482 = fma(_415, 0.5, _381);
    float _484 = _425 * _464;
    float _486 = fma(_415, -0.5, _381);
    float _488 = _417 * _464;
    float _490 = fma(_468, 0.5, _409);
    float _492 = rint(_279);
    float _494 = precise::max(_492, 0.0);
    uint _496 = uint(_494);
    uint _498 = clamp(_496, 0u, 65535u);
    float _500 = fma(_62, 2.0, -1.0);
    float _502 = fma(_468, -0.5, _409);
    float _504 = fma(_64, 2.0, -1.0);
    float _506 = fma(_484, 0.5, _458);
    float _508 = fma(_488, 0.5, _443);
    float _510 = fma(_484, -0.5, _458);
    float _512 = fma(_488, -0.5, _443);
    float _514 = _500 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _516 = _504 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _518 = fma(_514, 2.0, _52);
    float _520 = fma(_516, 2.0, _54);
    float3 _1462 = float3(_466, _482, float(int(_452)));
    float3 _1466 = select(_1462, float3(0.0), isnan(_1462));
    float _522 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1466.xy, uint(rint(_1466.z)), 1.0);
    float3 _1474 = float3(_460, _482, float(int(_452)));
    float3 _1476 = select(_1474, float3(0.0), isnan(_1474));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1476.xy, uint(rint(_1476.z)), 1.0);
    float3 _1484 = float3(_460, _486, float(int(_452)));
    float3 _1486 = select(_1484, float3(0.0), isnan(_1484));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1486.xy, uint(rint(_1486.z)), 1.0);
    float3 _1494 = float3(_466, _486, float(int(_452)));
    float3 _1496 = select(_1494, float3(0.0), isnan(_1494));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1496.xy, uint(rint(_1496.z)), 1.0);
    float3 _1504 = float3(_502, _478, float(int(_476)));
    float3 _1506 = select(_1504, float3(0.0), isnan(_1504));
    float _530 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1506.xy, uint(rint(_1506.z)), _423);
    float3 _1515 = float3(_490, _478, float(int(_476)));
    float3 _1517 = select(_1515, float3(0.0), isnan(_1515));
    float _532 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1517.xy, uint(rint(_1517.z)), _423);
    float3 _1526 = float3(_490, _480, float(int(_476)));
    float3 _1528 = select(_1526, float3(0.0), isnan(_1526));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1528.xy, uint(rint(_1528.z)), _423);
    float3 _1537 = float3(_512, _506, float(int(_498)));
    float3 _1539 = select(_1537, float3(0.0), isnan(_1537));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1539.xy, uint(rint(_1539.z)), _464);
    float3 _1548 = float3(_508, _506, float(int(_498)));
    float3 _1550 = select(_1548, float3(0.0), isnan(_1548));
    float _538 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1550.xy, uint(rint(_1550.z)), _464);
    float3 _1559 = float3(_508, _510, float(int(_498)));
    float3 _1561 = select(_1559, float3(0.0), isnan(_1559));
    float _540 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1561.xy, uint(rint(_1561.z)), _464);
    float3 _1570 = float3(_502, _480, float(int(_476)));
    float3 _1572 = select(_1570, float3(0.0), isnan(_1570));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1572.xy, uint(rint(_1572.z)), _423);
    float3 _1581 = float3(_512, _510, float(int(_498)));
    float3 _1583 = select(_1581, float3(0.0), isnan(_1581));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1583.xy, uint(rint(_1583.z)), _464);
    float2 _1589 = float2(_518, _520);
    float _546 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1589, float2(0.0), isnan(_1589))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1589, float2(0.0), isnan(_1589))).x;
    float _548 = -_74;
    float _550 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _552 = _548 + _550;
    float _554 = _552 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _556 = precise::clamp(_554, 0.0, 1.0);
    float _558 = _524 + _522;
    float _560 = -_74;
    float _562 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _564 = _560 + _562;
    float _566 = _558 + _526;
    float _568 = _564 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _570 = precise::clamp(_568, 0.0, 1.0);
    float _572 = _566 + _528;
    float _574 = _532 + _530;
    float _576 = fma(_572, 0.25, _570);
    float _578 = _574 + _534;
    float _580 = _538 + _536;
    float _582 = _580 + _540;
    float _584 = _578 + _542;
    float _586 = _582 + _544;
    float _588 = _584 * 0.25;
    float _590 = _586 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _592 = _590 * 0.25;
    float _594 = fma(_588, (*spvDescriptorSet0.fp_c3)._m0[49].z, _592);
    float _596 = _556 + _594;
    out.m_45.x = _546;
    out.m_45.y = _576;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _596;
    return out;
}

