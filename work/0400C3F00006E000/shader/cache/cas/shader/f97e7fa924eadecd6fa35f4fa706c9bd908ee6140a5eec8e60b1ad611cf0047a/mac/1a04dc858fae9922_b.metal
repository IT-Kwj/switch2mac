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
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c8 [[id(3)]];
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
    float4 m_94 [[user(locn0)]];
    float4 m_88 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_98 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_108 [[user(locn8)]];
    float4 m_96 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_104 [[user(locn11)]];
    float4 m_84 [[user(locn12)]];
    float4 m_106 [[user(locn13)]];
    float4 m_102 [[user(locn14)]];
    float4 m_100 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_82 [[attribute(0)]];
    float4 m_76 [[attribute(1)]];
    float4 m_74 [[attribute(2)]];
    float4 m_78 [[attribute(3)]];
    float4 m_72 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_80 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3251 = false;
    bool _463 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _122 = in.m_56.w;
    float _124 = in.m_58.w;
    float _126 = trunc(_122);
    int _129 = int(_126);
    float _131 = -_124;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _133;
    bool _137 = _129 >= 1;
    float _139 = 0.0;
    float _141 = as_type<float>(_129);
    if (!_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _139;
    if (!_137)
    {
        out.m_63.x = 0.0;
    }
    int _145 = 0;
    if (!_137)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    int _151 = _149;
    if (!_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3561 = as_type<float>(_149);
        out.gl_Position.z = _3561;
    }
    if (!_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _153 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_124);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    float _163 = in.m_65.x;
    float _165 = float(_129);
    bool _167 = _133 >= _165;
    bool _169 = !_161;
    bool _171 = _167 || _169;
    float _173 = 1.0 / _165;
    if (_171)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _141;
    if (_171)
    {
        out.m_63.x = 0.0;
    }
    if (_171)
    {
        float _177 = _175 * 5.0;
        _151 = as_type<int>(_177);
    }
    int _179 = _151;
    float _181 = _133 * _173;
    out.m_67.x = _163;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3625 = as_type<float>(_179);
        out.gl_Position.z = _3625;
    }
    out.m_61.x = _181;
    if (_171)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_72.x;
    float _187 = in.m_72.y;
    float _189 = in.m_72.z;
    float _191 = in.m_74.x;
    float _193 = in.m_74.y;
    float _195 = in.m_74.z;
    float _197 = in.m_76.x;
    float _199 = in.m_76.y;
    float _201 = in.m_76.z;
    float _203 = in.m_78.x;
    float _205 = in.m_78.y;
    float _207 = in.m_78.z;
    int _209 = as_type<int>(_183) & 1;
    bool _211 = _209 != 0;
    int _213 = as_type<int>(_183) & 2;
    bool _215 = _213 != 0;
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _219 = !_211;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_215;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _187 * _193;
    float _229 = _187 * _199;
    float _231 = fma(_185, _191, _227);
    float _233 = _187 * _205;
    float _235 = fma(_185, _197, _229);
    float _237 = fma(_189, _195, _231);
    float _239 = fma(_185, _203, _233);
    float _241 = fma(_189, _201, _235);
    float _243 = fma(_189, _207, _239);
    bool _245 = !_217;
    float _247 = _243;
    float _249 = _241;
    float _251 = _237;
    float _267;
    if (!_245)
    {
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        _267 = _181;
    }
    _269 = false;
    float _271 = _267;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = _271 + _277;
    bool _281 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _283 = isnan(_271);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _301;
    float _305 = 1.0 / _295;
    bool _307 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _309 = 1.0 / _299;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = 1.0 / _303;
    float _317 = _275 * _305;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _271 + _319;
    float _323 = fma(_313, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _325 = _321 * _309;
    bool _327 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _329 = isnan(_271);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _339;
    float _343 = fma(_341, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _345 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _347 = isnan(_271);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = _279 * _315;
    float _359 = -_291;
    float _361 = _359 + 1.0;
    bool _363 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _365 = isnan(_271);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = _337 * _361;
    float _381 = -_337;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = -_373;
    float _391 = _389 + 1.0;
    float _393 = fma(_377, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _395 = _373 * _383;
    float _397 = fma(_387, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _399 = in.m_80.x;
    float _401 = in.m_80.y;
    float _403 = _355 * _391;
    float _405 = -_355;
    float _407 = _405 + 1.0;
    float _409 = _323 * _403;
    float _411 = _343 * _403;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _417;
    float _421 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].x, _409);
    float _423 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].y, _411);
    float _425 = fma(_415, _357, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _427 = fma(_419, _357, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _429 = fma(_393, _395, _421);
    float _431 = fma(_397, _395, _423);
    float _433 = fma(_425, _379, _429);
    float _435 = fma(_427, _379, _431);
    float _437 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[146].x, _433);
    float _439 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[146].y, _435);
    float _441 = _437 * _399;
    float _443 = _439 * _401;
    bool _445 = !_307;
    float _461;
    if (!_445)
    {
        float _447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _449 = _163 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _453 = _451 * _447;
        float _455 = floor(_453);
        float _457 = -_455;
        float _459 = _453 + _457;
        _461 = _459;
        _463 = true;
    }
    else
    {
        _461 = _181;
    }
    _463 = false;
    float _465 = _461;
    float _467 = in.m_56.x;
    float _469 = in.m_56.y;
    float _471 = in.m_56.z;
    float _473 = in.m_76.w;
    float _475 = in.m_78.w;
    float _477 = _199 * _469;
    float _479 = _205 * _469;
    float _481 = fma(_197, _467, _477);
    float _483 = fma(_203, _467, _479);
    float _485 = fma(_201, _471, _481);
    float _487 = fma(_207, _471, _483);
    float _489 = _485 + _473;
    float _491 = _487 + _475;
    float _493 = fma(_489, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _495 = fma(_491, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _497 = floor(_493);
    float _499 = floor(_495);
    float _501 = -_497;
    float _503 = _493 + _501;
    float _505 = -_499;
    float _507 = _495 + _505;
    float2 _4132 = float2(_503, _507);
    float _509 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4132, float2(0.0), isnan(_4132)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4132, float2(0.0), isnan(_4132)), level(0.0)).x;
    float _511 = in.m_82.y;
    float _513 = _441 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _515 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _517 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _519 = _469 + _511;
    float _521 = _519 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _523 = _519 + _517;
    float _525 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[11].x, _521);
    float _527 = _523 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _529 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[11].z, _525);
    float _531 = _519 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _533 = fma(_489, (*spvDescriptorSet0.vp_c15)._m0[126].x, _527);
    float _535 = _529 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _537 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[10].x, _531);
    float _539 = fma(_491, (*spvDescriptorSet0.vp_c15)._m0[126].z, _533);
    float _541 = 1.0 / _535;
    float _543 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[10].z, _537);
    float _545 = _539 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _547 = _543 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _549 = trunc(_545);
    int _551 = int(_549);
    float _553 = _547 + _535;
    float _555 = _553 * _541;
    float _557 = _555 * 0.5;
    float _559 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _561 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _563 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[30].w, _561);
    float _565 = _443 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _567 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _569 = _551 + _567;
    int _571 = _569 + 1;
    float _573 = _565 * _559;
    float _575 = 1.0 / _563;
    float _577 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _579 = _573 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _581 = _513 * _577;
    float _583 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[24].x, _579);
    float _585 = _523 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _587 = fma(_515, (*spvDescriptorSet0.vp_c8)._m0[24].z, _583);
    float _589 = fma(_489, (*spvDescriptorSet0.vp_c15)._m0[127].x, _585);
    float _591 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _593 = _575 * _591;
    float _595 = _573 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _597 = fma(_491, (*spvDescriptorSet0.vp_c15)._m0[127].z, _589);
    float _599 = _587 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _601 = _573 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _603 = _593 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _605 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[26].x, _595);
    bool _607 = _593 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _609 = _597 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _611 = !_603;
    int _613 = _611 ? 0 : 1;
    float _615 = fma(_515, (*spvDescriptorSet0.vp_c8)._m0[26].z, _605);
    float _617 = _489 + _599;
    float _619 = trunc(_609);
    int _621 = int(_619);
    float _623 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[25].x, _601);
    float _625 = _615 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _627 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _629 = _617 + _627;
    float _631 = fma(_515, (*spvDescriptorSet0.vp_c8)._m0[25].z, _623);
    int _633 = 2;
    int _635 = _571;
    float _637 = _617;
    float _639 = _523;
    if (!_603)
    {
        _633 = 1;
    }
    int _641 = _633;
    float _643 = _491 + _625;
    int _645 = _641;
    float _647 = _643;
    if (!_607)
    {
        _645 = _613;
    }
    int _649 = _645;
    bool _651 = _571 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _653 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _655 = _643 + _653;
    int _657 = _649 << 6;
    float _659 = _655 * _655;
    int _661 = _657 + 48;
    uint _664 = uint(int(uint(_661) >> uint(2)));
    uint _666 = uint(int(uint(int(_664)) >> uint(2)));
    int _668 = int(_664) & 3;
    float _670 = (*spvDescriptorSet0.vp_c15)._m0[int(_666)][_668];
    int _672 = int(_664) + 1;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    int _676 = _672 & 3;
    float _678 = (*spvDescriptorSet0.vp_c15)._m0[int(_674)][_676];
    int _680 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _682 = _621 + _680;
    int _684 = _682 + 1;
    float _686 = fma(_629, _629, _659);
    int _688 = _571 | _684;
    float _690 = sqrt(_686);
    int _692 = _657 + 56;
    uint _694 = uint(int(uint(_692) >> uint(2)));
    uint _696 = uint(int(uint(int(_694)) >> uint(2)));
    int _698 = int(_694) & 3;
    float _700 = (*spvDescriptorSet0.vp_c15)._m0[int(_696)][_698];
    int _702 = int(_694) + 1;
    uint _704 = uint(int(uint(_702) >> uint(2)));
    int _706 = _702 & 3;
    float _708 = (*spvDescriptorSet0.vp_c15)._m0[int(_704)][_706];
    bool _710 = _688 < 0;
    bool _712 = _710 || _651;
    bool _714 = _684 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _716 = _714 || _712;
    int _718 = _657 + 64;
    uint _720 = uint(int(uint(_718) >> uint(2)));
    uint _722 = uint(int(uint(int(_720)) >> uint(2)));
    int _724 = int(_720) & 3;
    float _726 = (*spvDescriptorSet0.vp_c15)._m0[int(_722)][_724];
    int _728 = int(_720) + 1;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    int _732 = _728 & 3;
    float _734 = (*spvDescriptorSet0.vp_c15)._m0[int(_730)][_732];
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _738 = _736 != 0;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _742 = _740 != 0;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _746 = _744 != 0;
    bool _748 = _690 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _750 = _657 + 72;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    uint _754 = uint(int(uint(int(_752)) >> uint(2)));
    int _756 = int(_752) & 3;
    float _758 = (*spvDescriptorSet0.vp_c15)._m0[int(_754)][_756];
    int _760 = int(_752) + 1;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    int _764 = _760 & 3;
    float _766 = (*spvDescriptorSet0.vp_c15)._m0[int(_762)][_764];
    bool _768 = !_742;
    int _770 = _768 ? 0 : 1;
    float _772 = as_type<float>(_649);
    float _774 = as_type<float>(_657);
    if (!_716)
    {
        int _776 = _684 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _778 = _776 + _571;
        _635 = _778;
    }
    int _780 = _635;
    float _782 = _631 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _784 = !_738;
    int _786 = _784 ? 0 : 1;
    bool _788 = !_746;
    int _790 = _788 ? 0 : 1;
    int _792 = _657 + 96;
    uint _794 = uint(int(uint(_792) >> uint(2)));
    uint _796 = uint(int(uint(int(_794)) >> uint(2)));
    int _798 = int(_794) & 3;
    float _800 = (*spvDescriptorSet0.vp_c15)._m0[int(_796)][_798];
    int _802 = int(_794) + 1;
    uint _804 = uint(int(uint(_802) >> uint(2)));
    int _806 = _802 & 3;
    float _808 = (*spvDescriptorSet0.vp_c15)._m0[int(_804)][_806];
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _812 = _810 != 0;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _816 = _814 != 0;
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _820 = _818 != 0;
    float _822 = _519 + _782;
    int _824 = 0;
    float _826 = _782;
    float _828 = as_type<float>(_780);
    if (!_716)
    {
        int _830 = _780 << 2;
        _824 = _830;
    }
    int _832 = _824;
    int _834 = 0;
    int _836 = _832;
    if (!_716)
    {
        uint _838 = uint(int(uint(_780) >> uint(2)));
        _834 = int(_838);
    }
    int _840 = _834;
    bool _842 = !_816;
    int _844 = _842 ? 0 : 1;
    int _846 = _657 + 104;
    uint _848 = uint(int(uint(_846) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.vp_c15)._m0[int(_850)][_852];
    int _856 = int(_848) + 1;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    int _860 = _856 & 3;
    float _862 = (*spvDescriptorSet0.vp_c15)._m0[int(_858)][_860];
    bool _864 = !_812;
    int _866 = _864 ? 0 : 1;
    bool _868 = !_820;
    int _870 = _868 ? 0 : 1;
    if (!_716)
    {
        int _872 = 12 & _832;
        _836 = _872;
    }
    int _874 = _836;
    float _876 = 0.0;
    if (!_748)
    {
        _876 = _822;
    }
    float _878 = _876;
    bool _880 = !_748;
    float _882 = _878;
    float _884 = _726;
    if (!_880)
    {
        float _886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _890 = _690 + _888;
        float _892 = _822 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _894 = rsqrt(_686);
        float _896 = _890 * _886;
        float _898 = _896 * 0.15915493667125701904296875;
        float _900 = _898 * 6.283185482025146484375;
        float _902 = cos(_900);
        float _904 = _898 * 6.283185482025146484375;
        float _906 = sin(_904);
        float _908 = _902 + (-1.0);
        float _910 = fma(_906, _892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _912 = _908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = _894 * _910;
        float _916 = fma(_822, _902, _912);
        float _918 = fma(_629, _914, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _920 = fma(_655, _914, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _882 = _916;
        _637 = _918;
        _647 = _920;
        _826 = _912;
    }
    float _922 = _882;
    float _924 = _637;
    float _926 = _647;
    float _928 = _826;
    float _930 = _928;
    float _932 = _924;
    float _934 = _922;
    float _936 = _926;
    if (!_716)
    {
        int _938 = _840 << 4;
        int _940 = _938 + _874;
        _930 = as_type<float>(_940);
    }
    float _942 = _930;
    float _944 = -_519;
    float _946 = _944 + _922;
    int _948 = _657 + 80;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    uint _952 = uint(int(uint(int(_950)) >> uint(2)));
    int _954 = int(_950) & 3;
    float _956 = (*spvDescriptorSet0.vp_c15)._m0[int(_952)][_954];
    int _958 = int(_950) + 1;
    uint _960 = uint(int(uint(_958) >> uint(2)));
    int _962 = _958 & 3;
    float _964 = (*spvDescriptorSet0.vp_c15)._m0[int(_960)][_962];
    float _966 = -_489;
    float _968 = _966 + _924;
    float _970 = -_491;
    float _972 = _970 + _926;
    float _974 = _946 * _946;
    float _976 = _523 * _808;
    float _978 = _523 * _734;
    float _980 = fma(_968, _968, _974);
    float _982 = _942;
    float _984 = _974;
    if (!_716)
    {
        int _986 = as_type<int>(_942) + 400;
        uint _988 = uint(int(uint(_986) >> uint(2)));
        uint _990 = uint(int(uint(int(_988)) >> uint(2)));
        int _992 = int(_988) & 3;
        float _994 = (*spvDescriptorSet0.vp_c15)._m0[int(_990)][_992];
        _982 = _994;
    }
    float _996 = _982;
    float _998 = fma(_489, _800, _976);
    if (!_716)
    {
        float _1000 = floor(_545);
        _984 = _1000;
    }
    float _1002 = _984;
    float _1004 = fma(_972, _972, _980);
    float _1006 = fma(_489, _726, _978);
    float _1008 = fma(_491, _854, _998);
    float _1010 = _523 * _678;
    bool _1012 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1014 = isnan(0.5);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1020 = _1016 || _1018;
    int _1022 = _657 + 88;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    uint _1026 = uint(int(uint(int(_1024)) >> uint(2)));
    int _1028 = int(_1024) & 3;
    float _1030 = (*spvDescriptorSet0.vp_c15)._m0[int(_1026)][_1028];
    int _1032 = int(_1024) + 1;
    uint _1034 = uint(int(uint(_1032) >> uint(2)));
    int _1036 = _1032 & 3;
    float _1038 = (*spvDescriptorSet0.vp_c15)._m0[int(_1034)][_1036];
    float _1040 = _1008 + _862;
    float _1042 = sqrt(_1004);
    float _1044 = fma(_489, _670, _1010);
    float _1046 = fma(_491, _758, _1006);
    float _1048 = fma(_491, _700, _1044);
    float _1050 = _1046 + _766;
    float _1052 = _854;
    if (!_716)
    {
        float _1054 = floor(_609);
        _1052 = _1054;
    }
    float _1056 = _1052;
    float _1058 = _1048 + _708;
    bool _1060 = _1042 > 0.0;
    float _1062 = 1.0 / _1040;
    bool _1064 = !_1060;
    if (!_1064)
    {
        float _1066 = _237 * _237;
        float _1068 = rsqrt(_1004);
        float _1070 = fma(_241, _241, _1066);
        float _1072 = fma(_243, _243, _1070);
        float _1074 = sqrt(_1072);
        float _1076 = _968 * _1068;
        float _1078 = _946 * _1068;
        float _1080 = _972 * _1068;
        bool _1082 = _1074 > 0.0;
        bool _1084 = !_1082;
        if (!_1084)
        {
            float _1086 = rsqrt(_1072);
            float _1088 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1090 = _237 * _1086;
            float _1092 = _241 * _1086;
            float _1094 = _1078 * _1090;
            float _1096 = _243 * _1086;
            float _1098 = fma(_1076, _1092, _1094);
            float _1100 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1102 = fma(_1080, _1096, _1098);
            float _1104 = _1102 * _1100;
            float _1106 = fma(_241, _1104, _924);
            float _1108 = fma(_237, _1104, _922);
            float _1110 = fma(_243, _1104, _926);
            _932 = _1106;
            _934 = _1108;
            _936 = _1110;
            _884 = _1088;
        }
    }
    float _1112 = _932;
    float _1114 = _934;
    float _1116 = _936;
    float _1118 = _884;
    float _1120 = _1118;
    float _1122 = _1112;
    if (_1020)
    {
        _247 = _1112;
    }
    float _1124 = _247;
    float _1126 = _1124;
    if (_1020)
    {
        _249 = _1114;
    }
    float _1128 = _249;
    float _1130 = _1128;
    if (_1020)
    {
        _251 = _1116;
    }
    float _1132 = _251;
    float _1134 = _1132;
    if (!_1020)
    {
        float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1138 = _519 + _1136;
        float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1142 = _489 + _1140;
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1146 = -_489;
        float _1148 = _1146 + _1112;
        float _1150 = _1138 * _1138;
        float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1154 = _491 + _1152;
        float _1156 = -_491;
        float _1158 = _1156 + _1116;
        float _1160 = fma(_1142, _1142, _1150);
        float _1162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1164 = fma(_1154, _1154, _1160);
        float _1166 = sqrt(_1164);
        float _1168 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1170 = precise::min(_1166, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1172 = _1170 * _1162;
        float _1174 = -_519;
        float _1176 = _1174 + _1114;
        float _1178 = _1168 * _1172;
        float _1180 = fma(_1176, _1178, _519);
        float _1182 = fma(_1148, _1178, _489);
        float _1184 = fma(_1158, _1178, _491);
        _1130 = _1180;
        _1126 = _1182;
        _1134 = _1184;
        _1120 = _1172;
    }
    float _1186 = _1130;
    float _1188 = _1126;
    float _1190 = _1134;
    float _1192 = _1120;
    float _1194 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1196 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1198 = _1058 * _1062;
    float _1200 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1202 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1194);
    float _1204 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1196);
    float _1206 = _1050 * _1062;
    float _1208 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1200);
    float _1210 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1202);
    bool _1212 = _1198 >= 0.0;
    float _1214 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1204);
    float _1216 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1218 = _1210 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1220 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1208);
    float _1222 = _1192;
    if (!_716)
    {
        float _1224 = rint(_996);
        float _1226 = precise::max(_1224, 0.0);
        uint _1228 = uint(_1226);
        uint _1230 = clamp(_1228, 0u, 65535u);
        _1222 = as_type<float>(_1230);
    }
    float _1232 = _1222;
    bool _1234 = _1198 <= 1.0;
    bool _1236 = _1234 && _1212;
    float _1238 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1216);
    float _1240 = _1220 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1242 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1244 = _1206 >= 0.0;
    bool _1246 = _1244 && _1236;
    float _1248 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1238);
    float _1250 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    if (!_716)
    {
        float _1252 = -_1056;
        float _1254 = _609 + _1252;
        _1122 = _1254;
    }
    float _1256 = _1122;
    float _1258 = _1214 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1260 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1262 = _1206 <= 1.0;
    bool _1264 = _1262 && _1246;
    float _1266 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1268 = -_1250;
    float _1270 = fma(_1268, _1242, 1.0);
    float _1272 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1260);
    float _1274 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1276 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1272);
    float _1278 = log2(_1270);
    float _1280 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1274);
    float _1282 = _1274;
    if (!_716)
    {
        float _1284 = -_1002;
        float _1286 = _545 + _1284;
        _1282 = _1286;
    }
    float _1288 = _1282;
    float _1290 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1276);
    float _1292 = _523 * _964;
    float _1294 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1296 = _1290;
    if (_1264)
    {
        float _1298 = float(_649);
        _772 = _1298;
    }
    float _1300 = _772;
    float _1302 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1280);
    float _1304 = 1.0 / _1290;
    float _1306 = fma(_489, _956, _1292);
    float _1308 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1294);
    float _1310 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1302);
    float _1312 = fma(_491, _1030, _1306);
    float _1314 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1308);
    float _1316 = _1306;
    float _1318 = _1310;
    if (_1264)
    {
        float _1320 = rint(_1300);
        float _1322 = precise::max(_1320, 0.0);
        uint _1324 = uint(_1322);
        uint _1326 = clamp(_1324, 0u, 65535u);
        _1316 = as_type<float>(_1326);
    }
    float _1328 = _1316;
    float _1330 = _1312 + _1038;
    float _1332 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1314);
    float _1334 = _1278 * 0.693147182464599609375;
    float _1336 = _1330 * _1062;
    float _1338 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1340 = _1332 * _1304;
    float _1342 = _1310 * _1304;
    float _1344 = _1300;
    if (!_716)
    {
        float3 _5520 = float3(_1288, _1256, float(as_type<int>(_1232)));
        float3 _5524 = select(_5520, float3(0.0), isnan(_5520));
        float _1346 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5524.xy, uint(rint(_5524.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5524.xy, uint(rint(_5524.z)), level(0.0)).x;
        _1344 = _1346;
    }
    float _1348 = _1344;
    float _1350 = fma(_1340, 0.5, 0.5);
    float _1352 = fma(_1342, -0.5, 0.5);
    float _1354 = _1206;
    if (_1264)
    {
        float3 _5543 = float3(_1198, _1206, float(as_type<int>(_1328)));
        float3 _5545 = select(_5543, float3(0.0), isnan(_5543));
        float _1356 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5545.xy, uint(rint(_5545.z)), _1336, level(0.0));
        _1354 = _1356;
    }
    float _1358 = _1354;
    float3 _5555 = float3(_1350, _1352, _1338);
    float _1360 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5555, float3(0.0), isnan(_5555)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5555, float3(0.0), isnan(_5555)), level(0.0)).x;
    float3 _5564 = float3(_1350, _1352, _1338);
    float4 _1363 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5564, float3(0.0), isnan(_5564)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5564, float3(0.0), isnan(_5564)), level(0.0)).xyzw;
    float _1365 = _1363.x;
    float _1367 = _1363.y;
    float _1369 = _1363.z;
    float _1371 = _1363.w;
    float _1373 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1375 = int(_1373);
    int _1377 = abs(_770);
    int _1379 = abs(_790);
    float _1381 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1383 = int(_1381);
    float _1385 = float(_1375);
    float _1387 = 1.0 / _1385;
    float _1389 = float(uint(_1383));
    float _1391 = 1.0 / _1389;
    float _1393 = _133 * _1387;
    float _1395 = trunc(_1393);
    int _1397 = int(_1395);
    int _1399 = as_type<int>(_1391) + (-2);
    int _1401 = ~_1383;
    int _1403 = _1401 + 1;
    int _1405 = ~_1383;
    int _1407 = _1405 + 1;
    int _1409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1411 = _1409 != 0;
    float _1413 = float(_1383);
    float _1415 = float(uint(_1397));
    float _1417 = as_type<float>(_1399) * _1415;
    float _1419 = trunc(_1417);
    float _1421 = precise::max(_1419, 0.0);
    uint _1423 = uint(_1421);
    int _1425 = _1403 * int(_1423);
    int _1427 = _1425 + _1397;
    float _1429 = float(uint(_1427));
    float _1431 = as_type<float>(_1427);
    if (_1411)
    {
        _1431 = 1.0;
    }
    float _1433 = _1431;
    float _1435 = _1433;
    if (!_1411)
    {
        _1435 = 7.345489978790283203125;
    }
    float _1437 = _1435;
    float _1439 = as_type<float>(_1399) * _1429;
    float _1441 = float(_1397);
    float _1443 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1445 = int(_1443);
    float _1447 = _1437 * _163;
    float _1449 = trunc(_1439);
    float _1451 = precise::max(_1449, 0.0);
    uint _1453 = uint(_1451);
    float _1455 = float(_1445);
    float _1457 = 1.0 / _1455;
    int _1459 = int(_1423) + int(_1453);
    bool _1461 = _1441 >= _1413;
    bool _1463 = isnan(_1441);
    bool _1465 = _1461 || _1463;
    bool _1467 = isnan(_1413);
    bool _1469 = _1465 || _1467;
    float _1471 = float(_1469);
    float _1473 = _181 * _1413;
    int _1475 = _1407 * _1459;
    int _1477 = _1475 + _1397;
    float _1479 = floor(_1447);
    bool _1481 = uint(_1477) >= uint(_1383);
    float _1483 = trunc(_1471);
    int _1485 = int(_1483);
    bool _1487 = !_1481;
    int _1489 = _1487 ? 0 : (-1);
    float _1491 = _133 * _1457;
    bool _1493 = _1383 == 0;
    int _1495 = ~_1459;
    int _1497 = _1495 + _1489;
    int _1499 = _1497 + 1;
    float _1501 = -_1479;
    float _1503 = _1447 + _1501;
    float _1505 = trunc(_1491);
    int _1507 = int(_1505);
    int _1509 = _1383 * _1499;
    int _1511 = _1509 + _1397;
    float _1513 = _1503 * _1413;
    int _1515 = _1383 + (-1);
    bool _1517 = !_1493;
    int _1519 = _1517 ? _1511 : (-1);
    int _1521 = ~_1485;
    int _1523 = _1521 + 1;
    int _1525 = _1523 + 1;
    float _1527 = trunc(_1513);
    int _1529 = int(_1527);
    int _1531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1533 = _1531 != 0;
    int _1535 = _1519 * _1525;
    bool _1537 = !_1533;
    int _1539 = _1537 ? 0 : 1;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1543 = _1541 != 0;
    float _1545 = trunc(_1473);
    int _1547 = int(_1545);
    int _1549 = _1485 * _1515;
    int _1551 = _1549 + _1535;
    int _1553 = abs(_1539);
    int _1555 = abs(_786);
    float _1557 = float(uint(_1507));
    int _1559 = _1529 * _1553;
    int _1561 = _1559 + _1397;
    int _1563 = _1551 * _1377;
    bool _1565 = !_1543;
    int _1567 = _1565 ? 0 : 1;
    float _1569 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1571 = int(_1569);
    bool _1573 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1575 = isnan(0.5);
    bool _1577 = _1573 || _1575;
    bool _1579 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1581 = _1577 || _1579;
    int _1583 = abs(_1567);
    int _1585 = _1547 * _1555;
    int _1587 = _1585 + _1563;
    int _1589 = _1561 * _1379;
    int _1591 = _1589 + _1587;
    int _1593 = _1529 * _1583;
    int _1595 = _1593 + _1591;
    int _1597 = ~_1383;
    int _1599 = _1597 + 1;
    float _1601 = float(uint(_1571));
    float _1603 = float(uint(_1595));
    int _1605 = ~_1571;
    int _1607 = _1605 + 1;
    float _1609 = 1.0 / _1601;
    float _1611 = as_type<float>(_1399) * _1603;
    int _1613 = ~_1383;
    int _1615 = _1613 + 1;
    float _1617 = trunc(_1611);
    float _1619 = precise::max(_1617, 0.0);
    uint _1621 = uint(_1619);
    int _1623 = as_type<int>(_1609) + (-2);
    float _1625 = as_type<float>(_1623) * _1557;
    int _1627 = _1599 * int(_1621);
    int _1629 = _1627 + _1595;
    float _1631 = trunc(_1625);
    float _1633 = precise::max(_1631, 0.0);
    uint _1635 = uint(_1633);
    float _1637 = float(uint(_1629));
    float _1639 = as_type<float>(_1629);
    float _1641 = as_type<float>(_1615);
    if (_1411)
    {
        _1639 = _163;
    }
    float _1643 = _1639;
    float _1645 = as_type<float>(_1399) * _1637;
    float _1647 = _1643;
    if (!_1411)
    {
        float _1649 = in.m_65.z;
        _1647 = _1649;
    }
    float _1651 = _1647;
    float _1653 = trunc(_1645);
    float _1655 = precise::max(_1653, 0.0);
    uint _1657 = uint(_1655);
    int _1659 = _1607 * int(_1635);
    int _1661 = _1659 + _1507;
    float _1663 = float(uint(_1661));
    float _1665 = as_type<float>(_1623) * _1663;
    int _1667 = int(_1621) + int(_1657);
    float _1669 = _1663;
    float _1671 = as_type<float>(_1635);
    if (_1411)
    {
        _1641 = 1.0;
    }
    float _1673 = _1641;
    float _1675 = trunc(_1665);
    float _1677 = precise::max(_1675, 0.0);
    uint _1679 = uint(_1677);
    float _1681 = _1673;
    if (!_1411)
    {
        _1681 = 5.839270114898681640625;
    }
    float _1683 = _1681;
    int _1685 = _1615 * _1667;
    int _1687 = _1685 + _1595;
    if (_716)
    {
        _1669 = 1.0;
    }
    float _1689 = _1669;
    float _1691 = _1683 * _1651;
    bool _1693 = uint(_1687) >= uint(_1383);
    bool _1695 = !_1693;
    int _1697 = _1695 ? 0 : (-1);
    int _1699 = ~_1667;
    int _1701 = _1699 + _1697;
    int _1703 = _1701 + 1;
    int _1705 = int(_1635) + int(_1679);
    float _1707 = _1689;
    if (_1581)
    {
        _1671 = 1.0;
    }
    float _1709 = _1671;
    int _1711 = _1383 * _1703;
    int _1713 = _1711 + _1595;
    float _1715 = _1709;
    if (!_1581)
    {
        float _1717 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1719 = _1717 * 0.15915493667125701904296875;
        float _1721 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1723 = _1719 * 6.283185482025146484375;
        float _1725 = cos(_1723);
        float _1727 = _1721 * 0.15915493667125701904296875;
        float _1729 = _1719 * 6.283185482025146484375;
        float _1731 = sin(_1729);
        float _1733 = 1.0 / _1725;
        float _1735 = _1727 * 6.283185482025146484375;
        float _1737 = cos(_1735);
        float _1739 = _1731 * _1733;
        float _1741 = _1727 * 6.283185482025146484375;
        float _1743 = sin(_1741);
        float _1745 = _1737 * _1739;
        float _1747 = 1.0 / _1745;
        float _1749 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1751 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1749;
        float _1753 = 1.0 / _1751;
        float _1755 = _1743 * _1747;
        float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1759 = fma(_593, _1755, _1757);
        float _1761 = _1759 * _1753;
        float _1763 = precise::clamp(_1761, 0.0, 1.0);
        _1715 = _1763;
    }
    float _1765 = _1715;
    if (!_716)
    {
        int _1767 = _780 << 4;
        int _1769 = _1767 + 2048;
        uint _1771 = uint(int(uint(_1769) >> uint(2)));
        uint _1773 = uint(int(uint(int(_1771)) >> uint(2)));
        int _1775 = int(_1771) & 3;
        float _1777 = (*spvDescriptorSet0.vp_c15)._m0[int(_1773)][_1775];
        int _1779 = int(_1771) + 1;
        uint _1781 = uint(int(uint(_1779) >> uint(2)));
        int _1783 = _1779 & 3;
        float _1785 = (*spvDescriptorSet0.vp_c15)._m0[int(_1781)][_1783];
        int _1787 = _1769 + 8;
        uint _1789 = uint(int(uint(_1787) >> uint(2)));
        uint _1791 = uint(int(uint(int(_1789)) >> uint(2)));
        int _1793 = int(_1789) & 3;
        float _1795 = (*spvDescriptorSet0.vp_c15)._m0[int(_1791)][_1793];
        int _1797 = int(_1789) + 1;
        uint _1799 = uint(int(uint(_1797) >> uint(2)));
        int _1801 = _1797 & 3;
        float _1803 = (*spvDescriptorSet0.vp_c15)._m0[int(_1799)][_1801];
        float _1805 = _523 * _1785;
        float _1807 = fma(_489, _1777, _1805);
        float _1809 = fma(_491, _1795, _1807);
        float _1811 = _1809 + _1803;
        float _1813 = precise::clamp(_1811, 0.0, 1.0);
        float _1815 = -_1813;
        float _1817 = _1815 + _1348;
        float _1819 = fma(_1817, 500.0, 1.5);
        float _1821 = exp2(_1819);
        float _1823 = 0.0 + _1821;
        float _1825 = precise::clamp(_1823, 0.0, 1.0);
        _639 = _1805;
        _828 = as_type<float>(_1769);
        _1707 = _1825;
    }
    float _1827 = _639;
    float _1829 = _828;
    float _1831 = _1707;
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1835 = _1186 + _1833;
    float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1839 = _1188 + _1837;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1843 = _1190 + _1841;
    float _1845 = _1835 * _1835;
    float _1847 = fma(_1839, _1839, _1845);
    float _1849 = fma(_1843, _1843, _1847);
    float _1851 = rsqrt(_1849);
    float _1853 = sqrt(_1849);
    float _1855 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1857 = _1839 * _1855;
    float _1859 = _1843 * _1855;
    float _1861 = _1857 * _1857;
    float _1863 = _1859 * _1859;
    float _1865 = _1861 + _1863;
    float _1867 = sqrt(_1865);
    bool _1869 = _1867 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1871 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1873 = _1867 + _1871;
    float _1875 = _1827;
    float _1877 = _1865;
    float _1879 = _1873;
    float _1881 = _1857;
    float _1883 = _1859;
    float _1885 = _1861;
    float _1887 = _1863;
    if (_1869)
    {
        float _1889 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1875 = _1889;
    }
    float _1891 = _1875;
    if (_1869)
    {
        float _1893 = rsqrt(_1865);
        _1877 = _1893;
    }
    float _1895 = _1877;
    if (_1869)
    {
        float _1897 = _1873 * _1891;
        _1879 = _1897;
    }
    float _1899 = _1879;
    if (_1869)
    {
        float _1901 = _1899 * 0.15915493667125701904296875;
        _774 = _1901;
    }
    float _1903 = _774;
    float _1905 = _1348;
    if (_1869)
    {
        float _1907 = _1903 * 6.283185482025146484375;
        float _1909 = sin(_1907);
        _1905 = _1909;
    }
    float _1911 = _1905;
    float _1913 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1915 = precise::max(0.0, _1913);
    float _1917 = _1829;
    float _1919 = _1915;
    float _1921 = _1913;
    if (_1869)
    {
        float _1923 = _1903 * 6.283185482025146484375;
        float _1925 = cos(_1923);
        _1917 = _1925;
    }
    float _1927 = _1917;
    float _1929 = -_1855;
    float _1931 = -_1915;
    float _1933 = fma(_1835, _1929, _1931);
    float _1935 = _1933;
    if (_1869)
    {
        float _1937 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1919 = _1937;
    }
    float _1939 = _1919;
    float _1941 = floor(_1691);
    float _1943 = _1939;
    float _1945 = _1911;
    if (_1869)
    {
        float _1947 = fma(_1911, _1939, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1943 = _1947;
    }
    float _1949 = _1943;
    float _1951 = _1949;
    if (_1869)
    {
        float _1953 = _1927 + (-1.0);
        _1921 = _1953;
    }
    float _1955 = _1921;
    if (_1869)
    {
        float _1957 = _1895 * _1949;
        _1945 = _1957;
    }
    float _1959 = _1945;
    if (_1869)
    {
        float _1961 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1951 = _1961;
    }
    float _1963 = _1951;
    if (_1869)
    {
        float _1965 = _1857 * _1959;
        _1881 = _1965;
    }
    float _1967 = _1881;
    if (_1869)
    {
        float _1969 = _1859 * _1959;
        _1883 = _1969;
    }
    float _1971 = _1883;
    int _1973 = ~_1571;
    int _1975 = _1973 + 1;
    if (_1869)
    {
        float _1977 = fma(_1933, _1927, _1963);
        _1935 = _1977;
    }
    float _1979 = _1935;
    if (_1869)
    {
        float _1981 = _1967 * _1967;
        _1885 = _1981;
    }
    float _1983 = _1885;
    if (_1869)
    {
        float _1985 = _1971 * _1971;
        _1887 = _1985;
    }
    float _1987 = _1887;
    float _1989 = fma(_1979, _1979, _1983);
    float _1991 = _1989 + _1987;
    float _1993 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1995 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1993);
    float _1997 = precise::clamp(_1995, 0.0, 1.0);
    float _1999 = -_1997;
    float _2001 = _1999 + 1.0;
    float _2003 = rsqrt(_1991);
    float _2005 = abs(_2001);
    float _2007 = log2(_2005);
    float _2009 = _2003 * _1967;
    float _2011 = _2003 * _1979;
    float _2013 = _2003 * _1971;
    float _2015 = _2009 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2017 = -_2015;
    float _2019 = fma(_2011, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2017);
    float _2021 = -_2013;
    float _2023 = fma(_2021, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2019);
    float _2025 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2027 = fma(_2023, -0.5, 0.5);
    float _2029 = fma(_2023, 0.5, 0.5);
    float _2031 = exp2(_2025);
    float _2033 = fma(_2029, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2035 = fma(_2029, _2033, -0.212114393711090087890625);
    float _2037 = sqrt(_2027);
    float _2039 = fma(_2029, _2035, 1.570728778839111328125);
    float _2041 = _2011 + 1.0;
    float _2043 = -_2011;
    float _2045 = fma(_2031, _2041, _2043);
    float _2047 = fma(_2045, 0.5, 0.5);
    float _2049 = _2037 * 0.636619746685028076171875;
    float _2051 = -_2039;
    float _2053 = fma(_2049, _2051, 1.0);
    bool _2055 = !_1493;
    int _2057 = _2055 ? _1713 : (-1);
    int _2059 = _1975 * _1705;
    int _2061 = _2059 + _1507;
    float2 _6552 = float2(_2053, _2047);
    float3 _2065 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6552, float2(0.0), isnan(_6552)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6552, float2(0.0), isnan(_6552)), level(0.0)).xyz;
    float _2067 = _2065.x;
    float _2069 = _2065.y;
    float _2071 = _2065.z;
    int _2073 = _2057 & 3;
    bool _2075 = _2073 != 0;
    float _2077 = in.m_65.y;
    int _2079 = _2057 & 3;
    bool _2081 = _2079 != 0;
    float _2083 = -_1941;
    float _2085 = _1691 + _2083;
    bool _2087 = uint(_2061) >= uint(_1571);
    out.m_84.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_84.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_84.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    bool _2089 = uint(_2073) > 1u;
    float _2091 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2093 = !_2087;
    int _2095 = _2093 ? 0 : (-1);
    out.m_86.x = _513;
    int _2097 = _2081 ? 0 : 1;
    float _2099 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2101 = ~_1705;
    int _2103 = _2101 + _2095;
    int _2105 = _2103 + 1;
    float _2107 = -_509;
    float _2109 = _2107 + 1.0;
    float _2111 = float(_1571);
    float _2113 = float(_1507);
    float _2115 = exp2(_2099);
    int _2117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2119 = _2117 != 0;
    float _2121 = _2085 * _2111;
    bool _2123 = _2113 >= _2111;
    bool _2125 = isnan(_2113);
    bool _2127 = _2123 || _2125;
    bool _2129 = isnan(_2111);
    bool _2131 = _2127 || _2129;
    float _2133 = float(_2131);
    int _2135 = _1571 * _2105;
    int _2137 = _2135 + _1507;
    bool _2139 = _163 > 0.5;
    float _2141 = _181 * _2111;
    int _2143 = ~_2097;
    int _2145 = _2143 + 1;
    int _2147 = _2145 + 1;
    float _2149 = trunc(_2121);
    int _2151 = int(_2149);
    int _2153 = _2147;
    if (!_2089)
    {
        int _2155 = ~_2097;
        int _2157 = _2155 + 1;
        _2153 = _2157;
    }
    int _2159 = _2153;
    int _2161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2163 = _2161 != 0;
    bool _2165 = !_2119;
    int _2167 = _2165 ? 0 : 1;
    int _2169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2171 = _2169 != 0;
    float _2173 = trunc(_2133);
    int _2175 = int(_2173);
    float _2177 = -_221;
    int _2179 = _2139 ? as_type<int>(_2177) : as_type<int>(_221);
    bool _2181 = _1571 == 0;
    bool _2183 = !_2163;
    int _2185 = _2183 ? 0 : 1;
    float _2187 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2189 = !_2171;
    float _2191 = _2189 ? _221 : as_type<float>(_2179);
    float _2193 = trunc(_2141);
    int _2195 = int(_2193);
    bool _2197 = uint(_2073) >= 2u;
    float _2199 = -_2187;
    float _2201 = fma(_2091, 2.0, _2199);
    bool _2203 = _2077 > 0.5;
    bool _2205 = !_2181;
    int _2207 = _2205 ? _2137 : (-1);
    float _2209 = -_133;
    float _2211 = fma(_2209, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2201);
    int _2213 = ~_2175;
    int _2215 = _2213 + 1;
    int _2217 = _2215 + 1;
    int _2219 = _2197 ? 0 : 1;
    float _2221 = -_225;
    int _2223 = _2203 ? as_type<int>(_2221) : as_type<int>(_225);
    int _2225 = _2207 * _2217;
    int _2227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2229 = _2227 != 0;
    int _2231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2233 = _2231 != 0;
    int _2235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2237 = _2235 != 0;
    int _2239 = _1571 + (-1);
    int _2241 = abs(_2167);
    int _2243 = _2175 * _2239;
    int _2245 = _2243 + _2225;
    int _2247 = abs(_844);
    float _2249 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2251 = abs(_866);
    int _2253 = _2151 * _2241;
    int _2255 = _2253 + _1507;
    float _2257 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2259 = _2245 * _2247;
    float _2261 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2249);
    int _2263 = abs(_870);
    int _2265 = _2195 * _2251;
    int _2267 = _2265 + _2259;
    int _2269 = abs(_2185);
    float _2271 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2273 = _2255 * _2263;
    int _2275 = _2273 + _2267;
    float _2277 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2279 = _2151 * _2269;
    int _2281 = _2279 + _2275;
    float _2283 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2285 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2287 = _2285 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2289 = fma(_2077, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2277);
    float _2291 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2293 = float(uint(_2281));
    float _2295 = fma(_2271, -2.0, _2283);
    float _2297 = 1.0 / _2287;
    float _2299 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2301 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2303 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2305 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2299);
    float _2307 = as_type<float>(_1623) * _2293;
    float _2309 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2301);
    float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2313 = _2311 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2315 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2303);
    float _2317 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2319 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2317;
    float _2321 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2323 = _2321 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2325 = trunc(_2307);
    float _2327 = precise::max(_2325, 0.0);
    uint _2329 = uint(_2327);
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2333 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2335 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2337 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2339 = _2337 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2341 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2343 = _2331 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2345 = _2333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2347 = 1.0 / _2313;
    float _2349 = _2335 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2351 = _2323 * _2297;
    float _2353 = float(uint(_1561));
    float _2355 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2261);
    out.m_88.x = _2343;
    out.m_88.y = _2345;
    out.m_88.z = _2349;
    out.m_88.w = _2341;
    bool _2357 = !_2237;
    float _2359 = _2357 ? _225 : as_type<float>(_2223);
    float _2361 = 1.0 / _2339;
    bool _2363 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2365 = isnan(_465);
    bool _2367 = _2363 || _2365;
    bool _2369 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2371 = _2367 || _2369;
    float _2373 = float(_2371);
    float _2375 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2377 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2375;
    float _2379 = float(uint(_2255));
    float _2381 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2289);
    bool _2383 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2385 = isnan(_465);
    bool _2387 = _2383 || _2385;
    bool _2389 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2391 = _2387 || _2389;
    float _2393 = float(_2391);
    int _2395 = ~_1383;
    int _2397 = _2395 + 1;
    float _2399 = _2319 * _2347;
    float _2401 = as_type<float>(_1623) * _2379;
    float _2403 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2405 = _465 + _2403;
    float _2407 = -_2393;
    float _2409 = _2407 + 1.0;
    int _2411 = ~_1571;
    int _2413 = _2411 + 1;
    float _2415 = as_type<float>(_1399) * _2353;
    bool _2417 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2419 = isnan(_465);
    bool _2421 = _2417 || _2419;
    bool _2423 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2425 = _2421 || _2423;
    float _2427 = float(_2425);
    float _2429 = -_2373;
    float _2431 = _2429 + 1.0;
    float _2433 = _2377 * _2361;
    int _2435 = _2413 * int(_2329);
    int _2437 = _2435 + _2281;
    float _2439 = fma(_2399, _2405, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2441 = trunc(_2415);
    float _2443 = precise::max(_2441, 0.0);
    uint _2445 = uint(_2443);
    bool _2447 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2449 = isnan(_465);
    bool _2451 = _2447 || _2449;
    bool _2453 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2455 = _2451 || _2453;
    float _2457 = float(_2455);
    float _2459 = _2427 * _2431;
    float _2461 = float(uint(_2437));
    float _2463 = -_2427;
    float _2465 = _2463 + 1.0;
    float _2467 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2469 = _465 + _2467;
    float _2471 = _2457 * _2409;
    float _2473 = -_2457;
    float _2475 = _2473 + 1.0;
    float _2477 = trunc(_2401);
    float _2479 = precise::max(_2477, 0.0);
    uint _2481 = uint(_2479);
    float _2483 = as_type<float>(_1623) * _2461;
    float _2485 = _2393 * _2465;
    float _2487 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2489 = _465 + _2487;
    float _2491 = _2439 * _2471;
    float _2493 = fma(_2351, _2469, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2495 = fma(_2433, _2489, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2497 = trunc(_2483);
    float _2499 = precise::max(_2497, 0.0);
    uint _2501 = uint(_2499);
    int _2503 = _2397 * int(_2445);
    int _2505 = _2503 + _1561;
    int _2507 = ~_1571;
    int _2509 = _2507 + 1;
    float _2511 = fma(_2475, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2491);
    float _2513 = float(uint(_2505));
    float _2515 = fma(_2493, _2485, _2511);
    int _2517 = _2509 * int(_2481);
    int _2519 = _2517 + _2255;
    float _2521 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2523 = as_type<float>(_1399) * _2513;
    int _2525 = ~_1571;
    int _2527 = _2525 + 1;
    float _2529 = _2191 + 0.5;
    float _2531 = float(uint(_2519));
    float _2533 = trunc(_2523);
    float _2535 = precise::max(_2533, 0.0);
    uint _2537 = uint(_2535);
    int _2539 = int(_2329) + int(_2501);
    float _2541 = fma(_2495, _2459, _2515);
    int _2543 = ~_1383;
    int _2545 = _2543 + 1;
    float _2547 = as_type<float>(_1623) * _2531;
    int _2549 = _2527 * _2539;
    int _2551 = _2549 + _2281;
    float _2553 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2295);
    float _2555 = fma(_2529, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2211);
    float _2557 = _2359 + (-0.5);
    float _2559 = trunc(_2547);
    float _2561 = precise::max(_2559, 0.0);
    uint _2563 = uint(_2561);
    bool _2565 = uint(_2551) >= uint(_1571);
    float _2567 = fma(_2373, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2541);
    float _2569 = -_2557;
    float _2571 = -_2553;
    float _2573 = fma(_2569, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2571);
    bool _2575 = !_2565;
    int _2577 = _2575 ? 0 : (-1);
    float _2579 = fma(_2291, _2291, 1.0);
    bool _2581 = _2073 != 3;
    float _2583 = _2567 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2585 = ~_2539;
    int _2587 = _2585 + _2577;
    int _2589 = _2587 + 1;
    float _2591 = -_2355;
    float _2593 = _2591 + 1.0;
    int _2595 = int(_2445) + int(_2537);
    float _2597 = rsqrt(_2579);
    int _2599 = ~_1571;
    int _2601 = _2599 + 1;
    int _2603 = _1571 * _2589;
    int _2605 = _2603 + _2281;
    float _2607 = -_2593;
    float _2609 = fma(_2191, _2607, _2555);
    int _2611 = int(_2481) + int(_2563);
    int _2613 = _2545 * _2595;
    int _2615 = _2613 + _1561;
    int _2617 = _2057 >> 31;
    bool _2619 = !_2181;
    int _2621 = _2619 ? _2605 : (-1);
    int _2623 = _2617 & 3;
    int _2625 = _2621 >> 31;
    int _2627 = ~_2219;
    int _2629 = _2627 + 1;
    int _2631 = _2629 + 1;
    int _2633 = _2601 * _2611;
    int _2635 = _2633 + _2255;
    int _2637 = _2631;
    if (_2581)
    {
        int _2639 = ~_2219;
        int _2641 = _2639 + 1;
        _2637 = _2641;
    }
    int _2643 = _2637;
    float _2645 = _2291 * _2597;
    int _2647 = _2057 + _2623;
    bool _2649 = uint(_2615) >= uint(_1383);
    float _2651 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2653 = _2645 * _2651;
    int _2655 = _2625 & 3;
    float _2657 = -_2381;
    float _2659 = _2657 + 1.0;
    int _2661 = _2647 >> 2;
    int _2663 = _2621 + _2655;
    float _2665 = fma(_2359, _2659, _2573);
    int _2667 = _2661 << 4;
    int _2669 = _2667 + 368;
    float _2671 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2673 = _2645 * _2671;
    bool _2675 = !_2649;
    int _2677 = _2675 ? 0 : (-1);
    int _2679 = _2663 >> 2;
    float _2681 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2683 = _2645 * _2681;
    bool _2685 = uint(_2635) >= uint(_1571);
    float _2687 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2673);
    uint _2689 = uint(int(uint(_2669) >> uint(2)));
    uint _2691 = uint(int(uint(int(_2689)) >> uint(2)));
    int _2693 = int(_2689) & 3;
    float _2695 = (*spvDescriptorSet0.vp_c9)._m0[int(_2691)][_2693];
    int _2697 = int(_2689) + 1;
    uint _2699 = uint(int(uint(_2697) >> uint(2)));
    int _2701 = _2697 & 3;
    float _2703 = (*spvDescriptorSet0.vp_c9)._m0[int(_2699)][_2701];
    int _2705 = _2679 << 4;
    int _2707 = _2705 + 656;
    out.m_90.x = _2609;
    out.m_90.y = _2665;
    bool _2709 = !_2685;
    int _2711 = _2709 ? 0 : (-1);
    bool _2713 = !_2075;
    int _2715 = _2713 ? 0 : 1;
    uint _2717 = uint(int(uint(_2707) >> uint(2)));
    uint _2719 = uint(int(uint(int(_2717)) >> uint(2)));
    int _2721 = int(_2717) & 3;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[int(_2719)][_2721];
    int _2725 = int(_2717) + 1;
    uint _2727 = uint(int(uint(_2725) >> uint(2)));
    int _2729 = _2725 & 3;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[int(_2727)][_2729];
    float _2733 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2735 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2683);
    int _2737 = _2621 & 3;
    bool _2739 = _2737 != 0;
    float _2741 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2653);
    int _2743 = _2621 & 3;
    bool _2745 = _2743 != 0;
    float _2747 = _2733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2749 = ~_2595;
    int _2751 = _2749 + _2677;
    int _2753 = _2751 + 1;
    float _2755 = _2521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2757 = _2739 ? 0 : 1;
    int _2759 = _2669 + 8;
    uint _2761 = uint(int(uint(_2759) >> uint(2)));
    uint _2763 = uint(int(uint(int(_2761)) >> uint(2)));
    int _2765 = int(_2761) & 3;
    float _2767 = (*spvDescriptorSet0.vp_c9)._m0[int(_2763)][_2765];
    int _2769 = int(_2761) + 1;
    uint _2771 = uint(int(uint(_2769) >> uint(2)));
    int _2773 = _2769 & 3;
    float _2775 = (*spvDescriptorSet0.vp_c9)._m0[int(_2771)][_2773];
    bool _2777 = uint(_2743) > 1u;
    int _2779 = _1383 * _2753;
    int _2781 = _2779 + _1561;
    int _2783 = ~_2611;
    int _2785 = _2783 + _2711;
    int _2787 = _2785 + 1;
    float _2789 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2791 = abs(_2159);
    out.m_92.x = _2687;
    out.m_92.y = _2735;
    out.m_92.z = _2741;
    int _2793 = _2707 + 8;
    uint _2795 = uint(int(uint(_2793) >> uint(2)));
    uint _2797 = uint(int(uint(int(_2795)) >> uint(2)));
    int _2799 = int(_2795) & 3;
    float _2801 = (*spvDescriptorSet0.vp_c9)._m0[int(_2797)][_2799];
    int _2803 = int(_2795) + 1;
    uint _2805 = uint(int(uint(_2803) >> uint(2)));
    int _2807 = _2803 & 3;
    float _2809 = (*spvDescriptorSet0.vp_c9)._m0[int(_2805)][_2807];
    int _2811 = ~_2757;
    int _2813 = _2811 + 1;
    int _2815 = _2813 + 1;
    int _2817 = _1571 * _2787;
    int _2819 = _2817 + _2255;
    float _2821 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2789);
    float _2823 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2825 = !_1493;
    int _2827 = _2825 ? _2781 : (-1);
    int _2829 = _2815;
    if (!_2777)
    {
        int _2831 = ~_2757;
        int _2833 = _2831 + 1;
        _2829 = _2833;
    }
    int _2835 = _2829;
    float _2837 = _2823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2839 = _2073 != 3;
    float _2841 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2821);
    int _2843 = abs(_2835);
    out.m_94.x = _2837;
    out.m_94.y = _2747;
    out.m_94.z = _2755;
    out.m_94.w = _2583;
    int _2845 = ~_2791;
    int _2847 = _2845 + 1;
    int _2849 = _2847 + 1;
    bool _2851 = !_2745;
    int _2853 = _2851 ? 0 : 1;
    bool _2855 = uint(_2743) >= 2u;
    int _2857 = abs(_2715);
    int _2859 = _2849 * as_type<int>(_2703);
    int _2861 = ~_2843;
    int _2863 = _2861 + 1;
    int _2865 = _2863 + 1;
    int _2867 = ~_2857;
    int _2869 = _2867 + 1;
    int _2871 = _2869 + 1;
    bool _2873 = !_2181;
    int _2875 = _2873 ? _2819 : (-1);
    float _2877 = _1765 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2879 = _2855 ? 0 : 1;
    int _2881 = _2871 * as_type<int>(_2695);
    int _2883 = _2881 + _2859;
    bool _2885 = _2743 != 3;
    int _2887 = _2865 * as_type<int>(_2731);
    int _2889 = abs(_2853);
    int _2891 = abs(_2643);
    float _2893 = abs(_593);
    float _2895 = log2(_2893);
    bool _2897 = !_2229;
    int _2899 = _2897 ? 0 : 1;
    int _2901 = ~_2889;
    int _2903 = _2901 + 1;
    int _2905 = _2903 + 1;
    int _2907 = ~_2879;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    bool _2913 = !_2233;
    int _2915 = _2913 ? 0 : 1;
    int _2917 = _2905 * as_type<int>(_2723);
    int _2919 = _2917 + _2887;
    bool _2921 = _2743 != 3;
    int _2923 = _2911;
    if (_2885)
    {
        int _2925 = ~_2879;
        int _2927 = _2925 + 1;
        _2923 = _2927;
    }
    int _2929 = _2923;
    int _2931 = abs(_2899);
    float _2933 = _2895 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2935 = !_2839;
    int _2937 = _2935 ? 0 : (-1);
    int _2939 = abs(_2915);
    int _2941 = abs(_2929);
    float _2943 = exp2(_2933);
    bool _2945 = !_2921;
    int _2947 = _2945 ? 0 : (-1);
    int _2949 = ~_2891;
    int _2951 = _2949 + 1;
    int _2953 = _2951 + 1;
    int _2955 = abs(_2937);
    int _2957 = abs(_2947);
    int _2959 = _2953 * as_type<int>(_2767);
    int _2961 = _2959 + _2883;
    int _2963 = ~_2941;
    int _2965 = _2963 + 1;
    int _2967 = _2965 + 1;
    int _2969 = ~_2955;
    int _2971 = _2969 + 1;
    int _2973 = _2971 + 1;
    int _2975 = _2967 * as_type<int>(_2801);
    int _2977 = _2975 + _2919;
    int _2979 = ~_2957;
    int _2981 = _2979 + 1;
    int _2983 = _2981 + 1;
    int _2985 = _2973 * as_type<int>(_2775);
    int _2987 = _2985 + _2961;
    int _2989 = _2983 * as_type<int>(_2809);
    int _2991 = _2989 + _2977;
    int _2993 = ~_2939;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    int _2999 = ~_2931;
    int _3001 = _2999 + 1;
    int _3003 = _3001 + 1;
    float _3005 = fma(_2943, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3007 = precise::clamp(_3005, 0.0, 1.0);
    bool _3009 = _593 <= 8000.0;
    bool _3011 = isnan(_593);
    bool _3013 = _3009 || _3011;
    bool _3015 = isnan(8000.0);
    bool _3017 = _3013 || _3015;
    float _3019 = float(_3017);
    int _3021 = _2991 * _2997;
    bool _3023 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3025 = isnan(_1853);
    bool _3027 = _3023 || _3025;
    bool _3029 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3031 = _3027 || _3029;
    int _3033 = _2987 * _3003;
    float _3035 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2841);
    int _3037 = _2875 * _2939;
    int _3039 = _3037 + _3021;
    float _3041 = _1290 * 0.5;
    int _3043 = _2827 * _2931;
    int _3045 = _3043 + _3033;
    float _3047 = _1332 + _1290;
    out.gl_Position.x = _1332;
    out.gl_Position.y = _1310;
    out.gl_Position.z = _3035;
    out.gl_Position.w = _1290;
    float _3049 = fma(_1310, -0.5, _3041);
    float _3051 = _3035 + _1290;
    float _3053 = float(_3045);
    float _3055 = _3047 * 0.5;
    float _3057 = float(_3039);
    float _3059 = fma(_3007, -2.0, 3.0);
    float _3061 = _3007 * _3007;
    out.m_96.x = _3053;
    float _3063 = _3051 * 0.5;
    float _3065 = _3061 * _3059;
    out.m_96.z = _3057;
    float _3067 = -_2115;
    float _3069 = _3067 + 1.0;
    float _3071 = _1290;
    float _3073 = _3063;
    float _3075 = _3049;
    float _3077 = _3055;
    if (!_1264)
    {
        _1318 = 1.0;
    }
    float _3079 = _1318;
    float _3081 = -_3065;
    float _3083 = _3081 + 1.0;
    float _3085 = _3079;
    if (_1264)
    {
        bool _3087 = _1358 >= _1336;
        bool _3089 = isnan(_1358);
        bool _3091 = _3087 || _3089;
        bool _3093 = isnan(_1336);
        bool _3095 = _3091 || _3093;
        float _3097 = float(_3095);
        _3085 = _3097;
    }
    float _3099 = _3085;
    float _3101 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3103 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3105 = fma(_3083, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3065);
    out.m_98.x = _3055;
    out.m_98.y = _3049;
    out.m_98.z = _3063;
    out.m_98.w = _1290;
    float _3107 = _3099 * _1831;
    float _3109 = _3101 * _1360;
    float _3111 = _3019 * _3105;
    float _3113 = -_3101;
    float _3115 = _3113 + 1.0;
    if (!_3031)
    {
        _1296 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3117 = _1296;
    float _3119 = _1371 * _3109;
    float _3121 = _3111 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3123 = _2071 * _3109;
    float _3125 = _1371 * _3115;
    float _3127 = fma(_2067, _3119, _1365);
    float _3129 = _2109 * _3121;
    float _3131 = precise::clamp(_3129, 0.0, 1.0);
    float _3133 = fma(_2069, _3119, _1367);
    float _3135 = fma(_1371, _3123, _1369);
    float _3137 = _2305 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3139 = -_3131;
    float _3141 = fma(_3139, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3143 = _3121;
    float _3145 = _3117;
    float _3147 = _3117;
    if (!_3031)
    {
        _3143 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3149 = _3143;
    out.m_100.x = _3127;
    out.m_100.y = _3133;
    out.m_100.z = _3135;
    out.m_100.w = _3125;
    float _3151 = -_3107;
    float _3153 = fma(_3151, _3141, 1.0);
    float _3155 = precise::clamp(_3153, 0.0, 1.0);
    float _3157 = _3149;
    float _3159 = _3149;
    if (!_3031)
    {
        _3071 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3161 = _3071;
    float _3163 = _3161;
    float _3165 = _3161;
    if (!_3031)
    {
        _3073 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3167 = _3073;
    float _3169 = _3155 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3171 = _2309 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3173 = _3167;
    float _3175 = _3167;
    if (!_3031)
    {
        _3075 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3177 = _3075;
    float _3179 = _3177;
    float _3181 = _3177;
    if (!_3031)
    {
        _3077 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3183 = _3077;
    out.m_102.x = _3169;
    out.m_104.x = _3137;
    out.m_104.y = _3171;
    out.m_104.z = _3103;
    bool _3185 = !_3031;
    float _3187 = _3183;
    float _3189 = _3183;
    if (!_3185)
    {
        bool _3191 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3193 = isnan(_1853);
        bool _3195 = _3191 || _3193;
        bool _3197 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3199 = _3195 || _3197;
        if (!_3199)
        {
            float _3201 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3203 = _1853 + _3201;
            float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3207 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3205;
            float _3209 = 1.0 / _3207;
            float _3211 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3219 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3221 = _3219 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3223 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3225 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3227 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3229 = _3227 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3231 = _3203 * _3209;
            float _3233 = precise::clamp(_3231, 0.0, 1.0);
            float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3239 = fma(_3233, _3213, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3241 = fma(_3233, _3237, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3243 = fma(_3233, _3217, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3245 = fma(_3233, _3221, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3247 = fma(_3233, _3225, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3249 = fma(_3233, _3229, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3165 = _3241;
            _3189 = _3247;
            _3159 = _3239;
            _3181 = _3245;
            _3175 = _3243;
            _3147 = _3249;
            _3251 = true;
        }
        else
        {
            bool _3253 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3255 = isnan(_1853);
            bool _3257 = _3253 || _3255;
            bool _3259 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3261 = _3257 || _3259;
            if (!_3261)
            {
                _3157 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3263 = _3157;
            _3159 = _3263;
            if (!_3261)
            {
                _3163 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3265 = _3163;
            _3165 = _3265;
            if (!_3261)
            {
                _3173 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3267 = _3173;
            _3175 = _3267;
            if (!_3261)
            {
                _3179 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3269 = _3179;
            _3181 = _3269;
            if (!_3261)
            {
                _3187 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3271 = _3187;
            _3189 = _3271;
            if (!_3261)
            {
                _3145 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3273 = _3145;
            bool _3275 = !_3261;
            _3147 = _3273;
            if (!_3275)
            {
                bool _3277 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3279 = isnan(_1853);
                bool _3281 = _3277 || _3279;
                bool _3283 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3285 = _3281 || _3283;
                if (!_3285)
                {
                    float _3287 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3289 = _1853 + _3287;
                    float _3291 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3293 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3291;
                    float _3295 = 1.0 / _3293;
                    float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3299 = _3297 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3301 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3303 = _3301 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3305 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3307 = _3305 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3309 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3311 = _3309 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3313 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3315 = _3313 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3317 = _3289 * _3295;
                    float _3319 = precise::clamp(_3317, 0.0, 1.0);
                    float _3321 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3325 = fma(_3319, _3299, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3327 = fma(_3319, _3323, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3329 = fma(_3319, _3303, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3331 = fma(_3319, _3307, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3333 = fma(_3319, _3311, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3335 = fma(_3319, _3315, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3165 = _3327;
                    _3189 = _3333;
                    _3159 = _3325;
                    _3181 = _3331;
                    _3175 = _3329;
                    _3147 = _3335;
                    _3251 = true;
                }
                else
                {
                    _3165 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3189 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3159 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3181 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3175 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3147 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3251 = false;
    float _3337 = _3165;
    float _3339 = _3189;
    float _3341 = _3159;
    float _3343 = _3181;
    float _3345 = _3175;
    float _3347 = _3147;
    float _3349 = _2877 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3351 = fma(_3171, -0.5, 0.5);
    float _3353 = precise::clamp(_3351, 0.0, 1.0);
    float _3355 = -_3337;
    float _3357 = _3355 + _3339;
    float _3359 = -_3341;
    float _3361 = _3359 + _3343;
    out.m_63.x = _3349;
    float _3363 = fma(_3353, _3357, _3337);
    float _3365 = -_3345;
    float _3367 = _3365 + _3347;
    float _3369 = fma(_3353, _3361, _3341);
    float _3371 = _3363 * 0.586610972881317138671875;
    bool _3373 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3375 = fma(_3353, _3367, _3345);
    out.m_106.x = 0.0;
    float _3377 = fma(_3369, 0.298911988735198974609375, _3371);
    bool _3379 = _1765 > 0.0;
    bool _3381 = isnan(_1765);
    bool _3383 = _3379 || _3381;
    bool _3385 = isnan(0.0);
    bool _3387 = _3383 || _3385;
    float _3389 = fma(_3375, 0.114477999508380889892578125, _3377);
    float _3391 = -_3389;
    float _3393 = _3369 + _3391;
    float _3395 = -_3389;
    float _3397 = _3363 + _3395;
    float _3399 = -_3389;
    float _3401 = _3375 + _3399;
    float _3403 = fma(_3393, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3389);
    float _3405 = fma(_3397, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3389);
    float _3407 = fma(_3401, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3389);
    bool _3409 = !_3373;
    if (!_3409)
    {
        float _3411 = -_1186;
        float _3413 = _3411 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3415 = -_1188;
        float _3417 = _3415 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3419 = -_1190;
        float _3421 = _3419 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3423 = _3413 * _3413;
        float _3425 = fma(_3417, _3417, _3423);
        float _3427 = fma(_3421, _3421, _3425);
        float _3429 = sqrt(_3427);
        float _3431 = rsqrt(_3427);
        float _3433 = -_3429;
        float _3435 = _3433 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3437 = _3435 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3439 = precise::clamp(_3437, 0.0, 1.0);
        float _3441 = _3417 * _3431;
        float _3443 = _3413 * _3431;
        float _3445 = abs(_3439);
        float _3447 = log2(_3445);
        float _3449 = _3421 * _3431;
        float _3451 = _3441 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3453 = _3171 * _3443;
        float _3455 = -_3443;
        float _3457 = -_3451;
        float _3459 = fma(_3455, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3457);
        float _3461 = fma(_3137, _3441, _3453);
        float _3463 = -_3449;
        float _3465 = fma(_3463, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3459);
        float _3467 = fma(_3103, _3449, _3461);
        float _3469 = precise::clamp(_3467, 0.0, 1.0);
        float _3471 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3473 = _3465 + _3471;
        float _3475 = _3447 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3477 = _3473 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3479 = precise::clamp(_3477, 0.0, 1.0);
        float _3481 = exp2(_3475);
        float _3483 = _3481 * _3479;
        float _3485 = _3469 * _3483;
        float _3487 = _3485 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3489 = _3485 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3491 = _3485 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _3487;
        out.m_106.y = _3489;
        out.m_106.z = _3491;
    }
    out.m_108.x = _3403;
    out.m_108.y = _3405;
    out.m_108.z = _3407;
    if (_3387)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_63.x = 0.0;
    float _3493 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3493;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3251 = false;
    bool _463 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _122 = in.m_56.w;
    float _124 = in.m_58.w;
    float _126 = trunc(_122);
    int _129 = int(_126);
    float _131 = -_124;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _133;
    bool _137 = _129 >= 1;
    float _139 = 0.0;
    float _141 = as_type<float>(_129);
    if (!_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _139;
    if (!_137)
    {
        out.m_63.x = 0.0;
    }
    int _145 = 0;
    if (!_137)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    int _151 = _149;
    if (!_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3561 = as_type<float>(_149);
        out.gl_Position.z = _3561;
    }
    if (!_137)
    {
        return out;
    }
    bool _153 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_124);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    float _163 = in.m_65.x;
    float _165 = float(_129);
    bool _167 = _133 >= _165;
    bool _169 = !_161;
    bool _171 = _167 || _169;
    float _173 = 1.0 / _165;
    if (_171)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _141;
    if (_171)
    {
        out.m_63.x = 0.0;
    }
    if (_171)
    {
        float _177 = _175 * 5.0;
        _151 = as_type<int>(_177);
    }
    int _179 = _151;
    float _181 = _133 * _173;
    out.m_67.x = _163;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3625 = as_type<float>(_179);
        out.gl_Position.z = _3625;
    }
    out.m_61.x = _181;
    if (_171)
    {
        return out;
    }
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_72.x;
    float _187 = in.m_72.y;
    float _189 = in.m_72.z;
    float _191 = in.m_74.x;
    float _193 = in.m_74.y;
    float _195 = in.m_74.z;
    float _197 = in.m_76.x;
    float _199 = in.m_76.y;
    float _201 = in.m_76.z;
    float _203 = in.m_78.x;
    float _205 = in.m_78.y;
    float _207 = in.m_78.z;
    int _209 = as_type<int>(_183) & 1;
    bool _211 = _209 != 0;
    int _213 = as_type<int>(_183) & 2;
    bool _215 = _213 != 0;
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _219 = !_211;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_215;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _187 * _193;
    float _229 = _187 * _199;
    float _231 = fma(_185, _191, _227);
    float _233 = _187 * _205;
    float _235 = fma(_185, _197, _229);
    float _237 = fma(_189, _195, _231);
    float _239 = fma(_185, _203, _233);
    float _241 = fma(_189, _201, _235);
    float _243 = fma(_189, _207, _239);
    bool _245 = !_217;
    float _247 = _243;
    float _249 = _241;
    float _251 = _237;
    float _267;
    if (!_245)
    {
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        _267 = _181;
    }
    _269 = false;
    float _271 = _267;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = _271 + _277;
    bool _281 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _283 = isnan(_271);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _301;
    float _305 = 1.0 / _295;
    bool _307 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _309 = 1.0 / _299;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = 1.0 / _303;
    float _317 = _275 * _305;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _271 + _319;
    float _323 = fma(_313, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _325 = _321 * _309;
    bool _327 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _329 = isnan(_271);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _339;
    float _343 = fma(_341, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _345 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _347 = isnan(_271);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = _279 * _315;
    float _359 = -_291;
    float _361 = _359 + 1.0;
    bool _363 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _365 = isnan(_271);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = _337 * _361;
    float _381 = -_337;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = -_373;
    float _391 = _389 + 1.0;
    float _393 = fma(_377, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _395 = _373 * _383;
    float _397 = fma(_387, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _399 = in.m_80.x;
    float _401 = in.m_80.y;
    float _403 = _355 * _391;
    float _405 = -_355;
    float _407 = _405 + 1.0;
    float _409 = _323 * _403;
    float _411 = _343 * _403;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _417;
    float _421 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].x, _409);
    float _423 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].y, _411);
    float _425 = fma(_415, _357, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _427 = fma(_419, _357, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _429 = fma(_393, _395, _421);
    float _431 = fma(_397, _395, _423);
    float _433 = fma(_425, _379, _429);
    float _435 = fma(_427, _379, _431);
    float _437 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[146].x, _433);
    float _439 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[146].y, _435);
    float _441 = _437 * _399;
    float _443 = _439 * _401;
    bool _445 = !_307;
    float _461;
    if (!_445)
    {
        float _447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _449 = _163 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _453 = _451 * _447;
        float _455 = floor(_453);
        float _457 = -_455;
        float _459 = _453 + _457;
        _461 = _459;
        _463 = true;
    }
    else
    {
        _461 = _181;
    }
    _463 = false;
    float _465 = _461;
    float _467 = in.m_56.x;
    float _469 = in.m_56.y;
    float _471 = in.m_56.z;
    float _473 = in.m_76.w;
    float _475 = in.m_78.w;
    float _477 = _199 * _469;
    float _479 = _205 * _469;
    float _481 = fma(_197, _467, _477);
    float _483 = fma(_203, _467, _479);
    float _485 = fma(_201, _471, _481);
    float _487 = fma(_207, _471, _483);
    float _489 = _485 + _473;
    float _491 = _487 + _475;
    float _493 = fma(_489, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _495 = fma(_491, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _497 = floor(_493);
    float _499 = floor(_495);
    float _501 = -_497;
    float _503 = _493 + _501;
    float _505 = -_499;
    float _507 = _495 + _505;
    float2 _4132 = float2(_503, _507);
    float _509 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4132, float2(0.0), isnan(_4132)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4132, float2(0.0), isnan(_4132)), level(0.0)).x;
    float _511 = in.m_82.y;
    float _513 = _441 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _515 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _517 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _519 = _469 + _511;
    float _521 = _519 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _523 = _519 + _517;
    float _525 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[11].x, _521);
    float _527 = _523 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _529 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[11].z, _525);
    float _531 = _519 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _533 = fma(_489, (*spvDescriptorSet0.vp_c15)._m0[126].x, _527);
    float _535 = _529 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _537 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[10].x, _531);
    float _539 = fma(_491, (*spvDescriptorSet0.vp_c15)._m0[126].z, _533);
    float _541 = 1.0 / _535;
    float _543 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[10].z, _537);
    float _545 = _539 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _547 = _543 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _549 = trunc(_545);
    int _551 = int(_549);
    float _553 = _547 + _535;
    float _555 = _553 * _541;
    float _557 = _555 * 0.5;
    float _559 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _561 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _563 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[30].w, _561);
    float _565 = _443 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _567 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _569 = _551 + _567;
    int _571 = _569 + 1;
    float _573 = _565 * _559;
    float _575 = 1.0 / _563;
    float _577 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _579 = _573 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _581 = _513 * _577;
    float _583 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[24].x, _579);
    float _585 = _523 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _587 = fma(_515, (*spvDescriptorSet0.vp_c8)._m0[24].z, _583);
    float _589 = fma(_489, (*spvDescriptorSet0.vp_c15)._m0[127].x, _585);
    float _591 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _593 = _575 * _591;
    float _595 = _573 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _597 = fma(_491, (*spvDescriptorSet0.vp_c15)._m0[127].z, _589);
    float _599 = _587 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _601 = _573 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _603 = _593 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _605 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[26].x, _595);
    bool _607 = _593 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _609 = _597 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _611 = !_603;
    int _613 = _611 ? 0 : 1;
    float _615 = fma(_515, (*spvDescriptorSet0.vp_c8)._m0[26].z, _605);
    float _617 = _489 + _599;
    float _619 = trunc(_609);
    int _621 = int(_619);
    float _623 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[25].x, _601);
    float _625 = _615 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _627 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _629 = _617 + _627;
    float _631 = fma(_515, (*spvDescriptorSet0.vp_c8)._m0[25].z, _623);
    int _633 = 2;
    int _635 = _571;
    float _637 = _617;
    float _639 = _523;
    if (!_603)
    {
        _633 = 1;
    }
    int _641 = _633;
    float _643 = _491 + _625;
    int _645 = _641;
    float _647 = _643;
    if (!_607)
    {
        _645 = _613;
    }
    int _649 = _645;
    bool _651 = _571 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _653 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _655 = _643 + _653;
    int _657 = _649 << 6;
    float _659 = _655 * _655;
    int _661 = _657 + 48;
    uint _664 = uint(int(uint(_661) >> uint(2)));
    uint _666 = uint(int(uint(int(_664)) >> uint(2)));
    int _668 = int(_664) & 3;
    float _670 = (*spvDescriptorSet0.vp_c15)._m0[int(_666)][_668];
    int _672 = int(_664) + 1;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    int _676 = _672 & 3;
    float _678 = (*spvDescriptorSet0.vp_c15)._m0[int(_674)][_676];
    int _680 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _682 = _621 + _680;
    int _684 = _682 + 1;
    float _686 = fma(_629, _629, _659);
    int _688 = _571 | _684;
    float _690 = sqrt(_686);
    int _692 = _657 + 56;
    uint _694 = uint(int(uint(_692) >> uint(2)));
    uint _696 = uint(int(uint(int(_694)) >> uint(2)));
    int _698 = int(_694) & 3;
    float _700 = (*spvDescriptorSet0.vp_c15)._m0[int(_696)][_698];
    int _702 = int(_694) + 1;
    uint _704 = uint(int(uint(_702) >> uint(2)));
    int _706 = _702 & 3;
    float _708 = (*spvDescriptorSet0.vp_c15)._m0[int(_704)][_706];
    bool _710 = _688 < 0;
    bool _712 = _710 || _651;
    bool _714 = _684 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _716 = _714 || _712;
    int _718 = _657 + 64;
    uint _720 = uint(int(uint(_718) >> uint(2)));
    uint _722 = uint(int(uint(int(_720)) >> uint(2)));
    int _724 = int(_720) & 3;
    float _726 = (*spvDescriptorSet0.vp_c15)._m0[int(_722)][_724];
    int _728 = int(_720) + 1;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    int _732 = _728 & 3;
    float _734 = (*spvDescriptorSet0.vp_c15)._m0[int(_730)][_732];
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _738 = _736 != 0;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _742 = _740 != 0;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _746 = _744 != 0;
    bool _748 = _690 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _750 = _657 + 72;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    uint _754 = uint(int(uint(int(_752)) >> uint(2)));
    int _756 = int(_752) & 3;
    float _758 = (*spvDescriptorSet0.vp_c15)._m0[int(_754)][_756];
    int _760 = int(_752) + 1;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    int _764 = _760 & 3;
    float _766 = (*spvDescriptorSet0.vp_c15)._m0[int(_762)][_764];
    bool _768 = !_742;
    int _770 = _768 ? 0 : 1;
    float _772 = as_type<float>(_649);
    float _774 = as_type<float>(_657);
    if (!_716)
    {
        int _776 = _684 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _778 = _776 + _571;
        _635 = _778;
    }
    int _780 = _635;
    float _782 = _631 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _784 = !_738;
    int _786 = _784 ? 0 : 1;
    bool _788 = !_746;
    int _790 = _788 ? 0 : 1;
    int _792 = _657 + 96;
    uint _794 = uint(int(uint(_792) >> uint(2)));
    uint _796 = uint(int(uint(int(_794)) >> uint(2)));
    int _798 = int(_794) & 3;
    float _800 = (*spvDescriptorSet0.vp_c15)._m0[int(_796)][_798];
    int _802 = int(_794) + 1;
    uint _804 = uint(int(uint(_802) >> uint(2)));
    int _806 = _802 & 3;
    float _808 = (*spvDescriptorSet0.vp_c15)._m0[int(_804)][_806];
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _812 = _810 != 0;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _816 = _814 != 0;
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _820 = _818 != 0;
    float _822 = _519 + _782;
    int _824 = 0;
    float _826 = _782;
    float _828 = as_type<float>(_780);
    if (!_716)
    {
        int _830 = _780 << 2;
        _824 = _830;
    }
    int _832 = _824;
    int _834 = 0;
    int _836 = _832;
    if (!_716)
    {
        uint _838 = uint(int(uint(_780) >> uint(2)));
        _834 = int(_838);
    }
    int _840 = _834;
    bool _842 = !_816;
    int _844 = _842 ? 0 : 1;
    int _846 = _657 + 104;
    uint _848 = uint(int(uint(_846) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.vp_c15)._m0[int(_850)][_852];
    int _856 = int(_848) + 1;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    int _860 = _856 & 3;
    float _862 = (*spvDescriptorSet0.vp_c15)._m0[int(_858)][_860];
    bool _864 = !_812;
    int _866 = _864 ? 0 : 1;
    bool _868 = !_820;
    int _870 = _868 ? 0 : 1;
    if (!_716)
    {
        int _872 = 12 & _832;
        _836 = _872;
    }
    int _874 = _836;
    float _876 = 0.0;
    if (!_748)
    {
        _876 = _822;
    }
    float _878 = _876;
    bool _880 = !_748;
    float _882 = _878;
    float _884 = _726;
    if (!_880)
    {
        float _886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _890 = _690 + _888;
        float _892 = _822 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _894 = rsqrt(_686);
        float _896 = _890 * _886;
        float _898 = _896 * 0.15915493667125701904296875;
        float _900 = _898 * 6.283185482025146484375;
        float _902 = cos(_900);
        float _904 = _898 * 6.283185482025146484375;
        float _906 = sin(_904);
        float _908 = _902 + (-1.0);
        float _910 = fma(_906, _892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _912 = _908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = _894 * _910;
        float _916 = fma(_822, _902, _912);
        float _918 = fma(_629, _914, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _920 = fma(_655, _914, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _882 = _916;
        _637 = _918;
        _647 = _920;
        _826 = _912;
    }
    float _922 = _882;
    float _924 = _637;
    float _926 = _647;
    float _928 = _826;
    float _930 = _928;
    float _932 = _924;
    float _934 = _922;
    float _936 = _926;
    if (!_716)
    {
        int _938 = _840 << 4;
        int _940 = _938 + _874;
        _930 = as_type<float>(_940);
    }
    float _942 = _930;
    float _944 = -_519;
    float _946 = _944 + _922;
    int _948 = _657 + 80;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    uint _952 = uint(int(uint(int(_950)) >> uint(2)));
    int _954 = int(_950) & 3;
    float _956 = (*spvDescriptorSet0.vp_c15)._m0[int(_952)][_954];
    int _958 = int(_950) + 1;
    uint _960 = uint(int(uint(_958) >> uint(2)));
    int _962 = _958 & 3;
    float _964 = (*spvDescriptorSet0.vp_c15)._m0[int(_960)][_962];
    float _966 = -_489;
    float _968 = _966 + _924;
    float _970 = -_491;
    float _972 = _970 + _926;
    float _974 = _946 * _946;
    float _976 = _523 * _808;
    float _978 = _523 * _734;
    float _980 = fma(_968, _968, _974);
    float _982 = _942;
    float _984 = _974;
    if (!_716)
    {
        int _986 = as_type<int>(_942) + 400;
        uint _988 = uint(int(uint(_986) >> uint(2)));
        uint _990 = uint(int(uint(int(_988)) >> uint(2)));
        int _992 = int(_988) & 3;
        float _994 = (*spvDescriptorSet0.vp_c15)._m0[int(_990)][_992];
        _982 = _994;
    }
    float _996 = _982;
    float _998 = fma(_489, _800, _976);
    if (!_716)
    {
        float _1000 = floor(_545);
        _984 = _1000;
    }
    float _1002 = _984;
    float _1004 = fma(_972, _972, _980);
    float _1006 = fma(_489, _726, _978);
    float _1008 = fma(_491, _854, _998);
    float _1010 = _523 * _678;
    bool _1012 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1014 = isnan(0.5);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1020 = _1016 || _1018;
    int _1022 = _657 + 88;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    uint _1026 = uint(int(uint(int(_1024)) >> uint(2)));
    int _1028 = int(_1024) & 3;
    float _1030 = (*spvDescriptorSet0.vp_c15)._m0[int(_1026)][_1028];
    int _1032 = int(_1024) + 1;
    uint _1034 = uint(int(uint(_1032) >> uint(2)));
    int _1036 = _1032 & 3;
    float _1038 = (*spvDescriptorSet0.vp_c15)._m0[int(_1034)][_1036];
    float _1040 = _1008 + _862;
    float _1042 = sqrt(_1004);
    float _1044 = fma(_489, _670, _1010);
    float _1046 = fma(_491, _758, _1006);
    float _1048 = fma(_491, _700, _1044);
    float _1050 = _1046 + _766;
    float _1052 = _854;
    if (!_716)
    {
        float _1054 = floor(_609);
        _1052 = _1054;
    }
    float _1056 = _1052;
    float _1058 = _1048 + _708;
    bool _1060 = _1042 > 0.0;
    float _1062 = 1.0 / _1040;
    bool _1064 = !_1060;
    if (!_1064)
    {
        float _1066 = _237 * _237;
        float _1068 = rsqrt(_1004);
        float _1070 = fma(_241, _241, _1066);
        float _1072 = fma(_243, _243, _1070);
        float _1074 = sqrt(_1072);
        float _1076 = _968 * _1068;
        float _1078 = _946 * _1068;
        float _1080 = _972 * _1068;
        bool _1082 = _1074 > 0.0;
        bool _1084 = !_1082;
        if (!_1084)
        {
            float _1086 = rsqrt(_1072);
            float _1088 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1090 = _237 * _1086;
            float _1092 = _241 * _1086;
            float _1094 = _1078 * _1090;
            float _1096 = _243 * _1086;
            float _1098 = fma(_1076, _1092, _1094);
            float _1100 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1102 = fma(_1080, _1096, _1098);
            float _1104 = _1102 * _1100;
            float _1106 = fma(_241, _1104, _924);
            float _1108 = fma(_237, _1104, _922);
            float _1110 = fma(_243, _1104, _926);
            _932 = _1106;
            _934 = _1108;
            _936 = _1110;
            _884 = _1088;
        }
    }
    float _1112 = _932;
    float _1114 = _934;
    float _1116 = _936;
    float _1118 = _884;
    float _1120 = _1118;
    float _1122 = _1112;
    if (_1020)
    {
        _247 = _1112;
    }
    float _1124 = _247;
    float _1126 = _1124;
    if (_1020)
    {
        _249 = _1114;
    }
    float _1128 = _249;
    float _1130 = _1128;
    if (_1020)
    {
        _251 = _1116;
    }
    float _1132 = _251;
    float _1134 = _1132;
    if (!_1020)
    {
        float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1138 = _519 + _1136;
        float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1142 = _489 + _1140;
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1146 = -_489;
        float _1148 = _1146 + _1112;
        float _1150 = _1138 * _1138;
        float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1154 = _491 + _1152;
        float _1156 = -_491;
        float _1158 = _1156 + _1116;
        float _1160 = fma(_1142, _1142, _1150);
        float _1162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1164 = fma(_1154, _1154, _1160);
        float _1166 = sqrt(_1164);
        float _1168 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1170 = precise::min(_1166, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1172 = _1170 * _1162;
        float _1174 = -_519;
        float _1176 = _1174 + _1114;
        float _1178 = _1168 * _1172;
        float _1180 = fma(_1176, _1178, _519);
        float _1182 = fma(_1148, _1178, _489);
        float _1184 = fma(_1158, _1178, _491);
        _1130 = _1180;
        _1126 = _1182;
        _1134 = _1184;
        _1120 = _1172;
    }
    float _1186 = _1130;
    float _1188 = _1126;
    float _1190 = _1134;
    float _1192 = _1120;
    float _1194 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1196 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1198 = _1058 * _1062;
    float _1200 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1202 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1194);
    float _1204 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1196);
    float _1206 = _1050 * _1062;
    float _1208 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1200);
    float _1210 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1202);
    bool _1212 = _1198 >= 0.0;
    float _1214 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1204);
    float _1216 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1218 = _1210 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1220 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1208);
    float _1222 = _1192;
    if (!_716)
    {
        float _1224 = rint(_996);
        float _1226 = precise::max(_1224, 0.0);
        uint _1228 = uint(_1226);
        uint _1230 = clamp(_1228, 0u, 65535u);
        _1222 = as_type<float>(_1230);
    }
    float _1232 = _1222;
    bool _1234 = _1198 <= 1.0;
    bool _1236 = _1234 && _1212;
    float _1238 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1216);
    float _1240 = _1220 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1242 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1244 = _1206 >= 0.0;
    bool _1246 = _1244 && _1236;
    float _1248 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1238);
    float _1250 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    if (!_716)
    {
        float _1252 = -_1056;
        float _1254 = _609 + _1252;
        _1122 = _1254;
    }
    float _1256 = _1122;
    float _1258 = _1214 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1260 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1262 = _1206 <= 1.0;
    bool _1264 = _1262 && _1246;
    float _1266 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1268 = -_1250;
    float _1270 = fma(_1268, _1242, 1.0);
    float _1272 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1260);
    float _1274 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1276 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1272);
    float _1278 = log2(_1270);
    float _1280 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1274);
    float _1282 = _1274;
    if (!_716)
    {
        float _1284 = -_1002;
        float _1286 = _545 + _1284;
        _1282 = _1286;
    }
    float _1288 = _1282;
    float _1290 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1276);
    float _1292 = _523 * _964;
    float _1294 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1296 = _1290;
    if (_1264)
    {
        float _1298 = float(_649);
        _772 = _1298;
    }
    float _1300 = _772;
    float _1302 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1280);
    float _1304 = 1.0 / _1290;
    float _1306 = fma(_489, _956, _1292);
    float _1308 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1294);
    float _1310 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1302);
    float _1312 = fma(_491, _1030, _1306);
    float _1314 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1308);
    float _1316 = _1306;
    float _1318 = _1310;
    if (_1264)
    {
        float _1320 = rint(_1300);
        float _1322 = precise::max(_1320, 0.0);
        uint _1324 = uint(_1322);
        uint _1326 = clamp(_1324, 0u, 65535u);
        _1316 = as_type<float>(_1326);
    }
    float _1328 = _1316;
    float _1330 = _1312 + _1038;
    float _1332 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1314);
    float _1334 = _1278 * 0.693147182464599609375;
    float _1336 = _1330 * _1062;
    float _1338 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1340 = _1332 * _1304;
    float _1342 = _1310 * _1304;
    float _1344 = _1300;
    if (!_716)
    {
        float3 _5520 = float3(_1288, _1256, float(as_type<int>(_1232)));
        float3 _5524 = select(_5520, float3(0.0), isnan(_5520));
        float _1346 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5524.xy, uint(rint(_5524.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5524.xy, uint(rint(_5524.z)), level(0.0)).x;
        _1344 = _1346;
    }
    float _1348 = _1344;
    float _1350 = fma(_1340, 0.5, 0.5);
    float _1352 = fma(_1342, -0.5, 0.5);
    float _1354 = _1206;
    if (_1264)
    {
        float3 _5543 = float3(_1198, _1206, float(as_type<int>(_1328)));
        float3 _5545 = select(_5543, float3(0.0), isnan(_5543));
        float _1356 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5545.xy, uint(rint(_5545.z)), _1336, level(0.0));
        _1354 = _1356;
    }
    float _1358 = _1354;
    float3 _5555 = float3(_1350, _1352, _1338);
    float _1360 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5555, float3(0.0), isnan(_5555)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5555, float3(0.0), isnan(_5555)), level(0.0)).x;
    float3 _5564 = float3(_1350, _1352, _1338);
    float4 _1363 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5564, float3(0.0), isnan(_5564)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5564, float3(0.0), isnan(_5564)), level(0.0)).xyzw;
    float _1365 = _1363.x;
    float _1367 = _1363.y;
    float _1369 = _1363.z;
    float _1371 = _1363.w;
    float _1373 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1375 = int(_1373);
    int _1377 = abs(_770);
    int _1379 = abs(_790);
    float _1381 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1383 = int(_1381);
    float _1385 = float(_1375);
    float _1387 = 1.0 / _1385;
    float _1389 = float(uint(_1383));
    float _1391 = 1.0 / _1389;
    float _1393 = _133 * _1387;
    float _1395 = trunc(_1393);
    int _1397 = int(_1395);
    int _1399 = as_type<int>(_1391) + (-2);
    int _1401 = ~_1383;
    int _1403 = _1401 + 1;
    int _1405 = ~_1383;
    int _1407 = _1405 + 1;
    int _1409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1411 = _1409 != 0;
    float _1413 = float(_1383);
    float _1415 = float(uint(_1397));
    float _1417 = as_type<float>(_1399) * _1415;
    float _1419 = trunc(_1417);
    float _1421 = precise::max(_1419, 0.0);
    uint _1423 = uint(_1421);
    int _1425 = _1403 * int(_1423);
    int _1427 = _1425 + _1397;
    float _1429 = float(uint(_1427));
    float _1431 = as_type<float>(_1427);
    if (_1411)
    {
        _1431 = 1.0;
    }
    float _1433 = _1431;
    float _1435 = _1433;
    if (!_1411)
    {
        _1435 = 7.345489978790283203125;
    }
    float _1437 = _1435;
    float _1439 = as_type<float>(_1399) * _1429;
    float _1441 = float(_1397);
    float _1443 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1445 = int(_1443);
    float _1447 = _1437 * _163;
    float _1449 = trunc(_1439);
    float _1451 = precise::max(_1449, 0.0);
    uint _1453 = uint(_1451);
    float _1455 = float(_1445);
    float _1457 = 1.0 / _1455;
    int _1459 = int(_1423) + int(_1453);
    bool _1461 = _1441 >= _1413;
    bool _1463 = isnan(_1441);
    bool _1465 = _1461 || _1463;
    bool _1467 = isnan(_1413);
    bool _1469 = _1465 || _1467;
    float _1471 = float(_1469);
    float _1473 = _181 * _1413;
    int _1475 = _1407 * _1459;
    int _1477 = _1475 + _1397;
    float _1479 = floor(_1447);
    bool _1481 = uint(_1477) >= uint(_1383);
    float _1483 = trunc(_1471);
    int _1485 = int(_1483);
    bool _1487 = !_1481;
    int _1489 = _1487 ? 0 : (-1);
    float _1491 = _133 * _1457;
    bool _1493 = _1383 == 0;
    int _1495 = ~_1459;
    int _1497 = _1495 + _1489;
    int _1499 = _1497 + 1;
    float _1501 = -_1479;
    float _1503 = _1447 + _1501;
    float _1505 = trunc(_1491);
    int _1507 = int(_1505);
    int _1509 = _1383 * _1499;
    int _1511 = _1509 + _1397;
    float _1513 = _1503 * _1413;
    int _1515 = _1383 + (-1);
    bool _1517 = !_1493;
    int _1519 = _1517 ? _1511 : (-1);
    int _1521 = ~_1485;
    int _1523 = _1521 + 1;
    int _1525 = _1523 + 1;
    float _1527 = trunc(_1513);
    int _1529 = int(_1527);
    int _1531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1533 = _1531 != 0;
    int _1535 = _1519 * _1525;
    bool _1537 = !_1533;
    int _1539 = _1537 ? 0 : 1;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1543 = _1541 != 0;
    float _1545 = trunc(_1473);
    int _1547 = int(_1545);
    int _1549 = _1485 * _1515;
    int _1551 = _1549 + _1535;
    int _1553 = abs(_1539);
    int _1555 = abs(_786);
    float _1557 = float(uint(_1507));
    int _1559 = _1529 * _1553;
    int _1561 = _1559 + _1397;
    int _1563 = _1551 * _1377;
    bool _1565 = !_1543;
    int _1567 = _1565 ? 0 : 1;
    float _1569 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1571 = int(_1569);
    bool _1573 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1575 = isnan(0.5);
    bool _1577 = _1573 || _1575;
    bool _1579 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1581 = _1577 || _1579;
    int _1583 = abs(_1567);
    int _1585 = _1547 * _1555;
    int _1587 = _1585 + _1563;
    int _1589 = _1561 * _1379;
    int _1591 = _1589 + _1587;
    int _1593 = _1529 * _1583;
    int _1595 = _1593 + _1591;
    int _1597 = ~_1383;
    int _1599 = _1597 + 1;
    float _1601 = float(uint(_1571));
    float _1603 = float(uint(_1595));
    int _1605 = ~_1571;
    int _1607 = _1605 + 1;
    float _1609 = 1.0 / _1601;
    float _1611 = as_type<float>(_1399) * _1603;
    int _1613 = ~_1383;
    int _1615 = _1613 + 1;
    float _1617 = trunc(_1611);
    float _1619 = precise::max(_1617, 0.0);
    uint _1621 = uint(_1619);
    int _1623 = as_type<int>(_1609) + (-2);
    float _1625 = as_type<float>(_1623) * _1557;
    int _1627 = _1599 * int(_1621);
    int _1629 = _1627 + _1595;
    float _1631 = trunc(_1625);
    float _1633 = precise::max(_1631, 0.0);
    uint _1635 = uint(_1633);
    float _1637 = float(uint(_1629));
    float _1639 = as_type<float>(_1629);
    float _1641 = as_type<float>(_1615);
    if (_1411)
    {
        _1639 = _163;
    }
    float _1643 = _1639;
    float _1645 = as_type<float>(_1399) * _1637;
    float _1647 = _1643;
    if (!_1411)
    {
        float _1649 = in.m_65.z;
        _1647 = _1649;
    }
    float _1651 = _1647;
    float _1653 = trunc(_1645);
    float _1655 = precise::max(_1653, 0.0);
    uint _1657 = uint(_1655);
    int _1659 = _1607 * int(_1635);
    int _1661 = _1659 + _1507;
    float _1663 = float(uint(_1661));
    float _1665 = as_type<float>(_1623) * _1663;
    int _1667 = int(_1621) + int(_1657);
    float _1669 = _1663;
    float _1671 = as_type<float>(_1635);
    if (_1411)
    {
        _1641 = 1.0;
    }
    float _1673 = _1641;
    float _1675 = trunc(_1665);
    float _1677 = precise::max(_1675, 0.0);
    uint _1679 = uint(_1677);
    float _1681 = _1673;
    if (!_1411)
    {
        _1681 = 5.839270114898681640625;
    }
    float _1683 = _1681;
    int _1685 = _1615 * _1667;
    int _1687 = _1685 + _1595;
    if (_716)
    {
        _1669 = 1.0;
    }
    float _1689 = _1669;
    float _1691 = _1683 * _1651;
    bool _1693 = uint(_1687) >= uint(_1383);
    bool _1695 = !_1693;
    int _1697 = _1695 ? 0 : (-1);
    int _1699 = ~_1667;
    int _1701 = _1699 + _1697;
    int _1703 = _1701 + 1;
    int _1705 = int(_1635) + int(_1679);
    float _1707 = _1689;
    if (_1581)
    {
        _1671 = 1.0;
    }
    float _1709 = _1671;
    int _1711 = _1383 * _1703;
    int _1713 = _1711 + _1595;
    float _1715 = _1709;
    if (!_1581)
    {
        float _1717 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1719 = _1717 * 0.15915493667125701904296875;
        float _1721 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1723 = _1719 * 6.283185482025146484375;
        float _1725 = cos(_1723);
        float _1727 = _1721 * 0.15915493667125701904296875;
        float _1729 = _1719 * 6.283185482025146484375;
        float _1731 = sin(_1729);
        float _1733 = 1.0 / _1725;
        float _1735 = _1727 * 6.283185482025146484375;
        float _1737 = cos(_1735);
        float _1739 = _1731 * _1733;
        float _1741 = _1727 * 6.283185482025146484375;
        float _1743 = sin(_1741);
        float _1745 = _1737 * _1739;
        float _1747 = 1.0 / _1745;
        float _1749 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1751 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1749;
        float _1753 = 1.0 / _1751;
        float _1755 = _1743 * _1747;
        float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1759 = fma(_593, _1755, _1757);
        float _1761 = _1759 * _1753;
        float _1763 = precise::clamp(_1761, 0.0, 1.0);
        _1715 = _1763;
    }
    float _1765 = _1715;
    if (!_716)
    {
        int _1767 = _780 << 4;
        int _1769 = _1767 + 2048;
        uint _1771 = uint(int(uint(_1769) >> uint(2)));
        uint _1773 = uint(int(uint(int(_1771)) >> uint(2)));
        int _1775 = int(_1771) & 3;
        float _1777 = (*spvDescriptorSet0.vp_c15)._m0[int(_1773)][_1775];
        int _1779 = int(_1771) + 1;
        uint _1781 = uint(int(uint(_1779) >> uint(2)));
        int _1783 = _1779 & 3;
        float _1785 = (*spvDescriptorSet0.vp_c15)._m0[int(_1781)][_1783];
        int _1787 = _1769 + 8;
        uint _1789 = uint(int(uint(_1787) >> uint(2)));
        uint _1791 = uint(int(uint(int(_1789)) >> uint(2)));
        int _1793 = int(_1789) & 3;
        float _1795 = (*spvDescriptorSet0.vp_c15)._m0[int(_1791)][_1793];
        int _1797 = int(_1789) + 1;
        uint _1799 = uint(int(uint(_1797) >> uint(2)));
        int _1801 = _1797 & 3;
        float _1803 = (*spvDescriptorSet0.vp_c15)._m0[int(_1799)][_1801];
        float _1805 = _523 * _1785;
        float _1807 = fma(_489, _1777, _1805);
        float _1809 = fma(_491, _1795, _1807);
        float _1811 = _1809 + _1803;
        float _1813 = precise::clamp(_1811, 0.0, 1.0);
        float _1815 = -_1813;
        float _1817 = _1815 + _1348;
        float _1819 = fma(_1817, 500.0, 1.5);
        float _1821 = exp2(_1819);
        float _1823 = 0.0 + _1821;
        float _1825 = precise::clamp(_1823, 0.0, 1.0);
        _639 = _1805;
        _828 = as_type<float>(_1769);
        _1707 = _1825;
    }
    float _1827 = _639;
    float _1829 = _828;
    float _1831 = _1707;
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1835 = _1186 + _1833;
    float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1839 = _1188 + _1837;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1843 = _1190 + _1841;
    float _1845 = _1835 * _1835;
    float _1847 = fma(_1839, _1839, _1845);
    float _1849 = fma(_1843, _1843, _1847);
    float _1851 = rsqrt(_1849);
    float _1853 = sqrt(_1849);
    float _1855 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1857 = _1839 * _1855;
    float _1859 = _1843 * _1855;
    float _1861 = _1857 * _1857;
    float _1863 = _1859 * _1859;
    float _1865 = _1861 + _1863;
    float _1867 = sqrt(_1865);
    bool _1869 = _1867 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1871 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1873 = _1867 + _1871;
    float _1875 = _1827;
    float _1877 = _1865;
    float _1879 = _1873;
    float _1881 = _1857;
    float _1883 = _1859;
    float _1885 = _1861;
    float _1887 = _1863;
    if (_1869)
    {
        float _1889 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1875 = _1889;
    }
    float _1891 = _1875;
    if (_1869)
    {
        float _1893 = rsqrt(_1865);
        _1877 = _1893;
    }
    float _1895 = _1877;
    if (_1869)
    {
        float _1897 = _1873 * _1891;
        _1879 = _1897;
    }
    float _1899 = _1879;
    if (_1869)
    {
        float _1901 = _1899 * 0.15915493667125701904296875;
        _774 = _1901;
    }
    float _1903 = _774;
    float _1905 = _1348;
    if (_1869)
    {
        float _1907 = _1903 * 6.283185482025146484375;
        float _1909 = sin(_1907);
        _1905 = _1909;
    }
    float _1911 = _1905;
    float _1913 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1915 = precise::max(0.0, _1913);
    float _1917 = _1829;
    float _1919 = _1915;
    float _1921 = _1913;
    if (_1869)
    {
        float _1923 = _1903 * 6.283185482025146484375;
        float _1925 = cos(_1923);
        _1917 = _1925;
    }
    float _1927 = _1917;
    float _1929 = -_1855;
    float _1931 = -_1915;
    float _1933 = fma(_1835, _1929, _1931);
    float _1935 = _1933;
    if (_1869)
    {
        float _1937 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1919 = _1937;
    }
    float _1939 = _1919;
    float _1941 = floor(_1691);
    float _1943 = _1939;
    float _1945 = _1911;
    if (_1869)
    {
        float _1947 = fma(_1911, _1939, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1943 = _1947;
    }
    float _1949 = _1943;
    float _1951 = _1949;
    if (_1869)
    {
        float _1953 = _1927 + (-1.0);
        _1921 = _1953;
    }
    float _1955 = _1921;
    if (_1869)
    {
        float _1957 = _1895 * _1949;
        _1945 = _1957;
    }
    float _1959 = _1945;
    if (_1869)
    {
        float _1961 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1951 = _1961;
    }
    float _1963 = _1951;
    if (_1869)
    {
        float _1965 = _1857 * _1959;
        _1881 = _1965;
    }
    float _1967 = _1881;
    if (_1869)
    {
        float _1969 = _1859 * _1959;
        _1883 = _1969;
    }
    float _1971 = _1883;
    int _1973 = ~_1571;
    int _1975 = _1973 + 1;
    if (_1869)
    {
        float _1977 = fma(_1933, _1927, _1963);
        _1935 = _1977;
    }
    float _1979 = _1935;
    if (_1869)
    {
        float _1981 = _1967 * _1967;
        _1885 = _1981;
    }
    float _1983 = _1885;
    if (_1869)
    {
        float _1985 = _1971 * _1971;
        _1887 = _1985;
    }
    float _1987 = _1887;
    float _1989 = fma(_1979, _1979, _1983);
    float _1991 = _1989 + _1987;
    float _1993 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1995 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1993);
    float _1997 = precise::clamp(_1995, 0.0, 1.0);
    float _1999 = -_1997;
    float _2001 = _1999 + 1.0;
    float _2003 = rsqrt(_1991);
    float _2005 = abs(_2001);
    float _2007 = log2(_2005);
    float _2009 = _2003 * _1967;
    float _2011 = _2003 * _1979;
    float _2013 = _2003 * _1971;
    float _2015 = _2009 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2017 = -_2015;
    float _2019 = fma(_2011, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2017);
    float _2021 = -_2013;
    float _2023 = fma(_2021, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2019);
    float _2025 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2027 = fma(_2023, -0.5, 0.5);
    float _2029 = fma(_2023, 0.5, 0.5);
    float _2031 = exp2(_2025);
    float _2033 = fma(_2029, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2035 = fma(_2029, _2033, -0.212114393711090087890625);
    float _2037 = sqrt(_2027);
    float _2039 = fma(_2029, _2035, 1.570728778839111328125);
    float _2041 = _2011 + 1.0;
    float _2043 = -_2011;
    float _2045 = fma(_2031, _2041, _2043);
    float _2047 = fma(_2045, 0.5, 0.5);
    float _2049 = _2037 * 0.636619746685028076171875;
    float _2051 = -_2039;
    float _2053 = fma(_2049, _2051, 1.0);
    bool _2055 = !_1493;
    int _2057 = _2055 ? _1713 : (-1);
    int _2059 = _1975 * _1705;
    int _2061 = _2059 + _1507;
    float2 _6552 = float2(_2053, _2047);
    float3 _2065 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6552, float2(0.0), isnan(_6552)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6552, float2(0.0), isnan(_6552)), level(0.0)).xyz;
    float _2067 = _2065.x;
    float _2069 = _2065.y;
    float _2071 = _2065.z;
    int _2073 = _2057 & 3;
    bool _2075 = _2073 != 0;
    float _2077 = in.m_65.y;
    int _2079 = _2057 & 3;
    bool _2081 = _2079 != 0;
    float _2083 = -_1941;
    float _2085 = _1691 + _2083;
    bool _2087 = uint(_2061) >= uint(_1571);
    out.m_84.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_84.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_84.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    bool _2089 = uint(_2073) > 1u;
    float _2091 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2093 = !_2087;
    int _2095 = _2093 ? 0 : (-1);
    out.m_86.x = _513;
    int _2097 = _2081 ? 0 : 1;
    float _2099 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2101 = ~_1705;
    int _2103 = _2101 + _2095;
    int _2105 = _2103 + 1;
    float _2107 = -_509;
    float _2109 = _2107 + 1.0;
    float _2111 = float(_1571);
    float _2113 = float(_1507);
    float _2115 = exp2(_2099);
    int _2117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2119 = _2117 != 0;
    float _2121 = _2085 * _2111;
    bool _2123 = _2113 >= _2111;
    bool _2125 = isnan(_2113);
    bool _2127 = _2123 || _2125;
    bool _2129 = isnan(_2111);
    bool _2131 = _2127 || _2129;
    float _2133 = float(_2131);
    int _2135 = _1571 * _2105;
    int _2137 = _2135 + _1507;
    bool _2139 = _163 > 0.5;
    float _2141 = _181 * _2111;
    int _2143 = ~_2097;
    int _2145 = _2143 + 1;
    int _2147 = _2145 + 1;
    float _2149 = trunc(_2121);
    int _2151 = int(_2149);
    int _2153 = _2147;
    if (!_2089)
    {
        int _2155 = ~_2097;
        int _2157 = _2155 + 1;
        _2153 = _2157;
    }
    int _2159 = _2153;
    int _2161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2163 = _2161 != 0;
    bool _2165 = !_2119;
    int _2167 = _2165 ? 0 : 1;
    int _2169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2171 = _2169 != 0;
    float _2173 = trunc(_2133);
    int _2175 = int(_2173);
    float _2177 = -_221;
    int _2179 = _2139 ? as_type<int>(_2177) : as_type<int>(_221);
    bool _2181 = _1571 == 0;
    bool _2183 = !_2163;
    int _2185 = _2183 ? 0 : 1;
    float _2187 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2189 = !_2171;
    float _2191 = _2189 ? _221 : as_type<float>(_2179);
    float _2193 = trunc(_2141);
    int _2195 = int(_2193);
    bool _2197 = uint(_2073) >= 2u;
    float _2199 = -_2187;
    float _2201 = fma(_2091, 2.0, _2199);
    bool _2203 = _2077 > 0.5;
    bool _2205 = !_2181;
    int _2207 = _2205 ? _2137 : (-1);
    float _2209 = -_133;
    float _2211 = fma(_2209, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2201);
    int _2213 = ~_2175;
    int _2215 = _2213 + 1;
    int _2217 = _2215 + 1;
    int _2219 = _2197 ? 0 : 1;
    float _2221 = -_225;
    int _2223 = _2203 ? as_type<int>(_2221) : as_type<int>(_225);
    int _2225 = _2207 * _2217;
    int _2227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2229 = _2227 != 0;
    int _2231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2233 = _2231 != 0;
    int _2235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2237 = _2235 != 0;
    int _2239 = _1571 + (-1);
    int _2241 = abs(_2167);
    int _2243 = _2175 * _2239;
    int _2245 = _2243 + _2225;
    int _2247 = abs(_844);
    float _2249 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2251 = abs(_866);
    int _2253 = _2151 * _2241;
    int _2255 = _2253 + _1507;
    float _2257 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2259 = _2245 * _2247;
    float _2261 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2249);
    int _2263 = abs(_870);
    int _2265 = _2195 * _2251;
    int _2267 = _2265 + _2259;
    int _2269 = abs(_2185);
    float _2271 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2273 = _2255 * _2263;
    int _2275 = _2273 + _2267;
    float _2277 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2279 = _2151 * _2269;
    int _2281 = _2279 + _2275;
    float _2283 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2285 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2287 = _2285 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2289 = fma(_2077, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2277);
    float _2291 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2293 = float(uint(_2281));
    float _2295 = fma(_2271, -2.0, _2283);
    float _2297 = 1.0 / _2287;
    float _2299 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2301 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2303 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2305 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2299);
    float _2307 = as_type<float>(_1623) * _2293;
    float _2309 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2301);
    float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2313 = _2311 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2315 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2303);
    float _2317 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2319 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2317;
    float _2321 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2323 = _2321 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2325 = trunc(_2307);
    float _2327 = precise::max(_2325, 0.0);
    uint _2329 = uint(_2327);
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2333 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2335 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2337 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2339 = _2337 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2341 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2343 = _2331 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2345 = _2333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2347 = 1.0 / _2313;
    float _2349 = _2335 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2351 = _2323 * _2297;
    float _2353 = float(uint(_1561));
    float _2355 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2261);
    out.m_88.x = _2343;
    out.m_88.y = _2345;
    out.m_88.z = _2349;
    out.m_88.w = _2341;
    bool _2357 = !_2237;
    float _2359 = _2357 ? _225 : as_type<float>(_2223);
    float _2361 = 1.0 / _2339;
    bool _2363 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2365 = isnan(_465);
    bool _2367 = _2363 || _2365;
    bool _2369 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2371 = _2367 || _2369;
    float _2373 = float(_2371);
    float _2375 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2377 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2375;
    float _2379 = float(uint(_2255));
    float _2381 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2289);
    bool _2383 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2385 = isnan(_465);
    bool _2387 = _2383 || _2385;
    bool _2389 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2391 = _2387 || _2389;
    float _2393 = float(_2391);
    int _2395 = ~_1383;
    int _2397 = _2395 + 1;
    float _2399 = _2319 * _2347;
    float _2401 = as_type<float>(_1623) * _2379;
    float _2403 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2405 = _465 + _2403;
    float _2407 = -_2393;
    float _2409 = _2407 + 1.0;
    int _2411 = ~_1571;
    int _2413 = _2411 + 1;
    float _2415 = as_type<float>(_1399) * _2353;
    bool _2417 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2419 = isnan(_465);
    bool _2421 = _2417 || _2419;
    bool _2423 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2425 = _2421 || _2423;
    float _2427 = float(_2425);
    float _2429 = -_2373;
    float _2431 = _2429 + 1.0;
    float _2433 = _2377 * _2361;
    int _2435 = _2413 * int(_2329);
    int _2437 = _2435 + _2281;
    float _2439 = fma(_2399, _2405, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2441 = trunc(_2415);
    float _2443 = precise::max(_2441, 0.0);
    uint _2445 = uint(_2443);
    bool _2447 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2449 = isnan(_465);
    bool _2451 = _2447 || _2449;
    bool _2453 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2455 = _2451 || _2453;
    float _2457 = float(_2455);
    float _2459 = _2427 * _2431;
    float _2461 = float(uint(_2437));
    float _2463 = -_2427;
    float _2465 = _2463 + 1.0;
    float _2467 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2469 = _465 + _2467;
    float _2471 = _2457 * _2409;
    float _2473 = -_2457;
    float _2475 = _2473 + 1.0;
    float _2477 = trunc(_2401);
    float _2479 = precise::max(_2477, 0.0);
    uint _2481 = uint(_2479);
    float _2483 = as_type<float>(_1623) * _2461;
    float _2485 = _2393 * _2465;
    float _2487 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2489 = _465 + _2487;
    float _2491 = _2439 * _2471;
    float _2493 = fma(_2351, _2469, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2495 = fma(_2433, _2489, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2497 = trunc(_2483);
    float _2499 = precise::max(_2497, 0.0);
    uint _2501 = uint(_2499);
    int _2503 = _2397 * int(_2445);
    int _2505 = _2503 + _1561;
    int _2507 = ~_1571;
    int _2509 = _2507 + 1;
    float _2511 = fma(_2475, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2491);
    float _2513 = float(uint(_2505));
    float _2515 = fma(_2493, _2485, _2511);
    int _2517 = _2509 * int(_2481);
    int _2519 = _2517 + _2255;
    float _2521 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2523 = as_type<float>(_1399) * _2513;
    int _2525 = ~_1571;
    int _2527 = _2525 + 1;
    float _2529 = _2191 + 0.5;
    float _2531 = float(uint(_2519));
    float _2533 = trunc(_2523);
    float _2535 = precise::max(_2533, 0.0);
    uint _2537 = uint(_2535);
    int _2539 = int(_2329) + int(_2501);
    float _2541 = fma(_2495, _2459, _2515);
    int _2543 = ~_1383;
    int _2545 = _2543 + 1;
    float _2547 = as_type<float>(_1623) * _2531;
    int _2549 = _2527 * _2539;
    int _2551 = _2549 + _2281;
    float _2553 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2295);
    float _2555 = fma(_2529, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2211);
    float _2557 = _2359 + (-0.5);
    float _2559 = trunc(_2547);
    float _2561 = precise::max(_2559, 0.0);
    uint _2563 = uint(_2561);
    bool _2565 = uint(_2551) >= uint(_1571);
    float _2567 = fma(_2373, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2541);
    float _2569 = -_2557;
    float _2571 = -_2553;
    float _2573 = fma(_2569, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2571);
    bool _2575 = !_2565;
    int _2577 = _2575 ? 0 : (-1);
    float _2579 = fma(_2291, _2291, 1.0);
    bool _2581 = _2073 != 3;
    float _2583 = _2567 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2585 = ~_2539;
    int _2587 = _2585 + _2577;
    int _2589 = _2587 + 1;
    float _2591 = -_2355;
    float _2593 = _2591 + 1.0;
    int _2595 = int(_2445) + int(_2537);
    float _2597 = rsqrt(_2579);
    int _2599 = ~_1571;
    int _2601 = _2599 + 1;
    int _2603 = _1571 * _2589;
    int _2605 = _2603 + _2281;
    float _2607 = -_2593;
    float _2609 = fma(_2191, _2607, _2555);
    int _2611 = int(_2481) + int(_2563);
    int _2613 = _2545 * _2595;
    int _2615 = _2613 + _1561;
    int _2617 = _2057 >> 31;
    bool _2619 = !_2181;
    int _2621 = _2619 ? _2605 : (-1);
    int _2623 = _2617 & 3;
    int _2625 = _2621 >> 31;
    int _2627 = ~_2219;
    int _2629 = _2627 + 1;
    int _2631 = _2629 + 1;
    int _2633 = _2601 * _2611;
    int _2635 = _2633 + _2255;
    int _2637 = _2631;
    if (_2581)
    {
        int _2639 = ~_2219;
        int _2641 = _2639 + 1;
        _2637 = _2641;
    }
    int _2643 = _2637;
    float _2645 = _2291 * _2597;
    int _2647 = _2057 + _2623;
    bool _2649 = uint(_2615) >= uint(_1383);
    float _2651 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2653 = _2645 * _2651;
    int _2655 = _2625 & 3;
    float _2657 = -_2381;
    float _2659 = _2657 + 1.0;
    int _2661 = _2647 >> 2;
    int _2663 = _2621 + _2655;
    float _2665 = fma(_2359, _2659, _2573);
    int _2667 = _2661 << 4;
    int _2669 = _2667 + 368;
    float _2671 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2673 = _2645 * _2671;
    bool _2675 = !_2649;
    int _2677 = _2675 ? 0 : (-1);
    int _2679 = _2663 >> 2;
    float _2681 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2683 = _2645 * _2681;
    bool _2685 = uint(_2635) >= uint(_1571);
    float _2687 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2673);
    uint _2689 = uint(int(uint(_2669) >> uint(2)));
    uint _2691 = uint(int(uint(int(_2689)) >> uint(2)));
    int _2693 = int(_2689) & 3;
    float _2695 = (*spvDescriptorSet0.vp_c9)._m0[int(_2691)][_2693];
    int _2697 = int(_2689) + 1;
    uint _2699 = uint(int(uint(_2697) >> uint(2)));
    int _2701 = _2697 & 3;
    float _2703 = (*spvDescriptorSet0.vp_c9)._m0[int(_2699)][_2701];
    int _2705 = _2679 << 4;
    int _2707 = _2705 + 656;
    out.m_90.x = _2609;
    out.m_90.y = _2665;
    bool _2709 = !_2685;
    int _2711 = _2709 ? 0 : (-1);
    bool _2713 = !_2075;
    int _2715 = _2713 ? 0 : 1;
    uint _2717 = uint(int(uint(_2707) >> uint(2)));
    uint _2719 = uint(int(uint(int(_2717)) >> uint(2)));
    int _2721 = int(_2717) & 3;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[int(_2719)][_2721];
    int _2725 = int(_2717) + 1;
    uint _2727 = uint(int(uint(_2725) >> uint(2)));
    int _2729 = _2725 & 3;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[int(_2727)][_2729];
    float _2733 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2735 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2683);
    int _2737 = _2621 & 3;
    bool _2739 = _2737 != 0;
    float _2741 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2653);
    int _2743 = _2621 & 3;
    bool _2745 = _2743 != 0;
    float _2747 = _2733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2749 = ~_2595;
    int _2751 = _2749 + _2677;
    int _2753 = _2751 + 1;
    float _2755 = _2521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2757 = _2739 ? 0 : 1;
    int _2759 = _2669 + 8;
    uint _2761 = uint(int(uint(_2759) >> uint(2)));
    uint _2763 = uint(int(uint(int(_2761)) >> uint(2)));
    int _2765 = int(_2761) & 3;
    float _2767 = (*spvDescriptorSet0.vp_c9)._m0[int(_2763)][_2765];
    int _2769 = int(_2761) + 1;
    uint _2771 = uint(int(uint(_2769) >> uint(2)));
    int _2773 = _2769 & 3;
    float _2775 = (*spvDescriptorSet0.vp_c9)._m0[int(_2771)][_2773];
    bool _2777 = uint(_2743) > 1u;
    int _2779 = _1383 * _2753;
    int _2781 = _2779 + _1561;
    int _2783 = ~_2611;
    int _2785 = _2783 + _2711;
    int _2787 = _2785 + 1;
    float _2789 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2791 = abs(_2159);
    out.m_92.x = _2687;
    out.m_92.y = _2735;
    out.m_92.z = _2741;
    int _2793 = _2707 + 8;
    uint _2795 = uint(int(uint(_2793) >> uint(2)));
    uint _2797 = uint(int(uint(int(_2795)) >> uint(2)));
    int _2799 = int(_2795) & 3;
    float _2801 = (*spvDescriptorSet0.vp_c9)._m0[int(_2797)][_2799];
    int _2803 = int(_2795) + 1;
    uint _2805 = uint(int(uint(_2803) >> uint(2)));
    int _2807 = _2803 & 3;
    float _2809 = (*spvDescriptorSet0.vp_c9)._m0[int(_2805)][_2807];
    int _2811 = ~_2757;
    int _2813 = _2811 + 1;
    int _2815 = _2813 + 1;
    int _2817 = _1571 * _2787;
    int _2819 = _2817 + _2255;
    float _2821 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2789);
    float _2823 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2825 = !_1493;
    int _2827 = _2825 ? _2781 : (-1);
    int _2829 = _2815;
    if (!_2777)
    {
        int _2831 = ~_2757;
        int _2833 = _2831 + 1;
        _2829 = _2833;
    }
    int _2835 = _2829;
    float _2837 = _2823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2839 = _2073 != 3;
    float _2841 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2821);
    int _2843 = abs(_2835);
    out.m_94.x = _2837;
    out.m_94.y = _2747;
    out.m_94.z = _2755;
    out.m_94.w = _2583;
    int _2845 = ~_2791;
    int _2847 = _2845 + 1;
    int _2849 = _2847 + 1;
    bool _2851 = !_2745;
    int _2853 = _2851 ? 0 : 1;
    bool _2855 = uint(_2743) >= 2u;
    int _2857 = abs(_2715);
    int _2859 = _2849 * as_type<int>(_2703);
    int _2861 = ~_2843;
    int _2863 = _2861 + 1;
    int _2865 = _2863 + 1;
    int _2867 = ~_2857;
    int _2869 = _2867 + 1;
    int _2871 = _2869 + 1;
    bool _2873 = !_2181;
    int _2875 = _2873 ? _2819 : (-1);
    float _2877 = _1765 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2879 = _2855 ? 0 : 1;
    int _2881 = _2871 * as_type<int>(_2695);
    int _2883 = _2881 + _2859;
    bool _2885 = _2743 != 3;
    int _2887 = _2865 * as_type<int>(_2731);
    int _2889 = abs(_2853);
    int _2891 = abs(_2643);
    float _2893 = abs(_593);
    float _2895 = log2(_2893);
    bool _2897 = !_2229;
    int _2899 = _2897 ? 0 : 1;
    int _2901 = ~_2889;
    int _2903 = _2901 + 1;
    int _2905 = _2903 + 1;
    int _2907 = ~_2879;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    bool _2913 = !_2233;
    int _2915 = _2913 ? 0 : 1;
    int _2917 = _2905 * as_type<int>(_2723);
    int _2919 = _2917 + _2887;
    bool _2921 = _2743 != 3;
    int _2923 = _2911;
    if (_2885)
    {
        int _2925 = ~_2879;
        int _2927 = _2925 + 1;
        _2923 = _2927;
    }
    int _2929 = _2923;
    int _2931 = abs(_2899);
    float _2933 = _2895 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2935 = !_2839;
    int _2937 = _2935 ? 0 : (-1);
    int _2939 = abs(_2915);
    int _2941 = abs(_2929);
    float _2943 = exp2(_2933);
    bool _2945 = !_2921;
    int _2947 = _2945 ? 0 : (-1);
    int _2949 = ~_2891;
    int _2951 = _2949 + 1;
    int _2953 = _2951 + 1;
    int _2955 = abs(_2937);
    int _2957 = abs(_2947);
    int _2959 = _2953 * as_type<int>(_2767);
    int _2961 = _2959 + _2883;
    int _2963 = ~_2941;
    int _2965 = _2963 + 1;
    int _2967 = _2965 + 1;
    int _2969 = ~_2955;
    int _2971 = _2969 + 1;
    int _2973 = _2971 + 1;
    int _2975 = _2967 * as_type<int>(_2801);
    int _2977 = _2975 + _2919;
    int _2979 = ~_2957;
    int _2981 = _2979 + 1;
    int _2983 = _2981 + 1;
    int _2985 = _2973 * as_type<int>(_2775);
    int _2987 = _2985 + _2961;
    int _2989 = _2983 * as_type<int>(_2809);
    int _2991 = _2989 + _2977;
    int _2993 = ~_2939;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    int _2999 = ~_2931;
    int _3001 = _2999 + 1;
    int _3003 = _3001 + 1;
    float _3005 = fma(_2943, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3007 = precise::clamp(_3005, 0.0, 1.0);
    bool _3009 = _593 <= 8000.0;
    bool _3011 = isnan(_593);
    bool _3013 = _3009 || _3011;
    bool _3015 = isnan(8000.0);
    bool _3017 = _3013 || _3015;
    float _3019 = float(_3017);
    int _3021 = _2991 * _2997;
    bool _3023 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3025 = isnan(_1853);
    bool _3027 = _3023 || _3025;
    bool _3029 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3031 = _3027 || _3029;
    int _3033 = _2987 * _3003;
    float _3035 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2841);
    int _3037 = _2875 * _2939;
    int _3039 = _3037 + _3021;
    float _3041 = _1290 * 0.5;
    int _3043 = _2827 * _2931;
    int _3045 = _3043 + _3033;
    float _3047 = _1332 + _1290;
    out.gl_Position.x = _1332;
    out.gl_Position.y = _1310;
    out.gl_Position.z = _3035;
    out.gl_Position.w = _1290;
    float _3049 = fma(_1310, -0.5, _3041);
    float _3051 = _3035 + _1290;
    float _3053 = float(_3045);
    float _3055 = _3047 * 0.5;
    float _3057 = float(_3039);
    float _3059 = fma(_3007, -2.0, 3.0);
    float _3061 = _3007 * _3007;
    out.m_96.x = _3053;
    float _3063 = _3051 * 0.5;
    float _3065 = _3061 * _3059;
    out.m_96.z = _3057;
    float _3067 = -_2115;
    float _3069 = _3067 + 1.0;
    float _3071 = _1290;
    float _3073 = _3063;
    float _3075 = _3049;
    float _3077 = _3055;
    if (!_1264)
    {
        _1318 = 1.0;
    }
    float _3079 = _1318;
    float _3081 = -_3065;
    float _3083 = _3081 + 1.0;
    float _3085 = _3079;
    if (_1264)
    {
        bool _3087 = _1358 >= _1336;
        bool _3089 = isnan(_1358);
        bool _3091 = _3087 || _3089;
        bool _3093 = isnan(_1336);
        bool _3095 = _3091 || _3093;
        float _3097 = float(_3095);
        _3085 = _3097;
    }
    float _3099 = _3085;
    float _3101 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3103 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3105 = fma(_3083, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3065);
    out.m_98.x = _3055;
    out.m_98.y = _3049;
    out.m_98.z = _3063;
    out.m_98.w = _1290;
    float _3107 = _3099 * _1831;
    float _3109 = _3101 * _1360;
    float _3111 = _3019 * _3105;
    float _3113 = -_3101;
    float _3115 = _3113 + 1.0;
    if (!_3031)
    {
        _1296 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3117 = _1296;
    float _3119 = _1371 * _3109;
    float _3121 = _3111 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3123 = _2071 * _3109;
    float _3125 = _1371 * _3115;
    float _3127 = fma(_2067, _3119, _1365);
    float _3129 = _2109 * _3121;
    float _3131 = precise::clamp(_3129, 0.0, 1.0);
    float _3133 = fma(_2069, _3119, _1367);
    float _3135 = fma(_1371, _3123, _1369);
    float _3137 = _2305 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3139 = -_3131;
    float _3141 = fma(_3139, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3143 = _3121;
    float _3145 = _3117;
    float _3147 = _3117;
    if (!_3031)
    {
        _3143 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3149 = _3143;
    out.m_100.x = _3127;
    out.m_100.y = _3133;
    out.m_100.z = _3135;
    out.m_100.w = _3125;
    float _3151 = -_3107;
    float _3153 = fma(_3151, _3141, 1.0);
    float _3155 = precise::clamp(_3153, 0.0, 1.0);
    float _3157 = _3149;
    float _3159 = _3149;
    if (!_3031)
    {
        _3071 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3161 = _3071;
    float _3163 = _3161;
    float _3165 = _3161;
    if (!_3031)
    {
        _3073 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3167 = _3073;
    float _3169 = _3155 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3171 = _2309 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3173 = _3167;
    float _3175 = _3167;
    if (!_3031)
    {
        _3075 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3177 = _3075;
    float _3179 = _3177;
    float _3181 = _3177;
    if (!_3031)
    {
        _3077 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3183 = _3077;
    out.m_102.x = _3169;
    out.m_104.x = _3137;
    out.m_104.y = _3171;
    out.m_104.z = _3103;
    bool _3185 = !_3031;
    float _3187 = _3183;
    float _3189 = _3183;
    if (!_3185)
    {
        bool _3191 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3193 = isnan(_1853);
        bool _3195 = _3191 || _3193;
        bool _3197 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3199 = _3195 || _3197;
        if (!_3199)
        {
            float _3201 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3203 = _1853 + _3201;
            float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3207 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3205;
            float _3209 = 1.0 / _3207;
            float _3211 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3219 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3221 = _3219 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3223 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3225 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3227 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3229 = _3227 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3231 = _3203 * _3209;
            float _3233 = precise::clamp(_3231, 0.0, 1.0);
            float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3239 = fma(_3233, _3213, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3241 = fma(_3233, _3237, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3243 = fma(_3233, _3217, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3245 = fma(_3233, _3221, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3247 = fma(_3233, _3225, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3249 = fma(_3233, _3229, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3165 = _3241;
            _3189 = _3247;
            _3159 = _3239;
            _3181 = _3245;
            _3175 = _3243;
            _3147 = _3249;
            _3251 = true;
        }
        else
        {
            bool _3253 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3255 = isnan(_1853);
            bool _3257 = _3253 || _3255;
            bool _3259 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3261 = _3257 || _3259;
            if (!_3261)
            {
                _3157 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3263 = _3157;
            _3159 = _3263;
            if (!_3261)
            {
                _3163 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3265 = _3163;
            _3165 = _3265;
            if (!_3261)
            {
                _3173 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3267 = _3173;
            _3175 = _3267;
            if (!_3261)
            {
                _3179 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3269 = _3179;
            _3181 = _3269;
            if (!_3261)
            {
                _3187 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3271 = _3187;
            _3189 = _3271;
            if (!_3261)
            {
                _3145 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3273 = _3145;
            bool _3275 = !_3261;
            _3147 = _3273;
            if (!_3275)
            {
                bool _3277 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3279 = isnan(_1853);
                bool _3281 = _3277 || _3279;
                bool _3283 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3285 = _3281 || _3283;
                if (!_3285)
                {
                    float _3287 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3289 = _1853 + _3287;
                    float _3291 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3293 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3291;
                    float _3295 = 1.0 / _3293;
                    float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3299 = _3297 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3301 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3303 = _3301 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3305 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3307 = _3305 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3309 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3311 = _3309 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3313 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3315 = _3313 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3317 = _3289 * _3295;
                    float _3319 = precise::clamp(_3317, 0.0, 1.0);
                    float _3321 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3325 = fma(_3319, _3299, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3327 = fma(_3319, _3323, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3329 = fma(_3319, _3303, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3331 = fma(_3319, _3307, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3333 = fma(_3319, _3311, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3335 = fma(_3319, _3315, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3165 = _3327;
                    _3189 = _3333;
                    _3159 = _3325;
                    _3181 = _3331;
                    _3175 = _3329;
                    _3147 = _3335;
                    _3251 = true;
                }
                else
                {
                    _3165 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3189 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3159 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3181 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3175 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3147 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3251 = false;
    float _3337 = _3165;
    float _3339 = _3189;
    float _3341 = _3159;
    float _3343 = _3181;
    float _3345 = _3175;
    float _3347 = _3147;
    float _3349 = _2877 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3351 = fma(_3171, -0.5, 0.5);
    float _3353 = precise::clamp(_3351, 0.0, 1.0);
    float _3355 = -_3337;
    float _3357 = _3355 + _3339;
    float _3359 = -_3341;
    float _3361 = _3359 + _3343;
    out.m_63.x = _3349;
    float _3363 = fma(_3353, _3357, _3337);
    float _3365 = -_3345;
    float _3367 = _3365 + _3347;
    float _3369 = fma(_3353, _3361, _3341);
    float _3371 = _3363 * 0.586610972881317138671875;
    bool _3373 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3375 = fma(_3353, _3367, _3345);
    out.m_106.x = 0.0;
    float _3377 = fma(_3369, 0.298911988735198974609375, _3371);
    bool _3379 = _1765 > 0.0;
    bool _3381 = isnan(_1765);
    bool _3383 = _3379 || _3381;
    bool _3385 = isnan(0.0);
    bool _3387 = _3383 || _3385;
    float _3389 = fma(_3375, 0.114477999508380889892578125, _3377);
    float _3391 = -_3389;
    float _3393 = _3369 + _3391;
    float _3395 = -_3389;
    float _3397 = _3363 + _3395;
    float _3399 = -_3389;
    float _3401 = _3375 + _3399;
    float _3403 = fma(_3393, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3389);
    float _3405 = fma(_3397, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3389);
    float _3407 = fma(_3401, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3389);
    bool _3409 = !_3373;
    if (!_3409)
    {
        float _3411 = -_1186;
        float _3413 = _3411 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3415 = -_1188;
        float _3417 = _3415 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3419 = -_1190;
        float _3421 = _3419 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3423 = _3413 * _3413;
        float _3425 = fma(_3417, _3417, _3423);
        float _3427 = fma(_3421, _3421, _3425);
        float _3429 = sqrt(_3427);
        float _3431 = rsqrt(_3427);
        float _3433 = -_3429;
        float _3435 = _3433 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3437 = _3435 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3439 = precise::clamp(_3437, 0.0, 1.0);
        float _3441 = _3417 * _3431;
        float _3443 = _3413 * _3431;
        float _3445 = abs(_3439);
        float _3447 = log2(_3445);
        float _3449 = _3421 * _3431;
        float _3451 = _3441 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3453 = _3171 * _3443;
        float _3455 = -_3443;
        float _3457 = -_3451;
        float _3459 = fma(_3455, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3457);
        float _3461 = fma(_3137, _3441, _3453);
        float _3463 = -_3449;
        float _3465 = fma(_3463, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3459);
        float _3467 = fma(_3103, _3449, _3461);
        float _3469 = precise::clamp(_3467, 0.0, 1.0);
        float _3471 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3473 = _3465 + _3471;
        float _3475 = _3447 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3477 = _3473 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3479 = precise::clamp(_3477, 0.0, 1.0);
        float _3481 = exp2(_3475);
        float _3483 = _3481 * _3479;
        float _3485 = _3469 * _3483;
        float _3487 = _3485 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3489 = _3485 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3491 = _3485 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _3487;
        out.m_106.y = _3489;
        out.m_106.z = _3491;
    }
    out.m_108.x = _3403;
    out.m_108.y = _3405;
    out.m_108.z = _3407;
    if (_3387)
    {
        return out;
    }
    out.m_63.x = 0.0;
    float _3493 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3493;
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
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3251 = false;
    bool _463 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _122 = in.m_56.w;
    float _124 = in.m_58.w;
    float _126 = trunc(_122);
    int _129 = int(_126);
    float _131 = -_124;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _133;
    bool _137 = _129 >= 1;
    float _139 = 0.0;
    float _141 = as_type<float>(_129);
    if (!_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _139;
    if (!_137)
    {
        out.m_63.x = 0.0;
    }
    int _145 = 0;
    if (!_137)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    int _151 = _149;
    if (!_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3561 = as_type<float>(_149);
        out.gl_Position.z = _3561;
    }
    if (!_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _153 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_124);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    float _163 = in.m_65.x;
    float _165 = float(_129);
    bool _167 = _133 >= _165;
    bool _169 = !_161;
    bool _171 = _167 || _169;
    float _173 = 1.0 / _165;
    if (_171)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _141;
    if (_171)
    {
        out.m_63.x = 0.0;
    }
    if (_171)
    {
        float _177 = _175 * 5.0;
        _151 = as_type<int>(_177);
    }
    int _179 = _151;
    float _181 = _133 * _173;
    out.m_67.x = _163;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3625 = as_type<float>(_179);
        out.gl_Position.z = _3625;
    }
    out.m_61.x = _181;
    if (_171)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_72.x;
    float _187 = in.m_72.y;
    float _189 = in.m_72.z;
    float _191 = in.m_74.x;
    float _193 = in.m_74.y;
    float _195 = in.m_74.z;
    float _197 = in.m_76.x;
    float _199 = in.m_76.y;
    float _201 = in.m_76.z;
    float _203 = in.m_78.x;
    float _205 = in.m_78.y;
    float _207 = in.m_78.z;
    int _209 = as_type<int>(_183) & 1;
    bool _211 = _209 != 0;
    int _213 = as_type<int>(_183) & 2;
    bool _215 = _213 != 0;
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _219 = !_211;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_215;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _187 * _193;
    float _229 = _187 * _199;
    float _231 = fma(_185, _191, _227);
    float _233 = _187 * _205;
    float _235 = fma(_185, _197, _229);
    float _237 = fma(_189, _195, _231);
    float _239 = fma(_185, _203, _233);
    float _241 = fma(_189, _201, _235);
    float _243 = fma(_189, _207, _239);
    bool _245 = !_217;
    float _247 = _243;
    float _249 = _241;
    float _251 = _237;
    float _267;
    if (!_245)
    {
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        _267 = _181;
    }
    _269 = false;
    float _271 = _267;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = _271 + _277;
    bool _281 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _283 = isnan(_271);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _301;
    float _305 = 1.0 / _295;
    bool _307 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _309 = 1.0 / _299;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = 1.0 / _303;
    float _317 = _275 * _305;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _271 + _319;
    float _323 = fma(_313, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _325 = _321 * _309;
    bool _327 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _329 = isnan(_271);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _339;
    float _343 = fma(_341, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _345 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _347 = isnan(_271);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = _279 * _315;
    float _359 = -_291;
    float _361 = _359 + 1.0;
    bool _363 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _365 = isnan(_271);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = _337 * _361;
    float _381 = -_337;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = -_373;
    float _391 = _389 + 1.0;
    float _393 = fma(_377, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _395 = _373 * _383;
    float _397 = fma(_387, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _399 = in.m_80.x;
    float _401 = in.m_80.y;
    float _403 = _355 * _391;
    float _405 = -_355;
    float _407 = _405 + 1.0;
    float _409 = _323 * _403;
    float _411 = _343 * _403;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _417;
    float _421 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].x, _409);
    float _423 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].y, _411);
    float _425 = fma(_415, _357, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _427 = fma(_419, _357, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _429 = fma(_393, _395, _421);
    float _431 = fma(_397, _395, _423);
    float _433 = fma(_425, _379, _429);
    float _435 = fma(_427, _379, _431);
    float _437 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[146].x, _433);
    float _439 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[146].y, _435);
    float _441 = _437 * _399;
    float _443 = _439 * _401;
    bool _445 = !_307;
    float _461;
    if (!_445)
    {
        float _447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _449 = _163 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _453 = _451 * _447;
        float _455 = floor(_453);
        float _457 = -_455;
        float _459 = _453 + _457;
        _461 = _459;
        _463 = true;
    }
    else
    {
        _461 = _181;
    }
    _463 = false;
    float _465 = _461;
    float _467 = in.m_56.x;
    float _469 = in.m_56.y;
    float _471 = in.m_56.z;
    float _473 = in.m_76.w;
    float _475 = in.m_78.w;
    float _477 = _199 * _469;
    float _479 = _205 * _469;
    float _481 = fma(_197, _467, _477);
    float _483 = fma(_203, _467, _479);
    float _485 = fma(_201, _471, _481);
    float _487 = fma(_207, _471, _483);
    float _489 = _485 + _473;
    float _491 = _487 + _475;
    float _493 = fma(_489, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _495 = fma(_491, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _497 = floor(_493);
    float _499 = floor(_495);
    float _501 = -_497;
    float _503 = _493 + _501;
    float _505 = -_499;
    float _507 = _495 + _505;
    float2 _4132 = float2(_503, _507);
    float _509 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4132, float2(0.0), isnan(_4132)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4132, float2(0.0), isnan(_4132)), level(0.0)).x;
    float _511 = in.m_82.y;
    float _513 = _441 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _515 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _517 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _519 = _469 + _511;
    float _521 = _519 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _523 = _519 + _517;
    float _525 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[11].x, _521);
    float _527 = _523 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _529 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[11].z, _525);
    float _531 = _519 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _533 = fma(_489, (*spvDescriptorSet0.vp_c15)._m0[126].x, _527);
    float _535 = _529 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _537 = fma(_489, (*spvDescriptorSet0.vp_c8)._m0[10].x, _531);
    float _539 = fma(_491, (*spvDescriptorSet0.vp_c15)._m0[126].z, _533);
    float _541 = 1.0 / _535;
    float _543 = fma(_491, (*spvDescriptorSet0.vp_c8)._m0[10].z, _537);
    float _545 = _539 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _547 = _543 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _549 = trunc(_545);
    int _551 = int(_549);
    float _553 = _547 + _535;
    float _555 = _553 * _541;
    float _557 = _555 * 0.5;
    float _559 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _561 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _563 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[30].w, _561);
    float _565 = _443 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _567 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _569 = _551 + _567;
    int _571 = _569 + 1;
    float _573 = _565 * _559;
    float _575 = 1.0 / _563;
    float _577 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _579 = _573 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _581 = _513 * _577;
    float _583 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[24].x, _579);
    float _585 = _523 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _587 = fma(_515, (*spvDescriptorSet0.vp_c8)._m0[24].z, _583);
    float _589 = fma(_489, (*spvDescriptorSet0.vp_c15)._m0[127].x, _585);
    float _591 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _593 = _575 * _591;
    float _595 = _573 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _597 = fma(_491, (*spvDescriptorSet0.vp_c15)._m0[127].z, _589);
    float _599 = _587 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _601 = _573 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _603 = _593 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _605 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[26].x, _595);
    bool _607 = _593 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _609 = _597 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _611 = !_603;
    int _613 = _611 ? 0 : 1;
    float _615 = fma(_515, (*spvDescriptorSet0.vp_c8)._m0[26].z, _605);
    float _617 = _489 + _599;
    float _619 = trunc(_609);
    int _621 = int(_619);
    float _623 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[25].x, _601);
    float _625 = _615 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _627 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _629 = _617 + _627;
    float _631 = fma(_515, (*spvDescriptorSet0.vp_c8)._m0[25].z, _623);
    int _633 = 2;
    int _635 = _571;
    float _637 = _617;
    float _639 = _523;
    if (!_603)
    {
        _633 = 1;
    }
    int _641 = _633;
    float _643 = _491 + _625;
    int _645 = _641;
    float _647 = _643;
    if (!_607)
    {
        _645 = _613;
    }
    int _649 = _645;
    bool _651 = _571 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _653 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _655 = _643 + _653;
    int _657 = _649 << 6;
    float _659 = _655 * _655;
    int _661 = _657 + 48;
    uint _664 = uint(int(uint(_661) >> uint(2)));
    uint _666 = uint(int(uint(int(_664)) >> uint(2)));
    int _668 = int(_664) & 3;
    float _670 = (*spvDescriptorSet0.vp_c15)._m0[int(_666)][_668];
    int _672 = int(_664) + 1;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    int _676 = _672 & 3;
    float _678 = (*spvDescriptorSet0.vp_c15)._m0[int(_674)][_676];
    int _680 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _682 = _621 + _680;
    int _684 = _682 + 1;
    float _686 = fma(_629, _629, _659);
    int _688 = _571 | _684;
    float _690 = sqrt(_686);
    int _692 = _657 + 56;
    uint _694 = uint(int(uint(_692) >> uint(2)));
    uint _696 = uint(int(uint(int(_694)) >> uint(2)));
    int _698 = int(_694) & 3;
    float _700 = (*spvDescriptorSet0.vp_c15)._m0[int(_696)][_698];
    int _702 = int(_694) + 1;
    uint _704 = uint(int(uint(_702) >> uint(2)));
    int _706 = _702 & 3;
    float _708 = (*spvDescriptorSet0.vp_c15)._m0[int(_704)][_706];
    bool _710 = _688 < 0;
    bool _712 = _710 || _651;
    bool _714 = _684 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _716 = _714 || _712;
    int _718 = _657 + 64;
    uint _720 = uint(int(uint(_718) >> uint(2)));
    uint _722 = uint(int(uint(int(_720)) >> uint(2)));
    int _724 = int(_720) & 3;
    float _726 = (*spvDescriptorSet0.vp_c15)._m0[int(_722)][_724];
    int _728 = int(_720) + 1;
    uint _730 = uint(int(uint(_728) >> uint(2)));
    int _732 = _728 & 3;
    float _734 = (*spvDescriptorSet0.vp_c15)._m0[int(_730)][_732];
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _738 = _736 != 0;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _742 = _740 != 0;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _746 = _744 != 0;
    bool _748 = _690 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _750 = _657 + 72;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    uint _754 = uint(int(uint(int(_752)) >> uint(2)));
    int _756 = int(_752) & 3;
    float _758 = (*spvDescriptorSet0.vp_c15)._m0[int(_754)][_756];
    int _760 = int(_752) + 1;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    int _764 = _760 & 3;
    float _766 = (*spvDescriptorSet0.vp_c15)._m0[int(_762)][_764];
    bool _768 = !_742;
    int _770 = _768 ? 0 : 1;
    float _772 = as_type<float>(_649);
    float _774 = as_type<float>(_657);
    if (!_716)
    {
        int _776 = _684 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _778 = _776 + _571;
        _635 = _778;
    }
    int _780 = _635;
    float _782 = _631 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _784 = !_738;
    int _786 = _784 ? 0 : 1;
    bool _788 = !_746;
    int _790 = _788 ? 0 : 1;
    int _792 = _657 + 96;
    uint _794 = uint(int(uint(_792) >> uint(2)));
    uint _796 = uint(int(uint(int(_794)) >> uint(2)));
    int _798 = int(_794) & 3;
    float _800 = (*spvDescriptorSet0.vp_c15)._m0[int(_796)][_798];
    int _802 = int(_794) + 1;
    uint _804 = uint(int(uint(_802) >> uint(2)));
    int _806 = _802 & 3;
    float _808 = (*spvDescriptorSet0.vp_c15)._m0[int(_804)][_806];
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _812 = _810 != 0;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _816 = _814 != 0;
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _820 = _818 != 0;
    float _822 = _519 + _782;
    int _824 = 0;
    float _826 = _782;
    float _828 = as_type<float>(_780);
    if (!_716)
    {
        int _830 = _780 << 2;
        _824 = _830;
    }
    int _832 = _824;
    int _834 = 0;
    int _836 = _832;
    if (!_716)
    {
        uint _838 = uint(int(uint(_780) >> uint(2)));
        _834 = int(_838);
    }
    int _840 = _834;
    bool _842 = !_816;
    int _844 = _842 ? 0 : 1;
    int _846 = _657 + 104;
    uint _848 = uint(int(uint(_846) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.vp_c15)._m0[int(_850)][_852];
    int _856 = int(_848) + 1;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    int _860 = _856 & 3;
    float _862 = (*spvDescriptorSet0.vp_c15)._m0[int(_858)][_860];
    bool _864 = !_812;
    int _866 = _864 ? 0 : 1;
    bool _868 = !_820;
    int _870 = _868 ? 0 : 1;
    if (!_716)
    {
        int _872 = 12 & _832;
        _836 = _872;
    }
    int _874 = _836;
    float _876 = 0.0;
    if (!_748)
    {
        _876 = _822;
    }
    float _878 = _876;
    bool _880 = !_748;
    float _882 = _878;
    float _884 = _726;
    if (!_880)
    {
        float _886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _890 = _690 + _888;
        float _892 = _822 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _894 = rsqrt(_686);
        float _896 = _890 * _886;
        float _898 = _896 * 0.15915493667125701904296875;
        float _900 = _898 * 6.283185482025146484375;
        float _902 = cos(_900);
        float _904 = _898 * 6.283185482025146484375;
        float _906 = sin(_904);
        float _908 = _902 + (-1.0);
        float _910 = fma(_906, _892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _912 = _908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = _894 * _910;
        float _916 = fma(_822, _902, _912);
        float _918 = fma(_629, _914, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _920 = fma(_655, _914, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _882 = _916;
        _637 = _918;
        _647 = _920;
        _826 = _912;
    }
    float _922 = _882;
    float _924 = _637;
    float _926 = _647;
    float _928 = _826;
    float _930 = _928;
    float _932 = _924;
    float _934 = _922;
    float _936 = _926;
    if (!_716)
    {
        int _938 = _840 << 4;
        int _940 = _938 + _874;
        _930 = as_type<float>(_940);
    }
    float _942 = _930;
    float _944 = -_519;
    float _946 = _944 + _922;
    int _948 = _657 + 80;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    uint _952 = uint(int(uint(int(_950)) >> uint(2)));
    int _954 = int(_950) & 3;
    float _956 = (*spvDescriptorSet0.vp_c15)._m0[int(_952)][_954];
    int _958 = int(_950) + 1;
    uint _960 = uint(int(uint(_958) >> uint(2)));
    int _962 = _958 & 3;
    float _964 = (*spvDescriptorSet0.vp_c15)._m0[int(_960)][_962];
    float _966 = -_489;
    float _968 = _966 + _924;
    float _970 = -_491;
    float _972 = _970 + _926;
    float _974 = _946 * _946;
    float _976 = _523 * _808;
    float _978 = _523 * _734;
    float _980 = fma(_968, _968, _974);
    float _982 = _942;
    float _984 = _974;
    if (!_716)
    {
        int _986 = as_type<int>(_942) + 400;
        uint _988 = uint(int(uint(_986) >> uint(2)));
        uint _990 = uint(int(uint(int(_988)) >> uint(2)));
        int _992 = int(_988) & 3;
        float _994 = (*spvDescriptorSet0.vp_c15)._m0[int(_990)][_992];
        _982 = _994;
    }
    float _996 = _982;
    float _998 = fma(_489, _800, _976);
    if (!_716)
    {
        float _1000 = floor(_545);
        _984 = _1000;
    }
    float _1002 = _984;
    float _1004 = fma(_972, _972, _980);
    float _1006 = fma(_489, _726, _978);
    float _1008 = fma(_491, _854, _998);
    float _1010 = _523 * _678;
    bool _1012 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1014 = isnan(0.5);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1020 = _1016 || _1018;
    int _1022 = _657 + 88;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    uint _1026 = uint(int(uint(int(_1024)) >> uint(2)));
    int _1028 = int(_1024) & 3;
    float _1030 = (*spvDescriptorSet0.vp_c15)._m0[int(_1026)][_1028];
    int _1032 = int(_1024) + 1;
    uint _1034 = uint(int(uint(_1032) >> uint(2)));
    int _1036 = _1032 & 3;
    float _1038 = (*spvDescriptorSet0.vp_c15)._m0[int(_1034)][_1036];
    float _1040 = _1008 + _862;
    float _1042 = sqrt(_1004);
    float _1044 = fma(_489, _670, _1010);
    float _1046 = fma(_491, _758, _1006);
    float _1048 = fma(_491, _700, _1044);
    float _1050 = _1046 + _766;
    float _1052 = _854;
    if (!_716)
    {
        float _1054 = floor(_609);
        _1052 = _1054;
    }
    float _1056 = _1052;
    float _1058 = _1048 + _708;
    bool _1060 = _1042 > 0.0;
    float _1062 = 1.0 / _1040;
    bool _1064 = !_1060;
    if (!_1064)
    {
        float _1066 = _237 * _237;
        float _1068 = rsqrt(_1004);
        float _1070 = fma(_241, _241, _1066);
        float _1072 = fma(_243, _243, _1070);
        float _1074 = sqrt(_1072);
        float _1076 = _968 * _1068;
        float _1078 = _946 * _1068;
        float _1080 = _972 * _1068;
        bool _1082 = _1074 > 0.0;
        bool _1084 = !_1082;
        if (!_1084)
        {
            float _1086 = rsqrt(_1072);
            float _1088 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1090 = _237 * _1086;
            float _1092 = _241 * _1086;
            float _1094 = _1078 * _1090;
            float _1096 = _243 * _1086;
            float _1098 = fma(_1076, _1092, _1094);
            float _1100 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1102 = fma(_1080, _1096, _1098);
            float _1104 = _1102 * _1100;
            float _1106 = fma(_241, _1104, _924);
            float _1108 = fma(_237, _1104, _922);
            float _1110 = fma(_243, _1104, _926);
            _932 = _1106;
            _934 = _1108;
            _936 = _1110;
            _884 = _1088;
        }
    }
    float _1112 = _932;
    float _1114 = _934;
    float _1116 = _936;
    float _1118 = _884;
    float _1120 = _1118;
    float _1122 = _1112;
    if (_1020)
    {
        _247 = _1112;
    }
    float _1124 = _247;
    float _1126 = _1124;
    if (_1020)
    {
        _249 = _1114;
    }
    float _1128 = _249;
    float _1130 = _1128;
    if (_1020)
    {
        _251 = _1116;
    }
    float _1132 = _251;
    float _1134 = _1132;
    if (!_1020)
    {
        float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1138 = _519 + _1136;
        float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1142 = _489 + _1140;
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1146 = -_489;
        float _1148 = _1146 + _1112;
        float _1150 = _1138 * _1138;
        float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1154 = _491 + _1152;
        float _1156 = -_491;
        float _1158 = _1156 + _1116;
        float _1160 = fma(_1142, _1142, _1150);
        float _1162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1164 = fma(_1154, _1154, _1160);
        float _1166 = sqrt(_1164);
        float _1168 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1170 = precise::min(_1166, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1172 = _1170 * _1162;
        float _1174 = -_519;
        float _1176 = _1174 + _1114;
        float _1178 = _1168 * _1172;
        float _1180 = fma(_1176, _1178, _519);
        float _1182 = fma(_1148, _1178, _489);
        float _1184 = fma(_1158, _1178, _491);
        _1130 = _1180;
        _1126 = _1182;
        _1134 = _1184;
        _1120 = _1172;
    }
    float _1186 = _1130;
    float _1188 = _1126;
    float _1190 = _1134;
    float _1192 = _1120;
    float _1194 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1196 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1198 = _1058 * _1062;
    float _1200 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1202 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1194);
    float _1204 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1196);
    float _1206 = _1050 * _1062;
    float _1208 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1200);
    float _1210 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1202);
    bool _1212 = _1198 >= 0.0;
    float _1214 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1204);
    float _1216 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1218 = _1210 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1220 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1208);
    float _1222 = _1192;
    if (!_716)
    {
        float _1224 = rint(_996);
        float _1226 = precise::max(_1224, 0.0);
        uint _1228 = uint(_1226);
        uint _1230 = clamp(_1228, 0u, 65535u);
        _1222 = as_type<float>(_1230);
    }
    float _1232 = _1222;
    bool _1234 = _1198 <= 1.0;
    bool _1236 = _1234 && _1212;
    float _1238 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1216);
    float _1240 = _1220 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1242 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1244 = _1206 >= 0.0;
    bool _1246 = _1244 && _1236;
    float _1248 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1238);
    float _1250 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    if (!_716)
    {
        float _1252 = -_1056;
        float _1254 = _609 + _1252;
        _1122 = _1254;
    }
    float _1256 = _1122;
    float _1258 = _1214 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1260 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1262 = _1206 <= 1.0;
    bool _1264 = _1262 && _1246;
    float _1266 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1268 = -_1250;
    float _1270 = fma(_1268, _1242, 1.0);
    float _1272 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1260);
    float _1274 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1276 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1272);
    float _1278 = log2(_1270);
    float _1280 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1274);
    float _1282 = _1274;
    if (!_716)
    {
        float _1284 = -_1002;
        float _1286 = _545 + _1284;
        _1282 = _1286;
    }
    float _1288 = _1282;
    float _1290 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1276);
    float _1292 = _523 * _964;
    float _1294 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1296 = _1290;
    if (_1264)
    {
        float _1298 = float(_649);
        _772 = _1298;
    }
    float _1300 = _772;
    float _1302 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1280);
    float _1304 = 1.0 / _1290;
    float _1306 = fma(_489, _956, _1292);
    float _1308 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1294);
    float _1310 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1302);
    float _1312 = fma(_491, _1030, _1306);
    float _1314 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1308);
    float _1316 = _1306;
    float _1318 = _1310;
    if (_1264)
    {
        float _1320 = rint(_1300);
        float _1322 = precise::max(_1320, 0.0);
        uint _1324 = uint(_1322);
        uint _1326 = clamp(_1324, 0u, 65535u);
        _1316 = as_type<float>(_1326);
    }
    float _1328 = _1316;
    float _1330 = _1312 + _1038;
    float _1332 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1314);
    float _1334 = _1278 * 0.693147182464599609375;
    float _1336 = _1330 * _1062;
    float _1338 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1340 = _1332 * _1304;
    float _1342 = _1310 * _1304;
    float _1344 = _1300;
    if (!_716)
    {
        float3 _5520 = float3(_1288, _1256, float(as_type<int>(_1232)));
        float3 _5524 = select(_5520, float3(0.0), isnan(_5520));
        float _1346 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5524.xy, uint(rint(_5524.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5524.xy, uint(rint(_5524.z)), level(0.0)).x;
        _1344 = _1346;
    }
    float _1348 = _1344;
    float _1350 = fma(_1340, 0.5, 0.5);
    float _1352 = fma(_1342, -0.5, 0.5);
    float _1354 = _1206;
    if (_1264)
    {
        float3 _5543 = float3(_1198, _1206, float(as_type<int>(_1328)));
        float3 _5545 = select(_5543, float3(0.0), isnan(_5543));
        float _1356 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5545.xy, uint(rint(_5545.z)), _1336, level(0.0));
        _1354 = _1356;
    }
    float _1358 = _1354;
    float3 _5555 = float3(_1350, _1352, _1338);
    float _1360 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5555, float3(0.0), isnan(_5555)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5555, float3(0.0), isnan(_5555)), level(0.0)).x;
    float3 _5564 = float3(_1350, _1352, _1338);
    float4 _1363 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5564, float3(0.0), isnan(_5564)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5564, float3(0.0), isnan(_5564)), level(0.0)).xyzw;
    float _1365 = _1363.x;
    float _1367 = _1363.y;
    float _1369 = _1363.z;
    float _1371 = _1363.w;
    float _1373 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1375 = int(_1373);
    int _1377 = abs(_770);
    int _1379 = abs(_790);
    float _1381 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1383 = int(_1381);
    float _1385 = float(_1375);
    float _1387 = 1.0 / _1385;
    float _1389 = float(uint(_1383));
    float _1391 = 1.0 / _1389;
    float _1393 = _133 * _1387;
    float _1395 = trunc(_1393);
    int _1397 = int(_1395);
    int _1399 = as_type<int>(_1391) + (-2);
    int _1401 = ~_1383;
    int _1403 = _1401 + 1;
    int _1405 = ~_1383;
    int _1407 = _1405 + 1;
    int _1409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1411 = _1409 != 0;
    float _1413 = float(_1383);
    float _1415 = float(uint(_1397));
    float _1417 = as_type<float>(_1399) * _1415;
    float _1419 = trunc(_1417);
    float _1421 = precise::max(_1419, 0.0);
    uint _1423 = uint(_1421);
    int _1425 = _1403 * int(_1423);
    int _1427 = _1425 + _1397;
    float _1429 = float(uint(_1427));
    float _1431 = as_type<float>(_1427);
    if (_1411)
    {
        _1431 = 1.0;
    }
    float _1433 = _1431;
    float _1435 = _1433;
    if (!_1411)
    {
        _1435 = 7.345489978790283203125;
    }
    float _1437 = _1435;
    float _1439 = as_type<float>(_1399) * _1429;
    float _1441 = float(_1397);
    float _1443 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1445 = int(_1443);
    float _1447 = _1437 * _163;
    float _1449 = trunc(_1439);
    float _1451 = precise::max(_1449, 0.0);
    uint _1453 = uint(_1451);
    float _1455 = float(_1445);
    float _1457 = 1.0 / _1455;
    int _1459 = int(_1423) + int(_1453);
    bool _1461 = _1441 >= _1413;
    bool _1463 = isnan(_1441);
    bool _1465 = _1461 || _1463;
    bool _1467 = isnan(_1413);
    bool _1469 = _1465 || _1467;
    float _1471 = float(_1469);
    float _1473 = _181 * _1413;
    int _1475 = _1407 * _1459;
    int _1477 = _1475 + _1397;
    float _1479 = floor(_1447);
    bool _1481 = uint(_1477) >= uint(_1383);
    float _1483 = trunc(_1471);
    int _1485 = int(_1483);
    bool _1487 = !_1481;
    int _1489 = _1487 ? 0 : (-1);
    float _1491 = _133 * _1457;
    bool _1493 = _1383 == 0;
    int _1495 = ~_1459;
    int _1497 = _1495 + _1489;
    int _1499 = _1497 + 1;
    float _1501 = -_1479;
    float _1503 = _1447 + _1501;
    float _1505 = trunc(_1491);
    int _1507 = int(_1505);
    int _1509 = _1383 * _1499;
    int _1511 = _1509 + _1397;
    float _1513 = _1503 * _1413;
    int _1515 = _1383 + (-1);
    bool _1517 = !_1493;
    int _1519 = _1517 ? _1511 : (-1);
    int _1521 = ~_1485;
    int _1523 = _1521 + 1;
    int _1525 = _1523 + 1;
    float _1527 = trunc(_1513);
    int _1529 = int(_1527);
    int _1531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1533 = _1531 != 0;
    int _1535 = _1519 * _1525;
    bool _1537 = !_1533;
    int _1539 = _1537 ? 0 : 1;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1543 = _1541 != 0;
    float _1545 = trunc(_1473);
    int _1547 = int(_1545);
    int _1549 = _1485 * _1515;
    int _1551 = _1549 + _1535;
    int _1553 = abs(_1539);
    int _1555 = abs(_786);
    float _1557 = float(uint(_1507));
    int _1559 = _1529 * _1553;
    int _1561 = _1559 + _1397;
    int _1563 = _1551 * _1377;
    bool _1565 = !_1543;
    int _1567 = _1565 ? 0 : 1;
    float _1569 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1571 = int(_1569);
    bool _1573 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1575 = isnan(0.5);
    bool _1577 = _1573 || _1575;
    bool _1579 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1581 = _1577 || _1579;
    int _1583 = abs(_1567);
    int _1585 = _1547 * _1555;
    int _1587 = _1585 + _1563;
    int _1589 = _1561 * _1379;
    int _1591 = _1589 + _1587;
    int _1593 = _1529 * _1583;
    int _1595 = _1593 + _1591;
    int _1597 = ~_1383;
    int _1599 = _1597 + 1;
    float _1601 = float(uint(_1571));
    float _1603 = float(uint(_1595));
    int _1605 = ~_1571;
    int _1607 = _1605 + 1;
    float _1609 = 1.0 / _1601;
    float _1611 = as_type<float>(_1399) * _1603;
    int _1613 = ~_1383;
    int _1615 = _1613 + 1;
    float _1617 = trunc(_1611);
    float _1619 = precise::max(_1617, 0.0);
    uint _1621 = uint(_1619);
    int _1623 = as_type<int>(_1609) + (-2);
    float _1625 = as_type<float>(_1623) * _1557;
    int _1627 = _1599 * int(_1621);
    int _1629 = _1627 + _1595;
    float _1631 = trunc(_1625);
    float _1633 = precise::max(_1631, 0.0);
    uint _1635 = uint(_1633);
    float _1637 = float(uint(_1629));
    float _1639 = as_type<float>(_1629);
    float _1641 = as_type<float>(_1615);
    if (_1411)
    {
        _1639 = _163;
    }
    float _1643 = _1639;
    float _1645 = as_type<float>(_1399) * _1637;
    float _1647 = _1643;
    if (!_1411)
    {
        float _1649 = in.m_65.z;
        _1647 = _1649;
    }
    float _1651 = _1647;
    float _1653 = trunc(_1645);
    float _1655 = precise::max(_1653, 0.0);
    uint _1657 = uint(_1655);
    int _1659 = _1607 * int(_1635);
    int _1661 = _1659 + _1507;
    float _1663 = float(uint(_1661));
    float _1665 = as_type<float>(_1623) * _1663;
    int _1667 = int(_1621) + int(_1657);
    float _1669 = _1663;
    float _1671 = as_type<float>(_1635);
    if (_1411)
    {
        _1641 = 1.0;
    }
    float _1673 = _1641;
    float _1675 = trunc(_1665);
    float _1677 = precise::max(_1675, 0.0);
    uint _1679 = uint(_1677);
    float _1681 = _1673;
    if (!_1411)
    {
        _1681 = 5.839270114898681640625;
    }
    float _1683 = _1681;
    int _1685 = _1615 * _1667;
    int _1687 = _1685 + _1595;
    if (_716)
    {
        _1669 = 1.0;
    }
    float _1689 = _1669;
    float _1691 = _1683 * _1651;
    bool _1693 = uint(_1687) >= uint(_1383);
    bool _1695 = !_1693;
    int _1697 = _1695 ? 0 : (-1);
    int _1699 = ~_1667;
    int _1701 = _1699 + _1697;
    int _1703 = _1701 + 1;
    int _1705 = int(_1635) + int(_1679);
    float _1707 = _1689;
    if (_1581)
    {
        _1671 = 1.0;
    }
    float _1709 = _1671;
    int _1711 = _1383 * _1703;
    int _1713 = _1711 + _1595;
    float _1715 = _1709;
    if (!_1581)
    {
        float _1717 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1719 = _1717 * 0.15915493667125701904296875;
        float _1721 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1723 = _1719 * 6.283185482025146484375;
        float _1725 = cos(_1723);
        float _1727 = _1721 * 0.15915493667125701904296875;
        float _1729 = _1719 * 6.283185482025146484375;
        float _1731 = sin(_1729);
        float _1733 = 1.0 / _1725;
        float _1735 = _1727 * 6.283185482025146484375;
        float _1737 = cos(_1735);
        float _1739 = _1731 * _1733;
        float _1741 = _1727 * 6.283185482025146484375;
        float _1743 = sin(_1741);
        float _1745 = _1737 * _1739;
        float _1747 = 1.0 / _1745;
        float _1749 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1751 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1749;
        float _1753 = 1.0 / _1751;
        float _1755 = _1743 * _1747;
        float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1759 = fma(_593, _1755, _1757);
        float _1761 = _1759 * _1753;
        float _1763 = precise::clamp(_1761, 0.0, 1.0);
        _1715 = _1763;
    }
    float _1765 = _1715;
    if (!_716)
    {
        int _1767 = _780 << 4;
        int _1769 = _1767 + 2048;
        uint _1771 = uint(int(uint(_1769) >> uint(2)));
        uint _1773 = uint(int(uint(int(_1771)) >> uint(2)));
        int _1775 = int(_1771) & 3;
        float _1777 = (*spvDescriptorSet0.vp_c15)._m0[int(_1773)][_1775];
        int _1779 = int(_1771) + 1;
        uint _1781 = uint(int(uint(_1779) >> uint(2)));
        int _1783 = _1779 & 3;
        float _1785 = (*spvDescriptorSet0.vp_c15)._m0[int(_1781)][_1783];
        int _1787 = _1769 + 8;
        uint _1789 = uint(int(uint(_1787) >> uint(2)));
        uint _1791 = uint(int(uint(int(_1789)) >> uint(2)));
        int _1793 = int(_1789) & 3;
        float _1795 = (*spvDescriptorSet0.vp_c15)._m0[int(_1791)][_1793];
        int _1797 = int(_1789) + 1;
        uint _1799 = uint(int(uint(_1797) >> uint(2)));
        int _1801 = _1797 & 3;
        float _1803 = (*spvDescriptorSet0.vp_c15)._m0[int(_1799)][_1801];
        float _1805 = _523 * _1785;
        float _1807 = fma(_489, _1777, _1805);
        float _1809 = fma(_491, _1795, _1807);
        float _1811 = _1809 + _1803;
        float _1813 = precise::clamp(_1811, 0.0, 1.0);
        float _1815 = -_1813;
        float _1817 = _1815 + _1348;
        float _1819 = fma(_1817, 500.0, 1.5);
        float _1821 = exp2(_1819);
        float _1823 = 0.0 + _1821;
        float _1825 = precise::clamp(_1823, 0.0, 1.0);
        _639 = _1805;
        _828 = as_type<float>(_1769);
        _1707 = _1825;
    }
    float _1827 = _639;
    float _1829 = _828;
    float _1831 = _1707;
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1835 = _1186 + _1833;
    float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1839 = _1188 + _1837;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1843 = _1190 + _1841;
    float _1845 = _1835 * _1835;
    float _1847 = fma(_1839, _1839, _1845);
    float _1849 = fma(_1843, _1843, _1847);
    float _1851 = rsqrt(_1849);
    float _1853 = sqrt(_1849);
    float _1855 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1857 = _1839 * _1855;
    float _1859 = _1843 * _1855;
    float _1861 = _1857 * _1857;
    float _1863 = _1859 * _1859;
    float _1865 = _1861 + _1863;
    float _1867 = sqrt(_1865);
    bool _1869 = _1867 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1871 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1873 = _1867 + _1871;
    float _1875 = _1827;
    float _1877 = _1865;
    float _1879 = _1873;
    float _1881 = _1857;
    float _1883 = _1859;
    float _1885 = _1861;
    float _1887 = _1863;
    if (_1869)
    {
        float _1889 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1875 = _1889;
    }
    float _1891 = _1875;
    if (_1869)
    {
        float _1893 = rsqrt(_1865);
        _1877 = _1893;
    }
    float _1895 = _1877;
    if (_1869)
    {
        float _1897 = _1873 * _1891;
        _1879 = _1897;
    }
    float _1899 = _1879;
    if (_1869)
    {
        float _1901 = _1899 * 0.15915493667125701904296875;
        _774 = _1901;
    }
    float _1903 = _774;
    float _1905 = _1348;
    if (_1869)
    {
        float _1907 = _1903 * 6.283185482025146484375;
        float _1909 = sin(_1907);
        _1905 = _1909;
    }
    float _1911 = _1905;
    float _1913 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1915 = precise::max(0.0, _1913);
    float _1917 = _1829;
    float _1919 = _1915;
    float _1921 = _1913;
    if (_1869)
    {
        float _1923 = _1903 * 6.283185482025146484375;
        float _1925 = cos(_1923);
        _1917 = _1925;
    }
    float _1927 = _1917;
    float _1929 = -_1855;
    float _1931 = -_1915;
    float _1933 = fma(_1835, _1929, _1931);
    float _1935 = _1933;
    if (_1869)
    {
        float _1937 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1919 = _1937;
    }
    float _1939 = _1919;
    float _1941 = floor(_1691);
    float _1943 = _1939;
    float _1945 = _1911;
    if (_1869)
    {
        float _1947 = fma(_1911, _1939, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1943 = _1947;
    }
    float _1949 = _1943;
    float _1951 = _1949;
    if (_1869)
    {
        float _1953 = _1927 + (-1.0);
        _1921 = _1953;
    }
    float _1955 = _1921;
    if (_1869)
    {
        float _1957 = _1895 * _1949;
        _1945 = _1957;
    }
    float _1959 = _1945;
    if (_1869)
    {
        float _1961 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1951 = _1961;
    }
    float _1963 = _1951;
    if (_1869)
    {
        float _1965 = _1857 * _1959;
        _1881 = _1965;
    }
    float _1967 = _1881;
    if (_1869)
    {
        float _1969 = _1859 * _1959;
        _1883 = _1969;
    }
    float _1971 = _1883;
    int _1973 = ~_1571;
    int _1975 = _1973 + 1;
    if (_1869)
    {
        float _1977 = fma(_1933, _1927, _1963);
        _1935 = _1977;
    }
    float _1979 = _1935;
    if (_1869)
    {
        float _1981 = _1967 * _1967;
        _1885 = _1981;
    }
    float _1983 = _1885;
    if (_1869)
    {
        float _1985 = _1971 * _1971;
        _1887 = _1985;
    }
    float _1987 = _1887;
    float _1989 = fma(_1979, _1979, _1983);
    float _1991 = _1989 + _1987;
    float _1993 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1995 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1993);
    float _1997 = precise::clamp(_1995, 0.0, 1.0);
    float _1999 = -_1997;
    float _2001 = _1999 + 1.0;
    float _2003 = rsqrt(_1991);
    float _2005 = abs(_2001);
    float _2007 = log2(_2005);
    float _2009 = _2003 * _1967;
    float _2011 = _2003 * _1979;
    float _2013 = _2003 * _1971;
    float _2015 = _2009 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2017 = -_2015;
    float _2019 = fma(_2011, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2017);
    float _2021 = -_2013;
    float _2023 = fma(_2021, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2019);
    float _2025 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2027 = fma(_2023, -0.5, 0.5);
    float _2029 = fma(_2023, 0.5, 0.5);
    float _2031 = exp2(_2025);
    float _2033 = fma(_2029, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2035 = fma(_2029, _2033, -0.212114393711090087890625);
    float _2037 = sqrt(_2027);
    float _2039 = fma(_2029, _2035, 1.570728778839111328125);
    float _2041 = _2011 + 1.0;
    float _2043 = -_2011;
    float _2045 = fma(_2031, _2041, _2043);
    float _2047 = fma(_2045, 0.5, 0.5);
    float _2049 = _2037 * 0.636619746685028076171875;
    float _2051 = -_2039;
    float _2053 = fma(_2049, _2051, 1.0);
    bool _2055 = !_1493;
    int _2057 = _2055 ? _1713 : (-1);
    int _2059 = _1975 * _1705;
    int _2061 = _2059 + _1507;
    float2 _6552 = float2(_2053, _2047);
    float3 _2065 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6552, float2(0.0), isnan(_6552)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6552, float2(0.0), isnan(_6552)), level(0.0)).xyz;
    float _2067 = _2065.x;
    float _2069 = _2065.y;
    float _2071 = _2065.z;
    int _2073 = _2057 & 3;
    bool _2075 = _2073 != 0;
    float _2077 = in.m_65.y;
    int _2079 = _2057 & 3;
    bool _2081 = _2079 != 0;
    float _2083 = -_1941;
    float _2085 = _1691 + _2083;
    bool _2087 = uint(_2061) >= uint(_1571);
    out.m_84.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_84.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_84.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    bool _2089 = uint(_2073) > 1u;
    float _2091 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2093 = !_2087;
    int _2095 = _2093 ? 0 : (-1);
    out.m_86.x = _513;
    int _2097 = _2081 ? 0 : 1;
    float _2099 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2101 = ~_1705;
    int _2103 = _2101 + _2095;
    int _2105 = _2103 + 1;
    float _2107 = -_509;
    float _2109 = _2107 + 1.0;
    float _2111 = float(_1571);
    float _2113 = float(_1507);
    float _2115 = exp2(_2099);
    int _2117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2119 = _2117 != 0;
    float _2121 = _2085 * _2111;
    bool _2123 = _2113 >= _2111;
    bool _2125 = isnan(_2113);
    bool _2127 = _2123 || _2125;
    bool _2129 = isnan(_2111);
    bool _2131 = _2127 || _2129;
    float _2133 = float(_2131);
    int _2135 = _1571 * _2105;
    int _2137 = _2135 + _1507;
    bool _2139 = _163 > 0.5;
    float _2141 = _181 * _2111;
    int _2143 = ~_2097;
    int _2145 = _2143 + 1;
    int _2147 = _2145 + 1;
    float _2149 = trunc(_2121);
    int _2151 = int(_2149);
    int _2153 = _2147;
    if (!_2089)
    {
        int _2155 = ~_2097;
        int _2157 = _2155 + 1;
        _2153 = _2157;
    }
    int _2159 = _2153;
    int _2161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2163 = _2161 != 0;
    bool _2165 = !_2119;
    int _2167 = _2165 ? 0 : 1;
    int _2169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2171 = _2169 != 0;
    float _2173 = trunc(_2133);
    int _2175 = int(_2173);
    float _2177 = -_221;
    int _2179 = _2139 ? as_type<int>(_2177) : as_type<int>(_221);
    bool _2181 = _1571 == 0;
    bool _2183 = !_2163;
    int _2185 = _2183 ? 0 : 1;
    float _2187 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2189 = !_2171;
    float _2191 = _2189 ? _221 : as_type<float>(_2179);
    float _2193 = trunc(_2141);
    int _2195 = int(_2193);
    bool _2197 = uint(_2073) >= 2u;
    float _2199 = -_2187;
    float _2201 = fma(_2091, 2.0, _2199);
    bool _2203 = _2077 > 0.5;
    bool _2205 = !_2181;
    int _2207 = _2205 ? _2137 : (-1);
    float _2209 = -_133;
    float _2211 = fma(_2209, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2201);
    int _2213 = ~_2175;
    int _2215 = _2213 + 1;
    int _2217 = _2215 + 1;
    int _2219 = _2197 ? 0 : 1;
    float _2221 = -_225;
    int _2223 = _2203 ? as_type<int>(_2221) : as_type<int>(_225);
    int _2225 = _2207 * _2217;
    int _2227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2229 = _2227 != 0;
    int _2231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2233 = _2231 != 0;
    int _2235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2237 = _2235 != 0;
    int _2239 = _1571 + (-1);
    int _2241 = abs(_2167);
    int _2243 = _2175 * _2239;
    int _2245 = _2243 + _2225;
    int _2247 = abs(_844);
    float _2249 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2251 = abs(_866);
    int _2253 = _2151 * _2241;
    int _2255 = _2253 + _1507;
    float _2257 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2259 = _2245 * _2247;
    float _2261 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2249);
    int _2263 = abs(_870);
    int _2265 = _2195 * _2251;
    int _2267 = _2265 + _2259;
    int _2269 = abs(_2185);
    float _2271 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2273 = _2255 * _2263;
    int _2275 = _2273 + _2267;
    float _2277 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2279 = _2151 * _2269;
    int _2281 = _2279 + _2275;
    float _2283 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2285 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2287 = _2285 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2289 = fma(_2077, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2277);
    float _2291 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2293 = float(uint(_2281));
    float _2295 = fma(_2271, -2.0, _2283);
    float _2297 = 1.0 / _2287;
    float _2299 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2301 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2303 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2305 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2299);
    float _2307 = as_type<float>(_1623) * _2293;
    float _2309 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2301);
    float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2313 = _2311 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2315 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2303);
    float _2317 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2319 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2317;
    float _2321 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2323 = _2321 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2325 = trunc(_2307);
    float _2327 = precise::max(_2325, 0.0);
    uint _2329 = uint(_2327);
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2333 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2335 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2337 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2339 = _2337 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2341 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2343 = _2331 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2345 = _2333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2347 = 1.0 / _2313;
    float _2349 = _2335 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2351 = _2323 * _2297;
    float _2353 = float(uint(_1561));
    float _2355 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2261);
    out.m_88.x = _2343;
    out.m_88.y = _2345;
    out.m_88.z = _2349;
    out.m_88.w = _2341;
    bool _2357 = !_2237;
    float _2359 = _2357 ? _225 : as_type<float>(_2223);
    float _2361 = 1.0 / _2339;
    bool _2363 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2365 = isnan(_465);
    bool _2367 = _2363 || _2365;
    bool _2369 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2371 = _2367 || _2369;
    float _2373 = float(_2371);
    float _2375 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2377 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2375;
    float _2379 = float(uint(_2255));
    float _2381 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2289);
    bool _2383 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2385 = isnan(_465);
    bool _2387 = _2383 || _2385;
    bool _2389 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2391 = _2387 || _2389;
    float _2393 = float(_2391);
    int _2395 = ~_1383;
    int _2397 = _2395 + 1;
    float _2399 = _2319 * _2347;
    float _2401 = as_type<float>(_1623) * _2379;
    float _2403 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2405 = _465 + _2403;
    float _2407 = -_2393;
    float _2409 = _2407 + 1.0;
    int _2411 = ~_1571;
    int _2413 = _2411 + 1;
    float _2415 = as_type<float>(_1399) * _2353;
    bool _2417 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2419 = isnan(_465);
    bool _2421 = _2417 || _2419;
    bool _2423 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2425 = _2421 || _2423;
    float _2427 = float(_2425);
    float _2429 = -_2373;
    float _2431 = _2429 + 1.0;
    float _2433 = _2377 * _2361;
    int _2435 = _2413 * int(_2329);
    int _2437 = _2435 + _2281;
    float _2439 = fma(_2399, _2405, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2441 = trunc(_2415);
    float _2443 = precise::max(_2441, 0.0);
    uint _2445 = uint(_2443);
    bool _2447 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2449 = isnan(_465);
    bool _2451 = _2447 || _2449;
    bool _2453 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2455 = _2451 || _2453;
    float _2457 = float(_2455);
    float _2459 = _2427 * _2431;
    float _2461 = float(uint(_2437));
    float _2463 = -_2427;
    float _2465 = _2463 + 1.0;
    float _2467 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2469 = _465 + _2467;
    float _2471 = _2457 * _2409;
    float _2473 = -_2457;
    float _2475 = _2473 + 1.0;
    float _2477 = trunc(_2401);
    float _2479 = precise::max(_2477, 0.0);
    uint _2481 = uint(_2479);
    float _2483 = as_type<float>(_1623) * _2461;
    float _2485 = _2393 * _2465;
    float _2487 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2489 = _465 + _2487;
    float _2491 = _2439 * _2471;
    float _2493 = fma(_2351, _2469, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2495 = fma(_2433, _2489, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2497 = trunc(_2483);
    float _2499 = precise::max(_2497, 0.0);
    uint _2501 = uint(_2499);
    int _2503 = _2397 * int(_2445);
    int _2505 = _2503 + _1561;
    int _2507 = ~_1571;
    int _2509 = _2507 + 1;
    float _2511 = fma(_2475, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2491);
    float _2513 = float(uint(_2505));
    float _2515 = fma(_2493, _2485, _2511);
    int _2517 = _2509 * int(_2481);
    int _2519 = _2517 + _2255;
    float _2521 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2523 = as_type<float>(_1399) * _2513;
    int _2525 = ~_1571;
    int _2527 = _2525 + 1;
    float _2529 = _2191 + 0.5;
    float _2531 = float(uint(_2519));
    float _2533 = trunc(_2523);
    float _2535 = precise::max(_2533, 0.0);
    uint _2537 = uint(_2535);
    int _2539 = int(_2329) + int(_2501);
    float _2541 = fma(_2495, _2459, _2515);
    int _2543 = ~_1383;
    int _2545 = _2543 + 1;
    float _2547 = as_type<float>(_1623) * _2531;
    int _2549 = _2527 * _2539;
    int _2551 = _2549 + _2281;
    float _2553 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2295);
    float _2555 = fma(_2529, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2211);
    float _2557 = _2359 + (-0.5);
    float _2559 = trunc(_2547);
    float _2561 = precise::max(_2559, 0.0);
    uint _2563 = uint(_2561);
    bool _2565 = uint(_2551) >= uint(_1571);
    float _2567 = fma(_2373, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2541);
    float _2569 = -_2557;
    float _2571 = -_2553;
    float _2573 = fma(_2569, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2571);
    bool _2575 = !_2565;
    int _2577 = _2575 ? 0 : (-1);
    float _2579 = fma(_2291, _2291, 1.0);
    bool _2581 = _2073 != 3;
    float _2583 = _2567 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2585 = ~_2539;
    int _2587 = _2585 + _2577;
    int _2589 = _2587 + 1;
    float _2591 = -_2355;
    float _2593 = _2591 + 1.0;
    int _2595 = int(_2445) + int(_2537);
    float _2597 = rsqrt(_2579);
    int _2599 = ~_1571;
    int _2601 = _2599 + 1;
    int _2603 = _1571 * _2589;
    int _2605 = _2603 + _2281;
    float _2607 = -_2593;
    float _2609 = fma(_2191, _2607, _2555);
    int _2611 = int(_2481) + int(_2563);
    int _2613 = _2545 * _2595;
    int _2615 = _2613 + _1561;
    int _2617 = _2057 >> 31;
    bool _2619 = !_2181;
    int _2621 = _2619 ? _2605 : (-1);
    int _2623 = _2617 & 3;
    int _2625 = _2621 >> 31;
    int _2627 = ~_2219;
    int _2629 = _2627 + 1;
    int _2631 = _2629 + 1;
    int _2633 = _2601 * _2611;
    int _2635 = _2633 + _2255;
    int _2637 = _2631;
    if (_2581)
    {
        int _2639 = ~_2219;
        int _2641 = _2639 + 1;
        _2637 = _2641;
    }
    int _2643 = _2637;
    float _2645 = _2291 * _2597;
    int _2647 = _2057 + _2623;
    bool _2649 = uint(_2615) >= uint(_1383);
    float _2651 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2653 = _2645 * _2651;
    int _2655 = _2625 & 3;
    float _2657 = -_2381;
    float _2659 = _2657 + 1.0;
    int _2661 = _2647 >> 2;
    int _2663 = _2621 + _2655;
    float _2665 = fma(_2359, _2659, _2573);
    int _2667 = _2661 << 4;
    int _2669 = _2667 + 368;
    float _2671 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2673 = _2645 * _2671;
    bool _2675 = !_2649;
    int _2677 = _2675 ? 0 : (-1);
    int _2679 = _2663 >> 2;
    float _2681 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2683 = _2645 * _2681;
    bool _2685 = uint(_2635) >= uint(_1571);
    float _2687 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2673);
    uint _2689 = uint(int(uint(_2669) >> uint(2)));
    uint _2691 = uint(int(uint(int(_2689)) >> uint(2)));
    int _2693 = int(_2689) & 3;
    float _2695 = (*spvDescriptorSet0.vp_c9)._m0[int(_2691)][_2693];
    int _2697 = int(_2689) + 1;
    uint _2699 = uint(int(uint(_2697) >> uint(2)));
    int _2701 = _2697 & 3;
    float _2703 = (*spvDescriptorSet0.vp_c9)._m0[int(_2699)][_2701];
    int _2705 = _2679 << 4;
    int _2707 = _2705 + 656;
    out.m_90.x = _2609;
    out.m_90.y = _2665;
    bool _2709 = !_2685;
    int _2711 = _2709 ? 0 : (-1);
    bool _2713 = !_2075;
    int _2715 = _2713 ? 0 : 1;
    uint _2717 = uint(int(uint(_2707) >> uint(2)));
    uint _2719 = uint(int(uint(int(_2717)) >> uint(2)));
    int _2721 = int(_2717) & 3;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[int(_2719)][_2721];
    int _2725 = int(_2717) + 1;
    uint _2727 = uint(int(uint(_2725) >> uint(2)));
    int _2729 = _2725 & 3;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[int(_2727)][_2729];
    float _2733 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2735 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2683);
    int _2737 = _2621 & 3;
    bool _2739 = _2737 != 0;
    float _2741 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2653);
    int _2743 = _2621 & 3;
    bool _2745 = _2743 != 0;
    float _2747 = _2733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2749 = ~_2595;
    int _2751 = _2749 + _2677;
    int _2753 = _2751 + 1;
    float _2755 = _2521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2757 = _2739 ? 0 : 1;
    int _2759 = _2669 + 8;
    uint _2761 = uint(int(uint(_2759) >> uint(2)));
    uint _2763 = uint(int(uint(int(_2761)) >> uint(2)));
    int _2765 = int(_2761) & 3;
    float _2767 = (*spvDescriptorSet0.vp_c9)._m0[int(_2763)][_2765];
    int _2769 = int(_2761) + 1;
    uint _2771 = uint(int(uint(_2769) >> uint(2)));
    int _2773 = _2769 & 3;
    float _2775 = (*spvDescriptorSet0.vp_c9)._m0[int(_2771)][_2773];
    bool _2777 = uint(_2743) > 1u;
    int _2779 = _1383 * _2753;
    int _2781 = _2779 + _1561;
    int _2783 = ~_2611;
    int _2785 = _2783 + _2711;
    int _2787 = _2785 + 1;
    float _2789 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2791 = abs(_2159);
    out.m_92.x = _2687;
    out.m_92.y = _2735;
    out.m_92.z = _2741;
    int _2793 = _2707 + 8;
    uint _2795 = uint(int(uint(_2793) >> uint(2)));
    uint _2797 = uint(int(uint(int(_2795)) >> uint(2)));
    int _2799 = int(_2795) & 3;
    float _2801 = (*spvDescriptorSet0.vp_c9)._m0[int(_2797)][_2799];
    int _2803 = int(_2795) + 1;
    uint _2805 = uint(int(uint(_2803) >> uint(2)));
    int _2807 = _2803 & 3;
    float _2809 = (*spvDescriptorSet0.vp_c9)._m0[int(_2805)][_2807];
    int _2811 = ~_2757;
    int _2813 = _2811 + 1;
    int _2815 = _2813 + 1;
    int _2817 = _1571 * _2787;
    int _2819 = _2817 + _2255;
    float _2821 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2789);
    float _2823 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2825 = !_1493;
    int _2827 = _2825 ? _2781 : (-1);
    int _2829 = _2815;
    if (!_2777)
    {
        int _2831 = ~_2757;
        int _2833 = _2831 + 1;
        _2829 = _2833;
    }
    int _2835 = _2829;
    float _2837 = _2823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2839 = _2073 != 3;
    float _2841 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2821);
    int _2843 = abs(_2835);
    out.m_94.x = _2837;
    out.m_94.y = _2747;
    out.m_94.z = _2755;
    out.m_94.w = _2583;
    int _2845 = ~_2791;
    int _2847 = _2845 + 1;
    int _2849 = _2847 + 1;
    bool _2851 = !_2745;
    int _2853 = _2851 ? 0 : 1;
    bool _2855 = uint(_2743) >= 2u;
    int _2857 = abs(_2715);
    int _2859 = _2849 * as_type<int>(_2703);
    int _2861 = ~_2843;
    int _2863 = _2861 + 1;
    int _2865 = _2863 + 1;
    int _2867 = ~_2857;
    int _2869 = _2867 + 1;
    int _2871 = _2869 + 1;
    bool _2873 = !_2181;
    int _2875 = _2873 ? _2819 : (-1);
    float _2877 = _1765 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2879 = _2855 ? 0 : 1;
    int _2881 = _2871 * as_type<int>(_2695);
    int _2883 = _2881 + _2859;
    bool _2885 = _2743 != 3;
    int _2887 = _2865 * as_type<int>(_2731);
    int _2889 = abs(_2853);
    int _2891 = abs(_2643);
    float _2893 = abs(_593);
    float _2895 = log2(_2893);
    bool _2897 = !_2229;
    int _2899 = _2897 ? 0 : 1;
    int _2901 = ~_2889;
    int _2903 = _2901 + 1;
    int _2905 = _2903 + 1;
    int _2907 = ~_2879;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    bool _2913 = !_2233;
    int _2915 = _2913 ? 0 : 1;
    int _2917 = _2905 * as_type<int>(_2723);
    int _2919 = _2917 + _2887;
    bool _2921 = _2743 != 3;
    int _2923 = _2911;
    if (_2885)
    {
        int _2925 = ~_2879;
        int _2927 = _2925 + 1;
        _2923 = _2927;
    }
    int _2929 = _2923;
    int _2931 = abs(_2899);
    float _2933 = _2895 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2935 = !_2839;
    int _2937 = _2935 ? 0 : (-1);
    int _2939 = abs(_2915);
    int _2941 = abs(_2929);
    float _2943 = exp2(_2933);
    bool _2945 = !_2921;
    int _2947 = _2945 ? 0 : (-1);
    int _2949 = ~_2891;
    int _2951 = _2949 + 1;
    int _2953 = _2951 + 1;
    int _2955 = abs(_2937);
    int _2957 = abs(_2947);
    int _2959 = _2953 * as_type<int>(_2767);
    int _2961 = _2959 + _2883;
    int _2963 = ~_2941;
    int _2965 = _2963 + 1;
    int _2967 = _2965 + 1;
    int _2969 = ~_2955;
    int _2971 = _2969 + 1;
    int _2973 = _2971 + 1;
    int _2975 = _2967 * as_type<int>(_2801);
    int _2977 = _2975 + _2919;
    int _2979 = ~_2957;
    int _2981 = _2979 + 1;
    int _2983 = _2981 + 1;
    int _2985 = _2973 * as_type<int>(_2775);
    int _2987 = _2985 + _2961;
    int _2989 = _2983 * as_type<int>(_2809);
    int _2991 = _2989 + _2977;
    int _2993 = ~_2939;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    int _2999 = ~_2931;
    int _3001 = _2999 + 1;
    int _3003 = _3001 + 1;
    float _3005 = fma(_2943, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3007 = precise::clamp(_3005, 0.0, 1.0);
    bool _3009 = _593 <= 8000.0;
    bool _3011 = isnan(_593);
    bool _3013 = _3009 || _3011;
    bool _3015 = isnan(8000.0);
    bool _3017 = _3013 || _3015;
    float _3019 = float(_3017);
    int _3021 = _2991 * _2997;
    bool _3023 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3025 = isnan(_1853);
    bool _3027 = _3023 || _3025;
    bool _3029 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3031 = _3027 || _3029;
    int _3033 = _2987 * _3003;
    float _3035 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2841);
    int _3037 = _2875 * _2939;
    int _3039 = _3037 + _3021;
    float _3041 = _1290 * 0.5;
    int _3043 = _2827 * _2931;
    int _3045 = _3043 + _3033;
    float _3047 = _1332 + _1290;
    out.gl_Position.x = _1332;
    out.gl_Position.y = _1310;
    out.gl_Position.z = _3035;
    out.gl_Position.w = _1290;
    float _3049 = fma(_1310, -0.5, _3041);
    float _3051 = _3035 + _1290;
    float _3053 = float(_3045);
    float _3055 = _3047 * 0.5;
    float _3057 = float(_3039);
    float _3059 = fma(_3007, -2.0, 3.0);
    float _3061 = _3007 * _3007;
    out.m_96.x = _3053;
    float _3063 = _3051 * 0.5;
    float _3065 = _3061 * _3059;
    out.m_96.z = _3057;
    float _3067 = -_2115;
    float _3069 = _3067 + 1.0;
    float _3071 = _1290;
    float _3073 = _3063;
    float _3075 = _3049;
    float _3077 = _3055;
    if (!_1264)
    {
        _1318 = 1.0;
    }
    float _3079 = _1318;
    float _3081 = -_3065;
    float _3083 = _3081 + 1.0;
    float _3085 = _3079;
    if (_1264)
    {
        bool _3087 = _1358 >= _1336;
        bool _3089 = isnan(_1358);
        bool _3091 = _3087 || _3089;
        bool _3093 = isnan(_1336);
        bool _3095 = _3091 || _3093;
        float _3097 = float(_3095);
        _3085 = _3097;
    }
    float _3099 = _3085;
    float _3101 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3103 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3105 = fma(_3083, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3065);
    out.m_98.x = _3055;
    out.m_98.y = _3049;
    out.m_98.z = _3063;
    out.m_98.w = _1290;
    float _3107 = _3099 * _1831;
    float _3109 = _3101 * _1360;
    float _3111 = _3019 * _3105;
    float _3113 = -_3101;
    float _3115 = _3113 + 1.0;
    if (!_3031)
    {
        _1296 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3117 = _1296;
    float _3119 = _1371 * _3109;
    float _3121 = _3111 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3123 = _2071 * _3109;
    float _3125 = _1371 * _3115;
    float _3127 = fma(_2067, _3119, _1365);
    float _3129 = _2109 * _3121;
    float _3131 = precise::clamp(_3129, 0.0, 1.0);
    float _3133 = fma(_2069, _3119, _1367);
    float _3135 = fma(_1371, _3123, _1369);
    float _3137 = _2305 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3139 = -_3131;
    float _3141 = fma(_3139, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3143 = _3121;
    float _3145 = _3117;
    float _3147 = _3117;
    if (!_3031)
    {
        _3143 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3149 = _3143;
    out.m_100.x = _3127;
    out.m_100.y = _3133;
    out.m_100.z = _3135;
    out.m_100.w = _3125;
    float _3151 = -_3107;
    float _3153 = fma(_3151, _3141, 1.0);
    float _3155 = precise::clamp(_3153, 0.0, 1.0);
    float _3157 = _3149;
    float _3159 = _3149;
    if (!_3031)
    {
        _3071 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3161 = _3071;
    float _3163 = _3161;
    float _3165 = _3161;
    if (!_3031)
    {
        _3073 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3167 = _3073;
    float _3169 = _3155 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3171 = _2309 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3173 = _3167;
    float _3175 = _3167;
    if (!_3031)
    {
        _3075 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3177 = _3075;
    float _3179 = _3177;
    float _3181 = _3177;
    if (!_3031)
    {
        _3077 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3183 = _3077;
    out.m_102.x = _3169;
    out.m_104.x = _3137;
    out.m_104.y = _3171;
    out.m_104.z = _3103;
    bool _3185 = !_3031;
    float _3187 = _3183;
    float _3189 = _3183;
    if (!_3185)
    {
        bool _3191 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3193 = isnan(_1853);
        bool _3195 = _3191 || _3193;
        bool _3197 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3199 = _3195 || _3197;
        if (!_3199)
        {
            float _3201 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3203 = _1853 + _3201;
            float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3207 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3205;
            float _3209 = 1.0 / _3207;
            float _3211 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3219 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3221 = _3219 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3223 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3225 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3227 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3229 = _3227 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3231 = _3203 * _3209;
            float _3233 = precise::clamp(_3231, 0.0, 1.0);
            float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3239 = fma(_3233, _3213, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3241 = fma(_3233, _3237, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3243 = fma(_3233, _3217, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3245 = fma(_3233, _3221, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3247 = fma(_3233, _3225, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3249 = fma(_3233, _3229, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3165 = _3241;
            _3189 = _3247;
            _3159 = _3239;
            _3181 = _3245;
            _3175 = _3243;
            _3147 = _3249;
            _3251 = true;
        }
        else
        {
            bool _3253 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3255 = isnan(_1853);
            bool _3257 = _3253 || _3255;
            bool _3259 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3261 = _3257 || _3259;
            if (!_3261)
            {
                _3157 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3263 = _3157;
            _3159 = _3263;
            if (!_3261)
            {
                _3163 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3265 = _3163;
            _3165 = _3265;
            if (!_3261)
            {
                _3173 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3267 = _3173;
            _3175 = _3267;
            if (!_3261)
            {
                _3179 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3269 = _3179;
            _3181 = _3269;
            if (!_3261)
            {
                _3187 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3271 = _3187;
            _3189 = _3271;
            if (!_3261)
            {
                _3145 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3273 = _3145;
            bool _3275 = !_3261;
            _3147 = _3273;
            if (!_3275)
            {
                bool _3277 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3279 = isnan(_1853);
                bool _3281 = _3277 || _3279;
                bool _3283 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3285 = _3281 || _3283;
                if (!_3285)
                {
                    float _3287 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3289 = _1853 + _3287;
                    float _3291 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3293 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3291;
                    float _3295 = 1.0 / _3293;
                    float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3299 = _3297 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3301 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3303 = _3301 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3305 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3307 = _3305 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3309 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3311 = _3309 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3313 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3315 = _3313 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3317 = _3289 * _3295;
                    float _3319 = precise::clamp(_3317, 0.0, 1.0);
                    float _3321 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3325 = fma(_3319, _3299, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3327 = fma(_3319, _3323, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3329 = fma(_3319, _3303, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3331 = fma(_3319, _3307, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3333 = fma(_3319, _3311, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3335 = fma(_3319, _3315, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3165 = _3327;
                    _3189 = _3333;
                    _3159 = _3325;
                    _3181 = _3331;
                    _3175 = _3329;
                    _3147 = _3335;
                    _3251 = true;
                }
                else
                {
                    _3165 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3189 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3159 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3181 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3175 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3147 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3251 = false;
    float _3337 = _3165;
    float _3339 = _3189;
    float _3341 = _3159;
    float _3343 = _3181;
    float _3345 = _3175;
    float _3347 = _3147;
    float _3349 = _2877 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3351 = fma(_3171, -0.5, 0.5);
    float _3353 = precise::clamp(_3351, 0.0, 1.0);
    float _3355 = -_3337;
    float _3357 = _3355 + _3339;
    float _3359 = -_3341;
    float _3361 = _3359 + _3343;
    out.m_63.x = _3349;
    float _3363 = fma(_3353, _3357, _3337);
    float _3365 = -_3345;
    float _3367 = _3365 + _3347;
    float _3369 = fma(_3353, _3361, _3341);
    float _3371 = _3363 * 0.586610972881317138671875;
    bool _3373 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3375 = fma(_3353, _3367, _3345);
    out.m_106.x = 0.0;
    float _3377 = fma(_3369, 0.298911988735198974609375, _3371);
    bool _3379 = _1765 > 0.0;
    bool _3381 = isnan(_1765);
    bool _3383 = _3379 || _3381;
    bool _3385 = isnan(0.0);
    bool _3387 = _3383 || _3385;
    float _3389 = fma(_3375, 0.114477999508380889892578125, _3377);
    float _3391 = -_3389;
    float _3393 = _3369 + _3391;
    float _3395 = -_3389;
    float _3397 = _3363 + _3395;
    float _3399 = -_3389;
    float _3401 = _3375 + _3399;
    float _3403 = fma(_3393, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3389);
    float _3405 = fma(_3397, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3389);
    float _3407 = fma(_3401, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3389);
    bool _3409 = !_3373;
    if (!_3409)
    {
        float _3411 = -_1186;
        float _3413 = _3411 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3415 = -_1188;
        float _3417 = _3415 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3419 = -_1190;
        float _3421 = _3419 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3423 = _3413 * _3413;
        float _3425 = fma(_3417, _3417, _3423);
        float _3427 = fma(_3421, _3421, _3425);
        float _3429 = sqrt(_3427);
        float _3431 = rsqrt(_3427);
        float _3433 = -_3429;
        float _3435 = _3433 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3437 = _3435 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3439 = precise::clamp(_3437, 0.0, 1.0);
        float _3441 = _3417 * _3431;
        float _3443 = _3413 * _3431;
        float _3445 = abs(_3439);
        float _3447 = log2(_3445);
        float _3449 = _3421 * _3431;
        float _3451 = _3441 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3453 = _3171 * _3443;
        float _3455 = -_3443;
        float _3457 = -_3451;
        float _3459 = fma(_3455, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3457);
        float _3461 = fma(_3137, _3441, _3453);
        float _3463 = -_3449;
        float _3465 = fma(_3463, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3459);
        float _3467 = fma(_3103, _3449, _3461);
        float _3469 = precise::clamp(_3467, 0.0, 1.0);
        float _3471 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3473 = _3465 + _3471;
        float _3475 = _3447 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3477 = _3473 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3479 = precise::clamp(_3477, 0.0, 1.0);
        float _3481 = exp2(_3475);
        float _3483 = _3481 * _3479;
        float _3485 = _3469 * _3483;
        float _3487 = _3485 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3489 = _3485 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3491 = _3485 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _3487;
        out.m_106.y = _3489;
        out.m_106.z = _3491;
    }
    out.m_108.x = _3403;
    out.m_108.y = _3405;
    out.m_108.z = _3407;
    if (_3387)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_63.x = 0.0;
    float _3493 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3493;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

