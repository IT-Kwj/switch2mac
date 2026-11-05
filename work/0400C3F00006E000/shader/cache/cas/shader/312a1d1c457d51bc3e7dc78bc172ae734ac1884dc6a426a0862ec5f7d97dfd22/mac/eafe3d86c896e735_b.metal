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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
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
    float4 m_78 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_92 [[user(locn7)]];
    float4 m_88 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(1)]];
    float4 m_70 [[attribute(2)]];
    float4 m_72 [[attribute(3)]];
    float4 m_80 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_66 [[attribute(7)]];
    float4 m_82 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2651 = false;
    bool _311 = false;
    bool _209 = false;
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
        float _2956 = as_type<float>(_129);
        out.gl_Position.z = _2956;
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
        float _3025 = as_type<float>(_167);
        out.gl_Position.z = _3025;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _173 = as_type<int>(_169) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_169) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _207;
    if (!_189)
    {
        float _191 = in.m_66.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_113);
        float _213 = 1.0 / _211;
        float _215 = _147 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _217 + _219;
    bool _223 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _225 = isnan(_217);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    float _239 = -_233;
    float _241 = _239 + 1.0;
    bool _243 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _245 = isnan(_217);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _255;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _261 = 1.0 / _237;
    float _263 = _253 * _241;
    float _265 = -_253;
    float _267 = _265 + 1.0;
    float _269 = _221 * _261;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _271;
    float _275 = fma(_257, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _277 = fma(_273, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _279 = _275 * _263;
    float _281 = _277 * _263;
    float _283 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].x, _279);
    float _285 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].y, _281);
    float _287 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[144].x, _283);
    float _289 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[144].y, _285);
    bool _291 = !_259;
    float _309;
    if (!_291)
    {
        float _293 = in.m_66.x;
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _297 = _293 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _301 = _299 * _295;
        float _303 = floor(_301);
        float _305 = -_303;
        float _307 = _301 + _305;
        _309 = _307;
        _311 = true;
    }
    else
    {
        float _313 = float(_113);
        float _315 = 1.0 / _313;
        float _317 = _147 * _315;
        _309 = _317;
    }
    _311 = false;
    float _319 = _309;
    float _321 = in.m_56.x;
    float _323 = in.m_56.y;
    float _325 = in.m_56.z;
    float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _329 = in.m_68.x;
    float _331 = in.m_68.y;
    float _333 = in.m_68.z;
    float _335 = in.m_68.w;
    int _337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _339 = _337 != 0;
    float _341 = in.m_66.x;
    float _343 = in.m_66.y;
    float _345 = in.m_66.z;
    float _347 = in.m_66.w;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _351 = _349 != 0;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _355 = _353 != 0;
    float _357 = in.m_70.x;
    float _359 = in.m_70.y;
    float _361 = in.m_70.z;
    float _363 = in.m_70.w;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _367 = _365 != 0;
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _371 = _369 != 0;
    float _373 = in.m_72.x;
    float _375 = in.m_72.y;
    float _377 = in.m_72.z;
    float _379 = in.m_72.w;
    float _381 = _323 * _331;
    bool _383 = _347 > 0.5;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _389 = fma(_321, _329, _381);
    float _391 = _323 * _359;
    float _393 = 1.0 / _387;
    float _395 = fma(_325, _333, _389);
    float _397 = fma(_321, _357, _391);
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _401 = _343 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _403 = _323 * _375;
    float _405 = _341 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _407;
    bool _411 = _341 > 0.5;
    float _413 = fma(_401, -2.0, _399);
    float _415 = fma(_321, _373, _403);
    float _417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _419 = fma(_325, _361, _397);
    float _421 = -_183;
    int _423 = _411 ? as_type<int>(_421) : as_type<int>(_183);
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _427 = _343 > 0.5;
    float _429 = fma(_325, _377, _415);
    float _431 = -_425;
    float _433 = fma(_405, 2.0, _431);
    float _435 = -_187;
    int _437 = _427 ? as_type<int>(_435) : as_type<int>(_187);
    float _439 = _409 * _393;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _443 = _319 + _441;
    float _445 = _409;
    if (!_339)
    {
        _445 = _345;
    }
    float _447 = _445;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _451 = _447;
    if (_339)
    {
        _451 = _343;
    }
    float _453 = _451;
    float _455 = fma(_439, _443, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _457 = !_355;
    float _459 = _457 ? _187 : as_type<float>(_437);
    float _461 = _395 + _335;
    bool _463 = !_351;
    float _465 = _463 ? _183 : as_type<float>(_423);
    float _467 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[83].w, _449);
    float _469 = _417 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _471 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _413);
    float _473 = _459 + (-0.5);
    bool _475 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _477 = isnan(_319);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = _327 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _489 = -_147;
    float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[76].x, _433);
    float _493 = _465 + 0.5;
    float _495 = _419 + _363;
    float _497 = -_469;
    float _499 = -_471;
    float _501 = fma(_497, _473, _499);
    bool _503 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _505 = isnan(_319);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = _429 + _379;
    float _517 = -_485;
    float _519 = _517 + 1.0;
    float _521 = fma(_487, _493, _491);
    float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _525 = _487;
    if (!_339)
    {
        _525 = _343;
    }
    float _527 = _525;
    float _529 = _513 * _519;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _533 = _527;
    if (_339)
    {
        _533 = _341;
    }
    float _535 = _533;
    float _537 = _455 * _529;
    bool _539 = _345 > 0.5;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _545 = _535 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _547 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[83].z, _531);
    float _549 = -_183;
    int _551 = _539 ? as_type<int>(_549) : as_type<int>(_183);
    float _553 = -_513;
    float _555 = _553 + 1.0;
    float _557 = _535;
    if (!_339)
    {
        _557 = _345;
    }
    float _559 = _557;
    float _561 = -_541;
    float _563 = fma(_545, 2.0, _561);
    float _565 = _559;
    if (_339)
    {
        _565 = _343;
    }
    float _567 = _565;
    float _569 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[115].x, _537);
    float _571 = -_147;
    float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[81].x, _563);
    bool _575 = !_367;
    float _577 = _575 ? _183 : as_type<float>(_551);
    float _579 = _567 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _581 = _523 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _587 = _461 + _585;
    float _589 = _577 + 0.5;
    float _591 = fma(_579, -2.0, _583);
    float _593 = -_187;
    int _595 = _383 ? as_type<int>(_593) : as_type<int>(_187);
    float _597 = fma(_581, _589, _573);
    float _599 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _601 = _495 + _599;
    float _603 = _543 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _605 = !_371;
    float _607 = _605 ? _187 : as_type<float>(_595);
    float _609 = _601 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _613 = _515 + _611;
    float _615 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _591);
    float _617 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _547);
    float _619 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[28].x, _609);
    float _621 = _607 + (-0.5);
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _627 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[28].z, _619);
    float _629 = -_603;
    float _631 = -_615;
    float _633 = fma(_629, _621, _631);
    float _635 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[78].z, _623);
    float _637 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[78].w, _625);
    float _639 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _467);
    float _641 = -_617;
    float _643 = _641 + 1.0;
    float _645 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _635);
    float _647 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _637);
    float _649 = -_639;
    float _651 = _649 + 1.0;
    bool _653 = _627 >= 0.0;
    float _655 = -_645;
    float _657 = _655 + 1.0;
    float _659 = -_647;
    float _661 = _659 + 1.0;
    float _663 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[116].x, _569);
    float _665 = -_657;
    float _667 = fma(_465, _665, _521);
    float _669 = fma(_459, _661, _501);
    float _671 = -_643;
    float _673 = fma(_577, _671, _597);
    float _675 = _601 * _601;
    float _677 = fma(_607, _651, _633);
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _681 = fma(_587, _587, _675);
    float _683 = _663 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _685 = fma(_613, _613, _681);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _691 = rsqrt(_685);
    float _693 = _627;
    float _695 = _673;
    if (_653)
    {
        _693 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _697 = _693;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _707 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _719 = as_type<int>(_697);
    if (_653)
    {
        float _721 = _697 * 5.0;
        _719 = as_type<int>(_721);
    }
    int _723 = _719;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _731 = _729 != 0;
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _735 = _733 != 0;
    out.m_74.x = _707;
    out.m_74.y = _709;
    out.m_74.z = _711;
    out.m_74.w = _683;
    float _737 = _601 * _691;
    float _739 = _587 * _691;
    out.m_76.x = _713;
    out.m_76.y = _715;
    out.m_76.z = _717;
    out.m_76.w = _705;
    bool _741 = !_727;
    int _743 = _741 ? 0 : 1;
    bool _745 = !_731;
    int _747 = _745 ? 0 : 1;
    out.m_78.x = _667;
    out.m_78.y = _669;
    out.m_78.z = _673;
    out.m_78.w = _677;
    bool _749 = !_735;
    int _751 = _749 ? 0 : 1;
    if (_653)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4014 = as_type<float>(_723);
        out.gl_Position.z = _4014;
    }
    if (_653)
    {
        out.m_59.x = 0.0;
    }
    if (_653)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _753 = -_737;
    float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _495);
    float _757 = _613 * _691;
    float _759 = -_739;
    float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _461);
    float _763 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _765 = _755 + _763;
    float _767 = -_757;
    float _769 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[18].w, _515);
    float _771 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _773 = _761 + _771;
    float _775 = _765 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _777 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _779 = _769 + _777;
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[28].x, _775);
    float _783 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[28].z, _781);
    bool _785 = _783 >= 0.0;
    if (_785)
    {
        _695 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _787 = _695;
    int _789 = as_type<int>(_787);
    if (_785)
    {
        out.m_59.x = 0.0;
    }
    if (_785)
    {
        float _791 = _787 * 5.0;
        _789 = as_type<int>(_791);
    }
    int _793 = _789;
    if (_785)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4108 = as_type<float>(_793);
        out.gl_Position.z = _4108;
    }
    if (_785)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _795 = fma(_761, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _797 = fma(_769, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _799 = floor(_795);
    float _801 = floor(_797);
    float _803 = -_799;
    float _805 = _795 + _803;
    float _807 = -_801;
    float _809 = _797 + _807;
    float2 _4144 = float2(_805, _809);
    float _811 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4144, float2(0.0), isnan(_4144)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4144, float2(0.0), isnan(_4144)), level(0.0)).x;
    float _813 = _345 * 2.0;
    float _815 = _341 * 2.0;
    float _817 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _819 = log2(_817);
    float _821 = _343 * 2.0;
    int _823 = abs(_747);
    float _825 = -_737;
    float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[18].w, _601);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _831 = 1.0 + _829;
    float _833 = floor(_813);
    int _835 = abs(_751);
    float _837 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _839 = -_739;
    float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[18].w, _587);
    float _843 = _827 * _827;
    float _845 = -_757;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _613);
    float _849 = _755 + _837;
    float _851 = floor(_815);
    float _853 = fma(_841, _841, _843);
    float _855 = fma(_847, _847, _853);
    bool _857 = _833 > 0.0;
    float _859 = floor(_821);
    bool _861 = _833 >= 0.0;
    bool _863 = isnan(_833);
    bool _865 = _861 || _863;
    bool _867 = isnan(0.0);
    bool _869 = _865 || _867;
    int _871 = abs(_743);
    int _873 = _869 ? 0 : 1;
    bool _875 = _851 > 0.0;
    float _877 = 1.0 / _831;
    int _879 = ~_873;
    int _881 = _879 + 1;
    int _883 = _881 + 1;
    bool _885 = _851 >= 0.0;
    bool _887 = isnan(_851);
    bool _889 = _885 || _887;
    bool _891 = isnan(0.0);
    bool _893 = _889 || _891;
    float _895 = _819 * _147;
    int _897 = _883;
    int _899 = 2;
    if (!_857)
    {
        int _901 = ~_873;
        int _903 = _901 + 1;
        _897 = _903;
    }
    int _905 = _897;
    float _907 = float(_871);
    float _909 = sqrt(_855);
    float _911 = float(_905);
    float _913 = _343 + _345;
    int _915 = _893 ? 0 : 1;
    float _917 = float(_823);
    float _919 = _907 * _911;
    int _921 = ~_915;
    int _923 = _921 + 1;
    int _925 = _923 + 1;
    float _927 = in.m_80.x;
    float _929 = in.m_80.y;
    float _931 = in.m_80.z;
    float _933 = exp2(_895);
    int _935 = _925;
    if (!_875)
    {
        int _937 = ~_915;
        int _939 = _937 + 1;
        _935 = _939;
    }
    int _941 = _935;
    float _943 = _913 + (-1.0);
    bool _945 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _947 = isnan(1.0);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _953 = _949 || _951;
    bool _955 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _957 = isnan(0.0);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _963 = _959 || _961;
    float _965 = float(_941);
    float _967 = _919 * (-2.0);
    float _969 = _343 + _341;
    float _971 = _343 + (-0.5);
    float _973 = _691 * _909;
    float _975 = _917 * _965;
    float _977 = _969 + (-1.0);
    float _979 = -_933;
    float _981 = _979 + 1.0;
    float _983 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _985 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _987 = _341 + (-0.5);
    float _989 = _345 + _341;
    float _991 = _963 ? _981 : 0.0;
    float _993 = _345 + (-0.5);
    float _995 = fma(_967, _927, _927);
    bool _997 = _859 > 0.0;
    float _999 = fma(_985, _967, _985);
    if (_953)
    {
        float _1001 = _991 * _877;
        _151 = _1001;
    }
    float _1003 = _151;
    float _1005 = _975 * (-2.0);
    float _1007 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].x, _995);
    bool _1009 = _859 >= 0.0;
    bool _1011 = isnan(_859);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan(0.0);
    bool _1017 = _1013 || _1015;
    float _1019 = _989 + (-1.0);
    float _1021 = fma(_983, _1005, _983);
    float _1023 = fma(_999, _1003, _1007);
    float _1025 = fma(_1005, _929, _929);
    int _1027 = _1017 ? 0 : 1;
    float _1029 = _1023 * 0.15915493667125701904296875;
    float _1031 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1025);
    int _1033 = ~_1027;
    int _1035 = _1033 + 1;
    int _1037 = _1035 + 1;
    float _1039 = fma(_1021, _1003, _1031);
    int _1041 = _1037;
    if (!_997)
    {
        int _1043 = ~_1027;
        int _1045 = _1043 + 1;
        _1041 = _1045;
    }
    int _1047 = _1041;
    float _1049 = _1029 * 6.283185482025146484375;
    float _1051 = sin(_1049);
    float _1053 = float(_835);
    float _1055 = _1039 * 0.15915493667125701904296875;
    float _1057 = float(_1047);
    float _1059 = _755 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1061 = _1053 * _1057;
    float _1063 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1059);
    float _1065 = _1029 * 6.283185482025146484375;
    float _1067 = cos(_1065);
    float _1069 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1071 = _1061 * (-2.0);
    float _1073 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1063);
    float _1075 = _1055 * 6.283185482025146484375;
    float _1077 = sin(_1075);
    float _1079 = fma(_1071, _931, _931);
    float _1081 = fma(_1069, _1071, _1069);
    float _1083 = _755 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1085 = _849 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1087 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1079);
    float _1089 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1091 = _1055 * 6.283185482025146484375;
    float _1093 = cos(_1091);
    float _1095 = fma(_1081, _1003, _1087);
    float _1097 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1083);
    float _1099 = fma(_761, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1085);
    float _1101 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1097);
    float _1103 = 1.0 / _1089;
    float _1105 = _1095 * 0.15915493667125701904296875;
    float _1107 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1109 = in.m_82.x;
    float _1111 = in.m_82.y;
    float _1113 = fma(_769, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1099);
    float _1115 = _1067 * _1077;
    float _1117 = _1107 + _1089;
    float _1119 = _1105 * 6.283185482025146484375;
    float _1121 = cos(_1119);
    float _1123 = _1113 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1125 = _1067 * _1093;
    float _1127 = _1117 * _1103;
    float _1129 = _1127 * 0.5;
    float _1131 = _849 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1133 = _1105 * 6.283185482025146484375;
    float _1135 = sin(_1133);
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1139 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1137);
    float _1141 = fma(_761, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1131);
    float _1143 = _1067 * _1121;
    float _1145 = fma(_769, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1141);
    float _1147 = 1.0 / _1139;
    float _1149 = _287 * _1109;
    float _1151 = _289 * _1111;
    float _1153 = _1145 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1155 = _1051 * _1077;
    float _1157 = _1149 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1159 = _1051 * _1093;
    float _1161 = _1093 * _1121;
    float _1163 = trunc(_1123);
    int _1165 = int(_1163);
    float _1167 = _1051 * _1121;
    float _1169 = _1077 * _1121;
    float _1171 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1173 = _973 * _1157;
    float _1175 = -_1115;
    float _1177 = fma(_1135, _1159, _1175);
    float _1179 = -_1159;
    float _1181 = fma(_1135, _1115, _1179);
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1187 = _1147 * _1185;
    float _1189 = trunc(_1153);
    int _1191 = int(_1189);
    float _1193 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1195 = _1183 * _1173;
    float _1197 = fma(_1135, _1125, _1155);
    bool _1199 = _1187 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1201 = _973 * _1193;
    bool _1203 = _1187 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1205 = _973 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1207 = _1205 * 0.5;
    bool _1209 = !_1199;
    int _1211 = _1209 ? 0 : 1;
    float _1213 = _1171 * _1201;
    int _1215 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1217 = _1165 + _1215;
    int _1219 = _1217 + 1;
    float _1221 = fma(_1135, _1155, _1125);
    float _1223 = _1143 * _1213;
    bool _1225 = _1219 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1227 = -_1213;
    float _1229 = _1135 * _1227;
    int _1231 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1233 = _1191 + _1231;
    int _1235 = _1233 + 1;
    float _1237 = fma(_1197, _1195, _1223);
    int _1239 = _1219;
    int _1241 = _1235;
    float _1243 = _1123;
    if (!_1199)
    {
        _899 = 1;
    }
    int _1245 = _899;
    float _1247 = _1167 * _1213;
    int _1249 = _1245;
    if (!_1203)
    {
        _1249 = _1211;
    }
    int _1251 = _1249;
    float _1253 = fma(_1161, _1195, _1229);
    int _1255 = _1219 | _1235;
    float _1257 = fma(_1181, _1207, _1237);
    int _1259 = _1251 << 6;
    float _1261 = fma(_1177, _1195, _1247);
    bool _1263 = _1255 < 0;
    bool _1265 = _1263 || _1225;
    float _1267 = fma(_1169, _1207, _1253);
    int _1269 = _1259 + 96;
    uint _1272 = uint(int(uint(_1269) >> uint(2)));
    uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
    int _1276 = int(_1272) & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    int _1280 = int(_1272) + 1;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    int _1284 = _1280 & 3;
    float _1286 = (*spvDescriptorSet0.vp_c15)._m0[int(_1282)][_1284];
    float _1288 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1290 = _1235 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1292 = _1290 || _1265;
    float _1294 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1296 = fma(_1221, _1207, _1261);
    float _1298 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1288);
    bool _1300 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1302 = isnan(0.5);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1308 = _1304 || _1306;
    float _1310 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1294);
    int _1312 = _1259 + 104;
    uint _1314 = uint(int(uint(_1312) >> uint(2)));
    uint _1316 = uint(int(uint(int(_1314)) >> uint(2)));
    int _1318 = int(_1314) & 3;
    float _1320 = (*spvDescriptorSet0.vp_c15)._m0[int(_1316)][_1318];
    int _1322 = int(_1314) + 1;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    int _1326 = _1322 & 3;
    float _1328 = (*spvDescriptorSet0.vp_c15)._m0[int(_1324)][_1326];
    float _1330 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1298);
    float _1332 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1310);
    float _1334 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1336 = as_type<float>(_1251);
    if (!_1292)
    {
        int _1338 = _1235 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1340 = _1338 + _1219;
        _1239 = _1340;
    }
    int _1342 = _1239;
    int _1344 = _1259 + 48;
    uint _1346 = uint(int(uint(_1344) >> uint(2)));
    uint _1348 = uint(int(uint(int(_1346)) >> uint(2)));
    int _1350 = int(_1346) & 3;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[int(_1348)][_1350];
    int _1354 = int(_1346) + 1;
    uint _1356 = uint(int(uint(_1354) >> uint(2)));
    int _1358 = _1354 & 3;
    float _1360 = (*spvDescriptorSet0.vp_c15)._m0[int(_1356)][_1358];
    float _1362 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1364 = _515 + _1334;
    float _1366 = 0.0;
    float _1368 = _1364;
    float _1370 = as_type<float>(_1342);
    if (!_1292)
    {
        float _1372 = floor(_1123);
        _1366 = _1372;
    }
    float _1374 = _1366;
    int _1376 = 0;
    if (!_1292)
    {
        int _1378 = _1342 << 2;
        _1376 = _1378;
    }
    int _1380 = _1376;
    float _1382 = _461 + _1362;
    int _1384 = _1380;
    float _1386 = _1382;
    if (!_1292)
    {
        uint _1388 = uint(int(uint(_1342) >> uint(2)));
        _1241 = int(_1388);
    }
    int _1390 = _1241;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1394 = _1364 + _1392;
    int _1396 = _1259 + 64;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    uint _1400 = uint(int(uint(int(_1398)) >> uint(2)));
    int _1402 = int(_1398) & 3;
    float _1404 = (*spvDescriptorSet0.vp_c15)._m0[int(_1400)][_1402];
    int _1406 = int(_1398) + 1;
    uint _1408 = uint(int(uint(_1406) >> uint(2)));
    int _1410 = _1406 & 3;
    float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
    if (!_1292)
    {
        int _1414 = 12 & _1380;
        _1384 = _1414;
    }
    int _1416 = _1384;
    float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1420 = _1382 + _1418;
    float _1422 = _1394 * _1394;
    float _1424 = 0.0;
    if (!_1292)
    {
        int _1426 = _1390 << 4;
        int _1428 = _1426 + _1416;
        _1424 = as_type<float>(_1428);
    }
    float _1430 = _1424;
    float _1432 = fma(_1420, _1420, _1422);
    int _1434 = _1259 + 56;
    uint _1436 = uint(int(uint(_1434) >> uint(2)));
    uint _1438 = uint(int(uint(int(_1436)) >> uint(2)));
    int _1440 = int(_1436) & 3;
    float _1442 = (*spvDescriptorSet0.vp_c15)._m0[int(_1438)][_1440];
    int _1444 = int(_1436) + 1;
    uint _1446 = uint(int(uint(_1444) >> uint(2)));
    int _1448 = _1444 & 3;
    float _1450 = (*spvDescriptorSet0.vp_c15)._m0[int(_1446)][_1448];
    float _1452 = sqrt(_1432);
    int _1454 = _1259 + 72;
    uint _1456 = uint(int(uint(_1454) >> uint(2)));
    uint _1458 = uint(int(uint(int(_1456)) >> uint(2)));
    int _1460 = int(_1456) & 3;
    float _1462 = (*spvDescriptorSet0.vp_c15)._m0[int(_1458)][_1460];
    int _1464 = int(_1456) + 1;
    uint _1466 = uint(int(uint(_1464) >> uint(2)));
    int _1468 = _1464 & 3;
    float _1470 = (*spvDescriptorSet0.vp_c15)._m0[int(_1466)][_1468];
    int _1472 = _1259 + 80;
    uint _1474 = uint(int(uint(_1472) >> uint(2)));
    uint _1476 = uint(int(uint(int(_1474)) >> uint(2)));
    int _1478 = int(_1474) & 3;
    float _1480 = (*spvDescriptorSet0.vp_c15)._m0[int(_1476)][_1478];
    int _1482 = int(_1474) + 1;
    uint _1484 = uint(int(uint(_1482) >> uint(2)));
    int _1486 = _1482 & 3;
    float _1488 = (*spvDescriptorSet0.vp_c15)._m0[int(_1484)][_1486];
    float _1490 = _849 * _1286;
    bool _1492 = _1452 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1494 = fma(_761, _1278, _1490);
    float _1496 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1498 = _1259 + 88;
    uint _1500 = uint(int(uint(_1498) >> uint(2)));
    uint _1502 = uint(int(uint(int(_1500)) >> uint(2)));
    int _1504 = int(_1500) & 3;
    float _1506 = (*spvDescriptorSet0.vp_c15)._m0[int(_1502)][_1504];
    int _1508 = int(_1500) + 1;
    uint _1510 = uint(int(uint(_1508) >> uint(2)));
    int _1512 = _1508 & 3;
    float _1514 = (*spvDescriptorSet0.vp_c15)._m0[int(_1510)][_1512];
    float _1516 = fma(_769, _1320, _1494);
    float _1518 = _1257;
    if (!_1292)
    {
        float _1520 = floor(_1153);
        _1518 = _1520;
    }
    float _1522 = _1518;
    float _1524 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1496);
    float _1526 = _1516 + _1328;
    float _1528 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1524);
    float _1530 = _1430;
    if (!_1292)
    {
        int _1532 = as_type<int>(_1430) + 400;
        uint _1534 = uint(int(uint(_1532) >> uint(2)));
        uint _1536 = uint(int(uint(int(_1534)) >> uint(2)));
        int _1538 = int(_1534) & 3;
        float _1540 = (*spvDescriptorSet0.vp_c15)._m0[int(_1536)][_1538];
        _1530 = _1540;
    }
    float _1542 = _1530;
    float _1544 = _849 * _1360;
    float _1546 = 1.0 / _1526;
    float _1548 = fma(_761, _1352, _1544);
    float _1550 = _1528 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1552 = _849 * _1412;
    float _1554 = _495 + _1550;
    float _1556 = fma(_761, _1404, _1552);
    float _1558 = fma(_769, _1442, _1548);
    float _1560 = fma(_769, _1462, _1556);
    bool _1562 = !_1492;
    float _1564 = _1554;
    float _1566 = _1404;
    float _1568 = _1558;
    float _1570 = _1450;
    float _1572 = _1560;
    float _1574 = _1522;
    if (!_1562)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1580 = _1452 + _1578;
        float _1582 = _1554 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1584 = rsqrt(_1432);
        float _1586 = _1580 * _1576;
        float _1588 = _1586 * 0.15915493667125701904296875;
        float _1590 = _1588 * 6.283185482025146484375;
        float _1592 = cos(_1590);
        float _1594 = _1588 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        float _1598 = _1592 + (-1.0);
        float _1600 = fma(_1596, _1582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1602 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1604 = _1584 * _1600;
        float _1606 = fma(_1554, _1592, _1602);
        float _1608 = fma(_1420, _1604, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1610 = fma(_1394, _1604, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1386 = _1608;
        _1564 = _1606;
        _1368 = _1610;
        _1566 = _1588;
    }
    float _1612 = _1386;
    float _1614 = _1564;
    float _1616 = _1368;
    float _1618 = _1566;
    float _1620 = -_739;
    float _1622 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1612);
    float _1624 = -_737;
    float _1626 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1614);
    float _1628 = -_757;
    float _1630 = fma(_1628, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1616);
    float _1632 = _1558 + _1450;
    float _1634 = _1560 + _1470;
    float _1636 = _1618;
    float _1638 = _1630;
    float _1640 = _1626;
    if (_1308)
    {
        _1568 = _1622;
    }
    float _1642 = _1568;
    float _1644 = _1642;
    if (_1308)
    {
        _1570 = _1626;
    }
    float _1646 = _1570;
    float _1648 = _1646;
    if (_1308)
    {
        _1572 = _1630;
    }
    float _1650 = _1572;
    float _1652 = _1650;
    if (!_1308)
    {
        float _1654 = _765 * _765;
        float _1656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1658 = -_515;
        float _1660 = _1658 + _1616;
        float _1662 = -_495;
        float _1664 = _1662 + _1614;
        float _1666 = fma(_773, _773, _1654);
        float _1668 = -_461;
        float _1670 = _1668 + _1612;
        float _1672 = fma(_779, _779, _1666);
        float _1674 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1676 = sqrt(_1672);
        float _1678 = 1.0 / _973;
        float _1680 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1682 = precise::min(_1676, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1684 = _1682 * _1656;
        float _1686 = _1684 * _1678;
        float _1688 = _1680 * _1686;
        float _1690 = _1660 * _1686;
        float _1692 = fma(_1664, _1688, _755);
        float _1694 = fma(_1670, _1688, _761);
        float _1696 = fma(_1680, _1690, _769);
        _1648 = _1692;
        _1644 = _1694;
        _1652 = _1696;
        _1636 = _1656;
    }
    float _1698 = _1648;
    float _1700 = _1644;
    float _1702 = _1652;
    float _1704 = _1636;
    float _1706 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1708 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1710 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1712 = _1632 * _1546;
    float _1714 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1706);
    float _1716 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1708);
    float _1718 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1710);
    float _1720 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1722 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1714);
    bool _1724 = _1712 >= 0.0;
    float _1726 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1716);
    float _1728 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1718);
    float _1730 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1732 = _1634 * _1546;
    bool _1734 = _1712 <= 1.0;
    bool _1736 = _1734 && _1724;
    float _1738 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1740 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1720);
    float _1742 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1744 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1746 = _1732 >= 0.0;
    bool _1748 = _1746 && _1736;
    float _1750 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1740);
    float _1752 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1754 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1744);
    float _1756 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1758 = _1732 <= 1.0;
    bool _1760 = _1758 && _1748;
    float _1762 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1764 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1754);
    float _1766 = -_1756;
    float _1768 = fma(_1766, _1752, 1.0);
    float _1770 = _849 * _1488;
    float _1772 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1774 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1764);
    float _1776 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1778 = fma(_761, _1480, _1770);
    float _1780 = log2(_1768);
    float _1782 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1772);
    float _1784 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1776);
    float _1786 = fma(_769, _1506, _1778);
    if (_1760)
    {
        float _1788 = float(_1251);
        _1336 = _1788;
    }
    float _1790 = _1336;
    float _1792 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1782);
    float _1794 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1784);
    float _1796 = _1786 + _1514;
    float _1798 = 1.0 / _1774;
    float _1800 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1792);
    float _1802 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1794);
    float _1804 = _1794;
    float _1806 = _1800;
    if (!_1292)
    {
        float _1808 = -_1522;
        float _1810 = _1153 + _1808;
        _1574 = _1810;
    }
    float _1812 = _1574;
    if (!_1292)
    {
        float _1814 = -_1374;
        float _1816 = _1123 + _1814;
        _1804 = _1816;
    }
    float _1818 = _1804;
    float _1820 = _1796 * _1546;
    float _1822 = _1704;
    if (!_1292)
    {
        float _1824 = rint(_1542);
        float _1826 = precise::max(_1824, 0.0);
        uint _1828 = uint(_1826);
        uint _1830 = clamp(_1828, 0u, 65535u);
        _1822 = as_type<float>(_1830);
    }
    float _1832 = _1822;
    float _1834 = _1780 * 0.693147182464599609375;
    float _1836 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1838 = _1772;
    float _1840 = _1836;
    if (_1760)
    {
        float _1842 = rint(_1790);
        float _1844 = precise::max(_1842, 0.0);
        uint _1846 = uint(_1844);
        uint _1848 = clamp(_1846, 0u, 65535u);
        _1838 = as_type<float>(_1848);
    }
    float _1850 = _1838;
    float _1852 = _1800 * _1798;
    float _1854 = _1802 * _1798;
    float _1856 = fma(_1852, 0.5, 0.5);
    float _1858 = fma(_1854, -0.5, 0.5);
    float _1860 = _1374;
    float _1862 = _1858;
    float _1864 = _1856;
    if (!_1292)
    {
        float3 _5808 = float3(_1818, _1812, float(as_type<int>(_1832)));
        float3 _5812 = select(_5808, float3(0.0), isnan(_5808));
        float _1866 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5812.xy, uint(rint(_5812.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5812.xy, uint(rint(_5812.z)), level(0.0)).x;
        _1860 = _1866;
    }
    float _1868 = _1860;
    float _1870 = _1732;
    if (_1760)
    {
        float3 _5827 = float3(_1712, _1732, float(as_type<int>(_1850)));
        float3 _5829 = select(_5827, float3(0.0), isnan(_5827));
        float _1872 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5829.xy, uint(rint(_5829.z)), _1820, level(0.0));
        _1870 = _1872;
    }
    float _1874 = _1870;
    float3 _5839 = float3(_1856, _1858, _1836);
    float _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5839, float3(0.0), isnan(_5839)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5839, float3(0.0), isnan(_5839)), level(0.0)).x;
    float3 _5848 = float3(_1856, _1858, _1836);
    float4 _1879 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5848, float3(0.0), isnan(_5848)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5848, float3(0.0), isnan(_5848)), level(0.0)).xyzw;
    float _1881 = _1879.x;
    float _1883 = _1879.y;
    float _1885 = _1879.z;
    float _1887 = _1879.w;
    bool _1889 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1891 = isnan(0.5);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1897 = _1893 || _1895;
    if (_1292)
    {
        _1638 = 1.0;
    }
    float _1899 = _1638;
    float _1901 = _1899;
    if (_1897)
    {
        _1243 = 1.0;
    }
    float _1903 = _1243;
    float _1905 = _1903;
    if (_1897)
    {
        _1640 = 1.0;
    }
    float _1907 = _1640;
    float _1909 = _1907;
    if (!_1897)
    {
        float _1911 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1913 = _1911 * 0.15915493667125701904296875;
        float _1915 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1917 = _1913 * 6.283185482025146484375;
        float _1919 = cos(_1917);
        float _1921 = _1915 * 0.15915493667125701904296875;
        float _1923 = _1913 * 6.283185482025146484375;
        float _1925 = sin(_1923);
        float _1927 = 1.0 / _1919;
        float _1929 = _1921 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        float _1933 = _1925 * _1927;
        float _1935 = _1921 * 6.283185482025146484375;
        float _1937 = sin(_1935);
        float _1939 = _1931 * _1933;
        float _1941 = 1.0 / _1939;
        float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1945 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1943;
        float _1947 = 1.0 / _1945;
        float _1949 = _1937 * _1941;
        float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1953 = fma(_1187, _1949, _1951);
        float _1955 = _1953 * _1947;
        float _1957 = precise::clamp(_1955, 0.0, 1.0);
        _1862 = _1953;
        _1864 = _1921;
        _1909 = _1957;
    }
    float _1959 = _1862;
    float _1961 = _1864;
    float _1963 = _1909;
    float _1965 = _1961;
    float _1967 = _1959;
    if (!_1897)
    {
        float _1969 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1971 = _1969 * 0.15915493667125701904296875;
        float _1973 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1975 = _1971 * 6.283185482025146484375;
        float _1977 = cos(_1975);
        float _1979 = _1973 * 0.15915493667125701904296875;
        float _1981 = _1971 * 6.283185482025146484375;
        float _1983 = sin(_1981);
        float _1985 = 1.0 / _1977;
        float _1987 = _1979 * 6.283185482025146484375;
        float _1989 = cos(_1987);
        float _1991 = _1983 * _1985;
        float _1993 = _1979 * 6.283185482025146484375;
        float _1995 = sin(_1993);
        float _1997 = _1989 * _1991;
        float _1999 = 1.0 / _1997;
        float _2001 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2003 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2001;
        float _2005 = 1.0 / _2003;
        float _2007 = _1995 * _1999;
        float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2011 = fma(_1187, _2007, _2009);
        float _2013 = _2011 * _2005;
        float _2015 = precise::clamp(_2013, 0.0, 1.0);
        float _2017 = -_2015;
        float _2019 = _2017 + 1.0;
        _1965 = _1997;
        _1967 = _1985;
        _1905 = _2019;
    }
    float _2021 = _1965;
    float _2023 = _1967;
    float _2025 = _1905;
    if (!_1292)
    {
        int _2027 = _1342 << 4;
        int _2029 = _2027 + 2048;
        uint _2031 = uint(int(uint(_2029) >> uint(2)));
        uint _2033 = uint(int(uint(int(_2031)) >> uint(2)));
        int _2035 = int(_2031) & 3;
        float _2037 = (*spvDescriptorSet0.vp_c15)._m0[int(_2033)][_2035];
        int _2039 = int(_2031) + 1;
        uint _2041 = uint(int(uint(_2039) >> uint(2)));
        int _2043 = _2039 & 3;
        float _2045 = (*spvDescriptorSet0.vp_c15)._m0[int(_2041)][_2043];
        int _2047 = _2029 + 8;
        uint _2049 = uint(int(uint(_2047) >> uint(2)));
        uint _2051 = uint(int(uint(int(_2049)) >> uint(2)));
        int _2053 = int(_2049) & 3;
        float _2055 = (*spvDescriptorSet0.vp_c15)._m0[int(_2051)][_2053];
        int _2057 = int(_2049) + 1;
        uint _2059 = uint(int(uint(_2057) >> uint(2)));
        int _2061 = _2057 & 3;
        float _2063 = (*spvDescriptorSet0.vp_c15)._m0[int(_2059)][_2061];
        float _2065 = _849 * _2045;
        float _2067 = fma(_761, _2037, _2065);
        float _2069 = fma(_769, _2055, _2067);
        float _2071 = _2069 + _2063;
        float _2073 = precise::clamp(_2071, 0.0, 1.0);
        float _2075 = -_2073;
        float _2077 = _2075 + _1868;
        float _2079 = fma(_2077, 500.0, 1.5);
        float _2081 = exp2(_2079);
        float _2083 = 0.0 + _2081;
        float _2085 = precise::clamp(_2083, 0.0, 1.0);
        _1370 = as_type<float>(_2029);
        _1901 = _2085;
    }
    float _2087 = _1370;
    float _2089 = _1901;
    float _2091 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2093 = _1698 + _2091;
    float _2095 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2097 = _1700 + _2095;
    float _2099 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2101 = _1702 + _2099;
    float _2103 = _2093 * _2093;
    float _2105 = fma(_2097, _2097, _2103);
    float _2107 = fma(_2101, _2101, _2105);
    float _2109 = rsqrt(_2107);
    float _2111 = sqrt(_2107);
    float _2113 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2115 = _2097 * _2113;
    float _2117 = _2101 * _2113;
    float _2119 = _2115 * _2115;
    float _2121 = _2117 * _2117;
    float _2123 = _2119 + _2121;
    float _2125 = sqrt(_2123);
    bool _2127 = _2125 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2129 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2131 = _2125 + _2129;
    float _2133 = _2021;
    float _2135 = _2123;
    float _2137 = _2131;
    float _2139 = _2115;
    float _2141 = _2117;
    float _2143 = _2119;
    float _2145 = _2121;
    if (_2127)
    {
        float _2147 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2133 = _2147;
    }
    float _2149 = _2133;
    if (_2127)
    {
        float _2151 = rsqrt(_2123);
        _2135 = _2151;
    }
    float _2153 = _2135;
    if (_2127)
    {
        float _2155 = _2131 * _2149;
        _2137 = _2155;
    }
    float _2157 = _2137;
    if (_2127)
    {
        float _2159 = _2157 * 0.15915493667125701904296875;
        _1840 = _2159;
    }
    float _2161 = _1840;
    float _2163 = _2023;
    if (_2127)
    {
        float _2165 = _2161 * 6.283185482025146484375;
        float _2167 = sin(_2165);
        _2163 = _2167;
    }
    float _2169 = _2163;
    float _2171 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2173 = precise::max(0.0, _2171);
    float _2175 = _2087;
    float _2177 = _2173;
    float _2179 = _2171;
    if (_2127)
    {
        float _2181 = _2161 * 6.283185482025146484375;
        float _2183 = cos(_2181);
        _2175 = _2183;
    }
    float _2185 = _2175;
    float _2187 = -_2113;
    float _2189 = -_2173;
    float _2191 = fma(_2093, _2187, _2189);
    float _2193 = _2191;
    if (_2127)
    {
        float _2195 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2177 = _2195;
    }
    float _2197 = _2177;
    float _2199 = _2169;
    float _2201 = _2197;
    if (_2127)
    {
        float _2203 = fma(_2169, _2197, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2199 = _2203;
    }
    float _2205 = _2199;
    float _2207 = _2205;
    if (_2127)
    {
        float _2209 = _2185 + (-1.0);
        _2179 = _2209;
    }
    float _2211 = _2179;
    if (_2127)
    {
        float _2213 = _2153 * _2205;
        _2207 = _2213;
    }
    float _2215 = _2207;
    if (_2127)
    {
        float _2217 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2201 = _2217;
    }
    float _2219 = _2201;
    if (_2127)
    {
        float _2221 = _2115 * _2215;
        _2139 = _2221;
    }
    float _2223 = _2139;
    if (_2127)
    {
        float _2225 = _2117 * _2215;
        _2141 = _2225;
    }
    float _2227 = _2141;
    if (_2127)
    {
        float _2229 = fma(_2191, _2185, _2219);
        _2193 = _2229;
    }
    float _2231 = _2193;
    if (_2127)
    {
        float _2233 = _2223 * _2223;
        _2143 = _2233;
    }
    float _2235 = _2143;
    if (_2127)
    {
        float _2237 = _2227 * _2227;
        _2145 = _2237;
    }
    float _2239 = _2145;
    float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2243 = fma(_2111, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2241);
    float _2245 = precise::clamp(_2243, 0.0, 1.0);
    float _2247 = fma(_2231, _2231, _2235);
    float _2249 = -_2245;
    float _2251 = _2249 + 1.0;
    float _2253 = _2247 + _2239;
    float _2255 = rsqrt(_2253);
    float _2257 = _2255 * _2231;
    float _2259 = _2255 * _2223;
    float _2261 = abs(_2251);
    float _2263 = log2(_2261);
    float _2265 = _2255 * _2227;
    float _2267 = _2259 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2269 = -_2267;
    float _2271 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2269);
    float _2273 = -_2265;
    float _2275 = fma(_2273, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2271);
    float _2277 = fma(_2275, -0.5, 0.5);
    float _2279 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2281 = fma(_2275, 0.5, 0.5);
    float _2283 = _2257 + 1.0;
    float _2285 = sqrt(_2277);
    float _2287 = fma(_2281, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2289 = fma(_2281, _2287, -0.212114393711090087890625);
    float _2291 = exp2(_2279);
    float _2293 = fma(_2281, _2289, 1.570728778839111328125);
    float _2295 = _2285 * 0.636619746685028076171875;
    float _2297 = -_2293;
    float _2299 = fma(_2295, _2297, 1.0);
    float _2301 = -_2257;
    float _2303 = fma(_2291, _2283, _2301);
    float _2305 = fma(_2303, 0.5, 0.5);
    float2 _6466 = float2(_2299, _2305);
    float3 _2309 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6466, float2(0.0), isnan(_6466)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6466, float2(0.0), isnan(_6466)), level(0.0)).xyz;
    float _2311 = _2309.x;
    float _2313 = _2309.y;
    float _2315 = _2309.z;
    float _2317 = abs(_1187);
    float _2319 = log2(_2317);
    float _2321 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2323 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2325 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2327 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2329 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2331 = -_1135;
    float _2333 = fma(_2331, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2321);
    float _2335 = -_1135;
    float _2337 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2323);
    float _2339 = -_1135;
    float _2341 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2325);
    float _2343 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2345 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2347 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2349 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2351 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2353 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2327);
    float _2355 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2329);
    float _2357 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2359 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2343);
    float _2361 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2345);
    float _2363 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2351);
    float _2365 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2347);
    float _2367 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2349);
    float _2369 = exp2(_2357);
    float _2371 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2333);
    float _2373 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2337);
    float _2375 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2377 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2341);
    float _2379 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2353);
    float _2381 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2355);
    float _2383 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2359);
    float _2385 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2361);
    float _2387 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2363);
    float _2389 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2365);
    float _2391 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2367);
    float _2393 = _2375 * _2371;
    float _2395 = _2375 * _2373;
    float _2397 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2399 = _2375 * _2377;
    float _2401 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2403 = fma(_2397, _2379, _2393);
    float _2405 = fma(_2397, _2381, _2395);
    float _2407 = fma(_2397, _2383, _2399);
    float _2409 = fma(_2369, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2411 = precise::clamp(_2409, 0.0, 1.0);
    float _2413 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2387);
    float _2415 = _1774 * 0.5;
    float _2417 = exp2(_2401);
    float _2419 = fma(_2411, -2.0, 3.0);
    float _2421 = _2411 * _2411;
    float _2423 = fma(_1802, -0.5, _2415);
    out.gl_Position.x = _1800;
    out.gl_Position.y = _1802;
    out.gl_Position.z = _2413;
    out.gl_Position.w = _1774;
    bool _2425 = _1187 <= 8000.0;
    bool _2427 = isnan(_1187);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan(8000.0);
    bool _2433 = _2429 || _2431;
    float _2435 = float(_2433);
    float _2437 = _2421 * _2419;
    float _2439 = _2413 + _1774;
    float _2441 = -_811;
    float _2443 = _2441 + 1.0;
    float _2445 = _1800 + _1774;
    float _2447 = _2439 * 0.5;
    float _2449 = _2385 + _2403;
    float _2451 = _2445 * 0.5;
    float _2453 = _2389 + _2405;
    float _2455 = _2391 + _2407;
    bool _2457 = _2111 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2459 = isnan(_2111);
    bool _2461 = _2457 || _2459;
    bool _2463 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2465 = _2461 || _2463;
    float _2467 = -_2437;
    float _2469 = _2467 + 1.0;
    float _2471 = -_2417;
    float _2473 = _2471 + 1.0;
    if (!_1760)
    {
        _1806 = 1.0;
    }
    float _2475 = _1806;
    out.m_84.x = _2451;
    out.m_84.y = _2423;
    out.m_84.z = _2447;
    out.m_84.w = _1774;
    float _2477 = fma(_2469, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2437);
    float _2479 = _2475;
    float _2481 = _2313;
    float _2483 = _2311;
    if (_1760)
    {
        bool _2485 = _1874 >= _1820;
        bool _2487 = isnan(_1874);
        bool _2489 = _2485 || _2487;
        bool _2491 = isnan(_1820);
        bool _2493 = _2489 || _2491;
        float _2495 = float(_2493);
        _2479 = _2495;
    }
    float _2497 = _2479;
    float _2499 = _2473 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _2449;
    out.m_86.y = _2453;
    out.m_86.z = _2455;
    float _2501 = _2435 * _2477;
    float _2503 = _2499 * _1876;
    float _2505 = _2497 * _2089;
    float _2507 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2509 = -_2499;
    float _2511 = _2509 + 1.0;
    float _2513 = _1887 * _2503;
    float _2515 = _2499;
    float _2517 = _2511;
    if (!_2465)
    {
        _2515 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2519 = _2515;
    float _2521 = _2443 * _2507;
    float _2523 = precise::clamp(_2521, 0.0, 1.0);
    float _2525 = -_2523;
    float _2527 = fma(_2525, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2529 = -_2505;
    float _2531 = fma(_2529, _2527, 1.0);
    float _2533 = precise::clamp(_2531, 0.0, 1.0);
    float _2535 = _2527;
    float _2537 = _2519;
    float _2539 = _2519;
    if (!_2465)
    {
        _2535 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2541 = _2535;
    float _2543 = _2315 * _2503;
    float _2545 = fma(_2311, _2513, _1881);
    float _2547 = fma(_2313, _2513, _1883);
    float _2549 = _2533 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2551 = _1887 * _2511;
    float _2553 = fma(_1887, _2543, _1885);
    float _2555 = _1963 * _2025;
    float _2557 = _2555;
    float _2559 = _2541;
    float _2561 = _2541;
    if (!_2465)
    {
        _2481 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2563 = _2481;
    out.m_88.x = _2549;
    float _2565 = _2563;
    float _2567 = _2563;
    if (!_2465)
    {
        _2483 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2569 = _2483;
    float _2571 = _2555 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2573 = _2569;
    float _2575 = _2569;
    if (!_2465)
    {
        _2517 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2577 = _2517;
    out.m_90.x = _2545;
    out.m_90.y = _2547;
    out.m_90.z = _2553;
    out.m_90.w = _2551;
    float _2579 = _2577;
    float _2581 = _2577;
    if (!_2465)
    {
        _2557 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2583 = _2557;
    bool _2585 = !_2465;
    float _2587 = _2583;
    float _2589 = _2583;
    if (!_2585)
    {
        bool _2591 = _2111 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2593 = isnan(_2111);
        bool _2595 = _2591 || _2593;
        bool _2597 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2599 = _2595 || _2597;
        if (!_2599)
        {
            float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2603 = _2111 + _2601;
            float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2607 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2605;
            float _2609 = 1.0 / _2607;
            float _2611 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2615 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2621 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2629 = _2627 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2631 = _2603 * _2609;
            float _2633 = precise::clamp(_2631, 0.0, 1.0);
            float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2639 = fma(_2633, _2613, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2641 = fma(_2633, _2637, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2643 = fma(_2633, _2617, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2645 = fma(_2633, _2621, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2647 = fma(_2633, _2625, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2649 = fma(_2633, _2629, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2575 = _2641;
            _2561 = _2647;
            _2567 = _2639;
            _2581 = _2645;
            _2539 = _2643;
            _2589 = _2649;
            _2651 = true;
        }
        else
        {
            bool _2653 = _2111 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2655 = isnan(_2111);
            bool _2657 = _2653 || _2655;
            bool _2659 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2661 = _2657 || _2659;
            if (!_2661)
            {
                _2565 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2663 = _2565;
            _2567 = _2663;
            if (!_2661)
            {
                _2573 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2665 = _2573;
            _2575 = _2665;
            if (!_2661)
            {
                _2537 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2667 = _2537;
            _2539 = _2667;
            if (!_2661)
            {
                _2579 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2669 = _2579;
            _2581 = _2669;
            if (!_2661)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2671 = _2559;
            _2561 = _2671;
            if (!_2661)
            {
                _2587 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2673 = _2587;
            bool _2675 = !_2661;
            _2589 = _2673;
            if (!_2675)
            {
                bool _2677 = _2111 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2679 = isnan(_2111);
                bool _2681 = _2677 || _2679;
                bool _2683 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2685 = _2681 || _2683;
                if (!_2685)
                {
                    float _2687 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2689 = _2111 + _2687;
                    float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2693 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2691;
                    float _2695 = 1.0 / _2693;
                    float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2707 = _2705 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2713 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2715 = _2713 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2717 = _2689 * _2695;
                    float _2719 = precise::clamp(_2717, 0.0, 1.0);
                    float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2723 = _2721 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2725 = fma(_2719, _2699, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2727 = fma(_2719, _2723, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2729 = fma(_2719, _2703, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2731 = fma(_2719, _2707, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2733 = fma(_2719, _2711, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2735 = fma(_2719, _2715, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2575 = _2727;
                    _2561 = _2733;
                    _2567 = _2725;
                    _2581 = _2731;
                    _2539 = _2729;
                    _2589 = _2735;
                    _2651 = true;
                }
                else
                {
                    _2575 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2567 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2581 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2539 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2589 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2651 = false;
    float _2737 = _2575;
    float _2739 = _2561;
    float _2741 = _2567;
    float _2743 = _2581;
    float _2745 = _2539;
    float _2747 = _2589;
    float _2749 = fma(_2453, -0.5, 0.5);
    float _2751 = precise::clamp(_2749, 0.0, 1.0);
    float _2753 = -_2737;
    float _2755 = _2753 + _2739;
    float _2757 = -_2741;
    float _2759 = _2757 + _2743;
    out.m_92.x = 0.0;
    float _2761 = fma(_2751, _2755, _2737);
    float _2763 = -_2745;
    float _2765 = _2763 + _2747;
    float _2767 = fma(_2751, _2759, _2741);
    float _2769 = _2761 * 0.586610972881317138671875;
    bool _2771 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2773 = fma(_2751, _2765, _2745);
    float _2775 = _2571 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2777 = fma(_2767, 0.298911988735198974609375, _2769);
    bool _2779 = _1963 > 0.0;
    bool _2781 = isnan(_1963);
    bool _2783 = _2779 || _2781;
    bool _2785 = isnan(0.0);
    bool _2787 = _2783 || _2785;
    float _2789 = fma(_2773, 0.114477999508380889892578125, _2777);
    out.m_59.x = _2775;
    bool _2791 = _2025 <= 0.0;
    bool _2793 = !_2787;
    bool _2795 = _2791 || _2793;
    float _2797 = -_2789;
    float _2799 = _2767 + _2797;
    float _2801 = -_2789;
    float _2803 = _2773 + _2801;
    float _2805 = fma(_2799, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2789);
    float _2807 = -_2789;
    float _2809 = _2761 + _2807;
    float _2811 = fma(_2803, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2789);
    float _2813 = fma(_2809, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2789);
    bool _2815 = !_2771;
    if (!_2815)
    {
        float _2817 = -_1698;
        float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2821 = -_1700;
        float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2825 = -_1702;
        float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2829 = _2819 * _2819;
        float _2831 = fma(_2823, _2823, _2829);
        float _2833 = fma(_2827, _2827, _2831);
        float _2835 = sqrt(_2833);
        float _2837 = rsqrt(_2833);
        float _2839 = -_2835;
        float _2841 = _2839 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2843 = _2841 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2845 = precise::clamp(_2843, 0.0, 1.0);
        float _2847 = _2823 * _2837;
        float _2849 = _2819 * _2837;
        float _2851 = abs(_2845);
        float _2853 = log2(_2851);
        float _2855 = _2827 * _2837;
        float _2857 = _2847 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2859 = _2453 * _2849;
        float _2861 = -_2849;
        float _2863 = -_2857;
        float _2865 = fma(_2861, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2863);
        float _2867 = fma(_2449, _2847, _2859);
        float _2869 = -_2855;
        float _2871 = fma(_2869, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2865);
        float _2873 = fma(_2455, _2855, _2867);
        float _2875 = precise::clamp(_2873, 0.0, 1.0);
        float _2877 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2879 = _2871 + _2877;
        float _2881 = _2853 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2883 = _2879 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2885 = precise::clamp(_2883, 0.0, 1.0);
        float _2887 = exp2(_2881);
        float _2889 = _2887 * _2885;
        float _2891 = _2875 * _2889;
        float _2893 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2895 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2897 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2893;
        out.m_92.y = _2895;
        out.m_92.z = _2897;
    }
    out.m_94.x = _2805;
    out.m_94.y = _2813;
    out.m_94.z = _2811;
    if (!_2795)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2899 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2899;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2651 = false;
    bool _311 = false;
    bool _209 = false;
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
        float _2956 = as_type<float>(_129);
        out.gl_Position.z = _2956;
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
        float _3025 = as_type<float>(_167);
        out.gl_Position.z = _3025;
    }
    if (_161)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _173 = as_type<int>(_169) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_169) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _207;
    if (!_189)
    {
        float _191 = in.m_66.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_113);
        float _213 = 1.0 / _211;
        float _215 = _147 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _217 + _219;
    bool _223 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _225 = isnan(_217);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    float _239 = -_233;
    float _241 = _239 + 1.0;
    bool _243 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _245 = isnan(_217);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _255;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _261 = 1.0 / _237;
    float _263 = _253 * _241;
    float _265 = -_253;
    float _267 = _265 + 1.0;
    float _269 = _221 * _261;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _271;
    float _275 = fma(_257, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _277 = fma(_273, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _279 = _275 * _263;
    float _281 = _277 * _263;
    float _283 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].x, _279);
    float _285 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].y, _281);
    float _287 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[144].x, _283);
    float _289 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[144].y, _285);
    bool _291 = !_259;
    float _309;
    if (!_291)
    {
        float _293 = in.m_66.x;
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _297 = _293 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _301 = _299 * _295;
        float _303 = floor(_301);
        float _305 = -_303;
        float _307 = _301 + _305;
        _309 = _307;
        _311 = true;
    }
    else
    {
        float _313 = float(_113);
        float _315 = 1.0 / _313;
        float _317 = _147 * _315;
        _309 = _317;
    }
    _311 = false;
    float _319 = _309;
    float _321 = in.m_56.x;
    float _323 = in.m_56.y;
    float _325 = in.m_56.z;
    float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _329 = in.m_68.x;
    float _331 = in.m_68.y;
    float _333 = in.m_68.z;
    float _335 = in.m_68.w;
    int _337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _339 = _337 != 0;
    float _341 = in.m_66.x;
    float _343 = in.m_66.y;
    float _345 = in.m_66.z;
    float _347 = in.m_66.w;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _351 = _349 != 0;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _355 = _353 != 0;
    float _357 = in.m_70.x;
    float _359 = in.m_70.y;
    float _361 = in.m_70.z;
    float _363 = in.m_70.w;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _367 = _365 != 0;
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _371 = _369 != 0;
    float _373 = in.m_72.x;
    float _375 = in.m_72.y;
    float _377 = in.m_72.z;
    float _379 = in.m_72.w;
    float _381 = _323 * _331;
    bool _383 = _347 > 0.5;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _389 = fma(_321, _329, _381);
    float _391 = _323 * _359;
    float _393 = 1.0 / _387;
    float _395 = fma(_325, _333, _389);
    float _397 = fma(_321, _357, _391);
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _401 = _343 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _403 = _323 * _375;
    float _405 = _341 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _407;
    bool _411 = _341 > 0.5;
    float _413 = fma(_401, -2.0, _399);
    float _415 = fma(_321, _373, _403);
    float _417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _419 = fma(_325, _361, _397);
    float _421 = -_183;
    int _423 = _411 ? as_type<int>(_421) : as_type<int>(_183);
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _427 = _343 > 0.5;
    float _429 = fma(_325, _377, _415);
    float _431 = -_425;
    float _433 = fma(_405, 2.0, _431);
    float _435 = -_187;
    int _437 = _427 ? as_type<int>(_435) : as_type<int>(_187);
    float _439 = _409 * _393;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _443 = _319 + _441;
    float _445 = _409;
    if (!_339)
    {
        _445 = _345;
    }
    float _447 = _445;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _451 = _447;
    if (_339)
    {
        _451 = _343;
    }
    float _453 = _451;
    float _455 = fma(_439, _443, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _457 = !_355;
    float _459 = _457 ? _187 : as_type<float>(_437);
    float _461 = _395 + _335;
    bool _463 = !_351;
    float _465 = _463 ? _183 : as_type<float>(_423);
    float _467 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[83].w, _449);
    float _469 = _417 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _471 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _413);
    float _473 = _459 + (-0.5);
    bool _475 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _477 = isnan(_319);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = _327 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _489 = -_147;
    float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[76].x, _433);
    float _493 = _465 + 0.5;
    float _495 = _419 + _363;
    float _497 = -_469;
    float _499 = -_471;
    float _501 = fma(_497, _473, _499);
    bool _503 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _505 = isnan(_319);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = _429 + _379;
    float _517 = -_485;
    float _519 = _517 + 1.0;
    float _521 = fma(_487, _493, _491);
    float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _525 = _487;
    if (!_339)
    {
        _525 = _343;
    }
    float _527 = _525;
    float _529 = _513 * _519;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _533 = _527;
    if (_339)
    {
        _533 = _341;
    }
    float _535 = _533;
    float _537 = _455 * _529;
    bool _539 = _345 > 0.5;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _545 = _535 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _547 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[83].z, _531);
    float _549 = -_183;
    int _551 = _539 ? as_type<int>(_549) : as_type<int>(_183);
    float _553 = -_513;
    float _555 = _553 + 1.0;
    float _557 = _535;
    if (!_339)
    {
        _557 = _345;
    }
    float _559 = _557;
    float _561 = -_541;
    float _563 = fma(_545, 2.0, _561);
    float _565 = _559;
    if (_339)
    {
        _565 = _343;
    }
    float _567 = _565;
    float _569 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[115].x, _537);
    float _571 = -_147;
    float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[81].x, _563);
    bool _575 = !_367;
    float _577 = _575 ? _183 : as_type<float>(_551);
    float _579 = _567 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _581 = _523 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _587 = _461 + _585;
    float _589 = _577 + 0.5;
    float _591 = fma(_579, -2.0, _583);
    float _593 = -_187;
    int _595 = _383 ? as_type<int>(_593) : as_type<int>(_187);
    float _597 = fma(_581, _589, _573);
    float _599 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _601 = _495 + _599;
    float _603 = _543 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _605 = !_371;
    float _607 = _605 ? _187 : as_type<float>(_595);
    float _609 = _601 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _613 = _515 + _611;
    float _615 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _591);
    float _617 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _547);
    float _619 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[28].x, _609);
    float _621 = _607 + (-0.5);
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _627 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[28].z, _619);
    float _629 = -_603;
    float _631 = -_615;
    float _633 = fma(_629, _621, _631);
    float _635 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[78].z, _623);
    float _637 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[78].w, _625);
    float _639 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _467);
    float _641 = -_617;
    float _643 = _641 + 1.0;
    float _645 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _635);
    float _647 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _637);
    float _649 = -_639;
    float _651 = _649 + 1.0;
    bool _653 = _627 >= 0.0;
    float _655 = -_645;
    float _657 = _655 + 1.0;
    float _659 = -_647;
    float _661 = _659 + 1.0;
    float _663 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[116].x, _569);
    float _665 = -_657;
    float _667 = fma(_465, _665, _521);
    float _669 = fma(_459, _661, _501);
    float _671 = -_643;
    float _673 = fma(_577, _671, _597);
    float _675 = _601 * _601;
    float _677 = fma(_607, _651, _633);
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _681 = fma(_587, _587, _675);
    float _683 = _663 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _685 = fma(_613, _613, _681);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _691 = rsqrt(_685);
    float _693 = _627;
    float _695 = _673;
    if (_653)
    {
        _693 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _697 = _693;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _707 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _719 = as_type<int>(_697);
    if (_653)
    {
        float _721 = _697 * 5.0;
        _719 = as_type<int>(_721);
    }
    int _723 = _719;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _731 = _729 != 0;
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _735 = _733 != 0;
    out.m_74.x = _707;
    out.m_74.y = _709;
    out.m_74.z = _711;
    out.m_74.w = _683;
    float _737 = _601 * _691;
    float _739 = _587 * _691;
    out.m_76.x = _713;
    out.m_76.y = _715;
    out.m_76.z = _717;
    out.m_76.w = _705;
    bool _741 = !_727;
    int _743 = _741 ? 0 : 1;
    bool _745 = !_731;
    int _747 = _745 ? 0 : 1;
    out.m_78.x = _667;
    out.m_78.y = _669;
    out.m_78.z = _673;
    out.m_78.w = _677;
    bool _749 = !_735;
    int _751 = _749 ? 0 : 1;
    if (_653)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4014 = as_type<float>(_723);
        out.gl_Position.z = _4014;
    }
    if (_653)
    {
        out.m_59.x = 0.0;
    }
    if (_653)
    {
        return out;
    }
    float _753 = -_737;
    float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _495);
    float _757 = _613 * _691;
    float _759 = -_739;
    float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _461);
    float _763 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _765 = _755 + _763;
    float _767 = -_757;
    float _769 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[18].w, _515);
    float _771 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _773 = _761 + _771;
    float _775 = _765 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _777 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _779 = _769 + _777;
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[28].x, _775);
    float _783 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[28].z, _781);
    bool _785 = _783 >= 0.0;
    if (_785)
    {
        _695 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _787 = _695;
    int _789 = as_type<int>(_787);
    if (_785)
    {
        out.m_59.x = 0.0;
    }
    if (_785)
    {
        float _791 = _787 * 5.0;
        _789 = as_type<int>(_791);
    }
    int _793 = _789;
    if (_785)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4108 = as_type<float>(_793);
        out.gl_Position.z = _4108;
    }
    if (_785)
    {
        return out;
    }
    float _795 = fma(_761, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _797 = fma(_769, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _799 = floor(_795);
    float _801 = floor(_797);
    float _803 = -_799;
    float _805 = _795 + _803;
    float _807 = -_801;
    float _809 = _797 + _807;
    float2 _4144 = float2(_805, _809);
    float _811 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4144, float2(0.0), isnan(_4144)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4144, float2(0.0), isnan(_4144)), level(0.0)).x;
    float _813 = _345 * 2.0;
    float _815 = _341 * 2.0;
    float _817 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _819 = log2(_817);
    float _821 = _343 * 2.0;
    int _823 = abs(_747);
    float _825 = -_737;
    float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[18].w, _601);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _831 = 1.0 + _829;
    float _833 = floor(_813);
    int _835 = abs(_751);
    float _837 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _839 = -_739;
    float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[18].w, _587);
    float _843 = _827 * _827;
    float _845 = -_757;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _613);
    float _849 = _755 + _837;
    float _851 = floor(_815);
    float _853 = fma(_841, _841, _843);
    float _855 = fma(_847, _847, _853);
    bool _857 = _833 > 0.0;
    float _859 = floor(_821);
    bool _861 = _833 >= 0.0;
    bool _863 = isnan(_833);
    bool _865 = _861 || _863;
    bool _867 = isnan(0.0);
    bool _869 = _865 || _867;
    int _871 = abs(_743);
    int _873 = _869 ? 0 : 1;
    bool _875 = _851 > 0.0;
    float _877 = 1.0 / _831;
    int _879 = ~_873;
    int _881 = _879 + 1;
    int _883 = _881 + 1;
    bool _885 = _851 >= 0.0;
    bool _887 = isnan(_851);
    bool _889 = _885 || _887;
    bool _891 = isnan(0.0);
    bool _893 = _889 || _891;
    float _895 = _819 * _147;
    int _897 = _883;
    int _899 = 2;
    if (!_857)
    {
        int _901 = ~_873;
        int _903 = _901 + 1;
        _897 = _903;
    }
    int _905 = _897;
    float _907 = float(_871);
    float _909 = sqrt(_855);
    float _911 = float(_905);
    float _913 = _343 + _345;
    int _915 = _893 ? 0 : 1;
    float _917 = float(_823);
    float _919 = _907 * _911;
    int _921 = ~_915;
    int _923 = _921 + 1;
    int _925 = _923 + 1;
    float _927 = in.m_80.x;
    float _929 = in.m_80.y;
    float _931 = in.m_80.z;
    float _933 = exp2(_895);
    int _935 = _925;
    if (!_875)
    {
        int _937 = ~_915;
        int _939 = _937 + 1;
        _935 = _939;
    }
    int _941 = _935;
    float _943 = _913 + (-1.0);
    bool _945 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _947 = isnan(1.0);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _953 = _949 || _951;
    bool _955 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _957 = isnan(0.0);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _963 = _959 || _961;
    float _965 = float(_941);
    float _967 = _919 * (-2.0);
    float _969 = _343 + _341;
    float _971 = _343 + (-0.5);
    float _973 = _691 * _909;
    float _975 = _917 * _965;
    float _977 = _969 + (-1.0);
    float _979 = -_933;
    float _981 = _979 + 1.0;
    float _983 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _985 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _987 = _341 + (-0.5);
    float _989 = _345 + _341;
    float _991 = _963 ? _981 : 0.0;
    float _993 = _345 + (-0.5);
    float _995 = fma(_967, _927, _927);
    bool _997 = _859 > 0.0;
    float _999 = fma(_985, _967, _985);
    if (_953)
    {
        float _1001 = _991 * _877;
        _151 = _1001;
    }
    float _1003 = _151;
    float _1005 = _975 * (-2.0);
    float _1007 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].x, _995);
    bool _1009 = _859 >= 0.0;
    bool _1011 = isnan(_859);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan(0.0);
    bool _1017 = _1013 || _1015;
    float _1019 = _989 + (-1.0);
    float _1021 = fma(_983, _1005, _983);
    float _1023 = fma(_999, _1003, _1007);
    float _1025 = fma(_1005, _929, _929);
    int _1027 = _1017 ? 0 : 1;
    float _1029 = _1023 * 0.15915493667125701904296875;
    float _1031 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1025);
    int _1033 = ~_1027;
    int _1035 = _1033 + 1;
    int _1037 = _1035 + 1;
    float _1039 = fma(_1021, _1003, _1031);
    int _1041 = _1037;
    if (!_997)
    {
        int _1043 = ~_1027;
        int _1045 = _1043 + 1;
        _1041 = _1045;
    }
    int _1047 = _1041;
    float _1049 = _1029 * 6.283185482025146484375;
    float _1051 = sin(_1049);
    float _1053 = float(_835);
    float _1055 = _1039 * 0.15915493667125701904296875;
    float _1057 = float(_1047);
    float _1059 = _755 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1061 = _1053 * _1057;
    float _1063 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1059);
    float _1065 = _1029 * 6.283185482025146484375;
    float _1067 = cos(_1065);
    float _1069 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1071 = _1061 * (-2.0);
    float _1073 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1063);
    float _1075 = _1055 * 6.283185482025146484375;
    float _1077 = sin(_1075);
    float _1079 = fma(_1071, _931, _931);
    float _1081 = fma(_1069, _1071, _1069);
    float _1083 = _755 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1085 = _849 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1087 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1079);
    float _1089 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1091 = _1055 * 6.283185482025146484375;
    float _1093 = cos(_1091);
    float _1095 = fma(_1081, _1003, _1087);
    float _1097 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1083);
    float _1099 = fma(_761, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1085);
    float _1101 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1097);
    float _1103 = 1.0 / _1089;
    float _1105 = _1095 * 0.15915493667125701904296875;
    float _1107 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1109 = in.m_82.x;
    float _1111 = in.m_82.y;
    float _1113 = fma(_769, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1099);
    float _1115 = _1067 * _1077;
    float _1117 = _1107 + _1089;
    float _1119 = _1105 * 6.283185482025146484375;
    float _1121 = cos(_1119);
    float _1123 = _1113 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1125 = _1067 * _1093;
    float _1127 = _1117 * _1103;
    float _1129 = _1127 * 0.5;
    float _1131 = _849 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1133 = _1105 * 6.283185482025146484375;
    float _1135 = sin(_1133);
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1139 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1137);
    float _1141 = fma(_761, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1131);
    float _1143 = _1067 * _1121;
    float _1145 = fma(_769, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1141);
    float _1147 = 1.0 / _1139;
    float _1149 = _287 * _1109;
    float _1151 = _289 * _1111;
    float _1153 = _1145 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1155 = _1051 * _1077;
    float _1157 = _1149 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1159 = _1051 * _1093;
    float _1161 = _1093 * _1121;
    float _1163 = trunc(_1123);
    int _1165 = int(_1163);
    float _1167 = _1051 * _1121;
    float _1169 = _1077 * _1121;
    float _1171 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1173 = _973 * _1157;
    float _1175 = -_1115;
    float _1177 = fma(_1135, _1159, _1175);
    float _1179 = -_1159;
    float _1181 = fma(_1135, _1115, _1179);
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1187 = _1147 * _1185;
    float _1189 = trunc(_1153);
    int _1191 = int(_1189);
    float _1193 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1195 = _1183 * _1173;
    float _1197 = fma(_1135, _1125, _1155);
    bool _1199 = _1187 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1201 = _973 * _1193;
    bool _1203 = _1187 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1205 = _973 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1207 = _1205 * 0.5;
    bool _1209 = !_1199;
    int _1211 = _1209 ? 0 : 1;
    float _1213 = _1171 * _1201;
    int _1215 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1217 = _1165 + _1215;
    int _1219 = _1217 + 1;
    float _1221 = fma(_1135, _1155, _1125);
    float _1223 = _1143 * _1213;
    bool _1225 = _1219 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1227 = -_1213;
    float _1229 = _1135 * _1227;
    int _1231 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1233 = _1191 + _1231;
    int _1235 = _1233 + 1;
    float _1237 = fma(_1197, _1195, _1223);
    int _1239 = _1219;
    int _1241 = _1235;
    float _1243 = _1123;
    if (!_1199)
    {
        _899 = 1;
    }
    int _1245 = _899;
    float _1247 = _1167 * _1213;
    int _1249 = _1245;
    if (!_1203)
    {
        _1249 = _1211;
    }
    int _1251 = _1249;
    float _1253 = fma(_1161, _1195, _1229);
    int _1255 = _1219 | _1235;
    float _1257 = fma(_1181, _1207, _1237);
    int _1259 = _1251 << 6;
    float _1261 = fma(_1177, _1195, _1247);
    bool _1263 = _1255 < 0;
    bool _1265 = _1263 || _1225;
    float _1267 = fma(_1169, _1207, _1253);
    int _1269 = _1259 + 96;
    uint _1272 = uint(int(uint(_1269) >> uint(2)));
    uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
    int _1276 = int(_1272) & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    int _1280 = int(_1272) + 1;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    int _1284 = _1280 & 3;
    float _1286 = (*spvDescriptorSet0.vp_c15)._m0[int(_1282)][_1284];
    float _1288 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1290 = _1235 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1292 = _1290 || _1265;
    float _1294 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1296 = fma(_1221, _1207, _1261);
    float _1298 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1288);
    bool _1300 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1302 = isnan(0.5);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1308 = _1304 || _1306;
    float _1310 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1294);
    int _1312 = _1259 + 104;
    uint _1314 = uint(int(uint(_1312) >> uint(2)));
    uint _1316 = uint(int(uint(int(_1314)) >> uint(2)));
    int _1318 = int(_1314) & 3;
    float _1320 = (*spvDescriptorSet0.vp_c15)._m0[int(_1316)][_1318];
    int _1322 = int(_1314) + 1;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    int _1326 = _1322 & 3;
    float _1328 = (*spvDescriptorSet0.vp_c15)._m0[int(_1324)][_1326];
    float _1330 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1298);
    float _1332 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1310);
    float _1334 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1336 = as_type<float>(_1251);
    if (!_1292)
    {
        int _1338 = _1235 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1340 = _1338 + _1219;
        _1239 = _1340;
    }
    int _1342 = _1239;
    int _1344 = _1259 + 48;
    uint _1346 = uint(int(uint(_1344) >> uint(2)));
    uint _1348 = uint(int(uint(int(_1346)) >> uint(2)));
    int _1350 = int(_1346) & 3;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[int(_1348)][_1350];
    int _1354 = int(_1346) + 1;
    uint _1356 = uint(int(uint(_1354) >> uint(2)));
    int _1358 = _1354 & 3;
    float _1360 = (*spvDescriptorSet0.vp_c15)._m0[int(_1356)][_1358];
    float _1362 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1364 = _515 + _1334;
    float _1366 = 0.0;
    float _1368 = _1364;
    float _1370 = as_type<float>(_1342);
    if (!_1292)
    {
        float _1372 = floor(_1123);
        _1366 = _1372;
    }
    float _1374 = _1366;
    int _1376 = 0;
    if (!_1292)
    {
        int _1378 = _1342 << 2;
        _1376 = _1378;
    }
    int _1380 = _1376;
    float _1382 = _461 + _1362;
    int _1384 = _1380;
    float _1386 = _1382;
    if (!_1292)
    {
        uint _1388 = uint(int(uint(_1342) >> uint(2)));
        _1241 = int(_1388);
    }
    int _1390 = _1241;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1394 = _1364 + _1392;
    int _1396 = _1259 + 64;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    uint _1400 = uint(int(uint(int(_1398)) >> uint(2)));
    int _1402 = int(_1398) & 3;
    float _1404 = (*spvDescriptorSet0.vp_c15)._m0[int(_1400)][_1402];
    int _1406 = int(_1398) + 1;
    uint _1408 = uint(int(uint(_1406) >> uint(2)));
    int _1410 = _1406 & 3;
    float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
    if (!_1292)
    {
        int _1414 = 12 & _1380;
        _1384 = _1414;
    }
    int _1416 = _1384;
    float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1420 = _1382 + _1418;
    float _1422 = _1394 * _1394;
    float _1424 = 0.0;
    if (!_1292)
    {
        int _1426 = _1390 << 4;
        int _1428 = _1426 + _1416;
        _1424 = as_type<float>(_1428);
    }
    float _1430 = _1424;
    float _1432 = fma(_1420, _1420, _1422);
    int _1434 = _1259 + 56;
    uint _1436 = uint(int(uint(_1434) >> uint(2)));
    uint _1438 = uint(int(uint(int(_1436)) >> uint(2)));
    int _1440 = int(_1436) & 3;
    float _1442 = (*spvDescriptorSet0.vp_c15)._m0[int(_1438)][_1440];
    int _1444 = int(_1436) + 1;
    uint _1446 = uint(int(uint(_1444) >> uint(2)));
    int _1448 = _1444 & 3;
    float _1450 = (*spvDescriptorSet0.vp_c15)._m0[int(_1446)][_1448];
    float _1452 = sqrt(_1432);
    int _1454 = _1259 + 72;
    uint _1456 = uint(int(uint(_1454) >> uint(2)));
    uint _1458 = uint(int(uint(int(_1456)) >> uint(2)));
    int _1460 = int(_1456) & 3;
    float _1462 = (*spvDescriptorSet0.vp_c15)._m0[int(_1458)][_1460];
    int _1464 = int(_1456) + 1;
    uint _1466 = uint(int(uint(_1464) >> uint(2)));
    int _1468 = _1464 & 3;
    float _1470 = (*spvDescriptorSet0.vp_c15)._m0[int(_1466)][_1468];
    int _1472 = _1259 + 80;
    uint _1474 = uint(int(uint(_1472) >> uint(2)));
    uint _1476 = uint(int(uint(int(_1474)) >> uint(2)));
    int _1478 = int(_1474) & 3;
    float _1480 = (*spvDescriptorSet0.vp_c15)._m0[int(_1476)][_1478];
    int _1482 = int(_1474) + 1;
    uint _1484 = uint(int(uint(_1482) >> uint(2)));
    int _1486 = _1482 & 3;
    float _1488 = (*spvDescriptorSet0.vp_c15)._m0[int(_1484)][_1486];
    float _1490 = _849 * _1286;
    bool _1492 = _1452 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1494 = fma(_761, _1278, _1490);
    float _1496 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1498 = _1259 + 88;
    uint _1500 = uint(int(uint(_1498) >> uint(2)));
    uint _1502 = uint(int(uint(int(_1500)) >> uint(2)));
    int _1504 = int(_1500) & 3;
    float _1506 = (*spvDescriptorSet0.vp_c15)._m0[int(_1502)][_1504];
    int _1508 = int(_1500) + 1;
    uint _1510 = uint(int(uint(_1508) >> uint(2)));
    int _1512 = _1508 & 3;
    float _1514 = (*spvDescriptorSet0.vp_c15)._m0[int(_1510)][_1512];
    float _1516 = fma(_769, _1320, _1494);
    float _1518 = _1257;
    if (!_1292)
    {
        float _1520 = floor(_1153);
        _1518 = _1520;
    }
    float _1522 = _1518;
    float _1524 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1496);
    float _1526 = _1516 + _1328;
    float _1528 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1524);
    float _1530 = _1430;
    if (!_1292)
    {
        int _1532 = as_type<int>(_1430) + 400;
        uint _1534 = uint(int(uint(_1532) >> uint(2)));
        uint _1536 = uint(int(uint(int(_1534)) >> uint(2)));
        int _1538 = int(_1534) & 3;
        float _1540 = (*spvDescriptorSet0.vp_c15)._m0[int(_1536)][_1538];
        _1530 = _1540;
    }
    float _1542 = _1530;
    float _1544 = _849 * _1360;
    float _1546 = 1.0 / _1526;
    float _1548 = fma(_761, _1352, _1544);
    float _1550 = _1528 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1552 = _849 * _1412;
    float _1554 = _495 + _1550;
    float _1556 = fma(_761, _1404, _1552);
    float _1558 = fma(_769, _1442, _1548);
    float _1560 = fma(_769, _1462, _1556);
    bool _1562 = !_1492;
    float _1564 = _1554;
    float _1566 = _1404;
    float _1568 = _1558;
    float _1570 = _1450;
    float _1572 = _1560;
    float _1574 = _1522;
    if (!_1562)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1580 = _1452 + _1578;
        float _1582 = _1554 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1584 = rsqrt(_1432);
        float _1586 = _1580 * _1576;
        float _1588 = _1586 * 0.15915493667125701904296875;
        float _1590 = _1588 * 6.283185482025146484375;
        float _1592 = cos(_1590);
        float _1594 = _1588 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        float _1598 = _1592 + (-1.0);
        float _1600 = fma(_1596, _1582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1602 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1604 = _1584 * _1600;
        float _1606 = fma(_1554, _1592, _1602);
        float _1608 = fma(_1420, _1604, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1610 = fma(_1394, _1604, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1386 = _1608;
        _1564 = _1606;
        _1368 = _1610;
        _1566 = _1588;
    }
    float _1612 = _1386;
    float _1614 = _1564;
    float _1616 = _1368;
    float _1618 = _1566;
    float _1620 = -_739;
    float _1622 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1612);
    float _1624 = -_737;
    float _1626 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1614);
    float _1628 = -_757;
    float _1630 = fma(_1628, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1616);
    float _1632 = _1558 + _1450;
    float _1634 = _1560 + _1470;
    float _1636 = _1618;
    float _1638 = _1630;
    float _1640 = _1626;
    if (_1308)
    {
        _1568 = _1622;
    }
    float _1642 = _1568;
    float _1644 = _1642;
    if (_1308)
    {
        _1570 = _1626;
    }
    float _1646 = _1570;
    float _1648 = _1646;
    if (_1308)
    {
        _1572 = _1630;
    }
    float _1650 = _1572;
    float _1652 = _1650;
    if (!_1308)
    {
        float _1654 = _765 * _765;
        float _1656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1658 = -_515;
        float _1660 = _1658 + _1616;
        float _1662 = -_495;
        float _1664 = _1662 + _1614;
        float _1666 = fma(_773, _773, _1654);
        float _1668 = -_461;
        float _1670 = _1668 + _1612;
        float _1672 = fma(_779, _779, _1666);
        float _1674 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1676 = sqrt(_1672);
        float _1678 = 1.0 / _973;
        float _1680 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1682 = precise::min(_1676, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1684 = _1682 * _1656;
        float _1686 = _1684 * _1678;
        float _1688 = _1680 * _1686;
        float _1690 = _1660 * _1686;
        float _1692 = fma(_1664, _1688, _755);
        float _1694 = fma(_1670, _1688, _761);
        float _1696 = fma(_1680, _1690, _769);
        _1648 = _1692;
        _1644 = _1694;
        _1652 = _1696;
        _1636 = _1656;
    }
    float _1698 = _1648;
    float _1700 = _1644;
    float _1702 = _1652;
    float _1704 = _1636;
    float _1706 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1708 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1710 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1712 = _1632 * _1546;
    float _1714 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1706);
    float _1716 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1708);
    float _1718 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1710);
    float _1720 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1722 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1714);
    bool _1724 = _1712 >= 0.0;
    float _1726 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1716);
    float _1728 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1718);
    float _1730 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1732 = _1634 * _1546;
    bool _1734 = _1712 <= 1.0;
    bool _1736 = _1734 && _1724;
    float _1738 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1740 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1720);
    float _1742 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1744 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1746 = _1732 >= 0.0;
    bool _1748 = _1746 && _1736;
    float _1750 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1740);
    float _1752 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1754 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1744);
    float _1756 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1758 = _1732 <= 1.0;
    bool _1760 = _1758 && _1748;
    float _1762 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1764 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1754);
    float _1766 = -_1756;
    float _1768 = fma(_1766, _1752, 1.0);
    float _1770 = _849 * _1488;
    float _1772 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1774 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1764);
    float _1776 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1778 = fma(_761, _1480, _1770);
    float _1780 = log2(_1768);
    float _1782 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1772);
    float _1784 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1776);
    float _1786 = fma(_769, _1506, _1778);
    if (_1760)
    {
        float _1788 = float(_1251);
        _1336 = _1788;
    }
    float _1790 = _1336;
    float _1792 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1782);
    float _1794 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1784);
    float _1796 = _1786 + _1514;
    float _1798 = 1.0 / _1774;
    float _1800 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1792);
    float _1802 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1794);
    float _1804 = _1794;
    float _1806 = _1800;
    if (!_1292)
    {
        float _1808 = -_1522;
        float _1810 = _1153 + _1808;
        _1574 = _1810;
    }
    float _1812 = _1574;
    if (!_1292)
    {
        float _1814 = -_1374;
        float _1816 = _1123 + _1814;
        _1804 = _1816;
    }
    float _1818 = _1804;
    float _1820 = _1796 * _1546;
    float _1822 = _1704;
    if (!_1292)
    {
        float _1824 = rint(_1542);
        float _1826 = precise::max(_1824, 0.0);
        uint _1828 = uint(_1826);
        uint _1830 = clamp(_1828, 0u, 65535u);
        _1822 = as_type<float>(_1830);
    }
    float _1832 = _1822;
    float _1834 = _1780 * 0.693147182464599609375;
    float _1836 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1838 = _1772;
    float _1840 = _1836;
    if (_1760)
    {
        float _1842 = rint(_1790);
        float _1844 = precise::max(_1842, 0.0);
        uint _1846 = uint(_1844);
        uint _1848 = clamp(_1846, 0u, 65535u);
        _1838 = as_type<float>(_1848);
    }
    float _1850 = _1838;
    float _1852 = _1800 * _1798;
    float _1854 = _1802 * _1798;
    float _1856 = fma(_1852, 0.5, 0.5);
    float _1858 = fma(_1854, -0.5, 0.5);
    float _1860 = _1374;
    float _1862 = _1858;
    float _1864 = _1856;
    if (!_1292)
    {
        float3 _5808 = float3(_1818, _1812, float(as_type<int>(_1832)));
        float3 _5812 = select(_5808, float3(0.0), isnan(_5808));
        float _1866 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5812.xy, uint(rint(_5812.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5812.xy, uint(rint(_5812.z)), level(0.0)).x;
        _1860 = _1866;
    }
    float _1868 = _1860;
    float _1870 = _1732;
    if (_1760)
    {
        float3 _5827 = float3(_1712, _1732, float(as_type<int>(_1850)));
        float3 _5829 = select(_5827, float3(0.0), isnan(_5827));
        float _1872 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5829.xy, uint(rint(_5829.z)), _1820, level(0.0));
        _1870 = _1872;
    }
    float _1874 = _1870;
    float3 _5839 = float3(_1856, _1858, _1836);
    float _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5839, float3(0.0), isnan(_5839)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5839, float3(0.0), isnan(_5839)), level(0.0)).x;
    float3 _5848 = float3(_1856, _1858, _1836);
    float4 _1879 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5848, float3(0.0), isnan(_5848)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5848, float3(0.0), isnan(_5848)), level(0.0)).xyzw;
    float _1881 = _1879.x;
    float _1883 = _1879.y;
    float _1885 = _1879.z;
    float _1887 = _1879.w;
    bool _1889 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1891 = isnan(0.5);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1897 = _1893 || _1895;
    if (_1292)
    {
        _1638 = 1.0;
    }
    float _1899 = _1638;
    float _1901 = _1899;
    if (_1897)
    {
        _1243 = 1.0;
    }
    float _1903 = _1243;
    float _1905 = _1903;
    if (_1897)
    {
        _1640 = 1.0;
    }
    float _1907 = _1640;
    float _1909 = _1907;
    if (!_1897)
    {
        float _1911 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1913 = _1911 * 0.15915493667125701904296875;
        float _1915 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1917 = _1913 * 6.283185482025146484375;
        float _1919 = cos(_1917);
        float _1921 = _1915 * 0.15915493667125701904296875;
        float _1923 = _1913 * 6.283185482025146484375;
        float _1925 = sin(_1923);
        float _1927 = 1.0 / _1919;
        float _1929 = _1921 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        float _1933 = _1925 * _1927;
        float _1935 = _1921 * 6.283185482025146484375;
        float _1937 = sin(_1935);
        float _1939 = _1931 * _1933;
        float _1941 = 1.0 / _1939;
        float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1945 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1943;
        float _1947 = 1.0 / _1945;
        float _1949 = _1937 * _1941;
        float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1953 = fma(_1187, _1949, _1951);
        float _1955 = _1953 * _1947;
        float _1957 = precise::clamp(_1955, 0.0, 1.0);
        _1862 = _1953;
        _1864 = _1921;
        _1909 = _1957;
    }
    float _1959 = _1862;
    float _1961 = _1864;
    float _1963 = _1909;
    float _1965 = _1961;
    float _1967 = _1959;
    if (!_1897)
    {
        float _1969 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1971 = _1969 * 0.15915493667125701904296875;
        float _1973 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1975 = _1971 * 6.283185482025146484375;
        float _1977 = cos(_1975);
        float _1979 = _1973 * 0.15915493667125701904296875;
        float _1981 = _1971 * 6.283185482025146484375;
        float _1983 = sin(_1981);
        float _1985 = 1.0 / _1977;
        float _1987 = _1979 * 6.283185482025146484375;
        float _1989 = cos(_1987);
        float _1991 = _1983 * _1985;
        float _1993 = _1979 * 6.283185482025146484375;
        float _1995 = sin(_1993);
        float _1997 = _1989 * _1991;
        float _1999 = 1.0 / _1997;
        float _2001 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2003 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2001;
        float _2005 = 1.0 / _2003;
        float _2007 = _1995 * _1999;
        float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2011 = fma(_1187, _2007, _2009);
        float _2013 = _2011 * _2005;
        float _2015 = precise::clamp(_2013, 0.0, 1.0);
        float _2017 = -_2015;
        float _2019 = _2017 + 1.0;
        _1965 = _1997;
        _1967 = _1985;
        _1905 = _2019;
    }
    float _2021 = _1965;
    float _2023 = _1967;
    float _2025 = _1905;
    if (!_1292)
    {
        int _2027 = _1342 << 4;
        int _2029 = _2027 + 2048;
        uint _2031 = uint(int(uint(_2029) >> uint(2)));
        uint _2033 = uint(int(uint(int(_2031)) >> uint(2)));
        int _2035 = int(_2031) & 3;
        float _2037 = (*spvDescriptorSet0.vp_c15)._m0[int(_2033)][_2035];
        int _2039 = int(_2031) + 1;
        uint _2041 = uint(int(uint(_2039) >> uint(2)));
        int _2043 = _2039 & 3;
        float _2045 = (*spvDescriptorSet0.vp_c15)._m0[int(_2041)][_2043];
        int _2047 = _2029 + 8;
        uint _2049 = uint(int(uint(_2047) >> uint(2)));
        uint _2051 = uint(int(uint(int(_2049)) >> uint(2)));
        int _2053 = int(_2049) & 3;
        float _2055 = (*spvDescriptorSet0.vp_c15)._m0[int(_2051)][_2053];
        int _2057 = int(_2049) + 1;
        uint _2059 = uint(int(uint(_2057) >> uint(2)));
        int _2061 = _2057 & 3;
        float _2063 = (*spvDescriptorSet0.vp_c15)._m0[int(_2059)][_2061];
        float _2065 = _849 * _2045;
        float _2067 = fma(_761, _2037, _2065);
        float _2069 = fma(_769, _2055, _2067);
        float _2071 = _2069 + _2063;
        float _2073 = precise::clamp(_2071, 0.0, 1.0);
        float _2075 = -_2073;
        float _2077 = _2075 + _1868;
        float _2079 = fma(_2077, 500.0, 1.5);
        float _2081 = exp2(_2079);
        float _2083 = 0.0 + _2081;
        float _2085 = precise::clamp(_2083, 0.0, 1.0);
        _1370 = as_type<float>(_2029);
        _1901 = _2085;
    }
    float _2087 = _1370;
    float _2089 = _1901;
    float _2091 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2093 = _1698 + _2091;
    float _2095 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2097 = _1700 + _2095;
    float _2099 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2101 = _1702 + _2099;
    float _2103 = _2093 * _2093;
    float _2105 = fma(_2097, _2097, _2103);
    float _2107 = fma(_2101, _2101, _2105);
    float _2109 = rsqrt(_2107);
    float _2111 = sqrt(_2107);
    float _2113 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2115 = _2097 * _2113;
    float _2117 = _2101 * _2113;
    float _2119 = _2115 * _2115;
    float _2121 = _2117 * _2117;
    float _2123 = _2119 + _2121;
    float _2125 = sqrt(_2123);
    bool _2127 = _2125 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2129 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2131 = _2125 + _2129;
    float _2133 = _2021;
    float _2135 = _2123;
    float _2137 = _2131;
    float _2139 = _2115;
    float _2141 = _2117;
    float _2143 = _2119;
    float _2145 = _2121;
    if (_2127)
    {
        float _2147 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2133 = _2147;
    }
    float _2149 = _2133;
    if (_2127)
    {
        float _2151 = rsqrt(_2123);
        _2135 = _2151;
    }
    float _2153 = _2135;
    if (_2127)
    {
        float _2155 = _2131 * _2149;
        _2137 = _2155;
    }
    float _2157 = _2137;
    if (_2127)
    {
        float _2159 = _2157 * 0.15915493667125701904296875;
        _1840 = _2159;
    }
    float _2161 = _1840;
    float _2163 = _2023;
    if (_2127)
    {
        float _2165 = _2161 * 6.283185482025146484375;
        float _2167 = sin(_2165);
        _2163 = _2167;
    }
    float _2169 = _2163;
    float _2171 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2173 = precise::max(0.0, _2171);
    float _2175 = _2087;
    float _2177 = _2173;
    float _2179 = _2171;
    if (_2127)
    {
        float _2181 = _2161 * 6.283185482025146484375;
        float _2183 = cos(_2181);
        _2175 = _2183;
    }
    float _2185 = _2175;
    float _2187 = -_2113;
    float _2189 = -_2173;
    float _2191 = fma(_2093, _2187, _2189);
    float _2193 = _2191;
    if (_2127)
    {
        float _2195 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2177 = _2195;
    }
    float _2197 = _2177;
    float _2199 = _2169;
    float _2201 = _2197;
    if (_2127)
    {
        float _2203 = fma(_2169, _2197, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2199 = _2203;
    }
    float _2205 = _2199;
    float _2207 = _2205;
    if (_2127)
    {
        float _2209 = _2185 + (-1.0);
        _2179 = _2209;
    }
    float _2211 = _2179;
    if (_2127)
    {
        float _2213 = _2153 * _2205;
        _2207 = _2213;
    }
    float _2215 = _2207;
    if (_2127)
    {
        float _2217 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2201 = _2217;
    }
    float _2219 = _2201;
    if (_2127)
    {
        float _2221 = _2115 * _2215;
        _2139 = _2221;
    }
    float _2223 = _2139;
    if (_2127)
    {
        float _2225 = _2117 * _2215;
        _2141 = _2225;
    }
    float _2227 = _2141;
    if (_2127)
    {
        float _2229 = fma(_2191, _2185, _2219);
        _2193 = _2229;
    }
    float _2231 = _2193;
    if (_2127)
    {
        float _2233 = _2223 * _2223;
        _2143 = _2233;
    }
    float _2235 = _2143;
    if (_2127)
    {
        float _2237 = _2227 * _2227;
        _2145 = _2237;
    }
    float _2239 = _2145;
    float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2243 = fma(_2111, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2241);
    float _2245 = precise::clamp(_2243, 0.0, 1.0);
    float _2247 = fma(_2231, _2231, _2235);
    float _2249 = -_2245;
    float _2251 = _2249 + 1.0;
    float _2253 = _2247 + _2239;
    float _2255 = rsqrt(_2253);
    float _2257 = _2255 * _2231;
    float _2259 = _2255 * _2223;
    float _2261 = abs(_2251);
    float _2263 = log2(_2261);
    float _2265 = _2255 * _2227;
    float _2267 = _2259 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2269 = -_2267;
    float _2271 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2269);
    float _2273 = -_2265;
    float _2275 = fma(_2273, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2271);
    float _2277 = fma(_2275, -0.5, 0.5);
    float _2279 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2281 = fma(_2275, 0.5, 0.5);
    float _2283 = _2257 + 1.0;
    float _2285 = sqrt(_2277);
    float _2287 = fma(_2281, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2289 = fma(_2281, _2287, -0.212114393711090087890625);
    float _2291 = exp2(_2279);
    float _2293 = fma(_2281, _2289, 1.570728778839111328125);
    float _2295 = _2285 * 0.636619746685028076171875;
    float _2297 = -_2293;
    float _2299 = fma(_2295, _2297, 1.0);
    float _2301 = -_2257;
    float _2303 = fma(_2291, _2283, _2301);
    float _2305 = fma(_2303, 0.5, 0.5);
    float2 _6466 = float2(_2299, _2305);
    float3 _2309 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6466, float2(0.0), isnan(_6466)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6466, float2(0.0), isnan(_6466)), level(0.0)).xyz;
    float _2311 = _2309.x;
    float _2313 = _2309.y;
    float _2315 = _2309.z;
    float _2317 = abs(_1187);
    float _2319 = log2(_2317);
    float _2321 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2323 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2325 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2327 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2329 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2331 = -_1135;
    float _2333 = fma(_2331, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2321);
    float _2335 = -_1135;
    float _2337 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2323);
    float _2339 = -_1135;
    float _2341 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2325);
    float _2343 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2345 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2347 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2349 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2351 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2353 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2327);
    float _2355 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2329);
    float _2357 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2359 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2343);
    float _2361 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2345);
    float _2363 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2351);
    float _2365 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2347);
    float _2367 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2349);
    float _2369 = exp2(_2357);
    float _2371 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2333);
    float _2373 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2337);
    float _2375 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2377 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2341);
    float _2379 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2353);
    float _2381 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2355);
    float _2383 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2359);
    float _2385 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2361);
    float _2387 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2363);
    float _2389 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2365);
    float _2391 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2367);
    float _2393 = _2375 * _2371;
    float _2395 = _2375 * _2373;
    float _2397 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2399 = _2375 * _2377;
    float _2401 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2403 = fma(_2397, _2379, _2393);
    float _2405 = fma(_2397, _2381, _2395);
    float _2407 = fma(_2397, _2383, _2399);
    float _2409 = fma(_2369, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2411 = precise::clamp(_2409, 0.0, 1.0);
    float _2413 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2387);
    float _2415 = _1774 * 0.5;
    float _2417 = exp2(_2401);
    float _2419 = fma(_2411, -2.0, 3.0);
    float _2421 = _2411 * _2411;
    float _2423 = fma(_1802, -0.5, _2415);
    out.gl_Position.x = _1800;
    out.gl_Position.y = _1802;
    out.gl_Position.z = _2413;
    out.gl_Position.w = _1774;
    bool _2425 = _1187 <= 8000.0;
    bool _2427 = isnan(_1187);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan(8000.0);
    bool _2433 = _2429 || _2431;
    float _2435 = float(_2433);
    float _2437 = _2421 * _2419;
    float _2439 = _2413 + _1774;
    float _2441 = -_811;
    float _2443 = _2441 + 1.0;
    float _2445 = _1800 + _1774;
    float _2447 = _2439 * 0.5;
    float _2449 = _2385 + _2403;
    float _2451 = _2445 * 0.5;
    float _2453 = _2389 + _2405;
    float _2455 = _2391 + _2407;
    bool _2457 = _2111 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2459 = isnan(_2111);
    bool _2461 = _2457 || _2459;
    bool _2463 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2465 = _2461 || _2463;
    float _2467 = -_2437;
    float _2469 = _2467 + 1.0;
    float _2471 = -_2417;
    float _2473 = _2471 + 1.0;
    if (!_1760)
    {
        _1806 = 1.0;
    }
    float _2475 = _1806;
    out.m_84.x = _2451;
    out.m_84.y = _2423;
    out.m_84.z = _2447;
    out.m_84.w = _1774;
    float _2477 = fma(_2469, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2437);
    float _2479 = _2475;
    float _2481 = _2313;
    float _2483 = _2311;
    if (_1760)
    {
        bool _2485 = _1874 >= _1820;
        bool _2487 = isnan(_1874);
        bool _2489 = _2485 || _2487;
        bool _2491 = isnan(_1820);
        bool _2493 = _2489 || _2491;
        float _2495 = float(_2493);
        _2479 = _2495;
    }
    float _2497 = _2479;
    float _2499 = _2473 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _2449;
    out.m_86.y = _2453;
    out.m_86.z = _2455;
    float _2501 = _2435 * _2477;
    float _2503 = _2499 * _1876;
    float _2505 = _2497 * _2089;
    float _2507 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2509 = -_2499;
    float _2511 = _2509 + 1.0;
    float _2513 = _1887 * _2503;
    float _2515 = _2499;
    float _2517 = _2511;
    if (!_2465)
    {
        _2515 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2519 = _2515;
    float _2521 = _2443 * _2507;
    float _2523 = precise::clamp(_2521, 0.0, 1.0);
    float _2525 = -_2523;
    float _2527 = fma(_2525, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2529 = -_2505;
    float _2531 = fma(_2529, _2527, 1.0);
    float _2533 = precise::clamp(_2531, 0.0, 1.0);
    float _2535 = _2527;
    float _2537 = _2519;
    float _2539 = _2519;
    if (!_2465)
    {
        _2535 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2541 = _2535;
    float _2543 = _2315 * _2503;
    float _2545 = fma(_2311, _2513, _1881);
    float _2547 = fma(_2313, _2513, _1883);
    float _2549 = _2533 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2551 = _1887 * _2511;
    float _2553 = fma(_1887, _2543, _1885);
    float _2555 = _1963 * _2025;
    float _2557 = _2555;
    float _2559 = _2541;
    float _2561 = _2541;
    if (!_2465)
    {
        _2481 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2563 = _2481;
    out.m_88.x = _2549;
    float _2565 = _2563;
    float _2567 = _2563;
    if (!_2465)
    {
        _2483 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2569 = _2483;
    float _2571 = _2555 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2573 = _2569;
    float _2575 = _2569;
    if (!_2465)
    {
        _2517 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2577 = _2517;
    out.m_90.x = _2545;
    out.m_90.y = _2547;
    out.m_90.z = _2553;
    out.m_90.w = _2551;
    float _2579 = _2577;
    float _2581 = _2577;
    if (!_2465)
    {
        _2557 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2583 = _2557;
    bool _2585 = !_2465;
    float _2587 = _2583;
    float _2589 = _2583;
    if (!_2585)
    {
        bool _2591 = _2111 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2593 = isnan(_2111);
        bool _2595 = _2591 || _2593;
        bool _2597 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2599 = _2595 || _2597;
        if (!_2599)
        {
            float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2603 = _2111 + _2601;
            float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2607 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2605;
            float _2609 = 1.0 / _2607;
            float _2611 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2615 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2621 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2629 = _2627 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2631 = _2603 * _2609;
            float _2633 = precise::clamp(_2631, 0.0, 1.0);
            float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2639 = fma(_2633, _2613, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2641 = fma(_2633, _2637, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2643 = fma(_2633, _2617, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2645 = fma(_2633, _2621, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2647 = fma(_2633, _2625, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2649 = fma(_2633, _2629, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2575 = _2641;
            _2561 = _2647;
            _2567 = _2639;
            _2581 = _2645;
            _2539 = _2643;
            _2589 = _2649;
            _2651 = true;
        }
        else
        {
            bool _2653 = _2111 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2655 = isnan(_2111);
            bool _2657 = _2653 || _2655;
            bool _2659 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2661 = _2657 || _2659;
            if (!_2661)
            {
                _2565 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2663 = _2565;
            _2567 = _2663;
            if (!_2661)
            {
                _2573 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2665 = _2573;
            _2575 = _2665;
            if (!_2661)
            {
                _2537 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2667 = _2537;
            _2539 = _2667;
            if (!_2661)
            {
                _2579 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2669 = _2579;
            _2581 = _2669;
            if (!_2661)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2671 = _2559;
            _2561 = _2671;
            if (!_2661)
            {
                _2587 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2673 = _2587;
            bool _2675 = !_2661;
            _2589 = _2673;
            if (!_2675)
            {
                bool _2677 = _2111 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2679 = isnan(_2111);
                bool _2681 = _2677 || _2679;
                bool _2683 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2685 = _2681 || _2683;
                if (!_2685)
                {
                    float _2687 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2689 = _2111 + _2687;
                    float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2693 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2691;
                    float _2695 = 1.0 / _2693;
                    float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2707 = _2705 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2713 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2715 = _2713 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2717 = _2689 * _2695;
                    float _2719 = precise::clamp(_2717, 0.0, 1.0);
                    float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2723 = _2721 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2725 = fma(_2719, _2699, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2727 = fma(_2719, _2723, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2729 = fma(_2719, _2703, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2731 = fma(_2719, _2707, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2733 = fma(_2719, _2711, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2735 = fma(_2719, _2715, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2575 = _2727;
                    _2561 = _2733;
                    _2567 = _2725;
                    _2581 = _2731;
                    _2539 = _2729;
                    _2589 = _2735;
                    _2651 = true;
                }
                else
                {
                    _2575 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2567 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2581 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2539 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2589 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2651 = false;
    float _2737 = _2575;
    float _2739 = _2561;
    float _2741 = _2567;
    float _2743 = _2581;
    float _2745 = _2539;
    float _2747 = _2589;
    float _2749 = fma(_2453, -0.5, 0.5);
    float _2751 = precise::clamp(_2749, 0.0, 1.0);
    float _2753 = -_2737;
    float _2755 = _2753 + _2739;
    float _2757 = -_2741;
    float _2759 = _2757 + _2743;
    out.m_92.x = 0.0;
    float _2761 = fma(_2751, _2755, _2737);
    float _2763 = -_2745;
    float _2765 = _2763 + _2747;
    float _2767 = fma(_2751, _2759, _2741);
    float _2769 = _2761 * 0.586610972881317138671875;
    bool _2771 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2773 = fma(_2751, _2765, _2745);
    float _2775 = _2571 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2777 = fma(_2767, 0.298911988735198974609375, _2769);
    bool _2779 = _1963 > 0.0;
    bool _2781 = isnan(_1963);
    bool _2783 = _2779 || _2781;
    bool _2785 = isnan(0.0);
    bool _2787 = _2783 || _2785;
    float _2789 = fma(_2773, 0.114477999508380889892578125, _2777);
    out.m_59.x = _2775;
    bool _2791 = _2025 <= 0.0;
    bool _2793 = !_2787;
    bool _2795 = _2791 || _2793;
    float _2797 = -_2789;
    float _2799 = _2767 + _2797;
    float _2801 = -_2789;
    float _2803 = _2773 + _2801;
    float _2805 = fma(_2799, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2789);
    float _2807 = -_2789;
    float _2809 = _2761 + _2807;
    float _2811 = fma(_2803, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2789);
    float _2813 = fma(_2809, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2789);
    bool _2815 = !_2771;
    if (!_2815)
    {
        float _2817 = -_1698;
        float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2821 = -_1700;
        float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2825 = -_1702;
        float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2829 = _2819 * _2819;
        float _2831 = fma(_2823, _2823, _2829);
        float _2833 = fma(_2827, _2827, _2831);
        float _2835 = sqrt(_2833);
        float _2837 = rsqrt(_2833);
        float _2839 = -_2835;
        float _2841 = _2839 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2843 = _2841 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2845 = precise::clamp(_2843, 0.0, 1.0);
        float _2847 = _2823 * _2837;
        float _2849 = _2819 * _2837;
        float _2851 = abs(_2845);
        float _2853 = log2(_2851);
        float _2855 = _2827 * _2837;
        float _2857 = _2847 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2859 = _2453 * _2849;
        float _2861 = -_2849;
        float _2863 = -_2857;
        float _2865 = fma(_2861, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2863);
        float _2867 = fma(_2449, _2847, _2859);
        float _2869 = -_2855;
        float _2871 = fma(_2869, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2865);
        float _2873 = fma(_2455, _2855, _2867);
        float _2875 = precise::clamp(_2873, 0.0, 1.0);
        float _2877 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2879 = _2871 + _2877;
        float _2881 = _2853 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2883 = _2879 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2885 = precise::clamp(_2883, 0.0, 1.0);
        float _2887 = exp2(_2881);
        float _2889 = _2887 * _2885;
        float _2891 = _2875 * _2889;
        float _2893 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2895 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2897 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2893;
        out.m_92.y = _2895;
        out.m_92.z = _2897;
    }
    out.m_94.x = _2805;
    out.m_94.y = _2813;
    out.m_94.z = _2811;
    if (!_2795)
    {
        return out;
    }
    float _2899 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2899;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2651 = false;
    bool _311 = false;
    bool _209 = false;
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
        float _2956 = as_type<float>(_129);
        out.gl_Position.z = _2956;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3025 = as_type<float>(_167);
        out.gl_Position.z = _3025;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _173 = as_type<int>(_169) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_169) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _207;
    if (!_189)
    {
        float _191 = in.m_66.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_113);
        float _213 = 1.0 / _211;
        float _215 = _147 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _217 + _219;
    bool _223 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _225 = isnan(_217);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    float _239 = -_233;
    float _241 = _239 + 1.0;
    bool _243 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _245 = isnan(_217);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _255;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _261 = 1.0 / _237;
    float _263 = _253 * _241;
    float _265 = -_253;
    float _267 = _265 + 1.0;
    float _269 = _221 * _261;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _271;
    float _275 = fma(_257, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _277 = fma(_273, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _279 = _275 * _263;
    float _281 = _277 * _263;
    float _283 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].x, _279);
    float _285 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].y, _281);
    float _287 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[144].x, _283);
    float _289 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[144].y, _285);
    bool _291 = !_259;
    float _309;
    if (!_291)
    {
        float _293 = in.m_66.x;
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _297 = _293 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _301 = _299 * _295;
        float _303 = floor(_301);
        float _305 = -_303;
        float _307 = _301 + _305;
        _309 = _307;
        _311 = true;
    }
    else
    {
        float _313 = float(_113);
        float _315 = 1.0 / _313;
        float _317 = _147 * _315;
        _309 = _317;
    }
    _311 = false;
    float _319 = _309;
    float _321 = in.m_56.x;
    float _323 = in.m_56.y;
    float _325 = in.m_56.z;
    float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _329 = in.m_68.x;
    float _331 = in.m_68.y;
    float _333 = in.m_68.z;
    float _335 = in.m_68.w;
    int _337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _339 = _337 != 0;
    float _341 = in.m_66.x;
    float _343 = in.m_66.y;
    float _345 = in.m_66.z;
    float _347 = in.m_66.w;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _351 = _349 != 0;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _355 = _353 != 0;
    float _357 = in.m_70.x;
    float _359 = in.m_70.y;
    float _361 = in.m_70.z;
    float _363 = in.m_70.w;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _367 = _365 != 0;
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _371 = _369 != 0;
    float _373 = in.m_72.x;
    float _375 = in.m_72.y;
    float _377 = in.m_72.z;
    float _379 = in.m_72.w;
    float _381 = _323 * _331;
    bool _383 = _347 > 0.5;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _389 = fma(_321, _329, _381);
    float _391 = _323 * _359;
    float _393 = 1.0 / _387;
    float _395 = fma(_325, _333, _389);
    float _397 = fma(_321, _357, _391);
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _401 = _343 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _403 = _323 * _375;
    float _405 = _341 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _407;
    bool _411 = _341 > 0.5;
    float _413 = fma(_401, -2.0, _399);
    float _415 = fma(_321, _373, _403);
    float _417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _419 = fma(_325, _361, _397);
    float _421 = -_183;
    int _423 = _411 ? as_type<int>(_421) : as_type<int>(_183);
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _427 = _343 > 0.5;
    float _429 = fma(_325, _377, _415);
    float _431 = -_425;
    float _433 = fma(_405, 2.0, _431);
    float _435 = -_187;
    int _437 = _427 ? as_type<int>(_435) : as_type<int>(_187);
    float _439 = _409 * _393;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _443 = _319 + _441;
    float _445 = _409;
    if (!_339)
    {
        _445 = _345;
    }
    float _447 = _445;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _451 = _447;
    if (_339)
    {
        _451 = _343;
    }
    float _453 = _451;
    float _455 = fma(_439, _443, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _457 = !_355;
    float _459 = _457 ? _187 : as_type<float>(_437);
    float _461 = _395 + _335;
    bool _463 = !_351;
    float _465 = _463 ? _183 : as_type<float>(_423);
    float _467 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[83].w, _449);
    float _469 = _417 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _471 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _413);
    float _473 = _459 + (-0.5);
    bool _475 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _477 = isnan(_319);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = _327 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _489 = -_147;
    float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[76].x, _433);
    float _493 = _465 + 0.5;
    float _495 = _419 + _363;
    float _497 = -_469;
    float _499 = -_471;
    float _501 = fma(_497, _473, _499);
    bool _503 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _505 = isnan(_319);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = _429 + _379;
    float _517 = -_485;
    float _519 = _517 + 1.0;
    float _521 = fma(_487, _493, _491);
    float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _525 = _487;
    if (!_339)
    {
        _525 = _343;
    }
    float _527 = _525;
    float _529 = _513 * _519;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _533 = _527;
    if (_339)
    {
        _533 = _341;
    }
    float _535 = _533;
    float _537 = _455 * _529;
    bool _539 = _345 > 0.5;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _545 = _535 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _547 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[83].z, _531);
    float _549 = -_183;
    int _551 = _539 ? as_type<int>(_549) : as_type<int>(_183);
    float _553 = -_513;
    float _555 = _553 + 1.0;
    float _557 = _535;
    if (!_339)
    {
        _557 = _345;
    }
    float _559 = _557;
    float _561 = -_541;
    float _563 = fma(_545, 2.0, _561);
    float _565 = _559;
    if (_339)
    {
        _565 = _343;
    }
    float _567 = _565;
    float _569 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[115].x, _537);
    float _571 = -_147;
    float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[81].x, _563);
    bool _575 = !_367;
    float _577 = _575 ? _183 : as_type<float>(_551);
    float _579 = _567 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _581 = _523 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _585 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _587 = _461 + _585;
    float _589 = _577 + 0.5;
    float _591 = fma(_579, -2.0, _583);
    float _593 = -_187;
    int _595 = _383 ? as_type<int>(_593) : as_type<int>(_187);
    float _597 = fma(_581, _589, _573);
    float _599 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _601 = _495 + _599;
    float _603 = _543 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _605 = !_371;
    float _607 = _605 ? _187 : as_type<float>(_595);
    float _609 = _601 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _613 = _515 + _611;
    float _615 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _591);
    float _617 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _547);
    float _619 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[28].x, _609);
    float _621 = _607 + (-0.5);
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _627 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[28].z, _619);
    float _629 = -_603;
    float _631 = -_615;
    float _633 = fma(_629, _621, _631);
    float _635 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[78].z, _623);
    float _637 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[78].w, _625);
    float _639 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _467);
    float _641 = -_617;
    float _643 = _641 + 1.0;
    float _645 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _635);
    float _647 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _637);
    float _649 = -_639;
    float _651 = _649 + 1.0;
    bool _653 = _627 >= 0.0;
    float _655 = -_645;
    float _657 = _655 + 1.0;
    float _659 = -_647;
    float _661 = _659 + 1.0;
    float _663 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[116].x, _569);
    float _665 = -_657;
    float _667 = fma(_465, _665, _521);
    float _669 = fma(_459, _661, _501);
    float _671 = -_643;
    float _673 = fma(_577, _671, _597);
    float _675 = _601 * _601;
    float _677 = fma(_607, _651, _633);
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _681 = fma(_587, _587, _675);
    float _683 = _663 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _685 = fma(_613, _613, _681);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _691 = rsqrt(_685);
    float _693 = _627;
    float _695 = _673;
    if (_653)
    {
        _693 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _697 = _693;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _707 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _719 = as_type<int>(_697);
    if (_653)
    {
        float _721 = _697 * 5.0;
        _719 = as_type<int>(_721);
    }
    int _723 = _719;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _731 = _729 != 0;
    int _733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _735 = _733 != 0;
    out.m_74.x = _707;
    out.m_74.y = _709;
    out.m_74.z = _711;
    out.m_74.w = _683;
    float _737 = _601 * _691;
    float _739 = _587 * _691;
    out.m_76.x = _713;
    out.m_76.y = _715;
    out.m_76.z = _717;
    out.m_76.w = _705;
    bool _741 = !_727;
    int _743 = _741 ? 0 : 1;
    bool _745 = !_731;
    int _747 = _745 ? 0 : 1;
    out.m_78.x = _667;
    out.m_78.y = _669;
    out.m_78.z = _673;
    out.m_78.w = _677;
    bool _749 = !_735;
    int _751 = _749 ? 0 : 1;
    if (_653)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4014 = as_type<float>(_723);
        out.gl_Position.z = _4014;
    }
    if (_653)
    {
        out.m_59.x = 0.0;
    }
    if (_653)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _753 = -_737;
    float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _495);
    float _757 = _613 * _691;
    float _759 = -_739;
    float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _461);
    float _763 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _765 = _755 + _763;
    float _767 = -_757;
    float _769 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[18].w, _515);
    float _771 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _773 = _761 + _771;
    float _775 = _765 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _777 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _779 = _769 + _777;
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[28].x, _775);
    float _783 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[28].z, _781);
    bool _785 = _783 >= 0.0;
    if (_785)
    {
        _695 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _787 = _695;
    int _789 = as_type<int>(_787);
    if (_785)
    {
        out.m_59.x = 0.0;
    }
    if (_785)
    {
        float _791 = _787 * 5.0;
        _789 = as_type<int>(_791);
    }
    int _793 = _789;
    if (_785)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4108 = as_type<float>(_793);
        out.gl_Position.z = _4108;
    }
    if (_785)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _795 = fma(_761, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _797 = fma(_769, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _799 = floor(_795);
    float _801 = floor(_797);
    float _803 = -_799;
    float _805 = _795 + _803;
    float _807 = -_801;
    float _809 = _797 + _807;
    float2 _4144 = float2(_805, _809);
    float _811 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4144, float2(0.0), isnan(_4144)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4144, float2(0.0), isnan(_4144)), level(0.0)).x;
    float _813 = _345 * 2.0;
    float _815 = _341 * 2.0;
    float _817 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _819 = log2(_817);
    float _821 = _343 * 2.0;
    int _823 = abs(_747);
    float _825 = -_737;
    float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[18].w, _601);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _831 = 1.0 + _829;
    float _833 = floor(_813);
    int _835 = abs(_751);
    float _837 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _839 = -_739;
    float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[18].w, _587);
    float _843 = _827 * _827;
    float _845 = -_757;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _613);
    float _849 = _755 + _837;
    float _851 = floor(_815);
    float _853 = fma(_841, _841, _843);
    float _855 = fma(_847, _847, _853);
    bool _857 = _833 > 0.0;
    float _859 = floor(_821);
    bool _861 = _833 >= 0.0;
    bool _863 = isnan(_833);
    bool _865 = _861 || _863;
    bool _867 = isnan(0.0);
    bool _869 = _865 || _867;
    int _871 = abs(_743);
    int _873 = _869 ? 0 : 1;
    bool _875 = _851 > 0.0;
    float _877 = 1.0 / _831;
    int _879 = ~_873;
    int _881 = _879 + 1;
    int _883 = _881 + 1;
    bool _885 = _851 >= 0.0;
    bool _887 = isnan(_851);
    bool _889 = _885 || _887;
    bool _891 = isnan(0.0);
    bool _893 = _889 || _891;
    float _895 = _819 * _147;
    int _897 = _883;
    int _899 = 2;
    if (!_857)
    {
        int _901 = ~_873;
        int _903 = _901 + 1;
        _897 = _903;
    }
    int _905 = _897;
    float _907 = float(_871);
    float _909 = sqrt(_855);
    float _911 = float(_905);
    float _913 = _343 + _345;
    int _915 = _893 ? 0 : 1;
    float _917 = float(_823);
    float _919 = _907 * _911;
    int _921 = ~_915;
    int _923 = _921 + 1;
    int _925 = _923 + 1;
    float _927 = in.m_80.x;
    float _929 = in.m_80.y;
    float _931 = in.m_80.z;
    float _933 = exp2(_895);
    int _935 = _925;
    if (!_875)
    {
        int _937 = ~_915;
        int _939 = _937 + 1;
        _935 = _939;
    }
    int _941 = _935;
    float _943 = _913 + (-1.0);
    bool _945 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _947 = isnan(1.0);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _953 = _949 || _951;
    bool _955 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _957 = isnan(0.0);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _963 = _959 || _961;
    float _965 = float(_941);
    float _967 = _919 * (-2.0);
    float _969 = _343 + _341;
    float _971 = _343 + (-0.5);
    float _973 = _691 * _909;
    float _975 = _917 * _965;
    float _977 = _969 + (-1.0);
    float _979 = -_933;
    float _981 = _979 + 1.0;
    float _983 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _985 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _987 = _341 + (-0.5);
    float _989 = _345 + _341;
    float _991 = _963 ? _981 : 0.0;
    float _993 = _345 + (-0.5);
    float _995 = fma(_967, _927, _927);
    bool _997 = _859 > 0.0;
    float _999 = fma(_985, _967, _985);
    if (_953)
    {
        float _1001 = _991 * _877;
        _151 = _1001;
    }
    float _1003 = _151;
    float _1005 = _975 * (-2.0);
    float _1007 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].x, _995);
    bool _1009 = _859 >= 0.0;
    bool _1011 = isnan(_859);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan(0.0);
    bool _1017 = _1013 || _1015;
    float _1019 = _989 + (-1.0);
    float _1021 = fma(_983, _1005, _983);
    float _1023 = fma(_999, _1003, _1007);
    float _1025 = fma(_1005, _929, _929);
    int _1027 = _1017 ? 0 : 1;
    float _1029 = _1023 * 0.15915493667125701904296875;
    float _1031 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1025);
    int _1033 = ~_1027;
    int _1035 = _1033 + 1;
    int _1037 = _1035 + 1;
    float _1039 = fma(_1021, _1003, _1031);
    int _1041 = _1037;
    if (!_997)
    {
        int _1043 = ~_1027;
        int _1045 = _1043 + 1;
        _1041 = _1045;
    }
    int _1047 = _1041;
    float _1049 = _1029 * 6.283185482025146484375;
    float _1051 = sin(_1049);
    float _1053 = float(_835);
    float _1055 = _1039 * 0.15915493667125701904296875;
    float _1057 = float(_1047);
    float _1059 = _755 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1061 = _1053 * _1057;
    float _1063 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1059);
    float _1065 = _1029 * 6.283185482025146484375;
    float _1067 = cos(_1065);
    float _1069 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1071 = _1061 * (-2.0);
    float _1073 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1063);
    float _1075 = _1055 * 6.283185482025146484375;
    float _1077 = sin(_1075);
    float _1079 = fma(_1071, _931, _931);
    float _1081 = fma(_1069, _1071, _1069);
    float _1083 = _755 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1085 = _849 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1087 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1079);
    float _1089 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1091 = _1055 * 6.283185482025146484375;
    float _1093 = cos(_1091);
    float _1095 = fma(_1081, _1003, _1087);
    float _1097 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1083);
    float _1099 = fma(_761, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1085);
    float _1101 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1097);
    float _1103 = 1.0 / _1089;
    float _1105 = _1095 * 0.15915493667125701904296875;
    float _1107 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1109 = in.m_82.x;
    float _1111 = in.m_82.y;
    float _1113 = fma(_769, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1099);
    float _1115 = _1067 * _1077;
    float _1117 = _1107 + _1089;
    float _1119 = _1105 * 6.283185482025146484375;
    float _1121 = cos(_1119);
    float _1123 = _1113 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1125 = _1067 * _1093;
    float _1127 = _1117 * _1103;
    float _1129 = _1127 * 0.5;
    float _1131 = _849 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1133 = _1105 * 6.283185482025146484375;
    float _1135 = sin(_1133);
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1139 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1137);
    float _1141 = fma(_761, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1131);
    float _1143 = _1067 * _1121;
    float _1145 = fma(_769, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1141);
    float _1147 = 1.0 / _1139;
    float _1149 = _287 * _1109;
    float _1151 = _289 * _1111;
    float _1153 = _1145 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1155 = _1051 * _1077;
    float _1157 = _1149 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1159 = _1051 * _1093;
    float _1161 = _1093 * _1121;
    float _1163 = trunc(_1123);
    int _1165 = int(_1163);
    float _1167 = _1051 * _1121;
    float _1169 = _1077 * _1121;
    float _1171 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1173 = _973 * _1157;
    float _1175 = -_1115;
    float _1177 = fma(_1135, _1159, _1175);
    float _1179 = -_1159;
    float _1181 = fma(_1135, _1115, _1179);
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1187 = _1147 * _1185;
    float _1189 = trunc(_1153);
    int _1191 = int(_1189);
    float _1193 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1195 = _1183 * _1173;
    float _1197 = fma(_1135, _1125, _1155);
    bool _1199 = _1187 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1201 = _973 * _1193;
    bool _1203 = _1187 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1205 = _973 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1207 = _1205 * 0.5;
    bool _1209 = !_1199;
    int _1211 = _1209 ? 0 : 1;
    float _1213 = _1171 * _1201;
    int _1215 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1217 = _1165 + _1215;
    int _1219 = _1217 + 1;
    float _1221 = fma(_1135, _1155, _1125);
    float _1223 = _1143 * _1213;
    bool _1225 = _1219 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1227 = -_1213;
    float _1229 = _1135 * _1227;
    int _1231 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1233 = _1191 + _1231;
    int _1235 = _1233 + 1;
    float _1237 = fma(_1197, _1195, _1223);
    int _1239 = _1219;
    int _1241 = _1235;
    float _1243 = _1123;
    if (!_1199)
    {
        _899 = 1;
    }
    int _1245 = _899;
    float _1247 = _1167 * _1213;
    int _1249 = _1245;
    if (!_1203)
    {
        _1249 = _1211;
    }
    int _1251 = _1249;
    float _1253 = fma(_1161, _1195, _1229);
    int _1255 = _1219 | _1235;
    float _1257 = fma(_1181, _1207, _1237);
    int _1259 = _1251 << 6;
    float _1261 = fma(_1177, _1195, _1247);
    bool _1263 = _1255 < 0;
    bool _1265 = _1263 || _1225;
    float _1267 = fma(_1169, _1207, _1253);
    int _1269 = _1259 + 96;
    uint _1272 = uint(int(uint(_1269) >> uint(2)));
    uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
    int _1276 = int(_1272) & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    int _1280 = int(_1272) + 1;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    int _1284 = _1280 & 3;
    float _1286 = (*spvDescriptorSet0.vp_c15)._m0[int(_1282)][_1284];
    float _1288 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1290 = _1235 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1292 = _1290 || _1265;
    float _1294 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1296 = fma(_1221, _1207, _1261);
    float _1298 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1288);
    bool _1300 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1302 = isnan(0.5);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1308 = _1304 || _1306;
    float _1310 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1294);
    int _1312 = _1259 + 104;
    uint _1314 = uint(int(uint(_1312) >> uint(2)));
    uint _1316 = uint(int(uint(int(_1314)) >> uint(2)));
    int _1318 = int(_1314) & 3;
    float _1320 = (*spvDescriptorSet0.vp_c15)._m0[int(_1316)][_1318];
    int _1322 = int(_1314) + 1;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    int _1326 = _1322 & 3;
    float _1328 = (*spvDescriptorSet0.vp_c15)._m0[int(_1324)][_1326];
    float _1330 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1298);
    float _1332 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1310);
    float _1334 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1336 = as_type<float>(_1251);
    if (!_1292)
    {
        int _1338 = _1235 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1340 = _1338 + _1219;
        _1239 = _1340;
    }
    int _1342 = _1239;
    int _1344 = _1259 + 48;
    uint _1346 = uint(int(uint(_1344) >> uint(2)));
    uint _1348 = uint(int(uint(int(_1346)) >> uint(2)));
    int _1350 = int(_1346) & 3;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[int(_1348)][_1350];
    int _1354 = int(_1346) + 1;
    uint _1356 = uint(int(uint(_1354) >> uint(2)));
    int _1358 = _1354 & 3;
    float _1360 = (*spvDescriptorSet0.vp_c15)._m0[int(_1356)][_1358];
    float _1362 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1364 = _515 + _1334;
    float _1366 = 0.0;
    float _1368 = _1364;
    float _1370 = as_type<float>(_1342);
    if (!_1292)
    {
        float _1372 = floor(_1123);
        _1366 = _1372;
    }
    float _1374 = _1366;
    int _1376 = 0;
    if (!_1292)
    {
        int _1378 = _1342 << 2;
        _1376 = _1378;
    }
    int _1380 = _1376;
    float _1382 = _461 + _1362;
    int _1384 = _1380;
    float _1386 = _1382;
    if (!_1292)
    {
        uint _1388 = uint(int(uint(_1342) >> uint(2)));
        _1241 = int(_1388);
    }
    int _1390 = _1241;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1394 = _1364 + _1392;
    int _1396 = _1259 + 64;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    uint _1400 = uint(int(uint(int(_1398)) >> uint(2)));
    int _1402 = int(_1398) & 3;
    float _1404 = (*spvDescriptorSet0.vp_c15)._m0[int(_1400)][_1402];
    int _1406 = int(_1398) + 1;
    uint _1408 = uint(int(uint(_1406) >> uint(2)));
    int _1410 = _1406 & 3;
    float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
    if (!_1292)
    {
        int _1414 = 12 & _1380;
        _1384 = _1414;
    }
    int _1416 = _1384;
    float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1420 = _1382 + _1418;
    float _1422 = _1394 * _1394;
    float _1424 = 0.0;
    if (!_1292)
    {
        int _1426 = _1390 << 4;
        int _1428 = _1426 + _1416;
        _1424 = as_type<float>(_1428);
    }
    float _1430 = _1424;
    float _1432 = fma(_1420, _1420, _1422);
    int _1434 = _1259 + 56;
    uint _1436 = uint(int(uint(_1434) >> uint(2)));
    uint _1438 = uint(int(uint(int(_1436)) >> uint(2)));
    int _1440 = int(_1436) & 3;
    float _1442 = (*spvDescriptorSet0.vp_c15)._m0[int(_1438)][_1440];
    int _1444 = int(_1436) + 1;
    uint _1446 = uint(int(uint(_1444) >> uint(2)));
    int _1448 = _1444 & 3;
    float _1450 = (*spvDescriptorSet0.vp_c15)._m0[int(_1446)][_1448];
    float _1452 = sqrt(_1432);
    int _1454 = _1259 + 72;
    uint _1456 = uint(int(uint(_1454) >> uint(2)));
    uint _1458 = uint(int(uint(int(_1456)) >> uint(2)));
    int _1460 = int(_1456) & 3;
    float _1462 = (*spvDescriptorSet0.vp_c15)._m0[int(_1458)][_1460];
    int _1464 = int(_1456) + 1;
    uint _1466 = uint(int(uint(_1464) >> uint(2)));
    int _1468 = _1464 & 3;
    float _1470 = (*spvDescriptorSet0.vp_c15)._m0[int(_1466)][_1468];
    int _1472 = _1259 + 80;
    uint _1474 = uint(int(uint(_1472) >> uint(2)));
    uint _1476 = uint(int(uint(int(_1474)) >> uint(2)));
    int _1478 = int(_1474) & 3;
    float _1480 = (*spvDescriptorSet0.vp_c15)._m0[int(_1476)][_1478];
    int _1482 = int(_1474) + 1;
    uint _1484 = uint(int(uint(_1482) >> uint(2)));
    int _1486 = _1482 & 3;
    float _1488 = (*spvDescriptorSet0.vp_c15)._m0[int(_1484)][_1486];
    float _1490 = _849 * _1286;
    bool _1492 = _1452 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1494 = fma(_761, _1278, _1490);
    float _1496 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1498 = _1259 + 88;
    uint _1500 = uint(int(uint(_1498) >> uint(2)));
    uint _1502 = uint(int(uint(int(_1500)) >> uint(2)));
    int _1504 = int(_1500) & 3;
    float _1506 = (*spvDescriptorSet0.vp_c15)._m0[int(_1502)][_1504];
    int _1508 = int(_1500) + 1;
    uint _1510 = uint(int(uint(_1508) >> uint(2)));
    int _1512 = _1508 & 3;
    float _1514 = (*spvDescriptorSet0.vp_c15)._m0[int(_1510)][_1512];
    float _1516 = fma(_769, _1320, _1494);
    float _1518 = _1257;
    if (!_1292)
    {
        float _1520 = floor(_1153);
        _1518 = _1520;
    }
    float _1522 = _1518;
    float _1524 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1496);
    float _1526 = _1516 + _1328;
    float _1528 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1524);
    float _1530 = _1430;
    if (!_1292)
    {
        int _1532 = as_type<int>(_1430) + 400;
        uint _1534 = uint(int(uint(_1532) >> uint(2)));
        uint _1536 = uint(int(uint(int(_1534)) >> uint(2)));
        int _1538 = int(_1534) & 3;
        float _1540 = (*spvDescriptorSet0.vp_c15)._m0[int(_1536)][_1538];
        _1530 = _1540;
    }
    float _1542 = _1530;
    float _1544 = _849 * _1360;
    float _1546 = 1.0 / _1526;
    float _1548 = fma(_761, _1352, _1544);
    float _1550 = _1528 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1552 = _849 * _1412;
    float _1554 = _495 + _1550;
    float _1556 = fma(_761, _1404, _1552);
    float _1558 = fma(_769, _1442, _1548);
    float _1560 = fma(_769, _1462, _1556);
    bool _1562 = !_1492;
    float _1564 = _1554;
    float _1566 = _1404;
    float _1568 = _1558;
    float _1570 = _1450;
    float _1572 = _1560;
    float _1574 = _1522;
    if (!_1562)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1580 = _1452 + _1578;
        float _1582 = _1554 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1584 = rsqrt(_1432);
        float _1586 = _1580 * _1576;
        float _1588 = _1586 * 0.15915493667125701904296875;
        float _1590 = _1588 * 6.283185482025146484375;
        float _1592 = cos(_1590);
        float _1594 = _1588 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        float _1598 = _1592 + (-1.0);
        float _1600 = fma(_1596, _1582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1602 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1604 = _1584 * _1600;
        float _1606 = fma(_1554, _1592, _1602);
        float _1608 = fma(_1420, _1604, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1610 = fma(_1394, _1604, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1386 = _1608;
        _1564 = _1606;
        _1368 = _1610;
        _1566 = _1588;
    }
    float _1612 = _1386;
    float _1614 = _1564;
    float _1616 = _1368;
    float _1618 = _1566;
    float _1620 = -_739;
    float _1622 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1612);
    float _1624 = -_737;
    float _1626 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1614);
    float _1628 = -_757;
    float _1630 = fma(_1628, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1616);
    float _1632 = _1558 + _1450;
    float _1634 = _1560 + _1470;
    float _1636 = _1618;
    float _1638 = _1630;
    float _1640 = _1626;
    if (_1308)
    {
        _1568 = _1622;
    }
    float _1642 = _1568;
    float _1644 = _1642;
    if (_1308)
    {
        _1570 = _1626;
    }
    float _1646 = _1570;
    float _1648 = _1646;
    if (_1308)
    {
        _1572 = _1630;
    }
    float _1650 = _1572;
    float _1652 = _1650;
    if (!_1308)
    {
        float _1654 = _765 * _765;
        float _1656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1658 = -_515;
        float _1660 = _1658 + _1616;
        float _1662 = -_495;
        float _1664 = _1662 + _1614;
        float _1666 = fma(_773, _773, _1654);
        float _1668 = -_461;
        float _1670 = _1668 + _1612;
        float _1672 = fma(_779, _779, _1666);
        float _1674 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1676 = sqrt(_1672);
        float _1678 = 1.0 / _973;
        float _1680 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1682 = precise::min(_1676, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1684 = _1682 * _1656;
        float _1686 = _1684 * _1678;
        float _1688 = _1680 * _1686;
        float _1690 = _1660 * _1686;
        float _1692 = fma(_1664, _1688, _755);
        float _1694 = fma(_1670, _1688, _761);
        float _1696 = fma(_1680, _1690, _769);
        _1648 = _1692;
        _1644 = _1694;
        _1652 = _1696;
        _1636 = _1656;
    }
    float _1698 = _1648;
    float _1700 = _1644;
    float _1702 = _1652;
    float _1704 = _1636;
    float _1706 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1708 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1710 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1712 = _1632 * _1546;
    float _1714 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1706);
    float _1716 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1708);
    float _1718 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1710);
    float _1720 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1722 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1714);
    bool _1724 = _1712 >= 0.0;
    float _1726 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1716);
    float _1728 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1718);
    float _1730 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1732 = _1634 * _1546;
    bool _1734 = _1712 <= 1.0;
    bool _1736 = _1734 && _1724;
    float _1738 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1740 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1720);
    float _1742 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1744 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1746 = _1732 >= 0.0;
    bool _1748 = _1746 && _1736;
    float _1750 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1740);
    float _1752 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1754 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1744);
    float _1756 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1758 = _1732 <= 1.0;
    bool _1760 = _1758 && _1748;
    float _1762 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1764 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1754);
    float _1766 = -_1756;
    float _1768 = fma(_1766, _1752, 1.0);
    float _1770 = _849 * _1488;
    float _1772 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1774 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1764);
    float _1776 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1778 = fma(_761, _1480, _1770);
    float _1780 = log2(_1768);
    float _1782 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1772);
    float _1784 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1776);
    float _1786 = fma(_769, _1506, _1778);
    if (_1760)
    {
        float _1788 = float(_1251);
        _1336 = _1788;
    }
    float _1790 = _1336;
    float _1792 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1782);
    float _1794 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1784);
    float _1796 = _1786 + _1514;
    float _1798 = 1.0 / _1774;
    float _1800 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1792);
    float _1802 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1794);
    float _1804 = _1794;
    float _1806 = _1800;
    if (!_1292)
    {
        float _1808 = -_1522;
        float _1810 = _1153 + _1808;
        _1574 = _1810;
    }
    float _1812 = _1574;
    if (!_1292)
    {
        float _1814 = -_1374;
        float _1816 = _1123 + _1814;
        _1804 = _1816;
    }
    float _1818 = _1804;
    float _1820 = _1796 * _1546;
    float _1822 = _1704;
    if (!_1292)
    {
        float _1824 = rint(_1542);
        float _1826 = precise::max(_1824, 0.0);
        uint _1828 = uint(_1826);
        uint _1830 = clamp(_1828, 0u, 65535u);
        _1822 = as_type<float>(_1830);
    }
    float _1832 = _1822;
    float _1834 = _1780 * 0.693147182464599609375;
    float _1836 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1838 = _1772;
    float _1840 = _1836;
    if (_1760)
    {
        float _1842 = rint(_1790);
        float _1844 = precise::max(_1842, 0.0);
        uint _1846 = uint(_1844);
        uint _1848 = clamp(_1846, 0u, 65535u);
        _1838 = as_type<float>(_1848);
    }
    float _1850 = _1838;
    float _1852 = _1800 * _1798;
    float _1854 = _1802 * _1798;
    float _1856 = fma(_1852, 0.5, 0.5);
    float _1858 = fma(_1854, -0.5, 0.5);
    float _1860 = _1374;
    float _1862 = _1858;
    float _1864 = _1856;
    if (!_1292)
    {
        float3 _5808 = float3(_1818, _1812, float(as_type<int>(_1832)));
        float3 _5812 = select(_5808, float3(0.0), isnan(_5808));
        float _1866 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5812.xy, uint(rint(_5812.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5812.xy, uint(rint(_5812.z)), level(0.0)).x;
        _1860 = _1866;
    }
    float _1868 = _1860;
    float _1870 = _1732;
    if (_1760)
    {
        float3 _5827 = float3(_1712, _1732, float(as_type<int>(_1850)));
        float3 _5829 = select(_5827, float3(0.0), isnan(_5827));
        float _1872 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5829.xy, uint(rint(_5829.z)), _1820, level(0.0));
        _1870 = _1872;
    }
    float _1874 = _1870;
    float3 _5839 = float3(_1856, _1858, _1836);
    float _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5839, float3(0.0), isnan(_5839)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5839, float3(0.0), isnan(_5839)), level(0.0)).x;
    float3 _5848 = float3(_1856, _1858, _1836);
    float4 _1879 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5848, float3(0.0), isnan(_5848)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5848, float3(0.0), isnan(_5848)), level(0.0)).xyzw;
    float _1881 = _1879.x;
    float _1883 = _1879.y;
    float _1885 = _1879.z;
    float _1887 = _1879.w;
    bool _1889 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1891 = isnan(0.5);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1897 = _1893 || _1895;
    if (_1292)
    {
        _1638 = 1.0;
    }
    float _1899 = _1638;
    float _1901 = _1899;
    if (_1897)
    {
        _1243 = 1.0;
    }
    float _1903 = _1243;
    float _1905 = _1903;
    if (_1897)
    {
        _1640 = 1.0;
    }
    float _1907 = _1640;
    float _1909 = _1907;
    if (!_1897)
    {
        float _1911 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1913 = _1911 * 0.15915493667125701904296875;
        float _1915 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1917 = _1913 * 6.283185482025146484375;
        float _1919 = cos(_1917);
        float _1921 = _1915 * 0.15915493667125701904296875;
        float _1923 = _1913 * 6.283185482025146484375;
        float _1925 = sin(_1923);
        float _1927 = 1.0 / _1919;
        float _1929 = _1921 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        float _1933 = _1925 * _1927;
        float _1935 = _1921 * 6.283185482025146484375;
        float _1937 = sin(_1935);
        float _1939 = _1931 * _1933;
        float _1941 = 1.0 / _1939;
        float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1945 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1943;
        float _1947 = 1.0 / _1945;
        float _1949 = _1937 * _1941;
        float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1953 = fma(_1187, _1949, _1951);
        float _1955 = _1953 * _1947;
        float _1957 = precise::clamp(_1955, 0.0, 1.0);
        _1862 = _1953;
        _1864 = _1921;
        _1909 = _1957;
    }
    float _1959 = _1862;
    float _1961 = _1864;
    float _1963 = _1909;
    float _1965 = _1961;
    float _1967 = _1959;
    if (!_1897)
    {
        float _1969 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1971 = _1969 * 0.15915493667125701904296875;
        float _1973 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1975 = _1971 * 6.283185482025146484375;
        float _1977 = cos(_1975);
        float _1979 = _1973 * 0.15915493667125701904296875;
        float _1981 = _1971 * 6.283185482025146484375;
        float _1983 = sin(_1981);
        float _1985 = 1.0 / _1977;
        float _1987 = _1979 * 6.283185482025146484375;
        float _1989 = cos(_1987);
        float _1991 = _1983 * _1985;
        float _1993 = _1979 * 6.283185482025146484375;
        float _1995 = sin(_1993);
        float _1997 = _1989 * _1991;
        float _1999 = 1.0 / _1997;
        float _2001 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2003 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2001;
        float _2005 = 1.0 / _2003;
        float _2007 = _1995 * _1999;
        float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2011 = fma(_1187, _2007, _2009);
        float _2013 = _2011 * _2005;
        float _2015 = precise::clamp(_2013, 0.0, 1.0);
        float _2017 = -_2015;
        float _2019 = _2017 + 1.0;
        _1965 = _1997;
        _1967 = _1985;
        _1905 = _2019;
    }
    float _2021 = _1965;
    float _2023 = _1967;
    float _2025 = _1905;
    if (!_1292)
    {
        int _2027 = _1342 << 4;
        int _2029 = _2027 + 2048;
        uint _2031 = uint(int(uint(_2029) >> uint(2)));
        uint _2033 = uint(int(uint(int(_2031)) >> uint(2)));
        int _2035 = int(_2031) & 3;
        float _2037 = (*spvDescriptorSet0.vp_c15)._m0[int(_2033)][_2035];
        int _2039 = int(_2031) + 1;
        uint _2041 = uint(int(uint(_2039) >> uint(2)));
        int _2043 = _2039 & 3;
        float _2045 = (*spvDescriptorSet0.vp_c15)._m0[int(_2041)][_2043];
        int _2047 = _2029 + 8;
        uint _2049 = uint(int(uint(_2047) >> uint(2)));
        uint _2051 = uint(int(uint(int(_2049)) >> uint(2)));
        int _2053 = int(_2049) & 3;
        float _2055 = (*spvDescriptorSet0.vp_c15)._m0[int(_2051)][_2053];
        int _2057 = int(_2049) + 1;
        uint _2059 = uint(int(uint(_2057) >> uint(2)));
        int _2061 = _2057 & 3;
        float _2063 = (*spvDescriptorSet0.vp_c15)._m0[int(_2059)][_2061];
        float _2065 = _849 * _2045;
        float _2067 = fma(_761, _2037, _2065);
        float _2069 = fma(_769, _2055, _2067);
        float _2071 = _2069 + _2063;
        float _2073 = precise::clamp(_2071, 0.0, 1.0);
        float _2075 = -_2073;
        float _2077 = _2075 + _1868;
        float _2079 = fma(_2077, 500.0, 1.5);
        float _2081 = exp2(_2079);
        float _2083 = 0.0 + _2081;
        float _2085 = precise::clamp(_2083, 0.0, 1.0);
        _1370 = as_type<float>(_2029);
        _1901 = _2085;
    }
    float _2087 = _1370;
    float _2089 = _1901;
    float _2091 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2093 = _1698 + _2091;
    float _2095 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2097 = _1700 + _2095;
    float _2099 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2101 = _1702 + _2099;
    float _2103 = _2093 * _2093;
    float _2105 = fma(_2097, _2097, _2103);
    float _2107 = fma(_2101, _2101, _2105);
    float _2109 = rsqrt(_2107);
    float _2111 = sqrt(_2107);
    float _2113 = _2109 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2115 = _2097 * _2113;
    float _2117 = _2101 * _2113;
    float _2119 = _2115 * _2115;
    float _2121 = _2117 * _2117;
    float _2123 = _2119 + _2121;
    float _2125 = sqrt(_2123);
    bool _2127 = _2125 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2129 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2131 = _2125 + _2129;
    float _2133 = _2021;
    float _2135 = _2123;
    float _2137 = _2131;
    float _2139 = _2115;
    float _2141 = _2117;
    float _2143 = _2119;
    float _2145 = _2121;
    if (_2127)
    {
        float _2147 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2133 = _2147;
    }
    float _2149 = _2133;
    if (_2127)
    {
        float _2151 = rsqrt(_2123);
        _2135 = _2151;
    }
    float _2153 = _2135;
    if (_2127)
    {
        float _2155 = _2131 * _2149;
        _2137 = _2155;
    }
    float _2157 = _2137;
    if (_2127)
    {
        float _2159 = _2157 * 0.15915493667125701904296875;
        _1840 = _2159;
    }
    float _2161 = _1840;
    float _2163 = _2023;
    if (_2127)
    {
        float _2165 = _2161 * 6.283185482025146484375;
        float _2167 = sin(_2165);
        _2163 = _2167;
    }
    float _2169 = _2163;
    float _2171 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2173 = precise::max(0.0, _2171);
    float _2175 = _2087;
    float _2177 = _2173;
    float _2179 = _2171;
    if (_2127)
    {
        float _2181 = _2161 * 6.283185482025146484375;
        float _2183 = cos(_2181);
        _2175 = _2183;
    }
    float _2185 = _2175;
    float _2187 = -_2113;
    float _2189 = -_2173;
    float _2191 = fma(_2093, _2187, _2189);
    float _2193 = _2191;
    if (_2127)
    {
        float _2195 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2177 = _2195;
    }
    float _2197 = _2177;
    float _2199 = _2169;
    float _2201 = _2197;
    if (_2127)
    {
        float _2203 = fma(_2169, _2197, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2199 = _2203;
    }
    float _2205 = _2199;
    float _2207 = _2205;
    if (_2127)
    {
        float _2209 = _2185 + (-1.0);
        _2179 = _2209;
    }
    float _2211 = _2179;
    if (_2127)
    {
        float _2213 = _2153 * _2205;
        _2207 = _2213;
    }
    float _2215 = _2207;
    if (_2127)
    {
        float _2217 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2201 = _2217;
    }
    float _2219 = _2201;
    if (_2127)
    {
        float _2221 = _2115 * _2215;
        _2139 = _2221;
    }
    float _2223 = _2139;
    if (_2127)
    {
        float _2225 = _2117 * _2215;
        _2141 = _2225;
    }
    float _2227 = _2141;
    if (_2127)
    {
        float _2229 = fma(_2191, _2185, _2219);
        _2193 = _2229;
    }
    float _2231 = _2193;
    if (_2127)
    {
        float _2233 = _2223 * _2223;
        _2143 = _2233;
    }
    float _2235 = _2143;
    if (_2127)
    {
        float _2237 = _2227 * _2227;
        _2145 = _2237;
    }
    float _2239 = _2145;
    float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2243 = fma(_2111, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2241);
    float _2245 = precise::clamp(_2243, 0.0, 1.0);
    float _2247 = fma(_2231, _2231, _2235);
    float _2249 = -_2245;
    float _2251 = _2249 + 1.0;
    float _2253 = _2247 + _2239;
    float _2255 = rsqrt(_2253);
    float _2257 = _2255 * _2231;
    float _2259 = _2255 * _2223;
    float _2261 = abs(_2251);
    float _2263 = log2(_2261);
    float _2265 = _2255 * _2227;
    float _2267 = _2259 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2269 = -_2267;
    float _2271 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2269);
    float _2273 = -_2265;
    float _2275 = fma(_2273, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2271);
    float _2277 = fma(_2275, -0.5, 0.5);
    float _2279 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2281 = fma(_2275, 0.5, 0.5);
    float _2283 = _2257 + 1.0;
    float _2285 = sqrt(_2277);
    float _2287 = fma(_2281, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2289 = fma(_2281, _2287, -0.212114393711090087890625);
    float _2291 = exp2(_2279);
    float _2293 = fma(_2281, _2289, 1.570728778839111328125);
    float _2295 = _2285 * 0.636619746685028076171875;
    float _2297 = -_2293;
    float _2299 = fma(_2295, _2297, 1.0);
    float _2301 = -_2257;
    float _2303 = fma(_2291, _2283, _2301);
    float _2305 = fma(_2303, 0.5, 0.5);
    float2 _6466 = float2(_2299, _2305);
    float3 _2309 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6466, float2(0.0), isnan(_6466)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6466, float2(0.0), isnan(_6466)), level(0.0)).xyz;
    float _2311 = _2309.x;
    float _2313 = _2309.y;
    float _2315 = _2309.z;
    float _2317 = abs(_1187);
    float _2319 = log2(_2317);
    float _2321 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2323 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2325 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2327 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2329 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2331 = -_1135;
    float _2333 = fma(_2331, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2321);
    float _2335 = -_1135;
    float _2337 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2323);
    float _2339 = -_1135;
    float _2341 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2325);
    float _2343 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2345 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2347 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2349 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2351 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2353 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2327);
    float _2355 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2329);
    float _2357 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2359 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2343);
    float _2361 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2345);
    float _2363 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2351);
    float _2365 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2347);
    float _2367 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2349);
    float _2369 = exp2(_2357);
    float _2371 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2333);
    float _2373 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2337);
    float _2375 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2377 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2341);
    float _2379 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2353);
    float _2381 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2355);
    float _2383 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2359);
    float _2385 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2361);
    float _2387 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2363);
    float _2389 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2365);
    float _2391 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2367);
    float _2393 = _2375 * _2371;
    float _2395 = _2375 * _2373;
    float _2397 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2399 = _2375 * _2377;
    float _2401 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2403 = fma(_2397, _2379, _2393);
    float _2405 = fma(_2397, _2381, _2395);
    float _2407 = fma(_2397, _2383, _2399);
    float _2409 = fma(_2369, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2411 = precise::clamp(_2409, 0.0, 1.0);
    float _2413 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2387);
    float _2415 = _1774 * 0.5;
    float _2417 = exp2(_2401);
    float _2419 = fma(_2411, -2.0, 3.0);
    float _2421 = _2411 * _2411;
    float _2423 = fma(_1802, -0.5, _2415);
    out.gl_Position.x = _1800;
    out.gl_Position.y = _1802;
    out.gl_Position.z = _2413;
    out.gl_Position.w = _1774;
    bool _2425 = _1187 <= 8000.0;
    bool _2427 = isnan(_1187);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan(8000.0);
    bool _2433 = _2429 || _2431;
    float _2435 = float(_2433);
    float _2437 = _2421 * _2419;
    float _2439 = _2413 + _1774;
    float _2441 = -_811;
    float _2443 = _2441 + 1.0;
    float _2445 = _1800 + _1774;
    float _2447 = _2439 * 0.5;
    float _2449 = _2385 + _2403;
    float _2451 = _2445 * 0.5;
    float _2453 = _2389 + _2405;
    float _2455 = _2391 + _2407;
    bool _2457 = _2111 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2459 = isnan(_2111);
    bool _2461 = _2457 || _2459;
    bool _2463 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2465 = _2461 || _2463;
    float _2467 = -_2437;
    float _2469 = _2467 + 1.0;
    float _2471 = -_2417;
    float _2473 = _2471 + 1.0;
    if (!_1760)
    {
        _1806 = 1.0;
    }
    float _2475 = _1806;
    out.m_84.x = _2451;
    out.m_84.y = _2423;
    out.m_84.z = _2447;
    out.m_84.w = _1774;
    float _2477 = fma(_2469, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2437);
    float _2479 = _2475;
    float _2481 = _2313;
    float _2483 = _2311;
    if (_1760)
    {
        bool _2485 = _1874 >= _1820;
        bool _2487 = isnan(_1874);
        bool _2489 = _2485 || _2487;
        bool _2491 = isnan(_1820);
        bool _2493 = _2489 || _2491;
        float _2495 = float(_2493);
        _2479 = _2495;
    }
    float _2497 = _2479;
    float _2499 = _2473 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _2449;
    out.m_86.y = _2453;
    out.m_86.z = _2455;
    float _2501 = _2435 * _2477;
    float _2503 = _2499 * _1876;
    float _2505 = _2497 * _2089;
    float _2507 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2509 = -_2499;
    float _2511 = _2509 + 1.0;
    float _2513 = _1887 * _2503;
    float _2515 = _2499;
    float _2517 = _2511;
    if (!_2465)
    {
        _2515 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2519 = _2515;
    float _2521 = _2443 * _2507;
    float _2523 = precise::clamp(_2521, 0.0, 1.0);
    float _2525 = -_2523;
    float _2527 = fma(_2525, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2529 = -_2505;
    float _2531 = fma(_2529, _2527, 1.0);
    float _2533 = precise::clamp(_2531, 0.0, 1.0);
    float _2535 = _2527;
    float _2537 = _2519;
    float _2539 = _2519;
    if (!_2465)
    {
        _2535 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2541 = _2535;
    float _2543 = _2315 * _2503;
    float _2545 = fma(_2311, _2513, _1881);
    float _2547 = fma(_2313, _2513, _1883);
    float _2549 = _2533 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2551 = _1887 * _2511;
    float _2553 = fma(_1887, _2543, _1885);
    float _2555 = _1963 * _2025;
    float _2557 = _2555;
    float _2559 = _2541;
    float _2561 = _2541;
    if (!_2465)
    {
        _2481 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2563 = _2481;
    out.m_88.x = _2549;
    float _2565 = _2563;
    float _2567 = _2563;
    if (!_2465)
    {
        _2483 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2569 = _2483;
    float _2571 = _2555 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2573 = _2569;
    float _2575 = _2569;
    if (!_2465)
    {
        _2517 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2577 = _2517;
    out.m_90.x = _2545;
    out.m_90.y = _2547;
    out.m_90.z = _2553;
    out.m_90.w = _2551;
    float _2579 = _2577;
    float _2581 = _2577;
    if (!_2465)
    {
        _2557 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2583 = _2557;
    bool _2585 = !_2465;
    float _2587 = _2583;
    float _2589 = _2583;
    if (!_2585)
    {
        bool _2591 = _2111 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2593 = isnan(_2111);
        bool _2595 = _2591 || _2593;
        bool _2597 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2599 = _2595 || _2597;
        if (!_2599)
        {
            float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2603 = _2111 + _2601;
            float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2607 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2605;
            float _2609 = 1.0 / _2607;
            float _2611 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2615 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2621 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2629 = _2627 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2631 = _2603 * _2609;
            float _2633 = precise::clamp(_2631, 0.0, 1.0);
            float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2639 = fma(_2633, _2613, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2641 = fma(_2633, _2637, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2643 = fma(_2633, _2617, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2645 = fma(_2633, _2621, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2647 = fma(_2633, _2625, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2649 = fma(_2633, _2629, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2575 = _2641;
            _2561 = _2647;
            _2567 = _2639;
            _2581 = _2645;
            _2539 = _2643;
            _2589 = _2649;
            _2651 = true;
        }
        else
        {
            bool _2653 = _2111 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2655 = isnan(_2111);
            bool _2657 = _2653 || _2655;
            bool _2659 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2661 = _2657 || _2659;
            if (!_2661)
            {
                _2565 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2663 = _2565;
            _2567 = _2663;
            if (!_2661)
            {
                _2573 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2665 = _2573;
            _2575 = _2665;
            if (!_2661)
            {
                _2537 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2667 = _2537;
            _2539 = _2667;
            if (!_2661)
            {
                _2579 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2669 = _2579;
            _2581 = _2669;
            if (!_2661)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2671 = _2559;
            _2561 = _2671;
            if (!_2661)
            {
                _2587 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2673 = _2587;
            bool _2675 = !_2661;
            _2589 = _2673;
            if (!_2675)
            {
                bool _2677 = _2111 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2679 = isnan(_2111);
                bool _2681 = _2677 || _2679;
                bool _2683 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2685 = _2681 || _2683;
                if (!_2685)
                {
                    float _2687 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2689 = _2111 + _2687;
                    float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2693 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2691;
                    float _2695 = 1.0 / _2693;
                    float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2707 = _2705 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2713 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2715 = _2713 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2717 = _2689 * _2695;
                    float _2719 = precise::clamp(_2717, 0.0, 1.0);
                    float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2723 = _2721 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2725 = fma(_2719, _2699, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2727 = fma(_2719, _2723, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2729 = fma(_2719, _2703, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2731 = fma(_2719, _2707, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2733 = fma(_2719, _2711, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2735 = fma(_2719, _2715, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2575 = _2727;
                    _2561 = _2733;
                    _2567 = _2725;
                    _2581 = _2731;
                    _2539 = _2729;
                    _2589 = _2735;
                    _2651 = true;
                }
                else
                {
                    _2575 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2567 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2581 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2539 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2589 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2651 = false;
    float _2737 = _2575;
    float _2739 = _2561;
    float _2741 = _2567;
    float _2743 = _2581;
    float _2745 = _2539;
    float _2747 = _2589;
    float _2749 = fma(_2453, -0.5, 0.5);
    float _2751 = precise::clamp(_2749, 0.0, 1.0);
    float _2753 = -_2737;
    float _2755 = _2753 + _2739;
    float _2757 = -_2741;
    float _2759 = _2757 + _2743;
    out.m_92.x = 0.0;
    float _2761 = fma(_2751, _2755, _2737);
    float _2763 = -_2745;
    float _2765 = _2763 + _2747;
    float _2767 = fma(_2751, _2759, _2741);
    float _2769 = _2761 * 0.586610972881317138671875;
    bool _2771 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2773 = fma(_2751, _2765, _2745);
    float _2775 = _2571 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2777 = fma(_2767, 0.298911988735198974609375, _2769);
    bool _2779 = _1963 > 0.0;
    bool _2781 = isnan(_1963);
    bool _2783 = _2779 || _2781;
    bool _2785 = isnan(0.0);
    bool _2787 = _2783 || _2785;
    float _2789 = fma(_2773, 0.114477999508380889892578125, _2777);
    out.m_59.x = _2775;
    bool _2791 = _2025 <= 0.0;
    bool _2793 = !_2787;
    bool _2795 = _2791 || _2793;
    float _2797 = -_2789;
    float _2799 = _2767 + _2797;
    float _2801 = -_2789;
    float _2803 = _2773 + _2801;
    float _2805 = fma(_2799, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2789);
    float _2807 = -_2789;
    float _2809 = _2761 + _2807;
    float _2811 = fma(_2803, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2789);
    float _2813 = fma(_2809, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2789);
    bool _2815 = !_2771;
    if (!_2815)
    {
        float _2817 = -_1698;
        float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2821 = -_1700;
        float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2825 = -_1702;
        float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2829 = _2819 * _2819;
        float _2831 = fma(_2823, _2823, _2829);
        float _2833 = fma(_2827, _2827, _2831);
        float _2835 = sqrt(_2833);
        float _2837 = rsqrt(_2833);
        float _2839 = -_2835;
        float _2841 = _2839 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2843 = _2841 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2845 = precise::clamp(_2843, 0.0, 1.0);
        float _2847 = _2823 * _2837;
        float _2849 = _2819 * _2837;
        float _2851 = abs(_2845);
        float _2853 = log2(_2851);
        float _2855 = _2827 * _2837;
        float _2857 = _2847 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2859 = _2453 * _2849;
        float _2861 = -_2849;
        float _2863 = -_2857;
        float _2865 = fma(_2861, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2863);
        float _2867 = fma(_2449, _2847, _2859);
        float _2869 = -_2855;
        float _2871 = fma(_2869, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2865);
        float _2873 = fma(_2455, _2855, _2867);
        float _2875 = precise::clamp(_2873, 0.0, 1.0);
        float _2877 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2879 = _2871 + _2877;
        float _2881 = _2853 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2883 = _2879 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2885 = precise::clamp(_2883, 0.0, 1.0);
        float _2887 = exp2(_2881);
        float _2889 = _2887 * _2885;
        float _2891 = _2875 * _2889;
        float _2893 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2895 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2897 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2893;
        out.m_92.y = _2895;
        out.m_92.z = _2897;
    }
    out.m_94.x = _2805;
    out.m_94.y = _2813;
    out.m_94.z = _2811;
    if (!_2795)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2899 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2899;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

