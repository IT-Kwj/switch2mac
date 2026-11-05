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
    float4 m_72 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_102 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_82 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_88 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_94 [[user(locn12)]];
    float4 m_84 [[user(locn13)]];
    float4 m_100 [[user(locn14)]];
    float4 m_96 [[user(locn15)]];
    float4 m_98 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_70 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4963 = false;
    bool _507 = false;
    bool _361 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_56.w;
    float _118 = in.m_58.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = _118;
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_63.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5273 = as_type<float>(_145);
        out.gl_Position.z = _5273;
    }
    if (!_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = float(_123);
    bool _161 = _127 >= _159;
    bool _163 = !_157;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _135;
    if (_165)
    {
        out.m_63.x = 0.0;
    }
    float _171 = _127 * _167;
    float _173 = _171;
    if (_165)
    {
        float _175 = _169 * 5.0;
        _147 = as_type<int>(_175);
    }
    int _177 = _147;
    out.m_61.x = _171;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5336 = as_type<float>(_177);
        out.gl_Position.z = _5336;
    }
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = as_type<int>(_179) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_179) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_181;
    float _217;
    if (!_199)
    {
        float _201 = in.m_68.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        _217 = _171;
    }
    _219 = false;
    float _221 = _217;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = _221 + _223;
    bool _227 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _229 = isnan(_221);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    bool _239 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _241 = isnan(_221);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = -_237;
    float _261 = _259 + 1.0;
    float _263 = 1.0 / _253;
    bool _265 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _267 = isnan(_221);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = _249 * _261;
    float _279 = -_249;
    float _281 = _279 + 1.0;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _285 = _275 * _281;
    float _287 = 1.0 / _257;
    float _289 = -_275;
    float _291 = _289 + 1.0;
    float _293 = _225 * _263;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _221 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _303;
    float _307 = fma(_301, _293, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _309 = fma(_305, _293, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _311 = _297 * _287;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _317 = _307 * _285;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = _309 * _285;
    float _325 = fma(_315, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _327 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[143].x, _317);
    float _329 = fma(_321, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _331 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[143].y, _323);
    float _333 = fma(_325, _277, _327);
    float _335 = fma(_329, _277, _331);
    float _337 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[145].x, _333);
    float _339 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[145].y, _335);
    bool _341 = !_283;
    float _359;
    if (!_341)
    {
        float _343 = in.m_68.x;
        float _345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _347 = _343 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _351 = _349 * _345;
        float _353 = floor(_351);
        float _355 = -_353;
        float _357 = _351 + _355;
        _359 = _357;
        _361 = true;
    }
    else
    {
        _359 = _171;
    }
    _361 = false;
    float _363 = _359;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _373 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _375 = isnan(_363);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _389 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _391 = isnan(_363);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _401;
    bool _405 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _407 = isnan(_363);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = 1.0 / _371;
    float _419 = -_383;
    float _421 = _419 + 1.0;
    bool _423 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _425 = _399 * _421;
    float _427 = -_399;
    float _429 = _427 + 1.0;
    float _431 = 1.0 / _387;
    float _433 = _403 * _417;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _439 = fma(_433, _367, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _441 = _437 * _431;
    float _443 = _439 * _425;
    float _445 = -_415;
    float _447 = _445 + 1.0;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _451 = _363 + _449;
    float _453 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[115].x, _443);
    float _455 = _383 * _447;
    float _457 = fma(_441, _451, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _461 = in.m_70.x;
    float _463 = in.m_70.y;
    float _465 = fma(_457, _455, _453);
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _469 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[117].x, _465);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _475 = _467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _477 = _471 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _479 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _469;
    out.m_72.y = _479;
    out.m_72.z = _475;
    out.m_72.w = _477;
    float _481 = _339 * _463;
    float _483 = _337 * _461;
    bool _485 = !_423;
    int _487 = as_type<int>(_477);
    float _505;
    if (!_485)
    {
        float _489 = in.m_68.x;
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _493 = _489 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _505 = _503;
        _507 = true;
    }
    else
    {
        _505 = _171;
    }
    _507 = false;
    float _509 = _505;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _513 = _509 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _519 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _521 = isnan(_509);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _535 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _537 = isnan(_509);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _547;
    bool _551 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _553 = isnan(_509);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = 1.0 / _517;
    float _565 = -_529;
    float _567 = _565 + 1.0;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _571 = _509 + _569;
    bool _573 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _575 = _545 * _567;
    float _577 = -_545;
    float _579 = _577 + 1.0;
    float _581 = 1.0 / _533;
    float _583 = _549 * _563;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _589 = fma(_583, _513, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _591 = _587 * _581;
    float _593 = -_561;
    float _595 = _593 + 1.0;
    float _597 = _589 * _575;
    float _599 = fma(_591, _571, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _601 = _529 * _595;
    float _603 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[131].x, _597);
    float _605 = fma(_599, _601, _603);
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _613 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[133].x, _605);
    float _615 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _619 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _621 = _613 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _615;
    out.m_74.y = _617;
    out.m_74.z = _619;
    out.m_74.w = _621;
    bool _623 = !_573;
    int _625 = as_type<int>(_615);
    if (!_623)
    {
        float _627 = in.m_68.x;
        float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _631 = _627 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _635 = _633 * _629;
        float _637 = floor(_635);
        float _639 = -_637;
        float _641 = _635 + _639;
        _173 = _641;
    }
    float _643 = _173;
    float _645 = in.m_56.x;
    float _647 = in.m_56.y;
    float _649 = in.m_56.z;
    float _651 = _647 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _653 = _647 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c10)._m0[4].x, _651);
    float _657 = fma(_645, (*spvDescriptorSet0.vp_c10)._m0[6].x, _653);
    float _659 = fma(_649, (*spvDescriptorSet0.vp_c10)._m0[4].z, _655);
    float _661 = fma(_649, (*spvDescriptorSet0.vp_c10)._m0[6].z, _657);
    float _663 = _659 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _665 = _661 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _667 = fma(_663, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _669 = fma(_665, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _671 = floor(_667);
    float _673 = floor(_669);
    float _675 = -_671;
    float _677 = _667 + _675;
    float _679 = -_673;
    float _681 = _669 + _679;
    float2 _6173 = float2(_677, _681);
    float _683 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6173, float2(0.0), isnan(_6173)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6173, float2(0.0), isnan(_6173)), level(0.0)).x;
    float _685 = in.m_68.z;
    float _687 = in.m_68.w;
    int _689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _691 = _689 != 0;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _695 = _671;
    float _697 = _669;
    float _699 = _667;
    float _701 = _681;
    float _703 = _665;
    if (_691)
    {
        float _705 = in.m_68.x;
        float _707 = in.m_68.y;
        _693 = _705;
        _695 = _707;
    }
    float _709 = _693;
    float _711 = _695;
    if (_691)
    {
        _625 = 0;
    }
    int _713 = _625;
    int _715 = _713;
    if (_691)
    {
        _487 = 0;
    }
    int _717 = _487;
    float _719 = 0.0;
    int _721 = _717;
    if (_691)
    {
        _719 = 1.0;
    }
    float _723 = _719;
    float _725 = _685 * 2.0;
    float _727 = 0.0;
    float _729 = _723;
    float _731 = _687;
    if (_691)
    {
        _727 = 1.0;
    }
    float _733 = _727;
    float _735 = floor(_725);
    float _737 = _709;
    float _739 = _711;
    float _741 = _733;
    if (_691)
    {
        _697 = _709;
    }
    float _743 = _697;
    float _745 = _743;
    if (_691)
    {
        _699 = _711;
    }
    float _747 = _699;
    bool _749 = _735 > 0.0;
    bool _751 = _735 >= 0.0;
    bool _753 = isnan(_735);
    bool _755 = _751 || _753;
    bool _757 = isnan(0.0);
    bool _759 = _755 || _757;
    float _761 = _735;
    float _763 = _747;
    if (_691)
    {
        _701 = _743;
    }
    float _765 = _701;
    float _767 = _765;
    if (_691)
    {
        _761 = _743;
    }
    float _769 = _761;
    float _771 = _769;
    if (!_691)
    {
        float _773 = in.m_68.x;
        float _775 = in.m_68.y;
        float _777 = in.m_68.z;
        float _779 = _773 * 3.1415927410125732421875;
        float _781 = _779 * 0.15915493667125701904296875;
        float _783 = _775 * 3.1415927410125732421875;
        float _785 = _783 * 0.15915493667125701904296875;
        float _787 = _781 * 6.283185482025146484375;
        float _789 = sin(_787);
        float _791 = _785 * 6.283185482025146484375;
        float _793 = sin(_791);
        _737 = _773;
        _739 = _775;
        _767 = _789;
        _763 = _793;
        _715 = 1;
        _721 = 2;
        _741 = 5.839270114898681640625;
        _771 = _777;
        _729 = 7.345489978790283203125;
        _745 = _775;
    }
    float _795 = _737;
    float _797 = _739;
    float _799 = _767;
    float _801 = _763;
    int _803 = _715;
    int _805 = _721;
    float _807 = _741;
    float _809 = _771;
    float _811 = _729;
    float _813 = _745;
    float _815 = _795 * 2.0;
    float _817 = _647 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _819 = _797 * 2.0;
    float _821 = fma(_645, (*spvDescriptorSet0.vp_c10)._m0[5].x, _817);
    float _823 = floor(_815);
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _827 = fma(_649, (*spvDescriptorSet0.vp_c10)._m0[5].z, _821);
    float _829 = _795 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _831 = _759 ? 0 : 1;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _835 = -_825;
    float _837 = fma(_829, 2.0, _835);
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _841 = _799 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _843 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[93].w, _833);
    int _845 = ~_831;
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _853 = _801 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _855 = -_839;
    float _857 = fma(_841, 2.0, _855);
    bool _859 = _823 > 0.0;
    float _861 = _827 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _863 = _823 >= 0.0;
    bool _865 = isnan(_823);
    bool _867 = _863 || _865;
    bool _869 = isnan(0.0);
    bool _871 = _867 || _869;
    float _873 = fma(_853, -2.0, _851);
    int _875 = _849;
    float _877 = as_type<float>(_803);
    float _879 = _827;
    float _881 = _861;
    if (!_749)
    {
        int _883 = ~_831;
        int _885 = _883 + 1;
        _875 = _885;
    }
    int _887 = _875;
    float _889 = _797 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _891 = _871 ? 0 : 1;
    float _893 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _895 = log2(_893);
    bool _897 = _803 != 1;
    float _899 = _861 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _901 = _805 != 2;
    float _903 = _797 + _795;
    float _905 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[10].x, _899);
    bool _907 = _685 > 0.5;
    float _909 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _911 = int(_909);
    int _913 = ~_891;
    int _915 = _913 + 1;
    int _917 = _915 + 1;
    float _919 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[10].z, _905);
    int _921 = _917;
    float _923 = _889;
    if (!_859)
    {
        int _925 = ~_891;
        int _927 = _925 + 1;
        _921 = _927;
    }
    int _929 = _921;
    float _931 = _861 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _935 = _933 != 0;
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _939 = _937 != 0;
    int _941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _943 = _941 != 0;
    float _945 = _919 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _947 = _797 > 0.5;
    float _949 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[11].x, _931);
    float _951 = _895 * _127;
    float _953 = -_193;
    int _955 = _947 ? as_type<int>(_953) : as_type<int>(_193);
    float _957 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[11].z, _949);
    float _959 = -_197;
    int _961 = _907 ? as_type<int>(_959) : as_type<int>(_197);
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _965 = _957 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _967 = !_939;
    float _969 = _967 ? _193 : as_type<float>(_955);
    float _971 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[93].z, _963);
    float _973 = floor(_819);
    float _975 = _903 + (-1.0);
    int _977 = int(_897);
    int _979 = _901 ? 2 : 0;
    int _981 = _977 | _979;
    int _983 = _947 ? 4 : 0;
    int _985 = _981 | _983;
    int _987 = _935 ? 8 : 0;
    int _989 = _985 | _987;
    int _991 = _939 ? 16 : 0;
    int _993 = _989 | _991;
    int _995 = _943 ? 32 : 0;
    int _997 = _993 | _995;
    int _999 = _907 ? 64 : 0;
    int _1001 = _997 | _999;
    int _1003 = _1001 & 64;
    float _1005 = _797 + _685;
    bool _1007 = !_943;
    float _1009 = _1007 ? _197 : as_type<float>(_961);
    float _1011 = _945 + _965;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1015 = _1013 != 0;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1023 = _1021 != 0;
    float _1025 = _1005 + (-1.0);
    float _1027 = 1.0 / _965;
    float _1029 = _167 * _127;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1033 = !_1019;
    float _1035 = _1033 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1037 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1039 = !_1015;
    int _1041 = _1039 ? 0 : 1;
    float _1043 = fma(_889, -2.0, _1031);
    bool _1045 = !_1023;
    int _1047 = _1045 ? 0 : 1;
    float _1049 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1053 = _1051 != 0;
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1061 = _1059 != 0;
    float _1063 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1065 = int(_1063);
    float _1067 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1043);
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _1071 = _949;
    float _1073 = _1035;
    if (!_897)
    {
        _923 = _685;
    }
    float _1075 = _923;
    float _1077 = _1011 * _1027;
    float _1079 = _1077 * 0.5;
    float _1081 = _1075;
    if (!_897)
    {
        _877 = _685;
    }
    float _1083 = _877;
    float _1085 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _843);
    float _1087 = _1083;
    if (!_897)
    {
        _1069 = _797;
    }
    float _1089 = _1069;
    float _1091 = exp2(_951);
    float _1093 = 0.0;
    float _1095 = _1089;
    if (!_897)
    {
        _1093 = _797;
    }
    float _1097 = _1093;
    float _1099 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _971);
    float _1101 = _1097;
    if (_901)
    {
        _879 = _797;
    }
    float _1103 = _879;
    float _1105 = -_127;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[76].x, _837);
    float _1109 = _1103;
    if (_901)
    {
        _1071 = _795;
    }
    float _1111 = _1071;
    float _1113 = -_127;
    float _1115 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[91].x, _857);
    bool _1117 = !_1057;
    int _1119 = _1117 ? 0 : 1;
    float _1121 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _873);
    bool _1123 = !_1053;
    int _1125 = _1123 ? 0 : 1;
    float _1127 = _481 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1129 = !_1061;
    int _1131 = _1129 ? 0 : 1;
    float _1133 = _483 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1135 = _1111;
    if (_897)
    {
        _1081 = _797;
    }
    float _1137 = _1081;
    if (_897)
    {
        _1087 = _797;
    }
    float _1139 = _1087;
    float _1141 = -_1091;
    float _1143 = _1141 + 1.0;
    if (_897)
    {
        _1095 = _795;
    }
    float _1145 = _1095;
    float _1147 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_897)
    {
        _1101 = _795;
    }
    float _1149 = _1101;
    if (!_901)
    {
        _1135 = _685;
    }
    float _1151 = _1135;
    if (!_901)
    {
        _1109 = _795;
    }
    float _1153 = _1109;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1157 = _1155 != 0;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1161 = _1159 != 0;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1165 = _1163 != 0;
    bool _1167 = _973 > 0.0;
    float _1169 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1171 = _973 >= 0.0;
    bool _1173 = isnan(_973);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan(0.0);
    bool _1179 = _1175 || _1177;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1183 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1181);
    float _1185 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1187 = int(_1185);
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1193 = !_1157;
    int _1195 = _1193 ? 0 : 1;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1199 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1189);
    float _1201 = fma(_1147, -2.0, _1191);
    float _1203 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1205 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1207 = abs(_1195);
    float _1209 = -_1197;
    float _1211 = fma(_1203, 2.0, _1209);
    float _1213 = float(_887);
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1217 = float(_1207);
    float _1219 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1199);
    float _1221 = float(_1187);
    float _1223 = fma(_1169, -2.0, _1215);
    float _1225 = float(_911);
    float _1227 = _1217 * _1213;
    float _1229 = in.m_76.x;
    float _1231 = in.m_76.y;
    float _1233 = in.m_76.z;
    float _1235 = 1.0 / _1221;
    float _1237 = _1227 * (-2.0);
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1241 = float(_1065);
    float _1243 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1245 = 1.0 / _1225;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1249 = 1.0 + _1247;
    int _1251 = int(_1167);
    int _1253 = _1179 ? 2 : 0;
    int _1255 = _1251 | _1253;
    int _1257 = _947 ? 4 : 0;
    int _1259 = _1255 | _1257;
    int _1261 = _935 ? 8 : 0;
    int _1263 = _1259 | _1261;
    int _1265 = _1157 ? 16 : 0;
    int _1267 = _1263 | _1265;
    int _1269 = _1161 ? 32 : 0;
    int _1271 = _1267 | _1269;
    int _1273 = _1165 ? 64 : 0;
    int _1275 = _1271 | _1273;
    int _1277 = _1275 & 4;
    float _1279 = -_1239;
    float _1281 = fma(_1205, 2.0, _1279);
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1285 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1283);
    bool _1287 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1289 = isnan(0.0);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1295 = _1291 || _1293;
    float _1297 = _861 + _1243;
    float _1299 = 1.0 / _1241;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1303 = _1235 * _127;
    float _1305 = _1297 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1309 = !_1161;
    int _1311 = _1309 ? 0 : 1;
    float _1313 = 1.0 / _1249;
    float _1315 = _1295 ? _1143 : 0.0;
    float _1317 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1307);
    bool _1319 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1321 = isnan(1.0);
    bool _1323 = _1319 || _1321;
    bool _1325 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1327 = _1323 || _1325;
    float _1329 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1301);
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1333 = fma(_663, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1305);
    float _1335 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1317);
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1339 = abs(_1311);
    float _1341 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1331);
    float _1343 = fma(_665, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1333);
    float _1345 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1337);
    float _1347 = float(_929);
    float _1349 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1341);
    float _1351 = float(_1339);
    float _1353 = _1343 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1355 = _1245 * _127;
    float _1357 = _1299 * _127;
    float _1359 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1329);
    float _1361 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1345);
    float _1363 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1183);
    float _1365 = -_127;
    float _1367 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1211);
    float _1369 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1201);
    float _1371 = -_127;
    float _1373 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1281);
    float _1375 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1223);
    float _1377 = as_type<float>(_1277);
    if (_1327)
    {
        float _1379 = _1315 * _1313;
        _137 = _1379;
    }
    float _1381 = _137;
    float _1383 = _1351 * _1347;
    float _1385 = _795 + (-0.5);
    float _1387 = fma(_1237, _1229, _1229);
    int _1389 = _1179 ? 0 : 1;
    float _1391 = _1383 * (-2.0);
    float _1393 = 1.0 / _1285;
    float _1395 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1387);
    bool _1397 = !_1165;
    int _1399 = _1397 ? 0 : 1;
    float _1401 = fma(_1037, _1391, _1037);
    int _1403 = ~_1389;
    int _1405 = _1403 + 1;
    int _1407 = _1405 + 1;
    float _1409 = fma(_1391, _1231, _1231);
    int _1411 = _1407;
    if (!_1167)
    {
        int _1413 = ~_1389;
        int _1415 = _1413 + 1;
        _1411 = _1415;
    }
    int _1417 = _1411;
    float _1419 = _797 + (-0.5);
    int _1421 = abs(_1399);
    float _1423 = _1297 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1425 = float(_1417);
    float _1427 = fma(_1049, _1237, _1049);
    float _1429 = float(_1421);
    float _1431 = _795 + _685;
    float _1433 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1409);
    float _1435 = fma(_663, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1423);
    float _1437 = _1429 * _1425;
    float _1439 = _1431 + (-1.0);
    float _1441 = _685 + (-0.5);
    float _1443 = fma(_665, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1435);
    float _1445 = _1437 * (-2.0);
    float _1447 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1449 = fma(_1401, _1381, _1433);
    float _1451 = _1443 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1453 = fma(_1445, _1233, _1233);
    float _1455 = fma(_1447, _1445, _1447);
    float _1457 = fma(_1427, _1381, _1395);
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1461 = _1393 * _1459;
    float _1463 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1453);
    float _1465 = trunc(_1353);
    int _1467 = int(_1465);
    float _1469 = _1457 * 0.15915493667125701904296875;
    float _1471 = _1449 * 0.15915493667125701904296875;
    float _1473 = fma(_1455, _1381, _1463);
    bool _1475 = _1461 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1477 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    bool _1479 = _1461 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1481 = _1473 * 0.15915493667125701904296875;
    float _1483 = trunc(_1451);
    int _1485 = int(_1483);
    bool _1487 = !_1475;
    int _1489 = _1487 ? 0 : 1;
    float _1491 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1493 = _1127 * _1477;
    float _1495 = _1133 * _1491;
    float _1497 = _1469 * 6.283185482025146484375;
    float _1499 = cos(_1497);
    int _1501 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1503 = _1467 + _1501;
    int _1505 = _1503 + 1;
    int _1507 = 2;
    int _1509 = as_type<int>(_1495);
    if (!_1475)
    {
        _1507 = 1;
    }
    int _1511 = _1507;
    int _1513 = _1511;
    if (!_1479)
    {
        _1513 = _1489;
    }
    int _1515 = _1513;
    bool _1517 = _1505 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1519 = _1471 * 6.283185482025146484375;
    float _1521 = sin(_1519);
    int _1523 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1525 = _1485 + _1523;
    int _1527 = _1525 + 1;
    int _1529 = _1515 << 6;
    int _1531 = _1505 | _1527;
    int _1533 = _1529 + 96;
    uint _1536 = uint(int(uint(_1533) >> uint(2)));
    uint _1538 = uint(int(uint(int(_1536)) >> uint(2)));
    int _1540 = int(_1536) & 3;
    float _1542 = (*spvDescriptorSet0.vp_c15)._m0[int(_1538)][_1540];
    int _1544 = int(_1536) + 1;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    int _1548 = _1544 & 3;
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[int(_1546)][_1548];
    float _1552 = _1471 * 6.283185482025146484375;
    float _1554 = cos(_1552);
    bool _1556 = _1531 < 0;
    bool _1558 = _1556 || _1517;
    bool _1560 = _1527 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1562 = _1560 || _1558;
    int _1564 = _1529 + 48;
    uint _1566 = uint(int(uint(_1564) >> uint(2)));
    uint _1568 = uint(int(uint(int(_1566)) >> uint(2)));
    int _1570 = int(_1566) & 3;
    float _1572 = (*spvDescriptorSet0.vp_c15)._m0[int(_1568)][_1570];
    int _1574 = int(_1566) + 1;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    int _1578 = _1574 & 3;
    float _1580 = (*spvDescriptorSet0.vp_c15)._m0[int(_1576)][_1578];
    float _1582 = _1481 * 6.283185482025146484375;
    float _1584 = cos(_1582);
    float _1586 = _1499 * _1521;
    bool _1588 = _687 > 0.5;
    float _1590 = _1469 * 6.283185482025146484375;
    float _1592 = sin(_1590);
    float _1594 = _1499 * _1554;
    float _1596 = _1481 * 6.283185482025146484375;
    float _1598 = sin(_1596);
    float _1600 = _1499 * _1584;
    float _1602 = _1554 * _1584;
    float _1604 = _1600 * _1493;
    float _1606 = _1592 * _1521;
    float _1608 = _1592 * _1554;
    float _1610 = _1592 * _1584;
    float _1612 = _1521 * _1584;
    float _1614 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1616 = as_type<int>(_1594);
    if (!_1562)
    {
        float _1618 = floor(_1353);
        _731 = _1618;
    }
    float _1620 = _731;
    float _1622 = _1610 * _1493;
    float _1624 = fma(_1598, _1594, _1606);
    float _1626 = -_1586;
    float _1628 = fma(_1598, _1608, _1626);
    float _1630 = -_1608;
    float _1632 = fma(_1598, _1586, _1630);
    float _1634 = -_1493;
    float _1636 = _1598 * _1634;
    float _1638 = fma(_1624, _1495, _1604);
    int _1640 = _1529 + 64;
    uint _1642 = uint(int(uint(_1640) >> uint(2)));
    uint _1644 = uint(int(uint(int(_1642)) >> uint(2)));
    int _1646 = int(_1642) & 3;
    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[int(_1644)][_1646];
    int _1650 = int(_1642) + 1;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    int _1654 = _1650 & 3;
    float _1656 = (*spvDescriptorSet0.vp_c15)._m0[int(_1652)][_1654];
    float _1658 = fma(_1598, _1606, _1594);
    float _1660 = fma(_1602, _1495, _1636);
    float _1662 = fma(_1632, _1614, _1638);
    float _1664 = fma(_1628, _1495, _1622);
    if (!_1562)
    {
        int _1666 = _1527 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1668 = _1666 + _1505;
        _1616 = _1668;
    }
    int _1670 = _1616;
    float _1672 = fma(_1612, _1614, _1660);
    float _1674 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1676 = _1529 + 104;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    uint _1680 = uint(int(uint(int(_1678)) >> uint(2)));
    int _1682 = int(_1678) & 3;
    float _1684 = (*spvDescriptorSet0.vp_c15)._m0[int(_1680)][_1682];
    int _1686 = int(_1678) + 1;
    uint _1688 = uint(int(uint(_1686) >> uint(2)));
    int _1690 = _1686 & 3;
    float _1692 = (*spvDescriptorSet0.vp_c15)._m0[int(_1688)][_1690];
    float _1694 = fma(_1658, _1614, _1664);
    float _1696 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1698 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1674);
    int _1700 = 0;
    if (!_1562)
    {
        int _1702 = _1670 << 2;
        _1700 = _1702;
    }
    int _1704 = _1700;
    float _1706 = _1297 * _1580;
    float _1708 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1696);
    float _1710 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1698);
    int _1712 = _1704;
    float _1714 = _1710;
    if (!_1562)
    {
        uint _1716 = uint(int(uint(_1670) >> uint(2)));
        _1509 = int(_1716);
    }
    int _1718 = _1509;
    int _1720 = _1529 + 56;
    uint _1722 = uint(int(uint(_1720) >> uint(2)));
    uint _1724 = uint(int(uint(int(_1722)) >> uint(2)));
    int _1726 = int(_1722) & 3;
    float _1728 = (*spvDescriptorSet0.vp_c15)._m0[int(_1724)][_1726];
    int _1730 = int(_1722) + 1;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    int _1734 = _1730 & 3;
    float _1736 = (*spvDescriptorSet0.vp_c15)._m0[int(_1732)][_1734];
    if (!_1562)
    {
        int _1738 = 12 & _1704;
        _1712 = _1738;
    }
    int _1740 = _1712;
    float _1742 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1708);
    float _1744 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1746 = fma(_663, _1572, _1706);
    if (!_1562)
    {
        int _1748 = _1718 << 4;
        int _1750 = _1748 + _1740;
        _1714 = as_type<float>(_1750);
    }
    float _1752 = _1714;
    float _1754 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1756 = _665 + _1744;
    int _1758 = _1529 + 72;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
    int _1764 = int(_1760) & 3;
    float _1766 = (*spvDescriptorSet0.vp_c15)._m0[int(_1762)][_1764];
    int _1768 = int(_1760) + 1;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    int _1772 = _1768 & 3;
    float _1774 = (*spvDescriptorSet0.vp_c15)._m0[int(_1770)][_1772];
    float _1776 = _663 + _1754;
    float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1780 = _1756 + _1778;
    float _1782 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1784 = _1776 + _1782;
    float _1786 = _1780 * _1780;
    float _1788 = _1752;
    if (!_1562)
    {
        int _1790 = as_type<int>(_1752) + 400;
        uint _1792 = uint(int(uint(_1790) >> uint(2)));
        uint _1794 = uint(int(uint(int(_1792)) >> uint(2)));
        int _1796 = int(_1792) & 3;
        float _1798 = (*spvDescriptorSet0.vp_c15)._m0[int(_1794)][_1796];
        _1788 = _1798;
    }
    float _1800 = _1788;
    float _1802 = fma(_1784, _1784, _1786);
    float _1804 = _1297 * _1550;
    float _1806 = sqrt(_1802);
    float _1808 = fma(_663, _1542, _1804);
    float _1810 = -_197;
    int _1812 = _1588 ? as_type<int>(_1810) : as_type<int>(_197);
    int _1814 = _1529 + 80;
    uint _1816 = uint(int(uint(_1814) >> uint(2)));
    uint _1818 = uint(int(uint(int(_1816)) >> uint(2)));
    int _1820 = int(_1816) & 3;
    float _1822 = (*spvDescriptorSet0.vp_c15)._m0[int(_1818)][_1820];
    int _1824 = int(_1816) + 1;
    uint _1826 = uint(int(uint(_1824) >> uint(2)));
    int _1828 = _1824 & 3;
    float _1830 = (*spvDescriptorSet0.vp_c15)._m0[int(_1826)][_1828];
    bool _1832 = !_935;
    float _1834 = _1832 ? _197 : as_type<float>(_1812);
    int _1836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1838 = _1836 != 0;
    int _1840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1842 = _1840 != 0;
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1846 = _1844 != 0;
    int _1848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1850 = _1848 != 0;
    int _1852 = _1529 + 88;
    uint _1854 = uint(int(uint(_1852) >> uint(2)));
    uint _1856 = uint(int(uint(int(_1854)) >> uint(2)));
    int _1858 = int(_1854) & 3;
    float _1860 = (*spvDescriptorSet0.vp_c15)._m0[int(_1856)][_1858];
    int _1862 = int(_1854) + 1;
    uint _1864 = uint(int(uint(_1862) >> uint(2)));
    int _1866 = _1862 & 3;
    float _1868 = (*spvDescriptorSet0.vp_c15)._m0[int(_1864)][_1866];
    bool _1870 = !_1838;
    int _1872 = _1870 ? 0 : 1;
    float _1874 = fma(_665, _1684, _1808);
    float _1876 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1878 = _1297 * _1656;
    float _1880 = _1662;
    float _1882 = _1878;
    if (!_1562)
    {
        float _1884 = floor(_1451);
        _1880 = _1884;
    }
    float _1886 = _1880;
    float _1888 = _1874 + _1692;
    float _1890 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1876);
    bool _1892 = !_1842;
    int _1894 = _1892 ? 0 : 1;
    float _1896 = fma(_663, _1648, _1878);
    bool _1898 = _1806 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1900 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1890);
    float _1902 = fma(_665, _1728, _1746);
    float _1904 = 1.0 / _1888;
    bool _1906 = !_1846;
    int _1908 = _1906 ? 0 : 1;
    float _1910 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1912 = _1902 + _1736;
    float _1914 = _861 + _1910;
    float _1916 = fma(_665, _1766, _1896);
    bool _1918 = !_1850;
    int _1920 = _1918 ? 0 : 1;
    float _1922 = _1896;
    float _1924 = _1912;
    if (!_1898)
    {
        _881 = _1776;
    }
    float _1926 = _881;
    float _1928 = _1916 + _1774;
    float _1930 = _1926;
    if (!_1898)
    {
        _1882 = _1756;
    }
    float _1932 = _1882;
    float _1934 = _1932;
    if (!_1898)
    {
        _1922 = _1914;
    }
    float _1936 = _1922;
    bool _1938 = !_1898;
    float _1940 = _1936;
    if (!_1938)
    {
        float _1942 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1944 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1946 = _1806 + _1944;
        float _1948 = rsqrt(_1802);
        float _1950 = _1946 * _1942;
        float _1952 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1954 = _1950 * 0.15915493667125701904296875;
        float _1956 = _1954 * 6.283185482025146484375;
        float _1958 = cos(_1956);
        float _1960 = _1954 * 6.283185482025146484375;
        float _1962 = sin(_1960);
        float _1964 = _1958 + (-1.0);
        float _1966 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1968 = fma(_1962, _1952, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1970 = fma(_1914, _1958, _1966);
        float _1972 = _1948 * _1968;
        float _1974 = fma(_1784, _1972, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1976 = fma(_1780, _1972, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1940 = _1970;
        _1930 = _1974;
        _1934 = _1976;
    }
    float _1978 = _1940;
    float _1980 = _1930;
    float _1982 = _1934;
    float _1984 = _1928 * _1904;
    float _1986 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1988 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1990 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1992 = _1912 * _1904;
    float _1994 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1986);
    float _1996 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1988);
    float _1998 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1990);
    float _2000 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2002 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1994);
    bool _2004 = _1992 >= 0.0;
    float _2006 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1996);
    float _2008 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1998);
    float _2010 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2012 = _1992 <= 1.0;
    bool _2014 = _2012 && _2004;
    if (!_1562)
    {
        float _2016 = rint(_1800);
        float _2018 = precise::max(_2016, 0.0);
        uint _2020 = uint(_2018);
        uint _2022 = clamp(_2020, 0u, 65535u);
        _1924 = as_type<float>(_2022);
    }
    float _2024 = _1924;
    float _2026 = _2006 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2028 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2030 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2032 = _1984 >= 0.0;
    bool _2034 = _2032 && _2014;
    float _2036 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2038 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2040 = _1277 != 0;
    float _2042 = _2038;
    float _2044 = _2024;
    if (!_1562)
    {
        float _2046 = -_1886;
        float _2048 = _1451 + _2046;
        _1377 = _2048;
    }
    float _2050 = _1377;
    float _2052 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2000);
    float _2054 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2030);
    bool _2056 = _1984 <= 1.0;
    bool _2058 = _2056 && _2034;
    float _2060 = -_2038;
    float _2062 = fma(_2060, _2036, 1.0);
    float _2064 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2052);
    float _2066 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2054);
    float _2068 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2070 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2072 = log2(_2062);
    float _2074 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2066);
    float _2076 = _1297 * _1830;
    float _2078 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2080 = _2068;
    if (_2058)
    {
        float _2082 = float(_1515);
        _2042 = _2082;
    }
    float _2084 = _2042;
    float _2086 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2068);
    float _2088 = 1.0 / _2074;
    float _2090 = fma(_663, _1822, _2076);
    float _2092 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2078);
    float _2094 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2086);
    if (!_1562)
    {
        float _2096 = -_1620;
        float _2098 = _1353 + _2096;
        _2080 = _2098;
    }
    float _2100 = _2080;
    float _2102 = fma(_665, _1860, _2090);
    float _2104 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2092);
    float _2106 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2094);
    float _2108 = _2090;
    if (_2058)
    {
        float _2110 = rint(_2084);
        float _2112 = precise::max(_2110, 0.0);
        uint _2114 = uint(_2112);
        uint _2116 = clamp(_2114, 0u, 65535u);
        _2108 = as_type<float>(_2116);
    }
    float _2118 = _2108;
    float _2120 = _2102 + _1868;
    float _2122 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2104);
    float _2124 = _2072 * 0.693147182464599609375;
    float _2126 = _2120 * _1904;
    float _2128 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2130 = _2122 * _2088;
    float _2132 = _2106 * _2088;
    float _2134 = _2050;
    if (!_1562)
    {
        float3 _8485 = float3(_2100, _2050, float(as_type<int>(_2024)));
        float3 _8489 = select(_8485, float3(0.0), isnan(_8485));
        float _2136 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8489.xy, uint(rint(_8489.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8489.xy, uint(rint(_8489.z)), level(0.0)).x;
        _2134 = _2136;
    }
    float _2138 = _2134;
    float _2140 = fma(_2130, 0.5, 0.5);
    float _2142 = fma(_2132, -0.5, 0.5);
    float _2144 = _1984;
    if (_2058)
    {
        float3 _8508 = float3(_1992, _1984, float(as_type<int>(_2118)));
        float3 _8510 = select(_8508, float3(0.0), isnan(_8508));
        float _2146 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8510.xy, uint(rint(_8510.z)), _2126, level(0.0));
        _2144 = _2146;
    }
    float _2148 = _2144;
    float3 _8520 = float3(_2140, _2142, _2128);
    float _2150 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8520, float3(0.0), isnan(_8520)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8520, float3(0.0), isnan(_8520)), level(0.0)).x;
    float3 _8529 = float3(_2140, _2142, _2128);
    float4 _2153 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8529, float3(0.0), isnan(_8529)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8529, float3(0.0), isnan(_8529)), level(0.0)).xyzw;
    float _2155 = _2153.x;
    float _2157 = _2153.y;
    float _2159 = _2153.z;
    float _2161 = _2153.w;
    float _2163 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2165 = int(_2163);
    int _2167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2169 = _2167 != 0;
    float _2171 = _807 * _809;
    int _2173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2175 = _2173 != 0;
    int _2177 = abs(_1119);
    int _2179 = abs(_1125);
    float _2181 = trunc(_1355);
    int _2183 = int(_2181);
    int _2185 = abs(_1131);
    float _2187 = float(uint(_2165));
    float _2189 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2191 = int(_2189);
    int _2193 = ~_2165;
    int _2195 = _2193 + 1;
    float _2197 = _2118;
    if (_2169)
    {
        float _2199 = in.m_68.w;
        _2197 = _2199;
    }
    float _2201 = _2197;
    int _2203 = ~_2165;
    int _2205 = _2203 + 1;
    bool _2207 = _2165 == 0;
    float _2209 = 0.0;
    if (_2175)
    {
        float _2211 = in.m_68.x;
        _2209 = _2211;
    }
    float _2213 = _2209;
    float _2215 = float(uint(_2183));
    float _2217 = 1.0 / _2187;
    float _2219 = float(uint(_2191));
    float _2221 = trunc(_1303);
    int _2223 = int(_2221);
    int _2225 = as_type<int>(_2217) + (-2);
    float _2227 = 1.0 / _2219;
    float _2229 = _2201;
    if (_2169)
    {
        float _2231 = _2201 * 3.1415927410125732421875;
        _2229 = _2231;
    }
    float _2233 = _2229;
    float _2235 = as_type<float>(_2225) * _2215;
    if (_2169)
    {
        float _2237 = _2233 * 0.15915493667125701904296875;
        _2044 = _2237;
    }
    float _2239 = _2044;
    float _2241 = float(_2183);
    float _2243 = _811 * _795;
    float _2245 = trunc(_2235);
    float _2247 = precise::max(_2245, 0.0);
    uint _2249 = uint(_2247);
    float _2251 = _813 * _811;
    float _2253 = floor(_2243);
    int _2255 = _2195 * int(_2249);
    int _2257 = _2255 + _2183;
    float _2259 = _2239;
    if (_2169)
    {
        float _2261 = _2239 * 6.283185482025146484375;
        float _2263 = sin(_2261);
        _2259 = _2263;
    }
    float _2265 = _2259;
    float _2267 = float(uint(_2257));
    float _2269 = -_2253;
    float _2271 = _2243 + _2269;
    float _2273 = as_type<float>(_2225) * _2267;
    float _2275 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2277 = int(_2275);
    float _2279 = trunc(_2273);
    float _2281 = precise::max(_2279, 0.0);
    uint _2283 = uint(_2281);
    float _2285 = trunc(_1357);
    int _2287 = int(_2285);
    float _2289 = float(uint(_2277));
    int _2291 = int(_2249) + int(_2283);
    float _2293 = 1.0 / _2289;
    float _2295 = float(_2165);
    int _2297 = _2205 * _2291;
    int _2299 = _2297 + _2183;
    bool _2301 = _2241 >= _2295;
    bool _2303 = isnan(_2241);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan(_2295);
    bool _2309 = _2305 || _2307;
    float _2311 = float(_2309);
    float _2313 = _2271 * _2295;
    int _2315 = as_type<int>(_2227) + (-2);
    float _2317 = _2295 * _1029;
    float _2319 = float(uint(_2287));
    bool _2321 = uint(_2299) >= uint(_2165);
    float _2323 = trunc(_2313);
    int _2325 = int(_2323);
    float _2327 = float(_2287);
    float _2329 = as_type<float>(_2315) * _2319;
    bool _2331 = !_2321;
    int _2333 = _2331 ? 0 : (-1);
    bool _2335 = _2321;
    float _2337 = _2265;
    float _2339 = as_type<float>(_2325);
    if (_2169)
    {
        bool _2341 = _2265 > 0.5;
        _2335 = _2341;
    }
    bool _2343 = _2335;
    if (!_2169)
    {
        _2337 = _193;
    }
    float _2345 = _2337;
    float _2347 = trunc(_2311);
    int _2349 = int(_2347);
    int _2351 = ~_2291;
    int _2353 = _2351 + _2333;
    int _2355 = _2353 + 1;
    float _2357 = _2345;
    if (_2169)
    {
        float _2359 = -_193;
        float _2361 = _2343 ? _2359 : _193;
        _2357 = _2361;
    }
    float _2363 = _2357;
    bool _2365 = _1003 != 0;
    int _2367 = ~_2191;
    int _2369 = _2367 + 1;
    float _2371 = trunc(_2329);
    float _2373 = precise::max(_2371, 0.0);
    uint _2375 = uint(_2373);
    int _2377 = _2165 * _2355;
    int _2379 = _2377 + _2183;
    int _2381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2383 = _2381 != 0;
    bool _2385 = !_2383;
    int _2387 = _2385 ? 0 : 1;
    float _2389 = trunc(_2317);
    int _2391 = int(_2389);
    int _2393 = ~_2349;
    int _2395 = _2393 + 1;
    int _2397 = _2395 + 1;
    bool _2399 = !_2207;
    int _2401 = _2399 ? _2379 : (-1);
    int _2403 = abs(_2387);
    int _2405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2407 = _2405 != 0;
    int _2409 = _2369 * int(_2375);
    int _2411 = _2409 + _2287;
    int _2413 = _2401 * _2397;
    float _2415 = float(uint(_2411));
    int _2417 = _2165 + (-1);
    int _2419 = _2325 * _2403;
    int _2421 = _2419 + _2183;
    int _2423 = abs(as_type<int>(_1035));
    float _2425 = as_type<float>(_2315) * _2415;
    float _2427 = as_type<float>(_2349);
    bool _2429 = _2407;
    if (_2175)
    {
        float _2431 = _2213 * 3.1415927410125732421875;
        _1073 = _2431;
    }
    float _2433 = _1073;
    int _2435 = _2349 * _2417;
    int _2437 = _2435 + _2413;
    int _2439 = abs(_1041);
    bool _2441 = !_2407;
    int _2443 = _2441 ? 0 : 1;
    float _2445 = trunc(_2425);
    float _2447 = precise::max(_2445, 0.0);
    uint _2449 = uint(_2447);
    if (_2175)
    {
        float _2451 = _2433 * 0.15915493667125701904296875;
        _2427 = _2451;
    }
    float _2453 = _2427;
    int _2455 = abs(_1047);
    int _2457 = _2437 * _2423;
    int _2459 = abs(_2443);
    int _2461 = _2391 * _2439;
    int _2463 = _2461 + _2457;
    float _2465 = as_type<float>(_1047);
    if (_2175)
    {
        float _2467 = _2453 * 6.283185482025146484375;
        float _2469 = sin(_2467);
        _2465 = _2469;
    }
    float _2471 = _2465;
    int _2473 = ~_2165;
    int _2475 = _2473 + 1;
    int _2477 = _2421 * _2455;
    int _2479 = _2477 + _2463;
    float _2481 = float(_2191);
    int _2483 = _2325 * _2459;
    int _2485 = _2483 + _2479;
    int _2487 = int(_2375) + int(_2449);
    float _2489 = floor(_2171);
    int _2491 = ~_2191;
    int _2493 = _2491 + 1;
    float _2495 = float(uint(_2485));
    bool _2497 = _2327 >= _2481;
    bool _2499 = isnan(_2327);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan(_2481);
    bool _2505 = _2501 || _2503;
    float _2507 = float(_2505);
    if (_2175)
    {
        bool _2509 = _2471 > 0.5;
        _2429 = _2509;
    }
    bool _2511 = _2429;
    int _2513 = _2493 * _2487;
    int _2515 = _2513 + _2287;
    int _2517 = as_type<int>(_2293) + (-2);
    float _2519 = as_type<float>(_2225) * _2495;
    if (!_2175)
    {
        _2339 = _197;
    }
    float _2521 = _2339;
    float _2523 = trunc(_2507);
    int _2525 = int(_2523);
    float _2527 = float(uint(_2223));
    float _2529 = _2521;
    if (_2175)
    {
        float _2531 = -_197;
        float _2533 = _2511 ? _2531 : _197;
        _2529 = _2533;
    }
    float _2535 = _2529;
    float _2537 = -_2489;
    float _2539 = _2171 + _2537;
    bool _2541 = uint(_2515) >= uint(_2191);
    float _2543 = as_type<float>(_2517) * _2527;
    int _2545 = ~_2277;
    int _2547 = _2545 + 1;
    float _2549 = trunc(_2519);
    float _2551 = precise::max(_2549, 0.0);
    uint _2553 = uint(_2551);
    bool _2555 = !_2541;
    int _2557 = _2555 ? 0 : (-1);
    int _2559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2561 = _2559 != 0;
    int _2563 = ~_2487;
    int _2565 = _2563 + _2557;
    int _2567 = _2565 + 1;
    float _2569 = _2539 * _2481;
    bool _2571 = !_2561;
    int _2573 = _2571 ? 0 : 1;
    float _2575 = trunc(_2543);
    float _2577 = precise::max(_2575, 0.0);
    uint _2579 = uint(_2577);
    bool _2581 = _2191 == 0;
    int _2583 = _2191 * _2567;
    int _2585 = _2583 + _2287;
    int _2587 = ~_2525;
    int _2589 = _2587 + 1;
    int _2591 = _2589 + 1;
    float _2593 = _2481 * _1029;
    int _2595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2597 = _2595 != 0;
    int _2599 = _2191 + (-1);
    float _2601 = trunc(_2569);
    int _2603 = int(_2601);
    int _2605 = _2475 * int(_2553);
    int _2607 = _2605 + _2485;
    float _2609 = float(uint(_2607));
    float _2611 = trunc(_2593);
    int _2613 = int(_2611);
    int _2615 = abs(_2573);
    bool _2617 = !_2581;
    int _2619 = _2617 ? _2585 : (-1);
    float _2621 = as_type<float>(_2225) * _2609;
    int _2623 = _2619 * _2591;
    int _2625 = _2547 * int(_2579);
    int _2627 = _2625 + _2223;
    int _2629 = _2525 * _2599;
    int _2631 = _2629 + _2623;
    int _2633 = _2603 * _2615;
    int _2635 = _2633 + _2287;
    float _2637 = float(uint(_2627));
    float _2639 = trunc(_2621);
    float _2641 = precise::max(_2639, 0.0);
    uint _2643 = uint(_2641);
    bool _2645 = !_2597;
    int _2647 = _2645 ? 0 : 1;
    int _2649 = _2631 * _2177;
    float _2651 = as_type<float>(_2517) * _2637;
    int _2653 = abs(_2647);
    int _2655 = _2613 * _2179;
    int _2657 = _2655 + _2649;
    float _2659 = floor(_2251);
    int _2661 = ~_2165;
    int _2663 = _2661 + 1;
    int _2665 = _2635 * _2185;
    int _2667 = _2665 + _2657;
    int _2669 = ~_2165;
    int _2671 = _2669 + 1;
    int _2673 = ~_2191;
    int _2675 = _2673 + 1;
    int _2677 = _2603 * _2653;
    int _2679 = _2677 + _2667;
    float _2681 = trunc(_2651);
    float _2683 = precise::max(_2681, 0.0);
    uint _2685 = uint(_2683);
    int _2687 = int(_2553) + int(_2643);
    float _2689 = float(uint(_2421));
    int _2691 = ~_2277;
    int _2693 = _2691 + 1;
    int _2695 = _2671 * _2687;
    int _2697 = _2695 + _2485;
    int _2699 = ~_2191;
    int _2701 = _2699 + 1;
    float _2703 = -_2659;
    float _2705 = _2251 + _2703;
    bool _2707 = uint(_2697) >= uint(_2165);
    bool _2709 = !_2707;
    int _2711 = _2709 ? 0 : (-1);
    int _2713 = int(_2579) + int(_2685);
    float _2715 = as_type<float>(_2225) * _2689;
    float _2717 = float(uint(_2679));
    float _2719 = float(_2223);
    int _2721 = ~_2687;
    int _2723 = _2721 + _2711;
    int _2725 = _2723 + 1;
    float _2727 = as_type<float>(_2315) * _2717;
    float _2729 = trunc(_2715);
    float _2731 = precise::max(_2729, 0.0);
    uint _2733 = uint(_2731);
    int _2735 = _2693 * _2713;
    int _2737 = _2735 + _2223;
    bool _2739 = uint(_2737) >= uint(_2277);
    float _2741 = trunc(_2727);
    float _2743 = precise::max(_2741, 0.0);
    uint _2745 = uint(_2743);
    float _2747 = float(_2277);
    bool _2749 = !_2739;
    int _2751 = _2749 ? 0 : (-1);
    bool _2753 = _2719 >= _2747;
    bool _2755 = isnan(_2719);
    bool _2757 = _2753 || _2755;
    bool _2759 = isnan(_2747);
    bool _2761 = _2757 || _2759;
    float _2763 = float(_2761);
    int _2765 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2767 = _2765 != 0;
    int _2769 = _2663 * int(_2733);
    int _2771 = _2769 + _2421;
    float _2773 = _2747 * _1029;
    float _2775 = _2705 * _2747;
    float _2777 = trunc(_2763);
    int _2779 = int(_2777);
    int _2781 = _2165 * _2725;
    int _2783 = _2781 + _2485;
    float _2785 = float(uint(_2771));
    int _2787 = ~_2713;
    int _2789 = _2787 + _2751;
    int _2791 = _2789 + 1;
    int _2793 = _2675 * int(_2745);
    int _2795 = _2793 + _2679;
    float _2797 = -_197;
    int _2799 = _2040 ? as_type<int>(_2797) : as_type<int>(_197);
    float _2801 = as_type<float>(_2225) * _2785;
    int _2803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2805 = _2803 != 0;
    int _2807 = _2277 * _2791;
    int _2809 = _2807 + _2223;
    float _2811 = float(uint(_2795));
    float _2813 = trunc(_2773);
    int _2815 = int(_2813);
    float _2817 = -_193;
    int _2819 = _2365 ? as_type<int>(_2817) : as_type<int>(_193);
    bool _2821 = !_2207;
    int _2823 = _2821 ? _2783 : (-1);
    float _2825 = as_type<float>(_2315) * _2811;
    bool _2827 = !_2805;
    float _2829 = _2827 ? _193 : as_type<float>(_2819);
    int _2831 = _2823 & 3;
    bool _2833 = _2831 != 0;
    float _2835 = trunc(_2825);
    float _2837 = precise::max(_2835, 0.0);
    uint _2839 = uint(_2837);
    bool _2841 = _2277 == 0;
    bool _2843 = !_2767;
    float _2845 = _2843 ? _197 : as_type<float>(_2799);
    int _2847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2849 = _2847 != 0;
    int _2851 = _2833 ? 0 : 1;
    float _2853 = trunc(_2801);
    float _2855 = precise::max(_2853, 0.0);
    uint _2857 = uint(_2855);
    int _2859 = _2823 & 3;
    bool _2861 = _2859 != 0;
    int _2863 = ~_2779;
    int _2865 = _2863 + 1;
    int _2867 = _2865 + 1;
    bool _2869 = !_2841;
    int _2871 = _2869 ? _2809 : (-1);
    bool _2873 = !_2849;
    int _2875 = _2873 ? 0 : 1;
    float _2877 = trunc(_2775);
    int _2879 = int(_2877);
    bool _2881 = uint(_2859) > 1u;
    int _2883 = _2871 * _2867;
    int _2885 = _2277 + (-1);
    int _2887 = int(_2745) + int(_2839);
    int _2889 = abs(_1894);
    int _2891 = _2779 * _2885;
    int _2893 = _2891 + _2883;
    int _2895 = abs(_2875);
    int _2897 = _2893 * _2889;
    int _2899 = abs(_1872);
    int _2901 = ~_2851;
    int _2903 = _2901 + 1;
    int _2905 = _2903 + 1;
    int _2907 = _2905;
    if (!_2881)
    {
        int _2909 = ~_2851;
        int _2911 = _2909 + 1;
        _2907 = _2911;
    }
    int _2913 = _2907;
    int _2915 = _2701 * _2887;
    int _2917 = _2915 + _2679;
    bool _2919 = uint(_2859) >= 2u;
    int _2921 = _2879 * _2895;
    int _2923 = _2921 + _2223;
    int _2925 = _2919 ? 0 : 1;
    bool _2927 = uint(_2917) >= uint(_2191);
    int _2929 = _2815 * _2899;
    int _2931 = _2929 + _2897;
    float _2933 = float(uint(_2635));
    bool _2935 = !_2927;
    int _2937 = _2935 ? 0 : (-1);
    bool _2939 = _2859 != 3;
    float _2941 = as_type<float>(_2315) * _2933;
    int _2943 = abs(_1908);
    int _2945 = int(_2733) + int(_2857);
    float _2947 = trunc(_2941);
    float _2949 = precise::max(_2947, 0.0);
    uint _2951 = uint(_2949);
    int _2953 = ~_2165;
    int _2955 = _2953 + 1;
    int _2957 = _2923 * _2943;
    int _2959 = _2957 + _2931;
    int _2961 = ~_2887;
    int _2963 = _2961 + _2937;
    int _2965 = _2963 + 1;
    int _2967 = abs(_1920);
    int _2969 = _2955 * _2945;
    int _2971 = _2969 + _2421;
    int _2973 = ~_2925;
    int _2975 = _2973 + 1;
    int _2977 = _2975 + 1;
    int _2979 = _2191 * _2965;
    int _2981 = _2979 + _2679;
    int _2983 = _2977;
    if (_2939)
    {
        int _2985 = ~_2925;
        int _2987 = _2985 + 1;
        _2983 = _2987;
    }
    int _2989 = _2983;
    int _2991 = _2879 * _2967;
    int _2993 = _2991 + _2959;
    int _2995 = ~_2191;
    int _2997 = _2995 + 1;
    bool _2999 = uint(_2971) >= uint(_2165);
    bool _3001 = !_2581;
    int _3003 = _3001 ? _2981 : (-1);
    float _3005 = float(uint(_2993));
    bool _3007 = !_2999;
    int _3009 = _3007 ? 0 : (-1);
    float _3011 = as_type<float>(_2517) * _3005;
    int _3013 = _3003 & 3;
    bool _3015 = _3013 != 0;
    int _3017 = _2997 * int(_2951);
    int _3019 = _3017 + _2635;
    int _3021 = ~_2277;
    int _3023 = _3021 + 1;
    float _3025 = trunc(_3011);
    float _3027 = precise::max(_3025, 0.0);
    uint _3029 = uint(_3027);
    bool _3031 = !_3015;
    int _3033 = _3031 ? 0 : 1;
    int _3035 = _3003 & 3;
    bool _3037 = _3035 != 0;
    float _3039 = float(uint(_3019));
    int _3041 = _3037 ? 0 : 1;
    bool _3043 = uint(_3013) > 1u;
    float _3045 = as_type<float>(_2315) * _3039;
    float _3047 = float(uint(_2923));
    int _3049 = ~_3041;
    int _3051 = _3049 + 1;
    int _3053 = _3051 + 1;
    float _3055 = as_type<float>(_2517) * _3047;
    float _3057 = trunc(_3045);
    float _3059 = precise::max(_3057, 0.0);
    uint _3061 = uint(_3059);
    int _3063 = _3023 * int(_3029);
    int _3065 = _3063 + _2993;
    bool _3067 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3069 = isnan(0.5);
    bool _3071 = _3067 || _3069;
    bool _3073 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3075 = _3071 || _3073;
    int _3077 = _3053;
    if (!_3043)
    {
        int _3079 = ~_3041;
        int _3081 = _3079 + 1;
        _3077 = _3081;
    }
    int _3083 = _3077;
    bool _3085 = uint(_3013) >= 2u;
    float _3087 = trunc(_3055);
    float _3089 = precise::max(_3087, 0.0);
    uint _3091 = uint(_3089);
    float _3093 = float(uint(_3065));
    int _3095 = _3085 ? 0 : 1;
    bool _3097 = _3013 != 3;
    float _3099 = as_type<float>(_2517) * _3093;
    int _3101 = ~_2191;
    int _3103 = _3101 + 1;
    bool _3105 = !_3097;
    int _3107 = _3105 ? 0 : (-1);
    bool _3109 = _3013 != 3;
    float _3111 = trunc(_3099);
    float _3113 = precise::max(_3111, 0.0);
    uint _3115 = uint(_3113);
    int _3117 = ~_2277;
    int _3119 = _3117 + 1;
    int _3121 = int(_2951) + int(_3061);
    int _3123 = _3119 * int(_3091);
    int _3125 = _3123 + _2923;
    int _3127 = ~_3095;
    int _3129 = _3127 + 1;
    int _3131 = _3129 + 1;
    int _3133 = _3103 * _3121;
    int _3135 = _3133 + _2635;
    int _3137 = _3131;
    float _3139 = as_type<float>(_3119);
    if (_3109)
    {
        int _3141 = ~_3095;
        int _3143 = _3141 + 1;
        _3137 = _3143;
    }
    int _3145 = _3137;
    float _3147 = float(uint(_3125));
    bool _3149 = uint(_3135) >= uint(_2191);
    int _3151 = int(_3029) + int(_3115);
    float _3153 = as_type<float>(_2517) * _3147;
    bool _3155 = !_3149;
    int _3157 = _3155 ? 0 : (-1);
    float _3159 = trunc(_3153);
    float _3161 = precise::max(_3159, 0.0);
    uint _3163 = uint(_3161);
    int _3165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3167 = _3165 != 0;
    int _3169 = _3119 * _3151;
    int _3171 = _3169 + _2993;
    float _3173 = as_type<float>(_3115);
    if (_3075)
    {
        _3173 = 1.0;
    }
    float _3175 = _3173;
    bool _3177 = !_3167;
    int _3179 = _3177 ? 0 : 1;
    bool _3181 = uint(_3171) >= uint(_2277);
    float _3183 = _3175;
    if (_1562)
    {
        _3139 = 1.0;
    }
    float _3185 = _3139;
    bool _3187 = !_3181;
    int _3189 = _3187 ? 0 : (-1);
    bool _3191 = _795 > 0.5;
    int _3193 = int(_3091) + int(_3163);
    int _3195 = _2547 * _3193;
    int _3197 = _3195 + _2923;
    float _3199 = as_type<float>(_3163);
    float _3201 = _3185;
    float _3203 = _2148;
    if (!_3075)
    {
        float _3205 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3207 = _3205 * 0.15915493667125701904296875;
        float _3209 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3211 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3213 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3211;
        float _3215 = _3207 * 6.283185482025146484375;
        float _3217 = cos(_3215);
        float _3219 = _3209 * 0.15915493667125701904296875;
        float _3221 = _3207 * 6.283185482025146484375;
        float _3223 = sin(_3221);
        float _3225 = 1.0 / _3217;
        float _3227 = _3219 * 6.283185482025146484375;
        float _3229 = cos(_3227);
        float _3231 = _3223 * _3225;
        float _3233 = _3219 * 6.283185482025146484375;
        float _3235 = sin(_3233);
        float _3237 = _3229 * _3231;
        float _3239 = 1.0 / _3213;
        float _3241 = 1.0 / _3237;
        float _3243 = _3235 * _3241;
        float _3245 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3247 = fma(_1461, _3243, _3245);
        float _3249 = _3247 * _3239;
        float _3251 = precise::clamp(_3249, 0.0, 1.0);
        _3199 = _3213;
        _3183 = _3251;
    }
    float _3253 = _3199;
    float _3255 = _3183;
    bool _3257 = uint(_3197) >= uint(_2277);
    if (!_1562)
    {
        int _3259 = _1670 << 4;
        int _3261 = _3259 + 2048;
        uint _3263 = uint(int(uint(_3261) >> uint(2)));
        uint _3265 = uint(int(uint(int(_3263)) >> uint(2)));
        int _3267 = int(_3263) & 3;
        float _3269 = (*spvDescriptorSet0.vp_c15)._m0[int(_3265)][_3267];
        int _3271 = int(_3263) + 1;
        uint _3273 = uint(int(uint(_3271) >> uint(2)));
        int _3275 = _3271 & 3;
        float _3277 = (*spvDescriptorSet0.vp_c15)._m0[int(_3273)][_3275];
        int _3279 = _3261 + 8;
        uint _3281 = uint(int(uint(_3279) >> uint(2)));
        uint _3283 = uint(int(uint(int(_3281)) >> uint(2)));
        int _3285 = int(_3281) & 3;
        float _3287 = (*spvDescriptorSet0.vp_c15)._m0[int(_3283)][_3285];
        int _3289 = int(_3281) + 1;
        uint _3291 = uint(int(uint(_3289) >> uint(2)));
        int _3293 = _3289 & 3;
        float _3295 = (*spvDescriptorSet0.vp_c15)._m0[int(_3291)][_3293];
        float _3297 = _1297 * _3277;
        float _3299 = fma(_663, _3269, _3297);
        float _3301 = fma(_665, _3287, _3299);
        float _3303 = _3301 + _3295;
        float _3305 = precise::clamp(_3303, 0.0, 1.0);
        float _3307 = -_3305;
        float _3309 = _3307 + _2138;
        float _3311 = fma(_3309, 500.0, 1.5);
        float _3313 = exp2(_3311);
        float _3315 = 0.0 + _3313;
        float _3317 = precise::clamp(_3315, 0.0, 1.0);
        _3201 = _3317;
    }
    float _3319 = _3201;
    float _3321 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3323 = _1978 + _3321;
    float _3325 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3327 = _1980 + _3325;
    float _3329 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3331 = _1982 + _3329;
    float _3333 = _3323 * _3323;
    float _3335 = fma(_3327, _3327, _3333);
    float _3337 = fma(_3331, _3331, _3335);
    float _3339 = rsqrt(_3337);
    float _3341 = sqrt(_3337);
    float _3343 = _3339 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3345 = _3327 * _3343;
    float _3347 = _3331 * _3343;
    float _3349 = _3345 * _3345;
    float _3351 = _3347 * _3347;
    float _3353 = _3349 + _3351;
    float _3355 = sqrt(_3353);
    bool _3357 = _3355 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3359 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3361 = _3355 + _3359;
    float _3363 = _3339;
    float _3365 = _3361;
    float _3367 = _3323;
    float _3369 = _3353;
    float _3371 = _3349;
    if (_3357)
    {
        float _3373 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3363 = _3373;
    }
    float _3375 = _3363;
    float _3377 = _3375;
    if (_3357)
    {
        float _3379 = _3361 * _3375;
        _3365 = _3379;
    }
    float _3381 = _3365;
    if (_3357)
    {
        float _3383 = rsqrt(_3353);
        _3377 = _3383;
    }
    float _3385 = _3377;
    float _3387 = _3385;
    if (_3357)
    {
        float _3389 = _3381 * 0.15915493667125701904296875;
        _703 = _3389;
    }
    float _3391 = _703;
    float _3393 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3395 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_3357)
    {
        float _3397 = _3391 * 6.283185482025146484375;
        float _3399 = sin(_3397);
        _3395 = _3399;
    }
    float _3401 = _3395;
    float _3403 = precise::max(0.0, _3393);
    float _3405 = -_3343;
    float _3407 = -_3403;
    float _3409 = fma(_3323, _3405, _3407);
    float _3411 = _3403;
    if (!_3357)
    {
        _3411 = _3347;
    }
    float _3413 = _3411;
    float _3415 = _3253;
    float _3417 = _3413;
    if (_3357)
    {
        float _3419 = _3391 * 6.283185482025146484375;
        float _3421 = cos(_3419);
        _3415 = _3421;
    }
    float _3423 = _3415;
    if (_3357)
    {
        float _3425 = _3409 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3367 = _3425;
    }
    float _3427 = _3367;
    float _3429 = _3401;
    float _3431 = _3427;
    if (_3357)
    {
        float _3433 = fma(_3401, _3427, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3429 = _3433;
    }
    float _3435 = _3429;
    float _3437 = _3435;
    if (!_3357)
    {
        _3431 = _3409;
    }
    float _3439 = _3431;
    float _3441 = 0.0;
    float _3443 = _3439;
    if (_3357)
    {
        float _3445 = _3385 * _3435;
        _3441 = _3445;
    }
    float _3447 = _3441;
    if (!_3357)
    {
        _3437 = _3345;
    }
    float _3449 = _3437;
    float _3451 = _3449;
    if (_3357)
    {
        float _3453 = _3423 + (-1.0);
        _3387 = _3453;
    }
    float _3455 = _3387;
    float _3457 = _3455;
    if (_3357)
    {
        float _3459 = _3345 * _3447;
        _3451 = _3459;
    }
    float _3461 = _3451;
    if (_3357)
    {
        float _3463 = _3347 * _3447;
        _3417 = _3463;
    }
    float _3465 = _3417;
    if (_3357)
    {
        float _3467 = _3455 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3369 = _3467;
    }
    float _3469 = _3369;
    if (_3357)
    {
        float _3471 = _3461 * _3461;
        _3371 = _3471;
    }
    float _3473 = _3371;
    if (!_3357)
    {
        _3457 = _3351;
    }
    float _3475 = _3457;
    float _3477 = _3475;
    if (_3357)
    {
        float _3479 = _3465 * _3465;
        _3477 = _3479;
    }
    float _3481 = _3477;
    if (_3357)
    {
        float _3483 = fma(_3409, _3423, _3469);
        _3443 = _3483;
    }
    float _3485 = _3443;
    float _3487 = fma(_3485, _3485, _3473);
    float _3489 = _3487 + _3481;
    float _3491 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3493 = fma(_3341, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3491);
    float _3495 = precise::clamp(_3493, 0.0, 1.0);
    float _3497 = -_3495;
    float _3499 = _3497 + 1.0;
    float _3501 = rsqrt(_3489);
    float _3503 = abs(_3499);
    float _3505 = log2(_3503);
    float _3507 = _3501 * _3461;
    float _3509 = _3501 * _3485;
    float _3511 = _3501 * _3465;
    float _3513 = _3507 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3515 = -_3513;
    float _3517 = fma(_3509, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3515);
    float _3519 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3521 = -_3511;
    float _3523 = fma(_3521, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3517);
    float _3525 = exp2(_3519);
    float _3527 = fma(_3523, -0.5, 0.5);
    float _3529 = fma(_3523, 0.5, 0.5);
    float _3531 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3533 = _3531 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3535 = sqrt(_3527);
    float _3537 = fma(_3529, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3539 = fma(_3529, _3537, -0.212114393711090087890625);
    float _3541 = 1.0 / _3533;
    float _3543 = fma(_3529, _3539, 1.570728778839111328125);
    float _3545 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3547 = _3545 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3549 = _3509 + 1.0;
    float _3551 = -_3509;
    float _3553 = fma(_3525, _3549, _3551);
    float _3555 = _3535 * 0.636619746685028076171875;
    float _3557 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3559 = _3557 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3561 = 1.0 / _3547;
    float _3563 = fma(_3553, 0.5, 0.5);
    float _3565 = -_3543;
    float _3567 = fma(_3555, _3565, 1.0);
    float _3569 = 1.0 / _3559;
    float2 _10480 = float2(_3567, _3563);
    float3 _3573 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10480, float2(0.0), isnan(_10480)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10480, float2(0.0), isnan(_10480)), level(0.0)).xyz;
    float _3575 = _3573.x;
    float _3577 = _3573.y;
    float _3579 = _3573.z;
    float _3581 = -_1349;
    float _3583 = _3581 + 1.0;
    int _3585 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3587 = _3585 != 0;
    float _3589 = -_1219;
    float _3591 = _3589 + 1.0;
    float _3593 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3595 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3593;
    float _3597 = -_193;
    int _3599 = _3191 ? as_type<int>(_3597) : as_type<int>(_193);
    float _3601 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3603 = _3601 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _3605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3607 = _3605 != 0;
    float _3609 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3611 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3609;
    bool _3613 = !_3587;
    float _3615 = _3613 ? _193 : as_type<float>(_3599);
    float _3617 = _3595 * _3541;
    int _3619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3621 = _3619 != 0;
    float _3623 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3625 = _643 + _3623;
    bool _3627 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3629 = isnan(_643);
    bool _3631 = _3627 || _3629;
    bool _3633 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3635 = _3631 || _3633;
    float _3637 = float(_3635);
    float _3639 = _3603 * _3561;
    bool _3641 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3643 = isnan(_643);
    bool _3645 = _3641 || _3643;
    bool _3647 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3649 = _3645 || _3647;
    float _3651 = float(_3649);
    float _3653 = _3611 * _3569;
    bool _3655 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3657 = isnan(_643);
    bool _3659 = _3655 || _3657;
    bool _3661 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3663 = _3659 || _3661;
    float _3665 = float(_3663);
    float _3667 = -_3637;
    float _3669 = _3667 + 1.0;
    float _3671 = fma(_3617, _3625, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _3673 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3675 = isnan(_643);
    bool _3677 = _3673 || _3675;
    bool _3679 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3681 = _3677 || _3679;
    float _3683 = float(_3681);
    float _3685 = -_3651;
    float _3687 = _3685 + 1.0;
    float _3689 = _3665 * _3669;
    float _3691 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3693 = _3691 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3695 = -_3665;
    float _3697 = _3695 + 1.0;
    bool _3699 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3701 = isnan(_643);
    bool _3703 = _3699 || _3701;
    bool _3705 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3707 = _3703 || _3705;
    float _3709 = float(_3707);
    float _3711 = _3683 * _3687;
    float _3713 = -_3683;
    float _3715 = _3713 + 1.0;
    float _3717 = 1.0 / _3693;
    float _3719 = _3651 * _3697;
    bool _3721 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3723 = isnan(_643);
    bool _3725 = _3721 || _3723;
    bool _3727 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3729 = _3725 || _3727;
    float _3731 = float(_3729);
    float _3733 = _3709 * _3715;
    float _3735 = -_3709;
    float _3737 = _3735 + 1.0;
    bool _3739 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3741 = isnan(_643);
    bool _3743 = _3739 || _3741;
    bool _3745 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3747 = _3743 || _3745;
    float _3749 = float(_3747);
    float _3751 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3753 = -_3731;
    float _3755 = _3753 + 1.0;
    bool _3757 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3759 = isnan(_643);
    bool _3761 = _3757 || _3759;
    bool _3763 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3765 = _3761 || _3763;
    float _3767 = float(_3765);
    float _3769 = -_3749;
    float _3771 = _3769 + 1.0;
    float _3773 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3775 = _3773 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3777 = _3749 * _3755;
    float _3779 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3781 = _3779 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3783 = _3767 * _3771;
    float _3785 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3787 = _3785 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3789 = 1.0 / _3775;
    float _3791 = _3731 * _3737;
    float _3793 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3795 = _3793 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3797 = _3671 * _3783;
    float _3799 = -_3767;
    float _3801 = _3799 + 1.0;
    float _3803 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3805 = _643 + _3803;
    float _3807 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3809 = 1.0 / _3795;
    float _3811 = _3781 * _3717;
    float _3813 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3815 = _643 + _3813;
    float _3817 = fma(_3801, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3797);
    float _3819 = fma(_3653, _3805, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3821 = fma(_3639, _3815, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _3823 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3825 = _643 + _3823;
    float _3827 = 1.0 / _3787;
    float _3829 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3831 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3829;
    float _3833 = fma(_3821, _3777, _3817);
    float _3835 = fma(_3811, _3825, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3837 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3839 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3837;
    float _3841 = _3831 * _3789;
    float _3843 = fma(_3819, _3791, _3833);
    float _3845 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3847 = _643 + _3845;
    float _3849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3851 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3853 = _3851 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3855 = fma(_3835, _3733, _3843);
    float _3857 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3859 = _643 + _3857;
    float _3861 = fma(_3841, _3847, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3863 = _3853 * _3809;
    float _3865 = _2535 + (-0.5);
    int _3867 = abs(_3107);
    float _3869 = _3839 * _3827;
    float _3871 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3873 = _643 + _3871;
    float _3875 = _2363 + 0.5;
    float _3877 = fma(_3861, _3711, _3855);
    float _3879 = fma(_3869, _3859, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3881 = fma(_3863, _3873, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3883 = abs(_1461);
    float _3885 = log2(_3883);
    float _3887 = fma(_3875, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1115);
    float _3889 = _3615 + 0.5;
    float _3891 = _2845 + (-0.5);
    float _3893 = fma(_3881, _3719, _3877);
    float _3895 = -_3865;
    float _3897 = -_1121;
    float _3899 = fma(_3895, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3897);
    float _3901 = fma(_3889, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1107);
    float _3903 = -_3891;
    float _3905 = -_1067;
    float _3907 = fma(_3903, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3905);
    float _3909 = _3849 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3911 = _2829 + 0.5;
    float _3913 = fma(_3879, _3689, _3893);
    float _3915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3917 = -_3583;
    float _3919 = fma(_3615, _3917, _3901);
    float _3921 = fma(_3909, _3911, _1367);
    float _3923 = fma(_3637, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3913);
    float _3925 = -_1085;
    float _3927 = _3925 + 1.0;
    float _3929 = _3885 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3931 = -_1363;
    float _3933 = _3931 + 1.0;
    int _3935 = _3003 >> 31;
    float _3937 = fma(_3927, _2535, _3899);
    float _3939 = -_1359;
    float _3941 = _3939 + 1.0;
    float _3943 = -_1099;
    float _3945 = _3943 + 1.0;
    float _3947 = exp2(_3929);
    int _3949 = _3935 & 3;
    float _3951 = _1834 + (-0.5);
    float _3953 = -_3945;
    float _3955 = fma(_3953, _2363, _3887);
    int _3957 = _3003 + _3949;
    float _3959 = _3915 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3961 = fma(_2845, _3941, _3907);
    float _3963 = -_3933;
    float _3965 = fma(_2829, _3963, _3921);
    int _3967 = _3957 >> 2;
    float _3969 = -_3959;
    float _3971 = -_1369;
    float _3973 = fma(_3969, _3951, _3971);
    out.m_78.x = _3955;
    out.m_78.y = _3937;
    bool _3975 = !_3257;
    int _3977 = _3975 ? 0 : (-1);
    float _3979 = exp2(_3807);
    float _3981 = fma(_1834, _3591, _3973);
    float _3983 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3985 = fma(_3947, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3987 = precise::clamp(_3985, 0.0, 1.0);
    int _3989 = _3967 << 4;
    int _3991 = _3989 + 656;
    out.m_80.x = _3923;
    float _3993 = -_1598;
    float _3995 = fma(_3993, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3983);
    int _3997 = ~_3151;
    int _3999 = _3997 + _3189;
    int _4001 = _3999 + 1;
    uint _4003 = uint(int(uint(_3991) >> uint(2)));
    uint _4005 = uint(int(uint(int(_4003)) >> uint(2)));
    int _4007 = int(_4003) & 3;
    float _4009 = (*spvDescriptorSet0.vp_c9)._m0[int(_4005)][_4007];
    int _4011 = int(_4003) + 1;
    uint _4013 = uint(int(uint(_4011) >> uint(2)));
    int _4015 = _4011 & 3;
    float _4017 = (*spvDescriptorSet0.vp_c9)._m0[int(_4013)][_4015];
    out.m_82.x = _3919;
    out.m_82.y = _3961;
    out.m_82.z = _3965;
    out.m_82.w = _3981;
    float _4019 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3995);
    int _4021 = ~_3193;
    int _4023 = _4021 + _3977;
    int _4025 = _4023 + 1;
    int _4027 = _2277 * _4001;
    int _4029 = _4027 + _2993;
    int _4031 = ~_3121;
    int _4033 = _4031 + _3157;
    int _4035 = _4033 + 1;
    float _4037 = -_683;
    float _4039 = _4037 + 1.0;
    bool _4041 = !_2861;
    int _4043 = _4041 ? 0 : 1;
    int _4045 = _3991 + 8;
    uint _4047 = uint(int(uint(_4045) >> uint(2)));
    uint _4049 = uint(int(uint(int(_4047)) >> uint(2)));
    int _4051 = int(_4047) & 3;
    float _4053 = (*spvDescriptorSet0.vp_c9)._m0[int(_4049)][_4051];
    int _4055 = int(_4047) + 1;
    uint _4057 = uint(int(uint(_4055) >> uint(2)));
    int _4059 = _4055 & 3;
    float _4061 = (*spvDescriptorSet0.vp_c9)._m0[int(_4057)][_4059];
    int _4063 = _2277 * _4025;
    int _4065 = _4063 + _2923;
    bool _4067 = !_2841;
    int _4069 = _4067 ? _4029 : (-1);
    int _4071 = _2191 * _4035;
    int _4073 = _4071 + _2635;
    int _4075 = abs(_2913);
    int _4077 = _4069 & 3;
    bool _4079 = _4077 != 0;
    float _4081 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4083 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4085 = _1624 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4087 = _1624 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4089 = -_1598;
    float _4091 = fma(_4089, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4081);
    float _4093 = -_1598;
    float _4095 = fma(_4093, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4083);
    float _4097 = _1624 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4099 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4085);
    float _4101 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4091);
    float _4103 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4095);
    float _4105 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4087);
    float _4107 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4109 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4111 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4097);
    float _4113 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4115 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4099);
    float _4117 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4107);
    float _4119 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4105);
    float _4121 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4111);
    float _4123 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4109);
    float _4125 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4113);
    float _4127 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4129 = _3751 * _4019;
    int _4131 = abs(_3083);
    float _4133 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4117);
    float _4135 = _3751 * _4101;
    float _4137 = fma(_4127, _4115, _4129);
    out.m_84.x = _4115;
    out.m_84.y = _4119;
    out.m_84.z = _4121;
    int _4139 = abs(_3033);
    float _4141 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4123);
    float _4143 = _3751 * _4103;
    float _4145 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4147 = int(_4145);
    float _4149 = fma(_4127, _4119, _4135);
    float _4151 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4125);
    float _4153 = fma(_4127, _4121, _4143);
    int _4155 = _2823 >> 31;
    int _4157 = abs(_4043);
    int _4159 = ~_4131;
    int _4161 = _4159 + 1;
    int _4163 = _4161 + 1;
    int _4165 = ~_4139;
    int _4167 = _4165 + 1;
    int _4169 = _4167 + 1;
    int _4171 = abs(_3145);
    int _4173 = _4163 * as_type<int>(_4017);
    int _4175 = _4155 & 3;
    float _4177 = float(uint(_4147));
    int _4179 = _4169 * as_type<int>(_4009);
    int _4181 = _4179 + _4173;
    int _4183 = ~_4171;
    int _4185 = _4183 + 1;
    int _4187 = _4185 + 1;
    int _4189 = ~_3867;
    int _4191 = _4189 + 1;
    int _4193 = _4191 + 1;
    float _4195 = 1.0 / _4177;
    int _4197 = _2823 + _4175;
    int _4199 = _4187 * as_type<int>(_4053);
    int _4201 = _4199 + _4181;
    int _4203 = abs(_4147);
    float _4205 = fma(_3751, _3751, 1.0);
    int _4207 = abs(_3179);
    int _4209 = _4193 * as_type<int>(_4061);
    int _4211 = _4209 + _4201;
    int _4213 = _4197 >> 2;
    float _4215 = rsqrt(_4205);
    float _4217 = float(uint(_4203));
    int _4219 = _4213 << 4;
    int _4221 = _4219 + 368;
    int _4223 = ~_4207;
    int _4225 = _4223 + 1;
    int _4227 = _4225 + 1;
    int _4229 = _4069 >> 31;
    float _4231 = 1.0 / _4217;
    bool _4233 = !_2581;
    int _4235 = _4233 ? _4073 : (-1);
    int _4237 = _4211 * _4227;
    int _4239 = _4229 & 3;
    int _4241 = as_type<int>(_4195) + (-2);
    int _4243 = _4235 * _4207;
    int _4245 = _4243 + _4237;
    int _4247 = _4069 + _4239;
    uint _4249 = uint(int(uint(_4221) >> uint(2)));
    uint _4251 = uint(int(uint(int(_4249)) >> uint(2)));
    int _4253 = int(_4249) & 3;
    float _4255 = (*spvDescriptorSet0.vp_c9)._m0[int(_4251)][_4253];
    int _4257 = int(_4249) + 1;
    uint _4259 = uint(int(uint(_4257) >> uint(2)));
    int _4261 = _4257 & 3;
    float _4263 = (*spvDescriptorSet0.vp_c9)._m0[int(_4259)][_4261];
    float _4265 = _3751 * _4215;
    int _4267 = _4069 & 3;
    bool _4269 = _4267 != 0;
    int _4271 = _4247 >> 2;
    float _4273 = -_4133;
    float _4275 = _4265 * _4273;
    float _4277 = float(uint(_4245));
    float _4279 = -_4141;
    float _4281 = _4265 * _4279;
    int _4283 = _4271 << 4;
    int _4285 = _4283 + 800;
    float _4287 = fma(_4215, _4019, _4275);
    int _4289 = abs(_4245);
    float _4291 = as_type<float>(_4241) * _4277;
    int _4293 = as_type<int>(_4231) + (-2);
    int _4295 = _4221 + 8;
    uint _4297 = uint(int(uint(_4295) >> uint(2)));
    uint _4299 = uint(int(uint(int(_4297)) >> uint(2)));
    int _4301 = int(_4297) & 3;
    float _4303 = (*spvDescriptorSet0.vp_c9)._m0[int(_4299)][_4301];
    int _4305 = int(_4297) + 1;
    uint _4307 = uint(int(uint(_4305) >> uint(2)));
    int _4309 = _4305 & 3;
    float _4311 = (*spvDescriptorSet0.vp_c9)._m0[int(_4307)][_4309];
    float _4313 = float(uint(_4289));
    float _4315 = trunc(_4291);
    float _4317 = precise::max(_4315, 0.0);
    uint _4319 = uint(_4317);
    int _4321 = _4079 ? 0 : 1;
    float _4323 = -_4151;
    float _4325 = _4265 * _4323;
    bool _4327 = uint(_4267) > 1u;
    float _4329 = as_type<float>(_4293) * _4313;
    int _4331 = ~_4147;
    int _4333 = _4331 + 1;
    uint _4335 = uint(int(uint(_4285) >> uint(2)));
    uint _4337 = uint(int(uint(int(_4335)) >> uint(2)));
    int _4339 = int(_4335) & 3;
    float _4341 = (*spvDescriptorSet0.vp_c9)._m0[int(_4337)][_4339];
    int _4343 = int(_4335) + 1;
    uint _4345 = uint(int(uint(_4343) >> uint(2)));
    int _4347 = _4343 & 3;
    float _4349 = (*spvDescriptorSet0.vp_c9)._m0[int(_4345)][_4347];
    int _4351 = ~_4321;
    int _4353 = _4351 + 1;
    int _4355 = _4353 + 1;
    float _4357 = fma(_4215, _4103, _4325);
    int _4359 = abs(_2989);
    float _4361 = trunc(_4329);
    float _4363 = precise::max(_4361, 0.0);
    uint _4365 = uint(_4363);
    int _4367 = ~_2945;
    int _4369 = _4367 + _3009;
    int _4371 = _4369 + 1;
    bool _4373 = _2165 == 0;
    int _4375 = _4285 + 8;
    uint _4377 = uint(int(uint(_4375) >> uint(2)));
    uint _4379 = uint(int(uint(int(_4377)) >> uint(2)));
    int _4381 = int(_4377) & 3;
    float _4383 = (*spvDescriptorSet0.vp_c9)._m0[int(_4379)][_4381];
    int _4385 = int(_4377) + 1;
    uint _4387 = uint(int(uint(_4385) >> uint(2)));
    int _4389 = _4385 & 3;
    float _4391 = (*spvDescriptorSet0.vp_c9)._m0[int(_4387)][_4389];
    bool _4393 = !_2841;
    int _4395 = _4393 ? _4065 : (-1);
    int _4397 = _2165 * _4371;
    int _4399 = _4397 + _2421;
    int _4401 = _4355;
    float _4403 = _4151;
    if (!_4327)
    {
        int _4405 = ~_4321;
        int _4407 = _4405 + 1;
        _4401 = _4407;
    }
    int _4409 = _4401;
    float _4411 = fma(_4215, _4101, _4281);
    bool _4413 = uint(_4267) >= 2u;
    int _4415 = _4333 * int(_4319);
    int _4417 = _4415 + _4245;
    int _4419 = ~_4203;
    int _4421 = _4419 + 1;
    int _4423 = _4413 ? 0 : 1;
    out.m_86.x = _4287;
    out.m_86.y = _4411;
    out.m_86.z = _4357;
    bool _4425 = _4267 != 3;
    int _4427 = _4421 * int(_4365);
    int _4429 = _4427 + _4289;
    float _4431 = float(uint(_4417));
    int _4433 = ~_4075;
    int _4435 = _4433 + 1;
    int _4437 = _4435 + 1;
    int _4439 = abs(_4409);
    float _4441 = as_type<float>(_4241) * _4431;
    float _4443 = float(uint(_4429));
    int _4445 = _4437 * as_type<int>(_4263);
    bool _4447 = !_4269;
    int _4449 = _4447 ? 0 : 1;
    float _4451 = trunc(_4441);
    float _4453 = precise::max(_4451, 0.0);
    uint _4455 = uint(_4453);
    float _4457 = as_type<float>(_4293) * _4443;
    int _4459 = ~_4423;
    int _4461 = _4459 + 1;
    int _4463 = _4461 + 1;
    int _4465 = _4463;
    if (_4425)
    {
        int _4467 = ~_4423;
        int _4469 = _4467 + 1;
        _4465 = _4469;
    }
    int _4471 = _4465;
    float _4473 = trunc(_4457);
    float _4475 = precise::max(_4473, 0.0);
    uint _4477 = uint(_4475);
    int _4479 = abs(_4449);
    int _4481 = ~_4439;
    int _4483 = _4481 + 1;
    int _4485 = _4483 + 1;
    int _4487 = abs(_4471);
    int _4489 = ~_4157;
    int _4491 = _4489 + 1;
    int _4493 = _4491 + 1;
    int _4495 = _4485 * as_type<int>(_4349);
    int _4497 = ~_4479;
    int _4499 = _4497 + 1;
    int _4501 = _4499 + 1;
    int _4503 = _4493 * as_type<int>(_4255);
    int _4505 = _4503 + _4445;
    int _4507 = ~_4487;
    int _4509 = _4507 + 1;
    int _4511 = _4509 + 1;
    int _4513 = _4501 * as_type<int>(_4341);
    int _4515 = _4513 + _4495;
    int _4517 = ~_4359;
    int _4519 = _4517 + 1;
    int _4521 = _4519 + 1;
    bool _4523 = _2859 != 3;
    int _4525 = _4511 * as_type<int>(_4383);
    int _4527 = _4525 + _4515;
    bool _4529 = _4267 != 3;
    int _4531 = _4521 * as_type<int>(_4303);
    int _4533 = _4531 + _4505;
    int _4535 = int(_4319) + int(_4455);
    float _4537 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4539 = !_4523;
    int _4541 = _4539 ? 0 : (-1);
    int _4543 = ~_4147;
    int _4545 = _4543 + 1;
    float _4547 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4537);
    bool _4549 = !_4529;
    int _4551 = _4549 ? 0 : (-1);
    int _4553 = abs(_4541);
    int _4555 = _4545 * _4535;
    int _4557 = _4555 + _4245;
    int _4559 = abs(_4551);
    float _4561 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4547);
    int _4563 = int(_4365) + int(_4477);
    int _4565 = ~_4203;
    int _4567 = _4565 + 1;
    bool _4569 = uint(_4557) >= uint(_4147);
    int _4571 = _4567 * _4563;
    int _4573 = _4571 + _4289;
    int _4575 = ~_4553;
    int _4577 = _4575 + 1;
    int _4579 = _4577 + 1;
    float _4581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4583 = ~_4559;
    int _4585 = _4583 + 1;
    int _4587 = _4585 + 1;
    bool _4589 = uint(_4573) >= uint(_4203);
    int _4591 = _4579 * as_type<int>(_4311);
    int _4593 = _4591 + _4533;
    bool _4595 = !_4569;
    int _4597 = _4595 ? 0 : (-1);
    int _4599 = _4587 * as_type<int>(_4391);
    int _4601 = _4599 + _4527;
    int _4603 = _4245 ^ _4147;
    float _4605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4607 = !_3621;
    int _4609 = _4607 ? 0 : 1;
    bool _4611 = !_4589;
    int _4613 = _4611 ? 0 : (-1);
    uint _4615 = uint(int(uint(_4603) >> uint(31)));
    bool _4617 = !_3607;
    int _4619 = _4617 ? 0 : 1;
    int _4621 = abs(_4609);
    int _4623 = ~_4613;
    int _4625 = _4563 + _4623;
    int _4627 = _4625 + 1;
    int _4629 = ~int(_4615);
    int _4631 = _4629 + 1;
    int _4633 = ~_4535;
    int _4635 = _4633 + _4597;
    int _4637 = _4635 + 1;
    int _4639 = abs(_4619);
    int _4641 = _4627 ^ _4631;
    int _4643 = _4147 * _4637;
    int _4645 = _4643 + _4245;
    int _4647 = ~_4639;
    int _4649 = _4647 + 1;
    int _4651 = _4649 + 1;
    bool _4653 = _4147 == 0;
    bool _4655 = _4147 == 0;
    int _4657 = _4593 * _4651;
    int _4659 = ~_4631;
    int _4661 = _4659 + _4641;
    int _4663 = _4661 + 1;
    int _4665 = ~_4621;
    int _4667 = _4665 + 1;
    int _4669 = _4667 + 1;
    bool _4671 = !_4653;
    int _4673 = _4671 ? _4645 : (-1);
    bool _4675 = !_4655;
    int _4677 = _4675 ? _4663 : (-1);
    int _4679 = _4601 * _4669;
    bool _4681 = !_4373;
    int _4683 = _4681 ? _4399 : (-1);
    float _4685 = _4581 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4687 = float(_4673);
    float _4689 = _4605 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4691 = float(_4677);
    int _4693 = _4683 * _4639;
    int _4695 = _4693 + _4657;
    float _4697 = _969 + 0.5;
    float _4699 = fma(_4685, _4687, _1373);
    float _4701 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4561);
    float _4703 = -_1375;
    float _4705 = fma(_4689, _4691, _4703);
    float _4707 = _2074 * 0.5;
    float _4709 = _1009 + (-0.5);
    float _4711 = fma(_4685, _4697, _4699);
    int _4713 = _4395 * _4621;
    int _4715 = _4713 + _4679;
    float _4717 = fma(_2106, -0.5, _4707);
    float _4719 = -_4689;
    float _4721 = fma(_4719, _4709, _4705);
    float _4723 = -_1335;
    float _4725 = _4723 + 1.0;
    float _4727 = -_1361;
    float _4729 = _4727 + 1.0;
    out.gl_Position.x = _2122;
    out.gl_Position.y = _2106;
    out.gl_Position.z = _4701;
    out.gl_Position.w = _2074;
    float _4731 = _4701 + _2074;
    float _4733 = fma(_1009, _4725, _4721);
    float _4735 = _2122 + _2074;
    float _4737 = -_4729;
    float _4739 = fma(_969, _4737, _4711);
    bool _4741 = _1461 <= 8000.0;
    bool _4743 = isnan(_1461);
    bool _4745 = _4741 || _4743;
    bool _4747 = isnan(8000.0);
    bool _4749 = _4745 || _4747;
    float _4751 = float(_4749);
    float _4753 = fma(_3987, -2.0, 3.0);
    float _4755 = _3987 * _3987;
    float _4757 = _4731 * 0.5;
    out.m_88.x = _4739;
    out.m_88.y = _4733;
    float _4759 = _4735 * 0.5;
    float _4761 = _4755 * _4753;
    float _4763 = float(_4695);
    float _4765 = _4133 + _4137;
    float _4767 = float(_4715);
    float _4769 = -_4761;
    float _4771 = _4769 + 1.0;
    out.m_90.x = _4759;
    out.m_90.y = _4717;
    out.m_90.z = _4757;
    out.m_90.w = _2074;
    float _4773 = _4141 + _4149;
    float _4775 = _4151 + _4153;
    float _4777 = fma(_4771, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4761);
    float _4779 = _4739;
    float _4781 = _4733;
    if (!_2058)
    {
        _4779 = 1.0;
    }
    float _4783 = _4779;
    out.m_92.x = _4763;
    float _4785 = _4783;
    if (_2058)
    {
        bool _4787 = _2148 >= _2126;
        bool _4789 = isnan(_2148);
        bool _4791 = _4787 || _4789;
        bool _4793 = isnan(_2126);
        bool _4795 = _4791 || _4793;
        float _4797 = float(_4795);
        _4785 = _4797;
    }
    float _4799 = _4785;
    float _4801 = _4751 * _4777;
    bool _4803 = _3341 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4805 = isnan(_3341);
    bool _4807 = _4803 || _4805;
    bool _4809 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4811 = _4807 || _4809;
    out.m_92.w = _4767;
    float _4813 = _4801 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4815 = -_3979;
    float _4817 = _4815 + 1.0;
    float _4819 = _4799 * _3319;
    out.m_94.x = _4765;
    out.m_94.y = _4773;
    out.m_94.z = _4775;
    float _4821 = _4039 * _4813;
    float _4823 = precise::clamp(_4821, 0.0, 1.0);
    float _4825 = _4817 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4827 = -_4823;
    float _4829 = fma(_4827, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4831 = _4825 * _2150;
    float _4833 = -_4825;
    float _4835 = _4833 + 1.0;
    float _4837 = _4835;
    float _4839 = _4825;
    if (!_4811)
    {
        _3203 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4841 = _3203;
    float _4843 = -_4819;
    float _4845 = fma(_4843, _4829, 1.0);
    float _4847 = precise::clamp(_4845, 0.0, 1.0);
    float _4849 = _2161 * _4831;
    float _4851 = _3579 * _4831;
    float _4853 = _2161 * _4835;
    float _4855 = _4847 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4857 = fma(_3575, _4849, _2155);
    float _4859 = fma(_3577, _4849, _2157);
    float _4861 = fma(_2161, _4851, _2159);
    float _4863 = _3255 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_96.x = _4855;
    float _4865 = _4847;
    float _4867 = _4841;
    float _4869 = _4841;
    if (!_4811)
    {
        _4403 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4871 = _4403;
    float _4873 = _4871;
    float _4875 = _4871;
    if (!_4811)
    {
        _4837 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4877 = _4837;
    out.m_98.x = _4857;
    out.m_98.y = _4859;
    out.m_98.z = _4861;
    out.m_98.w = _4853;
    float _4879 = _4877;
    float _4881 = _4877;
    if (!_4811)
    {
        _4781 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4883 = _4781;
    float _4885 = _4883;
    float _4887 = _4883;
    if (!_4811)
    {
        _4865 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4889 = _4865;
    float _4891 = _4889;
    float _4893 = _4889;
    if (!_4811)
    {
        _4839 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4895 = _4839;
    bool _4897 = !_4811;
    float _4899 = _4895;
    float _4901 = _4895;
    if (!_4897)
    {
        bool _4903 = _3341 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4905 = isnan(_3341);
        bool _4907 = _4903 || _4905;
        bool _4909 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4911 = _4907 || _4909;
        if (!_4911)
        {
            float _4913 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4915 = _3341 + _4913;
            float _4917 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4919 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4917;
            float _4921 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4923 = _4921 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4925 = 1.0 / _4919;
            float _4927 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4929 = _4927 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4931 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4933 = _4931 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4935 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4937 = _4935 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4939 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4941 = _4939 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4943 = _4915 * _4925;
            float _4945 = precise::clamp(_4943, 0.0, 1.0);
            float _4947 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4949 = _4947 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4951 = fma(_4945, _4923, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4953 = fma(_4945, _4949, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4955 = fma(_4945, _4929, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4957 = fma(_4945, _4933, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4959 = fma(_4945, _4937, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4961 = fma(_4945, _4941, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4875 = _4955;
            _4893 = _4959;
            _4869 = _4951;
            _4887 = _4957;
            _4881 = _4953;
            _4901 = _4961;
            _4963 = true;
        }
        else
        {
            bool _4965 = _3341 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4967 = isnan(_3341);
            bool _4969 = _4965 || _4967;
            bool _4971 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4973 = _4969 || _4971;
            if (!_4973)
            {
                _4867 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4975 = _4867;
            _4869 = _4975;
            if (!_4973)
            {
                _4873 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4977 = _4873;
            _4875 = _4977;
            if (!_4973)
            {
                _4879 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4979 = _4879;
            _4881 = _4979;
            if (!_4973)
            {
                _4885 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4981 = _4885;
            _4887 = _4981;
            if (!_4973)
            {
                _4891 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4983 = _4891;
            _4893 = _4983;
            if (!_4973)
            {
                _4899 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4985 = _4899;
            bool _4987 = !_4973;
            _4901 = _4985;
            if (!_4987)
            {
                bool _4989 = _3341 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4991 = isnan(_3341);
                bool _4993 = _4989 || _4991;
                bool _4995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4997 = _4993 || _4995;
                if (!_4997)
                {
                    float _4999 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5001 = _3341 + _4999;
                    float _5003 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5005 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5003;
                    float _5007 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5009 = _5007 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5011 = 1.0 / _5005;
                    float _5013 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5015 = _5013 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5017 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5019 = _5017 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5021 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5023 = _5021 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5025 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5027 = _5025 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5029 = _5001 * _5011;
                    float _5031 = precise::clamp(_5029, 0.0, 1.0);
                    float _5033 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5035 = _5033 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5037 = fma(_5031, _5009, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5039 = fma(_5031, _5035, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5041 = fma(_5031, _5015, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5043 = fma(_5031, _5019, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5045 = fma(_5031, _5023, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5047 = fma(_5031, _5027, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4875 = _5041;
                    _4893 = _5045;
                    _4869 = _5037;
                    _4887 = _5043;
                    _4881 = _5039;
                    _4901 = _5047;
                    _4963 = true;
                }
                else
                {
                    _4875 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4893 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4869 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4887 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4881 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4901 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4963 = false;
    float _5049 = _4875;
    float _5051 = _4893;
    float _5053 = _4869;
    float _5055 = _4887;
    float _5057 = _4881;
    float _5059 = _4901;
    float _5061 = fma(_4773, -0.5, 0.5);
    float _5063 = precise::clamp(_5061, 0.0, 1.0);
    float _5065 = -_5049;
    float _5067 = _5065 + _5051;
    float _5069 = _4863 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5071 = -_5053;
    float _5073 = _5071 + _5055;
    float _5075 = fma(_5063, _5067, _5049);
    out.m_100.x = 0.0;
    float _5077 = -_5057;
    float _5079 = _5077 + _5059;
    float _5081 = fma(_5063, _5073, _5053);
    float _5083 = _5075 * 0.586610972881317138671875;
    out.m_63.x = _5069;
    bool _5085 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5087 = fma(_5063, _5079, _5057);
    float _5089 = fma(_5081, 0.298911988735198974609375, _5083);
    bool _5091 = _3255 > 0.0;
    bool _5093 = isnan(_3255);
    bool _5095 = _5091 || _5093;
    bool _5097 = isnan(0.0);
    bool _5099 = _5095 || _5097;
    float _5101 = fma(_5087, 0.114477999508380889892578125, _5089);
    float _5103 = -_5101;
    float _5105 = _5081 + _5103;
    float _5107 = -_5101;
    float _5109 = _5075 + _5107;
    float _5111 = -_5101;
    float _5113 = _5087 + _5111;
    float _5115 = fma(_5105, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5101);
    float _5117 = fma(_5109, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5101);
    float _5119 = fma(_5113, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5101);
    bool _5121 = !_5085;
    if (!_5121)
    {
        float _5123 = -_1978;
        float _5125 = _5123 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5127 = -_1980;
        float _5129 = _5127 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5131 = -_1982;
        float _5133 = _5131 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5135 = _5125 * _5125;
        float _5137 = fma(_5129, _5129, _5135);
        float _5139 = fma(_5133, _5133, _5137);
        float _5141 = sqrt(_5139);
        float _5143 = rsqrt(_5139);
        float _5145 = -_5141;
        float _5147 = _5145 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5149 = _5147 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5151 = precise::clamp(_5149, 0.0, 1.0);
        float _5153 = _5129 * _5143;
        float _5155 = _5125 * _5143;
        float _5157 = abs(_5151);
        float _5159 = log2(_5157);
        float _5161 = _5133 * _5143;
        float _5163 = _5153 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5165 = _4773 * _5155;
        float _5167 = -_5155;
        float _5169 = -_5163;
        float _5171 = fma(_5167, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5169);
        float _5173 = fma(_4765, _5153, _5165);
        float _5175 = -_5161;
        float _5177 = fma(_5175, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5171);
        float _5179 = fma(_4775, _5161, _5173);
        float _5181 = precise::clamp(_5179, 0.0, 1.0);
        float _5183 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5185 = _5177 + _5183;
        float _5187 = _5159 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5189 = _5185 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5191 = precise::clamp(_5189, 0.0, 1.0);
        float _5193 = exp2(_5187);
        float _5195 = _5193 * _5191;
        float _5197 = _5181 * _5195;
        float _5199 = _5197 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5201 = _5197 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5203 = _5197 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _5199;
        out.m_100.y = _5201;
        out.m_100.z = _5203;
    }
    out.m_102.x = _5115;
    out.m_102.y = _5117;
    out.m_102.z = _5119;
    if (_5099)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_63.x = 0.0;
    float _5205 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5205;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4963 = false;
    bool _507 = false;
    bool _361 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_56.w;
    float _118 = in.m_58.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = _118;
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_63.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5273 = as_type<float>(_145);
        out.gl_Position.z = _5273;
    }
    if (!_131)
    {
        return out;
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = float(_123);
    bool _161 = _127 >= _159;
    bool _163 = !_157;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _135;
    if (_165)
    {
        out.m_63.x = 0.0;
    }
    float _171 = _127 * _167;
    float _173 = _171;
    if (_165)
    {
        float _175 = _169 * 5.0;
        _147 = as_type<int>(_175);
    }
    int _177 = _147;
    out.m_61.x = _171;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5336 = as_type<float>(_177);
        out.gl_Position.z = _5336;
    }
    if (_165)
    {
        return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = as_type<int>(_179) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_179) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_181;
    float _217;
    if (!_199)
    {
        float _201 = in.m_68.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        _217 = _171;
    }
    _219 = false;
    float _221 = _217;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = _221 + _223;
    bool _227 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _229 = isnan(_221);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    bool _239 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _241 = isnan(_221);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = -_237;
    float _261 = _259 + 1.0;
    float _263 = 1.0 / _253;
    bool _265 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _267 = isnan(_221);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = _249 * _261;
    float _279 = -_249;
    float _281 = _279 + 1.0;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _285 = _275 * _281;
    float _287 = 1.0 / _257;
    float _289 = -_275;
    float _291 = _289 + 1.0;
    float _293 = _225 * _263;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _221 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _303;
    float _307 = fma(_301, _293, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _309 = fma(_305, _293, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _311 = _297 * _287;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _317 = _307 * _285;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = _309 * _285;
    float _325 = fma(_315, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _327 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[143].x, _317);
    float _329 = fma(_321, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _331 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[143].y, _323);
    float _333 = fma(_325, _277, _327);
    float _335 = fma(_329, _277, _331);
    float _337 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[145].x, _333);
    float _339 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[145].y, _335);
    bool _341 = !_283;
    float _359;
    if (!_341)
    {
        float _343 = in.m_68.x;
        float _345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _347 = _343 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _351 = _349 * _345;
        float _353 = floor(_351);
        float _355 = -_353;
        float _357 = _351 + _355;
        _359 = _357;
        _361 = true;
    }
    else
    {
        _359 = _171;
    }
    _361 = false;
    float _363 = _359;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _373 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _375 = isnan(_363);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _389 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _391 = isnan(_363);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _401;
    bool _405 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _407 = isnan(_363);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = 1.0 / _371;
    float _419 = -_383;
    float _421 = _419 + 1.0;
    bool _423 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _425 = _399 * _421;
    float _427 = -_399;
    float _429 = _427 + 1.0;
    float _431 = 1.0 / _387;
    float _433 = _403 * _417;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _439 = fma(_433, _367, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _441 = _437 * _431;
    float _443 = _439 * _425;
    float _445 = -_415;
    float _447 = _445 + 1.0;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _451 = _363 + _449;
    float _453 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[115].x, _443);
    float _455 = _383 * _447;
    float _457 = fma(_441, _451, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _461 = in.m_70.x;
    float _463 = in.m_70.y;
    float _465 = fma(_457, _455, _453);
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _469 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[117].x, _465);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _475 = _467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _477 = _471 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _479 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _469;
    out.m_72.y = _479;
    out.m_72.z = _475;
    out.m_72.w = _477;
    float _481 = _339 * _463;
    float _483 = _337 * _461;
    bool _485 = !_423;
    int _487 = as_type<int>(_477);
    float _505;
    if (!_485)
    {
        float _489 = in.m_68.x;
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _493 = _489 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _505 = _503;
        _507 = true;
    }
    else
    {
        _505 = _171;
    }
    _507 = false;
    float _509 = _505;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _513 = _509 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _519 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _521 = isnan(_509);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _535 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _537 = isnan(_509);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _547;
    bool _551 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _553 = isnan(_509);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = 1.0 / _517;
    float _565 = -_529;
    float _567 = _565 + 1.0;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _571 = _509 + _569;
    bool _573 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _575 = _545 * _567;
    float _577 = -_545;
    float _579 = _577 + 1.0;
    float _581 = 1.0 / _533;
    float _583 = _549 * _563;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _589 = fma(_583, _513, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _591 = _587 * _581;
    float _593 = -_561;
    float _595 = _593 + 1.0;
    float _597 = _589 * _575;
    float _599 = fma(_591, _571, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _601 = _529 * _595;
    float _603 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[131].x, _597);
    float _605 = fma(_599, _601, _603);
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _613 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[133].x, _605);
    float _615 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _619 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _621 = _613 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _615;
    out.m_74.y = _617;
    out.m_74.z = _619;
    out.m_74.w = _621;
    bool _623 = !_573;
    int _625 = as_type<int>(_615);
    if (!_623)
    {
        float _627 = in.m_68.x;
        float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _631 = _627 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _635 = _633 * _629;
        float _637 = floor(_635);
        float _639 = -_637;
        float _641 = _635 + _639;
        _173 = _641;
    }
    float _643 = _173;
    float _645 = in.m_56.x;
    float _647 = in.m_56.y;
    float _649 = in.m_56.z;
    float _651 = _647 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _653 = _647 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c10)._m0[4].x, _651);
    float _657 = fma(_645, (*spvDescriptorSet0.vp_c10)._m0[6].x, _653);
    float _659 = fma(_649, (*spvDescriptorSet0.vp_c10)._m0[4].z, _655);
    float _661 = fma(_649, (*spvDescriptorSet0.vp_c10)._m0[6].z, _657);
    float _663 = _659 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _665 = _661 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _667 = fma(_663, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _669 = fma(_665, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _671 = floor(_667);
    float _673 = floor(_669);
    float _675 = -_671;
    float _677 = _667 + _675;
    float _679 = -_673;
    float _681 = _669 + _679;
    float2 _6173 = float2(_677, _681);
    float _683 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6173, float2(0.0), isnan(_6173)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6173, float2(0.0), isnan(_6173)), level(0.0)).x;
    float _685 = in.m_68.z;
    float _687 = in.m_68.w;
    int _689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _691 = _689 != 0;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _695 = _671;
    float _697 = _669;
    float _699 = _667;
    float _701 = _681;
    float _703 = _665;
    if (_691)
    {
        float _705 = in.m_68.x;
        float _707 = in.m_68.y;
        _693 = _705;
        _695 = _707;
    }
    float _709 = _693;
    float _711 = _695;
    if (_691)
    {
        _625 = 0;
    }
    int _713 = _625;
    int _715 = _713;
    if (_691)
    {
        _487 = 0;
    }
    int _717 = _487;
    float _719 = 0.0;
    int _721 = _717;
    if (_691)
    {
        _719 = 1.0;
    }
    float _723 = _719;
    float _725 = _685 * 2.0;
    float _727 = 0.0;
    float _729 = _723;
    float _731 = _687;
    if (_691)
    {
        _727 = 1.0;
    }
    float _733 = _727;
    float _735 = floor(_725);
    float _737 = _709;
    float _739 = _711;
    float _741 = _733;
    if (_691)
    {
        _697 = _709;
    }
    float _743 = _697;
    float _745 = _743;
    if (_691)
    {
        _699 = _711;
    }
    float _747 = _699;
    bool _749 = _735 > 0.0;
    bool _751 = _735 >= 0.0;
    bool _753 = isnan(_735);
    bool _755 = _751 || _753;
    bool _757 = isnan(0.0);
    bool _759 = _755 || _757;
    float _761 = _735;
    float _763 = _747;
    if (_691)
    {
        _701 = _743;
    }
    float _765 = _701;
    float _767 = _765;
    if (_691)
    {
        _761 = _743;
    }
    float _769 = _761;
    float _771 = _769;
    if (!_691)
    {
        float _773 = in.m_68.x;
        float _775 = in.m_68.y;
        float _777 = in.m_68.z;
        float _779 = _773 * 3.1415927410125732421875;
        float _781 = _779 * 0.15915493667125701904296875;
        float _783 = _775 * 3.1415927410125732421875;
        float _785 = _783 * 0.15915493667125701904296875;
        float _787 = _781 * 6.283185482025146484375;
        float _789 = sin(_787);
        float _791 = _785 * 6.283185482025146484375;
        float _793 = sin(_791);
        _737 = _773;
        _739 = _775;
        _767 = _789;
        _763 = _793;
        _715 = 1;
        _721 = 2;
        _741 = 5.839270114898681640625;
        _771 = _777;
        _729 = 7.345489978790283203125;
        _745 = _775;
    }
    float _795 = _737;
    float _797 = _739;
    float _799 = _767;
    float _801 = _763;
    int _803 = _715;
    int _805 = _721;
    float _807 = _741;
    float _809 = _771;
    float _811 = _729;
    float _813 = _745;
    float _815 = _795 * 2.0;
    float _817 = _647 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _819 = _797 * 2.0;
    float _821 = fma(_645, (*spvDescriptorSet0.vp_c10)._m0[5].x, _817);
    float _823 = floor(_815);
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _827 = fma(_649, (*spvDescriptorSet0.vp_c10)._m0[5].z, _821);
    float _829 = _795 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _831 = _759 ? 0 : 1;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _835 = -_825;
    float _837 = fma(_829, 2.0, _835);
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _841 = _799 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _843 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[93].w, _833);
    int _845 = ~_831;
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _853 = _801 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _855 = -_839;
    float _857 = fma(_841, 2.0, _855);
    bool _859 = _823 > 0.0;
    float _861 = _827 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _863 = _823 >= 0.0;
    bool _865 = isnan(_823);
    bool _867 = _863 || _865;
    bool _869 = isnan(0.0);
    bool _871 = _867 || _869;
    float _873 = fma(_853, -2.0, _851);
    int _875 = _849;
    float _877 = as_type<float>(_803);
    float _879 = _827;
    float _881 = _861;
    if (!_749)
    {
        int _883 = ~_831;
        int _885 = _883 + 1;
        _875 = _885;
    }
    int _887 = _875;
    float _889 = _797 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _891 = _871 ? 0 : 1;
    float _893 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _895 = log2(_893);
    bool _897 = _803 != 1;
    float _899 = _861 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _901 = _805 != 2;
    float _903 = _797 + _795;
    float _905 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[10].x, _899);
    bool _907 = _685 > 0.5;
    float _909 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _911 = int(_909);
    int _913 = ~_891;
    int _915 = _913 + 1;
    int _917 = _915 + 1;
    float _919 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[10].z, _905);
    int _921 = _917;
    float _923 = _889;
    if (!_859)
    {
        int _925 = ~_891;
        int _927 = _925 + 1;
        _921 = _927;
    }
    int _929 = _921;
    float _931 = _861 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _935 = _933 != 0;
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _939 = _937 != 0;
    int _941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _943 = _941 != 0;
    float _945 = _919 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _947 = _797 > 0.5;
    float _949 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[11].x, _931);
    float _951 = _895 * _127;
    float _953 = -_193;
    int _955 = _947 ? as_type<int>(_953) : as_type<int>(_193);
    float _957 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[11].z, _949);
    float _959 = -_197;
    int _961 = _907 ? as_type<int>(_959) : as_type<int>(_197);
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _965 = _957 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _967 = !_939;
    float _969 = _967 ? _193 : as_type<float>(_955);
    float _971 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[93].z, _963);
    float _973 = floor(_819);
    float _975 = _903 + (-1.0);
    int _977 = int(_897);
    int _979 = _901 ? 2 : 0;
    int _981 = _977 | _979;
    int _983 = _947 ? 4 : 0;
    int _985 = _981 | _983;
    int _987 = _935 ? 8 : 0;
    int _989 = _985 | _987;
    int _991 = _939 ? 16 : 0;
    int _993 = _989 | _991;
    int _995 = _943 ? 32 : 0;
    int _997 = _993 | _995;
    int _999 = _907 ? 64 : 0;
    int _1001 = _997 | _999;
    int _1003 = _1001 & 64;
    float _1005 = _797 + _685;
    bool _1007 = !_943;
    float _1009 = _1007 ? _197 : as_type<float>(_961);
    float _1011 = _945 + _965;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1015 = _1013 != 0;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1023 = _1021 != 0;
    float _1025 = _1005 + (-1.0);
    float _1027 = 1.0 / _965;
    float _1029 = _167 * _127;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1033 = !_1019;
    float _1035 = _1033 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1037 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1039 = !_1015;
    int _1041 = _1039 ? 0 : 1;
    float _1043 = fma(_889, -2.0, _1031);
    bool _1045 = !_1023;
    int _1047 = _1045 ? 0 : 1;
    float _1049 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1053 = _1051 != 0;
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1061 = _1059 != 0;
    float _1063 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1065 = int(_1063);
    float _1067 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1043);
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _1071 = _949;
    float _1073 = _1035;
    if (!_897)
    {
        _923 = _685;
    }
    float _1075 = _923;
    float _1077 = _1011 * _1027;
    float _1079 = _1077 * 0.5;
    float _1081 = _1075;
    if (!_897)
    {
        _877 = _685;
    }
    float _1083 = _877;
    float _1085 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _843);
    float _1087 = _1083;
    if (!_897)
    {
        _1069 = _797;
    }
    float _1089 = _1069;
    float _1091 = exp2(_951);
    float _1093 = 0.0;
    float _1095 = _1089;
    if (!_897)
    {
        _1093 = _797;
    }
    float _1097 = _1093;
    float _1099 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _971);
    float _1101 = _1097;
    if (_901)
    {
        _879 = _797;
    }
    float _1103 = _879;
    float _1105 = -_127;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[76].x, _837);
    float _1109 = _1103;
    if (_901)
    {
        _1071 = _795;
    }
    float _1111 = _1071;
    float _1113 = -_127;
    float _1115 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[91].x, _857);
    bool _1117 = !_1057;
    int _1119 = _1117 ? 0 : 1;
    float _1121 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _873);
    bool _1123 = !_1053;
    int _1125 = _1123 ? 0 : 1;
    float _1127 = _481 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1129 = !_1061;
    int _1131 = _1129 ? 0 : 1;
    float _1133 = _483 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1135 = _1111;
    if (_897)
    {
        _1081 = _797;
    }
    float _1137 = _1081;
    if (_897)
    {
        _1087 = _797;
    }
    float _1139 = _1087;
    float _1141 = -_1091;
    float _1143 = _1141 + 1.0;
    if (_897)
    {
        _1095 = _795;
    }
    float _1145 = _1095;
    float _1147 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_897)
    {
        _1101 = _795;
    }
    float _1149 = _1101;
    if (!_901)
    {
        _1135 = _685;
    }
    float _1151 = _1135;
    if (!_901)
    {
        _1109 = _795;
    }
    float _1153 = _1109;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1157 = _1155 != 0;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1161 = _1159 != 0;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1165 = _1163 != 0;
    bool _1167 = _973 > 0.0;
    float _1169 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1171 = _973 >= 0.0;
    bool _1173 = isnan(_973);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan(0.0);
    bool _1179 = _1175 || _1177;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1183 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1181);
    float _1185 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1187 = int(_1185);
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1193 = !_1157;
    int _1195 = _1193 ? 0 : 1;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1199 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1189);
    float _1201 = fma(_1147, -2.0, _1191);
    float _1203 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1205 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1207 = abs(_1195);
    float _1209 = -_1197;
    float _1211 = fma(_1203, 2.0, _1209);
    float _1213 = float(_887);
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1217 = float(_1207);
    float _1219 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1199);
    float _1221 = float(_1187);
    float _1223 = fma(_1169, -2.0, _1215);
    float _1225 = float(_911);
    float _1227 = _1217 * _1213;
    float _1229 = in.m_76.x;
    float _1231 = in.m_76.y;
    float _1233 = in.m_76.z;
    float _1235 = 1.0 / _1221;
    float _1237 = _1227 * (-2.0);
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1241 = float(_1065);
    float _1243 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1245 = 1.0 / _1225;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1249 = 1.0 + _1247;
    int _1251 = int(_1167);
    int _1253 = _1179 ? 2 : 0;
    int _1255 = _1251 | _1253;
    int _1257 = _947 ? 4 : 0;
    int _1259 = _1255 | _1257;
    int _1261 = _935 ? 8 : 0;
    int _1263 = _1259 | _1261;
    int _1265 = _1157 ? 16 : 0;
    int _1267 = _1263 | _1265;
    int _1269 = _1161 ? 32 : 0;
    int _1271 = _1267 | _1269;
    int _1273 = _1165 ? 64 : 0;
    int _1275 = _1271 | _1273;
    int _1277 = _1275 & 4;
    float _1279 = -_1239;
    float _1281 = fma(_1205, 2.0, _1279);
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1285 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1283);
    bool _1287 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1289 = isnan(0.0);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1295 = _1291 || _1293;
    float _1297 = _861 + _1243;
    float _1299 = 1.0 / _1241;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1303 = _1235 * _127;
    float _1305 = _1297 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1309 = !_1161;
    int _1311 = _1309 ? 0 : 1;
    float _1313 = 1.0 / _1249;
    float _1315 = _1295 ? _1143 : 0.0;
    float _1317 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1307);
    bool _1319 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1321 = isnan(1.0);
    bool _1323 = _1319 || _1321;
    bool _1325 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1327 = _1323 || _1325;
    float _1329 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1301);
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1333 = fma(_663, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1305);
    float _1335 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1317);
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1339 = abs(_1311);
    float _1341 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1331);
    float _1343 = fma(_665, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1333);
    float _1345 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1337);
    float _1347 = float(_929);
    float _1349 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1341);
    float _1351 = float(_1339);
    float _1353 = _1343 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1355 = _1245 * _127;
    float _1357 = _1299 * _127;
    float _1359 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1329);
    float _1361 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1345);
    float _1363 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1183);
    float _1365 = -_127;
    float _1367 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1211);
    float _1369 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1201);
    float _1371 = -_127;
    float _1373 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1281);
    float _1375 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1223);
    float _1377 = as_type<float>(_1277);
    if (_1327)
    {
        float _1379 = _1315 * _1313;
        _137 = _1379;
    }
    float _1381 = _137;
    float _1383 = _1351 * _1347;
    float _1385 = _795 + (-0.5);
    float _1387 = fma(_1237, _1229, _1229);
    int _1389 = _1179 ? 0 : 1;
    float _1391 = _1383 * (-2.0);
    float _1393 = 1.0 / _1285;
    float _1395 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1387);
    bool _1397 = !_1165;
    int _1399 = _1397 ? 0 : 1;
    float _1401 = fma(_1037, _1391, _1037);
    int _1403 = ~_1389;
    int _1405 = _1403 + 1;
    int _1407 = _1405 + 1;
    float _1409 = fma(_1391, _1231, _1231);
    int _1411 = _1407;
    if (!_1167)
    {
        int _1413 = ~_1389;
        int _1415 = _1413 + 1;
        _1411 = _1415;
    }
    int _1417 = _1411;
    float _1419 = _797 + (-0.5);
    int _1421 = abs(_1399);
    float _1423 = _1297 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1425 = float(_1417);
    float _1427 = fma(_1049, _1237, _1049);
    float _1429 = float(_1421);
    float _1431 = _795 + _685;
    float _1433 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1409);
    float _1435 = fma(_663, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1423);
    float _1437 = _1429 * _1425;
    float _1439 = _1431 + (-1.0);
    float _1441 = _685 + (-0.5);
    float _1443 = fma(_665, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1435);
    float _1445 = _1437 * (-2.0);
    float _1447 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1449 = fma(_1401, _1381, _1433);
    float _1451 = _1443 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1453 = fma(_1445, _1233, _1233);
    float _1455 = fma(_1447, _1445, _1447);
    float _1457 = fma(_1427, _1381, _1395);
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1461 = _1393 * _1459;
    float _1463 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1453);
    float _1465 = trunc(_1353);
    int _1467 = int(_1465);
    float _1469 = _1457 * 0.15915493667125701904296875;
    float _1471 = _1449 * 0.15915493667125701904296875;
    float _1473 = fma(_1455, _1381, _1463);
    bool _1475 = _1461 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1477 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    bool _1479 = _1461 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1481 = _1473 * 0.15915493667125701904296875;
    float _1483 = trunc(_1451);
    int _1485 = int(_1483);
    bool _1487 = !_1475;
    int _1489 = _1487 ? 0 : 1;
    float _1491 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1493 = _1127 * _1477;
    float _1495 = _1133 * _1491;
    float _1497 = _1469 * 6.283185482025146484375;
    float _1499 = cos(_1497);
    int _1501 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1503 = _1467 + _1501;
    int _1505 = _1503 + 1;
    int _1507 = 2;
    int _1509 = as_type<int>(_1495);
    if (!_1475)
    {
        _1507 = 1;
    }
    int _1511 = _1507;
    int _1513 = _1511;
    if (!_1479)
    {
        _1513 = _1489;
    }
    int _1515 = _1513;
    bool _1517 = _1505 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1519 = _1471 * 6.283185482025146484375;
    float _1521 = sin(_1519);
    int _1523 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1525 = _1485 + _1523;
    int _1527 = _1525 + 1;
    int _1529 = _1515 << 6;
    int _1531 = _1505 | _1527;
    int _1533 = _1529 + 96;
    uint _1536 = uint(int(uint(_1533) >> uint(2)));
    uint _1538 = uint(int(uint(int(_1536)) >> uint(2)));
    int _1540 = int(_1536) & 3;
    float _1542 = (*spvDescriptorSet0.vp_c15)._m0[int(_1538)][_1540];
    int _1544 = int(_1536) + 1;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    int _1548 = _1544 & 3;
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[int(_1546)][_1548];
    float _1552 = _1471 * 6.283185482025146484375;
    float _1554 = cos(_1552);
    bool _1556 = _1531 < 0;
    bool _1558 = _1556 || _1517;
    bool _1560 = _1527 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1562 = _1560 || _1558;
    int _1564 = _1529 + 48;
    uint _1566 = uint(int(uint(_1564) >> uint(2)));
    uint _1568 = uint(int(uint(int(_1566)) >> uint(2)));
    int _1570 = int(_1566) & 3;
    float _1572 = (*spvDescriptorSet0.vp_c15)._m0[int(_1568)][_1570];
    int _1574 = int(_1566) + 1;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    int _1578 = _1574 & 3;
    float _1580 = (*spvDescriptorSet0.vp_c15)._m0[int(_1576)][_1578];
    float _1582 = _1481 * 6.283185482025146484375;
    float _1584 = cos(_1582);
    float _1586 = _1499 * _1521;
    bool _1588 = _687 > 0.5;
    float _1590 = _1469 * 6.283185482025146484375;
    float _1592 = sin(_1590);
    float _1594 = _1499 * _1554;
    float _1596 = _1481 * 6.283185482025146484375;
    float _1598 = sin(_1596);
    float _1600 = _1499 * _1584;
    float _1602 = _1554 * _1584;
    float _1604 = _1600 * _1493;
    float _1606 = _1592 * _1521;
    float _1608 = _1592 * _1554;
    float _1610 = _1592 * _1584;
    float _1612 = _1521 * _1584;
    float _1614 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1616 = as_type<int>(_1594);
    if (!_1562)
    {
        float _1618 = floor(_1353);
        _731 = _1618;
    }
    float _1620 = _731;
    float _1622 = _1610 * _1493;
    float _1624 = fma(_1598, _1594, _1606);
    float _1626 = -_1586;
    float _1628 = fma(_1598, _1608, _1626);
    float _1630 = -_1608;
    float _1632 = fma(_1598, _1586, _1630);
    float _1634 = -_1493;
    float _1636 = _1598 * _1634;
    float _1638 = fma(_1624, _1495, _1604);
    int _1640 = _1529 + 64;
    uint _1642 = uint(int(uint(_1640) >> uint(2)));
    uint _1644 = uint(int(uint(int(_1642)) >> uint(2)));
    int _1646 = int(_1642) & 3;
    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[int(_1644)][_1646];
    int _1650 = int(_1642) + 1;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    int _1654 = _1650 & 3;
    float _1656 = (*spvDescriptorSet0.vp_c15)._m0[int(_1652)][_1654];
    float _1658 = fma(_1598, _1606, _1594);
    float _1660 = fma(_1602, _1495, _1636);
    float _1662 = fma(_1632, _1614, _1638);
    float _1664 = fma(_1628, _1495, _1622);
    if (!_1562)
    {
        int _1666 = _1527 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1668 = _1666 + _1505;
        _1616 = _1668;
    }
    int _1670 = _1616;
    float _1672 = fma(_1612, _1614, _1660);
    float _1674 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1676 = _1529 + 104;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    uint _1680 = uint(int(uint(int(_1678)) >> uint(2)));
    int _1682 = int(_1678) & 3;
    float _1684 = (*spvDescriptorSet0.vp_c15)._m0[int(_1680)][_1682];
    int _1686 = int(_1678) + 1;
    uint _1688 = uint(int(uint(_1686) >> uint(2)));
    int _1690 = _1686 & 3;
    float _1692 = (*spvDescriptorSet0.vp_c15)._m0[int(_1688)][_1690];
    float _1694 = fma(_1658, _1614, _1664);
    float _1696 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1698 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1674);
    int _1700 = 0;
    if (!_1562)
    {
        int _1702 = _1670 << 2;
        _1700 = _1702;
    }
    int _1704 = _1700;
    float _1706 = _1297 * _1580;
    float _1708 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1696);
    float _1710 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1698);
    int _1712 = _1704;
    float _1714 = _1710;
    if (!_1562)
    {
        uint _1716 = uint(int(uint(_1670) >> uint(2)));
        _1509 = int(_1716);
    }
    int _1718 = _1509;
    int _1720 = _1529 + 56;
    uint _1722 = uint(int(uint(_1720) >> uint(2)));
    uint _1724 = uint(int(uint(int(_1722)) >> uint(2)));
    int _1726 = int(_1722) & 3;
    float _1728 = (*spvDescriptorSet0.vp_c15)._m0[int(_1724)][_1726];
    int _1730 = int(_1722) + 1;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    int _1734 = _1730 & 3;
    float _1736 = (*spvDescriptorSet0.vp_c15)._m0[int(_1732)][_1734];
    if (!_1562)
    {
        int _1738 = 12 & _1704;
        _1712 = _1738;
    }
    int _1740 = _1712;
    float _1742 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1708);
    float _1744 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1746 = fma(_663, _1572, _1706);
    if (!_1562)
    {
        int _1748 = _1718 << 4;
        int _1750 = _1748 + _1740;
        _1714 = as_type<float>(_1750);
    }
    float _1752 = _1714;
    float _1754 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1756 = _665 + _1744;
    int _1758 = _1529 + 72;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
    int _1764 = int(_1760) & 3;
    float _1766 = (*spvDescriptorSet0.vp_c15)._m0[int(_1762)][_1764];
    int _1768 = int(_1760) + 1;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    int _1772 = _1768 & 3;
    float _1774 = (*spvDescriptorSet0.vp_c15)._m0[int(_1770)][_1772];
    float _1776 = _663 + _1754;
    float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1780 = _1756 + _1778;
    float _1782 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1784 = _1776 + _1782;
    float _1786 = _1780 * _1780;
    float _1788 = _1752;
    if (!_1562)
    {
        int _1790 = as_type<int>(_1752) + 400;
        uint _1792 = uint(int(uint(_1790) >> uint(2)));
        uint _1794 = uint(int(uint(int(_1792)) >> uint(2)));
        int _1796 = int(_1792) & 3;
        float _1798 = (*spvDescriptorSet0.vp_c15)._m0[int(_1794)][_1796];
        _1788 = _1798;
    }
    float _1800 = _1788;
    float _1802 = fma(_1784, _1784, _1786);
    float _1804 = _1297 * _1550;
    float _1806 = sqrt(_1802);
    float _1808 = fma(_663, _1542, _1804);
    float _1810 = -_197;
    int _1812 = _1588 ? as_type<int>(_1810) : as_type<int>(_197);
    int _1814 = _1529 + 80;
    uint _1816 = uint(int(uint(_1814) >> uint(2)));
    uint _1818 = uint(int(uint(int(_1816)) >> uint(2)));
    int _1820 = int(_1816) & 3;
    float _1822 = (*spvDescriptorSet0.vp_c15)._m0[int(_1818)][_1820];
    int _1824 = int(_1816) + 1;
    uint _1826 = uint(int(uint(_1824) >> uint(2)));
    int _1828 = _1824 & 3;
    float _1830 = (*spvDescriptorSet0.vp_c15)._m0[int(_1826)][_1828];
    bool _1832 = !_935;
    float _1834 = _1832 ? _197 : as_type<float>(_1812);
    int _1836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1838 = _1836 != 0;
    int _1840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1842 = _1840 != 0;
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1846 = _1844 != 0;
    int _1848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1850 = _1848 != 0;
    int _1852 = _1529 + 88;
    uint _1854 = uint(int(uint(_1852) >> uint(2)));
    uint _1856 = uint(int(uint(int(_1854)) >> uint(2)));
    int _1858 = int(_1854) & 3;
    float _1860 = (*spvDescriptorSet0.vp_c15)._m0[int(_1856)][_1858];
    int _1862 = int(_1854) + 1;
    uint _1864 = uint(int(uint(_1862) >> uint(2)));
    int _1866 = _1862 & 3;
    float _1868 = (*spvDescriptorSet0.vp_c15)._m0[int(_1864)][_1866];
    bool _1870 = !_1838;
    int _1872 = _1870 ? 0 : 1;
    float _1874 = fma(_665, _1684, _1808);
    float _1876 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1878 = _1297 * _1656;
    float _1880 = _1662;
    float _1882 = _1878;
    if (!_1562)
    {
        float _1884 = floor(_1451);
        _1880 = _1884;
    }
    float _1886 = _1880;
    float _1888 = _1874 + _1692;
    float _1890 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1876);
    bool _1892 = !_1842;
    int _1894 = _1892 ? 0 : 1;
    float _1896 = fma(_663, _1648, _1878);
    bool _1898 = _1806 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1900 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1890);
    float _1902 = fma(_665, _1728, _1746);
    float _1904 = 1.0 / _1888;
    bool _1906 = !_1846;
    int _1908 = _1906 ? 0 : 1;
    float _1910 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1912 = _1902 + _1736;
    float _1914 = _861 + _1910;
    float _1916 = fma(_665, _1766, _1896);
    bool _1918 = !_1850;
    int _1920 = _1918 ? 0 : 1;
    float _1922 = _1896;
    float _1924 = _1912;
    if (!_1898)
    {
        _881 = _1776;
    }
    float _1926 = _881;
    float _1928 = _1916 + _1774;
    float _1930 = _1926;
    if (!_1898)
    {
        _1882 = _1756;
    }
    float _1932 = _1882;
    float _1934 = _1932;
    if (!_1898)
    {
        _1922 = _1914;
    }
    float _1936 = _1922;
    bool _1938 = !_1898;
    float _1940 = _1936;
    if (!_1938)
    {
        float _1942 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1944 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1946 = _1806 + _1944;
        float _1948 = rsqrt(_1802);
        float _1950 = _1946 * _1942;
        float _1952 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1954 = _1950 * 0.15915493667125701904296875;
        float _1956 = _1954 * 6.283185482025146484375;
        float _1958 = cos(_1956);
        float _1960 = _1954 * 6.283185482025146484375;
        float _1962 = sin(_1960);
        float _1964 = _1958 + (-1.0);
        float _1966 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1968 = fma(_1962, _1952, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1970 = fma(_1914, _1958, _1966);
        float _1972 = _1948 * _1968;
        float _1974 = fma(_1784, _1972, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1976 = fma(_1780, _1972, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1940 = _1970;
        _1930 = _1974;
        _1934 = _1976;
    }
    float _1978 = _1940;
    float _1980 = _1930;
    float _1982 = _1934;
    float _1984 = _1928 * _1904;
    float _1986 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1988 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1990 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1992 = _1912 * _1904;
    float _1994 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1986);
    float _1996 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1988);
    float _1998 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1990);
    float _2000 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2002 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1994);
    bool _2004 = _1992 >= 0.0;
    float _2006 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1996);
    float _2008 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1998);
    float _2010 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2012 = _1992 <= 1.0;
    bool _2014 = _2012 && _2004;
    if (!_1562)
    {
        float _2016 = rint(_1800);
        float _2018 = precise::max(_2016, 0.0);
        uint _2020 = uint(_2018);
        uint _2022 = clamp(_2020, 0u, 65535u);
        _1924 = as_type<float>(_2022);
    }
    float _2024 = _1924;
    float _2026 = _2006 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2028 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2030 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2032 = _1984 >= 0.0;
    bool _2034 = _2032 && _2014;
    float _2036 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2038 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2040 = _1277 != 0;
    float _2042 = _2038;
    float _2044 = _2024;
    if (!_1562)
    {
        float _2046 = -_1886;
        float _2048 = _1451 + _2046;
        _1377 = _2048;
    }
    float _2050 = _1377;
    float _2052 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2000);
    float _2054 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2030);
    bool _2056 = _1984 <= 1.0;
    bool _2058 = _2056 && _2034;
    float _2060 = -_2038;
    float _2062 = fma(_2060, _2036, 1.0);
    float _2064 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2052);
    float _2066 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2054);
    float _2068 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2070 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2072 = log2(_2062);
    float _2074 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2066);
    float _2076 = _1297 * _1830;
    float _2078 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2080 = _2068;
    if (_2058)
    {
        float _2082 = float(_1515);
        _2042 = _2082;
    }
    float _2084 = _2042;
    float _2086 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2068);
    float _2088 = 1.0 / _2074;
    float _2090 = fma(_663, _1822, _2076);
    float _2092 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2078);
    float _2094 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2086);
    if (!_1562)
    {
        float _2096 = -_1620;
        float _2098 = _1353 + _2096;
        _2080 = _2098;
    }
    float _2100 = _2080;
    float _2102 = fma(_665, _1860, _2090);
    float _2104 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2092);
    float _2106 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2094);
    float _2108 = _2090;
    if (_2058)
    {
        float _2110 = rint(_2084);
        float _2112 = precise::max(_2110, 0.0);
        uint _2114 = uint(_2112);
        uint _2116 = clamp(_2114, 0u, 65535u);
        _2108 = as_type<float>(_2116);
    }
    float _2118 = _2108;
    float _2120 = _2102 + _1868;
    float _2122 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2104);
    float _2124 = _2072 * 0.693147182464599609375;
    float _2126 = _2120 * _1904;
    float _2128 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2130 = _2122 * _2088;
    float _2132 = _2106 * _2088;
    float _2134 = _2050;
    if (!_1562)
    {
        float3 _8485 = float3(_2100, _2050, float(as_type<int>(_2024)));
        float3 _8489 = select(_8485, float3(0.0), isnan(_8485));
        float _2136 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8489.xy, uint(rint(_8489.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8489.xy, uint(rint(_8489.z)), level(0.0)).x;
        _2134 = _2136;
    }
    float _2138 = _2134;
    float _2140 = fma(_2130, 0.5, 0.5);
    float _2142 = fma(_2132, -0.5, 0.5);
    float _2144 = _1984;
    if (_2058)
    {
        float3 _8508 = float3(_1992, _1984, float(as_type<int>(_2118)));
        float3 _8510 = select(_8508, float3(0.0), isnan(_8508));
        float _2146 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8510.xy, uint(rint(_8510.z)), _2126, level(0.0));
        _2144 = _2146;
    }
    float _2148 = _2144;
    float3 _8520 = float3(_2140, _2142, _2128);
    float _2150 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8520, float3(0.0), isnan(_8520)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8520, float3(0.0), isnan(_8520)), level(0.0)).x;
    float3 _8529 = float3(_2140, _2142, _2128);
    float4 _2153 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8529, float3(0.0), isnan(_8529)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8529, float3(0.0), isnan(_8529)), level(0.0)).xyzw;
    float _2155 = _2153.x;
    float _2157 = _2153.y;
    float _2159 = _2153.z;
    float _2161 = _2153.w;
    float _2163 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2165 = int(_2163);
    int _2167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2169 = _2167 != 0;
    float _2171 = _807 * _809;
    int _2173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2175 = _2173 != 0;
    int _2177 = abs(_1119);
    int _2179 = abs(_1125);
    float _2181 = trunc(_1355);
    int _2183 = int(_2181);
    int _2185 = abs(_1131);
    float _2187 = float(uint(_2165));
    float _2189 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2191 = int(_2189);
    int _2193 = ~_2165;
    int _2195 = _2193 + 1;
    float _2197 = _2118;
    if (_2169)
    {
        float _2199 = in.m_68.w;
        _2197 = _2199;
    }
    float _2201 = _2197;
    int _2203 = ~_2165;
    int _2205 = _2203 + 1;
    bool _2207 = _2165 == 0;
    float _2209 = 0.0;
    if (_2175)
    {
        float _2211 = in.m_68.x;
        _2209 = _2211;
    }
    float _2213 = _2209;
    float _2215 = float(uint(_2183));
    float _2217 = 1.0 / _2187;
    float _2219 = float(uint(_2191));
    float _2221 = trunc(_1303);
    int _2223 = int(_2221);
    int _2225 = as_type<int>(_2217) + (-2);
    float _2227 = 1.0 / _2219;
    float _2229 = _2201;
    if (_2169)
    {
        float _2231 = _2201 * 3.1415927410125732421875;
        _2229 = _2231;
    }
    float _2233 = _2229;
    float _2235 = as_type<float>(_2225) * _2215;
    if (_2169)
    {
        float _2237 = _2233 * 0.15915493667125701904296875;
        _2044 = _2237;
    }
    float _2239 = _2044;
    float _2241 = float(_2183);
    float _2243 = _811 * _795;
    float _2245 = trunc(_2235);
    float _2247 = precise::max(_2245, 0.0);
    uint _2249 = uint(_2247);
    float _2251 = _813 * _811;
    float _2253 = floor(_2243);
    int _2255 = _2195 * int(_2249);
    int _2257 = _2255 + _2183;
    float _2259 = _2239;
    if (_2169)
    {
        float _2261 = _2239 * 6.283185482025146484375;
        float _2263 = sin(_2261);
        _2259 = _2263;
    }
    float _2265 = _2259;
    float _2267 = float(uint(_2257));
    float _2269 = -_2253;
    float _2271 = _2243 + _2269;
    float _2273 = as_type<float>(_2225) * _2267;
    float _2275 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2277 = int(_2275);
    float _2279 = trunc(_2273);
    float _2281 = precise::max(_2279, 0.0);
    uint _2283 = uint(_2281);
    float _2285 = trunc(_1357);
    int _2287 = int(_2285);
    float _2289 = float(uint(_2277));
    int _2291 = int(_2249) + int(_2283);
    float _2293 = 1.0 / _2289;
    float _2295 = float(_2165);
    int _2297 = _2205 * _2291;
    int _2299 = _2297 + _2183;
    bool _2301 = _2241 >= _2295;
    bool _2303 = isnan(_2241);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan(_2295);
    bool _2309 = _2305 || _2307;
    float _2311 = float(_2309);
    float _2313 = _2271 * _2295;
    int _2315 = as_type<int>(_2227) + (-2);
    float _2317 = _2295 * _1029;
    float _2319 = float(uint(_2287));
    bool _2321 = uint(_2299) >= uint(_2165);
    float _2323 = trunc(_2313);
    int _2325 = int(_2323);
    float _2327 = float(_2287);
    float _2329 = as_type<float>(_2315) * _2319;
    bool _2331 = !_2321;
    int _2333 = _2331 ? 0 : (-1);
    bool _2335 = _2321;
    float _2337 = _2265;
    float _2339 = as_type<float>(_2325);
    if (_2169)
    {
        bool _2341 = _2265 > 0.5;
        _2335 = _2341;
    }
    bool _2343 = _2335;
    if (!_2169)
    {
        _2337 = _193;
    }
    float _2345 = _2337;
    float _2347 = trunc(_2311);
    int _2349 = int(_2347);
    int _2351 = ~_2291;
    int _2353 = _2351 + _2333;
    int _2355 = _2353 + 1;
    float _2357 = _2345;
    if (_2169)
    {
        float _2359 = -_193;
        float _2361 = _2343 ? _2359 : _193;
        _2357 = _2361;
    }
    float _2363 = _2357;
    bool _2365 = _1003 != 0;
    int _2367 = ~_2191;
    int _2369 = _2367 + 1;
    float _2371 = trunc(_2329);
    float _2373 = precise::max(_2371, 0.0);
    uint _2375 = uint(_2373);
    int _2377 = _2165 * _2355;
    int _2379 = _2377 + _2183;
    int _2381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2383 = _2381 != 0;
    bool _2385 = !_2383;
    int _2387 = _2385 ? 0 : 1;
    float _2389 = trunc(_2317);
    int _2391 = int(_2389);
    int _2393 = ~_2349;
    int _2395 = _2393 + 1;
    int _2397 = _2395 + 1;
    bool _2399 = !_2207;
    int _2401 = _2399 ? _2379 : (-1);
    int _2403 = abs(_2387);
    int _2405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2407 = _2405 != 0;
    int _2409 = _2369 * int(_2375);
    int _2411 = _2409 + _2287;
    int _2413 = _2401 * _2397;
    float _2415 = float(uint(_2411));
    int _2417 = _2165 + (-1);
    int _2419 = _2325 * _2403;
    int _2421 = _2419 + _2183;
    int _2423 = abs(as_type<int>(_1035));
    float _2425 = as_type<float>(_2315) * _2415;
    float _2427 = as_type<float>(_2349);
    bool _2429 = _2407;
    if (_2175)
    {
        float _2431 = _2213 * 3.1415927410125732421875;
        _1073 = _2431;
    }
    float _2433 = _1073;
    int _2435 = _2349 * _2417;
    int _2437 = _2435 + _2413;
    int _2439 = abs(_1041);
    bool _2441 = !_2407;
    int _2443 = _2441 ? 0 : 1;
    float _2445 = trunc(_2425);
    float _2447 = precise::max(_2445, 0.0);
    uint _2449 = uint(_2447);
    if (_2175)
    {
        float _2451 = _2433 * 0.15915493667125701904296875;
        _2427 = _2451;
    }
    float _2453 = _2427;
    int _2455 = abs(_1047);
    int _2457 = _2437 * _2423;
    int _2459 = abs(_2443);
    int _2461 = _2391 * _2439;
    int _2463 = _2461 + _2457;
    float _2465 = as_type<float>(_1047);
    if (_2175)
    {
        float _2467 = _2453 * 6.283185482025146484375;
        float _2469 = sin(_2467);
        _2465 = _2469;
    }
    float _2471 = _2465;
    int _2473 = ~_2165;
    int _2475 = _2473 + 1;
    int _2477 = _2421 * _2455;
    int _2479 = _2477 + _2463;
    float _2481 = float(_2191);
    int _2483 = _2325 * _2459;
    int _2485 = _2483 + _2479;
    int _2487 = int(_2375) + int(_2449);
    float _2489 = floor(_2171);
    int _2491 = ~_2191;
    int _2493 = _2491 + 1;
    float _2495 = float(uint(_2485));
    bool _2497 = _2327 >= _2481;
    bool _2499 = isnan(_2327);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan(_2481);
    bool _2505 = _2501 || _2503;
    float _2507 = float(_2505);
    if (_2175)
    {
        bool _2509 = _2471 > 0.5;
        _2429 = _2509;
    }
    bool _2511 = _2429;
    int _2513 = _2493 * _2487;
    int _2515 = _2513 + _2287;
    int _2517 = as_type<int>(_2293) + (-2);
    float _2519 = as_type<float>(_2225) * _2495;
    if (!_2175)
    {
        _2339 = _197;
    }
    float _2521 = _2339;
    float _2523 = trunc(_2507);
    int _2525 = int(_2523);
    float _2527 = float(uint(_2223));
    float _2529 = _2521;
    if (_2175)
    {
        float _2531 = -_197;
        float _2533 = _2511 ? _2531 : _197;
        _2529 = _2533;
    }
    float _2535 = _2529;
    float _2537 = -_2489;
    float _2539 = _2171 + _2537;
    bool _2541 = uint(_2515) >= uint(_2191);
    float _2543 = as_type<float>(_2517) * _2527;
    int _2545 = ~_2277;
    int _2547 = _2545 + 1;
    float _2549 = trunc(_2519);
    float _2551 = precise::max(_2549, 0.0);
    uint _2553 = uint(_2551);
    bool _2555 = !_2541;
    int _2557 = _2555 ? 0 : (-1);
    int _2559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2561 = _2559 != 0;
    int _2563 = ~_2487;
    int _2565 = _2563 + _2557;
    int _2567 = _2565 + 1;
    float _2569 = _2539 * _2481;
    bool _2571 = !_2561;
    int _2573 = _2571 ? 0 : 1;
    float _2575 = trunc(_2543);
    float _2577 = precise::max(_2575, 0.0);
    uint _2579 = uint(_2577);
    bool _2581 = _2191 == 0;
    int _2583 = _2191 * _2567;
    int _2585 = _2583 + _2287;
    int _2587 = ~_2525;
    int _2589 = _2587 + 1;
    int _2591 = _2589 + 1;
    float _2593 = _2481 * _1029;
    int _2595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2597 = _2595 != 0;
    int _2599 = _2191 + (-1);
    float _2601 = trunc(_2569);
    int _2603 = int(_2601);
    int _2605 = _2475 * int(_2553);
    int _2607 = _2605 + _2485;
    float _2609 = float(uint(_2607));
    float _2611 = trunc(_2593);
    int _2613 = int(_2611);
    int _2615 = abs(_2573);
    bool _2617 = !_2581;
    int _2619 = _2617 ? _2585 : (-1);
    float _2621 = as_type<float>(_2225) * _2609;
    int _2623 = _2619 * _2591;
    int _2625 = _2547 * int(_2579);
    int _2627 = _2625 + _2223;
    int _2629 = _2525 * _2599;
    int _2631 = _2629 + _2623;
    int _2633 = _2603 * _2615;
    int _2635 = _2633 + _2287;
    float _2637 = float(uint(_2627));
    float _2639 = trunc(_2621);
    float _2641 = precise::max(_2639, 0.0);
    uint _2643 = uint(_2641);
    bool _2645 = !_2597;
    int _2647 = _2645 ? 0 : 1;
    int _2649 = _2631 * _2177;
    float _2651 = as_type<float>(_2517) * _2637;
    int _2653 = abs(_2647);
    int _2655 = _2613 * _2179;
    int _2657 = _2655 + _2649;
    float _2659 = floor(_2251);
    int _2661 = ~_2165;
    int _2663 = _2661 + 1;
    int _2665 = _2635 * _2185;
    int _2667 = _2665 + _2657;
    int _2669 = ~_2165;
    int _2671 = _2669 + 1;
    int _2673 = ~_2191;
    int _2675 = _2673 + 1;
    int _2677 = _2603 * _2653;
    int _2679 = _2677 + _2667;
    float _2681 = trunc(_2651);
    float _2683 = precise::max(_2681, 0.0);
    uint _2685 = uint(_2683);
    int _2687 = int(_2553) + int(_2643);
    float _2689 = float(uint(_2421));
    int _2691 = ~_2277;
    int _2693 = _2691 + 1;
    int _2695 = _2671 * _2687;
    int _2697 = _2695 + _2485;
    int _2699 = ~_2191;
    int _2701 = _2699 + 1;
    float _2703 = -_2659;
    float _2705 = _2251 + _2703;
    bool _2707 = uint(_2697) >= uint(_2165);
    bool _2709 = !_2707;
    int _2711 = _2709 ? 0 : (-1);
    int _2713 = int(_2579) + int(_2685);
    float _2715 = as_type<float>(_2225) * _2689;
    float _2717 = float(uint(_2679));
    float _2719 = float(_2223);
    int _2721 = ~_2687;
    int _2723 = _2721 + _2711;
    int _2725 = _2723 + 1;
    float _2727 = as_type<float>(_2315) * _2717;
    float _2729 = trunc(_2715);
    float _2731 = precise::max(_2729, 0.0);
    uint _2733 = uint(_2731);
    int _2735 = _2693 * _2713;
    int _2737 = _2735 + _2223;
    bool _2739 = uint(_2737) >= uint(_2277);
    float _2741 = trunc(_2727);
    float _2743 = precise::max(_2741, 0.0);
    uint _2745 = uint(_2743);
    float _2747 = float(_2277);
    bool _2749 = !_2739;
    int _2751 = _2749 ? 0 : (-1);
    bool _2753 = _2719 >= _2747;
    bool _2755 = isnan(_2719);
    bool _2757 = _2753 || _2755;
    bool _2759 = isnan(_2747);
    bool _2761 = _2757 || _2759;
    float _2763 = float(_2761);
    int _2765 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2767 = _2765 != 0;
    int _2769 = _2663 * int(_2733);
    int _2771 = _2769 + _2421;
    float _2773 = _2747 * _1029;
    float _2775 = _2705 * _2747;
    float _2777 = trunc(_2763);
    int _2779 = int(_2777);
    int _2781 = _2165 * _2725;
    int _2783 = _2781 + _2485;
    float _2785 = float(uint(_2771));
    int _2787 = ~_2713;
    int _2789 = _2787 + _2751;
    int _2791 = _2789 + 1;
    int _2793 = _2675 * int(_2745);
    int _2795 = _2793 + _2679;
    float _2797 = -_197;
    int _2799 = _2040 ? as_type<int>(_2797) : as_type<int>(_197);
    float _2801 = as_type<float>(_2225) * _2785;
    int _2803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2805 = _2803 != 0;
    int _2807 = _2277 * _2791;
    int _2809 = _2807 + _2223;
    float _2811 = float(uint(_2795));
    float _2813 = trunc(_2773);
    int _2815 = int(_2813);
    float _2817 = -_193;
    int _2819 = _2365 ? as_type<int>(_2817) : as_type<int>(_193);
    bool _2821 = !_2207;
    int _2823 = _2821 ? _2783 : (-1);
    float _2825 = as_type<float>(_2315) * _2811;
    bool _2827 = !_2805;
    float _2829 = _2827 ? _193 : as_type<float>(_2819);
    int _2831 = _2823 & 3;
    bool _2833 = _2831 != 0;
    float _2835 = trunc(_2825);
    float _2837 = precise::max(_2835, 0.0);
    uint _2839 = uint(_2837);
    bool _2841 = _2277 == 0;
    bool _2843 = !_2767;
    float _2845 = _2843 ? _197 : as_type<float>(_2799);
    int _2847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2849 = _2847 != 0;
    int _2851 = _2833 ? 0 : 1;
    float _2853 = trunc(_2801);
    float _2855 = precise::max(_2853, 0.0);
    uint _2857 = uint(_2855);
    int _2859 = _2823 & 3;
    bool _2861 = _2859 != 0;
    int _2863 = ~_2779;
    int _2865 = _2863 + 1;
    int _2867 = _2865 + 1;
    bool _2869 = !_2841;
    int _2871 = _2869 ? _2809 : (-1);
    bool _2873 = !_2849;
    int _2875 = _2873 ? 0 : 1;
    float _2877 = trunc(_2775);
    int _2879 = int(_2877);
    bool _2881 = uint(_2859) > 1u;
    int _2883 = _2871 * _2867;
    int _2885 = _2277 + (-1);
    int _2887 = int(_2745) + int(_2839);
    int _2889 = abs(_1894);
    int _2891 = _2779 * _2885;
    int _2893 = _2891 + _2883;
    int _2895 = abs(_2875);
    int _2897 = _2893 * _2889;
    int _2899 = abs(_1872);
    int _2901 = ~_2851;
    int _2903 = _2901 + 1;
    int _2905 = _2903 + 1;
    int _2907 = _2905;
    if (!_2881)
    {
        int _2909 = ~_2851;
        int _2911 = _2909 + 1;
        _2907 = _2911;
    }
    int _2913 = _2907;
    int _2915 = _2701 * _2887;
    int _2917 = _2915 + _2679;
    bool _2919 = uint(_2859) >= 2u;
    int _2921 = _2879 * _2895;
    int _2923 = _2921 + _2223;
    int _2925 = _2919 ? 0 : 1;
    bool _2927 = uint(_2917) >= uint(_2191);
    int _2929 = _2815 * _2899;
    int _2931 = _2929 + _2897;
    float _2933 = float(uint(_2635));
    bool _2935 = !_2927;
    int _2937 = _2935 ? 0 : (-1);
    bool _2939 = _2859 != 3;
    float _2941 = as_type<float>(_2315) * _2933;
    int _2943 = abs(_1908);
    int _2945 = int(_2733) + int(_2857);
    float _2947 = trunc(_2941);
    float _2949 = precise::max(_2947, 0.0);
    uint _2951 = uint(_2949);
    int _2953 = ~_2165;
    int _2955 = _2953 + 1;
    int _2957 = _2923 * _2943;
    int _2959 = _2957 + _2931;
    int _2961 = ~_2887;
    int _2963 = _2961 + _2937;
    int _2965 = _2963 + 1;
    int _2967 = abs(_1920);
    int _2969 = _2955 * _2945;
    int _2971 = _2969 + _2421;
    int _2973 = ~_2925;
    int _2975 = _2973 + 1;
    int _2977 = _2975 + 1;
    int _2979 = _2191 * _2965;
    int _2981 = _2979 + _2679;
    int _2983 = _2977;
    if (_2939)
    {
        int _2985 = ~_2925;
        int _2987 = _2985 + 1;
        _2983 = _2987;
    }
    int _2989 = _2983;
    int _2991 = _2879 * _2967;
    int _2993 = _2991 + _2959;
    int _2995 = ~_2191;
    int _2997 = _2995 + 1;
    bool _2999 = uint(_2971) >= uint(_2165);
    bool _3001 = !_2581;
    int _3003 = _3001 ? _2981 : (-1);
    float _3005 = float(uint(_2993));
    bool _3007 = !_2999;
    int _3009 = _3007 ? 0 : (-1);
    float _3011 = as_type<float>(_2517) * _3005;
    int _3013 = _3003 & 3;
    bool _3015 = _3013 != 0;
    int _3017 = _2997 * int(_2951);
    int _3019 = _3017 + _2635;
    int _3021 = ~_2277;
    int _3023 = _3021 + 1;
    float _3025 = trunc(_3011);
    float _3027 = precise::max(_3025, 0.0);
    uint _3029 = uint(_3027);
    bool _3031 = !_3015;
    int _3033 = _3031 ? 0 : 1;
    int _3035 = _3003 & 3;
    bool _3037 = _3035 != 0;
    float _3039 = float(uint(_3019));
    int _3041 = _3037 ? 0 : 1;
    bool _3043 = uint(_3013) > 1u;
    float _3045 = as_type<float>(_2315) * _3039;
    float _3047 = float(uint(_2923));
    int _3049 = ~_3041;
    int _3051 = _3049 + 1;
    int _3053 = _3051 + 1;
    float _3055 = as_type<float>(_2517) * _3047;
    float _3057 = trunc(_3045);
    float _3059 = precise::max(_3057, 0.0);
    uint _3061 = uint(_3059);
    int _3063 = _3023 * int(_3029);
    int _3065 = _3063 + _2993;
    bool _3067 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3069 = isnan(0.5);
    bool _3071 = _3067 || _3069;
    bool _3073 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3075 = _3071 || _3073;
    int _3077 = _3053;
    if (!_3043)
    {
        int _3079 = ~_3041;
        int _3081 = _3079 + 1;
        _3077 = _3081;
    }
    int _3083 = _3077;
    bool _3085 = uint(_3013) >= 2u;
    float _3087 = trunc(_3055);
    float _3089 = precise::max(_3087, 0.0);
    uint _3091 = uint(_3089);
    float _3093 = float(uint(_3065));
    int _3095 = _3085 ? 0 : 1;
    bool _3097 = _3013 != 3;
    float _3099 = as_type<float>(_2517) * _3093;
    int _3101 = ~_2191;
    int _3103 = _3101 + 1;
    bool _3105 = !_3097;
    int _3107 = _3105 ? 0 : (-1);
    bool _3109 = _3013 != 3;
    float _3111 = trunc(_3099);
    float _3113 = precise::max(_3111, 0.0);
    uint _3115 = uint(_3113);
    int _3117 = ~_2277;
    int _3119 = _3117 + 1;
    int _3121 = int(_2951) + int(_3061);
    int _3123 = _3119 * int(_3091);
    int _3125 = _3123 + _2923;
    int _3127 = ~_3095;
    int _3129 = _3127 + 1;
    int _3131 = _3129 + 1;
    int _3133 = _3103 * _3121;
    int _3135 = _3133 + _2635;
    int _3137 = _3131;
    float _3139 = as_type<float>(_3119);
    if (_3109)
    {
        int _3141 = ~_3095;
        int _3143 = _3141 + 1;
        _3137 = _3143;
    }
    int _3145 = _3137;
    float _3147 = float(uint(_3125));
    bool _3149 = uint(_3135) >= uint(_2191);
    int _3151 = int(_3029) + int(_3115);
    float _3153 = as_type<float>(_2517) * _3147;
    bool _3155 = !_3149;
    int _3157 = _3155 ? 0 : (-1);
    float _3159 = trunc(_3153);
    float _3161 = precise::max(_3159, 0.0);
    uint _3163 = uint(_3161);
    int _3165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3167 = _3165 != 0;
    int _3169 = _3119 * _3151;
    int _3171 = _3169 + _2993;
    float _3173 = as_type<float>(_3115);
    if (_3075)
    {
        _3173 = 1.0;
    }
    float _3175 = _3173;
    bool _3177 = !_3167;
    int _3179 = _3177 ? 0 : 1;
    bool _3181 = uint(_3171) >= uint(_2277);
    float _3183 = _3175;
    if (_1562)
    {
        _3139 = 1.0;
    }
    float _3185 = _3139;
    bool _3187 = !_3181;
    int _3189 = _3187 ? 0 : (-1);
    bool _3191 = _795 > 0.5;
    int _3193 = int(_3091) + int(_3163);
    int _3195 = _2547 * _3193;
    int _3197 = _3195 + _2923;
    float _3199 = as_type<float>(_3163);
    float _3201 = _3185;
    float _3203 = _2148;
    if (!_3075)
    {
        float _3205 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3207 = _3205 * 0.15915493667125701904296875;
        float _3209 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3211 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3213 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3211;
        float _3215 = _3207 * 6.283185482025146484375;
        float _3217 = cos(_3215);
        float _3219 = _3209 * 0.15915493667125701904296875;
        float _3221 = _3207 * 6.283185482025146484375;
        float _3223 = sin(_3221);
        float _3225 = 1.0 / _3217;
        float _3227 = _3219 * 6.283185482025146484375;
        float _3229 = cos(_3227);
        float _3231 = _3223 * _3225;
        float _3233 = _3219 * 6.283185482025146484375;
        float _3235 = sin(_3233);
        float _3237 = _3229 * _3231;
        float _3239 = 1.0 / _3213;
        float _3241 = 1.0 / _3237;
        float _3243 = _3235 * _3241;
        float _3245 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3247 = fma(_1461, _3243, _3245);
        float _3249 = _3247 * _3239;
        float _3251 = precise::clamp(_3249, 0.0, 1.0);
        _3199 = _3213;
        _3183 = _3251;
    }
    float _3253 = _3199;
    float _3255 = _3183;
    bool _3257 = uint(_3197) >= uint(_2277);
    if (!_1562)
    {
        int _3259 = _1670 << 4;
        int _3261 = _3259 + 2048;
        uint _3263 = uint(int(uint(_3261) >> uint(2)));
        uint _3265 = uint(int(uint(int(_3263)) >> uint(2)));
        int _3267 = int(_3263) & 3;
        float _3269 = (*spvDescriptorSet0.vp_c15)._m0[int(_3265)][_3267];
        int _3271 = int(_3263) + 1;
        uint _3273 = uint(int(uint(_3271) >> uint(2)));
        int _3275 = _3271 & 3;
        float _3277 = (*spvDescriptorSet0.vp_c15)._m0[int(_3273)][_3275];
        int _3279 = _3261 + 8;
        uint _3281 = uint(int(uint(_3279) >> uint(2)));
        uint _3283 = uint(int(uint(int(_3281)) >> uint(2)));
        int _3285 = int(_3281) & 3;
        float _3287 = (*spvDescriptorSet0.vp_c15)._m0[int(_3283)][_3285];
        int _3289 = int(_3281) + 1;
        uint _3291 = uint(int(uint(_3289) >> uint(2)));
        int _3293 = _3289 & 3;
        float _3295 = (*spvDescriptorSet0.vp_c15)._m0[int(_3291)][_3293];
        float _3297 = _1297 * _3277;
        float _3299 = fma(_663, _3269, _3297);
        float _3301 = fma(_665, _3287, _3299);
        float _3303 = _3301 + _3295;
        float _3305 = precise::clamp(_3303, 0.0, 1.0);
        float _3307 = -_3305;
        float _3309 = _3307 + _2138;
        float _3311 = fma(_3309, 500.0, 1.5);
        float _3313 = exp2(_3311);
        float _3315 = 0.0 + _3313;
        float _3317 = precise::clamp(_3315, 0.0, 1.0);
        _3201 = _3317;
    }
    float _3319 = _3201;
    float _3321 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3323 = _1978 + _3321;
    float _3325 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3327 = _1980 + _3325;
    float _3329 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3331 = _1982 + _3329;
    float _3333 = _3323 * _3323;
    float _3335 = fma(_3327, _3327, _3333);
    float _3337 = fma(_3331, _3331, _3335);
    float _3339 = rsqrt(_3337);
    float _3341 = sqrt(_3337);
    float _3343 = _3339 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3345 = _3327 * _3343;
    float _3347 = _3331 * _3343;
    float _3349 = _3345 * _3345;
    float _3351 = _3347 * _3347;
    float _3353 = _3349 + _3351;
    float _3355 = sqrt(_3353);
    bool _3357 = _3355 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3359 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3361 = _3355 + _3359;
    float _3363 = _3339;
    float _3365 = _3361;
    float _3367 = _3323;
    float _3369 = _3353;
    float _3371 = _3349;
    if (_3357)
    {
        float _3373 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3363 = _3373;
    }
    float _3375 = _3363;
    float _3377 = _3375;
    if (_3357)
    {
        float _3379 = _3361 * _3375;
        _3365 = _3379;
    }
    float _3381 = _3365;
    if (_3357)
    {
        float _3383 = rsqrt(_3353);
        _3377 = _3383;
    }
    float _3385 = _3377;
    float _3387 = _3385;
    if (_3357)
    {
        float _3389 = _3381 * 0.15915493667125701904296875;
        _703 = _3389;
    }
    float _3391 = _703;
    float _3393 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3395 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_3357)
    {
        float _3397 = _3391 * 6.283185482025146484375;
        float _3399 = sin(_3397);
        _3395 = _3399;
    }
    float _3401 = _3395;
    float _3403 = precise::max(0.0, _3393);
    float _3405 = -_3343;
    float _3407 = -_3403;
    float _3409 = fma(_3323, _3405, _3407);
    float _3411 = _3403;
    if (!_3357)
    {
        _3411 = _3347;
    }
    float _3413 = _3411;
    float _3415 = _3253;
    float _3417 = _3413;
    if (_3357)
    {
        float _3419 = _3391 * 6.283185482025146484375;
        float _3421 = cos(_3419);
        _3415 = _3421;
    }
    float _3423 = _3415;
    if (_3357)
    {
        float _3425 = _3409 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3367 = _3425;
    }
    float _3427 = _3367;
    float _3429 = _3401;
    float _3431 = _3427;
    if (_3357)
    {
        float _3433 = fma(_3401, _3427, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3429 = _3433;
    }
    float _3435 = _3429;
    float _3437 = _3435;
    if (!_3357)
    {
        _3431 = _3409;
    }
    float _3439 = _3431;
    float _3441 = 0.0;
    float _3443 = _3439;
    if (_3357)
    {
        float _3445 = _3385 * _3435;
        _3441 = _3445;
    }
    float _3447 = _3441;
    if (!_3357)
    {
        _3437 = _3345;
    }
    float _3449 = _3437;
    float _3451 = _3449;
    if (_3357)
    {
        float _3453 = _3423 + (-1.0);
        _3387 = _3453;
    }
    float _3455 = _3387;
    float _3457 = _3455;
    if (_3357)
    {
        float _3459 = _3345 * _3447;
        _3451 = _3459;
    }
    float _3461 = _3451;
    if (_3357)
    {
        float _3463 = _3347 * _3447;
        _3417 = _3463;
    }
    float _3465 = _3417;
    if (_3357)
    {
        float _3467 = _3455 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3369 = _3467;
    }
    float _3469 = _3369;
    if (_3357)
    {
        float _3471 = _3461 * _3461;
        _3371 = _3471;
    }
    float _3473 = _3371;
    if (!_3357)
    {
        _3457 = _3351;
    }
    float _3475 = _3457;
    float _3477 = _3475;
    if (_3357)
    {
        float _3479 = _3465 * _3465;
        _3477 = _3479;
    }
    float _3481 = _3477;
    if (_3357)
    {
        float _3483 = fma(_3409, _3423, _3469);
        _3443 = _3483;
    }
    float _3485 = _3443;
    float _3487 = fma(_3485, _3485, _3473);
    float _3489 = _3487 + _3481;
    float _3491 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3493 = fma(_3341, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3491);
    float _3495 = precise::clamp(_3493, 0.0, 1.0);
    float _3497 = -_3495;
    float _3499 = _3497 + 1.0;
    float _3501 = rsqrt(_3489);
    float _3503 = abs(_3499);
    float _3505 = log2(_3503);
    float _3507 = _3501 * _3461;
    float _3509 = _3501 * _3485;
    float _3511 = _3501 * _3465;
    float _3513 = _3507 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3515 = -_3513;
    float _3517 = fma(_3509, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3515);
    float _3519 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3521 = -_3511;
    float _3523 = fma(_3521, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3517);
    float _3525 = exp2(_3519);
    float _3527 = fma(_3523, -0.5, 0.5);
    float _3529 = fma(_3523, 0.5, 0.5);
    float _3531 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3533 = _3531 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3535 = sqrt(_3527);
    float _3537 = fma(_3529, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3539 = fma(_3529, _3537, -0.212114393711090087890625);
    float _3541 = 1.0 / _3533;
    float _3543 = fma(_3529, _3539, 1.570728778839111328125);
    float _3545 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3547 = _3545 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3549 = _3509 + 1.0;
    float _3551 = -_3509;
    float _3553 = fma(_3525, _3549, _3551);
    float _3555 = _3535 * 0.636619746685028076171875;
    float _3557 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3559 = _3557 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3561 = 1.0 / _3547;
    float _3563 = fma(_3553, 0.5, 0.5);
    float _3565 = -_3543;
    float _3567 = fma(_3555, _3565, 1.0);
    float _3569 = 1.0 / _3559;
    float2 _10480 = float2(_3567, _3563);
    float3 _3573 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10480, float2(0.0), isnan(_10480)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10480, float2(0.0), isnan(_10480)), level(0.0)).xyz;
    float _3575 = _3573.x;
    float _3577 = _3573.y;
    float _3579 = _3573.z;
    float _3581 = -_1349;
    float _3583 = _3581 + 1.0;
    int _3585 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3587 = _3585 != 0;
    float _3589 = -_1219;
    float _3591 = _3589 + 1.0;
    float _3593 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3595 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3593;
    float _3597 = -_193;
    int _3599 = _3191 ? as_type<int>(_3597) : as_type<int>(_193);
    float _3601 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3603 = _3601 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _3605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3607 = _3605 != 0;
    float _3609 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3611 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3609;
    bool _3613 = !_3587;
    float _3615 = _3613 ? _193 : as_type<float>(_3599);
    float _3617 = _3595 * _3541;
    int _3619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3621 = _3619 != 0;
    float _3623 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3625 = _643 + _3623;
    bool _3627 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3629 = isnan(_643);
    bool _3631 = _3627 || _3629;
    bool _3633 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3635 = _3631 || _3633;
    float _3637 = float(_3635);
    float _3639 = _3603 * _3561;
    bool _3641 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3643 = isnan(_643);
    bool _3645 = _3641 || _3643;
    bool _3647 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3649 = _3645 || _3647;
    float _3651 = float(_3649);
    float _3653 = _3611 * _3569;
    bool _3655 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3657 = isnan(_643);
    bool _3659 = _3655 || _3657;
    bool _3661 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3663 = _3659 || _3661;
    float _3665 = float(_3663);
    float _3667 = -_3637;
    float _3669 = _3667 + 1.0;
    float _3671 = fma(_3617, _3625, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _3673 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3675 = isnan(_643);
    bool _3677 = _3673 || _3675;
    bool _3679 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3681 = _3677 || _3679;
    float _3683 = float(_3681);
    float _3685 = -_3651;
    float _3687 = _3685 + 1.0;
    float _3689 = _3665 * _3669;
    float _3691 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3693 = _3691 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3695 = -_3665;
    float _3697 = _3695 + 1.0;
    bool _3699 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3701 = isnan(_643);
    bool _3703 = _3699 || _3701;
    bool _3705 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3707 = _3703 || _3705;
    float _3709 = float(_3707);
    float _3711 = _3683 * _3687;
    float _3713 = -_3683;
    float _3715 = _3713 + 1.0;
    float _3717 = 1.0 / _3693;
    float _3719 = _3651 * _3697;
    bool _3721 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3723 = isnan(_643);
    bool _3725 = _3721 || _3723;
    bool _3727 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3729 = _3725 || _3727;
    float _3731 = float(_3729);
    float _3733 = _3709 * _3715;
    float _3735 = -_3709;
    float _3737 = _3735 + 1.0;
    bool _3739 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3741 = isnan(_643);
    bool _3743 = _3739 || _3741;
    bool _3745 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3747 = _3743 || _3745;
    float _3749 = float(_3747);
    float _3751 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3753 = -_3731;
    float _3755 = _3753 + 1.0;
    bool _3757 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3759 = isnan(_643);
    bool _3761 = _3757 || _3759;
    bool _3763 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3765 = _3761 || _3763;
    float _3767 = float(_3765);
    float _3769 = -_3749;
    float _3771 = _3769 + 1.0;
    float _3773 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3775 = _3773 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3777 = _3749 * _3755;
    float _3779 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3781 = _3779 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3783 = _3767 * _3771;
    float _3785 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3787 = _3785 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3789 = 1.0 / _3775;
    float _3791 = _3731 * _3737;
    float _3793 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3795 = _3793 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3797 = _3671 * _3783;
    float _3799 = -_3767;
    float _3801 = _3799 + 1.0;
    float _3803 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3805 = _643 + _3803;
    float _3807 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3809 = 1.0 / _3795;
    float _3811 = _3781 * _3717;
    float _3813 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3815 = _643 + _3813;
    float _3817 = fma(_3801, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3797);
    float _3819 = fma(_3653, _3805, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3821 = fma(_3639, _3815, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _3823 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3825 = _643 + _3823;
    float _3827 = 1.0 / _3787;
    float _3829 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3831 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3829;
    float _3833 = fma(_3821, _3777, _3817);
    float _3835 = fma(_3811, _3825, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3837 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3839 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3837;
    float _3841 = _3831 * _3789;
    float _3843 = fma(_3819, _3791, _3833);
    float _3845 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3847 = _643 + _3845;
    float _3849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3851 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3853 = _3851 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3855 = fma(_3835, _3733, _3843);
    float _3857 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3859 = _643 + _3857;
    float _3861 = fma(_3841, _3847, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3863 = _3853 * _3809;
    float _3865 = _2535 + (-0.5);
    int _3867 = abs(_3107);
    float _3869 = _3839 * _3827;
    float _3871 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3873 = _643 + _3871;
    float _3875 = _2363 + 0.5;
    float _3877 = fma(_3861, _3711, _3855);
    float _3879 = fma(_3869, _3859, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3881 = fma(_3863, _3873, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3883 = abs(_1461);
    float _3885 = log2(_3883);
    float _3887 = fma(_3875, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1115);
    float _3889 = _3615 + 0.5;
    float _3891 = _2845 + (-0.5);
    float _3893 = fma(_3881, _3719, _3877);
    float _3895 = -_3865;
    float _3897 = -_1121;
    float _3899 = fma(_3895, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3897);
    float _3901 = fma(_3889, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1107);
    float _3903 = -_3891;
    float _3905 = -_1067;
    float _3907 = fma(_3903, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3905);
    float _3909 = _3849 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3911 = _2829 + 0.5;
    float _3913 = fma(_3879, _3689, _3893);
    float _3915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3917 = -_3583;
    float _3919 = fma(_3615, _3917, _3901);
    float _3921 = fma(_3909, _3911, _1367);
    float _3923 = fma(_3637, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3913);
    float _3925 = -_1085;
    float _3927 = _3925 + 1.0;
    float _3929 = _3885 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3931 = -_1363;
    float _3933 = _3931 + 1.0;
    int _3935 = _3003 >> 31;
    float _3937 = fma(_3927, _2535, _3899);
    float _3939 = -_1359;
    float _3941 = _3939 + 1.0;
    float _3943 = -_1099;
    float _3945 = _3943 + 1.0;
    float _3947 = exp2(_3929);
    int _3949 = _3935 & 3;
    float _3951 = _1834 + (-0.5);
    float _3953 = -_3945;
    float _3955 = fma(_3953, _2363, _3887);
    int _3957 = _3003 + _3949;
    float _3959 = _3915 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3961 = fma(_2845, _3941, _3907);
    float _3963 = -_3933;
    float _3965 = fma(_2829, _3963, _3921);
    int _3967 = _3957 >> 2;
    float _3969 = -_3959;
    float _3971 = -_1369;
    float _3973 = fma(_3969, _3951, _3971);
    out.m_78.x = _3955;
    out.m_78.y = _3937;
    bool _3975 = !_3257;
    int _3977 = _3975 ? 0 : (-1);
    float _3979 = exp2(_3807);
    float _3981 = fma(_1834, _3591, _3973);
    float _3983 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3985 = fma(_3947, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3987 = precise::clamp(_3985, 0.0, 1.0);
    int _3989 = _3967 << 4;
    int _3991 = _3989 + 656;
    out.m_80.x = _3923;
    float _3993 = -_1598;
    float _3995 = fma(_3993, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3983);
    int _3997 = ~_3151;
    int _3999 = _3997 + _3189;
    int _4001 = _3999 + 1;
    uint _4003 = uint(int(uint(_3991) >> uint(2)));
    uint _4005 = uint(int(uint(int(_4003)) >> uint(2)));
    int _4007 = int(_4003) & 3;
    float _4009 = (*spvDescriptorSet0.vp_c9)._m0[int(_4005)][_4007];
    int _4011 = int(_4003) + 1;
    uint _4013 = uint(int(uint(_4011) >> uint(2)));
    int _4015 = _4011 & 3;
    float _4017 = (*spvDescriptorSet0.vp_c9)._m0[int(_4013)][_4015];
    out.m_82.x = _3919;
    out.m_82.y = _3961;
    out.m_82.z = _3965;
    out.m_82.w = _3981;
    float _4019 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3995);
    int _4021 = ~_3193;
    int _4023 = _4021 + _3977;
    int _4025 = _4023 + 1;
    int _4027 = _2277 * _4001;
    int _4029 = _4027 + _2993;
    int _4031 = ~_3121;
    int _4033 = _4031 + _3157;
    int _4035 = _4033 + 1;
    float _4037 = -_683;
    float _4039 = _4037 + 1.0;
    bool _4041 = !_2861;
    int _4043 = _4041 ? 0 : 1;
    int _4045 = _3991 + 8;
    uint _4047 = uint(int(uint(_4045) >> uint(2)));
    uint _4049 = uint(int(uint(int(_4047)) >> uint(2)));
    int _4051 = int(_4047) & 3;
    float _4053 = (*spvDescriptorSet0.vp_c9)._m0[int(_4049)][_4051];
    int _4055 = int(_4047) + 1;
    uint _4057 = uint(int(uint(_4055) >> uint(2)));
    int _4059 = _4055 & 3;
    float _4061 = (*spvDescriptorSet0.vp_c9)._m0[int(_4057)][_4059];
    int _4063 = _2277 * _4025;
    int _4065 = _4063 + _2923;
    bool _4067 = !_2841;
    int _4069 = _4067 ? _4029 : (-1);
    int _4071 = _2191 * _4035;
    int _4073 = _4071 + _2635;
    int _4075 = abs(_2913);
    int _4077 = _4069 & 3;
    bool _4079 = _4077 != 0;
    float _4081 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4083 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4085 = _1624 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4087 = _1624 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4089 = -_1598;
    float _4091 = fma(_4089, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4081);
    float _4093 = -_1598;
    float _4095 = fma(_4093, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4083);
    float _4097 = _1624 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4099 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4085);
    float _4101 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4091);
    float _4103 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4095);
    float _4105 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4087);
    float _4107 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4109 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4111 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4097);
    float _4113 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4115 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4099);
    float _4117 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4107);
    float _4119 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4105);
    float _4121 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4111);
    float _4123 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4109);
    float _4125 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4113);
    float _4127 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4129 = _3751 * _4019;
    int _4131 = abs(_3083);
    float _4133 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4117);
    float _4135 = _3751 * _4101;
    float _4137 = fma(_4127, _4115, _4129);
    out.m_84.x = _4115;
    out.m_84.y = _4119;
    out.m_84.z = _4121;
    int _4139 = abs(_3033);
    float _4141 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4123);
    float _4143 = _3751 * _4103;
    float _4145 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4147 = int(_4145);
    float _4149 = fma(_4127, _4119, _4135);
    float _4151 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4125);
    float _4153 = fma(_4127, _4121, _4143);
    int _4155 = _2823 >> 31;
    int _4157 = abs(_4043);
    int _4159 = ~_4131;
    int _4161 = _4159 + 1;
    int _4163 = _4161 + 1;
    int _4165 = ~_4139;
    int _4167 = _4165 + 1;
    int _4169 = _4167 + 1;
    int _4171 = abs(_3145);
    int _4173 = _4163 * as_type<int>(_4017);
    int _4175 = _4155 & 3;
    float _4177 = float(uint(_4147));
    int _4179 = _4169 * as_type<int>(_4009);
    int _4181 = _4179 + _4173;
    int _4183 = ~_4171;
    int _4185 = _4183 + 1;
    int _4187 = _4185 + 1;
    int _4189 = ~_3867;
    int _4191 = _4189 + 1;
    int _4193 = _4191 + 1;
    float _4195 = 1.0 / _4177;
    int _4197 = _2823 + _4175;
    int _4199 = _4187 * as_type<int>(_4053);
    int _4201 = _4199 + _4181;
    int _4203 = abs(_4147);
    float _4205 = fma(_3751, _3751, 1.0);
    int _4207 = abs(_3179);
    int _4209 = _4193 * as_type<int>(_4061);
    int _4211 = _4209 + _4201;
    int _4213 = _4197 >> 2;
    float _4215 = rsqrt(_4205);
    float _4217 = float(uint(_4203));
    int _4219 = _4213 << 4;
    int _4221 = _4219 + 368;
    int _4223 = ~_4207;
    int _4225 = _4223 + 1;
    int _4227 = _4225 + 1;
    int _4229 = _4069 >> 31;
    float _4231 = 1.0 / _4217;
    bool _4233 = !_2581;
    int _4235 = _4233 ? _4073 : (-1);
    int _4237 = _4211 * _4227;
    int _4239 = _4229 & 3;
    int _4241 = as_type<int>(_4195) + (-2);
    int _4243 = _4235 * _4207;
    int _4245 = _4243 + _4237;
    int _4247 = _4069 + _4239;
    uint _4249 = uint(int(uint(_4221) >> uint(2)));
    uint _4251 = uint(int(uint(int(_4249)) >> uint(2)));
    int _4253 = int(_4249) & 3;
    float _4255 = (*spvDescriptorSet0.vp_c9)._m0[int(_4251)][_4253];
    int _4257 = int(_4249) + 1;
    uint _4259 = uint(int(uint(_4257) >> uint(2)));
    int _4261 = _4257 & 3;
    float _4263 = (*spvDescriptorSet0.vp_c9)._m0[int(_4259)][_4261];
    float _4265 = _3751 * _4215;
    int _4267 = _4069 & 3;
    bool _4269 = _4267 != 0;
    int _4271 = _4247 >> 2;
    float _4273 = -_4133;
    float _4275 = _4265 * _4273;
    float _4277 = float(uint(_4245));
    float _4279 = -_4141;
    float _4281 = _4265 * _4279;
    int _4283 = _4271 << 4;
    int _4285 = _4283 + 800;
    float _4287 = fma(_4215, _4019, _4275);
    int _4289 = abs(_4245);
    float _4291 = as_type<float>(_4241) * _4277;
    int _4293 = as_type<int>(_4231) + (-2);
    int _4295 = _4221 + 8;
    uint _4297 = uint(int(uint(_4295) >> uint(2)));
    uint _4299 = uint(int(uint(int(_4297)) >> uint(2)));
    int _4301 = int(_4297) & 3;
    float _4303 = (*spvDescriptorSet0.vp_c9)._m0[int(_4299)][_4301];
    int _4305 = int(_4297) + 1;
    uint _4307 = uint(int(uint(_4305) >> uint(2)));
    int _4309 = _4305 & 3;
    float _4311 = (*spvDescriptorSet0.vp_c9)._m0[int(_4307)][_4309];
    float _4313 = float(uint(_4289));
    float _4315 = trunc(_4291);
    float _4317 = precise::max(_4315, 0.0);
    uint _4319 = uint(_4317);
    int _4321 = _4079 ? 0 : 1;
    float _4323 = -_4151;
    float _4325 = _4265 * _4323;
    bool _4327 = uint(_4267) > 1u;
    float _4329 = as_type<float>(_4293) * _4313;
    int _4331 = ~_4147;
    int _4333 = _4331 + 1;
    uint _4335 = uint(int(uint(_4285) >> uint(2)));
    uint _4337 = uint(int(uint(int(_4335)) >> uint(2)));
    int _4339 = int(_4335) & 3;
    float _4341 = (*spvDescriptorSet0.vp_c9)._m0[int(_4337)][_4339];
    int _4343 = int(_4335) + 1;
    uint _4345 = uint(int(uint(_4343) >> uint(2)));
    int _4347 = _4343 & 3;
    float _4349 = (*spvDescriptorSet0.vp_c9)._m0[int(_4345)][_4347];
    int _4351 = ~_4321;
    int _4353 = _4351 + 1;
    int _4355 = _4353 + 1;
    float _4357 = fma(_4215, _4103, _4325);
    int _4359 = abs(_2989);
    float _4361 = trunc(_4329);
    float _4363 = precise::max(_4361, 0.0);
    uint _4365 = uint(_4363);
    int _4367 = ~_2945;
    int _4369 = _4367 + _3009;
    int _4371 = _4369 + 1;
    bool _4373 = _2165 == 0;
    int _4375 = _4285 + 8;
    uint _4377 = uint(int(uint(_4375) >> uint(2)));
    uint _4379 = uint(int(uint(int(_4377)) >> uint(2)));
    int _4381 = int(_4377) & 3;
    float _4383 = (*spvDescriptorSet0.vp_c9)._m0[int(_4379)][_4381];
    int _4385 = int(_4377) + 1;
    uint _4387 = uint(int(uint(_4385) >> uint(2)));
    int _4389 = _4385 & 3;
    float _4391 = (*spvDescriptorSet0.vp_c9)._m0[int(_4387)][_4389];
    bool _4393 = !_2841;
    int _4395 = _4393 ? _4065 : (-1);
    int _4397 = _2165 * _4371;
    int _4399 = _4397 + _2421;
    int _4401 = _4355;
    float _4403 = _4151;
    if (!_4327)
    {
        int _4405 = ~_4321;
        int _4407 = _4405 + 1;
        _4401 = _4407;
    }
    int _4409 = _4401;
    float _4411 = fma(_4215, _4101, _4281);
    bool _4413 = uint(_4267) >= 2u;
    int _4415 = _4333 * int(_4319);
    int _4417 = _4415 + _4245;
    int _4419 = ~_4203;
    int _4421 = _4419 + 1;
    int _4423 = _4413 ? 0 : 1;
    out.m_86.x = _4287;
    out.m_86.y = _4411;
    out.m_86.z = _4357;
    bool _4425 = _4267 != 3;
    int _4427 = _4421 * int(_4365);
    int _4429 = _4427 + _4289;
    float _4431 = float(uint(_4417));
    int _4433 = ~_4075;
    int _4435 = _4433 + 1;
    int _4437 = _4435 + 1;
    int _4439 = abs(_4409);
    float _4441 = as_type<float>(_4241) * _4431;
    float _4443 = float(uint(_4429));
    int _4445 = _4437 * as_type<int>(_4263);
    bool _4447 = !_4269;
    int _4449 = _4447 ? 0 : 1;
    float _4451 = trunc(_4441);
    float _4453 = precise::max(_4451, 0.0);
    uint _4455 = uint(_4453);
    float _4457 = as_type<float>(_4293) * _4443;
    int _4459 = ~_4423;
    int _4461 = _4459 + 1;
    int _4463 = _4461 + 1;
    int _4465 = _4463;
    if (_4425)
    {
        int _4467 = ~_4423;
        int _4469 = _4467 + 1;
        _4465 = _4469;
    }
    int _4471 = _4465;
    float _4473 = trunc(_4457);
    float _4475 = precise::max(_4473, 0.0);
    uint _4477 = uint(_4475);
    int _4479 = abs(_4449);
    int _4481 = ~_4439;
    int _4483 = _4481 + 1;
    int _4485 = _4483 + 1;
    int _4487 = abs(_4471);
    int _4489 = ~_4157;
    int _4491 = _4489 + 1;
    int _4493 = _4491 + 1;
    int _4495 = _4485 * as_type<int>(_4349);
    int _4497 = ~_4479;
    int _4499 = _4497 + 1;
    int _4501 = _4499 + 1;
    int _4503 = _4493 * as_type<int>(_4255);
    int _4505 = _4503 + _4445;
    int _4507 = ~_4487;
    int _4509 = _4507 + 1;
    int _4511 = _4509 + 1;
    int _4513 = _4501 * as_type<int>(_4341);
    int _4515 = _4513 + _4495;
    int _4517 = ~_4359;
    int _4519 = _4517 + 1;
    int _4521 = _4519 + 1;
    bool _4523 = _2859 != 3;
    int _4525 = _4511 * as_type<int>(_4383);
    int _4527 = _4525 + _4515;
    bool _4529 = _4267 != 3;
    int _4531 = _4521 * as_type<int>(_4303);
    int _4533 = _4531 + _4505;
    int _4535 = int(_4319) + int(_4455);
    float _4537 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4539 = !_4523;
    int _4541 = _4539 ? 0 : (-1);
    int _4543 = ~_4147;
    int _4545 = _4543 + 1;
    float _4547 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4537);
    bool _4549 = !_4529;
    int _4551 = _4549 ? 0 : (-1);
    int _4553 = abs(_4541);
    int _4555 = _4545 * _4535;
    int _4557 = _4555 + _4245;
    int _4559 = abs(_4551);
    float _4561 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4547);
    int _4563 = int(_4365) + int(_4477);
    int _4565 = ~_4203;
    int _4567 = _4565 + 1;
    bool _4569 = uint(_4557) >= uint(_4147);
    int _4571 = _4567 * _4563;
    int _4573 = _4571 + _4289;
    int _4575 = ~_4553;
    int _4577 = _4575 + 1;
    int _4579 = _4577 + 1;
    float _4581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4583 = ~_4559;
    int _4585 = _4583 + 1;
    int _4587 = _4585 + 1;
    bool _4589 = uint(_4573) >= uint(_4203);
    int _4591 = _4579 * as_type<int>(_4311);
    int _4593 = _4591 + _4533;
    bool _4595 = !_4569;
    int _4597 = _4595 ? 0 : (-1);
    int _4599 = _4587 * as_type<int>(_4391);
    int _4601 = _4599 + _4527;
    int _4603 = _4245 ^ _4147;
    float _4605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4607 = !_3621;
    int _4609 = _4607 ? 0 : 1;
    bool _4611 = !_4589;
    int _4613 = _4611 ? 0 : (-1);
    uint _4615 = uint(int(uint(_4603) >> uint(31)));
    bool _4617 = !_3607;
    int _4619 = _4617 ? 0 : 1;
    int _4621 = abs(_4609);
    int _4623 = ~_4613;
    int _4625 = _4563 + _4623;
    int _4627 = _4625 + 1;
    int _4629 = ~int(_4615);
    int _4631 = _4629 + 1;
    int _4633 = ~_4535;
    int _4635 = _4633 + _4597;
    int _4637 = _4635 + 1;
    int _4639 = abs(_4619);
    int _4641 = _4627 ^ _4631;
    int _4643 = _4147 * _4637;
    int _4645 = _4643 + _4245;
    int _4647 = ~_4639;
    int _4649 = _4647 + 1;
    int _4651 = _4649 + 1;
    bool _4653 = _4147 == 0;
    bool _4655 = _4147 == 0;
    int _4657 = _4593 * _4651;
    int _4659 = ~_4631;
    int _4661 = _4659 + _4641;
    int _4663 = _4661 + 1;
    int _4665 = ~_4621;
    int _4667 = _4665 + 1;
    int _4669 = _4667 + 1;
    bool _4671 = !_4653;
    int _4673 = _4671 ? _4645 : (-1);
    bool _4675 = !_4655;
    int _4677 = _4675 ? _4663 : (-1);
    int _4679 = _4601 * _4669;
    bool _4681 = !_4373;
    int _4683 = _4681 ? _4399 : (-1);
    float _4685 = _4581 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4687 = float(_4673);
    float _4689 = _4605 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4691 = float(_4677);
    int _4693 = _4683 * _4639;
    int _4695 = _4693 + _4657;
    float _4697 = _969 + 0.5;
    float _4699 = fma(_4685, _4687, _1373);
    float _4701 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4561);
    float _4703 = -_1375;
    float _4705 = fma(_4689, _4691, _4703);
    float _4707 = _2074 * 0.5;
    float _4709 = _1009 + (-0.5);
    float _4711 = fma(_4685, _4697, _4699);
    int _4713 = _4395 * _4621;
    int _4715 = _4713 + _4679;
    float _4717 = fma(_2106, -0.5, _4707);
    float _4719 = -_4689;
    float _4721 = fma(_4719, _4709, _4705);
    float _4723 = -_1335;
    float _4725 = _4723 + 1.0;
    float _4727 = -_1361;
    float _4729 = _4727 + 1.0;
    out.gl_Position.x = _2122;
    out.gl_Position.y = _2106;
    out.gl_Position.z = _4701;
    out.gl_Position.w = _2074;
    float _4731 = _4701 + _2074;
    float _4733 = fma(_1009, _4725, _4721);
    float _4735 = _2122 + _2074;
    float _4737 = -_4729;
    float _4739 = fma(_969, _4737, _4711);
    bool _4741 = _1461 <= 8000.0;
    bool _4743 = isnan(_1461);
    bool _4745 = _4741 || _4743;
    bool _4747 = isnan(8000.0);
    bool _4749 = _4745 || _4747;
    float _4751 = float(_4749);
    float _4753 = fma(_3987, -2.0, 3.0);
    float _4755 = _3987 * _3987;
    float _4757 = _4731 * 0.5;
    out.m_88.x = _4739;
    out.m_88.y = _4733;
    float _4759 = _4735 * 0.5;
    float _4761 = _4755 * _4753;
    float _4763 = float(_4695);
    float _4765 = _4133 + _4137;
    float _4767 = float(_4715);
    float _4769 = -_4761;
    float _4771 = _4769 + 1.0;
    out.m_90.x = _4759;
    out.m_90.y = _4717;
    out.m_90.z = _4757;
    out.m_90.w = _2074;
    float _4773 = _4141 + _4149;
    float _4775 = _4151 + _4153;
    float _4777 = fma(_4771, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4761);
    float _4779 = _4739;
    float _4781 = _4733;
    if (!_2058)
    {
        _4779 = 1.0;
    }
    float _4783 = _4779;
    out.m_92.x = _4763;
    float _4785 = _4783;
    if (_2058)
    {
        bool _4787 = _2148 >= _2126;
        bool _4789 = isnan(_2148);
        bool _4791 = _4787 || _4789;
        bool _4793 = isnan(_2126);
        bool _4795 = _4791 || _4793;
        float _4797 = float(_4795);
        _4785 = _4797;
    }
    float _4799 = _4785;
    float _4801 = _4751 * _4777;
    bool _4803 = _3341 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4805 = isnan(_3341);
    bool _4807 = _4803 || _4805;
    bool _4809 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4811 = _4807 || _4809;
    out.m_92.w = _4767;
    float _4813 = _4801 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4815 = -_3979;
    float _4817 = _4815 + 1.0;
    float _4819 = _4799 * _3319;
    out.m_94.x = _4765;
    out.m_94.y = _4773;
    out.m_94.z = _4775;
    float _4821 = _4039 * _4813;
    float _4823 = precise::clamp(_4821, 0.0, 1.0);
    float _4825 = _4817 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4827 = -_4823;
    float _4829 = fma(_4827, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4831 = _4825 * _2150;
    float _4833 = -_4825;
    float _4835 = _4833 + 1.0;
    float _4837 = _4835;
    float _4839 = _4825;
    if (!_4811)
    {
        _3203 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4841 = _3203;
    float _4843 = -_4819;
    float _4845 = fma(_4843, _4829, 1.0);
    float _4847 = precise::clamp(_4845, 0.0, 1.0);
    float _4849 = _2161 * _4831;
    float _4851 = _3579 * _4831;
    float _4853 = _2161 * _4835;
    float _4855 = _4847 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4857 = fma(_3575, _4849, _2155);
    float _4859 = fma(_3577, _4849, _2157);
    float _4861 = fma(_2161, _4851, _2159);
    float _4863 = _3255 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_96.x = _4855;
    float _4865 = _4847;
    float _4867 = _4841;
    float _4869 = _4841;
    if (!_4811)
    {
        _4403 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4871 = _4403;
    float _4873 = _4871;
    float _4875 = _4871;
    if (!_4811)
    {
        _4837 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4877 = _4837;
    out.m_98.x = _4857;
    out.m_98.y = _4859;
    out.m_98.z = _4861;
    out.m_98.w = _4853;
    float _4879 = _4877;
    float _4881 = _4877;
    if (!_4811)
    {
        _4781 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4883 = _4781;
    float _4885 = _4883;
    float _4887 = _4883;
    if (!_4811)
    {
        _4865 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4889 = _4865;
    float _4891 = _4889;
    float _4893 = _4889;
    if (!_4811)
    {
        _4839 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4895 = _4839;
    bool _4897 = !_4811;
    float _4899 = _4895;
    float _4901 = _4895;
    if (!_4897)
    {
        bool _4903 = _3341 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4905 = isnan(_3341);
        bool _4907 = _4903 || _4905;
        bool _4909 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4911 = _4907 || _4909;
        if (!_4911)
        {
            float _4913 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4915 = _3341 + _4913;
            float _4917 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4919 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4917;
            float _4921 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4923 = _4921 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4925 = 1.0 / _4919;
            float _4927 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4929 = _4927 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4931 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4933 = _4931 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4935 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4937 = _4935 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4939 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4941 = _4939 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4943 = _4915 * _4925;
            float _4945 = precise::clamp(_4943, 0.0, 1.0);
            float _4947 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4949 = _4947 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4951 = fma(_4945, _4923, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4953 = fma(_4945, _4949, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4955 = fma(_4945, _4929, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4957 = fma(_4945, _4933, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4959 = fma(_4945, _4937, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4961 = fma(_4945, _4941, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4875 = _4955;
            _4893 = _4959;
            _4869 = _4951;
            _4887 = _4957;
            _4881 = _4953;
            _4901 = _4961;
            _4963 = true;
        }
        else
        {
            bool _4965 = _3341 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4967 = isnan(_3341);
            bool _4969 = _4965 || _4967;
            bool _4971 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4973 = _4969 || _4971;
            if (!_4973)
            {
                _4867 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4975 = _4867;
            _4869 = _4975;
            if (!_4973)
            {
                _4873 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4977 = _4873;
            _4875 = _4977;
            if (!_4973)
            {
                _4879 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4979 = _4879;
            _4881 = _4979;
            if (!_4973)
            {
                _4885 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4981 = _4885;
            _4887 = _4981;
            if (!_4973)
            {
                _4891 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4983 = _4891;
            _4893 = _4983;
            if (!_4973)
            {
                _4899 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4985 = _4899;
            bool _4987 = !_4973;
            _4901 = _4985;
            if (!_4987)
            {
                bool _4989 = _3341 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4991 = isnan(_3341);
                bool _4993 = _4989 || _4991;
                bool _4995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4997 = _4993 || _4995;
                if (!_4997)
                {
                    float _4999 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5001 = _3341 + _4999;
                    float _5003 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5005 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5003;
                    float _5007 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5009 = _5007 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5011 = 1.0 / _5005;
                    float _5013 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5015 = _5013 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5017 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5019 = _5017 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5021 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5023 = _5021 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5025 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5027 = _5025 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5029 = _5001 * _5011;
                    float _5031 = precise::clamp(_5029, 0.0, 1.0);
                    float _5033 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5035 = _5033 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5037 = fma(_5031, _5009, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5039 = fma(_5031, _5035, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5041 = fma(_5031, _5015, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5043 = fma(_5031, _5019, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5045 = fma(_5031, _5023, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5047 = fma(_5031, _5027, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4875 = _5041;
                    _4893 = _5045;
                    _4869 = _5037;
                    _4887 = _5043;
                    _4881 = _5039;
                    _4901 = _5047;
                    _4963 = true;
                }
                else
                {
                    _4875 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4893 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4869 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4887 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4881 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4901 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4963 = false;
    float _5049 = _4875;
    float _5051 = _4893;
    float _5053 = _4869;
    float _5055 = _4887;
    float _5057 = _4881;
    float _5059 = _4901;
    float _5061 = fma(_4773, -0.5, 0.5);
    float _5063 = precise::clamp(_5061, 0.0, 1.0);
    float _5065 = -_5049;
    float _5067 = _5065 + _5051;
    float _5069 = _4863 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5071 = -_5053;
    float _5073 = _5071 + _5055;
    float _5075 = fma(_5063, _5067, _5049);
    out.m_100.x = 0.0;
    float _5077 = -_5057;
    float _5079 = _5077 + _5059;
    float _5081 = fma(_5063, _5073, _5053);
    float _5083 = _5075 * 0.586610972881317138671875;
    out.m_63.x = _5069;
    bool _5085 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5087 = fma(_5063, _5079, _5057);
    float _5089 = fma(_5081, 0.298911988735198974609375, _5083);
    bool _5091 = _3255 > 0.0;
    bool _5093 = isnan(_3255);
    bool _5095 = _5091 || _5093;
    bool _5097 = isnan(0.0);
    bool _5099 = _5095 || _5097;
    float _5101 = fma(_5087, 0.114477999508380889892578125, _5089);
    float _5103 = -_5101;
    float _5105 = _5081 + _5103;
    float _5107 = -_5101;
    float _5109 = _5075 + _5107;
    float _5111 = -_5101;
    float _5113 = _5087 + _5111;
    float _5115 = fma(_5105, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5101);
    float _5117 = fma(_5109, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5101);
    float _5119 = fma(_5113, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5101);
    bool _5121 = !_5085;
    if (!_5121)
    {
        float _5123 = -_1978;
        float _5125 = _5123 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5127 = -_1980;
        float _5129 = _5127 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5131 = -_1982;
        float _5133 = _5131 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5135 = _5125 * _5125;
        float _5137 = fma(_5129, _5129, _5135);
        float _5139 = fma(_5133, _5133, _5137);
        float _5141 = sqrt(_5139);
        float _5143 = rsqrt(_5139);
        float _5145 = -_5141;
        float _5147 = _5145 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5149 = _5147 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5151 = precise::clamp(_5149, 0.0, 1.0);
        float _5153 = _5129 * _5143;
        float _5155 = _5125 * _5143;
        float _5157 = abs(_5151);
        float _5159 = log2(_5157);
        float _5161 = _5133 * _5143;
        float _5163 = _5153 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5165 = _4773 * _5155;
        float _5167 = -_5155;
        float _5169 = -_5163;
        float _5171 = fma(_5167, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5169);
        float _5173 = fma(_4765, _5153, _5165);
        float _5175 = -_5161;
        float _5177 = fma(_5175, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5171);
        float _5179 = fma(_4775, _5161, _5173);
        float _5181 = precise::clamp(_5179, 0.0, 1.0);
        float _5183 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5185 = _5177 + _5183;
        float _5187 = _5159 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5189 = _5185 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5191 = precise::clamp(_5189, 0.0, 1.0);
        float _5193 = exp2(_5187);
        float _5195 = _5193 * _5191;
        float _5197 = _5181 * _5195;
        float _5199 = _5197 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5201 = _5197 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5203 = _5197 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _5199;
        out.m_100.y = _5201;
        out.m_100.z = _5203;
    }
    out.m_102.x = _5115;
    out.m_102.y = _5117;
    out.m_102.z = _5119;
    if (_5099)
    {
        return out;
    }
    out.m_63.x = 0.0;
    float _5205 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5205;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4963 = false;
    bool _507 = false;
    bool _361 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_56.w;
    float _118 = in.m_58.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = _118;
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_63.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5273 = as_type<float>(_145);
        out.gl_Position.z = _5273;
    }
    if (!_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = float(_123);
    bool _161 = _127 >= _159;
    bool _163 = !_157;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _135;
    if (_165)
    {
        out.m_63.x = 0.0;
    }
    float _171 = _127 * _167;
    float _173 = _171;
    if (_165)
    {
        float _175 = _169 * 5.0;
        _147 = as_type<int>(_175);
    }
    int _177 = _147;
    out.m_61.x = _171;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5336 = as_type<float>(_177);
        out.gl_Position.z = _5336;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = as_type<int>(_179) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_179) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_181;
    float _217;
    if (!_199)
    {
        float _201 = in.m_68.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        _217 = _171;
    }
    _219 = false;
    float _221 = _217;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = _221 + _223;
    bool _227 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _229 = isnan(_221);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    bool _239 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _241 = isnan(_221);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = -_237;
    float _261 = _259 + 1.0;
    float _263 = 1.0 / _253;
    bool _265 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _267 = isnan(_221);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = _249 * _261;
    float _279 = -_249;
    float _281 = _279 + 1.0;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _285 = _275 * _281;
    float _287 = 1.0 / _257;
    float _289 = -_275;
    float _291 = _289 + 1.0;
    float _293 = _225 * _263;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _221 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _303;
    float _307 = fma(_301, _293, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _309 = fma(_305, _293, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _311 = _297 * _287;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _317 = _307 * _285;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = _309 * _285;
    float _325 = fma(_315, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _327 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[143].x, _317);
    float _329 = fma(_321, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _331 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[143].y, _323);
    float _333 = fma(_325, _277, _327);
    float _335 = fma(_329, _277, _331);
    float _337 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[145].x, _333);
    float _339 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[145].y, _335);
    bool _341 = !_283;
    float _359;
    if (!_341)
    {
        float _343 = in.m_68.x;
        float _345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _347 = _343 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _351 = _349 * _345;
        float _353 = floor(_351);
        float _355 = -_353;
        float _357 = _351 + _355;
        _359 = _357;
        _361 = true;
    }
    else
    {
        _359 = _171;
    }
    _361 = false;
    float _363 = _359;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _373 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _375 = isnan(_363);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _389 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _391 = isnan(_363);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _401;
    bool _405 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _407 = isnan(_363);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = 1.0 / _371;
    float _419 = -_383;
    float _421 = _419 + 1.0;
    bool _423 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _425 = _399 * _421;
    float _427 = -_399;
    float _429 = _427 + 1.0;
    float _431 = 1.0 / _387;
    float _433 = _403 * _417;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _439 = fma(_433, _367, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _441 = _437 * _431;
    float _443 = _439 * _425;
    float _445 = -_415;
    float _447 = _445 + 1.0;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _451 = _363 + _449;
    float _453 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[115].x, _443);
    float _455 = _383 * _447;
    float _457 = fma(_441, _451, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _461 = in.m_70.x;
    float _463 = in.m_70.y;
    float _465 = fma(_457, _455, _453);
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _469 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[117].x, _465);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _475 = _467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _477 = _471 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _479 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _469;
    out.m_72.y = _479;
    out.m_72.z = _475;
    out.m_72.w = _477;
    float _481 = _339 * _463;
    float _483 = _337 * _461;
    bool _485 = !_423;
    int _487 = as_type<int>(_477);
    float _505;
    if (!_485)
    {
        float _489 = in.m_68.x;
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _493 = _489 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _505 = _503;
        _507 = true;
    }
    else
    {
        _505 = _171;
    }
    _507 = false;
    float _509 = _505;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _513 = _509 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _519 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _521 = isnan(_509);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _535 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _537 = isnan(_509);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _547;
    bool _551 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _553 = isnan(_509);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = 1.0 / _517;
    float _565 = -_529;
    float _567 = _565 + 1.0;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _571 = _509 + _569;
    bool _573 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _575 = _545 * _567;
    float _577 = -_545;
    float _579 = _577 + 1.0;
    float _581 = 1.0 / _533;
    float _583 = _549 * _563;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _589 = fma(_583, _513, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _591 = _587 * _581;
    float _593 = -_561;
    float _595 = _593 + 1.0;
    float _597 = _589 * _575;
    float _599 = fma(_591, _571, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _601 = _529 * _595;
    float _603 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[131].x, _597);
    float _605 = fma(_599, _601, _603);
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _613 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[133].x, _605);
    float _615 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _619 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _621 = _613 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _615;
    out.m_74.y = _617;
    out.m_74.z = _619;
    out.m_74.w = _621;
    bool _623 = !_573;
    int _625 = as_type<int>(_615);
    if (!_623)
    {
        float _627 = in.m_68.x;
        float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _631 = _627 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _635 = _633 * _629;
        float _637 = floor(_635);
        float _639 = -_637;
        float _641 = _635 + _639;
        _173 = _641;
    }
    float _643 = _173;
    float _645 = in.m_56.x;
    float _647 = in.m_56.y;
    float _649 = in.m_56.z;
    float _651 = _647 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _653 = _647 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c10)._m0[4].x, _651);
    float _657 = fma(_645, (*spvDescriptorSet0.vp_c10)._m0[6].x, _653);
    float _659 = fma(_649, (*spvDescriptorSet0.vp_c10)._m0[4].z, _655);
    float _661 = fma(_649, (*spvDescriptorSet0.vp_c10)._m0[6].z, _657);
    float _663 = _659 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _665 = _661 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _667 = fma(_663, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _669 = fma(_665, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _671 = floor(_667);
    float _673 = floor(_669);
    float _675 = -_671;
    float _677 = _667 + _675;
    float _679 = -_673;
    float _681 = _669 + _679;
    float2 _6173 = float2(_677, _681);
    float _683 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6173, float2(0.0), isnan(_6173)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6173, float2(0.0), isnan(_6173)), level(0.0)).x;
    float _685 = in.m_68.z;
    float _687 = in.m_68.w;
    int _689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _691 = _689 != 0;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _695 = _671;
    float _697 = _669;
    float _699 = _667;
    float _701 = _681;
    float _703 = _665;
    if (_691)
    {
        float _705 = in.m_68.x;
        float _707 = in.m_68.y;
        _693 = _705;
        _695 = _707;
    }
    float _709 = _693;
    float _711 = _695;
    if (_691)
    {
        _625 = 0;
    }
    int _713 = _625;
    int _715 = _713;
    if (_691)
    {
        _487 = 0;
    }
    int _717 = _487;
    float _719 = 0.0;
    int _721 = _717;
    if (_691)
    {
        _719 = 1.0;
    }
    float _723 = _719;
    float _725 = _685 * 2.0;
    float _727 = 0.0;
    float _729 = _723;
    float _731 = _687;
    if (_691)
    {
        _727 = 1.0;
    }
    float _733 = _727;
    float _735 = floor(_725);
    float _737 = _709;
    float _739 = _711;
    float _741 = _733;
    if (_691)
    {
        _697 = _709;
    }
    float _743 = _697;
    float _745 = _743;
    if (_691)
    {
        _699 = _711;
    }
    float _747 = _699;
    bool _749 = _735 > 0.0;
    bool _751 = _735 >= 0.0;
    bool _753 = isnan(_735);
    bool _755 = _751 || _753;
    bool _757 = isnan(0.0);
    bool _759 = _755 || _757;
    float _761 = _735;
    float _763 = _747;
    if (_691)
    {
        _701 = _743;
    }
    float _765 = _701;
    float _767 = _765;
    if (_691)
    {
        _761 = _743;
    }
    float _769 = _761;
    float _771 = _769;
    if (!_691)
    {
        float _773 = in.m_68.x;
        float _775 = in.m_68.y;
        float _777 = in.m_68.z;
        float _779 = _773 * 3.1415927410125732421875;
        float _781 = _779 * 0.15915493667125701904296875;
        float _783 = _775 * 3.1415927410125732421875;
        float _785 = _783 * 0.15915493667125701904296875;
        float _787 = _781 * 6.283185482025146484375;
        float _789 = sin(_787);
        float _791 = _785 * 6.283185482025146484375;
        float _793 = sin(_791);
        _737 = _773;
        _739 = _775;
        _767 = _789;
        _763 = _793;
        _715 = 1;
        _721 = 2;
        _741 = 5.839270114898681640625;
        _771 = _777;
        _729 = 7.345489978790283203125;
        _745 = _775;
    }
    float _795 = _737;
    float _797 = _739;
    float _799 = _767;
    float _801 = _763;
    int _803 = _715;
    int _805 = _721;
    float _807 = _741;
    float _809 = _771;
    float _811 = _729;
    float _813 = _745;
    float _815 = _795 * 2.0;
    float _817 = _647 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _819 = _797 * 2.0;
    float _821 = fma(_645, (*spvDescriptorSet0.vp_c10)._m0[5].x, _817);
    float _823 = floor(_815);
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _827 = fma(_649, (*spvDescriptorSet0.vp_c10)._m0[5].z, _821);
    float _829 = _795 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _831 = _759 ? 0 : 1;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _835 = -_825;
    float _837 = fma(_829, 2.0, _835);
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _841 = _799 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _843 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[93].w, _833);
    int _845 = ~_831;
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _853 = _801 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _855 = -_839;
    float _857 = fma(_841, 2.0, _855);
    bool _859 = _823 > 0.0;
    float _861 = _827 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _863 = _823 >= 0.0;
    bool _865 = isnan(_823);
    bool _867 = _863 || _865;
    bool _869 = isnan(0.0);
    bool _871 = _867 || _869;
    float _873 = fma(_853, -2.0, _851);
    int _875 = _849;
    float _877 = as_type<float>(_803);
    float _879 = _827;
    float _881 = _861;
    if (!_749)
    {
        int _883 = ~_831;
        int _885 = _883 + 1;
        _875 = _885;
    }
    int _887 = _875;
    float _889 = _797 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _891 = _871 ? 0 : 1;
    float _893 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _895 = log2(_893);
    bool _897 = _803 != 1;
    float _899 = _861 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _901 = _805 != 2;
    float _903 = _797 + _795;
    float _905 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[10].x, _899);
    bool _907 = _685 > 0.5;
    float _909 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _911 = int(_909);
    int _913 = ~_891;
    int _915 = _913 + 1;
    int _917 = _915 + 1;
    float _919 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[10].z, _905);
    int _921 = _917;
    float _923 = _889;
    if (!_859)
    {
        int _925 = ~_891;
        int _927 = _925 + 1;
        _921 = _927;
    }
    int _929 = _921;
    float _931 = _861 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _935 = _933 != 0;
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _939 = _937 != 0;
    int _941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _943 = _941 != 0;
    float _945 = _919 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _947 = _797 > 0.5;
    float _949 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[11].x, _931);
    float _951 = _895 * _127;
    float _953 = -_193;
    int _955 = _947 ? as_type<int>(_953) : as_type<int>(_193);
    float _957 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[11].z, _949);
    float _959 = -_197;
    int _961 = _907 ? as_type<int>(_959) : as_type<int>(_197);
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _965 = _957 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _967 = !_939;
    float _969 = _967 ? _193 : as_type<float>(_955);
    float _971 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[93].z, _963);
    float _973 = floor(_819);
    float _975 = _903 + (-1.0);
    int _977 = int(_897);
    int _979 = _901 ? 2 : 0;
    int _981 = _977 | _979;
    int _983 = _947 ? 4 : 0;
    int _985 = _981 | _983;
    int _987 = _935 ? 8 : 0;
    int _989 = _985 | _987;
    int _991 = _939 ? 16 : 0;
    int _993 = _989 | _991;
    int _995 = _943 ? 32 : 0;
    int _997 = _993 | _995;
    int _999 = _907 ? 64 : 0;
    int _1001 = _997 | _999;
    int _1003 = _1001 & 64;
    float _1005 = _797 + _685;
    bool _1007 = !_943;
    float _1009 = _1007 ? _197 : as_type<float>(_961);
    float _1011 = _945 + _965;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1015 = _1013 != 0;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1023 = _1021 != 0;
    float _1025 = _1005 + (-1.0);
    float _1027 = 1.0 / _965;
    float _1029 = _167 * _127;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1033 = !_1019;
    float _1035 = _1033 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1037 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1039 = !_1015;
    int _1041 = _1039 ? 0 : 1;
    float _1043 = fma(_889, -2.0, _1031);
    bool _1045 = !_1023;
    int _1047 = _1045 ? 0 : 1;
    float _1049 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1053 = _1051 != 0;
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1061 = _1059 != 0;
    float _1063 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1065 = int(_1063);
    float _1067 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1043);
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _1071 = _949;
    float _1073 = _1035;
    if (!_897)
    {
        _923 = _685;
    }
    float _1075 = _923;
    float _1077 = _1011 * _1027;
    float _1079 = _1077 * 0.5;
    float _1081 = _1075;
    if (!_897)
    {
        _877 = _685;
    }
    float _1083 = _877;
    float _1085 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _843);
    float _1087 = _1083;
    if (!_897)
    {
        _1069 = _797;
    }
    float _1089 = _1069;
    float _1091 = exp2(_951);
    float _1093 = 0.0;
    float _1095 = _1089;
    if (!_897)
    {
        _1093 = _797;
    }
    float _1097 = _1093;
    float _1099 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _971);
    float _1101 = _1097;
    if (_901)
    {
        _879 = _797;
    }
    float _1103 = _879;
    float _1105 = -_127;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[76].x, _837);
    float _1109 = _1103;
    if (_901)
    {
        _1071 = _795;
    }
    float _1111 = _1071;
    float _1113 = -_127;
    float _1115 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[91].x, _857);
    bool _1117 = !_1057;
    int _1119 = _1117 ? 0 : 1;
    float _1121 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _873);
    bool _1123 = !_1053;
    int _1125 = _1123 ? 0 : 1;
    float _1127 = _481 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1129 = !_1061;
    int _1131 = _1129 ? 0 : 1;
    float _1133 = _483 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1135 = _1111;
    if (_897)
    {
        _1081 = _797;
    }
    float _1137 = _1081;
    if (_897)
    {
        _1087 = _797;
    }
    float _1139 = _1087;
    float _1141 = -_1091;
    float _1143 = _1141 + 1.0;
    if (_897)
    {
        _1095 = _795;
    }
    float _1145 = _1095;
    float _1147 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_897)
    {
        _1101 = _795;
    }
    float _1149 = _1101;
    if (!_901)
    {
        _1135 = _685;
    }
    float _1151 = _1135;
    if (!_901)
    {
        _1109 = _795;
    }
    float _1153 = _1109;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1157 = _1155 != 0;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1161 = _1159 != 0;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1165 = _1163 != 0;
    bool _1167 = _973 > 0.0;
    float _1169 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1171 = _973 >= 0.0;
    bool _1173 = isnan(_973);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan(0.0);
    bool _1179 = _1175 || _1177;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1183 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1181);
    float _1185 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1187 = int(_1185);
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1193 = !_1157;
    int _1195 = _1193 ? 0 : 1;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1199 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1189);
    float _1201 = fma(_1147, -2.0, _1191);
    float _1203 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1205 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1207 = abs(_1195);
    float _1209 = -_1197;
    float _1211 = fma(_1203, 2.0, _1209);
    float _1213 = float(_887);
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1217 = float(_1207);
    float _1219 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1199);
    float _1221 = float(_1187);
    float _1223 = fma(_1169, -2.0, _1215);
    float _1225 = float(_911);
    float _1227 = _1217 * _1213;
    float _1229 = in.m_76.x;
    float _1231 = in.m_76.y;
    float _1233 = in.m_76.z;
    float _1235 = 1.0 / _1221;
    float _1237 = _1227 * (-2.0);
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1241 = float(_1065);
    float _1243 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1245 = 1.0 / _1225;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1249 = 1.0 + _1247;
    int _1251 = int(_1167);
    int _1253 = _1179 ? 2 : 0;
    int _1255 = _1251 | _1253;
    int _1257 = _947 ? 4 : 0;
    int _1259 = _1255 | _1257;
    int _1261 = _935 ? 8 : 0;
    int _1263 = _1259 | _1261;
    int _1265 = _1157 ? 16 : 0;
    int _1267 = _1263 | _1265;
    int _1269 = _1161 ? 32 : 0;
    int _1271 = _1267 | _1269;
    int _1273 = _1165 ? 64 : 0;
    int _1275 = _1271 | _1273;
    int _1277 = _1275 & 4;
    float _1279 = -_1239;
    float _1281 = fma(_1205, 2.0, _1279);
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1285 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1283);
    bool _1287 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1289 = isnan(0.0);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1295 = _1291 || _1293;
    float _1297 = _861 + _1243;
    float _1299 = 1.0 / _1241;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1303 = _1235 * _127;
    float _1305 = _1297 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1309 = !_1161;
    int _1311 = _1309 ? 0 : 1;
    float _1313 = 1.0 / _1249;
    float _1315 = _1295 ? _1143 : 0.0;
    float _1317 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1307);
    bool _1319 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1321 = isnan(1.0);
    bool _1323 = _1319 || _1321;
    bool _1325 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1327 = _1323 || _1325;
    float _1329 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1301);
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1333 = fma(_663, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1305);
    float _1335 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1317);
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1339 = abs(_1311);
    float _1341 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1331);
    float _1343 = fma(_665, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1333);
    float _1345 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1337);
    float _1347 = float(_929);
    float _1349 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1341);
    float _1351 = float(_1339);
    float _1353 = _1343 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1355 = _1245 * _127;
    float _1357 = _1299 * _127;
    float _1359 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1329);
    float _1361 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1345);
    float _1363 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1183);
    float _1365 = -_127;
    float _1367 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1211);
    float _1369 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1201);
    float _1371 = -_127;
    float _1373 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1281);
    float _1375 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1223);
    float _1377 = as_type<float>(_1277);
    if (_1327)
    {
        float _1379 = _1315 * _1313;
        _137 = _1379;
    }
    float _1381 = _137;
    float _1383 = _1351 * _1347;
    float _1385 = _795 + (-0.5);
    float _1387 = fma(_1237, _1229, _1229);
    int _1389 = _1179 ? 0 : 1;
    float _1391 = _1383 * (-2.0);
    float _1393 = 1.0 / _1285;
    float _1395 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1387);
    bool _1397 = !_1165;
    int _1399 = _1397 ? 0 : 1;
    float _1401 = fma(_1037, _1391, _1037);
    int _1403 = ~_1389;
    int _1405 = _1403 + 1;
    int _1407 = _1405 + 1;
    float _1409 = fma(_1391, _1231, _1231);
    int _1411 = _1407;
    if (!_1167)
    {
        int _1413 = ~_1389;
        int _1415 = _1413 + 1;
        _1411 = _1415;
    }
    int _1417 = _1411;
    float _1419 = _797 + (-0.5);
    int _1421 = abs(_1399);
    float _1423 = _1297 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1425 = float(_1417);
    float _1427 = fma(_1049, _1237, _1049);
    float _1429 = float(_1421);
    float _1431 = _795 + _685;
    float _1433 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1409);
    float _1435 = fma(_663, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1423);
    float _1437 = _1429 * _1425;
    float _1439 = _1431 + (-1.0);
    float _1441 = _685 + (-0.5);
    float _1443 = fma(_665, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1435);
    float _1445 = _1437 * (-2.0);
    float _1447 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1449 = fma(_1401, _1381, _1433);
    float _1451 = _1443 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1453 = fma(_1445, _1233, _1233);
    float _1455 = fma(_1447, _1445, _1447);
    float _1457 = fma(_1427, _1381, _1395);
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1461 = _1393 * _1459;
    float _1463 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1453);
    float _1465 = trunc(_1353);
    int _1467 = int(_1465);
    float _1469 = _1457 * 0.15915493667125701904296875;
    float _1471 = _1449 * 0.15915493667125701904296875;
    float _1473 = fma(_1455, _1381, _1463);
    bool _1475 = _1461 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1477 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    bool _1479 = _1461 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1481 = _1473 * 0.15915493667125701904296875;
    float _1483 = trunc(_1451);
    int _1485 = int(_1483);
    bool _1487 = !_1475;
    int _1489 = _1487 ? 0 : 1;
    float _1491 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1493 = _1127 * _1477;
    float _1495 = _1133 * _1491;
    float _1497 = _1469 * 6.283185482025146484375;
    float _1499 = cos(_1497);
    int _1501 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1503 = _1467 + _1501;
    int _1505 = _1503 + 1;
    int _1507 = 2;
    int _1509 = as_type<int>(_1495);
    if (!_1475)
    {
        _1507 = 1;
    }
    int _1511 = _1507;
    int _1513 = _1511;
    if (!_1479)
    {
        _1513 = _1489;
    }
    int _1515 = _1513;
    bool _1517 = _1505 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1519 = _1471 * 6.283185482025146484375;
    float _1521 = sin(_1519);
    int _1523 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1525 = _1485 + _1523;
    int _1527 = _1525 + 1;
    int _1529 = _1515 << 6;
    int _1531 = _1505 | _1527;
    int _1533 = _1529 + 96;
    uint _1536 = uint(int(uint(_1533) >> uint(2)));
    uint _1538 = uint(int(uint(int(_1536)) >> uint(2)));
    int _1540 = int(_1536) & 3;
    float _1542 = (*spvDescriptorSet0.vp_c15)._m0[int(_1538)][_1540];
    int _1544 = int(_1536) + 1;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    int _1548 = _1544 & 3;
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[int(_1546)][_1548];
    float _1552 = _1471 * 6.283185482025146484375;
    float _1554 = cos(_1552);
    bool _1556 = _1531 < 0;
    bool _1558 = _1556 || _1517;
    bool _1560 = _1527 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1562 = _1560 || _1558;
    int _1564 = _1529 + 48;
    uint _1566 = uint(int(uint(_1564) >> uint(2)));
    uint _1568 = uint(int(uint(int(_1566)) >> uint(2)));
    int _1570 = int(_1566) & 3;
    float _1572 = (*spvDescriptorSet0.vp_c15)._m0[int(_1568)][_1570];
    int _1574 = int(_1566) + 1;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    int _1578 = _1574 & 3;
    float _1580 = (*spvDescriptorSet0.vp_c15)._m0[int(_1576)][_1578];
    float _1582 = _1481 * 6.283185482025146484375;
    float _1584 = cos(_1582);
    float _1586 = _1499 * _1521;
    bool _1588 = _687 > 0.5;
    float _1590 = _1469 * 6.283185482025146484375;
    float _1592 = sin(_1590);
    float _1594 = _1499 * _1554;
    float _1596 = _1481 * 6.283185482025146484375;
    float _1598 = sin(_1596);
    float _1600 = _1499 * _1584;
    float _1602 = _1554 * _1584;
    float _1604 = _1600 * _1493;
    float _1606 = _1592 * _1521;
    float _1608 = _1592 * _1554;
    float _1610 = _1592 * _1584;
    float _1612 = _1521 * _1584;
    float _1614 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1616 = as_type<int>(_1594);
    if (!_1562)
    {
        float _1618 = floor(_1353);
        _731 = _1618;
    }
    float _1620 = _731;
    float _1622 = _1610 * _1493;
    float _1624 = fma(_1598, _1594, _1606);
    float _1626 = -_1586;
    float _1628 = fma(_1598, _1608, _1626);
    float _1630 = -_1608;
    float _1632 = fma(_1598, _1586, _1630);
    float _1634 = -_1493;
    float _1636 = _1598 * _1634;
    float _1638 = fma(_1624, _1495, _1604);
    int _1640 = _1529 + 64;
    uint _1642 = uint(int(uint(_1640) >> uint(2)));
    uint _1644 = uint(int(uint(int(_1642)) >> uint(2)));
    int _1646 = int(_1642) & 3;
    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[int(_1644)][_1646];
    int _1650 = int(_1642) + 1;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    int _1654 = _1650 & 3;
    float _1656 = (*spvDescriptorSet0.vp_c15)._m0[int(_1652)][_1654];
    float _1658 = fma(_1598, _1606, _1594);
    float _1660 = fma(_1602, _1495, _1636);
    float _1662 = fma(_1632, _1614, _1638);
    float _1664 = fma(_1628, _1495, _1622);
    if (!_1562)
    {
        int _1666 = _1527 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1668 = _1666 + _1505;
        _1616 = _1668;
    }
    int _1670 = _1616;
    float _1672 = fma(_1612, _1614, _1660);
    float _1674 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1676 = _1529 + 104;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    uint _1680 = uint(int(uint(int(_1678)) >> uint(2)));
    int _1682 = int(_1678) & 3;
    float _1684 = (*spvDescriptorSet0.vp_c15)._m0[int(_1680)][_1682];
    int _1686 = int(_1678) + 1;
    uint _1688 = uint(int(uint(_1686) >> uint(2)));
    int _1690 = _1686 & 3;
    float _1692 = (*spvDescriptorSet0.vp_c15)._m0[int(_1688)][_1690];
    float _1694 = fma(_1658, _1614, _1664);
    float _1696 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1698 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1674);
    int _1700 = 0;
    if (!_1562)
    {
        int _1702 = _1670 << 2;
        _1700 = _1702;
    }
    int _1704 = _1700;
    float _1706 = _1297 * _1580;
    float _1708 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1696);
    float _1710 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1698);
    int _1712 = _1704;
    float _1714 = _1710;
    if (!_1562)
    {
        uint _1716 = uint(int(uint(_1670) >> uint(2)));
        _1509 = int(_1716);
    }
    int _1718 = _1509;
    int _1720 = _1529 + 56;
    uint _1722 = uint(int(uint(_1720) >> uint(2)));
    uint _1724 = uint(int(uint(int(_1722)) >> uint(2)));
    int _1726 = int(_1722) & 3;
    float _1728 = (*spvDescriptorSet0.vp_c15)._m0[int(_1724)][_1726];
    int _1730 = int(_1722) + 1;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    int _1734 = _1730 & 3;
    float _1736 = (*spvDescriptorSet0.vp_c15)._m0[int(_1732)][_1734];
    if (!_1562)
    {
        int _1738 = 12 & _1704;
        _1712 = _1738;
    }
    int _1740 = _1712;
    float _1742 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1708);
    float _1744 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1746 = fma(_663, _1572, _1706);
    if (!_1562)
    {
        int _1748 = _1718 << 4;
        int _1750 = _1748 + _1740;
        _1714 = as_type<float>(_1750);
    }
    float _1752 = _1714;
    float _1754 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1756 = _665 + _1744;
    int _1758 = _1529 + 72;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    uint _1762 = uint(int(uint(int(_1760)) >> uint(2)));
    int _1764 = int(_1760) & 3;
    float _1766 = (*spvDescriptorSet0.vp_c15)._m0[int(_1762)][_1764];
    int _1768 = int(_1760) + 1;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    int _1772 = _1768 & 3;
    float _1774 = (*spvDescriptorSet0.vp_c15)._m0[int(_1770)][_1772];
    float _1776 = _663 + _1754;
    float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1780 = _1756 + _1778;
    float _1782 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1784 = _1776 + _1782;
    float _1786 = _1780 * _1780;
    float _1788 = _1752;
    if (!_1562)
    {
        int _1790 = as_type<int>(_1752) + 400;
        uint _1792 = uint(int(uint(_1790) >> uint(2)));
        uint _1794 = uint(int(uint(int(_1792)) >> uint(2)));
        int _1796 = int(_1792) & 3;
        float _1798 = (*spvDescriptorSet0.vp_c15)._m0[int(_1794)][_1796];
        _1788 = _1798;
    }
    float _1800 = _1788;
    float _1802 = fma(_1784, _1784, _1786);
    float _1804 = _1297 * _1550;
    float _1806 = sqrt(_1802);
    float _1808 = fma(_663, _1542, _1804);
    float _1810 = -_197;
    int _1812 = _1588 ? as_type<int>(_1810) : as_type<int>(_197);
    int _1814 = _1529 + 80;
    uint _1816 = uint(int(uint(_1814) >> uint(2)));
    uint _1818 = uint(int(uint(int(_1816)) >> uint(2)));
    int _1820 = int(_1816) & 3;
    float _1822 = (*spvDescriptorSet0.vp_c15)._m0[int(_1818)][_1820];
    int _1824 = int(_1816) + 1;
    uint _1826 = uint(int(uint(_1824) >> uint(2)));
    int _1828 = _1824 & 3;
    float _1830 = (*spvDescriptorSet0.vp_c15)._m0[int(_1826)][_1828];
    bool _1832 = !_935;
    float _1834 = _1832 ? _197 : as_type<float>(_1812);
    int _1836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1838 = _1836 != 0;
    int _1840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1842 = _1840 != 0;
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1846 = _1844 != 0;
    int _1848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1850 = _1848 != 0;
    int _1852 = _1529 + 88;
    uint _1854 = uint(int(uint(_1852) >> uint(2)));
    uint _1856 = uint(int(uint(int(_1854)) >> uint(2)));
    int _1858 = int(_1854) & 3;
    float _1860 = (*spvDescriptorSet0.vp_c15)._m0[int(_1856)][_1858];
    int _1862 = int(_1854) + 1;
    uint _1864 = uint(int(uint(_1862) >> uint(2)));
    int _1866 = _1862 & 3;
    float _1868 = (*spvDescriptorSet0.vp_c15)._m0[int(_1864)][_1866];
    bool _1870 = !_1838;
    int _1872 = _1870 ? 0 : 1;
    float _1874 = fma(_665, _1684, _1808);
    float _1876 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1878 = _1297 * _1656;
    float _1880 = _1662;
    float _1882 = _1878;
    if (!_1562)
    {
        float _1884 = floor(_1451);
        _1880 = _1884;
    }
    float _1886 = _1880;
    float _1888 = _1874 + _1692;
    float _1890 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1876);
    bool _1892 = !_1842;
    int _1894 = _1892 ? 0 : 1;
    float _1896 = fma(_663, _1648, _1878);
    bool _1898 = _1806 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1900 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1890);
    float _1902 = fma(_665, _1728, _1746);
    float _1904 = 1.0 / _1888;
    bool _1906 = !_1846;
    int _1908 = _1906 ? 0 : 1;
    float _1910 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1912 = _1902 + _1736;
    float _1914 = _861 + _1910;
    float _1916 = fma(_665, _1766, _1896);
    bool _1918 = !_1850;
    int _1920 = _1918 ? 0 : 1;
    float _1922 = _1896;
    float _1924 = _1912;
    if (!_1898)
    {
        _881 = _1776;
    }
    float _1926 = _881;
    float _1928 = _1916 + _1774;
    float _1930 = _1926;
    if (!_1898)
    {
        _1882 = _1756;
    }
    float _1932 = _1882;
    float _1934 = _1932;
    if (!_1898)
    {
        _1922 = _1914;
    }
    float _1936 = _1922;
    bool _1938 = !_1898;
    float _1940 = _1936;
    if (!_1938)
    {
        float _1942 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1944 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1946 = _1806 + _1944;
        float _1948 = rsqrt(_1802);
        float _1950 = _1946 * _1942;
        float _1952 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1954 = _1950 * 0.15915493667125701904296875;
        float _1956 = _1954 * 6.283185482025146484375;
        float _1958 = cos(_1956);
        float _1960 = _1954 * 6.283185482025146484375;
        float _1962 = sin(_1960);
        float _1964 = _1958 + (-1.0);
        float _1966 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1968 = fma(_1962, _1952, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1970 = fma(_1914, _1958, _1966);
        float _1972 = _1948 * _1968;
        float _1974 = fma(_1784, _1972, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1976 = fma(_1780, _1972, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1940 = _1970;
        _1930 = _1974;
        _1934 = _1976;
    }
    float _1978 = _1940;
    float _1980 = _1930;
    float _1982 = _1934;
    float _1984 = _1928 * _1904;
    float _1986 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1988 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1990 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1992 = _1912 * _1904;
    float _1994 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1986);
    float _1996 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1988);
    float _1998 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1990);
    float _2000 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2002 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1994);
    bool _2004 = _1992 >= 0.0;
    float _2006 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1996);
    float _2008 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1998);
    float _2010 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2012 = _1992 <= 1.0;
    bool _2014 = _2012 && _2004;
    if (!_1562)
    {
        float _2016 = rint(_1800);
        float _2018 = precise::max(_2016, 0.0);
        uint _2020 = uint(_2018);
        uint _2022 = clamp(_2020, 0u, 65535u);
        _1924 = as_type<float>(_2022);
    }
    float _2024 = _1924;
    float _2026 = _2006 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2028 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2030 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2032 = _1984 >= 0.0;
    bool _2034 = _2032 && _2014;
    float _2036 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2038 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2040 = _1277 != 0;
    float _2042 = _2038;
    float _2044 = _2024;
    if (!_1562)
    {
        float _2046 = -_1886;
        float _2048 = _1451 + _2046;
        _1377 = _2048;
    }
    float _2050 = _1377;
    float _2052 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2000);
    float _2054 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2030);
    bool _2056 = _1984 <= 1.0;
    bool _2058 = _2056 && _2034;
    float _2060 = -_2038;
    float _2062 = fma(_2060, _2036, 1.0);
    float _2064 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2052);
    float _2066 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2054);
    float _2068 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2070 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2072 = log2(_2062);
    float _2074 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2066);
    float _2076 = _1297 * _1830;
    float _2078 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2080 = _2068;
    if (_2058)
    {
        float _2082 = float(_1515);
        _2042 = _2082;
    }
    float _2084 = _2042;
    float _2086 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2068);
    float _2088 = 1.0 / _2074;
    float _2090 = fma(_663, _1822, _2076);
    float _2092 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2078);
    float _2094 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2086);
    if (!_1562)
    {
        float _2096 = -_1620;
        float _2098 = _1353 + _2096;
        _2080 = _2098;
    }
    float _2100 = _2080;
    float _2102 = fma(_665, _1860, _2090);
    float _2104 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2092);
    float _2106 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2094);
    float _2108 = _2090;
    if (_2058)
    {
        float _2110 = rint(_2084);
        float _2112 = precise::max(_2110, 0.0);
        uint _2114 = uint(_2112);
        uint _2116 = clamp(_2114, 0u, 65535u);
        _2108 = as_type<float>(_2116);
    }
    float _2118 = _2108;
    float _2120 = _2102 + _1868;
    float _2122 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2104);
    float _2124 = _2072 * 0.693147182464599609375;
    float _2126 = _2120 * _1904;
    float _2128 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2130 = _2122 * _2088;
    float _2132 = _2106 * _2088;
    float _2134 = _2050;
    if (!_1562)
    {
        float3 _8485 = float3(_2100, _2050, float(as_type<int>(_2024)));
        float3 _8489 = select(_8485, float3(0.0), isnan(_8485));
        float _2136 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8489.xy, uint(rint(_8489.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8489.xy, uint(rint(_8489.z)), level(0.0)).x;
        _2134 = _2136;
    }
    float _2138 = _2134;
    float _2140 = fma(_2130, 0.5, 0.5);
    float _2142 = fma(_2132, -0.5, 0.5);
    float _2144 = _1984;
    if (_2058)
    {
        float3 _8508 = float3(_1992, _1984, float(as_type<int>(_2118)));
        float3 _8510 = select(_8508, float3(0.0), isnan(_8508));
        float _2146 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8510.xy, uint(rint(_8510.z)), _2126, level(0.0));
        _2144 = _2146;
    }
    float _2148 = _2144;
    float3 _8520 = float3(_2140, _2142, _2128);
    float _2150 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8520, float3(0.0), isnan(_8520)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8520, float3(0.0), isnan(_8520)), level(0.0)).x;
    float3 _8529 = float3(_2140, _2142, _2128);
    float4 _2153 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8529, float3(0.0), isnan(_8529)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8529, float3(0.0), isnan(_8529)), level(0.0)).xyzw;
    float _2155 = _2153.x;
    float _2157 = _2153.y;
    float _2159 = _2153.z;
    float _2161 = _2153.w;
    float _2163 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2165 = int(_2163);
    int _2167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2169 = _2167 != 0;
    float _2171 = _807 * _809;
    int _2173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2175 = _2173 != 0;
    int _2177 = abs(_1119);
    int _2179 = abs(_1125);
    float _2181 = trunc(_1355);
    int _2183 = int(_2181);
    int _2185 = abs(_1131);
    float _2187 = float(uint(_2165));
    float _2189 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2191 = int(_2189);
    int _2193 = ~_2165;
    int _2195 = _2193 + 1;
    float _2197 = _2118;
    if (_2169)
    {
        float _2199 = in.m_68.w;
        _2197 = _2199;
    }
    float _2201 = _2197;
    int _2203 = ~_2165;
    int _2205 = _2203 + 1;
    bool _2207 = _2165 == 0;
    float _2209 = 0.0;
    if (_2175)
    {
        float _2211 = in.m_68.x;
        _2209 = _2211;
    }
    float _2213 = _2209;
    float _2215 = float(uint(_2183));
    float _2217 = 1.0 / _2187;
    float _2219 = float(uint(_2191));
    float _2221 = trunc(_1303);
    int _2223 = int(_2221);
    int _2225 = as_type<int>(_2217) + (-2);
    float _2227 = 1.0 / _2219;
    float _2229 = _2201;
    if (_2169)
    {
        float _2231 = _2201 * 3.1415927410125732421875;
        _2229 = _2231;
    }
    float _2233 = _2229;
    float _2235 = as_type<float>(_2225) * _2215;
    if (_2169)
    {
        float _2237 = _2233 * 0.15915493667125701904296875;
        _2044 = _2237;
    }
    float _2239 = _2044;
    float _2241 = float(_2183);
    float _2243 = _811 * _795;
    float _2245 = trunc(_2235);
    float _2247 = precise::max(_2245, 0.0);
    uint _2249 = uint(_2247);
    float _2251 = _813 * _811;
    float _2253 = floor(_2243);
    int _2255 = _2195 * int(_2249);
    int _2257 = _2255 + _2183;
    float _2259 = _2239;
    if (_2169)
    {
        float _2261 = _2239 * 6.283185482025146484375;
        float _2263 = sin(_2261);
        _2259 = _2263;
    }
    float _2265 = _2259;
    float _2267 = float(uint(_2257));
    float _2269 = -_2253;
    float _2271 = _2243 + _2269;
    float _2273 = as_type<float>(_2225) * _2267;
    float _2275 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2277 = int(_2275);
    float _2279 = trunc(_2273);
    float _2281 = precise::max(_2279, 0.0);
    uint _2283 = uint(_2281);
    float _2285 = trunc(_1357);
    int _2287 = int(_2285);
    float _2289 = float(uint(_2277));
    int _2291 = int(_2249) + int(_2283);
    float _2293 = 1.0 / _2289;
    float _2295 = float(_2165);
    int _2297 = _2205 * _2291;
    int _2299 = _2297 + _2183;
    bool _2301 = _2241 >= _2295;
    bool _2303 = isnan(_2241);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan(_2295);
    bool _2309 = _2305 || _2307;
    float _2311 = float(_2309);
    float _2313 = _2271 * _2295;
    int _2315 = as_type<int>(_2227) + (-2);
    float _2317 = _2295 * _1029;
    float _2319 = float(uint(_2287));
    bool _2321 = uint(_2299) >= uint(_2165);
    float _2323 = trunc(_2313);
    int _2325 = int(_2323);
    float _2327 = float(_2287);
    float _2329 = as_type<float>(_2315) * _2319;
    bool _2331 = !_2321;
    int _2333 = _2331 ? 0 : (-1);
    bool _2335 = _2321;
    float _2337 = _2265;
    float _2339 = as_type<float>(_2325);
    if (_2169)
    {
        bool _2341 = _2265 > 0.5;
        _2335 = _2341;
    }
    bool _2343 = _2335;
    if (!_2169)
    {
        _2337 = _193;
    }
    float _2345 = _2337;
    float _2347 = trunc(_2311);
    int _2349 = int(_2347);
    int _2351 = ~_2291;
    int _2353 = _2351 + _2333;
    int _2355 = _2353 + 1;
    float _2357 = _2345;
    if (_2169)
    {
        float _2359 = -_193;
        float _2361 = _2343 ? _2359 : _193;
        _2357 = _2361;
    }
    float _2363 = _2357;
    bool _2365 = _1003 != 0;
    int _2367 = ~_2191;
    int _2369 = _2367 + 1;
    float _2371 = trunc(_2329);
    float _2373 = precise::max(_2371, 0.0);
    uint _2375 = uint(_2373);
    int _2377 = _2165 * _2355;
    int _2379 = _2377 + _2183;
    int _2381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2383 = _2381 != 0;
    bool _2385 = !_2383;
    int _2387 = _2385 ? 0 : 1;
    float _2389 = trunc(_2317);
    int _2391 = int(_2389);
    int _2393 = ~_2349;
    int _2395 = _2393 + 1;
    int _2397 = _2395 + 1;
    bool _2399 = !_2207;
    int _2401 = _2399 ? _2379 : (-1);
    int _2403 = abs(_2387);
    int _2405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2407 = _2405 != 0;
    int _2409 = _2369 * int(_2375);
    int _2411 = _2409 + _2287;
    int _2413 = _2401 * _2397;
    float _2415 = float(uint(_2411));
    int _2417 = _2165 + (-1);
    int _2419 = _2325 * _2403;
    int _2421 = _2419 + _2183;
    int _2423 = abs(as_type<int>(_1035));
    float _2425 = as_type<float>(_2315) * _2415;
    float _2427 = as_type<float>(_2349);
    bool _2429 = _2407;
    if (_2175)
    {
        float _2431 = _2213 * 3.1415927410125732421875;
        _1073 = _2431;
    }
    float _2433 = _1073;
    int _2435 = _2349 * _2417;
    int _2437 = _2435 + _2413;
    int _2439 = abs(_1041);
    bool _2441 = !_2407;
    int _2443 = _2441 ? 0 : 1;
    float _2445 = trunc(_2425);
    float _2447 = precise::max(_2445, 0.0);
    uint _2449 = uint(_2447);
    if (_2175)
    {
        float _2451 = _2433 * 0.15915493667125701904296875;
        _2427 = _2451;
    }
    float _2453 = _2427;
    int _2455 = abs(_1047);
    int _2457 = _2437 * _2423;
    int _2459 = abs(_2443);
    int _2461 = _2391 * _2439;
    int _2463 = _2461 + _2457;
    float _2465 = as_type<float>(_1047);
    if (_2175)
    {
        float _2467 = _2453 * 6.283185482025146484375;
        float _2469 = sin(_2467);
        _2465 = _2469;
    }
    float _2471 = _2465;
    int _2473 = ~_2165;
    int _2475 = _2473 + 1;
    int _2477 = _2421 * _2455;
    int _2479 = _2477 + _2463;
    float _2481 = float(_2191);
    int _2483 = _2325 * _2459;
    int _2485 = _2483 + _2479;
    int _2487 = int(_2375) + int(_2449);
    float _2489 = floor(_2171);
    int _2491 = ~_2191;
    int _2493 = _2491 + 1;
    float _2495 = float(uint(_2485));
    bool _2497 = _2327 >= _2481;
    bool _2499 = isnan(_2327);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan(_2481);
    bool _2505 = _2501 || _2503;
    float _2507 = float(_2505);
    if (_2175)
    {
        bool _2509 = _2471 > 0.5;
        _2429 = _2509;
    }
    bool _2511 = _2429;
    int _2513 = _2493 * _2487;
    int _2515 = _2513 + _2287;
    int _2517 = as_type<int>(_2293) + (-2);
    float _2519 = as_type<float>(_2225) * _2495;
    if (!_2175)
    {
        _2339 = _197;
    }
    float _2521 = _2339;
    float _2523 = trunc(_2507);
    int _2525 = int(_2523);
    float _2527 = float(uint(_2223));
    float _2529 = _2521;
    if (_2175)
    {
        float _2531 = -_197;
        float _2533 = _2511 ? _2531 : _197;
        _2529 = _2533;
    }
    float _2535 = _2529;
    float _2537 = -_2489;
    float _2539 = _2171 + _2537;
    bool _2541 = uint(_2515) >= uint(_2191);
    float _2543 = as_type<float>(_2517) * _2527;
    int _2545 = ~_2277;
    int _2547 = _2545 + 1;
    float _2549 = trunc(_2519);
    float _2551 = precise::max(_2549, 0.0);
    uint _2553 = uint(_2551);
    bool _2555 = !_2541;
    int _2557 = _2555 ? 0 : (-1);
    int _2559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2561 = _2559 != 0;
    int _2563 = ~_2487;
    int _2565 = _2563 + _2557;
    int _2567 = _2565 + 1;
    float _2569 = _2539 * _2481;
    bool _2571 = !_2561;
    int _2573 = _2571 ? 0 : 1;
    float _2575 = trunc(_2543);
    float _2577 = precise::max(_2575, 0.0);
    uint _2579 = uint(_2577);
    bool _2581 = _2191 == 0;
    int _2583 = _2191 * _2567;
    int _2585 = _2583 + _2287;
    int _2587 = ~_2525;
    int _2589 = _2587 + 1;
    int _2591 = _2589 + 1;
    float _2593 = _2481 * _1029;
    int _2595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2597 = _2595 != 0;
    int _2599 = _2191 + (-1);
    float _2601 = trunc(_2569);
    int _2603 = int(_2601);
    int _2605 = _2475 * int(_2553);
    int _2607 = _2605 + _2485;
    float _2609 = float(uint(_2607));
    float _2611 = trunc(_2593);
    int _2613 = int(_2611);
    int _2615 = abs(_2573);
    bool _2617 = !_2581;
    int _2619 = _2617 ? _2585 : (-1);
    float _2621 = as_type<float>(_2225) * _2609;
    int _2623 = _2619 * _2591;
    int _2625 = _2547 * int(_2579);
    int _2627 = _2625 + _2223;
    int _2629 = _2525 * _2599;
    int _2631 = _2629 + _2623;
    int _2633 = _2603 * _2615;
    int _2635 = _2633 + _2287;
    float _2637 = float(uint(_2627));
    float _2639 = trunc(_2621);
    float _2641 = precise::max(_2639, 0.0);
    uint _2643 = uint(_2641);
    bool _2645 = !_2597;
    int _2647 = _2645 ? 0 : 1;
    int _2649 = _2631 * _2177;
    float _2651 = as_type<float>(_2517) * _2637;
    int _2653 = abs(_2647);
    int _2655 = _2613 * _2179;
    int _2657 = _2655 + _2649;
    float _2659 = floor(_2251);
    int _2661 = ~_2165;
    int _2663 = _2661 + 1;
    int _2665 = _2635 * _2185;
    int _2667 = _2665 + _2657;
    int _2669 = ~_2165;
    int _2671 = _2669 + 1;
    int _2673 = ~_2191;
    int _2675 = _2673 + 1;
    int _2677 = _2603 * _2653;
    int _2679 = _2677 + _2667;
    float _2681 = trunc(_2651);
    float _2683 = precise::max(_2681, 0.0);
    uint _2685 = uint(_2683);
    int _2687 = int(_2553) + int(_2643);
    float _2689 = float(uint(_2421));
    int _2691 = ~_2277;
    int _2693 = _2691 + 1;
    int _2695 = _2671 * _2687;
    int _2697 = _2695 + _2485;
    int _2699 = ~_2191;
    int _2701 = _2699 + 1;
    float _2703 = -_2659;
    float _2705 = _2251 + _2703;
    bool _2707 = uint(_2697) >= uint(_2165);
    bool _2709 = !_2707;
    int _2711 = _2709 ? 0 : (-1);
    int _2713 = int(_2579) + int(_2685);
    float _2715 = as_type<float>(_2225) * _2689;
    float _2717 = float(uint(_2679));
    float _2719 = float(_2223);
    int _2721 = ~_2687;
    int _2723 = _2721 + _2711;
    int _2725 = _2723 + 1;
    float _2727 = as_type<float>(_2315) * _2717;
    float _2729 = trunc(_2715);
    float _2731 = precise::max(_2729, 0.0);
    uint _2733 = uint(_2731);
    int _2735 = _2693 * _2713;
    int _2737 = _2735 + _2223;
    bool _2739 = uint(_2737) >= uint(_2277);
    float _2741 = trunc(_2727);
    float _2743 = precise::max(_2741, 0.0);
    uint _2745 = uint(_2743);
    float _2747 = float(_2277);
    bool _2749 = !_2739;
    int _2751 = _2749 ? 0 : (-1);
    bool _2753 = _2719 >= _2747;
    bool _2755 = isnan(_2719);
    bool _2757 = _2753 || _2755;
    bool _2759 = isnan(_2747);
    bool _2761 = _2757 || _2759;
    float _2763 = float(_2761);
    int _2765 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2767 = _2765 != 0;
    int _2769 = _2663 * int(_2733);
    int _2771 = _2769 + _2421;
    float _2773 = _2747 * _1029;
    float _2775 = _2705 * _2747;
    float _2777 = trunc(_2763);
    int _2779 = int(_2777);
    int _2781 = _2165 * _2725;
    int _2783 = _2781 + _2485;
    float _2785 = float(uint(_2771));
    int _2787 = ~_2713;
    int _2789 = _2787 + _2751;
    int _2791 = _2789 + 1;
    int _2793 = _2675 * int(_2745);
    int _2795 = _2793 + _2679;
    float _2797 = -_197;
    int _2799 = _2040 ? as_type<int>(_2797) : as_type<int>(_197);
    float _2801 = as_type<float>(_2225) * _2785;
    int _2803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2805 = _2803 != 0;
    int _2807 = _2277 * _2791;
    int _2809 = _2807 + _2223;
    float _2811 = float(uint(_2795));
    float _2813 = trunc(_2773);
    int _2815 = int(_2813);
    float _2817 = -_193;
    int _2819 = _2365 ? as_type<int>(_2817) : as_type<int>(_193);
    bool _2821 = !_2207;
    int _2823 = _2821 ? _2783 : (-1);
    float _2825 = as_type<float>(_2315) * _2811;
    bool _2827 = !_2805;
    float _2829 = _2827 ? _193 : as_type<float>(_2819);
    int _2831 = _2823 & 3;
    bool _2833 = _2831 != 0;
    float _2835 = trunc(_2825);
    float _2837 = precise::max(_2835, 0.0);
    uint _2839 = uint(_2837);
    bool _2841 = _2277 == 0;
    bool _2843 = !_2767;
    float _2845 = _2843 ? _197 : as_type<float>(_2799);
    int _2847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2849 = _2847 != 0;
    int _2851 = _2833 ? 0 : 1;
    float _2853 = trunc(_2801);
    float _2855 = precise::max(_2853, 0.0);
    uint _2857 = uint(_2855);
    int _2859 = _2823 & 3;
    bool _2861 = _2859 != 0;
    int _2863 = ~_2779;
    int _2865 = _2863 + 1;
    int _2867 = _2865 + 1;
    bool _2869 = !_2841;
    int _2871 = _2869 ? _2809 : (-1);
    bool _2873 = !_2849;
    int _2875 = _2873 ? 0 : 1;
    float _2877 = trunc(_2775);
    int _2879 = int(_2877);
    bool _2881 = uint(_2859) > 1u;
    int _2883 = _2871 * _2867;
    int _2885 = _2277 + (-1);
    int _2887 = int(_2745) + int(_2839);
    int _2889 = abs(_1894);
    int _2891 = _2779 * _2885;
    int _2893 = _2891 + _2883;
    int _2895 = abs(_2875);
    int _2897 = _2893 * _2889;
    int _2899 = abs(_1872);
    int _2901 = ~_2851;
    int _2903 = _2901 + 1;
    int _2905 = _2903 + 1;
    int _2907 = _2905;
    if (!_2881)
    {
        int _2909 = ~_2851;
        int _2911 = _2909 + 1;
        _2907 = _2911;
    }
    int _2913 = _2907;
    int _2915 = _2701 * _2887;
    int _2917 = _2915 + _2679;
    bool _2919 = uint(_2859) >= 2u;
    int _2921 = _2879 * _2895;
    int _2923 = _2921 + _2223;
    int _2925 = _2919 ? 0 : 1;
    bool _2927 = uint(_2917) >= uint(_2191);
    int _2929 = _2815 * _2899;
    int _2931 = _2929 + _2897;
    float _2933 = float(uint(_2635));
    bool _2935 = !_2927;
    int _2937 = _2935 ? 0 : (-1);
    bool _2939 = _2859 != 3;
    float _2941 = as_type<float>(_2315) * _2933;
    int _2943 = abs(_1908);
    int _2945 = int(_2733) + int(_2857);
    float _2947 = trunc(_2941);
    float _2949 = precise::max(_2947, 0.0);
    uint _2951 = uint(_2949);
    int _2953 = ~_2165;
    int _2955 = _2953 + 1;
    int _2957 = _2923 * _2943;
    int _2959 = _2957 + _2931;
    int _2961 = ~_2887;
    int _2963 = _2961 + _2937;
    int _2965 = _2963 + 1;
    int _2967 = abs(_1920);
    int _2969 = _2955 * _2945;
    int _2971 = _2969 + _2421;
    int _2973 = ~_2925;
    int _2975 = _2973 + 1;
    int _2977 = _2975 + 1;
    int _2979 = _2191 * _2965;
    int _2981 = _2979 + _2679;
    int _2983 = _2977;
    if (_2939)
    {
        int _2985 = ~_2925;
        int _2987 = _2985 + 1;
        _2983 = _2987;
    }
    int _2989 = _2983;
    int _2991 = _2879 * _2967;
    int _2993 = _2991 + _2959;
    int _2995 = ~_2191;
    int _2997 = _2995 + 1;
    bool _2999 = uint(_2971) >= uint(_2165);
    bool _3001 = !_2581;
    int _3003 = _3001 ? _2981 : (-1);
    float _3005 = float(uint(_2993));
    bool _3007 = !_2999;
    int _3009 = _3007 ? 0 : (-1);
    float _3011 = as_type<float>(_2517) * _3005;
    int _3013 = _3003 & 3;
    bool _3015 = _3013 != 0;
    int _3017 = _2997 * int(_2951);
    int _3019 = _3017 + _2635;
    int _3021 = ~_2277;
    int _3023 = _3021 + 1;
    float _3025 = trunc(_3011);
    float _3027 = precise::max(_3025, 0.0);
    uint _3029 = uint(_3027);
    bool _3031 = !_3015;
    int _3033 = _3031 ? 0 : 1;
    int _3035 = _3003 & 3;
    bool _3037 = _3035 != 0;
    float _3039 = float(uint(_3019));
    int _3041 = _3037 ? 0 : 1;
    bool _3043 = uint(_3013) > 1u;
    float _3045 = as_type<float>(_2315) * _3039;
    float _3047 = float(uint(_2923));
    int _3049 = ~_3041;
    int _3051 = _3049 + 1;
    int _3053 = _3051 + 1;
    float _3055 = as_type<float>(_2517) * _3047;
    float _3057 = trunc(_3045);
    float _3059 = precise::max(_3057, 0.0);
    uint _3061 = uint(_3059);
    int _3063 = _3023 * int(_3029);
    int _3065 = _3063 + _2993;
    bool _3067 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3069 = isnan(0.5);
    bool _3071 = _3067 || _3069;
    bool _3073 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3075 = _3071 || _3073;
    int _3077 = _3053;
    if (!_3043)
    {
        int _3079 = ~_3041;
        int _3081 = _3079 + 1;
        _3077 = _3081;
    }
    int _3083 = _3077;
    bool _3085 = uint(_3013) >= 2u;
    float _3087 = trunc(_3055);
    float _3089 = precise::max(_3087, 0.0);
    uint _3091 = uint(_3089);
    float _3093 = float(uint(_3065));
    int _3095 = _3085 ? 0 : 1;
    bool _3097 = _3013 != 3;
    float _3099 = as_type<float>(_2517) * _3093;
    int _3101 = ~_2191;
    int _3103 = _3101 + 1;
    bool _3105 = !_3097;
    int _3107 = _3105 ? 0 : (-1);
    bool _3109 = _3013 != 3;
    float _3111 = trunc(_3099);
    float _3113 = precise::max(_3111, 0.0);
    uint _3115 = uint(_3113);
    int _3117 = ~_2277;
    int _3119 = _3117 + 1;
    int _3121 = int(_2951) + int(_3061);
    int _3123 = _3119 * int(_3091);
    int _3125 = _3123 + _2923;
    int _3127 = ~_3095;
    int _3129 = _3127 + 1;
    int _3131 = _3129 + 1;
    int _3133 = _3103 * _3121;
    int _3135 = _3133 + _2635;
    int _3137 = _3131;
    float _3139 = as_type<float>(_3119);
    if (_3109)
    {
        int _3141 = ~_3095;
        int _3143 = _3141 + 1;
        _3137 = _3143;
    }
    int _3145 = _3137;
    float _3147 = float(uint(_3125));
    bool _3149 = uint(_3135) >= uint(_2191);
    int _3151 = int(_3029) + int(_3115);
    float _3153 = as_type<float>(_2517) * _3147;
    bool _3155 = !_3149;
    int _3157 = _3155 ? 0 : (-1);
    float _3159 = trunc(_3153);
    float _3161 = precise::max(_3159, 0.0);
    uint _3163 = uint(_3161);
    int _3165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3167 = _3165 != 0;
    int _3169 = _3119 * _3151;
    int _3171 = _3169 + _2993;
    float _3173 = as_type<float>(_3115);
    if (_3075)
    {
        _3173 = 1.0;
    }
    float _3175 = _3173;
    bool _3177 = !_3167;
    int _3179 = _3177 ? 0 : 1;
    bool _3181 = uint(_3171) >= uint(_2277);
    float _3183 = _3175;
    if (_1562)
    {
        _3139 = 1.0;
    }
    float _3185 = _3139;
    bool _3187 = !_3181;
    int _3189 = _3187 ? 0 : (-1);
    bool _3191 = _795 > 0.5;
    int _3193 = int(_3091) + int(_3163);
    int _3195 = _2547 * _3193;
    int _3197 = _3195 + _2923;
    float _3199 = as_type<float>(_3163);
    float _3201 = _3185;
    float _3203 = _2148;
    if (!_3075)
    {
        float _3205 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3207 = _3205 * 0.15915493667125701904296875;
        float _3209 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3211 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3213 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3211;
        float _3215 = _3207 * 6.283185482025146484375;
        float _3217 = cos(_3215);
        float _3219 = _3209 * 0.15915493667125701904296875;
        float _3221 = _3207 * 6.283185482025146484375;
        float _3223 = sin(_3221);
        float _3225 = 1.0 / _3217;
        float _3227 = _3219 * 6.283185482025146484375;
        float _3229 = cos(_3227);
        float _3231 = _3223 * _3225;
        float _3233 = _3219 * 6.283185482025146484375;
        float _3235 = sin(_3233);
        float _3237 = _3229 * _3231;
        float _3239 = 1.0 / _3213;
        float _3241 = 1.0 / _3237;
        float _3243 = _3235 * _3241;
        float _3245 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3247 = fma(_1461, _3243, _3245);
        float _3249 = _3247 * _3239;
        float _3251 = precise::clamp(_3249, 0.0, 1.0);
        _3199 = _3213;
        _3183 = _3251;
    }
    float _3253 = _3199;
    float _3255 = _3183;
    bool _3257 = uint(_3197) >= uint(_2277);
    if (!_1562)
    {
        int _3259 = _1670 << 4;
        int _3261 = _3259 + 2048;
        uint _3263 = uint(int(uint(_3261) >> uint(2)));
        uint _3265 = uint(int(uint(int(_3263)) >> uint(2)));
        int _3267 = int(_3263) & 3;
        float _3269 = (*spvDescriptorSet0.vp_c15)._m0[int(_3265)][_3267];
        int _3271 = int(_3263) + 1;
        uint _3273 = uint(int(uint(_3271) >> uint(2)));
        int _3275 = _3271 & 3;
        float _3277 = (*spvDescriptorSet0.vp_c15)._m0[int(_3273)][_3275];
        int _3279 = _3261 + 8;
        uint _3281 = uint(int(uint(_3279) >> uint(2)));
        uint _3283 = uint(int(uint(int(_3281)) >> uint(2)));
        int _3285 = int(_3281) & 3;
        float _3287 = (*spvDescriptorSet0.vp_c15)._m0[int(_3283)][_3285];
        int _3289 = int(_3281) + 1;
        uint _3291 = uint(int(uint(_3289) >> uint(2)));
        int _3293 = _3289 & 3;
        float _3295 = (*spvDescriptorSet0.vp_c15)._m0[int(_3291)][_3293];
        float _3297 = _1297 * _3277;
        float _3299 = fma(_663, _3269, _3297);
        float _3301 = fma(_665, _3287, _3299);
        float _3303 = _3301 + _3295;
        float _3305 = precise::clamp(_3303, 0.0, 1.0);
        float _3307 = -_3305;
        float _3309 = _3307 + _2138;
        float _3311 = fma(_3309, 500.0, 1.5);
        float _3313 = exp2(_3311);
        float _3315 = 0.0 + _3313;
        float _3317 = precise::clamp(_3315, 0.0, 1.0);
        _3201 = _3317;
    }
    float _3319 = _3201;
    float _3321 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3323 = _1978 + _3321;
    float _3325 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3327 = _1980 + _3325;
    float _3329 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3331 = _1982 + _3329;
    float _3333 = _3323 * _3323;
    float _3335 = fma(_3327, _3327, _3333);
    float _3337 = fma(_3331, _3331, _3335);
    float _3339 = rsqrt(_3337);
    float _3341 = sqrt(_3337);
    float _3343 = _3339 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3345 = _3327 * _3343;
    float _3347 = _3331 * _3343;
    float _3349 = _3345 * _3345;
    float _3351 = _3347 * _3347;
    float _3353 = _3349 + _3351;
    float _3355 = sqrt(_3353);
    bool _3357 = _3355 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3359 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3361 = _3355 + _3359;
    float _3363 = _3339;
    float _3365 = _3361;
    float _3367 = _3323;
    float _3369 = _3353;
    float _3371 = _3349;
    if (_3357)
    {
        float _3373 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3363 = _3373;
    }
    float _3375 = _3363;
    float _3377 = _3375;
    if (_3357)
    {
        float _3379 = _3361 * _3375;
        _3365 = _3379;
    }
    float _3381 = _3365;
    if (_3357)
    {
        float _3383 = rsqrt(_3353);
        _3377 = _3383;
    }
    float _3385 = _3377;
    float _3387 = _3385;
    if (_3357)
    {
        float _3389 = _3381 * 0.15915493667125701904296875;
        _703 = _3389;
    }
    float _3391 = _703;
    float _3393 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3395 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_3357)
    {
        float _3397 = _3391 * 6.283185482025146484375;
        float _3399 = sin(_3397);
        _3395 = _3399;
    }
    float _3401 = _3395;
    float _3403 = precise::max(0.0, _3393);
    float _3405 = -_3343;
    float _3407 = -_3403;
    float _3409 = fma(_3323, _3405, _3407);
    float _3411 = _3403;
    if (!_3357)
    {
        _3411 = _3347;
    }
    float _3413 = _3411;
    float _3415 = _3253;
    float _3417 = _3413;
    if (_3357)
    {
        float _3419 = _3391 * 6.283185482025146484375;
        float _3421 = cos(_3419);
        _3415 = _3421;
    }
    float _3423 = _3415;
    if (_3357)
    {
        float _3425 = _3409 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3367 = _3425;
    }
    float _3427 = _3367;
    float _3429 = _3401;
    float _3431 = _3427;
    if (_3357)
    {
        float _3433 = fma(_3401, _3427, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3429 = _3433;
    }
    float _3435 = _3429;
    float _3437 = _3435;
    if (!_3357)
    {
        _3431 = _3409;
    }
    float _3439 = _3431;
    float _3441 = 0.0;
    float _3443 = _3439;
    if (_3357)
    {
        float _3445 = _3385 * _3435;
        _3441 = _3445;
    }
    float _3447 = _3441;
    if (!_3357)
    {
        _3437 = _3345;
    }
    float _3449 = _3437;
    float _3451 = _3449;
    if (_3357)
    {
        float _3453 = _3423 + (-1.0);
        _3387 = _3453;
    }
    float _3455 = _3387;
    float _3457 = _3455;
    if (_3357)
    {
        float _3459 = _3345 * _3447;
        _3451 = _3459;
    }
    float _3461 = _3451;
    if (_3357)
    {
        float _3463 = _3347 * _3447;
        _3417 = _3463;
    }
    float _3465 = _3417;
    if (_3357)
    {
        float _3467 = _3455 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3369 = _3467;
    }
    float _3469 = _3369;
    if (_3357)
    {
        float _3471 = _3461 * _3461;
        _3371 = _3471;
    }
    float _3473 = _3371;
    if (!_3357)
    {
        _3457 = _3351;
    }
    float _3475 = _3457;
    float _3477 = _3475;
    if (_3357)
    {
        float _3479 = _3465 * _3465;
        _3477 = _3479;
    }
    float _3481 = _3477;
    if (_3357)
    {
        float _3483 = fma(_3409, _3423, _3469);
        _3443 = _3483;
    }
    float _3485 = _3443;
    float _3487 = fma(_3485, _3485, _3473);
    float _3489 = _3487 + _3481;
    float _3491 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3493 = fma(_3341, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3491);
    float _3495 = precise::clamp(_3493, 0.0, 1.0);
    float _3497 = -_3495;
    float _3499 = _3497 + 1.0;
    float _3501 = rsqrt(_3489);
    float _3503 = abs(_3499);
    float _3505 = log2(_3503);
    float _3507 = _3501 * _3461;
    float _3509 = _3501 * _3485;
    float _3511 = _3501 * _3465;
    float _3513 = _3507 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3515 = -_3513;
    float _3517 = fma(_3509, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3515);
    float _3519 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3521 = -_3511;
    float _3523 = fma(_3521, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3517);
    float _3525 = exp2(_3519);
    float _3527 = fma(_3523, -0.5, 0.5);
    float _3529 = fma(_3523, 0.5, 0.5);
    float _3531 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3533 = _3531 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3535 = sqrt(_3527);
    float _3537 = fma(_3529, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3539 = fma(_3529, _3537, -0.212114393711090087890625);
    float _3541 = 1.0 / _3533;
    float _3543 = fma(_3529, _3539, 1.570728778839111328125);
    float _3545 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3547 = _3545 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3549 = _3509 + 1.0;
    float _3551 = -_3509;
    float _3553 = fma(_3525, _3549, _3551);
    float _3555 = _3535 * 0.636619746685028076171875;
    float _3557 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3559 = _3557 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3561 = 1.0 / _3547;
    float _3563 = fma(_3553, 0.5, 0.5);
    float _3565 = -_3543;
    float _3567 = fma(_3555, _3565, 1.0);
    float _3569 = 1.0 / _3559;
    float2 _10480 = float2(_3567, _3563);
    float3 _3573 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10480, float2(0.0), isnan(_10480)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10480, float2(0.0), isnan(_10480)), level(0.0)).xyz;
    float _3575 = _3573.x;
    float _3577 = _3573.y;
    float _3579 = _3573.z;
    float _3581 = -_1349;
    float _3583 = _3581 + 1.0;
    int _3585 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3587 = _3585 != 0;
    float _3589 = -_1219;
    float _3591 = _3589 + 1.0;
    float _3593 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3595 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3593;
    float _3597 = -_193;
    int _3599 = _3191 ? as_type<int>(_3597) : as_type<int>(_193);
    float _3601 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3603 = _3601 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _3605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3607 = _3605 != 0;
    float _3609 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3611 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3609;
    bool _3613 = !_3587;
    float _3615 = _3613 ? _193 : as_type<float>(_3599);
    float _3617 = _3595 * _3541;
    int _3619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3621 = _3619 != 0;
    float _3623 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3625 = _643 + _3623;
    bool _3627 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3629 = isnan(_643);
    bool _3631 = _3627 || _3629;
    bool _3633 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3635 = _3631 || _3633;
    float _3637 = float(_3635);
    float _3639 = _3603 * _3561;
    bool _3641 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3643 = isnan(_643);
    bool _3645 = _3641 || _3643;
    bool _3647 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3649 = _3645 || _3647;
    float _3651 = float(_3649);
    float _3653 = _3611 * _3569;
    bool _3655 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3657 = isnan(_643);
    bool _3659 = _3655 || _3657;
    bool _3661 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3663 = _3659 || _3661;
    float _3665 = float(_3663);
    float _3667 = -_3637;
    float _3669 = _3667 + 1.0;
    float _3671 = fma(_3617, _3625, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _3673 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3675 = isnan(_643);
    bool _3677 = _3673 || _3675;
    bool _3679 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3681 = _3677 || _3679;
    float _3683 = float(_3681);
    float _3685 = -_3651;
    float _3687 = _3685 + 1.0;
    float _3689 = _3665 * _3669;
    float _3691 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3693 = _3691 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3695 = -_3665;
    float _3697 = _3695 + 1.0;
    bool _3699 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3701 = isnan(_643);
    bool _3703 = _3699 || _3701;
    bool _3705 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3707 = _3703 || _3705;
    float _3709 = float(_3707);
    float _3711 = _3683 * _3687;
    float _3713 = -_3683;
    float _3715 = _3713 + 1.0;
    float _3717 = 1.0 / _3693;
    float _3719 = _3651 * _3697;
    bool _3721 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3723 = isnan(_643);
    bool _3725 = _3721 || _3723;
    bool _3727 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3729 = _3725 || _3727;
    float _3731 = float(_3729);
    float _3733 = _3709 * _3715;
    float _3735 = -_3709;
    float _3737 = _3735 + 1.0;
    bool _3739 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3741 = isnan(_643);
    bool _3743 = _3739 || _3741;
    bool _3745 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3747 = _3743 || _3745;
    float _3749 = float(_3747);
    float _3751 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3753 = -_3731;
    float _3755 = _3753 + 1.0;
    bool _3757 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3759 = isnan(_643);
    bool _3761 = _3757 || _3759;
    bool _3763 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3765 = _3761 || _3763;
    float _3767 = float(_3765);
    float _3769 = -_3749;
    float _3771 = _3769 + 1.0;
    float _3773 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3775 = _3773 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3777 = _3749 * _3755;
    float _3779 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3781 = _3779 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3783 = _3767 * _3771;
    float _3785 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3787 = _3785 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3789 = 1.0 / _3775;
    float _3791 = _3731 * _3737;
    float _3793 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3795 = _3793 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3797 = _3671 * _3783;
    float _3799 = -_3767;
    float _3801 = _3799 + 1.0;
    float _3803 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3805 = _643 + _3803;
    float _3807 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3809 = 1.0 / _3795;
    float _3811 = _3781 * _3717;
    float _3813 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3815 = _643 + _3813;
    float _3817 = fma(_3801, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3797);
    float _3819 = fma(_3653, _3805, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3821 = fma(_3639, _3815, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _3823 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3825 = _643 + _3823;
    float _3827 = 1.0 / _3787;
    float _3829 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3831 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3829;
    float _3833 = fma(_3821, _3777, _3817);
    float _3835 = fma(_3811, _3825, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3837 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3839 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3837;
    float _3841 = _3831 * _3789;
    float _3843 = fma(_3819, _3791, _3833);
    float _3845 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3847 = _643 + _3845;
    float _3849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3851 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3853 = _3851 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3855 = fma(_3835, _3733, _3843);
    float _3857 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3859 = _643 + _3857;
    float _3861 = fma(_3841, _3847, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3863 = _3853 * _3809;
    float _3865 = _2535 + (-0.5);
    int _3867 = abs(_3107);
    float _3869 = _3839 * _3827;
    float _3871 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3873 = _643 + _3871;
    float _3875 = _2363 + 0.5;
    float _3877 = fma(_3861, _3711, _3855);
    float _3879 = fma(_3869, _3859, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3881 = fma(_3863, _3873, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3883 = abs(_1461);
    float _3885 = log2(_3883);
    float _3887 = fma(_3875, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1115);
    float _3889 = _3615 + 0.5;
    float _3891 = _2845 + (-0.5);
    float _3893 = fma(_3881, _3719, _3877);
    float _3895 = -_3865;
    float _3897 = -_1121;
    float _3899 = fma(_3895, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3897);
    float _3901 = fma(_3889, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1107);
    float _3903 = -_3891;
    float _3905 = -_1067;
    float _3907 = fma(_3903, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3905);
    float _3909 = _3849 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3911 = _2829 + 0.5;
    float _3913 = fma(_3879, _3689, _3893);
    float _3915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3917 = -_3583;
    float _3919 = fma(_3615, _3917, _3901);
    float _3921 = fma(_3909, _3911, _1367);
    float _3923 = fma(_3637, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3913);
    float _3925 = -_1085;
    float _3927 = _3925 + 1.0;
    float _3929 = _3885 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3931 = -_1363;
    float _3933 = _3931 + 1.0;
    int _3935 = _3003 >> 31;
    float _3937 = fma(_3927, _2535, _3899);
    float _3939 = -_1359;
    float _3941 = _3939 + 1.0;
    float _3943 = -_1099;
    float _3945 = _3943 + 1.0;
    float _3947 = exp2(_3929);
    int _3949 = _3935 & 3;
    float _3951 = _1834 + (-0.5);
    float _3953 = -_3945;
    float _3955 = fma(_3953, _2363, _3887);
    int _3957 = _3003 + _3949;
    float _3959 = _3915 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3961 = fma(_2845, _3941, _3907);
    float _3963 = -_3933;
    float _3965 = fma(_2829, _3963, _3921);
    int _3967 = _3957 >> 2;
    float _3969 = -_3959;
    float _3971 = -_1369;
    float _3973 = fma(_3969, _3951, _3971);
    out.m_78.x = _3955;
    out.m_78.y = _3937;
    bool _3975 = !_3257;
    int _3977 = _3975 ? 0 : (-1);
    float _3979 = exp2(_3807);
    float _3981 = fma(_1834, _3591, _3973);
    float _3983 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3985 = fma(_3947, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3987 = precise::clamp(_3985, 0.0, 1.0);
    int _3989 = _3967 << 4;
    int _3991 = _3989 + 656;
    out.m_80.x = _3923;
    float _3993 = -_1598;
    float _3995 = fma(_3993, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3983);
    int _3997 = ~_3151;
    int _3999 = _3997 + _3189;
    int _4001 = _3999 + 1;
    uint _4003 = uint(int(uint(_3991) >> uint(2)));
    uint _4005 = uint(int(uint(int(_4003)) >> uint(2)));
    int _4007 = int(_4003) & 3;
    float _4009 = (*spvDescriptorSet0.vp_c9)._m0[int(_4005)][_4007];
    int _4011 = int(_4003) + 1;
    uint _4013 = uint(int(uint(_4011) >> uint(2)));
    int _4015 = _4011 & 3;
    float _4017 = (*spvDescriptorSet0.vp_c9)._m0[int(_4013)][_4015];
    out.m_82.x = _3919;
    out.m_82.y = _3961;
    out.m_82.z = _3965;
    out.m_82.w = _3981;
    float _4019 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3995);
    int _4021 = ~_3193;
    int _4023 = _4021 + _3977;
    int _4025 = _4023 + 1;
    int _4027 = _2277 * _4001;
    int _4029 = _4027 + _2993;
    int _4031 = ~_3121;
    int _4033 = _4031 + _3157;
    int _4035 = _4033 + 1;
    float _4037 = -_683;
    float _4039 = _4037 + 1.0;
    bool _4041 = !_2861;
    int _4043 = _4041 ? 0 : 1;
    int _4045 = _3991 + 8;
    uint _4047 = uint(int(uint(_4045) >> uint(2)));
    uint _4049 = uint(int(uint(int(_4047)) >> uint(2)));
    int _4051 = int(_4047) & 3;
    float _4053 = (*spvDescriptorSet0.vp_c9)._m0[int(_4049)][_4051];
    int _4055 = int(_4047) + 1;
    uint _4057 = uint(int(uint(_4055) >> uint(2)));
    int _4059 = _4055 & 3;
    float _4061 = (*spvDescriptorSet0.vp_c9)._m0[int(_4057)][_4059];
    int _4063 = _2277 * _4025;
    int _4065 = _4063 + _2923;
    bool _4067 = !_2841;
    int _4069 = _4067 ? _4029 : (-1);
    int _4071 = _2191 * _4035;
    int _4073 = _4071 + _2635;
    int _4075 = abs(_2913);
    int _4077 = _4069 & 3;
    bool _4079 = _4077 != 0;
    float _4081 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4083 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4085 = _1624 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4087 = _1624 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4089 = -_1598;
    float _4091 = fma(_4089, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4081);
    float _4093 = -_1598;
    float _4095 = fma(_4093, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4083);
    float _4097 = _1624 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4099 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4085);
    float _4101 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4091);
    float _4103 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4095);
    float _4105 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4087);
    float _4107 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4109 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4111 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4097);
    float _4113 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4115 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4099);
    float _4117 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4107);
    float _4119 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4105);
    float _4121 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4111);
    float _4123 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4109);
    float _4125 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4113);
    float _4127 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4129 = _3751 * _4019;
    int _4131 = abs(_3083);
    float _4133 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4117);
    float _4135 = _3751 * _4101;
    float _4137 = fma(_4127, _4115, _4129);
    out.m_84.x = _4115;
    out.m_84.y = _4119;
    out.m_84.z = _4121;
    int _4139 = abs(_3033);
    float _4141 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4123);
    float _4143 = _3751 * _4103;
    float _4145 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4147 = int(_4145);
    float _4149 = fma(_4127, _4119, _4135);
    float _4151 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4125);
    float _4153 = fma(_4127, _4121, _4143);
    int _4155 = _2823 >> 31;
    int _4157 = abs(_4043);
    int _4159 = ~_4131;
    int _4161 = _4159 + 1;
    int _4163 = _4161 + 1;
    int _4165 = ~_4139;
    int _4167 = _4165 + 1;
    int _4169 = _4167 + 1;
    int _4171 = abs(_3145);
    int _4173 = _4163 * as_type<int>(_4017);
    int _4175 = _4155 & 3;
    float _4177 = float(uint(_4147));
    int _4179 = _4169 * as_type<int>(_4009);
    int _4181 = _4179 + _4173;
    int _4183 = ~_4171;
    int _4185 = _4183 + 1;
    int _4187 = _4185 + 1;
    int _4189 = ~_3867;
    int _4191 = _4189 + 1;
    int _4193 = _4191 + 1;
    float _4195 = 1.0 / _4177;
    int _4197 = _2823 + _4175;
    int _4199 = _4187 * as_type<int>(_4053);
    int _4201 = _4199 + _4181;
    int _4203 = abs(_4147);
    float _4205 = fma(_3751, _3751, 1.0);
    int _4207 = abs(_3179);
    int _4209 = _4193 * as_type<int>(_4061);
    int _4211 = _4209 + _4201;
    int _4213 = _4197 >> 2;
    float _4215 = rsqrt(_4205);
    float _4217 = float(uint(_4203));
    int _4219 = _4213 << 4;
    int _4221 = _4219 + 368;
    int _4223 = ~_4207;
    int _4225 = _4223 + 1;
    int _4227 = _4225 + 1;
    int _4229 = _4069 >> 31;
    float _4231 = 1.0 / _4217;
    bool _4233 = !_2581;
    int _4235 = _4233 ? _4073 : (-1);
    int _4237 = _4211 * _4227;
    int _4239 = _4229 & 3;
    int _4241 = as_type<int>(_4195) + (-2);
    int _4243 = _4235 * _4207;
    int _4245 = _4243 + _4237;
    int _4247 = _4069 + _4239;
    uint _4249 = uint(int(uint(_4221) >> uint(2)));
    uint _4251 = uint(int(uint(int(_4249)) >> uint(2)));
    int _4253 = int(_4249) & 3;
    float _4255 = (*spvDescriptorSet0.vp_c9)._m0[int(_4251)][_4253];
    int _4257 = int(_4249) + 1;
    uint _4259 = uint(int(uint(_4257) >> uint(2)));
    int _4261 = _4257 & 3;
    float _4263 = (*spvDescriptorSet0.vp_c9)._m0[int(_4259)][_4261];
    float _4265 = _3751 * _4215;
    int _4267 = _4069 & 3;
    bool _4269 = _4267 != 0;
    int _4271 = _4247 >> 2;
    float _4273 = -_4133;
    float _4275 = _4265 * _4273;
    float _4277 = float(uint(_4245));
    float _4279 = -_4141;
    float _4281 = _4265 * _4279;
    int _4283 = _4271 << 4;
    int _4285 = _4283 + 800;
    float _4287 = fma(_4215, _4019, _4275);
    int _4289 = abs(_4245);
    float _4291 = as_type<float>(_4241) * _4277;
    int _4293 = as_type<int>(_4231) + (-2);
    int _4295 = _4221 + 8;
    uint _4297 = uint(int(uint(_4295) >> uint(2)));
    uint _4299 = uint(int(uint(int(_4297)) >> uint(2)));
    int _4301 = int(_4297) & 3;
    float _4303 = (*spvDescriptorSet0.vp_c9)._m0[int(_4299)][_4301];
    int _4305 = int(_4297) + 1;
    uint _4307 = uint(int(uint(_4305) >> uint(2)));
    int _4309 = _4305 & 3;
    float _4311 = (*spvDescriptorSet0.vp_c9)._m0[int(_4307)][_4309];
    float _4313 = float(uint(_4289));
    float _4315 = trunc(_4291);
    float _4317 = precise::max(_4315, 0.0);
    uint _4319 = uint(_4317);
    int _4321 = _4079 ? 0 : 1;
    float _4323 = -_4151;
    float _4325 = _4265 * _4323;
    bool _4327 = uint(_4267) > 1u;
    float _4329 = as_type<float>(_4293) * _4313;
    int _4331 = ~_4147;
    int _4333 = _4331 + 1;
    uint _4335 = uint(int(uint(_4285) >> uint(2)));
    uint _4337 = uint(int(uint(int(_4335)) >> uint(2)));
    int _4339 = int(_4335) & 3;
    float _4341 = (*spvDescriptorSet0.vp_c9)._m0[int(_4337)][_4339];
    int _4343 = int(_4335) + 1;
    uint _4345 = uint(int(uint(_4343) >> uint(2)));
    int _4347 = _4343 & 3;
    float _4349 = (*spvDescriptorSet0.vp_c9)._m0[int(_4345)][_4347];
    int _4351 = ~_4321;
    int _4353 = _4351 + 1;
    int _4355 = _4353 + 1;
    float _4357 = fma(_4215, _4103, _4325);
    int _4359 = abs(_2989);
    float _4361 = trunc(_4329);
    float _4363 = precise::max(_4361, 0.0);
    uint _4365 = uint(_4363);
    int _4367 = ~_2945;
    int _4369 = _4367 + _3009;
    int _4371 = _4369 + 1;
    bool _4373 = _2165 == 0;
    int _4375 = _4285 + 8;
    uint _4377 = uint(int(uint(_4375) >> uint(2)));
    uint _4379 = uint(int(uint(int(_4377)) >> uint(2)));
    int _4381 = int(_4377) & 3;
    float _4383 = (*spvDescriptorSet0.vp_c9)._m0[int(_4379)][_4381];
    int _4385 = int(_4377) + 1;
    uint _4387 = uint(int(uint(_4385) >> uint(2)));
    int _4389 = _4385 & 3;
    float _4391 = (*spvDescriptorSet0.vp_c9)._m0[int(_4387)][_4389];
    bool _4393 = !_2841;
    int _4395 = _4393 ? _4065 : (-1);
    int _4397 = _2165 * _4371;
    int _4399 = _4397 + _2421;
    int _4401 = _4355;
    float _4403 = _4151;
    if (!_4327)
    {
        int _4405 = ~_4321;
        int _4407 = _4405 + 1;
        _4401 = _4407;
    }
    int _4409 = _4401;
    float _4411 = fma(_4215, _4101, _4281);
    bool _4413 = uint(_4267) >= 2u;
    int _4415 = _4333 * int(_4319);
    int _4417 = _4415 + _4245;
    int _4419 = ~_4203;
    int _4421 = _4419 + 1;
    int _4423 = _4413 ? 0 : 1;
    out.m_86.x = _4287;
    out.m_86.y = _4411;
    out.m_86.z = _4357;
    bool _4425 = _4267 != 3;
    int _4427 = _4421 * int(_4365);
    int _4429 = _4427 + _4289;
    float _4431 = float(uint(_4417));
    int _4433 = ~_4075;
    int _4435 = _4433 + 1;
    int _4437 = _4435 + 1;
    int _4439 = abs(_4409);
    float _4441 = as_type<float>(_4241) * _4431;
    float _4443 = float(uint(_4429));
    int _4445 = _4437 * as_type<int>(_4263);
    bool _4447 = !_4269;
    int _4449 = _4447 ? 0 : 1;
    float _4451 = trunc(_4441);
    float _4453 = precise::max(_4451, 0.0);
    uint _4455 = uint(_4453);
    float _4457 = as_type<float>(_4293) * _4443;
    int _4459 = ~_4423;
    int _4461 = _4459 + 1;
    int _4463 = _4461 + 1;
    int _4465 = _4463;
    if (_4425)
    {
        int _4467 = ~_4423;
        int _4469 = _4467 + 1;
        _4465 = _4469;
    }
    int _4471 = _4465;
    float _4473 = trunc(_4457);
    float _4475 = precise::max(_4473, 0.0);
    uint _4477 = uint(_4475);
    int _4479 = abs(_4449);
    int _4481 = ~_4439;
    int _4483 = _4481 + 1;
    int _4485 = _4483 + 1;
    int _4487 = abs(_4471);
    int _4489 = ~_4157;
    int _4491 = _4489 + 1;
    int _4493 = _4491 + 1;
    int _4495 = _4485 * as_type<int>(_4349);
    int _4497 = ~_4479;
    int _4499 = _4497 + 1;
    int _4501 = _4499 + 1;
    int _4503 = _4493 * as_type<int>(_4255);
    int _4505 = _4503 + _4445;
    int _4507 = ~_4487;
    int _4509 = _4507 + 1;
    int _4511 = _4509 + 1;
    int _4513 = _4501 * as_type<int>(_4341);
    int _4515 = _4513 + _4495;
    int _4517 = ~_4359;
    int _4519 = _4517 + 1;
    int _4521 = _4519 + 1;
    bool _4523 = _2859 != 3;
    int _4525 = _4511 * as_type<int>(_4383);
    int _4527 = _4525 + _4515;
    bool _4529 = _4267 != 3;
    int _4531 = _4521 * as_type<int>(_4303);
    int _4533 = _4531 + _4505;
    int _4535 = int(_4319) + int(_4455);
    float _4537 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4539 = !_4523;
    int _4541 = _4539 ? 0 : (-1);
    int _4543 = ~_4147;
    int _4545 = _4543 + 1;
    float _4547 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4537);
    bool _4549 = !_4529;
    int _4551 = _4549 ? 0 : (-1);
    int _4553 = abs(_4541);
    int _4555 = _4545 * _4535;
    int _4557 = _4555 + _4245;
    int _4559 = abs(_4551);
    float _4561 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4547);
    int _4563 = int(_4365) + int(_4477);
    int _4565 = ~_4203;
    int _4567 = _4565 + 1;
    bool _4569 = uint(_4557) >= uint(_4147);
    int _4571 = _4567 * _4563;
    int _4573 = _4571 + _4289;
    int _4575 = ~_4553;
    int _4577 = _4575 + 1;
    int _4579 = _4577 + 1;
    float _4581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4583 = ~_4559;
    int _4585 = _4583 + 1;
    int _4587 = _4585 + 1;
    bool _4589 = uint(_4573) >= uint(_4203);
    int _4591 = _4579 * as_type<int>(_4311);
    int _4593 = _4591 + _4533;
    bool _4595 = !_4569;
    int _4597 = _4595 ? 0 : (-1);
    int _4599 = _4587 * as_type<int>(_4391);
    int _4601 = _4599 + _4527;
    int _4603 = _4245 ^ _4147;
    float _4605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4607 = !_3621;
    int _4609 = _4607 ? 0 : 1;
    bool _4611 = !_4589;
    int _4613 = _4611 ? 0 : (-1);
    uint _4615 = uint(int(uint(_4603) >> uint(31)));
    bool _4617 = !_3607;
    int _4619 = _4617 ? 0 : 1;
    int _4621 = abs(_4609);
    int _4623 = ~_4613;
    int _4625 = _4563 + _4623;
    int _4627 = _4625 + 1;
    int _4629 = ~int(_4615);
    int _4631 = _4629 + 1;
    int _4633 = ~_4535;
    int _4635 = _4633 + _4597;
    int _4637 = _4635 + 1;
    int _4639 = abs(_4619);
    int _4641 = _4627 ^ _4631;
    int _4643 = _4147 * _4637;
    int _4645 = _4643 + _4245;
    int _4647 = ~_4639;
    int _4649 = _4647 + 1;
    int _4651 = _4649 + 1;
    bool _4653 = _4147 == 0;
    bool _4655 = _4147 == 0;
    int _4657 = _4593 * _4651;
    int _4659 = ~_4631;
    int _4661 = _4659 + _4641;
    int _4663 = _4661 + 1;
    int _4665 = ~_4621;
    int _4667 = _4665 + 1;
    int _4669 = _4667 + 1;
    bool _4671 = !_4653;
    int _4673 = _4671 ? _4645 : (-1);
    bool _4675 = !_4655;
    int _4677 = _4675 ? _4663 : (-1);
    int _4679 = _4601 * _4669;
    bool _4681 = !_4373;
    int _4683 = _4681 ? _4399 : (-1);
    float _4685 = _4581 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4687 = float(_4673);
    float _4689 = _4605 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4691 = float(_4677);
    int _4693 = _4683 * _4639;
    int _4695 = _4693 + _4657;
    float _4697 = _969 + 0.5;
    float _4699 = fma(_4685, _4687, _1373);
    float _4701 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4561);
    float _4703 = -_1375;
    float _4705 = fma(_4689, _4691, _4703);
    float _4707 = _2074 * 0.5;
    float _4709 = _1009 + (-0.5);
    float _4711 = fma(_4685, _4697, _4699);
    int _4713 = _4395 * _4621;
    int _4715 = _4713 + _4679;
    float _4717 = fma(_2106, -0.5, _4707);
    float _4719 = -_4689;
    float _4721 = fma(_4719, _4709, _4705);
    float _4723 = -_1335;
    float _4725 = _4723 + 1.0;
    float _4727 = -_1361;
    float _4729 = _4727 + 1.0;
    out.gl_Position.x = _2122;
    out.gl_Position.y = _2106;
    out.gl_Position.z = _4701;
    out.gl_Position.w = _2074;
    float _4731 = _4701 + _2074;
    float _4733 = fma(_1009, _4725, _4721);
    float _4735 = _2122 + _2074;
    float _4737 = -_4729;
    float _4739 = fma(_969, _4737, _4711);
    bool _4741 = _1461 <= 8000.0;
    bool _4743 = isnan(_1461);
    bool _4745 = _4741 || _4743;
    bool _4747 = isnan(8000.0);
    bool _4749 = _4745 || _4747;
    float _4751 = float(_4749);
    float _4753 = fma(_3987, -2.0, 3.0);
    float _4755 = _3987 * _3987;
    float _4757 = _4731 * 0.5;
    out.m_88.x = _4739;
    out.m_88.y = _4733;
    float _4759 = _4735 * 0.5;
    float _4761 = _4755 * _4753;
    float _4763 = float(_4695);
    float _4765 = _4133 + _4137;
    float _4767 = float(_4715);
    float _4769 = -_4761;
    float _4771 = _4769 + 1.0;
    out.m_90.x = _4759;
    out.m_90.y = _4717;
    out.m_90.z = _4757;
    out.m_90.w = _2074;
    float _4773 = _4141 + _4149;
    float _4775 = _4151 + _4153;
    float _4777 = fma(_4771, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4761);
    float _4779 = _4739;
    float _4781 = _4733;
    if (!_2058)
    {
        _4779 = 1.0;
    }
    float _4783 = _4779;
    out.m_92.x = _4763;
    float _4785 = _4783;
    if (_2058)
    {
        bool _4787 = _2148 >= _2126;
        bool _4789 = isnan(_2148);
        bool _4791 = _4787 || _4789;
        bool _4793 = isnan(_2126);
        bool _4795 = _4791 || _4793;
        float _4797 = float(_4795);
        _4785 = _4797;
    }
    float _4799 = _4785;
    float _4801 = _4751 * _4777;
    bool _4803 = _3341 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4805 = isnan(_3341);
    bool _4807 = _4803 || _4805;
    bool _4809 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4811 = _4807 || _4809;
    out.m_92.w = _4767;
    float _4813 = _4801 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4815 = -_3979;
    float _4817 = _4815 + 1.0;
    float _4819 = _4799 * _3319;
    out.m_94.x = _4765;
    out.m_94.y = _4773;
    out.m_94.z = _4775;
    float _4821 = _4039 * _4813;
    float _4823 = precise::clamp(_4821, 0.0, 1.0);
    float _4825 = _4817 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4827 = -_4823;
    float _4829 = fma(_4827, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4831 = _4825 * _2150;
    float _4833 = -_4825;
    float _4835 = _4833 + 1.0;
    float _4837 = _4835;
    float _4839 = _4825;
    if (!_4811)
    {
        _3203 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4841 = _3203;
    float _4843 = -_4819;
    float _4845 = fma(_4843, _4829, 1.0);
    float _4847 = precise::clamp(_4845, 0.0, 1.0);
    float _4849 = _2161 * _4831;
    float _4851 = _3579 * _4831;
    float _4853 = _2161 * _4835;
    float _4855 = _4847 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4857 = fma(_3575, _4849, _2155);
    float _4859 = fma(_3577, _4849, _2157);
    float _4861 = fma(_2161, _4851, _2159);
    float _4863 = _3255 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_96.x = _4855;
    float _4865 = _4847;
    float _4867 = _4841;
    float _4869 = _4841;
    if (!_4811)
    {
        _4403 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4871 = _4403;
    float _4873 = _4871;
    float _4875 = _4871;
    if (!_4811)
    {
        _4837 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4877 = _4837;
    out.m_98.x = _4857;
    out.m_98.y = _4859;
    out.m_98.z = _4861;
    out.m_98.w = _4853;
    float _4879 = _4877;
    float _4881 = _4877;
    if (!_4811)
    {
        _4781 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4883 = _4781;
    float _4885 = _4883;
    float _4887 = _4883;
    if (!_4811)
    {
        _4865 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4889 = _4865;
    float _4891 = _4889;
    float _4893 = _4889;
    if (!_4811)
    {
        _4839 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4895 = _4839;
    bool _4897 = !_4811;
    float _4899 = _4895;
    float _4901 = _4895;
    if (!_4897)
    {
        bool _4903 = _3341 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4905 = isnan(_3341);
        bool _4907 = _4903 || _4905;
        bool _4909 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4911 = _4907 || _4909;
        if (!_4911)
        {
            float _4913 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4915 = _3341 + _4913;
            float _4917 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4919 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4917;
            float _4921 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4923 = _4921 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4925 = 1.0 / _4919;
            float _4927 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4929 = _4927 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4931 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4933 = _4931 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4935 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4937 = _4935 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4939 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4941 = _4939 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4943 = _4915 * _4925;
            float _4945 = precise::clamp(_4943, 0.0, 1.0);
            float _4947 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4949 = _4947 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4951 = fma(_4945, _4923, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4953 = fma(_4945, _4949, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4955 = fma(_4945, _4929, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4957 = fma(_4945, _4933, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4959 = fma(_4945, _4937, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4961 = fma(_4945, _4941, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4875 = _4955;
            _4893 = _4959;
            _4869 = _4951;
            _4887 = _4957;
            _4881 = _4953;
            _4901 = _4961;
            _4963 = true;
        }
        else
        {
            bool _4965 = _3341 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4967 = isnan(_3341);
            bool _4969 = _4965 || _4967;
            bool _4971 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4973 = _4969 || _4971;
            if (!_4973)
            {
                _4867 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4975 = _4867;
            _4869 = _4975;
            if (!_4973)
            {
                _4873 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4977 = _4873;
            _4875 = _4977;
            if (!_4973)
            {
                _4879 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4979 = _4879;
            _4881 = _4979;
            if (!_4973)
            {
                _4885 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4981 = _4885;
            _4887 = _4981;
            if (!_4973)
            {
                _4891 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4983 = _4891;
            _4893 = _4983;
            if (!_4973)
            {
                _4899 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4985 = _4899;
            bool _4987 = !_4973;
            _4901 = _4985;
            if (!_4987)
            {
                bool _4989 = _3341 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4991 = isnan(_3341);
                bool _4993 = _4989 || _4991;
                bool _4995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4997 = _4993 || _4995;
                if (!_4997)
                {
                    float _4999 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5001 = _3341 + _4999;
                    float _5003 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5005 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5003;
                    float _5007 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5009 = _5007 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5011 = 1.0 / _5005;
                    float _5013 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5015 = _5013 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5017 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5019 = _5017 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5021 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5023 = _5021 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5025 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5027 = _5025 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5029 = _5001 * _5011;
                    float _5031 = precise::clamp(_5029, 0.0, 1.0);
                    float _5033 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5035 = _5033 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5037 = fma(_5031, _5009, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5039 = fma(_5031, _5035, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5041 = fma(_5031, _5015, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5043 = fma(_5031, _5019, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5045 = fma(_5031, _5023, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5047 = fma(_5031, _5027, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4875 = _5041;
                    _4893 = _5045;
                    _4869 = _5037;
                    _4887 = _5043;
                    _4881 = _5039;
                    _4901 = _5047;
                    _4963 = true;
                }
                else
                {
                    _4875 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4893 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4869 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4887 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4881 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4901 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4963 = false;
    float _5049 = _4875;
    float _5051 = _4893;
    float _5053 = _4869;
    float _5055 = _4887;
    float _5057 = _4881;
    float _5059 = _4901;
    float _5061 = fma(_4773, -0.5, 0.5);
    float _5063 = precise::clamp(_5061, 0.0, 1.0);
    float _5065 = -_5049;
    float _5067 = _5065 + _5051;
    float _5069 = _4863 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5071 = -_5053;
    float _5073 = _5071 + _5055;
    float _5075 = fma(_5063, _5067, _5049);
    out.m_100.x = 0.0;
    float _5077 = -_5057;
    float _5079 = _5077 + _5059;
    float _5081 = fma(_5063, _5073, _5053);
    float _5083 = _5075 * 0.586610972881317138671875;
    out.m_63.x = _5069;
    bool _5085 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5087 = fma(_5063, _5079, _5057);
    float _5089 = fma(_5081, 0.298911988735198974609375, _5083);
    bool _5091 = _3255 > 0.0;
    bool _5093 = isnan(_3255);
    bool _5095 = _5091 || _5093;
    bool _5097 = isnan(0.0);
    bool _5099 = _5095 || _5097;
    float _5101 = fma(_5087, 0.114477999508380889892578125, _5089);
    float _5103 = -_5101;
    float _5105 = _5081 + _5103;
    float _5107 = -_5101;
    float _5109 = _5075 + _5107;
    float _5111 = -_5101;
    float _5113 = _5087 + _5111;
    float _5115 = fma(_5105, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5101);
    float _5117 = fma(_5109, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5101);
    float _5119 = fma(_5113, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5101);
    bool _5121 = !_5085;
    if (!_5121)
    {
        float _5123 = -_1978;
        float _5125 = _5123 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5127 = -_1980;
        float _5129 = _5127 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5131 = -_1982;
        float _5133 = _5131 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5135 = _5125 * _5125;
        float _5137 = fma(_5129, _5129, _5135);
        float _5139 = fma(_5133, _5133, _5137);
        float _5141 = sqrt(_5139);
        float _5143 = rsqrt(_5139);
        float _5145 = -_5141;
        float _5147 = _5145 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5149 = _5147 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5151 = precise::clamp(_5149, 0.0, 1.0);
        float _5153 = _5129 * _5143;
        float _5155 = _5125 * _5143;
        float _5157 = abs(_5151);
        float _5159 = log2(_5157);
        float _5161 = _5133 * _5143;
        float _5163 = _5153 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5165 = _4773 * _5155;
        float _5167 = -_5155;
        float _5169 = -_5163;
        float _5171 = fma(_5167, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5169);
        float _5173 = fma(_4765, _5153, _5165);
        float _5175 = -_5161;
        float _5177 = fma(_5175, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5171);
        float _5179 = fma(_4775, _5161, _5173);
        float _5181 = precise::clamp(_5179, 0.0, 1.0);
        float _5183 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5185 = _5177 + _5183;
        float _5187 = _5159 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5189 = _5185 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5191 = precise::clamp(_5189, 0.0, 1.0);
        float _5193 = exp2(_5187);
        float _5195 = _5193 * _5191;
        float _5197 = _5181 * _5195;
        float _5199 = _5197 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5201 = _5197 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5203 = _5197 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _5199;
        out.m_100.y = _5201;
        out.m_100.z = _5203;
    }
    out.m_102.x = _5115;
    out.m_102.y = _5117;
    out.m_102.z = _5119;
    if (_5099)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_63.x = 0.0;
    float _5205 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5205;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

