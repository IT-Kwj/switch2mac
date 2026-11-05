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
    float4 m_70 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
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
    float4 m_74 [[attribute(1)]];
    float4 m_72 [[attribute(2)]];
    float4 m_76 [[attribute(3)]];
    float4 m_82 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_66 [[attribute(7)]];
    float4 m_68 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2741 = false;
    bool _423 = false;
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
        float _3046 = as_type<float>(_129);
        out.gl_Position.z = _3046;
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
        float _3115 = as_type<float>(_167);
        out.gl_Position.z = _3115;
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
    bool _321 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _323 = isnan(_319);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _337 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _339 = isnan(_319);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _355 = _319 + _353;
    float _357 = -_331;
    float _359 = _357 + 1.0;
    bool _361 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _363 = 1.0 / _335;
    float _365 = _347 * _359;
    float _367 = -_347;
    float _369 = _367 + 1.0;
    float _371 = _351 * _363;
    float _373 = fma(_371, _355, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _375 = _373 * _365;
    float _377 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[115].x, _375);
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _385 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[116].x, _377);
    float _387 = in.m_68.x;
    float _389 = in.m_68.y;
    float _391 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _393 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _395 = _383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _397 = _385 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_70.x = _391;
    out.m_70.y = _393;
    out.m_70.z = _395;
    out.m_70.w = _397;
    float _399 = _289 * _389;
    float _401 = _287 * _387;
    bool _403 = !_361;
    float _421;
    if (!_403)
    {
        float _405 = in.m_66.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        float _425 = float(_113);
        float _427 = 1.0 / _425;
        float _429 = _147 * _427;
        _421 = _429;
    }
    _423 = false;
    float _431 = _421;
    float _433 = in.m_66.x;
    float _435 = in.m_66.y;
    float _437 = in.m_66.z;
    float _439 = in.m_66.w;
    float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _443 = in.m_56.x;
    float _445 = in.m_56.y;
    float _447 = in.m_56.z;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _451 = _449 != 0;
    float _453 = in.m_72.x;
    float _455 = in.m_72.y;
    float _457 = in.m_72.z;
    float _459 = in.m_72.w;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _463 = _461 != 0;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _467 = _465 != 0;
    float _469 = in.m_74.x;
    float _471 = in.m_74.y;
    float _473 = in.m_74.z;
    float _475 = in.m_74.w;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _483 = _481 != 0;
    float _485 = in.m_76.x;
    float _487 = in.m_76.y;
    float _489 = in.m_76.z;
    float _491 = in.m_76.w;
    bool _493 = _439 > 0.5;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _499 = _433 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _501 = _433 > 0.5;
    float _503 = 1.0 / _497;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _507 = _445 * _455;
    float _509 = fma(_443, _453, _507);
    float _511 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _513 = _445 * _471;
    float _515 = _445 * _487;
    float _517 = fma(_511, -2.0, _505);
    float _519 = fma(_443, _469, _513);
    float _521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _523 = fma(_443, _485, _515);
    float _525 = fma(_447, _473, _519);
    float _527 = -_183;
    int _529 = _501 ? as_type<int>(_527) : as_type<int>(_183);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _533 = _435 > 0.5;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _535;
    float _539 = fma(_447, _457, _509);
    float _541 = fma(_447, _489, _523);
    float _543 = -_531;
    float _545 = fma(_499, 2.0, _543);
    float _547 = _537 * _503;
    float _549 = -_187;
    int _551 = _533 ? as_type<int>(_549) : as_type<int>(_187);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _555 = _431 + _553;
    bool _557 = !_463;
    float _559 = _557 ? _183 : as_type<float>(_529);
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _563 = _537;
    if (!_451)
    {
        _563 = _437;
    }
    float _565 = _563;
    float _567 = fma(_547, _555, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _569 = _565;
    if (_451)
    {
        _569 = _435;
    }
    float _571 = _569;
    float _573 = _441 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _575 = !_467;
    float _577 = _575 ? _187 : as_type<float>(_551);
    float _579 = _521 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _581 = -_147;
    float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[76].x, _545);
    float _585 = _559 + 0.5;
    float _587 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[83].w, _561);
    float _589 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _517);
    float _591 = _577 + (-0.5);
    float _593 = fma(_573, _585, _583);
    bool _595 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _597 = isnan(_431);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = _541 + _491;
    float _609 = -_579;
    float _611 = -_589;
    float _613 = fma(_609, _591, _611);
    bool _615 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _617 = isnan(_431);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = _539 + _459;
    float _629 = -_605;
    float _631 = _629 + 1.0;
    float _633 = _589;
    float _635 = _613;
    if (!_451)
    {
        _633 = _435;
    }
    float _637 = _633;
    float _639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _641 = _625 * _631;
    float _643 = _637;
    if (_451)
    {
        _643 = _433;
    }
    float _645 = _643;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _649 = _437 > 0.5;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _653 = _567 * _641;
    float _655 = _645 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _657 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[83].z, _647);
    float _659 = -_183;
    int _661 = _649 ? as_type<int>(_659) : as_type<int>(_183);
    float _663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _665 = _645;
    if (!_451)
    {
        _665 = _437;
    }
    float _667 = _665;
    float _669 = -_651;
    float _671 = fma(_655, 2.0, _669);
    float _673 = -_625;
    float _675 = _673 + 1.0;
    float _677 = _667;
    if (_451)
    {
        _677 = _435;
    }
    float _679 = _677;
    float _681 = -_147;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[81].x, _671);
    bool _685 = !_479;
    float _687 = _685 ? _183 : as_type<float>(_661);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _691 = _525 + _475;
    float _693 = _679 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _695 = _639 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _697 = _687 + 0.5;
    float _699 = fma(_693, -2.0, _689);
    float _701 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[131].x, _653);
    float _703 = -_187;
    int _705 = _493 ? as_type<int>(_703) : as_type<int>(_187);
    float _707 = fma(_695, _697, _683);
    float _709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _711 = _627 + _709;
    float _713 = _663 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _715 = !_483;
    float _717 = _715 ? _187 : as_type<float>(_705);
    float _719 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _721 = _691 + _719;
    float _723 = _711 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _725 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _699);
    float _727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _729 = _607 + _727;
    float _731 = _717 + (-0.5);
    float _733 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[28].x, _723);
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _739 = -_713;
    float _741 = -_725;
    float _743 = fma(_739, _731, _741);
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[28].z, _733);
    float _747 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[78].z, _735);
    float _749 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].w, _737);
    float _751 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[132].x, _701);
    float _753 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _657);
    float _755 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _747);
    bool _757 = _745 >= 0.0;
    float _759 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _749);
    float _761 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _587);
    float _763 = -_755;
    float _765 = _763 + 1.0;
    float _767 = -_759;
    float _769 = _767 + 1.0;
    float _771 = -_765;
    float _773 = fma(_559, _771, _593);
    float _775 = _711 * _711;
    float _777 = -_753;
    float _779 = _777 + 1.0;
    float _781 = fma(_577, _769, _613);
    float _783 = fma(_721, _721, _775);
    float _785 = -_761;
    float _787 = _785 + 1.0;
    if (_757)
    {
        _635 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _789 = _635;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _793 = fma(_729, _729, _783);
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _799 = -_779;
    float _801 = fma(_687, _799, _707);
    float _803 = fma(_717, _787, _743);
    float _805 = rsqrt(_793);
    float _807 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = _751 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _815 = as_type<int>(_789);
    if (_757)
    {
        float _817 = _789 * 5.0;
        _815 = as_type<int>(_817);
    }
    int _819 = _815;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _823 = _821 != 0;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _827 = _825 != 0;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _831 = _829 != 0;
    out.m_78.x = _773;
    out.m_78.y = _781;
    out.m_78.z = _801;
    out.m_78.w = _803;
    out.m_80.x = _807;
    out.m_80.y = _809;
    out.m_80.z = _811;
    out.m_80.w = _813;
    bool _833 = !_823;
    int _835 = _833 ? 0 : 1;
    bool _837 = !_827;
    int _839 = _837 ? 0 : 1;
    float _841 = as_type<float>(_819);
    if (_757)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4237 = as_type<float>(_819);
        out.gl_Position.z = _4237;
    }
    bool _843 = !_831;
    int _845 = _843 ? 0 : 1;
    float _847 = _711 * _805;
    float _849 = _721 * _805;
    if (_757)
    {
        out.m_59.x = 0.0;
    }
    if (_757)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _851 = -_847;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _627);
    float _855 = _729 * _805;
    float _857 = -_849;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[18].w, _691);
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _863 = _853 + _861;
    float _865 = -_855;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _607);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _871 = _859 + _869;
    float _873 = _863 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _877 = _867 + _875;
    float _879 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[28].x, _873);
    float _881 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[28].z, _879);
    bool _883 = _881 >= 0.0;
    if (_883)
    {
        _841 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _885 = _841;
    int _887 = as_type<int>(_885);
    if (_883)
    {
        out.m_59.x = 0.0;
    }
    if (_883)
    {
        float _889 = _885 * 5.0;
        _887 = as_type<int>(_889);
    }
    int _891 = _887;
    if (_883)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4341 = as_type<float>(_891);
        out.gl_Position.z = _4341;
    }
    if (_883)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _893 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _895 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _897 = floor(_893);
    float _899 = floor(_895);
    float _901 = -_897;
    float _903 = _893 + _901;
    float _905 = -_899;
    float _907 = _895 + _905;
    float2 _4377 = float2(_903, _907);
    float _909 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4377, float2(0.0), isnan(_4377)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4377, float2(0.0), isnan(_4377)), level(0.0)).x;
    float _911 = _437 * 2.0;
    float _913 = _433 * 2.0;
    float _915 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _917 = log2(_915);
    float _919 = -_847;
    float _921 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _711);
    int _923 = abs(_835);
    float _925 = -_849;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _721);
    float _929 = _921 * _921;
    float _931 = float(_923);
    float _933 = floor(_911);
    float _935 = -_855;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _729);
    float _939 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _941 = floor(_913);
    float _943 = _917 * _147;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _947 = 1.0 + _945;
    float _949 = fma(_927, _927, _929);
    float _951 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _953 = fma(_937, _937, _949);
    bool _955 = _933 >= 0.0;
    bool _957 = isnan(_933);
    bool _959 = _955 || _957;
    bool _961 = isnan(0.0);
    bool _963 = _959 || _961;
    float _965 = exp2(_943);
    bool _967 = _933 > 0.0;
    float _969 = _853 + _951;
    int _971 = _963 ? 0 : 1;
    bool _973 = _941 > 0.0;
    float _975 = 1.0 / _947;
    bool _977 = _941 >= 0.0;
    bool _979 = isnan(_941);
    bool _981 = _977 || _979;
    bool _983 = isnan(0.0);
    bool _985 = _981 || _983;
    float _987 = _435 + _437;
    int _989 = ~_971;
    int _991 = _989 + 1;
    int _993 = _991 + 1;
    int _995 = _985 ? 0 : 1;
    float _997 = _987 + (-1.0);
    int _999 = _993;
    int _1001 = 2;
    if (!_967)
    {
        int _1003 = ~_971;
        int _1005 = _1003 + 1;
        _999 = _1005;
    }
    int _1007 = _999;
    float _1009 = -_965;
    float _1011 = _1009 + 1.0;
    float _1013 = in.m_82.x;
    float _1015 = in.m_82.y;
    float _1017 = in.m_82.z;
    int _1019 = ~_995;
    int _1021 = _1019 + 1;
    int _1023 = _1021 + 1;
    float _1025 = sqrt(_953);
    int _1027 = _1023;
    if (!_973)
    {
        int _1029 = ~_995;
        int _1031 = _1029 + 1;
        _1027 = _1031;
    }
    int _1033 = _1027;
    float _1035 = _435 * 2.0;
    float _1037 = float(_1007);
    float _1039 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1041 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1043 = isnan(1.0);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1049 = _1045 || _1047;
    float _1051 = _435 + _433;
    bool _1053 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1055 = isnan(0.0);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1061 = _1057 || _1059;
    float _1063 = floor(_1035);
    float _1065 = _931 * _1037;
    int _1067 = abs(_839);
    float _1069 = _1051 + (-1.0);
    float _1071 = _1065 * (-2.0);
    float _1073 = float(_1067);
    float _1075 = _435 + (-0.5);
    float _1077 = float(_1033);
    float _1079 = _805 * _1025;
    float _1081 = _1061 ? _1011 : 0.0;
    float _1083 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1085 = _433 + (-0.5);
    float _1087 = _1073 * _1077;
    float _1089 = fma(_1071, _1013, _1013);
    if (_1049)
    {
        float _1091 = _1081 * _975;
        _151 = _1091;
    }
    float _1093 = _151;
    bool _1095 = _1063 > 0.0;
    float _1097 = fma(_1083, _1071, _1083);
    float _1099 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1089);
    float _1101 = _1087 * (-2.0);
    bool _1103 = _1063 >= 0.0;
    bool _1105 = isnan(_1063);
    bool _1107 = _1103 || _1105;
    bool _1109 = isnan(0.0);
    bool _1111 = _1107 || _1109;
    float _1113 = _437 + _433;
    float _1115 = fma(_1097, _1093, _1099);
    float _1117 = fma(_1039, _1101, _1039);
    float _1119 = fma(_1101, _1015, _1015);
    int _1121 = _1111 ? 0 : 1;
    float _1123 = _1115 * 0.15915493667125701904296875;
    int _1125 = abs(_845);
    float _1127 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1119);
    int _1129 = ~_1121;
    int _1131 = _1129 + 1;
    int _1133 = _1131 + 1;
    float _1135 = _1113 + (-1.0);
    int _1137 = _1133;
    if (!_1095)
    {
        int _1139 = ~_1121;
        int _1141 = _1139 + 1;
        _1137 = _1141;
    }
    int _1143 = _1137;
    float _1145 = fma(_1117, _1093, _1127);
    float _1147 = float(_1125);
    float _1149 = _1123 * 6.283185482025146484375;
    float _1151 = sin(_1149);
    float _1153 = float(_1143);
    float _1155 = _437 + (-0.5);
    float _1157 = _1145 * 0.15915493667125701904296875;
    float _1159 = _1079 * _939;
    float _1161 = _1147 * _1153;
    float _1163 = _853 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1165 = _1123 * 6.283185482025146484375;
    float _1167 = cos(_1165);
    float _1169 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1171 = _1161 * (-2.0);
    float _1173 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1163);
    float _1175 = fma(_1169, _1171, _1169);
    float _1177 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1173);
    float _1179 = _1157 * 6.283185482025146484375;
    float _1181 = sin(_1179);
    float _1183 = fma(_1171, _1017, _1017);
    float _1185 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1187 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1183);
    float _1189 = _969 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1191 = _1157 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    float _1195 = fma(_1175, _1093, _1187);
    float _1197 = _853 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1199 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1189);
    float _1201 = _1195 * 0.15915493667125701904296875;
    float _1203 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1197);
    float _1205 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1199);
    float _1207 = 1.0 / _1185;
    float _1209 = _1167 * _1181;
    float _1211 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1203);
    float _1213 = _1205 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1215 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1217 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1219 = _1201 * 6.283185482025146484375;
    float _1221 = sin(_1219);
    float _1223 = _1151 * _1193;
    float _1225 = _1217 + _1185;
    float _1227 = _1167 * _1193;
    float _1229 = _1225 * _1207;
    float _1231 = _1229 * 0.5;
    float _1233 = _969 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1235 = _1201 * 6.283185482025146484375;
    float _1237 = cos(_1235);
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1241 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1239);
    float _1243 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1233);
    float _1245 = -_1209;
    float _1247 = fma(_1221, _1223, _1245);
    float _1249 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1243);
    float _1251 = 1.0 / _1241;
    float _1253 = -_1223;
    float _1255 = fma(_1221, _1209, _1253);
    float _1257 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1259 = _1249 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1261 = _1151 * _1181;
    float _1263 = _1215 * _1159;
    float _1265 = _1079 * _1257;
    float _1267 = trunc(_1213);
    int _1269 = int(_1267);
    float _1271 = _1167 * _1237;
    float _1273 = _1193 * _1237;
    float _1275 = _1151 * _1237;
    float _1277 = _1181 * _1237;
    float _1279 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1281 = _1271 * _1263;
    float _1283 = fma(_1221, _1227, _1261);
    float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1287 = _1251 * _1285;
    float _1289 = trunc(_1259);
    int _1291 = int(_1289);
    float _1293 = _1279 * _1265;
    float _1295 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1297 = _1295 * 0.5;
    float _1299 = fma(_1221, _1261, _1227);
    bool _1301 = _1287 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1303 = fma(_1283, _1293, _1281);
    bool _1305 = _1287 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1307 = !_1301;
    int _1309 = _1307 ? 0 : 1;
    float _1311 = fma(_1255, _1297, _1303);
    int _1313 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1315 = _1269 + _1313;
    int _1317 = _1315 + 1;
    float _1319 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1321 = _1317 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1323 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1325 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1327 = _1291 + _1325;
    int _1329 = _1327 + 1;
    int _1331 = _1317;
    int _1333 = as_type<int>(_1323);
    float _1335 = _1213;
    if (!_1301)
    {
        _1001 = 1;
    }
    int _1337 = _1001;
    int _1339 = _1337;
    if (!_1305)
    {
        _1339 = _1309;
    }
    int _1341 = _1339;
    int _1343 = _1317 | _1329;
    int _1345 = _1341 << 6;
    bool _1347 = _1343 < 0;
    bool _1349 = _1347 || _1321;
    float _1351 = -_1263;
    float _1353 = _1221 * _1351;
    int _1355 = _1345 + 96;
    uint _1358 = uint(int(uint(_1355) >> uint(2)));
    uint _1360 = uint(int(uint(int(_1358)) >> uint(2)));
    int _1362 = int(_1358) & 3;
    float _1364 = (*spvDescriptorSet0.vp_c15)._m0[int(_1360)][_1362];
    int _1366 = int(_1358) + 1;
    uint _1368 = uint(int(uint(_1366) >> uint(2)));
    int _1370 = _1366 & 3;
    float _1372 = (*spvDescriptorSet0.vp_c15)._m0[int(_1368)][_1370];
    float _1374 = _1275 * _1263;
    bool _1376 = _1329 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1378 = _1376 || _1349;
    float _1380 = fma(_1273, _1293, _1353);
    bool _1382 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1384 = isnan(0.5);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1390 = _1386 || _1388;
    float _1392 = fma(_1247, _1293, _1374);
    float _1394 = fma(_1277, _1297, _1380);
    int _1396 = _1345 + 104;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    uint _1400 = uint(int(uint(int(_1398)) >> uint(2)));
    int _1402 = int(_1398) & 3;
    float _1404 = (*spvDescriptorSet0.vp_c15)._m0[int(_1400)][_1402];
    int _1406 = int(_1398) + 1;
    uint _1408 = uint(int(uint(_1406) >> uint(2)));
    int _1410 = _1406 & 3;
    float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
    float _1414 = fma(_1299, _1297, _1392);
    float _1416 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1319);
    float _1418 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1323);
    float _1420 = as_type<float>(_1341);
    if (!_1378)
    {
        int _1422 = _1329 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1424 = _1422 + _1317;
        _1331 = _1424;
    }
    int _1426 = _1331;
    int _1428 = _1345 + 48;
    uint _1430 = uint(int(uint(_1428) >> uint(2)));
    uint _1432 = uint(int(uint(int(_1430)) >> uint(2)));
    int _1434 = int(_1430) & 3;
    float _1436 = (*spvDescriptorSet0.vp_c15)._m0[int(_1432)][_1434];
    int _1438 = int(_1430) + 1;
    uint _1440 = uint(int(uint(_1438) >> uint(2)));
    int _1442 = _1438 & 3;
    float _1444 = (*spvDescriptorSet0.vp_c15)._m0[int(_1440)][_1442];
    float _1446 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1416);
    float _1448 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1418);
    float _1450 = 0.0;
    float _1452 = as_type<float>(_1426);
    if (!_1378)
    {
        float _1454 = floor(_1213);
        _1450 = _1454;
    }
    float _1456 = _1450;
    int _1458 = 0;
    if (!_1378)
    {
        int _1460 = _1426 << 2;
        _1458 = _1460;
    }
    int _1462 = _1458;
    float _1464 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1466 = _1462;
    if (!_1378)
    {
        uint _1468 = uint(int(uint(_1426) >> uint(2)));
        _1333 = int(_1468);
    }
    int _1470 = _1333;
    float _1472 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1474 = _1345 + 64;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    uint _1478 = uint(int(uint(int(_1476)) >> uint(2)));
    int _1480 = int(_1476) & 3;
    float _1482 = (*spvDescriptorSet0.vp_c15)._m0[int(_1478)][_1480];
    int _1484 = int(_1476) + 1;
    uint _1486 = uint(int(uint(_1484) >> uint(2)));
    int _1488 = _1484 & 3;
    float _1490 = (*spvDescriptorSet0.vp_c15)._m0[int(_1486)][_1488];
    if (!_1378)
    {
        int _1492 = 12 & _1462;
        _1466 = _1492;
    }
    int _1494 = _1466;
    float _1496 = _607 + _1464;
    float _1498 = _691 + _1472;
    float _1500 = 0.0;
    float _1502 = _1498;
    float _1504 = _1496;
    if (!_1378)
    {
        int _1506 = _1470 << 4;
        int _1508 = _1506 + _1494;
        _1500 = as_type<float>(_1508);
    }
    float _1510 = _1500;
    float _1512 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1514 = _1496 + _1512;
    float _1516 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1518 = _1498 + _1516;
    int _1520 = _1345 + 56;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    uint _1524 = uint(int(uint(int(_1522)) >> uint(2)));
    int _1526 = int(_1522) & 3;
    float _1528 = (*spvDescriptorSet0.vp_c15)._m0[int(_1524)][_1526];
    int _1530 = int(_1522) + 1;
    uint _1532 = uint(int(uint(_1530) >> uint(2)));
    int _1534 = _1530 & 3;
    float _1536 = (*spvDescriptorSet0.vp_c15)._m0[int(_1532)][_1534];
    float _1538 = _1514 * _1514;
    float _1540 = fma(_1518, _1518, _1538);
    int _1542 = _1345 + 72;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    uint _1546 = uint(int(uint(int(_1544)) >> uint(2)));
    int _1548 = int(_1544) & 3;
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[int(_1546)][_1548];
    int _1552 = int(_1544) + 1;
    uint _1554 = uint(int(uint(_1552) >> uint(2)));
    int _1556 = _1552 & 3;
    float _1558 = (*spvDescriptorSet0.vp_c15)._m0[int(_1554)][_1556];
    float _1560 = sqrt(_1540);
    int _1562 = _1345 + 80;
    uint _1564 = uint(int(uint(_1562) >> uint(2)));
    uint _1566 = uint(int(uint(int(_1564)) >> uint(2)));
    int _1568 = int(_1564) & 3;
    float _1570 = (*spvDescriptorSet0.vp_c15)._m0[int(_1566)][_1568];
    int _1572 = int(_1564) + 1;
    uint _1574 = uint(int(uint(_1572) >> uint(2)));
    int _1576 = _1572 & 3;
    float _1578 = (*spvDescriptorSet0.vp_c15)._m0[int(_1574)][_1576];
    float _1580 = _969 * _1372;
    float _1582 = fma(_859, _1364, _1580);
    float _1584 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1586 = _1345 + 88;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    uint _1590 = uint(int(uint(int(_1588)) >> uint(2)));
    int _1592 = int(_1588) & 3;
    float _1594 = (*spvDescriptorSet0.vp_c15)._m0[int(_1590)][_1592];
    int _1596 = int(_1588) + 1;
    uint _1598 = uint(int(uint(_1596) >> uint(2)));
    int _1600 = _1596 & 3;
    float _1602 = (*spvDescriptorSet0.vp_c15)._m0[int(_1598)][_1600];
    float _1604 = fma(_867, _1404, _1582);
    bool _1606 = _1560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1608 = _1311;
    if (!_1378)
    {
        float _1610 = floor(_1259);
        _1608 = _1610;
    }
    float _1612 = _1608;
    float _1614 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1584);
    float _1616 = _1604 + _1412;
    float _1618 = _1510;
    if (!_1378)
    {
        int _1620 = as_type<int>(_1510) + 400;
        uint _1622 = uint(int(uint(_1620) >> uint(2)));
        uint _1624 = uint(int(uint(int(_1622)) >> uint(2)));
        int _1626 = int(_1622) & 3;
        float _1628 = (*spvDescriptorSet0.vp_c15)._m0[int(_1624)][_1626];
        _1618 = _1628;
    }
    float _1630 = _1618;
    float _1632 = _969 * _1444;
    float _1634 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1614);
    float _1636 = 1.0 / _1616;
    float _1638 = fma(_859, _1436, _1632);
    float _1640 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1642 = _969 * _1490;
    float _1644 = _627 + _1640;
    float _1646 = fma(_859, _1482, _1642);
    float _1648 = fma(_867, _1528, _1638);
    float _1650 = fma(_867, _1550, _1646);
    bool _1652 = !_1606;
    float _1654 = _1644;
    float _1656 = _1482;
    float _1658 = _1648;
    float _1660 = _1536;
    float _1662 = _1650;
    float _1664 = _1612;
    if (!_1652)
    {
        float _1666 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1670 = _1560 + _1668;
        float _1672 = _1644 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1674 = rsqrt(_1540);
        float _1676 = _1670 * _1666;
        float _1678 = _1676 * 0.15915493667125701904296875;
        float _1680 = _1678 * 6.283185482025146484375;
        float _1682 = cos(_1680);
        float _1684 = _1678 * 6.283185482025146484375;
        float _1686 = sin(_1684);
        float _1688 = _1682 + (-1.0);
        float _1690 = fma(_1686, _1672, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1692 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1694 = _1674 * _1690;
        float _1696 = fma(_1644, _1682, _1692);
        float _1698 = fma(_1518, _1694, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1700 = fma(_1514, _1694, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1502 = _1698;
        _1654 = _1696;
        _1504 = _1700;
        _1656 = _1678;
    }
    float _1702 = _1502;
    float _1704 = _1654;
    float _1706 = _1504;
    float _1708 = _1656;
    float _1710 = -_849;
    float _1712 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1702);
    float _1714 = -_847;
    float _1716 = fma(_1714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1704);
    float _1718 = -_855;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1706);
    float _1722 = _1648 + _1536;
    float _1724 = _1650 + _1558;
    float _1726 = _1708;
    float _1728 = _1720;
    float _1730 = _1716;
    if (_1390)
    {
        _1658 = _1712;
    }
    float _1732 = _1658;
    float _1734 = _1732;
    if (_1390)
    {
        _1660 = _1716;
    }
    float _1736 = _1660;
    float _1738 = _1736;
    if (_1390)
    {
        _1662 = _1720;
    }
    float _1740 = _1662;
    float _1742 = _1740;
    if (!_1390)
    {
        float _1744 = _863 * _863;
        float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1748 = -_607;
        float _1750 = _1748 + _1706;
        float _1752 = -_627;
        float _1754 = _1752 + _1704;
        float _1756 = fma(_871, _871, _1744);
        float _1758 = -_691;
        float _1760 = _1758 + _1702;
        float _1762 = fma(_877, _877, _1756);
        float _1764 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1766 = sqrt(_1762);
        float _1768 = 1.0 / _1079;
        float _1770 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1772 = precise::min(_1766, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1774 = _1772 * _1746;
        float _1776 = _1774 * _1768;
        float _1778 = _1770 * _1776;
        float _1780 = _1750 * _1776;
        float _1782 = fma(_1754, _1778, _853);
        float _1784 = fma(_1760, _1778, _859);
        float _1786 = fma(_1770, _1780, _867);
        _1738 = _1782;
        _1734 = _1784;
        _1742 = _1786;
        _1726 = _1746;
    }
    float _1788 = _1738;
    float _1790 = _1734;
    float _1792 = _1742;
    float _1794 = _1726;
    float _1796 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1798 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1800 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1802 = _1722 * _1636;
    float _1804 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1796);
    float _1806 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1798);
    float _1808 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1800);
    float _1810 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1812 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1804);
    bool _1814 = _1802 >= 0.0;
    float _1816 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1806);
    float _1818 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1808);
    float _1820 = _1812 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1822 = _1724 * _1636;
    bool _1824 = _1802 <= 1.0;
    bool _1826 = _1824 && _1814;
    float _1828 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1830 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1810);
    float _1832 = _1818 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1834 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1836 = _1822 >= 0.0;
    bool _1838 = _1836 && _1826;
    float _1840 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1830);
    float _1842 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1844 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1834);
    float _1846 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1848 = _1822 <= 1.0;
    bool _1850 = _1848 && _1838;
    float _1852 = _1840 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1854 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1844);
    float _1856 = -_1846;
    float _1858 = fma(_1856, _1842, 1.0);
    float _1860 = _969 * _1578;
    float _1862 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1864 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1854);
    float _1866 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1868 = fma(_859, _1570, _1860);
    float _1870 = log2(_1858);
    float _1872 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1862);
    float _1874 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1866);
    float _1876 = fma(_867, _1594, _1868);
    if (_1850)
    {
        float _1878 = float(_1341);
        _1420 = _1878;
    }
    float _1880 = _1420;
    float _1882 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1872);
    float _1884 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1874);
    float _1886 = _1876 + _1602;
    float _1888 = 1.0 / _1864;
    float _1890 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1882);
    float _1892 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1884);
    float _1894 = _1884;
    float _1896 = _1890;
    if (!_1378)
    {
        float _1898 = -_1612;
        float _1900 = _1259 + _1898;
        _1664 = _1900;
    }
    float _1902 = _1664;
    if (!_1378)
    {
        float _1904 = -_1456;
        float _1906 = _1213 + _1904;
        _1894 = _1906;
    }
    float _1908 = _1894;
    float _1910 = _1886 * _1636;
    float _1912 = _1794;
    if (!_1378)
    {
        float _1914 = rint(_1630);
        float _1916 = precise::max(_1914, 0.0);
        uint _1918 = uint(_1916);
        uint _1920 = clamp(_1918, 0u, 65535u);
        _1912 = as_type<float>(_1920);
    }
    float _1922 = _1912;
    float _1924 = _1870 * 0.693147182464599609375;
    float _1926 = _1924 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1928 = _1862;
    float _1930 = _1926;
    if (_1850)
    {
        float _1932 = rint(_1880);
        float _1934 = precise::max(_1932, 0.0);
        uint _1936 = uint(_1934);
        uint _1938 = clamp(_1936, 0u, 65535u);
        _1928 = as_type<float>(_1938);
    }
    float _1940 = _1928;
    float _1942 = _1890 * _1888;
    float _1944 = _1892 * _1888;
    float _1946 = fma(_1942, 0.5, 0.5);
    float _1948 = fma(_1944, -0.5, 0.5);
    float _1950 = _1456;
    float _1952 = _1948;
    float _1954 = _1946;
    if (!_1378)
    {
        float3 _6032 = float3(_1908, _1902, float(as_type<int>(_1922)));
        float3 _6036 = select(_6032, float3(0.0), isnan(_6032));
        float _1956 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6036.xy, uint(rint(_6036.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6036.xy, uint(rint(_6036.z)), level(0.0)).x;
        _1950 = _1956;
    }
    float _1958 = _1950;
    float _1960 = _1822;
    if (_1850)
    {
        float3 _6051 = float3(_1802, _1822, float(as_type<int>(_1940)));
        float3 _6053 = select(_6051, float3(0.0), isnan(_6051));
        float _1962 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6053.xy, uint(rint(_6053.z)), _1910, level(0.0));
        _1960 = _1962;
    }
    float _1964 = _1960;
    float3 _6063 = float3(_1946, _1948, _1926);
    float _1966 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6063, float3(0.0), isnan(_6063)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6063, float3(0.0), isnan(_6063)), level(0.0)).x;
    float3 _6072 = float3(_1946, _1948, _1926);
    float4 _1969 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6072, float3(0.0), isnan(_6072)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6072, float3(0.0), isnan(_6072)), level(0.0)).xyzw;
    float _1971 = _1969.x;
    float _1973 = _1969.y;
    float _1975 = _1969.z;
    float _1977 = _1969.w;
    bool _1979 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1981 = isnan(0.5);
    bool _1983 = _1979 || _1981;
    bool _1985 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1987 = _1983 || _1985;
    if (_1378)
    {
        _1728 = 1.0;
    }
    float _1989 = _1728;
    float _1991 = _1989;
    if (_1987)
    {
        _1335 = 1.0;
    }
    float _1993 = _1335;
    float _1995 = _1993;
    if (_1987)
    {
        _1730 = 1.0;
    }
    float _1997 = _1730;
    float _1999 = _1997;
    if (!_1987)
    {
        float _2001 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2003 = _2001 * 0.15915493667125701904296875;
        float _2005 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2007 = _2003 * 6.283185482025146484375;
        float _2009 = cos(_2007);
        float _2011 = _2005 * 0.15915493667125701904296875;
        float _2013 = _2003 * 6.283185482025146484375;
        float _2015 = sin(_2013);
        float _2017 = 1.0 / _2009;
        float _2019 = _2011 * 6.283185482025146484375;
        float _2021 = cos(_2019);
        float _2023 = _2015 * _2017;
        float _2025 = _2011 * 6.283185482025146484375;
        float _2027 = sin(_2025);
        float _2029 = _2021 * _2023;
        float _2031 = 1.0 / _2029;
        float _2033 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2035 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2033;
        float _2037 = 1.0 / _2035;
        float _2039 = _2027 * _2031;
        float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2043 = fma(_1287, _2039, _2041);
        float _2045 = _2043 * _2037;
        float _2047 = precise::clamp(_2045, 0.0, 1.0);
        _1952 = _2043;
        _1954 = _2011;
        _1999 = _2047;
    }
    float _2049 = _1952;
    float _2051 = _1954;
    float _2053 = _1999;
    float _2055 = _2051;
    float _2057 = _2049;
    if (!_1987)
    {
        float _2059 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2061 = _2059 * 0.15915493667125701904296875;
        float _2063 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2065 = _2061 * 6.283185482025146484375;
        float _2067 = cos(_2065);
        float _2069 = _2063 * 0.15915493667125701904296875;
        float _2071 = _2061 * 6.283185482025146484375;
        float _2073 = sin(_2071);
        float _2075 = 1.0 / _2067;
        float _2077 = _2069 * 6.283185482025146484375;
        float _2079 = cos(_2077);
        float _2081 = _2073 * _2075;
        float _2083 = _2069 * 6.283185482025146484375;
        float _2085 = sin(_2083);
        float _2087 = _2079 * _2081;
        float _2089 = 1.0 / _2087;
        float _2091 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2093 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2091;
        float _2095 = 1.0 / _2093;
        float _2097 = _2085 * _2089;
        float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2101 = fma(_1287, _2097, _2099);
        float _2103 = _2101 * _2095;
        float _2105 = precise::clamp(_2103, 0.0, 1.0);
        float _2107 = -_2105;
        float _2109 = _2107 + 1.0;
        _2055 = _2087;
        _2057 = _2075;
        _1995 = _2109;
    }
    float _2111 = _2055;
    float _2113 = _2057;
    float _2115 = _1995;
    if (!_1378)
    {
        int _2117 = _1426 << 4;
        int _2119 = _2117 + 2048;
        uint _2121 = uint(int(uint(_2119) >> uint(2)));
        uint _2123 = uint(int(uint(int(_2121)) >> uint(2)));
        int _2125 = int(_2121) & 3;
        float _2127 = (*spvDescriptorSet0.vp_c15)._m0[int(_2123)][_2125];
        int _2129 = int(_2121) + 1;
        uint _2131 = uint(int(uint(_2129) >> uint(2)));
        int _2133 = _2129 & 3;
        float _2135 = (*spvDescriptorSet0.vp_c15)._m0[int(_2131)][_2133];
        int _2137 = _2119 + 8;
        uint _2139 = uint(int(uint(_2137) >> uint(2)));
        uint _2141 = uint(int(uint(int(_2139)) >> uint(2)));
        int _2143 = int(_2139) & 3;
        float _2145 = (*spvDescriptorSet0.vp_c15)._m0[int(_2141)][_2143];
        int _2147 = int(_2139) + 1;
        uint _2149 = uint(int(uint(_2147) >> uint(2)));
        int _2151 = _2147 & 3;
        float _2153 = (*spvDescriptorSet0.vp_c15)._m0[int(_2149)][_2151];
        float _2155 = _969 * _2135;
        float _2157 = fma(_859, _2127, _2155);
        float _2159 = fma(_867, _2145, _2157);
        float _2161 = _2159 + _2153;
        float _2163 = precise::clamp(_2161, 0.0, 1.0);
        float _2165 = -_2163;
        float _2167 = _2165 + _1958;
        float _2169 = fma(_2167, 500.0, 1.5);
        float _2171 = exp2(_2169);
        float _2173 = 0.0 + _2171;
        float _2175 = precise::clamp(_2173, 0.0, 1.0);
        _1452 = as_type<float>(_2119);
        _1991 = _2175;
    }
    float _2177 = _1452;
    float _2179 = _1991;
    float _2181 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2183 = _1788 + _2181;
    float _2185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2187 = _1790 + _2185;
    float _2189 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2191 = _1792 + _2189;
    float _2193 = _2183 * _2183;
    float _2195 = fma(_2187, _2187, _2193);
    float _2197 = fma(_2191, _2191, _2195);
    float _2199 = rsqrt(_2197);
    float _2201 = sqrt(_2197);
    float _2203 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2205 = _2187 * _2203;
    float _2207 = _2191 * _2203;
    float _2209 = _2205 * _2205;
    float _2211 = _2207 * _2207;
    float _2213 = _2209 + _2211;
    float _2215 = sqrt(_2213);
    bool _2217 = _2215 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2221 = _2215 + _2219;
    float _2223 = _2111;
    float _2225 = _2213;
    float _2227 = _2221;
    float _2229 = _2205;
    float _2231 = _2207;
    float _2233 = _2209;
    float _2235 = _2211;
    if (_2217)
    {
        float _2237 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2223 = _2237;
    }
    float _2239 = _2223;
    if (_2217)
    {
        float _2241 = rsqrt(_2213);
        _2225 = _2241;
    }
    float _2243 = _2225;
    if (_2217)
    {
        float _2245 = _2221 * _2239;
        _2227 = _2245;
    }
    float _2247 = _2227;
    if (_2217)
    {
        float _2249 = _2247 * 0.15915493667125701904296875;
        _1930 = _2249;
    }
    float _2251 = _1930;
    float _2253 = _2113;
    if (_2217)
    {
        float _2255 = _2251 * 6.283185482025146484375;
        float _2257 = sin(_2255);
        _2253 = _2257;
    }
    float _2259 = _2253;
    float _2261 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2263 = precise::max(0.0, _2261);
    float _2265 = _2177;
    float _2267 = _2263;
    float _2269 = _2261;
    if (_2217)
    {
        float _2271 = _2251 * 6.283185482025146484375;
        float _2273 = cos(_2271);
        _2265 = _2273;
    }
    float _2275 = _2265;
    float _2277 = -_2203;
    float _2279 = -_2263;
    float _2281 = fma(_2183, _2277, _2279);
    float _2283 = _2281;
    if (_2217)
    {
        float _2285 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2267 = _2285;
    }
    float _2287 = _2267;
    float _2289 = _2259;
    float _2291 = _2287;
    if (_2217)
    {
        float _2293 = fma(_2259, _2287, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2289 = _2293;
    }
    float _2295 = _2289;
    float _2297 = _2295;
    if (_2217)
    {
        float _2299 = _2275 + (-1.0);
        _2269 = _2299;
    }
    float _2301 = _2269;
    if (_2217)
    {
        float _2303 = _2243 * _2295;
        _2297 = _2303;
    }
    float _2305 = _2297;
    if (_2217)
    {
        float _2307 = _2301 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2291 = _2307;
    }
    float _2309 = _2291;
    if (_2217)
    {
        float _2311 = _2205 * _2305;
        _2229 = _2311;
    }
    float _2313 = _2229;
    if (_2217)
    {
        float _2315 = _2207 * _2305;
        _2231 = _2315;
    }
    float _2317 = _2231;
    if (_2217)
    {
        float _2319 = fma(_2281, _2275, _2309);
        _2283 = _2319;
    }
    float _2321 = _2283;
    if (_2217)
    {
        float _2323 = _2313 * _2313;
        _2233 = _2323;
    }
    float _2325 = _2233;
    if (_2217)
    {
        float _2327 = _2317 * _2317;
        _2235 = _2327;
    }
    float _2329 = _2235;
    float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2333 = fma(_2201, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2331);
    float _2335 = precise::clamp(_2333, 0.0, 1.0);
    float _2337 = fma(_2321, _2321, _2325);
    float _2339 = -_2335;
    float _2341 = _2339 + 1.0;
    float _2343 = _2337 + _2329;
    float _2345 = rsqrt(_2343);
    float _2347 = _2345 * _2321;
    float _2349 = _2345 * _2313;
    float _2351 = abs(_2341);
    float _2353 = log2(_2351);
    float _2355 = _2345 * _2317;
    float _2357 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2359 = -_2357;
    float _2361 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2359);
    float _2363 = -_2355;
    float _2365 = fma(_2363, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2361);
    float _2367 = fma(_2365, -0.5, 0.5);
    float _2369 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2371 = fma(_2365, 0.5, 0.5);
    float _2373 = _2347 + 1.0;
    float _2375 = sqrt(_2367);
    float _2377 = fma(_2371, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2379 = fma(_2371, _2377, -0.212114393711090087890625);
    float _2381 = exp2(_2369);
    float _2383 = fma(_2371, _2379, 1.570728778839111328125);
    float _2385 = _2375 * 0.636619746685028076171875;
    float _2387 = -_2383;
    float _2389 = fma(_2385, _2387, 1.0);
    float _2391 = -_2347;
    float _2393 = fma(_2381, _2373, _2391);
    float _2395 = fma(_2393, 0.5, 0.5);
    float2 _6690 = float2(_2389, _2395);
    float3 _2399 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6690, float2(0.0), isnan(_6690)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6690, float2(0.0), isnan(_6690)), level(0.0)).xyz;
    float _2401 = _2399.x;
    float _2403 = _2399.y;
    float _2405 = _2399.z;
    float _2407 = abs(_1287);
    float _2409 = log2(_2407);
    float _2411 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2413 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2415 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2417 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2419 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2421 = -_1221;
    float _2423 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2411);
    float _2425 = -_1221;
    float _2427 = fma(_2425, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2413);
    float _2429 = -_1221;
    float _2431 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2415);
    float _2433 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2435 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2437 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2439 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2441 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2443 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2417);
    float _2445 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2419);
    float _2447 = _2409 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2449 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2433);
    float _2451 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2435);
    float _2453 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2441);
    float _2455 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2437);
    float _2457 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2439);
    float _2459 = exp2(_2447);
    float _2461 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2423);
    float _2463 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2427);
    float _2465 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2467 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2431);
    float _2469 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2443);
    float _2471 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2445);
    float _2473 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2449);
    float _2475 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2451);
    float _2477 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2453);
    float _2479 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2455);
    float _2481 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2457);
    float _2483 = _2465 * _2461;
    float _2485 = _2465 * _2463;
    float _2487 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2489 = _2465 * _2467;
    float _2491 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2493 = fma(_2487, _2469, _2483);
    float _2495 = fma(_2487, _2471, _2485);
    float _2497 = fma(_2487, _2473, _2489);
    float _2499 = fma(_2459, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2501 = precise::clamp(_2499, 0.0, 1.0);
    float _2503 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2477);
    float _2505 = _1864 * 0.5;
    float _2507 = exp2(_2491);
    float _2509 = fma(_2501, -2.0, 3.0);
    float _2511 = _2501 * _2501;
    float _2513 = fma(_1892, -0.5, _2505);
    out.gl_Position.x = _1890;
    out.gl_Position.y = _1892;
    out.gl_Position.z = _2503;
    out.gl_Position.w = _1864;
    bool _2515 = _1287 <= 8000.0;
    bool _2517 = isnan(_1287);
    bool _2519 = _2515 || _2517;
    bool _2521 = isnan(8000.0);
    bool _2523 = _2519 || _2521;
    float _2525 = float(_2523);
    float _2527 = _2511 * _2509;
    float _2529 = _2503 + _1864;
    float _2531 = -_909;
    float _2533 = _2531 + 1.0;
    float _2535 = _1890 + _1864;
    float _2537 = _2529 * 0.5;
    float _2539 = _2475 + _2493;
    float _2541 = _2535 * 0.5;
    float _2543 = _2479 + _2495;
    float _2545 = _2481 + _2497;
    bool _2547 = _2201 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2549 = isnan(_2201);
    bool _2551 = _2547 || _2549;
    bool _2553 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2555 = _2551 || _2553;
    float _2557 = -_2527;
    float _2559 = _2557 + 1.0;
    float _2561 = -_2507;
    float _2563 = _2561 + 1.0;
    if (!_1850)
    {
        _1896 = 1.0;
    }
    float _2565 = _1896;
    out.m_84.x = _2541;
    out.m_84.y = _2513;
    out.m_84.z = _2537;
    out.m_84.w = _1864;
    float _2567 = fma(_2559, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2527);
    float _2569 = _2565;
    float _2571 = _2403;
    float _2573 = _2401;
    if (_1850)
    {
        bool _2575 = _1964 >= _1910;
        bool _2577 = isnan(_1964);
        bool _2579 = _2575 || _2577;
        bool _2581 = isnan(_1910);
        bool _2583 = _2579 || _2581;
        float _2585 = float(_2583);
        _2569 = _2585;
    }
    float _2587 = _2569;
    float _2589 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _2539;
    out.m_86.y = _2543;
    out.m_86.z = _2545;
    float _2591 = _2525 * _2567;
    float _2593 = _2589 * _1966;
    float _2595 = _2587 * _2179;
    float _2597 = _2591 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2599 = -_2589;
    float _2601 = _2599 + 1.0;
    float _2603 = _1977 * _2593;
    float _2605 = _2589;
    float _2607 = _2601;
    if (!_2555)
    {
        _2605 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2609 = _2605;
    float _2611 = _2533 * _2597;
    float _2613 = precise::clamp(_2611, 0.0, 1.0);
    float _2615 = -_2613;
    float _2617 = fma(_2615, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2619 = -_2595;
    float _2621 = fma(_2619, _2617, 1.0);
    float _2623 = precise::clamp(_2621, 0.0, 1.0);
    float _2625 = _2617;
    float _2627 = _2609;
    float _2629 = _2609;
    if (!_2555)
    {
        _2625 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2631 = _2625;
    float _2633 = _2405 * _2593;
    float _2635 = fma(_2401, _2603, _1971);
    float _2637 = fma(_2403, _2603, _1973);
    float _2639 = _2623 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2641 = _1977 * _2601;
    float _2643 = fma(_1977, _2633, _1975);
    float _2645 = _2053 * _2115;
    float _2647 = _2645;
    float _2649 = _2631;
    float _2651 = _2631;
    if (!_2555)
    {
        _2571 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2653 = _2571;
    out.m_88.x = _2639;
    float _2655 = _2653;
    float _2657 = _2653;
    if (!_2555)
    {
        _2573 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2659 = _2573;
    float _2661 = _2645 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2663 = _2659;
    float _2665 = _2659;
    if (!_2555)
    {
        _2607 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2667 = _2607;
    out.m_90.x = _2635;
    out.m_90.y = _2637;
    out.m_90.z = _2643;
    out.m_90.w = _2641;
    float _2669 = _2667;
    float _2671 = _2667;
    if (!_2555)
    {
        _2647 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2673 = _2647;
    bool _2675 = !_2555;
    float _2677 = _2673;
    float _2679 = _2673;
    if (!_2675)
    {
        bool _2681 = _2201 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2683 = isnan(_2201);
        bool _2685 = _2681 || _2683;
        bool _2687 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2689 = _2685 || _2687;
        if (!_2689)
        {
            float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2693 = _2201 + _2691;
            float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2697 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2695;
            float _2699 = 1.0 / _2697;
            float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2707 = _2705 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2713 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2715 = _2713 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2721 = _2693 * _2699;
            float _2723 = precise::clamp(_2721, 0.0, 1.0);
            float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2727 = _2725 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2729 = fma(_2723, _2703, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2731 = fma(_2723, _2727, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2733 = fma(_2723, _2707, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2735 = fma(_2723, _2711, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2737 = fma(_2723, _2715, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2739 = fma(_2723, _2719, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2665 = _2731;
            _2651 = _2737;
            _2657 = _2729;
            _2671 = _2735;
            _2629 = _2733;
            _2679 = _2739;
            _2741 = true;
        }
        else
        {
            bool _2743 = _2201 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2745 = isnan(_2201);
            bool _2747 = _2743 || _2745;
            bool _2749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2751 = _2747 || _2749;
            if (!_2751)
            {
                _2655 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2753 = _2655;
            _2657 = _2753;
            if (!_2751)
            {
                _2663 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2755 = _2663;
            _2665 = _2755;
            if (!_2751)
            {
                _2627 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2757 = _2627;
            _2629 = _2757;
            if (!_2751)
            {
                _2669 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2759 = _2669;
            _2671 = _2759;
            if (!_2751)
            {
                _2649 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2761 = _2649;
            _2651 = _2761;
            if (!_2751)
            {
                _2677 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2763 = _2677;
            bool _2765 = !_2751;
            _2679 = _2763;
            if (!_2765)
            {
                bool _2767 = _2201 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2769 = isnan(_2201);
                bool _2771 = _2767 || _2769;
                bool _2773 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2775 = _2771 || _2773;
                if (!_2775)
                {
                    float _2777 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2779 = _2201 + _2777;
                    float _2781 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2783 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2781;
                    float _2785 = 1.0 / _2783;
                    float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2793 = _2791 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2797 = _2795 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2799 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2801 = _2799 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2805 = _2803 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2807 = _2779 * _2785;
                    float _2809 = precise::clamp(_2807, 0.0, 1.0);
                    float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2813 = _2811 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2815 = fma(_2809, _2789, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2817 = fma(_2809, _2813, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2819 = fma(_2809, _2793, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2821 = fma(_2809, _2797, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2823 = fma(_2809, _2801, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2825 = fma(_2809, _2805, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2665 = _2817;
                    _2651 = _2823;
                    _2657 = _2815;
                    _2671 = _2821;
                    _2629 = _2819;
                    _2679 = _2825;
                    _2741 = true;
                }
                else
                {
                    _2665 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2651 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2657 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2671 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2629 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2679 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2741 = false;
    float _2827 = _2665;
    float _2829 = _2651;
    float _2831 = _2657;
    float _2833 = _2671;
    float _2835 = _2629;
    float _2837 = _2679;
    float _2839 = fma(_2543, -0.5, 0.5);
    float _2841 = precise::clamp(_2839, 0.0, 1.0);
    float _2843 = -_2827;
    float _2845 = _2843 + _2829;
    float _2847 = -_2831;
    float _2849 = _2847 + _2833;
    out.m_92.x = 0.0;
    float _2851 = fma(_2841, _2845, _2827);
    float _2853 = -_2835;
    float _2855 = _2853 + _2837;
    float _2857 = fma(_2841, _2849, _2831);
    float _2859 = _2851 * 0.586610972881317138671875;
    bool _2861 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2863 = fma(_2841, _2855, _2835);
    float _2865 = _2661 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2867 = fma(_2857, 0.298911988735198974609375, _2859);
    bool _2869 = _2053 > 0.0;
    bool _2871 = isnan(_2053);
    bool _2873 = _2869 || _2871;
    bool _2875 = isnan(0.0);
    bool _2877 = _2873 || _2875;
    float _2879 = fma(_2863, 0.114477999508380889892578125, _2867);
    out.m_59.x = _2865;
    bool _2881 = _2115 <= 0.0;
    bool _2883 = !_2877;
    bool _2885 = _2881 || _2883;
    float _2887 = -_2879;
    float _2889 = _2857 + _2887;
    float _2891 = -_2879;
    float _2893 = _2863 + _2891;
    float _2895 = fma(_2889, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2879);
    float _2897 = -_2879;
    float _2899 = _2851 + _2897;
    float _2901 = fma(_2893, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2879);
    float _2903 = fma(_2899, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2879);
    bool _2905 = !_2861;
    if (!_2905)
    {
        float _2907 = -_1788;
        float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2911 = -_1790;
        float _2913 = _2911 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2915 = -_1792;
        float _2917 = _2915 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2919 = _2909 * _2909;
        float _2921 = fma(_2913, _2913, _2919);
        float _2923 = fma(_2917, _2917, _2921);
        float _2925 = sqrt(_2923);
        float _2927 = rsqrt(_2923);
        float _2929 = -_2925;
        float _2931 = _2929 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2933 = _2931 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2935 = precise::clamp(_2933, 0.0, 1.0);
        float _2937 = _2913 * _2927;
        float _2939 = _2909 * _2927;
        float _2941 = abs(_2935);
        float _2943 = log2(_2941);
        float _2945 = _2917 * _2927;
        float _2947 = _2937 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2949 = _2543 * _2939;
        float _2951 = -_2939;
        float _2953 = -_2947;
        float _2955 = fma(_2951, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2953);
        float _2957 = fma(_2539, _2937, _2949);
        float _2959 = -_2945;
        float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2955);
        float _2963 = fma(_2545, _2945, _2957);
        float _2965 = precise::clamp(_2963, 0.0, 1.0);
        float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2969 = _2961 + _2967;
        float _2971 = _2943 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2973 = _2969 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2975 = precise::clamp(_2973, 0.0, 1.0);
        float _2977 = exp2(_2971);
        float _2979 = _2977 * _2975;
        float _2981 = _2965 * _2979;
        float _2983 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2985 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2987 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2983;
        out.m_92.y = _2985;
        out.m_92.z = _2987;
    }
    out.m_94.x = _2895;
    out.m_94.y = _2903;
    out.m_94.z = _2901;
    if (!_2885)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2989 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2989;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2741 = false;
    bool _423 = false;
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
        float _3046 = as_type<float>(_129);
        out.gl_Position.z = _3046;
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
        float _3115 = as_type<float>(_167);
        out.gl_Position.z = _3115;
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
    bool _321 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _323 = isnan(_319);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _337 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _339 = isnan(_319);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _355 = _319 + _353;
    float _357 = -_331;
    float _359 = _357 + 1.0;
    bool _361 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _363 = 1.0 / _335;
    float _365 = _347 * _359;
    float _367 = -_347;
    float _369 = _367 + 1.0;
    float _371 = _351 * _363;
    float _373 = fma(_371, _355, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _375 = _373 * _365;
    float _377 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[115].x, _375);
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _385 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[116].x, _377);
    float _387 = in.m_68.x;
    float _389 = in.m_68.y;
    float _391 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _393 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _395 = _383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _397 = _385 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_70.x = _391;
    out.m_70.y = _393;
    out.m_70.z = _395;
    out.m_70.w = _397;
    float _399 = _289 * _389;
    float _401 = _287 * _387;
    bool _403 = !_361;
    float _421;
    if (!_403)
    {
        float _405 = in.m_66.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        float _425 = float(_113);
        float _427 = 1.0 / _425;
        float _429 = _147 * _427;
        _421 = _429;
    }
    _423 = false;
    float _431 = _421;
    float _433 = in.m_66.x;
    float _435 = in.m_66.y;
    float _437 = in.m_66.z;
    float _439 = in.m_66.w;
    float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _443 = in.m_56.x;
    float _445 = in.m_56.y;
    float _447 = in.m_56.z;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _451 = _449 != 0;
    float _453 = in.m_72.x;
    float _455 = in.m_72.y;
    float _457 = in.m_72.z;
    float _459 = in.m_72.w;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _463 = _461 != 0;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _467 = _465 != 0;
    float _469 = in.m_74.x;
    float _471 = in.m_74.y;
    float _473 = in.m_74.z;
    float _475 = in.m_74.w;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _483 = _481 != 0;
    float _485 = in.m_76.x;
    float _487 = in.m_76.y;
    float _489 = in.m_76.z;
    float _491 = in.m_76.w;
    bool _493 = _439 > 0.5;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _499 = _433 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _501 = _433 > 0.5;
    float _503 = 1.0 / _497;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _507 = _445 * _455;
    float _509 = fma(_443, _453, _507);
    float _511 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _513 = _445 * _471;
    float _515 = _445 * _487;
    float _517 = fma(_511, -2.0, _505);
    float _519 = fma(_443, _469, _513);
    float _521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _523 = fma(_443, _485, _515);
    float _525 = fma(_447, _473, _519);
    float _527 = -_183;
    int _529 = _501 ? as_type<int>(_527) : as_type<int>(_183);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _533 = _435 > 0.5;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _535;
    float _539 = fma(_447, _457, _509);
    float _541 = fma(_447, _489, _523);
    float _543 = -_531;
    float _545 = fma(_499, 2.0, _543);
    float _547 = _537 * _503;
    float _549 = -_187;
    int _551 = _533 ? as_type<int>(_549) : as_type<int>(_187);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _555 = _431 + _553;
    bool _557 = !_463;
    float _559 = _557 ? _183 : as_type<float>(_529);
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _563 = _537;
    if (!_451)
    {
        _563 = _437;
    }
    float _565 = _563;
    float _567 = fma(_547, _555, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _569 = _565;
    if (_451)
    {
        _569 = _435;
    }
    float _571 = _569;
    float _573 = _441 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _575 = !_467;
    float _577 = _575 ? _187 : as_type<float>(_551);
    float _579 = _521 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _581 = -_147;
    float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[76].x, _545);
    float _585 = _559 + 0.5;
    float _587 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[83].w, _561);
    float _589 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _517);
    float _591 = _577 + (-0.5);
    float _593 = fma(_573, _585, _583);
    bool _595 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _597 = isnan(_431);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = _541 + _491;
    float _609 = -_579;
    float _611 = -_589;
    float _613 = fma(_609, _591, _611);
    bool _615 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _617 = isnan(_431);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = _539 + _459;
    float _629 = -_605;
    float _631 = _629 + 1.0;
    float _633 = _589;
    float _635 = _613;
    if (!_451)
    {
        _633 = _435;
    }
    float _637 = _633;
    float _639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _641 = _625 * _631;
    float _643 = _637;
    if (_451)
    {
        _643 = _433;
    }
    float _645 = _643;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _649 = _437 > 0.5;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _653 = _567 * _641;
    float _655 = _645 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _657 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[83].z, _647);
    float _659 = -_183;
    int _661 = _649 ? as_type<int>(_659) : as_type<int>(_183);
    float _663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _665 = _645;
    if (!_451)
    {
        _665 = _437;
    }
    float _667 = _665;
    float _669 = -_651;
    float _671 = fma(_655, 2.0, _669);
    float _673 = -_625;
    float _675 = _673 + 1.0;
    float _677 = _667;
    if (_451)
    {
        _677 = _435;
    }
    float _679 = _677;
    float _681 = -_147;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[81].x, _671);
    bool _685 = !_479;
    float _687 = _685 ? _183 : as_type<float>(_661);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _691 = _525 + _475;
    float _693 = _679 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _695 = _639 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _697 = _687 + 0.5;
    float _699 = fma(_693, -2.0, _689);
    float _701 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[131].x, _653);
    float _703 = -_187;
    int _705 = _493 ? as_type<int>(_703) : as_type<int>(_187);
    float _707 = fma(_695, _697, _683);
    float _709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _711 = _627 + _709;
    float _713 = _663 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _715 = !_483;
    float _717 = _715 ? _187 : as_type<float>(_705);
    float _719 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _721 = _691 + _719;
    float _723 = _711 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _725 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _699);
    float _727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _729 = _607 + _727;
    float _731 = _717 + (-0.5);
    float _733 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[28].x, _723);
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _739 = -_713;
    float _741 = -_725;
    float _743 = fma(_739, _731, _741);
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[28].z, _733);
    float _747 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[78].z, _735);
    float _749 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].w, _737);
    float _751 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[132].x, _701);
    float _753 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _657);
    float _755 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _747);
    bool _757 = _745 >= 0.0;
    float _759 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _749);
    float _761 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _587);
    float _763 = -_755;
    float _765 = _763 + 1.0;
    float _767 = -_759;
    float _769 = _767 + 1.0;
    float _771 = -_765;
    float _773 = fma(_559, _771, _593);
    float _775 = _711 * _711;
    float _777 = -_753;
    float _779 = _777 + 1.0;
    float _781 = fma(_577, _769, _613);
    float _783 = fma(_721, _721, _775);
    float _785 = -_761;
    float _787 = _785 + 1.0;
    if (_757)
    {
        _635 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _789 = _635;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _793 = fma(_729, _729, _783);
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _799 = -_779;
    float _801 = fma(_687, _799, _707);
    float _803 = fma(_717, _787, _743);
    float _805 = rsqrt(_793);
    float _807 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = _751 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _815 = as_type<int>(_789);
    if (_757)
    {
        float _817 = _789 * 5.0;
        _815 = as_type<int>(_817);
    }
    int _819 = _815;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _823 = _821 != 0;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _827 = _825 != 0;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _831 = _829 != 0;
    out.m_78.x = _773;
    out.m_78.y = _781;
    out.m_78.z = _801;
    out.m_78.w = _803;
    out.m_80.x = _807;
    out.m_80.y = _809;
    out.m_80.z = _811;
    out.m_80.w = _813;
    bool _833 = !_823;
    int _835 = _833 ? 0 : 1;
    bool _837 = !_827;
    int _839 = _837 ? 0 : 1;
    float _841 = as_type<float>(_819);
    if (_757)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4237 = as_type<float>(_819);
        out.gl_Position.z = _4237;
    }
    bool _843 = !_831;
    int _845 = _843 ? 0 : 1;
    float _847 = _711 * _805;
    float _849 = _721 * _805;
    if (_757)
    {
        out.m_59.x = 0.0;
    }
    if (_757)
    {
        return out;
    }
    float _851 = -_847;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _627);
    float _855 = _729 * _805;
    float _857 = -_849;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[18].w, _691);
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _863 = _853 + _861;
    float _865 = -_855;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _607);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _871 = _859 + _869;
    float _873 = _863 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _877 = _867 + _875;
    float _879 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[28].x, _873);
    float _881 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[28].z, _879);
    bool _883 = _881 >= 0.0;
    if (_883)
    {
        _841 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _885 = _841;
    int _887 = as_type<int>(_885);
    if (_883)
    {
        out.m_59.x = 0.0;
    }
    if (_883)
    {
        float _889 = _885 * 5.0;
        _887 = as_type<int>(_889);
    }
    int _891 = _887;
    if (_883)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4341 = as_type<float>(_891);
        out.gl_Position.z = _4341;
    }
    if (_883)
    {
        return out;
    }
    float _893 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _895 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _897 = floor(_893);
    float _899 = floor(_895);
    float _901 = -_897;
    float _903 = _893 + _901;
    float _905 = -_899;
    float _907 = _895 + _905;
    float2 _4377 = float2(_903, _907);
    float _909 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4377, float2(0.0), isnan(_4377)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4377, float2(0.0), isnan(_4377)), level(0.0)).x;
    float _911 = _437 * 2.0;
    float _913 = _433 * 2.0;
    float _915 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _917 = log2(_915);
    float _919 = -_847;
    float _921 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _711);
    int _923 = abs(_835);
    float _925 = -_849;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _721);
    float _929 = _921 * _921;
    float _931 = float(_923);
    float _933 = floor(_911);
    float _935 = -_855;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _729);
    float _939 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _941 = floor(_913);
    float _943 = _917 * _147;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _947 = 1.0 + _945;
    float _949 = fma(_927, _927, _929);
    float _951 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _953 = fma(_937, _937, _949);
    bool _955 = _933 >= 0.0;
    bool _957 = isnan(_933);
    bool _959 = _955 || _957;
    bool _961 = isnan(0.0);
    bool _963 = _959 || _961;
    float _965 = exp2(_943);
    bool _967 = _933 > 0.0;
    float _969 = _853 + _951;
    int _971 = _963 ? 0 : 1;
    bool _973 = _941 > 0.0;
    float _975 = 1.0 / _947;
    bool _977 = _941 >= 0.0;
    bool _979 = isnan(_941);
    bool _981 = _977 || _979;
    bool _983 = isnan(0.0);
    bool _985 = _981 || _983;
    float _987 = _435 + _437;
    int _989 = ~_971;
    int _991 = _989 + 1;
    int _993 = _991 + 1;
    int _995 = _985 ? 0 : 1;
    float _997 = _987 + (-1.0);
    int _999 = _993;
    int _1001 = 2;
    if (!_967)
    {
        int _1003 = ~_971;
        int _1005 = _1003 + 1;
        _999 = _1005;
    }
    int _1007 = _999;
    float _1009 = -_965;
    float _1011 = _1009 + 1.0;
    float _1013 = in.m_82.x;
    float _1015 = in.m_82.y;
    float _1017 = in.m_82.z;
    int _1019 = ~_995;
    int _1021 = _1019 + 1;
    int _1023 = _1021 + 1;
    float _1025 = sqrt(_953);
    int _1027 = _1023;
    if (!_973)
    {
        int _1029 = ~_995;
        int _1031 = _1029 + 1;
        _1027 = _1031;
    }
    int _1033 = _1027;
    float _1035 = _435 * 2.0;
    float _1037 = float(_1007);
    float _1039 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1041 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1043 = isnan(1.0);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1049 = _1045 || _1047;
    float _1051 = _435 + _433;
    bool _1053 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1055 = isnan(0.0);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1061 = _1057 || _1059;
    float _1063 = floor(_1035);
    float _1065 = _931 * _1037;
    int _1067 = abs(_839);
    float _1069 = _1051 + (-1.0);
    float _1071 = _1065 * (-2.0);
    float _1073 = float(_1067);
    float _1075 = _435 + (-0.5);
    float _1077 = float(_1033);
    float _1079 = _805 * _1025;
    float _1081 = _1061 ? _1011 : 0.0;
    float _1083 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1085 = _433 + (-0.5);
    float _1087 = _1073 * _1077;
    float _1089 = fma(_1071, _1013, _1013);
    if (_1049)
    {
        float _1091 = _1081 * _975;
        _151 = _1091;
    }
    float _1093 = _151;
    bool _1095 = _1063 > 0.0;
    float _1097 = fma(_1083, _1071, _1083);
    float _1099 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1089);
    float _1101 = _1087 * (-2.0);
    bool _1103 = _1063 >= 0.0;
    bool _1105 = isnan(_1063);
    bool _1107 = _1103 || _1105;
    bool _1109 = isnan(0.0);
    bool _1111 = _1107 || _1109;
    float _1113 = _437 + _433;
    float _1115 = fma(_1097, _1093, _1099);
    float _1117 = fma(_1039, _1101, _1039);
    float _1119 = fma(_1101, _1015, _1015);
    int _1121 = _1111 ? 0 : 1;
    float _1123 = _1115 * 0.15915493667125701904296875;
    int _1125 = abs(_845);
    float _1127 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1119);
    int _1129 = ~_1121;
    int _1131 = _1129 + 1;
    int _1133 = _1131 + 1;
    float _1135 = _1113 + (-1.0);
    int _1137 = _1133;
    if (!_1095)
    {
        int _1139 = ~_1121;
        int _1141 = _1139 + 1;
        _1137 = _1141;
    }
    int _1143 = _1137;
    float _1145 = fma(_1117, _1093, _1127);
    float _1147 = float(_1125);
    float _1149 = _1123 * 6.283185482025146484375;
    float _1151 = sin(_1149);
    float _1153 = float(_1143);
    float _1155 = _437 + (-0.5);
    float _1157 = _1145 * 0.15915493667125701904296875;
    float _1159 = _1079 * _939;
    float _1161 = _1147 * _1153;
    float _1163 = _853 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1165 = _1123 * 6.283185482025146484375;
    float _1167 = cos(_1165);
    float _1169 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1171 = _1161 * (-2.0);
    float _1173 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1163);
    float _1175 = fma(_1169, _1171, _1169);
    float _1177 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1173);
    float _1179 = _1157 * 6.283185482025146484375;
    float _1181 = sin(_1179);
    float _1183 = fma(_1171, _1017, _1017);
    float _1185 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1187 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1183);
    float _1189 = _969 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1191 = _1157 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    float _1195 = fma(_1175, _1093, _1187);
    float _1197 = _853 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1199 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1189);
    float _1201 = _1195 * 0.15915493667125701904296875;
    float _1203 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1197);
    float _1205 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1199);
    float _1207 = 1.0 / _1185;
    float _1209 = _1167 * _1181;
    float _1211 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1203);
    float _1213 = _1205 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1215 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1217 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1219 = _1201 * 6.283185482025146484375;
    float _1221 = sin(_1219);
    float _1223 = _1151 * _1193;
    float _1225 = _1217 + _1185;
    float _1227 = _1167 * _1193;
    float _1229 = _1225 * _1207;
    float _1231 = _1229 * 0.5;
    float _1233 = _969 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1235 = _1201 * 6.283185482025146484375;
    float _1237 = cos(_1235);
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1241 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1239);
    float _1243 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1233);
    float _1245 = -_1209;
    float _1247 = fma(_1221, _1223, _1245);
    float _1249 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1243);
    float _1251 = 1.0 / _1241;
    float _1253 = -_1223;
    float _1255 = fma(_1221, _1209, _1253);
    float _1257 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1259 = _1249 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1261 = _1151 * _1181;
    float _1263 = _1215 * _1159;
    float _1265 = _1079 * _1257;
    float _1267 = trunc(_1213);
    int _1269 = int(_1267);
    float _1271 = _1167 * _1237;
    float _1273 = _1193 * _1237;
    float _1275 = _1151 * _1237;
    float _1277 = _1181 * _1237;
    float _1279 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1281 = _1271 * _1263;
    float _1283 = fma(_1221, _1227, _1261);
    float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1287 = _1251 * _1285;
    float _1289 = trunc(_1259);
    int _1291 = int(_1289);
    float _1293 = _1279 * _1265;
    float _1295 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1297 = _1295 * 0.5;
    float _1299 = fma(_1221, _1261, _1227);
    bool _1301 = _1287 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1303 = fma(_1283, _1293, _1281);
    bool _1305 = _1287 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1307 = !_1301;
    int _1309 = _1307 ? 0 : 1;
    float _1311 = fma(_1255, _1297, _1303);
    int _1313 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1315 = _1269 + _1313;
    int _1317 = _1315 + 1;
    float _1319 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1321 = _1317 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1323 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1325 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1327 = _1291 + _1325;
    int _1329 = _1327 + 1;
    int _1331 = _1317;
    int _1333 = as_type<int>(_1323);
    float _1335 = _1213;
    if (!_1301)
    {
        _1001 = 1;
    }
    int _1337 = _1001;
    int _1339 = _1337;
    if (!_1305)
    {
        _1339 = _1309;
    }
    int _1341 = _1339;
    int _1343 = _1317 | _1329;
    int _1345 = _1341 << 6;
    bool _1347 = _1343 < 0;
    bool _1349 = _1347 || _1321;
    float _1351 = -_1263;
    float _1353 = _1221 * _1351;
    int _1355 = _1345 + 96;
    uint _1358 = uint(int(uint(_1355) >> uint(2)));
    uint _1360 = uint(int(uint(int(_1358)) >> uint(2)));
    int _1362 = int(_1358) & 3;
    float _1364 = (*spvDescriptorSet0.vp_c15)._m0[int(_1360)][_1362];
    int _1366 = int(_1358) + 1;
    uint _1368 = uint(int(uint(_1366) >> uint(2)));
    int _1370 = _1366 & 3;
    float _1372 = (*spvDescriptorSet0.vp_c15)._m0[int(_1368)][_1370];
    float _1374 = _1275 * _1263;
    bool _1376 = _1329 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1378 = _1376 || _1349;
    float _1380 = fma(_1273, _1293, _1353);
    bool _1382 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1384 = isnan(0.5);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1390 = _1386 || _1388;
    float _1392 = fma(_1247, _1293, _1374);
    float _1394 = fma(_1277, _1297, _1380);
    int _1396 = _1345 + 104;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    uint _1400 = uint(int(uint(int(_1398)) >> uint(2)));
    int _1402 = int(_1398) & 3;
    float _1404 = (*spvDescriptorSet0.vp_c15)._m0[int(_1400)][_1402];
    int _1406 = int(_1398) + 1;
    uint _1408 = uint(int(uint(_1406) >> uint(2)));
    int _1410 = _1406 & 3;
    float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
    float _1414 = fma(_1299, _1297, _1392);
    float _1416 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1319);
    float _1418 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1323);
    float _1420 = as_type<float>(_1341);
    if (!_1378)
    {
        int _1422 = _1329 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1424 = _1422 + _1317;
        _1331 = _1424;
    }
    int _1426 = _1331;
    int _1428 = _1345 + 48;
    uint _1430 = uint(int(uint(_1428) >> uint(2)));
    uint _1432 = uint(int(uint(int(_1430)) >> uint(2)));
    int _1434 = int(_1430) & 3;
    float _1436 = (*spvDescriptorSet0.vp_c15)._m0[int(_1432)][_1434];
    int _1438 = int(_1430) + 1;
    uint _1440 = uint(int(uint(_1438) >> uint(2)));
    int _1442 = _1438 & 3;
    float _1444 = (*spvDescriptorSet0.vp_c15)._m0[int(_1440)][_1442];
    float _1446 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1416);
    float _1448 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1418);
    float _1450 = 0.0;
    float _1452 = as_type<float>(_1426);
    if (!_1378)
    {
        float _1454 = floor(_1213);
        _1450 = _1454;
    }
    float _1456 = _1450;
    int _1458 = 0;
    if (!_1378)
    {
        int _1460 = _1426 << 2;
        _1458 = _1460;
    }
    int _1462 = _1458;
    float _1464 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1466 = _1462;
    if (!_1378)
    {
        uint _1468 = uint(int(uint(_1426) >> uint(2)));
        _1333 = int(_1468);
    }
    int _1470 = _1333;
    float _1472 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1474 = _1345 + 64;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    uint _1478 = uint(int(uint(int(_1476)) >> uint(2)));
    int _1480 = int(_1476) & 3;
    float _1482 = (*spvDescriptorSet0.vp_c15)._m0[int(_1478)][_1480];
    int _1484 = int(_1476) + 1;
    uint _1486 = uint(int(uint(_1484) >> uint(2)));
    int _1488 = _1484 & 3;
    float _1490 = (*spvDescriptorSet0.vp_c15)._m0[int(_1486)][_1488];
    if (!_1378)
    {
        int _1492 = 12 & _1462;
        _1466 = _1492;
    }
    int _1494 = _1466;
    float _1496 = _607 + _1464;
    float _1498 = _691 + _1472;
    float _1500 = 0.0;
    float _1502 = _1498;
    float _1504 = _1496;
    if (!_1378)
    {
        int _1506 = _1470 << 4;
        int _1508 = _1506 + _1494;
        _1500 = as_type<float>(_1508);
    }
    float _1510 = _1500;
    float _1512 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1514 = _1496 + _1512;
    float _1516 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1518 = _1498 + _1516;
    int _1520 = _1345 + 56;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    uint _1524 = uint(int(uint(int(_1522)) >> uint(2)));
    int _1526 = int(_1522) & 3;
    float _1528 = (*spvDescriptorSet0.vp_c15)._m0[int(_1524)][_1526];
    int _1530 = int(_1522) + 1;
    uint _1532 = uint(int(uint(_1530) >> uint(2)));
    int _1534 = _1530 & 3;
    float _1536 = (*spvDescriptorSet0.vp_c15)._m0[int(_1532)][_1534];
    float _1538 = _1514 * _1514;
    float _1540 = fma(_1518, _1518, _1538);
    int _1542 = _1345 + 72;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    uint _1546 = uint(int(uint(int(_1544)) >> uint(2)));
    int _1548 = int(_1544) & 3;
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[int(_1546)][_1548];
    int _1552 = int(_1544) + 1;
    uint _1554 = uint(int(uint(_1552) >> uint(2)));
    int _1556 = _1552 & 3;
    float _1558 = (*spvDescriptorSet0.vp_c15)._m0[int(_1554)][_1556];
    float _1560 = sqrt(_1540);
    int _1562 = _1345 + 80;
    uint _1564 = uint(int(uint(_1562) >> uint(2)));
    uint _1566 = uint(int(uint(int(_1564)) >> uint(2)));
    int _1568 = int(_1564) & 3;
    float _1570 = (*spvDescriptorSet0.vp_c15)._m0[int(_1566)][_1568];
    int _1572 = int(_1564) + 1;
    uint _1574 = uint(int(uint(_1572) >> uint(2)));
    int _1576 = _1572 & 3;
    float _1578 = (*spvDescriptorSet0.vp_c15)._m0[int(_1574)][_1576];
    float _1580 = _969 * _1372;
    float _1582 = fma(_859, _1364, _1580);
    float _1584 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1586 = _1345 + 88;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    uint _1590 = uint(int(uint(int(_1588)) >> uint(2)));
    int _1592 = int(_1588) & 3;
    float _1594 = (*spvDescriptorSet0.vp_c15)._m0[int(_1590)][_1592];
    int _1596 = int(_1588) + 1;
    uint _1598 = uint(int(uint(_1596) >> uint(2)));
    int _1600 = _1596 & 3;
    float _1602 = (*spvDescriptorSet0.vp_c15)._m0[int(_1598)][_1600];
    float _1604 = fma(_867, _1404, _1582);
    bool _1606 = _1560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1608 = _1311;
    if (!_1378)
    {
        float _1610 = floor(_1259);
        _1608 = _1610;
    }
    float _1612 = _1608;
    float _1614 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1584);
    float _1616 = _1604 + _1412;
    float _1618 = _1510;
    if (!_1378)
    {
        int _1620 = as_type<int>(_1510) + 400;
        uint _1622 = uint(int(uint(_1620) >> uint(2)));
        uint _1624 = uint(int(uint(int(_1622)) >> uint(2)));
        int _1626 = int(_1622) & 3;
        float _1628 = (*spvDescriptorSet0.vp_c15)._m0[int(_1624)][_1626];
        _1618 = _1628;
    }
    float _1630 = _1618;
    float _1632 = _969 * _1444;
    float _1634 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1614);
    float _1636 = 1.0 / _1616;
    float _1638 = fma(_859, _1436, _1632);
    float _1640 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1642 = _969 * _1490;
    float _1644 = _627 + _1640;
    float _1646 = fma(_859, _1482, _1642);
    float _1648 = fma(_867, _1528, _1638);
    float _1650 = fma(_867, _1550, _1646);
    bool _1652 = !_1606;
    float _1654 = _1644;
    float _1656 = _1482;
    float _1658 = _1648;
    float _1660 = _1536;
    float _1662 = _1650;
    float _1664 = _1612;
    if (!_1652)
    {
        float _1666 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1670 = _1560 + _1668;
        float _1672 = _1644 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1674 = rsqrt(_1540);
        float _1676 = _1670 * _1666;
        float _1678 = _1676 * 0.15915493667125701904296875;
        float _1680 = _1678 * 6.283185482025146484375;
        float _1682 = cos(_1680);
        float _1684 = _1678 * 6.283185482025146484375;
        float _1686 = sin(_1684);
        float _1688 = _1682 + (-1.0);
        float _1690 = fma(_1686, _1672, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1692 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1694 = _1674 * _1690;
        float _1696 = fma(_1644, _1682, _1692);
        float _1698 = fma(_1518, _1694, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1700 = fma(_1514, _1694, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1502 = _1698;
        _1654 = _1696;
        _1504 = _1700;
        _1656 = _1678;
    }
    float _1702 = _1502;
    float _1704 = _1654;
    float _1706 = _1504;
    float _1708 = _1656;
    float _1710 = -_849;
    float _1712 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1702);
    float _1714 = -_847;
    float _1716 = fma(_1714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1704);
    float _1718 = -_855;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1706);
    float _1722 = _1648 + _1536;
    float _1724 = _1650 + _1558;
    float _1726 = _1708;
    float _1728 = _1720;
    float _1730 = _1716;
    if (_1390)
    {
        _1658 = _1712;
    }
    float _1732 = _1658;
    float _1734 = _1732;
    if (_1390)
    {
        _1660 = _1716;
    }
    float _1736 = _1660;
    float _1738 = _1736;
    if (_1390)
    {
        _1662 = _1720;
    }
    float _1740 = _1662;
    float _1742 = _1740;
    if (!_1390)
    {
        float _1744 = _863 * _863;
        float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1748 = -_607;
        float _1750 = _1748 + _1706;
        float _1752 = -_627;
        float _1754 = _1752 + _1704;
        float _1756 = fma(_871, _871, _1744);
        float _1758 = -_691;
        float _1760 = _1758 + _1702;
        float _1762 = fma(_877, _877, _1756);
        float _1764 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1766 = sqrt(_1762);
        float _1768 = 1.0 / _1079;
        float _1770 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1772 = precise::min(_1766, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1774 = _1772 * _1746;
        float _1776 = _1774 * _1768;
        float _1778 = _1770 * _1776;
        float _1780 = _1750 * _1776;
        float _1782 = fma(_1754, _1778, _853);
        float _1784 = fma(_1760, _1778, _859);
        float _1786 = fma(_1770, _1780, _867);
        _1738 = _1782;
        _1734 = _1784;
        _1742 = _1786;
        _1726 = _1746;
    }
    float _1788 = _1738;
    float _1790 = _1734;
    float _1792 = _1742;
    float _1794 = _1726;
    float _1796 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1798 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1800 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1802 = _1722 * _1636;
    float _1804 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1796);
    float _1806 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1798);
    float _1808 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1800);
    float _1810 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1812 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1804);
    bool _1814 = _1802 >= 0.0;
    float _1816 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1806);
    float _1818 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1808);
    float _1820 = _1812 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1822 = _1724 * _1636;
    bool _1824 = _1802 <= 1.0;
    bool _1826 = _1824 && _1814;
    float _1828 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1830 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1810);
    float _1832 = _1818 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1834 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1836 = _1822 >= 0.0;
    bool _1838 = _1836 && _1826;
    float _1840 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1830);
    float _1842 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1844 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1834);
    float _1846 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1848 = _1822 <= 1.0;
    bool _1850 = _1848 && _1838;
    float _1852 = _1840 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1854 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1844);
    float _1856 = -_1846;
    float _1858 = fma(_1856, _1842, 1.0);
    float _1860 = _969 * _1578;
    float _1862 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1864 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1854);
    float _1866 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1868 = fma(_859, _1570, _1860);
    float _1870 = log2(_1858);
    float _1872 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1862);
    float _1874 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1866);
    float _1876 = fma(_867, _1594, _1868);
    if (_1850)
    {
        float _1878 = float(_1341);
        _1420 = _1878;
    }
    float _1880 = _1420;
    float _1882 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1872);
    float _1884 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1874);
    float _1886 = _1876 + _1602;
    float _1888 = 1.0 / _1864;
    float _1890 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1882);
    float _1892 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1884);
    float _1894 = _1884;
    float _1896 = _1890;
    if (!_1378)
    {
        float _1898 = -_1612;
        float _1900 = _1259 + _1898;
        _1664 = _1900;
    }
    float _1902 = _1664;
    if (!_1378)
    {
        float _1904 = -_1456;
        float _1906 = _1213 + _1904;
        _1894 = _1906;
    }
    float _1908 = _1894;
    float _1910 = _1886 * _1636;
    float _1912 = _1794;
    if (!_1378)
    {
        float _1914 = rint(_1630);
        float _1916 = precise::max(_1914, 0.0);
        uint _1918 = uint(_1916);
        uint _1920 = clamp(_1918, 0u, 65535u);
        _1912 = as_type<float>(_1920);
    }
    float _1922 = _1912;
    float _1924 = _1870 * 0.693147182464599609375;
    float _1926 = _1924 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1928 = _1862;
    float _1930 = _1926;
    if (_1850)
    {
        float _1932 = rint(_1880);
        float _1934 = precise::max(_1932, 0.0);
        uint _1936 = uint(_1934);
        uint _1938 = clamp(_1936, 0u, 65535u);
        _1928 = as_type<float>(_1938);
    }
    float _1940 = _1928;
    float _1942 = _1890 * _1888;
    float _1944 = _1892 * _1888;
    float _1946 = fma(_1942, 0.5, 0.5);
    float _1948 = fma(_1944, -0.5, 0.5);
    float _1950 = _1456;
    float _1952 = _1948;
    float _1954 = _1946;
    if (!_1378)
    {
        float3 _6032 = float3(_1908, _1902, float(as_type<int>(_1922)));
        float3 _6036 = select(_6032, float3(0.0), isnan(_6032));
        float _1956 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6036.xy, uint(rint(_6036.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6036.xy, uint(rint(_6036.z)), level(0.0)).x;
        _1950 = _1956;
    }
    float _1958 = _1950;
    float _1960 = _1822;
    if (_1850)
    {
        float3 _6051 = float3(_1802, _1822, float(as_type<int>(_1940)));
        float3 _6053 = select(_6051, float3(0.0), isnan(_6051));
        float _1962 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6053.xy, uint(rint(_6053.z)), _1910, level(0.0));
        _1960 = _1962;
    }
    float _1964 = _1960;
    float3 _6063 = float3(_1946, _1948, _1926);
    float _1966 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6063, float3(0.0), isnan(_6063)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6063, float3(0.0), isnan(_6063)), level(0.0)).x;
    float3 _6072 = float3(_1946, _1948, _1926);
    float4 _1969 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6072, float3(0.0), isnan(_6072)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6072, float3(0.0), isnan(_6072)), level(0.0)).xyzw;
    float _1971 = _1969.x;
    float _1973 = _1969.y;
    float _1975 = _1969.z;
    float _1977 = _1969.w;
    bool _1979 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1981 = isnan(0.5);
    bool _1983 = _1979 || _1981;
    bool _1985 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1987 = _1983 || _1985;
    if (_1378)
    {
        _1728 = 1.0;
    }
    float _1989 = _1728;
    float _1991 = _1989;
    if (_1987)
    {
        _1335 = 1.0;
    }
    float _1993 = _1335;
    float _1995 = _1993;
    if (_1987)
    {
        _1730 = 1.0;
    }
    float _1997 = _1730;
    float _1999 = _1997;
    if (!_1987)
    {
        float _2001 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2003 = _2001 * 0.15915493667125701904296875;
        float _2005 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2007 = _2003 * 6.283185482025146484375;
        float _2009 = cos(_2007);
        float _2011 = _2005 * 0.15915493667125701904296875;
        float _2013 = _2003 * 6.283185482025146484375;
        float _2015 = sin(_2013);
        float _2017 = 1.0 / _2009;
        float _2019 = _2011 * 6.283185482025146484375;
        float _2021 = cos(_2019);
        float _2023 = _2015 * _2017;
        float _2025 = _2011 * 6.283185482025146484375;
        float _2027 = sin(_2025);
        float _2029 = _2021 * _2023;
        float _2031 = 1.0 / _2029;
        float _2033 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2035 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2033;
        float _2037 = 1.0 / _2035;
        float _2039 = _2027 * _2031;
        float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2043 = fma(_1287, _2039, _2041);
        float _2045 = _2043 * _2037;
        float _2047 = precise::clamp(_2045, 0.0, 1.0);
        _1952 = _2043;
        _1954 = _2011;
        _1999 = _2047;
    }
    float _2049 = _1952;
    float _2051 = _1954;
    float _2053 = _1999;
    float _2055 = _2051;
    float _2057 = _2049;
    if (!_1987)
    {
        float _2059 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2061 = _2059 * 0.15915493667125701904296875;
        float _2063 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2065 = _2061 * 6.283185482025146484375;
        float _2067 = cos(_2065);
        float _2069 = _2063 * 0.15915493667125701904296875;
        float _2071 = _2061 * 6.283185482025146484375;
        float _2073 = sin(_2071);
        float _2075 = 1.0 / _2067;
        float _2077 = _2069 * 6.283185482025146484375;
        float _2079 = cos(_2077);
        float _2081 = _2073 * _2075;
        float _2083 = _2069 * 6.283185482025146484375;
        float _2085 = sin(_2083);
        float _2087 = _2079 * _2081;
        float _2089 = 1.0 / _2087;
        float _2091 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2093 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2091;
        float _2095 = 1.0 / _2093;
        float _2097 = _2085 * _2089;
        float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2101 = fma(_1287, _2097, _2099);
        float _2103 = _2101 * _2095;
        float _2105 = precise::clamp(_2103, 0.0, 1.0);
        float _2107 = -_2105;
        float _2109 = _2107 + 1.0;
        _2055 = _2087;
        _2057 = _2075;
        _1995 = _2109;
    }
    float _2111 = _2055;
    float _2113 = _2057;
    float _2115 = _1995;
    if (!_1378)
    {
        int _2117 = _1426 << 4;
        int _2119 = _2117 + 2048;
        uint _2121 = uint(int(uint(_2119) >> uint(2)));
        uint _2123 = uint(int(uint(int(_2121)) >> uint(2)));
        int _2125 = int(_2121) & 3;
        float _2127 = (*spvDescriptorSet0.vp_c15)._m0[int(_2123)][_2125];
        int _2129 = int(_2121) + 1;
        uint _2131 = uint(int(uint(_2129) >> uint(2)));
        int _2133 = _2129 & 3;
        float _2135 = (*spvDescriptorSet0.vp_c15)._m0[int(_2131)][_2133];
        int _2137 = _2119 + 8;
        uint _2139 = uint(int(uint(_2137) >> uint(2)));
        uint _2141 = uint(int(uint(int(_2139)) >> uint(2)));
        int _2143 = int(_2139) & 3;
        float _2145 = (*spvDescriptorSet0.vp_c15)._m0[int(_2141)][_2143];
        int _2147 = int(_2139) + 1;
        uint _2149 = uint(int(uint(_2147) >> uint(2)));
        int _2151 = _2147 & 3;
        float _2153 = (*spvDescriptorSet0.vp_c15)._m0[int(_2149)][_2151];
        float _2155 = _969 * _2135;
        float _2157 = fma(_859, _2127, _2155);
        float _2159 = fma(_867, _2145, _2157);
        float _2161 = _2159 + _2153;
        float _2163 = precise::clamp(_2161, 0.0, 1.0);
        float _2165 = -_2163;
        float _2167 = _2165 + _1958;
        float _2169 = fma(_2167, 500.0, 1.5);
        float _2171 = exp2(_2169);
        float _2173 = 0.0 + _2171;
        float _2175 = precise::clamp(_2173, 0.0, 1.0);
        _1452 = as_type<float>(_2119);
        _1991 = _2175;
    }
    float _2177 = _1452;
    float _2179 = _1991;
    float _2181 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2183 = _1788 + _2181;
    float _2185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2187 = _1790 + _2185;
    float _2189 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2191 = _1792 + _2189;
    float _2193 = _2183 * _2183;
    float _2195 = fma(_2187, _2187, _2193);
    float _2197 = fma(_2191, _2191, _2195);
    float _2199 = rsqrt(_2197);
    float _2201 = sqrt(_2197);
    float _2203 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2205 = _2187 * _2203;
    float _2207 = _2191 * _2203;
    float _2209 = _2205 * _2205;
    float _2211 = _2207 * _2207;
    float _2213 = _2209 + _2211;
    float _2215 = sqrt(_2213);
    bool _2217 = _2215 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2221 = _2215 + _2219;
    float _2223 = _2111;
    float _2225 = _2213;
    float _2227 = _2221;
    float _2229 = _2205;
    float _2231 = _2207;
    float _2233 = _2209;
    float _2235 = _2211;
    if (_2217)
    {
        float _2237 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2223 = _2237;
    }
    float _2239 = _2223;
    if (_2217)
    {
        float _2241 = rsqrt(_2213);
        _2225 = _2241;
    }
    float _2243 = _2225;
    if (_2217)
    {
        float _2245 = _2221 * _2239;
        _2227 = _2245;
    }
    float _2247 = _2227;
    if (_2217)
    {
        float _2249 = _2247 * 0.15915493667125701904296875;
        _1930 = _2249;
    }
    float _2251 = _1930;
    float _2253 = _2113;
    if (_2217)
    {
        float _2255 = _2251 * 6.283185482025146484375;
        float _2257 = sin(_2255);
        _2253 = _2257;
    }
    float _2259 = _2253;
    float _2261 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2263 = precise::max(0.0, _2261);
    float _2265 = _2177;
    float _2267 = _2263;
    float _2269 = _2261;
    if (_2217)
    {
        float _2271 = _2251 * 6.283185482025146484375;
        float _2273 = cos(_2271);
        _2265 = _2273;
    }
    float _2275 = _2265;
    float _2277 = -_2203;
    float _2279 = -_2263;
    float _2281 = fma(_2183, _2277, _2279);
    float _2283 = _2281;
    if (_2217)
    {
        float _2285 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2267 = _2285;
    }
    float _2287 = _2267;
    float _2289 = _2259;
    float _2291 = _2287;
    if (_2217)
    {
        float _2293 = fma(_2259, _2287, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2289 = _2293;
    }
    float _2295 = _2289;
    float _2297 = _2295;
    if (_2217)
    {
        float _2299 = _2275 + (-1.0);
        _2269 = _2299;
    }
    float _2301 = _2269;
    if (_2217)
    {
        float _2303 = _2243 * _2295;
        _2297 = _2303;
    }
    float _2305 = _2297;
    if (_2217)
    {
        float _2307 = _2301 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2291 = _2307;
    }
    float _2309 = _2291;
    if (_2217)
    {
        float _2311 = _2205 * _2305;
        _2229 = _2311;
    }
    float _2313 = _2229;
    if (_2217)
    {
        float _2315 = _2207 * _2305;
        _2231 = _2315;
    }
    float _2317 = _2231;
    if (_2217)
    {
        float _2319 = fma(_2281, _2275, _2309);
        _2283 = _2319;
    }
    float _2321 = _2283;
    if (_2217)
    {
        float _2323 = _2313 * _2313;
        _2233 = _2323;
    }
    float _2325 = _2233;
    if (_2217)
    {
        float _2327 = _2317 * _2317;
        _2235 = _2327;
    }
    float _2329 = _2235;
    float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2333 = fma(_2201, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2331);
    float _2335 = precise::clamp(_2333, 0.0, 1.0);
    float _2337 = fma(_2321, _2321, _2325);
    float _2339 = -_2335;
    float _2341 = _2339 + 1.0;
    float _2343 = _2337 + _2329;
    float _2345 = rsqrt(_2343);
    float _2347 = _2345 * _2321;
    float _2349 = _2345 * _2313;
    float _2351 = abs(_2341);
    float _2353 = log2(_2351);
    float _2355 = _2345 * _2317;
    float _2357 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2359 = -_2357;
    float _2361 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2359);
    float _2363 = -_2355;
    float _2365 = fma(_2363, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2361);
    float _2367 = fma(_2365, -0.5, 0.5);
    float _2369 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2371 = fma(_2365, 0.5, 0.5);
    float _2373 = _2347 + 1.0;
    float _2375 = sqrt(_2367);
    float _2377 = fma(_2371, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2379 = fma(_2371, _2377, -0.212114393711090087890625);
    float _2381 = exp2(_2369);
    float _2383 = fma(_2371, _2379, 1.570728778839111328125);
    float _2385 = _2375 * 0.636619746685028076171875;
    float _2387 = -_2383;
    float _2389 = fma(_2385, _2387, 1.0);
    float _2391 = -_2347;
    float _2393 = fma(_2381, _2373, _2391);
    float _2395 = fma(_2393, 0.5, 0.5);
    float2 _6690 = float2(_2389, _2395);
    float3 _2399 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6690, float2(0.0), isnan(_6690)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6690, float2(0.0), isnan(_6690)), level(0.0)).xyz;
    float _2401 = _2399.x;
    float _2403 = _2399.y;
    float _2405 = _2399.z;
    float _2407 = abs(_1287);
    float _2409 = log2(_2407);
    float _2411 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2413 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2415 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2417 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2419 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2421 = -_1221;
    float _2423 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2411);
    float _2425 = -_1221;
    float _2427 = fma(_2425, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2413);
    float _2429 = -_1221;
    float _2431 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2415);
    float _2433 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2435 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2437 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2439 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2441 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2443 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2417);
    float _2445 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2419);
    float _2447 = _2409 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2449 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2433);
    float _2451 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2435);
    float _2453 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2441);
    float _2455 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2437);
    float _2457 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2439);
    float _2459 = exp2(_2447);
    float _2461 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2423);
    float _2463 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2427);
    float _2465 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2467 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2431);
    float _2469 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2443);
    float _2471 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2445);
    float _2473 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2449);
    float _2475 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2451);
    float _2477 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2453);
    float _2479 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2455);
    float _2481 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2457);
    float _2483 = _2465 * _2461;
    float _2485 = _2465 * _2463;
    float _2487 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2489 = _2465 * _2467;
    float _2491 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2493 = fma(_2487, _2469, _2483);
    float _2495 = fma(_2487, _2471, _2485);
    float _2497 = fma(_2487, _2473, _2489);
    float _2499 = fma(_2459, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2501 = precise::clamp(_2499, 0.0, 1.0);
    float _2503 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2477);
    float _2505 = _1864 * 0.5;
    float _2507 = exp2(_2491);
    float _2509 = fma(_2501, -2.0, 3.0);
    float _2511 = _2501 * _2501;
    float _2513 = fma(_1892, -0.5, _2505);
    out.gl_Position.x = _1890;
    out.gl_Position.y = _1892;
    out.gl_Position.z = _2503;
    out.gl_Position.w = _1864;
    bool _2515 = _1287 <= 8000.0;
    bool _2517 = isnan(_1287);
    bool _2519 = _2515 || _2517;
    bool _2521 = isnan(8000.0);
    bool _2523 = _2519 || _2521;
    float _2525 = float(_2523);
    float _2527 = _2511 * _2509;
    float _2529 = _2503 + _1864;
    float _2531 = -_909;
    float _2533 = _2531 + 1.0;
    float _2535 = _1890 + _1864;
    float _2537 = _2529 * 0.5;
    float _2539 = _2475 + _2493;
    float _2541 = _2535 * 0.5;
    float _2543 = _2479 + _2495;
    float _2545 = _2481 + _2497;
    bool _2547 = _2201 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2549 = isnan(_2201);
    bool _2551 = _2547 || _2549;
    bool _2553 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2555 = _2551 || _2553;
    float _2557 = -_2527;
    float _2559 = _2557 + 1.0;
    float _2561 = -_2507;
    float _2563 = _2561 + 1.0;
    if (!_1850)
    {
        _1896 = 1.0;
    }
    float _2565 = _1896;
    out.m_84.x = _2541;
    out.m_84.y = _2513;
    out.m_84.z = _2537;
    out.m_84.w = _1864;
    float _2567 = fma(_2559, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2527);
    float _2569 = _2565;
    float _2571 = _2403;
    float _2573 = _2401;
    if (_1850)
    {
        bool _2575 = _1964 >= _1910;
        bool _2577 = isnan(_1964);
        bool _2579 = _2575 || _2577;
        bool _2581 = isnan(_1910);
        bool _2583 = _2579 || _2581;
        float _2585 = float(_2583);
        _2569 = _2585;
    }
    float _2587 = _2569;
    float _2589 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _2539;
    out.m_86.y = _2543;
    out.m_86.z = _2545;
    float _2591 = _2525 * _2567;
    float _2593 = _2589 * _1966;
    float _2595 = _2587 * _2179;
    float _2597 = _2591 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2599 = -_2589;
    float _2601 = _2599 + 1.0;
    float _2603 = _1977 * _2593;
    float _2605 = _2589;
    float _2607 = _2601;
    if (!_2555)
    {
        _2605 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2609 = _2605;
    float _2611 = _2533 * _2597;
    float _2613 = precise::clamp(_2611, 0.0, 1.0);
    float _2615 = -_2613;
    float _2617 = fma(_2615, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2619 = -_2595;
    float _2621 = fma(_2619, _2617, 1.0);
    float _2623 = precise::clamp(_2621, 0.0, 1.0);
    float _2625 = _2617;
    float _2627 = _2609;
    float _2629 = _2609;
    if (!_2555)
    {
        _2625 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2631 = _2625;
    float _2633 = _2405 * _2593;
    float _2635 = fma(_2401, _2603, _1971);
    float _2637 = fma(_2403, _2603, _1973);
    float _2639 = _2623 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2641 = _1977 * _2601;
    float _2643 = fma(_1977, _2633, _1975);
    float _2645 = _2053 * _2115;
    float _2647 = _2645;
    float _2649 = _2631;
    float _2651 = _2631;
    if (!_2555)
    {
        _2571 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2653 = _2571;
    out.m_88.x = _2639;
    float _2655 = _2653;
    float _2657 = _2653;
    if (!_2555)
    {
        _2573 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2659 = _2573;
    float _2661 = _2645 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2663 = _2659;
    float _2665 = _2659;
    if (!_2555)
    {
        _2607 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2667 = _2607;
    out.m_90.x = _2635;
    out.m_90.y = _2637;
    out.m_90.z = _2643;
    out.m_90.w = _2641;
    float _2669 = _2667;
    float _2671 = _2667;
    if (!_2555)
    {
        _2647 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2673 = _2647;
    bool _2675 = !_2555;
    float _2677 = _2673;
    float _2679 = _2673;
    if (!_2675)
    {
        bool _2681 = _2201 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2683 = isnan(_2201);
        bool _2685 = _2681 || _2683;
        bool _2687 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2689 = _2685 || _2687;
        if (!_2689)
        {
            float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2693 = _2201 + _2691;
            float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2697 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2695;
            float _2699 = 1.0 / _2697;
            float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2707 = _2705 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2713 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2715 = _2713 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2721 = _2693 * _2699;
            float _2723 = precise::clamp(_2721, 0.0, 1.0);
            float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2727 = _2725 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2729 = fma(_2723, _2703, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2731 = fma(_2723, _2727, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2733 = fma(_2723, _2707, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2735 = fma(_2723, _2711, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2737 = fma(_2723, _2715, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2739 = fma(_2723, _2719, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2665 = _2731;
            _2651 = _2737;
            _2657 = _2729;
            _2671 = _2735;
            _2629 = _2733;
            _2679 = _2739;
            _2741 = true;
        }
        else
        {
            bool _2743 = _2201 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2745 = isnan(_2201);
            bool _2747 = _2743 || _2745;
            bool _2749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2751 = _2747 || _2749;
            if (!_2751)
            {
                _2655 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2753 = _2655;
            _2657 = _2753;
            if (!_2751)
            {
                _2663 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2755 = _2663;
            _2665 = _2755;
            if (!_2751)
            {
                _2627 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2757 = _2627;
            _2629 = _2757;
            if (!_2751)
            {
                _2669 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2759 = _2669;
            _2671 = _2759;
            if (!_2751)
            {
                _2649 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2761 = _2649;
            _2651 = _2761;
            if (!_2751)
            {
                _2677 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2763 = _2677;
            bool _2765 = !_2751;
            _2679 = _2763;
            if (!_2765)
            {
                bool _2767 = _2201 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2769 = isnan(_2201);
                bool _2771 = _2767 || _2769;
                bool _2773 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2775 = _2771 || _2773;
                if (!_2775)
                {
                    float _2777 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2779 = _2201 + _2777;
                    float _2781 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2783 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2781;
                    float _2785 = 1.0 / _2783;
                    float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2793 = _2791 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2797 = _2795 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2799 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2801 = _2799 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2805 = _2803 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2807 = _2779 * _2785;
                    float _2809 = precise::clamp(_2807, 0.0, 1.0);
                    float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2813 = _2811 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2815 = fma(_2809, _2789, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2817 = fma(_2809, _2813, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2819 = fma(_2809, _2793, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2821 = fma(_2809, _2797, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2823 = fma(_2809, _2801, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2825 = fma(_2809, _2805, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2665 = _2817;
                    _2651 = _2823;
                    _2657 = _2815;
                    _2671 = _2821;
                    _2629 = _2819;
                    _2679 = _2825;
                    _2741 = true;
                }
                else
                {
                    _2665 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2651 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2657 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2671 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2629 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2679 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2741 = false;
    float _2827 = _2665;
    float _2829 = _2651;
    float _2831 = _2657;
    float _2833 = _2671;
    float _2835 = _2629;
    float _2837 = _2679;
    float _2839 = fma(_2543, -0.5, 0.5);
    float _2841 = precise::clamp(_2839, 0.0, 1.0);
    float _2843 = -_2827;
    float _2845 = _2843 + _2829;
    float _2847 = -_2831;
    float _2849 = _2847 + _2833;
    out.m_92.x = 0.0;
    float _2851 = fma(_2841, _2845, _2827);
    float _2853 = -_2835;
    float _2855 = _2853 + _2837;
    float _2857 = fma(_2841, _2849, _2831);
    float _2859 = _2851 * 0.586610972881317138671875;
    bool _2861 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2863 = fma(_2841, _2855, _2835);
    float _2865 = _2661 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2867 = fma(_2857, 0.298911988735198974609375, _2859);
    bool _2869 = _2053 > 0.0;
    bool _2871 = isnan(_2053);
    bool _2873 = _2869 || _2871;
    bool _2875 = isnan(0.0);
    bool _2877 = _2873 || _2875;
    float _2879 = fma(_2863, 0.114477999508380889892578125, _2867);
    out.m_59.x = _2865;
    bool _2881 = _2115 <= 0.0;
    bool _2883 = !_2877;
    bool _2885 = _2881 || _2883;
    float _2887 = -_2879;
    float _2889 = _2857 + _2887;
    float _2891 = -_2879;
    float _2893 = _2863 + _2891;
    float _2895 = fma(_2889, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2879);
    float _2897 = -_2879;
    float _2899 = _2851 + _2897;
    float _2901 = fma(_2893, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2879);
    float _2903 = fma(_2899, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2879);
    bool _2905 = !_2861;
    if (!_2905)
    {
        float _2907 = -_1788;
        float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2911 = -_1790;
        float _2913 = _2911 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2915 = -_1792;
        float _2917 = _2915 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2919 = _2909 * _2909;
        float _2921 = fma(_2913, _2913, _2919);
        float _2923 = fma(_2917, _2917, _2921);
        float _2925 = sqrt(_2923);
        float _2927 = rsqrt(_2923);
        float _2929 = -_2925;
        float _2931 = _2929 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2933 = _2931 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2935 = precise::clamp(_2933, 0.0, 1.0);
        float _2937 = _2913 * _2927;
        float _2939 = _2909 * _2927;
        float _2941 = abs(_2935);
        float _2943 = log2(_2941);
        float _2945 = _2917 * _2927;
        float _2947 = _2937 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2949 = _2543 * _2939;
        float _2951 = -_2939;
        float _2953 = -_2947;
        float _2955 = fma(_2951, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2953);
        float _2957 = fma(_2539, _2937, _2949);
        float _2959 = -_2945;
        float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2955);
        float _2963 = fma(_2545, _2945, _2957);
        float _2965 = precise::clamp(_2963, 0.0, 1.0);
        float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2969 = _2961 + _2967;
        float _2971 = _2943 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2973 = _2969 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2975 = precise::clamp(_2973, 0.0, 1.0);
        float _2977 = exp2(_2971);
        float _2979 = _2977 * _2975;
        float _2981 = _2965 * _2979;
        float _2983 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2985 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2987 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2983;
        out.m_92.y = _2985;
        out.m_92.z = _2987;
    }
    out.m_94.x = _2895;
    out.m_94.y = _2903;
    out.m_94.z = _2901;
    if (!_2885)
    {
        return out;
    }
    float _2989 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2989;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2741 = false;
    bool _423 = false;
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
        float _3046 = as_type<float>(_129);
        out.gl_Position.z = _3046;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3115 = as_type<float>(_167);
        out.gl_Position.z = _3115;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _321 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _323 = isnan(_319);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _337 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _339 = isnan(_319);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _355 = _319 + _353;
    float _357 = -_331;
    float _359 = _357 + 1.0;
    bool _361 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _363 = 1.0 / _335;
    float _365 = _347 * _359;
    float _367 = -_347;
    float _369 = _367 + 1.0;
    float _371 = _351 * _363;
    float _373 = fma(_371, _355, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _375 = _373 * _365;
    float _377 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[115].x, _375);
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _385 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[116].x, _377);
    float _387 = in.m_68.x;
    float _389 = in.m_68.y;
    float _391 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _393 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _395 = _383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _397 = _385 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_70.x = _391;
    out.m_70.y = _393;
    out.m_70.z = _395;
    out.m_70.w = _397;
    float _399 = _289 * _389;
    float _401 = _287 * _387;
    bool _403 = !_361;
    float _421;
    if (!_403)
    {
        float _405 = in.m_66.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        float _425 = float(_113);
        float _427 = 1.0 / _425;
        float _429 = _147 * _427;
        _421 = _429;
    }
    _423 = false;
    float _431 = _421;
    float _433 = in.m_66.x;
    float _435 = in.m_66.y;
    float _437 = in.m_66.z;
    float _439 = in.m_66.w;
    float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _443 = in.m_56.x;
    float _445 = in.m_56.y;
    float _447 = in.m_56.z;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _451 = _449 != 0;
    float _453 = in.m_72.x;
    float _455 = in.m_72.y;
    float _457 = in.m_72.z;
    float _459 = in.m_72.w;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _463 = _461 != 0;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _467 = _465 != 0;
    float _469 = in.m_74.x;
    float _471 = in.m_74.y;
    float _473 = in.m_74.z;
    float _475 = in.m_74.w;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _483 = _481 != 0;
    float _485 = in.m_76.x;
    float _487 = in.m_76.y;
    float _489 = in.m_76.z;
    float _491 = in.m_76.w;
    bool _493 = _439 > 0.5;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _499 = _433 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _501 = _433 > 0.5;
    float _503 = 1.0 / _497;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _507 = _445 * _455;
    float _509 = fma(_443, _453, _507);
    float _511 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _513 = _445 * _471;
    float _515 = _445 * _487;
    float _517 = fma(_511, -2.0, _505);
    float _519 = fma(_443, _469, _513);
    float _521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _523 = fma(_443, _485, _515);
    float _525 = fma(_447, _473, _519);
    float _527 = -_183;
    int _529 = _501 ? as_type<int>(_527) : as_type<int>(_183);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _533 = _435 > 0.5;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _535;
    float _539 = fma(_447, _457, _509);
    float _541 = fma(_447, _489, _523);
    float _543 = -_531;
    float _545 = fma(_499, 2.0, _543);
    float _547 = _537 * _503;
    float _549 = -_187;
    int _551 = _533 ? as_type<int>(_549) : as_type<int>(_187);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _555 = _431 + _553;
    bool _557 = !_463;
    float _559 = _557 ? _183 : as_type<float>(_529);
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _563 = _537;
    if (!_451)
    {
        _563 = _437;
    }
    float _565 = _563;
    float _567 = fma(_547, _555, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _569 = _565;
    if (_451)
    {
        _569 = _435;
    }
    float _571 = _569;
    float _573 = _441 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _575 = !_467;
    float _577 = _575 ? _187 : as_type<float>(_551);
    float _579 = _521 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _581 = -_147;
    float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[76].x, _545);
    float _585 = _559 + 0.5;
    float _587 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[83].w, _561);
    float _589 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _517);
    float _591 = _577 + (-0.5);
    float _593 = fma(_573, _585, _583);
    bool _595 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _597 = isnan(_431);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = _541 + _491;
    float _609 = -_579;
    float _611 = -_589;
    float _613 = fma(_609, _591, _611);
    bool _615 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _617 = isnan(_431);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = _539 + _459;
    float _629 = -_605;
    float _631 = _629 + 1.0;
    float _633 = _589;
    float _635 = _613;
    if (!_451)
    {
        _633 = _435;
    }
    float _637 = _633;
    float _639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _641 = _625 * _631;
    float _643 = _637;
    if (_451)
    {
        _643 = _433;
    }
    float _645 = _643;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _649 = _437 > 0.5;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _653 = _567 * _641;
    float _655 = _645 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _657 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[83].z, _647);
    float _659 = -_183;
    int _661 = _649 ? as_type<int>(_659) : as_type<int>(_183);
    float _663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _665 = _645;
    if (!_451)
    {
        _665 = _437;
    }
    float _667 = _665;
    float _669 = -_651;
    float _671 = fma(_655, 2.0, _669);
    float _673 = -_625;
    float _675 = _673 + 1.0;
    float _677 = _667;
    if (_451)
    {
        _677 = _435;
    }
    float _679 = _677;
    float _681 = -_147;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[81].x, _671);
    bool _685 = !_479;
    float _687 = _685 ? _183 : as_type<float>(_661);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _691 = _525 + _475;
    float _693 = _679 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _695 = _639 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _697 = _687 + 0.5;
    float _699 = fma(_693, -2.0, _689);
    float _701 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[131].x, _653);
    float _703 = -_187;
    int _705 = _493 ? as_type<int>(_703) : as_type<int>(_187);
    float _707 = fma(_695, _697, _683);
    float _709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _711 = _627 + _709;
    float _713 = _663 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _715 = !_483;
    float _717 = _715 ? _187 : as_type<float>(_705);
    float _719 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _721 = _691 + _719;
    float _723 = _711 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _725 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _699);
    float _727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _729 = _607 + _727;
    float _731 = _717 + (-0.5);
    float _733 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[28].x, _723);
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _739 = -_713;
    float _741 = -_725;
    float _743 = fma(_739, _731, _741);
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[28].z, _733);
    float _747 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[78].z, _735);
    float _749 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].w, _737);
    float _751 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[132].x, _701);
    float _753 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _657);
    float _755 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _747);
    bool _757 = _745 >= 0.0;
    float _759 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _749);
    float _761 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _587);
    float _763 = -_755;
    float _765 = _763 + 1.0;
    float _767 = -_759;
    float _769 = _767 + 1.0;
    float _771 = -_765;
    float _773 = fma(_559, _771, _593);
    float _775 = _711 * _711;
    float _777 = -_753;
    float _779 = _777 + 1.0;
    float _781 = fma(_577, _769, _613);
    float _783 = fma(_721, _721, _775);
    float _785 = -_761;
    float _787 = _785 + 1.0;
    if (_757)
    {
        _635 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _789 = _635;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _793 = fma(_729, _729, _783);
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _799 = -_779;
    float _801 = fma(_687, _799, _707);
    float _803 = fma(_717, _787, _743);
    float _805 = rsqrt(_793);
    float _807 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = _751 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _815 = as_type<int>(_789);
    if (_757)
    {
        float _817 = _789 * 5.0;
        _815 = as_type<int>(_817);
    }
    int _819 = _815;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _823 = _821 != 0;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _827 = _825 != 0;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _831 = _829 != 0;
    out.m_78.x = _773;
    out.m_78.y = _781;
    out.m_78.z = _801;
    out.m_78.w = _803;
    out.m_80.x = _807;
    out.m_80.y = _809;
    out.m_80.z = _811;
    out.m_80.w = _813;
    bool _833 = !_823;
    int _835 = _833 ? 0 : 1;
    bool _837 = !_827;
    int _839 = _837 ? 0 : 1;
    float _841 = as_type<float>(_819);
    if (_757)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4237 = as_type<float>(_819);
        out.gl_Position.z = _4237;
    }
    bool _843 = !_831;
    int _845 = _843 ? 0 : 1;
    float _847 = _711 * _805;
    float _849 = _721 * _805;
    if (_757)
    {
        out.m_59.x = 0.0;
    }
    if (_757)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _851 = -_847;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _627);
    float _855 = _729 * _805;
    float _857 = -_849;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[18].w, _691);
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _863 = _853 + _861;
    float _865 = -_855;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _607);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _871 = _859 + _869;
    float _873 = _863 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _877 = _867 + _875;
    float _879 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[28].x, _873);
    float _881 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[28].z, _879);
    bool _883 = _881 >= 0.0;
    if (_883)
    {
        _841 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _885 = _841;
    int _887 = as_type<int>(_885);
    if (_883)
    {
        out.m_59.x = 0.0;
    }
    if (_883)
    {
        float _889 = _885 * 5.0;
        _887 = as_type<int>(_889);
    }
    int _891 = _887;
    if (_883)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4341 = as_type<float>(_891);
        out.gl_Position.z = _4341;
    }
    if (_883)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _893 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _895 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _897 = floor(_893);
    float _899 = floor(_895);
    float _901 = -_897;
    float _903 = _893 + _901;
    float _905 = -_899;
    float _907 = _895 + _905;
    float2 _4377 = float2(_903, _907);
    float _909 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4377, float2(0.0), isnan(_4377)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4377, float2(0.0), isnan(_4377)), level(0.0)).x;
    float _911 = _437 * 2.0;
    float _913 = _433 * 2.0;
    float _915 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _917 = log2(_915);
    float _919 = -_847;
    float _921 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _711);
    int _923 = abs(_835);
    float _925 = -_849;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _721);
    float _929 = _921 * _921;
    float _931 = float(_923);
    float _933 = floor(_911);
    float _935 = -_855;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _729);
    float _939 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _941 = floor(_913);
    float _943 = _917 * _147;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _947 = 1.0 + _945;
    float _949 = fma(_927, _927, _929);
    float _951 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _953 = fma(_937, _937, _949);
    bool _955 = _933 >= 0.0;
    bool _957 = isnan(_933);
    bool _959 = _955 || _957;
    bool _961 = isnan(0.0);
    bool _963 = _959 || _961;
    float _965 = exp2(_943);
    bool _967 = _933 > 0.0;
    float _969 = _853 + _951;
    int _971 = _963 ? 0 : 1;
    bool _973 = _941 > 0.0;
    float _975 = 1.0 / _947;
    bool _977 = _941 >= 0.0;
    bool _979 = isnan(_941);
    bool _981 = _977 || _979;
    bool _983 = isnan(0.0);
    bool _985 = _981 || _983;
    float _987 = _435 + _437;
    int _989 = ~_971;
    int _991 = _989 + 1;
    int _993 = _991 + 1;
    int _995 = _985 ? 0 : 1;
    float _997 = _987 + (-1.0);
    int _999 = _993;
    int _1001 = 2;
    if (!_967)
    {
        int _1003 = ~_971;
        int _1005 = _1003 + 1;
        _999 = _1005;
    }
    int _1007 = _999;
    float _1009 = -_965;
    float _1011 = _1009 + 1.0;
    float _1013 = in.m_82.x;
    float _1015 = in.m_82.y;
    float _1017 = in.m_82.z;
    int _1019 = ~_995;
    int _1021 = _1019 + 1;
    int _1023 = _1021 + 1;
    float _1025 = sqrt(_953);
    int _1027 = _1023;
    if (!_973)
    {
        int _1029 = ~_995;
        int _1031 = _1029 + 1;
        _1027 = _1031;
    }
    int _1033 = _1027;
    float _1035 = _435 * 2.0;
    float _1037 = float(_1007);
    float _1039 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1041 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1043 = isnan(1.0);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1049 = _1045 || _1047;
    float _1051 = _435 + _433;
    bool _1053 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1055 = isnan(0.0);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1061 = _1057 || _1059;
    float _1063 = floor(_1035);
    float _1065 = _931 * _1037;
    int _1067 = abs(_839);
    float _1069 = _1051 + (-1.0);
    float _1071 = _1065 * (-2.0);
    float _1073 = float(_1067);
    float _1075 = _435 + (-0.5);
    float _1077 = float(_1033);
    float _1079 = _805 * _1025;
    float _1081 = _1061 ? _1011 : 0.0;
    float _1083 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1085 = _433 + (-0.5);
    float _1087 = _1073 * _1077;
    float _1089 = fma(_1071, _1013, _1013);
    if (_1049)
    {
        float _1091 = _1081 * _975;
        _151 = _1091;
    }
    float _1093 = _151;
    bool _1095 = _1063 > 0.0;
    float _1097 = fma(_1083, _1071, _1083);
    float _1099 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1089);
    float _1101 = _1087 * (-2.0);
    bool _1103 = _1063 >= 0.0;
    bool _1105 = isnan(_1063);
    bool _1107 = _1103 || _1105;
    bool _1109 = isnan(0.0);
    bool _1111 = _1107 || _1109;
    float _1113 = _437 + _433;
    float _1115 = fma(_1097, _1093, _1099);
    float _1117 = fma(_1039, _1101, _1039);
    float _1119 = fma(_1101, _1015, _1015);
    int _1121 = _1111 ? 0 : 1;
    float _1123 = _1115 * 0.15915493667125701904296875;
    int _1125 = abs(_845);
    float _1127 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1119);
    int _1129 = ~_1121;
    int _1131 = _1129 + 1;
    int _1133 = _1131 + 1;
    float _1135 = _1113 + (-1.0);
    int _1137 = _1133;
    if (!_1095)
    {
        int _1139 = ~_1121;
        int _1141 = _1139 + 1;
        _1137 = _1141;
    }
    int _1143 = _1137;
    float _1145 = fma(_1117, _1093, _1127);
    float _1147 = float(_1125);
    float _1149 = _1123 * 6.283185482025146484375;
    float _1151 = sin(_1149);
    float _1153 = float(_1143);
    float _1155 = _437 + (-0.5);
    float _1157 = _1145 * 0.15915493667125701904296875;
    float _1159 = _1079 * _939;
    float _1161 = _1147 * _1153;
    float _1163 = _853 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1165 = _1123 * 6.283185482025146484375;
    float _1167 = cos(_1165);
    float _1169 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1171 = _1161 * (-2.0);
    float _1173 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1163);
    float _1175 = fma(_1169, _1171, _1169);
    float _1177 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1173);
    float _1179 = _1157 * 6.283185482025146484375;
    float _1181 = sin(_1179);
    float _1183 = fma(_1171, _1017, _1017);
    float _1185 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1187 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1183);
    float _1189 = _969 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1191 = _1157 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    float _1195 = fma(_1175, _1093, _1187);
    float _1197 = _853 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1199 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1189);
    float _1201 = _1195 * 0.15915493667125701904296875;
    float _1203 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1197);
    float _1205 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1199);
    float _1207 = 1.0 / _1185;
    float _1209 = _1167 * _1181;
    float _1211 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1203);
    float _1213 = _1205 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1215 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1217 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1219 = _1201 * 6.283185482025146484375;
    float _1221 = sin(_1219);
    float _1223 = _1151 * _1193;
    float _1225 = _1217 + _1185;
    float _1227 = _1167 * _1193;
    float _1229 = _1225 * _1207;
    float _1231 = _1229 * 0.5;
    float _1233 = _969 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1235 = _1201 * 6.283185482025146484375;
    float _1237 = cos(_1235);
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1241 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1239);
    float _1243 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1233);
    float _1245 = -_1209;
    float _1247 = fma(_1221, _1223, _1245);
    float _1249 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1243);
    float _1251 = 1.0 / _1241;
    float _1253 = -_1223;
    float _1255 = fma(_1221, _1209, _1253);
    float _1257 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1259 = _1249 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1261 = _1151 * _1181;
    float _1263 = _1215 * _1159;
    float _1265 = _1079 * _1257;
    float _1267 = trunc(_1213);
    int _1269 = int(_1267);
    float _1271 = _1167 * _1237;
    float _1273 = _1193 * _1237;
    float _1275 = _1151 * _1237;
    float _1277 = _1181 * _1237;
    float _1279 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1281 = _1271 * _1263;
    float _1283 = fma(_1221, _1227, _1261);
    float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1287 = _1251 * _1285;
    float _1289 = trunc(_1259);
    int _1291 = int(_1289);
    float _1293 = _1279 * _1265;
    float _1295 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1297 = _1295 * 0.5;
    float _1299 = fma(_1221, _1261, _1227);
    bool _1301 = _1287 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1303 = fma(_1283, _1293, _1281);
    bool _1305 = _1287 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1307 = !_1301;
    int _1309 = _1307 ? 0 : 1;
    float _1311 = fma(_1255, _1297, _1303);
    int _1313 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1315 = _1269 + _1313;
    int _1317 = _1315 + 1;
    float _1319 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1321 = _1317 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1323 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1325 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1327 = _1291 + _1325;
    int _1329 = _1327 + 1;
    int _1331 = _1317;
    int _1333 = as_type<int>(_1323);
    float _1335 = _1213;
    if (!_1301)
    {
        _1001 = 1;
    }
    int _1337 = _1001;
    int _1339 = _1337;
    if (!_1305)
    {
        _1339 = _1309;
    }
    int _1341 = _1339;
    int _1343 = _1317 | _1329;
    int _1345 = _1341 << 6;
    bool _1347 = _1343 < 0;
    bool _1349 = _1347 || _1321;
    float _1351 = -_1263;
    float _1353 = _1221 * _1351;
    int _1355 = _1345 + 96;
    uint _1358 = uint(int(uint(_1355) >> uint(2)));
    uint _1360 = uint(int(uint(int(_1358)) >> uint(2)));
    int _1362 = int(_1358) & 3;
    float _1364 = (*spvDescriptorSet0.vp_c15)._m0[int(_1360)][_1362];
    int _1366 = int(_1358) + 1;
    uint _1368 = uint(int(uint(_1366) >> uint(2)));
    int _1370 = _1366 & 3;
    float _1372 = (*spvDescriptorSet0.vp_c15)._m0[int(_1368)][_1370];
    float _1374 = _1275 * _1263;
    bool _1376 = _1329 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1378 = _1376 || _1349;
    float _1380 = fma(_1273, _1293, _1353);
    bool _1382 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1384 = isnan(0.5);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1390 = _1386 || _1388;
    float _1392 = fma(_1247, _1293, _1374);
    float _1394 = fma(_1277, _1297, _1380);
    int _1396 = _1345 + 104;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    uint _1400 = uint(int(uint(int(_1398)) >> uint(2)));
    int _1402 = int(_1398) & 3;
    float _1404 = (*spvDescriptorSet0.vp_c15)._m0[int(_1400)][_1402];
    int _1406 = int(_1398) + 1;
    uint _1408 = uint(int(uint(_1406) >> uint(2)));
    int _1410 = _1406 & 3;
    float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
    float _1414 = fma(_1299, _1297, _1392);
    float _1416 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1319);
    float _1418 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1323);
    float _1420 = as_type<float>(_1341);
    if (!_1378)
    {
        int _1422 = _1329 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1424 = _1422 + _1317;
        _1331 = _1424;
    }
    int _1426 = _1331;
    int _1428 = _1345 + 48;
    uint _1430 = uint(int(uint(_1428) >> uint(2)));
    uint _1432 = uint(int(uint(int(_1430)) >> uint(2)));
    int _1434 = int(_1430) & 3;
    float _1436 = (*spvDescriptorSet0.vp_c15)._m0[int(_1432)][_1434];
    int _1438 = int(_1430) + 1;
    uint _1440 = uint(int(uint(_1438) >> uint(2)));
    int _1442 = _1438 & 3;
    float _1444 = (*spvDescriptorSet0.vp_c15)._m0[int(_1440)][_1442];
    float _1446 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1416);
    float _1448 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1418);
    float _1450 = 0.0;
    float _1452 = as_type<float>(_1426);
    if (!_1378)
    {
        float _1454 = floor(_1213);
        _1450 = _1454;
    }
    float _1456 = _1450;
    int _1458 = 0;
    if (!_1378)
    {
        int _1460 = _1426 << 2;
        _1458 = _1460;
    }
    int _1462 = _1458;
    float _1464 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1466 = _1462;
    if (!_1378)
    {
        uint _1468 = uint(int(uint(_1426) >> uint(2)));
        _1333 = int(_1468);
    }
    int _1470 = _1333;
    float _1472 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1474 = _1345 + 64;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    uint _1478 = uint(int(uint(int(_1476)) >> uint(2)));
    int _1480 = int(_1476) & 3;
    float _1482 = (*spvDescriptorSet0.vp_c15)._m0[int(_1478)][_1480];
    int _1484 = int(_1476) + 1;
    uint _1486 = uint(int(uint(_1484) >> uint(2)));
    int _1488 = _1484 & 3;
    float _1490 = (*spvDescriptorSet0.vp_c15)._m0[int(_1486)][_1488];
    if (!_1378)
    {
        int _1492 = 12 & _1462;
        _1466 = _1492;
    }
    int _1494 = _1466;
    float _1496 = _607 + _1464;
    float _1498 = _691 + _1472;
    float _1500 = 0.0;
    float _1502 = _1498;
    float _1504 = _1496;
    if (!_1378)
    {
        int _1506 = _1470 << 4;
        int _1508 = _1506 + _1494;
        _1500 = as_type<float>(_1508);
    }
    float _1510 = _1500;
    float _1512 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1514 = _1496 + _1512;
    float _1516 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1518 = _1498 + _1516;
    int _1520 = _1345 + 56;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    uint _1524 = uint(int(uint(int(_1522)) >> uint(2)));
    int _1526 = int(_1522) & 3;
    float _1528 = (*spvDescriptorSet0.vp_c15)._m0[int(_1524)][_1526];
    int _1530 = int(_1522) + 1;
    uint _1532 = uint(int(uint(_1530) >> uint(2)));
    int _1534 = _1530 & 3;
    float _1536 = (*spvDescriptorSet0.vp_c15)._m0[int(_1532)][_1534];
    float _1538 = _1514 * _1514;
    float _1540 = fma(_1518, _1518, _1538);
    int _1542 = _1345 + 72;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    uint _1546 = uint(int(uint(int(_1544)) >> uint(2)));
    int _1548 = int(_1544) & 3;
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[int(_1546)][_1548];
    int _1552 = int(_1544) + 1;
    uint _1554 = uint(int(uint(_1552) >> uint(2)));
    int _1556 = _1552 & 3;
    float _1558 = (*spvDescriptorSet0.vp_c15)._m0[int(_1554)][_1556];
    float _1560 = sqrt(_1540);
    int _1562 = _1345 + 80;
    uint _1564 = uint(int(uint(_1562) >> uint(2)));
    uint _1566 = uint(int(uint(int(_1564)) >> uint(2)));
    int _1568 = int(_1564) & 3;
    float _1570 = (*spvDescriptorSet0.vp_c15)._m0[int(_1566)][_1568];
    int _1572 = int(_1564) + 1;
    uint _1574 = uint(int(uint(_1572) >> uint(2)));
    int _1576 = _1572 & 3;
    float _1578 = (*spvDescriptorSet0.vp_c15)._m0[int(_1574)][_1576];
    float _1580 = _969 * _1372;
    float _1582 = fma(_859, _1364, _1580);
    float _1584 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1586 = _1345 + 88;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    uint _1590 = uint(int(uint(int(_1588)) >> uint(2)));
    int _1592 = int(_1588) & 3;
    float _1594 = (*spvDescriptorSet0.vp_c15)._m0[int(_1590)][_1592];
    int _1596 = int(_1588) + 1;
    uint _1598 = uint(int(uint(_1596) >> uint(2)));
    int _1600 = _1596 & 3;
    float _1602 = (*spvDescriptorSet0.vp_c15)._m0[int(_1598)][_1600];
    float _1604 = fma(_867, _1404, _1582);
    bool _1606 = _1560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1608 = _1311;
    if (!_1378)
    {
        float _1610 = floor(_1259);
        _1608 = _1610;
    }
    float _1612 = _1608;
    float _1614 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1584);
    float _1616 = _1604 + _1412;
    float _1618 = _1510;
    if (!_1378)
    {
        int _1620 = as_type<int>(_1510) + 400;
        uint _1622 = uint(int(uint(_1620) >> uint(2)));
        uint _1624 = uint(int(uint(int(_1622)) >> uint(2)));
        int _1626 = int(_1622) & 3;
        float _1628 = (*spvDescriptorSet0.vp_c15)._m0[int(_1624)][_1626];
        _1618 = _1628;
    }
    float _1630 = _1618;
    float _1632 = _969 * _1444;
    float _1634 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1614);
    float _1636 = 1.0 / _1616;
    float _1638 = fma(_859, _1436, _1632);
    float _1640 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1642 = _969 * _1490;
    float _1644 = _627 + _1640;
    float _1646 = fma(_859, _1482, _1642);
    float _1648 = fma(_867, _1528, _1638);
    float _1650 = fma(_867, _1550, _1646);
    bool _1652 = !_1606;
    float _1654 = _1644;
    float _1656 = _1482;
    float _1658 = _1648;
    float _1660 = _1536;
    float _1662 = _1650;
    float _1664 = _1612;
    if (!_1652)
    {
        float _1666 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1670 = _1560 + _1668;
        float _1672 = _1644 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1674 = rsqrt(_1540);
        float _1676 = _1670 * _1666;
        float _1678 = _1676 * 0.15915493667125701904296875;
        float _1680 = _1678 * 6.283185482025146484375;
        float _1682 = cos(_1680);
        float _1684 = _1678 * 6.283185482025146484375;
        float _1686 = sin(_1684);
        float _1688 = _1682 + (-1.0);
        float _1690 = fma(_1686, _1672, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1692 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1694 = _1674 * _1690;
        float _1696 = fma(_1644, _1682, _1692);
        float _1698 = fma(_1518, _1694, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1700 = fma(_1514, _1694, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1502 = _1698;
        _1654 = _1696;
        _1504 = _1700;
        _1656 = _1678;
    }
    float _1702 = _1502;
    float _1704 = _1654;
    float _1706 = _1504;
    float _1708 = _1656;
    float _1710 = -_849;
    float _1712 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1702);
    float _1714 = -_847;
    float _1716 = fma(_1714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1704);
    float _1718 = -_855;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1706);
    float _1722 = _1648 + _1536;
    float _1724 = _1650 + _1558;
    float _1726 = _1708;
    float _1728 = _1720;
    float _1730 = _1716;
    if (_1390)
    {
        _1658 = _1712;
    }
    float _1732 = _1658;
    float _1734 = _1732;
    if (_1390)
    {
        _1660 = _1716;
    }
    float _1736 = _1660;
    float _1738 = _1736;
    if (_1390)
    {
        _1662 = _1720;
    }
    float _1740 = _1662;
    float _1742 = _1740;
    if (!_1390)
    {
        float _1744 = _863 * _863;
        float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1748 = -_607;
        float _1750 = _1748 + _1706;
        float _1752 = -_627;
        float _1754 = _1752 + _1704;
        float _1756 = fma(_871, _871, _1744);
        float _1758 = -_691;
        float _1760 = _1758 + _1702;
        float _1762 = fma(_877, _877, _1756);
        float _1764 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1766 = sqrt(_1762);
        float _1768 = 1.0 / _1079;
        float _1770 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1772 = precise::min(_1766, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1774 = _1772 * _1746;
        float _1776 = _1774 * _1768;
        float _1778 = _1770 * _1776;
        float _1780 = _1750 * _1776;
        float _1782 = fma(_1754, _1778, _853);
        float _1784 = fma(_1760, _1778, _859);
        float _1786 = fma(_1770, _1780, _867);
        _1738 = _1782;
        _1734 = _1784;
        _1742 = _1786;
        _1726 = _1746;
    }
    float _1788 = _1738;
    float _1790 = _1734;
    float _1792 = _1742;
    float _1794 = _1726;
    float _1796 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1798 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1800 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1802 = _1722 * _1636;
    float _1804 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1796);
    float _1806 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1798);
    float _1808 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1800);
    float _1810 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1812 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1804);
    bool _1814 = _1802 >= 0.0;
    float _1816 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1806);
    float _1818 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1808);
    float _1820 = _1812 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1822 = _1724 * _1636;
    bool _1824 = _1802 <= 1.0;
    bool _1826 = _1824 && _1814;
    float _1828 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1830 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1810);
    float _1832 = _1818 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1834 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1836 = _1822 >= 0.0;
    bool _1838 = _1836 && _1826;
    float _1840 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1830);
    float _1842 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1844 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1834);
    float _1846 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1848 = _1822 <= 1.0;
    bool _1850 = _1848 && _1838;
    float _1852 = _1840 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1854 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1844);
    float _1856 = -_1846;
    float _1858 = fma(_1856, _1842, 1.0);
    float _1860 = _969 * _1578;
    float _1862 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1864 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1854);
    float _1866 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1868 = fma(_859, _1570, _1860);
    float _1870 = log2(_1858);
    float _1872 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1862);
    float _1874 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1866);
    float _1876 = fma(_867, _1594, _1868);
    if (_1850)
    {
        float _1878 = float(_1341);
        _1420 = _1878;
    }
    float _1880 = _1420;
    float _1882 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1872);
    float _1884 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1874);
    float _1886 = _1876 + _1602;
    float _1888 = 1.0 / _1864;
    float _1890 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1882);
    float _1892 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1884);
    float _1894 = _1884;
    float _1896 = _1890;
    if (!_1378)
    {
        float _1898 = -_1612;
        float _1900 = _1259 + _1898;
        _1664 = _1900;
    }
    float _1902 = _1664;
    if (!_1378)
    {
        float _1904 = -_1456;
        float _1906 = _1213 + _1904;
        _1894 = _1906;
    }
    float _1908 = _1894;
    float _1910 = _1886 * _1636;
    float _1912 = _1794;
    if (!_1378)
    {
        float _1914 = rint(_1630);
        float _1916 = precise::max(_1914, 0.0);
        uint _1918 = uint(_1916);
        uint _1920 = clamp(_1918, 0u, 65535u);
        _1912 = as_type<float>(_1920);
    }
    float _1922 = _1912;
    float _1924 = _1870 * 0.693147182464599609375;
    float _1926 = _1924 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1928 = _1862;
    float _1930 = _1926;
    if (_1850)
    {
        float _1932 = rint(_1880);
        float _1934 = precise::max(_1932, 0.0);
        uint _1936 = uint(_1934);
        uint _1938 = clamp(_1936, 0u, 65535u);
        _1928 = as_type<float>(_1938);
    }
    float _1940 = _1928;
    float _1942 = _1890 * _1888;
    float _1944 = _1892 * _1888;
    float _1946 = fma(_1942, 0.5, 0.5);
    float _1948 = fma(_1944, -0.5, 0.5);
    float _1950 = _1456;
    float _1952 = _1948;
    float _1954 = _1946;
    if (!_1378)
    {
        float3 _6032 = float3(_1908, _1902, float(as_type<int>(_1922)));
        float3 _6036 = select(_6032, float3(0.0), isnan(_6032));
        float _1956 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6036.xy, uint(rint(_6036.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6036.xy, uint(rint(_6036.z)), level(0.0)).x;
        _1950 = _1956;
    }
    float _1958 = _1950;
    float _1960 = _1822;
    if (_1850)
    {
        float3 _6051 = float3(_1802, _1822, float(as_type<int>(_1940)));
        float3 _6053 = select(_6051, float3(0.0), isnan(_6051));
        float _1962 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6053.xy, uint(rint(_6053.z)), _1910, level(0.0));
        _1960 = _1962;
    }
    float _1964 = _1960;
    float3 _6063 = float3(_1946, _1948, _1926);
    float _1966 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6063, float3(0.0), isnan(_6063)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6063, float3(0.0), isnan(_6063)), level(0.0)).x;
    float3 _6072 = float3(_1946, _1948, _1926);
    float4 _1969 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6072, float3(0.0), isnan(_6072)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6072, float3(0.0), isnan(_6072)), level(0.0)).xyzw;
    float _1971 = _1969.x;
    float _1973 = _1969.y;
    float _1975 = _1969.z;
    float _1977 = _1969.w;
    bool _1979 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1981 = isnan(0.5);
    bool _1983 = _1979 || _1981;
    bool _1985 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1987 = _1983 || _1985;
    if (_1378)
    {
        _1728 = 1.0;
    }
    float _1989 = _1728;
    float _1991 = _1989;
    if (_1987)
    {
        _1335 = 1.0;
    }
    float _1993 = _1335;
    float _1995 = _1993;
    if (_1987)
    {
        _1730 = 1.0;
    }
    float _1997 = _1730;
    float _1999 = _1997;
    if (!_1987)
    {
        float _2001 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2003 = _2001 * 0.15915493667125701904296875;
        float _2005 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2007 = _2003 * 6.283185482025146484375;
        float _2009 = cos(_2007);
        float _2011 = _2005 * 0.15915493667125701904296875;
        float _2013 = _2003 * 6.283185482025146484375;
        float _2015 = sin(_2013);
        float _2017 = 1.0 / _2009;
        float _2019 = _2011 * 6.283185482025146484375;
        float _2021 = cos(_2019);
        float _2023 = _2015 * _2017;
        float _2025 = _2011 * 6.283185482025146484375;
        float _2027 = sin(_2025);
        float _2029 = _2021 * _2023;
        float _2031 = 1.0 / _2029;
        float _2033 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2035 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2033;
        float _2037 = 1.0 / _2035;
        float _2039 = _2027 * _2031;
        float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2043 = fma(_1287, _2039, _2041);
        float _2045 = _2043 * _2037;
        float _2047 = precise::clamp(_2045, 0.0, 1.0);
        _1952 = _2043;
        _1954 = _2011;
        _1999 = _2047;
    }
    float _2049 = _1952;
    float _2051 = _1954;
    float _2053 = _1999;
    float _2055 = _2051;
    float _2057 = _2049;
    if (!_1987)
    {
        float _2059 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2061 = _2059 * 0.15915493667125701904296875;
        float _2063 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2065 = _2061 * 6.283185482025146484375;
        float _2067 = cos(_2065);
        float _2069 = _2063 * 0.15915493667125701904296875;
        float _2071 = _2061 * 6.283185482025146484375;
        float _2073 = sin(_2071);
        float _2075 = 1.0 / _2067;
        float _2077 = _2069 * 6.283185482025146484375;
        float _2079 = cos(_2077);
        float _2081 = _2073 * _2075;
        float _2083 = _2069 * 6.283185482025146484375;
        float _2085 = sin(_2083);
        float _2087 = _2079 * _2081;
        float _2089 = 1.0 / _2087;
        float _2091 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2093 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2091;
        float _2095 = 1.0 / _2093;
        float _2097 = _2085 * _2089;
        float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2101 = fma(_1287, _2097, _2099);
        float _2103 = _2101 * _2095;
        float _2105 = precise::clamp(_2103, 0.0, 1.0);
        float _2107 = -_2105;
        float _2109 = _2107 + 1.0;
        _2055 = _2087;
        _2057 = _2075;
        _1995 = _2109;
    }
    float _2111 = _2055;
    float _2113 = _2057;
    float _2115 = _1995;
    if (!_1378)
    {
        int _2117 = _1426 << 4;
        int _2119 = _2117 + 2048;
        uint _2121 = uint(int(uint(_2119) >> uint(2)));
        uint _2123 = uint(int(uint(int(_2121)) >> uint(2)));
        int _2125 = int(_2121) & 3;
        float _2127 = (*spvDescriptorSet0.vp_c15)._m0[int(_2123)][_2125];
        int _2129 = int(_2121) + 1;
        uint _2131 = uint(int(uint(_2129) >> uint(2)));
        int _2133 = _2129 & 3;
        float _2135 = (*spvDescriptorSet0.vp_c15)._m0[int(_2131)][_2133];
        int _2137 = _2119 + 8;
        uint _2139 = uint(int(uint(_2137) >> uint(2)));
        uint _2141 = uint(int(uint(int(_2139)) >> uint(2)));
        int _2143 = int(_2139) & 3;
        float _2145 = (*spvDescriptorSet0.vp_c15)._m0[int(_2141)][_2143];
        int _2147 = int(_2139) + 1;
        uint _2149 = uint(int(uint(_2147) >> uint(2)));
        int _2151 = _2147 & 3;
        float _2153 = (*spvDescriptorSet0.vp_c15)._m0[int(_2149)][_2151];
        float _2155 = _969 * _2135;
        float _2157 = fma(_859, _2127, _2155);
        float _2159 = fma(_867, _2145, _2157);
        float _2161 = _2159 + _2153;
        float _2163 = precise::clamp(_2161, 0.0, 1.0);
        float _2165 = -_2163;
        float _2167 = _2165 + _1958;
        float _2169 = fma(_2167, 500.0, 1.5);
        float _2171 = exp2(_2169);
        float _2173 = 0.0 + _2171;
        float _2175 = precise::clamp(_2173, 0.0, 1.0);
        _1452 = as_type<float>(_2119);
        _1991 = _2175;
    }
    float _2177 = _1452;
    float _2179 = _1991;
    float _2181 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2183 = _1788 + _2181;
    float _2185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2187 = _1790 + _2185;
    float _2189 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2191 = _1792 + _2189;
    float _2193 = _2183 * _2183;
    float _2195 = fma(_2187, _2187, _2193);
    float _2197 = fma(_2191, _2191, _2195);
    float _2199 = rsqrt(_2197);
    float _2201 = sqrt(_2197);
    float _2203 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2205 = _2187 * _2203;
    float _2207 = _2191 * _2203;
    float _2209 = _2205 * _2205;
    float _2211 = _2207 * _2207;
    float _2213 = _2209 + _2211;
    float _2215 = sqrt(_2213);
    bool _2217 = _2215 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2221 = _2215 + _2219;
    float _2223 = _2111;
    float _2225 = _2213;
    float _2227 = _2221;
    float _2229 = _2205;
    float _2231 = _2207;
    float _2233 = _2209;
    float _2235 = _2211;
    if (_2217)
    {
        float _2237 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2223 = _2237;
    }
    float _2239 = _2223;
    if (_2217)
    {
        float _2241 = rsqrt(_2213);
        _2225 = _2241;
    }
    float _2243 = _2225;
    if (_2217)
    {
        float _2245 = _2221 * _2239;
        _2227 = _2245;
    }
    float _2247 = _2227;
    if (_2217)
    {
        float _2249 = _2247 * 0.15915493667125701904296875;
        _1930 = _2249;
    }
    float _2251 = _1930;
    float _2253 = _2113;
    if (_2217)
    {
        float _2255 = _2251 * 6.283185482025146484375;
        float _2257 = sin(_2255);
        _2253 = _2257;
    }
    float _2259 = _2253;
    float _2261 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2263 = precise::max(0.0, _2261);
    float _2265 = _2177;
    float _2267 = _2263;
    float _2269 = _2261;
    if (_2217)
    {
        float _2271 = _2251 * 6.283185482025146484375;
        float _2273 = cos(_2271);
        _2265 = _2273;
    }
    float _2275 = _2265;
    float _2277 = -_2203;
    float _2279 = -_2263;
    float _2281 = fma(_2183, _2277, _2279);
    float _2283 = _2281;
    if (_2217)
    {
        float _2285 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2267 = _2285;
    }
    float _2287 = _2267;
    float _2289 = _2259;
    float _2291 = _2287;
    if (_2217)
    {
        float _2293 = fma(_2259, _2287, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2289 = _2293;
    }
    float _2295 = _2289;
    float _2297 = _2295;
    if (_2217)
    {
        float _2299 = _2275 + (-1.0);
        _2269 = _2299;
    }
    float _2301 = _2269;
    if (_2217)
    {
        float _2303 = _2243 * _2295;
        _2297 = _2303;
    }
    float _2305 = _2297;
    if (_2217)
    {
        float _2307 = _2301 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2291 = _2307;
    }
    float _2309 = _2291;
    if (_2217)
    {
        float _2311 = _2205 * _2305;
        _2229 = _2311;
    }
    float _2313 = _2229;
    if (_2217)
    {
        float _2315 = _2207 * _2305;
        _2231 = _2315;
    }
    float _2317 = _2231;
    if (_2217)
    {
        float _2319 = fma(_2281, _2275, _2309);
        _2283 = _2319;
    }
    float _2321 = _2283;
    if (_2217)
    {
        float _2323 = _2313 * _2313;
        _2233 = _2323;
    }
    float _2325 = _2233;
    if (_2217)
    {
        float _2327 = _2317 * _2317;
        _2235 = _2327;
    }
    float _2329 = _2235;
    float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2333 = fma(_2201, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2331);
    float _2335 = precise::clamp(_2333, 0.0, 1.0);
    float _2337 = fma(_2321, _2321, _2325);
    float _2339 = -_2335;
    float _2341 = _2339 + 1.0;
    float _2343 = _2337 + _2329;
    float _2345 = rsqrt(_2343);
    float _2347 = _2345 * _2321;
    float _2349 = _2345 * _2313;
    float _2351 = abs(_2341);
    float _2353 = log2(_2351);
    float _2355 = _2345 * _2317;
    float _2357 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2359 = -_2357;
    float _2361 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2359);
    float _2363 = -_2355;
    float _2365 = fma(_2363, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2361);
    float _2367 = fma(_2365, -0.5, 0.5);
    float _2369 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2371 = fma(_2365, 0.5, 0.5);
    float _2373 = _2347 + 1.0;
    float _2375 = sqrt(_2367);
    float _2377 = fma(_2371, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2379 = fma(_2371, _2377, -0.212114393711090087890625);
    float _2381 = exp2(_2369);
    float _2383 = fma(_2371, _2379, 1.570728778839111328125);
    float _2385 = _2375 * 0.636619746685028076171875;
    float _2387 = -_2383;
    float _2389 = fma(_2385, _2387, 1.0);
    float _2391 = -_2347;
    float _2393 = fma(_2381, _2373, _2391);
    float _2395 = fma(_2393, 0.5, 0.5);
    float2 _6690 = float2(_2389, _2395);
    float3 _2399 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6690, float2(0.0), isnan(_6690)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6690, float2(0.0), isnan(_6690)), level(0.0)).xyz;
    float _2401 = _2399.x;
    float _2403 = _2399.y;
    float _2405 = _2399.z;
    float _2407 = abs(_1287);
    float _2409 = log2(_2407);
    float _2411 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2413 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2415 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2417 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2419 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2421 = -_1221;
    float _2423 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2411);
    float _2425 = -_1221;
    float _2427 = fma(_2425, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2413);
    float _2429 = -_1221;
    float _2431 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2415);
    float _2433 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2435 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2437 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2439 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2441 = _1820 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2443 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2417);
    float _2445 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2419);
    float _2447 = _2409 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2449 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2433);
    float _2451 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2435);
    float _2453 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2441);
    float _2455 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2437);
    float _2457 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2439);
    float _2459 = exp2(_2447);
    float _2461 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2423);
    float _2463 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2427);
    float _2465 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2467 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2431);
    float _2469 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2443);
    float _2471 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2445);
    float _2473 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2449);
    float _2475 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2451);
    float _2477 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2453);
    float _2479 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2455);
    float _2481 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2457);
    float _2483 = _2465 * _2461;
    float _2485 = _2465 * _2463;
    float _2487 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2489 = _2465 * _2467;
    float _2491 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2493 = fma(_2487, _2469, _2483);
    float _2495 = fma(_2487, _2471, _2485);
    float _2497 = fma(_2487, _2473, _2489);
    float _2499 = fma(_2459, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2501 = precise::clamp(_2499, 0.0, 1.0);
    float _2503 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2477);
    float _2505 = _1864 * 0.5;
    float _2507 = exp2(_2491);
    float _2509 = fma(_2501, -2.0, 3.0);
    float _2511 = _2501 * _2501;
    float _2513 = fma(_1892, -0.5, _2505);
    out.gl_Position.x = _1890;
    out.gl_Position.y = _1892;
    out.gl_Position.z = _2503;
    out.gl_Position.w = _1864;
    bool _2515 = _1287 <= 8000.0;
    bool _2517 = isnan(_1287);
    bool _2519 = _2515 || _2517;
    bool _2521 = isnan(8000.0);
    bool _2523 = _2519 || _2521;
    float _2525 = float(_2523);
    float _2527 = _2511 * _2509;
    float _2529 = _2503 + _1864;
    float _2531 = -_909;
    float _2533 = _2531 + 1.0;
    float _2535 = _1890 + _1864;
    float _2537 = _2529 * 0.5;
    float _2539 = _2475 + _2493;
    float _2541 = _2535 * 0.5;
    float _2543 = _2479 + _2495;
    float _2545 = _2481 + _2497;
    bool _2547 = _2201 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2549 = isnan(_2201);
    bool _2551 = _2547 || _2549;
    bool _2553 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2555 = _2551 || _2553;
    float _2557 = -_2527;
    float _2559 = _2557 + 1.0;
    float _2561 = -_2507;
    float _2563 = _2561 + 1.0;
    if (!_1850)
    {
        _1896 = 1.0;
    }
    float _2565 = _1896;
    out.m_84.x = _2541;
    out.m_84.y = _2513;
    out.m_84.z = _2537;
    out.m_84.w = _1864;
    float _2567 = fma(_2559, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2527);
    float _2569 = _2565;
    float _2571 = _2403;
    float _2573 = _2401;
    if (_1850)
    {
        bool _2575 = _1964 >= _1910;
        bool _2577 = isnan(_1964);
        bool _2579 = _2575 || _2577;
        bool _2581 = isnan(_1910);
        bool _2583 = _2579 || _2581;
        float _2585 = float(_2583);
        _2569 = _2585;
    }
    float _2587 = _2569;
    float _2589 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _2539;
    out.m_86.y = _2543;
    out.m_86.z = _2545;
    float _2591 = _2525 * _2567;
    float _2593 = _2589 * _1966;
    float _2595 = _2587 * _2179;
    float _2597 = _2591 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2599 = -_2589;
    float _2601 = _2599 + 1.0;
    float _2603 = _1977 * _2593;
    float _2605 = _2589;
    float _2607 = _2601;
    if (!_2555)
    {
        _2605 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2609 = _2605;
    float _2611 = _2533 * _2597;
    float _2613 = precise::clamp(_2611, 0.0, 1.0);
    float _2615 = -_2613;
    float _2617 = fma(_2615, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2619 = -_2595;
    float _2621 = fma(_2619, _2617, 1.0);
    float _2623 = precise::clamp(_2621, 0.0, 1.0);
    float _2625 = _2617;
    float _2627 = _2609;
    float _2629 = _2609;
    if (!_2555)
    {
        _2625 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2631 = _2625;
    float _2633 = _2405 * _2593;
    float _2635 = fma(_2401, _2603, _1971);
    float _2637 = fma(_2403, _2603, _1973);
    float _2639 = _2623 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2641 = _1977 * _2601;
    float _2643 = fma(_1977, _2633, _1975);
    float _2645 = _2053 * _2115;
    float _2647 = _2645;
    float _2649 = _2631;
    float _2651 = _2631;
    if (!_2555)
    {
        _2571 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2653 = _2571;
    out.m_88.x = _2639;
    float _2655 = _2653;
    float _2657 = _2653;
    if (!_2555)
    {
        _2573 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2659 = _2573;
    float _2661 = _2645 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2663 = _2659;
    float _2665 = _2659;
    if (!_2555)
    {
        _2607 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2667 = _2607;
    out.m_90.x = _2635;
    out.m_90.y = _2637;
    out.m_90.z = _2643;
    out.m_90.w = _2641;
    float _2669 = _2667;
    float _2671 = _2667;
    if (!_2555)
    {
        _2647 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2673 = _2647;
    bool _2675 = !_2555;
    float _2677 = _2673;
    float _2679 = _2673;
    if (!_2675)
    {
        bool _2681 = _2201 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2683 = isnan(_2201);
        bool _2685 = _2681 || _2683;
        bool _2687 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2689 = _2685 || _2687;
        if (!_2689)
        {
            float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2693 = _2201 + _2691;
            float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2697 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2695;
            float _2699 = 1.0 / _2697;
            float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2707 = _2705 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2713 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2715 = _2713 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2721 = _2693 * _2699;
            float _2723 = precise::clamp(_2721, 0.0, 1.0);
            float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2727 = _2725 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2729 = fma(_2723, _2703, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2731 = fma(_2723, _2727, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2733 = fma(_2723, _2707, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2735 = fma(_2723, _2711, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2737 = fma(_2723, _2715, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2739 = fma(_2723, _2719, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2665 = _2731;
            _2651 = _2737;
            _2657 = _2729;
            _2671 = _2735;
            _2629 = _2733;
            _2679 = _2739;
            _2741 = true;
        }
        else
        {
            bool _2743 = _2201 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2745 = isnan(_2201);
            bool _2747 = _2743 || _2745;
            bool _2749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2751 = _2747 || _2749;
            if (!_2751)
            {
                _2655 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2753 = _2655;
            _2657 = _2753;
            if (!_2751)
            {
                _2663 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2755 = _2663;
            _2665 = _2755;
            if (!_2751)
            {
                _2627 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2757 = _2627;
            _2629 = _2757;
            if (!_2751)
            {
                _2669 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2759 = _2669;
            _2671 = _2759;
            if (!_2751)
            {
                _2649 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2761 = _2649;
            _2651 = _2761;
            if (!_2751)
            {
                _2677 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2763 = _2677;
            bool _2765 = !_2751;
            _2679 = _2763;
            if (!_2765)
            {
                bool _2767 = _2201 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2769 = isnan(_2201);
                bool _2771 = _2767 || _2769;
                bool _2773 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2775 = _2771 || _2773;
                if (!_2775)
                {
                    float _2777 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2779 = _2201 + _2777;
                    float _2781 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2783 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2781;
                    float _2785 = 1.0 / _2783;
                    float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2793 = _2791 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2797 = _2795 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2799 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2801 = _2799 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2805 = _2803 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2807 = _2779 * _2785;
                    float _2809 = precise::clamp(_2807, 0.0, 1.0);
                    float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2813 = _2811 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2815 = fma(_2809, _2789, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2817 = fma(_2809, _2813, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2819 = fma(_2809, _2793, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2821 = fma(_2809, _2797, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2823 = fma(_2809, _2801, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2825 = fma(_2809, _2805, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2665 = _2817;
                    _2651 = _2823;
                    _2657 = _2815;
                    _2671 = _2821;
                    _2629 = _2819;
                    _2679 = _2825;
                    _2741 = true;
                }
                else
                {
                    _2665 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2651 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2657 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2671 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2629 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2679 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2741 = false;
    float _2827 = _2665;
    float _2829 = _2651;
    float _2831 = _2657;
    float _2833 = _2671;
    float _2835 = _2629;
    float _2837 = _2679;
    float _2839 = fma(_2543, -0.5, 0.5);
    float _2841 = precise::clamp(_2839, 0.0, 1.0);
    float _2843 = -_2827;
    float _2845 = _2843 + _2829;
    float _2847 = -_2831;
    float _2849 = _2847 + _2833;
    out.m_92.x = 0.0;
    float _2851 = fma(_2841, _2845, _2827);
    float _2853 = -_2835;
    float _2855 = _2853 + _2837;
    float _2857 = fma(_2841, _2849, _2831);
    float _2859 = _2851 * 0.586610972881317138671875;
    bool _2861 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2863 = fma(_2841, _2855, _2835);
    float _2865 = _2661 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2867 = fma(_2857, 0.298911988735198974609375, _2859);
    bool _2869 = _2053 > 0.0;
    bool _2871 = isnan(_2053);
    bool _2873 = _2869 || _2871;
    bool _2875 = isnan(0.0);
    bool _2877 = _2873 || _2875;
    float _2879 = fma(_2863, 0.114477999508380889892578125, _2867);
    out.m_59.x = _2865;
    bool _2881 = _2115 <= 0.0;
    bool _2883 = !_2877;
    bool _2885 = _2881 || _2883;
    float _2887 = -_2879;
    float _2889 = _2857 + _2887;
    float _2891 = -_2879;
    float _2893 = _2863 + _2891;
    float _2895 = fma(_2889, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2879);
    float _2897 = -_2879;
    float _2899 = _2851 + _2897;
    float _2901 = fma(_2893, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2879);
    float _2903 = fma(_2899, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2879);
    bool _2905 = !_2861;
    if (!_2905)
    {
        float _2907 = -_1788;
        float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2911 = -_1790;
        float _2913 = _2911 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2915 = -_1792;
        float _2917 = _2915 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2919 = _2909 * _2909;
        float _2921 = fma(_2913, _2913, _2919);
        float _2923 = fma(_2917, _2917, _2921);
        float _2925 = sqrt(_2923);
        float _2927 = rsqrt(_2923);
        float _2929 = -_2925;
        float _2931 = _2929 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2933 = _2931 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2935 = precise::clamp(_2933, 0.0, 1.0);
        float _2937 = _2913 * _2927;
        float _2939 = _2909 * _2927;
        float _2941 = abs(_2935);
        float _2943 = log2(_2941);
        float _2945 = _2917 * _2927;
        float _2947 = _2937 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2949 = _2543 * _2939;
        float _2951 = -_2939;
        float _2953 = -_2947;
        float _2955 = fma(_2951, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2953);
        float _2957 = fma(_2539, _2937, _2949);
        float _2959 = -_2945;
        float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2955);
        float _2963 = fma(_2545, _2945, _2957);
        float _2965 = precise::clamp(_2963, 0.0, 1.0);
        float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2969 = _2961 + _2967;
        float _2971 = _2943 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2973 = _2969 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2975 = precise::clamp(_2973, 0.0, 1.0);
        float _2977 = exp2(_2971);
        float _2979 = _2977 * _2975;
        float _2981 = _2965 * _2979;
        float _2983 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2985 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2987 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2983;
        out.m_92.y = _2985;
        out.m_92.z = _2987;
    }
    out.m_94.x = _2895;
    out.m_94.y = _2903;
    out.m_94.z = _2901;
    if (!_2885)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2989 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2989;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

