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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_14Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_72 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3185 = false;
    bool _353 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_56.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_59.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3490 = as_type<float>(_125);
        out.gl_Position.z = _3490;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_61.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_59.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3560 = as_type<float>(_163);
        out.gl_Position.z = _3560;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = in.m_63.x;
    float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _169 = _143 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _171 = _143 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _173 = in.m_65.x;
    float _175 = in.m_65.y;
    float _177 = in.m_65.z;
    float _179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _181 = _169 * _167;
    float _183 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _181);
    float _185 = _171 * _179;
    float _187 = floor(_183);
    float _189 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].y, _185);
    float _191 = _183 * 6.283185482025146484375;
    float _193 = _175 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _195 = _191 * 0.15915493667125701904296875;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = floor(_189);
    float _203 = _189 * 6.283185482025146484375;
    float _205 = _175 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _209 = _207 != 0;
    int _211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _213 = _211 != 0;
    float _215 = _175 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _217 = _203 * 0.15915493667125701904296875;
    float _219 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].x, _205);
    float _221 = -_187;
    float _223 = _183 + _221;
    bool _225 = !_209;
    int _227 = _225 ? 0 : 1;
    float _229 = _195 * 6.283185482025146484375;
    float _231 = cos(_229);
    float _233 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].x, _193);
    float _235 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].x, _215);
    float _237 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _219);
    float _239 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _233);
    float _241 = -_201;
    float _243 = _189 + _241;
    int _245 = abs(_227);
    float _247 = _217 * 6.283185482025146484375;
    float _249 = cos(_247);
    bool _251 = !_199;
    int _253 = _251 ? 0 : 1;
    float _255 = -_223;
    float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _259 = -_243;
    float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _265 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _235);
    int _267 = abs(_253);
    float _269 = float(_245);
    float _271 = fma(_231, 0.5, 0.5);
    bool _273 = !_213;
    int _275 = _273 ? 0 : 1;
    bool _277 = _223 < 0.5;
    float _279 = float(_277);
    float _281 = abs(_257);
    float _283 = _269 * _281;
    int _285 = abs(_275);
    float _287 = abs(_261);
    float _289 = _269 * _287;
    float _291 = fma(_249, 0.5, 0.5);
    float _293 = float(_267);
    float _295 = -_271;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _299 = -_291;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _303 = _243 < 0.5;
    float _305 = float(_303);
    float _307 = -_279;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = float(_285);
    float _313 = fma(_293, _297, _283);
    float _315 = fma(_293, _301, _289);
    float _317 = -_305;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _321 = abs(_309);
    float _323 = fma(_311, _321, _313);
    float _325 = abs(_319);
    float _327 = fma(_311, _325, _315);
    bool _329 = !_263;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _349;
    float _351;
    if (!_329)
    {
        float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _335 = _165 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _337 = float(_109);
        float _339 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _341 = _339 * _333;
        float _343 = floor(_341);
        float _345 = -_343;
        float _347 = _341 + _345;
        _349 = _347;
        _351 = _337;
        _353 = true;
    }
    else
    {
        float _355 = float(_109);
        float _357 = 1.0 / _355;
        float _359 = _143 * _357;
        _349 = _359;
        _351 = _355;
    }
    _353 = false;
    float _361 = _349;
    float _363 = _351;
    float _365 = in.m_56.x;
    float _367 = in.m_56.y;
    float _369 = in.m_56.z;
    float _371 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _373 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _375 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _371);
    float _377 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _373);
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _375);
    float _381 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _377);
    float _383 = _379 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _385 = _381 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _387 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _389 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _391 = floor(_387);
    float _393 = floor(_389);
    float _395 = -_391;
    float _397 = _387 + _395;
    float _399 = -_393;
    float _401 = _389 + _399;
    float2 _3929 = float2(_397, _401);
    float _403 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3929, float2(0.0), isnan(_3929)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3929, float2(0.0), isnan(_3929)), level(0.0)).x;
    float _405 = in.m_63.z;
    float _407 = _165 * 2.0;
    float _409 = _165 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _411 = in.m_63.y;
    float _413 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _415 = floor(_407);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _423 = _361 + _421;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _427 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _413);
    float _429 = -_425;
    float _431 = fma(_409, 2.0, _429);
    float _433 = 1.0 / _419;
    float _435 = as_type<float>(int(gl_VertexIndex));
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _439 = -_143;
    float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[76].x, _431);
    float _443 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _445 = _415 > 0.0;
    float _447 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _449 = int(_447);
    bool _451 = _415 >= 0.0;
    bool _453 = isnan(_415);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = _405 * 2.0;
    float _463 = _165 + _411;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _475 = _473 != 0;
    float _477 = _411 * 2.0;
    float _479 = _423 * _433;
    float _481 = floor(_461);
    float _483 = _463 + (-1.0);
    bool _485 = !_471;
    int _487 = _485 ? 0 : 1;
    float _489 = _411 + _405;
    bool _491 = !_467;
    int _493 = _491 ? 0 : 1;
    float _495 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _497 = !_475;
    float _499 = _497 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _501 = _489 + (-1.0);
    float _503 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _505 = log2(_503);
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _509 = _507 != 0;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _513 = _511 != 0;
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _517 = _515 != 0;
    float _519 = _165 + _405;
    float _521 = _411 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _523 = _459 ? 0 : 1;
    float _525 = _519 + (-1.0);
    float _527 = _405 + (-0.5);
    bool _529 = _481 > 0.0;
    float _531 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _533 = _481 >= 0.0;
    bool _535 = isnan(_481);
    bool _537 = _533 || _535;
    bool _539 = isnan(0.0);
    bool _541 = _537 || _539;
    float _543 = floor(_477);
    bool _545 = !_513;
    int _547 = _545 ? 0 : 1;
    float _549 = fma(_521, -2.0, _437);
    int _551 = _541 ? 0 : 1;
    float _553 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _555 = ~_523;
    int _557 = _555 + 1;
    int _559 = _557 + 1;
    float _561 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _549);
    int _563 = _559;
    int _565 = 2;
    float _567 = _499;
    if (!_445)
    {
        int _569 = ~_523;
        int _571 = _569 + 1;
        _563 = _571;
    }
    int _573 = _563;
    float _575 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _577 = int(_575);
    int _579 = abs(_547);
    int _581 = ~_551;
    int _583 = _581 + 1;
    int _585 = _583 + 1;
    int _587 = _585;
    if (!_529)
    {
        int _589 = ~_551;
        int _591 = _589 + 1;
        _587 = _591;
    }
    int _593 = _587;
    float _595 = _505 * _143;
    float _597 = float(_449);
    float _599 = float(_573);
    float _601 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _427);
    float _603 = float(_579);
    float _605 = exp2(_595);
    bool _607 = _543 > 0.0;
    float _609 = _601 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _611 = _543 >= 0.0;
    bool _613 = isnan(_543);
    bool _615 = _611 || _613;
    bool _617 = isnan(0.0);
    bool _619 = _615 || _617;
    float _621 = _603 * _599;
    float _623 = in.m_70.x;
    float _625 = in.m_70.y;
    float _627 = in.m_70.z;
    float _629 = _609 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _631 = 1.0 / _597;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _635 = 1.0 + _633;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _639 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[11].x, _629);
    bool _641 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _643 = isnan(1.0);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _649 = _645 || _647;
    float _651 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _653 = !_509;
    int _655 = _653 ? 0 : 1;
    float _657 = 1.0 / _635;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _661 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[78].w, _637);
    float _663 = -_605;
    float _665 = _663 + 1.0;
    float _667 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[11].z, _639);
    bool _669 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _671 = isnan(0.0);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _677 = _673 || _675;
    float _679 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[78].z, _659);
    float _681 = float(_577);
    float _683 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _661);
    int _685 = abs(_655);
    float _687 = _609 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _689 = _667 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _691 = _677 ? _665 : 0.0;
    float _693 = _681 * _143;
    float _695 = float(_685);
    float _697 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[10].x, _687);
    float _699 = float(_593);
    float _701 = 1.0 / _689;
    float _703 = _631 * _143;
    float _705 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _679);
    if (_649)
    {
        float _707 = _691 * _657;
        _145 = _707;
    }
    float _709 = _145;
    float _711 = _621 * (-2.0);
    float _713 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[10].z, _697);
    float _715 = _695 * _699;
    float _717 = _411 + (-0.5);
    float _719 = fma(_711, _625, _625);
    float _721 = _713 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _723 = _715 * (-2.0);
    int _725 = _619 ? 0 : 1;
    float _727 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[196].y, _719);
    float _729 = _721 + _689;
    float _731 = _165 + (-0.5);
    float _733 = fma(_723, _623, _623);
    float _735 = _729 * _701;
    float _737 = _735 * 0.5;
    float _739 = fma(_531, _711, _531);
    float _741 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[196].x, _733);
    bool _743 = !_517;
    int _745 = _743 ? 0 : 1;
    float _747 = fma(_495, _723, _495);
    int _749 = ~_725;
    int _751 = _749 + 1;
    int _753 = _751 + 1;
    float _755 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _757 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[30].w, _755);
    int _759 = _753;
    if (!_607)
    {
        int _761 = ~_725;
        int _763 = _761 + 1;
        _759 = _763;
    }
    int _765 = _759;
    float _767 = fma(_739, _709, _727);
    int _769 = abs(_745);
    float _771 = fma(_747, _709, _741);
    bool _773 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _775 = isnan(_361);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = _767 * 0.15915493667125701904296875;
    float _787 = in.m_72.x;
    float _789 = in.m_72.y;
    float _791 = -_783;
    float _793 = _791 + 1.0;
    float _795 = float(_769);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _797;
    float _801 = float(_765);
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _803;
    bool _807 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _809 = isnan(_361);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = fma(_799, _479, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _821 = 1.0 / _757;
    float _823 = _795 * _801;
    float _825 = fma(_805, _479, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _827 = _817 * _793;
    float _829 = -_817;
    float _831 = _829 + 1.0;
    float _833 = _823 * (-2.0);
    float _835 = _771 * 0.15915493667125701904296875;
    float _837 = _819 * _827;
    float _839 = _825 * _827;
    float _841 = fma(_833, _627, _627);
    float _843 = fma(_553, _833, _553);
    float _845 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[143].x, _837);
    float _847 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[143].y, _839);
    float _849 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[196].z, _841);
    float _851 = _785 * 6.283185482025146484375;
    float _853 = sin(_851);
    float _855 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[144].x, _845);
    float _857 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[144].y, _847);
    float _859 = fma(_843, _709, _849);
    int _861 = as_type<int>(_435) & 1;
    bool _863 = _861 != 0;
    int _865 = as_type<int>(_435) & 2;
    bool _867 = _865 != 0;
    float _869 = _855 * _787;
    float _871 = _857 * _789;
    float _873 = _859 * 0.15915493667125701904296875;
    float _875 = _785 * 6.283185482025146484375;
    float _877 = cos(_875);
    bool _879 = !_867;
    float _881 = _879 ? (-0.5) : 0.5;
    float _883 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _885 = _821 * _883;
    bool _887 = !_863;
    float _889 = _887 ? (-0.5) : 0.5;
    float _891 = _327 * _871;
    float _893 = _323 * _869;
    float _895 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _881);
    bool _897 = _885 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _899 = _835 * 6.283185482025146484375;
    float _901 = sin(_899);
    float _903 = _891 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _905 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _889);
    float _907 = _893 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _909 = _885 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _911 = _609 + _651;
    float _913 = _903 * _895;
    float _915 = _907 * _905;
    float _917 = _835 * 6.283185482025146484375;
    float _919 = cos(_917);
    float _921 = _911 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    if (!_897)
    {
        _565 = 1;
    }
    int _923 = _565;
    float _925 = _873 * 6.283185482025146484375;
    float _927 = cos(_925);
    float _929 = _901 * _853;
    float _931 = _901 * _877;
    float _933 = _873 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = _919 * _877;
    float _939 = _919 * _853;
    float _941 = _877 * _927;
    float _943 = _901 * _927;
    float _945 = _919 * _927;
    float _947 = _853 * _927;
    float _949 = fma(_935, _937, _929);
    float _951 = fma(_935, _929, _937);
    bool _953 = !_897;
    int _955 = _953 ? 0 : 1;
    float _957 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[126].x, _921);
    float _959 = -_939;
    float _961 = fma(_935, _931, _959);
    float _963 = -_931;
    float _965 = fma(_935, _939, _963);
    int _967 = _923;
    if (!_909)
    {
        _967 = _955;
    }
    int _969 = _967;
    float _971 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[126].z, _957);
    float _973 = _911 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _975 = _945 * _913;
    int _977 = _969 << 6;
    float _979 = _971 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _981 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[127].x, _973);
    float _983 = -_913;
    float _985 = _935 * _983;
    float _987 = fma(_949, _915, _975);
    float _989 = _943 * _913;
    float _991 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[127].z, _981);
    float _993 = fma(_941, _915, _985);
    float _995 = fma(_965, _443, _987);
    float _997 = fma(_961, _915, _989);
    float _999 = _991 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1001 = fma(_947, _443, _993);
    float _1003 = _995 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1005 = _995 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1007 = fma(_951, _443, _997);
    float _1009 = trunc(_979);
    int _1011 = int(_1009);
    float _1013 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1003);
    float _1015 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1005);
    int _1017 = _977 + 64;
    uint _1020 = uint(int(uint(_1017) >> uint(2)));
    uint _1022 = uint(int(uint(int(_1020)) >> uint(2)));
    int _1024 = int(_1020) & 3;
    float _1026 = (*spvDescriptorSet0.vp_c15)._m0[int(_1022)][_1024];
    int _1028 = int(_1020) + 1;
    uint _1030 = uint(int(uint(_1028) >> uint(2)));
    int _1032 = _1028 & 3;
    float _1034 = (*spvDescriptorSet0.vp_c15)._m0[int(_1030)][_1032];
    float _1036 = _995 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1038 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1013);
    float _1040 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1015);
    float _1042 = trunc(_999);
    int _1044 = int(_1042);
    float _1046 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1048 = _1040 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1050 = _977 + 48;
    uint _1052 = uint(int(uint(_1050) >> uint(2)));
    uint _1054 = uint(int(uint(int(_1052)) >> uint(2)));
    int _1056 = int(_1052) & 3;
    float _1058 = (*spvDescriptorSet0.vp_c15)._m0[int(_1054)][_1056];
    int _1060 = int(_1052) + 1;
    uint _1062 = uint(int(uint(_1060) >> uint(2)));
    int _1064 = _1060 & 3;
    float _1066 = (*spvDescriptorSet0.vp_c15)._m0[int(_1062)][_1064];
    float _1068 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1036);
    float _1070 = _385 + _1046;
    float _1072 = _383 + _1048;
    int _1074 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1076 = _1011 + _1074;
    int _1078 = _1076 + 1;
    float _1080 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1082 = _1070 + _1080;
    float _1084 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1068);
    int _1086 = _977 + 56;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.vp_c15)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
    bool _1104 = _1078 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1106 = _1082 * _1082;
    float _1108 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1110 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1112 = _1044 + _1110;
    int _1114 = _1112 + 1;
    float _1116 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1118 = _1072 + _1116;
    float _1120 = _609 + _1108;
    int _1122 = _977 + 72;
    uint _1124 = uint(int(uint(_1122) >> uint(2)));
    uint _1126 = uint(int(uint(int(_1124)) >> uint(2)));
    int _1128 = int(_1124) & 3;
    float _1130 = (*spvDescriptorSet0.vp_c15)._m0[int(_1126)][_1128];
    int _1132 = int(_1124) + 1;
    uint _1134 = uint(int(uint(_1132) >> uint(2)));
    int _1136 = _1132 & 3;
    float _1138 = (*spvDescriptorSet0.vp_c15)._m0[int(_1134)][_1136];
    int _1140 = _1078 | _1114;
    float _1142 = fma(_1118, _1118, _1106);
    bool _1144 = _1140 < 0;
    bool _1146 = _1144 || _1104;
    float _1148 = sqrt(_1142);
    int _1150 = _977 + 96;
    uint _1152 = uint(int(uint(_1150) >> uint(2)));
    uint _1154 = uint(int(uint(int(_1152)) >> uint(2)));
    int _1156 = int(_1152) & 3;
    float _1158 = (*spvDescriptorSet0.vp_c15)._m0[int(_1154)][_1156];
    int _1160 = int(_1152) + 1;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    int _1164 = _1160 & 3;
    float _1166 = (*spvDescriptorSet0.vp_c15)._m0[int(_1162)][_1164];
    bool _1168 = _1114 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1170 = _1168 || _1146;
    int _1172 = _977 + 104;
    uint _1174 = uint(int(uint(_1172) >> uint(2)));
    uint _1176 = uint(int(uint(int(_1174)) >> uint(2)));
    int _1178 = int(_1174) & 3;
    float _1180 = (*spvDescriptorSet0.vp_c15)._m0[int(_1176)][_1178];
    int _1182 = int(_1174) + 1;
    uint _1184 = uint(int(uint(_1182) >> uint(2)));
    int _1186 = _1182 & 3;
    float _1188 = (*spvDescriptorSet0.vp_c15)._m0[int(_1184)][_1186];
    int _1190 = as_type<int>(_1001);
    int _1192 = as_type<int>(_1007);
    int _1194 = _1078;
    float _1196 = _1120;
    float _1198 = _1072;
    float _1200 = _1070;
    float _1202 = as_type<float>(_977);
    if (!_1170)
    {
        int _1204 = _1114 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1206 = _1204 + _1078;
        _1190 = _1206;
    }
    int _1208 = _1190;
    bool _1210 = _1148 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = as_type<float>(_1208);
    if (!_1170)
    {
        int _1214 = _1208 << 2;
        _1192 = _1214;
    }
    int _1216 = _1192;
    int _1218 = _1216;
    if (!_1170)
    {
        uint _1220 = uint(int(uint(_1208) >> uint(2)));
        _1194 = int(_1220);
    }
    int _1222 = _1194;
    float _1224 = as_type<float>(_1222);
    if (!_1170)
    {
        int _1226 = 12 & _1216;
        _1218 = _1226;
    }
    int _1228 = _1218;
    float _1230 = as_type<float>(_1228);
    if (!_1170)
    {
        int _1232 = _1222 << 4;
        int _1234 = _1232 + _1228;
        _1224 = as_type<float>(_1234);
    }
    float _1236 = _1224;
    bool _1238 = !_1210;
    float _1240 = _1066;
    if (!_1238)
    {
        float _1242 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1244 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1246 = _1148 + _1244;
        float _1248 = _1120 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1250 = rsqrt(_1142);
        float _1252 = _1246 * _1242;
        float _1254 = _1252 * 0.15915493667125701904296875;
        float _1256 = _1254 * 6.283185482025146484375;
        float _1258 = cos(_1256);
        float _1260 = _1254 * 6.283185482025146484375;
        float _1262 = sin(_1260);
        float _1264 = _1258 + (-1.0);
        float _1266 = fma(_1262, _1248, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1268 = _1264 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1270 = _1250 * _1266;
        float _1272 = fma(_1120, _1258, _1268);
        float _1274 = fma(_1118, _1270, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1276 = fma(_1082, _1270, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1196 = _1272;
        _1198 = _1274;
        _1200 = _1276;
        _1230 = _1262;
    }
    float _1278 = _1196;
    float _1280 = _1198;
    float _1282 = _1200;
    float _1284 = _1230;
    float _1286 = -_609;
    float _1288 = _1286 + _1278;
    int _1290 = _977 + 80;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    uint _1294 = uint(int(uint(int(_1292)) >> uint(2)));
    int _1296 = int(_1292) & 3;
    float _1298 = (*spvDescriptorSet0.vp_c15)._m0[int(_1294)][_1296];
    int _1300 = int(_1292) + 1;
    uint _1302 = uint(int(uint(_1300) >> uint(2)));
    int _1304 = _1300 & 3;
    float _1306 = (*spvDescriptorSet0.vp_c15)._m0[int(_1302)][_1304];
    float _1308 = -_383;
    float _1310 = _1308 + _1280;
    float _1312 = -_385;
    float _1314 = _1312 + _1282;
    float _1316 = _1288 * _1288;
    float _1318 = _911 * _1166;
    float _1320 = _1284;
    float _1322 = _1280;
    float _1324 = _1282;
    float _1326 = _1278;
    if (!_1170)
    {
        float _1328 = floor(_979);
        _1320 = _1328;
    }
    float _1330 = _1320;
    float _1332 = _911 * _1034;
    float _1334 = fma(_1310, _1310, _1316);
    int _1336 = _977 + 88;
    uint _1338 = uint(int(uint(_1336) >> uint(2)));
    uint _1340 = uint(int(uint(int(_1338)) >> uint(2)));
    int _1342 = int(_1338) & 3;
    float _1344 = (*spvDescriptorSet0.vp_c15)._m0[int(_1340)][_1342];
    int _1346 = int(_1338) + 1;
    uint _1348 = uint(int(uint(_1346) >> uint(2)));
    int _1350 = _1346 & 3;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[int(_1348)][_1350];
    float _1354 = fma(_383, _1158, _1318);
    float _1356 = fma(_383, _1026, _1332);
    float _1358 = fma(_1314, _1314, _1334);
    float _1360 = fma(_385, _1180, _1354);
    float _1362 = _911 * _1066;
    float _1364 = sqrt(_1358);
    float _1366 = _1236;
    if (!_1170)
    {
        int _1368 = as_type<int>(_1236) + 400;
        uint _1370 = uint(int(uint(_1368) >> uint(2)));
        uint _1372 = uint(int(uint(int(_1370)) >> uint(2)));
        int _1374 = int(_1370) & 3;
        float _1376 = (*spvDescriptorSet0.vp_c15)._m0[int(_1372)][_1374];
        _1366 = _1376;
    }
    float _1378 = _1366;
    float _1380 = _1360 + _1188;
    float _1382 = fma(_383, _1058, _1362);
    bool _1384 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1386 = isnan(0.5);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1392 = _1388 || _1390;
    float _1394 = fma(_385, _1094, _1382);
    float _1396 = _1180;
    float _1398 = _1394;
    if (!_1170)
    {
        float _1400 = floor(_999);
        _1396 = _1400;
    }
    float _1402 = _1396;
    float _1404 = fma(_385, _1130, _1356);
    float _1406 = _1394 + _1102;
    float _1408 = _1404 + _1138;
    bool _1410 = _1364 > 0.0;
    float _1412 = 1.0 / _1380;
    float _1414 = _1406;
    if (!_1410)
    {
        _1240 = _1278;
    }
    float _1416 = _1240;
    bool _1418 = !_1410;
    float _1420 = _1416;
    if (!_1418)
    {
        float _1422 = _239 * _239;
        float _1424 = rsqrt(_1358);
        float _1426 = fma(_237, _237, _1422);
        float _1428 = fma(_265, _265, _1426);
        float _1430 = sqrt(_1428);
        float _1432 = _1310 * _1424;
        float _1434 = _1288 * _1424;
        float _1436 = _1314 * _1424;
        bool _1438 = _1430 > 0.0;
        float _1440 = _1430;
        _1398 = _1428;
        if (!_1438)
        {
            _1440 = _1278;
        }
        float _1442 = _1440;
        bool _1444 = !_1438;
        _1420 = _1442;
        if (!_1444)
        {
            float _1446 = rsqrt(_1428);
            float _1448 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1450 = _239 * _1446;
            float _1452 = _237 * _1446;
            float _1454 = _265 * _1446;
            float _1456 = _1434 * _1450;
            float _1458 = fma(_1432, _1452, _1456);
            float _1460 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1462 = fma(_1436, _1454, _1458);
            float _1464 = _1462 * _1460;
            float _1466 = fma(_237, _1464, _1280);
            float _1468 = fma(_239, _1464, _1278);
            float _1470 = fma(_265, _1464, _1282);
            _1322 = _1466;
            _1324 = _1470;
            _1420 = _1468;
        }
    }
    float _1472 = _1322;
    float _1474 = _1324;
    float _1476 = _1420;
    float _1478 = _1398;
    float _1480 = _1478;
    float _1482 = _1476;
    float _1484 = _1472;
    if (_1392)
    {
        _1480 = _1472;
    }
    float _1486 = _1480;
    float _1488 = _1486;
    if (_1392)
    {
        _1326 = _1474;
    }
    float _1490 = _1326;
    float _1492 = _1490;
    if (!_1392)
    {
        float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1496 = _609 + _1494;
        float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1500 = _383 + _1498;
        float _1502 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1504 = -_385;
        float _1506 = _1504 + _1474;
        float _1508 = _1496 * _1496;
        float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1512 = _385 + _1510;
        float _1514 = fma(_1500, _1500, _1508);
        float _1516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1518 = fma(_1512, _1512, _1514);
        float _1520 = sqrt(_1518);
        float _1522 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1524 = precise::min(_1520, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1526 = _1524 * _1516;
        float _1528 = -_609;
        float _1530 = _1528 + _1476;
        float _1532 = _1522 * _1526;
        float _1534 = -_383;
        float _1536 = _1534 + _1472;
        float _1538 = fma(_1530, _1532, _609);
        float _1540 = fma(_1536, _1532, _383);
        float _1542 = fma(_1506, _1532, _385);
        _1482 = _1538;
        _1488 = _1540;
        _1492 = _1542;
    }
    float _1544 = _1482;
    float _1546 = _1488;
    float _1548 = _1492;
    float _1550 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1552 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1554 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1556 = _1406 * _1412;
    float _1558 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1550);
    float _1560 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1552);
    float _1562 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1554);
    float _1564 = _1408 * _1412;
    float _1566 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1558);
    bool _1568 = _1556 >= 0.0;
    float _1570 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1560);
    float _1572 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1562);
    float _1574 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1576 = _1566 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1578 = _1556 <= 1.0;
    bool _1580 = _1578 && _1568;
    float _1582 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1584 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1574);
    float _1586 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1588 = _1570 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1590 = _1564 >= 0.0;
    bool _1592 = _1590 && _1580;
    float _1594 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1584);
    float _1596 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1586);
    float _1598 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1600 = _1588 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1602 = _1564 <= 1.0;
    bool _1604 = _1602 && _1592;
    float _1606 = _1594 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1608 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1596);
    float _1610 = -_1600;
    float _1612 = fma(_1610, _1598, 1.0);
    if (!_1170)
    {
        float _1614 = rint(_1378);
        float _1616 = precise::max(_1614, 0.0);
        uint _1618 = uint(_1616);
        uint _1620 = clamp(_1618, 0u, 65535u);
        _1414 = as_type<float>(_1620);
    }
    float _1622 = _1414;
    float _1624 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1626 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1608);
    float _1628 = _911 * _1306;
    float _1630 = _1624;
    if (!_1170)
    {
        float _1632 = -_1402;
        float _1634 = _999 + _1632;
        _1484 = _1634;
    }
    float _1636 = _1484;
    float _1638 = fma(_383, _1298, _1628);
    float _1640 = 1.0 / _1626;
    float _1642 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (_1604)
    {
        float _1644 = float(_969);
        _1202 = _1644;
    }
    float _1646 = _1202;
    float _1648 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1624);
    float _1650 = fma(_385, _1344, _1638);
    float _1652 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1642);
    if (!_1170)
    {
        float _1654 = -_1330;
        float _1656 = _979 + _1654;
        _1630 = _1656;
    }
    float _1658 = _1630;
    float _1660 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1648);
    float _1662 = log2(_1612);
    float _1664 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1652);
    float _1666 = _1650 + _1352;
    float _1668 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1660);
    float _1670 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1664);
    float _1672 = _1666 * _1412;
    float _1674 = _1638;
    if (_1604)
    {
        float _1676 = rint(_1646);
        float _1678 = precise::max(_1676, 0.0);
        uint _1680 = uint(_1678);
        uint _1682 = clamp(_1680, 0u, 65535u);
        _1674 = as_type<float>(_1682);
    }
    float _1684 = _1674;
    float _1686 = _1668 * _1640;
    float _1688 = _1670 * _1640;
    float _1690 = fma(_1686, 0.5, 0.5);
    float _1692 = fma(_1688, -0.5, 0.5);
    float _1694 = _1662 * 0.693147182464599609375;
    float _1696 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1698 = _1694;
    if (!_1170)
    {
        float3 _5992 = float3(_1658, _1636, float(as_type<int>(_1622)));
        float3 _5996 = select(_5992, float3(0.0), isnan(_5992));
        float _1700 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5996.xy, uint(rint(_5996.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5996.xy, uint(rint(_5996.z)), level(0.0)).x;
        _1698 = _1700;
    }
    float _1702 = _1698;
    float _1704 = _1564;
    if (_1604)
    {
        float3 _6011 = float3(_1556, _1564, float(as_type<int>(_1684)));
        float3 _6013 = select(_6011, float3(0.0), isnan(_6011));
        float _1706 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6013.xy, uint(rint(_6013.z)), _1672, level(0.0));
        _1704 = _1706;
    }
    float _1708 = _1704;
    float3 _6023 = float3(_1690, _1692, _1696);
    float _1710 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6023, float3(0.0), isnan(_6023)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6023, float3(0.0), isnan(_6023)), level(0.0)).x;
    float3 _6032 = float3(_1690, _1692, _1696);
    float4 _1713 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6032, float3(0.0), isnan(_6032)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6032, float3(0.0), isnan(_6032)), level(0.0)).xyzw;
    float _1715 = _1713.x;
    float _1717 = _1713.y;
    float _1719 = _1713.z;
    float _1721 = _1713.w;
    float _1723 = float(uint(_577));
    float _1725 = trunc(_703);
    int _1727 = int(_1725);
    int _1729 = abs(_493);
    float _1731 = 1.0 / _1723;
    int _1733 = ~_577;
    int _1735 = _1733 + 1;
    int _1737 = ~_577;
    int _1739 = _1737 + 1;
    float _1741 = float(uint(_1727));
    float _1743 = float(_1727);
    int _1745 = as_type<int>(_1731) + (-2);
    float _1747 = 1.0 / _363;
    int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1751 = _1749 != 0;
    float _1753 = as_type<float>(_1745) * _1741;
    float _1755 = trunc(_1753);
    float _1757 = precise::max(_1755, 0.0);
    uint _1759 = uint(_1757);
    int _1761 = abs(as_type<int>(_499));
    int _1763 = _1735 * int(_1759);
    int _1765 = _1763 + _1727;
    float _1767 = float(uint(_1765));
    float _1769 = as_type<float>(_1745) * _1767;
    int _1771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1773 = _1771 != 0;
    bool _1775 = _1743 >= _681;
    bool _1777 = isnan(_1743);
    bool _1779 = _1775 || _1777;
    bool _1781 = isnan(_681);
    bool _1783 = _1779 || _1781;
    float _1785 = float(_1783);
    float _1787 = trunc(_1769);
    float _1789 = precise::max(_1787, 0.0);
    uint _1791 = uint(_1789);
    bool _1793 = !_1773;
    float _1795 = _1793 ? 7.345489978790283203125 : 1.0;
    float _1797 = _1795 * _165;
    float _1799 = trunc(_1785);
    int _1801 = int(_1799);
    int _1803 = int(_1759) + int(_1791);
    float _1805 = floor(_1797);
    int _1807 = _1739 * _1803;
    int _1809 = _1807 + _1727;
    int _1811 = ~_1801;
    int _1813 = _1811 + 1;
    int _1815 = _1813 + 1;
    bool _1817 = uint(_1809) >= uint(_577);
    bool _1819 = !_1817;
    int _1821 = _1819 ? 0 : (-1);
    bool _1823 = _577 == 0;
    float _1825 = -_1805;
    float _1827 = _1797 + _1825;
    int _1829 = ~_1803;
    int _1831 = _1829 + _1821;
    int _1833 = _1831 + 1;
    float _1835 = _1827 * _681;
    float _1837 = _693 * _1747;
    int _1839 = _577 * _1833;
    int _1841 = _1839 + _1727;
    bool _1843 = !_1751;
    float _1845 = _1843 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1849 = _1847 != 0;
    float _1851 = trunc(_1835);
    int _1853 = int(_1851);
    bool _1855 = !_1823;
    int _1857 = _1855 ? _1841 : (-1);
    int _1859 = _577 + (-1);
    int _1861 = _1857 * _1815;
    int _1863 = abs(_487);
    float _1865 = trunc(_1837);
    int _1867 = int(_1865);
    int _1869 = abs(as_type<int>(_1845));
    int _1871 = _1801 * _1859;
    int _1873 = _1871 + _1861;
    bool _1875 = !_1849;
    int _1877 = _1875 ? 0 : 1;
    int _1879 = _1873 * _1863;
    bool _1881 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1883 = isnan(0.5);
    bool _1885 = _1881 || _1883;
    bool _1887 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1889 = _1885 || _1887;
    int _1891 = _1853 * _1869;
    int _1893 = _1891 + _1727;
    int _1895 = abs(_1877);
    float _1897 = _1845;
    float _1899 = as_type<float>(_1729);
    if (_1170)
    {
        _1897 = 1.0;
    }
    float _1901 = _1897;
    int _1903 = _1867 * _1729;
    int _1905 = _1903 + _1879;
    int _1907 = _1893 * _1761;
    int _1909 = _1907 + _1905;
    float _1911 = _1901;
    if (_1889)
    {
        _331 = 1.0;
    }
    float _1913 = _331;
    int _1915 = _1853 * _1895;
    int _1917 = _1915 + _1909;
    int _1919 = ~_577;
    int _1921 = _1919 + 1;
    float _1923 = _1913;
    if (_1889)
    {
        _567 = 1.0;
    }
    float _1925 = _567;
    float _1927 = float(uint(_1917));
    float _1929 = as_type<float>(_1745) * _1927;
    float _1931 = trunc(_1929);
    float _1933 = precise::max(_1931, 0.0);
    uint _1935 = uint(_1933);
    int _1937 = _1921 * int(_1935);
    int _1939 = _1937 + _1917;
    float _1941 = float(uint(_1939));
    float _1943 = as_type<float>(_1745) * _1941;
    float _1945 = trunc(_1943);
    float _1947 = precise::max(_1945, 0.0);
    uint _1949 = uint(_1947);
    int _1951 = int(_1935) + int(_1949);
    float _1953 = _1925;
    if (!_1889)
    {
        float _1955 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1957 = _1955 * 0.15915493667125701904296875;
        float _1959 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1961 = _1957 * 6.283185482025146484375;
        float _1963 = cos(_1961);
        float _1965 = _1959 * 0.15915493667125701904296875;
        float _1967 = _1957 * 6.283185482025146484375;
        float _1969 = sin(_1967);
        float _1971 = 1.0 / _1963;
        float _1973 = _1965 * 6.283185482025146484375;
        float _1975 = cos(_1973);
        float _1977 = _1969 * _1971;
        float _1979 = _1965 * 6.283185482025146484375;
        float _1981 = sin(_1979);
        float _1983 = _1975 * _1977;
        float _1985 = 1.0 / _1983;
        float _1987 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1989 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1987;
        float _1991 = 1.0 / _1989;
        float _1993 = _1981 * _1985;
        float _1995 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1997 = fma(_885, _1993, _1995);
        float _1999 = _1997 * _1991;
        float _2001 = precise::clamp(_1999, 0.0, 1.0);
        _1899 = _1957;
        _1953 = _2001;
    }
    float _2003 = _1899;
    float _2005 = _1953;
    float _2007 = _2003;
    if (!_1889)
    {
        float _2009 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2011 = _2009 * 0.15915493667125701904296875;
        float _2013 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2015 = _2011 * 6.283185482025146484375;
        float _2017 = cos(_2015);
        float _2019 = _2013 * 0.15915493667125701904296875;
        float _2021 = _2011 * 6.283185482025146484375;
        float _2023 = sin(_2021);
        float _2025 = 1.0 / _2017;
        float _2027 = _2019 * 6.283185482025146484375;
        float _2029 = cos(_2027);
        float _2031 = _2023 * _2025;
        float _2033 = _2019 * 6.283185482025146484375;
        float _2035 = sin(_2033);
        float _2037 = _2029 * _2031;
        float _2039 = 1.0 / _2037;
        float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2043 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2041;
        float _2045 = 1.0 / _2043;
        float _2047 = _2035 * _2039;
        float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2051 = fma(_885, _2047, _2049);
        float _2053 = _2051 * _2045;
        float _2055 = precise::clamp(_2053, 0.0, 1.0);
        float _2057 = -_2055;
        float _2059 = _2057 + 1.0;
        _2007 = _2025;
        _1923 = _2059;
    }
    float _2061 = _2007;
    float _2063 = _1923;
    if (!_1170)
    {
        int _2065 = _1208 << 4;
        int _2067 = _2065 + 2048;
        uint _2069 = uint(int(uint(_2067) >> uint(2)));
        uint _2071 = uint(int(uint(int(_2069)) >> uint(2)));
        int _2073 = int(_2069) & 3;
        float _2075 = (*spvDescriptorSet0.vp_c15)._m0[int(_2071)][_2073];
        int _2077 = int(_2069) + 1;
        uint _2079 = uint(int(uint(_2077) >> uint(2)));
        int _2081 = _2077 & 3;
        float _2083 = (*spvDescriptorSet0.vp_c15)._m0[int(_2079)][_2081];
        int _2085 = _2067 + 8;
        uint _2087 = uint(int(uint(_2085) >> uint(2)));
        uint _2089 = uint(int(uint(int(_2087)) >> uint(2)));
        int _2091 = int(_2087) & 3;
        float _2093 = (*spvDescriptorSet0.vp_c15)._m0[int(_2089)][_2091];
        int _2095 = int(_2087) + 1;
        uint _2097 = uint(int(uint(_2095) >> uint(2)));
        int _2099 = _2095 & 3;
        float _2101 = (*spvDescriptorSet0.vp_c15)._m0[int(_2097)][_2099];
        float _2103 = _911 * _2083;
        float _2105 = fma(_383, _2075, _2103);
        float _2107 = fma(_385, _2093, _2105);
        float _2109 = _2107 + _2101;
        float _2111 = precise::clamp(_2109, 0.0, 1.0);
        float _2113 = -_2111;
        float _2115 = _2113 + _1702;
        float _2117 = fma(_2115, 500.0, 1.5);
        float _2119 = exp2(_2117);
        float _2121 = 0.0 + _2119;
        float _2123 = precise::clamp(_2121, 0.0, 1.0);
        _1212 = as_type<float>(_2067);
        _1911 = _2123;
    }
    float _2125 = _1212;
    float _2127 = _1911;
    float _2129 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2131 = _1544 + _2129;
    float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2135 = _1546 + _2133;
    float _2137 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2139 = _1548 + _2137;
    float _2141 = _2131 * _2131;
    float _2143 = fma(_2135, _2135, _2141);
    float _2145 = fma(_2139, _2139, _2143);
    float _2147 = rsqrt(_2145);
    float _2149 = sqrt(_2145);
    float _2151 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2153 = _2135 * _2151;
    float _2155 = _2139 * _2151;
    float _2157 = _2153 * _2153;
    float _2159 = _2155 * _2155;
    float _2161 = _2157 + _2159;
    float _2163 = sqrt(_2161);
    bool _2165 = _2163 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2169 = _2163 + _2167;
    float _2171 = _2061;
    float _2173 = _2161;
    float _2175 = _2169;
    float _2177 = _2125;
    float _2179 = _2153;
    float _2181 = _2155;
    float _2183 = _2157;
    float _2185 = _2159;
    if (_2165)
    {
        float _2187 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2171 = _2187;
    }
    float _2189 = _2171;
    if (_2165)
    {
        float _2191 = rsqrt(_2161);
        _2173 = _2191;
    }
    float _2193 = _2173;
    if (_2165)
    {
        float _2195 = _2169 * _2189;
        _2175 = _2195;
    }
    float _2197 = _2175;
    if (_2165)
    {
        float _2199 = _2197 * 0.15915493667125701904296875;
        _2177 = _2199;
    }
    float _2201 = _2177;
    float _2203 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2205 = _385;
    float _2207 = _2203;
    if (_2165)
    {
        float _2209 = _2201 * 6.283185482025146484375;
        float _2211 = sin(_2209);
        _2205 = _2211;
    }
    float _2213 = _2205;
    float _2215 = precise::max(0.0, _2203);
    float _2217 = _2197;
    float _2219 = _2215;
    if (_2165)
    {
        float _2221 = _2201 * 6.283185482025146484375;
        float _2223 = cos(_2221);
        _2217 = _2223;
    }
    float _2225 = _2217;
    float _2227 = -_2151;
    float _2229 = -_2215;
    float _2231 = fma(_2131, _2227, _2229);
    float _2233 = _2231;
    if (_2165)
    {
        float _2235 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2219 = _2235;
    }
    float _2237 = _2219;
    float _2239 = _2237;
    if (_2165)
    {
        float _2241 = fma(_2213, _2237, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2239 = _2241;
    }
    float _2243 = _2239;
    float _2245 = _2243;
    if (_2165)
    {
        float _2247 = _2193 * _2243;
        _2245 = _2247;
    }
    float _2249 = _2245;
    if (_2165)
    {
        float _2251 = _2225 + (-1.0);
        _2207 = _2251;
    }
    float _2253 = _2207;
    float _2255 = _2253;
    if (_2165)
    {
        float _2257 = _2153 * _2249;
        _2179 = _2257;
    }
    float _2259 = _2179;
    if (_2165)
    {
        float _2261 = _2155 * _2249;
        _2181 = _2261;
    }
    float _2263 = _2181;
    if (_2165)
    {
        float _2265 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2255 = _2265;
    }
    float _2267 = _2255;
    if (_2165)
    {
        float _2269 = _2259 * _2259;
        _2183 = _2269;
    }
    float _2271 = _2183;
    if (_2165)
    {
        float _2273 = _2263 * _2263;
        _2185 = _2273;
    }
    float _2275 = _2185;
    if (_2165)
    {
        float _2277 = fma(_2231, _2225, _2267);
        _2233 = _2277;
    }
    float _2279 = _2233;
    float _2281 = fma(_2279, _2279, _2271);
    float _2283 = _2281 + _2275;
    float _2285 = rsqrt(_2283);
    float _2287 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2289 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2287);
    float _2291 = precise::clamp(_2289, 0.0, 1.0);
    float _2293 = -_2291;
    float _2295 = _2293 + 1.0;
    float _2297 = abs(_2295);
    float _2299 = log2(_2297);
    float _2301 = _2285 * _2259;
    float _2303 = _2285 * _2279;
    float _2305 = _2285 * _2263;
    float _2307 = _2301 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2309 = -_2307;
    float _2311 = fma(_2303, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2309);
    float _2313 = -_2305;
    float _2315 = fma(_2313, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2311);
    float _2317 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2319 = fma(_2315, -0.5, 0.5);
    float _2321 = fma(_2315, 0.5, 0.5);
    float _2323 = exp2(_2317);
    float _2325 = fma(_2321, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2327 = fma(_2321, _2325, -0.212114393711090087890625);
    float _2329 = _2303 + 1.0;
    float _2331 = sqrt(_2319);
    float _2333 = fma(_2321, _2327, 1.570728778839111328125);
    float _2335 = -_2303;
    float _2337 = fma(_2323, _2329, _2335);
    int _2339 = ~_577;
    int _2341 = _2339 + 1;
    float _2343 = fma(_2337, 0.5, 0.5);
    float _2345 = _2331 * 0.636619746685028076171875;
    float _2347 = -_2333;
    float _2349 = fma(_2345, _2347, 1.0);
    float _2351 = float(uint(_1893));
    float2 _6930 = float2(_2349, _2343);
    float3 _2355 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6930, float2(0.0), isnan(_6930)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6930, float2(0.0), isnan(_6930)), level(0.0)).xyz;
    float _2357 = _2355.x;
    float _2359 = _2355.y;
    float _2361 = _2355.z;
    float _2363 = as_type<float>(_1745) * _2351;
    int _2365 = _2341 * _1951;
    int _2367 = _2365 + _1917;
    int _2369 = ~_577;
    int _2371 = _2369 + 1;
    float _2373 = -_683;
    float _2375 = _2373 + 1.0;
    float _2377 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2379 = trunc(_2363);
    float _2381 = precise::max(_2379, 0.0);
    uint _2383 = uint(_2381);
    bool _2385 = uint(_2367) >= uint(_577);
    float _2387 = -_403;
    float _2389 = _2387 + 1.0;
    float _2391 = -_705;
    float _2393 = _2391 + 1.0;
    bool _2395 = !_2385;
    int _2397 = _2395 ? 0 : (-1);
    float _2399 = exp2(_2377);
    int _2401 = ~_1951;
    int _2403 = _2401 + _2397;
    int _2405 = _2403 + 1;
    int _2407 = _577 * _2405;
    int _2409 = _2407 + _1917;
    int _2411 = _2341 * int(_2383);
    int _2413 = _2411 + _1893;
    bool _2415 = !_1823;
    int _2417 = _2415 ? _2409 : (-1);
    float _2419 = float(uint(_2413));
    int _2421 = _2417 >> 31;
    int _2423 = _2417 & 3;
    bool _2425 = _2423 != 0;
    float _2427 = as_type<float>(_1745) * _2419;
    int _2429 = _2421 & 3;
    bool _2431 = uint(_2423) > 1u;
    float _2433 = trunc(_2427);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    int _2439 = _2417 + _2429;
    int _2441 = _2417 & 3;
    bool _2443 = _2441 != 0;
    int _2445 = _2439 >> 2;
    int _2447 = _2443 ? 0 : 1;
    int _2449 = _2445 << 4;
    int _2451 = _2449 + 368;
    bool _2453 = uint(_2423) >= 2u;
    uint _2455 = uint(int(uint(_2451) >> uint(2)));
    uint _2457 = uint(int(uint(int(_2455)) >> uint(2)));
    int _2459 = int(_2455) & 3;
    float _2461 = (*spvDescriptorSet0.vp_c9)._m0[int(_2457)][_2459];
    int _2463 = int(_2455) + 1;
    uint _2465 = uint(int(uint(_2463) >> uint(2)));
    int _2467 = _2463 & 3;
    float _2469 = (*spvDescriptorSet0.vp_c9)._m0[int(_2465)][_2467];
    int _2471 = _2453 ? 0 : 1;
    int _2473 = int(_2383) + int(_2437);
    int _2475 = ~_2471;
    int _2477 = _2475 + 1;
    int _2479 = _2477 + 1;
    int _2481 = _2451 + 8;
    uint _2483 = uint(int(uint(_2481) >> uint(2)));
    uint _2485 = uint(int(uint(int(_2483)) >> uint(2)));
    int _2487 = int(_2483) & 3;
    float _2489 = (*spvDescriptorSet0.vp_c9)._m0[int(_2485)][_2487];
    int _2491 = int(_2483) + 1;
    uint _2493 = uint(int(uint(_2491) >> uint(2)));
    int _2495 = _2491 & 3;
    float _2497 = (*spvDescriptorSet0.vp_c9)._m0[int(_2493)][_2495];
    int _2499 = _2371 * _2473;
    int _2501 = _2499 + _1893;
    bool _2503 = uint(_2501) >= uint(_577);
    bool _2505 = !_2503;
    int _2507 = _2505 ? 0 : (-1);
    bool _2509 = _2423 != 3;
    int _2511 = ~_2473;
    int _2513 = _2511 + _2507;
    int _2515 = _2513 + 1;
    int _2517 = ~_2447;
    int _2519 = _2517 + 1;
    int _2521 = _2519 + 1;
    int _2523 = _2521;
    int _2525 = _2479;
    if (!_2431)
    {
        int _2527 = ~_2447;
        int _2529 = _2527 + 1;
        _2523 = _2529;
    }
    int _2531 = _2523;
    int _2533 = _577 * _2515;
    int _2535 = _2533 + _1893;
    bool _2537 = _2423 != 3;
    float _2539 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2541 = int(_2539);
    bool _2543 = !_2425;
    int _2545 = _2543 ? 0 : 1;
    int _2547 = abs(_2531);
    if (_2509)
    {
        int _2549 = ~_2471;
        int _2551 = _2549 + 1;
        _2525 = _2551;
    }
    int _2553 = _2525;
    bool _2555 = !_2537;
    int _2557 = _2555 ? 0 : (-1);
    int _2559 = abs(_2545);
    int _2561 = ~_2547;
    int _2563 = _2561 + 1;
    int _2565 = _2563 + 1;
    int _2567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2569 = _2567 != 0;
    int _2571 = abs(_2553);
    int _2573 = abs(_2557);
    int _2575 = ~_2559;
    int _2577 = _2575 + 1;
    int _2579 = _2577 + 1;
    int _2581 = _2565 * as_type<int>(_2469);
    bool _2583 = !_2569;
    int _2585 = _2583 ? 0 : 1;
    int _2587 = _2579 * as_type<int>(_2461);
    int _2589 = _2587 + _2581;
    int _2591 = abs(_2585);
    int _2593 = ~_2571;
    int _2595 = _2593 + 1;
    int _2597 = _2595 + 1;
    float _2599 = float(uint(_2541));
    int _2601 = _2597 * as_type<int>(_2489);
    int _2603 = _2601 + _2589;
    int _2605 = ~_2573;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    int _2611 = abs(_2541);
    float _2613 = 1.0 / _2599;
    int _2615 = ~_2591;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = _2609 * as_type<int>(_2497);
    int _2623 = _2621 + _2603;
    float _2625 = float(uint(_2611));
    bool _2627 = !_1823;
    int _2629 = _2627 ? _2535 : (-1);
    int _2631 = _2623 * _2619;
    int _2633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2635 = _2633 != 0;
    float _2637 = 1.0 / _2625;
    int _2639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2641 = _2639 != 0;
    int _2643 = _2629 * _2591;
    int _2645 = _2643 + _2631;
    float _2647 = float(uint(_2645));
    float _2649 = abs(_885);
    float _2651 = log2(_2649);
    int _2653 = as_type<int>(_2613) + (-2);
    int _2655 = abs(_2645);
    float _2657 = as_type<float>(_2653) * _2647;
    float _2659 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2661 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2663 = as_type<int>(_2637) + (-2);
    float _2665 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2667 = float(uint(_2655));
    float _2669 = trunc(_2657);
    float _2671 = precise::max(_2669, 0.0);
    uint _2673 = uint(_2671);
    float _2675 = _2659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2677 = ~_2611;
    int _2679 = _2677 + 1;
    float _2681 = as_type<float>(_2663) * _2667;
    int _2683 = ~_2541;
    int _2685 = _2683 + 1;
    float _2687 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2689 = _165 > 0.5;
    float _2691 = _2665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2693 = _2661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2695 = trunc(_2681);
    float _2697 = precise::max(_2695, 0.0);
    uint _2699 = uint(_2697);
    float _2701 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_74.x = _2675;
    out.m_74.y = _2691;
    out.m_74.z = _2693;
    out.m_74.w = _2687;
    float _2703 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2705 = _2685 * int(_2673);
    int _2707 = _2705 + _2645;
    float _2709 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2713 = _2701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2715 = _411 > 0.5;
    float _2717 = _2709 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2719 = float(uint(_2707));
    float _2721 = _2711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2723 = exp2(_2703);
    float _2725 = _945 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2727 = _2679 * int(_2699);
    int _2729 = _2727 + _2655;
    float _2731 = as_type<float>(_2653) * _2719;
    out.m_76.x = _2717;
    out.m_76.y = _2713;
    out.m_76.z = _2721;
    float _2733 = _945 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2735 = -_935;
    float _2737 = fma(_2735, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2725);
    float _2739 = float(uint(_2729));
    float _2741 = _945 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2743 = -_935;
    float _2745 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2733);
    bool _2747 = _885 <= 8000.0;
    bool _2749 = isnan(_885);
    bool _2751 = _2747 || _2749;
    bool _2753 = isnan(8000.0);
    bool _2755 = _2751 || _2753;
    float _2757 = float(_2755);
    float _2759 = as_type<float>(_2663) * _2739;
    float _2761 = -_935;
    float _2763 = fma(_2761, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2741);
    float _2765 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2737);
    float _2767 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2745);
    float _2769 = trunc(_2731);
    float _2771 = precise::max(_2769, 0.0);
    uint _2773 = uint(_2771);
    float _2775 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2763);
    float _2777 = _949 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2779 = _949 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2781 = _949 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2783 = fma(_2723, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2785 = precise::clamp(_2783, 0.0, 1.0);
    float _2787 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2777);
    float _2789 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2779);
    float _2791 = trunc(_2759);
    float _2793 = precise::max(_2791, 0.0);
    uint _2795 = uint(_2793);
    float _2797 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2781);
    float _2799 = -_881;
    int _2801 = _2715 ? as_type<int>(_2799) : as_type<int>(_881);
    float _2803 = _965 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2805 = _965 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2807 = _965 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2809 = !_2641;
    float _2811 = _2809 ? _881 : as_type<float>(_2801);
    float _2813 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2803);
    int _2815 = int(_2673) + int(_2773);
    float _2817 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2805);
    int _2819 = ~_2611;
    int _2821 = _2819 + 1;
    float _2823 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2807);
    float _2825 = _881 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2827 = ~_2541;
    int _2829 = _2827 + 1;
    float _2831 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2787);
    int _2833 = int(_2699) + int(_2795);
    float _2835 = _2825 * _2775;
    float _2837 = _2825 * _2767;
    float _2839 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2789);
    int _2841 = _2829 * _2815;
    int _2843 = _2841 + _2645;
    int _2845 = _2645 ^ _2541;
    int _2847 = _2821 * _2833;
    int _2849 = _2847 + _2655;
    float _2851 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2797);
    float _2853 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2813);
    uint _2855 = uint(int(uint(_2845) >> uint(31)));
    float _2857 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2817);
    bool _2859 = uint(_2849) >= uint(_2611);
    float _2861 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2823);
    bool _2863 = uint(_2843) >= uint(_2541);
    float _2865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2867 = !_2859;
    int _2869 = _2867 ? 0 : (-1);
    float _2871 = _2825 * _2765;
    int _2873 = ~int(_2855);
    int _2875 = _2873 + 1;
    float _2877 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2879 = ~_2869;
    int _2881 = _2833 + _2879;
    int _2883 = _2881 + 1;
    bool _2885 = !_2863;
    int _2887 = _2885 ? 0 : (-1);
    float _2889 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2877);
    int _2891 = _2883 ^ _2875;
    float _2893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2895 = ~_2815;
    int _2897 = _2895 + _2887;
    int _2899 = _2897 + 1;
    bool _2901 = _2541 == 0;
    int _2903 = ~_2875;
    int _2905 = _2903 + _2891;
    int _2907 = _2905 + 1;
    int _2909 = _2541 * _2899;
    int _2911 = _2909 + _2645;
    float _2913 = -_889;
    int _2915 = _2689 ? as_type<int>(_2913) : as_type<int>(_889);
    bool _2917 = !_2901;
    int _2919 = _2917 ? _2907 : (-1);
    bool _2921 = !_2635;
    float _2923 = _2921 ? _889 : as_type<float>(_2915);
    float _2925 = _889 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2927 = float(_2919);
    float _2929 = _2865 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2931 = _2811 + (-0.5);
    float _2933 = fma(_2925, _2831, _2871);
    float _2935 = fma(_2925, _2839, _2837);
    float _2937 = -_561;
    float _2939 = fma(_2929, _2927, _2937);
    float _2941 = fma(_2925, _2851, _2835);
    bool _2943 = _2541 == 0;
    float _2945 = _2893 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2947 = -_2929;
    float _2949 = fma(_2947, _2931, _2939);
    float _2951 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2889);
    bool _2953 = !_2943;
    int _2955 = _2953 ? _2911 : (-1);
    float _2957 = _2923 + 0.5;
    float _2959 = fma(_2811, _2375, _2949);
    float _2961 = _2857 + _2935;
    float _2963 = _2861 + _2941;
    float _2965 = -_2399;
    float _2967 = _2965 + 1.0;
    float _2969 = float(_2955);
    float _2971 = fma(_2785, -2.0, 3.0);
    float _2973 = _2785 * _2785;
    float _2975 = _2967 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2977 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2951);
    float _2979 = fma(_2945, _2969, _441);
    float _2981 = _2973 * _2971;
    float _2983 = _2975 * _1710;
    float _2985 = fma(_2945, _2957, _2979);
    float _2987 = -_2981;
    float _2989 = _2987 + 1.0;
    float _2991 = _2977 + _1626;
    float _2993 = -_2393;
    float _2995 = fma(_2923, _2993, _2985);
    float _2997 = fma(_2989, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2981);
    float _2999 = _2991 * 0.5;
    float _3001 = _2853 + _2933;
    out.gl_Position.x = _1668;
    out.gl_Position.y = _1670;
    out.gl_Position.z = _2977;
    out.gl_Position.w = _1626;
    float _3003 = _2757 * _2997;
    float _3005 = _2757;
    float _3007 = _2973;
    if (!_1604)
    {
        _3005 = 1.0;
    }
    float _3009 = _3005;
    float _3011 = _3009;
    if (_1604)
    {
        bool _3013 = _1708 >= _1672;
        bool _3015 = isnan(_1708);
        bool _3017 = _3013 || _3015;
        bool _3019 = isnan(_1672);
        bool _3021 = _3017 || _3019;
        float _3023 = float(_3021);
        _3011 = _3023;
    }
    float _3025 = _3011;
    float _3027 = _3003 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3029 = -_2975;
    float _3031 = _3029 + 1.0;
    out.m_78.z = _2999;
    out.m_78.w = _1626;
    bool _3033 = _2149 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3035 = isnan(_2149);
    bool _3037 = _3033 || _3035;
    bool _3039 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3041 = _3037 || _3039;
    float _3043 = _2389 * _3027;
    float _3045 = precise::clamp(_3043, 0.0, 1.0);
    float _3047 = _3025 * _2127;
    float _3049 = _1721 * _3031;
    out.m_80.x = _2995;
    out.m_80.y = _2959;
    float _3051 = -_3045;
    float _3053 = fma(_3051, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3055 = _1721 * _2983;
    out.m_82.x = _3001;
    out.m_82.y = _2961;
    out.m_82.z = _2963;
    float _3057 = -_3047;
    float _3059 = fma(_3057, _3053, 1.0);
    float _3061 = precise::clamp(_3059, 0.0, 1.0);
    float _3063 = _2361 * _2983;
    float _3065 = fma(_2357, _3055, _1715);
    float _3067 = fma(_2359, _3055, _1717);
    float _3069 = _3061 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3071 = fma(_1721, _3063, _1719);
    float _3073 = _2005 * _2063;
    float _3075 = _3031;
    float _3077 = _3027;
    float _3079 = _3047;
    float _3081 = _3055;
    float _3083 = _3073;
    if (!_3041)
    {
        _3007 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3085 = _3007;
    out.m_84.x = _3069;
    float _3087 = _3073 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3089 = _3085;
    float _3091 = _3085;
    if (!_3041)
    {
        _3075 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3093 = _3075;
    out.m_86.x = _3065;
    out.m_86.y = _3067;
    out.m_86.z = _3071;
    out.m_86.w = _3049;
    float _3095 = _3093;
    float _3097 = _3093;
    if (!_3041)
    {
        _3077 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3099 = _3077;
    float _3101 = _3099;
    float _3103 = _3099;
    if (!_3041)
    {
        _3079 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3105 = _3079;
    float _3107 = _3105;
    float _3109 = _3105;
    if (!_3041)
    {
        _3081 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3111 = _3081;
    float _3113 = _3111;
    float _3115 = _3111;
    if (!_3041)
    {
        _3083 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3117 = _3083;
    bool _3119 = !_3041;
    float _3121 = _3117;
    float _3123 = _3117;
    if (!_3119)
    {
        bool _3125 = _2149 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3127 = isnan(_2149);
        bool _3129 = _3125 || _3127;
        bool _3131 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3133 = _3129 || _3131;
        if (!_3133)
        {
            float _3135 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3137 = _2149 + _3135;
            float _3139 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3141 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3139;
            float _3143 = 1.0 / _3141;
            float _3145 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3149 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3151 = _3149 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3153 = _3137 * _3143;
            float _3155 = precise::clamp(_3153, 0.0, 1.0);
            float _3157 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3159 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3163 = _3161 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3165 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3167 = _3165 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3169 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3173 = fma(_3155, _3159, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3175 = fma(_3155, _3163, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3177 = fma(_3155, _3167, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3179 = fma(_3155, _3171, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3181 = fma(_3155, _3147, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3183 = fma(_3155, _3151, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3097 = _3175;
            _3115 = _3181;
            _3091 = _3173;
            _3109 = _3179;
            _3103 = _3177;
            _3123 = _3183;
            _3185 = true;
        }
        else
        {
            bool _3187 = _2149 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3189 = isnan(_2149);
            bool _3191 = _3187 || _3189;
            bool _3193 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3195 = _3191 || _3193;
            if (!_3195)
            {
                _3089 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3197 = _3089;
            _3091 = _3197;
            if (!_3195)
            {
                _3095 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3199 = _3095;
            _3097 = _3199;
            if (!_3195)
            {
                _3101 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3201 = _3101;
            _3103 = _3201;
            if (!_3195)
            {
                _3107 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3203 = _3107;
            _3109 = _3203;
            if (!_3195)
            {
                _3113 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3205 = _3113;
            _3115 = _3205;
            if (!_3195)
            {
                _3121 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3207 = _3121;
            bool _3209 = !_3195;
            _3123 = _3207;
            if (!_3209)
            {
                bool _3211 = _2149 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3213 = isnan(_2149);
                bool _3215 = _3211 || _3213;
                bool _3217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3219 = _3215 || _3217;
                if (!_3219)
                {
                    float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3223 = _2149 + _3221;
                    float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3227 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3225;
                    float _3229 = 1.0 / _3227;
                    float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3239 = _3223 * _3229;
                    float _3241 = precise::clamp(_3239, 0.0, 1.0);
                    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3245 = _3243 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3249 = _3247 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3251 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3253 = _3251 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3255 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3257 = _3255 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3259 = fma(_3241, _3245, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3261 = fma(_3241, _3249, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3263 = fma(_3241, _3253, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3265 = fma(_3241, _3257, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3267 = fma(_3241, _3233, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3269 = fma(_3241, _3237, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3097 = _3261;
                    _3115 = _3267;
                    _3091 = _3259;
                    _3109 = _3265;
                    _3103 = _3263;
                    _3123 = _3269;
                    _3185 = true;
                }
                else
                {
                    _3097 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3115 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3091 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3109 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3103 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3123 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3185 = false;
    float _3271 = _3097;
    float _3273 = _3115;
    float _3275 = _3091;
    float _3277 = _3109;
    float _3279 = _3103;
    float _3281 = _3123;
    float _3283 = fma(_2961, -0.5, 0.5);
    float _3285 = precise::clamp(_3283, 0.0, 1.0);
    float _3287 = -_3271;
    float _3289 = _3287 + _3273;
    float _3291 = _3087 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3293 = -_3275;
    float _3295 = _3293 + _3277;
    out.m_88.x = 0.0;
    float _3297 = fma(_3285, _3289, _3271);
    float _3299 = -_3279;
    float _3301 = _3299 + _3281;
    out.m_59.x = _3291;
    float _3303 = fma(_3285, _3295, _3275);
    float _3305 = _3297 * 0.586610972881317138671875;
    bool _3307 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3309 = fma(_3285, _3301, _3279);
    float _3311 = fma(_3303, 0.298911988735198974609375, _3305);
    bool _3313 = _2005 > 0.0;
    bool _3315 = isnan(_2005);
    bool _3317 = _3313 || _3315;
    bool _3319 = isnan(0.0);
    bool _3321 = _3317 || _3319;
    float _3323 = fma(_3309, 0.114477999508380889892578125, _3311);
    bool _3325 = _2063 <= 0.0;
    bool _3327 = !_3321;
    bool _3329 = _3325 || _3327;
    float _3331 = -_3323;
    float _3333 = _3303 + _3331;
    float _3335 = -_3323;
    float _3337 = _3297 + _3335;
    float _3339 = -_3323;
    float _3341 = _3309 + _3339;
    float _3343 = fma(_3333, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3323);
    float _3345 = fma(_3337, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3323);
    float _3347 = fma(_3341, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3323);
    bool _3349 = !_3307;
    if (!_3349)
    {
        float _3351 = -_1544;
        float _3353 = _3351 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3355 = -_1546;
        float _3357 = _3355 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3359 = -_1548;
        float _3361 = _3359 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3363 = _3353 * _3353;
        float _3365 = fma(_3357, _3357, _3363);
        float _3367 = fma(_3361, _3361, _3365);
        float _3369 = sqrt(_3367);
        float _3371 = rsqrt(_3367);
        float _3373 = -_3369;
        float _3375 = _3373 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3377 = _3375 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3379 = precise::clamp(_3377, 0.0, 1.0);
        float _3381 = _3357 * _3371;
        float _3383 = _3353 * _3371;
        float _3385 = abs(_3379);
        float _3387 = log2(_3385);
        float _3389 = _3361 * _3371;
        float _3391 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3393 = _2961 * _3383;
        float _3395 = -_3383;
        float _3397 = -_3391;
        float _3399 = fma(_3395, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3397);
        float _3401 = fma(_3001, _3381, _3393);
        float _3403 = -_3389;
        float _3405 = fma(_3403, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3399);
        float _3407 = fma(_2963, _3389, _3401);
        float _3409 = precise::clamp(_3407, 0.0, 1.0);
        float _3411 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3413 = _3405 + _3411;
        float _3415 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3417 = _3413 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3419 = precise::clamp(_3417, 0.0, 1.0);
        float _3421 = exp2(_3415);
        float _3423 = _3421 * _3419;
        float _3425 = _3409 * _3423;
        float _3427 = _3425 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3429 = _3425 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3431 = _3425 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3427;
        out.m_88.y = _3429;
        out.m_88.z = _3431;
    }
    out.m_90.x = _3343;
    out.m_90.y = _3345;
    out.m_90.z = _3347;
    if (!_3329)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _3433 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3433;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3185 = false;
    bool _353 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_56.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_59.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3490 = as_type<float>(_125);
        out.gl_Position.z = _3490;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_61.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_59.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3560 = as_type<float>(_163);
        out.gl_Position.z = _3560;
    }
    if (_155)
    {
        return out;
    }
    float _165 = in.m_63.x;
    float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _169 = _143 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _171 = _143 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _173 = in.m_65.x;
    float _175 = in.m_65.y;
    float _177 = in.m_65.z;
    float _179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _181 = _169 * _167;
    float _183 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _181);
    float _185 = _171 * _179;
    float _187 = floor(_183);
    float _189 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].y, _185);
    float _191 = _183 * 6.283185482025146484375;
    float _193 = _175 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _195 = _191 * 0.15915493667125701904296875;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = floor(_189);
    float _203 = _189 * 6.283185482025146484375;
    float _205 = _175 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _209 = _207 != 0;
    int _211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _213 = _211 != 0;
    float _215 = _175 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _217 = _203 * 0.15915493667125701904296875;
    float _219 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].x, _205);
    float _221 = -_187;
    float _223 = _183 + _221;
    bool _225 = !_209;
    int _227 = _225 ? 0 : 1;
    float _229 = _195 * 6.283185482025146484375;
    float _231 = cos(_229);
    float _233 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].x, _193);
    float _235 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].x, _215);
    float _237 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _219);
    float _239 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _233);
    float _241 = -_201;
    float _243 = _189 + _241;
    int _245 = abs(_227);
    float _247 = _217 * 6.283185482025146484375;
    float _249 = cos(_247);
    bool _251 = !_199;
    int _253 = _251 ? 0 : 1;
    float _255 = -_223;
    float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _259 = -_243;
    float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _265 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _235);
    int _267 = abs(_253);
    float _269 = float(_245);
    float _271 = fma(_231, 0.5, 0.5);
    bool _273 = !_213;
    int _275 = _273 ? 0 : 1;
    bool _277 = _223 < 0.5;
    float _279 = float(_277);
    float _281 = abs(_257);
    float _283 = _269 * _281;
    int _285 = abs(_275);
    float _287 = abs(_261);
    float _289 = _269 * _287;
    float _291 = fma(_249, 0.5, 0.5);
    float _293 = float(_267);
    float _295 = -_271;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _299 = -_291;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _303 = _243 < 0.5;
    float _305 = float(_303);
    float _307 = -_279;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = float(_285);
    float _313 = fma(_293, _297, _283);
    float _315 = fma(_293, _301, _289);
    float _317 = -_305;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _321 = abs(_309);
    float _323 = fma(_311, _321, _313);
    float _325 = abs(_319);
    float _327 = fma(_311, _325, _315);
    bool _329 = !_263;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _349;
    float _351;
    if (!_329)
    {
        float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _335 = _165 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _337 = float(_109);
        float _339 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _341 = _339 * _333;
        float _343 = floor(_341);
        float _345 = -_343;
        float _347 = _341 + _345;
        _349 = _347;
        _351 = _337;
        _353 = true;
    }
    else
    {
        float _355 = float(_109);
        float _357 = 1.0 / _355;
        float _359 = _143 * _357;
        _349 = _359;
        _351 = _355;
    }
    _353 = false;
    float _361 = _349;
    float _363 = _351;
    float _365 = in.m_56.x;
    float _367 = in.m_56.y;
    float _369 = in.m_56.z;
    float _371 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _373 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _375 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _371);
    float _377 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _373);
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _375);
    float _381 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _377);
    float _383 = _379 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _385 = _381 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _387 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _389 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _391 = floor(_387);
    float _393 = floor(_389);
    float _395 = -_391;
    float _397 = _387 + _395;
    float _399 = -_393;
    float _401 = _389 + _399;
    float2 _3929 = float2(_397, _401);
    float _403 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3929, float2(0.0), isnan(_3929)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3929, float2(0.0), isnan(_3929)), level(0.0)).x;
    float _405 = in.m_63.z;
    float _407 = _165 * 2.0;
    float _409 = _165 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _411 = in.m_63.y;
    float _413 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _415 = floor(_407);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _423 = _361 + _421;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _427 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _413);
    float _429 = -_425;
    float _431 = fma(_409, 2.0, _429);
    float _433 = 1.0 / _419;
    float _435 = as_type<float>(int(gl_VertexIndex));
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _439 = -_143;
    float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[76].x, _431);
    float _443 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _445 = _415 > 0.0;
    float _447 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _449 = int(_447);
    bool _451 = _415 >= 0.0;
    bool _453 = isnan(_415);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = _405 * 2.0;
    float _463 = _165 + _411;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _475 = _473 != 0;
    float _477 = _411 * 2.0;
    float _479 = _423 * _433;
    float _481 = floor(_461);
    float _483 = _463 + (-1.0);
    bool _485 = !_471;
    int _487 = _485 ? 0 : 1;
    float _489 = _411 + _405;
    bool _491 = !_467;
    int _493 = _491 ? 0 : 1;
    float _495 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _497 = !_475;
    float _499 = _497 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _501 = _489 + (-1.0);
    float _503 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _505 = log2(_503);
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _509 = _507 != 0;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _513 = _511 != 0;
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _517 = _515 != 0;
    float _519 = _165 + _405;
    float _521 = _411 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _523 = _459 ? 0 : 1;
    float _525 = _519 + (-1.0);
    float _527 = _405 + (-0.5);
    bool _529 = _481 > 0.0;
    float _531 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _533 = _481 >= 0.0;
    bool _535 = isnan(_481);
    bool _537 = _533 || _535;
    bool _539 = isnan(0.0);
    bool _541 = _537 || _539;
    float _543 = floor(_477);
    bool _545 = !_513;
    int _547 = _545 ? 0 : 1;
    float _549 = fma(_521, -2.0, _437);
    int _551 = _541 ? 0 : 1;
    float _553 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _555 = ~_523;
    int _557 = _555 + 1;
    int _559 = _557 + 1;
    float _561 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _549);
    int _563 = _559;
    int _565 = 2;
    float _567 = _499;
    if (!_445)
    {
        int _569 = ~_523;
        int _571 = _569 + 1;
        _563 = _571;
    }
    int _573 = _563;
    float _575 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _577 = int(_575);
    int _579 = abs(_547);
    int _581 = ~_551;
    int _583 = _581 + 1;
    int _585 = _583 + 1;
    int _587 = _585;
    if (!_529)
    {
        int _589 = ~_551;
        int _591 = _589 + 1;
        _587 = _591;
    }
    int _593 = _587;
    float _595 = _505 * _143;
    float _597 = float(_449);
    float _599 = float(_573);
    float _601 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _427);
    float _603 = float(_579);
    float _605 = exp2(_595);
    bool _607 = _543 > 0.0;
    float _609 = _601 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _611 = _543 >= 0.0;
    bool _613 = isnan(_543);
    bool _615 = _611 || _613;
    bool _617 = isnan(0.0);
    bool _619 = _615 || _617;
    float _621 = _603 * _599;
    float _623 = in.m_70.x;
    float _625 = in.m_70.y;
    float _627 = in.m_70.z;
    float _629 = _609 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _631 = 1.0 / _597;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _635 = 1.0 + _633;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _639 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[11].x, _629);
    bool _641 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _643 = isnan(1.0);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _649 = _645 || _647;
    float _651 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _653 = !_509;
    int _655 = _653 ? 0 : 1;
    float _657 = 1.0 / _635;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _661 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[78].w, _637);
    float _663 = -_605;
    float _665 = _663 + 1.0;
    float _667 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[11].z, _639);
    bool _669 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _671 = isnan(0.0);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _677 = _673 || _675;
    float _679 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[78].z, _659);
    float _681 = float(_577);
    float _683 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _661);
    int _685 = abs(_655);
    float _687 = _609 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _689 = _667 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _691 = _677 ? _665 : 0.0;
    float _693 = _681 * _143;
    float _695 = float(_685);
    float _697 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[10].x, _687);
    float _699 = float(_593);
    float _701 = 1.0 / _689;
    float _703 = _631 * _143;
    float _705 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _679);
    if (_649)
    {
        float _707 = _691 * _657;
        _145 = _707;
    }
    float _709 = _145;
    float _711 = _621 * (-2.0);
    float _713 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[10].z, _697);
    float _715 = _695 * _699;
    float _717 = _411 + (-0.5);
    float _719 = fma(_711, _625, _625);
    float _721 = _713 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _723 = _715 * (-2.0);
    int _725 = _619 ? 0 : 1;
    float _727 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[196].y, _719);
    float _729 = _721 + _689;
    float _731 = _165 + (-0.5);
    float _733 = fma(_723, _623, _623);
    float _735 = _729 * _701;
    float _737 = _735 * 0.5;
    float _739 = fma(_531, _711, _531);
    float _741 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[196].x, _733);
    bool _743 = !_517;
    int _745 = _743 ? 0 : 1;
    float _747 = fma(_495, _723, _495);
    int _749 = ~_725;
    int _751 = _749 + 1;
    int _753 = _751 + 1;
    float _755 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _757 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[30].w, _755);
    int _759 = _753;
    if (!_607)
    {
        int _761 = ~_725;
        int _763 = _761 + 1;
        _759 = _763;
    }
    int _765 = _759;
    float _767 = fma(_739, _709, _727);
    int _769 = abs(_745);
    float _771 = fma(_747, _709, _741);
    bool _773 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _775 = isnan(_361);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = _767 * 0.15915493667125701904296875;
    float _787 = in.m_72.x;
    float _789 = in.m_72.y;
    float _791 = -_783;
    float _793 = _791 + 1.0;
    float _795 = float(_769);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _797;
    float _801 = float(_765);
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _803;
    bool _807 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _809 = isnan(_361);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = fma(_799, _479, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _821 = 1.0 / _757;
    float _823 = _795 * _801;
    float _825 = fma(_805, _479, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _827 = _817 * _793;
    float _829 = -_817;
    float _831 = _829 + 1.0;
    float _833 = _823 * (-2.0);
    float _835 = _771 * 0.15915493667125701904296875;
    float _837 = _819 * _827;
    float _839 = _825 * _827;
    float _841 = fma(_833, _627, _627);
    float _843 = fma(_553, _833, _553);
    float _845 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[143].x, _837);
    float _847 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[143].y, _839);
    float _849 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[196].z, _841);
    float _851 = _785 * 6.283185482025146484375;
    float _853 = sin(_851);
    float _855 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[144].x, _845);
    float _857 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[144].y, _847);
    float _859 = fma(_843, _709, _849);
    int _861 = as_type<int>(_435) & 1;
    bool _863 = _861 != 0;
    int _865 = as_type<int>(_435) & 2;
    bool _867 = _865 != 0;
    float _869 = _855 * _787;
    float _871 = _857 * _789;
    float _873 = _859 * 0.15915493667125701904296875;
    float _875 = _785 * 6.283185482025146484375;
    float _877 = cos(_875);
    bool _879 = !_867;
    float _881 = _879 ? (-0.5) : 0.5;
    float _883 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _885 = _821 * _883;
    bool _887 = !_863;
    float _889 = _887 ? (-0.5) : 0.5;
    float _891 = _327 * _871;
    float _893 = _323 * _869;
    float _895 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _881);
    bool _897 = _885 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _899 = _835 * 6.283185482025146484375;
    float _901 = sin(_899);
    float _903 = _891 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _905 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _889);
    float _907 = _893 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _909 = _885 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _911 = _609 + _651;
    float _913 = _903 * _895;
    float _915 = _907 * _905;
    float _917 = _835 * 6.283185482025146484375;
    float _919 = cos(_917);
    float _921 = _911 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    if (!_897)
    {
        _565 = 1;
    }
    int _923 = _565;
    float _925 = _873 * 6.283185482025146484375;
    float _927 = cos(_925);
    float _929 = _901 * _853;
    float _931 = _901 * _877;
    float _933 = _873 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = _919 * _877;
    float _939 = _919 * _853;
    float _941 = _877 * _927;
    float _943 = _901 * _927;
    float _945 = _919 * _927;
    float _947 = _853 * _927;
    float _949 = fma(_935, _937, _929);
    float _951 = fma(_935, _929, _937);
    bool _953 = !_897;
    int _955 = _953 ? 0 : 1;
    float _957 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[126].x, _921);
    float _959 = -_939;
    float _961 = fma(_935, _931, _959);
    float _963 = -_931;
    float _965 = fma(_935, _939, _963);
    int _967 = _923;
    if (!_909)
    {
        _967 = _955;
    }
    int _969 = _967;
    float _971 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[126].z, _957);
    float _973 = _911 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _975 = _945 * _913;
    int _977 = _969 << 6;
    float _979 = _971 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _981 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[127].x, _973);
    float _983 = -_913;
    float _985 = _935 * _983;
    float _987 = fma(_949, _915, _975);
    float _989 = _943 * _913;
    float _991 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[127].z, _981);
    float _993 = fma(_941, _915, _985);
    float _995 = fma(_965, _443, _987);
    float _997 = fma(_961, _915, _989);
    float _999 = _991 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1001 = fma(_947, _443, _993);
    float _1003 = _995 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1005 = _995 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1007 = fma(_951, _443, _997);
    float _1009 = trunc(_979);
    int _1011 = int(_1009);
    float _1013 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1003);
    float _1015 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1005);
    int _1017 = _977 + 64;
    uint _1020 = uint(int(uint(_1017) >> uint(2)));
    uint _1022 = uint(int(uint(int(_1020)) >> uint(2)));
    int _1024 = int(_1020) & 3;
    float _1026 = (*spvDescriptorSet0.vp_c15)._m0[int(_1022)][_1024];
    int _1028 = int(_1020) + 1;
    uint _1030 = uint(int(uint(_1028) >> uint(2)));
    int _1032 = _1028 & 3;
    float _1034 = (*spvDescriptorSet0.vp_c15)._m0[int(_1030)][_1032];
    float _1036 = _995 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1038 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1013);
    float _1040 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1015);
    float _1042 = trunc(_999);
    int _1044 = int(_1042);
    float _1046 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1048 = _1040 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1050 = _977 + 48;
    uint _1052 = uint(int(uint(_1050) >> uint(2)));
    uint _1054 = uint(int(uint(int(_1052)) >> uint(2)));
    int _1056 = int(_1052) & 3;
    float _1058 = (*spvDescriptorSet0.vp_c15)._m0[int(_1054)][_1056];
    int _1060 = int(_1052) + 1;
    uint _1062 = uint(int(uint(_1060) >> uint(2)));
    int _1064 = _1060 & 3;
    float _1066 = (*spvDescriptorSet0.vp_c15)._m0[int(_1062)][_1064];
    float _1068 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1036);
    float _1070 = _385 + _1046;
    float _1072 = _383 + _1048;
    int _1074 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1076 = _1011 + _1074;
    int _1078 = _1076 + 1;
    float _1080 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1082 = _1070 + _1080;
    float _1084 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1068);
    int _1086 = _977 + 56;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.vp_c15)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
    bool _1104 = _1078 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1106 = _1082 * _1082;
    float _1108 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1110 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1112 = _1044 + _1110;
    int _1114 = _1112 + 1;
    float _1116 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1118 = _1072 + _1116;
    float _1120 = _609 + _1108;
    int _1122 = _977 + 72;
    uint _1124 = uint(int(uint(_1122) >> uint(2)));
    uint _1126 = uint(int(uint(int(_1124)) >> uint(2)));
    int _1128 = int(_1124) & 3;
    float _1130 = (*spvDescriptorSet0.vp_c15)._m0[int(_1126)][_1128];
    int _1132 = int(_1124) + 1;
    uint _1134 = uint(int(uint(_1132) >> uint(2)));
    int _1136 = _1132 & 3;
    float _1138 = (*spvDescriptorSet0.vp_c15)._m0[int(_1134)][_1136];
    int _1140 = _1078 | _1114;
    float _1142 = fma(_1118, _1118, _1106);
    bool _1144 = _1140 < 0;
    bool _1146 = _1144 || _1104;
    float _1148 = sqrt(_1142);
    int _1150 = _977 + 96;
    uint _1152 = uint(int(uint(_1150) >> uint(2)));
    uint _1154 = uint(int(uint(int(_1152)) >> uint(2)));
    int _1156 = int(_1152) & 3;
    float _1158 = (*spvDescriptorSet0.vp_c15)._m0[int(_1154)][_1156];
    int _1160 = int(_1152) + 1;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    int _1164 = _1160 & 3;
    float _1166 = (*spvDescriptorSet0.vp_c15)._m0[int(_1162)][_1164];
    bool _1168 = _1114 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1170 = _1168 || _1146;
    int _1172 = _977 + 104;
    uint _1174 = uint(int(uint(_1172) >> uint(2)));
    uint _1176 = uint(int(uint(int(_1174)) >> uint(2)));
    int _1178 = int(_1174) & 3;
    float _1180 = (*spvDescriptorSet0.vp_c15)._m0[int(_1176)][_1178];
    int _1182 = int(_1174) + 1;
    uint _1184 = uint(int(uint(_1182) >> uint(2)));
    int _1186 = _1182 & 3;
    float _1188 = (*spvDescriptorSet0.vp_c15)._m0[int(_1184)][_1186];
    int _1190 = as_type<int>(_1001);
    int _1192 = as_type<int>(_1007);
    int _1194 = _1078;
    float _1196 = _1120;
    float _1198 = _1072;
    float _1200 = _1070;
    float _1202 = as_type<float>(_977);
    if (!_1170)
    {
        int _1204 = _1114 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1206 = _1204 + _1078;
        _1190 = _1206;
    }
    int _1208 = _1190;
    bool _1210 = _1148 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = as_type<float>(_1208);
    if (!_1170)
    {
        int _1214 = _1208 << 2;
        _1192 = _1214;
    }
    int _1216 = _1192;
    int _1218 = _1216;
    if (!_1170)
    {
        uint _1220 = uint(int(uint(_1208) >> uint(2)));
        _1194 = int(_1220);
    }
    int _1222 = _1194;
    float _1224 = as_type<float>(_1222);
    if (!_1170)
    {
        int _1226 = 12 & _1216;
        _1218 = _1226;
    }
    int _1228 = _1218;
    float _1230 = as_type<float>(_1228);
    if (!_1170)
    {
        int _1232 = _1222 << 4;
        int _1234 = _1232 + _1228;
        _1224 = as_type<float>(_1234);
    }
    float _1236 = _1224;
    bool _1238 = !_1210;
    float _1240 = _1066;
    if (!_1238)
    {
        float _1242 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1244 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1246 = _1148 + _1244;
        float _1248 = _1120 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1250 = rsqrt(_1142);
        float _1252 = _1246 * _1242;
        float _1254 = _1252 * 0.15915493667125701904296875;
        float _1256 = _1254 * 6.283185482025146484375;
        float _1258 = cos(_1256);
        float _1260 = _1254 * 6.283185482025146484375;
        float _1262 = sin(_1260);
        float _1264 = _1258 + (-1.0);
        float _1266 = fma(_1262, _1248, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1268 = _1264 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1270 = _1250 * _1266;
        float _1272 = fma(_1120, _1258, _1268);
        float _1274 = fma(_1118, _1270, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1276 = fma(_1082, _1270, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1196 = _1272;
        _1198 = _1274;
        _1200 = _1276;
        _1230 = _1262;
    }
    float _1278 = _1196;
    float _1280 = _1198;
    float _1282 = _1200;
    float _1284 = _1230;
    float _1286 = -_609;
    float _1288 = _1286 + _1278;
    int _1290 = _977 + 80;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    uint _1294 = uint(int(uint(int(_1292)) >> uint(2)));
    int _1296 = int(_1292) & 3;
    float _1298 = (*spvDescriptorSet0.vp_c15)._m0[int(_1294)][_1296];
    int _1300 = int(_1292) + 1;
    uint _1302 = uint(int(uint(_1300) >> uint(2)));
    int _1304 = _1300 & 3;
    float _1306 = (*spvDescriptorSet0.vp_c15)._m0[int(_1302)][_1304];
    float _1308 = -_383;
    float _1310 = _1308 + _1280;
    float _1312 = -_385;
    float _1314 = _1312 + _1282;
    float _1316 = _1288 * _1288;
    float _1318 = _911 * _1166;
    float _1320 = _1284;
    float _1322 = _1280;
    float _1324 = _1282;
    float _1326 = _1278;
    if (!_1170)
    {
        float _1328 = floor(_979);
        _1320 = _1328;
    }
    float _1330 = _1320;
    float _1332 = _911 * _1034;
    float _1334 = fma(_1310, _1310, _1316);
    int _1336 = _977 + 88;
    uint _1338 = uint(int(uint(_1336) >> uint(2)));
    uint _1340 = uint(int(uint(int(_1338)) >> uint(2)));
    int _1342 = int(_1338) & 3;
    float _1344 = (*spvDescriptorSet0.vp_c15)._m0[int(_1340)][_1342];
    int _1346 = int(_1338) + 1;
    uint _1348 = uint(int(uint(_1346) >> uint(2)));
    int _1350 = _1346 & 3;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[int(_1348)][_1350];
    float _1354 = fma(_383, _1158, _1318);
    float _1356 = fma(_383, _1026, _1332);
    float _1358 = fma(_1314, _1314, _1334);
    float _1360 = fma(_385, _1180, _1354);
    float _1362 = _911 * _1066;
    float _1364 = sqrt(_1358);
    float _1366 = _1236;
    if (!_1170)
    {
        int _1368 = as_type<int>(_1236) + 400;
        uint _1370 = uint(int(uint(_1368) >> uint(2)));
        uint _1372 = uint(int(uint(int(_1370)) >> uint(2)));
        int _1374 = int(_1370) & 3;
        float _1376 = (*spvDescriptorSet0.vp_c15)._m0[int(_1372)][_1374];
        _1366 = _1376;
    }
    float _1378 = _1366;
    float _1380 = _1360 + _1188;
    float _1382 = fma(_383, _1058, _1362);
    bool _1384 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1386 = isnan(0.5);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1392 = _1388 || _1390;
    float _1394 = fma(_385, _1094, _1382);
    float _1396 = _1180;
    float _1398 = _1394;
    if (!_1170)
    {
        float _1400 = floor(_999);
        _1396 = _1400;
    }
    float _1402 = _1396;
    float _1404 = fma(_385, _1130, _1356);
    float _1406 = _1394 + _1102;
    float _1408 = _1404 + _1138;
    bool _1410 = _1364 > 0.0;
    float _1412 = 1.0 / _1380;
    float _1414 = _1406;
    if (!_1410)
    {
        _1240 = _1278;
    }
    float _1416 = _1240;
    bool _1418 = !_1410;
    float _1420 = _1416;
    if (!_1418)
    {
        float _1422 = _239 * _239;
        float _1424 = rsqrt(_1358);
        float _1426 = fma(_237, _237, _1422);
        float _1428 = fma(_265, _265, _1426);
        float _1430 = sqrt(_1428);
        float _1432 = _1310 * _1424;
        float _1434 = _1288 * _1424;
        float _1436 = _1314 * _1424;
        bool _1438 = _1430 > 0.0;
        float _1440 = _1430;
        _1398 = _1428;
        if (!_1438)
        {
            _1440 = _1278;
        }
        float _1442 = _1440;
        bool _1444 = !_1438;
        _1420 = _1442;
        if (!_1444)
        {
            float _1446 = rsqrt(_1428);
            float _1448 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1450 = _239 * _1446;
            float _1452 = _237 * _1446;
            float _1454 = _265 * _1446;
            float _1456 = _1434 * _1450;
            float _1458 = fma(_1432, _1452, _1456);
            float _1460 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1462 = fma(_1436, _1454, _1458);
            float _1464 = _1462 * _1460;
            float _1466 = fma(_237, _1464, _1280);
            float _1468 = fma(_239, _1464, _1278);
            float _1470 = fma(_265, _1464, _1282);
            _1322 = _1466;
            _1324 = _1470;
            _1420 = _1468;
        }
    }
    float _1472 = _1322;
    float _1474 = _1324;
    float _1476 = _1420;
    float _1478 = _1398;
    float _1480 = _1478;
    float _1482 = _1476;
    float _1484 = _1472;
    if (_1392)
    {
        _1480 = _1472;
    }
    float _1486 = _1480;
    float _1488 = _1486;
    if (_1392)
    {
        _1326 = _1474;
    }
    float _1490 = _1326;
    float _1492 = _1490;
    if (!_1392)
    {
        float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1496 = _609 + _1494;
        float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1500 = _383 + _1498;
        float _1502 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1504 = -_385;
        float _1506 = _1504 + _1474;
        float _1508 = _1496 * _1496;
        float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1512 = _385 + _1510;
        float _1514 = fma(_1500, _1500, _1508);
        float _1516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1518 = fma(_1512, _1512, _1514);
        float _1520 = sqrt(_1518);
        float _1522 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1524 = precise::min(_1520, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1526 = _1524 * _1516;
        float _1528 = -_609;
        float _1530 = _1528 + _1476;
        float _1532 = _1522 * _1526;
        float _1534 = -_383;
        float _1536 = _1534 + _1472;
        float _1538 = fma(_1530, _1532, _609);
        float _1540 = fma(_1536, _1532, _383);
        float _1542 = fma(_1506, _1532, _385);
        _1482 = _1538;
        _1488 = _1540;
        _1492 = _1542;
    }
    float _1544 = _1482;
    float _1546 = _1488;
    float _1548 = _1492;
    float _1550 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1552 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1554 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1556 = _1406 * _1412;
    float _1558 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1550);
    float _1560 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1552);
    float _1562 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1554);
    float _1564 = _1408 * _1412;
    float _1566 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1558);
    bool _1568 = _1556 >= 0.0;
    float _1570 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1560);
    float _1572 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1562);
    float _1574 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1576 = _1566 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1578 = _1556 <= 1.0;
    bool _1580 = _1578 && _1568;
    float _1582 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1584 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1574);
    float _1586 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1588 = _1570 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1590 = _1564 >= 0.0;
    bool _1592 = _1590 && _1580;
    float _1594 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1584);
    float _1596 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1586);
    float _1598 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1600 = _1588 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1602 = _1564 <= 1.0;
    bool _1604 = _1602 && _1592;
    float _1606 = _1594 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1608 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1596);
    float _1610 = -_1600;
    float _1612 = fma(_1610, _1598, 1.0);
    if (!_1170)
    {
        float _1614 = rint(_1378);
        float _1616 = precise::max(_1614, 0.0);
        uint _1618 = uint(_1616);
        uint _1620 = clamp(_1618, 0u, 65535u);
        _1414 = as_type<float>(_1620);
    }
    float _1622 = _1414;
    float _1624 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1626 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1608);
    float _1628 = _911 * _1306;
    float _1630 = _1624;
    if (!_1170)
    {
        float _1632 = -_1402;
        float _1634 = _999 + _1632;
        _1484 = _1634;
    }
    float _1636 = _1484;
    float _1638 = fma(_383, _1298, _1628);
    float _1640 = 1.0 / _1626;
    float _1642 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (_1604)
    {
        float _1644 = float(_969);
        _1202 = _1644;
    }
    float _1646 = _1202;
    float _1648 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1624);
    float _1650 = fma(_385, _1344, _1638);
    float _1652 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1642);
    if (!_1170)
    {
        float _1654 = -_1330;
        float _1656 = _979 + _1654;
        _1630 = _1656;
    }
    float _1658 = _1630;
    float _1660 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1648);
    float _1662 = log2(_1612);
    float _1664 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1652);
    float _1666 = _1650 + _1352;
    float _1668 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1660);
    float _1670 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1664);
    float _1672 = _1666 * _1412;
    float _1674 = _1638;
    if (_1604)
    {
        float _1676 = rint(_1646);
        float _1678 = precise::max(_1676, 0.0);
        uint _1680 = uint(_1678);
        uint _1682 = clamp(_1680, 0u, 65535u);
        _1674 = as_type<float>(_1682);
    }
    float _1684 = _1674;
    float _1686 = _1668 * _1640;
    float _1688 = _1670 * _1640;
    float _1690 = fma(_1686, 0.5, 0.5);
    float _1692 = fma(_1688, -0.5, 0.5);
    float _1694 = _1662 * 0.693147182464599609375;
    float _1696 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1698 = _1694;
    if (!_1170)
    {
        float3 _5992 = float3(_1658, _1636, float(as_type<int>(_1622)));
        float3 _5996 = select(_5992, float3(0.0), isnan(_5992));
        float _1700 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5996.xy, uint(rint(_5996.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5996.xy, uint(rint(_5996.z)), level(0.0)).x;
        _1698 = _1700;
    }
    float _1702 = _1698;
    float _1704 = _1564;
    if (_1604)
    {
        float3 _6011 = float3(_1556, _1564, float(as_type<int>(_1684)));
        float3 _6013 = select(_6011, float3(0.0), isnan(_6011));
        float _1706 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6013.xy, uint(rint(_6013.z)), _1672, level(0.0));
        _1704 = _1706;
    }
    float _1708 = _1704;
    float3 _6023 = float3(_1690, _1692, _1696);
    float _1710 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6023, float3(0.0), isnan(_6023)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6023, float3(0.0), isnan(_6023)), level(0.0)).x;
    float3 _6032 = float3(_1690, _1692, _1696);
    float4 _1713 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6032, float3(0.0), isnan(_6032)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6032, float3(0.0), isnan(_6032)), level(0.0)).xyzw;
    float _1715 = _1713.x;
    float _1717 = _1713.y;
    float _1719 = _1713.z;
    float _1721 = _1713.w;
    float _1723 = float(uint(_577));
    float _1725 = trunc(_703);
    int _1727 = int(_1725);
    int _1729 = abs(_493);
    float _1731 = 1.0 / _1723;
    int _1733 = ~_577;
    int _1735 = _1733 + 1;
    int _1737 = ~_577;
    int _1739 = _1737 + 1;
    float _1741 = float(uint(_1727));
    float _1743 = float(_1727);
    int _1745 = as_type<int>(_1731) + (-2);
    float _1747 = 1.0 / _363;
    int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1751 = _1749 != 0;
    float _1753 = as_type<float>(_1745) * _1741;
    float _1755 = trunc(_1753);
    float _1757 = precise::max(_1755, 0.0);
    uint _1759 = uint(_1757);
    int _1761 = abs(as_type<int>(_499));
    int _1763 = _1735 * int(_1759);
    int _1765 = _1763 + _1727;
    float _1767 = float(uint(_1765));
    float _1769 = as_type<float>(_1745) * _1767;
    int _1771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1773 = _1771 != 0;
    bool _1775 = _1743 >= _681;
    bool _1777 = isnan(_1743);
    bool _1779 = _1775 || _1777;
    bool _1781 = isnan(_681);
    bool _1783 = _1779 || _1781;
    float _1785 = float(_1783);
    float _1787 = trunc(_1769);
    float _1789 = precise::max(_1787, 0.0);
    uint _1791 = uint(_1789);
    bool _1793 = !_1773;
    float _1795 = _1793 ? 7.345489978790283203125 : 1.0;
    float _1797 = _1795 * _165;
    float _1799 = trunc(_1785);
    int _1801 = int(_1799);
    int _1803 = int(_1759) + int(_1791);
    float _1805 = floor(_1797);
    int _1807 = _1739 * _1803;
    int _1809 = _1807 + _1727;
    int _1811 = ~_1801;
    int _1813 = _1811 + 1;
    int _1815 = _1813 + 1;
    bool _1817 = uint(_1809) >= uint(_577);
    bool _1819 = !_1817;
    int _1821 = _1819 ? 0 : (-1);
    bool _1823 = _577 == 0;
    float _1825 = -_1805;
    float _1827 = _1797 + _1825;
    int _1829 = ~_1803;
    int _1831 = _1829 + _1821;
    int _1833 = _1831 + 1;
    float _1835 = _1827 * _681;
    float _1837 = _693 * _1747;
    int _1839 = _577 * _1833;
    int _1841 = _1839 + _1727;
    bool _1843 = !_1751;
    float _1845 = _1843 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1849 = _1847 != 0;
    float _1851 = trunc(_1835);
    int _1853 = int(_1851);
    bool _1855 = !_1823;
    int _1857 = _1855 ? _1841 : (-1);
    int _1859 = _577 + (-1);
    int _1861 = _1857 * _1815;
    int _1863 = abs(_487);
    float _1865 = trunc(_1837);
    int _1867 = int(_1865);
    int _1869 = abs(as_type<int>(_1845));
    int _1871 = _1801 * _1859;
    int _1873 = _1871 + _1861;
    bool _1875 = !_1849;
    int _1877 = _1875 ? 0 : 1;
    int _1879 = _1873 * _1863;
    bool _1881 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1883 = isnan(0.5);
    bool _1885 = _1881 || _1883;
    bool _1887 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1889 = _1885 || _1887;
    int _1891 = _1853 * _1869;
    int _1893 = _1891 + _1727;
    int _1895 = abs(_1877);
    float _1897 = _1845;
    float _1899 = as_type<float>(_1729);
    if (_1170)
    {
        _1897 = 1.0;
    }
    float _1901 = _1897;
    int _1903 = _1867 * _1729;
    int _1905 = _1903 + _1879;
    int _1907 = _1893 * _1761;
    int _1909 = _1907 + _1905;
    float _1911 = _1901;
    if (_1889)
    {
        _331 = 1.0;
    }
    float _1913 = _331;
    int _1915 = _1853 * _1895;
    int _1917 = _1915 + _1909;
    int _1919 = ~_577;
    int _1921 = _1919 + 1;
    float _1923 = _1913;
    if (_1889)
    {
        _567 = 1.0;
    }
    float _1925 = _567;
    float _1927 = float(uint(_1917));
    float _1929 = as_type<float>(_1745) * _1927;
    float _1931 = trunc(_1929);
    float _1933 = precise::max(_1931, 0.0);
    uint _1935 = uint(_1933);
    int _1937 = _1921 * int(_1935);
    int _1939 = _1937 + _1917;
    float _1941 = float(uint(_1939));
    float _1943 = as_type<float>(_1745) * _1941;
    float _1945 = trunc(_1943);
    float _1947 = precise::max(_1945, 0.0);
    uint _1949 = uint(_1947);
    int _1951 = int(_1935) + int(_1949);
    float _1953 = _1925;
    if (!_1889)
    {
        float _1955 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1957 = _1955 * 0.15915493667125701904296875;
        float _1959 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1961 = _1957 * 6.283185482025146484375;
        float _1963 = cos(_1961);
        float _1965 = _1959 * 0.15915493667125701904296875;
        float _1967 = _1957 * 6.283185482025146484375;
        float _1969 = sin(_1967);
        float _1971 = 1.0 / _1963;
        float _1973 = _1965 * 6.283185482025146484375;
        float _1975 = cos(_1973);
        float _1977 = _1969 * _1971;
        float _1979 = _1965 * 6.283185482025146484375;
        float _1981 = sin(_1979);
        float _1983 = _1975 * _1977;
        float _1985 = 1.0 / _1983;
        float _1987 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1989 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1987;
        float _1991 = 1.0 / _1989;
        float _1993 = _1981 * _1985;
        float _1995 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1997 = fma(_885, _1993, _1995);
        float _1999 = _1997 * _1991;
        float _2001 = precise::clamp(_1999, 0.0, 1.0);
        _1899 = _1957;
        _1953 = _2001;
    }
    float _2003 = _1899;
    float _2005 = _1953;
    float _2007 = _2003;
    if (!_1889)
    {
        float _2009 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2011 = _2009 * 0.15915493667125701904296875;
        float _2013 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2015 = _2011 * 6.283185482025146484375;
        float _2017 = cos(_2015);
        float _2019 = _2013 * 0.15915493667125701904296875;
        float _2021 = _2011 * 6.283185482025146484375;
        float _2023 = sin(_2021);
        float _2025 = 1.0 / _2017;
        float _2027 = _2019 * 6.283185482025146484375;
        float _2029 = cos(_2027);
        float _2031 = _2023 * _2025;
        float _2033 = _2019 * 6.283185482025146484375;
        float _2035 = sin(_2033);
        float _2037 = _2029 * _2031;
        float _2039 = 1.0 / _2037;
        float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2043 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2041;
        float _2045 = 1.0 / _2043;
        float _2047 = _2035 * _2039;
        float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2051 = fma(_885, _2047, _2049);
        float _2053 = _2051 * _2045;
        float _2055 = precise::clamp(_2053, 0.0, 1.0);
        float _2057 = -_2055;
        float _2059 = _2057 + 1.0;
        _2007 = _2025;
        _1923 = _2059;
    }
    float _2061 = _2007;
    float _2063 = _1923;
    if (!_1170)
    {
        int _2065 = _1208 << 4;
        int _2067 = _2065 + 2048;
        uint _2069 = uint(int(uint(_2067) >> uint(2)));
        uint _2071 = uint(int(uint(int(_2069)) >> uint(2)));
        int _2073 = int(_2069) & 3;
        float _2075 = (*spvDescriptorSet0.vp_c15)._m0[int(_2071)][_2073];
        int _2077 = int(_2069) + 1;
        uint _2079 = uint(int(uint(_2077) >> uint(2)));
        int _2081 = _2077 & 3;
        float _2083 = (*spvDescriptorSet0.vp_c15)._m0[int(_2079)][_2081];
        int _2085 = _2067 + 8;
        uint _2087 = uint(int(uint(_2085) >> uint(2)));
        uint _2089 = uint(int(uint(int(_2087)) >> uint(2)));
        int _2091 = int(_2087) & 3;
        float _2093 = (*spvDescriptorSet0.vp_c15)._m0[int(_2089)][_2091];
        int _2095 = int(_2087) + 1;
        uint _2097 = uint(int(uint(_2095) >> uint(2)));
        int _2099 = _2095 & 3;
        float _2101 = (*spvDescriptorSet0.vp_c15)._m0[int(_2097)][_2099];
        float _2103 = _911 * _2083;
        float _2105 = fma(_383, _2075, _2103);
        float _2107 = fma(_385, _2093, _2105);
        float _2109 = _2107 + _2101;
        float _2111 = precise::clamp(_2109, 0.0, 1.0);
        float _2113 = -_2111;
        float _2115 = _2113 + _1702;
        float _2117 = fma(_2115, 500.0, 1.5);
        float _2119 = exp2(_2117);
        float _2121 = 0.0 + _2119;
        float _2123 = precise::clamp(_2121, 0.0, 1.0);
        _1212 = as_type<float>(_2067);
        _1911 = _2123;
    }
    float _2125 = _1212;
    float _2127 = _1911;
    float _2129 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2131 = _1544 + _2129;
    float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2135 = _1546 + _2133;
    float _2137 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2139 = _1548 + _2137;
    float _2141 = _2131 * _2131;
    float _2143 = fma(_2135, _2135, _2141);
    float _2145 = fma(_2139, _2139, _2143);
    float _2147 = rsqrt(_2145);
    float _2149 = sqrt(_2145);
    float _2151 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2153 = _2135 * _2151;
    float _2155 = _2139 * _2151;
    float _2157 = _2153 * _2153;
    float _2159 = _2155 * _2155;
    float _2161 = _2157 + _2159;
    float _2163 = sqrt(_2161);
    bool _2165 = _2163 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2169 = _2163 + _2167;
    float _2171 = _2061;
    float _2173 = _2161;
    float _2175 = _2169;
    float _2177 = _2125;
    float _2179 = _2153;
    float _2181 = _2155;
    float _2183 = _2157;
    float _2185 = _2159;
    if (_2165)
    {
        float _2187 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2171 = _2187;
    }
    float _2189 = _2171;
    if (_2165)
    {
        float _2191 = rsqrt(_2161);
        _2173 = _2191;
    }
    float _2193 = _2173;
    if (_2165)
    {
        float _2195 = _2169 * _2189;
        _2175 = _2195;
    }
    float _2197 = _2175;
    if (_2165)
    {
        float _2199 = _2197 * 0.15915493667125701904296875;
        _2177 = _2199;
    }
    float _2201 = _2177;
    float _2203 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2205 = _385;
    float _2207 = _2203;
    if (_2165)
    {
        float _2209 = _2201 * 6.283185482025146484375;
        float _2211 = sin(_2209);
        _2205 = _2211;
    }
    float _2213 = _2205;
    float _2215 = precise::max(0.0, _2203);
    float _2217 = _2197;
    float _2219 = _2215;
    if (_2165)
    {
        float _2221 = _2201 * 6.283185482025146484375;
        float _2223 = cos(_2221);
        _2217 = _2223;
    }
    float _2225 = _2217;
    float _2227 = -_2151;
    float _2229 = -_2215;
    float _2231 = fma(_2131, _2227, _2229);
    float _2233 = _2231;
    if (_2165)
    {
        float _2235 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2219 = _2235;
    }
    float _2237 = _2219;
    float _2239 = _2237;
    if (_2165)
    {
        float _2241 = fma(_2213, _2237, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2239 = _2241;
    }
    float _2243 = _2239;
    float _2245 = _2243;
    if (_2165)
    {
        float _2247 = _2193 * _2243;
        _2245 = _2247;
    }
    float _2249 = _2245;
    if (_2165)
    {
        float _2251 = _2225 + (-1.0);
        _2207 = _2251;
    }
    float _2253 = _2207;
    float _2255 = _2253;
    if (_2165)
    {
        float _2257 = _2153 * _2249;
        _2179 = _2257;
    }
    float _2259 = _2179;
    if (_2165)
    {
        float _2261 = _2155 * _2249;
        _2181 = _2261;
    }
    float _2263 = _2181;
    if (_2165)
    {
        float _2265 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2255 = _2265;
    }
    float _2267 = _2255;
    if (_2165)
    {
        float _2269 = _2259 * _2259;
        _2183 = _2269;
    }
    float _2271 = _2183;
    if (_2165)
    {
        float _2273 = _2263 * _2263;
        _2185 = _2273;
    }
    float _2275 = _2185;
    if (_2165)
    {
        float _2277 = fma(_2231, _2225, _2267);
        _2233 = _2277;
    }
    float _2279 = _2233;
    float _2281 = fma(_2279, _2279, _2271);
    float _2283 = _2281 + _2275;
    float _2285 = rsqrt(_2283);
    float _2287 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2289 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2287);
    float _2291 = precise::clamp(_2289, 0.0, 1.0);
    float _2293 = -_2291;
    float _2295 = _2293 + 1.0;
    float _2297 = abs(_2295);
    float _2299 = log2(_2297);
    float _2301 = _2285 * _2259;
    float _2303 = _2285 * _2279;
    float _2305 = _2285 * _2263;
    float _2307 = _2301 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2309 = -_2307;
    float _2311 = fma(_2303, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2309);
    float _2313 = -_2305;
    float _2315 = fma(_2313, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2311);
    float _2317 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2319 = fma(_2315, -0.5, 0.5);
    float _2321 = fma(_2315, 0.5, 0.5);
    float _2323 = exp2(_2317);
    float _2325 = fma(_2321, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2327 = fma(_2321, _2325, -0.212114393711090087890625);
    float _2329 = _2303 + 1.0;
    float _2331 = sqrt(_2319);
    float _2333 = fma(_2321, _2327, 1.570728778839111328125);
    float _2335 = -_2303;
    float _2337 = fma(_2323, _2329, _2335);
    int _2339 = ~_577;
    int _2341 = _2339 + 1;
    float _2343 = fma(_2337, 0.5, 0.5);
    float _2345 = _2331 * 0.636619746685028076171875;
    float _2347 = -_2333;
    float _2349 = fma(_2345, _2347, 1.0);
    float _2351 = float(uint(_1893));
    float2 _6930 = float2(_2349, _2343);
    float3 _2355 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6930, float2(0.0), isnan(_6930)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6930, float2(0.0), isnan(_6930)), level(0.0)).xyz;
    float _2357 = _2355.x;
    float _2359 = _2355.y;
    float _2361 = _2355.z;
    float _2363 = as_type<float>(_1745) * _2351;
    int _2365 = _2341 * _1951;
    int _2367 = _2365 + _1917;
    int _2369 = ~_577;
    int _2371 = _2369 + 1;
    float _2373 = -_683;
    float _2375 = _2373 + 1.0;
    float _2377 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2379 = trunc(_2363);
    float _2381 = precise::max(_2379, 0.0);
    uint _2383 = uint(_2381);
    bool _2385 = uint(_2367) >= uint(_577);
    float _2387 = -_403;
    float _2389 = _2387 + 1.0;
    float _2391 = -_705;
    float _2393 = _2391 + 1.0;
    bool _2395 = !_2385;
    int _2397 = _2395 ? 0 : (-1);
    float _2399 = exp2(_2377);
    int _2401 = ~_1951;
    int _2403 = _2401 + _2397;
    int _2405 = _2403 + 1;
    int _2407 = _577 * _2405;
    int _2409 = _2407 + _1917;
    int _2411 = _2341 * int(_2383);
    int _2413 = _2411 + _1893;
    bool _2415 = !_1823;
    int _2417 = _2415 ? _2409 : (-1);
    float _2419 = float(uint(_2413));
    int _2421 = _2417 >> 31;
    int _2423 = _2417 & 3;
    bool _2425 = _2423 != 0;
    float _2427 = as_type<float>(_1745) * _2419;
    int _2429 = _2421 & 3;
    bool _2431 = uint(_2423) > 1u;
    float _2433 = trunc(_2427);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    int _2439 = _2417 + _2429;
    int _2441 = _2417 & 3;
    bool _2443 = _2441 != 0;
    int _2445 = _2439 >> 2;
    int _2447 = _2443 ? 0 : 1;
    int _2449 = _2445 << 4;
    int _2451 = _2449 + 368;
    bool _2453 = uint(_2423) >= 2u;
    uint _2455 = uint(int(uint(_2451) >> uint(2)));
    uint _2457 = uint(int(uint(int(_2455)) >> uint(2)));
    int _2459 = int(_2455) & 3;
    float _2461 = (*spvDescriptorSet0.vp_c9)._m0[int(_2457)][_2459];
    int _2463 = int(_2455) + 1;
    uint _2465 = uint(int(uint(_2463) >> uint(2)));
    int _2467 = _2463 & 3;
    float _2469 = (*spvDescriptorSet0.vp_c9)._m0[int(_2465)][_2467];
    int _2471 = _2453 ? 0 : 1;
    int _2473 = int(_2383) + int(_2437);
    int _2475 = ~_2471;
    int _2477 = _2475 + 1;
    int _2479 = _2477 + 1;
    int _2481 = _2451 + 8;
    uint _2483 = uint(int(uint(_2481) >> uint(2)));
    uint _2485 = uint(int(uint(int(_2483)) >> uint(2)));
    int _2487 = int(_2483) & 3;
    float _2489 = (*spvDescriptorSet0.vp_c9)._m0[int(_2485)][_2487];
    int _2491 = int(_2483) + 1;
    uint _2493 = uint(int(uint(_2491) >> uint(2)));
    int _2495 = _2491 & 3;
    float _2497 = (*spvDescriptorSet0.vp_c9)._m0[int(_2493)][_2495];
    int _2499 = _2371 * _2473;
    int _2501 = _2499 + _1893;
    bool _2503 = uint(_2501) >= uint(_577);
    bool _2505 = !_2503;
    int _2507 = _2505 ? 0 : (-1);
    bool _2509 = _2423 != 3;
    int _2511 = ~_2473;
    int _2513 = _2511 + _2507;
    int _2515 = _2513 + 1;
    int _2517 = ~_2447;
    int _2519 = _2517 + 1;
    int _2521 = _2519 + 1;
    int _2523 = _2521;
    int _2525 = _2479;
    if (!_2431)
    {
        int _2527 = ~_2447;
        int _2529 = _2527 + 1;
        _2523 = _2529;
    }
    int _2531 = _2523;
    int _2533 = _577 * _2515;
    int _2535 = _2533 + _1893;
    bool _2537 = _2423 != 3;
    float _2539 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2541 = int(_2539);
    bool _2543 = !_2425;
    int _2545 = _2543 ? 0 : 1;
    int _2547 = abs(_2531);
    if (_2509)
    {
        int _2549 = ~_2471;
        int _2551 = _2549 + 1;
        _2525 = _2551;
    }
    int _2553 = _2525;
    bool _2555 = !_2537;
    int _2557 = _2555 ? 0 : (-1);
    int _2559 = abs(_2545);
    int _2561 = ~_2547;
    int _2563 = _2561 + 1;
    int _2565 = _2563 + 1;
    int _2567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2569 = _2567 != 0;
    int _2571 = abs(_2553);
    int _2573 = abs(_2557);
    int _2575 = ~_2559;
    int _2577 = _2575 + 1;
    int _2579 = _2577 + 1;
    int _2581 = _2565 * as_type<int>(_2469);
    bool _2583 = !_2569;
    int _2585 = _2583 ? 0 : 1;
    int _2587 = _2579 * as_type<int>(_2461);
    int _2589 = _2587 + _2581;
    int _2591 = abs(_2585);
    int _2593 = ~_2571;
    int _2595 = _2593 + 1;
    int _2597 = _2595 + 1;
    float _2599 = float(uint(_2541));
    int _2601 = _2597 * as_type<int>(_2489);
    int _2603 = _2601 + _2589;
    int _2605 = ~_2573;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    int _2611 = abs(_2541);
    float _2613 = 1.0 / _2599;
    int _2615 = ~_2591;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = _2609 * as_type<int>(_2497);
    int _2623 = _2621 + _2603;
    float _2625 = float(uint(_2611));
    bool _2627 = !_1823;
    int _2629 = _2627 ? _2535 : (-1);
    int _2631 = _2623 * _2619;
    int _2633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2635 = _2633 != 0;
    float _2637 = 1.0 / _2625;
    int _2639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2641 = _2639 != 0;
    int _2643 = _2629 * _2591;
    int _2645 = _2643 + _2631;
    float _2647 = float(uint(_2645));
    float _2649 = abs(_885);
    float _2651 = log2(_2649);
    int _2653 = as_type<int>(_2613) + (-2);
    int _2655 = abs(_2645);
    float _2657 = as_type<float>(_2653) * _2647;
    float _2659 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2661 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2663 = as_type<int>(_2637) + (-2);
    float _2665 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2667 = float(uint(_2655));
    float _2669 = trunc(_2657);
    float _2671 = precise::max(_2669, 0.0);
    uint _2673 = uint(_2671);
    float _2675 = _2659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2677 = ~_2611;
    int _2679 = _2677 + 1;
    float _2681 = as_type<float>(_2663) * _2667;
    int _2683 = ~_2541;
    int _2685 = _2683 + 1;
    float _2687 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2689 = _165 > 0.5;
    float _2691 = _2665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2693 = _2661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2695 = trunc(_2681);
    float _2697 = precise::max(_2695, 0.0);
    uint _2699 = uint(_2697);
    float _2701 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_74.x = _2675;
    out.m_74.y = _2691;
    out.m_74.z = _2693;
    out.m_74.w = _2687;
    float _2703 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2705 = _2685 * int(_2673);
    int _2707 = _2705 + _2645;
    float _2709 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2713 = _2701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2715 = _411 > 0.5;
    float _2717 = _2709 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2719 = float(uint(_2707));
    float _2721 = _2711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2723 = exp2(_2703);
    float _2725 = _945 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2727 = _2679 * int(_2699);
    int _2729 = _2727 + _2655;
    float _2731 = as_type<float>(_2653) * _2719;
    out.m_76.x = _2717;
    out.m_76.y = _2713;
    out.m_76.z = _2721;
    float _2733 = _945 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2735 = -_935;
    float _2737 = fma(_2735, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2725);
    float _2739 = float(uint(_2729));
    float _2741 = _945 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2743 = -_935;
    float _2745 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2733);
    bool _2747 = _885 <= 8000.0;
    bool _2749 = isnan(_885);
    bool _2751 = _2747 || _2749;
    bool _2753 = isnan(8000.0);
    bool _2755 = _2751 || _2753;
    float _2757 = float(_2755);
    float _2759 = as_type<float>(_2663) * _2739;
    float _2761 = -_935;
    float _2763 = fma(_2761, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2741);
    float _2765 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2737);
    float _2767 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2745);
    float _2769 = trunc(_2731);
    float _2771 = precise::max(_2769, 0.0);
    uint _2773 = uint(_2771);
    float _2775 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2763);
    float _2777 = _949 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2779 = _949 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2781 = _949 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2783 = fma(_2723, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2785 = precise::clamp(_2783, 0.0, 1.0);
    float _2787 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2777);
    float _2789 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2779);
    float _2791 = trunc(_2759);
    float _2793 = precise::max(_2791, 0.0);
    uint _2795 = uint(_2793);
    float _2797 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2781);
    float _2799 = -_881;
    int _2801 = _2715 ? as_type<int>(_2799) : as_type<int>(_881);
    float _2803 = _965 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2805 = _965 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2807 = _965 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2809 = !_2641;
    float _2811 = _2809 ? _881 : as_type<float>(_2801);
    float _2813 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2803);
    int _2815 = int(_2673) + int(_2773);
    float _2817 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2805);
    int _2819 = ~_2611;
    int _2821 = _2819 + 1;
    float _2823 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2807);
    float _2825 = _881 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2827 = ~_2541;
    int _2829 = _2827 + 1;
    float _2831 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2787);
    int _2833 = int(_2699) + int(_2795);
    float _2835 = _2825 * _2775;
    float _2837 = _2825 * _2767;
    float _2839 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2789);
    int _2841 = _2829 * _2815;
    int _2843 = _2841 + _2645;
    int _2845 = _2645 ^ _2541;
    int _2847 = _2821 * _2833;
    int _2849 = _2847 + _2655;
    float _2851 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2797);
    float _2853 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2813);
    uint _2855 = uint(int(uint(_2845) >> uint(31)));
    float _2857 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2817);
    bool _2859 = uint(_2849) >= uint(_2611);
    float _2861 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2823);
    bool _2863 = uint(_2843) >= uint(_2541);
    float _2865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2867 = !_2859;
    int _2869 = _2867 ? 0 : (-1);
    float _2871 = _2825 * _2765;
    int _2873 = ~int(_2855);
    int _2875 = _2873 + 1;
    float _2877 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2879 = ~_2869;
    int _2881 = _2833 + _2879;
    int _2883 = _2881 + 1;
    bool _2885 = !_2863;
    int _2887 = _2885 ? 0 : (-1);
    float _2889 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2877);
    int _2891 = _2883 ^ _2875;
    float _2893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2895 = ~_2815;
    int _2897 = _2895 + _2887;
    int _2899 = _2897 + 1;
    bool _2901 = _2541 == 0;
    int _2903 = ~_2875;
    int _2905 = _2903 + _2891;
    int _2907 = _2905 + 1;
    int _2909 = _2541 * _2899;
    int _2911 = _2909 + _2645;
    float _2913 = -_889;
    int _2915 = _2689 ? as_type<int>(_2913) : as_type<int>(_889);
    bool _2917 = !_2901;
    int _2919 = _2917 ? _2907 : (-1);
    bool _2921 = !_2635;
    float _2923 = _2921 ? _889 : as_type<float>(_2915);
    float _2925 = _889 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2927 = float(_2919);
    float _2929 = _2865 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2931 = _2811 + (-0.5);
    float _2933 = fma(_2925, _2831, _2871);
    float _2935 = fma(_2925, _2839, _2837);
    float _2937 = -_561;
    float _2939 = fma(_2929, _2927, _2937);
    float _2941 = fma(_2925, _2851, _2835);
    bool _2943 = _2541 == 0;
    float _2945 = _2893 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2947 = -_2929;
    float _2949 = fma(_2947, _2931, _2939);
    float _2951 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2889);
    bool _2953 = !_2943;
    int _2955 = _2953 ? _2911 : (-1);
    float _2957 = _2923 + 0.5;
    float _2959 = fma(_2811, _2375, _2949);
    float _2961 = _2857 + _2935;
    float _2963 = _2861 + _2941;
    float _2965 = -_2399;
    float _2967 = _2965 + 1.0;
    float _2969 = float(_2955);
    float _2971 = fma(_2785, -2.0, 3.0);
    float _2973 = _2785 * _2785;
    float _2975 = _2967 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2977 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2951);
    float _2979 = fma(_2945, _2969, _441);
    float _2981 = _2973 * _2971;
    float _2983 = _2975 * _1710;
    float _2985 = fma(_2945, _2957, _2979);
    float _2987 = -_2981;
    float _2989 = _2987 + 1.0;
    float _2991 = _2977 + _1626;
    float _2993 = -_2393;
    float _2995 = fma(_2923, _2993, _2985);
    float _2997 = fma(_2989, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2981);
    float _2999 = _2991 * 0.5;
    float _3001 = _2853 + _2933;
    out.gl_Position.x = _1668;
    out.gl_Position.y = _1670;
    out.gl_Position.z = _2977;
    out.gl_Position.w = _1626;
    float _3003 = _2757 * _2997;
    float _3005 = _2757;
    float _3007 = _2973;
    if (!_1604)
    {
        _3005 = 1.0;
    }
    float _3009 = _3005;
    float _3011 = _3009;
    if (_1604)
    {
        bool _3013 = _1708 >= _1672;
        bool _3015 = isnan(_1708);
        bool _3017 = _3013 || _3015;
        bool _3019 = isnan(_1672);
        bool _3021 = _3017 || _3019;
        float _3023 = float(_3021);
        _3011 = _3023;
    }
    float _3025 = _3011;
    float _3027 = _3003 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3029 = -_2975;
    float _3031 = _3029 + 1.0;
    out.m_78.z = _2999;
    out.m_78.w = _1626;
    bool _3033 = _2149 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3035 = isnan(_2149);
    bool _3037 = _3033 || _3035;
    bool _3039 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3041 = _3037 || _3039;
    float _3043 = _2389 * _3027;
    float _3045 = precise::clamp(_3043, 0.0, 1.0);
    float _3047 = _3025 * _2127;
    float _3049 = _1721 * _3031;
    out.m_80.x = _2995;
    out.m_80.y = _2959;
    float _3051 = -_3045;
    float _3053 = fma(_3051, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3055 = _1721 * _2983;
    out.m_82.x = _3001;
    out.m_82.y = _2961;
    out.m_82.z = _2963;
    float _3057 = -_3047;
    float _3059 = fma(_3057, _3053, 1.0);
    float _3061 = precise::clamp(_3059, 0.0, 1.0);
    float _3063 = _2361 * _2983;
    float _3065 = fma(_2357, _3055, _1715);
    float _3067 = fma(_2359, _3055, _1717);
    float _3069 = _3061 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3071 = fma(_1721, _3063, _1719);
    float _3073 = _2005 * _2063;
    float _3075 = _3031;
    float _3077 = _3027;
    float _3079 = _3047;
    float _3081 = _3055;
    float _3083 = _3073;
    if (!_3041)
    {
        _3007 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3085 = _3007;
    out.m_84.x = _3069;
    float _3087 = _3073 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3089 = _3085;
    float _3091 = _3085;
    if (!_3041)
    {
        _3075 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3093 = _3075;
    out.m_86.x = _3065;
    out.m_86.y = _3067;
    out.m_86.z = _3071;
    out.m_86.w = _3049;
    float _3095 = _3093;
    float _3097 = _3093;
    if (!_3041)
    {
        _3077 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3099 = _3077;
    float _3101 = _3099;
    float _3103 = _3099;
    if (!_3041)
    {
        _3079 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3105 = _3079;
    float _3107 = _3105;
    float _3109 = _3105;
    if (!_3041)
    {
        _3081 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3111 = _3081;
    float _3113 = _3111;
    float _3115 = _3111;
    if (!_3041)
    {
        _3083 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3117 = _3083;
    bool _3119 = !_3041;
    float _3121 = _3117;
    float _3123 = _3117;
    if (!_3119)
    {
        bool _3125 = _2149 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3127 = isnan(_2149);
        bool _3129 = _3125 || _3127;
        bool _3131 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3133 = _3129 || _3131;
        if (!_3133)
        {
            float _3135 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3137 = _2149 + _3135;
            float _3139 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3141 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3139;
            float _3143 = 1.0 / _3141;
            float _3145 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3149 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3151 = _3149 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3153 = _3137 * _3143;
            float _3155 = precise::clamp(_3153, 0.0, 1.0);
            float _3157 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3159 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3163 = _3161 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3165 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3167 = _3165 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3169 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3173 = fma(_3155, _3159, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3175 = fma(_3155, _3163, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3177 = fma(_3155, _3167, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3179 = fma(_3155, _3171, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3181 = fma(_3155, _3147, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3183 = fma(_3155, _3151, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3097 = _3175;
            _3115 = _3181;
            _3091 = _3173;
            _3109 = _3179;
            _3103 = _3177;
            _3123 = _3183;
            _3185 = true;
        }
        else
        {
            bool _3187 = _2149 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3189 = isnan(_2149);
            bool _3191 = _3187 || _3189;
            bool _3193 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3195 = _3191 || _3193;
            if (!_3195)
            {
                _3089 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3197 = _3089;
            _3091 = _3197;
            if (!_3195)
            {
                _3095 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3199 = _3095;
            _3097 = _3199;
            if (!_3195)
            {
                _3101 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3201 = _3101;
            _3103 = _3201;
            if (!_3195)
            {
                _3107 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3203 = _3107;
            _3109 = _3203;
            if (!_3195)
            {
                _3113 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3205 = _3113;
            _3115 = _3205;
            if (!_3195)
            {
                _3121 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3207 = _3121;
            bool _3209 = !_3195;
            _3123 = _3207;
            if (!_3209)
            {
                bool _3211 = _2149 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3213 = isnan(_2149);
                bool _3215 = _3211 || _3213;
                bool _3217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3219 = _3215 || _3217;
                if (!_3219)
                {
                    float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3223 = _2149 + _3221;
                    float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3227 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3225;
                    float _3229 = 1.0 / _3227;
                    float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3239 = _3223 * _3229;
                    float _3241 = precise::clamp(_3239, 0.0, 1.0);
                    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3245 = _3243 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3249 = _3247 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3251 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3253 = _3251 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3255 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3257 = _3255 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3259 = fma(_3241, _3245, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3261 = fma(_3241, _3249, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3263 = fma(_3241, _3253, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3265 = fma(_3241, _3257, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3267 = fma(_3241, _3233, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3269 = fma(_3241, _3237, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3097 = _3261;
                    _3115 = _3267;
                    _3091 = _3259;
                    _3109 = _3265;
                    _3103 = _3263;
                    _3123 = _3269;
                    _3185 = true;
                }
                else
                {
                    _3097 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3115 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3091 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3109 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3103 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3123 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3185 = false;
    float _3271 = _3097;
    float _3273 = _3115;
    float _3275 = _3091;
    float _3277 = _3109;
    float _3279 = _3103;
    float _3281 = _3123;
    float _3283 = fma(_2961, -0.5, 0.5);
    float _3285 = precise::clamp(_3283, 0.0, 1.0);
    float _3287 = -_3271;
    float _3289 = _3287 + _3273;
    float _3291 = _3087 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3293 = -_3275;
    float _3295 = _3293 + _3277;
    out.m_88.x = 0.0;
    float _3297 = fma(_3285, _3289, _3271);
    float _3299 = -_3279;
    float _3301 = _3299 + _3281;
    out.m_59.x = _3291;
    float _3303 = fma(_3285, _3295, _3275);
    float _3305 = _3297 * 0.586610972881317138671875;
    bool _3307 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3309 = fma(_3285, _3301, _3279);
    float _3311 = fma(_3303, 0.298911988735198974609375, _3305);
    bool _3313 = _2005 > 0.0;
    bool _3315 = isnan(_2005);
    bool _3317 = _3313 || _3315;
    bool _3319 = isnan(0.0);
    bool _3321 = _3317 || _3319;
    float _3323 = fma(_3309, 0.114477999508380889892578125, _3311);
    bool _3325 = _2063 <= 0.0;
    bool _3327 = !_3321;
    bool _3329 = _3325 || _3327;
    float _3331 = -_3323;
    float _3333 = _3303 + _3331;
    float _3335 = -_3323;
    float _3337 = _3297 + _3335;
    float _3339 = -_3323;
    float _3341 = _3309 + _3339;
    float _3343 = fma(_3333, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3323);
    float _3345 = fma(_3337, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3323);
    float _3347 = fma(_3341, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3323);
    bool _3349 = !_3307;
    if (!_3349)
    {
        float _3351 = -_1544;
        float _3353 = _3351 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3355 = -_1546;
        float _3357 = _3355 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3359 = -_1548;
        float _3361 = _3359 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3363 = _3353 * _3353;
        float _3365 = fma(_3357, _3357, _3363);
        float _3367 = fma(_3361, _3361, _3365);
        float _3369 = sqrt(_3367);
        float _3371 = rsqrt(_3367);
        float _3373 = -_3369;
        float _3375 = _3373 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3377 = _3375 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3379 = precise::clamp(_3377, 0.0, 1.0);
        float _3381 = _3357 * _3371;
        float _3383 = _3353 * _3371;
        float _3385 = abs(_3379);
        float _3387 = log2(_3385);
        float _3389 = _3361 * _3371;
        float _3391 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3393 = _2961 * _3383;
        float _3395 = -_3383;
        float _3397 = -_3391;
        float _3399 = fma(_3395, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3397);
        float _3401 = fma(_3001, _3381, _3393);
        float _3403 = -_3389;
        float _3405 = fma(_3403, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3399);
        float _3407 = fma(_2963, _3389, _3401);
        float _3409 = precise::clamp(_3407, 0.0, 1.0);
        float _3411 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3413 = _3405 + _3411;
        float _3415 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3417 = _3413 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3419 = precise::clamp(_3417, 0.0, 1.0);
        float _3421 = exp2(_3415);
        float _3423 = _3421 * _3419;
        float _3425 = _3409 * _3423;
        float _3427 = _3425 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3429 = _3425 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3431 = _3425 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3427;
        out.m_88.y = _3429;
        out.m_88.z = _3431;
    }
    out.m_90.x = _3343;
    out.m_90.y = _3345;
    out.m_90.z = _3347;
    if (!_3329)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _3433 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3433;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3185 = false;
    bool _353 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_56.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_59.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3490 = as_type<float>(_125);
        out.gl_Position.z = _3490;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_61.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_59.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3560 = as_type<float>(_163);
        out.gl_Position.z = _3560;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = in.m_63.x;
    float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _169 = _143 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _171 = _143 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _173 = in.m_65.x;
    float _175 = in.m_65.y;
    float _177 = in.m_65.z;
    float _179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _181 = _169 * _167;
    float _183 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _181);
    float _185 = _171 * _179;
    float _187 = floor(_183);
    float _189 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].y, _185);
    float _191 = _183 * 6.283185482025146484375;
    float _193 = _175 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _195 = _191 * 0.15915493667125701904296875;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = floor(_189);
    float _203 = _189 * 6.283185482025146484375;
    float _205 = _175 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _209 = _207 != 0;
    int _211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _213 = _211 != 0;
    float _215 = _175 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _217 = _203 * 0.15915493667125701904296875;
    float _219 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].x, _205);
    float _221 = -_187;
    float _223 = _183 + _221;
    bool _225 = !_209;
    int _227 = _225 ? 0 : 1;
    float _229 = _195 * 6.283185482025146484375;
    float _231 = cos(_229);
    float _233 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].x, _193);
    float _235 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].x, _215);
    float _237 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _219);
    float _239 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _233);
    float _241 = -_201;
    float _243 = _189 + _241;
    int _245 = abs(_227);
    float _247 = _217 * 6.283185482025146484375;
    float _249 = cos(_247);
    bool _251 = !_199;
    int _253 = _251 ? 0 : 1;
    float _255 = -_223;
    float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _259 = -_243;
    float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _265 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _235);
    int _267 = abs(_253);
    float _269 = float(_245);
    float _271 = fma(_231, 0.5, 0.5);
    bool _273 = !_213;
    int _275 = _273 ? 0 : 1;
    bool _277 = _223 < 0.5;
    float _279 = float(_277);
    float _281 = abs(_257);
    float _283 = _269 * _281;
    int _285 = abs(_275);
    float _287 = abs(_261);
    float _289 = _269 * _287;
    float _291 = fma(_249, 0.5, 0.5);
    float _293 = float(_267);
    float _295 = -_271;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _299 = -_291;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _303 = _243 < 0.5;
    float _305 = float(_303);
    float _307 = -_279;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = float(_285);
    float _313 = fma(_293, _297, _283);
    float _315 = fma(_293, _301, _289);
    float _317 = -_305;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _321 = abs(_309);
    float _323 = fma(_311, _321, _313);
    float _325 = abs(_319);
    float _327 = fma(_311, _325, _315);
    bool _329 = !_263;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _349;
    float _351;
    if (!_329)
    {
        float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _335 = _165 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _337 = float(_109);
        float _339 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _341 = _339 * _333;
        float _343 = floor(_341);
        float _345 = -_343;
        float _347 = _341 + _345;
        _349 = _347;
        _351 = _337;
        _353 = true;
    }
    else
    {
        float _355 = float(_109);
        float _357 = 1.0 / _355;
        float _359 = _143 * _357;
        _349 = _359;
        _351 = _355;
    }
    _353 = false;
    float _361 = _349;
    float _363 = _351;
    float _365 = in.m_56.x;
    float _367 = in.m_56.y;
    float _369 = in.m_56.z;
    float _371 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _373 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _375 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _371);
    float _377 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _373);
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _375);
    float _381 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _377);
    float _383 = _379 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _385 = _381 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _387 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _389 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _391 = floor(_387);
    float _393 = floor(_389);
    float _395 = -_391;
    float _397 = _387 + _395;
    float _399 = -_393;
    float _401 = _389 + _399;
    float2 _3929 = float2(_397, _401);
    float _403 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3929, float2(0.0), isnan(_3929)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3929, float2(0.0), isnan(_3929)), level(0.0)).x;
    float _405 = in.m_63.z;
    float _407 = _165 * 2.0;
    float _409 = _165 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _411 = in.m_63.y;
    float _413 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _415 = floor(_407);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _423 = _361 + _421;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _427 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _413);
    float _429 = -_425;
    float _431 = fma(_409, 2.0, _429);
    float _433 = 1.0 / _419;
    float _435 = as_type<float>(int(gl_VertexIndex));
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _439 = -_143;
    float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[76].x, _431);
    float _443 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _445 = _415 > 0.0;
    float _447 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _449 = int(_447);
    bool _451 = _415 >= 0.0;
    bool _453 = isnan(_415);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = _405 * 2.0;
    float _463 = _165 + _411;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _475 = _473 != 0;
    float _477 = _411 * 2.0;
    float _479 = _423 * _433;
    float _481 = floor(_461);
    float _483 = _463 + (-1.0);
    bool _485 = !_471;
    int _487 = _485 ? 0 : 1;
    float _489 = _411 + _405;
    bool _491 = !_467;
    int _493 = _491 ? 0 : 1;
    float _495 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _497 = !_475;
    float _499 = _497 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _501 = _489 + (-1.0);
    float _503 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _505 = log2(_503);
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _509 = _507 != 0;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _513 = _511 != 0;
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _517 = _515 != 0;
    float _519 = _165 + _405;
    float _521 = _411 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _523 = _459 ? 0 : 1;
    float _525 = _519 + (-1.0);
    float _527 = _405 + (-0.5);
    bool _529 = _481 > 0.0;
    float _531 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _533 = _481 >= 0.0;
    bool _535 = isnan(_481);
    bool _537 = _533 || _535;
    bool _539 = isnan(0.0);
    bool _541 = _537 || _539;
    float _543 = floor(_477);
    bool _545 = !_513;
    int _547 = _545 ? 0 : 1;
    float _549 = fma(_521, -2.0, _437);
    int _551 = _541 ? 0 : 1;
    float _553 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _555 = ~_523;
    int _557 = _555 + 1;
    int _559 = _557 + 1;
    float _561 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _549);
    int _563 = _559;
    int _565 = 2;
    float _567 = _499;
    if (!_445)
    {
        int _569 = ~_523;
        int _571 = _569 + 1;
        _563 = _571;
    }
    int _573 = _563;
    float _575 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _577 = int(_575);
    int _579 = abs(_547);
    int _581 = ~_551;
    int _583 = _581 + 1;
    int _585 = _583 + 1;
    int _587 = _585;
    if (!_529)
    {
        int _589 = ~_551;
        int _591 = _589 + 1;
        _587 = _591;
    }
    int _593 = _587;
    float _595 = _505 * _143;
    float _597 = float(_449);
    float _599 = float(_573);
    float _601 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _427);
    float _603 = float(_579);
    float _605 = exp2(_595);
    bool _607 = _543 > 0.0;
    float _609 = _601 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _611 = _543 >= 0.0;
    bool _613 = isnan(_543);
    bool _615 = _611 || _613;
    bool _617 = isnan(0.0);
    bool _619 = _615 || _617;
    float _621 = _603 * _599;
    float _623 = in.m_70.x;
    float _625 = in.m_70.y;
    float _627 = in.m_70.z;
    float _629 = _609 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _631 = 1.0 / _597;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _635 = 1.0 + _633;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _639 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[11].x, _629);
    bool _641 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _643 = isnan(1.0);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _649 = _645 || _647;
    float _651 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _653 = !_509;
    int _655 = _653 ? 0 : 1;
    float _657 = 1.0 / _635;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _661 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[78].w, _637);
    float _663 = -_605;
    float _665 = _663 + 1.0;
    float _667 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[11].z, _639);
    bool _669 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _671 = isnan(0.0);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _677 = _673 || _675;
    float _679 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[78].z, _659);
    float _681 = float(_577);
    float _683 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _661);
    int _685 = abs(_655);
    float _687 = _609 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _689 = _667 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _691 = _677 ? _665 : 0.0;
    float _693 = _681 * _143;
    float _695 = float(_685);
    float _697 = fma(_383, (*spvDescriptorSet0.vp_c8)._m0[10].x, _687);
    float _699 = float(_593);
    float _701 = 1.0 / _689;
    float _703 = _631 * _143;
    float _705 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _679);
    if (_649)
    {
        float _707 = _691 * _657;
        _145 = _707;
    }
    float _709 = _145;
    float _711 = _621 * (-2.0);
    float _713 = fma(_385, (*spvDescriptorSet0.vp_c8)._m0[10].z, _697);
    float _715 = _695 * _699;
    float _717 = _411 + (-0.5);
    float _719 = fma(_711, _625, _625);
    float _721 = _713 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _723 = _715 * (-2.0);
    int _725 = _619 ? 0 : 1;
    float _727 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[196].y, _719);
    float _729 = _721 + _689;
    float _731 = _165 + (-0.5);
    float _733 = fma(_723, _623, _623);
    float _735 = _729 * _701;
    float _737 = _735 * 0.5;
    float _739 = fma(_531, _711, _531);
    float _741 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[196].x, _733);
    bool _743 = !_517;
    int _745 = _743 ? 0 : 1;
    float _747 = fma(_495, _723, _495);
    int _749 = ~_725;
    int _751 = _749 + 1;
    int _753 = _751 + 1;
    float _755 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _757 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[30].w, _755);
    int _759 = _753;
    if (!_607)
    {
        int _761 = ~_725;
        int _763 = _761 + 1;
        _759 = _763;
    }
    int _765 = _759;
    float _767 = fma(_739, _709, _727);
    int _769 = abs(_745);
    float _771 = fma(_747, _709, _741);
    bool _773 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _775 = isnan(_361);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = _767 * 0.15915493667125701904296875;
    float _787 = in.m_72.x;
    float _789 = in.m_72.y;
    float _791 = -_783;
    float _793 = _791 + 1.0;
    float _795 = float(_769);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _797;
    float _801 = float(_765);
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _803;
    bool _807 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _809 = isnan(_361);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = fma(_799, _479, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _821 = 1.0 / _757;
    float _823 = _795 * _801;
    float _825 = fma(_805, _479, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _827 = _817 * _793;
    float _829 = -_817;
    float _831 = _829 + 1.0;
    float _833 = _823 * (-2.0);
    float _835 = _771 * 0.15915493667125701904296875;
    float _837 = _819 * _827;
    float _839 = _825 * _827;
    float _841 = fma(_833, _627, _627);
    float _843 = fma(_553, _833, _553);
    float _845 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[143].x, _837);
    float _847 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[143].y, _839);
    float _849 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[196].z, _841);
    float _851 = _785 * 6.283185482025146484375;
    float _853 = sin(_851);
    float _855 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[144].x, _845);
    float _857 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[144].y, _847);
    float _859 = fma(_843, _709, _849);
    int _861 = as_type<int>(_435) & 1;
    bool _863 = _861 != 0;
    int _865 = as_type<int>(_435) & 2;
    bool _867 = _865 != 0;
    float _869 = _855 * _787;
    float _871 = _857 * _789;
    float _873 = _859 * 0.15915493667125701904296875;
    float _875 = _785 * 6.283185482025146484375;
    float _877 = cos(_875);
    bool _879 = !_867;
    float _881 = _879 ? (-0.5) : 0.5;
    float _883 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _885 = _821 * _883;
    bool _887 = !_863;
    float _889 = _887 ? (-0.5) : 0.5;
    float _891 = _327 * _871;
    float _893 = _323 * _869;
    float _895 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _881);
    bool _897 = _885 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _899 = _835 * 6.283185482025146484375;
    float _901 = sin(_899);
    float _903 = _891 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _905 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _889);
    float _907 = _893 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _909 = _885 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _911 = _609 + _651;
    float _913 = _903 * _895;
    float _915 = _907 * _905;
    float _917 = _835 * 6.283185482025146484375;
    float _919 = cos(_917);
    float _921 = _911 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    if (!_897)
    {
        _565 = 1;
    }
    int _923 = _565;
    float _925 = _873 * 6.283185482025146484375;
    float _927 = cos(_925);
    float _929 = _901 * _853;
    float _931 = _901 * _877;
    float _933 = _873 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = _919 * _877;
    float _939 = _919 * _853;
    float _941 = _877 * _927;
    float _943 = _901 * _927;
    float _945 = _919 * _927;
    float _947 = _853 * _927;
    float _949 = fma(_935, _937, _929);
    float _951 = fma(_935, _929, _937);
    bool _953 = !_897;
    int _955 = _953 ? 0 : 1;
    float _957 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[126].x, _921);
    float _959 = -_939;
    float _961 = fma(_935, _931, _959);
    float _963 = -_931;
    float _965 = fma(_935, _939, _963);
    int _967 = _923;
    if (!_909)
    {
        _967 = _955;
    }
    int _969 = _967;
    float _971 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[126].z, _957);
    float _973 = _911 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _975 = _945 * _913;
    int _977 = _969 << 6;
    float _979 = _971 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _981 = fma(_383, (*spvDescriptorSet0.vp_c15)._m0[127].x, _973);
    float _983 = -_913;
    float _985 = _935 * _983;
    float _987 = fma(_949, _915, _975);
    float _989 = _943 * _913;
    float _991 = fma(_385, (*spvDescriptorSet0.vp_c15)._m0[127].z, _981);
    float _993 = fma(_941, _915, _985);
    float _995 = fma(_965, _443, _987);
    float _997 = fma(_961, _915, _989);
    float _999 = _991 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1001 = fma(_947, _443, _993);
    float _1003 = _995 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1005 = _995 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1007 = fma(_951, _443, _997);
    float _1009 = trunc(_979);
    int _1011 = int(_1009);
    float _1013 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1003);
    float _1015 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1005);
    int _1017 = _977 + 64;
    uint _1020 = uint(int(uint(_1017) >> uint(2)));
    uint _1022 = uint(int(uint(int(_1020)) >> uint(2)));
    int _1024 = int(_1020) & 3;
    float _1026 = (*spvDescriptorSet0.vp_c15)._m0[int(_1022)][_1024];
    int _1028 = int(_1020) + 1;
    uint _1030 = uint(int(uint(_1028) >> uint(2)));
    int _1032 = _1028 & 3;
    float _1034 = (*spvDescriptorSet0.vp_c15)._m0[int(_1030)][_1032];
    float _1036 = _995 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1038 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1013);
    float _1040 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1015);
    float _1042 = trunc(_999);
    int _1044 = int(_1042);
    float _1046 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1048 = _1040 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1050 = _977 + 48;
    uint _1052 = uint(int(uint(_1050) >> uint(2)));
    uint _1054 = uint(int(uint(int(_1052)) >> uint(2)));
    int _1056 = int(_1052) & 3;
    float _1058 = (*spvDescriptorSet0.vp_c15)._m0[int(_1054)][_1056];
    int _1060 = int(_1052) + 1;
    uint _1062 = uint(int(uint(_1060) >> uint(2)));
    int _1064 = _1060 & 3;
    float _1066 = (*spvDescriptorSet0.vp_c15)._m0[int(_1062)][_1064];
    float _1068 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1036);
    float _1070 = _385 + _1046;
    float _1072 = _383 + _1048;
    int _1074 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1076 = _1011 + _1074;
    int _1078 = _1076 + 1;
    float _1080 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1082 = _1070 + _1080;
    float _1084 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1068);
    int _1086 = _977 + 56;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.vp_c15)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
    bool _1104 = _1078 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1106 = _1082 * _1082;
    float _1108 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1110 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1112 = _1044 + _1110;
    int _1114 = _1112 + 1;
    float _1116 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1118 = _1072 + _1116;
    float _1120 = _609 + _1108;
    int _1122 = _977 + 72;
    uint _1124 = uint(int(uint(_1122) >> uint(2)));
    uint _1126 = uint(int(uint(int(_1124)) >> uint(2)));
    int _1128 = int(_1124) & 3;
    float _1130 = (*spvDescriptorSet0.vp_c15)._m0[int(_1126)][_1128];
    int _1132 = int(_1124) + 1;
    uint _1134 = uint(int(uint(_1132) >> uint(2)));
    int _1136 = _1132 & 3;
    float _1138 = (*spvDescriptorSet0.vp_c15)._m0[int(_1134)][_1136];
    int _1140 = _1078 | _1114;
    float _1142 = fma(_1118, _1118, _1106);
    bool _1144 = _1140 < 0;
    bool _1146 = _1144 || _1104;
    float _1148 = sqrt(_1142);
    int _1150 = _977 + 96;
    uint _1152 = uint(int(uint(_1150) >> uint(2)));
    uint _1154 = uint(int(uint(int(_1152)) >> uint(2)));
    int _1156 = int(_1152) & 3;
    float _1158 = (*spvDescriptorSet0.vp_c15)._m0[int(_1154)][_1156];
    int _1160 = int(_1152) + 1;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    int _1164 = _1160 & 3;
    float _1166 = (*spvDescriptorSet0.vp_c15)._m0[int(_1162)][_1164];
    bool _1168 = _1114 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1170 = _1168 || _1146;
    int _1172 = _977 + 104;
    uint _1174 = uint(int(uint(_1172) >> uint(2)));
    uint _1176 = uint(int(uint(int(_1174)) >> uint(2)));
    int _1178 = int(_1174) & 3;
    float _1180 = (*spvDescriptorSet0.vp_c15)._m0[int(_1176)][_1178];
    int _1182 = int(_1174) + 1;
    uint _1184 = uint(int(uint(_1182) >> uint(2)));
    int _1186 = _1182 & 3;
    float _1188 = (*spvDescriptorSet0.vp_c15)._m0[int(_1184)][_1186];
    int _1190 = as_type<int>(_1001);
    int _1192 = as_type<int>(_1007);
    int _1194 = _1078;
    float _1196 = _1120;
    float _1198 = _1072;
    float _1200 = _1070;
    float _1202 = as_type<float>(_977);
    if (!_1170)
    {
        int _1204 = _1114 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1206 = _1204 + _1078;
        _1190 = _1206;
    }
    int _1208 = _1190;
    bool _1210 = _1148 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = as_type<float>(_1208);
    if (!_1170)
    {
        int _1214 = _1208 << 2;
        _1192 = _1214;
    }
    int _1216 = _1192;
    int _1218 = _1216;
    if (!_1170)
    {
        uint _1220 = uint(int(uint(_1208) >> uint(2)));
        _1194 = int(_1220);
    }
    int _1222 = _1194;
    float _1224 = as_type<float>(_1222);
    if (!_1170)
    {
        int _1226 = 12 & _1216;
        _1218 = _1226;
    }
    int _1228 = _1218;
    float _1230 = as_type<float>(_1228);
    if (!_1170)
    {
        int _1232 = _1222 << 4;
        int _1234 = _1232 + _1228;
        _1224 = as_type<float>(_1234);
    }
    float _1236 = _1224;
    bool _1238 = !_1210;
    float _1240 = _1066;
    if (!_1238)
    {
        float _1242 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1244 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1246 = _1148 + _1244;
        float _1248 = _1120 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1250 = rsqrt(_1142);
        float _1252 = _1246 * _1242;
        float _1254 = _1252 * 0.15915493667125701904296875;
        float _1256 = _1254 * 6.283185482025146484375;
        float _1258 = cos(_1256);
        float _1260 = _1254 * 6.283185482025146484375;
        float _1262 = sin(_1260);
        float _1264 = _1258 + (-1.0);
        float _1266 = fma(_1262, _1248, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1268 = _1264 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1270 = _1250 * _1266;
        float _1272 = fma(_1120, _1258, _1268);
        float _1274 = fma(_1118, _1270, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1276 = fma(_1082, _1270, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1196 = _1272;
        _1198 = _1274;
        _1200 = _1276;
        _1230 = _1262;
    }
    float _1278 = _1196;
    float _1280 = _1198;
    float _1282 = _1200;
    float _1284 = _1230;
    float _1286 = -_609;
    float _1288 = _1286 + _1278;
    int _1290 = _977 + 80;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    uint _1294 = uint(int(uint(int(_1292)) >> uint(2)));
    int _1296 = int(_1292) & 3;
    float _1298 = (*spvDescriptorSet0.vp_c15)._m0[int(_1294)][_1296];
    int _1300 = int(_1292) + 1;
    uint _1302 = uint(int(uint(_1300) >> uint(2)));
    int _1304 = _1300 & 3;
    float _1306 = (*spvDescriptorSet0.vp_c15)._m0[int(_1302)][_1304];
    float _1308 = -_383;
    float _1310 = _1308 + _1280;
    float _1312 = -_385;
    float _1314 = _1312 + _1282;
    float _1316 = _1288 * _1288;
    float _1318 = _911 * _1166;
    float _1320 = _1284;
    float _1322 = _1280;
    float _1324 = _1282;
    float _1326 = _1278;
    if (!_1170)
    {
        float _1328 = floor(_979);
        _1320 = _1328;
    }
    float _1330 = _1320;
    float _1332 = _911 * _1034;
    float _1334 = fma(_1310, _1310, _1316);
    int _1336 = _977 + 88;
    uint _1338 = uint(int(uint(_1336) >> uint(2)));
    uint _1340 = uint(int(uint(int(_1338)) >> uint(2)));
    int _1342 = int(_1338) & 3;
    float _1344 = (*spvDescriptorSet0.vp_c15)._m0[int(_1340)][_1342];
    int _1346 = int(_1338) + 1;
    uint _1348 = uint(int(uint(_1346) >> uint(2)));
    int _1350 = _1346 & 3;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[int(_1348)][_1350];
    float _1354 = fma(_383, _1158, _1318);
    float _1356 = fma(_383, _1026, _1332);
    float _1358 = fma(_1314, _1314, _1334);
    float _1360 = fma(_385, _1180, _1354);
    float _1362 = _911 * _1066;
    float _1364 = sqrt(_1358);
    float _1366 = _1236;
    if (!_1170)
    {
        int _1368 = as_type<int>(_1236) + 400;
        uint _1370 = uint(int(uint(_1368) >> uint(2)));
        uint _1372 = uint(int(uint(int(_1370)) >> uint(2)));
        int _1374 = int(_1370) & 3;
        float _1376 = (*spvDescriptorSet0.vp_c15)._m0[int(_1372)][_1374];
        _1366 = _1376;
    }
    float _1378 = _1366;
    float _1380 = _1360 + _1188;
    float _1382 = fma(_383, _1058, _1362);
    bool _1384 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1386 = isnan(0.5);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1392 = _1388 || _1390;
    float _1394 = fma(_385, _1094, _1382);
    float _1396 = _1180;
    float _1398 = _1394;
    if (!_1170)
    {
        float _1400 = floor(_999);
        _1396 = _1400;
    }
    float _1402 = _1396;
    float _1404 = fma(_385, _1130, _1356);
    float _1406 = _1394 + _1102;
    float _1408 = _1404 + _1138;
    bool _1410 = _1364 > 0.0;
    float _1412 = 1.0 / _1380;
    float _1414 = _1406;
    if (!_1410)
    {
        _1240 = _1278;
    }
    float _1416 = _1240;
    bool _1418 = !_1410;
    float _1420 = _1416;
    if (!_1418)
    {
        float _1422 = _239 * _239;
        float _1424 = rsqrt(_1358);
        float _1426 = fma(_237, _237, _1422);
        float _1428 = fma(_265, _265, _1426);
        float _1430 = sqrt(_1428);
        float _1432 = _1310 * _1424;
        float _1434 = _1288 * _1424;
        float _1436 = _1314 * _1424;
        bool _1438 = _1430 > 0.0;
        float _1440 = _1430;
        _1398 = _1428;
        if (!_1438)
        {
            _1440 = _1278;
        }
        float _1442 = _1440;
        bool _1444 = !_1438;
        _1420 = _1442;
        if (!_1444)
        {
            float _1446 = rsqrt(_1428);
            float _1448 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1450 = _239 * _1446;
            float _1452 = _237 * _1446;
            float _1454 = _265 * _1446;
            float _1456 = _1434 * _1450;
            float _1458 = fma(_1432, _1452, _1456);
            float _1460 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1462 = fma(_1436, _1454, _1458);
            float _1464 = _1462 * _1460;
            float _1466 = fma(_237, _1464, _1280);
            float _1468 = fma(_239, _1464, _1278);
            float _1470 = fma(_265, _1464, _1282);
            _1322 = _1466;
            _1324 = _1470;
            _1420 = _1468;
        }
    }
    float _1472 = _1322;
    float _1474 = _1324;
    float _1476 = _1420;
    float _1478 = _1398;
    float _1480 = _1478;
    float _1482 = _1476;
    float _1484 = _1472;
    if (_1392)
    {
        _1480 = _1472;
    }
    float _1486 = _1480;
    float _1488 = _1486;
    if (_1392)
    {
        _1326 = _1474;
    }
    float _1490 = _1326;
    float _1492 = _1490;
    if (!_1392)
    {
        float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1496 = _609 + _1494;
        float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1500 = _383 + _1498;
        float _1502 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1504 = -_385;
        float _1506 = _1504 + _1474;
        float _1508 = _1496 * _1496;
        float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1512 = _385 + _1510;
        float _1514 = fma(_1500, _1500, _1508);
        float _1516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1518 = fma(_1512, _1512, _1514);
        float _1520 = sqrt(_1518);
        float _1522 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1524 = precise::min(_1520, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1526 = _1524 * _1516;
        float _1528 = -_609;
        float _1530 = _1528 + _1476;
        float _1532 = _1522 * _1526;
        float _1534 = -_383;
        float _1536 = _1534 + _1472;
        float _1538 = fma(_1530, _1532, _609);
        float _1540 = fma(_1536, _1532, _383);
        float _1542 = fma(_1506, _1532, _385);
        _1482 = _1538;
        _1488 = _1540;
        _1492 = _1542;
    }
    float _1544 = _1482;
    float _1546 = _1488;
    float _1548 = _1492;
    float _1550 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1552 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1554 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1556 = _1406 * _1412;
    float _1558 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1550);
    float _1560 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1552);
    float _1562 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1554);
    float _1564 = _1408 * _1412;
    float _1566 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1558);
    bool _1568 = _1556 >= 0.0;
    float _1570 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1560);
    float _1572 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1562);
    float _1574 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1576 = _1566 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1578 = _1556 <= 1.0;
    bool _1580 = _1578 && _1568;
    float _1582 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1584 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1574);
    float _1586 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1588 = _1570 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1590 = _1564 >= 0.0;
    bool _1592 = _1590 && _1580;
    float _1594 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1584);
    float _1596 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1586);
    float _1598 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1600 = _1588 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1602 = _1564 <= 1.0;
    bool _1604 = _1602 && _1592;
    float _1606 = _1594 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1608 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1596);
    float _1610 = -_1600;
    float _1612 = fma(_1610, _1598, 1.0);
    if (!_1170)
    {
        float _1614 = rint(_1378);
        float _1616 = precise::max(_1614, 0.0);
        uint _1618 = uint(_1616);
        uint _1620 = clamp(_1618, 0u, 65535u);
        _1414 = as_type<float>(_1620);
    }
    float _1622 = _1414;
    float _1624 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1626 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1608);
    float _1628 = _911 * _1306;
    float _1630 = _1624;
    if (!_1170)
    {
        float _1632 = -_1402;
        float _1634 = _999 + _1632;
        _1484 = _1634;
    }
    float _1636 = _1484;
    float _1638 = fma(_383, _1298, _1628);
    float _1640 = 1.0 / _1626;
    float _1642 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (_1604)
    {
        float _1644 = float(_969);
        _1202 = _1644;
    }
    float _1646 = _1202;
    float _1648 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1624);
    float _1650 = fma(_385, _1344, _1638);
    float _1652 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1642);
    if (!_1170)
    {
        float _1654 = -_1330;
        float _1656 = _979 + _1654;
        _1630 = _1656;
    }
    float _1658 = _1630;
    float _1660 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1648);
    float _1662 = log2(_1612);
    float _1664 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1652);
    float _1666 = _1650 + _1352;
    float _1668 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1660);
    float _1670 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1664);
    float _1672 = _1666 * _1412;
    float _1674 = _1638;
    if (_1604)
    {
        float _1676 = rint(_1646);
        float _1678 = precise::max(_1676, 0.0);
        uint _1680 = uint(_1678);
        uint _1682 = clamp(_1680, 0u, 65535u);
        _1674 = as_type<float>(_1682);
    }
    float _1684 = _1674;
    float _1686 = _1668 * _1640;
    float _1688 = _1670 * _1640;
    float _1690 = fma(_1686, 0.5, 0.5);
    float _1692 = fma(_1688, -0.5, 0.5);
    float _1694 = _1662 * 0.693147182464599609375;
    float _1696 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1698 = _1694;
    if (!_1170)
    {
        float3 _5992 = float3(_1658, _1636, float(as_type<int>(_1622)));
        float3 _5996 = select(_5992, float3(0.0), isnan(_5992));
        float _1700 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5996.xy, uint(rint(_5996.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5996.xy, uint(rint(_5996.z)), level(0.0)).x;
        _1698 = _1700;
    }
    float _1702 = _1698;
    float _1704 = _1564;
    if (_1604)
    {
        float3 _6011 = float3(_1556, _1564, float(as_type<int>(_1684)));
        float3 _6013 = select(_6011, float3(0.0), isnan(_6011));
        float _1706 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6013.xy, uint(rint(_6013.z)), _1672, level(0.0));
        _1704 = _1706;
    }
    float _1708 = _1704;
    float3 _6023 = float3(_1690, _1692, _1696);
    float _1710 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6023, float3(0.0), isnan(_6023)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6023, float3(0.0), isnan(_6023)), level(0.0)).x;
    float3 _6032 = float3(_1690, _1692, _1696);
    float4 _1713 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6032, float3(0.0), isnan(_6032)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6032, float3(0.0), isnan(_6032)), level(0.0)).xyzw;
    float _1715 = _1713.x;
    float _1717 = _1713.y;
    float _1719 = _1713.z;
    float _1721 = _1713.w;
    float _1723 = float(uint(_577));
    float _1725 = trunc(_703);
    int _1727 = int(_1725);
    int _1729 = abs(_493);
    float _1731 = 1.0 / _1723;
    int _1733 = ~_577;
    int _1735 = _1733 + 1;
    int _1737 = ~_577;
    int _1739 = _1737 + 1;
    float _1741 = float(uint(_1727));
    float _1743 = float(_1727);
    int _1745 = as_type<int>(_1731) + (-2);
    float _1747 = 1.0 / _363;
    int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1751 = _1749 != 0;
    float _1753 = as_type<float>(_1745) * _1741;
    float _1755 = trunc(_1753);
    float _1757 = precise::max(_1755, 0.0);
    uint _1759 = uint(_1757);
    int _1761 = abs(as_type<int>(_499));
    int _1763 = _1735 * int(_1759);
    int _1765 = _1763 + _1727;
    float _1767 = float(uint(_1765));
    float _1769 = as_type<float>(_1745) * _1767;
    int _1771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1773 = _1771 != 0;
    bool _1775 = _1743 >= _681;
    bool _1777 = isnan(_1743);
    bool _1779 = _1775 || _1777;
    bool _1781 = isnan(_681);
    bool _1783 = _1779 || _1781;
    float _1785 = float(_1783);
    float _1787 = trunc(_1769);
    float _1789 = precise::max(_1787, 0.0);
    uint _1791 = uint(_1789);
    bool _1793 = !_1773;
    float _1795 = _1793 ? 7.345489978790283203125 : 1.0;
    float _1797 = _1795 * _165;
    float _1799 = trunc(_1785);
    int _1801 = int(_1799);
    int _1803 = int(_1759) + int(_1791);
    float _1805 = floor(_1797);
    int _1807 = _1739 * _1803;
    int _1809 = _1807 + _1727;
    int _1811 = ~_1801;
    int _1813 = _1811 + 1;
    int _1815 = _1813 + 1;
    bool _1817 = uint(_1809) >= uint(_577);
    bool _1819 = !_1817;
    int _1821 = _1819 ? 0 : (-1);
    bool _1823 = _577 == 0;
    float _1825 = -_1805;
    float _1827 = _1797 + _1825;
    int _1829 = ~_1803;
    int _1831 = _1829 + _1821;
    int _1833 = _1831 + 1;
    float _1835 = _1827 * _681;
    float _1837 = _693 * _1747;
    int _1839 = _577 * _1833;
    int _1841 = _1839 + _1727;
    bool _1843 = !_1751;
    float _1845 = _1843 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1849 = _1847 != 0;
    float _1851 = trunc(_1835);
    int _1853 = int(_1851);
    bool _1855 = !_1823;
    int _1857 = _1855 ? _1841 : (-1);
    int _1859 = _577 + (-1);
    int _1861 = _1857 * _1815;
    int _1863 = abs(_487);
    float _1865 = trunc(_1837);
    int _1867 = int(_1865);
    int _1869 = abs(as_type<int>(_1845));
    int _1871 = _1801 * _1859;
    int _1873 = _1871 + _1861;
    bool _1875 = !_1849;
    int _1877 = _1875 ? 0 : 1;
    int _1879 = _1873 * _1863;
    bool _1881 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1883 = isnan(0.5);
    bool _1885 = _1881 || _1883;
    bool _1887 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1889 = _1885 || _1887;
    int _1891 = _1853 * _1869;
    int _1893 = _1891 + _1727;
    int _1895 = abs(_1877);
    float _1897 = _1845;
    float _1899 = as_type<float>(_1729);
    if (_1170)
    {
        _1897 = 1.0;
    }
    float _1901 = _1897;
    int _1903 = _1867 * _1729;
    int _1905 = _1903 + _1879;
    int _1907 = _1893 * _1761;
    int _1909 = _1907 + _1905;
    float _1911 = _1901;
    if (_1889)
    {
        _331 = 1.0;
    }
    float _1913 = _331;
    int _1915 = _1853 * _1895;
    int _1917 = _1915 + _1909;
    int _1919 = ~_577;
    int _1921 = _1919 + 1;
    float _1923 = _1913;
    if (_1889)
    {
        _567 = 1.0;
    }
    float _1925 = _567;
    float _1927 = float(uint(_1917));
    float _1929 = as_type<float>(_1745) * _1927;
    float _1931 = trunc(_1929);
    float _1933 = precise::max(_1931, 0.0);
    uint _1935 = uint(_1933);
    int _1937 = _1921 * int(_1935);
    int _1939 = _1937 + _1917;
    float _1941 = float(uint(_1939));
    float _1943 = as_type<float>(_1745) * _1941;
    float _1945 = trunc(_1943);
    float _1947 = precise::max(_1945, 0.0);
    uint _1949 = uint(_1947);
    int _1951 = int(_1935) + int(_1949);
    float _1953 = _1925;
    if (!_1889)
    {
        float _1955 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1957 = _1955 * 0.15915493667125701904296875;
        float _1959 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1961 = _1957 * 6.283185482025146484375;
        float _1963 = cos(_1961);
        float _1965 = _1959 * 0.15915493667125701904296875;
        float _1967 = _1957 * 6.283185482025146484375;
        float _1969 = sin(_1967);
        float _1971 = 1.0 / _1963;
        float _1973 = _1965 * 6.283185482025146484375;
        float _1975 = cos(_1973);
        float _1977 = _1969 * _1971;
        float _1979 = _1965 * 6.283185482025146484375;
        float _1981 = sin(_1979);
        float _1983 = _1975 * _1977;
        float _1985 = 1.0 / _1983;
        float _1987 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1989 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1987;
        float _1991 = 1.0 / _1989;
        float _1993 = _1981 * _1985;
        float _1995 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1997 = fma(_885, _1993, _1995);
        float _1999 = _1997 * _1991;
        float _2001 = precise::clamp(_1999, 0.0, 1.0);
        _1899 = _1957;
        _1953 = _2001;
    }
    float _2003 = _1899;
    float _2005 = _1953;
    float _2007 = _2003;
    if (!_1889)
    {
        float _2009 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2011 = _2009 * 0.15915493667125701904296875;
        float _2013 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2015 = _2011 * 6.283185482025146484375;
        float _2017 = cos(_2015);
        float _2019 = _2013 * 0.15915493667125701904296875;
        float _2021 = _2011 * 6.283185482025146484375;
        float _2023 = sin(_2021);
        float _2025 = 1.0 / _2017;
        float _2027 = _2019 * 6.283185482025146484375;
        float _2029 = cos(_2027);
        float _2031 = _2023 * _2025;
        float _2033 = _2019 * 6.283185482025146484375;
        float _2035 = sin(_2033);
        float _2037 = _2029 * _2031;
        float _2039 = 1.0 / _2037;
        float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2043 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2041;
        float _2045 = 1.0 / _2043;
        float _2047 = _2035 * _2039;
        float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2051 = fma(_885, _2047, _2049);
        float _2053 = _2051 * _2045;
        float _2055 = precise::clamp(_2053, 0.0, 1.0);
        float _2057 = -_2055;
        float _2059 = _2057 + 1.0;
        _2007 = _2025;
        _1923 = _2059;
    }
    float _2061 = _2007;
    float _2063 = _1923;
    if (!_1170)
    {
        int _2065 = _1208 << 4;
        int _2067 = _2065 + 2048;
        uint _2069 = uint(int(uint(_2067) >> uint(2)));
        uint _2071 = uint(int(uint(int(_2069)) >> uint(2)));
        int _2073 = int(_2069) & 3;
        float _2075 = (*spvDescriptorSet0.vp_c15)._m0[int(_2071)][_2073];
        int _2077 = int(_2069) + 1;
        uint _2079 = uint(int(uint(_2077) >> uint(2)));
        int _2081 = _2077 & 3;
        float _2083 = (*spvDescriptorSet0.vp_c15)._m0[int(_2079)][_2081];
        int _2085 = _2067 + 8;
        uint _2087 = uint(int(uint(_2085) >> uint(2)));
        uint _2089 = uint(int(uint(int(_2087)) >> uint(2)));
        int _2091 = int(_2087) & 3;
        float _2093 = (*spvDescriptorSet0.vp_c15)._m0[int(_2089)][_2091];
        int _2095 = int(_2087) + 1;
        uint _2097 = uint(int(uint(_2095) >> uint(2)));
        int _2099 = _2095 & 3;
        float _2101 = (*spvDescriptorSet0.vp_c15)._m0[int(_2097)][_2099];
        float _2103 = _911 * _2083;
        float _2105 = fma(_383, _2075, _2103);
        float _2107 = fma(_385, _2093, _2105);
        float _2109 = _2107 + _2101;
        float _2111 = precise::clamp(_2109, 0.0, 1.0);
        float _2113 = -_2111;
        float _2115 = _2113 + _1702;
        float _2117 = fma(_2115, 500.0, 1.5);
        float _2119 = exp2(_2117);
        float _2121 = 0.0 + _2119;
        float _2123 = precise::clamp(_2121, 0.0, 1.0);
        _1212 = as_type<float>(_2067);
        _1911 = _2123;
    }
    float _2125 = _1212;
    float _2127 = _1911;
    float _2129 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2131 = _1544 + _2129;
    float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2135 = _1546 + _2133;
    float _2137 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2139 = _1548 + _2137;
    float _2141 = _2131 * _2131;
    float _2143 = fma(_2135, _2135, _2141);
    float _2145 = fma(_2139, _2139, _2143);
    float _2147 = rsqrt(_2145);
    float _2149 = sqrt(_2145);
    float _2151 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2153 = _2135 * _2151;
    float _2155 = _2139 * _2151;
    float _2157 = _2153 * _2153;
    float _2159 = _2155 * _2155;
    float _2161 = _2157 + _2159;
    float _2163 = sqrt(_2161);
    bool _2165 = _2163 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2169 = _2163 + _2167;
    float _2171 = _2061;
    float _2173 = _2161;
    float _2175 = _2169;
    float _2177 = _2125;
    float _2179 = _2153;
    float _2181 = _2155;
    float _2183 = _2157;
    float _2185 = _2159;
    if (_2165)
    {
        float _2187 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2171 = _2187;
    }
    float _2189 = _2171;
    if (_2165)
    {
        float _2191 = rsqrt(_2161);
        _2173 = _2191;
    }
    float _2193 = _2173;
    if (_2165)
    {
        float _2195 = _2169 * _2189;
        _2175 = _2195;
    }
    float _2197 = _2175;
    if (_2165)
    {
        float _2199 = _2197 * 0.15915493667125701904296875;
        _2177 = _2199;
    }
    float _2201 = _2177;
    float _2203 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2205 = _385;
    float _2207 = _2203;
    if (_2165)
    {
        float _2209 = _2201 * 6.283185482025146484375;
        float _2211 = sin(_2209);
        _2205 = _2211;
    }
    float _2213 = _2205;
    float _2215 = precise::max(0.0, _2203);
    float _2217 = _2197;
    float _2219 = _2215;
    if (_2165)
    {
        float _2221 = _2201 * 6.283185482025146484375;
        float _2223 = cos(_2221);
        _2217 = _2223;
    }
    float _2225 = _2217;
    float _2227 = -_2151;
    float _2229 = -_2215;
    float _2231 = fma(_2131, _2227, _2229);
    float _2233 = _2231;
    if (_2165)
    {
        float _2235 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2219 = _2235;
    }
    float _2237 = _2219;
    float _2239 = _2237;
    if (_2165)
    {
        float _2241 = fma(_2213, _2237, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2239 = _2241;
    }
    float _2243 = _2239;
    float _2245 = _2243;
    if (_2165)
    {
        float _2247 = _2193 * _2243;
        _2245 = _2247;
    }
    float _2249 = _2245;
    if (_2165)
    {
        float _2251 = _2225 + (-1.0);
        _2207 = _2251;
    }
    float _2253 = _2207;
    float _2255 = _2253;
    if (_2165)
    {
        float _2257 = _2153 * _2249;
        _2179 = _2257;
    }
    float _2259 = _2179;
    if (_2165)
    {
        float _2261 = _2155 * _2249;
        _2181 = _2261;
    }
    float _2263 = _2181;
    if (_2165)
    {
        float _2265 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2255 = _2265;
    }
    float _2267 = _2255;
    if (_2165)
    {
        float _2269 = _2259 * _2259;
        _2183 = _2269;
    }
    float _2271 = _2183;
    if (_2165)
    {
        float _2273 = _2263 * _2263;
        _2185 = _2273;
    }
    float _2275 = _2185;
    if (_2165)
    {
        float _2277 = fma(_2231, _2225, _2267);
        _2233 = _2277;
    }
    float _2279 = _2233;
    float _2281 = fma(_2279, _2279, _2271);
    float _2283 = _2281 + _2275;
    float _2285 = rsqrt(_2283);
    float _2287 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2289 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2287);
    float _2291 = precise::clamp(_2289, 0.0, 1.0);
    float _2293 = -_2291;
    float _2295 = _2293 + 1.0;
    float _2297 = abs(_2295);
    float _2299 = log2(_2297);
    float _2301 = _2285 * _2259;
    float _2303 = _2285 * _2279;
    float _2305 = _2285 * _2263;
    float _2307 = _2301 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2309 = -_2307;
    float _2311 = fma(_2303, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2309);
    float _2313 = -_2305;
    float _2315 = fma(_2313, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2311);
    float _2317 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2319 = fma(_2315, -0.5, 0.5);
    float _2321 = fma(_2315, 0.5, 0.5);
    float _2323 = exp2(_2317);
    float _2325 = fma(_2321, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2327 = fma(_2321, _2325, -0.212114393711090087890625);
    float _2329 = _2303 + 1.0;
    float _2331 = sqrt(_2319);
    float _2333 = fma(_2321, _2327, 1.570728778839111328125);
    float _2335 = -_2303;
    float _2337 = fma(_2323, _2329, _2335);
    int _2339 = ~_577;
    int _2341 = _2339 + 1;
    float _2343 = fma(_2337, 0.5, 0.5);
    float _2345 = _2331 * 0.636619746685028076171875;
    float _2347 = -_2333;
    float _2349 = fma(_2345, _2347, 1.0);
    float _2351 = float(uint(_1893));
    float2 _6930 = float2(_2349, _2343);
    float3 _2355 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6930, float2(0.0), isnan(_6930)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6930, float2(0.0), isnan(_6930)), level(0.0)).xyz;
    float _2357 = _2355.x;
    float _2359 = _2355.y;
    float _2361 = _2355.z;
    float _2363 = as_type<float>(_1745) * _2351;
    int _2365 = _2341 * _1951;
    int _2367 = _2365 + _1917;
    int _2369 = ~_577;
    int _2371 = _2369 + 1;
    float _2373 = -_683;
    float _2375 = _2373 + 1.0;
    float _2377 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2379 = trunc(_2363);
    float _2381 = precise::max(_2379, 0.0);
    uint _2383 = uint(_2381);
    bool _2385 = uint(_2367) >= uint(_577);
    float _2387 = -_403;
    float _2389 = _2387 + 1.0;
    float _2391 = -_705;
    float _2393 = _2391 + 1.0;
    bool _2395 = !_2385;
    int _2397 = _2395 ? 0 : (-1);
    float _2399 = exp2(_2377);
    int _2401 = ~_1951;
    int _2403 = _2401 + _2397;
    int _2405 = _2403 + 1;
    int _2407 = _577 * _2405;
    int _2409 = _2407 + _1917;
    int _2411 = _2341 * int(_2383);
    int _2413 = _2411 + _1893;
    bool _2415 = !_1823;
    int _2417 = _2415 ? _2409 : (-1);
    float _2419 = float(uint(_2413));
    int _2421 = _2417 >> 31;
    int _2423 = _2417 & 3;
    bool _2425 = _2423 != 0;
    float _2427 = as_type<float>(_1745) * _2419;
    int _2429 = _2421 & 3;
    bool _2431 = uint(_2423) > 1u;
    float _2433 = trunc(_2427);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    int _2439 = _2417 + _2429;
    int _2441 = _2417 & 3;
    bool _2443 = _2441 != 0;
    int _2445 = _2439 >> 2;
    int _2447 = _2443 ? 0 : 1;
    int _2449 = _2445 << 4;
    int _2451 = _2449 + 368;
    bool _2453 = uint(_2423) >= 2u;
    uint _2455 = uint(int(uint(_2451) >> uint(2)));
    uint _2457 = uint(int(uint(int(_2455)) >> uint(2)));
    int _2459 = int(_2455) & 3;
    float _2461 = (*spvDescriptorSet0.vp_c9)._m0[int(_2457)][_2459];
    int _2463 = int(_2455) + 1;
    uint _2465 = uint(int(uint(_2463) >> uint(2)));
    int _2467 = _2463 & 3;
    float _2469 = (*spvDescriptorSet0.vp_c9)._m0[int(_2465)][_2467];
    int _2471 = _2453 ? 0 : 1;
    int _2473 = int(_2383) + int(_2437);
    int _2475 = ~_2471;
    int _2477 = _2475 + 1;
    int _2479 = _2477 + 1;
    int _2481 = _2451 + 8;
    uint _2483 = uint(int(uint(_2481) >> uint(2)));
    uint _2485 = uint(int(uint(int(_2483)) >> uint(2)));
    int _2487 = int(_2483) & 3;
    float _2489 = (*spvDescriptorSet0.vp_c9)._m0[int(_2485)][_2487];
    int _2491 = int(_2483) + 1;
    uint _2493 = uint(int(uint(_2491) >> uint(2)));
    int _2495 = _2491 & 3;
    float _2497 = (*spvDescriptorSet0.vp_c9)._m0[int(_2493)][_2495];
    int _2499 = _2371 * _2473;
    int _2501 = _2499 + _1893;
    bool _2503 = uint(_2501) >= uint(_577);
    bool _2505 = !_2503;
    int _2507 = _2505 ? 0 : (-1);
    bool _2509 = _2423 != 3;
    int _2511 = ~_2473;
    int _2513 = _2511 + _2507;
    int _2515 = _2513 + 1;
    int _2517 = ~_2447;
    int _2519 = _2517 + 1;
    int _2521 = _2519 + 1;
    int _2523 = _2521;
    int _2525 = _2479;
    if (!_2431)
    {
        int _2527 = ~_2447;
        int _2529 = _2527 + 1;
        _2523 = _2529;
    }
    int _2531 = _2523;
    int _2533 = _577 * _2515;
    int _2535 = _2533 + _1893;
    bool _2537 = _2423 != 3;
    float _2539 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2541 = int(_2539);
    bool _2543 = !_2425;
    int _2545 = _2543 ? 0 : 1;
    int _2547 = abs(_2531);
    if (_2509)
    {
        int _2549 = ~_2471;
        int _2551 = _2549 + 1;
        _2525 = _2551;
    }
    int _2553 = _2525;
    bool _2555 = !_2537;
    int _2557 = _2555 ? 0 : (-1);
    int _2559 = abs(_2545);
    int _2561 = ~_2547;
    int _2563 = _2561 + 1;
    int _2565 = _2563 + 1;
    int _2567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2569 = _2567 != 0;
    int _2571 = abs(_2553);
    int _2573 = abs(_2557);
    int _2575 = ~_2559;
    int _2577 = _2575 + 1;
    int _2579 = _2577 + 1;
    int _2581 = _2565 * as_type<int>(_2469);
    bool _2583 = !_2569;
    int _2585 = _2583 ? 0 : 1;
    int _2587 = _2579 * as_type<int>(_2461);
    int _2589 = _2587 + _2581;
    int _2591 = abs(_2585);
    int _2593 = ~_2571;
    int _2595 = _2593 + 1;
    int _2597 = _2595 + 1;
    float _2599 = float(uint(_2541));
    int _2601 = _2597 * as_type<int>(_2489);
    int _2603 = _2601 + _2589;
    int _2605 = ~_2573;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    int _2611 = abs(_2541);
    float _2613 = 1.0 / _2599;
    int _2615 = ~_2591;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = _2609 * as_type<int>(_2497);
    int _2623 = _2621 + _2603;
    float _2625 = float(uint(_2611));
    bool _2627 = !_1823;
    int _2629 = _2627 ? _2535 : (-1);
    int _2631 = _2623 * _2619;
    int _2633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2635 = _2633 != 0;
    float _2637 = 1.0 / _2625;
    int _2639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2641 = _2639 != 0;
    int _2643 = _2629 * _2591;
    int _2645 = _2643 + _2631;
    float _2647 = float(uint(_2645));
    float _2649 = abs(_885);
    float _2651 = log2(_2649);
    int _2653 = as_type<int>(_2613) + (-2);
    int _2655 = abs(_2645);
    float _2657 = as_type<float>(_2653) * _2647;
    float _2659 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2661 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2663 = as_type<int>(_2637) + (-2);
    float _2665 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2667 = float(uint(_2655));
    float _2669 = trunc(_2657);
    float _2671 = precise::max(_2669, 0.0);
    uint _2673 = uint(_2671);
    float _2675 = _2659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2677 = ~_2611;
    int _2679 = _2677 + 1;
    float _2681 = as_type<float>(_2663) * _2667;
    int _2683 = ~_2541;
    int _2685 = _2683 + 1;
    float _2687 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2689 = _165 > 0.5;
    float _2691 = _2665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2693 = _2661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2695 = trunc(_2681);
    float _2697 = precise::max(_2695, 0.0);
    uint _2699 = uint(_2697);
    float _2701 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_74.x = _2675;
    out.m_74.y = _2691;
    out.m_74.z = _2693;
    out.m_74.w = _2687;
    float _2703 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2705 = _2685 * int(_2673);
    int _2707 = _2705 + _2645;
    float _2709 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2713 = _2701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2715 = _411 > 0.5;
    float _2717 = _2709 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2719 = float(uint(_2707));
    float _2721 = _2711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2723 = exp2(_2703);
    float _2725 = _945 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2727 = _2679 * int(_2699);
    int _2729 = _2727 + _2655;
    float _2731 = as_type<float>(_2653) * _2719;
    out.m_76.x = _2717;
    out.m_76.y = _2713;
    out.m_76.z = _2721;
    float _2733 = _945 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2735 = -_935;
    float _2737 = fma(_2735, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2725);
    float _2739 = float(uint(_2729));
    float _2741 = _945 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2743 = -_935;
    float _2745 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2733);
    bool _2747 = _885 <= 8000.0;
    bool _2749 = isnan(_885);
    bool _2751 = _2747 || _2749;
    bool _2753 = isnan(8000.0);
    bool _2755 = _2751 || _2753;
    float _2757 = float(_2755);
    float _2759 = as_type<float>(_2663) * _2739;
    float _2761 = -_935;
    float _2763 = fma(_2761, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2741);
    float _2765 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2737);
    float _2767 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2745);
    float _2769 = trunc(_2731);
    float _2771 = precise::max(_2769, 0.0);
    uint _2773 = uint(_2771);
    float _2775 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2763);
    float _2777 = _949 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2779 = _949 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2781 = _949 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2783 = fma(_2723, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2785 = precise::clamp(_2783, 0.0, 1.0);
    float _2787 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2777);
    float _2789 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2779);
    float _2791 = trunc(_2759);
    float _2793 = precise::max(_2791, 0.0);
    uint _2795 = uint(_2793);
    float _2797 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2781);
    float _2799 = -_881;
    int _2801 = _2715 ? as_type<int>(_2799) : as_type<int>(_881);
    float _2803 = _965 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2805 = _965 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2807 = _965 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2809 = !_2641;
    float _2811 = _2809 ? _881 : as_type<float>(_2801);
    float _2813 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2803);
    int _2815 = int(_2673) + int(_2773);
    float _2817 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2805);
    int _2819 = ~_2611;
    int _2821 = _2819 + 1;
    float _2823 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2807);
    float _2825 = _881 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2827 = ~_2541;
    int _2829 = _2827 + 1;
    float _2831 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2787);
    int _2833 = int(_2699) + int(_2795);
    float _2835 = _2825 * _2775;
    float _2837 = _2825 * _2767;
    float _2839 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2789);
    int _2841 = _2829 * _2815;
    int _2843 = _2841 + _2645;
    int _2845 = _2645 ^ _2541;
    int _2847 = _2821 * _2833;
    int _2849 = _2847 + _2655;
    float _2851 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2797);
    float _2853 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2813);
    uint _2855 = uint(int(uint(_2845) >> uint(31)));
    float _2857 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2817);
    bool _2859 = uint(_2849) >= uint(_2611);
    float _2861 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2823);
    bool _2863 = uint(_2843) >= uint(_2541);
    float _2865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2867 = !_2859;
    int _2869 = _2867 ? 0 : (-1);
    float _2871 = _2825 * _2765;
    int _2873 = ~int(_2855);
    int _2875 = _2873 + 1;
    float _2877 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2879 = ~_2869;
    int _2881 = _2833 + _2879;
    int _2883 = _2881 + 1;
    bool _2885 = !_2863;
    int _2887 = _2885 ? 0 : (-1);
    float _2889 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2877);
    int _2891 = _2883 ^ _2875;
    float _2893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2895 = ~_2815;
    int _2897 = _2895 + _2887;
    int _2899 = _2897 + 1;
    bool _2901 = _2541 == 0;
    int _2903 = ~_2875;
    int _2905 = _2903 + _2891;
    int _2907 = _2905 + 1;
    int _2909 = _2541 * _2899;
    int _2911 = _2909 + _2645;
    float _2913 = -_889;
    int _2915 = _2689 ? as_type<int>(_2913) : as_type<int>(_889);
    bool _2917 = !_2901;
    int _2919 = _2917 ? _2907 : (-1);
    bool _2921 = !_2635;
    float _2923 = _2921 ? _889 : as_type<float>(_2915);
    float _2925 = _889 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2927 = float(_2919);
    float _2929 = _2865 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2931 = _2811 + (-0.5);
    float _2933 = fma(_2925, _2831, _2871);
    float _2935 = fma(_2925, _2839, _2837);
    float _2937 = -_561;
    float _2939 = fma(_2929, _2927, _2937);
    float _2941 = fma(_2925, _2851, _2835);
    bool _2943 = _2541 == 0;
    float _2945 = _2893 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2947 = -_2929;
    float _2949 = fma(_2947, _2931, _2939);
    float _2951 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2889);
    bool _2953 = !_2943;
    int _2955 = _2953 ? _2911 : (-1);
    float _2957 = _2923 + 0.5;
    float _2959 = fma(_2811, _2375, _2949);
    float _2961 = _2857 + _2935;
    float _2963 = _2861 + _2941;
    float _2965 = -_2399;
    float _2967 = _2965 + 1.0;
    float _2969 = float(_2955);
    float _2971 = fma(_2785, -2.0, 3.0);
    float _2973 = _2785 * _2785;
    float _2975 = _2967 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2977 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2951);
    float _2979 = fma(_2945, _2969, _441);
    float _2981 = _2973 * _2971;
    float _2983 = _2975 * _1710;
    float _2985 = fma(_2945, _2957, _2979);
    float _2987 = -_2981;
    float _2989 = _2987 + 1.0;
    float _2991 = _2977 + _1626;
    float _2993 = -_2393;
    float _2995 = fma(_2923, _2993, _2985);
    float _2997 = fma(_2989, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2981);
    float _2999 = _2991 * 0.5;
    float _3001 = _2853 + _2933;
    out.gl_Position.x = _1668;
    out.gl_Position.y = _1670;
    out.gl_Position.z = _2977;
    out.gl_Position.w = _1626;
    float _3003 = _2757 * _2997;
    float _3005 = _2757;
    float _3007 = _2973;
    if (!_1604)
    {
        _3005 = 1.0;
    }
    float _3009 = _3005;
    float _3011 = _3009;
    if (_1604)
    {
        bool _3013 = _1708 >= _1672;
        bool _3015 = isnan(_1708);
        bool _3017 = _3013 || _3015;
        bool _3019 = isnan(_1672);
        bool _3021 = _3017 || _3019;
        float _3023 = float(_3021);
        _3011 = _3023;
    }
    float _3025 = _3011;
    float _3027 = _3003 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3029 = -_2975;
    float _3031 = _3029 + 1.0;
    out.m_78.z = _2999;
    out.m_78.w = _1626;
    bool _3033 = _2149 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3035 = isnan(_2149);
    bool _3037 = _3033 || _3035;
    bool _3039 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3041 = _3037 || _3039;
    float _3043 = _2389 * _3027;
    float _3045 = precise::clamp(_3043, 0.0, 1.0);
    float _3047 = _3025 * _2127;
    float _3049 = _1721 * _3031;
    out.m_80.x = _2995;
    out.m_80.y = _2959;
    float _3051 = -_3045;
    float _3053 = fma(_3051, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3055 = _1721 * _2983;
    out.m_82.x = _3001;
    out.m_82.y = _2961;
    out.m_82.z = _2963;
    float _3057 = -_3047;
    float _3059 = fma(_3057, _3053, 1.0);
    float _3061 = precise::clamp(_3059, 0.0, 1.0);
    float _3063 = _2361 * _2983;
    float _3065 = fma(_2357, _3055, _1715);
    float _3067 = fma(_2359, _3055, _1717);
    float _3069 = _3061 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3071 = fma(_1721, _3063, _1719);
    float _3073 = _2005 * _2063;
    float _3075 = _3031;
    float _3077 = _3027;
    float _3079 = _3047;
    float _3081 = _3055;
    float _3083 = _3073;
    if (!_3041)
    {
        _3007 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3085 = _3007;
    out.m_84.x = _3069;
    float _3087 = _3073 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3089 = _3085;
    float _3091 = _3085;
    if (!_3041)
    {
        _3075 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3093 = _3075;
    out.m_86.x = _3065;
    out.m_86.y = _3067;
    out.m_86.z = _3071;
    out.m_86.w = _3049;
    float _3095 = _3093;
    float _3097 = _3093;
    if (!_3041)
    {
        _3077 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3099 = _3077;
    float _3101 = _3099;
    float _3103 = _3099;
    if (!_3041)
    {
        _3079 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3105 = _3079;
    float _3107 = _3105;
    float _3109 = _3105;
    if (!_3041)
    {
        _3081 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3111 = _3081;
    float _3113 = _3111;
    float _3115 = _3111;
    if (!_3041)
    {
        _3083 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3117 = _3083;
    bool _3119 = !_3041;
    float _3121 = _3117;
    float _3123 = _3117;
    if (!_3119)
    {
        bool _3125 = _2149 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3127 = isnan(_2149);
        bool _3129 = _3125 || _3127;
        bool _3131 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3133 = _3129 || _3131;
        if (!_3133)
        {
            float _3135 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3137 = _2149 + _3135;
            float _3139 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3141 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3139;
            float _3143 = 1.0 / _3141;
            float _3145 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3149 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3151 = _3149 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3153 = _3137 * _3143;
            float _3155 = precise::clamp(_3153, 0.0, 1.0);
            float _3157 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3159 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3163 = _3161 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3165 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3167 = _3165 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3169 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3173 = fma(_3155, _3159, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3175 = fma(_3155, _3163, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3177 = fma(_3155, _3167, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3179 = fma(_3155, _3171, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3181 = fma(_3155, _3147, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3183 = fma(_3155, _3151, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3097 = _3175;
            _3115 = _3181;
            _3091 = _3173;
            _3109 = _3179;
            _3103 = _3177;
            _3123 = _3183;
            _3185 = true;
        }
        else
        {
            bool _3187 = _2149 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3189 = isnan(_2149);
            bool _3191 = _3187 || _3189;
            bool _3193 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3195 = _3191 || _3193;
            if (!_3195)
            {
                _3089 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3197 = _3089;
            _3091 = _3197;
            if (!_3195)
            {
                _3095 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3199 = _3095;
            _3097 = _3199;
            if (!_3195)
            {
                _3101 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3201 = _3101;
            _3103 = _3201;
            if (!_3195)
            {
                _3107 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3203 = _3107;
            _3109 = _3203;
            if (!_3195)
            {
                _3113 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3205 = _3113;
            _3115 = _3205;
            if (!_3195)
            {
                _3121 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3207 = _3121;
            bool _3209 = !_3195;
            _3123 = _3207;
            if (!_3209)
            {
                bool _3211 = _2149 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3213 = isnan(_2149);
                bool _3215 = _3211 || _3213;
                bool _3217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3219 = _3215 || _3217;
                if (!_3219)
                {
                    float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3223 = _2149 + _3221;
                    float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3227 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3225;
                    float _3229 = 1.0 / _3227;
                    float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3239 = _3223 * _3229;
                    float _3241 = precise::clamp(_3239, 0.0, 1.0);
                    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3245 = _3243 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3249 = _3247 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3251 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3253 = _3251 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3255 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3257 = _3255 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3259 = fma(_3241, _3245, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3261 = fma(_3241, _3249, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3263 = fma(_3241, _3253, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3265 = fma(_3241, _3257, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3267 = fma(_3241, _3233, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3269 = fma(_3241, _3237, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3097 = _3261;
                    _3115 = _3267;
                    _3091 = _3259;
                    _3109 = _3265;
                    _3103 = _3263;
                    _3123 = _3269;
                    _3185 = true;
                }
                else
                {
                    _3097 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3115 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3091 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3109 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3103 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3123 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3185 = false;
    float _3271 = _3097;
    float _3273 = _3115;
    float _3275 = _3091;
    float _3277 = _3109;
    float _3279 = _3103;
    float _3281 = _3123;
    float _3283 = fma(_2961, -0.5, 0.5);
    float _3285 = precise::clamp(_3283, 0.0, 1.0);
    float _3287 = -_3271;
    float _3289 = _3287 + _3273;
    float _3291 = _3087 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3293 = -_3275;
    float _3295 = _3293 + _3277;
    out.m_88.x = 0.0;
    float _3297 = fma(_3285, _3289, _3271);
    float _3299 = -_3279;
    float _3301 = _3299 + _3281;
    out.m_59.x = _3291;
    float _3303 = fma(_3285, _3295, _3275);
    float _3305 = _3297 * 0.586610972881317138671875;
    bool _3307 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3309 = fma(_3285, _3301, _3279);
    float _3311 = fma(_3303, 0.298911988735198974609375, _3305);
    bool _3313 = _2005 > 0.0;
    bool _3315 = isnan(_2005);
    bool _3317 = _3313 || _3315;
    bool _3319 = isnan(0.0);
    bool _3321 = _3317 || _3319;
    float _3323 = fma(_3309, 0.114477999508380889892578125, _3311);
    bool _3325 = _2063 <= 0.0;
    bool _3327 = !_3321;
    bool _3329 = _3325 || _3327;
    float _3331 = -_3323;
    float _3333 = _3303 + _3331;
    float _3335 = -_3323;
    float _3337 = _3297 + _3335;
    float _3339 = -_3323;
    float _3341 = _3309 + _3339;
    float _3343 = fma(_3333, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3323);
    float _3345 = fma(_3337, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3323);
    float _3347 = fma(_3341, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3323);
    bool _3349 = !_3307;
    if (!_3349)
    {
        float _3351 = -_1544;
        float _3353 = _3351 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3355 = -_1546;
        float _3357 = _3355 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3359 = -_1548;
        float _3361 = _3359 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3363 = _3353 * _3353;
        float _3365 = fma(_3357, _3357, _3363);
        float _3367 = fma(_3361, _3361, _3365);
        float _3369 = sqrt(_3367);
        float _3371 = rsqrt(_3367);
        float _3373 = -_3369;
        float _3375 = _3373 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3377 = _3375 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3379 = precise::clamp(_3377, 0.0, 1.0);
        float _3381 = _3357 * _3371;
        float _3383 = _3353 * _3371;
        float _3385 = abs(_3379);
        float _3387 = log2(_3385);
        float _3389 = _3361 * _3371;
        float _3391 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3393 = _2961 * _3383;
        float _3395 = -_3383;
        float _3397 = -_3391;
        float _3399 = fma(_3395, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3397);
        float _3401 = fma(_3001, _3381, _3393);
        float _3403 = -_3389;
        float _3405 = fma(_3403, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3399);
        float _3407 = fma(_2963, _3389, _3401);
        float _3409 = precise::clamp(_3407, 0.0, 1.0);
        float _3411 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3413 = _3405 + _3411;
        float _3415 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3417 = _3413 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3419 = precise::clamp(_3417, 0.0, 1.0);
        float _3421 = exp2(_3415);
        float _3423 = _3421 * _3419;
        float _3425 = _3409 * _3423;
        float _3427 = _3425 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3429 = _3425 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3431 = _3425 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3427;
        out.m_88.y = _3429;
        out.m_88.z = _3431;
    }
    out.m_90.x = _3343;
    out.m_90.y = _3345;
    out.m_90.z = _3347;
    if (!_3329)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _3433 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3433;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

