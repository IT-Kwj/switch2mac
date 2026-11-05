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
    float2 _611 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_611, float2(0.0), isnan(_611))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_611, float2(0.0), isnan(_611))).x;
    float2 _622 = float2(_52, _54);
    float2 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_622, float2(0.0), isnan(_622))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_622, float2(0.0), isnan(_622))).xy;
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
    float _84 = -_80;
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _88 = -_82;
    float _90 = _88 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _92 = -_82;
    float _94 = _92 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _96 = _80 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _98 = _86 * _86;
    float _100 = -_78;
    float _102 = _100 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _104 = _80 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _106 = _80 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _108 = fma(_90, _90, _98);
    float _110 = _80 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _112 = _80 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _114 = _80 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _116 = fma(_102, _102, _108);
    float _118 = -_80;
    float _120 = _118 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _122 = _80 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _124 = _80 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _126 = _80 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _128 = _120 * _120;
    float _130 = sqrt(_116);
    float _132 = _80 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _134 = fma(_94, _94, _128);
    float _136 = -_78;
    float _138 = _136 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _140 = _80 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _142 = _80 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _144 = _80 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _146 = fma(_138, _138, _134);
    float _148 = _80 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _150 = _80 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _152 = _80 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _154 = _80 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _156 = _80 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _158 = sqrt(_146);
    float _160 = _80 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    bool _164 = _130 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _166 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[0].x, _96);
    bool _168 = _130 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _170 = _80 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    bool _172 = !_164;
    int _175 = _172 ? 0 : 1;
    float _177 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[3].x, _104);
    float _179 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[19].x, _106);
    float _181 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[20].x, _110);
    float _183 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[23].x, _112);
    float _185 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[1].x, _114);
    float _187 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
    float _189 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[22].x, _124);
    float _191 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[21].x, _170);
    int _193 = 2;
    if (!_164)
    {
        _193 = 1;
    }
    int _195 = _193;
    float _197 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[16].x, _126);
    bool _199 = _158 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _201 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[17].x, _132);
    bool _203 = _158 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _205 = _80 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _207 = _80 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    int _209 = _195;
    if (!_168)
    {
        _209 = _175;
    }
    int _211 = _209;
    float _213 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[18].x, _140);
    bool _215 = !_199;
    int _217 = _215 ? 0 : 1;
    float _219 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[24].x, _205);
    float _221 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[25].x, _142);
    float _223 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[26].x, _144);
    float _225 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[27].x, _148);
    float _227 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[28].x, _150);
    float _229 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[29].x, _152);
    float _231 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[30].x, _154);
    float _233 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[31].x, _156);
    float _235 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[32].x, _160);
    float _237 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[3].z, _177);
    float _239 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[33].x, _207);
    float _241 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[20].z, _181);
    float _243 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[0].z, _166);
    int _245 = 2;
    if (!_199)
    {
        _245 = 1;
    }
    int _247 = _245;
    float _249 = _237 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    int _251 = _247;
    if (!_203)
    {
        _251 = _217;
    }
    int _253 = _251;
    float _255 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[1].z, _185);
    float _257 = float(_211);
    float _259 = _243 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _261 = 1.0 / _249;
    float _263 = precise::min(_257, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _265 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[19].z, _179);
    float _267 = float(_253);
    float _269 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[21].z, _191);
    bool _271 = _263 != 1.0;
    bool _273 = isnan(_263);
    bool _275 = _271 || _273;
    bool _277 = isnan(1.0);
    bool _279 = _275 || _277;
    float _281 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[22].z, _189);
    float _283 = precise::min(_267, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _285 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[23].z, _183);
    bool _287 = _263 != 0.0;
    bool _289 = isnan(_263);
    bool _291 = _287 || _289;
    bool _293 = isnan(0.0);
    bool _295 = _291 || _293;
    float _297 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[24].z, _219);
    bool _299 = _283 != 1.0;
    bool _301 = isnan(_283);
    bool _303 = _299 || _301;
    bool _305 = isnan(1.0);
    bool _307 = _303 || _305;
    float _309 = _265 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _311 = _241 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _313 = _269 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _315 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[29].z, _229);
    float _317 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[32].z, _235);
    float _319 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].z, _187);
    float _321 = _309;
    float _323 = _311;
    float _325 = _313;
    if (_279)
    {
        float _327 = _281 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _321 = _327;
    }
    float _329 = _321;
    float _331 = _329;
    if (_279)
    {
        float _333 = _285 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _323 = _333;
    }
    float _335 = _323;
    float _337 = _335;
    if (_279)
    {
        float _339 = _297 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _325 = _339;
    }
    float _341 = _325;
    bool _343 = _283 != 0.0;
    bool _345 = isnan(_283);
    bool _347 = _343 || _345;
    bool _349 = isnan(0.0);
    bool _351 = _347 || _349;
    float _353 = _315 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _355 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[18].z, _213);
    float _357 = _255 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _359 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[28].z, _227);
    float _361 = _353;
    float _363 = _341;
    if (_307)
    {
        float _365 = _317 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _361 = _365;
    }
    float _367 = _361;
    float _369 = _319 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _371 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[31].z, _233);
    float _373 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[17].z, _201);
    float _375 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[16].z, _197);
    float _377 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[30].z, _231);
    float _379 = _367;
    if (!_295)
    {
        float _381 = _355 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _363 = _381;
    }
    float _383 = _363;
    float _385 = _357 * _261;
    float _387 = _359 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _389 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[33].z, _239);
    float _391 = _259 * _261;
    float _393 = _369 * _261;
    float _395 = precise::clamp(_393, 0.0, 1.0);
    float _397 = _387;
    if (_307)
    {
        float _399 = _371 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _397 = _399;
    }
    float _401 = _397;
    float _403 = _401;
    if (!_295)
    {
        float _405 = _373 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _337 = _405;
    }
    float _407 = _337;
    float _409 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[27].z, _225);
    if (!_295)
    {
        float _411 = _375 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _331 = _411;
    }
    float _413 = _331;
    float _415 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[25].z, _221);
    float _417 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _419 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _421 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _423 = _377 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _425 = 0.0 + _383;
    float _427 = precise::clamp(_425, 0.0, 1.0);
    float _429 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _431 = _423;
    if (_307)
    {
        float _433 = _389 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _431 = _433;
    }
    float _435 = _431;
    float _437 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[26].z, _223);
    float _439 = _435;
    if (!_351)
    {
        float _441 = _409 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _439 = _441;
    }
    float _443 = _439;
    if (!_351)
    {
        float _445 = _415 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _403 = _445;
    }
    float _447 = _403;
    float _449 = rint(_395);
    float _451 = precise::max(_449, 0.0);
    uint _454 = uint(_451);
    uint _456 = clamp(_454, 0u, 65535u);
    float _458 = _427 * _429;
    if (!_351)
    {
        float _460 = _437 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _379 = _460;
    }
    float _462 = _379;
    float _464 = fma(_417, 0.5, _391);
    float _466 = 0.0 + _443;
    float _468 = precise::clamp(_466, 0.0, 1.0);
    float _470 = fma(_417, -0.5, _391);
    float _472 = _427 * _421;
    float _474 = rint(_263);
    float _476 = precise::max(_474, 0.0);
    uint _478 = uint(_476);
    uint _480 = clamp(_478, 0u, 65535u);
    float _482 = fma(_458, 0.5, _407);
    float _484 = fma(_458, -0.5, _407);
    float _486 = fma(_419, 0.5, _385);
    float _488 = _429 * _468;
    float _490 = fma(_419, -0.5, _385);
    float _492 = _421 * _468;
    float _494 = fma(_472, 0.5, _413);
    float _496 = rint(_283);
    float _498 = precise::max(_496, 0.0);
    uint _500 = uint(_498);
    uint _502 = clamp(_500, 0u, 65535u);
    float _504 = fma(_62, 2.0, -1.0);
    float _506 = fma(_472, -0.5, _413);
    float _508 = fma(_64, 2.0, -1.0);
    float _510 = fma(_488, 0.5, _462);
    float _512 = fma(_492, 0.5, _447);
    float _514 = fma(_488, -0.5, _462);
    float _516 = fma(_492, -0.5, _447);
    float _518 = _504 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _520 = _508 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _522 = fma(_518, 2.0, _52);
    float _524 = fma(_520, 2.0, _54);
    float3 _1470 = float3(_470, _486, float(int(_456)));
    float3 _1474 = select(_1470, float3(0.0), isnan(_1470));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1474.xy, uint(rint(_1474.z)), 1.0);
    float3 _1482 = float3(_464, _486, float(int(_456)));
    float3 _1484 = select(_1482, float3(0.0), isnan(_1482));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1484.xy, uint(rint(_1484.z)), 1.0);
    float3 _1492 = float3(_464, _490, float(int(_456)));
    float3 _1494 = select(_1492, float3(0.0), isnan(_1492));
    float _530 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1494.xy, uint(rint(_1494.z)), 1.0);
    float3 _1502 = float3(_470, _490, float(int(_456)));
    float3 _1504 = select(_1502, float3(0.0), isnan(_1502));
    float _532 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1504.xy, uint(rint(_1504.z)), 1.0);
    float3 _1512 = float3(_506, _482, float(int(_480)));
    float3 _1514 = select(_1512, float3(0.0), isnan(_1512));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1514.xy, uint(rint(_1514.z)), _427);
    float3 _1523 = float3(_494, _482, float(int(_480)));
    float3 _1525 = select(_1523, float3(0.0), isnan(_1523));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1525.xy, uint(rint(_1525.z)), _427);
    float3 _1534 = float3(_494, _484, float(int(_480)));
    float3 _1536 = select(_1534, float3(0.0), isnan(_1534));
    float _538 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1536.xy, uint(rint(_1536.z)), _427);
    float3 _1545 = float3(_516, _510, float(int(_502)));
    float3 _1547 = select(_1545, float3(0.0), isnan(_1545));
    float _540 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1547.xy, uint(rint(_1547.z)), _468);
    float3 _1556 = float3(_512, _510, float(int(_502)));
    float3 _1558 = select(_1556, float3(0.0), isnan(_1556));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1558.xy, uint(rint(_1558.z)), _468);
    float3 _1567 = float3(_512, _514, float(int(_502)));
    float3 _1569 = select(_1567, float3(0.0), isnan(_1567));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1569.xy, uint(rint(_1569.z)), _468);
    float3 _1578 = float3(_506, _484, float(int(_480)));
    float3 _1580 = select(_1578, float3(0.0), isnan(_1578));
    float _546 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1580.xy, uint(rint(_1580.z)), _427);
    float3 _1589 = float3(_516, _514, float(int(_502)));
    float3 _1591 = select(_1589, float3(0.0), isnan(_1589));
    float _548 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1591.xy, uint(rint(_1591.z)), _468);
    float2 _1597 = float2(_522, _524);
    float _550 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1597, float2(0.0), isnan(_1597))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1597, float2(0.0), isnan(_1597))).x;
    float _552 = -_78;
    float _554 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _556 = _552 + _554;
    float _558 = _556 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _560 = precise::clamp(_558, 0.0, 1.0);
    float _562 = _528 + _526;
    float _564 = -_78;
    float _566 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _568 = _564 + _566;
    float _570 = _562 + _530;
    float _572 = _568 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _574 = precise::clamp(_572, 0.0, 1.0);
    float _576 = _570 + _532;
    float _578 = _536 + _534;
    float _580 = fma(_576, 0.25, _574);
    float _582 = _578 + _538;
    float _584 = _542 + _540;
    float _586 = _584 + _544;
    float _588 = _582 + _546;
    float _590 = _586 + _548;
    float _592 = _588 * 0.25;
    float _594 = _590 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _596 = _594 * 0.25;
    float _598 = fma(_592, (*spvDescriptorSet0.fp_c3)._m0[49].z, _596);
    float _600 = _560 + _598;
    out.m_45.x = _550;
    out.m_45.y = _580;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _600;
    return out;
}

