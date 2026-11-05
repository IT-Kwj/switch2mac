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
    float2 _601 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_601, float2(0.0), isnan(_601))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_601, float2(0.0), isnan(_601))).x;
    float2 _612 = float2(_52, _54);
    float2 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_612, float2(0.0), isnan(_612))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_612, float2(0.0), isnan(_612))).xy;
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
    float _92 = -_78;
    float _94 = _92 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _96 = _82 * _82;
    float _98 = _76 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _100 = _90 * _90;
    float _102 = _76 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _104 = fma(_86, _86, _96);
    float _106 = -_74;
    float _108 = _106 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _110 = fma(_94, _94, _100);
    float _112 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[27].x, _98);
    float _114 = _76 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _116 = fma(_108, _108, _104);
    float _118 = -_74;
    float _120 = _118 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _122 = _76 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _124 = _76 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _126 = _76 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _128 = fma(_120, _120, _110);
    float _130 = sqrt(_116);
    float _132 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[3].x, _122);
    float _134 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[28].x, _124);
    float _136 = _76 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _138 = _76 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _140 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].z, _132);
    float _142 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _144 = sqrt(_128);
    float _146 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _148 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _150 = _76 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _152 = _76 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _154 = _76 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _156 = _76 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _158 = _76 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _162 = _130 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _164 = _76 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    bool _166 = _130 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _168 = _76 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    bool _170 = !_162;
    int _173 = _170 ? 0 : 1;
    float _175 = _76 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _177 = _76 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _179 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[28].z, _134);
    bool _181 = _144 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _183 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[19].x, _126);
    bool _185 = _144 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _187 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[20].x, _136);
    bool _189 = !_181;
    int _191 = _189 ? 0 : 1;
    float _193 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[21].x, _138);
    int _195 = 2;
    int _197 = 2;
    if (!_162)
    {
        _195 = 1;
    }
    int _199 = _195;
    float _201 = _140 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    int _203 = _199;
    if (!_166)
    {
        _203 = _173;
    }
    int _205 = _203;
    float _207 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[0].x, _142);
    float _209 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[1].x, _146);
    float _211 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].x, _148);
    float _213 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[30].x, _102);
    if (!_181)
    {
        _197 = 1;
    }
    int _215 = _197;
    float _217 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[22].x, _150);
    int _219 = _215;
    if (!_185)
    {
        _219 = _191;
    }
    int _221 = _219;
    float _223 = _76 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _225 = _76 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _227 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[23].x, _152);
    float _229 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[24].x, _154);
    float _231 = float(_205);
    float _233 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[32].x, _114);
    float _235 = float(_221);
    float _237 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[16].x, _156);
    float _239 = precise::min(_231, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _241 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[17].x, _158);
    float _243 = precise::min(_235, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _245 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[18].x, _164);
    bool _247 = _239 != 1.0;
    bool _249 = isnan(_239);
    bool _251 = _247 || _249;
    bool _253 = isnan(1.0);
    bool _255 = _251 || _253;
    float _257 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[25].x, _168);
    bool _259 = _243 != 1.0;
    bool _261 = isnan(_243);
    bool _263 = _259 || _261;
    bool _265 = isnan(1.0);
    bool _267 = _263 || _265;
    float _269 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[26].x, _175);
    float _271 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[29].x, _177);
    float _273 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[31].x, _223);
    float _275 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[33].x, _225);
    float _277 = _179 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _279 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[19].z, _183);
    float _281 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[20].z, _187);
    float _283 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[21].z, _193);
    float _285 = 1.0 / _201;
    float _287 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[22].z, _217);
    float _289 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[23].z, _227);
    float _291 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[24].z, _229);
    float _293 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[31].z, _273);
    float _295 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[29].z, _271);
    float _297 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[30].z, _213);
    float _299 = _279 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _301 = _281 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _303 = _283 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _305 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[32].z, _233);
    float _307 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[33].z, _275);
    float _309 = _299;
    float _311 = _301;
    float _313 = _303;
    float _315 = _277;
    if (_255)
    {
        float _317 = _287 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _309 = _317;
    }
    float _319 = _309;
    float _321 = _319;
    if (_255)
    {
        float _323 = _289 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _311 = _323;
    }
    float _325 = _311;
    float _327 = _325;
    if (_255)
    {
        float _329 = _291 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _313 = _329;
    }
    float _331 = _313;
    float _333 = _331;
    if (_267)
    {
        float _335 = _293 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _315 = _335;
    }
    float _337 = _315;
    bool _339 = _239 != 0.0;
    bool _341 = isnan(_239);
    bool _343 = _339 || _341;
    bool _345 = isnan(0.0);
    bool _347 = _343 || _345;
    float _349 = _295 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _351 = _297 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _353 = _349;
    float _355 = _351;
    float _357 = _337;
    if (_267)
    {
        float _359 = _305 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _353 = _359;
    }
    float _361 = _353;
    float _363 = _361;
    if (_267)
    {
        float _365 = _307 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _355 = _365;
    }
    float _367 = _355;
    float _369 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].z, _211);
    bool _371 = _243 != 0.0;
    bool _373 = isnan(_243);
    bool _375 = _371 || _373;
    bool _377 = isnan(0.0);
    bool _379 = _375 || _377;
    float _381 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].z, _207);
    float _383 = _369 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _385 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].z, _209);
    float _387 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[18].z, _245);
    float _389 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[26].z, _269);
    float _391 = _383 * _285;
    float _393 = precise::clamp(_391, 0.0, 1.0);
    float _395 = _381 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _397 = _385 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _399 = _367;
    if (!_347)
    {
        float _401 = _387 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _333 = _401;
    }
    float _403 = _333;
    float _405 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _393;
    float _407 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[27].z, _112);
    if (!_379)
    {
        float _409 = _389 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _363 = _409;
    }
    float _411 = _363;
    float _413 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[16].z, _237);
    float _415 = _395 * _285;
    float _417 = _397 * _285;
    float _419 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _421 = 0.0 + _403;
    float _423 = precise::clamp(_421, 0.0, 1.0);
    float _425 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[25].z, _257);
    float _427 = _405 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _429 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[17].z, _241);
    if (!_379)
    {
        float _431 = _407 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _399 = _431;
    }
    float _433 = _399;
    float _435 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _437 = _405 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    if (!_347)
    {
        float _439 = _413 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _321 = _439;
    }
    float _441 = _321;
    float _443 = _423 * _419;
    float _445 = rint(_239);
    float _447 = precise::max(_445, 0.0);
    uint _450 = uint(_447);
    uint _452 = clamp(_450, 0u, 65535u);
    if (!_379)
    {
        float _454 = _425 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _357 = _454;
    }
    float _456 = _357;
    float _458 = fma(_427, 0.5, _415);
    float _460 = fma(_427, -0.5, _415);
    if (!_347)
    {
        float _462 = _429 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _327 = _462;
    }
    float _464 = _327;
    float _466 = _423 * _435;
    float _468 = 0.0 + _433;
    float _470 = precise::clamp(_468, 0.0, 1.0);
    float _472 = fma(_437, 0.5, _417);
    float _474 = fma(_437, -0.5, _417);
    float _476 = fma(_443, 0.5, _441);
    float _478 = fma(_443, -0.5, _441);
    float _480 = rint(_243);
    float _482 = precise::max(_480, 0.0);
    uint _484 = uint(_482);
    uint _486 = clamp(_484, 0u, 65535u);
    float _488 = fma(_466, 0.5, _464);
    float _490 = _419 * _470;
    float _492 = fma(_64, 2.0, -1.0);
    float _494 = fma(_466, -0.5, _464);
    float _496 = fma(_62, 2.0, -1.0);
    float _498 = _435 * _470;
    float _500 = fma(_490, 0.5, _456);
    float _502 = _492 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _504 = fma(_490, -0.5, _456);
    float _506 = _496 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _508 = fma(_498, 0.5, _411);
    float _510 = fma(_498, -0.5, _411);
    float3 _1442 = float3(_458, _472, float(0));
    float3 _1446 = select(_1442, float3(0.0), isnan(_1442));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1446.xy, uint(rint(_1446.z)), _393);
    float3 _1453 = float3(_460, _472, float(0));
    float3 _1455 = select(_1453, float3(0.0), isnan(_1453));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1455.xy, uint(rint(_1455.z)), _393);
    float _516 = fma(_502, 2.0, _54);
    float _518 = fma(_506, 2.0, _52);
    float3 _1468 = float3(_458, _474, float(0));
    float3 _1470 = select(_1468, float3(0.0), isnan(_1468));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1470.xy, uint(rint(_1470.z)), _393);
    float3 _1477 = float3(_460, _474, float(0));
    float3 _1479 = select(_1477, float3(0.0), isnan(_1477));
    float _522 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1479.xy, uint(rint(_1479.z)), _393);
    float3 _1488 = float3(_478, _488, float(int(_452)));
    float3 _1490 = select(_1488, float3(0.0), isnan(_1488));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1490.xy, uint(rint(_1490.z)), _423);
    float3 _1499 = float3(_476, _488, float(int(_452)));
    float3 _1501 = select(_1499, float3(0.0), isnan(_1499));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1501.xy, uint(rint(_1501.z)), _423);
    float3 _1510 = float3(_476, _494, float(int(_452)));
    float3 _1512 = select(_1510, float3(0.0), isnan(_1510));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1512.xy, uint(rint(_1512.z)), _423);
    float3 _1521 = float3(_504, _508, float(int(_486)));
    float3 _1523 = select(_1521, float3(0.0), isnan(_1521));
    float _530 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1523.xy, uint(rint(_1523.z)), _470);
    float3 _1532 = float3(_500, _508, float(int(_486)));
    float3 _1534 = select(_1532, float3(0.0), isnan(_1532));
    float _532 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1534.xy, uint(rint(_1534.z)), _470);
    float3 _1543 = float3(_500, _510, float(int(_486)));
    float3 _1545 = select(_1543, float3(0.0), isnan(_1543));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1545.xy, uint(rint(_1545.z)), _470);
    float3 _1554 = float3(_478, _494, float(int(_452)));
    float3 _1556 = select(_1554, float3(0.0), isnan(_1554));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1556.xy, uint(rint(_1556.z)), _423);
    float3 _1565 = float3(_504, _510, float(int(_486)));
    float3 _1567 = select(_1565, float3(0.0), isnan(_1565));
    float _538 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1567.xy, uint(rint(_1567.z)), _470);
    float2 _1573 = float2(_518, _516);
    float _540 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1573, float2(0.0), isnan(_1573))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1573, float2(0.0), isnan(_1573))).x;
    float _542 = -_74;
    float _544 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _546 = _542 + _544;
    float _548 = _546 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _550 = precise::clamp(_548, 0.0, 1.0);
    float _552 = _512 + _514;
    float _554 = -_74;
    float _556 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _558 = _554 + _556;
    float _560 = _558 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _562 = precise::clamp(_560, 0.0, 1.0);
    float _564 = _552 + _520;
    float _566 = _526 + _524;
    float _568 = _564 + _522;
    float _570 = _566 + _528;
    float _572 = fma(_568, 0.25, _562);
    float _574 = _532 + _530;
    float _576 = _574 + _534;
    float _578 = _570 + _536;
    float _580 = _576 + _538;
    float _582 = _578 * 0.25;
    float _584 = _580 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _586 = _584 * 0.25;
    float _588 = fma(_582, (*spvDescriptorSet0.fp_c3)._m0[49].z, _586);
    float _590 = _550 + _588;
    out.m_45.x = _540;
    out.m_45.y = _572;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _590;
    return out;
}

