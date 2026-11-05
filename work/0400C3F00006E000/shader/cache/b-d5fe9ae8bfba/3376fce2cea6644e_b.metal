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
    float4 m_78 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_84 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_92 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(1)]];
    float4 m_72 [[attribute(2)]];
    float4 m_70 [[attribute(3)]];
    float4 m_74 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_76 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3191 = false;
    bool _351 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_59.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3496 = as_type<float>(_129);
        out.gl_Position.z = _3496;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_61.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_59.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3565 = as_type<float>(_167);
        out.gl_Position.z = _3565;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = in.m_63.x;
    float _171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _173 = _147 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _179 = _173 * _171;
    float _181 = _147 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _183 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[20].x, _179);
    float _185 = _181 * _177;
    float _187 = floor(_183);
    float _189 = _183 * 6.283185482025146484375;
    float _191 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[20].y, _185);
    int _193 = as_type<int>(_175) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_175) & 2;
    bool _199 = _197 != 0;
    float _201 = _189 * 0.15915493667125701904296875;
    float _203 = floor(_191);
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    float _209 = -_187;
    float _211 = _183 + _209;
    float _213 = _201 * 6.283185482025146484375;
    float _215 = cos(_213);
    float _217 = _191 * 6.283185482025146484375;
    bool _219 = !_199;
    float _221 = _219 ? (-0.5) : 0.5;
    int _223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _225 = _223 != 0;
    int _227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _229 = _227 != 0;
    float _231 = _217 * 0.15915493667125701904296875;
    bool _233 = !_207;
    int _235 = _233 ? 0 : 1;
    float _237 = -_203;
    float _239 = _191 + _237;
    bool _241 = _211 < 0.5;
    float _243 = float(_241);
    float _245 = -_211;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _249 = !_225;
    int _251 = _249 ? 0 : 1;
    float _253 = _231 * 6.283185482025146484375;
    float _255 = cos(_253);
    int _257 = abs(_235);
    float _259 = -_243;
    float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _263 = abs(_251);
    float _265 = fma(_215, 0.5, 0.5);
    bool _267 = !_229;
    int _269 = _267 ? 0 : 1;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _273 = -_265;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _277 = abs(_269);
    float _279 = float(_263);
    float _281 = fma(_255, 0.5, 0.5);
    float _283 = -_239;
    float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _287 = float(_257);
    bool _289 = _239 < 0.5;
    float _291 = float(_289);
    float _293 = abs(_247);
    float _295 = _279 * _293;
    float _297 = -_281;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _301 = abs(_285);
    float _303 = _279 * _301;
    float _305 = float(_277);
    float _307 = fma(_287, _275, _295);
    float _309 = -_291;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _313 = fma(_287, _299, _303);
    float _315 = abs(_261);
    float _317 = fma(_305, _315, _307);
    float _319 = abs(_311);
    float _321 = fma(_305, _319, _313);
    bool _323 = !_195;
    float _325 = _323 ? (-0.5) : 0.5;
    bool _327 = !_271;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _347;
    float _349;
    if (!_327)
    {
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _333 = _169 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _335 = float(_113);
        float _337 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _339 = _337 * _331;
        float _341 = floor(_339);
        float _343 = -_341;
        float _345 = _339 + _343;
        _347 = _345;
        _349 = _335;
        _351 = true;
    }
    else
    {
        float _353 = float(_113);
        float _355 = 1.0 / _353;
        float _357 = _147 * _355;
        _347 = _357;
        _349 = _353;
    }
    _351 = false;
    float _359 = _347;
    float _361 = _349;
    float _363 = in.m_56.x;
    float _365 = in.m_56.y;
    float _367 = in.m_56.z;
    float _369 = in.m_68.x;
    float _371 = in.m_68.y;
    float _373 = in.m_68.z;
    float _375 = in.m_68.w;
    float _377 = in.m_70.x;
    float _379 = in.m_70.y;
    float _381 = in.m_70.z;
    float _383 = in.m_70.w;
    float _385 = _365 * _371;
    float _387 = _365 * _379;
    float _389 = fma(_363, _369, _385);
    float _391 = fma(_363, _377, _387);
    float _393 = fma(_367, _373, _389);
    float _395 = fma(_367, _381, _391);
    float _397 = _393 + _375;
    float _399 = _395 + _383;
    float _401 = fma(_397, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _403 = fma(_399, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _405 = floor(_401);
    float _407 = floor(_403);
    float _409 = -_405;
    float _411 = _401 + _409;
    float _413 = -_407;
    float _415 = _403 + _413;
    float2 _3913 = float2(_411, _415);
    float _417 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3913, float2(0.0), isnan(_3913)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3913, float2(0.0), isnan(_3913)), level(0.0)).x;
    float _419 = in.m_72.x;
    float _421 = in.m_72.y;
    float _423 = in.m_72.z;
    float _425 = in.m_72.w;
    float _427 = _169 * 2.0;
    float _429 = in.m_63.y;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _431;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _437 = floor(_427);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _443 = _169 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _447 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _449 = isnan(_359);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -_435;
    float _461 = fma(_443, 2.0, _459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _463;
    float _467 = 1.0 / _441;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _471 = _365 * _421;
    float _473 = 1.0 / _433;
    float _475 = in.m_63.z;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _479 = _359 + _477;
    float _481 = fma(_363, _419, _471);
    bool _483 = _437 > 0.0;
    float _485 = _429 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _487 = _437 >= 0.0;
    bool _489 = isnan(_437);
    bool _491 = _487 || _489;
    bool _493 = isnan(0.0);
    bool _495 = _491 || _493;
    float _497 = fma(_367, _423, _481);
    float _499 = _479 * _467;
    float _501 = _169 + _429;
    float _503 = 1.0 / _465;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _507 = _359 + _505;
    float _509 = _501 + (-1.0);
    float _511 = _429 * 2.0;
    float _513 = _507 * _473;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _517 = _359 + _515;
    float _519 = floor(_511);
    float _521 = _497 + _425;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _533 = _531 != 0;
    float _535 = fma(_485, -2.0, _445);
    float _537 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[78].z, _469);
    float _539 = _169 + _475;
    float _541 = _429 + _475;
    float _543 = _517 * _503;
    float _545 = _539 + (-1.0);
    float _547 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _549 = _541 + (-1.0);
    float _551 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _553 = log2(_551);
    float _555 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _557 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _559;
    bool _563 = _519 > 0.0;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _565;
    float _569 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _571 = int(_569);
    bool _573 = _519 >= 0.0;
    bool _575 = isnan(_519);
    bool _577 = _573 || _575;
    bool _579 = isnan(0.0);
    bool _581 = _577 || _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _587;
    int _591 = _495 ? 0 : 1;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _601 = _475 * 2.0;
    float _603 = _553 * _147;
    float _605 = fma(_595, _499, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _607 = fma(_599, _499, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _609 = ~_591;
    int _611 = _609 + 1;
    int _613 = _611 + 1;
    float _615 = exp2(_603);
    int _617 = _613;
    if (!_483)
    {
        int _619 = ~_591;
        int _621 = _619 + 1;
        _617 = _621;
    }
    int _623 = _617;
    float _625 = fma(_567, _543, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _627 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _629 = isnan(_359);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = fma(_561, _543, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _641 = float(_571);
    float _643 = fma(_585, _513, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _645 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _647 = int(_645);
    bool _649 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _651 = isnan(_359);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = fma(_589, _513, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _663 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _665 = isnan(_359);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _677 = 1.0 + _675;
    bool _679 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _681 = isnan(0.0);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _687 = _683 || _685;
    float _689 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _691 = !_529;
    int _693 = _691 ? 0 : 1;
    float _695 = -_615;
    float _697 = _695 + 1.0;
    float _699 = 1.0 / _641;
    float _701 = -_673;
    float _703 = _701 + 1.0;
    bool _705 = !_525;
    int _707 = _705 ? 0 : 1;
    float _709 = _521 + _689;
    float _711 = _687 ? _697 : 0.0;
    float _713 = _659 * _703;
    bool _715 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _717 = isnan(1.0);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _723 = _719 || _721;
    float _725 = -_659;
    float _727 = _725 + 1.0;
    float _729 = 1.0 / _677;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _733 = float(_647);
    float _735 = _637 * _727;
    float _737 = -_637;
    float _739 = _737 + 1.0;
    float _741 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[78].w, _731);
    float _743 = -_147;
    float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[76].x, _461);
    float _747 = _733 * _147;
    float _749 = floor(_601);
    float _751 = _699 * _147;
    float _753 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _537);
    float _755 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _535);
    float _757 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _741);
    bool _759 = !_533;
    int _761 = _759 ? 0 : 1;
    float _763 = _457 * _739;
    float _765 = _521 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _767 = _747;
    float _769 = _709;
    if (_723)
    {
        float _771 = _711 * _729;
        _151 = _771;
    }
    float _773 = _151;
    float _775 = float(_623);
    float _777 = _661 * _763;
    float _779 = fma(_397, (*spvDescriptorSet0.vp_c8)._m0[11].x, _765);
    float _781 = _643 * _763;
    int _783 = _581 ? 0 : 1;
    float _785 = -_457;
    float _787 = _785 + 1.0;
    float _789 = _475 + (-0.5);
    bool _791 = _749 > 0.0;
    bool _793 = _749 >= 0.0;
    bool _795 = isnan(_749);
    bool _797 = _793 || _795;
    bool _799 = isnan(0.0);
    bool _801 = _797 || _799;
    float _803 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[143].x, _781);
    float _805 = in.m_74.x;
    float _807 = in.m_74.y;
    float _809 = in.m_74.z;
    float _811 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[143].y, _777);
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _815 = _813 != 0;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _819 = _817 != 0;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _823 = _821 != 0;
    float _825 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _827 = _801 ? 0 : 1;
    float _829 = fma(_607, _735, _811);
    bool _831 = !_815;
    int _833 = _831 ? 0 : 1;
    int _835 = ~_827;
    int _837 = _835 + 1;
    int _839 = _837 + 1;
    float _841 = fma(_639, _713, _829);
    int _843 = _839;
    if (!_791)
    {
        int _845 = ~_827;
        int _847 = _845 + 1;
        _843 = _847;
    }
    int _849 = _843;
    bool _851 = !_819;
    int _853 = _851 ? 0 : 1;
    int _855 = abs(_833);
    float _857 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[11].z, _779);
    int _859 = abs(_853);
    float _861 = _521 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _863 = float(_855);
    float _865 = _857 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _867 = float(_859);
    float _869 = fma(_397, (*spvDescriptorSet0.vp_c8)._m0[10].x, _861);
    float _871 = _709 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _873 = 1.0 / _865;
    float _875 = float(_849);
    float _877 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[10].z, _869);
    float _879 = fma(_397, (*spvDescriptorSet0.vp_c15)._m0[126].x, _871);
    float _881 = _867 * _775;
    float _883 = _709 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _885 = _877 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _887 = _863 * _875;
    float _889 = fma(_399, (*spvDescriptorSet0.vp_c15)._m0[126].z, _879);
    bool _891 = !_823;
    int _893 = _891 ? 0 : 1;
    float _895 = _885 + _865;
    float _897 = _429 + (-0.5);
    float _899 = _889 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _901 = abs(_893);
    float _903 = _887 * (-2.0);
    int _905 = ~_783;
    int _907 = _905 + 1;
    int _909 = _907 + 1;
    float _911 = _895 * _873;
    float _913 = _911 * 0.5;
    float _915 = _881 * (-2.0);
    float _917 = float(_901);
    float _919 = fma(_397, (*spvDescriptorSet0.vp_c15)._m0[127].x, _883);
    float _921 = fma(_915, _807, _807);
    float _923 = fma(_557, _915, _557);
    int _925 = _909;
    if (!_563)
    {
        int _927 = ~_783;
        int _929 = _927 + 1;
        _925 = _929;
    }
    int _931 = _925;
    float _933 = fma(_399, (*spvDescriptorSet0.vp_c15)._m0[127].z, _919);
    float _935 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[196].y, _921);
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _939 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[30].w, _937);
    float _941 = fma(_547, _903, _547);
    float _943 = float(_931);
    float _945 = fma(_923, _773, _935);
    float _947 = fma(_903, _805, _805);
    float _949 = _169 + (-0.5);
    float _951 = _933 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _953 = _945 * 0.15915493667125701904296875;
    float _955 = _917 * _943;
    float _957 = in.m_76.x;
    float _959 = in.m_76.y;
    float _961 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[196].x, _947);
    float _963 = fma(_605, _735, _803);
    float _965 = trunc(_899);
    int _967 = int(_965);
    float _969 = _955 * (-2.0);
    float _971 = fma(_941, _773, _961);
    float _973 = fma(_625, _713, _963);
    float _975 = fma(_969, _809, _809);
    float _977 = fma(_555, _969, _555);
    float _979 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[146].x, _973);
    float _981 = trunc(_951);
    int _983 = int(_981);
    float _985 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[146].y, _841);
    float _987 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[196].z, _975);
    float _989 = _971 * 0.15915493667125701904296875;
    float _991 = fma(_977, _773, _987);
    float _993 = 1.0 / _939;
    int _995 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _997 = _967 + _995;
    int _999 = _997 + 1;
    float _1001 = _991 * 0.15915493667125701904296875;
    float _1003 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _1005 = _985 * _959;
    float _1007 = _979 * _957;
    bool _1009 = _999 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1011 = _953 * 6.283185482025146484375;
    float _1013 = sin(_1011);
    float _1015 = _321 * _1005;
    int _1017 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1019 = _983 + _1017;
    int _1021 = _1019 + 1;
    float _1023 = _317 * _1007;
    float _1025 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _325);
    float _1027 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1029 = _999 | _1021;
    float _1031 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1035 = _993 * _1033;
    float _1037 = _953 * 6.283185482025146484375;
    float _1039 = cos(_1037);
    bool _1041 = _1029 < 0;
    bool _1043 = _1041 || _1009;
    float _1045 = _1031 * _1025;
    float _1047 = _1027 * _1003;
    bool _1049 = _1035 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1051 = _1035 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1053 = _989 * 6.283185482025146484375;
    float _1055 = sin(_1053);
    bool _1057 = _1021 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1059 = _1057 || _1043;
    bool _1061 = !_1049;
    int _1063 = _1061 ? 0 : 1;
    float _1065 = _1001 * 6.283185482025146484375;
    float _1067 = cos(_1065);
    int _1069 = 2;
    int _1071 = _999;
    int _1073 = as_type<int>(_977);
    if (!_1049)
    {
        _1069 = 1;
    }
    int _1075 = _1069;
    int _1077 = _1075;
    if (!_1051)
    {
        _1077 = _1063;
    }
    int _1079 = _1077;
    bool _1081 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1083 = isnan(0.5);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1089 = _1085 || _1087;
    if (!_1059)
    {
        int _1091 = _1021 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1093 = _1091 + _999;
        _1071 = _1093;
    }
    int _1095 = _1071;
    int _1097 = _1079 << 6;
    float _1099 = _989 * 6.283185482025146484375;
    float _1101 = cos(_1099);
    float _1103 = _1055 * _1013;
    float _1105 = _1055 * _1039;
    float _1107 = as_type<float>(_1095);
    if (!_1059)
    {
        int _1109 = _1095 << 2;
        _1073 = _1109;
    }
    int _1111 = _1073;
    int _1113 = _1097 + 72;
    uint _1116 = uint(int(uint(_1113) >> uint(2)));
    uint _1118 = uint(int(uint(int(_1116)) >> uint(2)));
    int _1120 = int(_1116) & 3;
    float _1122 = (*spvDescriptorSet0.vp_c15)._m0[int(_1118)][_1120];
    int _1124 = int(_1116) + 1;
    uint _1126 = uint(int(uint(_1124) >> uint(2)));
    int _1128 = _1124 & 3;
    float _1130 = (*spvDescriptorSet0.vp_c15)._m0[int(_1126)][_1128];
    int _1132 = _1111;
    if (!_1059)
    {
        int _1134 = 12 & _1111;
        _1132 = _1134;
    }
    int _1136 = _1132;
    float _1138 = _1001 * 6.283185482025146484375;
    float _1140 = sin(_1138);
    float _1142 = _1055 * _1067;
    float _1144 = _1039 * _1067;
    int _1146 = _1097 + 56;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    uint _1150 = uint(int(uint(int(_1148)) >> uint(2)));
    int _1152 = int(_1148) & 3;
    float _1154 = (*spvDescriptorSet0.vp_c15)._m0[int(_1150)][_1152];
    int _1156 = int(_1148) + 1;
    uint _1158 = uint(int(uint(_1156) >> uint(2)));
    int _1160 = _1156 & 3;
    float _1162 = (*spvDescriptorSet0.vp_c15)._m0[int(_1158)][_1160];
    float _1164 = _1142 * _1047;
    float _1166 = _1101 * _1039;
    float _1168 = _1101 * _1013;
    float _1170 = _1101 * _1067;
    float _1172 = _1013 * _1067;
    float _1174 = 0.0;
    if (!_1059)
    {
        float _1176 = floor(_899);
        _1174 = _1176;
    }
    float _1178 = _1174;
    float _1180 = _1170 * _1047;
    float _1182 = fma(_1140, _1166, _1103);
    float _1184 = -_1168;
    float _1186 = fma(_1140, _1105, _1184);
    float _1188 = -_1105;
    float _1190 = fma(_1140, _1168, _1188);
    float _1192 = fma(_1140, _1103, _1166);
    int _1194 = _1097 + 96;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    uint _1198 = uint(int(uint(int(_1196)) >> uint(2)));
    int _1200 = int(_1196) & 3;
    float _1202 = (*spvDescriptorSet0.vp_c15)._m0[int(_1198)][_1200];
    int _1204 = int(_1196) + 1;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    int _1208 = _1204 & 3;
    float _1210 = (*spvDescriptorSet0.vp_c15)._m0[int(_1206)][_1208];
    float _1212 = fma(_1182, _1045, _1180);
    float _1214 = -_1047;
    float _1216 = _1140 * _1214;
    float _1218 = fma(_1186, _1045, _1164);
    float _1220 = fma(_1190, _825, _1212);
    float _1222 = fma(_1144, _1045, _1216);
    float _1224 = fma(_1192, _825, _1218);
    int _1226 = _1097 + 48;
    uint _1228 = uint(int(uint(_1226) >> uint(2)));
    uint _1230 = uint(int(uint(int(_1228)) >> uint(2)));
    int _1232 = int(_1228) & 3;
    float _1234 = (*spvDescriptorSet0.vp_c15)._m0[int(_1230)][_1232];
    int _1236 = int(_1228) + 1;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    int _1240 = _1236 & 3;
    float _1242 = (*spvDescriptorSet0.vp_c15)._m0[int(_1238)][_1240];
    float _1244 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1246 = fma(_1172, _825, _1222);
    float _1248 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1250 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1252 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1244);
    float _1254 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1248);
    int _1256 = _1097 + 104;
    uint _1258 = uint(int(uint(_1256) >> uint(2)));
    uint _1260 = uint(int(uint(int(_1258)) >> uint(2)));
    int _1262 = int(_1258) & 3;
    float _1264 = (*spvDescriptorSet0.vp_c15)._m0[int(_1260)][_1262];
    int _1266 = int(_1258) + 1;
    uint _1268 = uint(int(uint(_1266) >> uint(2)));
    int _1270 = _1266 & 3;
    float _1272 = (*spvDescriptorSet0.vp_c15)._m0[int(_1268)][_1270];
    int _1274 = as_type<int>(_1244);
    float _1276 = _1250;
    if (!_1059)
    {
        uint _1278 = uint(int(uint(_1095) >> uint(2)));
        _1274 = int(_1278);
    }
    int _1280 = _1274;
    float _1282 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1252);
    float _1284 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1254);
    float _1286 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1250);
    int _1288 = 0;
    if (!_1059)
    {
        int _1290 = _1280 << 4;
        int _1292 = _1290 + _1136;
        _1288 = _1292;
    }
    int _1294 = _1288;
    float _1296 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1298 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1300 = _1097 + 64;
    uint _1302 = uint(int(uint(_1300) >> uint(2)));
    uint _1304 = uint(int(uint(int(_1302)) >> uint(2)));
    int _1306 = int(_1302) & 3;
    float _1308 = (*spvDescriptorSet0.vp_c15)._m0[int(_1304)][_1306];
    int _1310 = int(_1302) + 1;
    uint _1312 = uint(int(uint(_1310) >> uint(2)));
    int _1314 = _1310 & 3;
    float _1316 = (*spvDescriptorSet0.vp_c15)._m0[int(_1312)][_1314];
    if (!_1059)
    {
        float _1318 = floor(_951);
        _1276 = _1318;
    }
    float _1320 = _1276;
    float _1322 = _399 + _1296;
    float _1324 = _397 + _1298;
    float _1326 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1286);
    float _1328 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1330 = _1322 + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1334 = _1324 + _1332;
    int _1336 = _1097 + 80;
    uint _1338 = uint(int(uint(_1336) >> uint(2)));
    uint _1340 = uint(int(uint(int(_1338)) >> uint(2)));
    int _1342 = int(_1338) & 3;
    float _1344 = (*spvDescriptorSet0.vp_c15)._m0[int(_1340)][_1342];
    int _1346 = int(_1338) + 1;
    uint _1348 = uint(int(uint(_1346) >> uint(2)));
    int _1350 = _1346 & 3;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[int(_1348)][_1350];
    float _1354 = _1330 * _1330;
    float _1356 = fma(_1334, _1334, _1354);
    int _1358 = _1097 + 88;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    uint _1362 = uint(int(uint(int(_1360)) >> uint(2)));
    int _1364 = int(_1360) & 3;
    float _1366 = (*spvDescriptorSet0.vp_c15)._m0[int(_1362)][_1364];
    int _1368 = int(_1360) + 1;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    int _1372 = _1368 & 3;
    float _1374 = (*spvDescriptorSet0.vp_c15)._m0[int(_1370)][_1372];
    float _1376 = sqrt(_1356);
    float _1378 = _1284;
    float _1380 = _1322;
    float _1382 = _1356;
    if (!_1059)
    {
        int _1384 = _1294 + 400;
        uint _1386 = uint(int(uint(_1384) >> uint(2)));
        uint _1388 = uint(int(uint(int(_1386)) >> uint(2)));
        int _1390 = int(_1386) & 3;
        float _1392 = (*spvDescriptorSet0.vp_c15)._m0[int(_1388)][_1390];
        _1378 = _1392;
    }
    float _1394 = _1378;
    float _1396 = _709 * _1210;
    float _1398 = fma(_397, _1202, _1396);
    float _1400 = _709 * _1242;
    bool _1402 = _1376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1404 = fma(_397, _1234, _1400);
    float _1406 = fma(_399, _1264, _1398);
    float _1408 = _1406 + _1272;
    float _1410 = _709 * _1316;
    float _1412 = fma(_397, _1308, _1410);
    float _1414 = fma(_399, _1154, _1404);
    float _1416 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1418 = 1.0 / _1408;
    float _1420 = fma(_399, _1122, _1412);
    float _1422 = _1414 + _1162;
    float _1424 = _521 + _1416;
    float _1426 = _1416;
    float _1428 = _1424;
    float _1430 = _1408;
    if (!_1402)
    {
        _1426 = _1324;
    }
    float _1432 = _1426;
    float _1434 = _1420 + _1130;
    bool _1436 = !_1402;
    float _1438 = _1432;
    if (!_1436)
    {
        float _1440 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1444 = _1376 + _1442;
        float _1446 = rsqrt(_1356);
        float _1448 = _1444 * _1440;
        float _1450 = _1424 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1452 = _1448 * 0.15915493667125701904296875;
        float _1454 = _1452 * 6.283185482025146484375;
        float _1456 = cos(_1454);
        float _1458 = _1452 * 6.283185482025146484375;
        float _1460 = sin(_1458);
        float _1462 = _1456 + (-1.0);
        float _1464 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1466 = fma(_1460, _1450, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1468 = fma(_1424, _1456, _1464);
        float _1470 = _1446 * _1466;
        float _1472 = fma(_1334, _1470, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1474 = fma(_1330, _1470, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1438 = _1472;
        _1380 = _1474;
        _1428 = _1468;
        _1382 = _1446;
        _1430 = _1452;
    }
    float _1476 = _1438;
    float _1478 = _1380;
    float _1480 = _1428;
    float _1482 = _1382;
    float _1484 = _1430;
    float _1486 = _1480;
    float _1488 = _1476;
    float _1490 = _1478;
    float _1492 = _1484;
    float _1494 = _1482;
    if (!_1089)
    {
        float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1498 = _521 + _1496;
        float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1502 = _397 + _1500;
        float _1504 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1506 = -_397;
        float _1508 = _1506 + _1476;
        float _1510 = _1498 * _1498;
        float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1514 = _399 + _1512;
        float _1516 = -_399;
        float _1518 = _1516 + _1478;
        float _1520 = fma(_1502, _1502, _1510);
        float _1522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1524 = fma(_1514, _1514, _1520);
        float _1526 = sqrt(_1524);
        float _1528 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1530 = precise::min(_1526, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1532 = _1530 * _1522;
        float _1534 = -_521;
        float _1536 = _1534 + _1480;
        float _1538 = _1528 * _1532;
        float _1540 = fma(_1536, _1538, _521);
        float _1542 = fma(_1508, _1538, _397);
        float _1544 = fma(_1518, _1538, _399);
        _1486 = _1540;
        _1488 = _1542;
        _1490 = _1544;
        _1492 = _1538;
    }
    float _1546 = _1486;
    float _1548 = _1488;
    float _1550 = _1490;
    float _1552 = _1492;
    float _1554 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1556 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1558 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1560 = _1422 * _1418;
    float _1562 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1554);
    float _1564 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1556);
    float _1566 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1558);
    float _1568 = _1552;
    if (!_1059)
    {
        float _1570 = rint(_1394);
        float _1572 = precise::max(_1570, 0.0);
        uint _1574 = uint(_1572);
        uint _1576 = clamp(_1574, 0u, 65535u);
        _1568 = as_type<float>(_1576);
    }
    float _1578 = _1568;
    float _1580 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1562);
    bool _1582 = _1560 >= 0.0;
    float _1584 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1564);
    float _1586 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1588 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1566);
    float _1590 = _1434 * _1418;
    bool _1592 = _1560 <= 1.0;
    bool _1594 = _1592 && _1582;
    float _1596 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1598 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1600 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1586);
    float _1602 = _1588 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1604 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1606 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1608 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1610 = _1590 >= 0.0;
    bool _1612 = _1610 && _1594;
    float _1614 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1600);
    float _1616 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1606);
    float _1618 = -_1608;
    float _1620 = fma(_1618, _1604, 1.0);
    bool _1622 = _1590 <= 1.0;
    bool _1624 = _1622 && _1612;
    float _1626 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1628 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1616);
    float _1630 = _709 * _1352;
    float _1632 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1634 = log2(_1620);
    float _1636 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1628);
    float _1638 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1640 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1632);
    float _1642 = fma(_397, _1344, _1630);
    float _1644 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1638);
    float _1646 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1640);
    float _1648 = 1.0 / _1636;
    float _1650 = _1638;
    float _1652 = _1646;
    if (_1624)
    {
        float _1654 = float(_1079);
        _1494 = _1654;
    }
    float _1656 = _1494;
    float _1658 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1644);
    float _1660 = fma(_399, _1366, _1642);
    if (!_1059)
    {
        float _1662 = -_1320;
        float _1664 = _951 + _1662;
        _1650 = _1664;
    }
    float _1666 = _1650;
    float _1668 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1646);
    float _1670 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1658);
    float _1672 = _1660 + _1374;
    float _1674 = _1632;
    if (_1624)
    {
        float _1676 = rint(_1656);
        float _1678 = precise::max(_1676, 0.0);
        uint _1680 = uint(_1678);
        uint _1682 = clamp(_1680, 0u, 65535u);
        _1674 = as_type<float>(_1682);
    }
    float _1684 = _1674;
    float _1686 = _1634 * 0.693147182464599609375;
    if (!_1059)
    {
        float _1688 = -_1178;
        float _1690 = _899 + _1688;
        _1652 = _1690;
    }
    float _1692 = _1652;
    float _1694 = _1672 * _1418;
    float _1696 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1698 = _1668 * _1648;
    float _1700 = _1670 * _1648;
    float _1702 = fma(_1698, 0.5, 0.5);
    float _1704 = fma(_1700, -0.5, 0.5);
    float _1706 = _1178;
    if (!_1059)
    {
        float3 _5965 = float3(_1692, _1666, float(as_type<int>(_1578)));
        float3 _5969 = select(_5965, float3(0.0), isnan(_5965));
        float _1708 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5969.xy, uint(rint(_5969.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5969.xy, uint(rint(_5969.z)), level(0.0)).x;
        _1706 = _1708;
    }
    float _1710 = _1706;
    float _1712 = _1590;
    if (_1624)
    {
        float3 _5984 = float3(_1560, _1590, float(as_type<int>(_1684)));
        float3 _5986 = select(_5984, float3(0.0), isnan(_5984));
        float _1714 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5986.xy, uint(rint(_5986.z)), _1694, level(0.0));
        _1712 = _1714;
    }
    float _1716 = _1712;
    float3 _5996 = float3(_1702, _1704, _1696);
    float _1718 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5996, float3(0.0), isnan(_5996)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5996, float3(0.0), isnan(_5996)), level(0.0)).x;
    float3 _6005 = float3(_1702, _1704, _1696);
    float4 _1721 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6005, float3(0.0), isnan(_6005)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6005, float3(0.0), isnan(_6005)), level(0.0)).xyzw;
    float _1723 = _1721.x;
    float _1725 = _1721.y;
    float _1727 = _1721.z;
    float _1729 = _1721.w;
    float _1731 = float(uint(_647));
    float _1733 = trunc(_751);
    int _1735 = int(_1733);
    int _1737 = abs(_707);
    float _1739 = 1.0 / _1731;
    int _1741 = ~_647;
    int _1743 = _1741 + 1;
    int _1745 = ~_647;
    int _1747 = _1745 + 1;
    float _1749 = 1.0 / _361;
    float _1751 = float(uint(_1735));
    int _1753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1755 = _1753 != 0;
    int _1757 = as_type<int>(_1739) + (-2);
    float _1759 = as_type<float>(_1757) * _1751;
    float _1761 = trunc(_1759);
    float _1763 = precise::max(_1761, 0.0);
    uint _1765 = uint(_1763);
    int _1767 = _1743 * int(_1765);
    int _1769 = _1767 + _1735;
    float _1771 = float(uint(_1769));
    float _1773 = as_type<float>(_1757) * _1771;
    int _1775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1777 = _1775 != 0;
    float _1779 = float(_1735);
    float _1781 = trunc(_1773);
    float _1783 = precise::max(_1781, 0.0);
    uint _1785 = uint(_1783);
    bool _1787 = !_1777;
    float _1789 = _1787 ? 7.345489978790283203125 : 1.0;
    bool _1791 = _1779 >= _733;
    bool _1793 = isnan(_1779);
    bool _1795 = _1791 || _1793;
    bool _1797 = isnan(_733);
    bool _1799 = _1795 || _1797;
    float _1801 = float(_1799);
    float _1803 = _1789 * _169;
    float _1805 = trunc(_1801);
    int _1807 = int(_1805);
    int _1809 = int(_1765) + int(_1785);
    float _1811 = floor(_1803);
    int _1813 = _1747 * _1809;
    int _1815 = _1813 + _1735;
    bool _1817 = uint(_1815) >= uint(_647);
    int _1819 = ~_1807;
    int _1821 = _1819 + 1;
    int _1823 = _1821 + 1;
    bool _1825 = !_1817;
    int _1827 = _1825 ? 0 : (-1);
    bool _1829 = _647 == 0;
    float _1831 = -_1811;
    float _1833 = _1803 + _1831;
    int _1835 = ~_1809;
    int _1837 = _1835 + _1827;
    int _1839 = _1837 + 1;
    float _1841 = _747 * _1749;
    int _1843 = abs(_761);
    float _1845 = _1833 * _733;
    bool _1847 = !_1755;
    float _1849 = _1847 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1851 = _647 * _1839;
    int _1853 = _1851 + _1735;
    int _1855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1857 = _1855 != 0;
    float _1859 = trunc(_1841);
    int _1861 = int(_1859);
    float _1863 = _1849;
    if (_1059)
    {
        _767 = 1.0;
    }
    float _1865 = _767;
    bool _1867 = !_1829;
    int _1869 = _1867 ? _1853 : (-1);
    int _1871 = _647 + (-1);
    float _1873 = trunc(_1845);
    int _1875 = int(_1873);
    int _1877 = _1869 * _1823;
    int _1879 = abs(_693);
    int _1881 = abs(as_type<int>(_1849));
    int _1883 = _1807 * _1871;
    int _1885 = _1883 + _1877;
    bool _1887 = !_1857;
    int _1889 = _1887 ? 0 : 1;
    int _1891 = _1885 * _1879;
    bool _1893 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1895 = isnan(0.5);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1901 = _1897 || _1899;
    int _1903 = abs(_1889);
    int _1905 = _1861 * _1737;
    int _1907 = _1905 + _1891;
    int _1909 = _1875 * _1881;
    int _1911 = _1909 + _1735;
    int _1913 = _1911 * _1843;
    int _1915 = _1913 + _1907;
    int _1917 = _1875 * _1903;
    int _1919 = _1917 + _1915;
    int _1921 = ~_647;
    int _1923 = _1921 + 1;
    float _1925 = _1865;
    if (_1901)
    {
        _329 = 1.0;
    }
    float _1927 = _329;
    float _1929 = float(uint(_1919));
    float _1931 = _1927;
    if (_1901)
    {
        _1863 = 1.0;
    }
    float _1933 = _1863;
    float _1935 = as_type<float>(_1757) * _1929;
    float _1937 = trunc(_1935);
    float _1939 = precise::max(_1937, 0.0);
    uint _1941 = uint(_1939);
    int _1943 = _1923 * int(_1941);
    int _1945 = _1943 + _1919;
    float _1947 = float(uint(_1945));
    float _1949 = as_type<float>(_1757) * _1947;
    float _1951 = trunc(_1949);
    float _1953 = precise::max(_1951, 0.0);
    uint _1955 = uint(_1953);
    int _1957 = int(_1941) + int(_1955);
    float _1959 = _1933;
    if (!_1901)
    {
        float _1961 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1963 = _1961 * 0.15915493667125701904296875;
        float _1965 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1967 = _1963 * 6.283185482025146484375;
        float _1969 = cos(_1967);
        float _1971 = _1965 * 0.15915493667125701904296875;
        float _1973 = _1963 * 6.283185482025146484375;
        float _1975 = sin(_1973);
        float _1977 = 1.0 / _1969;
        float _1979 = _1971 * 6.283185482025146484375;
        float _1981 = cos(_1979);
        float _1983 = _1975 * _1977;
        float _1985 = _1971 * 6.283185482025146484375;
        float _1987 = sin(_1985);
        float _1989 = _1981 * _1983;
        float _1991 = 1.0 / _1989;
        float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1995 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1993;
        float _1997 = 1.0 / _1995;
        float _1999 = _1987 * _1991;
        float _2001 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2003 = fma(_1035, _1999, _2001);
        float _2005 = _2003 * _1997;
        float _2007 = precise::clamp(_2005, 0.0, 1.0);
        _1959 = _2007;
    }
    float _2009 = _1959;
    if (!_1901)
    {
        float _2011 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2013 = _2011 * 0.15915493667125701904296875;
        float _2015 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2017 = _2013 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        float _2021 = _2015 * 0.15915493667125701904296875;
        float _2023 = _2013 * 6.283185482025146484375;
        float _2025 = sin(_2023);
        float _2027 = 1.0 / _2019;
        float _2029 = _2021 * 6.283185482025146484375;
        float _2031 = cos(_2029);
        float _2033 = _2025 * _2027;
        float _2035 = _2021 * 6.283185482025146484375;
        float _2037 = sin(_2035);
        float _2039 = _2031 * _2033;
        float _2041 = 1.0 / _2039;
        float _2043 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2045 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2043;
        float _2047 = 1.0 / _2045;
        float _2049 = _2037 * _2041;
        float _2051 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2053 = fma(_1035, _2049, _2051);
        float _2055 = _2053 * _2047;
        float _2057 = precise::clamp(_2055, 0.0, 1.0);
        float _2059 = -_2057;
        float _2061 = _2059 + 1.0;
        _1931 = _2061;
    }
    float _2063 = _1931;
    if (!_1059)
    {
        int _2065 = _1095 << 4;
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
        float _2103 = _709 * _2083;
        float _2105 = fma(_397, _2075, _2103);
        float _2107 = fma(_399, _2093, _2105);
        float _2109 = _2107 + _2101;
        float _2111 = precise::clamp(_2109, 0.0, 1.0);
        float _2113 = -_2111;
        float _2115 = _2113 + _1710;
        float _2117 = fma(_2115, 500.0, 1.5);
        float _2119 = exp2(_2117);
        float _2121 = 0.0 + _2119;
        float _2123 = precise::clamp(_2121, 0.0, 1.0);
        _769 = _2103;
        _1107 = as_type<float>(_2067);
        _1925 = _2123;
    }
    float _2125 = _769;
    float _2127 = _1107;
    float _2129 = _1925;
    float _2131 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2133 = _1546 + _2131;
    float _2135 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2137 = _1548 + _2135;
    float _2139 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2141 = _1550 + _2139;
    float _2143 = _2133 * _2133;
    float _2145 = fma(_2137, _2137, _2143);
    float _2147 = fma(_2141, _2141, _2145);
    float _2149 = rsqrt(_2147);
    float _2151 = sqrt(_2147);
    float _2153 = _2149 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2155 = _2137 * _2153;
    float _2157 = _2141 * _2153;
    float _2159 = _2155 * _2155;
    float _2161 = _2157 * _2157;
    float _2163 = _2159 + _2161;
    float _2165 = sqrt(_2163);
    bool _2167 = _2165 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2171 = _2165 + _2169;
    float _2173 = _2125;
    float _2175 = _2163;
    float _2177 = _2171;
    float _2179 = _2127;
    float _2181 = _2155;
    float _2183 = _2157;
    float _2185 = _2159;
    float _2187 = _2161;
    if (_2167)
    {
        float _2189 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2173 = _2189;
    }
    float _2191 = _2173;
    if (_2167)
    {
        float _2193 = rsqrt(_2163);
        _2175 = _2193;
    }
    float _2195 = _2175;
    if (_2167)
    {
        float _2197 = _2171 * _2191;
        _2177 = _2197;
    }
    float _2199 = _2177;
    if (_2167)
    {
        float _2201 = _2199 * 0.15915493667125701904296875;
        _2179 = _2201;
    }
    float _2203 = _2179;
    float _2205 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2207 = _399;
    if (_2167)
    {
        float _2209 = _2203 * 6.283185482025146484375;
        float _2211 = sin(_2209);
        _2207 = _2211;
    }
    float _2213 = _2207;
    float _2215 = precise::max(0.0, _2205);
    float _2217 = _2199;
    float _2219 = _2215;
    if (_2167)
    {
        float _2221 = _2203 * 6.283185482025146484375;
        float _2223 = cos(_2221);
        _2217 = _2223;
    }
    float _2225 = _2217;
    float _2227 = -_2153;
    float _2229 = -_2215;
    float _2231 = fma(_2133, _2227, _2229);
    float _2233 = _2231;
    if (_2167)
    {
        float _2235 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2219 = _2235;
    }
    float _2237 = _2219;
    float _2239 = _2213;
    float _2241 = _2237;
    if (_2167)
    {
        float _2243 = fma(_2213, _2237, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2239 = _2243;
    }
    float _2245 = _2239;
    float _2247 = _2245;
    if (_2167)
    {
        float _2249 = _2195 * _2245;
        _2247 = _2249;
    }
    float _2251 = _2247;
    if (_2167)
    {
        float _2253 = _2225 + (-1.0);
        _2241 = _2253;
    }
    float _2255 = _2241;
    float _2257 = _2255;
    if (_2167)
    {
        float _2259 = _2155 * _2251;
        _2181 = _2259;
    }
    float _2261 = _2181;
    if (_2167)
    {
        float _2263 = _2157 * _2251;
        _2183 = _2263;
    }
    float _2265 = _2183;
    if (_2167)
    {
        float _2267 = _2255 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2257 = _2267;
    }
    float _2269 = _2257;
    if (_2167)
    {
        float _2271 = _2261 * _2261;
        _2185 = _2271;
    }
    float _2273 = _2185;
    if (_2167)
    {
        float _2275 = _2265 * _2265;
        _2187 = _2275;
    }
    float _2277 = _2187;
    if (_2167)
    {
        float _2279 = fma(_2231, _2225, _2269);
        _2233 = _2279;
    }
    float _2281 = _2233;
    int _2283 = ~_647;
    int _2285 = _2283 + 1;
    float _2287 = fma(_2281, _2281, _2273);
    float _2289 = _2287 + _2277;
    float _2291 = rsqrt(_2289);
    float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2295 = fma(_2151, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2293);
    float _2297 = precise::clamp(_2295, 0.0, 1.0);
    float _2299 = -_2297;
    float _2301 = _2299 + 1.0;
    float _2303 = abs(_2301);
    float _2305 = log2(_2303);
    float _2307 = _2291 * _2261;
    float _2309 = _2291 * _2281;
    float _2311 = _2291 * _2265;
    float _2313 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2315 = _2309 + 1.0;
    float _2317 = -_2313;
    float _2319 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2317);
    float _2321 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2323 = -_2311;
    float _2325 = fma(_2323, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2319);
    float _2327 = exp2(_2321);
    float _2329 = fma(_2325, -0.5, 0.5);
    float _2331 = fma(_2325, 0.5, 0.5);
    float _2333 = fma(_2331, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2335 = sqrt(_2329);
    float _2337 = fma(_2331, _2333, -0.212114393711090087890625);
    float _2339 = fma(_2331, _2337, 1.570728778839111328125);
    float _2341 = -_2309;
    float _2343 = fma(_2327, _2315, _2341);
    float _2345 = fma(_2343, 0.5, 0.5);
    int _2347 = _2285 * _1957;
    int _2349 = _2347 + _1919;
    float _2351 = _2335 * 0.636619746685028076171875;
    float _2353 = -_2339;
    float _2355 = fma(_2351, _2353, 1.0);
    float2 _6901 = float2(_2355, _2345);
    float3 _2359 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6901, float2(0.0), isnan(_6901)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6901, float2(0.0), isnan(_6901)), level(0.0)).xyz;
    float _2361 = _2359.x;
    float _2363 = _2359.y;
    float _2365 = _2359.z;
    bool _2367 = uint(_2349) >= uint(_647);
    float _2369 = -_753;
    float _2371 = _2369 + 1.0;
    float _2373 = float(uint(_1911));
    float _2375 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2377 = !_2367;
    int _2379 = _2377 ? 0 : (-1);
    float _2381 = -_417;
    float _2383 = _2381 + 1.0;
    int _2385 = ~_647;
    int _2387 = _2385 + 1;
    float _2389 = as_type<float>(_1757) * _2373;
    int _2391 = ~_1957;
    int _2393 = _2391 + _2379;
    int _2395 = _2393 + 1;
    float _2397 = exp2(_2375);
    int _2399 = ~_647;
    int _2401 = _2399 + 1;
    float _2403 = -_757;
    float _2405 = _2403 + 1.0;
    int _2407 = _647 * _2395;
    int _2409 = _2407 + _1919;
    float _2411 = trunc(_2389);
    float _2413 = precise::max(_2411, 0.0);
    uint _2415 = uint(_2413);
    bool _2417 = !_1829;
    int _2419 = _2417 ? _2409 : (-1);
    int _2421 = _2419 >> 31;
    int _2423 = _2419 & 3;
    bool _2425 = _2423 != 0;
    int _2427 = _2421 & 3;
    bool _2429 = uint(_2423) > 1u;
    int _2431 = _2419 + _2427;
    int _2433 = _2419 & 3;
    bool _2435 = _2433 != 0;
    int _2437 = _2387 * int(_2415);
    int _2439 = _2437 + _1911;
    int _2441 = _2431 >> 2;
    bool _2443 = _2423 != 3;
    float _2445 = float(uint(_2439));
    int _2447 = _2441 << 4;
    int _2449 = _2447 + 368;
    float _2451 = as_type<float>(_1757) * _2445;
    int _2453 = _2449 + 8;
    uint _2455 = uint(int(uint(_2453) >> uint(2)));
    uint _2457 = uint(int(uint(int(_2455)) >> uint(2)));
    int _2459 = int(_2455) & 3;
    float _2461 = (*spvDescriptorSet0.vp_c9)._m0[int(_2457)][_2459];
    int _2463 = int(_2455) + 1;
    uint _2465 = uint(int(uint(_2463) >> uint(2)));
    int _2467 = _2463 & 3;
    float _2469 = (*spvDescriptorSet0.vp_c9)._m0[int(_2465)][_2467];
    float _2471 = trunc(_2451);
    float _2473 = precise::max(_2471, 0.0);
    uint _2475 = uint(_2473);
    uint _2477 = uint(int(uint(_2449) >> uint(2)));
    uint _2479 = uint(int(uint(int(_2477)) >> uint(2)));
    int _2481 = int(_2477) & 3;
    float _2483 = (*spvDescriptorSet0.vp_c9)._m0[int(_2479)][_2481];
    int _2485 = int(_2477) + 1;
    uint _2487 = uint(int(uint(_2485) >> uint(2)));
    int _2489 = _2485 & 3;
    float _2491 = (*spvDescriptorSet0.vp_c9)._m0[int(_2487)][_2489];
    int _2493 = int(_2415) + int(_2475);
    int _2495 = _2435 ? 0 : 1;
    bool _2497 = uint(_2423) >= 2u;
    int _2499 = _2401 * _2493;
    int _2501 = _2499 + _1911;
    int _2503 = _2497 ? 0 : 1;
    bool _2505 = uint(_2501) >= uint(_647);
    int _2507 = ~_2495;
    int _2509 = _2507 + 1;
    int _2511 = _2509 + 1;
    int _2513 = _2511;
    if (!_2429)
    {
        int _2515 = ~_2495;
        int _2517 = _2515 + 1;
        _2513 = _2517;
    }
    int _2519 = _2513;
    bool _2521 = !_2425;
    int _2523 = _2521 ? 0 : 1;
    int _2525 = abs(_2519);
    int _2527 = ~_2503;
    int _2529 = _2527 + 1;
    int _2531 = _2529 + 1;
    int _2533 = _2531;
    if (_2443)
    {
        int _2535 = ~_2503;
        int _2537 = _2535 + 1;
        _2533 = _2537;
    }
    int _2539 = _2533;
    int _2541 = abs(_2523);
    float _2543 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2545 = int(_2543);
    bool _2547 = _2423 != 3;
    int _2549 = ~_2525;
    int _2551 = _2549 + 1;
    int _2553 = _2551 + 1;
    int _2555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2557 = _2555 != 0;
    bool _2559 = !_2547;
    int _2561 = _2559 ? 0 : (-1);
    int _2563 = _2553 * as_type<int>(_2491);
    int _2565 = ~_2541;
    int _2567 = _2565 + 1;
    int _2569 = _2567 + 1;
    int _2571 = abs(_2539);
    bool _2573 = !_2557;
    int _2575 = _2573 ? 0 : 1;
    int _2577 = _2569 * as_type<int>(_2483);
    int _2579 = _2577 + _2563;
    int _2581 = abs(_2561);
    bool _2583 = !_2505;
    int _2585 = _2583 ? 0 : (-1);
    int _2587 = ~_2571;
    int _2589 = _2587 + 1;
    int _2591 = _2589 + 1;
    int _2593 = abs(_2575);
    int _2595 = _2591 * as_type<int>(_2461);
    int _2597 = _2595 + _2579;
    int _2599 = ~_2493;
    int _2601 = _2599 + _2585;
    int _2603 = _2601 + 1;
    int _2605 = ~_2581;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    int _2611 = _647 * _2603;
    int _2613 = _2611 + _1911;
    int _2615 = ~_2593;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    float _2621 = float(uint(_2545));
    int _2623 = _2609 * as_type<int>(_2469);
    int _2625 = _2623 + _2597;
    bool _2627 = !_1829;
    int _2629 = _2627 ? _2613 : (-1);
    float _2631 = abs(_1035);
    float _2633 = log2(_2631);
    int _2635 = abs(_2545);
    int _2637 = _2625 * _2619;
    bool _2639 = _169 > 0.5;
    int _2641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2643 = _2641 != 0;
    int _2645 = _2629 * _2593;
    int _2647 = _2645 + _2637;
    float _2649 = float(uint(_2635));
    float _2651 = 1.0 / _2621;
    int _2653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2655 = _2653 != 0;
    float _2657 = float(uint(_2647));
    int _2659 = abs(_2647);
    bool _2661 = _429 > 0.5;
    float _2663 = 1.0 / _2649;
    float _2665 = float(uint(_2659));
    int _2667 = as_type<int>(_2651) + (-2);
    int _2669 = ~_2545;
    int _2671 = _2669 + 1;
    float _2673 = as_type<float>(_2667) * _2657;
    float _2675 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2677 = as_type<int>(_2663) + (-2);
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2681 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2683 = trunc(_2673);
    float _2685 = precise::max(_2683, 0.0);
    uint _2687 = uint(_2685);
    float _2689 = as_type<float>(_2677) * _2665;
    int _2691 = ~_2635;
    int _2693 = _2691 + 1;
    float _2695 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2697 = _2675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2699 = _2679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2701 = _2695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2703 = trunc(_2689);
    float _2705 = precise::max(_2703, 0.0);
    uint _2707 = uint(_2705);
    float _2709 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_78.x = _2697;
    out.m_78.y = _2699;
    out.m_78.z = _2701;
    out.m_78.w = _2681;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2713 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2715 = _1035 <= 8000.0;
    bool _2717 = isnan(_1035);
    bool _2719 = _2715 || _2717;
    bool _2721 = isnan(8000.0);
    bool _2723 = _2719 || _2721;
    float _2725 = float(_2723);
    int _2727 = _2671 * int(_2687);
    int _2729 = _2727 + _2647;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2733 = _2633 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2735 = _2713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2737 = _2711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2739 = float(uint(_2729));
    float _2741 = _2731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2743 = _2693 * int(_2707);
    int _2745 = _2743 + _2659;
    float _2747 = exp2(_2733);
    float _2749 = as_type<float>(_2667) * _2739;
    float _2751 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2753 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2755 = float(uint(_2745));
    out.m_80.x = _2737;
    out.m_80.y = _2735;
    out.m_80.z = _2741;
    float _2757 = -_1140;
    float _2759 = fma(_2757, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2751);
    float _2761 = -_1140;
    float _2763 = fma(_2761, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2753);
    float _2765 = trunc(_2749);
    float _2767 = precise::max(_2765, 0.0);
    uint _2769 = uint(_2767);
    float _2771 = as_type<float>(_2677) * _2755;
    float _2773 = -_1140;
    float _2775 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2709);
    float _2777 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2759);
    float _2779 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2763);
    float _2781 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2783 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2775);
    int _2785 = ~_2545;
    int _2787 = _2785 + 1;
    float _2789 = trunc(_2771);
    float _2791 = precise::max(_2789, 0.0);
    uint _2793 = uint(_2791);
    float _2795 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2797 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2799 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2781);
    float _2801 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2803 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2795);
    float _2805 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2797);
    float _2807 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2809 = int(_2687) + int(_2769);
    float _2811 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2813 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2801);
    float _2815 = -_221;
    int _2817 = _2661 ? as_type<int>(_2815) : as_type<int>(_221);
    float _2819 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2811);
    float _2821 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2807);
    int _2823 = ~_2635;
    int _2825 = _2823 + 1;
    int _2827 = _2787 * _2809;
    int _2829 = _2827 + _2647;
    int _2831 = int(_2707) + int(_2793);
    float _2833 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2799);
    bool _2835 = !_2655;
    float _2837 = _2835 ? _221 : as_type<float>(_2817);
    float _2839 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2841 = uint(_2829) >= uint(_2545);
    int _2843 = _2825 * _2831;
    int _2845 = _2843 + _2659;
    float _2847 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2803);
    float _2849 = _2839 * _2777;
    float _2851 = _2839 * _2783;
    float _2853 = _2839 * _2779;
    bool _2855 = !_2841;
    int _2857 = _2855 ? 0 : (-1);
    float _2859 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2805);
    bool _2861 = uint(_2845) >= uint(_2635);
    float _2863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2865 = _2647 ^ _2545;
    float _2867 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2819);
    int _2869 = ~_2809;
    int _2871 = _2869 + _2857;
    int _2873 = _2871 + 1;
    float _2875 = fma(_2747, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2877 = precise::clamp(_2875, 0.0, 1.0);
    bool _2879 = !_2861;
    int _2881 = _2879 ? 0 : (-1);
    uint _2883 = uint(int(uint(_2865) >> uint(31)));
    int _2885 = _2545 * _2873;
    int _2887 = _2885 + _2647;
    bool _2889 = _2545 == 0;
    float _2891 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2813);
    bool _2893 = _2545 == 0;
    float _2895 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2821);
    int _2897 = ~_2881;
    int _2899 = _2831 + _2897;
    int _2901 = _2899 + 1;
    float _2903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2905 = ~int(_2883);
    int _2907 = _2905 + 1;
    float _2909 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2911 = -_325;
    int _2913 = _2639 ? as_type<int>(_2911) : as_type<int>(_325);
    int _2915 = _2901 ^ _2907;
    float _2917 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2909);
    bool _2919 = !_2889;
    int _2921 = _2919 ? _2887 : (-1);
    int _2923 = ~_2907;
    int _2925 = _2923 + _2915;
    int _2927 = _2925 + 1;
    float _2929 = _325 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2931 = !_2643;
    float _2933 = _2931 ? _325 : as_type<float>(_2913);
    float _2935 = _2863 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2937 = !_2893;
    int _2939 = _2937 ? _2927 : (-1);
    float _2941 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2917);
    float _2943 = float(_2921);
    float _2945 = fma(_2929, _2833, _2851);
    float _2947 = float(_2939);
    float _2949 = _2903 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2951 = fma(_2929, _2847, _2849);
    float _2953 = fma(_2935, _2943, _745);
    float _2955 = _2837 + (-0.5);
    float _2957 = -_755;
    float _2959 = fma(_2949, _2947, _2957);
    float _2961 = _2933 + 0.5;
    float _2963 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2941);
    float _2965 = -_2949;
    float _2967 = fma(_2965, _2955, _2959);
    float _2969 = fma(_2935, _2961, _2953);
    float _2971 = _2963 + _1636;
    float _2973 = fma(_2837, _2405, _2967);
    float _2975 = -_2371;
    float _2977 = fma(_2933, _2975, _2969);
    float _2979 = fma(_2929, _2859, _2853);
    float _2981 = fma(_2877, -2.0, 3.0);
    float _2983 = _2877 * _2877;
    float _2985 = -_2397;
    float _2987 = _2985 + 1.0;
    float _2989 = _2895 + _2979;
    float _2991 = _2983 * _2981;
    float _2993 = _2987 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2995 = _2971 * 0.5;
    float _2997 = -_2991;
    float _2999 = _2997 + 1.0;
    float _3001 = _2993 * _1718;
    float _3003 = _2891 + _2951;
    float _3005 = _2867 + _2945;
    float _3007 = fma(_2999, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2991);
    float _3009 = _2999;
    float _3011 = _2837;
    float _3013 = _2993;
    if (!_1624)
    {
        _3009 = 1.0;
    }
    float _3015 = _3009;
    float _3017 = _2365 * _3001;
    float _3019 = _3015;
    if (_1624)
    {
        bool _3021 = _1716 >= _1694;
        bool _3023 = isnan(_1716);
        bool _3025 = _3021 || _3023;
        bool _3027 = isnan(_1694);
        bool _3029 = _3025 || _3027;
        float _3031 = float(_3029);
        _3019 = _3031;
    }
    float _3033 = _3019;
    float _3035 = _2725 * _3007;
    out.gl_Position.x = _1668;
    out.gl_Position.y = _1670;
    out.gl_Position.z = _2963;
    out.gl_Position.w = _1636;
    float _3037 = fma(_1729, _3017, _1727);
    bool _3039 = _2151 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3041 = isnan(_2151);
    bool _3043 = _3039 || _3041;
    bool _3045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3047 = _3043 || _3045;
    float _3049 = _3035 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3051 = _3033 * _2129;
    out.m_82.z = _2995;
    out.m_82.w = _1636;
    float _3053 = _2383 * _3049;
    float _3055 = precise::clamp(_3053, 0.0, 1.0);
    float _3057 = -_2993;
    float _3059 = _3057 + 1.0;
    out.m_84.x = _2977;
    out.m_84.y = _2973;
    float _3061 = -_3055;
    float _3063 = fma(_3061, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3065 = _1729 * _3001;
    float _3067 = _1729 * _3059;
    out.m_86.x = _3003;
    out.m_86.y = _3005;
    out.m_86.z = _2989;
    float _3069 = -_3051;
    float _3071 = fma(_3069, _3063, 1.0);
    float _3073 = precise::clamp(_3071, 0.0, 1.0);
    float _3075 = fma(_2361, _3065, _1723);
    float _3077 = fma(_2363, _3065, _1725);
    float _3079 = _2009 * _2063;
    float _3081 = _3073 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3083 = _3059;
    float _3085 = _3051;
    float _3087 = _3073;
    float _3089 = _3079;
    if (!_3047)
    {
        _3011 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3091 = _3011;
    out.m_88.x = _3075;
    out.m_88.y = _3077;
    out.m_88.z = _3037;
    out.m_88.w = _3067;
    float _3093 = _3079 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3095 = _3091;
    float _3097 = _3091;
    if (!_3047)
    {
        _3013 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3099 = _3013;
    out.m_90.x = _3081;
    float _3101 = _3099;
    float _3103 = _3099;
    if (!_3047)
    {
        _3083 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3105 = _3083;
    float _3107 = _3105;
    float _3109 = _3105;
    if (!_3047)
    {
        _3085 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3111 = _3085;
    float _3113 = _3111;
    float _3115 = _3111;
    if (!_3047)
    {
        _3087 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3117 = _3087;
    float _3119 = _3117;
    float _3121 = _3117;
    if (!_3047)
    {
        _3089 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3123 = _3089;
    bool _3125 = !_3047;
    float _3127 = _3123;
    float _3129 = _3123;
    if (!_3125)
    {
        bool _3131 = _2151 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3133 = isnan(_2151);
        bool _3135 = _3131 || _3133;
        bool _3137 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3139 = _3135 || _3137;
        if (!_3139)
        {
            float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3143 = _2151 + _3141;
            float _3145 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3147 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3145;
            float _3149 = 1.0 / _3147;
            float _3151 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3167 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3171 = _3143 * _3149;
            float _3173 = precise::clamp(_3171, 0.0, 1.0);
            float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3179 = fma(_3173, _3153, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3181 = fma(_3173, _3177, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3183 = fma(_3173, _3157, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3185 = fma(_3173, _3161, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3187 = fma(_3173, _3165, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3189 = fma(_3173, _3169, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3103 = _3181;
            _3121 = _3187;
            _3097 = _3179;
            _3115 = _3185;
            _3109 = _3183;
            _3129 = _3189;
            _3191 = true;
        }
        else
        {
            bool _3193 = _2151 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3195 = isnan(_2151);
            bool _3197 = _3193 || _3195;
            bool _3199 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3201 = _3197 || _3199;
            if (!_3201)
            {
                _3095 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3203 = _3095;
            _3097 = _3203;
            if (!_3201)
            {
                _3101 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3205 = _3101;
            _3103 = _3205;
            if (!_3201)
            {
                _3107 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3207 = _3107;
            _3109 = _3207;
            if (!_3201)
            {
                _3113 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3209 = _3113;
            _3115 = _3209;
            if (!_3201)
            {
                _3119 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3211 = _3119;
            _3121 = _3211;
            if (!_3201)
            {
                _3127 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3213 = _3127;
            bool _3215 = !_3201;
            _3129 = _3213;
            if (!_3215)
            {
                bool _3217 = _2151 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3219 = isnan(_2151);
                bool _3221 = _3217 || _3219;
                bool _3223 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3225 = _3221 || _3223;
                if (!_3225)
                {
                    float _3227 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3229 = _2151 + _3227;
                    float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3233 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3231;
                    float _3235 = 1.0 / _3233;
                    float _3237 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3239 = _3237 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3241 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3243 = _3241 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3245 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3257 = _3229 * _3235;
                    float _3259 = precise::clamp(_3257, 0.0, 1.0);
                    float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3263 = _3261 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3265 = fma(_3259, _3239, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3267 = fma(_3259, _3263, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3269 = fma(_3259, _3243, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3271 = fma(_3259, _3247, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3273 = fma(_3259, _3251, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3275 = fma(_3259, _3255, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3103 = _3267;
                    _3121 = _3273;
                    _3097 = _3265;
                    _3115 = _3271;
                    _3109 = _3269;
                    _3129 = _3275;
                    _3191 = true;
                }
                else
                {
                    _3103 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3121 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3097 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3115 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3109 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3129 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3191 = false;
    float _3277 = _3103;
    float _3279 = _3121;
    float _3281 = _3097;
    float _3283 = _3115;
    float _3285 = _3109;
    float _3287 = _3129;
    float _3289 = _3093 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3291 = fma(_3005, -0.5, 0.5);
    float _3293 = precise::clamp(_3291, 0.0, 1.0);
    float _3295 = -_3277;
    float _3297 = _3295 + _3279;
    float _3299 = -_3281;
    float _3301 = _3299 + _3283;
    out.m_59.x = _3289;
    float _3303 = -_3285;
    float _3305 = _3303 + _3287;
    float _3307 = fma(_3293, _3297, _3277);
    float _3309 = fma(_3293, _3301, _3281);
    bool _3311 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3313 = _3307 * 0.586610972881317138671875;
    float _3315 = fma(_3293, _3305, _3285);
    out.m_92.x = 0.0;
    bool _3317 = _2009 > 0.0;
    bool _3319 = isnan(_2009);
    bool _3321 = _3317 || _3319;
    bool _3323 = isnan(0.0);
    bool _3325 = _3321 || _3323;
    float _3327 = fma(_3309, 0.298911988735198974609375, _3313);
    bool _3329 = _2063 <= 0.0;
    bool _3331 = !_3325;
    bool _3333 = _3329 || _3331;
    float _3335 = fma(_3315, 0.114477999508380889892578125, _3327);
    float _3337 = -_3335;
    float _3339 = _3309 + _3337;
    float _3341 = -_3335;
    float _3343 = _3307 + _3341;
    float _3345 = -_3335;
    float _3347 = _3315 + _3345;
    float _3349 = fma(_3339, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3335);
    float _3351 = fma(_3343, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3335);
    float _3353 = fma(_3347, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3335);
    bool _3355 = !_3311;
    if (!_3355)
    {
        float _3357 = -_1546;
        float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3361 = -_1548;
        float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3365 = -_1550;
        float _3367 = _3365 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3369 = _3359 * _3359;
        float _3371 = fma(_3363, _3363, _3369);
        float _3373 = fma(_3367, _3367, _3371);
        float _3375 = sqrt(_3373);
        float _3377 = rsqrt(_3373);
        float _3379 = -_3375;
        float _3381 = _3379 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3383 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3385 = precise::clamp(_3383, 0.0, 1.0);
        float _3387 = _3363 * _3377;
        float _3389 = _3359 * _3377;
        float _3391 = abs(_3385);
        float _3393 = log2(_3391);
        float _3395 = _3367 * _3377;
        float _3397 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3399 = _3005 * _3389;
        float _3401 = -_3389;
        float _3403 = -_3397;
        float _3405 = fma(_3401, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3403);
        float _3407 = fma(_3003, _3387, _3399);
        float _3409 = -_3395;
        float _3411 = fma(_3409, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3405);
        float _3413 = fma(_2989, _3395, _3407);
        float _3415 = precise::clamp(_3413, 0.0, 1.0);
        float _3417 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3419 = _3411 + _3417;
        float _3421 = _3393 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3423 = _3419 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3425 = precise::clamp(_3423, 0.0, 1.0);
        float _3427 = exp2(_3421);
        float _3429 = _3427 * _3425;
        float _3431 = _3415 * _3429;
        float _3433 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3435 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3437 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _3433;
        out.m_92.y = _3435;
        out.m_92.z = _3437;
    }
    out.m_94.x = _3349;
    out.m_94.y = _3351;
    out.m_94.z = _3353;
    if (!_3333)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _3439 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3439;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3191 = false;
    bool _351 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_59.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3496 = as_type<float>(_129);
        out.gl_Position.z = _3496;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_61.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_59.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3565 = as_type<float>(_167);
        out.gl_Position.z = _3565;
    }
    if (_161)
    {
        return out;
    }
    float _169 = in.m_63.x;
    float _171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _173 = _147 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _179 = _173 * _171;
    float _181 = _147 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _183 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[20].x, _179);
    float _185 = _181 * _177;
    float _187 = floor(_183);
    float _189 = _183 * 6.283185482025146484375;
    float _191 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[20].y, _185);
    int _193 = as_type<int>(_175) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_175) & 2;
    bool _199 = _197 != 0;
    float _201 = _189 * 0.15915493667125701904296875;
    float _203 = floor(_191);
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    float _209 = -_187;
    float _211 = _183 + _209;
    float _213 = _201 * 6.283185482025146484375;
    float _215 = cos(_213);
    float _217 = _191 * 6.283185482025146484375;
    bool _219 = !_199;
    float _221 = _219 ? (-0.5) : 0.5;
    int _223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _225 = _223 != 0;
    int _227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _229 = _227 != 0;
    float _231 = _217 * 0.15915493667125701904296875;
    bool _233 = !_207;
    int _235 = _233 ? 0 : 1;
    float _237 = -_203;
    float _239 = _191 + _237;
    bool _241 = _211 < 0.5;
    float _243 = float(_241);
    float _245 = -_211;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _249 = !_225;
    int _251 = _249 ? 0 : 1;
    float _253 = _231 * 6.283185482025146484375;
    float _255 = cos(_253);
    int _257 = abs(_235);
    float _259 = -_243;
    float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _263 = abs(_251);
    float _265 = fma(_215, 0.5, 0.5);
    bool _267 = !_229;
    int _269 = _267 ? 0 : 1;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _273 = -_265;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _277 = abs(_269);
    float _279 = float(_263);
    float _281 = fma(_255, 0.5, 0.5);
    float _283 = -_239;
    float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _287 = float(_257);
    bool _289 = _239 < 0.5;
    float _291 = float(_289);
    float _293 = abs(_247);
    float _295 = _279 * _293;
    float _297 = -_281;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _301 = abs(_285);
    float _303 = _279 * _301;
    float _305 = float(_277);
    float _307 = fma(_287, _275, _295);
    float _309 = -_291;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _313 = fma(_287, _299, _303);
    float _315 = abs(_261);
    float _317 = fma(_305, _315, _307);
    float _319 = abs(_311);
    float _321 = fma(_305, _319, _313);
    bool _323 = !_195;
    float _325 = _323 ? (-0.5) : 0.5;
    bool _327 = !_271;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _347;
    float _349;
    if (!_327)
    {
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _333 = _169 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _335 = float(_113);
        float _337 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _339 = _337 * _331;
        float _341 = floor(_339);
        float _343 = -_341;
        float _345 = _339 + _343;
        _347 = _345;
        _349 = _335;
        _351 = true;
    }
    else
    {
        float _353 = float(_113);
        float _355 = 1.0 / _353;
        float _357 = _147 * _355;
        _347 = _357;
        _349 = _353;
    }
    _351 = false;
    float _359 = _347;
    float _361 = _349;
    float _363 = in.m_56.x;
    float _365 = in.m_56.y;
    float _367 = in.m_56.z;
    float _369 = in.m_68.x;
    float _371 = in.m_68.y;
    float _373 = in.m_68.z;
    float _375 = in.m_68.w;
    float _377 = in.m_70.x;
    float _379 = in.m_70.y;
    float _381 = in.m_70.z;
    float _383 = in.m_70.w;
    float _385 = _365 * _371;
    float _387 = _365 * _379;
    float _389 = fma(_363, _369, _385);
    float _391 = fma(_363, _377, _387);
    float _393 = fma(_367, _373, _389);
    float _395 = fma(_367, _381, _391);
    float _397 = _393 + _375;
    float _399 = _395 + _383;
    float _401 = fma(_397, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _403 = fma(_399, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _405 = floor(_401);
    float _407 = floor(_403);
    float _409 = -_405;
    float _411 = _401 + _409;
    float _413 = -_407;
    float _415 = _403 + _413;
    float2 _3913 = float2(_411, _415);
    float _417 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3913, float2(0.0), isnan(_3913)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3913, float2(0.0), isnan(_3913)), level(0.0)).x;
    float _419 = in.m_72.x;
    float _421 = in.m_72.y;
    float _423 = in.m_72.z;
    float _425 = in.m_72.w;
    float _427 = _169 * 2.0;
    float _429 = in.m_63.y;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _431;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _437 = floor(_427);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _443 = _169 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _447 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _449 = isnan(_359);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -_435;
    float _461 = fma(_443, 2.0, _459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _463;
    float _467 = 1.0 / _441;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _471 = _365 * _421;
    float _473 = 1.0 / _433;
    float _475 = in.m_63.z;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _479 = _359 + _477;
    float _481 = fma(_363, _419, _471);
    bool _483 = _437 > 0.0;
    float _485 = _429 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _487 = _437 >= 0.0;
    bool _489 = isnan(_437);
    bool _491 = _487 || _489;
    bool _493 = isnan(0.0);
    bool _495 = _491 || _493;
    float _497 = fma(_367, _423, _481);
    float _499 = _479 * _467;
    float _501 = _169 + _429;
    float _503 = 1.0 / _465;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _507 = _359 + _505;
    float _509 = _501 + (-1.0);
    float _511 = _429 * 2.0;
    float _513 = _507 * _473;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _517 = _359 + _515;
    float _519 = floor(_511);
    float _521 = _497 + _425;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _533 = _531 != 0;
    float _535 = fma(_485, -2.0, _445);
    float _537 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[78].z, _469);
    float _539 = _169 + _475;
    float _541 = _429 + _475;
    float _543 = _517 * _503;
    float _545 = _539 + (-1.0);
    float _547 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _549 = _541 + (-1.0);
    float _551 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _553 = log2(_551);
    float _555 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _557 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _559;
    bool _563 = _519 > 0.0;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _565;
    float _569 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _571 = int(_569);
    bool _573 = _519 >= 0.0;
    bool _575 = isnan(_519);
    bool _577 = _573 || _575;
    bool _579 = isnan(0.0);
    bool _581 = _577 || _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _587;
    int _591 = _495 ? 0 : 1;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _601 = _475 * 2.0;
    float _603 = _553 * _147;
    float _605 = fma(_595, _499, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _607 = fma(_599, _499, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _609 = ~_591;
    int _611 = _609 + 1;
    int _613 = _611 + 1;
    float _615 = exp2(_603);
    int _617 = _613;
    if (!_483)
    {
        int _619 = ~_591;
        int _621 = _619 + 1;
        _617 = _621;
    }
    int _623 = _617;
    float _625 = fma(_567, _543, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _627 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _629 = isnan(_359);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = fma(_561, _543, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _641 = float(_571);
    float _643 = fma(_585, _513, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _645 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _647 = int(_645);
    bool _649 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _651 = isnan(_359);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = fma(_589, _513, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _663 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _665 = isnan(_359);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _677 = 1.0 + _675;
    bool _679 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _681 = isnan(0.0);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _687 = _683 || _685;
    float _689 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _691 = !_529;
    int _693 = _691 ? 0 : 1;
    float _695 = -_615;
    float _697 = _695 + 1.0;
    float _699 = 1.0 / _641;
    float _701 = -_673;
    float _703 = _701 + 1.0;
    bool _705 = !_525;
    int _707 = _705 ? 0 : 1;
    float _709 = _521 + _689;
    float _711 = _687 ? _697 : 0.0;
    float _713 = _659 * _703;
    bool _715 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _717 = isnan(1.0);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _723 = _719 || _721;
    float _725 = -_659;
    float _727 = _725 + 1.0;
    float _729 = 1.0 / _677;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _733 = float(_647);
    float _735 = _637 * _727;
    float _737 = -_637;
    float _739 = _737 + 1.0;
    float _741 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[78].w, _731);
    float _743 = -_147;
    float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[76].x, _461);
    float _747 = _733 * _147;
    float _749 = floor(_601);
    float _751 = _699 * _147;
    float _753 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _537);
    float _755 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _535);
    float _757 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _741);
    bool _759 = !_533;
    int _761 = _759 ? 0 : 1;
    float _763 = _457 * _739;
    float _765 = _521 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _767 = _747;
    float _769 = _709;
    if (_723)
    {
        float _771 = _711 * _729;
        _151 = _771;
    }
    float _773 = _151;
    float _775 = float(_623);
    float _777 = _661 * _763;
    float _779 = fma(_397, (*spvDescriptorSet0.vp_c8)._m0[11].x, _765);
    float _781 = _643 * _763;
    int _783 = _581 ? 0 : 1;
    float _785 = -_457;
    float _787 = _785 + 1.0;
    float _789 = _475 + (-0.5);
    bool _791 = _749 > 0.0;
    bool _793 = _749 >= 0.0;
    bool _795 = isnan(_749);
    bool _797 = _793 || _795;
    bool _799 = isnan(0.0);
    bool _801 = _797 || _799;
    float _803 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[143].x, _781);
    float _805 = in.m_74.x;
    float _807 = in.m_74.y;
    float _809 = in.m_74.z;
    float _811 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[143].y, _777);
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _815 = _813 != 0;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _819 = _817 != 0;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _823 = _821 != 0;
    float _825 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _827 = _801 ? 0 : 1;
    float _829 = fma(_607, _735, _811);
    bool _831 = !_815;
    int _833 = _831 ? 0 : 1;
    int _835 = ~_827;
    int _837 = _835 + 1;
    int _839 = _837 + 1;
    float _841 = fma(_639, _713, _829);
    int _843 = _839;
    if (!_791)
    {
        int _845 = ~_827;
        int _847 = _845 + 1;
        _843 = _847;
    }
    int _849 = _843;
    bool _851 = !_819;
    int _853 = _851 ? 0 : 1;
    int _855 = abs(_833);
    float _857 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[11].z, _779);
    int _859 = abs(_853);
    float _861 = _521 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _863 = float(_855);
    float _865 = _857 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _867 = float(_859);
    float _869 = fma(_397, (*spvDescriptorSet0.vp_c8)._m0[10].x, _861);
    float _871 = _709 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _873 = 1.0 / _865;
    float _875 = float(_849);
    float _877 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[10].z, _869);
    float _879 = fma(_397, (*spvDescriptorSet0.vp_c15)._m0[126].x, _871);
    float _881 = _867 * _775;
    float _883 = _709 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _885 = _877 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _887 = _863 * _875;
    float _889 = fma(_399, (*spvDescriptorSet0.vp_c15)._m0[126].z, _879);
    bool _891 = !_823;
    int _893 = _891 ? 0 : 1;
    float _895 = _885 + _865;
    float _897 = _429 + (-0.5);
    float _899 = _889 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _901 = abs(_893);
    float _903 = _887 * (-2.0);
    int _905 = ~_783;
    int _907 = _905 + 1;
    int _909 = _907 + 1;
    float _911 = _895 * _873;
    float _913 = _911 * 0.5;
    float _915 = _881 * (-2.0);
    float _917 = float(_901);
    float _919 = fma(_397, (*spvDescriptorSet0.vp_c15)._m0[127].x, _883);
    float _921 = fma(_915, _807, _807);
    float _923 = fma(_557, _915, _557);
    int _925 = _909;
    if (!_563)
    {
        int _927 = ~_783;
        int _929 = _927 + 1;
        _925 = _929;
    }
    int _931 = _925;
    float _933 = fma(_399, (*spvDescriptorSet0.vp_c15)._m0[127].z, _919);
    float _935 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[196].y, _921);
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _939 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[30].w, _937);
    float _941 = fma(_547, _903, _547);
    float _943 = float(_931);
    float _945 = fma(_923, _773, _935);
    float _947 = fma(_903, _805, _805);
    float _949 = _169 + (-0.5);
    float _951 = _933 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _953 = _945 * 0.15915493667125701904296875;
    float _955 = _917 * _943;
    float _957 = in.m_76.x;
    float _959 = in.m_76.y;
    float _961 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[196].x, _947);
    float _963 = fma(_605, _735, _803);
    float _965 = trunc(_899);
    int _967 = int(_965);
    float _969 = _955 * (-2.0);
    float _971 = fma(_941, _773, _961);
    float _973 = fma(_625, _713, _963);
    float _975 = fma(_969, _809, _809);
    float _977 = fma(_555, _969, _555);
    float _979 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[146].x, _973);
    float _981 = trunc(_951);
    int _983 = int(_981);
    float _985 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[146].y, _841);
    float _987 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[196].z, _975);
    float _989 = _971 * 0.15915493667125701904296875;
    float _991 = fma(_977, _773, _987);
    float _993 = 1.0 / _939;
    int _995 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _997 = _967 + _995;
    int _999 = _997 + 1;
    float _1001 = _991 * 0.15915493667125701904296875;
    float _1003 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _1005 = _985 * _959;
    float _1007 = _979 * _957;
    bool _1009 = _999 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1011 = _953 * 6.283185482025146484375;
    float _1013 = sin(_1011);
    float _1015 = _321 * _1005;
    int _1017 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1019 = _983 + _1017;
    int _1021 = _1019 + 1;
    float _1023 = _317 * _1007;
    float _1025 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _325);
    float _1027 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1029 = _999 | _1021;
    float _1031 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1035 = _993 * _1033;
    float _1037 = _953 * 6.283185482025146484375;
    float _1039 = cos(_1037);
    bool _1041 = _1029 < 0;
    bool _1043 = _1041 || _1009;
    float _1045 = _1031 * _1025;
    float _1047 = _1027 * _1003;
    bool _1049 = _1035 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1051 = _1035 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1053 = _989 * 6.283185482025146484375;
    float _1055 = sin(_1053);
    bool _1057 = _1021 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1059 = _1057 || _1043;
    bool _1061 = !_1049;
    int _1063 = _1061 ? 0 : 1;
    float _1065 = _1001 * 6.283185482025146484375;
    float _1067 = cos(_1065);
    int _1069 = 2;
    int _1071 = _999;
    int _1073 = as_type<int>(_977);
    if (!_1049)
    {
        _1069 = 1;
    }
    int _1075 = _1069;
    int _1077 = _1075;
    if (!_1051)
    {
        _1077 = _1063;
    }
    int _1079 = _1077;
    bool _1081 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1083 = isnan(0.5);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1089 = _1085 || _1087;
    if (!_1059)
    {
        int _1091 = _1021 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1093 = _1091 + _999;
        _1071 = _1093;
    }
    int _1095 = _1071;
    int _1097 = _1079 << 6;
    float _1099 = _989 * 6.283185482025146484375;
    float _1101 = cos(_1099);
    float _1103 = _1055 * _1013;
    float _1105 = _1055 * _1039;
    float _1107 = as_type<float>(_1095);
    if (!_1059)
    {
        int _1109 = _1095 << 2;
        _1073 = _1109;
    }
    int _1111 = _1073;
    int _1113 = _1097 + 72;
    uint _1116 = uint(int(uint(_1113) >> uint(2)));
    uint _1118 = uint(int(uint(int(_1116)) >> uint(2)));
    int _1120 = int(_1116) & 3;
    float _1122 = (*spvDescriptorSet0.vp_c15)._m0[int(_1118)][_1120];
    int _1124 = int(_1116) + 1;
    uint _1126 = uint(int(uint(_1124) >> uint(2)));
    int _1128 = _1124 & 3;
    float _1130 = (*spvDescriptorSet0.vp_c15)._m0[int(_1126)][_1128];
    int _1132 = _1111;
    if (!_1059)
    {
        int _1134 = 12 & _1111;
        _1132 = _1134;
    }
    int _1136 = _1132;
    float _1138 = _1001 * 6.283185482025146484375;
    float _1140 = sin(_1138);
    float _1142 = _1055 * _1067;
    float _1144 = _1039 * _1067;
    int _1146 = _1097 + 56;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    uint _1150 = uint(int(uint(int(_1148)) >> uint(2)));
    int _1152 = int(_1148) & 3;
    float _1154 = (*spvDescriptorSet0.vp_c15)._m0[int(_1150)][_1152];
    int _1156 = int(_1148) + 1;
    uint _1158 = uint(int(uint(_1156) >> uint(2)));
    int _1160 = _1156 & 3;
    float _1162 = (*spvDescriptorSet0.vp_c15)._m0[int(_1158)][_1160];
    float _1164 = _1142 * _1047;
    float _1166 = _1101 * _1039;
    float _1168 = _1101 * _1013;
    float _1170 = _1101 * _1067;
    float _1172 = _1013 * _1067;
    float _1174 = 0.0;
    if (!_1059)
    {
        float _1176 = floor(_899);
        _1174 = _1176;
    }
    float _1178 = _1174;
    float _1180 = _1170 * _1047;
    float _1182 = fma(_1140, _1166, _1103);
    float _1184 = -_1168;
    float _1186 = fma(_1140, _1105, _1184);
    float _1188 = -_1105;
    float _1190 = fma(_1140, _1168, _1188);
    float _1192 = fma(_1140, _1103, _1166);
    int _1194 = _1097 + 96;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    uint _1198 = uint(int(uint(int(_1196)) >> uint(2)));
    int _1200 = int(_1196) & 3;
    float _1202 = (*spvDescriptorSet0.vp_c15)._m0[int(_1198)][_1200];
    int _1204 = int(_1196) + 1;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    int _1208 = _1204 & 3;
    float _1210 = (*spvDescriptorSet0.vp_c15)._m0[int(_1206)][_1208];
    float _1212 = fma(_1182, _1045, _1180);
    float _1214 = -_1047;
    float _1216 = _1140 * _1214;
    float _1218 = fma(_1186, _1045, _1164);
    float _1220 = fma(_1190, _825, _1212);
    float _1222 = fma(_1144, _1045, _1216);
    float _1224 = fma(_1192, _825, _1218);
    int _1226 = _1097 + 48;
    uint _1228 = uint(int(uint(_1226) >> uint(2)));
    uint _1230 = uint(int(uint(int(_1228)) >> uint(2)));
    int _1232 = int(_1228) & 3;
    float _1234 = (*spvDescriptorSet0.vp_c15)._m0[int(_1230)][_1232];
    int _1236 = int(_1228) + 1;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    int _1240 = _1236 & 3;
    float _1242 = (*spvDescriptorSet0.vp_c15)._m0[int(_1238)][_1240];
    float _1244 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1246 = fma(_1172, _825, _1222);
    float _1248 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1250 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1252 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1244);
    float _1254 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1248);
    int _1256 = _1097 + 104;
    uint _1258 = uint(int(uint(_1256) >> uint(2)));
    uint _1260 = uint(int(uint(int(_1258)) >> uint(2)));
    int _1262 = int(_1258) & 3;
    float _1264 = (*spvDescriptorSet0.vp_c15)._m0[int(_1260)][_1262];
    int _1266 = int(_1258) + 1;
    uint _1268 = uint(int(uint(_1266) >> uint(2)));
    int _1270 = _1266 & 3;
    float _1272 = (*spvDescriptorSet0.vp_c15)._m0[int(_1268)][_1270];
    int _1274 = as_type<int>(_1244);
    float _1276 = _1250;
    if (!_1059)
    {
        uint _1278 = uint(int(uint(_1095) >> uint(2)));
        _1274 = int(_1278);
    }
    int _1280 = _1274;
    float _1282 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1252);
    float _1284 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1254);
    float _1286 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1250);
    int _1288 = 0;
    if (!_1059)
    {
        int _1290 = _1280 << 4;
        int _1292 = _1290 + _1136;
        _1288 = _1292;
    }
    int _1294 = _1288;
    float _1296 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1298 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1300 = _1097 + 64;
    uint _1302 = uint(int(uint(_1300) >> uint(2)));
    uint _1304 = uint(int(uint(int(_1302)) >> uint(2)));
    int _1306 = int(_1302) & 3;
    float _1308 = (*spvDescriptorSet0.vp_c15)._m0[int(_1304)][_1306];
    int _1310 = int(_1302) + 1;
    uint _1312 = uint(int(uint(_1310) >> uint(2)));
    int _1314 = _1310 & 3;
    float _1316 = (*spvDescriptorSet0.vp_c15)._m0[int(_1312)][_1314];
    if (!_1059)
    {
        float _1318 = floor(_951);
        _1276 = _1318;
    }
    float _1320 = _1276;
    float _1322 = _399 + _1296;
    float _1324 = _397 + _1298;
    float _1326 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1286);
    float _1328 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1330 = _1322 + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1334 = _1324 + _1332;
    int _1336 = _1097 + 80;
    uint _1338 = uint(int(uint(_1336) >> uint(2)));
    uint _1340 = uint(int(uint(int(_1338)) >> uint(2)));
    int _1342 = int(_1338) & 3;
    float _1344 = (*spvDescriptorSet0.vp_c15)._m0[int(_1340)][_1342];
    int _1346 = int(_1338) + 1;
    uint _1348 = uint(int(uint(_1346) >> uint(2)));
    int _1350 = _1346 & 3;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[int(_1348)][_1350];
    float _1354 = _1330 * _1330;
    float _1356 = fma(_1334, _1334, _1354);
    int _1358 = _1097 + 88;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    uint _1362 = uint(int(uint(int(_1360)) >> uint(2)));
    int _1364 = int(_1360) & 3;
    float _1366 = (*spvDescriptorSet0.vp_c15)._m0[int(_1362)][_1364];
    int _1368 = int(_1360) + 1;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    int _1372 = _1368 & 3;
    float _1374 = (*spvDescriptorSet0.vp_c15)._m0[int(_1370)][_1372];
    float _1376 = sqrt(_1356);
    float _1378 = _1284;
    float _1380 = _1322;
    float _1382 = _1356;
    if (!_1059)
    {
        int _1384 = _1294 + 400;
        uint _1386 = uint(int(uint(_1384) >> uint(2)));
        uint _1388 = uint(int(uint(int(_1386)) >> uint(2)));
        int _1390 = int(_1386) & 3;
        float _1392 = (*spvDescriptorSet0.vp_c15)._m0[int(_1388)][_1390];
        _1378 = _1392;
    }
    float _1394 = _1378;
    float _1396 = _709 * _1210;
    float _1398 = fma(_397, _1202, _1396);
    float _1400 = _709 * _1242;
    bool _1402 = _1376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1404 = fma(_397, _1234, _1400);
    float _1406 = fma(_399, _1264, _1398);
    float _1408 = _1406 + _1272;
    float _1410 = _709 * _1316;
    float _1412 = fma(_397, _1308, _1410);
    float _1414 = fma(_399, _1154, _1404);
    float _1416 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1418 = 1.0 / _1408;
    float _1420 = fma(_399, _1122, _1412);
    float _1422 = _1414 + _1162;
    float _1424 = _521 + _1416;
    float _1426 = _1416;
    float _1428 = _1424;
    float _1430 = _1408;
    if (!_1402)
    {
        _1426 = _1324;
    }
    float _1432 = _1426;
    float _1434 = _1420 + _1130;
    bool _1436 = !_1402;
    float _1438 = _1432;
    if (!_1436)
    {
        float _1440 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1444 = _1376 + _1442;
        float _1446 = rsqrt(_1356);
        float _1448 = _1444 * _1440;
        float _1450 = _1424 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1452 = _1448 * 0.15915493667125701904296875;
        float _1454 = _1452 * 6.283185482025146484375;
        float _1456 = cos(_1454);
        float _1458 = _1452 * 6.283185482025146484375;
        float _1460 = sin(_1458);
        float _1462 = _1456 + (-1.0);
        float _1464 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1466 = fma(_1460, _1450, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1468 = fma(_1424, _1456, _1464);
        float _1470 = _1446 * _1466;
        float _1472 = fma(_1334, _1470, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1474 = fma(_1330, _1470, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1438 = _1472;
        _1380 = _1474;
        _1428 = _1468;
        _1382 = _1446;
        _1430 = _1452;
    }
    float _1476 = _1438;
    float _1478 = _1380;
    float _1480 = _1428;
    float _1482 = _1382;
    float _1484 = _1430;
    float _1486 = _1480;
    float _1488 = _1476;
    float _1490 = _1478;
    float _1492 = _1484;
    float _1494 = _1482;
    if (!_1089)
    {
        float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1498 = _521 + _1496;
        float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1502 = _397 + _1500;
        float _1504 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1506 = -_397;
        float _1508 = _1506 + _1476;
        float _1510 = _1498 * _1498;
        float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1514 = _399 + _1512;
        float _1516 = -_399;
        float _1518 = _1516 + _1478;
        float _1520 = fma(_1502, _1502, _1510);
        float _1522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1524 = fma(_1514, _1514, _1520);
        float _1526 = sqrt(_1524);
        float _1528 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1530 = precise::min(_1526, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1532 = _1530 * _1522;
        float _1534 = -_521;
        float _1536 = _1534 + _1480;
        float _1538 = _1528 * _1532;
        float _1540 = fma(_1536, _1538, _521);
        float _1542 = fma(_1508, _1538, _397);
        float _1544 = fma(_1518, _1538, _399);
        _1486 = _1540;
        _1488 = _1542;
        _1490 = _1544;
        _1492 = _1538;
    }
    float _1546 = _1486;
    float _1548 = _1488;
    float _1550 = _1490;
    float _1552 = _1492;
    float _1554 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1556 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1558 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1560 = _1422 * _1418;
    float _1562 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1554);
    float _1564 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1556);
    float _1566 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1558);
    float _1568 = _1552;
    if (!_1059)
    {
        float _1570 = rint(_1394);
        float _1572 = precise::max(_1570, 0.0);
        uint _1574 = uint(_1572);
        uint _1576 = clamp(_1574, 0u, 65535u);
        _1568 = as_type<float>(_1576);
    }
    float _1578 = _1568;
    float _1580 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1562);
    bool _1582 = _1560 >= 0.0;
    float _1584 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1564);
    float _1586 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1588 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1566);
    float _1590 = _1434 * _1418;
    bool _1592 = _1560 <= 1.0;
    bool _1594 = _1592 && _1582;
    float _1596 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1598 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1600 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1586);
    float _1602 = _1588 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1604 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1606 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1608 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1610 = _1590 >= 0.0;
    bool _1612 = _1610 && _1594;
    float _1614 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1600);
    float _1616 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1606);
    float _1618 = -_1608;
    float _1620 = fma(_1618, _1604, 1.0);
    bool _1622 = _1590 <= 1.0;
    bool _1624 = _1622 && _1612;
    float _1626 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1628 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1616);
    float _1630 = _709 * _1352;
    float _1632 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1634 = log2(_1620);
    float _1636 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1628);
    float _1638 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1640 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1632);
    float _1642 = fma(_397, _1344, _1630);
    float _1644 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1638);
    float _1646 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1640);
    float _1648 = 1.0 / _1636;
    float _1650 = _1638;
    float _1652 = _1646;
    if (_1624)
    {
        float _1654 = float(_1079);
        _1494 = _1654;
    }
    float _1656 = _1494;
    float _1658 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1644);
    float _1660 = fma(_399, _1366, _1642);
    if (!_1059)
    {
        float _1662 = -_1320;
        float _1664 = _951 + _1662;
        _1650 = _1664;
    }
    float _1666 = _1650;
    float _1668 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1646);
    float _1670 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1658);
    float _1672 = _1660 + _1374;
    float _1674 = _1632;
    if (_1624)
    {
        float _1676 = rint(_1656);
        float _1678 = precise::max(_1676, 0.0);
        uint _1680 = uint(_1678);
        uint _1682 = clamp(_1680, 0u, 65535u);
        _1674 = as_type<float>(_1682);
    }
    float _1684 = _1674;
    float _1686 = _1634 * 0.693147182464599609375;
    if (!_1059)
    {
        float _1688 = -_1178;
        float _1690 = _899 + _1688;
        _1652 = _1690;
    }
    float _1692 = _1652;
    float _1694 = _1672 * _1418;
    float _1696 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1698 = _1668 * _1648;
    float _1700 = _1670 * _1648;
    float _1702 = fma(_1698, 0.5, 0.5);
    float _1704 = fma(_1700, -0.5, 0.5);
    float _1706 = _1178;
    if (!_1059)
    {
        float3 _5965 = float3(_1692, _1666, float(as_type<int>(_1578)));
        float3 _5969 = select(_5965, float3(0.0), isnan(_5965));
        float _1708 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5969.xy, uint(rint(_5969.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5969.xy, uint(rint(_5969.z)), level(0.0)).x;
        _1706 = _1708;
    }
    float _1710 = _1706;
    float _1712 = _1590;
    if (_1624)
    {
        float3 _5984 = float3(_1560, _1590, float(as_type<int>(_1684)));
        float3 _5986 = select(_5984, float3(0.0), isnan(_5984));
        float _1714 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5986.xy, uint(rint(_5986.z)), _1694, level(0.0));
        _1712 = _1714;
    }
    float _1716 = _1712;
    float3 _5996 = float3(_1702, _1704, _1696);
    float _1718 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5996, float3(0.0), isnan(_5996)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5996, float3(0.0), isnan(_5996)), level(0.0)).x;
    float3 _6005 = float3(_1702, _1704, _1696);
    float4 _1721 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6005, float3(0.0), isnan(_6005)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6005, float3(0.0), isnan(_6005)), level(0.0)).xyzw;
    float _1723 = _1721.x;
    float _1725 = _1721.y;
    float _1727 = _1721.z;
    float _1729 = _1721.w;
    float _1731 = float(uint(_647));
    float _1733 = trunc(_751);
    int _1735 = int(_1733);
    int _1737 = abs(_707);
    float _1739 = 1.0 / _1731;
    int _1741 = ~_647;
    int _1743 = _1741 + 1;
    int _1745 = ~_647;
    int _1747 = _1745 + 1;
    float _1749 = 1.0 / _361;
    float _1751 = float(uint(_1735));
    int _1753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1755 = _1753 != 0;
    int _1757 = as_type<int>(_1739) + (-2);
    float _1759 = as_type<float>(_1757) * _1751;
    float _1761 = trunc(_1759);
    float _1763 = precise::max(_1761, 0.0);
    uint _1765 = uint(_1763);
    int _1767 = _1743 * int(_1765);
    int _1769 = _1767 + _1735;
    float _1771 = float(uint(_1769));
    float _1773 = as_type<float>(_1757) * _1771;
    int _1775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1777 = _1775 != 0;
    float _1779 = float(_1735);
    float _1781 = trunc(_1773);
    float _1783 = precise::max(_1781, 0.0);
    uint _1785 = uint(_1783);
    bool _1787 = !_1777;
    float _1789 = _1787 ? 7.345489978790283203125 : 1.0;
    bool _1791 = _1779 >= _733;
    bool _1793 = isnan(_1779);
    bool _1795 = _1791 || _1793;
    bool _1797 = isnan(_733);
    bool _1799 = _1795 || _1797;
    float _1801 = float(_1799);
    float _1803 = _1789 * _169;
    float _1805 = trunc(_1801);
    int _1807 = int(_1805);
    int _1809 = int(_1765) + int(_1785);
    float _1811 = floor(_1803);
    int _1813 = _1747 * _1809;
    int _1815 = _1813 + _1735;
    bool _1817 = uint(_1815) >= uint(_647);
    int _1819 = ~_1807;
    int _1821 = _1819 + 1;
    int _1823 = _1821 + 1;
    bool _1825 = !_1817;
    int _1827 = _1825 ? 0 : (-1);
    bool _1829 = _647 == 0;
    float _1831 = -_1811;
    float _1833 = _1803 + _1831;
    int _1835 = ~_1809;
    int _1837 = _1835 + _1827;
    int _1839 = _1837 + 1;
    float _1841 = _747 * _1749;
    int _1843 = abs(_761);
    float _1845 = _1833 * _733;
    bool _1847 = !_1755;
    float _1849 = _1847 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1851 = _647 * _1839;
    int _1853 = _1851 + _1735;
    int _1855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1857 = _1855 != 0;
    float _1859 = trunc(_1841);
    int _1861 = int(_1859);
    float _1863 = _1849;
    if (_1059)
    {
        _767 = 1.0;
    }
    float _1865 = _767;
    bool _1867 = !_1829;
    int _1869 = _1867 ? _1853 : (-1);
    int _1871 = _647 + (-1);
    float _1873 = trunc(_1845);
    int _1875 = int(_1873);
    int _1877 = _1869 * _1823;
    int _1879 = abs(_693);
    int _1881 = abs(as_type<int>(_1849));
    int _1883 = _1807 * _1871;
    int _1885 = _1883 + _1877;
    bool _1887 = !_1857;
    int _1889 = _1887 ? 0 : 1;
    int _1891 = _1885 * _1879;
    bool _1893 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1895 = isnan(0.5);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1901 = _1897 || _1899;
    int _1903 = abs(_1889);
    int _1905 = _1861 * _1737;
    int _1907 = _1905 + _1891;
    int _1909 = _1875 * _1881;
    int _1911 = _1909 + _1735;
    int _1913 = _1911 * _1843;
    int _1915 = _1913 + _1907;
    int _1917 = _1875 * _1903;
    int _1919 = _1917 + _1915;
    int _1921 = ~_647;
    int _1923 = _1921 + 1;
    float _1925 = _1865;
    if (_1901)
    {
        _329 = 1.0;
    }
    float _1927 = _329;
    float _1929 = float(uint(_1919));
    float _1931 = _1927;
    if (_1901)
    {
        _1863 = 1.0;
    }
    float _1933 = _1863;
    float _1935 = as_type<float>(_1757) * _1929;
    float _1937 = trunc(_1935);
    float _1939 = precise::max(_1937, 0.0);
    uint _1941 = uint(_1939);
    int _1943 = _1923 * int(_1941);
    int _1945 = _1943 + _1919;
    float _1947 = float(uint(_1945));
    float _1949 = as_type<float>(_1757) * _1947;
    float _1951 = trunc(_1949);
    float _1953 = precise::max(_1951, 0.0);
    uint _1955 = uint(_1953);
    int _1957 = int(_1941) + int(_1955);
    float _1959 = _1933;
    if (!_1901)
    {
        float _1961 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1963 = _1961 * 0.15915493667125701904296875;
        float _1965 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1967 = _1963 * 6.283185482025146484375;
        float _1969 = cos(_1967);
        float _1971 = _1965 * 0.15915493667125701904296875;
        float _1973 = _1963 * 6.283185482025146484375;
        float _1975 = sin(_1973);
        float _1977 = 1.0 / _1969;
        float _1979 = _1971 * 6.283185482025146484375;
        float _1981 = cos(_1979);
        float _1983 = _1975 * _1977;
        float _1985 = _1971 * 6.283185482025146484375;
        float _1987 = sin(_1985);
        float _1989 = _1981 * _1983;
        float _1991 = 1.0 / _1989;
        float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1995 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1993;
        float _1997 = 1.0 / _1995;
        float _1999 = _1987 * _1991;
        float _2001 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2003 = fma(_1035, _1999, _2001);
        float _2005 = _2003 * _1997;
        float _2007 = precise::clamp(_2005, 0.0, 1.0);
        _1959 = _2007;
    }
    float _2009 = _1959;
    if (!_1901)
    {
        float _2011 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2013 = _2011 * 0.15915493667125701904296875;
        float _2015 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2017 = _2013 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        float _2021 = _2015 * 0.15915493667125701904296875;
        float _2023 = _2013 * 6.283185482025146484375;
        float _2025 = sin(_2023);
        float _2027 = 1.0 / _2019;
        float _2029 = _2021 * 6.283185482025146484375;
        float _2031 = cos(_2029);
        float _2033 = _2025 * _2027;
        float _2035 = _2021 * 6.283185482025146484375;
        float _2037 = sin(_2035);
        float _2039 = _2031 * _2033;
        float _2041 = 1.0 / _2039;
        float _2043 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2045 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2043;
        float _2047 = 1.0 / _2045;
        float _2049 = _2037 * _2041;
        float _2051 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2053 = fma(_1035, _2049, _2051);
        float _2055 = _2053 * _2047;
        float _2057 = precise::clamp(_2055, 0.0, 1.0);
        float _2059 = -_2057;
        float _2061 = _2059 + 1.0;
        _1931 = _2061;
    }
    float _2063 = _1931;
    if (!_1059)
    {
        int _2065 = _1095 << 4;
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
        float _2103 = _709 * _2083;
        float _2105 = fma(_397, _2075, _2103);
        float _2107 = fma(_399, _2093, _2105);
        float _2109 = _2107 + _2101;
        float _2111 = precise::clamp(_2109, 0.0, 1.0);
        float _2113 = -_2111;
        float _2115 = _2113 + _1710;
        float _2117 = fma(_2115, 500.0, 1.5);
        float _2119 = exp2(_2117);
        float _2121 = 0.0 + _2119;
        float _2123 = precise::clamp(_2121, 0.0, 1.0);
        _769 = _2103;
        _1107 = as_type<float>(_2067);
        _1925 = _2123;
    }
    float _2125 = _769;
    float _2127 = _1107;
    float _2129 = _1925;
    float _2131 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2133 = _1546 + _2131;
    float _2135 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2137 = _1548 + _2135;
    float _2139 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2141 = _1550 + _2139;
    float _2143 = _2133 * _2133;
    float _2145 = fma(_2137, _2137, _2143);
    float _2147 = fma(_2141, _2141, _2145);
    float _2149 = rsqrt(_2147);
    float _2151 = sqrt(_2147);
    float _2153 = _2149 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2155 = _2137 * _2153;
    float _2157 = _2141 * _2153;
    float _2159 = _2155 * _2155;
    float _2161 = _2157 * _2157;
    float _2163 = _2159 + _2161;
    float _2165 = sqrt(_2163);
    bool _2167 = _2165 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2171 = _2165 + _2169;
    float _2173 = _2125;
    float _2175 = _2163;
    float _2177 = _2171;
    float _2179 = _2127;
    float _2181 = _2155;
    float _2183 = _2157;
    float _2185 = _2159;
    float _2187 = _2161;
    if (_2167)
    {
        float _2189 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2173 = _2189;
    }
    float _2191 = _2173;
    if (_2167)
    {
        float _2193 = rsqrt(_2163);
        _2175 = _2193;
    }
    float _2195 = _2175;
    if (_2167)
    {
        float _2197 = _2171 * _2191;
        _2177 = _2197;
    }
    float _2199 = _2177;
    if (_2167)
    {
        float _2201 = _2199 * 0.15915493667125701904296875;
        _2179 = _2201;
    }
    float _2203 = _2179;
    float _2205 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2207 = _399;
    if (_2167)
    {
        float _2209 = _2203 * 6.283185482025146484375;
        float _2211 = sin(_2209);
        _2207 = _2211;
    }
    float _2213 = _2207;
    float _2215 = precise::max(0.0, _2205);
    float _2217 = _2199;
    float _2219 = _2215;
    if (_2167)
    {
        float _2221 = _2203 * 6.283185482025146484375;
        float _2223 = cos(_2221);
        _2217 = _2223;
    }
    float _2225 = _2217;
    float _2227 = -_2153;
    float _2229 = -_2215;
    float _2231 = fma(_2133, _2227, _2229);
    float _2233 = _2231;
    if (_2167)
    {
        float _2235 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2219 = _2235;
    }
    float _2237 = _2219;
    float _2239 = _2213;
    float _2241 = _2237;
    if (_2167)
    {
        float _2243 = fma(_2213, _2237, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2239 = _2243;
    }
    float _2245 = _2239;
    float _2247 = _2245;
    if (_2167)
    {
        float _2249 = _2195 * _2245;
        _2247 = _2249;
    }
    float _2251 = _2247;
    if (_2167)
    {
        float _2253 = _2225 + (-1.0);
        _2241 = _2253;
    }
    float _2255 = _2241;
    float _2257 = _2255;
    if (_2167)
    {
        float _2259 = _2155 * _2251;
        _2181 = _2259;
    }
    float _2261 = _2181;
    if (_2167)
    {
        float _2263 = _2157 * _2251;
        _2183 = _2263;
    }
    float _2265 = _2183;
    if (_2167)
    {
        float _2267 = _2255 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2257 = _2267;
    }
    float _2269 = _2257;
    if (_2167)
    {
        float _2271 = _2261 * _2261;
        _2185 = _2271;
    }
    float _2273 = _2185;
    if (_2167)
    {
        float _2275 = _2265 * _2265;
        _2187 = _2275;
    }
    float _2277 = _2187;
    if (_2167)
    {
        float _2279 = fma(_2231, _2225, _2269);
        _2233 = _2279;
    }
    float _2281 = _2233;
    int _2283 = ~_647;
    int _2285 = _2283 + 1;
    float _2287 = fma(_2281, _2281, _2273);
    float _2289 = _2287 + _2277;
    float _2291 = rsqrt(_2289);
    float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2295 = fma(_2151, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2293);
    float _2297 = precise::clamp(_2295, 0.0, 1.0);
    float _2299 = -_2297;
    float _2301 = _2299 + 1.0;
    float _2303 = abs(_2301);
    float _2305 = log2(_2303);
    float _2307 = _2291 * _2261;
    float _2309 = _2291 * _2281;
    float _2311 = _2291 * _2265;
    float _2313 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2315 = _2309 + 1.0;
    float _2317 = -_2313;
    float _2319 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2317);
    float _2321 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2323 = -_2311;
    float _2325 = fma(_2323, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2319);
    float _2327 = exp2(_2321);
    float _2329 = fma(_2325, -0.5, 0.5);
    float _2331 = fma(_2325, 0.5, 0.5);
    float _2333 = fma(_2331, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2335 = sqrt(_2329);
    float _2337 = fma(_2331, _2333, -0.212114393711090087890625);
    float _2339 = fma(_2331, _2337, 1.570728778839111328125);
    float _2341 = -_2309;
    float _2343 = fma(_2327, _2315, _2341);
    float _2345 = fma(_2343, 0.5, 0.5);
    int _2347 = _2285 * _1957;
    int _2349 = _2347 + _1919;
    float _2351 = _2335 * 0.636619746685028076171875;
    float _2353 = -_2339;
    float _2355 = fma(_2351, _2353, 1.0);
    float2 _6901 = float2(_2355, _2345);
    float3 _2359 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6901, float2(0.0), isnan(_6901)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6901, float2(0.0), isnan(_6901)), level(0.0)).xyz;
    float _2361 = _2359.x;
    float _2363 = _2359.y;
    float _2365 = _2359.z;
    bool _2367 = uint(_2349) >= uint(_647);
    float _2369 = -_753;
    float _2371 = _2369 + 1.0;
    float _2373 = float(uint(_1911));
    float _2375 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2377 = !_2367;
    int _2379 = _2377 ? 0 : (-1);
    float _2381 = -_417;
    float _2383 = _2381 + 1.0;
    int _2385 = ~_647;
    int _2387 = _2385 + 1;
    float _2389 = as_type<float>(_1757) * _2373;
    int _2391 = ~_1957;
    int _2393 = _2391 + _2379;
    int _2395 = _2393 + 1;
    float _2397 = exp2(_2375);
    int _2399 = ~_647;
    int _2401 = _2399 + 1;
    float _2403 = -_757;
    float _2405 = _2403 + 1.0;
    int _2407 = _647 * _2395;
    int _2409 = _2407 + _1919;
    float _2411 = trunc(_2389);
    float _2413 = precise::max(_2411, 0.0);
    uint _2415 = uint(_2413);
    bool _2417 = !_1829;
    int _2419 = _2417 ? _2409 : (-1);
    int _2421 = _2419 >> 31;
    int _2423 = _2419 & 3;
    bool _2425 = _2423 != 0;
    int _2427 = _2421 & 3;
    bool _2429 = uint(_2423) > 1u;
    int _2431 = _2419 + _2427;
    int _2433 = _2419 & 3;
    bool _2435 = _2433 != 0;
    int _2437 = _2387 * int(_2415);
    int _2439 = _2437 + _1911;
    int _2441 = _2431 >> 2;
    bool _2443 = _2423 != 3;
    float _2445 = float(uint(_2439));
    int _2447 = _2441 << 4;
    int _2449 = _2447 + 368;
    float _2451 = as_type<float>(_1757) * _2445;
    int _2453 = _2449 + 8;
    uint _2455 = uint(int(uint(_2453) >> uint(2)));
    uint _2457 = uint(int(uint(int(_2455)) >> uint(2)));
    int _2459 = int(_2455) & 3;
    float _2461 = (*spvDescriptorSet0.vp_c9)._m0[int(_2457)][_2459];
    int _2463 = int(_2455) + 1;
    uint _2465 = uint(int(uint(_2463) >> uint(2)));
    int _2467 = _2463 & 3;
    float _2469 = (*spvDescriptorSet0.vp_c9)._m0[int(_2465)][_2467];
    float _2471 = trunc(_2451);
    float _2473 = precise::max(_2471, 0.0);
    uint _2475 = uint(_2473);
    uint _2477 = uint(int(uint(_2449) >> uint(2)));
    uint _2479 = uint(int(uint(int(_2477)) >> uint(2)));
    int _2481 = int(_2477) & 3;
    float _2483 = (*spvDescriptorSet0.vp_c9)._m0[int(_2479)][_2481];
    int _2485 = int(_2477) + 1;
    uint _2487 = uint(int(uint(_2485) >> uint(2)));
    int _2489 = _2485 & 3;
    float _2491 = (*spvDescriptorSet0.vp_c9)._m0[int(_2487)][_2489];
    int _2493 = int(_2415) + int(_2475);
    int _2495 = _2435 ? 0 : 1;
    bool _2497 = uint(_2423) >= 2u;
    int _2499 = _2401 * _2493;
    int _2501 = _2499 + _1911;
    int _2503 = _2497 ? 0 : 1;
    bool _2505 = uint(_2501) >= uint(_647);
    int _2507 = ~_2495;
    int _2509 = _2507 + 1;
    int _2511 = _2509 + 1;
    int _2513 = _2511;
    if (!_2429)
    {
        int _2515 = ~_2495;
        int _2517 = _2515 + 1;
        _2513 = _2517;
    }
    int _2519 = _2513;
    bool _2521 = !_2425;
    int _2523 = _2521 ? 0 : 1;
    int _2525 = abs(_2519);
    int _2527 = ~_2503;
    int _2529 = _2527 + 1;
    int _2531 = _2529 + 1;
    int _2533 = _2531;
    if (_2443)
    {
        int _2535 = ~_2503;
        int _2537 = _2535 + 1;
        _2533 = _2537;
    }
    int _2539 = _2533;
    int _2541 = abs(_2523);
    float _2543 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2545 = int(_2543);
    bool _2547 = _2423 != 3;
    int _2549 = ~_2525;
    int _2551 = _2549 + 1;
    int _2553 = _2551 + 1;
    int _2555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2557 = _2555 != 0;
    bool _2559 = !_2547;
    int _2561 = _2559 ? 0 : (-1);
    int _2563 = _2553 * as_type<int>(_2491);
    int _2565 = ~_2541;
    int _2567 = _2565 + 1;
    int _2569 = _2567 + 1;
    int _2571 = abs(_2539);
    bool _2573 = !_2557;
    int _2575 = _2573 ? 0 : 1;
    int _2577 = _2569 * as_type<int>(_2483);
    int _2579 = _2577 + _2563;
    int _2581 = abs(_2561);
    bool _2583 = !_2505;
    int _2585 = _2583 ? 0 : (-1);
    int _2587 = ~_2571;
    int _2589 = _2587 + 1;
    int _2591 = _2589 + 1;
    int _2593 = abs(_2575);
    int _2595 = _2591 * as_type<int>(_2461);
    int _2597 = _2595 + _2579;
    int _2599 = ~_2493;
    int _2601 = _2599 + _2585;
    int _2603 = _2601 + 1;
    int _2605 = ~_2581;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    int _2611 = _647 * _2603;
    int _2613 = _2611 + _1911;
    int _2615 = ~_2593;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    float _2621 = float(uint(_2545));
    int _2623 = _2609 * as_type<int>(_2469);
    int _2625 = _2623 + _2597;
    bool _2627 = !_1829;
    int _2629 = _2627 ? _2613 : (-1);
    float _2631 = abs(_1035);
    float _2633 = log2(_2631);
    int _2635 = abs(_2545);
    int _2637 = _2625 * _2619;
    bool _2639 = _169 > 0.5;
    int _2641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2643 = _2641 != 0;
    int _2645 = _2629 * _2593;
    int _2647 = _2645 + _2637;
    float _2649 = float(uint(_2635));
    float _2651 = 1.0 / _2621;
    int _2653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2655 = _2653 != 0;
    float _2657 = float(uint(_2647));
    int _2659 = abs(_2647);
    bool _2661 = _429 > 0.5;
    float _2663 = 1.0 / _2649;
    float _2665 = float(uint(_2659));
    int _2667 = as_type<int>(_2651) + (-2);
    int _2669 = ~_2545;
    int _2671 = _2669 + 1;
    float _2673 = as_type<float>(_2667) * _2657;
    float _2675 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2677 = as_type<int>(_2663) + (-2);
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2681 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2683 = trunc(_2673);
    float _2685 = precise::max(_2683, 0.0);
    uint _2687 = uint(_2685);
    float _2689 = as_type<float>(_2677) * _2665;
    int _2691 = ~_2635;
    int _2693 = _2691 + 1;
    float _2695 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2697 = _2675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2699 = _2679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2701 = _2695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2703 = trunc(_2689);
    float _2705 = precise::max(_2703, 0.0);
    uint _2707 = uint(_2705);
    float _2709 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_78.x = _2697;
    out.m_78.y = _2699;
    out.m_78.z = _2701;
    out.m_78.w = _2681;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2713 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2715 = _1035 <= 8000.0;
    bool _2717 = isnan(_1035);
    bool _2719 = _2715 || _2717;
    bool _2721 = isnan(8000.0);
    bool _2723 = _2719 || _2721;
    float _2725 = float(_2723);
    int _2727 = _2671 * int(_2687);
    int _2729 = _2727 + _2647;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2733 = _2633 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2735 = _2713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2737 = _2711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2739 = float(uint(_2729));
    float _2741 = _2731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2743 = _2693 * int(_2707);
    int _2745 = _2743 + _2659;
    float _2747 = exp2(_2733);
    float _2749 = as_type<float>(_2667) * _2739;
    float _2751 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2753 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2755 = float(uint(_2745));
    out.m_80.x = _2737;
    out.m_80.y = _2735;
    out.m_80.z = _2741;
    float _2757 = -_1140;
    float _2759 = fma(_2757, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2751);
    float _2761 = -_1140;
    float _2763 = fma(_2761, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2753);
    float _2765 = trunc(_2749);
    float _2767 = precise::max(_2765, 0.0);
    uint _2769 = uint(_2767);
    float _2771 = as_type<float>(_2677) * _2755;
    float _2773 = -_1140;
    float _2775 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2709);
    float _2777 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2759);
    float _2779 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2763);
    float _2781 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2783 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2775);
    int _2785 = ~_2545;
    int _2787 = _2785 + 1;
    float _2789 = trunc(_2771);
    float _2791 = precise::max(_2789, 0.0);
    uint _2793 = uint(_2791);
    float _2795 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2797 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2799 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2781);
    float _2801 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2803 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2795);
    float _2805 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2797);
    float _2807 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2809 = int(_2687) + int(_2769);
    float _2811 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2813 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2801);
    float _2815 = -_221;
    int _2817 = _2661 ? as_type<int>(_2815) : as_type<int>(_221);
    float _2819 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2811);
    float _2821 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2807);
    int _2823 = ~_2635;
    int _2825 = _2823 + 1;
    int _2827 = _2787 * _2809;
    int _2829 = _2827 + _2647;
    int _2831 = int(_2707) + int(_2793);
    float _2833 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2799);
    bool _2835 = !_2655;
    float _2837 = _2835 ? _221 : as_type<float>(_2817);
    float _2839 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2841 = uint(_2829) >= uint(_2545);
    int _2843 = _2825 * _2831;
    int _2845 = _2843 + _2659;
    float _2847 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2803);
    float _2849 = _2839 * _2777;
    float _2851 = _2839 * _2783;
    float _2853 = _2839 * _2779;
    bool _2855 = !_2841;
    int _2857 = _2855 ? 0 : (-1);
    float _2859 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2805);
    bool _2861 = uint(_2845) >= uint(_2635);
    float _2863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2865 = _2647 ^ _2545;
    float _2867 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2819);
    int _2869 = ~_2809;
    int _2871 = _2869 + _2857;
    int _2873 = _2871 + 1;
    float _2875 = fma(_2747, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2877 = precise::clamp(_2875, 0.0, 1.0);
    bool _2879 = !_2861;
    int _2881 = _2879 ? 0 : (-1);
    uint _2883 = uint(int(uint(_2865) >> uint(31)));
    int _2885 = _2545 * _2873;
    int _2887 = _2885 + _2647;
    bool _2889 = _2545 == 0;
    float _2891 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2813);
    bool _2893 = _2545 == 0;
    float _2895 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2821);
    int _2897 = ~_2881;
    int _2899 = _2831 + _2897;
    int _2901 = _2899 + 1;
    float _2903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2905 = ~int(_2883);
    int _2907 = _2905 + 1;
    float _2909 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2911 = -_325;
    int _2913 = _2639 ? as_type<int>(_2911) : as_type<int>(_325);
    int _2915 = _2901 ^ _2907;
    float _2917 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2909);
    bool _2919 = !_2889;
    int _2921 = _2919 ? _2887 : (-1);
    int _2923 = ~_2907;
    int _2925 = _2923 + _2915;
    int _2927 = _2925 + 1;
    float _2929 = _325 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2931 = !_2643;
    float _2933 = _2931 ? _325 : as_type<float>(_2913);
    float _2935 = _2863 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2937 = !_2893;
    int _2939 = _2937 ? _2927 : (-1);
    float _2941 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2917);
    float _2943 = float(_2921);
    float _2945 = fma(_2929, _2833, _2851);
    float _2947 = float(_2939);
    float _2949 = _2903 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2951 = fma(_2929, _2847, _2849);
    float _2953 = fma(_2935, _2943, _745);
    float _2955 = _2837 + (-0.5);
    float _2957 = -_755;
    float _2959 = fma(_2949, _2947, _2957);
    float _2961 = _2933 + 0.5;
    float _2963 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2941);
    float _2965 = -_2949;
    float _2967 = fma(_2965, _2955, _2959);
    float _2969 = fma(_2935, _2961, _2953);
    float _2971 = _2963 + _1636;
    float _2973 = fma(_2837, _2405, _2967);
    float _2975 = -_2371;
    float _2977 = fma(_2933, _2975, _2969);
    float _2979 = fma(_2929, _2859, _2853);
    float _2981 = fma(_2877, -2.0, 3.0);
    float _2983 = _2877 * _2877;
    float _2985 = -_2397;
    float _2987 = _2985 + 1.0;
    float _2989 = _2895 + _2979;
    float _2991 = _2983 * _2981;
    float _2993 = _2987 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2995 = _2971 * 0.5;
    float _2997 = -_2991;
    float _2999 = _2997 + 1.0;
    float _3001 = _2993 * _1718;
    float _3003 = _2891 + _2951;
    float _3005 = _2867 + _2945;
    float _3007 = fma(_2999, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2991);
    float _3009 = _2999;
    float _3011 = _2837;
    float _3013 = _2993;
    if (!_1624)
    {
        _3009 = 1.0;
    }
    float _3015 = _3009;
    float _3017 = _2365 * _3001;
    float _3019 = _3015;
    if (_1624)
    {
        bool _3021 = _1716 >= _1694;
        bool _3023 = isnan(_1716);
        bool _3025 = _3021 || _3023;
        bool _3027 = isnan(_1694);
        bool _3029 = _3025 || _3027;
        float _3031 = float(_3029);
        _3019 = _3031;
    }
    float _3033 = _3019;
    float _3035 = _2725 * _3007;
    out.gl_Position.x = _1668;
    out.gl_Position.y = _1670;
    out.gl_Position.z = _2963;
    out.gl_Position.w = _1636;
    float _3037 = fma(_1729, _3017, _1727);
    bool _3039 = _2151 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3041 = isnan(_2151);
    bool _3043 = _3039 || _3041;
    bool _3045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3047 = _3043 || _3045;
    float _3049 = _3035 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3051 = _3033 * _2129;
    out.m_82.z = _2995;
    out.m_82.w = _1636;
    float _3053 = _2383 * _3049;
    float _3055 = precise::clamp(_3053, 0.0, 1.0);
    float _3057 = -_2993;
    float _3059 = _3057 + 1.0;
    out.m_84.x = _2977;
    out.m_84.y = _2973;
    float _3061 = -_3055;
    float _3063 = fma(_3061, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3065 = _1729 * _3001;
    float _3067 = _1729 * _3059;
    out.m_86.x = _3003;
    out.m_86.y = _3005;
    out.m_86.z = _2989;
    float _3069 = -_3051;
    float _3071 = fma(_3069, _3063, 1.0);
    float _3073 = precise::clamp(_3071, 0.0, 1.0);
    float _3075 = fma(_2361, _3065, _1723);
    float _3077 = fma(_2363, _3065, _1725);
    float _3079 = _2009 * _2063;
    float _3081 = _3073 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3083 = _3059;
    float _3085 = _3051;
    float _3087 = _3073;
    float _3089 = _3079;
    if (!_3047)
    {
        _3011 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3091 = _3011;
    out.m_88.x = _3075;
    out.m_88.y = _3077;
    out.m_88.z = _3037;
    out.m_88.w = _3067;
    float _3093 = _3079 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3095 = _3091;
    float _3097 = _3091;
    if (!_3047)
    {
        _3013 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3099 = _3013;
    out.m_90.x = _3081;
    float _3101 = _3099;
    float _3103 = _3099;
    if (!_3047)
    {
        _3083 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3105 = _3083;
    float _3107 = _3105;
    float _3109 = _3105;
    if (!_3047)
    {
        _3085 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3111 = _3085;
    float _3113 = _3111;
    float _3115 = _3111;
    if (!_3047)
    {
        _3087 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3117 = _3087;
    float _3119 = _3117;
    float _3121 = _3117;
    if (!_3047)
    {
        _3089 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3123 = _3089;
    bool _3125 = !_3047;
    float _3127 = _3123;
    float _3129 = _3123;
    if (!_3125)
    {
        bool _3131 = _2151 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3133 = isnan(_2151);
        bool _3135 = _3131 || _3133;
        bool _3137 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3139 = _3135 || _3137;
        if (!_3139)
        {
            float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3143 = _2151 + _3141;
            float _3145 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3147 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3145;
            float _3149 = 1.0 / _3147;
            float _3151 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3167 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3171 = _3143 * _3149;
            float _3173 = precise::clamp(_3171, 0.0, 1.0);
            float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3179 = fma(_3173, _3153, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3181 = fma(_3173, _3177, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3183 = fma(_3173, _3157, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3185 = fma(_3173, _3161, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3187 = fma(_3173, _3165, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3189 = fma(_3173, _3169, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3103 = _3181;
            _3121 = _3187;
            _3097 = _3179;
            _3115 = _3185;
            _3109 = _3183;
            _3129 = _3189;
            _3191 = true;
        }
        else
        {
            bool _3193 = _2151 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3195 = isnan(_2151);
            bool _3197 = _3193 || _3195;
            bool _3199 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3201 = _3197 || _3199;
            if (!_3201)
            {
                _3095 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3203 = _3095;
            _3097 = _3203;
            if (!_3201)
            {
                _3101 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3205 = _3101;
            _3103 = _3205;
            if (!_3201)
            {
                _3107 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3207 = _3107;
            _3109 = _3207;
            if (!_3201)
            {
                _3113 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3209 = _3113;
            _3115 = _3209;
            if (!_3201)
            {
                _3119 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3211 = _3119;
            _3121 = _3211;
            if (!_3201)
            {
                _3127 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3213 = _3127;
            bool _3215 = !_3201;
            _3129 = _3213;
            if (!_3215)
            {
                bool _3217 = _2151 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3219 = isnan(_2151);
                bool _3221 = _3217 || _3219;
                bool _3223 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3225 = _3221 || _3223;
                if (!_3225)
                {
                    float _3227 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3229 = _2151 + _3227;
                    float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3233 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3231;
                    float _3235 = 1.0 / _3233;
                    float _3237 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3239 = _3237 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3241 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3243 = _3241 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3245 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3257 = _3229 * _3235;
                    float _3259 = precise::clamp(_3257, 0.0, 1.0);
                    float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3263 = _3261 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3265 = fma(_3259, _3239, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3267 = fma(_3259, _3263, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3269 = fma(_3259, _3243, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3271 = fma(_3259, _3247, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3273 = fma(_3259, _3251, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3275 = fma(_3259, _3255, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3103 = _3267;
                    _3121 = _3273;
                    _3097 = _3265;
                    _3115 = _3271;
                    _3109 = _3269;
                    _3129 = _3275;
                    _3191 = true;
                }
                else
                {
                    _3103 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3121 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3097 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3115 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3109 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3129 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3191 = false;
    float _3277 = _3103;
    float _3279 = _3121;
    float _3281 = _3097;
    float _3283 = _3115;
    float _3285 = _3109;
    float _3287 = _3129;
    float _3289 = _3093 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3291 = fma(_3005, -0.5, 0.5);
    float _3293 = precise::clamp(_3291, 0.0, 1.0);
    float _3295 = -_3277;
    float _3297 = _3295 + _3279;
    float _3299 = -_3281;
    float _3301 = _3299 + _3283;
    out.m_59.x = _3289;
    float _3303 = -_3285;
    float _3305 = _3303 + _3287;
    float _3307 = fma(_3293, _3297, _3277);
    float _3309 = fma(_3293, _3301, _3281);
    bool _3311 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3313 = _3307 * 0.586610972881317138671875;
    float _3315 = fma(_3293, _3305, _3285);
    out.m_92.x = 0.0;
    bool _3317 = _2009 > 0.0;
    bool _3319 = isnan(_2009);
    bool _3321 = _3317 || _3319;
    bool _3323 = isnan(0.0);
    bool _3325 = _3321 || _3323;
    float _3327 = fma(_3309, 0.298911988735198974609375, _3313);
    bool _3329 = _2063 <= 0.0;
    bool _3331 = !_3325;
    bool _3333 = _3329 || _3331;
    float _3335 = fma(_3315, 0.114477999508380889892578125, _3327);
    float _3337 = -_3335;
    float _3339 = _3309 + _3337;
    float _3341 = -_3335;
    float _3343 = _3307 + _3341;
    float _3345 = -_3335;
    float _3347 = _3315 + _3345;
    float _3349 = fma(_3339, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3335);
    float _3351 = fma(_3343, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3335);
    float _3353 = fma(_3347, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3335);
    bool _3355 = !_3311;
    if (!_3355)
    {
        float _3357 = -_1546;
        float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3361 = -_1548;
        float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3365 = -_1550;
        float _3367 = _3365 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3369 = _3359 * _3359;
        float _3371 = fma(_3363, _3363, _3369);
        float _3373 = fma(_3367, _3367, _3371);
        float _3375 = sqrt(_3373);
        float _3377 = rsqrt(_3373);
        float _3379 = -_3375;
        float _3381 = _3379 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3383 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3385 = precise::clamp(_3383, 0.0, 1.0);
        float _3387 = _3363 * _3377;
        float _3389 = _3359 * _3377;
        float _3391 = abs(_3385);
        float _3393 = log2(_3391);
        float _3395 = _3367 * _3377;
        float _3397 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3399 = _3005 * _3389;
        float _3401 = -_3389;
        float _3403 = -_3397;
        float _3405 = fma(_3401, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3403);
        float _3407 = fma(_3003, _3387, _3399);
        float _3409 = -_3395;
        float _3411 = fma(_3409, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3405);
        float _3413 = fma(_2989, _3395, _3407);
        float _3415 = precise::clamp(_3413, 0.0, 1.0);
        float _3417 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3419 = _3411 + _3417;
        float _3421 = _3393 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3423 = _3419 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3425 = precise::clamp(_3423, 0.0, 1.0);
        float _3427 = exp2(_3421);
        float _3429 = _3427 * _3425;
        float _3431 = _3415 * _3429;
        float _3433 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3435 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3437 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _3433;
        out.m_92.y = _3435;
        out.m_92.z = _3437;
    }
    out.m_94.x = _3349;
    out.m_94.y = _3351;
    out.m_94.z = _3353;
    if (!_3333)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _3439 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3439;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3191 = false;
    bool _351 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_59.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3496 = as_type<float>(_129);
        out.gl_Position.z = _3496;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_61.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_59.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3565 = as_type<float>(_167);
        out.gl_Position.z = _3565;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = in.m_63.x;
    float _171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _173 = _147 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _179 = _173 * _171;
    float _181 = _147 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _183 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[20].x, _179);
    float _185 = _181 * _177;
    float _187 = floor(_183);
    float _189 = _183 * 6.283185482025146484375;
    float _191 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[20].y, _185);
    int _193 = as_type<int>(_175) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_175) & 2;
    bool _199 = _197 != 0;
    float _201 = _189 * 0.15915493667125701904296875;
    float _203 = floor(_191);
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    float _209 = -_187;
    float _211 = _183 + _209;
    float _213 = _201 * 6.283185482025146484375;
    float _215 = cos(_213);
    float _217 = _191 * 6.283185482025146484375;
    bool _219 = !_199;
    float _221 = _219 ? (-0.5) : 0.5;
    int _223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _225 = _223 != 0;
    int _227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _229 = _227 != 0;
    float _231 = _217 * 0.15915493667125701904296875;
    bool _233 = !_207;
    int _235 = _233 ? 0 : 1;
    float _237 = -_203;
    float _239 = _191 + _237;
    bool _241 = _211 < 0.5;
    float _243 = float(_241);
    float _245 = -_211;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _249 = !_225;
    int _251 = _249 ? 0 : 1;
    float _253 = _231 * 6.283185482025146484375;
    float _255 = cos(_253);
    int _257 = abs(_235);
    float _259 = -_243;
    float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _263 = abs(_251);
    float _265 = fma(_215, 0.5, 0.5);
    bool _267 = !_229;
    int _269 = _267 ? 0 : 1;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _273 = -_265;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _277 = abs(_269);
    float _279 = float(_263);
    float _281 = fma(_255, 0.5, 0.5);
    float _283 = -_239;
    float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _287 = float(_257);
    bool _289 = _239 < 0.5;
    float _291 = float(_289);
    float _293 = abs(_247);
    float _295 = _279 * _293;
    float _297 = -_281;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _301 = abs(_285);
    float _303 = _279 * _301;
    float _305 = float(_277);
    float _307 = fma(_287, _275, _295);
    float _309 = -_291;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _313 = fma(_287, _299, _303);
    float _315 = abs(_261);
    float _317 = fma(_305, _315, _307);
    float _319 = abs(_311);
    float _321 = fma(_305, _319, _313);
    bool _323 = !_195;
    float _325 = _323 ? (-0.5) : 0.5;
    bool _327 = !_271;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _347;
    float _349;
    if (!_327)
    {
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _333 = _169 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _335 = float(_113);
        float _337 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _339 = _337 * _331;
        float _341 = floor(_339);
        float _343 = -_341;
        float _345 = _339 + _343;
        _347 = _345;
        _349 = _335;
        _351 = true;
    }
    else
    {
        float _353 = float(_113);
        float _355 = 1.0 / _353;
        float _357 = _147 * _355;
        _347 = _357;
        _349 = _353;
    }
    _351 = false;
    float _359 = _347;
    float _361 = _349;
    float _363 = in.m_56.x;
    float _365 = in.m_56.y;
    float _367 = in.m_56.z;
    float _369 = in.m_68.x;
    float _371 = in.m_68.y;
    float _373 = in.m_68.z;
    float _375 = in.m_68.w;
    float _377 = in.m_70.x;
    float _379 = in.m_70.y;
    float _381 = in.m_70.z;
    float _383 = in.m_70.w;
    float _385 = _365 * _371;
    float _387 = _365 * _379;
    float _389 = fma(_363, _369, _385);
    float _391 = fma(_363, _377, _387);
    float _393 = fma(_367, _373, _389);
    float _395 = fma(_367, _381, _391);
    float _397 = _393 + _375;
    float _399 = _395 + _383;
    float _401 = fma(_397, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _403 = fma(_399, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _405 = floor(_401);
    float _407 = floor(_403);
    float _409 = -_405;
    float _411 = _401 + _409;
    float _413 = -_407;
    float _415 = _403 + _413;
    float2 _3913 = float2(_411, _415);
    float _417 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3913, float2(0.0), isnan(_3913)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3913, float2(0.0), isnan(_3913)), level(0.0)).x;
    float _419 = in.m_72.x;
    float _421 = in.m_72.y;
    float _423 = in.m_72.z;
    float _425 = in.m_72.w;
    float _427 = _169 * 2.0;
    float _429 = in.m_63.y;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _431;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _437 = floor(_427);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _443 = _169 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _447 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _449 = isnan(_359);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -_435;
    float _461 = fma(_443, 2.0, _459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _463;
    float _467 = 1.0 / _441;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _471 = _365 * _421;
    float _473 = 1.0 / _433;
    float _475 = in.m_63.z;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _479 = _359 + _477;
    float _481 = fma(_363, _419, _471);
    bool _483 = _437 > 0.0;
    float _485 = _429 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _487 = _437 >= 0.0;
    bool _489 = isnan(_437);
    bool _491 = _487 || _489;
    bool _493 = isnan(0.0);
    bool _495 = _491 || _493;
    float _497 = fma(_367, _423, _481);
    float _499 = _479 * _467;
    float _501 = _169 + _429;
    float _503 = 1.0 / _465;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _507 = _359 + _505;
    float _509 = _501 + (-1.0);
    float _511 = _429 * 2.0;
    float _513 = _507 * _473;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _517 = _359 + _515;
    float _519 = floor(_511);
    float _521 = _497 + _425;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _533 = _531 != 0;
    float _535 = fma(_485, -2.0, _445);
    float _537 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[78].z, _469);
    float _539 = _169 + _475;
    float _541 = _429 + _475;
    float _543 = _517 * _503;
    float _545 = _539 + (-1.0);
    float _547 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _549 = _541 + (-1.0);
    float _551 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _553 = log2(_551);
    float _555 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _557 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _559;
    bool _563 = _519 > 0.0;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _565;
    float _569 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _571 = int(_569);
    bool _573 = _519 >= 0.0;
    bool _575 = isnan(_519);
    bool _577 = _573 || _575;
    bool _579 = isnan(0.0);
    bool _581 = _577 || _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _587;
    int _591 = _495 ? 0 : 1;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _601 = _475 * 2.0;
    float _603 = _553 * _147;
    float _605 = fma(_595, _499, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _607 = fma(_599, _499, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _609 = ~_591;
    int _611 = _609 + 1;
    int _613 = _611 + 1;
    float _615 = exp2(_603);
    int _617 = _613;
    if (!_483)
    {
        int _619 = ~_591;
        int _621 = _619 + 1;
        _617 = _621;
    }
    int _623 = _617;
    float _625 = fma(_567, _543, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _627 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _629 = isnan(_359);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = fma(_561, _543, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _641 = float(_571);
    float _643 = fma(_585, _513, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _645 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _647 = int(_645);
    bool _649 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _651 = isnan(_359);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = fma(_589, _513, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _663 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _665 = isnan(_359);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _677 = 1.0 + _675;
    bool _679 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _681 = isnan(0.0);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _687 = _683 || _685;
    float _689 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _691 = !_529;
    int _693 = _691 ? 0 : 1;
    float _695 = -_615;
    float _697 = _695 + 1.0;
    float _699 = 1.0 / _641;
    float _701 = -_673;
    float _703 = _701 + 1.0;
    bool _705 = !_525;
    int _707 = _705 ? 0 : 1;
    float _709 = _521 + _689;
    float _711 = _687 ? _697 : 0.0;
    float _713 = _659 * _703;
    bool _715 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _717 = isnan(1.0);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _723 = _719 || _721;
    float _725 = -_659;
    float _727 = _725 + 1.0;
    float _729 = 1.0 / _677;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _733 = float(_647);
    float _735 = _637 * _727;
    float _737 = -_637;
    float _739 = _737 + 1.0;
    float _741 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[78].w, _731);
    float _743 = -_147;
    float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[76].x, _461);
    float _747 = _733 * _147;
    float _749 = floor(_601);
    float _751 = _699 * _147;
    float _753 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _537);
    float _755 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _535);
    float _757 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _741);
    bool _759 = !_533;
    int _761 = _759 ? 0 : 1;
    float _763 = _457 * _739;
    float _765 = _521 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _767 = _747;
    float _769 = _709;
    if (_723)
    {
        float _771 = _711 * _729;
        _151 = _771;
    }
    float _773 = _151;
    float _775 = float(_623);
    float _777 = _661 * _763;
    float _779 = fma(_397, (*spvDescriptorSet0.vp_c8)._m0[11].x, _765);
    float _781 = _643 * _763;
    int _783 = _581 ? 0 : 1;
    float _785 = -_457;
    float _787 = _785 + 1.0;
    float _789 = _475 + (-0.5);
    bool _791 = _749 > 0.0;
    bool _793 = _749 >= 0.0;
    bool _795 = isnan(_749);
    bool _797 = _793 || _795;
    bool _799 = isnan(0.0);
    bool _801 = _797 || _799;
    float _803 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[143].x, _781);
    float _805 = in.m_74.x;
    float _807 = in.m_74.y;
    float _809 = in.m_74.z;
    float _811 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[143].y, _777);
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _815 = _813 != 0;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _819 = _817 != 0;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _823 = _821 != 0;
    float _825 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _827 = _801 ? 0 : 1;
    float _829 = fma(_607, _735, _811);
    bool _831 = !_815;
    int _833 = _831 ? 0 : 1;
    int _835 = ~_827;
    int _837 = _835 + 1;
    int _839 = _837 + 1;
    float _841 = fma(_639, _713, _829);
    int _843 = _839;
    if (!_791)
    {
        int _845 = ~_827;
        int _847 = _845 + 1;
        _843 = _847;
    }
    int _849 = _843;
    bool _851 = !_819;
    int _853 = _851 ? 0 : 1;
    int _855 = abs(_833);
    float _857 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[11].z, _779);
    int _859 = abs(_853);
    float _861 = _521 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _863 = float(_855);
    float _865 = _857 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _867 = float(_859);
    float _869 = fma(_397, (*spvDescriptorSet0.vp_c8)._m0[10].x, _861);
    float _871 = _709 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _873 = 1.0 / _865;
    float _875 = float(_849);
    float _877 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[10].z, _869);
    float _879 = fma(_397, (*spvDescriptorSet0.vp_c15)._m0[126].x, _871);
    float _881 = _867 * _775;
    float _883 = _709 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _885 = _877 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _887 = _863 * _875;
    float _889 = fma(_399, (*spvDescriptorSet0.vp_c15)._m0[126].z, _879);
    bool _891 = !_823;
    int _893 = _891 ? 0 : 1;
    float _895 = _885 + _865;
    float _897 = _429 + (-0.5);
    float _899 = _889 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _901 = abs(_893);
    float _903 = _887 * (-2.0);
    int _905 = ~_783;
    int _907 = _905 + 1;
    int _909 = _907 + 1;
    float _911 = _895 * _873;
    float _913 = _911 * 0.5;
    float _915 = _881 * (-2.0);
    float _917 = float(_901);
    float _919 = fma(_397, (*spvDescriptorSet0.vp_c15)._m0[127].x, _883);
    float _921 = fma(_915, _807, _807);
    float _923 = fma(_557, _915, _557);
    int _925 = _909;
    if (!_563)
    {
        int _927 = ~_783;
        int _929 = _927 + 1;
        _925 = _929;
    }
    int _931 = _925;
    float _933 = fma(_399, (*spvDescriptorSet0.vp_c15)._m0[127].z, _919);
    float _935 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[196].y, _921);
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _939 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[30].w, _937);
    float _941 = fma(_547, _903, _547);
    float _943 = float(_931);
    float _945 = fma(_923, _773, _935);
    float _947 = fma(_903, _805, _805);
    float _949 = _169 + (-0.5);
    float _951 = _933 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _953 = _945 * 0.15915493667125701904296875;
    float _955 = _917 * _943;
    float _957 = in.m_76.x;
    float _959 = in.m_76.y;
    float _961 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[196].x, _947);
    float _963 = fma(_605, _735, _803);
    float _965 = trunc(_899);
    int _967 = int(_965);
    float _969 = _955 * (-2.0);
    float _971 = fma(_941, _773, _961);
    float _973 = fma(_625, _713, _963);
    float _975 = fma(_969, _809, _809);
    float _977 = fma(_555, _969, _555);
    float _979 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[146].x, _973);
    float _981 = trunc(_951);
    int _983 = int(_981);
    float _985 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[146].y, _841);
    float _987 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[196].z, _975);
    float _989 = _971 * 0.15915493667125701904296875;
    float _991 = fma(_977, _773, _987);
    float _993 = 1.0 / _939;
    int _995 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _997 = _967 + _995;
    int _999 = _997 + 1;
    float _1001 = _991 * 0.15915493667125701904296875;
    float _1003 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _1005 = _985 * _959;
    float _1007 = _979 * _957;
    bool _1009 = _999 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1011 = _953 * 6.283185482025146484375;
    float _1013 = sin(_1011);
    float _1015 = _321 * _1005;
    int _1017 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1019 = _983 + _1017;
    int _1021 = _1019 + 1;
    float _1023 = _317 * _1007;
    float _1025 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _325);
    float _1027 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1029 = _999 | _1021;
    float _1031 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1035 = _993 * _1033;
    float _1037 = _953 * 6.283185482025146484375;
    float _1039 = cos(_1037);
    bool _1041 = _1029 < 0;
    bool _1043 = _1041 || _1009;
    float _1045 = _1031 * _1025;
    float _1047 = _1027 * _1003;
    bool _1049 = _1035 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1051 = _1035 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1053 = _989 * 6.283185482025146484375;
    float _1055 = sin(_1053);
    bool _1057 = _1021 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1059 = _1057 || _1043;
    bool _1061 = !_1049;
    int _1063 = _1061 ? 0 : 1;
    float _1065 = _1001 * 6.283185482025146484375;
    float _1067 = cos(_1065);
    int _1069 = 2;
    int _1071 = _999;
    int _1073 = as_type<int>(_977);
    if (!_1049)
    {
        _1069 = 1;
    }
    int _1075 = _1069;
    int _1077 = _1075;
    if (!_1051)
    {
        _1077 = _1063;
    }
    int _1079 = _1077;
    bool _1081 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1083 = isnan(0.5);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1089 = _1085 || _1087;
    if (!_1059)
    {
        int _1091 = _1021 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1093 = _1091 + _999;
        _1071 = _1093;
    }
    int _1095 = _1071;
    int _1097 = _1079 << 6;
    float _1099 = _989 * 6.283185482025146484375;
    float _1101 = cos(_1099);
    float _1103 = _1055 * _1013;
    float _1105 = _1055 * _1039;
    float _1107 = as_type<float>(_1095);
    if (!_1059)
    {
        int _1109 = _1095 << 2;
        _1073 = _1109;
    }
    int _1111 = _1073;
    int _1113 = _1097 + 72;
    uint _1116 = uint(int(uint(_1113) >> uint(2)));
    uint _1118 = uint(int(uint(int(_1116)) >> uint(2)));
    int _1120 = int(_1116) & 3;
    float _1122 = (*spvDescriptorSet0.vp_c15)._m0[int(_1118)][_1120];
    int _1124 = int(_1116) + 1;
    uint _1126 = uint(int(uint(_1124) >> uint(2)));
    int _1128 = _1124 & 3;
    float _1130 = (*spvDescriptorSet0.vp_c15)._m0[int(_1126)][_1128];
    int _1132 = _1111;
    if (!_1059)
    {
        int _1134 = 12 & _1111;
        _1132 = _1134;
    }
    int _1136 = _1132;
    float _1138 = _1001 * 6.283185482025146484375;
    float _1140 = sin(_1138);
    float _1142 = _1055 * _1067;
    float _1144 = _1039 * _1067;
    int _1146 = _1097 + 56;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    uint _1150 = uint(int(uint(int(_1148)) >> uint(2)));
    int _1152 = int(_1148) & 3;
    float _1154 = (*spvDescriptorSet0.vp_c15)._m0[int(_1150)][_1152];
    int _1156 = int(_1148) + 1;
    uint _1158 = uint(int(uint(_1156) >> uint(2)));
    int _1160 = _1156 & 3;
    float _1162 = (*spvDescriptorSet0.vp_c15)._m0[int(_1158)][_1160];
    float _1164 = _1142 * _1047;
    float _1166 = _1101 * _1039;
    float _1168 = _1101 * _1013;
    float _1170 = _1101 * _1067;
    float _1172 = _1013 * _1067;
    float _1174 = 0.0;
    if (!_1059)
    {
        float _1176 = floor(_899);
        _1174 = _1176;
    }
    float _1178 = _1174;
    float _1180 = _1170 * _1047;
    float _1182 = fma(_1140, _1166, _1103);
    float _1184 = -_1168;
    float _1186 = fma(_1140, _1105, _1184);
    float _1188 = -_1105;
    float _1190 = fma(_1140, _1168, _1188);
    float _1192 = fma(_1140, _1103, _1166);
    int _1194 = _1097 + 96;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    uint _1198 = uint(int(uint(int(_1196)) >> uint(2)));
    int _1200 = int(_1196) & 3;
    float _1202 = (*spvDescriptorSet0.vp_c15)._m0[int(_1198)][_1200];
    int _1204 = int(_1196) + 1;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    int _1208 = _1204 & 3;
    float _1210 = (*spvDescriptorSet0.vp_c15)._m0[int(_1206)][_1208];
    float _1212 = fma(_1182, _1045, _1180);
    float _1214 = -_1047;
    float _1216 = _1140 * _1214;
    float _1218 = fma(_1186, _1045, _1164);
    float _1220 = fma(_1190, _825, _1212);
    float _1222 = fma(_1144, _1045, _1216);
    float _1224 = fma(_1192, _825, _1218);
    int _1226 = _1097 + 48;
    uint _1228 = uint(int(uint(_1226) >> uint(2)));
    uint _1230 = uint(int(uint(int(_1228)) >> uint(2)));
    int _1232 = int(_1228) & 3;
    float _1234 = (*spvDescriptorSet0.vp_c15)._m0[int(_1230)][_1232];
    int _1236 = int(_1228) + 1;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    int _1240 = _1236 & 3;
    float _1242 = (*spvDescriptorSet0.vp_c15)._m0[int(_1238)][_1240];
    float _1244 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1246 = fma(_1172, _825, _1222);
    float _1248 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1250 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1252 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1244);
    float _1254 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1248);
    int _1256 = _1097 + 104;
    uint _1258 = uint(int(uint(_1256) >> uint(2)));
    uint _1260 = uint(int(uint(int(_1258)) >> uint(2)));
    int _1262 = int(_1258) & 3;
    float _1264 = (*spvDescriptorSet0.vp_c15)._m0[int(_1260)][_1262];
    int _1266 = int(_1258) + 1;
    uint _1268 = uint(int(uint(_1266) >> uint(2)));
    int _1270 = _1266 & 3;
    float _1272 = (*spvDescriptorSet0.vp_c15)._m0[int(_1268)][_1270];
    int _1274 = as_type<int>(_1244);
    float _1276 = _1250;
    if (!_1059)
    {
        uint _1278 = uint(int(uint(_1095) >> uint(2)));
        _1274 = int(_1278);
    }
    int _1280 = _1274;
    float _1282 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1252);
    float _1284 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1254);
    float _1286 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1250);
    int _1288 = 0;
    if (!_1059)
    {
        int _1290 = _1280 << 4;
        int _1292 = _1290 + _1136;
        _1288 = _1292;
    }
    int _1294 = _1288;
    float _1296 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1298 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1300 = _1097 + 64;
    uint _1302 = uint(int(uint(_1300) >> uint(2)));
    uint _1304 = uint(int(uint(int(_1302)) >> uint(2)));
    int _1306 = int(_1302) & 3;
    float _1308 = (*spvDescriptorSet0.vp_c15)._m0[int(_1304)][_1306];
    int _1310 = int(_1302) + 1;
    uint _1312 = uint(int(uint(_1310) >> uint(2)));
    int _1314 = _1310 & 3;
    float _1316 = (*spvDescriptorSet0.vp_c15)._m0[int(_1312)][_1314];
    if (!_1059)
    {
        float _1318 = floor(_951);
        _1276 = _1318;
    }
    float _1320 = _1276;
    float _1322 = _399 + _1296;
    float _1324 = _397 + _1298;
    float _1326 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1286);
    float _1328 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1330 = _1322 + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1334 = _1324 + _1332;
    int _1336 = _1097 + 80;
    uint _1338 = uint(int(uint(_1336) >> uint(2)));
    uint _1340 = uint(int(uint(int(_1338)) >> uint(2)));
    int _1342 = int(_1338) & 3;
    float _1344 = (*spvDescriptorSet0.vp_c15)._m0[int(_1340)][_1342];
    int _1346 = int(_1338) + 1;
    uint _1348 = uint(int(uint(_1346) >> uint(2)));
    int _1350 = _1346 & 3;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[int(_1348)][_1350];
    float _1354 = _1330 * _1330;
    float _1356 = fma(_1334, _1334, _1354);
    int _1358 = _1097 + 88;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    uint _1362 = uint(int(uint(int(_1360)) >> uint(2)));
    int _1364 = int(_1360) & 3;
    float _1366 = (*spvDescriptorSet0.vp_c15)._m0[int(_1362)][_1364];
    int _1368 = int(_1360) + 1;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    int _1372 = _1368 & 3;
    float _1374 = (*spvDescriptorSet0.vp_c15)._m0[int(_1370)][_1372];
    float _1376 = sqrt(_1356);
    float _1378 = _1284;
    float _1380 = _1322;
    float _1382 = _1356;
    if (!_1059)
    {
        int _1384 = _1294 + 400;
        uint _1386 = uint(int(uint(_1384) >> uint(2)));
        uint _1388 = uint(int(uint(int(_1386)) >> uint(2)));
        int _1390 = int(_1386) & 3;
        float _1392 = (*spvDescriptorSet0.vp_c15)._m0[int(_1388)][_1390];
        _1378 = _1392;
    }
    float _1394 = _1378;
    float _1396 = _709 * _1210;
    float _1398 = fma(_397, _1202, _1396);
    float _1400 = _709 * _1242;
    bool _1402 = _1376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1404 = fma(_397, _1234, _1400);
    float _1406 = fma(_399, _1264, _1398);
    float _1408 = _1406 + _1272;
    float _1410 = _709 * _1316;
    float _1412 = fma(_397, _1308, _1410);
    float _1414 = fma(_399, _1154, _1404);
    float _1416 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1418 = 1.0 / _1408;
    float _1420 = fma(_399, _1122, _1412);
    float _1422 = _1414 + _1162;
    float _1424 = _521 + _1416;
    float _1426 = _1416;
    float _1428 = _1424;
    float _1430 = _1408;
    if (!_1402)
    {
        _1426 = _1324;
    }
    float _1432 = _1426;
    float _1434 = _1420 + _1130;
    bool _1436 = !_1402;
    float _1438 = _1432;
    if (!_1436)
    {
        float _1440 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1444 = _1376 + _1442;
        float _1446 = rsqrt(_1356);
        float _1448 = _1444 * _1440;
        float _1450 = _1424 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1452 = _1448 * 0.15915493667125701904296875;
        float _1454 = _1452 * 6.283185482025146484375;
        float _1456 = cos(_1454);
        float _1458 = _1452 * 6.283185482025146484375;
        float _1460 = sin(_1458);
        float _1462 = _1456 + (-1.0);
        float _1464 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1466 = fma(_1460, _1450, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1468 = fma(_1424, _1456, _1464);
        float _1470 = _1446 * _1466;
        float _1472 = fma(_1334, _1470, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1474 = fma(_1330, _1470, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1438 = _1472;
        _1380 = _1474;
        _1428 = _1468;
        _1382 = _1446;
        _1430 = _1452;
    }
    float _1476 = _1438;
    float _1478 = _1380;
    float _1480 = _1428;
    float _1482 = _1382;
    float _1484 = _1430;
    float _1486 = _1480;
    float _1488 = _1476;
    float _1490 = _1478;
    float _1492 = _1484;
    float _1494 = _1482;
    if (!_1089)
    {
        float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1498 = _521 + _1496;
        float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1502 = _397 + _1500;
        float _1504 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1506 = -_397;
        float _1508 = _1506 + _1476;
        float _1510 = _1498 * _1498;
        float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1514 = _399 + _1512;
        float _1516 = -_399;
        float _1518 = _1516 + _1478;
        float _1520 = fma(_1502, _1502, _1510);
        float _1522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1524 = fma(_1514, _1514, _1520);
        float _1526 = sqrt(_1524);
        float _1528 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1530 = precise::min(_1526, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1532 = _1530 * _1522;
        float _1534 = -_521;
        float _1536 = _1534 + _1480;
        float _1538 = _1528 * _1532;
        float _1540 = fma(_1536, _1538, _521);
        float _1542 = fma(_1508, _1538, _397);
        float _1544 = fma(_1518, _1538, _399);
        _1486 = _1540;
        _1488 = _1542;
        _1490 = _1544;
        _1492 = _1538;
    }
    float _1546 = _1486;
    float _1548 = _1488;
    float _1550 = _1490;
    float _1552 = _1492;
    float _1554 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1556 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1558 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1560 = _1422 * _1418;
    float _1562 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1554);
    float _1564 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1556);
    float _1566 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1558);
    float _1568 = _1552;
    if (!_1059)
    {
        float _1570 = rint(_1394);
        float _1572 = precise::max(_1570, 0.0);
        uint _1574 = uint(_1572);
        uint _1576 = clamp(_1574, 0u, 65535u);
        _1568 = as_type<float>(_1576);
    }
    float _1578 = _1568;
    float _1580 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1562);
    bool _1582 = _1560 >= 0.0;
    float _1584 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1564);
    float _1586 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1588 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1566);
    float _1590 = _1434 * _1418;
    bool _1592 = _1560 <= 1.0;
    bool _1594 = _1592 && _1582;
    float _1596 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1598 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1600 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1586);
    float _1602 = _1588 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1604 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1606 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1608 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1610 = _1590 >= 0.0;
    bool _1612 = _1610 && _1594;
    float _1614 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1600);
    float _1616 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1606);
    float _1618 = -_1608;
    float _1620 = fma(_1618, _1604, 1.0);
    bool _1622 = _1590 <= 1.0;
    bool _1624 = _1622 && _1612;
    float _1626 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1628 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1616);
    float _1630 = _709 * _1352;
    float _1632 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1634 = log2(_1620);
    float _1636 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1628);
    float _1638 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1640 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1632);
    float _1642 = fma(_397, _1344, _1630);
    float _1644 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1638);
    float _1646 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1640);
    float _1648 = 1.0 / _1636;
    float _1650 = _1638;
    float _1652 = _1646;
    if (_1624)
    {
        float _1654 = float(_1079);
        _1494 = _1654;
    }
    float _1656 = _1494;
    float _1658 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1644);
    float _1660 = fma(_399, _1366, _1642);
    if (!_1059)
    {
        float _1662 = -_1320;
        float _1664 = _951 + _1662;
        _1650 = _1664;
    }
    float _1666 = _1650;
    float _1668 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1646);
    float _1670 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1658);
    float _1672 = _1660 + _1374;
    float _1674 = _1632;
    if (_1624)
    {
        float _1676 = rint(_1656);
        float _1678 = precise::max(_1676, 0.0);
        uint _1680 = uint(_1678);
        uint _1682 = clamp(_1680, 0u, 65535u);
        _1674 = as_type<float>(_1682);
    }
    float _1684 = _1674;
    float _1686 = _1634 * 0.693147182464599609375;
    if (!_1059)
    {
        float _1688 = -_1178;
        float _1690 = _899 + _1688;
        _1652 = _1690;
    }
    float _1692 = _1652;
    float _1694 = _1672 * _1418;
    float _1696 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1698 = _1668 * _1648;
    float _1700 = _1670 * _1648;
    float _1702 = fma(_1698, 0.5, 0.5);
    float _1704 = fma(_1700, -0.5, 0.5);
    float _1706 = _1178;
    if (!_1059)
    {
        float3 _5965 = float3(_1692, _1666, float(as_type<int>(_1578)));
        float3 _5969 = select(_5965, float3(0.0), isnan(_5965));
        float _1708 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5969.xy, uint(rint(_5969.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5969.xy, uint(rint(_5969.z)), level(0.0)).x;
        _1706 = _1708;
    }
    float _1710 = _1706;
    float _1712 = _1590;
    if (_1624)
    {
        float3 _5984 = float3(_1560, _1590, float(as_type<int>(_1684)));
        float3 _5986 = select(_5984, float3(0.0), isnan(_5984));
        float _1714 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5986.xy, uint(rint(_5986.z)), _1694, level(0.0));
        _1712 = _1714;
    }
    float _1716 = _1712;
    float3 _5996 = float3(_1702, _1704, _1696);
    float _1718 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5996, float3(0.0), isnan(_5996)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5996, float3(0.0), isnan(_5996)), level(0.0)).x;
    float3 _6005 = float3(_1702, _1704, _1696);
    float4 _1721 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6005, float3(0.0), isnan(_6005)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6005, float3(0.0), isnan(_6005)), level(0.0)).xyzw;
    float _1723 = _1721.x;
    float _1725 = _1721.y;
    float _1727 = _1721.z;
    float _1729 = _1721.w;
    float _1731 = float(uint(_647));
    float _1733 = trunc(_751);
    int _1735 = int(_1733);
    int _1737 = abs(_707);
    float _1739 = 1.0 / _1731;
    int _1741 = ~_647;
    int _1743 = _1741 + 1;
    int _1745 = ~_647;
    int _1747 = _1745 + 1;
    float _1749 = 1.0 / _361;
    float _1751 = float(uint(_1735));
    int _1753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1755 = _1753 != 0;
    int _1757 = as_type<int>(_1739) + (-2);
    float _1759 = as_type<float>(_1757) * _1751;
    float _1761 = trunc(_1759);
    float _1763 = precise::max(_1761, 0.0);
    uint _1765 = uint(_1763);
    int _1767 = _1743 * int(_1765);
    int _1769 = _1767 + _1735;
    float _1771 = float(uint(_1769));
    float _1773 = as_type<float>(_1757) * _1771;
    int _1775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1777 = _1775 != 0;
    float _1779 = float(_1735);
    float _1781 = trunc(_1773);
    float _1783 = precise::max(_1781, 0.0);
    uint _1785 = uint(_1783);
    bool _1787 = !_1777;
    float _1789 = _1787 ? 7.345489978790283203125 : 1.0;
    bool _1791 = _1779 >= _733;
    bool _1793 = isnan(_1779);
    bool _1795 = _1791 || _1793;
    bool _1797 = isnan(_733);
    bool _1799 = _1795 || _1797;
    float _1801 = float(_1799);
    float _1803 = _1789 * _169;
    float _1805 = trunc(_1801);
    int _1807 = int(_1805);
    int _1809 = int(_1765) + int(_1785);
    float _1811 = floor(_1803);
    int _1813 = _1747 * _1809;
    int _1815 = _1813 + _1735;
    bool _1817 = uint(_1815) >= uint(_647);
    int _1819 = ~_1807;
    int _1821 = _1819 + 1;
    int _1823 = _1821 + 1;
    bool _1825 = !_1817;
    int _1827 = _1825 ? 0 : (-1);
    bool _1829 = _647 == 0;
    float _1831 = -_1811;
    float _1833 = _1803 + _1831;
    int _1835 = ~_1809;
    int _1837 = _1835 + _1827;
    int _1839 = _1837 + 1;
    float _1841 = _747 * _1749;
    int _1843 = abs(_761);
    float _1845 = _1833 * _733;
    bool _1847 = !_1755;
    float _1849 = _1847 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1851 = _647 * _1839;
    int _1853 = _1851 + _1735;
    int _1855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1857 = _1855 != 0;
    float _1859 = trunc(_1841);
    int _1861 = int(_1859);
    float _1863 = _1849;
    if (_1059)
    {
        _767 = 1.0;
    }
    float _1865 = _767;
    bool _1867 = !_1829;
    int _1869 = _1867 ? _1853 : (-1);
    int _1871 = _647 + (-1);
    float _1873 = trunc(_1845);
    int _1875 = int(_1873);
    int _1877 = _1869 * _1823;
    int _1879 = abs(_693);
    int _1881 = abs(as_type<int>(_1849));
    int _1883 = _1807 * _1871;
    int _1885 = _1883 + _1877;
    bool _1887 = !_1857;
    int _1889 = _1887 ? 0 : 1;
    int _1891 = _1885 * _1879;
    bool _1893 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1895 = isnan(0.5);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1901 = _1897 || _1899;
    int _1903 = abs(_1889);
    int _1905 = _1861 * _1737;
    int _1907 = _1905 + _1891;
    int _1909 = _1875 * _1881;
    int _1911 = _1909 + _1735;
    int _1913 = _1911 * _1843;
    int _1915 = _1913 + _1907;
    int _1917 = _1875 * _1903;
    int _1919 = _1917 + _1915;
    int _1921 = ~_647;
    int _1923 = _1921 + 1;
    float _1925 = _1865;
    if (_1901)
    {
        _329 = 1.0;
    }
    float _1927 = _329;
    float _1929 = float(uint(_1919));
    float _1931 = _1927;
    if (_1901)
    {
        _1863 = 1.0;
    }
    float _1933 = _1863;
    float _1935 = as_type<float>(_1757) * _1929;
    float _1937 = trunc(_1935);
    float _1939 = precise::max(_1937, 0.0);
    uint _1941 = uint(_1939);
    int _1943 = _1923 * int(_1941);
    int _1945 = _1943 + _1919;
    float _1947 = float(uint(_1945));
    float _1949 = as_type<float>(_1757) * _1947;
    float _1951 = trunc(_1949);
    float _1953 = precise::max(_1951, 0.0);
    uint _1955 = uint(_1953);
    int _1957 = int(_1941) + int(_1955);
    float _1959 = _1933;
    if (!_1901)
    {
        float _1961 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1963 = _1961 * 0.15915493667125701904296875;
        float _1965 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1967 = _1963 * 6.283185482025146484375;
        float _1969 = cos(_1967);
        float _1971 = _1965 * 0.15915493667125701904296875;
        float _1973 = _1963 * 6.283185482025146484375;
        float _1975 = sin(_1973);
        float _1977 = 1.0 / _1969;
        float _1979 = _1971 * 6.283185482025146484375;
        float _1981 = cos(_1979);
        float _1983 = _1975 * _1977;
        float _1985 = _1971 * 6.283185482025146484375;
        float _1987 = sin(_1985);
        float _1989 = _1981 * _1983;
        float _1991 = 1.0 / _1989;
        float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1995 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1993;
        float _1997 = 1.0 / _1995;
        float _1999 = _1987 * _1991;
        float _2001 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2003 = fma(_1035, _1999, _2001);
        float _2005 = _2003 * _1997;
        float _2007 = precise::clamp(_2005, 0.0, 1.0);
        _1959 = _2007;
    }
    float _2009 = _1959;
    if (!_1901)
    {
        float _2011 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2013 = _2011 * 0.15915493667125701904296875;
        float _2015 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2017 = _2013 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        float _2021 = _2015 * 0.15915493667125701904296875;
        float _2023 = _2013 * 6.283185482025146484375;
        float _2025 = sin(_2023);
        float _2027 = 1.0 / _2019;
        float _2029 = _2021 * 6.283185482025146484375;
        float _2031 = cos(_2029);
        float _2033 = _2025 * _2027;
        float _2035 = _2021 * 6.283185482025146484375;
        float _2037 = sin(_2035);
        float _2039 = _2031 * _2033;
        float _2041 = 1.0 / _2039;
        float _2043 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2045 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2043;
        float _2047 = 1.0 / _2045;
        float _2049 = _2037 * _2041;
        float _2051 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2053 = fma(_1035, _2049, _2051);
        float _2055 = _2053 * _2047;
        float _2057 = precise::clamp(_2055, 0.0, 1.0);
        float _2059 = -_2057;
        float _2061 = _2059 + 1.0;
        _1931 = _2061;
    }
    float _2063 = _1931;
    if (!_1059)
    {
        int _2065 = _1095 << 4;
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
        float _2103 = _709 * _2083;
        float _2105 = fma(_397, _2075, _2103);
        float _2107 = fma(_399, _2093, _2105);
        float _2109 = _2107 + _2101;
        float _2111 = precise::clamp(_2109, 0.0, 1.0);
        float _2113 = -_2111;
        float _2115 = _2113 + _1710;
        float _2117 = fma(_2115, 500.0, 1.5);
        float _2119 = exp2(_2117);
        float _2121 = 0.0 + _2119;
        float _2123 = precise::clamp(_2121, 0.0, 1.0);
        _769 = _2103;
        _1107 = as_type<float>(_2067);
        _1925 = _2123;
    }
    float _2125 = _769;
    float _2127 = _1107;
    float _2129 = _1925;
    float _2131 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2133 = _1546 + _2131;
    float _2135 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2137 = _1548 + _2135;
    float _2139 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2141 = _1550 + _2139;
    float _2143 = _2133 * _2133;
    float _2145 = fma(_2137, _2137, _2143);
    float _2147 = fma(_2141, _2141, _2145);
    float _2149 = rsqrt(_2147);
    float _2151 = sqrt(_2147);
    float _2153 = _2149 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2155 = _2137 * _2153;
    float _2157 = _2141 * _2153;
    float _2159 = _2155 * _2155;
    float _2161 = _2157 * _2157;
    float _2163 = _2159 + _2161;
    float _2165 = sqrt(_2163);
    bool _2167 = _2165 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2171 = _2165 + _2169;
    float _2173 = _2125;
    float _2175 = _2163;
    float _2177 = _2171;
    float _2179 = _2127;
    float _2181 = _2155;
    float _2183 = _2157;
    float _2185 = _2159;
    float _2187 = _2161;
    if (_2167)
    {
        float _2189 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2173 = _2189;
    }
    float _2191 = _2173;
    if (_2167)
    {
        float _2193 = rsqrt(_2163);
        _2175 = _2193;
    }
    float _2195 = _2175;
    if (_2167)
    {
        float _2197 = _2171 * _2191;
        _2177 = _2197;
    }
    float _2199 = _2177;
    if (_2167)
    {
        float _2201 = _2199 * 0.15915493667125701904296875;
        _2179 = _2201;
    }
    float _2203 = _2179;
    float _2205 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2207 = _399;
    if (_2167)
    {
        float _2209 = _2203 * 6.283185482025146484375;
        float _2211 = sin(_2209);
        _2207 = _2211;
    }
    float _2213 = _2207;
    float _2215 = precise::max(0.0, _2205);
    float _2217 = _2199;
    float _2219 = _2215;
    if (_2167)
    {
        float _2221 = _2203 * 6.283185482025146484375;
        float _2223 = cos(_2221);
        _2217 = _2223;
    }
    float _2225 = _2217;
    float _2227 = -_2153;
    float _2229 = -_2215;
    float _2231 = fma(_2133, _2227, _2229);
    float _2233 = _2231;
    if (_2167)
    {
        float _2235 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2219 = _2235;
    }
    float _2237 = _2219;
    float _2239 = _2213;
    float _2241 = _2237;
    if (_2167)
    {
        float _2243 = fma(_2213, _2237, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2239 = _2243;
    }
    float _2245 = _2239;
    float _2247 = _2245;
    if (_2167)
    {
        float _2249 = _2195 * _2245;
        _2247 = _2249;
    }
    float _2251 = _2247;
    if (_2167)
    {
        float _2253 = _2225 + (-1.0);
        _2241 = _2253;
    }
    float _2255 = _2241;
    float _2257 = _2255;
    if (_2167)
    {
        float _2259 = _2155 * _2251;
        _2181 = _2259;
    }
    float _2261 = _2181;
    if (_2167)
    {
        float _2263 = _2157 * _2251;
        _2183 = _2263;
    }
    float _2265 = _2183;
    if (_2167)
    {
        float _2267 = _2255 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2257 = _2267;
    }
    float _2269 = _2257;
    if (_2167)
    {
        float _2271 = _2261 * _2261;
        _2185 = _2271;
    }
    float _2273 = _2185;
    if (_2167)
    {
        float _2275 = _2265 * _2265;
        _2187 = _2275;
    }
    float _2277 = _2187;
    if (_2167)
    {
        float _2279 = fma(_2231, _2225, _2269);
        _2233 = _2279;
    }
    float _2281 = _2233;
    int _2283 = ~_647;
    int _2285 = _2283 + 1;
    float _2287 = fma(_2281, _2281, _2273);
    float _2289 = _2287 + _2277;
    float _2291 = rsqrt(_2289);
    float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2295 = fma(_2151, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2293);
    float _2297 = precise::clamp(_2295, 0.0, 1.0);
    float _2299 = -_2297;
    float _2301 = _2299 + 1.0;
    float _2303 = abs(_2301);
    float _2305 = log2(_2303);
    float _2307 = _2291 * _2261;
    float _2309 = _2291 * _2281;
    float _2311 = _2291 * _2265;
    float _2313 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2315 = _2309 + 1.0;
    float _2317 = -_2313;
    float _2319 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2317);
    float _2321 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2323 = -_2311;
    float _2325 = fma(_2323, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2319);
    float _2327 = exp2(_2321);
    float _2329 = fma(_2325, -0.5, 0.5);
    float _2331 = fma(_2325, 0.5, 0.5);
    float _2333 = fma(_2331, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2335 = sqrt(_2329);
    float _2337 = fma(_2331, _2333, -0.212114393711090087890625);
    float _2339 = fma(_2331, _2337, 1.570728778839111328125);
    float _2341 = -_2309;
    float _2343 = fma(_2327, _2315, _2341);
    float _2345 = fma(_2343, 0.5, 0.5);
    int _2347 = _2285 * _1957;
    int _2349 = _2347 + _1919;
    float _2351 = _2335 * 0.636619746685028076171875;
    float _2353 = -_2339;
    float _2355 = fma(_2351, _2353, 1.0);
    float2 _6901 = float2(_2355, _2345);
    float3 _2359 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6901, float2(0.0), isnan(_6901)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6901, float2(0.0), isnan(_6901)), level(0.0)).xyz;
    float _2361 = _2359.x;
    float _2363 = _2359.y;
    float _2365 = _2359.z;
    bool _2367 = uint(_2349) >= uint(_647);
    float _2369 = -_753;
    float _2371 = _2369 + 1.0;
    float _2373 = float(uint(_1911));
    float _2375 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2377 = !_2367;
    int _2379 = _2377 ? 0 : (-1);
    float _2381 = -_417;
    float _2383 = _2381 + 1.0;
    int _2385 = ~_647;
    int _2387 = _2385 + 1;
    float _2389 = as_type<float>(_1757) * _2373;
    int _2391 = ~_1957;
    int _2393 = _2391 + _2379;
    int _2395 = _2393 + 1;
    float _2397 = exp2(_2375);
    int _2399 = ~_647;
    int _2401 = _2399 + 1;
    float _2403 = -_757;
    float _2405 = _2403 + 1.0;
    int _2407 = _647 * _2395;
    int _2409 = _2407 + _1919;
    float _2411 = trunc(_2389);
    float _2413 = precise::max(_2411, 0.0);
    uint _2415 = uint(_2413);
    bool _2417 = !_1829;
    int _2419 = _2417 ? _2409 : (-1);
    int _2421 = _2419 >> 31;
    int _2423 = _2419 & 3;
    bool _2425 = _2423 != 0;
    int _2427 = _2421 & 3;
    bool _2429 = uint(_2423) > 1u;
    int _2431 = _2419 + _2427;
    int _2433 = _2419 & 3;
    bool _2435 = _2433 != 0;
    int _2437 = _2387 * int(_2415);
    int _2439 = _2437 + _1911;
    int _2441 = _2431 >> 2;
    bool _2443 = _2423 != 3;
    float _2445 = float(uint(_2439));
    int _2447 = _2441 << 4;
    int _2449 = _2447 + 368;
    float _2451 = as_type<float>(_1757) * _2445;
    int _2453 = _2449 + 8;
    uint _2455 = uint(int(uint(_2453) >> uint(2)));
    uint _2457 = uint(int(uint(int(_2455)) >> uint(2)));
    int _2459 = int(_2455) & 3;
    float _2461 = (*spvDescriptorSet0.vp_c9)._m0[int(_2457)][_2459];
    int _2463 = int(_2455) + 1;
    uint _2465 = uint(int(uint(_2463) >> uint(2)));
    int _2467 = _2463 & 3;
    float _2469 = (*spvDescriptorSet0.vp_c9)._m0[int(_2465)][_2467];
    float _2471 = trunc(_2451);
    float _2473 = precise::max(_2471, 0.0);
    uint _2475 = uint(_2473);
    uint _2477 = uint(int(uint(_2449) >> uint(2)));
    uint _2479 = uint(int(uint(int(_2477)) >> uint(2)));
    int _2481 = int(_2477) & 3;
    float _2483 = (*spvDescriptorSet0.vp_c9)._m0[int(_2479)][_2481];
    int _2485 = int(_2477) + 1;
    uint _2487 = uint(int(uint(_2485) >> uint(2)));
    int _2489 = _2485 & 3;
    float _2491 = (*spvDescriptorSet0.vp_c9)._m0[int(_2487)][_2489];
    int _2493 = int(_2415) + int(_2475);
    int _2495 = _2435 ? 0 : 1;
    bool _2497 = uint(_2423) >= 2u;
    int _2499 = _2401 * _2493;
    int _2501 = _2499 + _1911;
    int _2503 = _2497 ? 0 : 1;
    bool _2505 = uint(_2501) >= uint(_647);
    int _2507 = ~_2495;
    int _2509 = _2507 + 1;
    int _2511 = _2509 + 1;
    int _2513 = _2511;
    if (!_2429)
    {
        int _2515 = ~_2495;
        int _2517 = _2515 + 1;
        _2513 = _2517;
    }
    int _2519 = _2513;
    bool _2521 = !_2425;
    int _2523 = _2521 ? 0 : 1;
    int _2525 = abs(_2519);
    int _2527 = ~_2503;
    int _2529 = _2527 + 1;
    int _2531 = _2529 + 1;
    int _2533 = _2531;
    if (_2443)
    {
        int _2535 = ~_2503;
        int _2537 = _2535 + 1;
        _2533 = _2537;
    }
    int _2539 = _2533;
    int _2541 = abs(_2523);
    float _2543 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2545 = int(_2543);
    bool _2547 = _2423 != 3;
    int _2549 = ~_2525;
    int _2551 = _2549 + 1;
    int _2553 = _2551 + 1;
    int _2555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2557 = _2555 != 0;
    bool _2559 = !_2547;
    int _2561 = _2559 ? 0 : (-1);
    int _2563 = _2553 * as_type<int>(_2491);
    int _2565 = ~_2541;
    int _2567 = _2565 + 1;
    int _2569 = _2567 + 1;
    int _2571 = abs(_2539);
    bool _2573 = !_2557;
    int _2575 = _2573 ? 0 : 1;
    int _2577 = _2569 * as_type<int>(_2483);
    int _2579 = _2577 + _2563;
    int _2581 = abs(_2561);
    bool _2583 = !_2505;
    int _2585 = _2583 ? 0 : (-1);
    int _2587 = ~_2571;
    int _2589 = _2587 + 1;
    int _2591 = _2589 + 1;
    int _2593 = abs(_2575);
    int _2595 = _2591 * as_type<int>(_2461);
    int _2597 = _2595 + _2579;
    int _2599 = ~_2493;
    int _2601 = _2599 + _2585;
    int _2603 = _2601 + 1;
    int _2605 = ~_2581;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    int _2611 = _647 * _2603;
    int _2613 = _2611 + _1911;
    int _2615 = ~_2593;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    float _2621 = float(uint(_2545));
    int _2623 = _2609 * as_type<int>(_2469);
    int _2625 = _2623 + _2597;
    bool _2627 = !_1829;
    int _2629 = _2627 ? _2613 : (-1);
    float _2631 = abs(_1035);
    float _2633 = log2(_2631);
    int _2635 = abs(_2545);
    int _2637 = _2625 * _2619;
    bool _2639 = _169 > 0.5;
    int _2641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2643 = _2641 != 0;
    int _2645 = _2629 * _2593;
    int _2647 = _2645 + _2637;
    float _2649 = float(uint(_2635));
    float _2651 = 1.0 / _2621;
    int _2653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2655 = _2653 != 0;
    float _2657 = float(uint(_2647));
    int _2659 = abs(_2647);
    bool _2661 = _429 > 0.5;
    float _2663 = 1.0 / _2649;
    float _2665 = float(uint(_2659));
    int _2667 = as_type<int>(_2651) + (-2);
    int _2669 = ~_2545;
    int _2671 = _2669 + 1;
    float _2673 = as_type<float>(_2667) * _2657;
    float _2675 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2677 = as_type<int>(_2663) + (-2);
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2681 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2683 = trunc(_2673);
    float _2685 = precise::max(_2683, 0.0);
    uint _2687 = uint(_2685);
    float _2689 = as_type<float>(_2677) * _2665;
    int _2691 = ~_2635;
    int _2693 = _2691 + 1;
    float _2695 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2697 = _2675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2699 = _2679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2701 = _2695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2703 = trunc(_2689);
    float _2705 = precise::max(_2703, 0.0);
    uint _2707 = uint(_2705);
    float _2709 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_78.x = _2697;
    out.m_78.y = _2699;
    out.m_78.z = _2701;
    out.m_78.w = _2681;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2713 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2715 = _1035 <= 8000.0;
    bool _2717 = isnan(_1035);
    bool _2719 = _2715 || _2717;
    bool _2721 = isnan(8000.0);
    bool _2723 = _2719 || _2721;
    float _2725 = float(_2723);
    int _2727 = _2671 * int(_2687);
    int _2729 = _2727 + _2647;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2733 = _2633 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2735 = _2713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2737 = _2711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2739 = float(uint(_2729));
    float _2741 = _2731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2743 = _2693 * int(_2707);
    int _2745 = _2743 + _2659;
    float _2747 = exp2(_2733);
    float _2749 = as_type<float>(_2667) * _2739;
    float _2751 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2753 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2755 = float(uint(_2745));
    out.m_80.x = _2737;
    out.m_80.y = _2735;
    out.m_80.z = _2741;
    float _2757 = -_1140;
    float _2759 = fma(_2757, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2751);
    float _2761 = -_1140;
    float _2763 = fma(_2761, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2753);
    float _2765 = trunc(_2749);
    float _2767 = precise::max(_2765, 0.0);
    uint _2769 = uint(_2767);
    float _2771 = as_type<float>(_2677) * _2755;
    float _2773 = -_1140;
    float _2775 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2709);
    float _2777 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2759);
    float _2779 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2763);
    float _2781 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2783 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2775);
    int _2785 = ~_2545;
    int _2787 = _2785 + 1;
    float _2789 = trunc(_2771);
    float _2791 = precise::max(_2789, 0.0);
    uint _2793 = uint(_2791);
    float _2795 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2797 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2799 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2781);
    float _2801 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2803 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2795);
    float _2805 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2797);
    float _2807 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2809 = int(_2687) + int(_2769);
    float _2811 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2813 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2801);
    float _2815 = -_221;
    int _2817 = _2661 ? as_type<int>(_2815) : as_type<int>(_221);
    float _2819 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2811);
    float _2821 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2807);
    int _2823 = ~_2635;
    int _2825 = _2823 + 1;
    int _2827 = _2787 * _2809;
    int _2829 = _2827 + _2647;
    int _2831 = int(_2707) + int(_2793);
    float _2833 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2799);
    bool _2835 = !_2655;
    float _2837 = _2835 ? _221 : as_type<float>(_2817);
    float _2839 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2841 = uint(_2829) >= uint(_2545);
    int _2843 = _2825 * _2831;
    int _2845 = _2843 + _2659;
    float _2847 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2803);
    float _2849 = _2839 * _2777;
    float _2851 = _2839 * _2783;
    float _2853 = _2839 * _2779;
    bool _2855 = !_2841;
    int _2857 = _2855 ? 0 : (-1);
    float _2859 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2805);
    bool _2861 = uint(_2845) >= uint(_2635);
    float _2863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2865 = _2647 ^ _2545;
    float _2867 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2819);
    int _2869 = ~_2809;
    int _2871 = _2869 + _2857;
    int _2873 = _2871 + 1;
    float _2875 = fma(_2747, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2877 = precise::clamp(_2875, 0.0, 1.0);
    bool _2879 = !_2861;
    int _2881 = _2879 ? 0 : (-1);
    uint _2883 = uint(int(uint(_2865) >> uint(31)));
    int _2885 = _2545 * _2873;
    int _2887 = _2885 + _2647;
    bool _2889 = _2545 == 0;
    float _2891 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2813);
    bool _2893 = _2545 == 0;
    float _2895 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2821);
    int _2897 = ~_2881;
    int _2899 = _2831 + _2897;
    int _2901 = _2899 + 1;
    float _2903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2905 = ~int(_2883);
    int _2907 = _2905 + 1;
    float _2909 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2911 = -_325;
    int _2913 = _2639 ? as_type<int>(_2911) : as_type<int>(_325);
    int _2915 = _2901 ^ _2907;
    float _2917 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2909);
    bool _2919 = !_2889;
    int _2921 = _2919 ? _2887 : (-1);
    int _2923 = ~_2907;
    int _2925 = _2923 + _2915;
    int _2927 = _2925 + 1;
    float _2929 = _325 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2931 = !_2643;
    float _2933 = _2931 ? _325 : as_type<float>(_2913);
    float _2935 = _2863 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2937 = !_2893;
    int _2939 = _2937 ? _2927 : (-1);
    float _2941 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2917);
    float _2943 = float(_2921);
    float _2945 = fma(_2929, _2833, _2851);
    float _2947 = float(_2939);
    float _2949 = _2903 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2951 = fma(_2929, _2847, _2849);
    float _2953 = fma(_2935, _2943, _745);
    float _2955 = _2837 + (-0.5);
    float _2957 = -_755;
    float _2959 = fma(_2949, _2947, _2957);
    float _2961 = _2933 + 0.5;
    float _2963 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2941);
    float _2965 = -_2949;
    float _2967 = fma(_2965, _2955, _2959);
    float _2969 = fma(_2935, _2961, _2953);
    float _2971 = _2963 + _1636;
    float _2973 = fma(_2837, _2405, _2967);
    float _2975 = -_2371;
    float _2977 = fma(_2933, _2975, _2969);
    float _2979 = fma(_2929, _2859, _2853);
    float _2981 = fma(_2877, -2.0, 3.0);
    float _2983 = _2877 * _2877;
    float _2985 = -_2397;
    float _2987 = _2985 + 1.0;
    float _2989 = _2895 + _2979;
    float _2991 = _2983 * _2981;
    float _2993 = _2987 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2995 = _2971 * 0.5;
    float _2997 = -_2991;
    float _2999 = _2997 + 1.0;
    float _3001 = _2993 * _1718;
    float _3003 = _2891 + _2951;
    float _3005 = _2867 + _2945;
    float _3007 = fma(_2999, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2991);
    float _3009 = _2999;
    float _3011 = _2837;
    float _3013 = _2993;
    if (!_1624)
    {
        _3009 = 1.0;
    }
    float _3015 = _3009;
    float _3017 = _2365 * _3001;
    float _3019 = _3015;
    if (_1624)
    {
        bool _3021 = _1716 >= _1694;
        bool _3023 = isnan(_1716);
        bool _3025 = _3021 || _3023;
        bool _3027 = isnan(_1694);
        bool _3029 = _3025 || _3027;
        float _3031 = float(_3029);
        _3019 = _3031;
    }
    float _3033 = _3019;
    float _3035 = _2725 * _3007;
    out.gl_Position.x = _1668;
    out.gl_Position.y = _1670;
    out.gl_Position.z = _2963;
    out.gl_Position.w = _1636;
    float _3037 = fma(_1729, _3017, _1727);
    bool _3039 = _2151 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3041 = isnan(_2151);
    bool _3043 = _3039 || _3041;
    bool _3045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3047 = _3043 || _3045;
    float _3049 = _3035 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3051 = _3033 * _2129;
    out.m_82.z = _2995;
    out.m_82.w = _1636;
    float _3053 = _2383 * _3049;
    float _3055 = precise::clamp(_3053, 0.0, 1.0);
    float _3057 = -_2993;
    float _3059 = _3057 + 1.0;
    out.m_84.x = _2977;
    out.m_84.y = _2973;
    float _3061 = -_3055;
    float _3063 = fma(_3061, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3065 = _1729 * _3001;
    float _3067 = _1729 * _3059;
    out.m_86.x = _3003;
    out.m_86.y = _3005;
    out.m_86.z = _2989;
    float _3069 = -_3051;
    float _3071 = fma(_3069, _3063, 1.0);
    float _3073 = precise::clamp(_3071, 0.0, 1.0);
    float _3075 = fma(_2361, _3065, _1723);
    float _3077 = fma(_2363, _3065, _1725);
    float _3079 = _2009 * _2063;
    float _3081 = _3073 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3083 = _3059;
    float _3085 = _3051;
    float _3087 = _3073;
    float _3089 = _3079;
    if (!_3047)
    {
        _3011 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3091 = _3011;
    out.m_88.x = _3075;
    out.m_88.y = _3077;
    out.m_88.z = _3037;
    out.m_88.w = _3067;
    float _3093 = _3079 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3095 = _3091;
    float _3097 = _3091;
    if (!_3047)
    {
        _3013 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3099 = _3013;
    out.m_90.x = _3081;
    float _3101 = _3099;
    float _3103 = _3099;
    if (!_3047)
    {
        _3083 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3105 = _3083;
    float _3107 = _3105;
    float _3109 = _3105;
    if (!_3047)
    {
        _3085 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3111 = _3085;
    float _3113 = _3111;
    float _3115 = _3111;
    if (!_3047)
    {
        _3087 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3117 = _3087;
    float _3119 = _3117;
    float _3121 = _3117;
    if (!_3047)
    {
        _3089 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3123 = _3089;
    bool _3125 = !_3047;
    float _3127 = _3123;
    float _3129 = _3123;
    if (!_3125)
    {
        bool _3131 = _2151 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3133 = isnan(_2151);
        bool _3135 = _3131 || _3133;
        bool _3137 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3139 = _3135 || _3137;
        if (!_3139)
        {
            float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3143 = _2151 + _3141;
            float _3145 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3147 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3145;
            float _3149 = 1.0 / _3147;
            float _3151 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3167 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3171 = _3143 * _3149;
            float _3173 = precise::clamp(_3171, 0.0, 1.0);
            float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3179 = fma(_3173, _3153, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3181 = fma(_3173, _3177, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3183 = fma(_3173, _3157, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3185 = fma(_3173, _3161, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3187 = fma(_3173, _3165, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3189 = fma(_3173, _3169, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3103 = _3181;
            _3121 = _3187;
            _3097 = _3179;
            _3115 = _3185;
            _3109 = _3183;
            _3129 = _3189;
            _3191 = true;
        }
        else
        {
            bool _3193 = _2151 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3195 = isnan(_2151);
            bool _3197 = _3193 || _3195;
            bool _3199 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3201 = _3197 || _3199;
            if (!_3201)
            {
                _3095 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3203 = _3095;
            _3097 = _3203;
            if (!_3201)
            {
                _3101 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3205 = _3101;
            _3103 = _3205;
            if (!_3201)
            {
                _3107 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3207 = _3107;
            _3109 = _3207;
            if (!_3201)
            {
                _3113 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3209 = _3113;
            _3115 = _3209;
            if (!_3201)
            {
                _3119 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3211 = _3119;
            _3121 = _3211;
            if (!_3201)
            {
                _3127 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3213 = _3127;
            bool _3215 = !_3201;
            _3129 = _3213;
            if (!_3215)
            {
                bool _3217 = _2151 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3219 = isnan(_2151);
                bool _3221 = _3217 || _3219;
                bool _3223 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3225 = _3221 || _3223;
                if (!_3225)
                {
                    float _3227 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3229 = _2151 + _3227;
                    float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3233 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3231;
                    float _3235 = 1.0 / _3233;
                    float _3237 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3239 = _3237 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3241 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3243 = _3241 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3245 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3257 = _3229 * _3235;
                    float _3259 = precise::clamp(_3257, 0.0, 1.0);
                    float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3263 = _3261 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3265 = fma(_3259, _3239, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3267 = fma(_3259, _3263, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3269 = fma(_3259, _3243, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3271 = fma(_3259, _3247, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3273 = fma(_3259, _3251, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3275 = fma(_3259, _3255, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3103 = _3267;
                    _3121 = _3273;
                    _3097 = _3265;
                    _3115 = _3271;
                    _3109 = _3269;
                    _3129 = _3275;
                    _3191 = true;
                }
                else
                {
                    _3103 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3121 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3097 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3115 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3109 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3129 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3191 = false;
    float _3277 = _3103;
    float _3279 = _3121;
    float _3281 = _3097;
    float _3283 = _3115;
    float _3285 = _3109;
    float _3287 = _3129;
    float _3289 = _3093 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3291 = fma(_3005, -0.5, 0.5);
    float _3293 = precise::clamp(_3291, 0.0, 1.0);
    float _3295 = -_3277;
    float _3297 = _3295 + _3279;
    float _3299 = -_3281;
    float _3301 = _3299 + _3283;
    out.m_59.x = _3289;
    float _3303 = -_3285;
    float _3305 = _3303 + _3287;
    float _3307 = fma(_3293, _3297, _3277);
    float _3309 = fma(_3293, _3301, _3281);
    bool _3311 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3313 = _3307 * 0.586610972881317138671875;
    float _3315 = fma(_3293, _3305, _3285);
    out.m_92.x = 0.0;
    bool _3317 = _2009 > 0.0;
    bool _3319 = isnan(_2009);
    bool _3321 = _3317 || _3319;
    bool _3323 = isnan(0.0);
    bool _3325 = _3321 || _3323;
    float _3327 = fma(_3309, 0.298911988735198974609375, _3313);
    bool _3329 = _2063 <= 0.0;
    bool _3331 = !_3325;
    bool _3333 = _3329 || _3331;
    float _3335 = fma(_3315, 0.114477999508380889892578125, _3327);
    float _3337 = -_3335;
    float _3339 = _3309 + _3337;
    float _3341 = -_3335;
    float _3343 = _3307 + _3341;
    float _3345 = -_3335;
    float _3347 = _3315 + _3345;
    float _3349 = fma(_3339, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3335);
    float _3351 = fma(_3343, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3335);
    float _3353 = fma(_3347, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3335);
    bool _3355 = !_3311;
    if (!_3355)
    {
        float _3357 = -_1546;
        float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3361 = -_1548;
        float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3365 = -_1550;
        float _3367 = _3365 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3369 = _3359 * _3359;
        float _3371 = fma(_3363, _3363, _3369);
        float _3373 = fma(_3367, _3367, _3371);
        float _3375 = sqrt(_3373);
        float _3377 = rsqrt(_3373);
        float _3379 = -_3375;
        float _3381 = _3379 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3383 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3385 = precise::clamp(_3383, 0.0, 1.0);
        float _3387 = _3363 * _3377;
        float _3389 = _3359 * _3377;
        float _3391 = abs(_3385);
        float _3393 = log2(_3391);
        float _3395 = _3367 * _3377;
        float _3397 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3399 = _3005 * _3389;
        float _3401 = -_3389;
        float _3403 = -_3397;
        float _3405 = fma(_3401, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3403);
        float _3407 = fma(_3003, _3387, _3399);
        float _3409 = -_3395;
        float _3411 = fma(_3409, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3405);
        float _3413 = fma(_2989, _3395, _3407);
        float _3415 = precise::clamp(_3413, 0.0, 1.0);
        float _3417 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3419 = _3411 + _3417;
        float _3421 = _3393 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3423 = _3419 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3425 = precise::clamp(_3423, 0.0, 1.0);
        float _3427 = exp2(_3421);
        float _3429 = _3427 * _3425;
        float _3431 = _3415 * _3429;
        float _3433 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3435 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3437 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _3433;
        out.m_92.y = _3435;
        out.m_92.z = _3437;
    }
    out.m_94.x = _3349;
    out.m_94.y = _3351;
    out.m_94.z = _3353;
    if (!_3333)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _3439 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3439;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

