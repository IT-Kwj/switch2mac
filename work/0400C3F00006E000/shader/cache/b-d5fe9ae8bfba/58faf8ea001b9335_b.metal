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
    texture2d_array<float> vp_t_tcb_16 [[id(8)]];
    sampler vp_t_tcb_16Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d_array<float> vp_t_tcb_14 [[id(14)]];
    sampler vp_t_tcb_14Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_14Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_82 [[user(locn0)]];
    float4 m_86 [[user(locn1)]];
    float4 m_84 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_100 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_98 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 m_96 [[user(locn11)]];
    float4 m_102 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(1)]];
    float4 m_72 [[attribute(2)]];
    float4 m_74 [[attribute(3)]];
    float4 m_76 [[attribute(4)]];
    float4 m_68 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_78 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3059 = false;
    bool _353 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_56.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_59.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3403 = as_type<float>(_137);
        out.gl_Position.z = _3403;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_61.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = 0.0;
    float _157 = _153;
    if (_149)
    {
        float _159 = float(_121);
        _155 = _159;
    }
    float _161 = _155;
    bool _163 = _153 >= _161;
    bool _165 = !_149;
    bool _167 = _163 || _165;
    if (_167)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _131;
    if (_167)
    {
        out.m_59.x = 0.0;
    }
    int _171 = 0;
    if (_167)
    {
        float _173 = _169 * 5.0;
        _171 = as_type<int>(_173);
    }
    int _175 = _171;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3472 = as_type<float>(_175);
        out.gl_Position.z = _3472;
    }
    if (_167)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _177 = in.m_63.x;
    float _179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _181 = _153 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_68.x;
    float _187 = in.m_68.y;
    float _189 = in.m_68.z;
    float _191 = in.m_70.x;
    float _193 = in.m_70.y;
    float _195 = in.m_70.z;
    float _197 = in.m_72.x;
    float _199 = in.m_72.y;
    float _201 = in.m_72.z;
    float _203 = _181 * _179;
    float _205 = in.m_74.x;
    float _207 = in.m_74.y;
    float _209 = in.m_74.z;
    float _211 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[20].x, _203);
    int _213 = as_type<int>(_183) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_183) & 2;
    bool _219 = _217 != 0;
    float _221 = _211 * 6.283185482025146484375;
    float _223 = floor(_211);
    int _225 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _227 = _225 != 0;
    float _229 = _221 * 0.15915493667125701904296875;
    bool _231 = !_219;
    float _233 = _231 ? (-0.5) : 0.5;
    int _235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _237 = _235 != 0;
    int _239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _241 = _239 != 0;
    float _243 = _187 * _193;
    bool _245 = !_227;
    int _247 = _245 ? 0 : 1;
    float _249 = _229 * 6.283185482025146484375;
    float _251 = cos(_249);
    float _253 = _187 * _199;
    bool _255 = !_237;
    int _257 = _255 ? 0 : 1;
    float _259 = fma(_185, _191, _243);
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _263 = _187 * _207;
    int _265 = abs(_257);
    float _267 = fma(_185, _197, _253);
    int _269 = abs(_247);
    float _271 = -_223;
    float _273 = _211 + _271;
    float _275 = fma(_185, _205, _263);
    float _277 = -_273;
    float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _281 = !_241;
    int _283 = _281 ? 0 : 1;
    float _285 = fma(_189, _195, _259);
    float _287 = float(_265);
    float _289 = fma(_251, 0.5, 0.5);
    int _291 = abs(_283);
    float _293 = fma(_189, _201, _267);
    bool _295 = _273 < 0.5;
    float _297 = float(_295);
    float _299 = abs(_279);
    float _301 = _287 * _299;
    float _303 = float(_269);
    float _305 = -_289;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _309 = -_297;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _313 = fma(_189, _209, _275);
    float _315 = fma(_303, _307, _301);
    float _317 = float(_291);
    bool _319 = !_215;
    float _321 = _319 ? (-0.5) : 0.5;
    float _323 = abs(_311);
    float _325 = fma(_317, _323, _315);
    bool _327 = !_261;
    float _329 = _313;
    float _331 = _285;
    float _349;
    float _351;
    if (!_327)
    {
        float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _335 = _177 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _337 = float(_121);
        float _339 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
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
        float _355 = float(_121);
        float _357 = 1.0 / _355;
        float _359 = _153 * _357;
        _349 = _359;
        _351 = _355;
    }
    _353 = false;
    float _361 = _349;
    float _363 = _351;
    float _365 = in.m_56.x;
    float _367 = in.m_56.y;
    float _369 = in.m_56.z;
    float _371 = in.m_70.w;
    float _373 = in.m_74.w;
    float _375 = _193 * _367;
    float _377 = _207 * _367;
    float _379 = fma(_191, _365, _375);
    float _381 = fma(_205, _365, _377);
    float _383 = fma(_195, _369, _379);
    float _385 = fma(_209, _369, _381);
    float _387 = _383 + _371;
    float _389 = _385 + _373;
    float _391 = fma(_387, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _393 = fma(_389, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _395 = floor(_391);
    float _397 = floor(_393);
    float _399 = -_395;
    float _401 = _391 + _399;
    float _403 = -_397;
    float _405 = _393 + _403;
    float2 _3796 = float2(_401, _405);
    float _407 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3796, float2(0.0), isnan(_3796)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3796, float2(0.0), isnan(_3796)), level(0.0)).x;
    float _409 = in.m_63.y;
    float _411 = _177 * 2.0;
    float _413 = _199 * _367;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _423 = floor(_411);
    float _425 = fma(_197, _365, _413);
    float _427 = _177 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _431 = fma(_201, _369, _425);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _433;
    float _437 = 1.0 / _417;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _443 = -_429;
    float _445 = fma(_427, 2.0, _443);
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _451 = _361 + _449;
    float _453 = in.m_72.w;
    float _455 = 1.0 / _421;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = _361 + _457;
    float _461 = _409 * 2.0;
    bool _463 = _423 > 0.0;
    float _465 = _409 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _467 = _423 >= 0.0;
    bool _469 = isnan(_423);
    bool _471 = _467 || _469;
    bool _473 = isnan(0.0);
    bool _475 = _471 || _473;
    float _477 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _479 = _459 * _437;
    float _481 = in.m_63.z;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _485 = _361 + _483;
    float _487 = floor(_461);
    float _489 = fma(_465, -2.0, _447);
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _493 = _491 != 0;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _497 = _495 != 0;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _501 = _499 != 0;
    float _503 = _485 * _455;
    float _505 = _177 + _409;
    float _507 = 1.0 / _435;
    float _509 = _505 + (-1.0);
    bool _511 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _513 = isnan(_361);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = _431 + _453;
    float _525 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _527 = 1.0 / _441;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _535 = _361 + _533;
    bool _537 = _487 > 0.0;
    bool _539 = _487 >= 0.0;
    bool _541 = isnan(_487);
    bool _543 = _539 || _541;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _549;
    float _553 = 1.0 / _531;
    float _555 = _535 * _507;
    float _557 = _409 + _481;
    float _559 = _481 * 2.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _563 = _361 + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _565;
    float _569 = _557 + (-1.0);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _575 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _577 = log2(_575);
    float _579 = _451 * _527;
    float _581 = _177 + _481;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _587 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _589 = _581 + (-1.0);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _591;
    float _595 = _563 * _553;
    float _597 = floor(_559);
    float _599 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _601;
    int _605 = _475 ? 0 : 1;
    float _607 = fma(_573, _579, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _609 = fma(_585, _579, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _615 = _577 * _153;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _621 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _623 = int(_621);
    int _625 = ~_605;
    int _627 = _625 + 1;
    int _629 = _627 + 1;
    float _631 = fma(_593, _479, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _633 = fma(_603, _479, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _635 = fma(_613, _503, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _637 = fma(_619, _503, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _639 = _629;
    if (!_463)
    {
        int _641 = ~_605;
        int _643 = _641 + 1;
        _639 = _643;
    }
    int _645 = _639;
    float _647 = -_521;
    float _649 = _647 + 1.0;
    float _651 = exp2(_615);
    bool _653 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _655 = isnan(_361);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = fma(_567, _555, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _667 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _669 = isnan(_361);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = fma(_551, _555, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _681 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _683 = isnan(_361);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = -_663;
    float _695 = _693 + 1.0;
    bool _697 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _699 = isnan(_361);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = -_677;
    float _711 = _709 + 1.0;
    bool _713 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _715 = isnan(_361);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = -_691;
    float _727 = _725 + 1.0;
    bool _729 = _597 >= 0.0;
    bool _731 = isnan(_597);
    bool _733 = _729 || _731;
    bool _735 = isnan(0.0);
    bool _737 = _733 || _735;
    float _739 = _691 * _695;
    bool _741 = !_497;
    int _743 = _741 ? 0 : 1;
    float _745 = _723 * _649;
    float _747 = -_723;
    float _749 = _747 + 1.0;
    float _751 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _753 = int(_751);
    float _755 = _521 * _727;
    float _757 = float(_623);
    float _759 = -_651;
    float _761 = _759 + 1.0;
    bool _763 = !_493;
    int _765 = _763 ? 0 : 1;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _769 = 1.0 + _767;
    bool _771 = !_501;
    int _773 = _771 ? 0 : 1;
    float _775 = _707 * _749;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _779 = _777 != 0;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _783 = _781 != 0;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _787 = _785 != 0;
    float _789 = 1.0 / _757;
    bool _791 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _793 = isnan(0.0);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _799 = _795 || _797;
    float _801 = -_707;
    float _803 = _801 + 1.0;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _809 = _799 ? _761 : 0.0;
    float _811 = _677 * _803;
    bool _813 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _815 = isnan(1.0);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _821 = _817 || _819;
    float _823 = 1.0 / _769;
    float _825 = _523 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _827 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[78].z, _805);
    float _829 = float(_753);
    float _831 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[78].w, _807);
    float _833 = -_153;
    float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[76].x, _445);
    float _837 = _631 * _811;
    float _839 = _633 * _811;
    float _841 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _827);
    float _843 = fma(_387, (*spvDescriptorSet0.vp_c8)._m0[11].x, _825);
    float _845 = _829 * _153;
    float _847 = _789 * _153;
    float _849 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _489);
    float _851 = fma(_389, (*spvDescriptorSet0.vp_c8)._m0[11].z, _843);
    float _853 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _831);
    float _855 = _523 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_821)
    {
        float _857 = _809 * _823;
        _157 = _857;
    }
    float _859 = _157;
    float _861 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[143].x, _837);
    float _863 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[143].y, _839);
    float _865 = _851 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _867 = !_783;
    int _869 = _867 ? 0 : 1;
    float _871 = in.m_76.x;
    float _873 = in.m_76.y;
    float _875 = in.m_76.z;
    float _877 = fma(_387, (*spvDescriptorSet0.vp_c8)._m0[10].x, _855);
    float _879 = 1.0 / _865;
    int _881 = abs(_869);
    float _883 = _481 + (-0.5);
    bool _885 = _597 > 0.0;
    float _887 = fma(_389, (*spvDescriptorSet0.vp_c8)._m0[10].z, _877);
    float _889 = float(_645);
    float _891 = fma(_637, _775, _863);
    float _893 = float(_881);
    float _895 = _887 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _897 = _737 ? 0 : 1;
    float _899 = fma(_635, _775, _861);
    bool _901 = !_779;
    int _903 = _901 ? 0 : 1;
    float _905 = _893 * _889;
    bool _907 = !_787;
    int _909 = _907 ? 0 : 1;
    float _911 = _895 + _865;
    int _913 = ~_897;
    int _915 = _913 + 1;
    int _917 = _915 + 1;
    float _919 = fma(_679, _745, _891);
    int _921 = abs(_903);
    float _923 = _911 * _879;
    float _925 = _923 * 0.5;
    int _927 = _917;
    if (!_885)
    {
        int _929 = ~_897;
        int _931 = _929 + 1;
        _927 = _931;
    }
    int _933 = _927;
    float _935 = _905 * (-2.0);
    int _937 = abs(_909);
    float _939 = fma(_665, _745, _899);
    float _941 = _409 + (-0.5);
    float _943 = fma(_587, _935, _587);
    float _945 = float(_933);
    float _947 = fma(_935, _873, _873);
    float _949 = float(_921);
    float _951 = fma(_609, _755, _919);
    int _953 = _547 ? 0 : 1;
    float _955 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[196].y, _947);
    float _957 = float(_937);
    float _959 = _949 * _945;
    int _961 = ~_953;
    int _963 = _961 + 1;
    int _965 = _963 + 1;
    float _967 = fma(_943, _859, _955);
    int _969 = _965;
    if (!_537)
    {
        int _971 = ~_953;
        int _973 = _971 + 1;
        _969 = _973;
    }
    int _975 = _969;
    float _977 = _959 * (-2.0);
    float _979 = _967 * 0.15915493667125701904296875;
    float _981 = float(_975);
    float _983 = fma(_525, _977, _525);
    float _985 = fma(_977, _871, _871);
    float _987 = _177 + (-0.5);
    float _989 = fma(_607, _755, _939);
    float _991 = _957 * _981;
    float _993 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].x, _985);
    float _995 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _997 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[30].w, _995);
    float _999 = _991 * (-2.0);
    float _1001 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _321);
    float _1003 = fma(_983, _859, _993);
    float _1005 = fma(_999, _875, _875);
    float _1007 = fma(_599, _999, _599);
    float _1009 = _1003 * 0.15915493667125701904296875;
    float _1011 = in.m_78.x;
    float _1013 = in.m_78.y;
    float _1015 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1005);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _1017;
    float _1021 = _979 * 6.283185482025146484375;
    float _1023 = sin(_1021);
    float _1025 = fma(_1007, _859, _1015);
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _1027;
    float _1031 = fma(_1019, _595, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1033 = _1025 * 0.15915493667125701904296875;
    float _1035 = fma(_1029, _595, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _1037 = fma(_1031, _739, _951);
    float _1039 = _979 * 6.283185482025146484375;
    float _1041 = cos(_1039);
    float _1043 = fma(_1035, _739, _989);
    float _1045 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1037);
    float _1047 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1043);
    float _1049 = _1009 * 6.283185482025146484375;
    float _1051 = sin(_1049);
    float _1053 = _1045 * _1013;
    float _1055 = _1047 * _1011;
    float _1057 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _233);
    float _1059 = _325 * _1053;
    float _1061 = _1009 * 6.283185482025146484375;
    float _1063 = cos(_1061);
    float _1065 = _325 * _1055;
    float _1067 = _1059 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1069 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1071 = _1033 * 6.283185482025146484375;
    float _1073 = cos(_1071);
    float _1075 = _1051 * _1041;
    float _1077 = _1051 * _1023;
    float _1079 = _1069 * _1001;
    float _1081 = 1.0 / _997;
    float _1083 = _1063 * _1041;
    float _1085 = _1063 * _1023;
    float _1087 = _1033 * 6.283185482025146484375;
    float _1089 = sin(_1087);
    float _1091 = _1051 * _1073;
    float _1093 = _1041 * _1073;
    float _1095 = _1063 * _1073;
    float _1097 = _1023 * _1073;
    float _1099 = _1067 * _1057;
    float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1103 = _1081 * _1101;
    float _1105 = _1095 * _1099;
    bool _1107 = _1103 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1109 = _1103 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1111 = fma(_1089, _1083, _1077);
    float _1113 = fma(_1089, _1077, _1083);
    float _1115 = -_1085;
    float _1117 = fma(_1089, _1075, _1115);
    float _1119 = -_1075;
    float _1121 = fma(_1089, _1085, _1119);
    float _1123 = -_1099;
    float _1125 = _1089 * _1123;
    float _1127 = fma(_1111, _1079, _1105);
    float _1129 = _1091 * _1099;
    float _1131 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1133 = fma(_1093, _1079, _1125);
    float _1135 = fma(_1121, _477, _1127);
    float _1137 = fma(_1117, _1079, _1129);
    int _1139 = 2;
    if (!_1107)
    {
        _1139 = 1;
    }
    int _1141 = _1139;
    float _1143 = fma(_1097, _477, _1133);
    float _1145 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1147 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1149 = fma(_1113, _477, _1137);
    bool _1151 = !_1107;
    int _1153 = _1151 ? 0 : 1;
    float _1155 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1145);
    float _1157 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1147);
    float _1159 = _523 + _1131;
    int _1161 = _1141;
    float _1163 = _1143;
    if (!_1109)
    {
        _1161 = _1153;
    }
    int _1165 = _1161;
    float _1167 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1155);
    float _1169 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1157);
    float _1171 = _1159 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _1173 = _1165 << 6;
    float _1175 = _1167 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1177 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1179 = fma(_387, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1171);
    int _1181 = _1173 + 48;
    uint _1184 = uint(int(uint(_1181) >> uint(2)));
    uint _1186 = uint(int(uint(int(_1184)) >> uint(2)));
    int _1188 = int(_1184) & 3;
    float _1190 = (*spvDescriptorSet0.vp_c15)._m0[int(_1186)][_1188];
    int _1192 = int(_1184) + 1;
    uint _1194 = uint(int(uint(_1192) >> uint(2)));
    int _1196 = _1192 & 3;
    float _1198 = (*spvDescriptorSet0.vp_c15)._m0[int(_1194)][_1196];
    float _1200 = _389 + _1175;
    float _1202 = _387 + _1177;
    float _1204 = fma(_389, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1179);
    float _1206 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1210 = _1200 + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1214 = _1202 + _1212;
    float _1216 = _1204 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _1218 = _1173 + 56;
    uint _1220 = uint(int(uint(_1218) >> uint(2)));
    uint _1222 = uint(int(uint(int(_1220)) >> uint(2)));
    int _1224 = int(_1220) & 3;
    float _1226 = (*spvDescriptorSet0.vp_c15)._m0[int(_1222)][_1224];
    int _1228 = int(_1220) + 1;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    int _1232 = _1228 & 3;
    float _1234 = (*spvDescriptorSet0.vp_c15)._m0[int(_1230)][_1232];
    float _1236 = _1210 * _1210;
    float _1238 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1206);
    float _1240 = trunc(_1216);
    int _1242 = int(_1240);
    float _1244 = fma(_1214, _1214, _1236);
    float _1246 = _1159 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1248 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1238);
    int _1250 = _1173 + 64;
    uint _1252 = uint(int(uint(_1250) >> uint(2)));
    uint _1254 = uint(int(uint(int(_1252)) >> uint(2)));
    int _1256 = int(_1252) & 3;
    float _1258 = (*spvDescriptorSet0.vp_c15)._m0[int(_1254)][_1256];
    int _1260 = int(_1252) + 1;
    uint _1262 = uint(int(uint(_1260) >> uint(2)));
    int _1264 = _1260 & 3;
    float _1266 = (*spvDescriptorSet0.vp_c15)._m0[int(_1262)][_1264];
    float _1268 = fma(_387, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1246);
    float _1270 = sqrt(_1244);
    float _1272 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1274 = fma(_389, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1268);
    int _1276 = _1173 + 72;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    uint _1280 = uint(int(uint(int(_1278)) >> uint(2)));
    int _1282 = int(_1278) & 3;
    float _1284 = (*spvDescriptorSet0.vp_c15)._m0[int(_1280)][_1282];
    int _1286 = int(_1278) + 1;
    uint _1288 = uint(int(uint(_1286) >> uint(2)));
    int _1290 = _1286 & 3;
    float _1292 = (*spvDescriptorSet0.vp_c15)._m0[int(_1288)][_1290];
    float _1294 = _523 + _1272;
    float _1296 = _1274 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1298 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1300 = _1242 + _1298;
    int _1302 = _1300 + 1;
    float _1304 = trunc(_1296);
    int _1306 = int(_1304);
    int _1308 = _1173 + 96;
    uint _1310 = uint(int(uint(_1308) >> uint(2)));
    uint _1312 = uint(int(uint(int(_1310)) >> uint(2)));
    int _1314 = int(_1310) & 3;
    float _1316 = (*spvDescriptorSet0.vp_c15)._m0[int(_1312)][_1314];
    int _1318 = int(_1310) + 1;
    uint _1320 = uint(int(uint(_1318) >> uint(2)));
    int _1322 = _1318 & 3;
    float _1324 = (*spvDescriptorSet0.vp_c15)._m0[int(_1320)][_1322];
    bool _1326 = _1270 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1328 = _1173 + 104;
    uint _1330 = uint(int(uint(_1328) >> uint(2)));
    uint _1332 = uint(int(uint(int(_1330)) >> uint(2)));
    int _1334 = int(_1330) & 3;
    float _1336 = (*spvDescriptorSet0.vp_c15)._m0[int(_1332)][_1334];
    int _1338 = int(_1330) + 1;
    uint _1340 = uint(int(uint(_1338) >> uint(2)));
    int _1342 = _1338 & 3;
    float _1344 = (*spvDescriptorSet0.vp_c15)._m0[int(_1340)][_1342];
    int _1346 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1348 = _1306 + _1346;
    int _1350 = _1348 + 1;
    float _1352 = _1294;
    float _1354 = _1200;
    int _1356 = _1350;
    float _1358 = as_type<float>(_1165);
    if (!_1326)
    {
        _1163 = _1202;
    }
    float _1360 = _1163;
    bool _1362 = !_1326;
    float _1364 = _1360;
    int _1366 = as_type<int>(_1324);
    int _1368 = as_type<int>(_1226);
    if (!_1362)
    {
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1374 = _1270 + _1372;
        float _1376 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1378 = rsqrt(_1244);
        float _1380 = _1374 * _1370;
        float _1382 = _1380 * 0.15915493667125701904296875;
        float _1384 = _1382 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        float _1388 = _1382 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        float _1392 = _1386 + (-1.0);
        float _1394 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = fma(_1390, _1376, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1398 = fma(_1294, _1386, _1394);
        float _1400 = _1378 * _1396;
        float _1402 = fma(_1214, _1400, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1404 = fma(_1210, _1400, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1352 = _1398;
        _1364 = _1402;
        _1354 = _1404;
    }
    float _1406 = _1352;
    float _1408 = _1364;
    float _1410 = _1354;
    float _1412 = -_523;
    float _1414 = _1412 + _1406;
    int _1416 = _1173 + 80;
    uint _1418 = uint(int(uint(_1416) >> uint(2)));
    uint _1420 = uint(int(uint(int(_1418)) >> uint(2)));
    int _1422 = int(_1418) & 3;
    float _1424 = (*spvDescriptorSet0.vp_c15)._m0[int(_1420)][_1422];
    int _1426 = int(_1418) + 1;
    uint _1428 = uint(int(uint(_1426) >> uint(2)));
    int _1430 = _1426 & 3;
    float _1432 = (*spvDescriptorSet0.vp_c15)._m0[int(_1428)][_1430];
    float _1434 = -_387;
    float _1436 = _1434 + _1408;
    bool _1438 = _1302 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1440 = _1414 * _1414;
    int _1442 = _1302 | _1350;
    float _1444 = -_389;
    float _1446 = _1444 + _1410;
    float _1448 = fma(_1436, _1436, _1440);
    bool _1450 = _1442 < 0;
    bool _1452 = _1450 || _1438;
    bool _1454 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1456 = isnan(0.5);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1462 = _1458 || _1460;
    float _1464 = fma(_1446, _1446, _1448);
    float _1466 = _1159 * _1324;
    bool _1468 = _1350 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1470 = _1468 || _1452;
    float _1472 = sqrt(_1464);
    float _1474 = fma(_387, _1316, _1466);
    float _1476 = _1159 * _1198;
    float _1478 = _1159 * _1266;
    float _1480 = fma(_389, _1336, _1474);
    float _1482 = fma(_387, _1190, _1476);
    float _1484 = fma(_387, _1258, _1478);
    float _1486 = _1480 + _1344;
    float _1488 = fma(_389, _1226, _1482);
    int _1490 = as_type<int>(_1478);
    int _1492 = as_type<int>(_1484);
    float _1494 = _1408;
    float _1496 = _1406;
    float _1498 = _1410;
    float _1500 = _1488;
    if (!_1470)
    {
        int _1502 = _1350 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1504 = _1502 + _1302;
        _1356 = _1504;
    }
    int _1506 = _1356;
    float _1508 = _1266;
    if (!_1470)
    {
        float _1510 = floor(_1216);
        _1508 = _1510;
    }
    float _1512 = _1508;
    float _1514 = fma(_389, _1284, _1484);
    bool _1516 = _1472 > 0.0;
    float _1518 = _1514 + _1292;
    if (!_1470)
    {
        int _1520 = _1506 << 2;
        _1366 = _1520;
    }
    int _1522 = _1366;
    float _1524 = 1.0 / _1486;
    if (!_1470)
    {
        uint _1526 = uint(int(uint(_1506) >> uint(2)));
        _1490 = int(_1526);
    }
    int _1528 = _1490;
    float _1530 = as_type<float>(_1528);
    if (!_1470)
    {
        int _1532 = 12 & _1522;
        _1368 = _1532;
    }
    int _1534 = _1368;
    float _1536 = _1488 + _1234;
    if (!_1470)
    {
        int _1538 = _1528 << 4;
        int _1540 = _1538 + _1534;
        _1492 = _1540;
    }
    int _1542 = _1492;
    bool _1544 = !_1516;
    float _1546 = _1512;
    if (!_1544)
    {
        float _1548 = _293 * _293;
        float _1550 = fma(_285, _285, _1548);
        float _1552 = rsqrt(_1464);
        float _1554 = fma(_313, _313, _1550);
        float _1556 = sqrt(_1554);
        float _1558 = _1436 * _1552;
        float _1560 = _1414 * _1552;
        float _1562 = _1446 * _1552;
        bool _1564 = _1556 > 0.0;
        bool _1566 = !_1564;
        _1530 = _1554;
        _1500 = _1552;
        if (!_1566)
        {
            float _1568 = rsqrt(_1554);
            float _1570 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1572 = _293 * _1568;
            float _1574 = _285 * _1568;
            float _1576 = _313 * _1568;
            float _1578 = _1560 * _1572;
            float _1580 = fma(_1558, _1574, _1578);
            float _1582 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1584 = fma(_1562, _1576, _1580);
            float _1586 = _1584 * _1582;
            float _1588 = fma(_285, _1586, _1408);
            float _1590 = fma(_293, _1586, _1406);
            float _1592 = fma(_313, _1586, _1410);
            _1494 = _1588;
            _1496 = _1590;
            _1498 = _1592;
            _1500 = _1586;
        }
    }
    float _1594 = _1494;
    float _1596 = _1496;
    float _1598 = _1498;
    float _1600 = _1530;
    float _1602 = _1500;
    float _1604 = _1602;
    float _1606 = _1600;
    if (_1462)
    {
        _1604 = _1594;
    }
    float _1608 = _1604;
    float _1610 = _1608;
    if (_1462)
    {
        _1606 = _1596;
    }
    float _1612 = _1606;
    float _1614 = _1612;
    if (_1462)
    {
        _329 = _1598;
    }
    float _1616 = _329;
    float _1618 = _1616;
    if (!_1462)
    {
        float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1622 = _523 + _1620;
        float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1626 = _387 + _1624;
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1630 = -_389;
        float _1632 = _1630 + _1598;
        float _1634 = _1622 * _1622;
        float _1636 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1638 = _389 + _1636;
        float _1640 = fma(_1626, _1626, _1634);
        float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1644 = fma(_1638, _1638, _1640);
        float _1646 = sqrt(_1644);
        float _1648 = _1628 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1650 = -_523;
        float _1652 = _1650 + _1596;
        float _1654 = precise::min(_1646, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1656 = _1654 * _1642;
        float _1658 = _1648 * _1656;
        float _1660 = -_387;
        float _1662 = _1660 + _1594;
        float _1664 = fma(_1652, _1658, _523);
        float _1666 = fma(_1662, _1658, _387);
        float _1668 = fma(_1632, _1658, _389);
        _1614 = _1664;
        _1610 = _1666;
        _1618 = _1668;
        _331 = _1658;
    }
    float _1670 = _1614;
    float _1672 = _1610;
    float _1674 = _1618;
    float _1676 = _331;
    int _1678 = _1173 + 88;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    uint _1682 = uint(int(uint(int(_1680)) >> uint(2)));
    int _1684 = int(_1680) & 3;
    float _1686 = (*spvDescriptorSet0.vp_c15)._m0[int(_1682)][_1684];
    int _1688 = int(_1680) + 1;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    int _1692 = _1688 & 3;
    float _1694 = (*spvDescriptorSet0.vp_c15)._m0[int(_1690)][_1692];
    float _1696 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1698 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1700 = _1518 * _1524;
    float _1702 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1704 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1696);
    float _1706 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1698);
    float _1708 = _1536 * _1524;
    float _1710 = _1446;
    if (!_1470)
    {
        int _1712 = _1542 + 400;
        uint _1714 = uint(int(uint(_1712) >> uint(2)));
        uint _1716 = uint(int(uint(int(_1714)) >> uint(2)));
        int _1718 = int(_1714) & 3;
        float _1720 = (*spvDescriptorSet0.vp_c15)._m0[int(_1716)][_1718];
        _1710 = _1720;
    }
    float _1722 = _1710;
    float _1724 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1702);
    float _1726 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1704);
    float _1728 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1706);
    float _1730 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1732 = _1708 >= 0.0;
    float _1734 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1724);
    float _1736 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1738 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1740 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1730);
    bool _1742 = _1708 <= 1.0;
    bool _1744 = _1742 && _1732;
    float _1746 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1748 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1750 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1752 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1754 = _1700 >= 0.0;
    bool _1756 = _1754 && _1744;
    float _1758 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1748);
    float _1760 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1740);
    float _1762 = -_1752;
    float _1764 = fma(_1762, _1750, 1.0);
    bool _1766 = _1700 <= 1.0;
    bool _1768 = _1766 && _1756;
    float _1770 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1758);
    float _1772 = _1760 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1774 = log2(_1764);
    float _1776 = _1159 * _1432;
    float _1778 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1780 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1770);
    float _1782 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1784 = fma(_387, _1424, _1776);
    float _1786 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1778);
    float _1788 = _1776;
    if (!_1470)
    {
        float _1790 = -_1512;
        float _1792 = _1216 + _1790;
        _1546 = _1792;
    }
    float _1794 = _1546;
    float _1796 = _1676;
    if (!_1470)
    {
        float _1798 = floor(_1296);
        _1796 = _1798;
    }
    float _1800 = _1796;
    float _1802 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1782);
    if (_1768)
    {
        float _1804 = float(_1165);
        _1358 = _1804;
    }
    float _1806 = _1358;
    float _1808 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1786);
    float _1810 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1802);
    float _1812 = 1.0 / _1780;
    float _1814 = fma(_389, _1686, _1784);
    float _1816 = _1814 + _1694;
    float _1818 = _1774 * 0.693147182464599609375;
    float _1820 = _1778;
    if (_1768)
    {
        float _1822 = rint(_1806);
        float _1824 = precise::max(_1822, 0.0);
        uint _1826 = uint(_1824);
        uint _1828 = clamp(_1826, 0u, 65535u);
        _1820 = as_type<float>(_1828);
    }
    float _1830 = _1820;
    if (!_1470)
    {
        float _1832 = -_1800;
        float _1834 = _1296 + _1832;
        _1788 = _1834;
    }
    float _1836 = _1788;
    float _1838 = _1816 * _1524;
    float _1840 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1808);
    float _1842 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1810);
    float _1844 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1846 = _1524;
    if (!_1470)
    {
        float _1848 = rint(_1722);
        float _1850 = precise::max(_1848, 0.0);
        uint _1852 = uint(_1850);
        uint _1854 = clamp(_1852, 0u, 65535u);
        _1846 = as_type<float>(_1854);
    }
    float _1856 = _1846;
    float _1858 = _1840 * _1812;
    float _1860 = _1842 * _1812;
    float _1862 = fma(_1858, 0.5, 0.5);
    float _1864 = fma(_1860, -0.5, 0.5);
    float _1866 = _1700;
    if (_1768)
    {
        float3 _6132 = float3(_1708, _1700, float(as_type<int>(_1830)));
        float3 _6136 = select(_6132, float3(0.0), isnan(_6132));
        float _1868 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6136.xy, uint(rint(_6136.z)), _1838, level(0.0));
        _1866 = _1868;
    }
    float _1870 = _1866;
    float3 _6146 = float3(_1862, _1864, _1844);
    float _1872 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6146, float3(0.0), isnan(_6146)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6146, float3(0.0), isnan(_6146)), level(0.0)).x;
    float3 _6155 = float3(_1862, _1864, _1844);
    float4 _1875 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6155, float3(0.0), isnan(_6155)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6155, float3(0.0), isnan(_6155)), level(0.0)).xyzw;
    float _1877 = _1875.x;
    float _1879 = _1875.y;
    float _1881 = _1875.z;
    float _1883 = _1875.w;
    float _1885 = _1764;
    if (!_1470)
    {
        float3 _6178 = float3(_1794, _1836, float(as_type<int>(_1856)));
        float3 _6180 = select(_6178, float3(0.0), isnan(_6178));
        float _1887 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6180.xy, uint(rint(_6180.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6180.xy, uint(rint(_6180.z)), level(0.0)).x;
        _1885 = _1887;
    }
    float _1889 = _1885;
    float _1891 = float(uint(_753));
    float _1893 = trunc(_847);
    int _1895 = int(_1893);
    float _1897 = 1.0 / _1891;
    float _1899 = float(uint(_1895));
    int _1901 = as_type<int>(_1897) + (-2);
    float _1903 = as_type<float>(_1901) * _1899;
    float _1905 = trunc(_1903);
    float _1907 = precise::max(_1905, 0.0);
    uint _1909 = uint(_1907);
    int _1911 = ~_753;
    int _1913 = _1911 + 1;
    int _1915 = ~_753;
    int _1917 = _1915 + 1;
    int _1919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1921 = _1919 != 0;
    bool _1923 = !_1921;
    float _1925 = _1923 ? 7.345489978790283203125 : 1.0;
    int _1927 = _1913 * int(_1909);
    int _1929 = _1927 + _1895;
    float _1931 = _1925 * _177;
    float _1933 = float(uint(_1929));
    float _1935 = floor(_1931);
    float _1937 = as_type<float>(_1901) * _1933;
    float _1939 = trunc(_1937);
    float _1941 = precise::max(_1939, 0.0);
    uint _1943 = uint(_1941);
    float _1945 = -_1935;
    float _1947 = _1931 + _1945;
    int _1949 = int(_1909) + int(_1943);
    float _1951 = as_type<float>(_1943);
    float _1953 = _1903;
    if (_1470)
    {
        _1951 = 1.0;
    }
    float _1955 = _1951;
    int _1957 = _1917 * _1949;
    int _1959 = _1957 + _1895;
    bool _1961 = uint(_1959) >= uint(_753);
    float _1963 = _1955;
    if (!_1470)
    {
        int _1965 = _1506 << 4;
        int _1967 = _1965 + 2048;
        uint _1969 = uint(int(uint(_1967) >> uint(2)));
        uint _1971 = uint(int(uint(int(_1969)) >> uint(2)));
        int _1973 = int(_1969) & 3;
        float _1975 = (*spvDescriptorSet0.vp_c15)._m0[int(_1971)][_1973];
        int _1977 = int(_1969) + 1;
        uint _1979 = uint(int(uint(_1977) >> uint(2)));
        int _1981 = _1977 & 3;
        float _1983 = (*spvDescriptorSet0.vp_c15)._m0[int(_1979)][_1981];
        int _1985 = _1967 + 8;
        uint _1987 = uint(int(uint(_1985) >> uint(2)));
        uint _1989 = uint(int(uint(int(_1987)) >> uint(2)));
        int _1991 = int(_1987) & 3;
        float _1993 = (*spvDescriptorSet0.vp_c15)._m0[int(_1989)][_1991];
        int _1995 = int(_1987) + 1;
        uint _1997 = uint(int(uint(_1995) >> uint(2)));
        int _1999 = _1995 & 3;
        float _2001 = (*spvDescriptorSet0.vp_c15)._m0[int(_1997)][_1999];
        float _2003 = _1159 * _1983;
        float _2005 = fma(_387, _1975, _2003);
        float _2007 = fma(_389, _1993, _2005);
        float _2009 = _2007 + _2001;
        float _2011 = precise::clamp(_2009, 0.0, 1.0);
        float _2013 = -_2011;
        float _2015 = _2013 + _1889;
        float _2017 = fma(_2015, 500.0, 1.5);
        float _2019 = exp2(_2017);
        float _2021 = 0.0 + _2019;
        float _2023 = precise::clamp(_2021, 0.0, 1.0);
        _1963 = _2023;
    }
    float _2025 = _1963;
    float _2027 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2029 = _1670 + _2027;
    float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2033 = _1672 + _2031;
    float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2037 = _1674 + _2035;
    float _2039 = _2029 * _2029;
    float _2041 = fma(_2033, _2033, _2039);
    float _2043 = fma(_2037, _2037, _2041);
    float _2045 = rsqrt(_2043);
    float _2047 = sqrt(_2043);
    float _2049 = _2033 * _2045;
    float _2051 = _2037 * _2045;
    float _2053 = _2029 * _2045;
    float _2055 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2057 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2059 = _2055 * _2055;
    float _2061 = _2057 * _2057;
    float _2063 = _2059 + _2061;
    float _2065 = sqrt(_2063);
    bool _2067 = _2065 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2071 = _2065 + _2069;
    float _2073 = as_type<float>(_1909);
    float _2075 = _2063;
    float _2077 = _2071;
    float _2079 = _2055;
    float _2081 = _2057;
    float _2083 = _2059;
    float _2085 = _2061;
    if (_2067)
    {
        float _2087 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2073 = _2087;
    }
    float _2089 = _2073;
    if (_2067)
    {
        float _2091 = rsqrt(_2063);
        _2075 = _2091;
    }
    float _2093 = _2075;
    if (_2067)
    {
        float _2095 = _2071 * _2089;
        _2077 = _2095;
    }
    float _2097 = _2077;
    float _2099 = 0.0;
    if (_2067)
    {
        float _2101 = _2097 * 0.15915493667125701904296875;
        _2099 = _2101;
    }
    float _2103 = _2099;
    float _2105 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2107 = _1844;
    if (_2067)
    {
        float _2109 = _2103 * 6.283185482025146484375;
        float _2111 = sin(_2109);
        _2107 = _2111;
    }
    float _2113 = _2107;
    float _2115 = precise::max(0.0, _2105);
    float _2117 = _2097;
    float _2119 = _2115;
    if (_2067)
    {
        float _2121 = _2103 * 6.283185482025146484375;
        float _2123 = cos(_2121);
        _2117 = _2123;
    }
    float _2125 = _2117;
    float _2127 = -_2053;
    float _2129 = -_2115;
    float _2131 = fma(_2127, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2129);
    float _2133 = _2131;
    if (_2067)
    {
        float _2135 = _2131 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2119 = _2135;
    }
    float _2137 = _2119;
    float _2139 = _2137;
    if (_2067)
    {
        float _2141 = fma(_2113, _2137, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1953 = _2141;
    }
    float _2143 = _1953;
    float _2145 = _2143;
    if (_2067)
    {
        float _2147 = _2093 * _2143;
        _2145 = _2147;
    }
    float _2149 = _2145;
    if (_2067)
    {
        float _2151 = _2125 + (-1.0);
        _2139 = _2151;
    }
    float _2153 = _2139;
    float _2155 = _2153;
    if (_2067)
    {
        float _2157 = _2055 * _2149;
        _2079 = _2157;
    }
    float _2159 = _2079;
    if (_2067)
    {
        float _2161 = _2057 * _2149;
        _2081 = _2161;
    }
    float _2163 = _2081;
    if (_2067)
    {
        float _2165 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2155 = _2165;
    }
    float _2167 = _2155;
    if (_2067)
    {
        float _2169 = _2159 * _2159;
        _2083 = _2169;
    }
    float _2171 = _2083;
    if (_2067)
    {
        float _2173 = _2163 * _2163;
        _2085 = _2173;
    }
    float _2175 = _2085;
    if (_2067)
    {
        float _2177 = fma(_2131, _2125, _2167);
        _2133 = _2177;
    }
    float _2179 = _2133;
    float _2181 = fma(_2179, _2179, _2171);
    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2185 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2183);
    float _2187 = precise::clamp(_2185, 0.0, 1.0);
    float _2189 = _2181 + _2175;
    float _2191 = -_2187;
    float _2193 = _2191 + 1.0;
    float _2195 = rsqrt(_2189);
    float _2197 = _2195 * _2159;
    float _2199 = _2195 * _2179;
    float _2201 = _2195 * _2163;
    float _2203 = float(_1895);
    float _2205 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2207 = abs(_2193);
    float _2209 = log2(_2207);
    float _2211 = -_2205;
    float _2213 = fma(_2199, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2211);
    float _2215 = -_2201;
    float _2217 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2213);
    float _2219 = 1.0 / _363;
    float _2221 = fma(_2217, -0.5, 0.5);
    float _2223 = fma(_2217, 0.5, 0.5);
    float _2225 = fma(_2223, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2227 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2229 = sqrt(_2221);
    float _2231 = fma(_2223, _2225, -0.212114393711090087890625);
    float _2233 = _2199 + 1.0;
    float _2235 = fma(_2223, _2231, 1.570728778839111328125);
    bool _2237 = _2203 >= _829;
    bool _2239 = isnan(_2203);
    bool _2241 = _2237 || _2239;
    bool _2243 = isnan(_829);
    bool _2245 = _2241 || _2243;
    float _2247 = float(_2245);
    float _2249 = exp2(_2227);
    float _2251 = _2229 * 0.636619746685028076171875;
    float _2253 = trunc(_2247);
    int _2255 = int(_2253);
    float _2257 = -_2235;
    float _2259 = fma(_2251, _2257, 1.0);
    float _2261 = -_2199;
    float _2263 = fma(_2249, _2233, _2261);
    bool _2265 = !_1961;
    int _2267 = _2265 ? 0 : (-1);
    float _2269 = fma(_2263, 0.5, 0.5);
    float2 _6748 = float2(_2259, _2269);
    float3 _2273 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6748, float2(0.0), isnan(_6748)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6748, float2(0.0), isnan(_6748)), level(0.0)).xyz;
    float _2275 = _2273.x;
    float _2277 = _2273.y;
    float _2279 = _2273.z;
    int _2281 = ~_1949;
    int _2283 = _2281 + _2267;
    int _2285 = _2283 + 1;
    float _2287 = _1947 * _829;
    bool _2289 = _753 == 0;
    float _2291 = _845 * _2219;
    int _2293 = _753 * _2285;
    int _2295 = _2293 + _1895;
    int _2297 = ~_2255;
    int _2299 = _2297 + 1;
    int _2301 = _2299 + 1;
    float _2303 = trunc(_2287);
    int _2305 = int(_2303);
    int _2307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2309 = _2307 != 0;
    float _2311 = -_841;
    float _2313 = _2311 + 1.0;
    bool _2315 = !_2289;
    int _2317 = _2315 ? _2295 : (-1);
    float _2319 = -_853;
    float _2321 = _2319 + 1.0;
    int _2323 = _753 + (-1);
    float _2325 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2327 = !_2309;
    int _2329 = _2327 ? 0 : 1;
    float _2331 = trunc(_2291);
    int _2333 = int(_2331);
    int _2335 = _2317 * _2301;
    int _2337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2339 = _2337 != 0;
    float _2341 = -_407;
    float _2343 = _2341 + 1.0;
    int _2345 = abs(_743);
    int _2347 = _2255 * _2323;
    int _2349 = _2347 + _2335;
    int _2351 = abs(_765);
    out.m_80.x = _1672;
    out.m_80.y = _1670;
    out.m_80.z = _1674;
    float _2353 = exp2(_2325);
    int _2355 = abs(_2329);
    bool _2357 = !_2339;
    int _2359 = _2357 ? 0 : 1;
    int _2361 = abs(_773);
    int _2363 = _2349 * _2345;
    int _2365 = ~_753;
    int _2367 = _2365 + 1;
    int _2369 = _2305 * _2355;
    int _2371 = _2369 + _1895;
    int _2373 = abs(_2359);
    int _2375 = _2333 * _2351;
    int _2377 = _2375 + _2363;
    int _2379 = ~_753;
    int _2381 = _2379 + 1;
    bool _2383 = _177 > 0.5;
    int _2385 = _2371 * _2361;
    int _2387 = _2385 + _2377;
    int _2389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2391 = _2389 != 0;
    float _2393 = -_2353;
    float _2395 = _2393 + 1.0;
    int _2397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2399 = _2397 != 0;
    int _2401 = _2305 * _2373;
    int _2403 = _2401 + _2387;
    int _2405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2407 = _2405 != 0;
    float _2409 = _2395 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2411 = ~_753;
    int _2413 = _2411 + 1;
    float _2415 = float(uint(_2403));
    float _2417 = _2409 * _1872;
    float _2419 = as_type<float>(_1901) * _2415;
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2423 = trunc(_2419);
    float _2425 = precise::max(_2423, 0.0);
    uint _2427 = uint(_2425);
    float _2429 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2431 = float(uint(_2371));
    float _2433 = as_type<float>(_1901) * _2431;
    int _2435 = _2367 * int(_2427);
    int _2437 = _2435 + _2403;
    float _2439 = trunc(_2433);
    float _2441 = precise::max(_2439, 0.0);
    uint _2443 = uint(_2441);
    float _2445 = float(uint(_2437));
    float _2447 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2449 = as_type<float>(_1901) * _2445;
    float _2451 = _2447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2453 = trunc(_2449);
    float _2455 = precise::max(_2453, 0.0);
    uint _2457 = uint(_2455);
    int _2459 = int(_2427) + int(_2457);
    int _2461 = _2381 * _2459;
    int _2463 = _2461 + _2403;
    bool _2465 = uint(_2463) >= uint(_753);
    float _2467 = -_321;
    int _2469 = _2383 ? as_type<int>(_2467) : as_type<int>(_321);
    bool _2471 = !_2465;
    int _2473 = _2471 ? 0 : (-1);
    bool _2475 = _409 > 0.5;
    int _2477 = ~_2459;
    int _2479 = _2477 + _2473;
    int _2481 = _2479 + 1;
    float _2483 = -_233;
    int _2485 = _2475 ? as_type<int>(_2483) : as_type<int>(_233);
    bool _2487 = !_2399;
    float _2489 = _2487 ? _321 : as_type<float>(_2469);
    int _2491 = _753 * _2481;
    int _2493 = _2491 + _2403;
    bool _2495 = !_2391;
    float _2497 = _2495 ? _233 : as_type<float>(_2485);
    int _2499 = _2413 * int(_2443);
    int _2501 = _2499 + _2371;
    float _2503 = _2489 + 0.5;
    float _2505 = _2497 + (-0.5);
    float _2507 = float(uint(_2501));
    float _2509 = fma(_2503, (*spvDescriptorSet0.vp_c9)._m0[80].x, _835);
    float _2511 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2513 = -_2505;
    float _2515 = -_849;
    float _2517 = fma(_2513, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2515);
    bool _2519 = !_2289;
    int _2521 = _2519 ? _2493 : (-1);
    float _2523 = -_2313;
    float _2525 = fma(_2489, _2523, _2509);
    float _2527 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2529 = _2511 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2531 = _2521 >> 31;
    float _2533 = as_type<float>(_1901) * _2507;
    float _2535 = fma(_2497, _2321, _2517);
    int _2537 = _2531 & 3;
    out.m_82.x = _2451;
    out.m_82.y = _2429;
    out.m_82.z = _2529;
    out.m_82.w = _2527;
    float _2539 = trunc(_2533);
    float _2541 = precise::max(_2539, 0.0);
    uint _2543 = uint(_2541);
    int _2545 = _2521 + _2537;
    out.m_84.x = _2525;
    out.m_84.y = _2535;
    int _2547 = ~_753;
    int _2549 = _2547 + 1;
    float _2551 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2553 = _2545 >> 2;
    float _2555 = _233 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2557 = _2521 & 3;
    bool _2559 = _2557 != 0;
    float _2561 = abs(_1103);
    float _2563 = log2(_2561);
    int _2565 = _2553 << 4;
    int _2567 = _2565 + 368;
    float _2569 = -_1089;
    float _2571 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2551);
    float _2573 = _321 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _2575 = uint(int(uint(_2567) >> uint(2)));
    uint _2577 = uint(int(uint(int(_2575)) >> uint(2)));
    int _2579 = int(_2575) & 3;
    float _2581 = (*spvDescriptorSet0.vp_c9)._m0[int(_2577)][_2579];
    int _2583 = int(_2575) + 1;
    uint _2585 = uint(int(uint(_2583) >> uint(2)));
    int _2587 = _2583 & 3;
    float _2589 = (*spvDescriptorSet0.vp_c9)._m0[int(_2585)][_2587];
    float _2591 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2595 = int(_2443) + int(_2543);
    float _2597 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2599 = _2591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2601 = _2593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2603 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2605 = _2597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2607 = _2549 * _2595;
    int _2609 = _2607 + _2371;
    float _2611 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2613 = -_1089;
    float _2615 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2603);
    float _2617 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_86.x = _2599;
    out.m_86.y = _2601;
    out.m_86.z = _2605;
    bool _2619 = uint(_2609) >= uint(_753);
    float _2621 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2623 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2625 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2627 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2571);
    float _2629 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2611);
    float _2631 = exp2(_2623);
    float _2633 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2635 = _1103 <= 8000.0;
    bool _2637 = isnan(_1103);
    bool _2639 = _2635 || _2637;
    bool _2641 = isnan(8000.0);
    bool _2643 = _2639 || _2641;
    float _2645 = float(_2643);
    int _2647 = _2521 & 3;
    bool _2649 = _2647 != 0;
    int _2651 = _2567 + 8;
    uint _2653 = uint(int(uint(_2651) >> uint(2)));
    uint _2655 = uint(int(uint(int(_2653)) >> uint(2)));
    int _2657 = int(_2653) & 3;
    float _2659 = (*spvDescriptorSet0.vp_c9)._m0[int(_2655)][_2657];
    int _2661 = int(_2653) + 1;
    uint _2663 = uint(int(uint(_2661) >> uint(2)));
    int _2665 = _2661 & 3;
    float _2667 = (*spvDescriptorSet0.vp_c9)._m0[int(_2663)][_2665];
    int _2669 = _2559 ? 0 : 1;
    bool _2671 = uint(_2647) > 1u;
    float _2673 = -_1089;
    float _2675 = fma(_2673, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2625);
    int _2677 = ~_2669;
    int _2679 = _2677 + 1;
    int _2681 = _2679 + 1;
    float _2683 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2615);
    bool _2685 = uint(_2647) >= 2u;
    float _2687 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2675);
    float _2689 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2617);
    float _2691 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2693 = _2685 ? 0 : 1;
    float _2695 = fma(_2631, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2697 = precise::clamp(_2695, 0.0, 1.0);
    float _2699 = _2555 * _2683;
    float _2701 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2621);
    int _2703 = ~_2693;
    int _2705 = _2703 + 1;
    int _2707 = _2705 + 1;
    int _2709 = _2681;
    int _2711 = _2707;
    if (!_2671)
    {
        int _2713 = ~_2669;
        int _2715 = _2713 + 1;
        _2709 = _2715;
    }
    int _2717 = _2709;
    float _2719 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2721 = _2647 != 3;
    float _2723 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2633);
    int _2725 = abs(_2717);
    float _2727 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2719);
    bool _2729 = !_2649;
    int _2731 = _2729 ? 0 : 1;
    float _2733 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2691);
    int _2735 = ~_2725;
    int _2737 = _2735 + 1;
    int _2739 = _2737 + 1;
    float _2741 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2727);
    bool _2743 = _2647 != 3;
    float _2745 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2723);
    int _2747 = abs(_2731);
    int _2749 = _2739 * as_type<int>(_2589);
    bool _2751 = !_2743;
    int _2753 = _2751 ? 0 : (-1);
    float _2755 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2733);
    if (_2721)
    {
        int _2757 = ~_2693;
        int _2759 = _2757 + 1;
        _2711 = _2759;
    }
    int _2761 = _2711;
    bool _2763 = !_2407;
    int _2765 = _2763 ? 0 : 1;
    int _2767 = abs(_2761);
    int _2769 = ~_2747;
    int _2771 = _2769 + 1;
    int _2773 = _2771 + 1;
    int _2775 = abs(_2753);
    int _2777 = _2773 * as_type<int>(_2581);
    int _2779 = _2777 + _2749;
    bool _2781 = !_2619;
    int _2783 = _2781 ? 0 : (-1);
    int _2785 = abs(_2765);
    int _2787 = ~_2767;
    int _2789 = _2787 + 1;
    int _2791 = _2789 + 1;
    int _2793 = ~_2595;
    int _2795 = _2793 + _2783;
    int _2797 = _2795 + 1;
    int _2799 = _2791 * as_type<int>(_2659);
    int _2801 = _2799 + _2779;
    int _2803 = ~_2775;
    int _2805 = _2803 + 1;
    int _2807 = _2805 + 1;
    int _2809 = _753 * _2797;
    int _2811 = _2809 + _2371;
    int _2813 = ~_2785;
    int _2815 = _2813 + 1;
    int _2817 = _2815 + 1;
    int _2819 = _2807 * as_type<int>(_2667);
    int _2821 = _2819 + _2801;
    float _2823 = _2555 * _2627;
    float _2825 = _2555 * _2687;
    bool _2827 = !_2289;
    int _2829 = _2827 ? _2811 : (-1);
    int _2831 = _2821 * _2817;
    float _2833 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2629);
    float _2835 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2689);
    int _2837 = _2829 * _2785;
    int _2839 = _2837 + _2831;
    float _2841 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2701);
    float _2843 = fma(_2697, -2.0, 3.0);
    float _2845 = _2697 * _2697;
    float _2847 = fma(_2573, _2835, _2699);
    float _2849 = fma(_2573, _2841, _2825);
    float _2851 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2853 = _2845 * _2843;
    float _2855 = fma(_2573, _2833, _2823);
    float _2857 = float(_2839);
    float _2859 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2851);
    float _2861 = -_2853;
    float _2863 = _2861 + 1.0;
    float _2865 = _2741 + _2855;
    float _2867 = _2755 + _2849;
    float _2869 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2859);
    float _2871 = fma(_2863, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2853);
    out.m_88.x = _2857;
    float _2873 = _2745 + _2847;
    float _2875 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2869);
    float _2877 = _2645 * _2871;
    float _2879 = _1883 * _2417;
    float _2881 = _2875 + _1780;
    float _2883 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2885 = _2857;
    float _2887 = _2881;
    if (!_1768)
    {
        _2885 = 1.0;
    }
    float _2889 = _2885;
    out.m_90.x = _2865;
    out.m_90.y = _2873;
    out.m_90.z = _2867;
    float _2891 = _2889;
    if (_1768)
    {
        bool _2893 = _1870 >= _1838;
        bool _2895 = isnan(_1870);
        bool _2897 = _2893 || _2895;
        bool _2899 = isnan(_1838);
        bool _2901 = _2897 || _2899;
        float _2903 = float(_2901);
        _2891 = _2903;
    }
    float _2905 = _2891;
    float _2907 = _2343 * _2883;
    float _2909 = precise::clamp(_2907, 0.0, 1.0);
    float _2911 = _2881 * 0.5;
    float _2913 = -_2409;
    float _2915 = _2913 + 1.0;
    float _2917 = _2905 * _2025;
    float _2919 = -_2909;
    float _2921 = fma(_2919, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_92.z = _2911;
    out.m_92.w = _1780;
    float _2923 = _1883 * _2915;
    bool _2925 = _2047 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2927 = isnan(_2047);
    bool _2929 = _2925 || _2927;
    bool _2931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2933 = _2929 || _2931;
    float _2935 = -_2917;
    float _2937 = fma(_2935, _2921, 1.0);
    float _2939 = precise::clamp(_2937, 0.0, 1.0);
    out.gl_Position.x = _1840;
    out.gl_Position.y = _1842;
    out.gl_Position.z = _2875;
    out.gl_Position.w = _1780;
    float _2941 = _2279 * _2417;
    float _2943 = fma(_2275, _2879, _1877);
    float _2945 = fma(_2277, _2879, _1879);
    float _2947 = _2939 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2949 = fma(_1883, _2941, _1881);
    out.m_94.x = _2947;
    float _2951 = _2911;
    float _2953 = _2915;
    float _2955 = _2917;
    float _2957 = _2909;
    float _2959 = _2939;
    if (!_2933)
    {
        _2951 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2961 = _2951;
    float _2963 = _2961;
    float _2965 = _2961;
    if (!_2933)
    {
        _2953 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2967 = _2953;
    out.m_96.x = _2943;
    out.m_96.y = _2945;
    out.m_96.z = _2949;
    out.m_96.w = _2923;
    float _2969 = _2967;
    float _2971 = _2967;
    if (!_2933)
    {
        _2887 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2973 = _2887;
    float _2975 = _2973;
    float _2977 = _2973;
    if (!_2933)
    {
        _2955 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2979 = _2955;
    float _2981 = _2979;
    float _2983 = _2979;
    if (!_2933)
    {
        _2957 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2985 = _2957;
    float _2987 = _2985;
    float _2989 = _2985;
    if (!_2933)
    {
        _2959 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2991 = _2959;
    bool _2993 = !_2933;
    float _2995 = _2991;
    float _2997 = _2991;
    if (!_2993)
    {
        bool _2999 = _2047 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3001 = isnan(_2047);
        bool _3003 = _2999 || _3001;
        bool _3005 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3007 = _3003 || _3005;
        if (!_3007)
        {
            float _3009 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3011 = _2047 + _3009;
            float _3013 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3015 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3013;
            float _3017 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3019 = _3017 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3021 = 1.0 / _3015;
            float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3025 = _3023 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3027 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3029 = _3027 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3031 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3033 = _3031 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3037 = _3035 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3039 = _3011 * _3021;
            float _3041 = precise::clamp(_3039, 0.0, 1.0);
            float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3047 = fma(_3041, _3019, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3049 = fma(_3041, _3045, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3051 = fma(_3041, _3025, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3053 = fma(_3041, _3029, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3055 = fma(_3041, _3033, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3057 = fma(_3041, _3037, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2971 = _3051;
            _2989 = _3055;
            _2965 = _3047;
            _2983 = _3053;
            _2977 = _3049;
            _2997 = _3057;
            _3059 = true;
        }
        else
        {
            bool _3061 = _2047 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3063 = isnan(_2047);
            bool _3065 = _3061 || _3063;
            bool _3067 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3069 = _3065 || _3067;
            if (!_3069)
            {
                _2963 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3071 = _2963;
            _2965 = _3071;
            if (!_3069)
            {
                _2969 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3073 = _2969;
            _2971 = _3073;
            if (!_3069)
            {
                _2975 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3075 = _2975;
            _2977 = _3075;
            if (!_3069)
            {
                _2981 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3077 = _2981;
            _2983 = _3077;
            if (!_3069)
            {
                _2987 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3079 = _2987;
            _2989 = _3079;
            if (!_3069)
            {
                _2995 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3081 = _2995;
            bool _3083 = !_3069;
            _2997 = _3081;
            if (!_3083)
            {
                bool _3085 = _2047 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3087 = isnan(_2047);
                bool _3089 = _3085 || _3087;
                bool _3091 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3093 = _3089 || _3091;
                if (!_3093)
                {
                    float _3095 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3097 = _2047 + _3095;
                    float _3099 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3101 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3099;
                    float _3103 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3105 = _3103 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3107 = 1.0 / _3101;
                    float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3117 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3119 = _3117 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3123 = _3121 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3125 = _3097 * _3107;
                    float _3127 = precise::clamp(_3125, 0.0, 1.0);
                    float _3129 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3131 = _3129 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3133 = fma(_3127, _3105, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3135 = fma(_3127, _3131, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3137 = fma(_3127, _3111, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3139 = fma(_3127, _3115, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3141 = fma(_3127, _3119, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3143 = fma(_3127, _3123, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2971 = _3137;
                    _2989 = _3141;
                    _2965 = _3133;
                    _2983 = _3139;
                    _2977 = _3135;
                    _2997 = _3143;
                    _3059 = true;
                }
                else
                {
                    _2971 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2989 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2965 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2983 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2977 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2997 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3059 = false;
    float _3145 = _2971;
    float _3147 = _2989;
    float _3149 = _2965;
    float _3151 = _2983;
    float _3153 = _2977;
    float _3155 = _2997;
    float _3157 = fma(_2873, -0.5, 0.5);
    float _3159 = precise::clamp(_3157, 0.0, 1.0);
    float _3161 = -_3145;
    float _3163 = _3161 + _3147;
    float _3165 = -_3149;
    float _3167 = _3165 + _3151;
    float _3169 = -_3153;
    float _3171 = _3169 + _3155;
    bool _3173 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3175 = fma(_3159, _3163, _3145);
    float _3177 = fma(_3159, _3167, _3149);
    float _3179 = fma(_3159, _3171, _3153);
    float _3181 = _3175 * 0.586610972881317138671875;
    out.m_98.x = 0.0;
    float _3183 = fma(_3177, 0.298911988735198974609375, _3181);
    float _3185 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3187 = fma(_3179, 0.114477999508380889892578125, _3183);
    out.m_59.x = _3185;
    float _3189 = -_3187;
    float _3191 = _3177 + _3189;
    float _3193 = -_3187;
    float _3195 = _3175 + _3193;
    float _3197 = -_3187;
    float _3199 = _3179 + _3197;
    out.m_100.x = 0.0;
    float _3201 = fma(_3191, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3187);
    float _3203 = fma(_3195, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3187);
    float _3205 = fma(_3199, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3187);
    out.m_102.x = _3201;
    out.m_102.y = _3203;
    out.m_102.z = _3205;
    if (!_3173)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3207 = -_1670;
    float _3209 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3211 = -_1672;
    float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3215 = -_1674;
    float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3219 = _3209 * _3209;
    float _3221 = fma(_3213, _3213, _3219);
    float _3223 = fma(_3217, _3217, _3221);
    float _3225 = rsqrt(_3223);
    float _3227 = sqrt(_3223);
    float _3229 = _3209 * _3225;
    float _3231 = _3213 * _3225;
    float _3233 = _3217 * _3225;
    float _3235 = -_2053;
    float _3237 = _3235 + _3229;
    float _3239 = -_2049;
    float _3241 = _3239 + _3231;
    float _3243 = -_2051;
    float _3245 = _3243 + _3233;
    float _3247 = _3237 * _3237;
    float _3249 = -_3227;
    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3253 = fma(_3241, _3241, _3247);
    float _3255 = _3251 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3257 = precise::clamp(_3255, 0.0, 1.0);
    float _3259 = fma(_3245, _3245, _3253);
    float _3261 = abs(_3257);
    float _3263 = log2(_3261);
    float _3265 = rsqrt(_3259);
    float _3267 = _3263 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3269 = exp2(_3267);
    float _3271 = _3237 * _3265;
    float _3273 = _3241 * _3265;
    float _3275 = _3245 * _3265;
    float _3277 = _2873 * _3271;
    float _3279 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _3281 = precise::clamp(_3279, 0.0, 1.0);
    float _3283 = _2873 * _3229;
    float _3285 = fma(_2865, _3273, _3277);
    float _3287 = _3281 * _3281;
    float _3289 = fma(_2865, _3231, _3283);
    float _3291 = fma(_2867, _3275, _3285);
    float _3293 = precise::clamp(_3291, 0.0, 1.0);
    float _3295 = _3287 + (-1.0);
    float _3297 = fma(_2867, _3233, _3289);
    float _3299 = precise::clamp(_3297, 0.0, 1.0);
    float _3301 = _3293 * _3293;
    float _3303 = _3231 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3305 = fma(_3301, _3295, 1.0);
    float _3307 = -_3229;
    float _3309 = -_3303;
    float _3311 = fma(_3307, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3309);
    float _3313 = _3305 * _3305;
    float _3315 = -_3233;
    float _3317 = fma(_3315, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3311);
    float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3321 = _3317 + _3319;
    float _3323 = 1.0 / _3313;
    float _3325 = _3321 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3327 = precise::clamp(_3325, 0.0, 1.0);
    float _3329 = _3269 * _3327;
    float _3331 = _3299 * _3329;
    float _3333 = _3287 * _3323;
    float _3335 = _3331 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3337 = _3331 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3339 = _3331 * _3333;
    float _3341 = _3331 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _3343 = _3339 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3345 = _3339 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3347 = _3339 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _3335;
    out.m_98.y = _3337;
    out.m_98.z = _3341;
    out.m_100.x = _3343;
    out.m_100.y = _3345;
    out.m_100.z = _3347;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3059 = false;
    bool _353 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_56.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_59.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3403 = as_type<float>(_137);
        out.gl_Position.z = _3403;
    }
    if (!_125)
    {
        return out;
    }
    float _139 = in.m_61.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = 0.0;
    float _157 = _153;
    if (_149)
    {
        float _159 = float(_121);
        _155 = _159;
    }
    float _161 = _155;
    bool _163 = _153 >= _161;
    bool _165 = !_149;
    bool _167 = _163 || _165;
    if (_167)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _131;
    if (_167)
    {
        out.m_59.x = 0.0;
    }
    int _171 = 0;
    if (_167)
    {
        float _173 = _169 * 5.0;
        _171 = as_type<int>(_173);
    }
    int _175 = _171;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3472 = as_type<float>(_175);
        out.gl_Position.z = _3472;
    }
    if (_167)
    {
        return out;
    }
    float _177 = in.m_63.x;
    float _179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _181 = _153 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_68.x;
    float _187 = in.m_68.y;
    float _189 = in.m_68.z;
    float _191 = in.m_70.x;
    float _193 = in.m_70.y;
    float _195 = in.m_70.z;
    float _197 = in.m_72.x;
    float _199 = in.m_72.y;
    float _201 = in.m_72.z;
    float _203 = _181 * _179;
    float _205 = in.m_74.x;
    float _207 = in.m_74.y;
    float _209 = in.m_74.z;
    float _211 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[20].x, _203);
    int _213 = as_type<int>(_183) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_183) & 2;
    bool _219 = _217 != 0;
    float _221 = _211 * 6.283185482025146484375;
    float _223 = floor(_211);
    int _225 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _227 = _225 != 0;
    float _229 = _221 * 0.15915493667125701904296875;
    bool _231 = !_219;
    float _233 = _231 ? (-0.5) : 0.5;
    int _235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _237 = _235 != 0;
    int _239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _241 = _239 != 0;
    float _243 = _187 * _193;
    bool _245 = !_227;
    int _247 = _245 ? 0 : 1;
    float _249 = _229 * 6.283185482025146484375;
    float _251 = cos(_249);
    float _253 = _187 * _199;
    bool _255 = !_237;
    int _257 = _255 ? 0 : 1;
    float _259 = fma(_185, _191, _243);
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _263 = _187 * _207;
    int _265 = abs(_257);
    float _267 = fma(_185, _197, _253);
    int _269 = abs(_247);
    float _271 = -_223;
    float _273 = _211 + _271;
    float _275 = fma(_185, _205, _263);
    float _277 = -_273;
    float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _281 = !_241;
    int _283 = _281 ? 0 : 1;
    float _285 = fma(_189, _195, _259);
    float _287 = float(_265);
    float _289 = fma(_251, 0.5, 0.5);
    int _291 = abs(_283);
    float _293 = fma(_189, _201, _267);
    bool _295 = _273 < 0.5;
    float _297 = float(_295);
    float _299 = abs(_279);
    float _301 = _287 * _299;
    float _303 = float(_269);
    float _305 = -_289;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _309 = -_297;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _313 = fma(_189, _209, _275);
    float _315 = fma(_303, _307, _301);
    float _317 = float(_291);
    bool _319 = !_215;
    float _321 = _319 ? (-0.5) : 0.5;
    float _323 = abs(_311);
    float _325 = fma(_317, _323, _315);
    bool _327 = !_261;
    float _329 = _313;
    float _331 = _285;
    float _349;
    float _351;
    if (!_327)
    {
        float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _335 = _177 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _337 = float(_121);
        float _339 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
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
        float _355 = float(_121);
        float _357 = 1.0 / _355;
        float _359 = _153 * _357;
        _349 = _359;
        _351 = _355;
    }
    _353 = false;
    float _361 = _349;
    float _363 = _351;
    float _365 = in.m_56.x;
    float _367 = in.m_56.y;
    float _369 = in.m_56.z;
    float _371 = in.m_70.w;
    float _373 = in.m_74.w;
    float _375 = _193 * _367;
    float _377 = _207 * _367;
    float _379 = fma(_191, _365, _375);
    float _381 = fma(_205, _365, _377);
    float _383 = fma(_195, _369, _379);
    float _385 = fma(_209, _369, _381);
    float _387 = _383 + _371;
    float _389 = _385 + _373;
    float _391 = fma(_387, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _393 = fma(_389, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _395 = floor(_391);
    float _397 = floor(_393);
    float _399 = -_395;
    float _401 = _391 + _399;
    float _403 = -_397;
    float _405 = _393 + _403;
    float2 _3796 = float2(_401, _405);
    float _407 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3796, float2(0.0), isnan(_3796)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3796, float2(0.0), isnan(_3796)), level(0.0)).x;
    float _409 = in.m_63.y;
    float _411 = _177 * 2.0;
    float _413 = _199 * _367;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _423 = floor(_411);
    float _425 = fma(_197, _365, _413);
    float _427 = _177 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _431 = fma(_201, _369, _425);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _433;
    float _437 = 1.0 / _417;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _443 = -_429;
    float _445 = fma(_427, 2.0, _443);
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _451 = _361 + _449;
    float _453 = in.m_72.w;
    float _455 = 1.0 / _421;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = _361 + _457;
    float _461 = _409 * 2.0;
    bool _463 = _423 > 0.0;
    float _465 = _409 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _467 = _423 >= 0.0;
    bool _469 = isnan(_423);
    bool _471 = _467 || _469;
    bool _473 = isnan(0.0);
    bool _475 = _471 || _473;
    float _477 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _479 = _459 * _437;
    float _481 = in.m_63.z;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _485 = _361 + _483;
    float _487 = floor(_461);
    float _489 = fma(_465, -2.0, _447);
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _493 = _491 != 0;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _497 = _495 != 0;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _501 = _499 != 0;
    float _503 = _485 * _455;
    float _505 = _177 + _409;
    float _507 = 1.0 / _435;
    float _509 = _505 + (-1.0);
    bool _511 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _513 = isnan(_361);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = _431 + _453;
    float _525 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _527 = 1.0 / _441;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _535 = _361 + _533;
    bool _537 = _487 > 0.0;
    bool _539 = _487 >= 0.0;
    bool _541 = isnan(_487);
    bool _543 = _539 || _541;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _549;
    float _553 = 1.0 / _531;
    float _555 = _535 * _507;
    float _557 = _409 + _481;
    float _559 = _481 * 2.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _563 = _361 + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _565;
    float _569 = _557 + (-1.0);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _575 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _577 = log2(_575);
    float _579 = _451 * _527;
    float _581 = _177 + _481;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _587 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _589 = _581 + (-1.0);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _591;
    float _595 = _563 * _553;
    float _597 = floor(_559);
    float _599 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _601;
    int _605 = _475 ? 0 : 1;
    float _607 = fma(_573, _579, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _609 = fma(_585, _579, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _615 = _577 * _153;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _621 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _623 = int(_621);
    int _625 = ~_605;
    int _627 = _625 + 1;
    int _629 = _627 + 1;
    float _631 = fma(_593, _479, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _633 = fma(_603, _479, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _635 = fma(_613, _503, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _637 = fma(_619, _503, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _639 = _629;
    if (!_463)
    {
        int _641 = ~_605;
        int _643 = _641 + 1;
        _639 = _643;
    }
    int _645 = _639;
    float _647 = -_521;
    float _649 = _647 + 1.0;
    float _651 = exp2(_615);
    bool _653 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _655 = isnan(_361);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = fma(_567, _555, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _667 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _669 = isnan(_361);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = fma(_551, _555, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _681 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _683 = isnan(_361);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = -_663;
    float _695 = _693 + 1.0;
    bool _697 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _699 = isnan(_361);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = -_677;
    float _711 = _709 + 1.0;
    bool _713 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _715 = isnan(_361);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = -_691;
    float _727 = _725 + 1.0;
    bool _729 = _597 >= 0.0;
    bool _731 = isnan(_597);
    bool _733 = _729 || _731;
    bool _735 = isnan(0.0);
    bool _737 = _733 || _735;
    float _739 = _691 * _695;
    bool _741 = !_497;
    int _743 = _741 ? 0 : 1;
    float _745 = _723 * _649;
    float _747 = -_723;
    float _749 = _747 + 1.0;
    float _751 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _753 = int(_751);
    float _755 = _521 * _727;
    float _757 = float(_623);
    float _759 = -_651;
    float _761 = _759 + 1.0;
    bool _763 = !_493;
    int _765 = _763 ? 0 : 1;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _769 = 1.0 + _767;
    bool _771 = !_501;
    int _773 = _771 ? 0 : 1;
    float _775 = _707 * _749;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _779 = _777 != 0;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _783 = _781 != 0;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _787 = _785 != 0;
    float _789 = 1.0 / _757;
    bool _791 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _793 = isnan(0.0);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _799 = _795 || _797;
    float _801 = -_707;
    float _803 = _801 + 1.0;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _809 = _799 ? _761 : 0.0;
    float _811 = _677 * _803;
    bool _813 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _815 = isnan(1.0);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _821 = _817 || _819;
    float _823 = 1.0 / _769;
    float _825 = _523 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _827 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[78].z, _805);
    float _829 = float(_753);
    float _831 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[78].w, _807);
    float _833 = -_153;
    float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[76].x, _445);
    float _837 = _631 * _811;
    float _839 = _633 * _811;
    float _841 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _827);
    float _843 = fma(_387, (*spvDescriptorSet0.vp_c8)._m0[11].x, _825);
    float _845 = _829 * _153;
    float _847 = _789 * _153;
    float _849 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _489);
    float _851 = fma(_389, (*spvDescriptorSet0.vp_c8)._m0[11].z, _843);
    float _853 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _831);
    float _855 = _523 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_821)
    {
        float _857 = _809 * _823;
        _157 = _857;
    }
    float _859 = _157;
    float _861 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[143].x, _837);
    float _863 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[143].y, _839);
    float _865 = _851 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _867 = !_783;
    int _869 = _867 ? 0 : 1;
    float _871 = in.m_76.x;
    float _873 = in.m_76.y;
    float _875 = in.m_76.z;
    float _877 = fma(_387, (*spvDescriptorSet0.vp_c8)._m0[10].x, _855);
    float _879 = 1.0 / _865;
    int _881 = abs(_869);
    float _883 = _481 + (-0.5);
    bool _885 = _597 > 0.0;
    float _887 = fma(_389, (*spvDescriptorSet0.vp_c8)._m0[10].z, _877);
    float _889 = float(_645);
    float _891 = fma(_637, _775, _863);
    float _893 = float(_881);
    float _895 = _887 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _897 = _737 ? 0 : 1;
    float _899 = fma(_635, _775, _861);
    bool _901 = !_779;
    int _903 = _901 ? 0 : 1;
    float _905 = _893 * _889;
    bool _907 = !_787;
    int _909 = _907 ? 0 : 1;
    float _911 = _895 + _865;
    int _913 = ~_897;
    int _915 = _913 + 1;
    int _917 = _915 + 1;
    float _919 = fma(_679, _745, _891);
    int _921 = abs(_903);
    float _923 = _911 * _879;
    float _925 = _923 * 0.5;
    int _927 = _917;
    if (!_885)
    {
        int _929 = ~_897;
        int _931 = _929 + 1;
        _927 = _931;
    }
    int _933 = _927;
    float _935 = _905 * (-2.0);
    int _937 = abs(_909);
    float _939 = fma(_665, _745, _899);
    float _941 = _409 + (-0.5);
    float _943 = fma(_587, _935, _587);
    float _945 = float(_933);
    float _947 = fma(_935, _873, _873);
    float _949 = float(_921);
    float _951 = fma(_609, _755, _919);
    int _953 = _547 ? 0 : 1;
    float _955 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[196].y, _947);
    float _957 = float(_937);
    float _959 = _949 * _945;
    int _961 = ~_953;
    int _963 = _961 + 1;
    int _965 = _963 + 1;
    float _967 = fma(_943, _859, _955);
    int _969 = _965;
    if (!_537)
    {
        int _971 = ~_953;
        int _973 = _971 + 1;
        _969 = _973;
    }
    int _975 = _969;
    float _977 = _959 * (-2.0);
    float _979 = _967 * 0.15915493667125701904296875;
    float _981 = float(_975);
    float _983 = fma(_525, _977, _525);
    float _985 = fma(_977, _871, _871);
    float _987 = _177 + (-0.5);
    float _989 = fma(_607, _755, _939);
    float _991 = _957 * _981;
    float _993 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].x, _985);
    float _995 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _997 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[30].w, _995);
    float _999 = _991 * (-2.0);
    float _1001 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _321);
    float _1003 = fma(_983, _859, _993);
    float _1005 = fma(_999, _875, _875);
    float _1007 = fma(_599, _999, _599);
    float _1009 = _1003 * 0.15915493667125701904296875;
    float _1011 = in.m_78.x;
    float _1013 = in.m_78.y;
    float _1015 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1005);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _1017;
    float _1021 = _979 * 6.283185482025146484375;
    float _1023 = sin(_1021);
    float _1025 = fma(_1007, _859, _1015);
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _1027;
    float _1031 = fma(_1019, _595, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1033 = _1025 * 0.15915493667125701904296875;
    float _1035 = fma(_1029, _595, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _1037 = fma(_1031, _739, _951);
    float _1039 = _979 * 6.283185482025146484375;
    float _1041 = cos(_1039);
    float _1043 = fma(_1035, _739, _989);
    float _1045 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1037);
    float _1047 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1043);
    float _1049 = _1009 * 6.283185482025146484375;
    float _1051 = sin(_1049);
    float _1053 = _1045 * _1013;
    float _1055 = _1047 * _1011;
    float _1057 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _233);
    float _1059 = _325 * _1053;
    float _1061 = _1009 * 6.283185482025146484375;
    float _1063 = cos(_1061);
    float _1065 = _325 * _1055;
    float _1067 = _1059 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1069 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1071 = _1033 * 6.283185482025146484375;
    float _1073 = cos(_1071);
    float _1075 = _1051 * _1041;
    float _1077 = _1051 * _1023;
    float _1079 = _1069 * _1001;
    float _1081 = 1.0 / _997;
    float _1083 = _1063 * _1041;
    float _1085 = _1063 * _1023;
    float _1087 = _1033 * 6.283185482025146484375;
    float _1089 = sin(_1087);
    float _1091 = _1051 * _1073;
    float _1093 = _1041 * _1073;
    float _1095 = _1063 * _1073;
    float _1097 = _1023 * _1073;
    float _1099 = _1067 * _1057;
    float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1103 = _1081 * _1101;
    float _1105 = _1095 * _1099;
    bool _1107 = _1103 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1109 = _1103 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1111 = fma(_1089, _1083, _1077);
    float _1113 = fma(_1089, _1077, _1083);
    float _1115 = -_1085;
    float _1117 = fma(_1089, _1075, _1115);
    float _1119 = -_1075;
    float _1121 = fma(_1089, _1085, _1119);
    float _1123 = -_1099;
    float _1125 = _1089 * _1123;
    float _1127 = fma(_1111, _1079, _1105);
    float _1129 = _1091 * _1099;
    float _1131 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1133 = fma(_1093, _1079, _1125);
    float _1135 = fma(_1121, _477, _1127);
    float _1137 = fma(_1117, _1079, _1129);
    int _1139 = 2;
    if (!_1107)
    {
        _1139 = 1;
    }
    int _1141 = _1139;
    float _1143 = fma(_1097, _477, _1133);
    float _1145 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1147 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1149 = fma(_1113, _477, _1137);
    bool _1151 = !_1107;
    int _1153 = _1151 ? 0 : 1;
    float _1155 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1145);
    float _1157 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1147);
    float _1159 = _523 + _1131;
    int _1161 = _1141;
    float _1163 = _1143;
    if (!_1109)
    {
        _1161 = _1153;
    }
    int _1165 = _1161;
    float _1167 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1155);
    float _1169 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1157);
    float _1171 = _1159 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _1173 = _1165 << 6;
    float _1175 = _1167 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1177 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1179 = fma(_387, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1171);
    int _1181 = _1173 + 48;
    uint _1184 = uint(int(uint(_1181) >> uint(2)));
    uint _1186 = uint(int(uint(int(_1184)) >> uint(2)));
    int _1188 = int(_1184) & 3;
    float _1190 = (*spvDescriptorSet0.vp_c15)._m0[int(_1186)][_1188];
    int _1192 = int(_1184) + 1;
    uint _1194 = uint(int(uint(_1192) >> uint(2)));
    int _1196 = _1192 & 3;
    float _1198 = (*spvDescriptorSet0.vp_c15)._m0[int(_1194)][_1196];
    float _1200 = _389 + _1175;
    float _1202 = _387 + _1177;
    float _1204 = fma(_389, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1179);
    float _1206 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1210 = _1200 + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1214 = _1202 + _1212;
    float _1216 = _1204 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _1218 = _1173 + 56;
    uint _1220 = uint(int(uint(_1218) >> uint(2)));
    uint _1222 = uint(int(uint(int(_1220)) >> uint(2)));
    int _1224 = int(_1220) & 3;
    float _1226 = (*spvDescriptorSet0.vp_c15)._m0[int(_1222)][_1224];
    int _1228 = int(_1220) + 1;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    int _1232 = _1228 & 3;
    float _1234 = (*spvDescriptorSet0.vp_c15)._m0[int(_1230)][_1232];
    float _1236 = _1210 * _1210;
    float _1238 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1206);
    float _1240 = trunc(_1216);
    int _1242 = int(_1240);
    float _1244 = fma(_1214, _1214, _1236);
    float _1246 = _1159 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1248 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1238);
    int _1250 = _1173 + 64;
    uint _1252 = uint(int(uint(_1250) >> uint(2)));
    uint _1254 = uint(int(uint(int(_1252)) >> uint(2)));
    int _1256 = int(_1252) & 3;
    float _1258 = (*spvDescriptorSet0.vp_c15)._m0[int(_1254)][_1256];
    int _1260 = int(_1252) + 1;
    uint _1262 = uint(int(uint(_1260) >> uint(2)));
    int _1264 = _1260 & 3;
    float _1266 = (*spvDescriptorSet0.vp_c15)._m0[int(_1262)][_1264];
    float _1268 = fma(_387, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1246);
    float _1270 = sqrt(_1244);
    float _1272 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1274 = fma(_389, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1268);
    int _1276 = _1173 + 72;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    uint _1280 = uint(int(uint(int(_1278)) >> uint(2)));
    int _1282 = int(_1278) & 3;
    float _1284 = (*spvDescriptorSet0.vp_c15)._m0[int(_1280)][_1282];
    int _1286 = int(_1278) + 1;
    uint _1288 = uint(int(uint(_1286) >> uint(2)));
    int _1290 = _1286 & 3;
    float _1292 = (*spvDescriptorSet0.vp_c15)._m0[int(_1288)][_1290];
    float _1294 = _523 + _1272;
    float _1296 = _1274 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1298 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1300 = _1242 + _1298;
    int _1302 = _1300 + 1;
    float _1304 = trunc(_1296);
    int _1306 = int(_1304);
    int _1308 = _1173 + 96;
    uint _1310 = uint(int(uint(_1308) >> uint(2)));
    uint _1312 = uint(int(uint(int(_1310)) >> uint(2)));
    int _1314 = int(_1310) & 3;
    float _1316 = (*spvDescriptorSet0.vp_c15)._m0[int(_1312)][_1314];
    int _1318 = int(_1310) + 1;
    uint _1320 = uint(int(uint(_1318) >> uint(2)));
    int _1322 = _1318 & 3;
    float _1324 = (*spvDescriptorSet0.vp_c15)._m0[int(_1320)][_1322];
    bool _1326 = _1270 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1328 = _1173 + 104;
    uint _1330 = uint(int(uint(_1328) >> uint(2)));
    uint _1332 = uint(int(uint(int(_1330)) >> uint(2)));
    int _1334 = int(_1330) & 3;
    float _1336 = (*spvDescriptorSet0.vp_c15)._m0[int(_1332)][_1334];
    int _1338 = int(_1330) + 1;
    uint _1340 = uint(int(uint(_1338) >> uint(2)));
    int _1342 = _1338 & 3;
    float _1344 = (*spvDescriptorSet0.vp_c15)._m0[int(_1340)][_1342];
    int _1346 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1348 = _1306 + _1346;
    int _1350 = _1348 + 1;
    float _1352 = _1294;
    float _1354 = _1200;
    int _1356 = _1350;
    float _1358 = as_type<float>(_1165);
    if (!_1326)
    {
        _1163 = _1202;
    }
    float _1360 = _1163;
    bool _1362 = !_1326;
    float _1364 = _1360;
    int _1366 = as_type<int>(_1324);
    int _1368 = as_type<int>(_1226);
    if (!_1362)
    {
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1374 = _1270 + _1372;
        float _1376 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1378 = rsqrt(_1244);
        float _1380 = _1374 * _1370;
        float _1382 = _1380 * 0.15915493667125701904296875;
        float _1384 = _1382 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        float _1388 = _1382 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        float _1392 = _1386 + (-1.0);
        float _1394 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = fma(_1390, _1376, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1398 = fma(_1294, _1386, _1394);
        float _1400 = _1378 * _1396;
        float _1402 = fma(_1214, _1400, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1404 = fma(_1210, _1400, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1352 = _1398;
        _1364 = _1402;
        _1354 = _1404;
    }
    float _1406 = _1352;
    float _1408 = _1364;
    float _1410 = _1354;
    float _1412 = -_523;
    float _1414 = _1412 + _1406;
    int _1416 = _1173 + 80;
    uint _1418 = uint(int(uint(_1416) >> uint(2)));
    uint _1420 = uint(int(uint(int(_1418)) >> uint(2)));
    int _1422 = int(_1418) & 3;
    float _1424 = (*spvDescriptorSet0.vp_c15)._m0[int(_1420)][_1422];
    int _1426 = int(_1418) + 1;
    uint _1428 = uint(int(uint(_1426) >> uint(2)));
    int _1430 = _1426 & 3;
    float _1432 = (*spvDescriptorSet0.vp_c15)._m0[int(_1428)][_1430];
    float _1434 = -_387;
    float _1436 = _1434 + _1408;
    bool _1438 = _1302 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1440 = _1414 * _1414;
    int _1442 = _1302 | _1350;
    float _1444 = -_389;
    float _1446 = _1444 + _1410;
    float _1448 = fma(_1436, _1436, _1440);
    bool _1450 = _1442 < 0;
    bool _1452 = _1450 || _1438;
    bool _1454 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1456 = isnan(0.5);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1462 = _1458 || _1460;
    float _1464 = fma(_1446, _1446, _1448);
    float _1466 = _1159 * _1324;
    bool _1468 = _1350 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1470 = _1468 || _1452;
    float _1472 = sqrt(_1464);
    float _1474 = fma(_387, _1316, _1466);
    float _1476 = _1159 * _1198;
    float _1478 = _1159 * _1266;
    float _1480 = fma(_389, _1336, _1474);
    float _1482 = fma(_387, _1190, _1476);
    float _1484 = fma(_387, _1258, _1478);
    float _1486 = _1480 + _1344;
    float _1488 = fma(_389, _1226, _1482);
    int _1490 = as_type<int>(_1478);
    int _1492 = as_type<int>(_1484);
    float _1494 = _1408;
    float _1496 = _1406;
    float _1498 = _1410;
    float _1500 = _1488;
    if (!_1470)
    {
        int _1502 = _1350 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1504 = _1502 + _1302;
        _1356 = _1504;
    }
    int _1506 = _1356;
    float _1508 = _1266;
    if (!_1470)
    {
        float _1510 = floor(_1216);
        _1508 = _1510;
    }
    float _1512 = _1508;
    float _1514 = fma(_389, _1284, _1484);
    bool _1516 = _1472 > 0.0;
    float _1518 = _1514 + _1292;
    if (!_1470)
    {
        int _1520 = _1506 << 2;
        _1366 = _1520;
    }
    int _1522 = _1366;
    float _1524 = 1.0 / _1486;
    if (!_1470)
    {
        uint _1526 = uint(int(uint(_1506) >> uint(2)));
        _1490 = int(_1526);
    }
    int _1528 = _1490;
    float _1530 = as_type<float>(_1528);
    if (!_1470)
    {
        int _1532 = 12 & _1522;
        _1368 = _1532;
    }
    int _1534 = _1368;
    float _1536 = _1488 + _1234;
    if (!_1470)
    {
        int _1538 = _1528 << 4;
        int _1540 = _1538 + _1534;
        _1492 = _1540;
    }
    int _1542 = _1492;
    bool _1544 = !_1516;
    float _1546 = _1512;
    if (!_1544)
    {
        float _1548 = _293 * _293;
        float _1550 = fma(_285, _285, _1548);
        float _1552 = rsqrt(_1464);
        float _1554 = fma(_313, _313, _1550);
        float _1556 = sqrt(_1554);
        float _1558 = _1436 * _1552;
        float _1560 = _1414 * _1552;
        float _1562 = _1446 * _1552;
        bool _1564 = _1556 > 0.0;
        bool _1566 = !_1564;
        _1530 = _1554;
        _1500 = _1552;
        if (!_1566)
        {
            float _1568 = rsqrt(_1554);
            float _1570 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1572 = _293 * _1568;
            float _1574 = _285 * _1568;
            float _1576 = _313 * _1568;
            float _1578 = _1560 * _1572;
            float _1580 = fma(_1558, _1574, _1578);
            float _1582 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1584 = fma(_1562, _1576, _1580);
            float _1586 = _1584 * _1582;
            float _1588 = fma(_285, _1586, _1408);
            float _1590 = fma(_293, _1586, _1406);
            float _1592 = fma(_313, _1586, _1410);
            _1494 = _1588;
            _1496 = _1590;
            _1498 = _1592;
            _1500 = _1586;
        }
    }
    float _1594 = _1494;
    float _1596 = _1496;
    float _1598 = _1498;
    float _1600 = _1530;
    float _1602 = _1500;
    float _1604 = _1602;
    float _1606 = _1600;
    if (_1462)
    {
        _1604 = _1594;
    }
    float _1608 = _1604;
    float _1610 = _1608;
    if (_1462)
    {
        _1606 = _1596;
    }
    float _1612 = _1606;
    float _1614 = _1612;
    if (_1462)
    {
        _329 = _1598;
    }
    float _1616 = _329;
    float _1618 = _1616;
    if (!_1462)
    {
        float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1622 = _523 + _1620;
        float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1626 = _387 + _1624;
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1630 = -_389;
        float _1632 = _1630 + _1598;
        float _1634 = _1622 * _1622;
        float _1636 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1638 = _389 + _1636;
        float _1640 = fma(_1626, _1626, _1634);
        float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1644 = fma(_1638, _1638, _1640);
        float _1646 = sqrt(_1644);
        float _1648 = _1628 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1650 = -_523;
        float _1652 = _1650 + _1596;
        float _1654 = precise::min(_1646, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1656 = _1654 * _1642;
        float _1658 = _1648 * _1656;
        float _1660 = -_387;
        float _1662 = _1660 + _1594;
        float _1664 = fma(_1652, _1658, _523);
        float _1666 = fma(_1662, _1658, _387);
        float _1668 = fma(_1632, _1658, _389);
        _1614 = _1664;
        _1610 = _1666;
        _1618 = _1668;
        _331 = _1658;
    }
    float _1670 = _1614;
    float _1672 = _1610;
    float _1674 = _1618;
    float _1676 = _331;
    int _1678 = _1173 + 88;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    uint _1682 = uint(int(uint(int(_1680)) >> uint(2)));
    int _1684 = int(_1680) & 3;
    float _1686 = (*spvDescriptorSet0.vp_c15)._m0[int(_1682)][_1684];
    int _1688 = int(_1680) + 1;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    int _1692 = _1688 & 3;
    float _1694 = (*spvDescriptorSet0.vp_c15)._m0[int(_1690)][_1692];
    float _1696 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1698 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1700 = _1518 * _1524;
    float _1702 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1704 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1696);
    float _1706 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1698);
    float _1708 = _1536 * _1524;
    float _1710 = _1446;
    if (!_1470)
    {
        int _1712 = _1542 + 400;
        uint _1714 = uint(int(uint(_1712) >> uint(2)));
        uint _1716 = uint(int(uint(int(_1714)) >> uint(2)));
        int _1718 = int(_1714) & 3;
        float _1720 = (*spvDescriptorSet0.vp_c15)._m0[int(_1716)][_1718];
        _1710 = _1720;
    }
    float _1722 = _1710;
    float _1724 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1702);
    float _1726 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1704);
    float _1728 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1706);
    float _1730 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1732 = _1708 >= 0.0;
    float _1734 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1724);
    float _1736 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1738 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1740 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1730);
    bool _1742 = _1708 <= 1.0;
    bool _1744 = _1742 && _1732;
    float _1746 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1748 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1750 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1752 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1754 = _1700 >= 0.0;
    bool _1756 = _1754 && _1744;
    float _1758 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1748);
    float _1760 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1740);
    float _1762 = -_1752;
    float _1764 = fma(_1762, _1750, 1.0);
    bool _1766 = _1700 <= 1.0;
    bool _1768 = _1766 && _1756;
    float _1770 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1758);
    float _1772 = _1760 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1774 = log2(_1764);
    float _1776 = _1159 * _1432;
    float _1778 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1780 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1770);
    float _1782 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1784 = fma(_387, _1424, _1776);
    float _1786 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1778);
    float _1788 = _1776;
    if (!_1470)
    {
        float _1790 = -_1512;
        float _1792 = _1216 + _1790;
        _1546 = _1792;
    }
    float _1794 = _1546;
    float _1796 = _1676;
    if (!_1470)
    {
        float _1798 = floor(_1296);
        _1796 = _1798;
    }
    float _1800 = _1796;
    float _1802 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1782);
    if (_1768)
    {
        float _1804 = float(_1165);
        _1358 = _1804;
    }
    float _1806 = _1358;
    float _1808 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1786);
    float _1810 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1802);
    float _1812 = 1.0 / _1780;
    float _1814 = fma(_389, _1686, _1784);
    float _1816 = _1814 + _1694;
    float _1818 = _1774 * 0.693147182464599609375;
    float _1820 = _1778;
    if (_1768)
    {
        float _1822 = rint(_1806);
        float _1824 = precise::max(_1822, 0.0);
        uint _1826 = uint(_1824);
        uint _1828 = clamp(_1826, 0u, 65535u);
        _1820 = as_type<float>(_1828);
    }
    float _1830 = _1820;
    if (!_1470)
    {
        float _1832 = -_1800;
        float _1834 = _1296 + _1832;
        _1788 = _1834;
    }
    float _1836 = _1788;
    float _1838 = _1816 * _1524;
    float _1840 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1808);
    float _1842 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1810);
    float _1844 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1846 = _1524;
    if (!_1470)
    {
        float _1848 = rint(_1722);
        float _1850 = precise::max(_1848, 0.0);
        uint _1852 = uint(_1850);
        uint _1854 = clamp(_1852, 0u, 65535u);
        _1846 = as_type<float>(_1854);
    }
    float _1856 = _1846;
    float _1858 = _1840 * _1812;
    float _1860 = _1842 * _1812;
    float _1862 = fma(_1858, 0.5, 0.5);
    float _1864 = fma(_1860, -0.5, 0.5);
    float _1866 = _1700;
    if (_1768)
    {
        float3 _6132 = float3(_1708, _1700, float(as_type<int>(_1830)));
        float3 _6136 = select(_6132, float3(0.0), isnan(_6132));
        float _1868 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6136.xy, uint(rint(_6136.z)), _1838, level(0.0));
        _1866 = _1868;
    }
    float _1870 = _1866;
    float3 _6146 = float3(_1862, _1864, _1844);
    float _1872 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6146, float3(0.0), isnan(_6146)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6146, float3(0.0), isnan(_6146)), level(0.0)).x;
    float3 _6155 = float3(_1862, _1864, _1844);
    float4 _1875 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6155, float3(0.0), isnan(_6155)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6155, float3(0.0), isnan(_6155)), level(0.0)).xyzw;
    float _1877 = _1875.x;
    float _1879 = _1875.y;
    float _1881 = _1875.z;
    float _1883 = _1875.w;
    float _1885 = _1764;
    if (!_1470)
    {
        float3 _6178 = float3(_1794, _1836, float(as_type<int>(_1856)));
        float3 _6180 = select(_6178, float3(0.0), isnan(_6178));
        float _1887 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6180.xy, uint(rint(_6180.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6180.xy, uint(rint(_6180.z)), level(0.0)).x;
        _1885 = _1887;
    }
    float _1889 = _1885;
    float _1891 = float(uint(_753));
    float _1893 = trunc(_847);
    int _1895 = int(_1893);
    float _1897 = 1.0 / _1891;
    float _1899 = float(uint(_1895));
    int _1901 = as_type<int>(_1897) + (-2);
    float _1903 = as_type<float>(_1901) * _1899;
    float _1905 = trunc(_1903);
    float _1907 = precise::max(_1905, 0.0);
    uint _1909 = uint(_1907);
    int _1911 = ~_753;
    int _1913 = _1911 + 1;
    int _1915 = ~_753;
    int _1917 = _1915 + 1;
    int _1919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1921 = _1919 != 0;
    bool _1923 = !_1921;
    float _1925 = _1923 ? 7.345489978790283203125 : 1.0;
    int _1927 = _1913 * int(_1909);
    int _1929 = _1927 + _1895;
    float _1931 = _1925 * _177;
    float _1933 = float(uint(_1929));
    float _1935 = floor(_1931);
    float _1937 = as_type<float>(_1901) * _1933;
    float _1939 = trunc(_1937);
    float _1941 = precise::max(_1939, 0.0);
    uint _1943 = uint(_1941);
    float _1945 = -_1935;
    float _1947 = _1931 + _1945;
    int _1949 = int(_1909) + int(_1943);
    float _1951 = as_type<float>(_1943);
    float _1953 = _1903;
    if (_1470)
    {
        _1951 = 1.0;
    }
    float _1955 = _1951;
    int _1957 = _1917 * _1949;
    int _1959 = _1957 + _1895;
    bool _1961 = uint(_1959) >= uint(_753);
    float _1963 = _1955;
    if (!_1470)
    {
        int _1965 = _1506 << 4;
        int _1967 = _1965 + 2048;
        uint _1969 = uint(int(uint(_1967) >> uint(2)));
        uint _1971 = uint(int(uint(int(_1969)) >> uint(2)));
        int _1973 = int(_1969) & 3;
        float _1975 = (*spvDescriptorSet0.vp_c15)._m0[int(_1971)][_1973];
        int _1977 = int(_1969) + 1;
        uint _1979 = uint(int(uint(_1977) >> uint(2)));
        int _1981 = _1977 & 3;
        float _1983 = (*spvDescriptorSet0.vp_c15)._m0[int(_1979)][_1981];
        int _1985 = _1967 + 8;
        uint _1987 = uint(int(uint(_1985) >> uint(2)));
        uint _1989 = uint(int(uint(int(_1987)) >> uint(2)));
        int _1991 = int(_1987) & 3;
        float _1993 = (*spvDescriptorSet0.vp_c15)._m0[int(_1989)][_1991];
        int _1995 = int(_1987) + 1;
        uint _1997 = uint(int(uint(_1995) >> uint(2)));
        int _1999 = _1995 & 3;
        float _2001 = (*spvDescriptorSet0.vp_c15)._m0[int(_1997)][_1999];
        float _2003 = _1159 * _1983;
        float _2005 = fma(_387, _1975, _2003);
        float _2007 = fma(_389, _1993, _2005);
        float _2009 = _2007 + _2001;
        float _2011 = precise::clamp(_2009, 0.0, 1.0);
        float _2013 = -_2011;
        float _2015 = _2013 + _1889;
        float _2017 = fma(_2015, 500.0, 1.5);
        float _2019 = exp2(_2017);
        float _2021 = 0.0 + _2019;
        float _2023 = precise::clamp(_2021, 0.0, 1.0);
        _1963 = _2023;
    }
    float _2025 = _1963;
    float _2027 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2029 = _1670 + _2027;
    float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2033 = _1672 + _2031;
    float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2037 = _1674 + _2035;
    float _2039 = _2029 * _2029;
    float _2041 = fma(_2033, _2033, _2039);
    float _2043 = fma(_2037, _2037, _2041);
    float _2045 = rsqrt(_2043);
    float _2047 = sqrt(_2043);
    float _2049 = _2033 * _2045;
    float _2051 = _2037 * _2045;
    float _2053 = _2029 * _2045;
    float _2055 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2057 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2059 = _2055 * _2055;
    float _2061 = _2057 * _2057;
    float _2063 = _2059 + _2061;
    float _2065 = sqrt(_2063);
    bool _2067 = _2065 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2071 = _2065 + _2069;
    float _2073 = as_type<float>(_1909);
    float _2075 = _2063;
    float _2077 = _2071;
    float _2079 = _2055;
    float _2081 = _2057;
    float _2083 = _2059;
    float _2085 = _2061;
    if (_2067)
    {
        float _2087 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2073 = _2087;
    }
    float _2089 = _2073;
    if (_2067)
    {
        float _2091 = rsqrt(_2063);
        _2075 = _2091;
    }
    float _2093 = _2075;
    if (_2067)
    {
        float _2095 = _2071 * _2089;
        _2077 = _2095;
    }
    float _2097 = _2077;
    float _2099 = 0.0;
    if (_2067)
    {
        float _2101 = _2097 * 0.15915493667125701904296875;
        _2099 = _2101;
    }
    float _2103 = _2099;
    float _2105 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2107 = _1844;
    if (_2067)
    {
        float _2109 = _2103 * 6.283185482025146484375;
        float _2111 = sin(_2109);
        _2107 = _2111;
    }
    float _2113 = _2107;
    float _2115 = precise::max(0.0, _2105);
    float _2117 = _2097;
    float _2119 = _2115;
    if (_2067)
    {
        float _2121 = _2103 * 6.283185482025146484375;
        float _2123 = cos(_2121);
        _2117 = _2123;
    }
    float _2125 = _2117;
    float _2127 = -_2053;
    float _2129 = -_2115;
    float _2131 = fma(_2127, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2129);
    float _2133 = _2131;
    if (_2067)
    {
        float _2135 = _2131 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2119 = _2135;
    }
    float _2137 = _2119;
    float _2139 = _2137;
    if (_2067)
    {
        float _2141 = fma(_2113, _2137, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1953 = _2141;
    }
    float _2143 = _1953;
    float _2145 = _2143;
    if (_2067)
    {
        float _2147 = _2093 * _2143;
        _2145 = _2147;
    }
    float _2149 = _2145;
    if (_2067)
    {
        float _2151 = _2125 + (-1.0);
        _2139 = _2151;
    }
    float _2153 = _2139;
    float _2155 = _2153;
    if (_2067)
    {
        float _2157 = _2055 * _2149;
        _2079 = _2157;
    }
    float _2159 = _2079;
    if (_2067)
    {
        float _2161 = _2057 * _2149;
        _2081 = _2161;
    }
    float _2163 = _2081;
    if (_2067)
    {
        float _2165 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2155 = _2165;
    }
    float _2167 = _2155;
    if (_2067)
    {
        float _2169 = _2159 * _2159;
        _2083 = _2169;
    }
    float _2171 = _2083;
    if (_2067)
    {
        float _2173 = _2163 * _2163;
        _2085 = _2173;
    }
    float _2175 = _2085;
    if (_2067)
    {
        float _2177 = fma(_2131, _2125, _2167);
        _2133 = _2177;
    }
    float _2179 = _2133;
    float _2181 = fma(_2179, _2179, _2171);
    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2185 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2183);
    float _2187 = precise::clamp(_2185, 0.0, 1.0);
    float _2189 = _2181 + _2175;
    float _2191 = -_2187;
    float _2193 = _2191 + 1.0;
    float _2195 = rsqrt(_2189);
    float _2197 = _2195 * _2159;
    float _2199 = _2195 * _2179;
    float _2201 = _2195 * _2163;
    float _2203 = float(_1895);
    float _2205 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2207 = abs(_2193);
    float _2209 = log2(_2207);
    float _2211 = -_2205;
    float _2213 = fma(_2199, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2211);
    float _2215 = -_2201;
    float _2217 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2213);
    float _2219 = 1.0 / _363;
    float _2221 = fma(_2217, -0.5, 0.5);
    float _2223 = fma(_2217, 0.5, 0.5);
    float _2225 = fma(_2223, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2227 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2229 = sqrt(_2221);
    float _2231 = fma(_2223, _2225, -0.212114393711090087890625);
    float _2233 = _2199 + 1.0;
    float _2235 = fma(_2223, _2231, 1.570728778839111328125);
    bool _2237 = _2203 >= _829;
    bool _2239 = isnan(_2203);
    bool _2241 = _2237 || _2239;
    bool _2243 = isnan(_829);
    bool _2245 = _2241 || _2243;
    float _2247 = float(_2245);
    float _2249 = exp2(_2227);
    float _2251 = _2229 * 0.636619746685028076171875;
    float _2253 = trunc(_2247);
    int _2255 = int(_2253);
    float _2257 = -_2235;
    float _2259 = fma(_2251, _2257, 1.0);
    float _2261 = -_2199;
    float _2263 = fma(_2249, _2233, _2261);
    bool _2265 = !_1961;
    int _2267 = _2265 ? 0 : (-1);
    float _2269 = fma(_2263, 0.5, 0.5);
    float2 _6748 = float2(_2259, _2269);
    float3 _2273 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6748, float2(0.0), isnan(_6748)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6748, float2(0.0), isnan(_6748)), level(0.0)).xyz;
    float _2275 = _2273.x;
    float _2277 = _2273.y;
    float _2279 = _2273.z;
    int _2281 = ~_1949;
    int _2283 = _2281 + _2267;
    int _2285 = _2283 + 1;
    float _2287 = _1947 * _829;
    bool _2289 = _753 == 0;
    float _2291 = _845 * _2219;
    int _2293 = _753 * _2285;
    int _2295 = _2293 + _1895;
    int _2297 = ~_2255;
    int _2299 = _2297 + 1;
    int _2301 = _2299 + 1;
    float _2303 = trunc(_2287);
    int _2305 = int(_2303);
    int _2307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2309 = _2307 != 0;
    float _2311 = -_841;
    float _2313 = _2311 + 1.0;
    bool _2315 = !_2289;
    int _2317 = _2315 ? _2295 : (-1);
    float _2319 = -_853;
    float _2321 = _2319 + 1.0;
    int _2323 = _753 + (-1);
    float _2325 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2327 = !_2309;
    int _2329 = _2327 ? 0 : 1;
    float _2331 = trunc(_2291);
    int _2333 = int(_2331);
    int _2335 = _2317 * _2301;
    int _2337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2339 = _2337 != 0;
    float _2341 = -_407;
    float _2343 = _2341 + 1.0;
    int _2345 = abs(_743);
    int _2347 = _2255 * _2323;
    int _2349 = _2347 + _2335;
    int _2351 = abs(_765);
    out.m_80.x = _1672;
    out.m_80.y = _1670;
    out.m_80.z = _1674;
    float _2353 = exp2(_2325);
    int _2355 = abs(_2329);
    bool _2357 = !_2339;
    int _2359 = _2357 ? 0 : 1;
    int _2361 = abs(_773);
    int _2363 = _2349 * _2345;
    int _2365 = ~_753;
    int _2367 = _2365 + 1;
    int _2369 = _2305 * _2355;
    int _2371 = _2369 + _1895;
    int _2373 = abs(_2359);
    int _2375 = _2333 * _2351;
    int _2377 = _2375 + _2363;
    int _2379 = ~_753;
    int _2381 = _2379 + 1;
    bool _2383 = _177 > 0.5;
    int _2385 = _2371 * _2361;
    int _2387 = _2385 + _2377;
    int _2389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2391 = _2389 != 0;
    float _2393 = -_2353;
    float _2395 = _2393 + 1.0;
    int _2397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2399 = _2397 != 0;
    int _2401 = _2305 * _2373;
    int _2403 = _2401 + _2387;
    int _2405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2407 = _2405 != 0;
    float _2409 = _2395 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2411 = ~_753;
    int _2413 = _2411 + 1;
    float _2415 = float(uint(_2403));
    float _2417 = _2409 * _1872;
    float _2419 = as_type<float>(_1901) * _2415;
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2423 = trunc(_2419);
    float _2425 = precise::max(_2423, 0.0);
    uint _2427 = uint(_2425);
    float _2429 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2431 = float(uint(_2371));
    float _2433 = as_type<float>(_1901) * _2431;
    int _2435 = _2367 * int(_2427);
    int _2437 = _2435 + _2403;
    float _2439 = trunc(_2433);
    float _2441 = precise::max(_2439, 0.0);
    uint _2443 = uint(_2441);
    float _2445 = float(uint(_2437));
    float _2447 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2449 = as_type<float>(_1901) * _2445;
    float _2451 = _2447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2453 = trunc(_2449);
    float _2455 = precise::max(_2453, 0.0);
    uint _2457 = uint(_2455);
    int _2459 = int(_2427) + int(_2457);
    int _2461 = _2381 * _2459;
    int _2463 = _2461 + _2403;
    bool _2465 = uint(_2463) >= uint(_753);
    float _2467 = -_321;
    int _2469 = _2383 ? as_type<int>(_2467) : as_type<int>(_321);
    bool _2471 = !_2465;
    int _2473 = _2471 ? 0 : (-1);
    bool _2475 = _409 > 0.5;
    int _2477 = ~_2459;
    int _2479 = _2477 + _2473;
    int _2481 = _2479 + 1;
    float _2483 = -_233;
    int _2485 = _2475 ? as_type<int>(_2483) : as_type<int>(_233);
    bool _2487 = !_2399;
    float _2489 = _2487 ? _321 : as_type<float>(_2469);
    int _2491 = _753 * _2481;
    int _2493 = _2491 + _2403;
    bool _2495 = !_2391;
    float _2497 = _2495 ? _233 : as_type<float>(_2485);
    int _2499 = _2413 * int(_2443);
    int _2501 = _2499 + _2371;
    float _2503 = _2489 + 0.5;
    float _2505 = _2497 + (-0.5);
    float _2507 = float(uint(_2501));
    float _2509 = fma(_2503, (*spvDescriptorSet0.vp_c9)._m0[80].x, _835);
    float _2511 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2513 = -_2505;
    float _2515 = -_849;
    float _2517 = fma(_2513, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2515);
    bool _2519 = !_2289;
    int _2521 = _2519 ? _2493 : (-1);
    float _2523 = -_2313;
    float _2525 = fma(_2489, _2523, _2509);
    float _2527 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2529 = _2511 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2531 = _2521 >> 31;
    float _2533 = as_type<float>(_1901) * _2507;
    float _2535 = fma(_2497, _2321, _2517);
    int _2537 = _2531 & 3;
    out.m_82.x = _2451;
    out.m_82.y = _2429;
    out.m_82.z = _2529;
    out.m_82.w = _2527;
    float _2539 = trunc(_2533);
    float _2541 = precise::max(_2539, 0.0);
    uint _2543 = uint(_2541);
    int _2545 = _2521 + _2537;
    out.m_84.x = _2525;
    out.m_84.y = _2535;
    int _2547 = ~_753;
    int _2549 = _2547 + 1;
    float _2551 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2553 = _2545 >> 2;
    float _2555 = _233 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2557 = _2521 & 3;
    bool _2559 = _2557 != 0;
    float _2561 = abs(_1103);
    float _2563 = log2(_2561);
    int _2565 = _2553 << 4;
    int _2567 = _2565 + 368;
    float _2569 = -_1089;
    float _2571 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2551);
    float _2573 = _321 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _2575 = uint(int(uint(_2567) >> uint(2)));
    uint _2577 = uint(int(uint(int(_2575)) >> uint(2)));
    int _2579 = int(_2575) & 3;
    float _2581 = (*spvDescriptorSet0.vp_c9)._m0[int(_2577)][_2579];
    int _2583 = int(_2575) + 1;
    uint _2585 = uint(int(uint(_2583) >> uint(2)));
    int _2587 = _2583 & 3;
    float _2589 = (*spvDescriptorSet0.vp_c9)._m0[int(_2585)][_2587];
    float _2591 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2595 = int(_2443) + int(_2543);
    float _2597 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2599 = _2591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2601 = _2593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2603 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2605 = _2597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2607 = _2549 * _2595;
    int _2609 = _2607 + _2371;
    float _2611 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2613 = -_1089;
    float _2615 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2603);
    float _2617 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_86.x = _2599;
    out.m_86.y = _2601;
    out.m_86.z = _2605;
    bool _2619 = uint(_2609) >= uint(_753);
    float _2621 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2623 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2625 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2627 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2571);
    float _2629 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2611);
    float _2631 = exp2(_2623);
    float _2633 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2635 = _1103 <= 8000.0;
    bool _2637 = isnan(_1103);
    bool _2639 = _2635 || _2637;
    bool _2641 = isnan(8000.0);
    bool _2643 = _2639 || _2641;
    float _2645 = float(_2643);
    int _2647 = _2521 & 3;
    bool _2649 = _2647 != 0;
    int _2651 = _2567 + 8;
    uint _2653 = uint(int(uint(_2651) >> uint(2)));
    uint _2655 = uint(int(uint(int(_2653)) >> uint(2)));
    int _2657 = int(_2653) & 3;
    float _2659 = (*spvDescriptorSet0.vp_c9)._m0[int(_2655)][_2657];
    int _2661 = int(_2653) + 1;
    uint _2663 = uint(int(uint(_2661) >> uint(2)));
    int _2665 = _2661 & 3;
    float _2667 = (*spvDescriptorSet0.vp_c9)._m0[int(_2663)][_2665];
    int _2669 = _2559 ? 0 : 1;
    bool _2671 = uint(_2647) > 1u;
    float _2673 = -_1089;
    float _2675 = fma(_2673, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2625);
    int _2677 = ~_2669;
    int _2679 = _2677 + 1;
    int _2681 = _2679 + 1;
    float _2683 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2615);
    bool _2685 = uint(_2647) >= 2u;
    float _2687 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2675);
    float _2689 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2617);
    float _2691 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2693 = _2685 ? 0 : 1;
    float _2695 = fma(_2631, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2697 = precise::clamp(_2695, 0.0, 1.0);
    float _2699 = _2555 * _2683;
    float _2701 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2621);
    int _2703 = ~_2693;
    int _2705 = _2703 + 1;
    int _2707 = _2705 + 1;
    int _2709 = _2681;
    int _2711 = _2707;
    if (!_2671)
    {
        int _2713 = ~_2669;
        int _2715 = _2713 + 1;
        _2709 = _2715;
    }
    int _2717 = _2709;
    float _2719 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2721 = _2647 != 3;
    float _2723 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2633);
    int _2725 = abs(_2717);
    float _2727 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2719);
    bool _2729 = !_2649;
    int _2731 = _2729 ? 0 : 1;
    float _2733 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2691);
    int _2735 = ~_2725;
    int _2737 = _2735 + 1;
    int _2739 = _2737 + 1;
    float _2741 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2727);
    bool _2743 = _2647 != 3;
    float _2745 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2723);
    int _2747 = abs(_2731);
    int _2749 = _2739 * as_type<int>(_2589);
    bool _2751 = !_2743;
    int _2753 = _2751 ? 0 : (-1);
    float _2755 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2733);
    if (_2721)
    {
        int _2757 = ~_2693;
        int _2759 = _2757 + 1;
        _2711 = _2759;
    }
    int _2761 = _2711;
    bool _2763 = !_2407;
    int _2765 = _2763 ? 0 : 1;
    int _2767 = abs(_2761);
    int _2769 = ~_2747;
    int _2771 = _2769 + 1;
    int _2773 = _2771 + 1;
    int _2775 = abs(_2753);
    int _2777 = _2773 * as_type<int>(_2581);
    int _2779 = _2777 + _2749;
    bool _2781 = !_2619;
    int _2783 = _2781 ? 0 : (-1);
    int _2785 = abs(_2765);
    int _2787 = ~_2767;
    int _2789 = _2787 + 1;
    int _2791 = _2789 + 1;
    int _2793 = ~_2595;
    int _2795 = _2793 + _2783;
    int _2797 = _2795 + 1;
    int _2799 = _2791 * as_type<int>(_2659);
    int _2801 = _2799 + _2779;
    int _2803 = ~_2775;
    int _2805 = _2803 + 1;
    int _2807 = _2805 + 1;
    int _2809 = _753 * _2797;
    int _2811 = _2809 + _2371;
    int _2813 = ~_2785;
    int _2815 = _2813 + 1;
    int _2817 = _2815 + 1;
    int _2819 = _2807 * as_type<int>(_2667);
    int _2821 = _2819 + _2801;
    float _2823 = _2555 * _2627;
    float _2825 = _2555 * _2687;
    bool _2827 = !_2289;
    int _2829 = _2827 ? _2811 : (-1);
    int _2831 = _2821 * _2817;
    float _2833 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2629);
    float _2835 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2689);
    int _2837 = _2829 * _2785;
    int _2839 = _2837 + _2831;
    float _2841 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2701);
    float _2843 = fma(_2697, -2.0, 3.0);
    float _2845 = _2697 * _2697;
    float _2847 = fma(_2573, _2835, _2699);
    float _2849 = fma(_2573, _2841, _2825);
    float _2851 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2853 = _2845 * _2843;
    float _2855 = fma(_2573, _2833, _2823);
    float _2857 = float(_2839);
    float _2859 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2851);
    float _2861 = -_2853;
    float _2863 = _2861 + 1.0;
    float _2865 = _2741 + _2855;
    float _2867 = _2755 + _2849;
    float _2869 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2859);
    float _2871 = fma(_2863, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2853);
    out.m_88.x = _2857;
    float _2873 = _2745 + _2847;
    float _2875 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2869);
    float _2877 = _2645 * _2871;
    float _2879 = _1883 * _2417;
    float _2881 = _2875 + _1780;
    float _2883 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2885 = _2857;
    float _2887 = _2881;
    if (!_1768)
    {
        _2885 = 1.0;
    }
    float _2889 = _2885;
    out.m_90.x = _2865;
    out.m_90.y = _2873;
    out.m_90.z = _2867;
    float _2891 = _2889;
    if (_1768)
    {
        bool _2893 = _1870 >= _1838;
        bool _2895 = isnan(_1870);
        bool _2897 = _2893 || _2895;
        bool _2899 = isnan(_1838);
        bool _2901 = _2897 || _2899;
        float _2903 = float(_2901);
        _2891 = _2903;
    }
    float _2905 = _2891;
    float _2907 = _2343 * _2883;
    float _2909 = precise::clamp(_2907, 0.0, 1.0);
    float _2911 = _2881 * 0.5;
    float _2913 = -_2409;
    float _2915 = _2913 + 1.0;
    float _2917 = _2905 * _2025;
    float _2919 = -_2909;
    float _2921 = fma(_2919, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_92.z = _2911;
    out.m_92.w = _1780;
    float _2923 = _1883 * _2915;
    bool _2925 = _2047 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2927 = isnan(_2047);
    bool _2929 = _2925 || _2927;
    bool _2931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2933 = _2929 || _2931;
    float _2935 = -_2917;
    float _2937 = fma(_2935, _2921, 1.0);
    float _2939 = precise::clamp(_2937, 0.0, 1.0);
    out.gl_Position.x = _1840;
    out.gl_Position.y = _1842;
    out.gl_Position.z = _2875;
    out.gl_Position.w = _1780;
    float _2941 = _2279 * _2417;
    float _2943 = fma(_2275, _2879, _1877);
    float _2945 = fma(_2277, _2879, _1879);
    float _2947 = _2939 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2949 = fma(_1883, _2941, _1881);
    out.m_94.x = _2947;
    float _2951 = _2911;
    float _2953 = _2915;
    float _2955 = _2917;
    float _2957 = _2909;
    float _2959 = _2939;
    if (!_2933)
    {
        _2951 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2961 = _2951;
    float _2963 = _2961;
    float _2965 = _2961;
    if (!_2933)
    {
        _2953 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2967 = _2953;
    out.m_96.x = _2943;
    out.m_96.y = _2945;
    out.m_96.z = _2949;
    out.m_96.w = _2923;
    float _2969 = _2967;
    float _2971 = _2967;
    if (!_2933)
    {
        _2887 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2973 = _2887;
    float _2975 = _2973;
    float _2977 = _2973;
    if (!_2933)
    {
        _2955 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2979 = _2955;
    float _2981 = _2979;
    float _2983 = _2979;
    if (!_2933)
    {
        _2957 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2985 = _2957;
    float _2987 = _2985;
    float _2989 = _2985;
    if (!_2933)
    {
        _2959 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2991 = _2959;
    bool _2993 = !_2933;
    float _2995 = _2991;
    float _2997 = _2991;
    if (!_2993)
    {
        bool _2999 = _2047 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3001 = isnan(_2047);
        bool _3003 = _2999 || _3001;
        bool _3005 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3007 = _3003 || _3005;
        if (!_3007)
        {
            float _3009 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3011 = _2047 + _3009;
            float _3013 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3015 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3013;
            float _3017 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3019 = _3017 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3021 = 1.0 / _3015;
            float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3025 = _3023 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3027 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3029 = _3027 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3031 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3033 = _3031 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3037 = _3035 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3039 = _3011 * _3021;
            float _3041 = precise::clamp(_3039, 0.0, 1.0);
            float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3047 = fma(_3041, _3019, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3049 = fma(_3041, _3045, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3051 = fma(_3041, _3025, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3053 = fma(_3041, _3029, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3055 = fma(_3041, _3033, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3057 = fma(_3041, _3037, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2971 = _3051;
            _2989 = _3055;
            _2965 = _3047;
            _2983 = _3053;
            _2977 = _3049;
            _2997 = _3057;
            _3059 = true;
        }
        else
        {
            bool _3061 = _2047 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3063 = isnan(_2047);
            bool _3065 = _3061 || _3063;
            bool _3067 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3069 = _3065 || _3067;
            if (!_3069)
            {
                _2963 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3071 = _2963;
            _2965 = _3071;
            if (!_3069)
            {
                _2969 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3073 = _2969;
            _2971 = _3073;
            if (!_3069)
            {
                _2975 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3075 = _2975;
            _2977 = _3075;
            if (!_3069)
            {
                _2981 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3077 = _2981;
            _2983 = _3077;
            if (!_3069)
            {
                _2987 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3079 = _2987;
            _2989 = _3079;
            if (!_3069)
            {
                _2995 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3081 = _2995;
            bool _3083 = !_3069;
            _2997 = _3081;
            if (!_3083)
            {
                bool _3085 = _2047 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3087 = isnan(_2047);
                bool _3089 = _3085 || _3087;
                bool _3091 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3093 = _3089 || _3091;
                if (!_3093)
                {
                    float _3095 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3097 = _2047 + _3095;
                    float _3099 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3101 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3099;
                    float _3103 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3105 = _3103 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3107 = 1.0 / _3101;
                    float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3117 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3119 = _3117 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3123 = _3121 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3125 = _3097 * _3107;
                    float _3127 = precise::clamp(_3125, 0.0, 1.0);
                    float _3129 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3131 = _3129 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3133 = fma(_3127, _3105, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3135 = fma(_3127, _3131, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3137 = fma(_3127, _3111, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3139 = fma(_3127, _3115, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3141 = fma(_3127, _3119, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3143 = fma(_3127, _3123, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2971 = _3137;
                    _2989 = _3141;
                    _2965 = _3133;
                    _2983 = _3139;
                    _2977 = _3135;
                    _2997 = _3143;
                    _3059 = true;
                }
                else
                {
                    _2971 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2989 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2965 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2983 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2977 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2997 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3059 = false;
    float _3145 = _2971;
    float _3147 = _2989;
    float _3149 = _2965;
    float _3151 = _2983;
    float _3153 = _2977;
    float _3155 = _2997;
    float _3157 = fma(_2873, -0.5, 0.5);
    float _3159 = precise::clamp(_3157, 0.0, 1.0);
    float _3161 = -_3145;
    float _3163 = _3161 + _3147;
    float _3165 = -_3149;
    float _3167 = _3165 + _3151;
    float _3169 = -_3153;
    float _3171 = _3169 + _3155;
    bool _3173 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3175 = fma(_3159, _3163, _3145);
    float _3177 = fma(_3159, _3167, _3149);
    float _3179 = fma(_3159, _3171, _3153);
    float _3181 = _3175 * 0.586610972881317138671875;
    out.m_98.x = 0.0;
    float _3183 = fma(_3177, 0.298911988735198974609375, _3181);
    float _3185 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3187 = fma(_3179, 0.114477999508380889892578125, _3183);
    out.m_59.x = _3185;
    float _3189 = -_3187;
    float _3191 = _3177 + _3189;
    float _3193 = -_3187;
    float _3195 = _3175 + _3193;
    float _3197 = -_3187;
    float _3199 = _3179 + _3197;
    out.m_100.x = 0.0;
    float _3201 = fma(_3191, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3187);
    float _3203 = fma(_3195, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3187);
    float _3205 = fma(_3199, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3187);
    out.m_102.x = _3201;
    out.m_102.y = _3203;
    out.m_102.z = _3205;
    if (!_3173)
    {
        return out;
    }
    float _3207 = -_1670;
    float _3209 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3211 = -_1672;
    float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3215 = -_1674;
    float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3219 = _3209 * _3209;
    float _3221 = fma(_3213, _3213, _3219);
    float _3223 = fma(_3217, _3217, _3221);
    float _3225 = rsqrt(_3223);
    float _3227 = sqrt(_3223);
    float _3229 = _3209 * _3225;
    float _3231 = _3213 * _3225;
    float _3233 = _3217 * _3225;
    float _3235 = -_2053;
    float _3237 = _3235 + _3229;
    float _3239 = -_2049;
    float _3241 = _3239 + _3231;
    float _3243 = -_2051;
    float _3245 = _3243 + _3233;
    float _3247 = _3237 * _3237;
    float _3249 = -_3227;
    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3253 = fma(_3241, _3241, _3247);
    float _3255 = _3251 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3257 = precise::clamp(_3255, 0.0, 1.0);
    float _3259 = fma(_3245, _3245, _3253);
    float _3261 = abs(_3257);
    float _3263 = log2(_3261);
    float _3265 = rsqrt(_3259);
    float _3267 = _3263 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3269 = exp2(_3267);
    float _3271 = _3237 * _3265;
    float _3273 = _3241 * _3265;
    float _3275 = _3245 * _3265;
    float _3277 = _2873 * _3271;
    float _3279 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _3281 = precise::clamp(_3279, 0.0, 1.0);
    float _3283 = _2873 * _3229;
    float _3285 = fma(_2865, _3273, _3277);
    float _3287 = _3281 * _3281;
    float _3289 = fma(_2865, _3231, _3283);
    float _3291 = fma(_2867, _3275, _3285);
    float _3293 = precise::clamp(_3291, 0.0, 1.0);
    float _3295 = _3287 + (-1.0);
    float _3297 = fma(_2867, _3233, _3289);
    float _3299 = precise::clamp(_3297, 0.0, 1.0);
    float _3301 = _3293 * _3293;
    float _3303 = _3231 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3305 = fma(_3301, _3295, 1.0);
    float _3307 = -_3229;
    float _3309 = -_3303;
    float _3311 = fma(_3307, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3309);
    float _3313 = _3305 * _3305;
    float _3315 = -_3233;
    float _3317 = fma(_3315, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3311);
    float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3321 = _3317 + _3319;
    float _3323 = 1.0 / _3313;
    float _3325 = _3321 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3327 = precise::clamp(_3325, 0.0, 1.0);
    float _3329 = _3269 * _3327;
    float _3331 = _3299 * _3329;
    float _3333 = _3287 * _3323;
    float _3335 = _3331 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3337 = _3331 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3339 = _3331 * _3333;
    float _3341 = _3331 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _3343 = _3339 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3345 = _3339 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3347 = _3339 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _3335;
    out.m_98.y = _3337;
    out.m_98.z = _3341;
    out.m_100.x = _3343;
    out.m_100.y = _3345;
    out.m_100.z = _3347;
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
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3059 = false;
    bool _353 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_56.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_59.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3403 = as_type<float>(_137);
        out.gl_Position.z = _3403;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_61.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = 0.0;
    float _157 = _153;
    if (_149)
    {
        float _159 = float(_121);
        _155 = _159;
    }
    float _161 = _155;
    bool _163 = _153 >= _161;
    bool _165 = !_149;
    bool _167 = _163 || _165;
    if (_167)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _131;
    if (_167)
    {
        out.m_59.x = 0.0;
    }
    int _171 = 0;
    if (_167)
    {
        float _173 = _169 * 5.0;
        _171 = as_type<int>(_173);
    }
    int _175 = _171;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3472 = as_type<float>(_175);
        out.gl_Position.z = _3472;
    }
    if (_167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _177 = in.m_63.x;
    float _179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _181 = _153 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_68.x;
    float _187 = in.m_68.y;
    float _189 = in.m_68.z;
    float _191 = in.m_70.x;
    float _193 = in.m_70.y;
    float _195 = in.m_70.z;
    float _197 = in.m_72.x;
    float _199 = in.m_72.y;
    float _201 = in.m_72.z;
    float _203 = _181 * _179;
    float _205 = in.m_74.x;
    float _207 = in.m_74.y;
    float _209 = in.m_74.z;
    float _211 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[20].x, _203);
    int _213 = as_type<int>(_183) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_183) & 2;
    bool _219 = _217 != 0;
    float _221 = _211 * 6.283185482025146484375;
    float _223 = floor(_211);
    int _225 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _227 = _225 != 0;
    float _229 = _221 * 0.15915493667125701904296875;
    bool _231 = !_219;
    float _233 = _231 ? (-0.5) : 0.5;
    int _235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _237 = _235 != 0;
    int _239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _241 = _239 != 0;
    float _243 = _187 * _193;
    bool _245 = !_227;
    int _247 = _245 ? 0 : 1;
    float _249 = _229 * 6.283185482025146484375;
    float _251 = cos(_249);
    float _253 = _187 * _199;
    bool _255 = !_237;
    int _257 = _255 ? 0 : 1;
    float _259 = fma(_185, _191, _243);
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _263 = _187 * _207;
    int _265 = abs(_257);
    float _267 = fma(_185, _197, _253);
    int _269 = abs(_247);
    float _271 = -_223;
    float _273 = _211 + _271;
    float _275 = fma(_185, _205, _263);
    float _277 = -_273;
    float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _281 = !_241;
    int _283 = _281 ? 0 : 1;
    float _285 = fma(_189, _195, _259);
    float _287 = float(_265);
    float _289 = fma(_251, 0.5, 0.5);
    int _291 = abs(_283);
    float _293 = fma(_189, _201, _267);
    bool _295 = _273 < 0.5;
    float _297 = float(_295);
    float _299 = abs(_279);
    float _301 = _287 * _299;
    float _303 = float(_269);
    float _305 = -_289;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _309 = -_297;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _313 = fma(_189, _209, _275);
    float _315 = fma(_303, _307, _301);
    float _317 = float(_291);
    bool _319 = !_215;
    float _321 = _319 ? (-0.5) : 0.5;
    float _323 = abs(_311);
    float _325 = fma(_317, _323, _315);
    bool _327 = !_261;
    float _329 = _313;
    float _331 = _285;
    float _349;
    float _351;
    if (!_327)
    {
        float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _335 = _177 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _337 = float(_121);
        float _339 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
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
        float _355 = float(_121);
        float _357 = 1.0 / _355;
        float _359 = _153 * _357;
        _349 = _359;
        _351 = _355;
    }
    _353 = false;
    float _361 = _349;
    float _363 = _351;
    float _365 = in.m_56.x;
    float _367 = in.m_56.y;
    float _369 = in.m_56.z;
    float _371 = in.m_70.w;
    float _373 = in.m_74.w;
    float _375 = _193 * _367;
    float _377 = _207 * _367;
    float _379 = fma(_191, _365, _375);
    float _381 = fma(_205, _365, _377);
    float _383 = fma(_195, _369, _379);
    float _385 = fma(_209, _369, _381);
    float _387 = _383 + _371;
    float _389 = _385 + _373;
    float _391 = fma(_387, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _393 = fma(_389, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _395 = floor(_391);
    float _397 = floor(_393);
    float _399 = -_395;
    float _401 = _391 + _399;
    float _403 = -_397;
    float _405 = _393 + _403;
    float2 _3796 = float2(_401, _405);
    float _407 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3796, float2(0.0), isnan(_3796)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3796, float2(0.0), isnan(_3796)), level(0.0)).x;
    float _409 = in.m_63.y;
    float _411 = _177 * 2.0;
    float _413 = _199 * _367;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _423 = floor(_411);
    float _425 = fma(_197, _365, _413);
    float _427 = _177 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _431 = fma(_201, _369, _425);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _433;
    float _437 = 1.0 / _417;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _443 = -_429;
    float _445 = fma(_427, 2.0, _443);
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _451 = _361 + _449;
    float _453 = in.m_72.w;
    float _455 = 1.0 / _421;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = _361 + _457;
    float _461 = _409 * 2.0;
    bool _463 = _423 > 0.0;
    float _465 = _409 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _467 = _423 >= 0.0;
    bool _469 = isnan(_423);
    bool _471 = _467 || _469;
    bool _473 = isnan(0.0);
    bool _475 = _471 || _473;
    float _477 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _479 = _459 * _437;
    float _481 = in.m_63.z;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _485 = _361 + _483;
    float _487 = floor(_461);
    float _489 = fma(_465, -2.0, _447);
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _493 = _491 != 0;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _497 = _495 != 0;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _501 = _499 != 0;
    float _503 = _485 * _455;
    float _505 = _177 + _409;
    float _507 = 1.0 / _435;
    float _509 = _505 + (-1.0);
    bool _511 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _513 = isnan(_361);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = _431 + _453;
    float _525 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _527 = 1.0 / _441;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _535 = _361 + _533;
    bool _537 = _487 > 0.0;
    bool _539 = _487 >= 0.0;
    bool _541 = isnan(_487);
    bool _543 = _539 || _541;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _549;
    float _553 = 1.0 / _531;
    float _555 = _535 * _507;
    float _557 = _409 + _481;
    float _559 = _481 * 2.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _563 = _361 + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _565;
    float _569 = _557 + (-1.0);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _575 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _577 = log2(_575);
    float _579 = _451 * _527;
    float _581 = _177 + _481;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _587 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _589 = _581 + (-1.0);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _591;
    float _595 = _563 * _553;
    float _597 = floor(_559);
    float _599 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _601;
    int _605 = _475 ? 0 : 1;
    float _607 = fma(_573, _579, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _609 = fma(_585, _579, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _615 = _577 * _153;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _621 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _623 = int(_621);
    int _625 = ~_605;
    int _627 = _625 + 1;
    int _629 = _627 + 1;
    float _631 = fma(_593, _479, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _633 = fma(_603, _479, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _635 = fma(_613, _503, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _637 = fma(_619, _503, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _639 = _629;
    if (!_463)
    {
        int _641 = ~_605;
        int _643 = _641 + 1;
        _639 = _643;
    }
    int _645 = _639;
    float _647 = -_521;
    float _649 = _647 + 1.0;
    float _651 = exp2(_615);
    bool _653 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _655 = isnan(_361);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = fma(_567, _555, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _667 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _669 = isnan(_361);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = fma(_551, _555, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _681 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _683 = isnan(_361);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = -_663;
    float _695 = _693 + 1.0;
    bool _697 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _699 = isnan(_361);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = -_677;
    float _711 = _709 + 1.0;
    bool _713 = _361 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _715 = isnan(_361);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = -_691;
    float _727 = _725 + 1.0;
    bool _729 = _597 >= 0.0;
    bool _731 = isnan(_597);
    bool _733 = _729 || _731;
    bool _735 = isnan(0.0);
    bool _737 = _733 || _735;
    float _739 = _691 * _695;
    bool _741 = !_497;
    int _743 = _741 ? 0 : 1;
    float _745 = _723 * _649;
    float _747 = -_723;
    float _749 = _747 + 1.0;
    float _751 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _753 = int(_751);
    float _755 = _521 * _727;
    float _757 = float(_623);
    float _759 = -_651;
    float _761 = _759 + 1.0;
    bool _763 = !_493;
    int _765 = _763 ? 0 : 1;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _769 = 1.0 + _767;
    bool _771 = !_501;
    int _773 = _771 ? 0 : 1;
    float _775 = _707 * _749;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _779 = _777 != 0;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _783 = _781 != 0;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _787 = _785 != 0;
    float _789 = 1.0 / _757;
    bool _791 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _793 = isnan(0.0);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _799 = _795 || _797;
    float _801 = -_707;
    float _803 = _801 + 1.0;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _809 = _799 ? _761 : 0.0;
    float _811 = _677 * _803;
    bool _813 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _815 = isnan(1.0);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _821 = _817 || _819;
    float _823 = 1.0 / _769;
    float _825 = _523 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _827 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[78].z, _805);
    float _829 = float(_753);
    float _831 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[78].w, _807);
    float _833 = -_153;
    float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[76].x, _445);
    float _837 = _631 * _811;
    float _839 = _633 * _811;
    float _841 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _827);
    float _843 = fma(_387, (*spvDescriptorSet0.vp_c8)._m0[11].x, _825);
    float _845 = _829 * _153;
    float _847 = _789 * _153;
    float _849 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _489);
    float _851 = fma(_389, (*spvDescriptorSet0.vp_c8)._m0[11].z, _843);
    float _853 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _831);
    float _855 = _523 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_821)
    {
        float _857 = _809 * _823;
        _157 = _857;
    }
    float _859 = _157;
    float _861 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[143].x, _837);
    float _863 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[143].y, _839);
    float _865 = _851 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _867 = !_783;
    int _869 = _867 ? 0 : 1;
    float _871 = in.m_76.x;
    float _873 = in.m_76.y;
    float _875 = in.m_76.z;
    float _877 = fma(_387, (*spvDescriptorSet0.vp_c8)._m0[10].x, _855);
    float _879 = 1.0 / _865;
    int _881 = abs(_869);
    float _883 = _481 + (-0.5);
    bool _885 = _597 > 0.0;
    float _887 = fma(_389, (*spvDescriptorSet0.vp_c8)._m0[10].z, _877);
    float _889 = float(_645);
    float _891 = fma(_637, _775, _863);
    float _893 = float(_881);
    float _895 = _887 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _897 = _737 ? 0 : 1;
    float _899 = fma(_635, _775, _861);
    bool _901 = !_779;
    int _903 = _901 ? 0 : 1;
    float _905 = _893 * _889;
    bool _907 = !_787;
    int _909 = _907 ? 0 : 1;
    float _911 = _895 + _865;
    int _913 = ~_897;
    int _915 = _913 + 1;
    int _917 = _915 + 1;
    float _919 = fma(_679, _745, _891);
    int _921 = abs(_903);
    float _923 = _911 * _879;
    float _925 = _923 * 0.5;
    int _927 = _917;
    if (!_885)
    {
        int _929 = ~_897;
        int _931 = _929 + 1;
        _927 = _931;
    }
    int _933 = _927;
    float _935 = _905 * (-2.0);
    int _937 = abs(_909);
    float _939 = fma(_665, _745, _899);
    float _941 = _409 + (-0.5);
    float _943 = fma(_587, _935, _587);
    float _945 = float(_933);
    float _947 = fma(_935, _873, _873);
    float _949 = float(_921);
    float _951 = fma(_609, _755, _919);
    int _953 = _547 ? 0 : 1;
    float _955 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[196].y, _947);
    float _957 = float(_937);
    float _959 = _949 * _945;
    int _961 = ~_953;
    int _963 = _961 + 1;
    int _965 = _963 + 1;
    float _967 = fma(_943, _859, _955);
    int _969 = _965;
    if (!_537)
    {
        int _971 = ~_953;
        int _973 = _971 + 1;
        _969 = _973;
    }
    int _975 = _969;
    float _977 = _959 * (-2.0);
    float _979 = _967 * 0.15915493667125701904296875;
    float _981 = float(_975);
    float _983 = fma(_525, _977, _525);
    float _985 = fma(_977, _871, _871);
    float _987 = _177 + (-0.5);
    float _989 = fma(_607, _755, _939);
    float _991 = _957 * _981;
    float _993 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].x, _985);
    float _995 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _997 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[30].w, _995);
    float _999 = _991 * (-2.0);
    float _1001 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _321);
    float _1003 = fma(_983, _859, _993);
    float _1005 = fma(_999, _875, _875);
    float _1007 = fma(_599, _999, _599);
    float _1009 = _1003 * 0.15915493667125701904296875;
    float _1011 = in.m_78.x;
    float _1013 = in.m_78.y;
    float _1015 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1005);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _1017;
    float _1021 = _979 * 6.283185482025146484375;
    float _1023 = sin(_1021);
    float _1025 = fma(_1007, _859, _1015);
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _1027;
    float _1031 = fma(_1019, _595, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1033 = _1025 * 0.15915493667125701904296875;
    float _1035 = fma(_1029, _595, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _1037 = fma(_1031, _739, _951);
    float _1039 = _979 * 6.283185482025146484375;
    float _1041 = cos(_1039);
    float _1043 = fma(_1035, _739, _989);
    float _1045 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1037);
    float _1047 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1043);
    float _1049 = _1009 * 6.283185482025146484375;
    float _1051 = sin(_1049);
    float _1053 = _1045 * _1013;
    float _1055 = _1047 * _1011;
    float _1057 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _233);
    float _1059 = _325 * _1053;
    float _1061 = _1009 * 6.283185482025146484375;
    float _1063 = cos(_1061);
    float _1065 = _325 * _1055;
    float _1067 = _1059 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1069 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1071 = _1033 * 6.283185482025146484375;
    float _1073 = cos(_1071);
    float _1075 = _1051 * _1041;
    float _1077 = _1051 * _1023;
    float _1079 = _1069 * _1001;
    float _1081 = 1.0 / _997;
    float _1083 = _1063 * _1041;
    float _1085 = _1063 * _1023;
    float _1087 = _1033 * 6.283185482025146484375;
    float _1089 = sin(_1087);
    float _1091 = _1051 * _1073;
    float _1093 = _1041 * _1073;
    float _1095 = _1063 * _1073;
    float _1097 = _1023 * _1073;
    float _1099 = _1067 * _1057;
    float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1103 = _1081 * _1101;
    float _1105 = _1095 * _1099;
    bool _1107 = _1103 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1109 = _1103 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1111 = fma(_1089, _1083, _1077);
    float _1113 = fma(_1089, _1077, _1083);
    float _1115 = -_1085;
    float _1117 = fma(_1089, _1075, _1115);
    float _1119 = -_1075;
    float _1121 = fma(_1089, _1085, _1119);
    float _1123 = -_1099;
    float _1125 = _1089 * _1123;
    float _1127 = fma(_1111, _1079, _1105);
    float _1129 = _1091 * _1099;
    float _1131 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1133 = fma(_1093, _1079, _1125);
    float _1135 = fma(_1121, _477, _1127);
    float _1137 = fma(_1117, _1079, _1129);
    int _1139 = 2;
    if (!_1107)
    {
        _1139 = 1;
    }
    int _1141 = _1139;
    float _1143 = fma(_1097, _477, _1133);
    float _1145 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1147 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1149 = fma(_1113, _477, _1137);
    bool _1151 = !_1107;
    int _1153 = _1151 ? 0 : 1;
    float _1155 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1145);
    float _1157 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1147);
    float _1159 = _523 + _1131;
    int _1161 = _1141;
    float _1163 = _1143;
    if (!_1109)
    {
        _1161 = _1153;
    }
    int _1165 = _1161;
    float _1167 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1155);
    float _1169 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1157);
    float _1171 = _1159 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _1173 = _1165 << 6;
    float _1175 = _1167 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1177 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1179 = fma(_387, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1171);
    int _1181 = _1173 + 48;
    uint _1184 = uint(int(uint(_1181) >> uint(2)));
    uint _1186 = uint(int(uint(int(_1184)) >> uint(2)));
    int _1188 = int(_1184) & 3;
    float _1190 = (*spvDescriptorSet0.vp_c15)._m0[int(_1186)][_1188];
    int _1192 = int(_1184) + 1;
    uint _1194 = uint(int(uint(_1192) >> uint(2)));
    int _1196 = _1192 & 3;
    float _1198 = (*spvDescriptorSet0.vp_c15)._m0[int(_1194)][_1196];
    float _1200 = _389 + _1175;
    float _1202 = _387 + _1177;
    float _1204 = fma(_389, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1179);
    float _1206 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1210 = _1200 + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1214 = _1202 + _1212;
    float _1216 = _1204 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _1218 = _1173 + 56;
    uint _1220 = uint(int(uint(_1218) >> uint(2)));
    uint _1222 = uint(int(uint(int(_1220)) >> uint(2)));
    int _1224 = int(_1220) & 3;
    float _1226 = (*spvDescriptorSet0.vp_c15)._m0[int(_1222)][_1224];
    int _1228 = int(_1220) + 1;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    int _1232 = _1228 & 3;
    float _1234 = (*spvDescriptorSet0.vp_c15)._m0[int(_1230)][_1232];
    float _1236 = _1210 * _1210;
    float _1238 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1206);
    float _1240 = trunc(_1216);
    int _1242 = int(_1240);
    float _1244 = fma(_1214, _1214, _1236);
    float _1246 = _1159 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1248 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1238);
    int _1250 = _1173 + 64;
    uint _1252 = uint(int(uint(_1250) >> uint(2)));
    uint _1254 = uint(int(uint(int(_1252)) >> uint(2)));
    int _1256 = int(_1252) & 3;
    float _1258 = (*spvDescriptorSet0.vp_c15)._m0[int(_1254)][_1256];
    int _1260 = int(_1252) + 1;
    uint _1262 = uint(int(uint(_1260) >> uint(2)));
    int _1264 = _1260 & 3;
    float _1266 = (*spvDescriptorSet0.vp_c15)._m0[int(_1262)][_1264];
    float _1268 = fma(_387, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1246);
    float _1270 = sqrt(_1244);
    float _1272 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1274 = fma(_389, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1268);
    int _1276 = _1173 + 72;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    uint _1280 = uint(int(uint(int(_1278)) >> uint(2)));
    int _1282 = int(_1278) & 3;
    float _1284 = (*spvDescriptorSet0.vp_c15)._m0[int(_1280)][_1282];
    int _1286 = int(_1278) + 1;
    uint _1288 = uint(int(uint(_1286) >> uint(2)));
    int _1290 = _1286 & 3;
    float _1292 = (*spvDescriptorSet0.vp_c15)._m0[int(_1288)][_1290];
    float _1294 = _523 + _1272;
    float _1296 = _1274 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1298 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1300 = _1242 + _1298;
    int _1302 = _1300 + 1;
    float _1304 = trunc(_1296);
    int _1306 = int(_1304);
    int _1308 = _1173 + 96;
    uint _1310 = uint(int(uint(_1308) >> uint(2)));
    uint _1312 = uint(int(uint(int(_1310)) >> uint(2)));
    int _1314 = int(_1310) & 3;
    float _1316 = (*spvDescriptorSet0.vp_c15)._m0[int(_1312)][_1314];
    int _1318 = int(_1310) + 1;
    uint _1320 = uint(int(uint(_1318) >> uint(2)));
    int _1322 = _1318 & 3;
    float _1324 = (*spvDescriptorSet0.vp_c15)._m0[int(_1320)][_1322];
    bool _1326 = _1270 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1328 = _1173 + 104;
    uint _1330 = uint(int(uint(_1328) >> uint(2)));
    uint _1332 = uint(int(uint(int(_1330)) >> uint(2)));
    int _1334 = int(_1330) & 3;
    float _1336 = (*spvDescriptorSet0.vp_c15)._m0[int(_1332)][_1334];
    int _1338 = int(_1330) + 1;
    uint _1340 = uint(int(uint(_1338) >> uint(2)));
    int _1342 = _1338 & 3;
    float _1344 = (*spvDescriptorSet0.vp_c15)._m0[int(_1340)][_1342];
    int _1346 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1348 = _1306 + _1346;
    int _1350 = _1348 + 1;
    float _1352 = _1294;
    float _1354 = _1200;
    int _1356 = _1350;
    float _1358 = as_type<float>(_1165);
    if (!_1326)
    {
        _1163 = _1202;
    }
    float _1360 = _1163;
    bool _1362 = !_1326;
    float _1364 = _1360;
    int _1366 = as_type<int>(_1324);
    int _1368 = as_type<int>(_1226);
    if (!_1362)
    {
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1374 = _1270 + _1372;
        float _1376 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1378 = rsqrt(_1244);
        float _1380 = _1374 * _1370;
        float _1382 = _1380 * 0.15915493667125701904296875;
        float _1384 = _1382 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        float _1388 = _1382 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        float _1392 = _1386 + (-1.0);
        float _1394 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = fma(_1390, _1376, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1398 = fma(_1294, _1386, _1394);
        float _1400 = _1378 * _1396;
        float _1402 = fma(_1214, _1400, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1404 = fma(_1210, _1400, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1352 = _1398;
        _1364 = _1402;
        _1354 = _1404;
    }
    float _1406 = _1352;
    float _1408 = _1364;
    float _1410 = _1354;
    float _1412 = -_523;
    float _1414 = _1412 + _1406;
    int _1416 = _1173 + 80;
    uint _1418 = uint(int(uint(_1416) >> uint(2)));
    uint _1420 = uint(int(uint(int(_1418)) >> uint(2)));
    int _1422 = int(_1418) & 3;
    float _1424 = (*spvDescriptorSet0.vp_c15)._m0[int(_1420)][_1422];
    int _1426 = int(_1418) + 1;
    uint _1428 = uint(int(uint(_1426) >> uint(2)));
    int _1430 = _1426 & 3;
    float _1432 = (*spvDescriptorSet0.vp_c15)._m0[int(_1428)][_1430];
    float _1434 = -_387;
    float _1436 = _1434 + _1408;
    bool _1438 = _1302 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1440 = _1414 * _1414;
    int _1442 = _1302 | _1350;
    float _1444 = -_389;
    float _1446 = _1444 + _1410;
    float _1448 = fma(_1436, _1436, _1440);
    bool _1450 = _1442 < 0;
    bool _1452 = _1450 || _1438;
    bool _1454 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1456 = isnan(0.5);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1462 = _1458 || _1460;
    float _1464 = fma(_1446, _1446, _1448);
    float _1466 = _1159 * _1324;
    bool _1468 = _1350 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1470 = _1468 || _1452;
    float _1472 = sqrt(_1464);
    float _1474 = fma(_387, _1316, _1466);
    float _1476 = _1159 * _1198;
    float _1478 = _1159 * _1266;
    float _1480 = fma(_389, _1336, _1474);
    float _1482 = fma(_387, _1190, _1476);
    float _1484 = fma(_387, _1258, _1478);
    float _1486 = _1480 + _1344;
    float _1488 = fma(_389, _1226, _1482);
    int _1490 = as_type<int>(_1478);
    int _1492 = as_type<int>(_1484);
    float _1494 = _1408;
    float _1496 = _1406;
    float _1498 = _1410;
    float _1500 = _1488;
    if (!_1470)
    {
        int _1502 = _1350 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1504 = _1502 + _1302;
        _1356 = _1504;
    }
    int _1506 = _1356;
    float _1508 = _1266;
    if (!_1470)
    {
        float _1510 = floor(_1216);
        _1508 = _1510;
    }
    float _1512 = _1508;
    float _1514 = fma(_389, _1284, _1484);
    bool _1516 = _1472 > 0.0;
    float _1518 = _1514 + _1292;
    if (!_1470)
    {
        int _1520 = _1506 << 2;
        _1366 = _1520;
    }
    int _1522 = _1366;
    float _1524 = 1.0 / _1486;
    if (!_1470)
    {
        uint _1526 = uint(int(uint(_1506) >> uint(2)));
        _1490 = int(_1526);
    }
    int _1528 = _1490;
    float _1530 = as_type<float>(_1528);
    if (!_1470)
    {
        int _1532 = 12 & _1522;
        _1368 = _1532;
    }
    int _1534 = _1368;
    float _1536 = _1488 + _1234;
    if (!_1470)
    {
        int _1538 = _1528 << 4;
        int _1540 = _1538 + _1534;
        _1492 = _1540;
    }
    int _1542 = _1492;
    bool _1544 = !_1516;
    float _1546 = _1512;
    if (!_1544)
    {
        float _1548 = _293 * _293;
        float _1550 = fma(_285, _285, _1548);
        float _1552 = rsqrt(_1464);
        float _1554 = fma(_313, _313, _1550);
        float _1556 = sqrt(_1554);
        float _1558 = _1436 * _1552;
        float _1560 = _1414 * _1552;
        float _1562 = _1446 * _1552;
        bool _1564 = _1556 > 0.0;
        bool _1566 = !_1564;
        _1530 = _1554;
        _1500 = _1552;
        if (!_1566)
        {
            float _1568 = rsqrt(_1554);
            float _1570 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1572 = _293 * _1568;
            float _1574 = _285 * _1568;
            float _1576 = _313 * _1568;
            float _1578 = _1560 * _1572;
            float _1580 = fma(_1558, _1574, _1578);
            float _1582 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1584 = fma(_1562, _1576, _1580);
            float _1586 = _1584 * _1582;
            float _1588 = fma(_285, _1586, _1408);
            float _1590 = fma(_293, _1586, _1406);
            float _1592 = fma(_313, _1586, _1410);
            _1494 = _1588;
            _1496 = _1590;
            _1498 = _1592;
            _1500 = _1586;
        }
    }
    float _1594 = _1494;
    float _1596 = _1496;
    float _1598 = _1498;
    float _1600 = _1530;
    float _1602 = _1500;
    float _1604 = _1602;
    float _1606 = _1600;
    if (_1462)
    {
        _1604 = _1594;
    }
    float _1608 = _1604;
    float _1610 = _1608;
    if (_1462)
    {
        _1606 = _1596;
    }
    float _1612 = _1606;
    float _1614 = _1612;
    if (_1462)
    {
        _329 = _1598;
    }
    float _1616 = _329;
    float _1618 = _1616;
    if (!_1462)
    {
        float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1622 = _523 + _1620;
        float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1626 = _387 + _1624;
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1630 = -_389;
        float _1632 = _1630 + _1598;
        float _1634 = _1622 * _1622;
        float _1636 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1638 = _389 + _1636;
        float _1640 = fma(_1626, _1626, _1634);
        float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1644 = fma(_1638, _1638, _1640);
        float _1646 = sqrt(_1644);
        float _1648 = _1628 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1650 = -_523;
        float _1652 = _1650 + _1596;
        float _1654 = precise::min(_1646, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1656 = _1654 * _1642;
        float _1658 = _1648 * _1656;
        float _1660 = -_387;
        float _1662 = _1660 + _1594;
        float _1664 = fma(_1652, _1658, _523);
        float _1666 = fma(_1662, _1658, _387);
        float _1668 = fma(_1632, _1658, _389);
        _1614 = _1664;
        _1610 = _1666;
        _1618 = _1668;
        _331 = _1658;
    }
    float _1670 = _1614;
    float _1672 = _1610;
    float _1674 = _1618;
    float _1676 = _331;
    int _1678 = _1173 + 88;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    uint _1682 = uint(int(uint(int(_1680)) >> uint(2)));
    int _1684 = int(_1680) & 3;
    float _1686 = (*spvDescriptorSet0.vp_c15)._m0[int(_1682)][_1684];
    int _1688 = int(_1680) + 1;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    int _1692 = _1688 & 3;
    float _1694 = (*spvDescriptorSet0.vp_c15)._m0[int(_1690)][_1692];
    float _1696 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1698 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1700 = _1518 * _1524;
    float _1702 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1704 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1696);
    float _1706 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1698);
    float _1708 = _1536 * _1524;
    float _1710 = _1446;
    if (!_1470)
    {
        int _1712 = _1542 + 400;
        uint _1714 = uint(int(uint(_1712) >> uint(2)));
        uint _1716 = uint(int(uint(int(_1714)) >> uint(2)));
        int _1718 = int(_1714) & 3;
        float _1720 = (*spvDescriptorSet0.vp_c15)._m0[int(_1716)][_1718];
        _1710 = _1720;
    }
    float _1722 = _1710;
    float _1724 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1702);
    float _1726 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1704);
    float _1728 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1706);
    float _1730 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1732 = _1708 >= 0.0;
    float _1734 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1724);
    float _1736 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1738 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1740 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1730);
    bool _1742 = _1708 <= 1.0;
    bool _1744 = _1742 && _1732;
    float _1746 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1748 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1750 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1752 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1754 = _1700 >= 0.0;
    bool _1756 = _1754 && _1744;
    float _1758 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1748);
    float _1760 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1740);
    float _1762 = -_1752;
    float _1764 = fma(_1762, _1750, 1.0);
    bool _1766 = _1700 <= 1.0;
    bool _1768 = _1766 && _1756;
    float _1770 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1758);
    float _1772 = _1760 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1774 = log2(_1764);
    float _1776 = _1159 * _1432;
    float _1778 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1780 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1770);
    float _1782 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1784 = fma(_387, _1424, _1776);
    float _1786 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1778);
    float _1788 = _1776;
    if (!_1470)
    {
        float _1790 = -_1512;
        float _1792 = _1216 + _1790;
        _1546 = _1792;
    }
    float _1794 = _1546;
    float _1796 = _1676;
    if (!_1470)
    {
        float _1798 = floor(_1296);
        _1796 = _1798;
    }
    float _1800 = _1796;
    float _1802 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1782);
    if (_1768)
    {
        float _1804 = float(_1165);
        _1358 = _1804;
    }
    float _1806 = _1358;
    float _1808 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1786);
    float _1810 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1802);
    float _1812 = 1.0 / _1780;
    float _1814 = fma(_389, _1686, _1784);
    float _1816 = _1814 + _1694;
    float _1818 = _1774 * 0.693147182464599609375;
    float _1820 = _1778;
    if (_1768)
    {
        float _1822 = rint(_1806);
        float _1824 = precise::max(_1822, 0.0);
        uint _1826 = uint(_1824);
        uint _1828 = clamp(_1826, 0u, 65535u);
        _1820 = as_type<float>(_1828);
    }
    float _1830 = _1820;
    if (!_1470)
    {
        float _1832 = -_1800;
        float _1834 = _1296 + _1832;
        _1788 = _1834;
    }
    float _1836 = _1788;
    float _1838 = _1816 * _1524;
    float _1840 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1808);
    float _1842 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1810);
    float _1844 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1846 = _1524;
    if (!_1470)
    {
        float _1848 = rint(_1722);
        float _1850 = precise::max(_1848, 0.0);
        uint _1852 = uint(_1850);
        uint _1854 = clamp(_1852, 0u, 65535u);
        _1846 = as_type<float>(_1854);
    }
    float _1856 = _1846;
    float _1858 = _1840 * _1812;
    float _1860 = _1842 * _1812;
    float _1862 = fma(_1858, 0.5, 0.5);
    float _1864 = fma(_1860, -0.5, 0.5);
    float _1866 = _1700;
    if (_1768)
    {
        float3 _6132 = float3(_1708, _1700, float(as_type<int>(_1830)));
        float3 _6136 = select(_6132, float3(0.0), isnan(_6132));
        float _1868 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6136.xy, uint(rint(_6136.z)), _1838, level(0.0));
        _1866 = _1868;
    }
    float _1870 = _1866;
    float3 _6146 = float3(_1862, _1864, _1844);
    float _1872 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6146, float3(0.0), isnan(_6146)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6146, float3(0.0), isnan(_6146)), level(0.0)).x;
    float3 _6155 = float3(_1862, _1864, _1844);
    float4 _1875 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6155, float3(0.0), isnan(_6155)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6155, float3(0.0), isnan(_6155)), level(0.0)).xyzw;
    float _1877 = _1875.x;
    float _1879 = _1875.y;
    float _1881 = _1875.z;
    float _1883 = _1875.w;
    float _1885 = _1764;
    if (!_1470)
    {
        float3 _6178 = float3(_1794, _1836, float(as_type<int>(_1856)));
        float3 _6180 = select(_6178, float3(0.0), isnan(_6178));
        float _1887 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6180.xy, uint(rint(_6180.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6180.xy, uint(rint(_6180.z)), level(0.0)).x;
        _1885 = _1887;
    }
    float _1889 = _1885;
    float _1891 = float(uint(_753));
    float _1893 = trunc(_847);
    int _1895 = int(_1893);
    float _1897 = 1.0 / _1891;
    float _1899 = float(uint(_1895));
    int _1901 = as_type<int>(_1897) + (-2);
    float _1903 = as_type<float>(_1901) * _1899;
    float _1905 = trunc(_1903);
    float _1907 = precise::max(_1905, 0.0);
    uint _1909 = uint(_1907);
    int _1911 = ~_753;
    int _1913 = _1911 + 1;
    int _1915 = ~_753;
    int _1917 = _1915 + 1;
    int _1919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1921 = _1919 != 0;
    bool _1923 = !_1921;
    float _1925 = _1923 ? 7.345489978790283203125 : 1.0;
    int _1927 = _1913 * int(_1909);
    int _1929 = _1927 + _1895;
    float _1931 = _1925 * _177;
    float _1933 = float(uint(_1929));
    float _1935 = floor(_1931);
    float _1937 = as_type<float>(_1901) * _1933;
    float _1939 = trunc(_1937);
    float _1941 = precise::max(_1939, 0.0);
    uint _1943 = uint(_1941);
    float _1945 = -_1935;
    float _1947 = _1931 + _1945;
    int _1949 = int(_1909) + int(_1943);
    float _1951 = as_type<float>(_1943);
    float _1953 = _1903;
    if (_1470)
    {
        _1951 = 1.0;
    }
    float _1955 = _1951;
    int _1957 = _1917 * _1949;
    int _1959 = _1957 + _1895;
    bool _1961 = uint(_1959) >= uint(_753);
    float _1963 = _1955;
    if (!_1470)
    {
        int _1965 = _1506 << 4;
        int _1967 = _1965 + 2048;
        uint _1969 = uint(int(uint(_1967) >> uint(2)));
        uint _1971 = uint(int(uint(int(_1969)) >> uint(2)));
        int _1973 = int(_1969) & 3;
        float _1975 = (*spvDescriptorSet0.vp_c15)._m0[int(_1971)][_1973];
        int _1977 = int(_1969) + 1;
        uint _1979 = uint(int(uint(_1977) >> uint(2)));
        int _1981 = _1977 & 3;
        float _1983 = (*spvDescriptorSet0.vp_c15)._m0[int(_1979)][_1981];
        int _1985 = _1967 + 8;
        uint _1987 = uint(int(uint(_1985) >> uint(2)));
        uint _1989 = uint(int(uint(int(_1987)) >> uint(2)));
        int _1991 = int(_1987) & 3;
        float _1993 = (*spvDescriptorSet0.vp_c15)._m0[int(_1989)][_1991];
        int _1995 = int(_1987) + 1;
        uint _1997 = uint(int(uint(_1995) >> uint(2)));
        int _1999 = _1995 & 3;
        float _2001 = (*spvDescriptorSet0.vp_c15)._m0[int(_1997)][_1999];
        float _2003 = _1159 * _1983;
        float _2005 = fma(_387, _1975, _2003);
        float _2007 = fma(_389, _1993, _2005);
        float _2009 = _2007 + _2001;
        float _2011 = precise::clamp(_2009, 0.0, 1.0);
        float _2013 = -_2011;
        float _2015 = _2013 + _1889;
        float _2017 = fma(_2015, 500.0, 1.5);
        float _2019 = exp2(_2017);
        float _2021 = 0.0 + _2019;
        float _2023 = precise::clamp(_2021, 0.0, 1.0);
        _1963 = _2023;
    }
    float _2025 = _1963;
    float _2027 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2029 = _1670 + _2027;
    float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2033 = _1672 + _2031;
    float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2037 = _1674 + _2035;
    float _2039 = _2029 * _2029;
    float _2041 = fma(_2033, _2033, _2039);
    float _2043 = fma(_2037, _2037, _2041);
    float _2045 = rsqrt(_2043);
    float _2047 = sqrt(_2043);
    float _2049 = _2033 * _2045;
    float _2051 = _2037 * _2045;
    float _2053 = _2029 * _2045;
    float _2055 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2057 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2059 = _2055 * _2055;
    float _2061 = _2057 * _2057;
    float _2063 = _2059 + _2061;
    float _2065 = sqrt(_2063);
    bool _2067 = _2065 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2071 = _2065 + _2069;
    float _2073 = as_type<float>(_1909);
    float _2075 = _2063;
    float _2077 = _2071;
    float _2079 = _2055;
    float _2081 = _2057;
    float _2083 = _2059;
    float _2085 = _2061;
    if (_2067)
    {
        float _2087 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2073 = _2087;
    }
    float _2089 = _2073;
    if (_2067)
    {
        float _2091 = rsqrt(_2063);
        _2075 = _2091;
    }
    float _2093 = _2075;
    if (_2067)
    {
        float _2095 = _2071 * _2089;
        _2077 = _2095;
    }
    float _2097 = _2077;
    float _2099 = 0.0;
    if (_2067)
    {
        float _2101 = _2097 * 0.15915493667125701904296875;
        _2099 = _2101;
    }
    float _2103 = _2099;
    float _2105 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2107 = _1844;
    if (_2067)
    {
        float _2109 = _2103 * 6.283185482025146484375;
        float _2111 = sin(_2109);
        _2107 = _2111;
    }
    float _2113 = _2107;
    float _2115 = precise::max(0.0, _2105);
    float _2117 = _2097;
    float _2119 = _2115;
    if (_2067)
    {
        float _2121 = _2103 * 6.283185482025146484375;
        float _2123 = cos(_2121);
        _2117 = _2123;
    }
    float _2125 = _2117;
    float _2127 = -_2053;
    float _2129 = -_2115;
    float _2131 = fma(_2127, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2129);
    float _2133 = _2131;
    if (_2067)
    {
        float _2135 = _2131 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2119 = _2135;
    }
    float _2137 = _2119;
    float _2139 = _2137;
    if (_2067)
    {
        float _2141 = fma(_2113, _2137, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1953 = _2141;
    }
    float _2143 = _1953;
    float _2145 = _2143;
    if (_2067)
    {
        float _2147 = _2093 * _2143;
        _2145 = _2147;
    }
    float _2149 = _2145;
    if (_2067)
    {
        float _2151 = _2125 + (-1.0);
        _2139 = _2151;
    }
    float _2153 = _2139;
    float _2155 = _2153;
    if (_2067)
    {
        float _2157 = _2055 * _2149;
        _2079 = _2157;
    }
    float _2159 = _2079;
    if (_2067)
    {
        float _2161 = _2057 * _2149;
        _2081 = _2161;
    }
    float _2163 = _2081;
    if (_2067)
    {
        float _2165 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2155 = _2165;
    }
    float _2167 = _2155;
    if (_2067)
    {
        float _2169 = _2159 * _2159;
        _2083 = _2169;
    }
    float _2171 = _2083;
    if (_2067)
    {
        float _2173 = _2163 * _2163;
        _2085 = _2173;
    }
    float _2175 = _2085;
    if (_2067)
    {
        float _2177 = fma(_2131, _2125, _2167);
        _2133 = _2177;
    }
    float _2179 = _2133;
    float _2181 = fma(_2179, _2179, _2171);
    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2185 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2183);
    float _2187 = precise::clamp(_2185, 0.0, 1.0);
    float _2189 = _2181 + _2175;
    float _2191 = -_2187;
    float _2193 = _2191 + 1.0;
    float _2195 = rsqrt(_2189);
    float _2197 = _2195 * _2159;
    float _2199 = _2195 * _2179;
    float _2201 = _2195 * _2163;
    float _2203 = float(_1895);
    float _2205 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2207 = abs(_2193);
    float _2209 = log2(_2207);
    float _2211 = -_2205;
    float _2213 = fma(_2199, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2211);
    float _2215 = -_2201;
    float _2217 = fma(_2215, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2213);
    float _2219 = 1.0 / _363;
    float _2221 = fma(_2217, -0.5, 0.5);
    float _2223 = fma(_2217, 0.5, 0.5);
    float _2225 = fma(_2223, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2227 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2229 = sqrt(_2221);
    float _2231 = fma(_2223, _2225, -0.212114393711090087890625);
    float _2233 = _2199 + 1.0;
    float _2235 = fma(_2223, _2231, 1.570728778839111328125);
    bool _2237 = _2203 >= _829;
    bool _2239 = isnan(_2203);
    bool _2241 = _2237 || _2239;
    bool _2243 = isnan(_829);
    bool _2245 = _2241 || _2243;
    float _2247 = float(_2245);
    float _2249 = exp2(_2227);
    float _2251 = _2229 * 0.636619746685028076171875;
    float _2253 = trunc(_2247);
    int _2255 = int(_2253);
    float _2257 = -_2235;
    float _2259 = fma(_2251, _2257, 1.0);
    float _2261 = -_2199;
    float _2263 = fma(_2249, _2233, _2261);
    bool _2265 = !_1961;
    int _2267 = _2265 ? 0 : (-1);
    float _2269 = fma(_2263, 0.5, 0.5);
    float2 _6748 = float2(_2259, _2269);
    float3 _2273 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6748, float2(0.0), isnan(_6748)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6748, float2(0.0), isnan(_6748)), level(0.0)).xyz;
    float _2275 = _2273.x;
    float _2277 = _2273.y;
    float _2279 = _2273.z;
    int _2281 = ~_1949;
    int _2283 = _2281 + _2267;
    int _2285 = _2283 + 1;
    float _2287 = _1947 * _829;
    bool _2289 = _753 == 0;
    float _2291 = _845 * _2219;
    int _2293 = _753 * _2285;
    int _2295 = _2293 + _1895;
    int _2297 = ~_2255;
    int _2299 = _2297 + 1;
    int _2301 = _2299 + 1;
    float _2303 = trunc(_2287);
    int _2305 = int(_2303);
    int _2307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2309 = _2307 != 0;
    float _2311 = -_841;
    float _2313 = _2311 + 1.0;
    bool _2315 = !_2289;
    int _2317 = _2315 ? _2295 : (-1);
    float _2319 = -_853;
    float _2321 = _2319 + 1.0;
    int _2323 = _753 + (-1);
    float _2325 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2327 = !_2309;
    int _2329 = _2327 ? 0 : 1;
    float _2331 = trunc(_2291);
    int _2333 = int(_2331);
    int _2335 = _2317 * _2301;
    int _2337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2339 = _2337 != 0;
    float _2341 = -_407;
    float _2343 = _2341 + 1.0;
    int _2345 = abs(_743);
    int _2347 = _2255 * _2323;
    int _2349 = _2347 + _2335;
    int _2351 = abs(_765);
    out.m_80.x = _1672;
    out.m_80.y = _1670;
    out.m_80.z = _1674;
    float _2353 = exp2(_2325);
    int _2355 = abs(_2329);
    bool _2357 = !_2339;
    int _2359 = _2357 ? 0 : 1;
    int _2361 = abs(_773);
    int _2363 = _2349 * _2345;
    int _2365 = ~_753;
    int _2367 = _2365 + 1;
    int _2369 = _2305 * _2355;
    int _2371 = _2369 + _1895;
    int _2373 = abs(_2359);
    int _2375 = _2333 * _2351;
    int _2377 = _2375 + _2363;
    int _2379 = ~_753;
    int _2381 = _2379 + 1;
    bool _2383 = _177 > 0.5;
    int _2385 = _2371 * _2361;
    int _2387 = _2385 + _2377;
    int _2389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2391 = _2389 != 0;
    float _2393 = -_2353;
    float _2395 = _2393 + 1.0;
    int _2397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2399 = _2397 != 0;
    int _2401 = _2305 * _2373;
    int _2403 = _2401 + _2387;
    int _2405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2407 = _2405 != 0;
    float _2409 = _2395 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2411 = ~_753;
    int _2413 = _2411 + 1;
    float _2415 = float(uint(_2403));
    float _2417 = _2409 * _1872;
    float _2419 = as_type<float>(_1901) * _2415;
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2423 = trunc(_2419);
    float _2425 = precise::max(_2423, 0.0);
    uint _2427 = uint(_2425);
    float _2429 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2431 = float(uint(_2371));
    float _2433 = as_type<float>(_1901) * _2431;
    int _2435 = _2367 * int(_2427);
    int _2437 = _2435 + _2403;
    float _2439 = trunc(_2433);
    float _2441 = precise::max(_2439, 0.0);
    uint _2443 = uint(_2441);
    float _2445 = float(uint(_2437));
    float _2447 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2449 = as_type<float>(_1901) * _2445;
    float _2451 = _2447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2453 = trunc(_2449);
    float _2455 = precise::max(_2453, 0.0);
    uint _2457 = uint(_2455);
    int _2459 = int(_2427) + int(_2457);
    int _2461 = _2381 * _2459;
    int _2463 = _2461 + _2403;
    bool _2465 = uint(_2463) >= uint(_753);
    float _2467 = -_321;
    int _2469 = _2383 ? as_type<int>(_2467) : as_type<int>(_321);
    bool _2471 = !_2465;
    int _2473 = _2471 ? 0 : (-1);
    bool _2475 = _409 > 0.5;
    int _2477 = ~_2459;
    int _2479 = _2477 + _2473;
    int _2481 = _2479 + 1;
    float _2483 = -_233;
    int _2485 = _2475 ? as_type<int>(_2483) : as_type<int>(_233);
    bool _2487 = !_2399;
    float _2489 = _2487 ? _321 : as_type<float>(_2469);
    int _2491 = _753 * _2481;
    int _2493 = _2491 + _2403;
    bool _2495 = !_2391;
    float _2497 = _2495 ? _233 : as_type<float>(_2485);
    int _2499 = _2413 * int(_2443);
    int _2501 = _2499 + _2371;
    float _2503 = _2489 + 0.5;
    float _2505 = _2497 + (-0.5);
    float _2507 = float(uint(_2501));
    float _2509 = fma(_2503, (*spvDescriptorSet0.vp_c9)._m0[80].x, _835);
    float _2511 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2513 = -_2505;
    float _2515 = -_849;
    float _2517 = fma(_2513, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2515);
    bool _2519 = !_2289;
    int _2521 = _2519 ? _2493 : (-1);
    float _2523 = -_2313;
    float _2525 = fma(_2489, _2523, _2509);
    float _2527 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2529 = _2511 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2531 = _2521 >> 31;
    float _2533 = as_type<float>(_1901) * _2507;
    float _2535 = fma(_2497, _2321, _2517);
    int _2537 = _2531 & 3;
    out.m_82.x = _2451;
    out.m_82.y = _2429;
    out.m_82.z = _2529;
    out.m_82.w = _2527;
    float _2539 = trunc(_2533);
    float _2541 = precise::max(_2539, 0.0);
    uint _2543 = uint(_2541);
    int _2545 = _2521 + _2537;
    out.m_84.x = _2525;
    out.m_84.y = _2535;
    int _2547 = ~_753;
    int _2549 = _2547 + 1;
    float _2551 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2553 = _2545 >> 2;
    float _2555 = _233 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2557 = _2521 & 3;
    bool _2559 = _2557 != 0;
    float _2561 = abs(_1103);
    float _2563 = log2(_2561);
    int _2565 = _2553 << 4;
    int _2567 = _2565 + 368;
    float _2569 = -_1089;
    float _2571 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2551);
    float _2573 = _321 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _2575 = uint(int(uint(_2567) >> uint(2)));
    uint _2577 = uint(int(uint(int(_2575)) >> uint(2)));
    int _2579 = int(_2575) & 3;
    float _2581 = (*spvDescriptorSet0.vp_c9)._m0[int(_2577)][_2579];
    int _2583 = int(_2575) + 1;
    uint _2585 = uint(int(uint(_2583) >> uint(2)));
    int _2587 = _2583 & 3;
    float _2589 = (*spvDescriptorSet0.vp_c9)._m0[int(_2585)][_2587];
    float _2591 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2595 = int(_2443) + int(_2543);
    float _2597 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2599 = _2591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2601 = _2593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2603 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2605 = _2597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2607 = _2549 * _2595;
    int _2609 = _2607 + _2371;
    float _2611 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2613 = -_1089;
    float _2615 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2603);
    float _2617 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_86.x = _2599;
    out.m_86.y = _2601;
    out.m_86.z = _2605;
    bool _2619 = uint(_2609) >= uint(_753);
    float _2621 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2623 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2625 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2627 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2571);
    float _2629 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2611);
    float _2631 = exp2(_2623);
    float _2633 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2635 = _1103 <= 8000.0;
    bool _2637 = isnan(_1103);
    bool _2639 = _2635 || _2637;
    bool _2641 = isnan(8000.0);
    bool _2643 = _2639 || _2641;
    float _2645 = float(_2643);
    int _2647 = _2521 & 3;
    bool _2649 = _2647 != 0;
    int _2651 = _2567 + 8;
    uint _2653 = uint(int(uint(_2651) >> uint(2)));
    uint _2655 = uint(int(uint(int(_2653)) >> uint(2)));
    int _2657 = int(_2653) & 3;
    float _2659 = (*spvDescriptorSet0.vp_c9)._m0[int(_2655)][_2657];
    int _2661 = int(_2653) + 1;
    uint _2663 = uint(int(uint(_2661) >> uint(2)));
    int _2665 = _2661 & 3;
    float _2667 = (*spvDescriptorSet0.vp_c9)._m0[int(_2663)][_2665];
    int _2669 = _2559 ? 0 : 1;
    bool _2671 = uint(_2647) > 1u;
    float _2673 = -_1089;
    float _2675 = fma(_2673, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2625);
    int _2677 = ~_2669;
    int _2679 = _2677 + 1;
    int _2681 = _2679 + 1;
    float _2683 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2615);
    bool _2685 = uint(_2647) >= 2u;
    float _2687 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2675);
    float _2689 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2617);
    float _2691 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2693 = _2685 ? 0 : 1;
    float _2695 = fma(_2631, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2697 = precise::clamp(_2695, 0.0, 1.0);
    float _2699 = _2555 * _2683;
    float _2701 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2621);
    int _2703 = ~_2693;
    int _2705 = _2703 + 1;
    int _2707 = _2705 + 1;
    int _2709 = _2681;
    int _2711 = _2707;
    if (!_2671)
    {
        int _2713 = ~_2669;
        int _2715 = _2713 + 1;
        _2709 = _2715;
    }
    int _2717 = _2709;
    float _2719 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2721 = _2647 != 3;
    float _2723 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2633);
    int _2725 = abs(_2717);
    float _2727 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2719);
    bool _2729 = !_2649;
    int _2731 = _2729 ? 0 : 1;
    float _2733 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2691);
    int _2735 = ~_2725;
    int _2737 = _2735 + 1;
    int _2739 = _2737 + 1;
    float _2741 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2727);
    bool _2743 = _2647 != 3;
    float _2745 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2723);
    int _2747 = abs(_2731);
    int _2749 = _2739 * as_type<int>(_2589);
    bool _2751 = !_2743;
    int _2753 = _2751 ? 0 : (-1);
    float _2755 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2733);
    if (_2721)
    {
        int _2757 = ~_2693;
        int _2759 = _2757 + 1;
        _2711 = _2759;
    }
    int _2761 = _2711;
    bool _2763 = !_2407;
    int _2765 = _2763 ? 0 : 1;
    int _2767 = abs(_2761);
    int _2769 = ~_2747;
    int _2771 = _2769 + 1;
    int _2773 = _2771 + 1;
    int _2775 = abs(_2753);
    int _2777 = _2773 * as_type<int>(_2581);
    int _2779 = _2777 + _2749;
    bool _2781 = !_2619;
    int _2783 = _2781 ? 0 : (-1);
    int _2785 = abs(_2765);
    int _2787 = ~_2767;
    int _2789 = _2787 + 1;
    int _2791 = _2789 + 1;
    int _2793 = ~_2595;
    int _2795 = _2793 + _2783;
    int _2797 = _2795 + 1;
    int _2799 = _2791 * as_type<int>(_2659);
    int _2801 = _2799 + _2779;
    int _2803 = ~_2775;
    int _2805 = _2803 + 1;
    int _2807 = _2805 + 1;
    int _2809 = _753 * _2797;
    int _2811 = _2809 + _2371;
    int _2813 = ~_2785;
    int _2815 = _2813 + 1;
    int _2817 = _2815 + 1;
    int _2819 = _2807 * as_type<int>(_2667);
    int _2821 = _2819 + _2801;
    float _2823 = _2555 * _2627;
    float _2825 = _2555 * _2687;
    bool _2827 = !_2289;
    int _2829 = _2827 ? _2811 : (-1);
    int _2831 = _2821 * _2817;
    float _2833 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2629);
    float _2835 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2689);
    int _2837 = _2829 * _2785;
    int _2839 = _2837 + _2831;
    float _2841 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2701);
    float _2843 = fma(_2697, -2.0, 3.0);
    float _2845 = _2697 * _2697;
    float _2847 = fma(_2573, _2835, _2699);
    float _2849 = fma(_2573, _2841, _2825);
    float _2851 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2853 = _2845 * _2843;
    float _2855 = fma(_2573, _2833, _2823);
    float _2857 = float(_2839);
    float _2859 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2851);
    float _2861 = -_2853;
    float _2863 = _2861 + 1.0;
    float _2865 = _2741 + _2855;
    float _2867 = _2755 + _2849;
    float _2869 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2859);
    float _2871 = fma(_2863, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2853);
    out.m_88.x = _2857;
    float _2873 = _2745 + _2847;
    float _2875 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2869);
    float _2877 = _2645 * _2871;
    float _2879 = _1883 * _2417;
    float _2881 = _2875 + _1780;
    float _2883 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2885 = _2857;
    float _2887 = _2881;
    if (!_1768)
    {
        _2885 = 1.0;
    }
    float _2889 = _2885;
    out.m_90.x = _2865;
    out.m_90.y = _2873;
    out.m_90.z = _2867;
    float _2891 = _2889;
    if (_1768)
    {
        bool _2893 = _1870 >= _1838;
        bool _2895 = isnan(_1870);
        bool _2897 = _2893 || _2895;
        bool _2899 = isnan(_1838);
        bool _2901 = _2897 || _2899;
        float _2903 = float(_2901);
        _2891 = _2903;
    }
    float _2905 = _2891;
    float _2907 = _2343 * _2883;
    float _2909 = precise::clamp(_2907, 0.0, 1.0);
    float _2911 = _2881 * 0.5;
    float _2913 = -_2409;
    float _2915 = _2913 + 1.0;
    float _2917 = _2905 * _2025;
    float _2919 = -_2909;
    float _2921 = fma(_2919, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_92.z = _2911;
    out.m_92.w = _1780;
    float _2923 = _1883 * _2915;
    bool _2925 = _2047 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2927 = isnan(_2047);
    bool _2929 = _2925 || _2927;
    bool _2931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2933 = _2929 || _2931;
    float _2935 = -_2917;
    float _2937 = fma(_2935, _2921, 1.0);
    float _2939 = precise::clamp(_2937, 0.0, 1.0);
    out.gl_Position.x = _1840;
    out.gl_Position.y = _1842;
    out.gl_Position.z = _2875;
    out.gl_Position.w = _1780;
    float _2941 = _2279 * _2417;
    float _2943 = fma(_2275, _2879, _1877);
    float _2945 = fma(_2277, _2879, _1879);
    float _2947 = _2939 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2949 = fma(_1883, _2941, _1881);
    out.m_94.x = _2947;
    float _2951 = _2911;
    float _2953 = _2915;
    float _2955 = _2917;
    float _2957 = _2909;
    float _2959 = _2939;
    if (!_2933)
    {
        _2951 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2961 = _2951;
    float _2963 = _2961;
    float _2965 = _2961;
    if (!_2933)
    {
        _2953 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2967 = _2953;
    out.m_96.x = _2943;
    out.m_96.y = _2945;
    out.m_96.z = _2949;
    out.m_96.w = _2923;
    float _2969 = _2967;
    float _2971 = _2967;
    if (!_2933)
    {
        _2887 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2973 = _2887;
    float _2975 = _2973;
    float _2977 = _2973;
    if (!_2933)
    {
        _2955 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2979 = _2955;
    float _2981 = _2979;
    float _2983 = _2979;
    if (!_2933)
    {
        _2957 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2985 = _2957;
    float _2987 = _2985;
    float _2989 = _2985;
    if (!_2933)
    {
        _2959 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2991 = _2959;
    bool _2993 = !_2933;
    float _2995 = _2991;
    float _2997 = _2991;
    if (!_2993)
    {
        bool _2999 = _2047 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3001 = isnan(_2047);
        bool _3003 = _2999 || _3001;
        bool _3005 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3007 = _3003 || _3005;
        if (!_3007)
        {
            float _3009 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3011 = _2047 + _3009;
            float _3013 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3015 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3013;
            float _3017 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3019 = _3017 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3021 = 1.0 / _3015;
            float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3025 = _3023 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3027 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3029 = _3027 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3031 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3033 = _3031 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3037 = _3035 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3039 = _3011 * _3021;
            float _3041 = precise::clamp(_3039, 0.0, 1.0);
            float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3047 = fma(_3041, _3019, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3049 = fma(_3041, _3045, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3051 = fma(_3041, _3025, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3053 = fma(_3041, _3029, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3055 = fma(_3041, _3033, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3057 = fma(_3041, _3037, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2971 = _3051;
            _2989 = _3055;
            _2965 = _3047;
            _2983 = _3053;
            _2977 = _3049;
            _2997 = _3057;
            _3059 = true;
        }
        else
        {
            bool _3061 = _2047 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3063 = isnan(_2047);
            bool _3065 = _3061 || _3063;
            bool _3067 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3069 = _3065 || _3067;
            if (!_3069)
            {
                _2963 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3071 = _2963;
            _2965 = _3071;
            if (!_3069)
            {
                _2969 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3073 = _2969;
            _2971 = _3073;
            if (!_3069)
            {
                _2975 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3075 = _2975;
            _2977 = _3075;
            if (!_3069)
            {
                _2981 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3077 = _2981;
            _2983 = _3077;
            if (!_3069)
            {
                _2987 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3079 = _2987;
            _2989 = _3079;
            if (!_3069)
            {
                _2995 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3081 = _2995;
            bool _3083 = !_3069;
            _2997 = _3081;
            if (!_3083)
            {
                bool _3085 = _2047 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3087 = isnan(_2047);
                bool _3089 = _3085 || _3087;
                bool _3091 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3093 = _3089 || _3091;
                if (!_3093)
                {
                    float _3095 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3097 = _2047 + _3095;
                    float _3099 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3101 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3099;
                    float _3103 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3105 = _3103 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3107 = 1.0 / _3101;
                    float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3117 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3119 = _3117 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3123 = _3121 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3125 = _3097 * _3107;
                    float _3127 = precise::clamp(_3125, 0.0, 1.0);
                    float _3129 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3131 = _3129 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3133 = fma(_3127, _3105, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3135 = fma(_3127, _3131, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3137 = fma(_3127, _3111, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3139 = fma(_3127, _3115, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3141 = fma(_3127, _3119, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3143 = fma(_3127, _3123, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2971 = _3137;
                    _2989 = _3141;
                    _2965 = _3133;
                    _2983 = _3139;
                    _2977 = _3135;
                    _2997 = _3143;
                    _3059 = true;
                }
                else
                {
                    _2971 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2989 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2965 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2983 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2977 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2997 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3059 = false;
    float _3145 = _2971;
    float _3147 = _2989;
    float _3149 = _2965;
    float _3151 = _2983;
    float _3153 = _2977;
    float _3155 = _2997;
    float _3157 = fma(_2873, -0.5, 0.5);
    float _3159 = precise::clamp(_3157, 0.0, 1.0);
    float _3161 = -_3145;
    float _3163 = _3161 + _3147;
    float _3165 = -_3149;
    float _3167 = _3165 + _3151;
    float _3169 = -_3153;
    float _3171 = _3169 + _3155;
    bool _3173 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3175 = fma(_3159, _3163, _3145);
    float _3177 = fma(_3159, _3167, _3149);
    float _3179 = fma(_3159, _3171, _3153);
    float _3181 = _3175 * 0.586610972881317138671875;
    out.m_98.x = 0.0;
    float _3183 = fma(_3177, 0.298911988735198974609375, _3181);
    float _3185 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3187 = fma(_3179, 0.114477999508380889892578125, _3183);
    out.m_59.x = _3185;
    float _3189 = -_3187;
    float _3191 = _3177 + _3189;
    float _3193 = -_3187;
    float _3195 = _3175 + _3193;
    float _3197 = -_3187;
    float _3199 = _3179 + _3197;
    out.m_100.x = 0.0;
    float _3201 = fma(_3191, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3187);
    float _3203 = fma(_3195, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3187);
    float _3205 = fma(_3199, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3187);
    out.m_102.x = _3201;
    out.m_102.y = _3203;
    out.m_102.z = _3205;
    if (!_3173)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3207 = -_1670;
    float _3209 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3211 = -_1672;
    float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3215 = -_1674;
    float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3219 = _3209 * _3209;
    float _3221 = fma(_3213, _3213, _3219);
    float _3223 = fma(_3217, _3217, _3221);
    float _3225 = rsqrt(_3223);
    float _3227 = sqrt(_3223);
    float _3229 = _3209 * _3225;
    float _3231 = _3213 * _3225;
    float _3233 = _3217 * _3225;
    float _3235 = -_2053;
    float _3237 = _3235 + _3229;
    float _3239 = -_2049;
    float _3241 = _3239 + _3231;
    float _3243 = -_2051;
    float _3245 = _3243 + _3233;
    float _3247 = _3237 * _3237;
    float _3249 = -_3227;
    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3253 = fma(_3241, _3241, _3247);
    float _3255 = _3251 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3257 = precise::clamp(_3255, 0.0, 1.0);
    float _3259 = fma(_3245, _3245, _3253);
    float _3261 = abs(_3257);
    float _3263 = log2(_3261);
    float _3265 = rsqrt(_3259);
    float _3267 = _3263 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3269 = exp2(_3267);
    float _3271 = _3237 * _3265;
    float _3273 = _3241 * _3265;
    float _3275 = _3245 * _3265;
    float _3277 = _2873 * _3271;
    float _3279 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _3281 = precise::clamp(_3279, 0.0, 1.0);
    float _3283 = _2873 * _3229;
    float _3285 = fma(_2865, _3273, _3277);
    float _3287 = _3281 * _3281;
    float _3289 = fma(_2865, _3231, _3283);
    float _3291 = fma(_2867, _3275, _3285);
    float _3293 = precise::clamp(_3291, 0.0, 1.0);
    float _3295 = _3287 + (-1.0);
    float _3297 = fma(_2867, _3233, _3289);
    float _3299 = precise::clamp(_3297, 0.0, 1.0);
    float _3301 = _3293 * _3293;
    float _3303 = _3231 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3305 = fma(_3301, _3295, 1.0);
    float _3307 = -_3229;
    float _3309 = -_3303;
    float _3311 = fma(_3307, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3309);
    float _3313 = _3305 * _3305;
    float _3315 = -_3233;
    float _3317 = fma(_3315, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3311);
    float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3321 = _3317 + _3319;
    float _3323 = 1.0 / _3313;
    float _3325 = _3321 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3327 = precise::clamp(_3325, 0.0, 1.0);
    float _3329 = _3269 * _3327;
    float _3331 = _3299 * _3329;
    float _3333 = _3287 * _3323;
    float _3335 = _3331 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3337 = _3331 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3339 = _3331 * _3333;
    float _3341 = _3331 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _3343 = _3339 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3345 = _3339 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3347 = _3339 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _3335;
    out.m_98.y = _3337;
    out.m_98.z = _3341;
    out.m_100.x = _3343;
    out.m_100.y = _3345;
    out.m_100.z = _3347;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

