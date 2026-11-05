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
    float2 _605 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_605, float2(0.0), isnan(_605))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_605, float2(0.0), isnan(_605))).x;
    float2 _616 = float2(_52, _54);
    float2 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_616, float2(0.0), isnan(_616))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_616, float2(0.0), isnan(_616))).xy;
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
    float _100 = _80 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _102 = _90 * _90;
    float _104 = _80 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _106 = _98 * _98;
    float _108 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[27].x, _100);
    float _110 = fma(_94, _94, _102);
    float _112 = -_82;
    float _114 = _112 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _116 = _80 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _118 = _80 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _120 = fma(_86, _86, _110);
    float _122 = fma(_114, _114, _106);
    float _124 = -_78;
    float _126 = _124 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _128 = _80 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _130 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[3].x, _118);
    float _132 = _80 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _134 = fma(_126, _126, _122);
    float _136 = sqrt(_120);
    float _138 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[28].x, _128);
    float _140 = _80 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _142 = _80 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _144 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[3].z, _130);
    float _146 = _80 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _148 = _80 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _150 = sqrt(_134);
    float _152 = _80 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _154 = _80 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _156 = _80 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _158 = _80 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _160 = _80 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _162 = _80 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _164 = _80 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    bool _168 = _136 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _170 = _80 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    bool _172 = _136 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _174 = _80 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    bool _176 = !_168;
    int _179 = _176 ? 0 : 1;
    float _181 = _80 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _183 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[28].z, _138);
    float _185 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[19].x, _132);
    bool _187 = _150 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _189 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[20].x, _140);
    bool _191 = _150 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _193 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[21].x, _142);
    bool _195 = !_187;
    int _197 = _195 ? 0 : 1;
    float _199 = _144 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    int _201 = 2;
    int _203 = 2;
    if (!_168)
    {
        _201 = 1;
    }
    int _205 = _201;
    float _207 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[0].x, _146);
    int _209 = _205;
    if (!_172)
    {
        _209 = _179;
    }
    int _211 = _209;
    float _213 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[1].x, _148);
    float _215 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[2].x, _152);
    float _217 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[22].x, _154);
    float _219 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[30].x, _104);
    if (!_187)
    {
        _203 = 1;
    }
    int _221 = _203;
    float _223 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[23].x, _156);
    int _225 = _221;
    if (!_191)
    {
        _225 = _197;
    }
    int _227 = _225;
    float _229 = _80 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _231 = _80 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _233 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[24].x, _158);
    float _235 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[16].x, _160);
    float _237 = float(_211);
    float _239 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[32].x, _116);
    float _241 = float(_227);
    float _243 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[17].x, _162);
    float _245 = precise::min(_237, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _247 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[18].x, _164);
    float _249 = precise::min(_241, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _251 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[25].x, _170);
    bool _253 = _245 != 1.0;
    bool _255 = isnan(_245);
    bool _257 = _253 || _255;
    bool _259 = isnan(1.0);
    bool _261 = _257 || _259;
    float _263 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[26].x, _174);
    bool _265 = _249 != 1.0;
    bool _267 = isnan(_249);
    bool _269 = _265 || _267;
    bool _271 = isnan(1.0);
    bool _273 = _269 || _271;
    float _275 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[29].x, _181);
    float _277 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[31].x, _229);
    float _279 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[33].x, _231);
    float _281 = _183 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _283 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[19].z, _185);
    float _285 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[20].z, _189);
    float _287 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[21].z, _193);
    float _289 = 1.0 / _199;
    float _291 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[22].z, _217);
    float _293 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[23].z, _223);
    float _295 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[24].z, _233);
    float _297 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[31].z, _277);
    float _299 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[29].z, _275);
    float _301 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[30].z, _219);
    float _303 = _283 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _305 = _285 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _307 = _287 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _309 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[32].z, _239);
    float _311 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[33].z, _279);
    float _313 = _303;
    float _315 = _305;
    float _317 = _307;
    float _319 = _281;
    if (_261)
    {
        float _321 = _291 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _313 = _321;
    }
    float _323 = _313;
    float _325 = _323;
    if (_261)
    {
        float _327 = _293 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _315 = _327;
    }
    float _329 = _315;
    float _331 = _329;
    if (_261)
    {
        float _333 = _295 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _317 = _333;
    }
    float _335 = _317;
    float _337 = _335;
    if (_273)
    {
        float _339 = _297 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _319 = _339;
    }
    float _341 = _319;
    bool _343 = _245 != 0.0;
    bool _345 = isnan(_245);
    bool _347 = _343 || _345;
    bool _349 = isnan(0.0);
    bool _351 = _347 || _349;
    float _353 = _299 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _355 = _301 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _357 = _353;
    float _359 = _355;
    float _361 = _341;
    if (_273)
    {
        float _363 = _309 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _357 = _363;
    }
    float _365 = _357;
    float _367 = _365;
    if (_273)
    {
        float _369 = _311 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _359 = _369;
    }
    float _371 = _359;
    float _373 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].z, _215);
    bool _375 = _249 != 0.0;
    bool _377 = isnan(_249);
    bool _379 = _375 || _377;
    bool _381 = isnan(0.0);
    bool _383 = _379 || _381;
    float _385 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[0].z, _207);
    float _387 = _373 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _389 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[1].z, _213);
    float _391 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[18].z, _247);
    float _393 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[26].z, _263);
    float _395 = _387 * _289;
    float _397 = precise::clamp(_395, 0.0, 1.0);
    float _399 = _385 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _401 = _389 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _403 = _371;
    if (!_351)
    {
        float _405 = _391 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _337 = _405;
    }
    float _407 = _337;
    float _409 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _397;
    float _411 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[27].z, _108);
    if (!_383)
    {
        float _413 = _393 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _367 = _413;
    }
    float _415 = _367;
    float _417 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[16].z, _235);
    float _419 = _399 * _289;
    float _421 = _401 * _289;
    float _423 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _425 = 0.0 + _407;
    float _427 = precise::clamp(_425, 0.0, 1.0);
    float _429 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[25].z, _251);
    float _431 = _409 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _433 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[17].z, _243);
    if (!_383)
    {
        float _435 = _411 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _403 = _435;
    }
    float _437 = _403;
    float _439 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _441 = _409 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    if (!_351)
    {
        float _443 = _417 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _325 = _443;
    }
    float _445 = _325;
    float _447 = _427 * _423;
    float _449 = rint(_245);
    float _451 = precise::max(_449, 0.0);
    uint _454 = uint(_451);
    uint _456 = clamp(_454, 0u, 65535u);
    if (!_383)
    {
        float _458 = _429 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _361 = _458;
    }
    float _460 = _361;
    float _462 = fma(_431, 0.5, _419);
    float _464 = fma(_431, -0.5, _419);
    if (!_351)
    {
        float _466 = _433 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _331 = _466;
    }
    float _468 = _331;
    float _470 = _427 * _439;
    float _472 = 0.0 + _437;
    float _474 = precise::clamp(_472, 0.0, 1.0);
    float _476 = fma(_441, 0.5, _421);
    float _478 = fma(_441, -0.5, _421);
    float _480 = fma(_447, 0.5, _445);
    float _482 = fma(_447, -0.5, _445);
    float _484 = rint(_249);
    float _486 = precise::max(_484, 0.0);
    uint _488 = uint(_486);
    uint _490 = clamp(_488, 0u, 65535u);
    float _492 = fma(_470, 0.5, _468);
    float _494 = _423 * _474;
    float _496 = fma(_64, 2.0, -1.0);
    float _498 = fma(_470, -0.5, _468);
    float _500 = fma(_62, 2.0, -1.0);
    float _502 = _439 * _474;
    float _504 = fma(_494, 0.5, _460);
    float _506 = _496 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _508 = fma(_494, -0.5, _460);
    float _510 = _500 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _512 = fma(_502, 0.5, _415);
    float _514 = fma(_502, -0.5, _415);
    float3 _1450 = float3(_462, _476, float(0));
    float3 _1454 = select(_1450, float3(0.0), isnan(_1450));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1454.xy, uint(rint(_1454.z)), _397);
    float3 _1461 = float3(_464, _476, float(0));
    float3 _1463 = select(_1461, float3(0.0), isnan(_1461));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1463.xy, uint(rint(_1463.z)), _397);
    float _520 = fma(_506, 2.0, _54);
    float _522 = fma(_510, 2.0, _52);
    float3 _1476 = float3(_462, _478, float(0));
    float3 _1478 = select(_1476, float3(0.0), isnan(_1476));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1478.xy, uint(rint(_1478.z)), _397);
    float3 _1485 = float3(_464, _478, float(0));
    float3 _1487 = select(_1485, float3(0.0), isnan(_1485));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1487.xy, uint(rint(_1487.z)), _397);
    float3 _1496 = float3(_482, _492, float(int(_456)));
    float3 _1498 = select(_1496, float3(0.0), isnan(_1496));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1498.xy, uint(rint(_1498.z)), _427);
    float3 _1507 = float3(_480, _492, float(int(_456)));
    float3 _1509 = select(_1507, float3(0.0), isnan(_1507));
    float _530 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1509.xy, uint(rint(_1509.z)), _427);
    float3 _1518 = float3(_480, _498, float(int(_456)));
    float3 _1520 = select(_1518, float3(0.0), isnan(_1518));
    float _532 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1520.xy, uint(rint(_1520.z)), _427);
    float3 _1529 = float3(_508, _512, float(int(_490)));
    float3 _1531 = select(_1529, float3(0.0), isnan(_1529));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1531.xy, uint(rint(_1531.z)), _474);
    float3 _1540 = float3(_504, _512, float(int(_490)));
    float3 _1542 = select(_1540, float3(0.0), isnan(_1540));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1542.xy, uint(rint(_1542.z)), _474);
    float3 _1551 = float3(_504, _514, float(int(_490)));
    float3 _1553 = select(_1551, float3(0.0), isnan(_1551));
    float _538 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1553.xy, uint(rint(_1553.z)), _474);
    float3 _1562 = float3(_482, _498, float(int(_456)));
    float3 _1564 = select(_1562, float3(0.0), isnan(_1562));
    float _540 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1564.xy, uint(rint(_1564.z)), _427);
    float3 _1573 = float3(_508, _514, float(int(_490)));
    float3 _1575 = select(_1573, float3(0.0), isnan(_1573));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1575.xy, uint(rint(_1575.z)), _474);
    float2 _1581 = float2(_522, _520);
    float _544 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1581, float2(0.0), isnan(_1581))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1581, float2(0.0), isnan(_1581))).x;
    float _546 = -_78;
    float _548 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _550 = _546 + _548;
    float _552 = _550 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _554 = precise::clamp(_552, 0.0, 1.0);
    float _556 = _516 + _518;
    float _558 = -_78;
    float _560 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _562 = _558 + _560;
    float _564 = _562 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _566 = precise::clamp(_564, 0.0, 1.0);
    float _568 = _556 + _524;
    float _570 = _530 + _528;
    float _572 = _568 + _526;
    float _574 = _570 + _532;
    float _576 = fma(_572, 0.25, _566);
    float _578 = _536 + _534;
    float _580 = _578 + _538;
    float _582 = _574 + _540;
    float _584 = _580 + _542;
    float _586 = _582 * 0.25;
    float _588 = _584 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _590 = _588 * 0.25;
    float _592 = fma(_586, (*spvDescriptorSet0.fp_c3)._m0[49].z, _590);
    float _594 = _554 + _592;
    out.m_45.x = _544;
    out.m_45.y = _576;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _594;
    return out;
}

