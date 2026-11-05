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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_16 [[id(9)]];
    sampler vp_t_tcb_16Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d_array<float> vp_t_tcb_14 [[id(15)]];
    sampler vp_t_tcb_14Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_72 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_92 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_68 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5383 = false;
    bool _4200 = false;
    bool _831 = false;
    bool _725 = false;
    bool _331 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_58.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_61.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5616 = as_type<float>(_131);
        out.gl_Position.z = _5616;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_63.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_61.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    float _171 = as_type<float>(_169);
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5687 = as_type<float>(_169);
        out.gl_Position.z = _5687;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    float _175 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _177 = in.m_68.w;
    bool _179 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _181 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _183 = _179 || _181;
    bool _185 = isnan(1.0);
    bool _187 = _183 || _185;
    float _189 = in.m_63.x;
    float _191 = in.m_63.y;
    float _193 = in.m_63.z;
    float _195 = in.m_58.x;
    float _197 = in.m_58.y;
    float _199 = in.m_58.z;
    float _201 = _175;
    if (!_187)
    {
        float _203 = _175 * _175;
        float _205 = _203 * 0.5;
        _171 = _205;
    }
    float _207 = _171;
    float _209 = _207;
    if (!_187)
    {
        float _211 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _211;
    }
    float _213 = _209;
    int _215 = as_type<int>(_173) & 1;
    bool _217 = _215 != 0;
    int _219 = as_type<int>(_173) & 2;
    bool _221 = _219 != 0;
    bool _223 = !_217;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_221;
    float _229 = _227 ? (-0.5) : 0.5;
    bool _231 = !_187;
    float _233 = _213;
    if (!_231)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = _175 * _237;
        float _247 = 1.0 / _241;
        float _249 = _243 * 0.693147182464599609375;
        float _251 = exp2(_245);
        float _253 = 1.0 / _249;
        float _255 = _251 + (-1.0);
        float _257 = -_255;
        float _259 = fma(_257, _253, _175);
        float _261 = _259 * _247;
        float _263 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _263;
    }
    float _265 = _233;
    bool _267 = !_187;
    if (!_267)
    {
        float _269 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = log2(_269);
        float _273 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _275 = _273 + 1.0;
        float _277 = 1.0 / _275;
        float _279 = _175 * _271;
        float _281 = exp2(_279);
        float _283 = -_281;
        float _285 = _283 + 1.0;
        float _287 = _285 * _277;
        _201 = _287;
    }
    float _289 = _201;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _293 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _295 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _297 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _299 = fma(_289, _189, _293);
    float _301 = fma(_289, _191, _295);
    float _303 = fma(_289, _193, _297);
    float _305 = fma(_299, _177, _195);
    float _307 = fma(_301, _177, _197);
    float _309 = fma(_303, _177, _199);
    bool _311 = !_291;
    float _329;
    if (!_311)
    {
        float _313 = in.m_70.x;
        float _315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _317 = _313 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _321 = _319 * _315;
        float _323 = floor(_321);
        float _325 = -_323;
        float _327 = _321 + _325;
        _329 = _327;
        _331 = true;
    }
    else
    {
        float _333 = float(_115);
        float _335 = 1.0 / _333;
        float _337 = _149 * _335;
        _329 = _337;
    }
    _331 = false;
    float _339 = _329;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _357 = 1.0 / _343;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _367 = 1.0 / _351;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _371 = _339 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _373;
    float _377 = 1.0 / _355;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = _339 + _379;
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _385 = 1.0 / _347;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _389 = _339 + _387;
    float _391 = _381 * _367;
    bool _393 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _395 = isnan(_339);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = 1.0 / _365;
    float _407 = _389 * _377;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _411 = _339 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _415 = _339 + _413;
    float _417 = _411 * _357;
    float _419 = -_403;
    float _421 = _419 + 1.0;
    float _423 = _371 * _385;
    float _425 = 1.0 / _361;
    bool _427 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _429 = isnan(_339);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _441 = _339 + _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _445 = _339 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _447;
    float _451 = -_437;
    float _453 = _451 + 1.0;
    float _455 = _437 * _421;
    float _457 = 1.0 / _375;
    bool _459 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _461 = isnan(_339);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = _441 * _405;
    bool _473 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _475 = isnan(_339);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = fma(_449, _391, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _487 = _469 * _453;
    float _489 = -_469;
    float _491 = _489 + 1.0;
    float _493 = _415 * _425;
    bool _495 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _497 = isnan(_339);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _507;
    bool _511 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _513 = isnan(_339);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = _505 * _491;
    float _525 = -_505;
    float _527 = _525 + 1.0;
    float _529 = _445 * _457;
    float _531 = -_483;
    float _533 = _531 + 1.0;
    float _535 = fma(_509, _391, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _537 = _483 * _527;
    bool _539 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _541 = isnan(_339);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = _521 * _533;
    bool _553 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _555 = isnan(_339);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -_521;
    float _567 = _565 + 1.0;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _573 = -_549;
    float _575 = _573 + 1.0;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _577;
    float _581 = _549 * _567;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _587;
    float _591 = _563 * _575;
    float _593 = fma(_571, _407, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _595 = fma(_585, _407, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _597 = fma(_589, _417, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _599 = fma(_579, _417, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _601 = _485 * _591;
    float _603 = _535 * _591;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _613 = -_563;
    float _615 = _613 + 1.0;
    float _617 = fma(_607, _423, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _619 = fma(_611, _423, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _621 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[143].x, _601);
    float _623 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[143].y, _603);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _629;
    float _633 = fma(_593, _581, _621);
    float _635 = fma(_595, _581, _623);
    float _637 = fma(_627, _493, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _639 = fma(_631, _493, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _649 = fma(_597, _551, _633);
    float _651 = fma(_599, _551, _635);
    float _653 = fma(_643, _471, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _655 = in.m_68.x;
    float _657 = in.m_68.y;
    float _659 = fma(_647, _471, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _661 = fma(_617, _537, _649);
    float _663 = fma(_619, _537, _651);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _665;
    float _669 = fma(_637, _523, _661);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _671;
    float _675 = fma(_639, _523, _663);
    float _677 = fma(_667, _529, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _679 = fma(_653, _487, _669);
    float _681 = fma(_673, _529, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _683 = fma(_659, _487, _675);
    float _685 = fma(_677, _455, _679);
    float _687 = fma(_681, _455, _683);
    float _689 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[150].x, _685);
    float _691 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[150].y, _687);
    float _693 = _689 * _655;
    float _695 = _691 * _657;
    bool _697 = !_383;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[150].y;
    float _701 = _675;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _723;
    if (!_697)
    {
        float _707 = in.m_70.x;
        float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _711 = _707 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _715 = _713 * _709;
        float _717 = floor(_715);
        float _719 = -_717;
        float _721 = _715 + _719;
        _723 = _721;
        _725 = true;
    }
    else
    {
        float _727 = float(_115);
        float _729 = 1.0 / _727;
        float _731 = _149 * _729;
        _723 = _731;
    }
    _725 = false;
    float _733 = _723;
    bool _735 = _733 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _737 = isnan(_733);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _751 = _733 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _753 = isnan(_733);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _769 = _733 + _767;
    float _771 = -_745;
    float _773 = _771 + 1.0;
    bool _775 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _777 = 1.0 / _749;
    float _779 = _761 * _773;
    float _781 = -_761;
    float _783 = _781 + 1.0;
    float _785 = _765 * _777;
    float _787 = fma(_785, _769, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _789 = _787 * _779;
    float _791 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[115].x, _789);
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _799 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[116].x, _791);
    float _801 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _803 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _799 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _801;
    out.m_72.y = _803;
    out.m_72.z = _805;
    out.m_72.w = _807;
    bool _809 = !_775;
    float _811 = _807;
    float _829;
    if (!_809)
    {
        float _813 = in.m_70.x;
        float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _817 = _813 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _819 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _821 = _819 * _815;
        float _823 = floor(_821);
        float _825 = -_823;
        float _827 = _821 + _825;
        _829 = _827;
        _831 = true;
    }
    else
    {
        float _833 = float(_115);
        float _835 = 1.0 / _833;
        float _837 = _149 * _835;
        _829 = _837;
    }
    _831 = false;
    float _839 = _829;
    float _841 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _843 = int(_841);
    float _845 = float(_115);
    float _847 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _849 = int(_847);
    float _851 = float(_843);
    float _853 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _855 = int(_853);
    float _857 = float(uint(_849));
    float _859 = 1.0 / _851;
    float _861 = float(_849);
    float _863 = 1.0 / _857;
    float _865 = float(_855);
    float _867 = _859 * _149;
    float _869 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _871 = int(_869);
    int _873 = as_type<int>(_863) + (-2);
    float _875 = trunc(_867);
    int _877 = int(_875);
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _881 = _879 != 0;
    float _883 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _885 = int(_883);
    float _887 = float(uint(_871));
    float _889 = float(uint(_877));
    float _891 = 1.0 / _865;
    if (_881)
    {
        _811 = 1.0;
    }
    float _893 = _811;
    float _895 = _893;
    if (_881)
    {
        _699 = 1.0;
    }
    float _897 = _699;
    float _899 = as_type<float>(_873) * _889;
    float _901 = _897;
    if (_881)
    {
        _701 = 1.0;
    }
    float _903 = _701;
    float _905 = _889;
    float _907 = _903;
    if (_881)
    {
        float _909 = in.m_70.x;
        _905 = _909;
    }
    float _911 = _905;
    float _913 = float(_885);
    float _915 = trunc(_899);
    float _917 = precise::max(_915, 0.0);
    uint _920 = uint(_917);
    if (_881)
    {
        _703 = 0;
    }
    int _922 = _703;
    int _924 = _922;
    if (_881)
    {
        _705 = 0;
    }
    int _926 = _705;
    float _928 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _930 = int(_928);
    float _932 = _891 * _149;
    float _934 = float(_877);
    bool _936 = _934 >= _861;
    bool _938 = isnan(_934);
    bool _940 = _936 || _938;
    bool _942 = isnan(_861);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = 1.0 / _887;
    float _950 = 1.0 / _913;
    int _952 = ~_849;
    int _954 = _952 + 1;
    float _956 = float(uint(_930));
    int _958 = _954 * int(_920);
    int _960 = _958 + _877;
    float _962 = 1.0 / _956;
    float _964 = float(uint(_960));
    float _966 = _950 * _149;
    float _968 = in.m_70.x;
    float _970 = in.m_70.y;
    float _972 = in.m_70.z;
    float _974 = in.m_70.w;
    float _976 = as_type<float>(_873) * _964;
    float _978 = 1.0 / _845;
    int _980 = as_type<int>(_948) + (-2);
    float _982 = _948;
    float _984 = _911;
    int _986 = _926;
    if (_881)
    {
        _982 = _911;
    }
    float _988 = _982;
    float _990 = trunc(_932);
    int _992 = int(_990);
    float _994 = trunc(_966);
    int _996 = int(_994);
    float _998 = trunc(_946);
    int _1000 = int(_998);
    float _1002 = trunc(_976);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    float _1008 = _988;
    if (!_881)
    {
        float _1010 = in.m_70.y;
        float _1012 = in.m_70.z;
        _895 = 7.345489978790283203125;
        _907 = 5.839270114898681640625;
        _1008 = _1012;
        _901 = 1.2345600128173828125;
        _984 = _1010;
        _924 = 1;
        _986 = 2;
    }
    float _1014 = _895;
    float _1016 = _907;
    float _1018 = _1008;
    float _1020 = _901;
    float _1022 = _984;
    int _1024 = _924;
    int _1026 = _986;
    float _1028 = float(uint(_992));
    float _1030 = _1014 * _968;
    int _1032 = int(_920) + int(_1006);
    float _1034 = _1016 * _1018;
    int _1036 = as_type<int>(_962) + (-2);
    float _1038 = as_type<float>(_980) * _1028;
    float _1040 = float(uint(_996));
    float _1042 = floor(_1030);
    bool _1044 = _974 > 0.5;
    float _1046 = _978 * _149;
    int _1048 = ~_849;
    int _1050 = _1048 + 1;
    float _1052 = as_type<float>(_1036) * _1040;
    int _1054 = ~_871;
    int _1056 = _1054 + 1;
    float _1058 = _1020 * _1022;
    float _1060 = trunc(_1038);
    float _1062 = precise::max(_1060, 0.0);
    uint _1064 = uint(_1062);
    int _1066 = _1050 * _1032;
    int _1068 = _1066 + _877;
    int _1070 = ~_930;
    int _1072 = _1070 + 1;
    float _1074 = _307 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    bool _1076 = _970 > 0.5;
    bool _1078 = uint(_1068) >= uint(_849);
    float _1080 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1074);
    float _1082 = trunc(_1052);
    float _1084 = precise::max(_1082, 0.0);
    uint _1086 = uint(_1084);
    float _1088 = -_1042;
    float _1090 = _1030 + _1088;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1102 = _1100 != 0;
    float _1104 = -_225;
    int _1106 = _1076 ? as_type<int>(_1104) : as_type<int>(_225);
    float _1108 = _1090 * _861;
    bool _1110 = _972 > 0.5;
    float _1112 = _861 * _1046;
    int _1114 = _1056 * int(_1064);
    int _1116 = _1114 + _992;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1120 = _1118 != 0;
    float _1122 = floor(_1058);
    float _1124 = float(uint(_1116));
    bool _1126 = !_1098;
    float _1128 = _1126 ? _225 : as_type<float>(_1106);
    int _1130 = _1072 * int(_1086);
    int _1132 = _1130 + _996;
    float _1134 = -_229;
    int _1136 = _1110 ? as_type<int>(_1134) : as_type<int>(_229);
    float _1138 = as_type<float>(_980) * _1124;
    bool _1140 = !_1078;
    int _1142 = _1140 ? 0 : (-1);
    float _1144 = trunc(_1108);
    int _1146 = int(_1144);
    float _1148 = float(uint(_1132));
    int _1150 = ~_1032;
    int _1152 = _1150 + _1142;
    int _1154 = _1152 + 1;
    bool _1156 = !_1120;
    int _1158 = _1156 ? 0 : 1;
    float _1160 = as_type<float>(_1036) * _1148;
    bool _1162 = !_1102;
    float _1164 = _1162 ? _229 : as_type<float>(_1136);
    float _1166 = trunc(_1138);
    float _1168 = precise::max(_1166, 0.0);
    uint _1170 = uint(_1168);
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1182 = _1180 != 0;
    float _1184 = -_1122;
    float _1186 = _1058 + _1184;
    bool _1188 = _849 == 0;
    int _1190 = abs(_1158);
    bool _1192 = !_1178;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = trunc(_1160);
    float _1198 = precise::max(_1196, 0.0);
    uint _1200 = uint(_1198);
    int _1202 = _849 * _1154;
    int _1204 = _1202 + _877;
    int _1206 = ~_1000;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    int _1212 = _1146 * _1190;
    int _1214 = _1212 + _877;
    int _1216 = _849 + (-1);
    bool _1218 = !_1188;
    int _1220 = _1218 ? _1204 : (-1);
    float _1222 = trunc(_1112);
    int _1224 = int(_1222);
    int _1226 = ~_871;
    int _1228 = _1226 + 1;
    int _1230 = _1220 * _1210;
    int _1232 = int(_1064) + int(_1170);
    int _1234 = abs(_1194);
    int _1236 = _1000 * _1216;
    int _1238 = _1236 + _1230;
    float _1240 = floor(_1034);
    bool _1242 = !_1174;
    int _1244 = _1242 ? 0 : 1;
    int _1246 = _1228 * _1232;
    int _1248 = _1246 + _992;
    int _1250 = int(_1086) + int(_1200);
    int _1252 = abs(_1244);
    int _1254 = ~_930;
    int _1256 = _1254 + 1;
    bool _1258 = !_1182;
    int _1260 = _1258 ? 0 : 1;
    int _1262 = _1238 * _1234;
    bool _1264 = uint(_1248) >= uint(_871);
    int _1266 = abs(_1260);
    int _1268 = _1256 * _1250;
    int _1270 = _1268 + _996;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1274 = _1272 != 0;
    int _1276 = _1224 * _1252;
    int _1278 = _1276 + _1262;
    bool _1280 = !_1264;
    int _1282 = _1280 ? 0 : (-1);
    float _1284 = -_1240;
    float _1286 = _1034 + _1284;
    bool _1288 = uint(_1270) >= uint(_930);
    int _1290 = _1214 * _1266;
    int _1292 = _1290 + _1278;
    bool _1294 = !_1274;
    int _1296 = _1294 ? 0 : 1;
    float _1298 = float(_871);
    float _1300 = float(_992);
    int _1302 = ~_1232;
    int _1304 = _1302 + _1282;
    int _1306 = _1304 + 1;
    int _1308 = abs(_1296);
    bool _1310 = _1300 >= _1298;
    bool _1312 = isnan(_1300);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan(_1298);
    bool _1318 = _1314 || _1316;
    float _1320 = float(_1318);
    float _1322 = float(_930);
    float _1324 = float(_996);
    float _1326 = -_229;
    int _1328 = _1044 ? as_type<int>(_1326) : as_type<int>(_229);
    float _1330 = trunc(_1320);
    int _1332 = int(_1330);
    bool _1334 = _1324 >= _1322;
    bool _1336 = isnan(_1324);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan(_1322);
    bool _1342 = _1338 || _1340;
    float _1344 = float(_1342);
    bool _1346 = !_1094;
    float _1348 = _1346 ? _229 : as_type<float>(_1328);
    int _1350 = _1146 * _1308;
    int _1352 = _1350 + _1292;
    int _1354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1356 = _1354 != 0;
    float _1358 = _1186 * _1298;
    bool _1360 = !_1288;
    int _1362 = _1360 ? 0 : (-1);
    float _1364 = trunc(_1344);
    int _1366 = int(_1364);
    bool _1368 = !_1356;
    int _1370 = _1368 ? 0 : 1;
    float _1372 = _1298 * _1046;
    float _1374 = float(uint(_1352));
    float _1376 = _1322 * _1046;
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1380 = _1378 != 0;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1384 = _1382 != 0;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1392 = _1390 != 0;
    int _1394 = ~_1250;
    int _1396 = _1394 + _1362;
    int _1398 = _1396 + 1;
    float _1400 = trunc(_1358);
    int _1402 = int(_1400);
    float _1404 = as_type<float>(_873) * _1374;
    bool _1406 = !_1380;
    int _1408 = _1406 ? 0 : 1;
    int _1410 = _871 * _1306;
    int _1412 = _1410 + _992;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1416 = _1414 != 0;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1420 = _1418 != 0;
    int _1422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1424 = _1422 != 0;
    int _1426 = _930 * _1398;
    int _1428 = _1426 + _996;
    bool _1430 = _871 == 0;
    bool _1432 = !_1384;
    int _1434 = _1432 ? 0 : 1;
    float _1436 = trunc(_1404);
    float _1438 = precise::max(_1436, 0.0);
    uint _1440 = uint(_1438);
    bool _1442 = _930 == 0;
    int _1444 = abs(_1370);
    int _1446 = ~_1332;
    int _1448 = _1446 + 1;
    int _1450 = _1448 + 1;
    bool _1452 = !_1430;
    int _1454 = _1452 ? _1412 : (-1);
    float _1456 = trunc(_1372);
    int _1458 = int(_1456);
    int _1460 = ~_1366;
    int _1462 = _1460 + 1;
    int _1464 = _1462 + 1;
    bool _1466 = !_1442;
    int _1468 = _1466 ? _1428 : (-1);
    int _1470 = _1454 * _1450;
    float _1472 = _1286 * _1322;
    int _1474 = _871 + (-1);
    int _1476 = _1468 * _1464;
    int _1478 = ~_849;
    int _1480 = _1478 + 1;
    int _1482 = _1402 * _1444;
    int _1484 = _1482 + _992;
    int _1486 = _930 + (-1);
    int _1488 = _1332 * _1474;
    int _1490 = _1488 + _1470;
    float _1492 = trunc(_1376);
    int _1494 = int(_1492);
    bool _1496 = !_1420;
    int _1498 = _1496 ? 0 : 1;
    int _1500 = _1366 * _1486;
    int _1502 = _1500 + _1476;
    int _1504 = abs(_1434);
    int _1506 = _1480 * int(_1440);
    int _1508 = _1506 + _1352;
    int _1510 = abs(_1498);
    bool _1512 = !_1388;
    int _1514 = _1512 ? 0 : 1;
    float _1516 = float(uint(_1508));
    int _1518 = _1490 * _1504;
    int _1520 = abs(_1408);
    int _1522 = _1502 * _1510;
    int _1524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1526 = _1524 != 0;
    float _1528 = as_type<float>(_873) * _1516;
    int _1530 = abs(_1514);
    int _1532 = _1458 * _1520;
    int _1534 = _1532 + _1518;
    bool _1536 = !_1526;
    int _1538 = _1536 ? 0 : 1;
    float _1540 = trunc(_1528);
    float _1542 = precise::max(_1540, 0.0);
    uint _1544 = uint(_1542);
    bool _1546 = !_1392;
    int _1548 = _1546 ? 0 : 1;
    float _1550 = _307 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _1552 = abs(_1538);
    float _1554 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1550);
    float _1556 = float(uint(_1214));
    float _1558 = trunc(_1472);
    int _1560 = int(_1558);
    bool _1562 = !_1416;
    int _1564 = _1562 ? 0 : 1;
    int _1566 = _1484 * _1530;
    int _1568 = _1566 + _1534;
    int _1570 = abs(_1548);
    float _1572 = as_type<float>(_873) * _1556;
    int _1574 = abs(_1564);
    int _1576 = _1402 * _1570;
    int _1578 = _1576 + _1568;
    float _1580 = trunc(_1572);
    float _1582 = precise::max(_1580, 0.0);
    uint _1584 = uint(_1582);
    int _1586 = int(_1440) + int(_1544);
    float _1588 = float(uint(_1578));
    int _1590 = _1494 * _1574;
    int _1592 = _1590 + _1522;
    bool _1594 = !_1424;
    int _1596 = _1594 ? 0 : 1;
    int _1598 = _1560 * _1552;
    int _1600 = _1598 + _996;
    int _1602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1604 = _1602 != 0;
    float _1606 = as_type<float>(_980) * _1588;
    int _1608 = abs(_1596);
    int _1610 = ~_849;
    int _1612 = _1610 + 1;
    bool _1614 = !_1604;
    int _1616 = _1614 ? 0 : 1;
    float _1618 = trunc(_1606);
    float _1620 = precise::max(_1618, 0.0);
    uint _1622 = uint(_1620);
    int _1624 = ~_849;
    int _1626 = _1624 + 1;
    int _1628 = _1600 * _1608;
    int _1630 = _1628 + _1592;
    int _1632 = abs(_1616);
    int _1634 = _1612 * int(_1584);
    int _1636 = _1634 + _1214;
    float _1638 = float(uint(_1484));
    int _1640 = _1626 * _1586;
    int _1642 = _1640 + _1352;
    float _1644 = float(uint(_1636));
    float _1646 = as_type<float>(_980) * _1638;
    int _1648 = ~_871;
    int _1650 = _1648 + 1;
    int _1652 = _1560 * _1632;
    int _1654 = _1652 + _1630;
    bool _1656 = uint(_1642) >= uint(_849);
    float _1658 = trunc(_1646);
    float _1660 = precise::max(_1658, 0.0);
    uint _1662 = uint(_1660);
    float _1664 = as_type<float>(_873) * _1644;
    bool _1666 = !_1656;
    int _1668 = _1666 ? 0 : (-1);
    float _1670 = float(uint(_1654));
    int _1672 = _1650 * int(_1622);
    int _1674 = _1672 + _1578;
    int _1676 = ~_1586;
    int _1678 = _1676 + _1668;
    int _1680 = _1678 + 1;
    float _1682 = trunc(_1664);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    int _1688 = ~_871;
    int _1690 = _1688 + 1;
    float _1692 = as_type<float>(_1036) * _1670;
    float _1694 = float(uint(_1674));
    int _1696 = _849 * _1680;
    int _1698 = _1696 + _1352;
    bool _1700 = _849 == 0;
    float _1702 = trunc(_1692);
    float _1704 = precise::max(_1702, 0.0);
    uint _1706 = uint(_1704);
    bool _1708 = !_1700;
    int _1710 = _1708 ? _1698 : (-1);
    float _1712 = as_type<float>(_980) * _1694;
    int _1714 = ~_930;
    int _1716 = _1714 + 1;
    int _1718 = _1690 * int(_1662);
    int _1720 = _1718 + _1484;
    int _1722 = _1710 & 3;
    bool _1724 = _1722 != 0;
    int _1726 = _1710 & 3;
    bool _1728 = _1726 != 0;
    float _1730 = trunc(_1712);
    float _1732 = precise::max(_1730, 0.0);
    uint _1734 = uint(_1732);
    float _1736 = float(uint(_1720));
    int _1738 = _1724 ? 0 : 1;
    bool _1740 = uint(_1726) > 1u;
    float _1742 = as_type<float>(_980) * _1736;
    int _1744 = int(_1584) + int(_1686);
    float _1746 = trunc(_1742);
    float _1748 = precise::max(_1746, 0.0);
    uint _1750 = uint(_1748);
    int _1752 = ~_849;
    int _1754 = _1752 + 1;
    int _1756 = _1716 * int(_1706);
    int _1758 = _1756 + _1654;
    int _1760 = ~_1738;
    int _1762 = _1760 + 1;
    int _1764 = _1762 + 1;
    bool _1766 = !_1728;
    int _1768 = _1766 ? 0 : 1;
    int _1770 = _1754 * _1744;
    int _1772 = _1770 + _1214;
    float _1774 = float(uint(_1758));
    int _1776 = int(_1622) + int(_1734);
    int _1778 = _1764;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_1740)
    {
        int _1782 = ~_1738;
        int _1784 = _1782 + 1;
        _1778 = _1784;
    }
    int _1786 = _1778;
    float _1788 = as_type<float>(_1036) * _1774;
    int _1790 = ~_871;
    int _1792 = _1790 + 1;
    bool _1794 = uint(_1726) >= 2u;
    int _1796 = int(_1662) + int(_1750);
    int _1798 = _1792 * _1776;
    int _1800 = _1798 + _1578;
    int _1802 = _1794 ? 0 : 1;
    float _1804 = trunc(_1788);
    float _1806 = precise::max(_1804, 0.0);
    uint _1808 = uint(_1806);
    bool _1810 = uint(_1772) >= uint(_849);
    int _1812 = ~_1802;
    int _1814 = _1812 + 1;
    int _1816 = _1814 + 1;
    bool _1818 = !_1810;
    int _1820 = _1818 ? 0 : (-1);
    bool _1822 = uint(_1800) >= uint(_871);
    int _1824 = ~_1744;
    int _1826 = _1824 + _1820;
    int _1828 = _1826 + 1;
    bool _1830 = !_1822;
    int _1832 = _1830 ? 0 : (-1);
    bool _1834 = _1726 != 3;
    int _1836 = _849 * _1828;
    int _1838 = _1836 + _1214;
    int _1840 = ~_1776;
    int _1842 = _1840 + _1832;
    int _1844 = _1842 + 1;
    float _1846 = float(uint(_1600));
    int _1848 = int(_1706) + int(_1808);
    int _1850 = _871 * _1844;
    int _1852 = _1850 + _1578;
    bool _1854 = !_1700;
    int _1856 = _1854 ? _1838 : (-1);
    float _1858 = as_type<float>(_1036) * _1846;
    int _1860 = ~_930;
    int _1862 = _1860 + 1;
    bool _1864 = !_1430;
    int _1866 = _1864 ? _1852 : (-1);
    float _1868 = trunc(_1858);
    float _1870 = precise::max(_1868, 0.0);
    uint _1872 = uint(_1870);
    int _1874 = _1816;
    if (_1834)
    {
        int _1876 = ~_1802;
        int _1878 = _1876 + 1;
        _1874 = _1878;
    }
    int _1880 = _1874;
    int _1882 = _1862 * _1848;
    int _1884 = _1882 + _1654;
    int _1886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1888 = _1886 != 0;
    int _1890 = _1866 & 3;
    bool _1892 = _1890 != 0;
    int _1894 = _1866 & 3;
    bool _1896 = _1894 != 0;
    bool _1898 = !_1888;
    int _1900 = _1898 ? 0 : 1;
    bool _1902 = uint(_1890) >= 2u;
    int _1904 = _1896 ? 0 : 1;
    bool _1906 = uint(_1884) >= uint(_930);
    int _1908 = ~_930;
    int _1910 = _1908 + 1;
    int _1912 = _1902 ? 0 : 1;
    bool _1914 = uint(_1890) > 1u;
    int _1916 = _1910 * int(_1872);
    int _1918 = _1916 + _1600;
    bool _1920 = !_1906;
    int _1922 = _1920 ? 0 : (-1);
    int _1924 = ~_871;
    int _1926 = _1924 + 1;
    bool _1928 = _1890 != 3;
    int _1930 = ~_1848;
    int _1932 = _1930 + _1922;
    int _1934 = _1932 + 1;
    int _1936 = _1926 * _1796;
    int _1938 = _1936 + _1484;
    float _1940 = float(uint(_1918));
    int _1942 = ~_1904;
    int _1944 = _1942 + 1;
    int _1946 = _1944 + 1;
    int _1948 = _930 * _1934;
    int _1950 = _1948 + _1654;
    int _1952 = _1946;
    if (!_1914)
    {
        int _1954 = ~_1904;
        int _1956 = _1954 + 1;
        _1952 = _1956;
    }
    int _1958 = _1952;
    float _1960 = as_type<float>(_1036) * _1940;
    bool _1962 = uint(_1938) >= uint(_871);
    bool _1964 = !_1442;
    int _1966 = _1964 ? _1950 : (-1);
    int _1968 = ~_1912;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    float _1974 = trunc(_1960);
    float _1976 = precise::max(_1974, 0.0);
    uint _1978 = uint(_1976);
    int _1980 = _1972;
    if (_1928)
    {
        int _1982 = ~_1912;
        int _1984 = _1982 + 1;
        _1980 = _1984;
    }
    int _1986 = _1980;
    int _1988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1990 = _1988 != 0;
    bool _1992 = !_1962;
    int _1994 = _1992 ? 0 : (-1);
    int _1996 = _1966 & 3;
    bool _1998 = _1996 != 0;
    bool _2000 = !_1990;
    int _2002 = _2000 ? 0 : 1;
    bool _2004 = uint(_1996) > 1u;
    bool _2006 = !_1892;
    int _2008 = _2006 ? 0 : 1;
    int _2010 = _1966 & 3;
    bool _2012 = _2010 != 0;
    bool _2014 = !_1998;
    int _2016 = _2014 ? 0 : 1;
    int _2018 = _2012 ? 0 : 1;
    int _2020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2022 = _2020 != 0;
    int _2024 = ~_2018;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    bool _2030 = !_2022;
    int _2032 = _2030 ? 0 : 1;
    bool _2034 = _1726 != 3;
    int _2036 = _2028;
    if (!_2004)
    {
        int _2038 = ~_2018;
        int _2040 = _2038 + 1;
        _2036 = _2040;
    }
    int _2042 = _2036;
    int _2044 = ~_930;
    int _2046 = _2044 + 1;
    bool _2048 = _1996 != 3;
    bool _2050 = !_2034;
    int _2052 = _2050 ? 0 : (-1);
    bool _2054 = _1890 != 3;
    int _2056 = int(_1872) + int(_1978);
    bool _2058 = uint(_1996) >= 2u;
    int _2060 = _2058 ? 0 : 1;
    bool _2062 = _1996 != 3;
    int _2064 = _2046 * _2056;
    int _2066 = _2064 + _1600;
    int _2068 = ~_2060;
    int _2070 = _2068 + 1;
    int _2072 = _2070 + 1;
    bool _2074 = !_2062;
    int _2076 = _2074 ? 0 : (-1);
    int _2078 = _2072;
    if (_2048)
    {
        int _2080 = ~_2060;
        int _2082 = _2080 + 1;
        _2078 = _2082;
    }
    int _2084 = _2078;
    int _2086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2088 = _2086 != 0;
    bool _2090 = uint(_2066) >= uint(_930);
    int _2092 = _1710 >> 31;
    int _2094 = _1866 >> 31;
    bool _2096 = !_2090;
    int _2098 = _2096 ? 0 : (-1);
    int _2100 = _2092 & 3;
    float _2102 = _307 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    int _2104 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2106 = _2104 != 0;
    int _2108 = _1966 >> 31;
    float _2110 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[14].x, _2102);
    int _2112 = _2094 & 3;
    float _2114 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[16].x, _2110);
    int _2116 = _1710 + _2100;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2120 = _2108 & 3;
    float _2122 = _2114 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    int _2124 = _1866 + _2112;
    float _2126 = _970 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2128 = _307 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    bool _2130 = !_2054;
    int _2132 = _2130 ? 0 : (-1);
    float _2134 = fma(_2126, -2.0, _2118);
    int _2136 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2138 = _2136 != 0;
    float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2142 = _2140 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2144 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[14].y, _2128);
    int _2146 = _1966 + _2120;
    float _2148 = 1.0 / _2142;
    int _2150 = _2116 >> 2;
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2154 = _2124 >> 2;
    float _2156 = _968 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2158 = _2146 >> 2;
    float _2160 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2134);
    int _2162 = _2150 << 4;
    int _2164 = _2162 + 368;
    float _2166 = -_2152;
    float _2168 = fma(_2156, 2.0, _2166);
    int _2170 = _2154 << 4;
    int _2172 = _2170 + 512;
    float _2174 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[16].y, _2144);
    int _2176 = _2158 << 4;
    int _2178 = _2176 + 656;
    uint _2180 = uint(int(uint(_2164) >> uint(2)));
    uint _2182 = uint(int(uint(int(_2180)) >> uint(2)));
    int _2184 = int(_2180) & 3;
    float _2186 = (*spvDescriptorSet0.vp_c9)._m0[int(_2182)][_2184];
    int _2188 = int(_2180) + 1;
    uint _2190 = uint(int(uint(_2188) >> uint(2)));
    int _2192 = _2188 & 3;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[int(_2190)][_2192];
    float _2196 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1554);
    float _2198 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1080);
    float _2200 = _2174 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _2202 = _2196 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    uint _2204 = uint(int(uint(_2172) >> uint(2)));
    uint _2206 = uint(int(uint(int(_2204)) >> uint(2)));
    int _2208 = int(_2204) & 3;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[int(_2206)][_2208];
    int _2212 = int(_2204) + 1;
    uint _2214 = uint(int(uint(_2212) >> uint(2)));
    int _2216 = _2212 & 3;
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[int(_2214)][_2216];
    float _2220 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _2222 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2222;
    float _2226 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _2228 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _2220);
    int _2230 = abs(_1786);
    uint _2232 = uint(int(uint(_2178) >> uint(2)));
    uint _2234 = uint(int(uint(int(_2232)) >> uint(2)));
    int _2236 = int(_2232) & 3;
    float _2238 = (*spvDescriptorSet0.vp_c9)._m0[int(_2234)][_2236];
    int _2240 = int(_2232) + 1;
    uint _2242 = uint(int(uint(_2240) >> uint(2)));
    int _2244 = _2240 & 3;
    float _2246 = (*spvDescriptorSet0.vp_c9)._m0[int(_2242)][_2244];
    float _2248 = _2224 * _2148;
    float _2250 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _2226);
    int _2252 = ~_1796;
    int _2254 = _2252 + _1994;
    int _2256 = _2254 + 1;
    float _2258 = -_149;
    float _2260 = fma(_2258, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2168);
    int _2262 = abs(_1958);
    int _2264 = _2164 + 8;
    uint _2266 = uint(int(uint(_2264) >> uint(2)));
    uint _2268 = uint(int(uint(int(_2266)) >> uint(2)));
    int _2270 = int(_2266) & 3;
    float _2272 = (*spvDescriptorSet0.vp_c9)._m0[int(_2268)][_2270];
    int _2274 = int(_2266) + 1;
    uint _2276 = uint(int(uint(_2274) >> uint(2)));
    int _2278 = _2274 & 3;
    float _2280 = (*spvDescriptorSet0.vp_c9)._m0[int(_2276)][_2278];
    int _2282 = _871 * _2256;
    int _2284 = _2282 + _1484;
    int _2286 = abs(_2042);
    float _2288 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    int _2290 = ~_2230;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = _2172 + 8;
    uint _2298 = uint(int(uint(_2296) >> uint(2)));
    uint _2300 = uint(int(uint(int(_2298)) >> uint(2)));
    int _2302 = int(_2298) & 3;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[int(_2300)][_2302];
    int _2306 = int(_2298) + 1;
    uint _2308 = uint(int(uint(_2306) >> uint(2)));
    int _2310 = _2306 & 3;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[int(_2308)][_2310];
    float _2314 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _2288);
    int _2316 = ~_2056;
    int _2318 = _2316 + _2098;
    int _2320 = _2318 + 1;
    float _2322 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _2228);
    float _2324 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2326 = int(_2324);
    int _2328 = abs(_1768);
    int _2330 = ~_2262;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    int _2336 = _2178 + 8;
    uint _2338 = uint(int(uint(_2336) >> uint(2)));
    uint _2340 = uint(int(uint(int(_2338)) >> uint(2)));
    int _2342 = int(_2338) & 3;
    float _2344 = (*spvDescriptorSet0.vp_c9)._m0[int(_2340)][_2342];
    int _2346 = int(_2338) + 1;
    uint _2348 = uint(int(uint(_2346) >> uint(2)));
    int _2350 = _2346 & 3;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[int(_2348)][_2350];
    int _2354 = abs(_2008);
    int _2356 = _930 * _2320;
    int _2358 = _2356 + _1600;
    int _2360 = abs(_2016);
    int _2362 = ~_2286;
    int _2364 = _2362 + 1;
    int _2366 = _2364 + 1;
    int _2368 = ~_2328;
    int _2370 = _2368 + 1;
    int _2372 = _2370 + 1;
    int _2374 = _2294 * as_type<int>(_2194);
    int _2376 = ~_2354;
    int _2378 = _2376 + 1;
    int _2380 = _2378 + 1;
    float _2382 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2384 = int(_2382);
    int _2386 = ~_2360;
    int _2388 = _2386 + 1;
    int _2390 = _2388 + 1;
    int _2392 = _2372 * as_type<int>(_2186);
    int _2394 = _2392 + _2374;
    int _2396 = abs(_1880);
    float _2398 = float(uint(_2326));
    int _2400 = _2334 * as_type<int>(_2218);
    int _2402 = ~_2396;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    float _2408 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2410 = int(_2408);
    int _2412 = abs(_1900);
    int _2414 = _2380 * as_type<int>(_2210);
    int _2416 = _2414 + _2400;
    int _2418 = abs(_1986);
    int _2420 = abs(_2052);
    int _2422 = _2366 * as_type<int>(_2246);
    int _2424 = ~_2418;
    int _2426 = _2424 + 1;
    int _2428 = _2426 + 1;
    int _2430 = abs(_2076);
    int _2432 = _2390 * as_type<int>(_2238);
    int _2434 = _2432 + _2422;
    int _2436 = abs(_2084);
    float _2438 = 1.0 / _2398;
    bool _2440 = !_1442;
    int _2442 = _2440 ? _2358 : (-1);
    int _2444 = _2406 * as_type<int>(_2272);
    int _2446 = _2444 + _2394;
    int _2448 = ~_2436;
    int _2450 = _2448 + 1;
    int _2452 = _2450 + 1;
    int _2454 = ~_2420;
    int _2456 = _2454 + 1;
    int _2458 = _2456 + 1;
    int _2460 = abs(_2002);
    int _2462 = _2428 * as_type<int>(_2304);
    int _2464 = _2462 + _2416;
    int _2466 = abs(_2132);
    int _2468 = _2458 * as_type<int>(_2280);
    int _2470 = _2468 + _2446;
    int _2472 = ~_2412;
    int _2474 = _2472 + 1;
    int _2476 = _2474 + 1;
    float _2478 = _968 * 2.0;
    int _2480 = ~_2466;
    int _2482 = _2480 + 1;
    int _2484 = _2482 + 1;
    float _2486 = float(uint(_2410));
    int _2488 = _2452 * as_type<int>(_2344);
    int _2490 = _2488 + _2434;
    int _2492 = abs(_2326);
    int _2494 = _2484 * as_type<int>(_2312);
    int _2496 = _2494 + _2464;
    float _2498 = float(uint(_2384));
    float _2500 = 1.0 / _2486;
    float _2502 = float(uint(_2492));
    int _2504 = _2470 * _2476;
    int _2506 = ~_2460;
    int _2508 = _2506 + 1;
    int _2510 = _2508 + 1;
    int _2512 = abs(_2410);
    int _2514 = _1856 * _2412;
    int _2516 = _2514 + _2504;
    int _2518 = as_type<int>(_2438) + (-2);
    float _2520 = 1.0 / _2502;
    bool _2522 = !_1430;
    int _2524 = _2522 ? _2284 : (-1);
    int _2526 = _2496 * _2510;
    int _2528 = abs(_2384);
    int _2530 = _2524 * _2460;
    int _2532 = _2530 + _2526;
    float _2534 = float(uint(_2512));
    float _2536 = 1.0 / _2498;
    int _2538 = abs(_2032);
    int _2540 = ~_2538;
    int _2542 = _2540 + 1;
    int _2544 = _2542 + 1;
    int _2546 = ~_2430;
    int _2548 = _2546 + 1;
    int _2550 = _2548 + 1;
    float _2552 = 1.0 / _2534;
    int _2554 = as_type<int>(_2500) + (-2);
    float _2556 = float(uint(_2516));
    int _2558 = _2550 * as_type<int>(_2352);
    int _2560 = _2558 + _2490;
    float _2562 = float(uint(_2532));
    float _2564 = float(uint(_2528));
    int _2566 = _2560 * _2544;
    int _2568 = as_type<int>(_2536) + (-2);
    float _2570 = as_type<float>(_2554) * _2562;
    int _2572 = abs(_2516);
    int _2574 = _2442 * _2538;
    int _2576 = _2574 + _2566;
    float _2578 = as_type<float>(_2518) * _2556;
    float _2580 = trunc(_2570);
    float _2582 = precise::max(_2580, 0.0);
    uint _2584 = uint(_2582);
    float _2586 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _2314);
    int _2588 = as_type<int>(_2520) + (-2);
    float _2590 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _2250);
    float _2592 = 1.0 / _2564;
    float _2594 = float(uint(_2572));
    float _2596 = _968 + _970;
    float _2598 = float(uint(_2576));
    int _2600 = abs(_2532);
    float _2602 = as_type<float>(_2588) * _2594;
    int _2604 = ~_2410;
    int _2606 = _2604 + 1;
    float _2608 = trunc(_2578);
    float _2610 = precise::max(_2608, 0.0);
    uint _2612 = uint(_2610);
    float _2614 = as_type<float>(_2568) * _2598;
    int _2616 = as_type<int>(_2552) + (-2);
    float _2618 = _2596 + (-1.0);
    float _2620 = float(uint(_2600));
    int _2622 = _2606 * int(_2584);
    int _2624 = _2622 + _2532;
    int _2626 = ~_2326;
    int _2628 = _2626 + 1;
    float _2630 = trunc(_2614);
    float _2632 = precise::max(_2630, 0.0);
    uint _2634 = uint(_2632);
    float _2636 = as_type<float>(_2616) * _2620;
    int _2638 = as_type<int>(_2592) + (-2);
    float _2640 = float(uint(_2624));
    int _2642 = ~_2492;
    int _2644 = _2642 + 1;
    float _2646 = trunc(_2602);
    float _2648 = precise::max(_2646, 0.0);
    uint _2650 = uint(_2648);
    int _2652 = abs(_2576);
    int _2654 = _2628 * int(_2612);
    int _2656 = _2654 + _2516;
    float _2658 = float(uint(_2652));
    float _2660 = float(uint(_2656));
    float _2662 = trunc(_2636);
    float _2664 = precise::max(_2662, 0.0);
    uint _2666 = uint(_2664);
    float _2668 = fma(_2618, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2670 = as_type<float>(_2638) * _2658;
    float _2672 = as_type<float>(_2554) * _2640;
    float _2674 = as_type<float>(_2518) * _2660;
    int _2676 = ~_2512;
    int _2678 = _2676 + 1;
    float _2680 = _970 + _972;
    float _2682 = floor(_2478);
    int _2684 = _2644 * int(_2650);
    int _2686 = _2684 + _2572;
    float _2688 = _2680 + (-1.0);
    bool _2690 = _970 > 0.5;
    int _2692 = ~_2384;
    int _2694 = _2692 + 1;
    float _2696 = trunc(_2670);
    float _2698 = precise::max(_2696, 0.0);
    uint _2700 = uint(_2698);
    bool _2702 = _972 > 0.5;
    float _2704 = trunc(_2674);
    float _2706 = precise::max(_2704, 0.0);
    uint _2708 = uint(_2706);
    float _2710 = float(uint(_2686));
    int _2712 = _2678 * int(_2666);
    int _2714 = _2712 + _2600;
    bool _2716 = _2682 > 0.0;
    bool _2718 = _2682 >= 0.0;
    bool _2720 = isnan(_2682);
    bool _2722 = _2718 || _2720;
    bool _2724 = isnan(0.0);
    bool _2726 = _2722 || _2724;
    float _2728 = fma(_2688, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2730 = float(uint(_2714));
    float _2732 = trunc(_2672);
    float _2734 = precise::max(_2732, 0.0);
    uint _2736 = uint(_2734);
    float _2738 = as_type<float>(_2588) * _2710;
    int _2740 = ~_2528;
    int _2742 = _2740 + 1;
    float _2744 = -_229;
    int _2746 = _2690 ? as_type<int>(_2744) : as_type<int>(_229);
    float _2748 = as_type<float>(_2616) * _2730;
    bool _2750 = _1024 != 1;
    int _2752 = _2742 * int(_2700);
    int _2754 = _2752 + _2652;
    bool _2756 = !_2138;
    float _2758 = _2756 ? _229 : as_type<float>(_2746);
    float _2760 = trunc(_2738);
    float _2762 = precise::max(_2760, 0.0);
    uint _2764 = uint(_2762);
    bool _2766 = _1026 != 2;
    int _2768 = _2694 * int(_2634);
    int _2770 = _2768 + _2576;
    int _2772 = ~_2326;
    int _2774 = _2772 + 1;
    int _2776 = int(_2612) + int(_2708);
    float _2778 = float(uint(_2754));
    float _2780 = trunc(_2748);
    float _2782 = precise::max(_2780, 0.0);
    uint _2784 = uint(_2782);
    float _2786 = float(uint(_2770));
    int _2788 = int(_2584) + int(_2736);
    float _2790 = as_type<float>(_2638) * _2778;
    int _2792 = _2774 * _2776;
    int _2794 = _2792 + _2516;
    float _2796 = as_type<float>(_2568) * _2786;
    float _2798 = -_225;
    int _2800 = _2702 ? as_type<int>(_2798) : as_type<int>(_225);
    float _2802 = sqrt(_2590);
    int _2804 = ~_2492;
    int _2806 = _2804 + 1;
    bool _2808 = uint(_2794) >= uint(_2326);
    int _2810 = int(_2650) + int(_2764);
    bool _2812 = !_2808;
    int _2814 = _2812 ? 0 : (-1);
    float _2816 = trunc(_2796);
    float _2818 = precise::max(_2816, 0.0);
    uint _2820 = uint(_2818);
    int _2822 = ~_2512;
    int _2824 = _2822 + 1;
    int _2826 = _2806 * _2810;
    int _2828 = _2826 + _2572;
    int _2830 = int(_2666) + int(_2784);
    int _2832 = ~_2776;
    int _2834 = _2832 + _2814;
    int _2836 = _2834 + 1;
    int _2838 = ~_2410;
    int _2840 = _2838 + 1;
    float _2842 = trunc(_2790);
    float _2844 = precise::max(_2842, 0.0);
    uint _2846 = uint(_2844);
    bool _2848 = uint(_2828) >= uint(_2492);
    int _2850 = _2824 * _2830;
    int _2852 = _2850 + _2600;
    bool _2854 = !_2088;
    float _2856 = _2854 ? _225 : as_type<float>(_2800);
    int _2858 = _2326 * _2836;
    int _2860 = _2858 + _2516;
    bool _2862 = _2326 == 0;
    int _2864 = _2840 * _2788;
    int _2866 = _2864 + _2532;
    bool _2868 = !_2848;
    float _2870 = _2868 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2872 = _970 * 2.0;
    int _2874 = int(_2634) + int(_2820);
    float _2876 = sqrt(_2586);
    bool _2878 = _968 > 0.5;
    float _2880 = _2802 * _2200;
    int _2882 = ~_2384;
    int _2884 = _2882 + 1;
    bool _2886 = !_2862;
    int _2888 = _2886 ? _2860 : (-1);
    float _2890 = _2880 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2892 = uint(_2866) >= uint(_2410);
    int _2894 = _2884 * _2874;
    int _2896 = _2894 + _2576;
    float _2898 = -_225;
    int _2900 = _2878 ? as_type<int>(_2898) : as_type<int>(_225);
    float _2902 = floor(_2872);
    bool _2904 = uint(_2852) >= uint(_2512);
    int _2906 = int(_2700) + int(_2846);
    bool _2908 = !_2892;
    float _2910 = _2908 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2912 = _2876 * _2202;
    bool _2914 = !_2904;
    int _2916 = _2914 ? 0 : (-1);
    bool _2918 = uint(_2896) >= uint(_2384);
    int _2920 = ~_2788;
    int _2922 = _2920 + as_type<int>(_2910);
    int _2924 = _2922 + 1;
    bool _2926 = !_2106;
    float _2928 = _2926 ? _225 : as_type<float>(_2900);
    int _2930 = ~_2528;
    int _2932 = _2930 + 1;
    int _2934 = _2410 * _2924;
    int _2936 = _2934 + _2532;
    bool _2938 = _2326 == 0;
    int _2940 = _2532 ^ _2410;
    int _2942 = _2932 * _2906;
    int _2944 = _2942 + _2652;
    int _2946 = _2516 ^ _2326;
    uint _2948 = uint(int(uint(_2940) >> uint(31)));
    uint _2950 = uint(int(uint(_2946) >> uint(31)));
    int _2952 = ~as_type<int>(_2870);
    int _2954 = _2810 + _2952;
    int _2956 = _2954 + 1;
    float _2958 = _972 * 2.0;
    int _2960 = ~_2916;
    int _2962 = _2830 + _2960;
    int _2964 = _2962 + 1;
    int _2966 = ~int(_2948);
    int _2968 = _2966 + 1;
    float _2970 = sqrt(_2322);
    int _2972 = ~int(_2950);
    int _2974 = _2972 + 1;
    float _2976 = as_type<float>(_2516);
    float _2978 = _2870;
    float _2980 = as_type<float>(_2512);
    float _2982 = _2910;
    float _2984 = as_type<float>(_2936);
    if (!_2750)
    {
        _2976 = _970;
    }
    float _2986 = _2976;
    int _2988 = _2964 ^ _2968;
    int _2990 = _2956 ^ _2974;
    float _2992 = floor(_2958);
    float _2994 = _2986;
    if (!_2750)
    {
        _2978 = _972;
    }
    float _2996 = _2978;
    float _2998 = _2996;
    if (!_2750)
    {
        _2980 = _972;
    }
    float _3000 = _2980;
    float _3002 = _3000;
    if (!_2750)
    {
        _2982 = _2986;
    }
    float _3004 = _2982;
    float _3006 = _3004;
    if (_2750)
    {
        _3006 = _968;
    }
    float _3008 = _3006;
    float _3010 = _2970 * _2122;
    if (_2750)
    {
        _2994 = _968;
    }
    float _3012 = _2994;
    if (_2750)
    {
        _2998 = _970;
    }
    float _3014 = _2998;
    float _3016 = _3008 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2750)
    {
        _3002 = _970;
    }
    float _3018 = _3002;
    bool _3020 = _2410 == 0;
    float _3022 = _3014 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _3024 = _2410 == 0;
    float _3026 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3028 = _839 + _3026;
    int _3030 = ~_2968;
    int _3032 = _3030 + _2988;
    int _3034 = _3032 + 1;
    float _3036 = _2880 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3038 = !_2918;
    int _3040 = _3038 ? 0 : (-1);
    float _3042 = fma(_2248, _3028, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _3044 = ~_2974;
    int _3046 = _3044 + _2990;
    int _3048 = _3046 + 1;
    bool _3050 = !_3020;
    int _3052 = _3050 ? _2936 : (-1);
    bool _3054 = !_3024;
    int _3056 = _3054 ? _3034 : (-1);
    int _3058 = ~_2874;
    int _3060 = _3058 + _3040;
    int _3062 = _3060 + 1;
    bool _3064 = !_2938;
    int _3066 = _3064 ? _3048 : (-1);
    int _3068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3070 = _3068 != 0;
    int _3072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3074 = _3072 != 0;
    int _3076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3078 = _3076 != 0;
    bool _3080 = uint(_2944) >= uint(_2528);
    bool _3082 = _839 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3084 = isnan(_839);
    bool _3086 = _3082 || _3084;
    bool _3088 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3090 = _3086 || _3088;
    float _3092 = float(_3090);
    bool _3094 = _839 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3096 = isnan(_839);
    bool _3098 = _3094 || _3096;
    bool _3100 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3102 = _3098 || _3100;
    float _3104 = float(_3102);
    int _3106 = _2384 * _3062;
    int _3108 = _3106 + _2576;
    bool _3110 = !_3080;
    int _3112 = _3110 ? 0 : (-1);
    bool _3114 = _2384 == 0;
    float _3116 = -_3104;
    float _3118 = _3116 + 1.0;
    if (_2766)
    {
        _2984 = _968;
    }
    float _3120 = _2984;
    float _3122 = _3120;
    if (_2766)
    {
        _1780 = _970;
    }
    float _3124 = _1780;
    float _3126 = _3092 * _3118;
    float _3128 = _3124;
    if (!_2766)
    {
        _3122 = _972;
    }
    float _3130 = _3122;
    float _3132 = -_3092;
    float _3134 = _3132 + 1.0;
    if (!_2766)
    {
        _3128 = _968;
    }
    float _3136 = _3128;
    float _3138 = _3042 * _3126;
    bool _3140 = _2992 >= 0.0;
    bool _3142 = isnan(_2992);
    bool _3144 = _3140 || _3142;
    bool _3146 = isnan(0.0);
    bool _3148 = _3144 || _3146;
    float _3150 = _2880 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3152 = !_3114;
    int _3154 = _3152 ? _3108 : (-1);
    float _3156 = fma(_3134, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3138);
    bool _3158 = !_3070;
    int _3160 = _3158 ? 0 : 1;
    float _3162 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2890);
    bool _3164 = _2902 > 0.0;
    float _3166 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3150);
    bool _3168 = _2902 >= 0.0;
    bool _3170 = isnan(_2902);
    bool _3172 = _3168 || _3170;
    bool _3174 = isnan(0.0);
    bool _3176 = _3172 || _3174;
    float _3178 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3036);
    int _3180 = _3148 ? 0 : 1;
    float _3182 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3166);
    bool _3184 = _2992 > 0.0;
    float _3186 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3178);
    int _3188 = ~_3180;
    int _3190 = _3188 + 1;
    int _3192 = _3190 + 1;
    int _3194 = ~_3112;
    int _3196 = _2906 + _3194;
    int _3198 = _3196 + 1;
    float _3200 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3202 = float(_2888);
    int _3204 = _3192;
    if (!_3184)
    {
        int _3206 = ~_3180;
        int _3208 = _3206 + 1;
        _3204 = _3208;
    }
    int _3210 = _3204;
    float _3212 = fma(_3104, (*spvDescriptorSet0.vp_c9)._m0[132].x, _3156);
    float _3214 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3216 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3162);
    float _3218 = _2198 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    bool _3220 = _2384 == 0;
    float _3222 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3224 = _2576 ^ _2384;
    float _3226 = _3130 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3228 = _3200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3230 = _3214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3232 = _3222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3234 = _3212 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3236 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[24].w, _3216);
    float _3238 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[25].w, _3182);
    float _3240 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[26].w, _3186);
    out.m_74.x = _3228;
    out.m_74.y = _3230;
    out.m_74.z = _3232;
    out.m_74.w = _3234;
    uint _3242 = uint(int(uint(_3224) >> uint(31)));
    float _3244 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3248 = ~int(_3242);
    int _3250 = _3248 + 1;
    float _3252 = -_3244;
    float _3254 = fma(_3226, 2.0, _3252);
    float _3256 = float(_3210);
    int _3258 = _3198 ^ _3250;
    float _3260 = -_149;
    float _3262 = fma(_3260, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3254);
    float _3264 = float(_3052);
    float _3266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3268 = ~_3250;
    int _3270 = _3268 + _3258;
    int _3272 = _3270 + 1;
    float _3274 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3276 = fma(_3012, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3274);
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3280 = _3238 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _3282 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _3284 = abs(_3160);
    float _3286 = fma(_3018, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3278);
    float _3288 = _3236 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _3290 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3292 = _3280 + _3290;
    float _3294 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3296 = _3240 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _3298 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3300 = _3288 + _3298;
    float _3302 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3304 = -_3282;
    float _3306 = fma(_3016, 2.0, _3304);
    float _3308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3312 = _3296 + _3310;
    float _3314 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3302);
    float _3316 = _3136 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3318 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3320 = float(_3284);
    float _3322 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3314);
    float _3324 = fma(_3316, -2.0, _3294);
    float _3326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3328 = fma(_3022, -2.0, _3318);
    bool _3330 = !_3220;
    int _3332 = _3330 ? _3272 : (-1);
    float _3334 = _3320 * _3256;
    bool _3336 = _3322 >= 0.0;
    float _3338 = _3246 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3340 = _3266 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3342 = -_149;
    float _3344 = fma(_3342, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3306);
    float _3346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3348 = _3308 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3350 = float(_3154);
    float _3352 = fma(_3338, _3202, _2260);
    float _3354 = fma(_3340, _3264, _3344);
    float _3356 = _2928 + 0.5;
    float _3358 = float(_3066);
    float _3360 = fma(_3348, _3350, _3262);
    float _3362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3364 = _3326 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3366 = _1128 + 0.5;
    float _3368 = fma(_3338, _3356, _3352);
    float _3370 = float(_3056);
    float _3372 = -_2160;
    float _3374 = fma(_3364, _3358, _3372);
    float _3376 = fma(_3348, _3366, _3360);
    float _3378 = _3346 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3380 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3328);
    float _3382 = float(_3332);
    float _3384 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3324);
    float _3386 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3388 = -_3380;
    float _3390 = fma(_3378, _3370, _3388);
    float _3392 = _2758 + (-0.5);
    float _3394 = _3362 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3396 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3386);
    float _3398 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3276);
    float _3400 = -_3364;
    float _3402 = fma(_3400, _3392, _3374);
    float _3404 = -_3384;
    float _3406 = fma(_3394, _3382, _3404);
    float _3408 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3410 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3396);
    float _3412 = _2856 + 0.5;
    float _3414 = _1348 + (-0.5);
    float _3416 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3408);
    float _3418 = -_3398;
    float _3420 = _3418 + 1.0;
    float _3422 = fma(_3340, _3412, _3354);
    float _3424 = -_3378;
    float _3426 = fma(_3424, _3414, _3390);
    float _3428 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3416);
    float _3430 = -_3420;
    float _3432 = fma(_2856, _3430, _3422);
    float _3434 = -_3410;
    float _3436 = _3434 + 1.0;
    float _3438 = -_3428;
    float _3440 = _3438 + 1.0;
    float _3442 = _1164 + (-0.5);
    float _3444 = -_3436;
    float _3446 = fma(_2928, _3444, _3368);
    float _3448 = fma(_2758, _3440, _3402);
    float _3450 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3452 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3454 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3456 = log2(_3454);
    float _3458 = _3292 * _3292;
    float _3460 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3450);
    float _3462 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3452);
    float _3464 = -_3394;
    float _3466 = fma(_3464, _3442, _3406);
    float _3468 = fma(_3300, _3300, _3458);
    float _3470 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3460);
    float _3472 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3462);
    float _3474 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3286);
    float _3476 = fma(_3312, _3312, _3468);
    float _3478 = -_3470;
    float _3480 = _3478 + 1.0;
    float _3482 = -_3472;
    float _3484 = _3482 + 1.0;
    float _3486 = -_3474;
    float _3488 = _3486 + 1.0;
    float _3490 = _3468;
    if (_3336)
    {
        _3490 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3492 = _3490;
    float _3494 = fma(_1164, _3480, _3466);
    float _3496 = -_3484;
    float _3498 = fma(_1128, _3496, _3376);
    float _3500 = in.m_76.x;
    float _3502 = in.m_76.y;
    float _3504 = in.m_76.z;
    float _3506 = rsqrt(_3476);
    float _3508 = _3456 * _149;
    float _3510 = fma(_1348, _3488, _3426);
    float _3512 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3514 = 1.0 + _3512;
    int _3516 = as_type<int>(_3492);
    if (_3336)
    {
        float _3518 = _3492 * 5.0;
        _3516 = as_type<int>(_3518);
    }
    int _3520 = _3516;
    out.m_78.x = _3498;
    out.m_78.y = _3494;
    bool _3522 = !_3074;
    int _3524 = _3522 ? 0 : 1;
    float _3526 = exp2(_3508);
    bool _3528 = !_3078;
    int _3530 = _3528 ? 0 : 1;
    if (_3336)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10571 = as_type<float>(_3520);
        out.gl_Position.z = _10571;
    }
    bool _3532 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3534 = isnan(0.0);
    bool _3536 = _3532 || _3534;
    bool _3538 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3540 = _3536 || _3538;
    bool _3542 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3544 = isnan(1.0);
    bool _3546 = _3542 || _3544;
    bool _3548 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3550 = _3546 || _3548;
    out.m_80.x = _3446;
    out.m_80.y = _3448;
    out.m_80.z = _3432;
    out.m_80.w = _3510;
    float _3552 = 1.0 / _3514;
    float _3554 = _3292 * _3506;
    if (_3336)
    {
        out.m_61.x = 0.0;
    }
    float _3556 = _3300 * _3506;
    if (_3336)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3558 = -_3554;
    float _3560 = fma(_3558, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3280);
    float _3562 = -_3526;
    float _3564 = _3562 + 1.0;
    float _3566 = _3312 * _3506;
    float _3568 = -_3556;
    float _3570 = fma(_3568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3288);
    float _3572 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3574 = _3560 + _3572;
    int _3576 = _2726 ? 0 : 1;
    float _3578 = -_3566;
    float _3580 = fma(_3578, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3296);
    float _3582 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3584 = _3570 + _3582;
    float _3586 = _3574 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3588 = ~_3576;
    int _3590 = _3588 + 1;
    int _3592 = _3590 + 1;
    float _3594 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3596 = _3580 + _3594;
    int _3598 = _3592;
    float _3600 = _3566;
    if (!_2716)
    {
        int _3602 = ~_3576;
        int _3604 = _3602 + 1;
        _3598 = _3604;
    }
    int _3606 = _3598;
    float _3608 = _3334 * (-2.0);
    float _3610 = fma(_3584, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3586);
    int _3612 = abs(_3524);
    float _3614 = -_3554;
    float _3616 = fma(_3614, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3292);
    float _3618 = _3540 ? _3564 : 0.0;
    float _3620 = fma(_2668, _3608, _2668);
    float _3622 = fma(_3608, _3500, _3500);
    float _3624 = fma(_3596, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3610);
    if (_3550)
    {
        float _3626 = _3618 * _3552;
        _153 = _3626;
    }
    float _3628 = _153;
    float _3630 = -_3556;
    float _3632 = fma(_3630, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3300);
    float _3634 = _3616 * _3616;
    float _3636 = _968 + (-0.5);
    float _3638 = float(_3606);
    float _3640 = -_3566;
    float _3642 = fma(_3640, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3312);
    float _3644 = float(_3612);
    float _3646 = fma(_3632, _3632, _3634);
    bool _3648 = _3624 >= 0.0;
    float _3650 = fma(_3636, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3622);
    int _3652 = _3176 ? 0 : 1;
    float _3654 = _3644 * _3638;
    float _3656 = fma(_3642, _3642, _3646);
    float _3658 = fma(_3620, _3628, _3650);
    int _3660 = ~_3652;
    int _3662 = _3660 + 1;
    int _3664 = _3662 + 1;
    float _3666 = _3654 * (-2.0);
    int _3668 = _3664;
    float _3670 = _3638;
    if (!_3164)
    {
        int _3672 = ~_3652;
        int _3674 = _3672 + 1;
        _3668 = _3674;
    }
    int _3676 = _3668;
    float _3678 = _3658 * 0.15915493667125701904296875;
    float _3680 = sqrt(_3656);
    float _3682 = fma(_2728, _3666, _2728);
    float _3684 = fma(_3666, _3502, _3502);
    if (_3648)
    {
        _3670 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3686 = _3670;
    int _3688 = as_type<int>(_3686);
    if (_3648)
    {
        out.m_61.x = 0.0;
    }
    float _3690 = _970 + (-0.5);
    int _3692 = abs(_3530);
    float _3694 = _3678 * 6.283185482025146484375;
    float _3696 = sin(_3694);
    if (_3648)
    {
        float _3698 = _3686 * 5.0;
        _3688 = as_type<int>(_3698);
    }
    int _3700 = _3688;
    if (_3648)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10848 = as_type<float>(_3700);
        out.gl_Position.z = _10848;
    }
    if (_3648)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3702 = -_3280;
    float _3704 = _3702 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3706 = -_3288;
    float _3708 = _3706 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3710 = float(_3676);
    float _3712 = -_3296;
    float _3714 = _3712 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3716 = _3704 * _3704;
    float _3718 = float(_3692);
    float _3720 = _968 + _972;
    float _3722 = fma(_3690, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3684);
    float _3724 = fma(_3708, _3708, _3716);
    float _3726 = _972 + (-0.5);
    float _3728 = _3718 * _3710;
    float _3730 = fma(_3714, _3714, _3724);
    float _3732 = _3720 + (-1.0);
    float _3734 = _3728 * (-2.0);
    float _3736 = fma(_3682, _3628, _3722);
    float _3738 = _3678 * 6.283185482025146484375;
    float _3740 = cos(_3738);
    float _3742 = fma(_3732, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3744 = fma(_3734, _3504, _3504);
    float _3746 = _3736 * 0.15915493667125701904296875;
    float _3748 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3750 = fma(_3742, _3734, _3742);
    float _3752 = fma(_3726, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3744);
    float _3754 = rsqrt(_3730);
    float _3756 = fma(_3750, _3628, _3752);
    float _3758 = _3756 * 0.15915493667125701904296875;
    float _3760 = _3746 * 6.283185482025146484375;
    float _3762 = sin(_3760);
    float _3764 = _3708 * _3754;
    float _3766 = _3714 * _3754;
    float _3768 = _3704 * _3754;
    float _3770 = _3746 * 6.283185482025146484375;
    float _3772 = cos(_3770);
    float _3774 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3776 = _3764 * _3774;
    float _3778 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3780 = _3766 * _3778;
    float _3782 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3784 = _3768 * _3782;
    float _3786 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3788 = -_3776;
    float _3790 = fma(_3766, _3786, _3788);
    float _3792 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3794 = -_3780;
    float _3796 = fma(_3768, _3792, _3794);
    float _3798 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3800 = -_3784;
    float _3802 = fma(_3764, _3798, _3800);
    float _3804 = _3758 * 6.283185482025146484375;
    float _3806 = sin(_3804);
    float _3808 = _3790 * _3790;
    float _3810 = _3696 * _3762;
    float _3812 = _3740 * _3762;
    float _3814 = fma(_3796, _3796, _3808);
    float _3816 = _3506 * _3680;
    float _3818 = _3758 * 6.283185482025146484375;
    float _3820 = cos(_3818);
    float _3822 = fma(_3802, _3802, _3814);
    float _3824 = _3740 * _3772;
    float _3826 = _693 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _229);
    float _3830 = _229 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3832 = _3816 * _3826;
    float _3834 = rsqrt(_3822);
    float _3836 = fma(_3806, _3824, _3810);
    float _3838 = fma(_3806, _3810, _3824);
    float _3840 = _3696 * _3772;
    float _3842 = _3740 * _3820;
    float _3844 = _3816 * _3748;
    float _3846 = _3772 * _3820;
    float _3848 = _3696 * _3820;
    float _3850 = _3762 * _3820;
    float _3852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _225);
    float _3854 = _3828 * _3844;
    float _3856 = -_3812;
    float _3858 = fma(_3806, _3840, _3856);
    float _3860 = _3796 * _3834;
    float _3862 = _3852 * _3832;
    float _3864 = _3790 * _3834;
    float _3866 = _3802 * _3834;
    float _3868 = _3842 * _3854;
    float _3870 = -_3840;
    float _3872 = fma(_3806, _3812, _3870);
    float _3874 = -_3854;
    float _3876 = _3806 * _3874;
    float _3878 = _3848 * _3854;
    float _3880 = fma(_3836, _3862, _3868);
    float _3882 = _3816 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3884 = _3882 * 0.5;
    float _3886 = _3766 * _3864;
    float _3888 = _3768 * _3860;
    float _3890 = fma(_3846, _3862, _3876);
    float _3892 = fma(_3872, _3884, _3880);
    float _3894 = -_3886;
    float _3896 = fma(_3768, _3866, _3894);
    float _3898 = -_3888;
    float _3900 = fma(_3764, _3864, _3898);
    float _3902 = fma(_3858, _3862, _3878);
    float _3904 = fma(_3850, _3884, _3890);
    float _3906 = _3896 * _3892;
    float _3908 = _3900 * _3892;
    float _3910 = fma(_3838, _3884, _3902);
    float _3912 = _3764 * _3866;
    float _3914 = fma(_3860, _3904, _3906);
    float _3916 = fma(_3866, _3904, _3908);
    float _3918 = _3836 * _3900;
    float _3920 = -_3912;
    float _3922 = fma(_3766, _3860, _3920);
    float _3924 = fma(_3764, _3910, _3914);
    float _3926 = fma(_3766, _3910, _3916);
    float _3928 = _3836 * _3896;
    float _3930 = _3836 * _3922;
    float _3932 = _3288 + _3924;
    float _3934 = _3296 + _3926;
    float _3936 = _3842 * _3896;
    float _3938 = _3842 * _3922;
    float _3940 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3942 = _3932 + _3940;
    float _3944 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3946 = _3934 + _3944;
    float _3948 = _3842 * _3900;
    float _3950 = _3872 * _3896;
    float _3952 = _3942 * _3942;
    float _3954 = _3946 * _3946;
    float _3956 = _3872 * _3900;
    float _3958 = _3872 * _3922;
    float _3960 = fma(_3846, _3860, _3928);
    float _3962 = _3952 + _3954;
    float _3964 = fma(_3846, _3864, _3930);
    float _3966 = fma(_3846, _3866, _3918);
    float _3968 = fma(_3830, _3830, 1.0);
    float _3970 = sqrt(_3962);
    float _3972 = _3922 * _3892;
    float _3974 = -_3806;
    float _3976 = fma(_3974, _3864, _3938);
    float _3978 = -_3806;
    float _3980 = fma(_3978, _3866, _3948);
    float _3982 = fma(_3850, _3864, _3958);
    float _3984 = fma(_3864, _3904, _3972);
    float _3986 = -_3806;
    float _3988 = fma(_3986, _3860, _3936);
    float _3990 = fma(_3850, _3860, _3950);
    float _3992 = rsqrt(_3968);
    float _3994 = fma(_3768, _3910, _3984);
    float _3996 = fma(_3850, _3866, _3956);
    float _3998 = _3280 + _3994;
    bool _4000 = _3970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4002 = _3950;
    float _4004 = _3864;
    float _4006 = _3860;
    float _4008 = _3952;
    float _4010 = _3954;
    uint _4012 = as_type<uint>(_3816);
    if (!_4000)
    {
        _4002 = _3932;
    }
    float _4014 = _4002;
    float _4016 = _4014;
    if (!_4000)
    {
        _4004 = _3934;
    }
    float _4018 = _4004;
    float _4020 = _4018;
    if (!_4000)
    {
        _4006 = _3998;
    }
    float _4022 = _4006;
    bool _4024 = !_4000;
    float _4026 = _4022;
    if (!_4024)
    {
        float _4028 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4030 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4032 = _3970 + _4030;
        float _4034 = rsqrt(_3962);
        float _4036 = _4032 * _4028;
        float _4038 = _3998 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4040 = _4036 * 0.15915493667125701904296875;
        float _4042 = _4040 * 6.283185482025146484375;
        float _4044 = sin(_4042);
        float _4046 = _4040 * 6.283185482025146484375;
        float _4048 = cos(_4046);
        float _4050 = fma(_4044, _4038, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4052 = _4034 * _4050;
        float _4054 = fma(_3942, _4052, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4056 = _4048 + (-1.0);
        float _4058 = fma(_3946, _4052, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4060 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4062 = _4054 + _4060;
        float _4064 = _4056 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4066 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4068 = _4058 + _4066;
        float _4070 = _4062 * _4062;
        float _4072 = fma(_3998, _4048, _4064);
        float _4074 = _4068 * _4068;
        _4026 = _4072;
        _4008 = _4070;
        _4010 = _4074;
        _4016 = _4054;
        _4020 = _4058;
    }
    float _4076 = _4026;
    float _4078 = _4008;
    float _4080 = _4010;
    float _4082 = _4016;
    float _4084 = _4020;
    float _4086 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4088 = _4076 + _4086;
    float _4090 = fma(_3848, _3764, _3988);
    float _4092 = fma(_3848, _3768, _3976);
    float _4094 = fma(_3848, _3766, _3980);
    float _4096 = fma(_4088, _4088, _4078);
    float _4098 = fma(_3838, _3764, _3990);
    float _4100 = fma(_3838, _3768, _3982);
    float _4102 = fma(_3838, _3766, _3996);
    float _4104 = _4096 + _4080;
    float _4106 = _3830 * _3992;
    float _4108 = fma(_3858, _3764, _3960);
    float _4110 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4112 = _3830 * _4090;
    float _4114 = fma(_3858, _3768, _3964);
    float _4116 = _3830 * _4092;
    float _4118 = fma(_3858, _3766, _3966);
    float _4120 = _3830 * _4094;
    float _4122 = -_4098;
    float _4124 = _4106 * _4122;
    float _4126 = -_4100;
    float _4128 = _4106 * _4126;
    float _4130 = -_4102;
    float _4132 = _4106 * _4130;
    float _4134 = fma(_4110, _4108, _4112);
    float _4136 = sqrt(_4104);
    float _4138 = fma(_4110, _4114, _4116);
    float _4140 = fma(_4110, _4118, _4120);
    float _4142 = fma(_3992, _4090, _4124);
    float _4144 = fma(_3992, _4092, _4128);
    float _4146 = _4100 + _4138;
    float _4148 = fma(_3992, _4094, _4132);
    float _4150 = _4098 + _4134;
    float _4152 = _4102 + _4140;
    out.m_82.x = _4108;
    out.m_82.y = _4114;
    out.m_82.z = _4118;
    out.m_84.x = _4142;
    out.m_84.y = _4144;
    out.m_84.z = _4148;
    bool _4154 = _4136 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4156 = isnan(_4136);
    bool _4158 = _4154 || _4156;
    bool _4160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4162 = _4158 || _4160;
    out.m_86.x = _4150;
    out.m_86.y = _4146;
    out.m_86.z = _4152;
    float _4164 = _4080;
    if (!_4162)
    {
        _4164 = 1.0;
    }
    float _4166 = _4164;
    bool _4168 = !_4162;
    float _4170 = _4166;
    if (!_4168)
    {
        bool _4172 = _4136 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4174 = isnan(_4136);
        bool _4176 = _4172 || _4174;
        bool _4178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4180 = _4176 || _4178;
        if (!_4180)
        {
            float _4182 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4184 = _4136 + _4182;
            float _4186 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4188 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4186;
            float _4190 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4192 = _4190 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4194 = 1.0 / _4188;
            float _4196 = _4184 * _4194;
            float _4198 = fma(_4196, _4192, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4170 = _4198;
            _4200 = true;
        }
        else
        {
            bool _4202 = _4136 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4204 = isnan(_4136);
            bool _4206 = _4202 || _4204;
            bool _4208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4210 = _4206 || _4208;
            if (!_4210)
            {
                float _4212 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4214 = _4136 + _4212;
                float _4216 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4218 = _4216 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4220 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4222 = _4220 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4224 = 1.0 / _4218;
                float _4226 = _4214 * _4224;
                float _4228 = fma(_4226, _4222, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4170 = _4228;
                _4200 = true;
            }
            else
            {
                _4170 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4200 = false;
    float _4230 = _4170;
    float _4232 = fma(_3570, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4234 = fma(_3580, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4236 = floor(_4232);
    float _4238 = floor(_4234);
    float _4240 = -_4236;
    float _4242 = _4232 + _4240;
    float _4244 = -_4238;
    float _4246 = _4234 + _4244;
    float2 _11737 = float2(_4242, _4246);
    float _4248 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11737, float2(0.0), isnan(_11737)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11737, float2(0.0), isnan(_11737)), level(0.0)).x;
    float _4250 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4252 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4254 = _4082 + _4252;
    float _4256 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4250);
    float _4258 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4260 = _4084 + _4258;
    float _4262 = fma(_4254, _4230, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _4264 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4266 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4268 = _4264 || _4266;
    bool _4270 = isnan(0.5);
    bool _4272 = _4268 || _4270;
    float _4274 = fma(_3580, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4256);
    float _4276 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4278 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4280 = _4076 + _4278;
    float _4282 = _4274 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4284 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4276);
    float _4286 = fma(_4260, _4230, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4288 = -_3556;
    float _4290 = fma(_4288, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4262);
    float _4292 = 1.0 / _4282;
    float _4294 = fma(_3580, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4284);
    float _4296 = fma(_4280, _4230, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4298 = -_3566;
    float _4300 = fma(_4298, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4286);
    int _4302 = 2;
    float _4304 = _4300;
    int _4306 = as_type<int>(_4290);
    if (_4272)
    {
        _3600 = _4290;
    }
    float _4308 = _3600;
    float _4310 = _4294 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4312 = -_3554;
    float _4314 = fma(_4312, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4296);
    float _4316 = _4310 + _4282;
    float _4318 = _4316 * _4292;
    float _4320 = _4318 * 0.5;
    float _4322 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4324 = fma(_4320, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4322);
    float _4326 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _4328 = 1.0 / _4324;
    float _4330 = _3560 + _4326;
    float _4332 = _4330 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4334 = fma(_3570, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4332);
    float _4336 = fma(_3580, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4334);
    float _4338 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4340 = _4328 * _4338;
    float _4342 = _4330 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4344 = _4336 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _4346 = _4340 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4348 = fma(_3570, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4342);
    bool _4350 = _4340 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4352 = trunc(_4344);
    int _4354 = int(_4352);
    bool _4356 = !_4346;
    int _4358 = _4356 ? 0 : 1;
    float _4360 = fma(_3580, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4348);
    float _4362 = _4360 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _4364 = _4314;
    float _4366 = _4308;
    if (!_4346)
    {
        _4302 = 1;
    }
    int _4368 = _4302;
    float _4370 = trunc(_4362);
    int _4372 = int(_4370);
    int _4374 = _4368;
    if (!_4350)
    {
        _4374 = _4358;
    }
    int _4376 = _4374;
    int _4378 = _4376 << 6;
    int _4380 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4382 = _4354 + _4380;
    int _4384 = _4382 + 1;
    int _4386 = _4378 + 48;
    uint _4388 = uint(int(uint(_4386) >> uint(2)));
    uint _4390 = uint(int(uint(int(_4388)) >> uint(2)));
    int _4392 = int(_4388) & 3;
    float _4394 = (*spvDescriptorSet0.vp_c15)._m0[int(_4390)][_4392];
    int _4396 = int(_4388) + 1;
    uint _4398 = uint(int(uint(_4396) >> uint(2)));
    int _4400 = _4396 & 3;
    float _4402 = (*spvDescriptorSet0.vp_c15)._m0[int(_4398)][_4400];
    bool _4404 = _4384 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4406 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4408 = _4372 + _4406;
    int _4410 = _4408 + 1;
    int _4412 = _4378 + 56;
    uint _4414 = uint(int(uint(_4412) >> uint(2)));
    uint _4416 = uint(int(uint(int(_4414)) >> uint(2)));
    int _4418 = int(_4414) & 3;
    float _4420 = (*spvDescriptorSet0.vp_c15)._m0[int(_4416)][_4418];
    int _4422 = int(_4414) + 1;
    uint _4424 = uint(int(uint(_4422) >> uint(2)));
    int _4426 = _4422 & 3;
    float _4428 = (*spvDescriptorSet0.vp_c15)._m0[int(_4424)][_4426];
    int _4430 = _4384 | _4410;
    bool _4432 = _4430 < 0;
    bool _4434 = _4432 || _4404;
    int _4436 = _4378 + 64;
    uint _4438 = uint(int(uint(_4436) >> uint(2)));
    uint _4440 = uint(int(uint(int(_4438)) >> uint(2)));
    int _4442 = int(_4438) & 3;
    float _4444 = (*spvDescriptorSet0.vp_c15)._m0[int(_4440)][_4442];
    int _4446 = int(_4438) + 1;
    uint _4448 = uint(int(uint(_4446) >> uint(2)));
    int _4450 = _4446 & 3;
    float _4452 = (*spvDescriptorSet0.vp_c15)._m0[int(_4448)][_4450];
    bool _4454 = _4410 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4456 = _4454 || _4434;
    int _4458 = _4378 + 72;
    uint _4460 = uint(int(uint(_4458) >> uint(2)));
    uint _4462 = uint(int(uint(int(_4460)) >> uint(2)));
    int _4464 = int(_4460) & 3;
    float _4466 = (*spvDescriptorSet0.vp_c15)._m0[int(_4462)][_4464];
    int _4468 = int(_4460) + 1;
    uint _4470 = uint(int(uint(_4468) >> uint(2)));
    int _4472 = _4468 & 3;
    float _4474 = (*spvDescriptorSet0.vp_c15)._m0[int(_4470)][_4472];
    int _4476 = _4378 + 96;
    uint _4478 = uint(int(uint(_4476) >> uint(2)));
    uint _4480 = uint(int(uint(int(_4478)) >> uint(2)));
    int _4482 = int(_4478) & 3;
    float _4484 = (*spvDescriptorSet0.vp_c15)._m0[int(_4480)][_4482];
    int _4486 = int(_4478) + 1;
    uint _4488 = uint(int(uint(_4486) >> uint(2)));
    int _4490 = _4486 & 3;
    float _4492 = (*spvDescriptorSet0.vp_c15)._m0[int(_4488)][_4490];
    int _4494 = _4378 + 104;
    uint _4496 = uint(int(uint(_4494) >> uint(2)));
    uint _4498 = uint(int(uint(int(_4496)) >> uint(2)));
    int _4500 = int(_4496) & 3;
    float _4502 = (*spvDescriptorSet0.vp_c15)._m0[int(_4498)][_4500];
    int _4504 = int(_4496) + 1;
    uint _4506 = uint(int(uint(_4504) >> uint(2)));
    int _4508 = _4504 & 3;
    float _4510 = (*spvDescriptorSet0.vp_c15)._m0[int(_4506)][_4508];
    float _4512 = as_type<float>(_4376);
    if (!_4272)
    {
        float _4514 = _3574 * _3574;
        float _4516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4518 = -_3296;
        float _4520 = _4518 + _4286;
        float _4522 = -_3280;
        float _4524 = _4522 + _4296;
        float _4526 = fma(_3584, _3584, _4514);
        float _4528 = fma(_3596, _3596, _4526);
        float _4530 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4532 = sqrt(_4528);
        float _4534 = 1.0 / _3816;
        float _4536 = _4530 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4538 = precise::min(_4532, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4540 = _4538 * _4516;
        float _4542 = -_3288;
        float _4544 = _4542 + _4262;
        float _4546 = _4540 * _4534;
        float _4548 = _4536 * _4546;
        float _4550 = _4520 * _4546;
        float _4552 = fma(_4524, _4548, _3560);
        float _4554 = fma(_4544, _4548, _3570);
        float _4556 = fma(_4536, _4550, _3580);
        _4364 = _4552;
        _4366 = _4554;
        _4012 = as_type<uint>(_4534);
        _4304 = _4556;
    }
    float _4558 = _4364;
    float _4560 = _4366;
    uint _4562 = _4012;
    float _4564 = _4304;
    float _4566 = _4330 * _4492;
    float _4568 = _4558 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    uint _4570 = _4562;
    int _4572 = as_type<int>(_4568);
    if (!_4456)
    {
        int _4574 = _4410 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4576 = _4574 + _4384;
        _4570 = uint(_4576);
    }
    uint _4578 = _4570;
    float _4580 = _4330 * _4452;
    float _4582 = fma(_3570, _4484, _4566);
    float _4584 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4568);
    float _4586 = _4330 * _4402;
    int _4588 = as_type<int>(_4582);
    if (!_4456)
    {
        uint _4590 = uint(int(uint(int(_4578)) >> uint(2)));
        _4572 = int(_4590);
    }
    int _4592 = _4572;
    float _4594 = fma(_3580, _4502, _4582);
    float _4596 = fma(_4564, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4584);
    if (!_4456)
    {
        int _4598 = int(_4578) << 2;
        _4588 = _4598;
    }
    int _4600 = _4588;
    float _4602 = fma(_3570, _4394, _4586);
    float _4604 = _4594 + _4510;
    int _4606 = _4378 + 80;
    uint _4608 = uint(int(uint(_4606) >> uint(2)));
    uint _4610 = uint(int(uint(int(_4608)) >> uint(2)));
    int _4612 = int(_4608) & 3;
    float _4614 = (*spvDescriptorSet0.vp_c15)._m0[int(_4610)][_4612];
    int _4616 = int(_4608) + 1;
    uint _4618 = uint(int(uint(_4616) >> uint(2)));
    int _4620 = _4616 & 3;
    float _4622 = (*spvDescriptorSet0.vp_c15)._m0[int(_4618)][_4620];
    int _4624 = _4600;
    if (!_4456)
    {
        int _4626 = 12 & _4600;
        _4624 = _4626;
    }
    int _4628 = _4624;
    float _4630 = fma(_3570, _4444, _4580);
    float _4632 = fma(_3580, _4420, _4602);
    float _4634 = _4596 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4636 = 1.0 / _4604;
    if (!_4456)
    {
        int _4638 = _4592 << 4;
        int _4640 = _4638 + _4628;
        _4306 = _4640;
    }
    int _4642 = _4306;
    float _4644 = fma(_3580, _4466, _4630);
    int _4646 = _4378 + 88;
    uint _4648 = uint(int(uint(_4646) >> uint(2)));
    uint _4650 = uint(int(uint(int(_4648)) >> uint(2)));
    int _4652 = int(_4648) & 3;
    float _4654 = (*spvDescriptorSet0.vp_c15)._m0[int(_4650)][_4652];
    int _4656 = int(_4648) + 1;
    uint _4658 = uint(int(uint(_4656) >> uint(2)));
    int _4660 = _4656 & 3;
    float _4662 = (*spvDescriptorSet0.vp_c15)._m0[int(_4658)][_4660];
    float _4664 = _4632 + _4428;
    float _4666 = _4558 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4668 = _4558 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4670 = _4644 + _4474;
    float _4672 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4674 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4666);
    float _4676 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4668);
    float _4678 = _4402;
    if (!_4456)
    {
        int _4680 = _4642 + 400;
        uint _4682 = uint(int(uint(_4680) >> uint(2)));
        uint _4684 = uint(int(uint(int(_4682)) >> uint(2)));
        int _4686 = int(_4682) & 3;
        float _4688 = (*spvDescriptorSet0.vp_c15)._m0[int(_4684)][_4686];
        _4678 = _4688;
    }
    float _4690 = _4678;
    float _4692 = _4634 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4694 = fma(_4564, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4674);
    float _4696 = fma(_4564, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4676);
    float _4698 = _4602;
    if (!_4456)
    {
        float _4700 = floor(_4362);
        _4698 = _4700;
    }
    float _4702 = _4698;
    float _4704 = _4664 * _4636;
    float _4706 = -_4692;
    float _4708 = fma(_4706, _4672, 1.0);
    float _4710 = _4558 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4712 = _4696 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4714 = _4694 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _4716 = _4704 >= 0.0;
    float _4718 = _4670 * _4636;
    float _4720 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4710);
    float _4722 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _4724 = _4704 <= 1.0;
    bool _4726 = _4724 && _4716;
    float _4728 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4730 = fma(_4564, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4720);
    float _4732 = fma(_4714, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4722);
    bool _4734 = _4718 >= 0.0;
    bool _4736 = _4734 && _4726;
    float _4738 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4740 = _4730 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4742 = fma(_4634, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4732);
    bool _4744 = _4718 <= 1.0;
    bool _4746 = _4744 && _4736;
    float _4748 = log2(_4708);
    float _4750 = fma(_4714, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4728);
    float _4752 = fma(_4740, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4742);
    float _4754 = fma(_4714, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4738);
    float _4756 = _4702;
    float _4758 = _4728;
    if (!_4456)
    {
        float _4760 = -_4702;
        float _4762 = _4362 + _4760;
        _4756 = _4762;
    }
    float _4764 = _4756;
    float _4766 = fma(_4634, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4750);
    float _4768 = 1.0 / _4752;
    float _4770 = _4330 * _4622;
    float _4772 = fma(_4740, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4766);
    if (_4746)
    {
        float _4774 = float(_4376);
        _4512 = _4774;
    }
    float _4776 = _4512;
    float _4778 = fma(_3570, _4614, _4770);
    float _4780 = fma(_4634, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4754);
    float _4782 = _4630;
    if (!_4456)
    {
        float _4784 = floor(_4344);
        _4782 = _4784;
    }
    float _4786 = _4782;
    float _4788 = fma(_3580, _4654, _4778);
    float _4790 = fma(_4740, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4780);
    float _4792 = _4748 * 0.693147182464599609375;
    float _4794 = _4788 + _4662;
    float _4796 = _4792 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4798 = _4754;
    if (_4746)
    {
        float _4800 = rint(_4776);
        float _4802 = precise::max(_4800, 0.0);
        uint _4804 = uint(_4802);
        uint _4806 = clamp(_4804, 0u, 65535u);
        _4798 = as_type<float>(_4806);
    }
    float _4808 = _4798;
    float _4810 = _4790 * _4768;
    float _4812 = _4772 * _4768;
    float _4814 = _4794 * _4636;
    float _4816 = fma(_4812, -0.5, 0.5);
    float _4818 = _4766;
    float _4820 = _4768;
    if (!_4456)
    {
        float _4822 = rint(_4690);
        float _4824 = precise::max(_4822, 0.0);
        uint _4826 = uint(_4824);
        uint _4828 = clamp(_4826, 0u, 65535u);
        _4818 = as_type<float>(_4828);
    }
    float _4830 = _4818;
    float _4832 = fma(_4810, 0.5, 0.5);
    float _4834 = _4786;
    if (!_4456)
    {
        float _4836 = -_4786;
        float _4838 = _4344 + _4836;
        _4820 = _4838;
    }
    float _4840 = _4820;
    float _4842 = _4718;
    if (_4746)
    {
        float3 _12757 = float3(_4704, _4718, float(as_type<int>(_4808)));
        float3 _12761 = select(_12757, float3(0.0), isnan(_12757));
        float _4844 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12761.xy, uint(rint(_12761.z)), _4814, level(0.0));
        _4842 = _4844;
    }
    float _4846 = _4842;
    float3 _12771 = float3(_4832, _4816, _4796);
    float _4848 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12771, float3(0.0), isnan(_12771)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12771, float3(0.0), isnan(_12771)), level(0.0)).x;
    float3 _12780 = float3(_4832, _4816, _4796);
    float4 _4851 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12780, float3(0.0), isnan(_12780)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12780, float3(0.0), isnan(_12780)), level(0.0)).xyzw;
    float _4853 = _4851.x;
    float _4855 = _4851.y;
    float _4857 = _4851.z;
    float _4859 = _4851.w;
    float _4861 = _4840;
    float _4863 = _4830;
    if (!_4456)
    {
        float3 _12804 = float3(_4840, _4764, float(as_type<int>(_4830)));
        float3 _12806 = select(_12804, float3(0.0), isnan(_12804));
        float _4865 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12806.xy, uint(rint(_12806.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12806.xy, uint(rint(_12806.z)), level(0.0)).x;
        _4861 = _4865;
    }
    float _4867 = _4861;
    if (_4456)
    {
        _4758 = 1.0;
    }
    float _4869 = _4758;
    float _4871 = _4869;
    if (!_4456)
    {
        int _4873 = int(_4578) << 4;
        int _4875 = _4873 + 2048;
        uint _4877 = uint(int(uint(_4875) >> uint(2)));
        uint _4879 = uint(int(uint(int(_4877)) >> uint(2)));
        int _4881 = int(_4877) & 3;
        float _4883 = (*spvDescriptorSet0.vp_c15)._m0[int(_4879)][_4881];
        int _4885 = int(_4877) + 1;
        uint _4887 = uint(int(uint(_4885) >> uint(2)));
        int _4889 = _4885 & 3;
        float _4891 = (*spvDescriptorSet0.vp_c15)._m0[int(_4887)][_4889];
        int _4893 = _4875 + 8;
        uint _4895 = uint(int(uint(_4893) >> uint(2)));
        uint _4897 = uint(int(uint(int(_4895)) >> uint(2)));
        int _4899 = int(_4895) & 3;
        float _4901 = (*spvDescriptorSet0.vp_c15)._m0[int(_4897)][_4899];
        int _4903 = int(_4895) + 1;
        uint _4905 = uint(int(uint(_4903) >> uint(2)));
        int _4907 = _4903 & 3;
        float _4909 = (*spvDescriptorSet0.vp_c15)._m0[int(_4905)][_4907];
        float _4911 = _4330 * _4891;
        float _4913 = fma(_3570, _4883, _4911);
        float _4915 = fma(_3580, _4901, _4913);
        float _4917 = _4915 + _4909;
        float _4919 = precise::clamp(_4917, 0.0, 1.0);
        float _4921 = -_4919;
        float _4923 = _4921 + _4867;
        float _4925 = fma(_4923, 500.0, 1.5);
        float _4927 = exp2(_4925);
        float _4929 = 0.0 + _4927;
        float _4931 = precise::clamp(_4929, 0.0, 1.0);
        _4834 = _4901;
        _4871 = _4931;
    }
    float _4933 = _4834;
    float _4935 = _4871;
    float _4937 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4939 = _4558 + _4937;
    float _4941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4943 = _4560 + _4941;
    float _4945 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4947 = _4564 + _4945;
    float _4949 = _4939 * _4939;
    float _4951 = fma(_4943, _4943, _4949);
    float _4953 = fma(_4947, _4947, _4951);
    float _4955 = rsqrt(_4953);
    float _4957 = _4955 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4959 = _4943 * _4957;
    float _4961 = _4947 * _4957;
    float _4963 = _4959 * _4959;
    float _4965 = _4961 * _4961;
    float _4967 = _4963 + _4965;
    float _4969 = sqrt(_4967);
    bool _4971 = _4969 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4975 = _4969 + _4973;
    float _4977 = _4955;
    float _4979 = _4975;
    float _4981 = _4933;
    float _4983 = _4939;
    if (_4971)
    {
        float _4985 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4977 = _4985;
    }
    float _4987 = _4977;
    float _4989 = _4987;
    if (_4971)
    {
        float _4991 = _4975 * _4987;
        _4979 = _4991;
    }
    float _4993 = _4979;
    if (_4971)
    {
        float _4995 = rsqrt(_4967);
        _4989 = _4995;
    }
    float _4997 = _4989;
    float _4999 = _4997;
    if (_4971)
    {
        float _5001 = _4993 * 0.15915493667125701904296875;
        _4981 = _5001;
    }
    float _5003 = _4981;
    float _5005 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5007 = _4947;
    if (_4971)
    {
        float _5009 = _5003 * 6.283185482025146484375;
        float _5011 = sin(_5009);
        _5007 = _5011;
    }
    float _5013 = _5007;
    float _5015 = precise::max(0.0, _5005);
    float _5017 = _3570;
    float _5019 = _5015;
    if (_4971)
    {
        float _5021 = _5003 * 6.283185482025146484375;
        float _5023 = cos(_5021);
        _5017 = _5023;
    }
    float _5025 = _5017;
    float _5027 = -_4957;
    float _5029 = -_5015;
    float _5031 = fma(_4939, _5027, _5029);
    if (_4971)
    {
        float _5033 = _5031 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4983 = _5033;
    }
    float _5035 = _4983;
    float _5037 = _5013;
    float _5039 = _5035;
    if (_4971)
    {
        float _5041 = fma(_5013, _5035, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5037 = _5041;
    }
    float _5043 = _5037;
    float _5045 = _5043;
    if (_4971)
    {
        float _5047 = _4997 * _5043;
        _5039 = _5047;
    }
    float _5049 = _5039;
    if (!_4971)
    {
        _4999 = _4959;
    }
    float _5051 = _4999;
    float _5053 = _5051;
    float _5055 = _5025;
    if (_4971)
    {
        float _5057 = _5025 + (-1.0);
        _5019 = _5057;
    }
    float _5059 = _5019;
    float _5061 = _5059;
    if (_4971)
    {
        float _5063 = _4959 * _5049;
        _5053 = _5063;
    }
    float _5065 = _5053;
    if (!_4971)
    {
        _5045 = _5031;
    }
    float _5067 = _5045;
    float _5069 = _5067;
    if (_4971)
    {
        float _5071 = _5059 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4863 = _5071;
    }
    float _5073 = _4863;
    float _5075 = _5073;
    if (!_4971)
    {
        _5061 = _4961;
    }
    float _5077 = _5061;
    float _5079 = _5077;
    if (_4971)
    {
        float _5081 = _4961 * _5049;
        _5079 = _5081;
    }
    float _5083 = _5079;
    if (_4971)
    {
        float _5085 = fma(_5031, _5025, _5073);
        _5069 = _5085;
    }
    float _5087 = _5069;
    if (!_4971)
    {
        _5055 = _4963;
    }
    float _5089 = _5055;
    float _5091 = _5089;
    if (_4971)
    {
        float _5093 = _5065 * _5065;
        _5091 = _5093;
    }
    float _5095 = _5091;
    if (!_4971)
    {
        _5075 = _4965;
    }
    float _5097 = _5075;
    float _5099 = sqrt(_4953);
    float _5101 = _5097;
    if (_4971)
    {
        float _5103 = _5083 * _5083;
        _5101 = _5103;
    }
    float _5105 = _5101;
    float _5107 = fma(_5087, _5087, _5095);
    float _5109 = _5107 + _5105;
    float _5111 = rsqrt(_5109);
    float _5113 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5115 = fma(_5099, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5113);
    float _5117 = precise::clamp(_5115, 0.0, 1.0);
    float _5119 = -_5117;
    float _5121 = _5119 + 1.0;
    float _5123 = abs(_5121);
    float _5125 = log2(_5123);
    float _5127 = _5111 * _5065;
    float _5129 = _5111 * _5087;
    float _5131 = _5111 * _5083;
    float _5133 = _5127 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5135 = -_5133;
    float _5137 = fma(_5129, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5135);
    float _5139 = -_5131;
    float _5141 = fma(_5139, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5137);
    float _5143 = _5129 + 1.0;
    float _5145 = _5125 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5147 = fma(_5141, -0.5, 0.5);
    float _5149 = fma(_5141, 0.5, 0.5);
    float _5151 = exp2(_5145);
    float _5153 = fma(_5149, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5155 = fma(_5149, _5153, -0.212114393711090087890625);
    float _5157 = sqrt(_5147);
    float _5159 = fma(_5149, _5155, 1.570728778839111328125);
    float _5161 = -_5129;
    float _5163 = fma(_5151, _5143, _5161);
    float _5165 = fma(_5163, 0.5, 0.5);
    float _5167 = _5157 * 0.636619746685028076171875;
    float _5169 = -_5159;
    float _5171 = fma(_5167, _5169, 1.0);
    float2 _13279 = float2(_5171, _5165);
    float3 _5175 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13279, float2(0.0), isnan(_13279)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13279, float2(0.0), isnan(_13279)), level(0.0)).xyz;
    float _5177 = _5175.x;
    float _5179 = _5175.y;
    float _5181 = _5175.z;
    float _5183 = abs(_4340);
    float _5185 = log2(_5183);
    float _5187 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5189 = _5125 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5191 = -_4248;
    float _5193 = _5191 + 1.0;
    float _5195 = fma(_4714, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5187);
    bool _5197 = _4340 <= 8000.0;
    bool _5199 = isnan(_4340);
    bool _5201 = _5197 || _5199;
    bool _5203 = isnan(8000.0);
    bool _5205 = _5201 || _5203;
    float _5207 = float(_5205);
    float _5209 = exp2(_5189);
    float _5211 = _5185 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5213 = exp2(_5211);
    float _5215 = -_5209;
    float _5217 = _5215 + 1.0;
    float _5219 = fma(_5213, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5221 = precise::clamp(_5219, 0.0, 1.0);
    float _5223 = fma(_5221, -2.0, 3.0);
    float _5225 = _5221 * _5221;
    float _5227 = fma(_4634, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5195);
    float _5229 = _5225 * _5223;
    float _5231 = fma(_4740, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5227);
    float _5233 = -_5229;
    float _5235 = _5233 + 1.0;
    out.gl_Position.x = _4790;
    out.gl_Position.y = _4772;
    out.gl_Position.z = _5231;
    out.gl_Position.w = _4752;
    float _5237 = fma(_5235, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5229);
    float _5239 = _5231 + _4752;
    float _5241 = _5207 * _5237;
    float _5243 = _5207;
    if (!_4746)
    {
        _5243 = 1.0;
    }
    float _5245 = _5243;
    float _5247 = _5239 * 0.5;
    float _5249 = _5245;
    if (_4746)
    {
        bool _5251 = _4846 >= _4814;
        bool _5253 = isnan(_4846);
        bool _5255 = _5251 || _5253;
        bool _5257 = isnan(_4814);
        bool _5259 = _5255 || _5257;
        float _5261 = float(_5259);
        _5249 = _5261;
    }
    float _5263 = _5249;
    float _5265 = _5241 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5267 = _5217 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _5269 = _5099 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5271 = isnan(_5099);
    bool _5273 = _5269 || _5271;
    bool _5275 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5277 = _5273 || _5275;
    out.m_88.z = _5247;
    out.m_88.w = _4752;
    float _5279 = _5193 * _5265;
    float _5281 = precise::clamp(_5279, 0.0, 1.0);
    float _5283 = _5263 * _4935;
    float _5285 = _5267 * _4848;
    float _5287 = -_5267;
    float _5289 = _5287 + 1.0;
    float _5291 = -_5281;
    float _5293 = fma(_5291, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5295 = _4859 * _5285;
    float _5297 = _4859 * _5289;
    float _5299 = -_5283;
    float _5301 = fma(_5299, _5293, 1.0);
    float _5303 = precise::clamp(_5301, 0.0, 1.0);
    float _5305 = _5267;
    float _5307 = _5289;
    float _5309 = _5295;
    if (!_5277)
    {
        _5305 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5311 = _5305;
    float _5313 = _5303 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5315 = _5311;
    float _5317 = _5311;
    if (!_5277)
    {
        _5307 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5319 = _5307;
    out.m_90.x = _5313;
    float _5321 = _5181 * _5285;
    float _5323 = fma(_5177, _5295, _4853);
    float _5325 = fma(_5179, _5295, _4855);
    float _5327 = _5319;
    float _5329 = _5319;
    if (!_5277)
    {
        _5309 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5331 = _5309;
    float _5333 = fma(_4859, _5321, _4857);
    out.m_92.x = _5323;
    out.m_92.y = _5325;
    out.m_92.z = _5333;
    out.m_92.w = _5297;
    bool _5335 = !_5277;
    float _5337 = _5331;
    float _5339 = _5331;
    if (!_5335)
    {
        bool _5341 = _5099 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5343 = isnan(_5099);
        bool _5345 = _5341 || _5343;
        bool _5347 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5349 = _5345 || _5347;
        if (!_5349)
        {
            float _5351 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5353 = _5099 + _5351;
            float _5355 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5357 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5355;
            float _5359 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5361 = _5359 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5363 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5365 = _5363 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5367 = 1.0 / _5357;
            float _5369 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5371 = _5369 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5373 = _5353 * _5367;
            float _5375 = precise::clamp(_5373, 0.0, 1.0);
            float _5377 = fma(_5375, _5361, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5379 = fma(_5375, _5365, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5381 = fma(_5375, _5371, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _5317 = _5379;
            _5339 = _5377;
            _5329 = _5381;
            _5383 = true;
        }
        else
        {
            bool _5385 = _5099 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5387 = isnan(_5099);
            bool _5389 = _5385 || _5387;
            bool _5391 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5393 = _5389 || _5391;
            if (!_5393)
            {
                _5337 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5395 = _5337;
            _5339 = _5395;
            if (!_5393)
            {
                _5315 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5397 = _5315;
            _5317 = _5397;
            if (!_5393)
            {
                _5327 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5399 = _5327;
            bool _5401 = !_5393;
            _5329 = _5399;
            if (!_5401)
            {
                bool _5403 = _5099 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5405 = isnan(_5099);
                bool _5407 = _5403 || _5405;
                bool _5409 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5411 = _5407 || _5409;
                if (!_5411)
                {
                    float _5413 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5415 = _5099 + _5413;
                    float _5417 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5419 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5417;
                    float _5421 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5423 = _5421 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5425 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5427 = _5425 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5429 = 1.0 / _5419;
                    float _5431 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5433 = _5431 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5435 = _5415 * _5429;
                    float _5437 = precise::clamp(_5435, 0.0, 1.0);
                    float _5439 = fma(_5437, _5423, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5441 = fma(_5437, _5427, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5443 = fma(_5437, _5433, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _5317 = _5441;
                    _5339 = _5439;
                    _5329 = _5443;
                    _5383 = true;
                }
                else
                {
                    _5317 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5339 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5329 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5383 = false;
    float _5445 = _5317;
    float _5447 = _5339;
    float _5449 = _5329;
    float _5451 = _5445 * 0.586610972881317138671875;
    bool _5453 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_94.x = 0.0;
    float _5455 = fma(_5447, 0.298911988735198974609375, _5451);
    float _5457 = fma(_5449, 0.114477999508380889892578125, _5455);
    float _5459 = -_5457;
    float _5461 = _5459 + _5447;
    float _5463 = -_5457;
    float _5465 = _5463 + _5445;
    float _5467 = -_5457;
    float _5469 = _5467 + _5449;
    float _5471 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5473 = fma(_5461, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5457);
    float _5475 = fma(_5465, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5457);
    float _5477 = fma(_5469, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5457);
    out.m_61.x = _5471;
    out.m_96.x = _5473;
    out.m_96.y = _5475;
    out.m_96.z = _5477;
    if (!_5453)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5479 = -_4558;
    float _5481 = _5479 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5483 = -_4560;
    float _5485 = _5483 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5487 = -_4564;
    float _5489 = _5487 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5491 = _5481 * _5481;
    float _5493 = fma(_5485, _5485, _5491);
    float _5495 = fma(_5489, _5489, _5493);
    float _5497 = sqrt(_5495);
    float _5499 = rsqrt(_5495);
    float _5501 = -_5497;
    float _5503 = _5501 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5505 = _5503 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5507 = precise::clamp(_5505, 0.0, 1.0);
    float _5509 = _5485 * _5499;
    float _5511 = _5481 * _5499;
    float _5513 = abs(_5507);
    float _5515 = log2(_5513);
    float _5517 = _5489 * _5499;
    float _5519 = _5509 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5521 = _4146 * _5511;
    float _5523 = -_5511;
    float _5525 = -_5519;
    float _5527 = fma(_5523, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5525);
    float _5529 = fma(_4150, _5509, _5521);
    float _5531 = -_5517;
    float _5533 = fma(_5531, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5527);
    float _5535 = fma(_4152, _5517, _5529);
    float _5537 = precise::clamp(_5535, 0.0, 1.0);
    float _5539 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5541 = _5533 + _5539;
    float _5543 = _5515 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5545 = _5541 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5547 = precise::clamp(_5545, 0.0, 1.0);
    float _5549 = exp2(_5543);
    float _5551 = _5549 * _5547;
    float _5553 = _5537 * _5551;
    float _5555 = _5553 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5557 = _5553 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5559 = _5553 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _5555;
    out.m_94.y = _5557;
    out.m_94.z = _5559;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5383 = false;
    bool _4200 = false;
    bool _831 = false;
    bool _725 = false;
    bool _331 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_58.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_61.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5616 = as_type<float>(_131);
        out.gl_Position.z = _5616;
    }
    if (!_119)
    {
        return out;
    }
    float _135 = in.m_63.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_61.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    float _171 = as_type<float>(_169);
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5687 = as_type<float>(_169);
        out.gl_Position.z = _5687;
    }
    if (_163)
    {
        return out;
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    float _175 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _177 = in.m_68.w;
    bool _179 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _181 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _183 = _179 || _181;
    bool _185 = isnan(1.0);
    bool _187 = _183 || _185;
    float _189 = in.m_63.x;
    float _191 = in.m_63.y;
    float _193 = in.m_63.z;
    float _195 = in.m_58.x;
    float _197 = in.m_58.y;
    float _199 = in.m_58.z;
    float _201 = _175;
    if (!_187)
    {
        float _203 = _175 * _175;
        float _205 = _203 * 0.5;
        _171 = _205;
    }
    float _207 = _171;
    float _209 = _207;
    if (!_187)
    {
        float _211 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _211;
    }
    float _213 = _209;
    int _215 = as_type<int>(_173) & 1;
    bool _217 = _215 != 0;
    int _219 = as_type<int>(_173) & 2;
    bool _221 = _219 != 0;
    bool _223 = !_217;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_221;
    float _229 = _227 ? (-0.5) : 0.5;
    bool _231 = !_187;
    float _233 = _213;
    if (!_231)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = _175 * _237;
        float _247 = 1.0 / _241;
        float _249 = _243 * 0.693147182464599609375;
        float _251 = exp2(_245);
        float _253 = 1.0 / _249;
        float _255 = _251 + (-1.0);
        float _257 = -_255;
        float _259 = fma(_257, _253, _175);
        float _261 = _259 * _247;
        float _263 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _263;
    }
    float _265 = _233;
    bool _267 = !_187;
    if (!_267)
    {
        float _269 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = log2(_269);
        float _273 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _275 = _273 + 1.0;
        float _277 = 1.0 / _275;
        float _279 = _175 * _271;
        float _281 = exp2(_279);
        float _283 = -_281;
        float _285 = _283 + 1.0;
        float _287 = _285 * _277;
        _201 = _287;
    }
    float _289 = _201;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _293 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _295 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _297 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _299 = fma(_289, _189, _293);
    float _301 = fma(_289, _191, _295);
    float _303 = fma(_289, _193, _297);
    float _305 = fma(_299, _177, _195);
    float _307 = fma(_301, _177, _197);
    float _309 = fma(_303, _177, _199);
    bool _311 = !_291;
    float _329;
    if (!_311)
    {
        float _313 = in.m_70.x;
        float _315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _317 = _313 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _321 = _319 * _315;
        float _323 = floor(_321);
        float _325 = -_323;
        float _327 = _321 + _325;
        _329 = _327;
        _331 = true;
    }
    else
    {
        float _333 = float(_115);
        float _335 = 1.0 / _333;
        float _337 = _149 * _335;
        _329 = _337;
    }
    _331 = false;
    float _339 = _329;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _357 = 1.0 / _343;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _367 = 1.0 / _351;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _371 = _339 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _373;
    float _377 = 1.0 / _355;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = _339 + _379;
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _385 = 1.0 / _347;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _389 = _339 + _387;
    float _391 = _381 * _367;
    bool _393 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _395 = isnan(_339);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = 1.0 / _365;
    float _407 = _389 * _377;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _411 = _339 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _415 = _339 + _413;
    float _417 = _411 * _357;
    float _419 = -_403;
    float _421 = _419 + 1.0;
    float _423 = _371 * _385;
    float _425 = 1.0 / _361;
    bool _427 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _429 = isnan(_339);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _441 = _339 + _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _445 = _339 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _447;
    float _451 = -_437;
    float _453 = _451 + 1.0;
    float _455 = _437 * _421;
    float _457 = 1.0 / _375;
    bool _459 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _461 = isnan(_339);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = _441 * _405;
    bool _473 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _475 = isnan(_339);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = fma(_449, _391, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _487 = _469 * _453;
    float _489 = -_469;
    float _491 = _489 + 1.0;
    float _493 = _415 * _425;
    bool _495 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _497 = isnan(_339);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _507;
    bool _511 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _513 = isnan(_339);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = _505 * _491;
    float _525 = -_505;
    float _527 = _525 + 1.0;
    float _529 = _445 * _457;
    float _531 = -_483;
    float _533 = _531 + 1.0;
    float _535 = fma(_509, _391, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _537 = _483 * _527;
    bool _539 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _541 = isnan(_339);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = _521 * _533;
    bool _553 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _555 = isnan(_339);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -_521;
    float _567 = _565 + 1.0;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _573 = -_549;
    float _575 = _573 + 1.0;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _577;
    float _581 = _549 * _567;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _587;
    float _591 = _563 * _575;
    float _593 = fma(_571, _407, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _595 = fma(_585, _407, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _597 = fma(_589, _417, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _599 = fma(_579, _417, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _601 = _485 * _591;
    float _603 = _535 * _591;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _613 = -_563;
    float _615 = _613 + 1.0;
    float _617 = fma(_607, _423, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _619 = fma(_611, _423, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _621 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[143].x, _601);
    float _623 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[143].y, _603);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _629;
    float _633 = fma(_593, _581, _621);
    float _635 = fma(_595, _581, _623);
    float _637 = fma(_627, _493, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _639 = fma(_631, _493, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _649 = fma(_597, _551, _633);
    float _651 = fma(_599, _551, _635);
    float _653 = fma(_643, _471, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _655 = in.m_68.x;
    float _657 = in.m_68.y;
    float _659 = fma(_647, _471, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _661 = fma(_617, _537, _649);
    float _663 = fma(_619, _537, _651);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _665;
    float _669 = fma(_637, _523, _661);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _671;
    float _675 = fma(_639, _523, _663);
    float _677 = fma(_667, _529, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _679 = fma(_653, _487, _669);
    float _681 = fma(_673, _529, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _683 = fma(_659, _487, _675);
    float _685 = fma(_677, _455, _679);
    float _687 = fma(_681, _455, _683);
    float _689 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[150].x, _685);
    float _691 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[150].y, _687);
    float _693 = _689 * _655;
    float _695 = _691 * _657;
    bool _697 = !_383;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[150].y;
    float _701 = _675;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _723;
    if (!_697)
    {
        float _707 = in.m_70.x;
        float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _711 = _707 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _715 = _713 * _709;
        float _717 = floor(_715);
        float _719 = -_717;
        float _721 = _715 + _719;
        _723 = _721;
        _725 = true;
    }
    else
    {
        float _727 = float(_115);
        float _729 = 1.0 / _727;
        float _731 = _149 * _729;
        _723 = _731;
    }
    _725 = false;
    float _733 = _723;
    bool _735 = _733 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _737 = isnan(_733);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _751 = _733 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _753 = isnan(_733);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _769 = _733 + _767;
    float _771 = -_745;
    float _773 = _771 + 1.0;
    bool _775 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _777 = 1.0 / _749;
    float _779 = _761 * _773;
    float _781 = -_761;
    float _783 = _781 + 1.0;
    float _785 = _765 * _777;
    float _787 = fma(_785, _769, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _789 = _787 * _779;
    float _791 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[115].x, _789);
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _799 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[116].x, _791);
    float _801 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _803 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _799 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _801;
    out.m_72.y = _803;
    out.m_72.z = _805;
    out.m_72.w = _807;
    bool _809 = !_775;
    float _811 = _807;
    float _829;
    if (!_809)
    {
        float _813 = in.m_70.x;
        float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _817 = _813 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _819 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _821 = _819 * _815;
        float _823 = floor(_821);
        float _825 = -_823;
        float _827 = _821 + _825;
        _829 = _827;
        _831 = true;
    }
    else
    {
        float _833 = float(_115);
        float _835 = 1.0 / _833;
        float _837 = _149 * _835;
        _829 = _837;
    }
    _831 = false;
    float _839 = _829;
    float _841 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _843 = int(_841);
    float _845 = float(_115);
    float _847 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _849 = int(_847);
    float _851 = float(_843);
    float _853 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _855 = int(_853);
    float _857 = float(uint(_849));
    float _859 = 1.0 / _851;
    float _861 = float(_849);
    float _863 = 1.0 / _857;
    float _865 = float(_855);
    float _867 = _859 * _149;
    float _869 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _871 = int(_869);
    int _873 = as_type<int>(_863) + (-2);
    float _875 = trunc(_867);
    int _877 = int(_875);
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _881 = _879 != 0;
    float _883 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _885 = int(_883);
    float _887 = float(uint(_871));
    float _889 = float(uint(_877));
    float _891 = 1.0 / _865;
    if (_881)
    {
        _811 = 1.0;
    }
    float _893 = _811;
    float _895 = _893;
    if (_881)
    {
        _699 = 1.0;
    }
    float _897 = _699;
    float _899 = as_type<float>(_873) * _889;
    float _901 = _897;
    if (_881)
    {
        _701 = 1.0;
    }
    float _903 = _701;
    float _905 = _889;
    float _907 = _903;
    if (_881)
    {
        float _909 = in.m_70.x;
        _905 = _909;
    }
    float _911 = _905;
    float _913 = float(_885);
    float _915 = trunc(_899);
    float _917 = precise::max(_915, 0.0);
    uint _920 = uint(_917);
    if (_881)
    {
        _703 = 0;
    }
    int _922 = _703;
    int _924 = _922;
    if (_881)
    {
        _705 = 0;
    }
    int _926 = _705;
    float _928 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _930 = int(_928);
    float _932 = _891 * _149;
    float _934 = float(_877);
    bool _936 = _934 >= _861;
    bool _938 = isnan(_934);
    bool _940 = _936 || _938;
    bool _942 = isnan(_861);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = 1.0 / _887;
    float _950 = 1.0 / _913;
    int _952 = ~_849;
    int _954 = _952 + 1;
    float _956 = float(uint(_930));
    int _958 = _954 * int(_920);
    int _960 = _958 + _877;
    float _962 = 1.0 / _956;
    float _964 = float(uint(_960));
    float _966 = _950 * _149;
    float _968 = in.m_70.x;
    float _970 = in.m_70.y;
    float _972 = in.m_70.z;
    float _974 = in.m_70.w;
    float _976 = as_type<float>(_873) * _964;
    float _978 = 1.0 / _845;
    int _980 = as_type<int>(_948) + (-2);
    float _982 = _948;
    float _984 = _911;
    int _986 = _926;
    if (_881)
    {
        _982 = _911;
    }
    float _988 = _982;
    float _990 = trunc(_932);
    int _992 = int(_990);
    float _994 = trunc(_966);
    int _996 = int(_994);
    float _998 = trunc(_946);
    int _1000 = int(_998);
    float _1002 = trunc(_976);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    float _1008 = _988;
    if (!_881)
    {
        float _1010 = in.m_70.y;
        float _1012 = in.m_70.z;
        _895 = 7.345489978790283203125;
        _907 = 5.839270114898681640625;
        _1008 = _1012;
        _901 = 1.2345600128173828125;
        _984 = _1010;
        _924 = 1;
        _986 = 2;
    }
    float _1014 = _895;
    float _1016 = _907;
    float _1018 = _1008;
    float _1020 = _901;
    float _1022 = _984;
    int _1024 = _924;
    int _1026 = _986;
    float _1028 = float(uint(_992));
    float _1030 = _1014 * _968;
    int _1032 = int(_920) + int(_1006);
    float _1034 = _1016 * _1018;
    int _1036 = as_type<int>(_962) + (-2);
    float _1038 = as_type<float>(_980) * _1028;
    float _1040 = float(uint(_996));
    float _1042 = floor(_1030);
    bool _1044 = _974 > 0.5;
    float _1046 = _978 * _149;
    int _1048 = ~_849;
    int _1050 = _1048 + 1;
    float _1052 = as_type<float>(_1036) * _1040;
    int _1054 = ~_871;
    int _1056 = _1054 + 1;
    float _1058 = _1020 * _1022;
    float _1060 = trunc(_1038);
    float _1062 = precise::max(_1060, 0.0);
    uint _1064 = uint(_1062);
    int _1066 = _1050 * _1032;
    int _1068 = _1066 + _877;
    int _1070 = ~_930;
    int _1072 = _1070 + 1;
    float _1074 = _307 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    bool _1076 = _970 > 0.5;
    bool _1078 = uint(_1068) >= uint(_849);
    float _1080 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1074);
    float _1082 = trunc(_1052);
    float _1084 = precise::max(_1082, 0.0);
    uint _1086 = uint(_1084);
    float _1088 = -_1042;
    float _1090 = _1030 + _1088;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1102 = _1100 != 0;
    float _1104 = -_225;
    int _1106 = _1076 ? as_type<int>(_1104) : as_type<int>(_225);
    float _1108 = _1090 * _861;
    bool _1110 = _972 > 0.5;
    float _1112 = _861 * _1046;
    int _1114 = _1056 * int(_1064);
    int _1116 = _1114 + _992;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1120 = _1118 != 0;
    float _1122 = floor(_1058);
    float _1124 = float(uint(_1116));
    bool _1126 = !_1098;
    float _1128 = _1126 ? _225 : as_type<float>(_1106);
    int _1130 = _1072 * int(_1086);
    int _1132 = _1130 + _996;
    float _1134 = -_229;
    int _1136 = _1110 ? as_type<int>(_1134) : as_type<int>(_229);
    float _1138 = as_type<float>(_980) * _1124;
    bool _1140 = !_1078;
    int _1142 = _1140 ? 0 : (-1);
    float _1144 = trunc(_1108);
    int _1146 = int(_1144);
    float _1148 = float(uint(_1132));
    int _1150 = ~_1032;
    int _1152 = _1150 + _1142;
    int _1154 = _1152 + 1;
    bool _1156 = !_1120;
    int _1158 = _1156 ? 0 : 1;
    float _1160 = as_type<float>(_1036) * _1148;
    bool _1162 = !_1102;
    float _1164 = _1162 ? _229 : as_type<float>(_1136);
    float _1166 = trunc(_1138);
    float _1168 = precise::max(_1166, 0.0);
    uint _1170 = uint(_1168);
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1182 = _1180 != 0;
    float _1184 = -_1122;
    float _1186 = _1058 + _1184;
    bool _1188 = _849 == 0;
    int _1190 = abs(_1158);
    bool _1192 = !_1178;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = trunc(_1160);
    float _1198 = precise::max(_1196, 0.0);
    uint _1200 = uint(_1198);
    int _1202 = _849 * _1154;
    int _1204 = _1202 + _877;
    int _1206 = ~_1000;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    int _1212 = _1146 * _1190;
    int _1214 = _1212 + _877;
    int _1216 = _849 + (-1);
    bool _1218 = !_1188;
    int _1220 = _1218 ? _1204 : (-1);
    float _1222 = trunc(_1112);
    int _1224 = int(_1222);
    int _1226 = ~_871;
    int _1228 = _1226 + 1;
    int _1230 = _1220 * _1210;
    int _1232 = int(_1064) + int(_1170);
    int _1234 = abs(_1194);
    int _1236 = _1000 * _1216;
    int _1238 = _1236 + _1230;
    float _1240 = floor(_1034);
    bool _1242 = !_1174;
    int _1244 = _1242 ? 0 : 1;
    int _1246 = _1228 * _1232;
    int _1248 = _1246 + _992;
    int _1250 = int(_1086) + int(_1200);
    int _1252 = abs(_1244);
    int _1254 = ~_930;
    int _1256 = _1254 + 1;
    bool _1258 = !_1182;
    int _1260 = _1258 ? 0 : 1;
    int _1262 = _1238 * _1234;
    bool _1264 = uint(_1248) >= uint(_871);
    int _1266 = abs(_1260);
    int _1268 = _1256 * _1250;
    int _1270 = _1268 + _996;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1274 = _1272 != 0;
    int _1276 = _1224 * _1252;
    int _1278 = _1276 + _1262;
    bool _1280 = !_1264;
    int _1282 = _1280 ? 0 : (-1);
    float _1284 = -_1240;
    float _1286 = _1034 + _1284;
    bool _1288 = uint(_1270) >= uint(_930);
    int _1290 = _1214 * _1266;
    int _1292 = _1290 + _1278;
    bool _1294 = !_1274;
    int _1296 = _1294 ? 0 : 1;
    float _1298 = float(_871);
    float _1300 = float(_992);
    int _1302 = ~_1232;
    int _1304 = _1302 + _1282;
    int _1306 = _1304 + 1;
    int _1308 = abs(_1296);
    bool _1310 = _1300 >= _1298;
    bool _1312 = isnan(_1300);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan(_1298);
    bool _1318 = _1314 || _1316;
    float _1320 = float(_1318);
    float _1322 = float(_930);
    float _1324 = float(_996);
    float _1326 = -_229;
    int _1328 = _1044 ? as_type<int>(_1326) : as_type<int>(_229);
    float _1330 = trunc(_1320);
    int _1332 = int(_1330);
    bool _1334 = _1324 >= _1322;
    bool _1336 = isnan(_1324);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan(_1322);
    bool _1342 = _1338 || _1340;
    float _1344 = float(_1342);
    bool _1346 = !_1094;
    float _1348 = _1346 ? _229 : as_type<float>(_1328);
    int _1350 = _1146 * _1308;
    int _1352 = _1350 + _1292;
    int _1354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1356 = _1354 != 0;
    float _1358 = _1186 * _1298;
    bool _1360 = !_1288;
    int _1362 = _1360 ? 0 : (-1);
    float _1364 = trunc(_1344);
    int _1366 = int(_1364);
    bool _1368 = !_1356;
    int _1370 = _1368 ? 0 : 1;
    float _1372 = _1298 * _1046;
    float _1374 = float(uint(_1352));
    float _1376 = _1322 * _1046;
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1380 = _1378 != 0;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1384 = _1382 != 0;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1392 = _1390 != 0;
    int _1394 = ~_1250;
    int _1396 = _1394 + _1362;
    int _1398 = _1396 + 1;
    float _1400 = trunc(_1358);
    int _1402 = int(_1400);
    float _1404 = as_type<float>(_873) * _1374;
    bool _1406 = !_1380;
    int _1408 = _1406 ? 0 : 1;
    int _1410 = _871 * _1306;
    int _1412 = _1410 + _992;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1416 = _1414 != 0;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1420 = _1418 != 0;
    int _1422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1424 = _1422 != 0;
    int _1426 = _930 * _1398;
    int _1428 = _1426 + _996;
    bool _1430 = _871 == 0;
    bool _1432 = !_1384;
    int _1434 = _1432 ? 0 : 1;
    float _1436 = trunc(_1404);
    float _1438 = precise::max(_1436, 0.0);
    uint _1440 = uint(_1438);
    bool _1442 = _930 == 0;
    int _1444 = abs(_1370);
    int _1446 = ~_1332;
    int _1448 = _1446 + 1;
    int _1450 = _1448 + 1;
    bool _1452 = !_1430;
    int _1454 = _1452 ? _1412 : (-1);
    float _1456 = trunc(_1372);
    int _1458 = int(_1456);
    int _1460 = ~_1366;
    int _1462 = _1460 + 1;
    int _1464 = _1462 + 1;
    bool _1466 = !_1442;
    int _1468 = _1466 ? _1428 : (-1);
    int _1470 = _1454 * _1450;
    float _1472 = _1286 * _1322;
    int _1474 = _871 + (-1);
    int _1476 = _1468 * _1464;
    int _1478 = ~_849;
    int _1480 = _1478 + 1;
    int _1482 = _1402 * _1444;
    int _1484 = _1482 + _992;
    int _1486 = _930 + (-1);
    int _1488 = _1332 * _1474;
    int _1490 = _1488 + _1470;
    float _1492 = trunc(_1376);
    int _1494 = int(_1492);
    bool _1496 = !_1420;
    int _1498 = _1496 ? 0 : 1;
    int _1500 = _1366 * _1486;
    int _1502 = _1500 + _1476;
    int _1504 = abs(_1434);
    int _1506 = _1480 * int(_1440);
    int _1508 = _1506 + _1352;
    int _1510 = abs(_1498);
    bool _1512 = !_1388;
    int _1514 = _1512 ? 0 : 1;
    float _1516 = float(uint(_1508));
    int _1518 = _1490 * _1504;
    int _1520 = abs(_1408);
    int _1522 = _1502 * _1510;
    int _1524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1526 = _1524 != 0;
    float _1528 = as_type<float>(_873) * _1516;
    int _1530 = abs(_1514);
    int _1532 = _1458 * _1520;
    int _1534 = _1532 + _1518;
    bool _1536 = !_1526;
    int _1538 = _1536 ? 0 : 1;
    float _1540 = trunc(_1528);
    float _1542 = precise::max(_1540, 0.0);
    uint _1544 = uint(_1542);
    bool _1546 = !_1392;
    int _1548 = _1546 ? 0 : 1;
    float _1550 = _307 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _1552 = abs(_1538);
    float _1554 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1550);
    float _1556 = float(uint(_1214));
    float _1558 = trunc(_1472);
    int _1560 = int(_1558);
    bool _1562 = !_1416;
    int _1564 = _1562 ? 0 : 1;
    int _1566 = _1484 * _1530;
    int _1568 = _1566 + _1534;
    int _1570 = abs(_1548);
    float _1572 = as_type<float>(_873) * _1556;
    int _1574 = abs(_1564);
    int _1576 = _1402 * _1570;
    int _1578 = _1576 + _1568;
    float _1580 = trunc(_1572);
    float _1582 = precise::max(_1580, 0.0);
    uint _1584 = uint(_1582);
    int _1586 = int(_1440) + int(_1544);
    float _1588 = float(uint(_1578));
    int _1590 = _1494 * _1574;
    int _1592 = _1590 + _1522;
    bool _1594 = !_1424;
    int _1596 = _1594 ? 0 : 1;
    int _1598 = _1560 * _1552;
    int _1600 = _1598 + _996;
    int _1602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1604 = _1602 != 0;
    float _1606 = as_type<float>(_980) * _1588;
    int _1608 = abs(_1596);
    int _1610 = ~_849;
    int _1612 = _1610 + 1;
    bool _1614 = !_1604;
    int _1616 = _1614 ? 0 : 1;
    float _1618 = trunc(_1606);
    float _1620 = precise::max(_1618, 0.0);
    uint _1622 = uint(_1620);
    int _1624 = ~_849;
    int _1626 = _1624 + 1;
    int _1628 = _1600 * _1608;
    int _1630 = _1628 + _1592;
    int _1632 = abs(_1616);
    int _1634 = _1612 * int(_1584);
    int _1636 = _1634 + _1214;
    float _1638 = float(uint(_1484));
    int _1640 = _1626 * _1586;
    int _1642 = _1640 + _1352;
    float _1644 = float(uint(_1636));
    float _1646 = as_type<float>(_980) * _1638;
    int _1648 = ~_871;
    int _1650 = _1648 + 1;
    int _1652 = _1560 * _1632;
    int _1654 = _1652 + _1630;
    bool _1656 = uint(_1642) >= uint(_849);
    float _1658 = trunc(_1646);
    float _1660 = precise::max(_1658, 0.0);
    uint _1662 = uint(_1660);
    float _1664 = as_type<float>(_873) * _1644;
    bool _1666 = !_1656;
    int _1668 = _1666 ? 0 : (-1);
    float _1670 = float(uint(_1654));
    int _1672 = _1650 * int(_1622);
    int _1674 = _1672 + _1578;
    int _1676 = ~_1586;
    int _1678 = _1676 + _1668;
    int _1680 = _1678 + 1;
    float _1682 = trunc(_1664);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    int _1688 = ~_871;
    int _1690 = _1688 + 1;
    float _1692 = as_type<float>(_1036) * _1670;
    float _1694 = float(uint(_1674));
    int _1696 = _849 * _1680;
    int _1698 = _1696 + _1352;
    bool _1700 = _849 == 0;
    float _1702 = trunc(_1692);
    float _1704 = precise::max(_1702, 0.0);
    uint _1706 = uint(_1704);
    bool _1708 = !_1700;
    int _1710 = _1708 ? _1698 : (-1);
    float _1712 = as_type<float>(_980) * _1694;
    int _1714 = ~_930;
    int _1716 = _1714 + 1;
    int _1718 = _1690 * int(_1662);
    int _1720 = _1718 + _1484;
    int _1722 = _1710 & 3;
    bool _1724 = _1722 != 0;
    int _1726 = _1710 & 3;
    bool _1728 = _1726 != 0;
    float _1730 = trunc(_1712);
    float _1732 = precise::max(_1730, 0.0);
    uint _1734 = uint(_1732);
    float _1736 = float(uint(_1720));
    int _1738 = _1724 ? 0 : 1;
    bool _1740 = uint(_1726) > 1u;
    float _1742 = as_type<float>(_980) * _1736;
    int _1744 = int(_1584) + int(_1686);
    float _1746 = trunc(_1742);
    float _1748 = precise::max(_1746, 0.0);
    uint _1750 = uint(_1748);
    int _1752 = ~_849;
    int _1754 = _1752 + 1;
    int _1756 = _1716 * int(_1706);
    int _1758 = _1756 + _1654;
    int _1760 = ~_1738;
    int _1762 = _1760 + 1;
    int _1764 = _1762 + 1;
    bool _1766 = !_1728;
    int _1768 = _1766 ? 0 : 1;
    int _1770 = _1754 * _1744;
    int _1772 = _1770 + _1214;
    float _1774 = float(uint(_1758));
    int _1776 = int(_1622) + int(_1734);
    int _1778 = _1764;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_1740)
    {
        int _1782 = ~_1738;
        int _1784 = _1782 + 1;
        _1778 = _1784;
    }
    int _1786 = _1778;
    float _1788 = as_type<float>(_1036) * _1774;
    int _1790 = ~_871;
    int _1792 = _1790 + 1;
    bool _1794 = uint(_1726) >= 2u;
    int _1796 = int(_1662) + int(_1750);
    int _1798 = _1792 * _1776;
    int _1800 = _1798 + _1578;
    int _1802 = _1794 ? 0 : 1;
    float _1804 = trunc(_1788);
    float _1806 = precise::max(_1804, 0.0);
    uint _1808 = uint(_1806);
    bool _1810 = uint(_1772) >= uint(_849);
    int _1812 = ~_1802;
    int _1814 = _1812 + 1;
    int _1816 = _1814 + 1;
    bool _1818 = !_1810;
    int _1820 = _1818 ? 0 : (-1);
    bool _1822 = uint(_1800) >= uint(_871);
    int _1824 = ~_1744;
    int _1826 = _1824 + _1820;
    int _1828 = _1826 + 1;
    bool _1830 = !_1822;
    int _1832 = _1830 ? 0 : (-1);
    bool _1834 = _1726 != 3;
    int _1836 = _849 * _1828;
    int _1838 = _1836 + _1214;
    int _1840 = ~_1776;
    int _1842 = _1840 + _1832;
    int _1844 = _1842 + 1;
    float _1846 = float(uint(_1600));
    int _1848 = int(_1706) + int(_1808);
    int _1850 = _871 * _1844;
    int _1852 = _1850 + _1578;
    bool _1854 = !_1700;
    int _1856 = _1854 ? _1838 : (-1);
    float _1858 = as_type<float>(_1036) * _1846;
    int _1860 = ~_930;
    int _1862 = _1860 + 1;
    bool _1864 = !_1430;
    int _1866 = _1864 ? _1852 : (-1);
    float _1868 = trunc(_1858);
    float _1870 = precise::max(_1868, 0.0);
    uint _1872 = uint(_1870);
    int _1874 = _1816;
    if (_1834)
    {
        int _1876 = ~_1802;
        int _1878 = _1876 + 1;
        _1874 = _1878;
    }
    int _1880 = _1874;
    int _1882 = _1862 * _1848;
    int _1884 = _1882 + _1654;
    int _1886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1888 = _1886 != 0;
    int _1890 = _1866 & 3;
    bool _1892 = _1890 != 0;
    int _1894 = _1866 & 3;
    bool _1896 = _1894 != 0;
    bool _1898 = !_1888;
    int _1900 = _1898 ? 0 : 1;
    bool _1902 = uint(_1890) >= 2u;
    int _1904 = _1896 ? 0 : 1;
    bool _1906 = uint(_1884) >= uint(_930);
    int _1908 = ~_930;
    int _1910 = _1908 + 1;
    int _1912 = _1902 ? 0 : 1;
    bool _1914 = uint(_1890) > 1u;
    int _1916 = _1910 * int(_1872);
    int _1918 = _1916 + _1600;
    bool _1920 = !_1906;
    int _1922 = _1920 ? 0 : (-1);
    int _1924 = ~_871;
    int _1926 = _1924 + 1;
    bool _1928 = _1890 != 3;
    int _1930 = ~_1848;
    int _1932 = _1930 + _1922;
    int _1934 = _1932 + 1;
    int _1936 = _1926 * _1796;
    int _1938 = _1936 + _1484;
    float _1940 = float(uint(_1918));
    int _1942 = ~_1904;
    int _1944 = _1942 + 1;
    int _1946 = _1944 + 1;
    int _1948 = _930 * _1934;
    int _1950 = _1948 + _1654;
    int _1952 = _1946;
    if (!_1914)
    {
        int _1954 = ~_1904;
        int _1956 = _1954 + 1;
        _1952 = _1956;
    }
    int _1958 = _1952;
    float _1960 = as_type<float>(_1036) * _1940;
    bool _1962 = uint(_1938) >= uint(_871);
    bool _1964 = !_1442;
    int _1966 = _1964 ? _1950 : (-1);
    int _1968 = ~_1912;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    float _1974 = trunc(_1960);
    float _1976 = precise::max(_1974, 0.0);
    uint _1978 = uint(_1976);
    int _1980 = _1972;
    if (_1928)
    {
        int _1982 = ~_1912;
        int _1984 = _1982 + 1;
        _1980 = _1984;
    }
    int _1986 = _1980;
    int _1988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1990 = _1988 != 0;
    bool _1992 = !_1962;
    int _1994 = _1992 ? 0 : (-1);
    int _1996 = _1966 & 3;
    bool _1998 = _1996 != 0;
    bool _2000 = !_1990;
    int _2002 = _2000 ? 0 : 1;
    bool _2004 = uint(_1996) > 1u;
    bool _2006 = !_1892;
    int _2008 = _2006 ? 0 : 1;
    int _2010 = _1966 & 3;
    bool _2012 = _2010 != 0;
    bool _2014 = !_1998;
    int _2016 = _2014 ? 0 : 1;
    int _2018 = _2012 ? 0 : 1;
    int _2020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2022 = _2020 != 0;
    int _2024 = ~_2018;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    bool _2030 = !_2022;
    int _2032 = _2030 ? 0 : 1;
    bool _2034 = _1726 != 3;
    int _2036 = _2028;
    if (!_2004)
    {
        int _2038 = ~_2018;
        int _2040 = _2038 + 1;
        _2036 = _2040;
    }
    int _2042 = _2036;
    int _2044 = ~_930;
    int _2046 = _2044 + 1;
    bool _2048 = _1996 != 3;
    bool _2050 = !_2034;
    int _2052 = _2050 ? 0 : (-1);
    bool _2054 = _1890 != 3;
    int _2056 = int(_1872) + int(_1978);
    bool _2058 = uint(_1996) >= 2u;
    int _2060 = _2058 ? 0 : 1;
    bool _2062 = _1996 != 3;
    int _2064 = _2046 * _2056;
    int _2066 = _2064 + _1600;
    int _2068 = ~_2060;
    int _2070 = _2068 + 1;
    int _2072 = _2070 + 1;
    bool _2074 = !_2062;
    int _2076 = _2074 ? 0 : (-1);
    int _2078 = _2072;
    if (_2048)
    {
        int _2080 = ~_2060;
        int _2082 = _2080 + 1;
        _2078 = _2082;
    }
    int _2084 = _2078;
    int _2086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2088 = _2086 != 0;
    bool _2090 = uint(_2066) >= uint(_930);
    int _2092 = _1710 >> 31;
    int _2094 = _1866 >> 31;
    bool _2096 = !_2090;
    int _2098 = _2096 ? 0 : (-1);
    int _2100 = _2092 & 3;
    float _2102 = _307 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    int _2104 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2106 = _2104 != 0;
    int _2108 = _1966 >> 31;
    float _2110 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[14].x, _2102);
    int _2112 = _2094 & 3;
    float _2114 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[16].x, _2110);
    int _2116 = _1710 + _2100;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2120 = _2108 & 3;
    float _2122 = _2114 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    int _2124 = _1866 + _2112;
    float _2126 = _970 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2128 = _307 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    bool _2130 = !_2054;
    int _2132 = _2130 ? 0 : (-1);
    float _2134 = fma(_2126, -2.0, _2118);
    int _2136 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2138 = _2136 != 0;
    float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2142 = _2140 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2144 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[14].y, _2128);
    int _2146 = _1966 + _2120;
    float _2148 = 1.0 / _2142;
    int _2150 = _2116 >> 2;
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2154 = _2124 >> 2;
    float _2156 = _968 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2158 = _2146 >> 2;
    float _2160 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2134);
    int _2162 = _2150 << 4;
    int _2164 = _2162 + 368;
    float _2166 = -_2152;
    float _2168 = fma(_2156, 2.0, _2166);
    int _2170 = _2154 << 4;
    int _2172 = _2170 + 512;
    float _2174 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[16].y, _2144);
    int _2176 = _2158 << 4;
    int _2178 = _2176 + 656;
    uint _2180 = uint(int(uint(_2164) >> uint(2)));
    uint _2182 = uint(int(uint(int(_2180)) >> uint(2)));
    int _2184 = int(_2180) & 3;
    float _2186 = (*spvDescriptorSet0.vp_c9)._m0[int(_2182)][_2184];
    int _2188 = int(_2180) + 1;
    uint _2190 = uint(int(uint(_2188) >> uint(2)));
    int _2192 = _2188 & 3;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[int(_2190)][_2192];
    float _2196 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1554);
    float _2198 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1080);
    float _2200 = _2174 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _2202 = _2196 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    uint _2204 = uint(int(uint(_2172) >> uint(2)));
    uint _2206 = uint(int(uint(int(_2204)) >> uint(2)));
    int _2208 = int(_2204) & 3;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[int(_2206)][_2208];
    int _2212 = int(_2204) + 1;
    uint _2214 = uint(int(uint(_2212) >> uint(2)));
    int _2216 = _2212 & 3;
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[int(_2214)][_2216];
    float _2220 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _2222 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2222;
    float _2226 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _2228 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _2220);
    int _2230 = abs(_1786);
    uint _2232 = uint(int(uint(_2178) >> uint(2)));
    uint _2234 = uint(int(uint(int(_2232)) >> uint(2)));
    int _2236 = int(_2232) & 3;
    float _2238 = (*spvDescriptorSet0.vp_c9)._m0[int(_2234)][_2236];
    int _2240 = int(_2232) + 1;
    uint _2242 = uint(int(uint(_2240) >> uint(2)));
    int _2244 = _2240 & 3;
    float _2246 = (*spvDescriptorSet0.vp_c9)._m0[int(_2242)][_2244];
    float _2248 = _2224 * _2148;
    float _2250 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _2226);
    int _2252 = ~_1796;
    int _2254 = _2252 + _1994;
    int _2256 = _2254 + 1;
    float _2258 = -_149;
    float _2260 = fma(_2258, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2168);
    int _2262 = abs(_1958);
    int _2264 = _2164 + 8;
    uint _2266 = uint(int(uint(_2264) >> uint(2)));
    uint _2268 = uint(int(uint(int(_2266)) >> uint(2)));
    int _2270 = int(_2266) & 3;
    float _2272 = (*spvDescriptorSet0.vp_c9)._m0[int(_2268)][_2270];
    int _2274 = int(_2266) + 1;
    uint _2276 = uint(int(uint(_2274) >> uint(2)));
    int _2278 = _2274 & 3;
    float _2280 = (*spvDescriptorSet0.vp_c9)._m0[int(_2276)][_2278];
    int _2282 = _871 * _2256;
    int _2284 = _2282 + _1484;
    int _2286 = abs(_2042);
    float _2288 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    int _2290 = ~_2230;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = _2172 + 8;
    uint _2298 = uint(int(uint(_2296) >> uint(2)));
    uint _2300 = uint(int(uint(int(_2298)) >> uint(2)));
    int _2302 = int(_2298) & 3;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[int(_2300)][_2302];
    int _2306 = int(_2298) + 1;
    uint _2308 = uint(int(uint(_2306) >> uint(2)));
    int _2310 = _2306 & 3;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[int(_2308)][_2310];
    float _2314 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _2288);
    int _2316 = ~_2056;
    int _2318 = _2316 + _2098;
    int _2320 = _2318 + 1;
    float _2322 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _2228);
    float _2324 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2326 = int(_2324);
    int _2328 = abs(_1768);
    int _2330 = ~_2262;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    int _2336 = _2178 + 8;
    uint _2338 = uint(int(uint(_2336) >> uint(2)));
    uint _2340 = uint(int(uint(int(_2338)) >> uint(2)));
    int _2342 = int(_2338) & 3;
    float _2344 = (*spvDescriptorSet0.vp_c9)._m0[int(_2340)][_2342];
    int _2346 = int(_2338) + 1;
    uint _2348 = uint(int(uint(_2346) >> uint(2)));
    int _2350 = _2346 & 3;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[int(_2348)][_2350];
    int _2354 = abs(_2008);
    int _2356 = _930 * _2320;
    int _2358 = _2356 + _1600;
    int _2360 = abs(_2016);
    int _2362 = ~_2286;
    int _2364 = _2362 + 1;
    int _2366 = _2364 + 1;
    int _2368 = ~_2328;
    int _2370 = _2368 + 1;
    int _2372 = _2370 + 1;
    int _2374 = _2294 * as_type<int>(_2194);
    int _2376 = ~_2354;
    int _2378 = _2376 + 1;
    int _2380 = _2378 + 1;
    float _2382 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2384 = int(_2382);
    int _2386 = ~_2360;
    int _2388 = _2386 + 1;
    int _2390 = _2388 + 1;
    int _2392 = _2372 * as_type<int>(_2186);
    int _2394 = _2392 + _2374;
    int _2396 = abs(_1880);
    float _2398 = float(uint(_2326));
    int _2400 = _2334 * as_type<int>(_2218);
    int _2402 = ~_2396;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    float _2408 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2410 = int(_2408);
    int _2412 = abs(_1900);
    int _2414 = _2380 * as_type<int>(_2210);
    int _2416 = _2414 + _2400;
    int _2418 = abs(_1986);
    int _2420 = abs(_2052);
    int _2422 = _2366 * as_type<int>(_2246);
    int _2424 = ~_2418;
    int _2426 = _2424 + 1;
    int _2428 = _2426 + 1;
    int _2430 = abs(_2076);
    int _2432 = _2390 * as_type<int>(_2238);
    int _2434 = _2432 + _2422;
    int _2436 = abs(_2084);
    float _2438 = 1.0 / _2398;
    bool _2440 = !_1442;
    int _2442 = _2440 ? _2358 : (-1);
    int _2444 = _2406 * as_type<int>(_2272);
    int _2446 = _2444 + _2394;
    int _2448 = ~_2436;
    int _2450 = _2448 + 1;
    int _2452 = _2450 + 1;
    int _2454 = ~_2420;
    int _2456 = _2454 + 1;
    int _2458 = _2456 + 1;
    int _2460 = abs(_2002);
    int _2462 = _2428 * as_type<int>(_2304);
    int _2464 = _2462 + _2416;
    int _2466 = abs(_2132);
    int _2468 = _2458 * as_type<int>(_2280);
    int _2470 = _2468 + _2446;
    int _2472 = ~_2412;
    int _2474 = _2472 + 1;
    int _2476 = _2474 + 1;
    float _2478 = _968 * 2.0;
    int _2480 = ~_2466;
    int _2482 = _2480 + 1;
    int _2484 = _2482 + 1;
    float _2486 = float(uint(_2410));
    int _2488 = _2452 * as_type<int>(_2344);
    int _2490 = _2488 + _2434;
    int _2492 = abs(_2326);
    int _2494 = _2484 * as_type<int>(_2312);
    int _2496 = _2494 + _2464;
    float _2498 = float(uint(_2384));
    float _2500 = 1.0 / _2486;
    float _2502 = float(uint(_2492));
    int _2504 = _2470 * _2476;
    int _2506 = ~_2460;
    int _2508 = _2506 + 1;
    int _2510 = _2508 + 1;
    int _2512 = abs(_2410);
    int _2514 = _1856 * _2412;
    int _2516 = _2514 + _2504;
    int _2518 = as_type<int>(_2438) + (-2);
    float _2520 = 1.0 / _2502;
    bool _2522 = !_1430;
    int _2524 = _2522 ? _2284 : (-1);
    int _2526 = _2496 * _2510;
    int _2528 = abs(_2384);
    int _2530 = _2524 * _2460;
    int _2532 = _2530 + _2526;
    float _2534 = float(uint(_2512));
    float _2536 = 1.0 / _2498;
    int _2538 = abs(_2032);
    int _2540 = ~_2538;
    int _2542 = _2540 + 1;
    int _2544 = _2542 + 1;
    int _2546 = ~_2430;
    int _2548 = _2546 + 1;
    int _2550 = _2548 + 1;
    float _2552 = 1.0 / _2534;
    int _2554 = as_type<int>(_2500) + (-2);
    float _2556 = float(uint(_2516));
    int _2558 = _2550 * as_type<int>(_2352);
    int _2560 = _2558 + _2490;
    float _2562 = float(uint(_2532));
    float _2564 = float(uint(_2528));
    int _2566 = _2560 * _2544;
    int _2568 = as_type<int>(_2536) + (-2);
    float _2570 = as_type<float>(_2554) * _2562;
    int _2572 = abs(_2516);
    int _2574 = _2442 * _2538;
    int _2576 = _2574 + _2566;
    float _2578 = as_type<float>(_2518) * _2556;
    float _2580 = trunc(_2570);
    float _2582 = precise::max(_2580, 0.0);
    uint _2584 = uint(_2582);
    float _2586 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _2314);
    int _2588 = as_type<int>(_2520) + (-2);
    float _2590 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _2250);
    float _2592 = 1.0 / _2564;
    float _2594 = float(uint(_2572));
    float _2596 = _968 + _970;
    float _2598 = float(uint(_2576));
    int _2600 = abs(_2532);
    float _2602 = as_type<float>(_2588) * _2594;
    int _2604 = ~_2410;
    int _2606 = _2604 + 1;
    float _2608 = trunc(_2578);
    float _2610 = precise::max(_2608, 0.0);
    uint _2612 = uint(_2610);
    float _2614 = as_type<float>(_2568) * _2598;
    int _2616 = as_type<int>(_2552) + (-2);
    float _2618 = _2596 + (-1.0);
    float _2620 = float(uint(_2600));
    int _2622 = _2606 * int(_2584);
    int _2624 = _2622 + _2532;
    int _2626 = ~_2326;
    int _2628 = _2626 + 1;
    float _2630 = trunc(_2614);
    float _2632 = precise::max(_2630, 0.0);
    uint _2634 = uint(_2632);
    float _2636 = as_type<float>(_2616) * _2620;
    int _2638 = as_type<int>(_2592) + (-2);
    float _2640 = float(uint(_2624));
    int _2642 = ~_2492;
    int _2644 = _2642 + 1;
    float _2646 = trunc(_2602);
    float _2648 = precise::max(_2646, 0.0);
    uint _2650 = uint(_2648);
    int _2652 = abs(_2576);
    int _2654 = _2628 * int(_2612);
    int _2656 = _2654 + _2516;
    float _2658 = float(uint(_2652));
    float _2660 = float(uint(_2656));
    float _2662 = trunc(_2636);
    float _2664 = precise::max(_2662, 0.0);
    uint _2666 = uint(_2664);
    float _2668 = fma(_2618, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2670 = as_type<float>(_2638) * _2658;
    float _2672 = as_type<float>(_2554) * _2640;
    float _2674 = as_type<float>(_2518) * _2660;
    int _2676 = ~_2512;
    int _2678 = _2676 + 1;
    float _2680 = _970 + _972;
    float _2682 = floor(_2478);
    int _2684 = _2644 * int(_2650);
    int _2686 = _2684 + _2572;
    float _2688 = _2680 + (-1.0);
    bool _2690 = _970 > 0.5;
    int _2692 = ~_2384;
    int _2694 = _2692 + 1;
    float _2696 = trunc(_2670);
    float _2698 = precise::max(_2696, 0.0);
    uint _2700 = uint(_2698);
    bool _2702 = _972 > 0.5;
    float _2704 = trunc(_2674);
    float _2706 = precise::max(_2704, 0.0);
    uint _2708 = uint(_2706);
    float _2710 = float(uint(_2686));
    int _2712 = _2678 * int(_2666);
    int _2714 = _2712 + _2600;
    bool _2716 = _2682 > 0.0;
    bool _2718 = _2682 >= 0.0;
    bool _2720 = isnan(_2682);
    bool _2722 = _2718 || _2720;
    bool _2724 = isnan(0.0);
    bool _2726 = _2722 || _2724;
    float _2728 = fma(_2688, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2730 = float(uint(_2714));
    float _2732 = trunc(_2672);
    float _2734 = precise::max(_2732, 0.0);
    uint _2736 = uint(_2734);
    float _2738 = as_type<float>(_2588) * _2710;
    int _2740 = ~_2528;
    int _2742 = _2740 + 1;
    float _2744 = -_229;
    int _2746 = _2690 ? as_type<int>(_2744) : as_type<int>(_229);
    float _2748 = as_type<float>(_2616) * _2730;
    bool _2750 = _1024 != 1;
    int _2752 = _2742 * int(_2700);
    int _2754 = _2752 + _2652;
    bool _2756 = !_2138;
    float _2758 = _2756 ? _229 : as_type<float>(_2746);
    float _2760 = trunc(_2738);
    float _2762 = precise::max(_2760, 0.0);
    uint _2764 = uint(_2762);
    bool _2766 = _1026 != 2;
    int _2768 = _2694 * int(_2634);
    int _2770 = _2768 + _2576;
    int _2772 = ~_2326;
    int _2774 = _2772 + 1;
    int _2776 = int(_2612) + int(_2708);
    float _2778 = float(uint(_2754));
    float _2780 = trunc(_2748);
    float _2782 = precise::max(_2780, 0.0);
    uint _2784 = uint(_2782);
    float _2786 = float(uint(_2770));
    int _2788 = int(_2584) + int(_2736);
    float _2790 = as_type<float>(_2638) * _2778;
    int _2792 = _2774 * _2776;
    int _2794 = _2792 + _2516;
    float _2796 = as_type<float>(_2568) * _2786;
    float _2798 = -_225;
    int _2800 = _2702 ? as_type<int>(_2798) : as_type<int>(_225);
    float _2802 = sqrt(_2590);
    int _2804 = ~_2492;
    int _2806 = _2804 + 1;
    bool _2808 = uint(_2794) >= uint(_2326);
    int _2810 = int(_2650) + int(_2764);
    bool _2812 = !_2808;
    int _2814 = _2812 ? 0 : (-1);
    float _2816 = trunc(_2796);
    float _2818 = precise::max(_2816, 0.0);
    uint _2820 = uint(_2818);
    int _2822 = ~_2512;
    int _2824 = _2822 + 1;
    int _2826 = _2806 * _2810;
    int _2828 = _2826 + _2572;
    int _2830 = int(_2666) + int(_2784);
    int _2832 = ~_2776;
    int _2834 = _2832 + _2814;
    int _2836 = _2834 + 1;
    int _2838 = ~_2410;
    int _2840 = _2838 + 1;
    float _2842 = trunc(_2790);
    float _2844 = precise::max(_2842, 0.0);
    uint _2846 = uint(_2844);
    bool _2848 = uint(_2828) >= uint(_2492);
    int _2850 = _2824 * _2830;
    int _2852 = _2850 + _2600;
    bool _2854 = !_2088;
    float _2856 = _2854 ? _225 : as_type<float>(_2800);
    int _2858 = _2326 * _2836;
    int _2860 = _2858 + _2516;
    bool _2862 = _2326 == 0;
    int _2864 = _2840 * _2788;
    int _2866 = _2864 + _2532;
    bool _2868 = !_2848;
    float _2870 = _2868 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2872 = _970 * 2.0;
    int _2874 = int(_2634) + int(_2820);
    float _2876 = sqrt(_2586);
    bool _2878 = _968 > 0.5;
    float _2880 = _2802 * _2200;
    int _2882 = ~_2384;
    int _2884 = _2882 + 1;
    bool _2886 = !_2862;
    int _2888 = _2886 ? _2860 : (-1);
    float _2890 = _2880 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2892 = uint(_2866) >= uint(_2410);
    int _2894 = _2884 * _2874;
    int _2896 = _2894 + _2576;
    float _2898 = -_225;
    int _2900 = _2878 ? as_type<int>(_2898) : as_type<int>(_225);
    float _2902 = floor(_2872);
    bool _2904 = uint(_2852) >= uint(_2512);
    int _2906 = int(_2700) + int(_2846);
    bool _2908 = !_2892;
    float _2910 = _2908 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2912 = _2876 * _2202;
    bool _2914 = !_2904;
    int _2916 = _2914 ? 0 : (-1);
    bool _2918 = uint(_2896) >= uint(_2384);
    int _2920 = ~_2788;
    int _2922 = _2920 + as_type<int>(_2910);
    int _2924 = _2922 + 1;
    bool _2926 = !_2106;
    float _2928 = _2926 ? _225 : as_type<float>(_2900);
    int _2930 = ~_2528;
    int _2932 = _2930 + 1;
    int _2934 = _2410 * _2924;
    int _2936 = _2934 + _2532;
    bool _2938 = _2326 == 0;
    int _2940 = _2532 ^ _2410;
    int _2942 = _2932 * _2906;
    int _2944 = _2942 + _2652;
    int _2946 = _2516 ^ _2326;
    uint _2948 = uint(int(uint(_2940) >> uint(31)));
    uint _2950 = uint(int(uint(_2946) >> uint(31)));
    int _2952 = ~as_type<int>(_2870);
    int _2954 = _2810 + _2952;
    int _2956 = _2954 + 1;
    float _2958 = _972 * 2.0;
    int _2960 = ~_2916;
    int _2962 = _2830 + _2960;
    int _2964 = _2962 + 1;
    int _2966 = ~int(_2948);
    int _2968 = _2966 + 1;
    float _2970 = sqrt(_2322);
    int _2972 = ~int(_2950);
    int _2974 = _2972 + 1;
    float _2976 = as_type<float>(_2516);
    float _2978 = _2870;
    float _2980 = as_type<float>(_2512);
    float _2982 = _2910;
    float _2984 = as_type<float>(_2936);
    if (!_2750)
    {
        _2976 = _970;
    }
    float _2986 = _2976;
    int _2988 = _2964 ^ _2968;
    int _2990 = _2956 ^ _2974;
    float _2992 = floor(_2958);
    float _2994 = _2986;
    if (!_2750)
    {
        _2978 = _972;
    }
    float _2996 = _2978;
    float _2998 = _2996;
    if (!_2750)
    {
        _2980 = _972;
    }
    float _3000 = _2980;
    float _3002 = _3000;
    if (!_2750)
    {
        _2982 = _2986;
    }
    float _3004 = _2982;
    float _3006 = _3004;
    if (_2750)
    {
        _3006 = _968;
    }
    float _3008 = _3006;
    float _3010 = _2970 * _2122;
    if (_2750)
    {
        _2994 = _968;
    }
    float _3012 = _2994;
    if (_2750)
    {
        _2998 = _970;
    }
    float _3014 = _2998;
    float _3016 = _3008 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2750)
    {
        _3002 = _970;
    }
    float _3018 = _3002;
    bool _3020 = _2410 == 0;
    float _3022 = _3014 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _3024 = _2410 == 0;
    float _3026 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3028 = _839 + _3026;
    int _3030 = ~_2968;
    int _3032 = _3030 + _2988;
    int _3034 = _3032 + 1;
    float _3036 = _2880 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3038 = !_2918;
    int _3040 = _3038 ? 0 : (-1);
    float _3042 = fma(_2248, _3028, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _3044 = ~_2974;
    int _3046 = _3044 + _2990;
    int _3048 = _3046 + 1;
    bool _3050 = !_3020;
    int _3052 = _3050 ? _2936 : (-1);
    bool _3054 = !_3024;
    int _3056 = _3054 ? _3034 : (-1);
    int _3058 = ~_2874;
    int _3060 = _3058 + _3040;
    int _3062 = _3060 + 1;
    bool _3064 = !_2938;
    int _3066 = _3064 ? _3048 : (-1);
    int _3068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3070 = _3068 != 0;
    int _3072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3074 = _3072 != 0;
    int _3076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3078 = _3076 != 0;
    bool _3080 = uint(_2944) >= uint(_2528);
    bool _3082 = _839 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3084 = isnan(_839);
    bool _3086 = _3082 || _3084;
    bool _3088 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3090 = _3086 || _3088;
    float _3092 = float(_3090);
    bool _3094 = _839 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3096 = isnan(_839);
    bool _3098 = _3094 || _3096;
    bool _3100 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3102 = _3098 || _3100;
    float _3104 = float(_3102);
    int _3106 = _2384 * _3062;
    int _3108 = _3106 + _2576;
    bool _3110 = !_3080;
    int _3112 = _3110 ? 0 : (-1);
    bool _3114 = _2384 == 0;
    float _3116 = -_3104;
    float _3118 = _3116 + 1.0;
    if (_2766)
    {
        _2984 = _968;
    }
    float _3120 = _2984;
    float _3122 = _3120;
    if (_2766)
    {
        _1780 = _970;
    }
    float _3124 = _1780;
    float _3126 = _3092 * _3118;
    float _3128 = _3124;
    if (!_2766)
    {
        _3122 = _972;
    }
    float _3130 = _3122;
    float _3132 = -_3092;
    float _3134 = _3132 + 1.0;
    if (!_2766)
    {
        _3128 = _968;
    }
    float _3136 = _3128;
    float _3138 = _3042 * _3126;
    bool _3140 = _2992 >= 0.0;
    bool _3142 = isnan(_2992);
    bool _3144 = _3140 || _3142;
    bool _3146 = isnan(0.0);
    bool _3148 = _3144 || _3146;
    float _3150 = _2880 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3152 = !_3114;
    int _3154 = _3152 ? _3108 : (-1);
    float _3156 = fma(_3134, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3138);
    bool _3158 = !_3070;
    int _3160 = _3158 ? 0 : 1;
    float _3162 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2890);
    bool _3164 = _2902 > 0.0;
    float _3166 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3150);
    bool _3168 = _2902 >= 0.0;
    bool _3170 = isnan(_2902);
    bool _3172 = _3168 || _3170;
    bool _3174 = isnan(0.0);
    bool _3176 = _3172 || _3174;
    float _3178 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3036);
    int _3180 = _3148 ? 0 : 1;
    float _3182 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3166);
    bool _3184 = _2992 > 0.0;
    float _3186 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3178);
    int _3188 = ~_3180;
    int _3190 = _3188 + 1;
    int _3192 = _3190 + 1;
    int _3194 = ~_3112;
    int _3196 = _2906 + _3194;
    int _3198 = _3196 + 1;
    float _3200 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3202 = float(_2888);
    int _3204 = _3192;
    if (!_3184)
    {
        int _3206 = ~_3180;
        int _3208 = _3206 + 1;
        _3204 = _3208;
    }
    int _3210 = _3204;
    float _3212 = fma(_3104, (*spvDescriptorSet0.vp_c9)._m0[132].x, _3156);
    float _3214 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3216 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3162);
    float _3218 = _2198 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    bool _3220 = _2384 == 0;
    float _3222 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3224 = _2576 ^ _2384;
    float _3226 = _3130 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3228 = _3200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3230 = _3214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3232 = _3222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3234 = _3212 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3236 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[24].w, _3216);
    float _3238 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[25].w, _3182);
    float _3240 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[26].w, _3186);
    out.m_74.x = _3228;
    out.m_74.y = _3230;
    out.m_74.z = _3232;
    out.m_74.w = _3234;
    uint _3242 = uint(int(uint(_3224) >> uint(31)));
    float _3244 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3248 = ~int(_3242);
    int _3250 = _3248 + 1;
    float _3252 = -_3244;
    float _3254 = fma(_3226, 2.0, _3252);
    float _3256 = float(_3210);
    int _3258 = _3198 ^ _3250;
    float _3260 = -_149;
    float _3262 = fma(_3260, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3254);
    float _3264 = float(_3052);
    float _3266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3268 = ~_3250;
    int _3270 = _3268 + _3258;
    int _3272 = _3270 + 1;
    float _3274 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3276 = fma(_3012, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3274);
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3280 = _3238 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _3282 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _3284 = abs(_3160);
    float _3286 = fma(_3018, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3278);
    float _3288 = _3236 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _3290 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3292 = _3280 + _3290;
    float _3294 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3296 = _3240 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _3298 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3300 = _3288 + _3298;
    float _3302 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3304 = -_3282;
    float _3306 = fma(_3016, 2.0, _3304);
    float _3308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3312 = _3296 + _3310;
    float _3314 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3302);
    float _3316 = _3136 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3318 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3320 = float(_3284);
    float _3322 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3314);
    float _3324 = fma(_3316, -2.0, _3294);
    float _3326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3328 = fma(_3022, -2.0, _3318);
    bool _3330 = !_3220;
    int _3332 = _3330 ? _3272 : (-1);
    float _3334 = _3320 * _3256;
    bool _3336 = _3322 >= 0.0;
    float _3338 = _3246 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3340 = _3266 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3342 = -_149;
    float _3344 = fma(_3342, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3306);
    float _3346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3348 = _3308 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3350 = float(_3154);
    float _3352 = fma(_3338, _3202, _2260);
    float _3354 = fma(_3340, _3264, _3344);
    float _3356 = _2928 + 0.5;
    float _3358 = float(_3066);
    float _3360 = fma(_3348, _3350, _3262);
    float _3362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3364 = _3326 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3366 = _1128 + 0.5;
    float _3368 = fma(_3338, _3356, _3352);
    float _3370 = float(_3056);
    float _3372 = -_2160;
    float _3374 = fma(_3364, _3358, _3372);
    float _3376 = fma(_3348, _3366, _3360);
    float _3378 = _3346 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3380 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3328);
    float _3382 = float(_3332);
    float _3384 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3324);
    float _3386 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3388 = -_3380;
    float _3390 = fma(_3378, _3370, _3388);
    float _3392 = _2758 + (-0.5);
    float _3394 = _3362 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3396 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3386);
    float _3398 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3276);
    float _3400 = -_3364;
    float _3402 = fma(_3400, _3392, _3374);
    float _3404 = -_3384;
    float _3406 = fma(_3394, _3382, _3404);
    float _3408 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3410 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3396);
    float _3412 = _2856 + 0.5;
    float _3414 = _1348 + (-0.5);
    float _3416 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3408);
    float _3418 = -_3398;
    float _3420 = _3418 + 1.0;
    float _3422 = fma(_3340, _3412, _3354);
    float _3424 = -_3378;
    float _3426 = fma(_3424, _3414, _3390);
    float _3428 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3416);
    float _3430 = -_3420;
    float _3432 = fma(_2856, _3430, _3422);
    float _3434 = -_3410;
    float _3436 = _3434 + 1.0;
    float _3438 = -_3428;
    float _3440 = _3438 + 1.0;
    float _3442 = _1164 + (-0.5);
    float _3444 = -_3436;
    float _3446 = fma(_2928, _3444, _3368);
    float _3448 = fma(_2758, _3440, _3402);
    float _3450 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3452 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3454 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3456 = log2(_3454);
    float _3458 = _3292 * _3292;
    float _3460 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3450);
    float _3462 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3452);
    float _3464 = -_3394;
    float _3466 = fma(_3464, _3442, _3406);
    float _3468 = fma(_3300, _3300, _3458);
    float _3470 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3460);
    float _3472 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3462);
    float _3474 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3286);
    float _3476 = fma(_3312, _3312, _3468);
    float _3478 = -_3470;
    float _3480 = _3478 + 1.0;
    float _3482 = -_3472;
    float _3484 = _3482 + 1.0;
    float _3486 = -_3474;
    float _3488 = _3486 + 1.0;
    float _3490 = _3468;
    if (_3336)
    {
        _3490 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3492 = _3490;
    float _3494 = fma(_1164, _3480, _3466);
    float _3496 = -_3484;
    float _3498 = fma(_1128, _3496, _3376);
    float _3500 = in.m_76.x;
    float _3502 = in.m_76.y;
    float _3504 = in.m_76.z;
    float _3506 = rsqrt(_3476);
    float _3508 = _3456 * _149;
    float _3510 = fma(_1348, _3488, _3426);
    float _3512 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3514 = 1.0 + _3512;
    int _3516 = as_type<int>(_3492);
    if (_3336)
    {
        float _3518 = _3492 * 5.0;
        _3516 = as_type<int>(_3518);
    }
    int _3520 = _3516;
    out.m_78.x = _3498;
    out.m_78.y = _3494;
    bool _3522 = !_3074;
    int _3524 = _3522 ? 0 : 1;
    float _3526 = exp2(_3508);
    bool _3528 = !_3078;
    int _3530 = _3528 ? 0 : 1;
    if (_3336)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10571 = as_type<float>(_3520);
        out.gl_Position.z = _10571;
    }
    bool _3532 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3534 = isnan(0.0);
    bool _3536 = _3532 || _3534;
    bool _3538 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3540 = _3536 || _3538;
    bool _3542 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3544 = isnan(1.0);
    bool _3546 = _3542 || _3544;
    bool _3548 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3550 = _3546 || _3548;
    out.m_80.x = _3446;
    out.m_80.y = _3448;
    out.m_80.z = _3432;
    out.m_80.w = _3510;
    float _3552 = 1.0 / _3514;
    float _3554 = _3292 * _3506;
    if (_3336)
    {
        out.m_61.x = 0.0;
    }
    float _3556 = _3300 * _3506;
    if (_3336)
    {
        return out;
    }
    float _3558 = -_3554;
    float _3560 = fma(_3558, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3280);
    float _3562 = -_3526;
    float _3564 = _3562 + 1.0;
    float _3566 = _3312 * _3506;
    float _3568 = -_3556;
    float _3570 = fma(_3568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3288);
    float _3572 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3574 = _3560 + _3572;
    int _3576 = _2726 ? 0 : 1;
    float _3578 = -_3566;
    float _3580 = fma(_3578, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3296);
    float _3582 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3584 = _3570 + _3582;
    float _3586 = _3574 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3588 = ~_3576;
    int _3590 = _3588 + 1;
    int _3592 = _3590 + 1;
    float _3594 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3596 = _3580 + _3594;
    int _3598 = _3592;
    float _3600 = _3566;
    if (!_2716)
    {
        int _3602 = ~_3576;
        int _3604 = _3602 + 1;
        _3598 = _3604;
    }
    int _3606 = _3598;
    float _3608 = _3334 * (-2.0);
    float _3610 = fma(_3584, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3586);
    int _3612 = abs(_3524);
    float _3614 = -_3554;
    float _3616 = fma(_3614, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3292);
    float _3618 = _3540 ? _3564 : 0.0;
    float _3620 = fma(_2668, _3608, _2668);
    float _3622 = fma(_3608, _3500, _3500);
    float _3624 = fma(_3596, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3610);
    if (_3550)
    {
        float _3626 = _3618 * _3552;
        _153 = _3626;
    }
    float _3628 = _153;
    float _3630 = -_3556;
    float _3632 = fma(_3630, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3300);
    float _3634 = _3616 * _3616;
    float _3636 = _968 + (-0.5);
    float _3638 = float(_3606);
    float _3640 = -_3566;
    float _3642 = fma(_3640, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3312);
    float _3644 = float(_3612);
    float _3646 = fma(_3632, _3632, _3634);
    bool _3648 = _3624 >= 0.0;
    float _3650 = fma(_3636, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3622);
    int _3652 = _3176 ? 0 : 1;
    float _3654 = _3644 * _3638;
    float _3656 = fma(_3642, _3642, _3646);
    float _3658 = fma(_3620, _3628, _3650);
    int _3660 = ~_3652;
    int _3662 = _3660 + 1;
    int _3664 = _3662 + 1;
    float _3666 = _3654 * (-2.0);
    int _3668 = _3664;
    float _3670 = _3638;
    if (!_3164)
    {
        int _3672 = ~_3652;
        int _3674 = _3672 + 1;
        _3668 = _3674;
    }
    int _3676 = _3668;
    float _3678 = _3658 * 0.15915493667125701904296875;
    float _3680 = sqrt(_3656);
    float _3682 = fma(_2728, _3666, _2728);
    float _3684 = fma(_3666, _3502, _3502);
    if (_3648)
    {
        _3670 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3686 = _3670;
    int _3688 = as_type<int>(_3686);
    if (_3648)
    {
        out.m_61.x = 0.0;
    }
    float _3690 = _970 + (-0.5);
    int _3692 = abs(_3530);
    float _3694 = _3678 * 6.283185482025146484375;
    float _3696 = sin(_3694);
    if (_3648)
    {
        float _3698 = _3686 * 5.0;
        _3688 = as_type<int>(_3698);
    }
    int _3700 = _3688;
    if (_3648)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10848 = as_type<float>(_3700);
        out.gl_Position.z = _10848;
    }
    if (_3648)
    {
        return out;
    }
    float _3702 = -_3280;
    float _3704 = _3702 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3706 = -_3288;
    float _3708 = _3706 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3710 = float(_3676);
    float _3712 = -_3296;
    float _3714 = _3712 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3716 = _3704 * _3704;
    float _3718 = float(_3692);
    float _3720 = _968 + _972;
    float _3722 = fma(_3690, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3684);
    float _3724 = fma(_3708, _3708, _3716);
    float _3726 = _972 + (-0.5);
    float _3728 = _3718 * _3710;
    float _3730 = fma(_3714, _3714, _3724);
    float _3732 = _3720 + (-1.0);
    float _3734 = _3728 * (-2.0);
    float _3736 = fma(_3682, _3628, _3722);
    float _3738 = _3678 * 6.283185482025146484375;
    float _3740 = cos(_3738);
    float _3742 = fma(_3732, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3744 = fma(_3734, _3504, _3504);
    float _3746 = _3736 * 0.15915493667125701904296875;
    float _3748 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3750 = fma(_3742, _3734, _3742);
    float _3752 = fma(_3726, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3744);
    float _3754 = rsqrt(_3730);
    float _3756 = fma(_3750, _3628, _3752);
    float _3758 = _3756 * 0.15915493667125701904296875;
    float _3760 = _3746 * 6.283185482025146484375;
    float _3762 = sin(_3760);
    float _3764 = _3708 * _3754;
    float _3766 = _3714 * _3754;
    float _3768 = _3704 * _3754;
    float _3770 = _3746 * 6.283185482025146484375;
    float _3772 = cos(_3770);
    float _3774 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3776 = _3764 * _3774;
    float _3778 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3780 = _3766 * _3778;
    float _3782 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3784 = _3768 * _3782;
    float _3786 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3788 = -_3776;
    float _3790 = fma(_3766, _3786, _3788);
    float _3792 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3794 = -_3780;
    float _3796 = fma(_3768, _3792, _3794);
    float _3798 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3800 = -_3784;
    float _3802 = fma(_3764, _3798, _3800);
    float _3804 = _3758 * 6.283185482025146484375;
    float _3806 = sin(_3804);
    float _3808 = _3790 * _3790;
    float _3810 = _3696 * _3762;
    float _3812 = _3740 * _3762;
    float _3814 = fma(_3796, _3796, _3808);
    float _3816 = _3506 * _3680;
    float _3818 = _3758 * 6.283185482025146484375;
    float _3820 = cos(_3818);
    float _3822 = fma(_3802, _3802, _3814);
    float _3824 = _3740 * _3772;
    float _3826 = _693 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _229);
    float _3830 = _229 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3832 = _3816 * _3826;
    float _3834 = rsqrt(_3822);
    float _3836 = fma(_3806, _3824, _3810);
    float _3838 = fma(_3806, _3810, _3824);
    float _3840 = _3696 * _3772;
    float _3842 = _3740 * _3820;
    float _3844 = _3816 * _3748;
    float _3846 = _3772 * _3820;
    float _3848 = _3696 * _3820;
    float _3850 = _3762 * _3820;
    float _3852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _225);
    float _3854 = _3828 * _3844;
    float _3856 = -_3812;
    float _3858 = fma(_3806, _3840, _3856);
    float _3860 = _3796 * _3834;
    float _3862 = _3852 * _3832;
    float _3864 = _3790 * _3834;
    float _3866 = _3802 * _3834;
    float _3868 = _3842 * _3854;
    float _3870 = -_3840;
    float _3872 = fma(_3806, _3812, _3870);
    float _3874 = -_3854;
    float _3876 = _3806 * _3874;
    float _3878 = _3848 * _3854;
    float _3880 = fma(_3836, _3862, _3868);
    float _3882 = _3816 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3884 = _3882 * 0.5;
    float _3886 = _3766 * _3864;
    float _3888 = _3768 * _3860;
    float _3890 = fma(_3846, _3862, _3876);
    float _3892 = fma(_3872, _3884, _3880);
    float _3894 = -_3886;
    float _3896 = fma(_3768, _3866, _3894);
    float _3898 = -_3888;
    float _3900 = fma(_3764, _3864, _3898);
    float _3902 = fma(_3858, _3862, _3878);
    float _3904 = fma(_3850, _3884, _3890);
    float _3906 = _3896 * _3892;
    float _3908 = _3900 * _3892;
    float _3910 = fma(_3838, _3884, _3902);
    float _3912 = _3764 * _3866;
    float _3914 = fma(_3860, _3904, _3906);
    float _3916 = fma(_3866, _3904, _3908);
    float _3918 = _3836 * _3900;
    float _3920 = -_3912;
    float _3922 = fma(_3766, _3860, _3920);
    float _3924 = fma(_3764, _3910, _3914);
    float _3926 = fma(_3766, _3910, _3916);
    float _3928 = _3836 * _3896;
    float _3930 = _3836 * _3922;
    float _3932 = _3288 + _3924;
    float _3934 = _3296 + _3926;
    float _3936 = _3842 * _3896;
    float _3938 = _3842 * _3922;
    float _3940 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3942 = _3932 + _3940;
    float _3944 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3946 = _3934 + _3944;
    float _3948 = _3842 * _3900;
    float _3950 = _3872 * _3896;
    float _3952 = _3942 * _3942;
    float _3954 = _3946 * _3946;
    float _3956 = _3872 * _3900;
    float _3958 = _3872 * _3922;
    float _3960 = fma(_3846, _3860, _3928);
    float _3962 = _3952 + _3954;
    float _3964 = fma(_3846, _3864, _3930);
    float _3966 = fma(_3846, _3866, _3918);
    float _3968 = fma(_3830, _3830, 1.0);
    float _3970 = sqrt(_3962);
    float _3972 = _3922 * _3892;
    float _3974 = -_3806;
    float _3976 = fma(_3974, _3864, _3938);
    float _3978 = -_3806;
    float _3980 = fma(_3978, _3866, _3948);
    float _3982 = fma(_3850, _3864, _3958);
    float _3984 = fma(_3864, _3904, _3972);
    float _3986 = -_3806;
    float _3988 = fma(_3986, _3860, _3936);
    float _3990 = fma(_3850, _3860, _3950);
    float _3992 = rsqrt(_3968);
    float _3994 = fma(_3768, _3910, _3984);
    float _3996 = fma(_3850, _3866, _3956);
    float _3998 = _3280 + _3994;
    bool _4000 = _3970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4002 = _3950;
    float _4004 = _3864;
    float _4006 = _3860;
    float _4008 = _3952;
    float _4010 = _3954;
    uint _4012 = as_type<uint>(_3816);
    if (!_4000)
    {
        _4002 = _3932;
    }
    float _4014 = _4002;
    float _4016 = _4014;
    if (!_4000)
    {
        _4004 = _3934;
    }
    float _4018 = _4004;
    float _4020 = _4018;
    if (!_4000)
    {
        _4006 = _3998;
    }
    float _4022 = _4006;
    bool _4024 = !_4000;
    float _4026 = _4022;
    if (!_4024)
    {
        float _4028 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4030 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4032 = _3970 + _4030;
        float _4034 = rsqrt(_3962);
        float _4036 = _4032 * _4028;
        float _4038 = _3998 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4040 = _4036 * 0.15915493667125701904296875;
        float _4042 = _4040 * 6.283185482025146484375;
        float _4044 = sin(_4042);
        float _4046 = _4040 * 6.283185482025146484375;
        float _4048 = cos(_4046);
        float _4050 = fma(_4044, _4038, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4052 = _4034 * _4050;
        float _4054 = fma(_3942, _4052, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4056 = _4048 + (-1.0);
        float _4058 = fma(_3946, _4052, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4060 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4062 = _4054 + _4060;
        float _4064 = _4056 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4066 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4068 = _4058 + _4066;
        float _4070 = _4062 * _4062;
        float _4072 = fma(_3998, _4048, _4064);
        float _4074 = _4068 * _4068;
        _4026 = _4072;
        _4008 = _4070;
        _4010 = _4074;
        _4016 = _4054;
        _4020 = _4058;
    }
    float _4076 = _4026;
    float _4078 = _4008;
    float _4080 = _4010;
    float _4082 = _4016;
    float _4084 = _4020;
    float _4086 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4088 = _4076 + _4086;
    float _4090 = fma(_3848, _3764, _3988);
    float _4092 = fma(_3848, _3768, _3976);
    float _4094 = fma(_3848, _3766, _3980);
    float _4096 = fma(_4088, _4088, _4078);
    float _4098 = fma(_3838, _3764, _3990);
    float _4100 = fma(_3838, _3768, _3982);
    float _4102 = fma(_3838, _3766, _3996);
    float _4104 = _4096 + _4080;
    float _4106 = _3830 * _3992;
    float _4108 = fma(_3858, _3764, _3960);
    float _4110 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4112 = _3830 * _4090;
    float _4114 = fma(_3858, _3768, _3964);
    float _4116 = _3830 * _4092;
    float _4118 = fma(_3858, _3766, _3966);
    float _4120 = _3830 * _4094;
    float _4122 = -_4098;
    float _4124 = _4106 * _4122;
    float _4126 = -_4100;
    float _4128 = _4106 * _4126;
    float _4130 = -_4102;
    float _4132 = _4106 * _4130;
    float _4134 = fma(_4110, _4108, _4112);
    float _4136 = sqrt(_4104);
    float _4138 = fma(_4110, _4114, _4116);
    float _4140 = fma(_4110, _4118, _4120);
    float _4142 = fma(_3992, _4090, _4124);
    float _4144 = fma(_3992, _4092, _4128);
    float _4146 = _4100 + _4138;
    float _4148 = fma(_3992, _4094, _4132);
    float _4150 = _4098 + _4134;
    float _4152 = _4102 + _4140;
    out.m_82.x = _4108;
    out.m_82.y = _4114;
    out.m_82.z = _4118;
    out.m_84.x = _4142;
    out.m_84.y = _4144;
    out.m_84.z = _4148;
    bool _4154 = _4136 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4156 = isnan(_4136);
    bool _4158 = _4154 || _4156;
    bool _4160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4162 = _4158 || _4160;
    out.m_86.x = _4150;
    out.m_86.y = _4146;
    out.m_86.z = _4152;
    float _4164 = _4080;
    if (!_4162)
    {
        _4164 = 1.0;
    }
    float _4166 = _4164;
    bool _4168 = !_4162;
    float _4170 = _4166;
    if (!_4168)
    {
        bool _4172 = _4136 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4174 = isnan(_4136);
        bool _4176 = _4172 || _4174;
        bool _4178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4180 = _4176 || _4178;
        if (!_4180)
        {
            float _4182 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4184 = _4136 + _4182;
            float _4186 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4188 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4186;
            float _4190 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4192 = _4190 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4194 = 1.0 / _4188;
            float _4196 = _4184 * _4194;
            float _4198 = fma(_4196, _4192, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4170 = _4198;
            _4200 = true;
        }
        else
        {
            bool _4202 = _4136 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4204 = isnan(_4136);
            bool _4206 = _4202 || _4204;
            bool _4208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4210 = _4206 || _4208;
            if (!_4210)
            {
                float _4212 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4214 = _4136 + _4212;
                float _4216 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4218 = _4216 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4220 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4222 = _4220 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4224 = 1.0 / _4218;
                float _4226 = _4214 * _4224;
                float _4228 = fma(_4226, _4222, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4170 = _4228;
                _4200 = true;
            }
            else
            {
                _4170 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4200 = false;
    float _4230 = _4170;
    float _4232 = fma(_3570, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4234 = fma(_3580, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4236 = floor(_4232);
    float _4238 = floor(_4234);
    float _4240 = -_4236;
    float _4242 = _4232 + _4240;
    float _4244 = -_4238;
    float _4246 = _4234 + _4244;
    float2 _11737 = float2(_4242, _4246);
    float _4248 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11737, float2(0.0), isnan(_11737)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11737, float2(0.0), isnan(_11737)), level(0.0)).x;
    float _4250 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4252 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4254 = _4082 + _4252;
    float _4256 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4250);
    float _4258 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4260 = _4084 + _4258;
    float _4262 = fma(_4254, _4230, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _4264 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4266 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4268 = _4264 || _4266;
    bool _4270 = isnan(0.5);
    bool _4272 = _4268 || _4270;
    float _4274 = fma(_3580, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4256);
    float _4276 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4278 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4280 = _4076 + _4278;
    float _4282 = _4274 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4284 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4276);
    float _4286 = fma(_4260, _4230, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4288 = -_3556;
    float _4290 = fma(_4288, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4262);
    float _4292 = 1.0 / _4282;
    float _4294 = fma(_3580, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4284);
    float _4296 = fma(_4280, _4230, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4298 = -_3566;
    float _4300 = fma(_4298, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4286);
    int _4302 = 2;
    float _4304 = _4300;
    int _4306 = as_type<int>(_4290);
    if (_4272)
    {
        _3600 = _4290;
    }
    float _4308 = _3600;
    float _4310 = _4294 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4312 = -_3554;
    float _4314 = fma(_4312, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4296);
    float _4316 = _4310 + _4282;
    float _4318 = _4316 * _4292;
    float _4320 = _4318 * 0.5;
    float _4322 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4324 = fma(_4320, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4322);
    float _4326 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _4328 = 1.0 / _4324;
    float _4330 = _3560 + _4326;
    float _4332 = _4330 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4334 = fma(_3570, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4332);
    float _4336 = fma(_3580, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4334);
    float _4338 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4340 = _4328 * _4338;
    float _4342 = _4330 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4344 = _4336 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _4346 = _4340 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4348 = fma(_3570, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4342);
    bool _4350 = _4340 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4352 = trunc(_4344);
    int _4354 = int(_4352);
    bool _4356 = !_4346;
    int _4358 = _4356 ? 0 : 1;
    float _4360 = fma(_3580, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4348);
    float _4362 = _4360 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _4364 = _4314;
    float _4366 = _4308;
    if (!_4346)
    {
        _4302 = 1;
    }
    int _4368 = _4302;
    float _4370 = trunc(_4362);
    int _4372 = int(_4370);
    int _4374 = _4368;
    if (!_4350)
    {
        _4374 = _4358;
    }
    int _4376 = _4374;
    int _4378 = _4376 << 6;
    int _4380 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4382 = _4354 + _4380;
    int _4384 = _4382 + 1;
    int _4386 = _4378 + 48;
    uint _4388 = uint(int(uint(_4386) >> uint(2)));
    uint _4390 = uint(int(uint(int(_4388)) >> uint(2)));
    int _4392 = int(_4388) & 3;
    float _4394 = (*spvDescriptorSet0.vp_c15)._m0[int(_4390)][_4392];
    int _4396 = int(_4388) + 1;
    uint _4398 = uint(int(uint(_4396) >> uint(2)));
    int _4400 = _4396 & 3;
    float _4402 = (*spvDescriptorSet0.vp_c15)._m0[int(_4398)][_4400];
    bool _4404 = _4384 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4406 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4408 = _4372 + _4406;
    int _4410 = _4408 + 1;
    int _4412 = _4378 + 56;
    uint _4414 = uint(int(uint(_4412) >> uint(2)));
    uint _4416 = uint(int(uint(int(_4414)) >> uint(2)));
    int _4418 = int(_4414) & 3;
    float _4420 = (*spvDescriptorSet0.vp_c15)._m0[int(_4416)][_4418];
    int _4422 = int(_4414) + 1;
    uint _4424 = uint(int(uint(_4422) >> uint(2)));
    int _4426 = _4422 & 3;
    float _4428 = (*spvDescriptorSet0.vp_c15)._m0[int(_4424)][_4426];
    int _4430 = _4384 | _4410;
    bool _4432 = _4430 < 0;
    bool _4434 = _4432 || _4404;
    int _4436 = _4378 + 64;
    uint _4438 = uint(int(uint(_4436) >> uint(2)));
    uint _4440 = uint(int(uint(int(_4438)) >> uint(2)));
    int _4442 = int(_4438) & 3;
    float _4444 = (*spvDescriptorSet0.vp_c15)._m0[int(_4440)][_4442];
    int _4446 = int(_4438) + 1;
    uint _4448 = uint(int(uint(_4446) >> uint(2)));
    int _4450 = _4446 & 3;
    float _4452 = (*spvDescriptorSet0.vp_c15)._m0[int(_4448)][_4450];
    bool _4454 = _4410 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4456 = _4454 || _4434;
    int _4458 = _4378 + 72;
    uint _4460 = uint(int(uint(_4458) >> uint(2)));
    uint _4462 = uint(int(uint(int(_4460)) >> uint(2)));
    int _4464 = int(_4460) & 3;
    float _4466 = (*spvDescriptorSet0.vp_c15)._m0[int(_4462)][_4464];
    int _4468 = int(_4460) + 1;
    uint _4470 = uint(int(uint(_4468) >> uint(2)));
    int _4472 = _4468 & 3;
    float _4474 = (*spvDescriptorSet0.vp_c15)._m0[int(_4470)][_4472];
    int _4476 = _4378 + 96;
    uint _4478 = uint(int(uint(_4476) >> uint(2)));
    uint _4480 = uint(int(uint(int(_4478)) >> uint(2)));
    int _4482 = int(_4478) & 3;
    float _4484 = (*spvDescriptorSet0.vp_c15)._m0[int(_4480)][_4482];
    int _4486 = int(_4478) + 1;
    uint _4488 = uint(int(uint(_4486) >> uint(2)));
    int _4490 = _4486 & 3;
    float _4492 = (*spvDescriptorSet0.vp_c15)._m0[int(_4488)][_4490];
    int _4494 = _4378 + 104;
    uint _4496 = uint(int(uint(_4494) >> uint(2)));
    uint _4498 = uint(int(uint(int(_4496)) >> uint(2)));
    int _4500 = int(_4496) & 3;
    float _4502 = (*spvDescriptorSet0.vp_c15)._m0[int(_4498)][_4500];
    int _4504 = int(_4496) + 1;
    uint _4506 = uint(int(uint(_4504) >> uint(2)));
    int _4508 = _4504 & 3;
    float _4510 = (*spvDescriptorSet0.vp_c15)._m0[int(_4506)][_4508];
    float _4512 = as_type<float>(_4376);
    if (!_4272)
    {
        float _4514 = _3574 * _3574;
        float _4516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4518 = -_3296;
        float _4520 = _4518 + _4286;
        float _4522 = -_3280;
        float _4524 = _4522 + _4296;
        float _4526 = fma(_3584, _3584, _4514);
        float _4528 = fma(_3596, _3596, _4526);
        float _4530 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4532 = sqrt(_4528);
        float _4534 = 1.0 / _3816;
        float _4536 = _4530 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4538 = precise::min(_4532, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4540 = _4538 * _4516;
        float _4542 = -_3288;
        float _4544 = _4542 + _4262;
        float _4546 = _4540 * _4534;
        float _4548 = _4536 * _4546;
        float _4550 = _4520 * _4546;
        float _4552 = fma(_4524, _4548, _3560);
        float _4554 = fma(_4544, _4548, _3570);
        float _4556 = fma(_4536, _4550, _3580);
        _4364 = _4552;
        _4366 = _4554;
        _4012 = as_type<uint>(_4534);
        _4304 = _4556;
    }
    float _4558 = _4364;
    float _4560 = _4366;
    uint _4562 = _4012;
    float _4564 = _4304;
    float _4566 = _4330 * _4492;
    float _4568 = _4558 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    uint _4570 = _4562;
    int _4572 = as_type<int>(_4568);
    if (!_4456)
    {
        int _4574 = _4410 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4576 = _4574 + _4384;
        _4570 = uint(_4576);
    }
    uint _4578 = _4570;
    float _4580 = _4330 * _4452;
    float _4582 = fma(_3570, _4484, _4566);
    float _4584 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4568);
    float _4586 = _4330 * _4402;
    int _4588 = as_type<int>(_4582);
    if (!_4456)
    {
        uint _4590 = uint(int(uint(int(_4578)) >> uint(2)));
        _4572 = int(_4590);
    }
    int _4592 = _4572;
    float _4594 = fma(_3580, _4502, _4582);
    float _4596 = fma(_4564, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4584);
    if (!_4456)
    {
        int _4598 = int(_4578) << 2;
        _4588 = _4598;
    }
    int _4600 = _4588;
    float _4602 = fma(_3570, _4394, _4586);
    float _4604 = _4594 + _4510;
    int _4606 = _4378 + 80;
    uint _4608 = uint(int(uint(_4606) >> uint(2)));
    uint _4610 = uint(int(uint(int(_4608)) >> uint(2)));
    int _4612 = int(_4608) & 3;
    float _4614 = (*spvDescriptorSet0.vp_c15)._m0[int(_4610)][_4612];
    int _4616 = int(_4608) + 1;
    uint _4618 = uint(int(uint(_4616) >> uint(2)));
    int _4620 = _4616 & 3;
    float _4622 = (*spvDescriptorSet0.vp_c15)._m0[int(_4618)][_4620];
    int _4624 = _4600;
    if (!_4456)
    {
        int _4626 = 12 & _4600;
        _4624 = _4626;
    }
    int _4628 = _4624;
    float _4630 = fma(_3570, _4444, _4580);
    float _4632 = fma(_3580, _4420, _4602);
    float _4634 = _4596 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4636 = 1.0 / _4604;
    if (!_4456)
    {
        int _4638 = _4592 << 4;
        int _4640 = _4638 + _4628;
        _4306 = _4640;
    }
    int _4642 = _4306;
    float _4644 = fma(_3580, _4466, _4630);
    int _4646 = _4378 + 88;
    uint _4648 = uint(int(uint(_4646) >> uint(2)));
    uint _4650 = uint(int(uint(int(_4648)) >> uint(2)));
    int _4652 = int(_4648) & 3;
    float _4654 = (*spvDescriptorSet0.vp_c15)._m0[int(_4650)][_4652];
    int _4656 = int(_4648) + 1;
    uint _4658 = uint(int(uint(_4656) >> uint(2)));
    int _4660 = _4656 & 3;
    float _4662 = (*spvDescriptorSet0.vp_c15)._m0[int(_4658)][_4660];
    float _4664 = _4632 + _4428;
    float _4666 = _4558 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4668 = _4558 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4670 = _4644 + _4474;
    float _4672 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4674 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4666);
    float _4676 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4668);
    float _4678 = _4402;
    if (!_4456)
    {
        int _4680 = _4642 + 400;
        uint _4682 = uint(int(uint(_4680) >> uint(2)));
        uint _4684 = uint(int(uint(int(_4682)) >> uint(2)));
        int _4686 = int(_4682) & 3;
        float _4688 = (*spvDescriptorSet0.vp_c15)._m0[int(_4684)][_4686];
        _4678 = _4688;
    }
    float _4690 = _4678;
    float _4692 = _4634 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4694 = fma(_4564, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4674);
    float _4696 = fma(_4564, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4676);
    float _4698 = _4602;
    if (!_4456)
    {
        float _4700 = floor(_4362);
        _4698 = _4700;
    }
    float _4702 = _4698;
    float _4704 = _4664 * _4636;
    float _4706 = -_4692;
    float _4708 = fma(_4706, _4672, 1.0);
    float _4710 = _4558 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4712 = _4696 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4714 = _4694 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _4716 = _4704 >= 0.0;
    float _4718 = _4670 * _4636;
    float _4720 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4710);
    float _4722 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _4724 = _4704 <= 1.0;
    bool _4726 = _4724 && _4716;
    float _4728 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4730 = fma(_4564, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4720);
    float _4732 = fma(_4714, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4722);
    bool _4734 = _4718 >= 0.0;
    bool _4736 = _4734 && _4726;
    float _4738 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4740 = _4730 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4742 = fma(_4634, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4732);
    bool _4744 = _4718 <= 1.0;
    bool _4746 = _4744 && _4736;
    float _4748 = log2(_4708);
    float _4750 = fma(_4714, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4728);
    float _4752 = fma(_4740, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4742);
    float _4754 = fma(_4714, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4738);
    float _4756 = _4702;
    float _4758 = _4728;
    if (!_4456)
    {
        float _4760 = -_4702;
        float _4762 = _4362 + _4760;
        _4756 = _4762;
    }
    float _4764 = _4756;
    float _4766 = fma(_4634, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4750);
    float _4768 = 1.0 / _4752;
    float _4770 = _4330 * _4622;
    float _4772 = fma(_4740, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4766);
    if (_4746)
    {
        float _4774 = float(_4376);
        _4512 = _4774;
    }
    float _4776 = _4512;
    float _4778 = fma(_3570, _4614, _4770);
    float _4780 = fma(_4634, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4754);
    float _4782 = _4630;
    if (!_4456)
    {
        float _4784 = floor(_4344);
        _4782 = _4784;
    }
    float _4786 = _4782;
    float _4788 = fma(_3580, _4654, _4778);
    float _4790 = fma(_4740, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4780);
    float _4792 = _4748 * 0.693147182464599609375;
    float _4794 = _4788 + _4662;
    float _4796 = _4792 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4798 = _4754;
    if (_4746)
    {
        float _4800 = rint(_4776);
        float _4802 = precise::max(_4800, 0.0);
        uint _4804 = uint(_4802);
        uint _4806 = clamp(_4804, 0u, 65535u);
        _4798 = as_type<float>(_4806);
    }
    float _4808 = _4798;
    float _4810 = _4790 * _4768;
    float _4812 = _4772 * _4768;
    float _4814 = _4794 * _4636;
    float _4816 = fma(_4812, -0.5, 0.5);
    float _4818 = _4766;
    float _4820 = _4768;
    if (!_4456)
    {
        float _4822 = rint(_4690);
        float _4824 = precise::max(_4822, 0.0);
        uint _4826 = uint(_4824);
        uint _4828 = clamp(_4826, 0u, 65535u);
        _4818 = as_type<float>(_4828);
    }
    float _4830 = _4818;
    float _4832 = fma(_4810, 0.5, 0.5);
    float _4834 = _4786;
    if (!_4456)
    {
        float _4836 = -_4786;
        float _4838 = _4344 + _4836;
        _4820 = _4838;
    }
    float _4840 = _4820;
    float _4842 = _4718;
    if (_4746)
    {
        float3 _12757 = float3(_4704, _4718, float(as_type<int>(_4808)));
        float3 _12761 = select(_12757, float3(0.0), isnan(_12757));
        float _4844 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12761.xy, uint(rint(_12761.z)), _4814, level(0.0));
        _4842 = _4844;
    }
    float _4846 = _4842;
    float3 _12771 = float3(_4832, _4816, _4796);
    float _4848 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12771, float3(0.0), isnan(_12771)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12771, float3(0.0), isnan(_12771)), level(0.0)).x;
    float3 _12780 = float3(_4832, _4816, _4796);
    float4 _4851 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12780, float3(0.0), isnan(_12780)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12780, float3(0.0), isnan(_12780)), level(0.0)).xyzw;
    float _4853 = _4851.x;
    float _4855 = _4851.y;
    float _4857 = _4851.z;
    float _4859 = _4851.w;
    float _4861 = _4840;
    float _4863 = _4830;
    if (!_4456)
    {
        float3 _12804 = float3(_4840, _4764, float(as_type<int>(_4830)));
        float3 _12806 = select(_12804, float3(0.0), isnan(_12804));
        float _4865 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12806.xy, uint(rint(_12806.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12806.xy, uint(rint(_12806.z)), level(0.0)).x;
        _4861 = _4865;
    }
    float _4867 = _4861;
    if (_4456)
    {
        _4758 = 1.0;
    }
    float _4869 = _4758;
    float _4871 = _4869;
    if (!_4456)
    {
        int _4873 = int(_4578) << 4;
        int _4875 = _4873 + 2048;
        uint _4877 = uint(int(uint(_4875) >> uint(2)));
        uint _4879 = uint(int(uint(int(_4877)) >> uint(2)));
        int _4881 = int(_4877) & 3;
        float _4883 = (*spvDescriptorSet0.vp_c15)._m0[int(_4879)][_4881];
        int _4885 = int(_4877) + 1;
        uint _4887 = uint(int(uint(_4885) >> uint(2)));
        int _4889 = _4885 & 3;
        float _4891 = (*spvDescriptorSet0.vp_c15)._m0[int(_4887)][_4889];
        int _4893 = _4875 + 8;
        uint _4895 = uint(int(uint(_4893) >> uint(2)));
        uint _4897 = uint(int(uint(int(_4895)) >> uint(2)));
        int _4899 = int(_4895) & 3;
        float _4901 = (*spvDescriptorSet0.vp_c15)._m0[int(_4897)][_4899];
        int _4903 = int(_4895) + 1;
        uint _4905 = uint(int(uint(_4903) >> uint(2)));
        int _4907 = _4903 & 3;
        float _4909 = (*spvDescriptorSet0.vp_c15)._m0[int(_4905)][_4907];
        float _4911 = _4330 * _4891;
        float _4913 = fma(_3570, _4883, _4911);
        float _4915 = fma(_3580, _4901, _4913);
        float _4917 = _4915 + _4909;
        float _4919 = precise::clamp(_4917, 0.0, 1.0);
        float _4921 = -_4919;
        float _4923 = _4921 + _4867;
        float _4925 = fma(_4923, 500.0, 1.5);
        float _4927 = exp2(_4925);
        float _4929 = 0.0 + _4927;
        float _4931 = precise::clamp(_4929, 0.0, 1.0);
        _4834 = _4901;
        _4871 = _4931;
    }
    float _4933 = _4834;
    float _4935 = _4871;
    float _4937 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4939 = _4558 + _4937;
    float _4941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4943 = _4560 + _4941;
    float _4945 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4947 = _4564 + _4945;
    float _4949 = _4939 * _4939;
    float _4951 = fma(_4943, _4943, _4949);
    float _4953 = fma(_4947, _4947, _4951);
    float _4955 = rsqrt(_4953);
    float _4957 = _4955 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4959 = _4943 * _4957;
    float _4961 = _4947 * _4957;
    float _4963 = _4959 * _4959;
    float _4965 = _4961 * _4961;
    float _4967 = _4963 + _4965;
    float _4969 = sqrt(_4967);
    bool _4971 = _4969 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4975 = _4969 + _4973;
    float _4977 = _4955;
    float _4979 = _4975;
    float _4981 = _4933;
    float _4983 = _4939;
    if (_4971)
    {
        float _4985 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4977 = _4985;
    }
    float _4987 = _4977;
    float _4989 = _4987;
    if (_4971)
    {
        float _4991 = _4975 * _4987;
        _4979 = _4991;
    }
    float _4993 = _4979;
    if (_4971)
    {
        float _4995 = rsqrt(_4967);
        _4989 = _4995;
    }
    float _4997 = _4989;
    float _4999 = _4997;
    if (_4971)
    {
        float _5001 = _4993 * 0.15915493667125701904296875;
        _4981 = _5001;
    }
    float _5003 = _4981;
    float _5005 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5007 = _4947;
    if (_4971)
    {
        float _5009 = _5003 * 6.283185482025146484375;
        float _5011 = sin(_5009);
        _5007 = _5011;
    }
    float _5013 = _5007;
    float _5015 = precise::max(0.0, _5005);
    float _5017 = _3570;
    float _5019 = _5015;
    if (_4971)
    {
        float _5021 = _5003 * 6.283185482025146484375;
        float _5023 = cos(_5021);
        _5017 = _5023;
    }
    float _5025 = _5017;
    float _5027 = -_4957;
    float _5029 = -_5015;
    float _5031 = fma(_4939, _5027, _5029);
    if (_4971)
    {
        float _5033 = _5031 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4983 = _5033;
    }
    float _5035 = _4983;
    float _5037 = _5013;
    float _5039 = _5035;
    if (_4971)
    {
        float _5041 = fma(_5013, _5035, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5037 = _5041;
    }
    float _5043 = _5037;
    float _5045 = _5043;
    if (_4971)
    {
        float _5047 = _4997 * _5043;
        _5039 = _5047;
    }
    float _5049 = _5039;
    if (!_4971)
    {
        _4999 = _4959;
    }
    float _5051 = _4999;
    float _5053 = _5051;
    float _5055 = _5025;
    if (_4971)
    {
        float _5057 = _5025 + (-1.0);
        _5019 = _5057;
    }
    float _5059 = _5019;
    float _5061 = _5059;
    if (_4971)
    {
        float _5063 = _4959 * _5049;
        _5053 = _5063;
    }
    float _5065 = _5053;
    if (!_4971)
    {
        _5045 = _5031;
    }
    float _5067 = _5045;
    float _5069 = _5067;
    if (_4971)
    {
        float _5071 = _5059 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4863 = _5071;
    }
    float _5073 = _4863;
    float _5075 = _5073;
    if (!_4971)
    {
        _5061 = _4961;
    }
    float _5077 = _5061;
    float _5079 = _5077;
    if (_4971)
    {
        float _5081 = _4961 * _5049;
        _5079 = _5081;
    }
    float _5083 = _5079;
    if (_4971)
    {
        float _5085 = fma(_5031, _5025, _5073);
        _5069 = _5085;
    }
    float _5087 = _5069;
    if (!_4971)
    {
        _5055 = _4963;
    }
    float _5089 = _5055;
    float _5091 = _5089;
    if (_4971)
    {
        float _5093 = _5065 * _5065;
        _5091 = _5093;
    }
    float _5095 = _5091;
    if (!_4971)
    {
        _5075 = _4965;
    }
    float _5097 = _5075;
    float _5099 = sqrt(_4953);
    float _5101 = _5097;
    if (_4971)
    {
        float _5103 = _5083 * _5083;
        _5101 = _5103;
    }
    float _5105 = _5101;
    float _5107 = fma(_5087, _5087, _5095);
    float _5109 = _5107 + _5105;
    float _5111 = rsqrt(_5109);
    float _5113 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5115 = fma(_5099, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5113);
    float _5117 = precise::clamp(_5115, 0.0, 1.0);
    float _5119 = -_5117;
    float _5121 = _5119 + 1.0;
    float _5123 = abs(_5121);
    float _5125 = log2(_5123);
    float _5127 = _5111 * _5065;
    float _5129 = _5111 * _5087;
    float _5131 = _5111 * _5083;
    float _5133 = _5127 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5135 = -_5133;
    float _5137 = fma(_5129, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5135);
    float _5139 = -_5131;
    float _5141 = fma(_5139, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5137);
    float _5143 = _5129 + 1.0;
    float _5145 = _5125 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5147 = fma(_5141, -0.5, 0.5);
    float _5149 = fma(_5141, 0.5, 0.5);
    float _5151 = exp2(_5145);
    float _5153 = fma(_5149, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5155 = fma(_5149, _5153, -0.212114393711090087890625);
    float _5157 = sqrt(_5147);
    float _5159 = fma(_5149, _5155, 1.570728778839111328125);
    float _5161 = -_5129;
    float _5163 = fma(_5151, _5143, _5161);
    float _5165 = fma(_5163, 0.5, 0.5);
    float _5167 = _5157 * 0.636619746685028076171875;
    float _5169 = -_5159;
    float _5171 = fma(_5167, _5169, 1.0);
    float2 _13279 = float2(_5171, _5165);
    float3 _5175 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13279, float2(0.0), isnan(_13279)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13279, float2(0.0), isnan(_13279)), level(0.0)).xyz;
    float _5177 = _5175.x;
    float _5179 = _5175.y;
    float _5181 = _5175.z;
    float _5183 = abs(_4340);
    float _5185 = log2(_5183);
    float _5187 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5189 = _5125 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5191 = -_4248;
    float _5193 = _5191 + 1.0;
    float _5195 = fma(_4714, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5187);
    bool _5197 = _4340 <= 8000.0;
    bool _5199 = isnan(_4340);
    bool _5201 = _5197 || _5199;
    bool _5203 = isnan(8000.0);
    bool _5205 = _5201 || _5203;
    float _5207 = float(_5205);
    float _5209 = exp2(_5189);
    float _5211 = _5185 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5213 = exp2(_5211);
    float _5215 = -_5209;
    float _5217 = _5215 + 1.0;
    float _5219 = fma(_5213, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5221 = precise::clamp(_5219, 0.0, 1.0);
    float _5223 = fma(_5221, -2.0, 3.0);
    float _5225 = _5221 * _5221;
    float _5227 = fma(_4634, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5195);
    float _5229 = _5225 * _5223;
    float _5231 = fma(_4740, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5227);
    float _5233 = -_5229;
    float _5235 = _5233 + 1.0;
    out.gl_Position.x = _4790;
    out.gl_Position.y = _4772;
    out.gl_Position.z = _5231;
    out.gl_Position.w = _4752;
    float _5237 = fma(_5235, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5229);
    float _5239 = _5231 + _4752;
    float _5241 = _5207 * _5237;
    float _5243 = _5207;
    if (!_4746)
    {
        _5243 = 1.0;
    }
    float _5245 = _5243;
    float _5247 = _5239 * 0.5;
    float _5249 = _5245;
    if (_4746)
    {
        bool _5251 = _4846 >= _4814;
        bool _5253 = isnan(_4846);
        bool _5255 = _5251 || _5253;
        bool _5257 = isnan(_4814);
        bool _5259 = _5255 || _5257;
        float _5261 = float(_5259);
        _5249 = _5261;
    }
    float _5263 = _5249;
    float _5265 = _5241 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5267 = _5217 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _5269 = _5099 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5271 = isnan(_5099);
    bool _5273 = _5269 || _5271;
    bool _5275 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5277 = _5273 || _5275;
    out.m_88.z = _5247;
    out.m_88.w = _4752;
    float _5279 = _5193 * _5265;
    float _5281 = precise::clamp(_5279, 0.0, 1.0);
    float _5283 = _5263 * _4935;
    float _5285 = _5267 * _4848;
    float _5287 = -_5267;
    float _5289 = _5287 + 1.0;
    float _5291 = -_5281;
    float _5293 = fma(_5291, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5295 = _4859 * _5285;
    float _5297 = _4859 * _5289;
    float _5299 = -_5283;
    float _5301 = fma(_5299, _5293, 1.0);
    float _5303 = precise::clamp(_5301, 0.0, 1.0);
    float _5305 = _5267;
    float _5307 = _5289;
    float _5309 = _5295;
    if (!_5277)
    {
        _5305 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5311 = _5305;
    float _5313 = _5303 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5315 = _5311;
    float _5317 = _5311;
    if (!_5277)
    {
        _5307 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5319 = _5307;
    out.m_90.x = _5313;
    float _5321 = _5181 * _5285;
    float _5323 = fma(_5177, _5295, _4853);
    float _5325 = fma(_5179, _5295, _4855);
    float _5327 = _5319;
    float _5329 = _5319;
    if (!_5277)
    {
        _5309 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5331 = _5309;
    float _5333 = fma(_4859, _5321, _4857);
    out.m_92.x = _5323;
    out.m_92.y = _5325;
    out.m_92.z = _5333;
    out.m_92.w = _5297;
    bool _5335 = !_5277;
    float _5337 = _5331;
    float _5339 = _5331;
    if (!_5335)
    {
        bool _5341 = _5099 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5343 = isnan(_5099);
        bool _5345 = _5341 || _5343;
        bool _5347 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5349 = _5345 || _5347;
        if (!_5349)
        {
            float _5351 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5353 = _5099 + _5351;
            float _5355 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5357 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5355;
            float _5359 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5361 = _5359 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5363 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5365 = _5363 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5367 = 1.0 / _5357;
            float _5369 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5371 = _5369 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5373 = _5353 * _5367;
            float _5375 = precise::clamp(_5373, 0.0, 1.0);
            float _5377 = fma(_5375, _5361, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5379 = fma(_5375, _5365, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5381 = fma(_5375, _5371, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _5317 = _5379;
            _5339 = _5377;
            _5329 = _5381;
            _5383 = true;
        }
        else
        {
            bool _5385 = _5099 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5387 = isnan(_5099);
            bool _5389 = _5385 || _5387;
            bool _5391 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5393 = _5389 || _5391;
            if (!_5393)
            {
                _5337 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5395 = _5337;
            _5339 = _5395;
            if (!_5393)
            {
                _5315 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5397 = _5315;
            _5317 = _5397;
            if (!_5393)
            {
                _5327 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5399 = _5327;
            bool _5401 = !_5393;
            _5329 = _5399;
            if (!_5401)
            {
                bool _5403 = _5099 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5405 = isnan(_5099);
                bool _5407 = _5403 || _5405;
                bool _5409 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5411 = _5407 || _5409;
                if (!_5411)
                {
                    float _5413 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5415 = _5099 + _5413;
                    float _5417 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5419 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5417;
                    float _5421 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5423 = _5421 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5425 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5427 = _5425 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5429 = 1.0 / _5419;
                    float _5431 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5433 = _5431 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5435 = _5415 * _5429;
                    float _5437 = precise::clamp(_5435, 0.0, 1.0);
                    float _5439 = fma(_5437, _5423, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5441 = fma(_5437, _5427, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5443 = fma(_5437, _5433, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _5317 = _5441;
                    _5339 = _5439;
                    _5329 = _5443;
                    _5383 = true;
                }
                else
                {
                    _5317 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5339 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5329 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5383 = false;
    float _5445 = _5317;
    float _5447 = _5339;
    float _5449 = _5329;
    float _5451 = _5445 * 0.586610972881317138671875;
    bool _5453 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_94.x = 0.0;
    float _5455 = fma(_5447, 0.298911988735198974609375, _5451);
    float _5457 = fma(_5449, 0.114477999508380889892578125, _5455);
    float _5459 = -_5457;
    float _5461 = _5459 + _5447;
    float _5463 = -_5457;
    float _5465 = _5463 + _5445;
    float _5467 = -_5457;
    float _5469 = _5467 + _5449;
    float _5471 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5473 = fma(_5461, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5457);
    float _5475 = fma(_5465, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5457);
    float _5477 = fma(_5469, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5457);
    out.m_61.x = _5471;
    out.m_96.x = _5473;
    out.m_96.y = _5475;
    out.m_96.z = _5477;
    if (!_5453)
    {
        return out;
    }
    float _5479 = -_4558;
    float _5481 = _5479 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5483 = -_4560;
    float _5485 = _5483 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5487 = -_4564;
    float _5489 = _5487 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5491 = _5481 * _5481;
    float _5493 = fma(_5485, _5485, _5491);
    float _5495 = fma(_5489, _5489, _5493);
    float _5497 = sqrt(_5495);
    float _5499 = rsqrt(_5495);
    float _5501 = -_5497;
    float _5503 = _5501 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5505 = _5503 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5507 = precise::clamp(_5505, 0.0, 1.0);
    float _5509 = _5485 * _5499;
    float _5511 = _5481 * _5499;
    float _5513 = abs(_5507);
    float _5515 = log2(_5513);
    float _5517 = _5489 * _5499;
    float _5519 = _5509 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5521 = _4146 * _5511;
    float _5523 = -_5511;
    float _5525 = -_5519;
    float _5527 = fma(_5523, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5525);
    float _5529 = fma(_4150, _5509, _5521);
    float _5531 = -_5517;
    float _5533 = fma(_5531, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5527);
    float _5535 = fma(_4152, _5517, _5529);
    float _5537 = precise::clamp(_5535, 0.0, 1.0);
    float _5539 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5541 = _5533 + _5539;
    float _5543 = _5515 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5545 = _5541 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5547 = precise::clamp(_5545, 0.0, 1.0);
    float _5549 = exp2(_5543);
    float _5551 = _5549 * _5547;
    float _5553 = _5537 * _5551;
    float _5555 = _5553 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5557 = _5553 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5559 = _5553 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _5555;
    out.m_94.y = _5557;
    out.m_94.z = _5559;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5383 = false;
    bool _4200 = false;
    bool _831 = false;
    bool _725 = false;
    bool _331 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_58.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_61.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5616 = as_type<float>(_131);
        out.gl_Position.z = _5616;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_63.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_61.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    float _171 = as_type<float>(_169);
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5687 = as_type<float>(_169);
        out.gl_Position.z = _5687;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    float _175 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _177 = in.m_68.w;
    bool _179 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _181 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _183 = _179 || _181;
    bool _185 = isnan(1.0);
    bool _187 = _183 || _185;
    float _189 = in.m_63.x;
    float _191 = in.m_63.y;
    float _193 = in.m_63.z;
    float _195 = in.m_58.x;
    float _197 = in.m_58.y;
    float _199 = in.m_58.z;
    float _201 = _175;
    if (!_187)
    {
        float _203 = _175 * _175;
        float _205 = _203 * 0.5;
        _171 = _205;
    }
    float _207 = _171;
    float _209 = _207;
    if (!_187)
    {
        float _211 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _211;
    }
    float _213 = _209;
    int _215 = as_type<int>(_173) & 1;
    bool _217 = _215 != 0;
    int _219 = as_type<int>(_173) & 2;
    bool _221 = _219 != 0;
    bool _223 = !_217;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_221;
    float _229 = _227 ? (-0.5) : 0.5;
    bool _231 = !_187;
    float _233 = _213;
    if (!_231)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = _175 * _237;
        float _247 = 1.0 / _241;
        float _249 = _243 * 0.693147182464599609375;
        float _251 = exp2(_245);
        float _253 = 1.0 / _249;
        float _255 = _251 + (-1.0);
        float _257 = -_255;
        float _259 = fma(_257, _253, _175);
        float _261 = _259 * _247;
        float _263 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _263;
    }
    float _265 = _233;
    bool _267 = !_187;
    if (!_267)
    {
        float _269 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = log2(_269);
        float _273 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _275 = _273 + 1.0;
        float _277 = 1.0 / _275;
        float _279 = _175 * _271;
        float _281 = exp2(_279);
        float _283 = -_281;
        float _285 = _283 + 1.0;
        float _287 = _285 * _277;
        _201 = _287;
    }
    float _289 = _201;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _293 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _295 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _297 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _299 = fma(_289, _189, _293);
    float _301 = fma(_289, _191, _295);
    float _303 = fma(_289, _193, _297);
    float _305 = fma(_299, _177, _195);
    float _307 = fma(_301, _177, _197);
    float _309 = fma(_303, _177, _199);
    bool _311 = !_291;
    float _329;
    if (!_311)
    {
        float _313 = in.m_70.x;
        float _315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _317 = _313 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _321 = _319 * _315;
        float _323 = floor(_321);
        float _325 = -_323;
        float _327 = _321 + _325;
        _329 = _327;
        _331 = true;
    }
    else
    {
        float _333 = float(_115);
        float _335 = 1.0 / _333;
        float _337 = _149 * _335;
        _329 = _337;
    }
    _331 = false;
    float _339 = _329;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _357 = 1.0 / _343;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _367 = 1.0 / _351;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _371 = _339 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _373;
    float _377 = 1.0 / _355;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = _339 + _379;
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _385 = 1.0 / _347;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _389 = _339 + _387;
    float _391 = _381 * _367;
    bool _393 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _395 = isnan(_339);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = 1.0 / _365;
    float _407 = _389 * _377;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _411 = _339 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _415 = _339 + _413;
    float _417 = _411 * _357;
    float _419 = -_403;
    float _421 = _419 + 1.0;
    float _423 = _371 * _385;
    float _425 = 1.0 / _361;
    bool _427 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _429 = isnan(_339);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _441 = _339 + _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _445 = _339 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _447;
    float _451 = -_437;
    float _453 = _451 + 1.0;
    float _455 = _437 * _421;
    float _457 = 1.0 / _375;
    bool _459 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _461 = isnan(_339);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = _441 * _405;
    bool _473 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _475 = isnan(_339);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = fma(_449, _391, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _487 = _469 * _453;
    float _489 = -_469;
    float _491 = _489 + 1.0;
    float _493 = _415 * _425;
    bool _495 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _497 = isnan(_339);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _507;
    bool _511 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _513 = isnan(_339);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = _505 * _491;
    float _525 = -_505;
    float _527 = _525 + 1.0;
    float _529 = _445 * _457;
    float _531 = -_483;
    float _533 = _531 + 1.0;
    float _535 = fma(_509, _391, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _537 = _483 * _527;
    bool _539 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _541 = isnan(_339);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = _521 * _533;
    bool _553 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _555 = isnan(_339);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -_521;
    float _567 = _565 + 1.0;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _573 = -_549;
    float _575 = _573 + 1.0;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _577;
    float _581 = _549 * _567;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _587;
    float _591 = _563 * _575;
    float _593 = fma(_571, _407, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _595 = fma(_585, _407, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _597 = fma(_589, _417, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _599 = fma(_579, _417, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _601 = _485 * _591;
    float _603 = _535 * _591;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _613 = -_563;
    float _615 = _613 + 1.0;
    float _617 = fma(_607, _423, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _619 = fma(_611, _423, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _621 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[143].x, _601);
    float _623 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[143].y, _603);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _629;
    float _633 = fma(_593, _581, _621);
    float _635 = fma(_595, _581, _623);
    float _637 = fma(_627, _493, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _639 = fma(_631, _493, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _649 = fma(_597, _551, _633);
    float _651 = fma(_599, _551, _635);
    float _653 = fma(_643, _471, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _655 = in.m_68.x;
    float _657 = in.m_68.y;
    float _659 = fma(_647, _471, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _661 = fma(_617, _537, _649);
    float _663 = fma(_619, _537, _651);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _665;
    float _669 = fma(_637, _523, _661);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _671;
    float _675 = fma(_639, _523, _663);
    float _677 = fma(_667, _529, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _679 = fma(_653, _487, _669);
    float _681 = fma(_673, _529, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _683 = fma(_659, _487, _675);
    float _685 = fma(_677, _455, _679);
    float _687 = fma(_681, _455, _683);
    float _689 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[150].x, _685);
    float _691 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[150].y, _687);
    float _693 = _689 * _655;
    float _695 = _691 * _657;
    bool _697 = !_383;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[150].y;
    float _701 = _675;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _723;
    if (!_697)
    {
        float _707 = in.m_70.x;
        float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _711 = _707 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _715 = _713 * _709;
        float _717 = floor(_715);
        float _719 = -_717;
        float _721 = _715 + _719;
        _723 = _721;
        _725 = true;
    }
    else
    {
        float _727 = float(_115);
        float _729 = 1.0 / _727;
        float _731 = _149 * _729;
        _723 = _731;
    }
    _725 = false;
    float _733 = _723;
    bool _735 = _733 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _737 = isnan(_733);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _751 = _733 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _753 = isnan(_733);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _769 = _733 + _767;
    float _771 = -_745;
    float _773 = _771 + 1.0;
    bool _775 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _777 = 1.0 / _749;
    float _779 = _761 * _773;
    float _781 = -_761;
    float _783 = _781 + 1.0;
    float _785 = _765 * _777;
    float _787 = fma(_785, _769, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _789 = _787 * _779;
    float _791 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[115].x, _789);
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _799 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[116].x, _791);
    float _801 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _803 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _799 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _801;
    out.m_72.y = _803;
    out.m_72.z = _805;
    out.m_72.w = _807;
    bool _809 = !_775;
    float _811 = _807;
    float _829;
    if (!_809)
    {
        float _813 = in.m_70.x;
        float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _817 = _813 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _819 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _821 = _819 * _815;
        float _823 = floor(_821);
        float _825 = -_823;
        float _827 = _821 + _825;
        _829 = _827;
        _831 = true;
    }
    else
    {
        float _833 = float(_115);
        float _835 = 1.0 / _833;
        float _837 = _149 * _835;
        _829 = _837;
    }
    _831 = false;
    float _839 = _829;
    float _841 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _843 = int(_841);
    float _845 = float(_115);
    float _847 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _849 = int(_847);
    float _851 = float(_843);
    float _853 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _855 = int(_853);
    float _857 = float(uint(_849));
    float _859 = 1.0 / _851;
    float _861 = float(_849);
    float _863 = 1.0 / _857;
    float _865 = float(_855);
    float _867 = _859 * _149;
    float _869 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _871 = int(_869);
    int _873 = as_type<int>(_863) + (-2);
    float _875 = trunc(_867);
    int _877 = int(_875);
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _881 = _879 != 0;
    float _883 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _885 = int(_883);
    float _887 = float(uint(_871));
    float _889 = float(uint(_877));
    float _891 = 1.0 / _865;
    if (_881)
    {
        _811 = 1.0;
    }
    float _893 = _811;
    float _895 = _893;
    if (_881)
    {
        _699 = 1.0;
    }
    float _897 = _699;
    float _899 = as_type<float>(_873) * _889;
    float _901 = _897;
    if (_881)
    {
        _701 = 1.0;
    }
    float _903 = _701;
    float _905 = _889;
    float _907 = _903;
    if (_881)
    {
        float _909 = in.m_70.x;
        _905 = _909;
    }
    float _911 = _905;
    float _913 = float(_885);
    float _915 = trunc(_899);
    float _917 = precise::max(_915, 0.0);
    uint _920 = uint(_917);
    if (_881)
    {
        _703 = 0;
    }
    int _922 = _703;
    int _924 = _922;
    if (_881)
    {
        _705 = 0;
    }
    int _926 = _705;
    float _928 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _930 = int(_928);
    float _932 = _891 * _149;
    float _934 = float(_877);
    bool _936 = _934 >= _861;
    bool _938 = isnan(_934);
    bool _940 = _936 || _938;
    bool _942 = isnan(_861);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = 1.0 / _887;
    float _950 = 1.0 / _913;
    int _952 = ~_849;
    int _954 = _952 + 1;
    float _956 = float(uint(_930));
    int _958 = _954 * int(_920);
    int _960 = _958 + _877;
    float _962 = 1.0 / _956;
    float _964 = float(uint(_960));
    float _966 = _950 * _149;
    float _968 = in.m_70.x;
    float _970 = in.m_70.y;
    float _972 = in.m_70.z;
    float _974 = in.m_70.w;
    float _976 = as_type<float>(_873) * _964;
    float _978 = 1.0 / _845;
    int _980 = as_type<int>(_948) + (-2);
    float _982 = _948;
    float _984 = _911;
    int _986 = _926;
    if (_881)
    {
        _982 = _911;
    }
    float _988 = _982;
    float _990 = trunc(_932);
    int _992 = int(_990);
    float _994 = trunc(_966);
    int _996 = int(_994);
    float _998 = trunc(_946);
    int _1000 = int(_998);
    float _1002 = trunc(_976);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    float _1008 = _988;
    if (!_881)
    {
        float _1010 = in.m_70.y;
        float _1012 = in.m_70.z;
        _895 = 7.345489978790283203125;
        _907 = 5.839270114898681640625;
        _1008 = _1012;
        _901 = 1.2345600128173828125;
        _984 = _1010;
        _924 = 1;
        _986 = 2;
    }
    float _1014 = _895;
    float _1016 = _907;
    float _1018 = _1008;
    float _1020 = _901;
    float _1022 = _984;
    int _1024 = _924;
    int _1026 = _986;
    float _1028 = float(uint(_992));
    float _1030 = _1014 * _968;
    int _1032 = int(_920) + int(_1006);
    float _1034 = _1016 * _1018;
    int _1036 = as_type<int>(_962) + (-2);
    float _1038 = as_type<float>(_980) * _1028;
    float _1040 = float(uint(_996));
    float _1042 = floor(_1030);
    bool _1044 = _974 > 0.5;
    float _1046 = _978 * _149;
    int _1048 = ~_849;
    int _1050 = _1048 + 1;
    float _1052 = as_type<float>(_1036) * _1040;
    int _1054 = ~_871;
    int _1056 = _1054 + 1;
    float _1058 = _1020 * _1022;
    float _1060 = trunc(_1038);
    float _1062 = precise::max(_1060, 0.0);
    uint _1064 = uint(_1062);
    int _1066 = _1050 * _1032;
    int _1068 = _1066 + _877;
    int _1070 = ~_930;
    int _1072 = _1070 + 1;
    float _1074 = _307 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    bool _1076 = _970 > 0.5;
    bool _1078 = uint(_1068) >= uint(_849);
    float _1080 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1074);
    float _1082 = trunc(_1052);
    float _1084 = precise::max(_1082, 0.0);
    uint _1086 = uint(_1084);
    float _1088 = -_1042;
    float _1090 = _1030 + _1088;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1102 = _1100 != 0;
    float _1104 = -_225;
    int _1106 = _1076 ? as_type<int>(_1104) : as_type<int>(_225);
    float _1108 = _1090 * _861;
    bool _1110 = _972 > 0.5;
    float _1112 = _861 * _1046;
    int _1114 = _1056 * int(_1064);
    int _1116 = _1114 + _992;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1120 = _1118 != 0;
    float _1122 = floor(_1058);
    float _1124 = float(uint(_1116));
    bool _1126 = !_1098;
    float _1128 = _1126 ? _225 : as_type<float>(_1106);
    int _1130 = _1072 * int(_1086);
    int _1132 = _1130 + _996;
    float _1134 = -_229;
    int _1136 = _1110 ? as_type<int>(_1134) : as_type<int>(_229);
    float _1138 = as_type<float>(_980) * _1124;
    bool _1140 = !_1078;
    int _1142 = _1140 ? 0 : (-1);
    float _1144 = trunc(_1108);
    int _1146 = int(_1144);
    float _1148 = float(uint(_1132));
    int _1150 = ~_1032;
    int _1152 = _1150 + _1142;
    int _1154 = _1152 + 1;
    bool _1156 = !_1120;
    int _1158 = _1156 ? 0 : 1;
    float _1160 = as_type<float>(_1036) * _1148;
    bool _1162 = !_1102;
    float _1164 = _1162 ? _229 : as_type<float>(_1136);
    float _1166 = trunc(_1138);
    float _1168 = precise::max(_1166, 0.0);
    uint _1170 = uint(_1168);
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1182 = _1180 != 0;
    float _1184 = -_1122;
    float _1186 = _1058 + _1184;
    bool _1188 = _849 == 0;
    int _1190 = abs(_1158);
    bool _1192 = !_1178;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = trunc(_1160);
    float _1198 = precise::max(_1196, 0.0);
    uint _1200 = uint(_1198);
    int _1202 = _849 * _1154;
    int _1204 = _1202 + _877;
    int _1206 = ~_1000;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    int _1212 = _1146 * _1190;
    int _1214 = _1212 + _877;
    int _1216 = _849 + (-1);
    bool _1218 = !_1188;
    int _1220 = _1218 ? _1204 : (-1);
    float _1222 = trunc(_1112);
    int _1224 = int(_1222);
    int _1226 = ~_871;
    int _1228 = _1226 + 1;
    int _1230 = _1220 * _1210;
    int _1232 = int(_1064) + int(_1170);
    int _1234 = abs(_1194);
    int _1236 = _1000 * _1216;
    int _1238 = _1236 + _1230;
    float _1240 = floor(_1034);
    bool _1242 = !_1174;
    int _1244 = _1242 ? 0 : 1;
    int _1246 = _1228 * _1232;
    int _1248 = _1246 + _992;
    int _1250 = int(_1086) + int(_1200);
    int _1252 = abs(_1244);
    int _1254 = ~_930;
    int _1256 = _1254 + 1;
    bool _1258 = !_1182;
    int _1260 = _1258 ? 0 : 1;
    int _1262 = _1238 * _1234;
    bool _1264 = uint(_1248) >= uint(_871);
    int _1266 = abs(_1260);
    int _1268 = _1256 * _1250;
    int _1270 = _1268 + _996;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1274 = _1272 != 0;
    int _1276 = _1224 * _1252;
    int _1278 = _1276 + _1262;
    bool _1280 = !_1264;
    int _1282 = _1280 ? 0 : (-1);
    float _1284 = -_1240;
    float _1286 = _1034 + _1284;
    bool _1288 = uint(_1270) >= uint(_930);
    int _1290 = _1214 * _1266;
    int _1292 = _1290 + _1278;
    bool _1294 = !_1274;
    int _1296 = _1294 ? 0 : 1;
    float _1298 = float(_871);
    float _1300 = float(_992);
    int _1302 = ~_1232;
    int _1304 = _1302 + _1282;
    int _1306 = _1304 + 1;
    int _1308 = abs(_1296);
    bool _1310 = _1300 >= _1298;
    bool _1312 = isnan(_1300);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan(_1298);
    bool _1318 = _1314 || _1316;
    float _1320 = float(_1318);
    float _1322 = float(_930);
    float _1324 = float(_996);
    float _1326 = -_229;
    int _1328 = _1044 ? as_type<int>(_1326) : as_type<int>(_229);
    float _1330 = trunc(_1320);
    int _1332 = int(_1330);
    bool _1334 = _1324 >= _1322;
    bool _1336 = isnan(_1324);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan(_1322);
    bool _1342 = _1338 || _1340;
    float _1344 = float(_1342);
    bool _1346 = !_1094;
    float _1348 = _1346 ? _229 : as_type<float>(_1328);
    int _1350 = _1146 * _1308;
    int _1352 = _1350 + _1292;
    int _1354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1356 = _1354 != 0;
    float _1358 = _1186 * _1298;
    bool _1360 = !_1288;
    int _1362 = _1360 ? 0 : (-1);
    float _1364 = trunc(_1344);
    int _1366 = int(_1364);
    bool _1368 = !_1356;
    int _1370 = _1368 ? 0 : 1;
    float _1372 = _1298 * _1046;
    float _1374 = float(uint(_1352));
    float _1376 = _1322 * _1046;
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1380 = _1378 != 0;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1384 = _1382 != 0;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1392 = _1390 != 0;
    int _1394 = ~_1250;
    int _1396 = _1394 + _1362;
    int _1398 = _1396 + 1;
    float _1400 = trunc(_1358);
    int _1402 = int(_1400);
    float _1404 = as_type<float>(_873) * _1374;
    bool _1406 = !_1380;
    int _1408 = _1406 ? 0 : 1;
    int _1410 = _871 * _1306;
    int _1412 = _1410 + _992;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1416 = _1414 != 0;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1420 = _1418 != 0;
    int _1422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1424 = _1422 != 0;
    int _1426 = _930 * _1398;
    int _1428 = _1426 + _996;
    bool _1430 = _871 == 0;
    bool _1432 = !_1384;
    int _1434 = _1432 ? 0 : 1;
    float _1436 = trunc(_1404);
    float _1438 = precise::max(_1436, 0.0);
    uint _1440 = uint(_1438);
    bool _1442 = _930 == 0;
    int _1444 = abs(_1370);
    int _1446 = ~_1332;
    int _1448 = _1446 + 1;
    int _1450 = _1448 + 1;
    bool _1452 = !_1430;
    int _1454 = _1452 ? _1412 : (-1);
    float _1456 = trunc(_1372);
    int _1458 = int(_1456);
    int _1460 = ~_1366;
    int _1462 = _1460 + 1;
    int _1464 = _1462 + 1;
    bool _1466 = !_1442;
    int _1468 = _1466 ? _1428 : (-1);
    int _1470 = _1454 * _1450;
    float _1472 = _1286 * _1322;
    int _1474 = _871 + (-1);
    int _1476 = _1468 * _1464;
    int _1478 = ~_849;
    int _1480 = _1478 + 1;
    int _1482 = _1402 * _1444;
    int _1484 = _1482 + _992;
    int _1486 = _930 + (-1);
    int _1488 = _1332 * _1474;
    int _1490 = _1488 + _1470;
    float _1492 = trunc(_1376);
    int _1494 = int(_1492);
    bool _1496 = !_1420;
    int _1498 = _1496 ? 0 : 1;
    int _1500 = _1366 * _1486;
    int _1502 = _1500 + _1476;
    int _1504 = abs(_1434);
    int _1506 = _1480 * int(_1440);
    int _1508 = _1506 + _1352;
    int _1510 = abs(_1498);
    bool _1512 = !_1388;
    int _1514 = _1512 ? 0 : 1;
    float _1516 = float(uint(_1508));
    int _1518 = _1490 * _1504;
    int _1520 = abs(_1408);
    int _1522 = _1502 * _1510;
    int _1524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1526 = _1524 != 0;
    float _1528 = as_type<float>(_873) * _1516;
    int _1530 = abs(_1514);
    int _1532 = _1458 * _1520;
    int _1534 = _1532 + _1518;
    bool _1536 = !_1526;
    int _1538 = _1536 ? 0 : 1;
    float _1540 = trunc(_1528);
    float _1542 = precise::max(_1540, 0.0);
    uint _1544 = uint(_1542);
    bool _1546 = !_1392;
    int _1548 = _1546 ? 0 : 1;
    float _1550 = _307 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _1552 = abs(_1538);
    float _1554 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1550);
    float _1556 = float(uint(_1214));
    float _1558 = trunc(_1472);
    int _1560 = int(_1558);
    bool _1562 = !_1416;
    int _1564 = _1562 ? 0 : 1;
    int _1566 = _1484 * _1530;
    int _1568 = _1566 + _1534;
    int _1570 = abs(_1548);
    float _1572 = as_type<float>(_873) * _1556;
    int _1574 = abs(_1564);
    int _1576 = _1402 * _1570;
    int _1578 = _1576 + _1568;
    float _1580 = trunc(_1572);
    float _1582 = precise::max(_1580, 0.0);
    uint _1584 = uint(_1582);
    int _1586 = int(_1440) + int(_1544);
    float _1588 = float(uint(_1578));
    int _1590 = _1494 * _1574;
    int _1592 = _1590 + _1522;
    bool _1594 = !_1424;
    int _1596 = _1594 ? 0 : 1;
    int _1598 = _1560 * _1552;
    int _1600 = _1598 + _996;
    int _1602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1604 = _1602 != 0;
    float _1606 = as_type<float>(_980) * _1588;
    int _1608 = abs(_1596);
    int _1610 = ~_849;
    int _1612 = _1610 + 1;
    bool _1614 = !_1604;
    int _1616 = _1614 ? 0 : 1;
    float _1618 = trunc(_1606);
    float _1620 = precise::max(_1618, 0.0);
    uint _1622 = uint(_1620);
    int _1624 = ~_849;
    int _1626 = _1624 + 1;
    int _1628 = _1600 * _1608;
    int _1630 = _1628 + _1592;
    int _1632 = abs(_1616);
    int _1634 = _1612 * int(_1584);
    int _1636 = _1634 + _1214;
    float _1638 = float(uint(_1484));
    int _1640 = _1626 * _1586;
    int _1642 = _1640 + _1352;
    float _1644 = float(uint(_1636));
    float _1646 = as_type<float>(_980) * _1638;
    int _1648 = ~_871;
    int _1650 = _1648 + 1;
    int _1652 = _1560 * _1632;
    int _1654 = _1652 + _1630;
    bool _1656 = uint(_1642) >= uint(_849);
    float _1658 = trunc(_1646);
    float _1660 = precise::max(_1658, 0.0);
    uint _1662 = uint(_1660);
    float _1664 = as_type<float>(_873) * _1644;
    bool _1666 = !_1656;
    int _1668 = _1666 ? 0 : (-1);
    float _1670 = float(uint(_1654));
    int _1672 = _1650 * int(_1622);
    int _1674 = _1672 + _1578;
    int _1676 = ~_1586;
    int _1678 = _1676 + _1668;
    int _1680 = _1678 + 1;
    float _1682 = trunc(_1664);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    int _1688 = ~_871;
    int _1690 = _1688 + 1;
    float _1692 = as_type<float>(_1036) * _1670;
    float _1694 = float(uint(_1674));
    int _1696 = _849 * _1680;
    int _1698 = _1696 + _1352;
    bool _1700 = _849 == 0;
    float _1702 = trunc(_1692);
    float _1704 = precise::max(_1702, 0.0);
    uint _1706 = uint(_1704);
    bool _1708 = !_1700;
    int _1710 = _1708 ? _1698 : (-1);
    float _1712 = as_type<float>(_980) * _1694;
    int _1714 = ~_930;
    int _1716 = _1714 + 1;
    int _1718 = _1690 * int(_1662);
    int _1720 = _1718 + _1484;
    int _1722 = _1710 & 3;
    bool _1724 = _1722 != 0;
    int _1726 = _1710 & 3;
    bool _1728 = _1726 != 0;
    float _1730 = trunc(_1712);
    float _1732 = precise::max(_1730, 0.0);
    uint _1734 = uint(_1732);
    float _1736 = float(uint(_1720));
    int _1738 = _1724 ? 0 : 1;
    bool _1740 = uint(_1726) > 1u;
    float _1742 = as_type<float>(_980) * _1736;
    int _1744 = int(_1584) + int(_1686);
    float _1746 = trunc(_1742);
    float _1748 = precise::max(_1746, 0.0);
    uint _1750 = uint(_1748);
    int _1752 = ~_849;
    int _1754 = _1752 + 1;
    int _1756 = _1716 * int(_1706);
    int _1758 = _1756 + _1654;
    int _1760 = ~_1738;
    int _1762 = _1760 + 1;
    int _1764 = _1762 + 1;
    bool _1766 = !_1728;
    int _1768 = _1766 ? 0 : 1;
    int _1770 = _1754 * _1744;
    int _1772 = _1770 + _1214;
    float _1774 = float(uint(_1758));
    int _1776 = int(_1622) + int(_1734);
    int _1778 = _1764;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_1740)
    {
        int _1782 = ~_1738;
        int _1784 = _1782 + 1;
        _1778 = _1784;
    }
    int _1786 = _1778;
    float _1788 = as_type<float>(_1036) * _1774;
    int _1790 = ~_871;
    int _1792 = _1790 + 1;
    bool _1794 = uint(_1726) >= 2u;
    int _1796 = int(_1662) + int(_1750);
    int _1798 = _1792 * _1776;
    int _1800 = _1798 + _1578;
    int _1802 = _1794 ? 0 : 1;
    float _1804 = trunc(_1788);
    float _1806 = precise::max(_1804, 0.0);
    uint _1808 = uint(_1806);
    bool _1810 = uint(_1772) >= uint(_849);
    int _1812 = ~_1802;
    int _1814 = _1812 + 1;
    int _1816 = _1814 + 1;
    bool _1818 = !_1810;
    int _1820 = _1818 ? 0 : (-1);
    bool _1822 = uint(_1800) >= uint(_871);
    int _1824 = ~_1744;
    int _1826 = _1824 + _1820;
    int _1828 = _1826 + 1;
    bool _1830 = !_1822;
    int _1832 = _1830 ? 0 : (-1);
    bool _1834 = _1726 != 3;
    int _1836 = _849 * _1828;
    int _1838 = _1836 + _1214;
    int _1840 = ~_1776;
    int _1842 = _1840 + _1832;
    int _1844 = _1842 + 1;
    float _1846 = float(uint(_1600));
    int _1848 = int(_1706) + int(_1808);
    int _1850 = _871 * _1844;
    int _1852 = _1850 + _1578;
    bool _1854 = !_1700;
    int _1856 = _1854 ? _1838 : (-1);
    float _1858 = as_type<float>(_1036) * _1846;
    int _1860 = ~_930;
    int _1862 = _1860 + 1;
    bool _1864 = !_1430;
    int _1866 = _1864 ? _1852 : (-1);
    float _1868 = trunc(_1858);
    float _1870 = precise::max(_1868, 0.0);
    uint _1872 = uint(_1870);
    int _1874 = _1816;
    if (_1834)
    {
        int _1876 = ~_1802;
        int _1878 = _1876 + 1;
        _1874 = _1878;
    }
    int _1880 = _1874;
    int _1882 = _1862 * _1848;
    int _1884 = _1882 + _1654;
    int _1886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1888 = _1886 != 0;
    int _1890 = _1866 & 3;
    bool _1892 = _1890 != 0;
    int _1894 = _1866 & 3;
    bool _1896 = _1894 != 0;
    bool _1898 = !_1888;
    int _1900 = _1898 ? 0 : 1;
    bool _1902 = uint(_1890) >= 2u;
    int _1904 = _1896 ? 0 : 1;
    bool _1906 = uint(_1884) >= uint(_930);
    int _1908 = ~_930;
    int _1910 = _1908 + 1;
    int _1912 = _1902 ? 0 : 1;
    bool _1914 = uint(_1890) > 1u;
    int _1916 = _1910 * int(_1872);
    int _1918 = _1916 + _1600;
    bool _1920 = !_1906;
    int _1922 = _1920 ? 0 : (-1);
    int _1924 = ~_871;
    int _1926 = _1924 + 1;
    bool _1928 = _1890 != 3;
    int _1930 = ~_1848;
    int _1932 = _1930 + _1922;
    int _1934 = _1932 + 1;
    int _1936 = _1926 * _1796;
    int _1938 = _1936 + _1484;
    float _1940 = float(uint(_1918));
    int _1942 = ~_1904;
    int _1944 = _1942 + 1;
    int _1946 = _1944 + 1;
    int _1948 = _930 * _1934;
    int _1950 = _1948 + _1654;
    int _1952 = _1946;
    if (!_1914)
    {
        int _1954 = ~_1904;
        int _1956 = _1954 + 1;
        _1952 = _1956;
    }
    int _1958 = _1952;
    float _1960 = as_type<float>(_1036) * _1940;
    bool _1962 = uint(_1938) >= uint(_871);
    bool _1964 = !_1442;
    int _1966 = _1964 ? _1950 : (-1);
    int _1968 = ~_1912;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    float _1974 = trunc(_1960);
    float _1976 = precise::max(_1974, 0.0);
    uint _1978 = uint(_1976);
    int _1980 = _1972;
    if (_1928)
    {
        int _1982 = ~_1912;
        int _1984 = _1982 + 1;
        _1980 = _1984;
    }
    int _1986 = _1980;
    int _1988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1990 = _1988 != 0;
    bool _1992 = !_1962;
    int _1994 = _1992 ? 0 : (-1);
    int _1996 = _1966 & 3;
    bool _1998 = _1996 != 0;
    bool _2000 = !_1990;
    int _2002 = _2000 ? 0 : 1;
    bool _2004 = uint(_1996) > 1u;
    bool _2006 = !_1892;
    int _2008 = _2006 ? 0 : 1;
    int _2010 = _1966 & 3;
    bool _2012 = _2010 != 0;
    bool _2014 = !_1998;
    int _2016 = _2014 ? 0 : 1;
    int _2018 = _2012 ? 0 : 1;
    int _2020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2022 = _2020 != 0;
    int _2024 = ~_2018;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    bool _2030 = !_2022;
    int _2032 = _2030 ? 0 : 1;
    bool _2034 = _1726 != 3;
    int _2036 = _2028;
    if (!_2004)
    {
        int _2038 = ~_2018;
        int _2040 = _2038 + 1;
        _2036 = _2040;
    }
    int _2042 = _2036;
    int _2044 = ~_930;
    int _2046 = _2044 + 1;
    bool _2048 = _1996 != 3;
    bool _2050 = !_2034;
    int _2052 = _2050 ? 0 : (-1);
    bool _2054 = _1890 != 3;
    int _2056 = int(_1872) + int(_1978);
    bool _2058 = uint(_1996) >= 2u;
    int _2060 = _2058 ? 0 : 1;
    bool _2062 = _1996 != 3;
    int _2064 = _2046 * _2056;
    int _2066 = _2064 + _1600;
    int _2068 = ~_2060;
    int _2070 = _2068 + 1;
    int _2072 = _2070 + 1;
    bool _2074 = !_2062;
    int _2076 = _2074 ? 0 : (-1);
    int _2078 = _2072;
    if (_2048)
    {
        int _2080 = ~_2060;
        int _2082 = _2080 + 1;
        _2078 = _2082;
    }
    int _2084 = _2078;
    int _2086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2088 = _2086 != 0;
    bool _2090 = uint(_2066) >= uint(_930);
    int _2092 = _1710 >> 31;
    int _2094 = _1866 >> 31;
    bool _2096 = !_2090;
    int _2098 = _2096 ? 0 : (-1);
    int _2100 = _2092 & 3;
    float _2102 = _307 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    int _2104 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2106 = _2104 != 0;
    int _2108 = _1966 >> 31;
    float _2110 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[14].x, _2102);
    int _2112 = _2094 & 3;
    float _2114 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[16].x, _2110);
    int _2116 = _1710 + _2100;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2120 = _2108 & 3;
    float _2122 = _2114 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    int _2124 = _1866 + _2112;
    float _2126 = _970 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2128 = _307 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    bool _2130 = !_2054;
    int _2132 = _2130 ? 0 : (-1);
    float _2134 = fma(_2126, -2.0, _2118);
    int _2136 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2138 = _2136 != 0;
    float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2142 = _2140 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2144 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[14].y, _2128);
    int _2146 = _1966 + _2120;
    float _2148 = 1.0 / _2142;
    int _2150 = _2116 >> 2;
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2154 = _2124 >> 2;
    float _2156 = _968 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2158 = _2146 >> 2;
    float _2160 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2134);
    int _2162 = _2150 << 4;
    int _2164 = _2162 + 368;
    float _2166 = -_2152;
    float _2168 = fma(_2156, 2.0, _2166);
    int _2170 = _2154 << 4;
    int _2172 = _2170 + 512;
    float _2174 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[16].y, _2144);
    int _2176 = _2158 << 4;
    int _2178 = _2176 + 656;
    uint _2180 = uint(int(uint(_2164) >> uint(2)));
    uint _2182 = uint(int(uint(int(_2180)) >> uint(2)));
    int _2184 = int(_2180) & 3;
    float _2186 = (*spvDescriptorSet0.vp_c9)._m0[int(_2182)][_2184];
    int _2188 = int(_2180) + 1;
    uint _2190 = uint(int(uint(_2188) >> uint(2)));
    int _2192 = _2188 & 3;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[int(_2190)][_2192];
    float _2196 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1554);
    float _2198 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1080);
    float _2200 = _2174 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _2202 = _2196 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    uint _2204 = uint(int(uint(_2172) >> uint(2)));
    uint _2206 = uint(int(uint(int(_2204)) >> uint(2)));
    int _2208 = int(_2204) & 3;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[int(_2206)][_2208];
    int _2212 = int(_2204) + 1;
    uint _2214 = uint(int(uint(_2212) >> uint(2)));
    int _2216 = _2212 & 3;
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[int(_2214)][_2216];
    float _2220 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _2222 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2222;
    float _2226 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _2228 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _2220);
    int _2230 = abs(_1786);
    uint _2232 = uint(int(uint(_2178) >> uint(2)));
    uint _2234 = uint(int(uint(int(_2232)) >> uint(2)));
    int _2236 = int(_2232) & 3;
    float _2238 = (*spvDescriptorSet0.vp_c9)._m0[int(_2234)][_2236];
    int _2240 = int(_2232) + 1;
    uint _2242 = uint(int(uint(_2240) >> uint(2)));
    int _2244 = _2240 & 3;
    float _2246 = (*spvDescriptorSet0.vp_c9)._m0[int(_2242)][_2244];
    float _2248 = _2224 * _2148;
    float _2250 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _2226);
    int _2252 = ~_1796;
    int _2254 = _2252 + _1994;
    int _2256 = _2254 + 1;
    float _2258 = -_149;
    float _2260 = fma(_2258, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2168);
    int _2262 = abs(_1958);
    int _2264 = _2164 + 8;
    uint _2266 = uint(int(uint(_2264) >> uint(2)));
    uint _2268 = uint(int(uint(int(_2266)) >> uint(2)));
    int _2270 = int(_2266) & 3;
    float _2272 = (*spvDescriptorSet0.vp_c9)._m0[int(_2268)][_2270];
    int _2274 = int(_2266) + 1;
    uint _2276 = uint(int(uint(_2274) >> uint(2)));
    int _2278 = _2274 & 3;
    float _2280 = (*spvDescriptorSet0.vp_c9)._m0[int(_2276)][_2278];
    int _2282 = _871 * _2256;
    int _2284 = _2282 + _1484;
    int _2286 = abs(_2042);
    float _2288 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    int _2290 = ~_2230;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = _2172 + 8;
    uint _2298 = uint(int(uint(_2296) >> uint(2)));
    uint _2300 = uint(int(uint(int(_2298)) >> uint(2)));
    int _2302 = int(_2298) & 3;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[int(_2300)][_2302];
    int _2306 = int(_2298) + 1;
    uint _2308 = uint(int(uint(_2306) >> uint(2)));
    int _2310 = _2306 & 3;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[int(_2308)][_2310];
    float _2314 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _2288);
    int _2316 = ~_2056;
    int _2318 = _2316 + _2098;
    int _2320 = _2318 + 1;
    float _2322 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _2228);
    float _2324 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2326 = int(_2324);
    int _2328 = abs(_1768);
    int _2330 = ~_2262;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    int _2336 = _2178 + 8;
    uint _2338 = uint(int(uint(_2336) >> uint(2)));
    uint _2340 = uint(int(uint(int(_2338)) >> uint(2)));
    int _2342 = int(_2338) & 3;
    float _2344 = (*spvDescriptorSet0.vp_c9)._m0[int(_2340)][_2342];
    int _2346 = int(_2338) + 1;
    uint _2348 = uint(int(uint(_2346) >> uint(2)));
    int _2350 = _2346 & 3;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[int(_2348)][_2350];
    int _2354 = abs(_2008);
    int _2356 = _930 * _2320;
    int _2358 = _2356 + _1600;
    int _2360 = abs(_2016);
    int _2362 = ~_2286;
    int _2364 = _2362 + 1;
    int _2366 = _2364 + 1;
    int _2368 = ~_2328;
    int _2370 = _2368 + 1;
    int _2372 = _2370 + 1;
    int _2374 = _2294 * as_type<int>(_2194);
    int _2376 = ~_2354;
    int _2378 = _2376 + 1;
    int _2380 = _2378 + 1;
    float _2382 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2384 = int(_2382);
    int _2386 = ~_2360;
    int _2388 = _2386 + 1;
    int _2390 = _2388 + 1;
    int _2392 = _2372 * as_type<int>(_2186);
    int _2394 = _2392 + _2374;
    int _2396 = abs(_1880);
    float _2398 = float(uint(_2326));
    int _2400 = _2334 * as_type<int>(_2218);
    int _2402 = ~_2396;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    float _2408 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2410 = int(_2408);
    int _2412 = abs(_1900);
    int _2414 = _2380 * as_type<int>(_2210);
    int _2416 = _2414 + _2400;
    int _2418 = abs(_1986);
    int _2420 = abs(_2052);
    int _2422 = _2366 * as_type<int>(_2246);
    int _2424 = ~_2418;
    int _2426 = _2424 + 1;
    int _2428 = _2426 + 1;
    int _2430 = abs(_2076);
    int _2432 = _2390 * as_type<int>(_2238);
    int _2434 = _2432 + _2422;
    int _2436 = abs(_2084);
    float _2438 = 1.0 / _2398;
    bool _2440 = !_1442;
    int _2442 = _2440 ? _2358 : (-1);
    int _2444 = _2406 * as_type<int>(_2272);
    int _2446 = _2444 + _2394;
    int _2448 = ~_2436;
    int _2450 = _2448 + 1;
    int _2452 = _2450 + 1;
    int _2454 = ~_2420;
    int _2456 = _2454 + 1;
    int _2458 = _2456 + 1;
    int _2460 = abs(_2002);
    int _2462 = _2428 * as_type<int>(_2304);
    int _2464 = _2462 + _2416;
    int _2466 = abs(_2132);
    int _2468 = _2458 * as_type<int>(_2280);
    int _2470 = _2468 + _2446;
    int _2472 = ~_2412;
    int _2474 = _2472 + 1;
    int _2476 = _2474 + 1;
    float _2478 = _968 * 2.0;
    int _2480 = ~_2466;
    int _2482 = _2480 + 1;
    int _2484 = _2482 + 1;
    float _2486 = float(uint(_2410));
    int _2488 = _2452 * as_type<int>(_2344);
    int _2490 = _2488 + _2434;
    int _2492 = abs(_2326);
    int _2494 = _2484 * as_type<int>(_2312);
    int _2496 = _2494 + _2464;
    float _2498 = float(uint(_2384));
    float _2500 = 1.0 / _2486;
    float _2502 = float(uint(_2492));
    int _2504 = _2470 * _2476;
    int _2506 = ~_2460;
    int _2508 = _2506 + 1;
    int _2510 = _2508 + 1;
    int _2512 = abs(_2410);
    int _2514 = _1856 * _2412;
    int _2516 = _2514 + _2504;
    int _2518 = as_type<int>(_2438) + (-2);
    float _2520 = 1.0 / _2502;
    bool _2522 = !_1430;
    int _2524 = _2522 ? _2284 : (-1);
    int _2526 = _2496 * _2510;
    int _2528 = abs(_2384);
    int _2530 = _2524 * _2460;
    int _2532 = _2530 + _2526;
    float _2534 = float(uint(_2512));
    float _2536 = 1.0 / _2498;
    int _2538 = abs(_2032);
    int _2540 = ~_2538;
    int _2542 = _2540 + 1;
    int _2544 = _2542 + 1;
    int _2546 = ~_2430;
    int _2548 = _2546 + 1;
    int _2550 = _2548 + 1;
    float _2552 = 1.0 / _2534;
    int _2554 = as_type<int>(_2500) + (-2);
    float _2556 = float(uint(_2516));
    int _2558 = _2550 * as_type<int>(_2352);
    int _2560 = _2558 + _2490;
    float _2562 = float(uint(_2532));
    float _2564 = float(uint(_2528));
    int _2566 = _2560 * _2544;
    int _2568 = as_type<int>(_2536) + (-2);
    float _2570 = as_type<float>(_2554) * _2562;
    int _2572 = abs(_2516);
    int _2574 = _2442 * _2538;
    int _2576 = _2574 + _2566;
    float _2578 = as_type<float>(_2518) * _2556;
    float _2580 = trunc(_2570);
    float _2582 = precise::max(_2580, 0.0);
    uint _2584 = uint(_2582);
    float _2586 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _2314);
    int _2588 = as_type<int>(_2520) + (-2);
    float _2590 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _2250);
    float _2592 = 1.0 / _2564;
    float _2594 = float(uint(_2572));
    float _2596 = _968 + _970;
    float _2598 = float(uint(_2576));
    int _2600 = abs(_2532);
    float _2602 = as_type<float>(_2588) * _2594;
    int _2604 = ~_2410;
    int _2606 = _2604 + 1;
    float _2608 = trunc(_2578);
    float _2610 = precise::max(_2608, 0.0);
    uint _2612 = uint(_2610);
    float _2614 = as_type<float>(_2568) * _2598;
    int _2616 = as_type<int>(_2552) + (-2);
    float _2618 = _2596 + (-1.0);
    float _2620 = float(uint(_2600));
    int _2622 = _2606 * int(_2584);
    int _2624 = _2622 + _2532;
    int _2626 = ~_2326;
    int _2628 = _2626 + 1;
    float _2630 = trunc(_2614);
    float _2632 = precise::max(_2630, 0.0);
    uint _2634 = uint(_2632);
    float _2636 = as_type<float>(_2616) * _2620;
    int _2638 = as_type<int>(_2592) + (-2);
    float _2640 = float(uint(_2624));
    int _2642 = ~_2492;
    int _2644 = _2642 + 1;
    float _2646 = trunc(_2602);
    float _2648 = precise::max(_2646, 0.0);
    uint _2650 = uint(_2648);
    int _2652 = abs(_2576);
    int _2654 = _2628 * int(_2612);
    int _2656 = _2654 + _2516;
    float _2658 = float(uint(_2652));
    float _2660 = float(uint(_2656));
    float _2662 = trunc(_2636);
    float _2664 = precise::max(_2662, 0.0);
    uint _2666 = uint(_2664);
    float _2668 = fma(_2618, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2670 = as_type<float>(_2638) * _2658;
    float _2672 = as_type<float>(_2554) * _2640;
    float _2674 = as_type<float>(_2518) * _2660;
    int _2676 = ~_2512;
    int _2678 = _2676 + 1;
    float _2680 = _970 + _972;
    float _2682 = floor(_2478);
    int _2684 = _2644 * int(_2650);
    int _2686 = _2684 + _2572;
    float _2688 = _2680 + (-1.0);
    bool _2690 = _970 > 0.5;
    int _2692 = ~_2384;
    int _2694 = _2692 + 1;
    float _2696 = trunc(_2670);
    float _2698 = precise::max(_2696, 0.0);
    uint _2700 = uint(_2698);
    bool _2702 = _972 > 0.5;
    float _2704 = trunc(_2674);
    float _2706 = precise::max(_2704, 0.0);
    uint _2708 = uint(_2706);
    float _2710 = float(uint(_2686));
    int _2712 = _2678 * int(_2666);
    int _2714 = _2712 + _2600;
    bool _2716 = _2682 > 0.0;
    bool _2718 = _2682 >= 0.0;
    bool _2720 = isnan(_2682);
    bool _2722 = _2718 || _2720;
    bool _2724 = isnan(0.0);
    bool _2726 = _2722 || _2724;
    float _2728 = fma(_2688, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2730 = float(uint(_2714));
    float _2732 = trunc(_2672);
    float _2734 = precise::max(_2732, 0.0);
    uint _2736 = uint(_2734);
    float _2738 = as_type<float>(_2588) * _2710;
    int _2740 = ~_2528;
    int _2742 = _2740 + 1;
    float _2744 = -_229;
    int _2746 = _2690 ? as_type<int>(_2744) : as_type<int>(_229);
    float _2748 = as_type<float>(_2616) * _2730;
    bool _2750 = _1024 != 1;
    int _2752 = _2742 * int(_2700);
    int _2754 = _2752 + _2652;
    bool _2756 = !_2138;
    float _2758 = _2756 ? _229 : as_type<float>(_2746);
    float _2760 = trunc(_2738);
    float _2762 = precise::max(_2760, 0.0);
    uint _2764 = uint(_2762);
    bool _2766 = _1026 != 2;
    int _2768 = _2694 * int(_2634);
    int _2770 = _2768 + _2576;
    int _2772 = ~_2326;
    int _2774 = _2772 + 1;
    int _2776 = int(_2612) + int(_2708);
    float _2778 = float(uint(_2754));
    float _2780 = trunc(_2748);
    float _2782 = precise::max(_2780, 0.0);
    uint _2784 = uint(_2782);
    float _2786 = float(uint(_2770));
    int _2788 = int(_2584) + int(_2736);
    float _2790 = as_type<float>(_2638) * _2778;
    int _2792 = _2774 * _2776;
    int _2794 = _2792 + _2516;
    float _2796 = as_type<float>(_2568) * _2786;
    float _2798 = -_225;
    int _2800 = _2702 ? as_type<int>(_2798) : as_type<int>(_225);
    float _2802 = sqrt(_2590);
    int _2804 = ~_2492;
    int _2806 = _2804 + 1;
    bool _2808 = uint(_2794) >= uint(_2326);
    int _2810 = int(_2650) + int(_2764);
    bool _2812 = !_2808;
    int _2814 = _2812 ? 0 : (-1);
    float _2816 = trunc(_2796);
    float _2818 = precise::max(_2816, 0.0);
    uint _2820 = uint(_2818);
    int _2822 = ~_2512;
    int _2824 = _2822 + 1;
    int _2826 = _2806 * _2810;
    int _2828 = _2826 + _2572;
    int _2830 = int(_2666) + int(_2784);
    int _2832 = ~_2776;
    int _2834 = _2832 + _2814;
    int _2836 = _2834 + 1;
    int _2838 = ~_2410;
    int _2840 = _2838 + 1;
    float _2842 = trunc(_2790);
    float _2844 = precise::max(_2842, 0.0);
    uint _2846 = uint(_2844);
    bool _2848 = uint(_2828) >= uint(_2492);
    int _2850 = _2824 * _2830;
    int _2852 = _2850 + _2600;
    bool _2854 = !_2088;
    float _2856 = _2854 ? _225 : as_type<float>(_2800);
    int _2858 = _2326 * _2836;
    int _2860 = _2858 + _2516;
    bool _2862 = _2326 == 0;
    int _2864 = _2840 * _2788;
    int _2866 = _2864 + _2532;
    bool _2868 = !_2848;
    float _2870 = _2868 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2872 = _970 * 2.0;
    int _2874 = int(_2634) + int(_2820);
    float _2876 = sqrt(_2586);
    bool _2878 = _968 > 0.5;
    float _2880 = _2802 * _2200;
    int _2882 = ~_2384;
    int _2884 = _2882 + 1;
    bool _2886 = !_2862;
    int _2888 = _2886 ? _2860 : (-1);
    float _2890 = _2880 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2892 = uint(_2866) >= uint(_2410);
    int _2894 = _2884 * _2874;
    int _2896 = _2894 + _2576;
    float _2898 = -_225;
    int _2900 = _2878 ? as_type<int>(_2898) : as_type<int>(_225);
    float _2902 = floor(_2872);
    bool _2904 = uint(_2852) >= uint(_2512);
    int _2906 = int(_2700) + int(_2846);
    bool _2908 = !_2892;
    float _2910 = _2908 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2912 = _2876 * _2202;
    bool _2914 = !_2904;
    int _2916 = _2914 ? 0 : (-1);
    bool _2918 = uint(_2896) >= uint(_2384);
    int _2920 = ~_2788;
    int _2922 = _2920 + as_type<int>(_2910);
    int _2924 = _2922 + 1;
    bool _2926 = !_2106;
    float _2928 = _2926 ? _225 : as_type<float>(_2900);
    int _2930 = ~_2528;
    int _2932 = _2930 + 1;
    int _2934 = _2410 * _2924;
    int _2936 = _2934 + _2532;
    bool _2938 = _2326 == 0;
    int _2940 = _2532 ^ _2410;
    int _2942 = _2932 * _2906;
    int _2944 = _2942 + _2652;
    int _2946 = _2516 ^ _2326;
    uint _2948 = uint(int(uint(_2940) >> uint(31)));
    uint _2950 = uint(int(uint(_2946) >> uint(31)));
    int _2952 = ~as_type<int>(_2870);
    int _2954 = _2810 + _2952;
    int _2956 = _2954 + 1;
    float _2958 = _972 * 2.0;
    int _2960 = ~_2916;
    int _2962 = _2830 + _2960;
    int _2964 = _2962 + 1;
    int _2966 = ~int(_2948);
    int _2968 = _2966 + 1;
    float _2970 = sqrt(_2322);
    int _2972 = ~int(_2950);
    int _2974 = _2972 + 1;
    float _2976 = as_type<float>(_2516);
    float _2978 = _2870;
    float _2980 = as_type<float>(_2512);
    float _2982 = _2910;
    float _2984 = as_type<float>(_2936);
    if (!_2750)
    {
        _2976 = _970;
    }
    float _2986 = _2976;
    int _2988 = _2964 ^ _2968;
    int _2990 = _2956 ^ _2974;
    float _2992 = floor(_2958);
    float _2994 = _2986;
    if (!_2750)
    {
        _2978 = _972;
    }
    float _2996 = _2978;
    float _2998 = _2996;
    if (!_2750)
    {
        _2980 = _972;
    }
    float _3000 = _2980;
    float _3002 = _3000;
    if (!_2750)
    {
        _2982 = _2986;
    }
    float _3004 = _2982;
    float _3006 = _3004;
    if (_2750)
    {
        _3006 = _968;
    }
    float _3008 = _3006;
    float _3010 = _2970 * _2122;
    if (_2750)
    {
        _2994 = _968;
    }
    float _3012 = _2994;
    if (_2750)
    {
        _2998 = _970;
    }
    float _3014 = _2998;
    float _3016 = _3008 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2750)
    {
        _3002 = _970;
    }
    float _3018 = _3002;
    bool _3020 = _2410 == 0;
    float _3022 = _3014 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _3024 = _2410 == 0;
    float _3026 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3028 = _839 + _3026;
    int _3030 = ~_2968;
    int _3032 = _3030 + _2988;
    int _3034 = _3032 + 1;
    float _3036 = _2880 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3038 = !_2918;
    int _3040 = _3038 ? 0 : (-1);
    float _3042 = fma(_2248, _3028, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _3044 = ~_2974;
    int _3046 = _3044 + _2990;
    int _3048 = _3046 + 1;
    bool _3050 = !_3020;
    int _3052 = _3050 ? _2936 : (-1);
    bool _3054 = !_3024;
    int _3056 = _3054 ? _3034 : (-1);
    int _3058 = ~_2874;
    int _3060 = _3058 + _3040;
    int _3062 = _3060 + 1;
    bool _3064 = !_2938;
    int _3066 = _3064 ? _3048 : (-1);
    int _3068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3070 = _3068 != 0;
    int _3072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3074 = _3072 != 0;
    int _3076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3078 = _3076 != 0;
    bool _3080 = uint(_2944) >= uint(_2528);
    bool _3082 = _839 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3084 = isnan(_839);
    bool _3086 = _3082 || _3084;
    bool _3088 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3090 = _3086 || _3088;
    float _3092 = float(_3090);
    bool _3094 = _839 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3096 = isnan(_839);
    bool _3098 = _3094 || _3096;
    bool _3100 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3102 = _3098 || _3100;
    float _3104 = float(_3102);
    int _3106 = _2384 * _3062;
    int _3108 = _3106 + _2576;
    bool _3110 = !_3080;
    int _3112 = _3110 ? 0 : (-1);
    bool _3114 = _2384 == 0;
    float _3116 = -_3104;
    float _3118 = _3116 + 1.0;
    if (_2766)
    {
        _2984 = _968;
    }
    float _3120 = _2984;
    float _3122 = _3120;
    if (_2766)
    {
        _1780 = _970;
    }
    float _3124 = _1780;
    float _3126 = _3092 * _3118;
    float _3128 = _3124;
    if (!_2766)
    {
        _3122 = _972;
    }
    float _3130 = _3122;
    float _3132 = -_3092;
    float _3134 = _3132 + 1.0;
    if (!_2766)
    {
        _3128 = _968;
    }
    float _3136 = _3128;
    float _3138 = _3042 * _3126;
    bool _3140 = _2992 >= 0.0;
    bool _3142 = isnan(_2992);
    bool _3144 = _3140 || _3142;
    bool _3146 = isnan(0.0);
    bool _3148 = _3144 || _3146;
    float _3150 = _2880 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3152 = !_3114;
    int _3154 = _3152 ? _3108 : (-1);
    float _3156 = fma(_3134, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3138);
    bool _3158 = !_3070;
    int _3160 = _3158 ? 0 : 1;
    float _3162 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2890);
    bool _3164 = _2902 > 0.0;
    float _3166 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3150);
    bool _3168 = _2902 >= 0.0;
    bool _3170 = isnan(_2902);
    bool _3172 = _3168 || _3170;
    bool _3174 = isnan(0.0);
    bool _3176 = _3172 || _3174;
    float _3178 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3036);
    int _3180 = _3148 ? 0 : 1;
    float _3182 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3166);
    bool _3184 = _2992 > 0.0;
    float _3186 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3178);
    int _3188 = ~_3180;
    int _3190 = _3188 + 1;
    int _3192 = _3190 + 1;
    int _3194 = ~_3112;
    int _3196 = _2906 + _3194;
    int _3198 = _3196 + 1;
    float _3200 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3202 = float(_2888);
    int _3204 = _3192;
    if (!_3184)
    {
        int _3206 = ~_3180;
        int _3208 = _3206 + 1;
        _3204 = _3208;
    }
    int _3210 = _3204;
    float _3212 = fma(_3104, (*spvDescriptorSet0.vp_c9)._m0[132].x, _3156);
    float _3214 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3216 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3162);
    float _3218 = _2198 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    bool _3220 = _2384 == 0;
    float _3222 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3224 = _2576 ^ _2384;
    float _3226 = _3130 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3228 = _3200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3230 = _3214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3232 = _3222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3234 = _3212 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3236 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[24].w, _3216);
    float _3238 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[25].w, _3182);
    float _3240 = fma(_3218, (*spvDescriptorSet0.vp_c8)._m0[26].w, _3186);
    out.m_74.x = _3228;
    out.m_74.y = _3230;
    out.m_74.z = _3232;
    out.m_74.w = _3234;
    uint _3242 = uint(int(uint(_3224) >> uint(31)));
    float _3244 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3248 = ~int(_3242);
    int _3250 = _3248 + 1;
    float _3252 = -_3244;
    float _3254 = fma(_3226, 2.0, _3252);
    float _3256 = float(_3210);
    int _3258 = _3198 ^ _3250;
    float _3260 = -_149;
    float _3262 = fma(_3260, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3254);
    float _3264 = float(_3052);
    float _3266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3268 = ~_3250;
    int _3270 = _3268 + _3258;
    int _3272 = _3270 + 1;
    float _3274 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3276 = fma(_3012, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3274);
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3280 = _3238 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _3282 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _3284 = abs(_3160);
    float _3286 = fma(_3018, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3278);
    float _3288 = _3236 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _3290 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3292 = _3280 + _3290;
    float _3294 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3296 = _3240 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _3298 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3300 = _3288 + _3298;
    float _3302 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3304 = -_3282;
    float _3306 = fma(_3016, 2.0, _3304);
    float _3308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3312 = _3296 + _3310;
    float _3314 = fma(_3300, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3302);
    float _3316 = _3136 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3318 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3320 = float(_3284);
    float _3322 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3314);
    float _3324 = fma(_3316, -2.0, _3294);
    float _3326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3328 = fma(_3022, -2.0, _3318);
    bool _3330 = !_3220;
    int _3332 = _3330 ? _3272 : (-1);
    float _3334 = _3320 * _3256;
    bool _3336 = _3322 >= 0.0;
    float _3338 = _3246 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3340 = _3266 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3342 = -_149;
    float _3344 = fma(_3342, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3306);
    float _3346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3348 = _3308 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3350 = float(_3154);
    float _3352 = fma(_3338, _3202, _2260);
    float _3354 = fma(_3340, _3264, _3344);
    float _3356 = _2928 + 0.5;
    float _3358 = float(_3066);
    float _3360 = fma(_3348, _3350, _3262);
    float _3362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3364 = _3326 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3366 = _1128 + 0.5;
    float _3368 = fma(_3338, _3356, _3352);
    float _3370 = float(_3056);
    float _3372 = -_2160;
    float _3374 = fma(_3364, _3358, _3372);
    float _3376 = fma(_3348, _3366, _3360);
    float _3378 = _3346 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3380 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3328);
    float _3382 = float(_3332);
    float _3384 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3324);
    float _3386 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3388 = -_3380;
    float _3390 = fma(_3378, _3370, _3388);
    float _3392 = _2758 + (-0.5);
    float _3394 = _3362 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3396 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3386);
    float _3398 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3276);
    float _3400 = -_3364;
    float _3402 = fma(_3400, _3392, _3374);
    float _3404 = -_3384;
    float _3406 = fma(_3394, _3382, _3404);
    float _3408 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3410 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3396);
    float _3412 = _2856 + 0.5;
    float _3414 = _1348 + (-0.5);
    float _3416 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3408);
    float _3418 = -_3398;
    float _3420 = _3418 + 1.0;
    float _3422 = fma(_3340, _3412, _3354);
    float _3424 = -_3378;
    float _3426 = fma(_3424, _3414, _3390);
    float _3428 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3416);
    float _3430 = -_3420;
    float _3432 = fma(_2856, _3430, _3422);
    float _3434 = -_3410;
    float _3436 = _3434 + 1.0;
    float _3438 = -_3428;
    float _3440 = _3438 + 1.0;
    float _3442 = _1164 + (-0.5);
    float _3444 = -_3436;
    float _3446 = fma(_2928, _3444, _3368);
    float _3448 = fma(_2758, _3440, _3402);
    float _3450 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3452 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3454 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3456 = log2(_3454);
    float _3458 = _3292 * _3292;
    float _3460 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3450);
    float _3462 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3452);
    float _3464 = -_3394;
    float _3466 = fma(_3464, _3442, _3406);
    float _3468 = fma(_3300, _3300, _3458);
    float _3470 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3460);
    float _3472 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3462);
    float _3474 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3286);
    float _3476 = fma(_3312, _3312, _3468);
    float _3478 = -_3470;
    float _3480 = _3478 + 1.0;
    float _3482 = -_3472;
    float _3484 = _3482 + 1.0;
    float _3486 = -_3474;
    float _3488 = _3486 + 1.0;
    float _3490 = _3468;
    if (_3336)
    {
        _3490 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3492 = _3490;
    float _3494 = fma(_1164, _3480, _3466);
    float _3496 = -_3484;
    float _3498 = fma(_1128, _3496, _3376);
    float _3500 = in.m_76.x;
    float _3502 = in.m_76.y;
    float _3504 = in.m_76.z;
    float _3506 = rsqrt(_3476);
    float _3508 = _3456 * _149;
    float _3510 = fma(_1348, _3488, _3426);
    float _3512 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3514 = 1.0 + _3512;
    int _3516 = as_type<int>(_3492);
    if (_3336)
    {
        float _3518 = _3492 * 5.0;
        _3516 = as_type<int>(_3518);
    }
    int _3520 = _3516;
    out.m_78.x = _3498;
    out.m_78.y = _3494;
    bool _3522 = !_3074;
    int _3524 = _3522 ? 0 : 1;
    float _3526 = exp2(_3508);
    bool _3528 = !_3078;
    int _3530 = _3528 ? 0 : 1;
    if (_3336)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10571 = as_type<float>(_3520);
        out.gl_Position.z = _10571;
    }
    bool _3532 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3534 = isnan(0.0);
    bool _3536 = _3532 || _3534;
    bool _3538 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3540 = _3536 || _3538;
    bool _3542 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3544 = isnan(1.0);
    bool _3546 = _3542 || _3544;
    bool _3548 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3550 = _3546 || _3548;
    out.m_80.x = _3446;
    out.m_80.y = _3448;
    out.m_80.z = _3432;
    out.m_80.w = _3510;
    float _3552 = 1.0 / _3514;
    float _3554 = _3292 * _3506;
    if (_3336)
    {
        out.m_61.x = 0.0;
    }
    float _3556 = _3300 * _3506;
    if (_3336)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3558 = -_3554;
    float _3560 = fma(_3558, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3280);
    float _3562 = -_3526;
    float _3564 = _3562 + 1.0;
    float _3566 = _3312 * _3506;
    float _3568 = -_3556;
    float _3570 = fma(_3568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3288);
    float _3572 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3574 = _3560 + _3572;
    int _3576 = _2726 ? 0 : 1;
    float _3578 = -_3566;
    float _3580 = fma(_3578, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3296);
    float _3582 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3584 = _3570 + _3582;
    float _3586 = _3574 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3588 = ~_3576;
    int _3590 = _3588 + 1;
    int _3592 = _3590 + 1;
    float _3594 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3596 = _3580 + _3594;
    int _3598 = _3592;
    float _3600 = _3566;
    if (!_2716)
    {
        int _3602 = ~_3576;
        int _3604 = _3602 + 1;
        _3598 = _3604;
    }
    int _3606 = _3598;
    float _3608 = _3334 * (-2.0);
    float _3610 = fma(_3584, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3586);
    int _3612 = abs(_3524);
    float _3614 = -_3554;
    float _3616 = fma(_3614, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3292);
    float _3618 = _3540 ? _3564 : 0.0;
    float _3620 = fma(_2668, _3608, _2668);
    float _3622 = fma(_3608, _3500, _3500);
    float _3624 = fma(_3596, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3610);
    if (_3550)
    {
        float _3626 = _3618 * _3552;
        _153 = _3626;
    }
    float _3628 = _153;
    float _3630 = -_3556;
    float _3632 = fma(_3630, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3300);
    float _3634 = _3616 * _3616;
    float _3636 = _968 + (-0.5);
    float _3638 = float(_3606);
    float _3640 = -_3566;
    float _3642 = fma(_3640, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3312);
    float _3644 = float(_3612);
    float _3646 = fma(_3632, _3632, _3634);
    bool _3648 = _3624 >= 0.0;
    float _3650 = fma(_3636, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3622);
    int _3652 = _3176 ? 0 : 1;
    float _3654 = _3644 * _3638;
    float _3656 = fma(_3642, _3642, _3646);
    float _3658 = fma(_3620, _3628, _3650);
    int _3660 = ~_3652;
    int _3662 = _3660 + 1;
    int _3664 = _3662 + 1;
    float _3666 = _3654 * (-2.0);
    int _3668 = _3664;
    float _3670 = _3638;
    if (!_3164)
    {
        int _3672 = ~_3652;
        int _3674 = _3672 + 1;
        _3668 = _3674;
    }
    int _3676 = _3668;
    float _3678 = _3658 * 0.15915493667125701904296875;
    float _3680 = sqrt(_3656);
    float _3682 = fma(_2728, _3666, _2728);
    float _3684 = fma(_3666, _3502, _3502);
    if (_3648)
    {
        _3670 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3686 = _3670;
    int _3688 = as_type<int>(_3686);
    if (_3648)
    {
        out.m_61.x = 0.0;
    }
    float _3690 = _970 + (-0.5);
    int _3692 = abs(_3530);
    float _3694 = _3678 * 6.283185482025146484375;
    float _3696 = sin(_3694);
    if (_3648)
    {
        float _3698 = _3686 * 5.0;
        _3688 = as_type<int>(_3698);
    }
    int _3700 = _3688;
    if (_3648)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10848 = as_type<float>(_3700);
        out.gl_Position.z = _10848;
    }
    if (_3648)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3702 = -_3280;
    float _3704 = _3702 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3706 = -_3288;
    float _3708 = _3706 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3710 = float(_3676);
    float _3712 = -_3296;
    float _3714 = _3712 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3716 = _3704 * _3704;
    float _3718 = float(_3692);
    float _3720 = _968 + _972;
    float _3722 = fma(_3690, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3684);
    float _3724 = fma(_3708, _3708, _3716);
    float _3726 = _972 + (-0.5);
    float _3728 = _3718 * _3710;
    float _3730 = fma(_3714, _3714, _3724);
    float _3732 = _3720 + (-1.0);
    float _3734 = _3728 * (-2.0);
    float _3736 = fma(_3682, _3628, _3722);
    float _3738 = _3678 * 6.283185482025146484375;
    float _3740 = cos(_3738);
    float _3742 = fma(_3732, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3744 = fma(_3734, _3504, _3504);
    float _3746 = _3736 * 0.15915493667125701904296875;
    float _3748 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3750 = fma(_3742, _3734, _3742);
    float _3752 = fma(_3726, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3744);
    float _3754 = rsqrt(_3730);
    float _3756 = fma(_3750, _3628, _3752);
    float _3758 = _3756 * 0.15915493667125701904296875;
    float _3760 = _3746 * 6.283185482025146484375;
    float _3762 = sin(_3760);
    float _3764 = _3708 * _3754;
    float _3766 = _3714 * _3754;
    float _3768 = _3704 * _3754;
    float _3770 = _3746 * 6.283185482025146484375;
    float _3772 = cos(_3770);
    float _3774 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3776 = _3764 * _3774;
    float _3778 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3780 = _3766 * _3778;
    float _3782 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3784 = _3768 * _3782;
    float _3786 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3788 = -_3776;
    float _3790 = fma(_3766, _3786, _3788);
    float _3792 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3794 = -_3780;
    float _3796 = fma(_3768, _3792, _3794);
    float _3798 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3800 = -_3784;
    float _3802 = fma(_3764, _3798, _3800);
    float _3804 = _3758 * 6.283185482025146484375;
    float _3806 = sin(_3804);
    float _3808 = _3790 * _3790;
    float _3810 = _3696 * _3762;
    float _3812 = _3740 * _3762;
    float _3814 = fma(_3796, _3796, _3808);
    float _3816 = _3506 * _3680;
    float _3818 = _3758 * 6.283185482025146484375;
    float _3820 = cos(_3818);
    float _3822 = fma(_3802, _3802, _3814);
    float _3824 = _3740 * _3772;
    float _3826 = _693 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _229);
    float _3830 = _229 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3832 = _3816 * _3826;
    float _3834 = rsqrt(_3822);
    float _3836 = fma(_3806, _3824, _3810);
    float _3838 = fma(_3806, _3810, _3824);
    float _3840 = _3696 * _3772;
    float _3842 = _3740 * _3820;
    float _3844 = _3816 * _3748;
    float _3846 = _3772 * _3820;
    float _3848 = _3696 * _3820;
    float _3850 = _3762 * _3820;
    float _3852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _225);
    float _3854 = _3828 * _3844;
    float _3856 = -_3812;
    float _3858 = fma(_3806, _3840, _3856);
    float _3860 = _3796 * _3834;
    float _3862 = _3852 * _3832;
    float _3864 = _3790 * _3834;
    float _3866 = _3802 * _3834;
    float _3868 = _3842 * _3854;
    float _3870 = -_3840;
    float _3872 = fma(_3806, _3812, _3870);
    float _3874 = -_3854;
    float _3876 = _3806 * _3874;
    float _3878 = _3848 * _3854;
    float _3880 = fma(_3836, _3862, _3868);
    float _3882 = _3816 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3884 = _3882 * 0.5;
    float _3886 = _3766 * _3864;
    float _3888 = _3768 * _3860;
    float _3890 = fma(_3846, _3862, _3876);
    float _3892 = fma(_3872, _3884, _3880);
    float _3894 = -_3886;
    float _3896 = fma(_3768, _3866, _3894);
    float _3898 = -_3888;
    float _3900 = fma(_3764, _3864, _3898);
    float _3902 = fma(_3858, _3862, _3878);
    float _3904 = fma(_3850, _3884, _3890);
    float _3906 = _3896 * _3892;
    float _3908 = _3900 * _3892;
    float _3910 = fma(_3838, _3884, _3902);
    float _3912 = _3764 * _3866;
    float _3914 = fma(_3860, _3904, _3906);
    float _3916 = fma(_3866, _3904, _3908);
    float _3918 = _3836 * _3900;
    float _3920 = -_3912;
    float _3922 = fma(_3766, _3860, _3920);
    float _3924 = fma(_3764, _3910, _3914);
    float _3926 = fma(_3766, _3910, _3916);
    float _3928 = _3836 * _3896;
    float _3930 = _3836 * _3922;
    float _3932 = _3288 + _3924;
    float _3934 = _3296 + _3926;
    float _3936 = _3842 * _3896;
    float _3938 = _3842 * _3922;
    float _3940 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3942 = _3932 + _3940;
    float _3944 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3946 = _3934 + _3944;
    float _3948 = _3842 * _3900;
    float _3950 = _3872 * _3896;
    float _3952 = _3942 * _3942;
    float _3954 = _3946 * _3946;
    float _3956 = _3872 * _3900;
    float _3958 = _3872 * _3922;
    float _3960 = fma(_3846, _3860, _3928);
    float _3962 = _3952 + _3954;
    float _3964 = fma(_3846, _3864, _3930);
    float _3966 = fma(_3846, _3866, _3918);
    float _3968 = fma(_3830, _3830, 1.0);
    float _3970 = sqrt(_3962);
    float _3972 = _3922 * _3892;
    float _3974 = -_3806;
    float _3976 = fma(_3974, _3864, _3938);
    float _3978 = -_3806;
    float _3980 = fma(_3978, _3866, _3948);
    float _3982 = fma(_3850, _3864, _3958);
    float _3984 = fma(_3864, _3904, _3972);
    float _3986 = -_3806;
    float _3988 = fma(_3986, _3860, _3936);
    float _3990 = fma(_3850, _3860, _3950);
    float _3992 = rsqrt(_3968);
    float _3994 = fma(_3768, _3910, _3984);
    float _3996 = fma(_3850, _3866, _3956);
    float _3998 = _3280 + _3994;
    bool _4000 = _3970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4002 = _3950;
    float _4004 = _3864;
    float _4006 = _3860;
    float _4008 = _3952;
    float _4010 = _3954;
    uint _4012 = as_type<uint>(_3816);
    if (!_4000)
    {
        _4002 = _3932;
    }
    float _4014 = _4002;
    float _4016 = _4014;
    if (!_4000)
    {
        _4004 = _3934;
    }
    float _4018 = _4004;
    float _4020 = _4018;
    if (!_4000)
    {
        _4006 = _3998;
    }
    float _4022 = _4006;
    bool _4024 = !_4000;
    float _4026 = _4022;
    if (!_4024)
    {
        float _4028 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4030 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4032 = _3970 + _4030;
        float _4034 = rsqrt(_3962);
        float _4036 = _4032 * _4028;
        float _4038 = _3998 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4040 = _4036 * 0.15915493667125701904296875;
        float _4042 = _4040 * 6.283185482025146484375;
        float _4044 = sin(_4042);
        float _4046 = _4040 * 6.283185482025146484375;
        float _4048 = cos(_4046);
        float _4050 = fma(_4044, _4038, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4052 = _4034 * _4050;
        float _4054 = fma(_3942, _4052, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4056 = _4048 + (-1.0);
        float _4058 = fma(_3946, _4052, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4060 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4062 = _4054 + _4060;
        float _4064 = _4056 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4066 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4068 = _4058 + _4066;
        float _4070 = _4062 * _4062;
        float _4072 = fma(_3998, _4048, _4064);
        float _4074 = _4068 * _4068;
        _4026 = _4072;
        _4008 = _4070;
        _4010 = _4074;
        _4016 = _4054;
        _4020 = _4058;
    }
    float _4076 = _4026;
    float _4078 = _4008;
    float _4080 = _4010;
    float _4082 = _4016;
    float _4084 = _4020;
    float _4086 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4088 = _4076 + _4086;
    float _4090 = fma(_3848, _3764, _3988);
    float _4092 = fma(_3848, _3768, _3976);
    float _4094 = fma(_3848, _3766, _3980);
    float _4096 = fma(_4088, _4088, _4078);
    float _4098 = fma(_3838, _3764, _3990);
    float _4100 = fma(_3838, _3768, _3982);
    float _4102 = fma(_3838, _3766, _3996);
    float _4104 = _4096 + _4080;
    float _4106 = _3830 * _3992;
    float _4108 = fma(_3858, _3764, _3960);
    float _4110 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4112 = _3830 * _4090;
    float _4114 = fma(_3858, _3768, _3964);
    float _4116 = _3830 * _4092;
    float _4118 = fma(_3858, _3766, _3966);
    float _4120 = _3830 * _4094;
    float _4122 = -_4098;
    float _4124 = _4106 * _4122;
    float _4126 = -_4100;
    float _4128 = _4106 * _4126;
    float _4130 = -_4102;
    float _4132 = _4106 * _4130;
    float _4134 = fma(_4110, _4108, _4112);
    float _4136 = sqrt(_4104);
    float _4138 = fma(_4110, _4114, _4116);
    float _4140 = fma(_4110, _4118, _4120);
    float _4142 = fma(_3992, _4090, _4124);
    float _4144 = fma(_3992, _4092, _4128);
    float _4146 = _4100 + _4138;
    float _4148 = fma(_3992, _4094, _4132);
    float _4150 = _4098 + _4134;
    float _4152 = _4102 + _4140;
    out.m_82.x = _4108;
    out.m_82.y = _4114;
    out.m_82.z = _4118;
    out.m_84.x = _4142;
    out.m_84.y = _4144;
    out.m_84.z = _4148;
    bool _4154 = _4136 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4156 = isnan(_4136);
    bool _4158 = _4154 || _4156;
    bool _4160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4162 = _4158 || _4160;
    out.m_86.x = _4150;
    out.m_86.y = _4146;
    out.m_86.z = _4152;
    float _4164 = _4080;
    if (!_4162)
    {
        _4164 = 1.0;
    }
    float _4166 = _4164;
    bool _4168 = !_4162;
    float _4170 = _4166;
    if (!_4168)
    {
        bool _4172 = _4136 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4174 = isnan(_4136);
        bool _4176 = _4172 || _4174;
        bool _4178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4180 = _4176 || _4178;
        if (!_4180)
        {
            float _4182 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4184 = _4136 + _4182;
            float _4186 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4188 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4186;
            float _4190 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4192 = _4190 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4194 = 1.0 / _4188;
            float _4196 = _4184 * _4194;
            float _4198 = fma(_4196, _4192, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4170 = _4198;
            _4200 = true;
        }
        else
        {
            bool _4202 = _4136 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4204 = isnan(_4136);
            bool _4206 = _4202 || _4204;
            bool _4208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4210 = _4206 || _4208;
            if (!_4210)
            {
                float _4212 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4214 = _4136 + _4212;
                float _4216 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4218 = _4216 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4220 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4222 = _4220 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4224 = 1.0 / _4218;
                float _4226 = _4214 * _4224;
                float _4228 = fma(_4226, _4222, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4170 = _4228;
                _4200 = true;
            }
            else
            {
                _4170 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4200 = false;
    float _4230 = _4170;
    float _4232 = fma(_3570, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4234 = fma(_3580, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4236 = floor(_4232);
    float _4238 = floor(_4234);
    float _4240 = -_4236;
    float _4242 = _4232 + _4240;
    float _4244 = -_4238;
    float _4246 = _4234 + _4244;
    float2 _11737 = float2(_4242, _4246);
    float _4248 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11737, float2(0.0), isnan(_11737)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11737, float2(0.0), isnan(_11737)), level(0.0)).x;
    float _4250 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4252 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4254 = _4082 + _4252;
    float _4256 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4250);
    float _4258 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4260 = _4084 + _4258;
    float _4262 = fma(_4254, _4230, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _4264 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4266 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4268 = _4264 || _4266;
    bool _4270 = isnan(0.5);
    bool _4272 = _4268 || _4270;
    float _4274 = fma(_3580, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4256);
    float _4276 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4278 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4280 = _4076 + _4278;
    float _4282 = _4274 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4284 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4276);
    float _4286 = fma(_4260, _4230, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4288 = -_3556;
    float _4290 = fma(_4288, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4262);
    float _4292 = 1.0 / _4282;
    float _4294 = fma(_3580, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4284);
    float _4296 = fma(_4280, _4230, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4298 = -_3566;
    float _4300 = fma(_4298, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4286);
    int _4302 = 2;
    float _4304 = _4300;
    int _4306 = as_type<int>(_4290);
    if (_4272)
    {
        _3600 = _4290;
    }
    float _4308 = _3600;
    float _4310 = _4294 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4312 = -_3554;
    float _4314 = fma(_4312, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4296);
    float _4316 = _4310 + _4282;
    float _4318 = _4316 * _4292;
    float _4320 = _4318 * 0.5;
    float _4322 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4324 = fma(_4320, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4322);
    float _4326 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _4328 = 1.0 / _4324;
    float _4330 = _3560 + _4326;
    float _4332 = _4330 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4334 = fma(_3570, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4332);
    float _4336 = fma(_3580, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4334);
    float _4338 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4340 = _4328 * _4338;
    float _4342 = _4330 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4344 = _4336 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _4346 = _4340 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4348 = fma(_3570, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4342);
    bool _4350 = _4340 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4352 = trunc(_4344);
    int _4354 = int(_4352);
    bool _4356 = !_4346;
    int _4358 = _4356 ? 0 : 1;
    float _4360 = fma(_3580, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4348);
    float _4362 = _4360 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _4364 = _4314;
    float _4366 = _4308;
    if (!_4346)
    {
        _4302 = 1;
    }
    int _4368 = _4302;
    float _4370 = trunc(_4362);
    int _4372 = int(_4370);
    int _4374 = _4368;
    if (!_4350)
    {
        _4374 = _4358;
    }
    int _4376 = _4374;
    int _4378 = _4376 << 6;
    int _4380 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4382 = _4354 + _4380;
    int _4384 = _4382 + 1;
    int _4386 = _4378 + 48;
    uint _4388 = uint(int(uint(_4386) >> uint(2)));
    uint _4390 = uint(int(uint(int(_4388)) >> uint(2)));
    int _4392 = int(_4388) & 3;
    float _4394 = (*spvDescriptorSet0.vp_c15)._m0[int(_4390)][_4392];
    int _4396 = int(_4388) + 1;
    uint _4398 = uint(int(uint(_4396) >> uint(2)));
    int _4400 = _4396 & 3;
    float _4402 = (*spvDescriptorSet0.vp_c15)._m0[int(_4398)][_4400];
    bool _4404 = _4384 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4406 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4408 = _4372 + _4406;
    int _4410 = _4408 + 1;
    int _4412 = _4378 + 56;
    uint _4414 = uint(int(uint(_4412) >> uint(2)));
    uint _4416 = uint(int(uint(int(_4414)) >> uint(2)));
    int _4418 = int(_4414) & 3;
    float _4420 = (*spvDescriptorSet0.vp_c15)._m0[int(_4416)][_4418];
    int _4422 = int(_4414) + 1;
    uint _4424 = uint(int(uint(_4422) >> uint(2)));
    int _4426 = _4422 & 3;
    float _4428 = (*spvDescriptorSet0.vp_c15)._m0[int(_4424)][_4426];
    int _4430 = _4384 | _4410;
    bool _4432 = _4430 < 0;
    bool _4434 = _4432 || _4404;
    int _4436 = _4378 + 64;
    uint _4438 = uint(int(uint(_4436) >> uint(2)));
    uint _4440 = uint(int(uint(int(_4438)) >> uint(2)));
    int _4442 = int(_4438) & 3;
    float _4444 = (*spvDescriptorSet0.vp_c15)._m0[int(_4440)][_4442];
    int _4446 = int(_4438) + 1;
    uint _4448 = uint(int(uint(_4446) >> uint(2)));
    int _4450 = _4446 & 3;
    float _4452 = (*spvDescriptorSet0.vp_c15)._m0[int(_4448)][_4450];
    bool _4454 = _4410 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4456 = _4454 || _4434;
    int _4458 = _4378 + 72;
    uint _4460 = uint(int(uint(_4458) >> uint(2)));
    uint _4462 = uint(int(uint(int(_4460)) >> uint(2)));
    int _4464 = int(_4460) & 3;
    float _4466 = (*spvDescriptorSet0.vp_c15)._m0[int(_4462)][_4464];
    int _4468 = int(_4460) + 1;
    uint _4470 = uint(int(uint(_4468) >> uint(2)));
    int _4472 = _4468 & 3;
    float _4474 = (*spvDescriptorSet0.vp_c15)._m0[int(_4470)][_4472];
    int _4476 = _4378 + 96;
    uint _4478 = uint(int(uint(_4476) >> uint(2)));
    uint _4480 = uint(int(uint(int(_4478)) >> uint(2)));
    int _4482 = int(_4478) & 3;
    float _4484 = (*spvDescriptorSet0.vp_c15)._m0[int(_4480)][_4482];
    int _4486 = int(_4478) + 1;
    uint _4488 = uint(int(uint(_4486) >> uint(2)));
    int _4490 = _4486 & 3;
    float _4492 = (*spvDescriptorSet0.vp_c15)._m0[int(_4488)][_4490];
    int _4494 = _4378 + 104;
    uint _4496 = uint(int(uint(_4494) >> uint(2)));
    uint _4498 = uint(int(uint(int(_4496)) >> uint(2)));
    int _4500 = int(_4496) & 3;
    float _4502 = (*spvDescriptorSet0.vp_c15)._m0[int(_4498)][_4500];
    int _4504 = int(_4496) + 1;
    uint _4506 = uint(int(uint(_4504) >> uint(2)));
    int _4508 = _4504 & 3;
    float _4510 = (*spvDescriptorSet0.vp_c15)._m0[int(_4506)][_4508];
    float _4512 = as_type<float>(_4376);
    if (!_4272)
    {
        float _4514 = _3574 * _3574;
        float _4516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4518 = -_3296;
        float _4520 = _4518 + _4286;
        float _4522 = -_3280;
        float _4524 = _4522 + _4296;
        float _4526 = fma(_3584, _3584, _4514);
        float _4528 = fma(_3596, _3596, _4526);
        float _4530 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4532 = sqrt(_4528);
        float _4534 = 1.0 / _3816;
        float _4536 = _4530 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4538 = precise::min(_4532, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4540 = _4538 * _4516;
        float _4542 = -_3288;
        float _4544 = _4542 + _4262;
        float _4546 = _4540 * _4534;
        float _4548 = _4536 * _4546;
        float _4550 = _4520 * _4546;
        float _4552 = fma(_4524, _4548, _3560);
        float _4554 = fma(_4544, _4548, _3570);
        float _4556 = fma(_4536, _4550, _3580);
        _4364 = _4552;
        _4366 = _4554;
        _4012 = as_type<uint>(_4534);
        _4304 = _4556;
    }
    float _4558 = _4364;
    float _4560 = _4366;
    uint _4562 = _4012;
    float _4564 = _4304;
    float _4566 = _4330 * _4492;
    float _4568 = _4558 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    uint _4570 = _4562;
    int _4572 = as_type<int>(_4568);
    if (!_4456)
    {
        int _4574 = _4410 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4576 = _4574 + _4384;
        _4570 = uint(_4576);
    }
    uint _4578 = _4570;
    float _4580 = _4330 * _4452;
    float _4582 = fma(_3570, _4484, _4566);
    float _4584 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4568);
    float _4586 = _4330 * _4402;
    int _4588 = as_type<int>(_4582);
    if (!_4456)
    {
        uint _4590 = uint(int(uint(int(_4578)) >> uint(2)));
        _4572 = int(_4590);
    }
    int _4592 = _4572;
    float _4594 = fma(_3580, _4502, _4582);
    float _4596 = fma(_4564, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4584);
    if (!_4456)
    {
        int _4598 = int(_4578) << 2;
        _4588 = _4598;
    }
    int _4600 = _4588;
    float _4602 = fma(_3570, _4394, _4586);
    float _4604 = _4594 + _4510;
    int _4606 = _4378 + 80;
    uint _4608 = uint(int(uint(_4606) >> uint(2)));
    uint _4610 = uint(int(uint(int(_4608)) >> uint(2)));
    int _4612 = int(_4608) & 3;
    float _4614 = (*spvDescriptorSet0.vp_c15)._m0[int(_4610)][_4612];
    int _4616 = int(_4608) + 1;
    uint _4618 = uint(int(uint(_4616) >> uint(2)));
    int _4620 = _4616 & 3;
    float _4622 = (*spvDescriptorSet0.vp_c15)._m0[int(_4618)][_4620];
    int _4624 = _4600;
    if (!_4456)
    {
        int _4626 = 12 & _4600;
        _4624 = _4626;
    }
    int _4628 = _4624;
    float _4630 = fma(_3570, _4444, _4580);
    float _4632 = fma(_3580, _4420, _4602);
    float _4634 = _4596 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4636 = 1.0 / _4604;
    if (!_4456)
    {
        int _4638 = _4592 << 4;
        int _4640 = _4638 + _4628;
        _4306 = _4640;
    }
    int _4642 = _4306;
    float _4644 = fma(_3580, _4466, _4630);
    int _4646 = _4378 + 88;
    uint _4648 = uint(int(uint(_4646) >> uint(2)));
    uint _4650 = uint(int(uint(int(_4648)) >> uint(2)));
    int _4652 = int(_4648) & 3;
    float _4654 = (*spvDescriptorSet0.vp_c15)._m0[int(_4650)][_4652];
    int _4656 = int(_4648) + 1;
    uint _4658 = uint(int(uint(_4656) >> uint(2)));
    int _4660 = _4656 & 3;
    float _4662 = (*spvDescriptorSet0.vp_c15)._m0[int(_4658)][_4660];
    float _4664 = _4632 + _4428;
    float _4666 = _4558 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4668 = _4558 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4670 = _4644 + _4474;
    float _4672 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4674 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4666);
    float _4676 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4668);
    float _4678 = _4402;
    if (!_4456)
    {
        int _4680 = _4642 + 400;
        uint _4682 = uint(int(uint(_4680) >> uint(2)));
        uint _4684 = uint(int(uint(int(_4682)) >> uint(2)));
        int _4686 = int(_4682) & 3;
        float _4688 = (*spvDescriptorSet0.vp_c15)._m0[int(_4684)][_4686];
        _4678 = _4688;
    }
    float _4690 = _4678;
    float _4692 = _4634 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4694 = fma(_4564, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4674);
    float _4696 = fma(_4564, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4676);
    float _4698 = _4602;
    if (!_4456)
    {
        float _4700 = floor(_4362);
        _4698 = _4700;
    }
    float _4702 = _4698;
    float _4704 = _4664 * _4636;
    float _4706 = -_4692;
    float _4708 = fma(_4706, _4672, 1.0);
    float _4710 = _4558 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4712 = _4696 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4714 = _4694 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _4716 = _4704 >= 0.0;
    float _4718 = _4670 * _4636;
    float _4720 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4710);
    float _4722 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _4724 = _4704 <= 1.0;
    bool _4726 = _4724 && _4716;
    float _4728 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4730 = fma(_4564, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4720);
    float _4732 = fma(_4714, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4722);
    bool _4734 = _4718 >= 0.0;
    bool _4736 = _4734 && _4726;
    float _4738 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4740 = _4730 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4742 = fma(_4634, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4732);
    bool _4744 = _4718 <= 1.0;
    bool _4746 = _4744 && _4736;
    float _4748 = log2(_4708);
    float _4750 = fma(_4714, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4728);
    float _4752 = fma(_4740, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4742);
    float _4754 = fma(_4714, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4738);
    float _4756 = _4702;
    float _4758 = _4728;
    if (!_4456)
    {
        float _4760 = -_4702;
        float _4762 = _4362 + _4760;
        _4756 = _4762;
    }
    float _4764 = _4756;
    float _4766 = fma(_4634, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4750);
    float _4768 = 1.0 / _4752;
    float _4770 = _4330 * _4622;
    float _4772 = fma(_4740, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4766);
    if (_4746)
    {
        float _4774 = float(_4376);
        _4512 = _4774;
    }
    float _4776 = _4512;
    float _4778 = fma(_3570, _4614, _4770);
    float _4780 = fma(_4634, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4754);
    float _4782 = _4630;
    if (!_4456)
    {
        float _4784 = floor(_4344);
        _4782 = _4784;
    }
    float _4786 = _4782;
    float _4788 = fma(_3580, _4654, _4778);
    float _4790 = fma(_4740, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4780);
    float _4792 = _4748 * 0.693147182464599609375;
    float _4794 = _4788 + _4662;
    float _4796 = _4792 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4798 = _4754;
    if (_4746)
    {
        float _4800 = rint(_4776);
        float _4802 = precise::max(_4800, 0.0);
        uint _4804 = uint(_4802);
        uint _4806 = clamp(_4804, 0u, 65535u);
        _4798 = as_type<float>(_4806);
    }
    float _4808 = _4798;
    float _4810 = _4790 * _4768;
    float _4812 = _4772 * _4768;
    float _4814 = _4794 * _4636;
    float _4816 = fma(_4812, -0.5, 0.5);
    float _4818 = _4766;
    float _4820 = _4768;
    if (!_4456)
    {
        float _4822 = rint(_4690);
        float _4824 = precise::max(_4822, 0.0);
        uint _4826 = uint(_4824);
        uint _4828 = clamp(_4826, 0u, 65535u);
        _4818 = as_type<float>(_4828);
    }
    float _4830 = _4818;
    float _4832 = fma(_4810, 0.5, 0.5);
    float _4834 = _4786;
    if (!_4456)
    {
        float _4836 = -_4786;
        float _4838 = _4344 + _4836;
        _4820 = _4838;
    }
    float _4840 = _4820;
    float _4842 = _4718;
    if (_4746)
    {
        float3 _12757 = float3(_4704, _4718, float(as_type<int>(_4808)));
        float3 _12761 = select(_12757, float3(0.0), isnan(_12757));
        float _4844 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12761.xy, uint(rint(_12761.z)), _4814, level(0.0));
        _4842 = _4844;
    }
    float _4846 = _4842;
    float3 _12771 = float3(_4832, _4816, _4796);
    float _4848 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12771, float3(0.0), isnan(_12771)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12771, float3(0.0), isnan(_12771)), level(0.0)).x;
    float3 _12780 = float3(_4832, _4816, _4796);
    float4 _4851 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12780, float3(0.0), isnan(_12780)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12780, float3(0.0), isnan(_12780)), level(0.0)).xyzw;
    float _4853 = _4851.x;
    float _4855 = _4851.y;
    float _4857 = _4851.z;
    float _4859 = _4851.w;
    float _4861 = _4840;
    float _4863 = _4830;
    if (!_4456)
    {
        float3 _12804 = float3(_4840, _4764, float(as_type<int>(_4830)));
        float3 _12806 = select(_12804, float3(0.0), isnan(_12804));
        float _4865 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12806.xy, uint(rint(_12806.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12806.xy, uint(rint(_12806.z)), level(0.0)).x;
        _4861 = _4865;
    }
    float _4867 = _4861;
    if (_4456)
    {
        _4758 = 1.0;
    }
    float _4869 = _4758;
    float _4871 = _4869;
    if (!_4456)
    {
        int _4873 = int(_4578) << 4;
        int _4875 = _4873 + 2048;
        uint _4877 = uint(int(uint(_4875) >> uint(2)));
        uint _4879 = uint(int(uint(int(_4877)) >> uint(2)));
        int _4881 = int(_4877) & 3;
        float _4883 = (*spvDescriptorSet0.vp_c15)._m0[int(_4879)][_4881];
        int _4885 = int(_4877) + 1;
        uint _4887 = uint(int(uint(_4885) >> uint(2)));
        int _4889 = _4885 & 3;
        float _4891 = (*spvDescriptorSet0.vp_c15)._m0[int(_4887)][_4889];
        int _4893 = _4875 + 8;
        uint _4895 = uint(int(uint(_4893) >> uint(2)));
        uint _4897 = uint(int(uint(int(_4895)) >> uint(2)));
        int _4899 = int(_4895) & 3;
        float _4901 = (*spvDescriptorSet0.vp_c15)._m0[int(_4897)][_4899];
        int _4903 = int(_4895) + 1;
        uint _4905 = uint(int(uint(_4903) >> uint(2)));
        int _4907 = _4903 & 3;
        float _4909 = (*spvDescriptorSet0.vp_c15)._m0[int(_4905)][_4907];
        float _4911 = _4330 * _4891;
        float _4913 = fma(_3570, _4883, _4911);
        float _4915 = fma(_3580, _4901, _4913);
        float _4917 = _4915 + _4909;
        float _4919 = precise::clamp(_4917, 0.0, 1.0);
        float _4921 = -_4919;
        float _4923 = _4921 + _4867;
        float _4925 = fma(_4923, 500.0, 1.5);
        float _4927 = exp2(_4925);
        float _4929 = 0.0 + _4927;
        float _4931 = precise::clamp(_4929, 0.0, 1.0);
        _4834 = _4901;
        _4871 = _4931;
    }
    float _4933 = _4834;
    float _4935 = _4871;
    float _4937 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4939 = _4558 + _4937;
    float _4941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4943 = _4560 + _4941;
    float _4945 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4947 = _4564 + _4945;
    float _4949 = _4939 * _4939;
    float _4951 = fma(_4943, _4943, _4949);
    float _4953 = fma(_4947, _4947, _4951);
    float _4955 = rsqrt(_4953);
    float _4957 = _4955 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4959 = _4943 * _4957;
    float _4961 = _4947 * _4957;
    float _4963 = _4959 * _4959;
    float _4965 = _4961 * _4961;
    float _4967 = _4963 + _4965;
    float _4969 = sqrt(_4967);
    bool _4971 = _4969 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4975 = _4969 + _4973;
    float _4977 = _4955;
    float _4979 = _4975;
    float _4981 = _4933;
    float _4983 = _4939;
    if (_4971)
    {
        float _4985 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4977 = _4985;
    }
    float _4987 = _4977;
    float _4989 = _4987;
    if (_4971)
    {
        float _4991 = _4975 * _4987;
        _4979 = _4991;
    }
    float _4993 = _4979;
    if (_4971)
    {
        float _4995 = rsqrt(_4967);
        _4989 = _4995;
    }
    float _4997 = _4989;
    float _4999 = _4997;
    if (_4971)
    {
        float _5001 = _4993 * 0.15915493667125701904296875;
        _4981 = _5001;
    }
    float _5003 = _4981;
    float _5005 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5007 = _4947;
    if (_4971)
    {
        float _5009 = _5003 * 6.283185482025146484375;
        float _5011 = sin(_5009);
        _5007 = _5011;
    }
    float _5013 = _5007;
    float _5015 = precise::max(0.0, _5005);
    float _5017 = _3570;
    float _5019 = _5015;
    if (_4971)
    {
        float _5021 = _5003 * 6.283185482025146484375;
        float _5023 = cos(_5021);
        _5017 = _5023;
    }
    float _5025 = _5017;
    float _5027 = -_4957;
    float _5029 = -_5015;
    float _5031 = fma(_4939, _5027, _5029);
    if (_4971)
    {
        float _5033 = _5031 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4983 = _5033;
    }
    float _5035 = _4983;
    float _5037 = _5013;
    float _5039 = _5035;
    if (_4971)
    {
        float _5041 = fma(_5013, _5035, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5037 = _5041;
    }
    float _5043 = _5037;
    float _5045 = _5043;
    if (_4971)
    {
        float _5047 = _4997 * _5043;
        _5039 = _5047;
    }
    float _5049 = _5039;
    if (!_4971)
    {
        _4999 = _4959;
    }
    float _5051 = _4999;
    float _5053 = _5051;
    float _5055 = _5025;
    if (_4971)
    {
        float _5057 = _5025 + (-1.0);
        _5019 = _5057;
    }
    float _5059 = _5019;
    float _5061 = _5059;
    if (_4971)
    {
        float _5063 = _4959 * _5049;
        _5053 = _5063;
    }
    float _5065 = _5053;
    if (!_4971)
    {
        _5045 = _5031;
    }
    float _5067 = _5045;
    float _5069 = _5067;
    if (_4971)
    {
        float _5071 = _5059 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4863 = _5071;
    }
    float _5073 = _4863;
    float _5075 = _5073;
    if (!_4971)
    {
        _5061 = _4961;
    }
    float _5077 = _5061;
    float _5079 = _5077;
    if (_4971)
    {
        float _5081 = _4961 * _5049;
        _5079 = _5081;
    }
    float _5083 = _5079;
    if (_4971)
    {
        float _5085 = fma(_5031, _5025, _5073);
        _5069 = _5085;
    }
    float _5087 = _5069;
    if (!_4971)
    {
        _5055 = _4963;
    }
    float _5089 = _5055;
    float _5091 = _5089;
    if (_4971)
    {
        float _5093 = _5065 * _5065;
        _5091 = _5093;
    }
    float _5095 = _5091;
    if (!_4971)
    {
        _5075 = _4965;
    }
    float _5097 = _5075;
    float _5099 = sqrt(_4953);
    float _5101 = _5097;
    if (_4971)
    {
        float _5103 = _5083 * _5083;
        _5101 = _5103;
    }
    float _5105 = _5101;
    float _5107 = fma(_5087, _5087, _5095);
    float _5109 = _5107 + _5105;
    float _5111 = rsqrt(_5109);
    float _5113 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5115 = fma(_5099, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5113);
    float _5117 = precise::clamp(_5115, 0.0, 1.0);
    float _5119 = -_5117;
    float _5121 = _5119 + 1.0;
    float _5123 = abs(_5121);
    float _5125 = log2(_5123);
    float _5127 = _5111 * _5065;
    float _5129 = _5111 * _5087;
    float _5131 = _5111 * _5083;
    float _5133 = _5127 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5135 = -_5133;
    float _5137 = fma(_5129, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5135);
    float _5139 = -_5131;
    float _5141 = fma(_5139, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5137);
    float _5143 = _5129 + 1.0;
    float _5145 = _5125 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5147 = fma(_5141, -0.5, 0.5);
    float _5149 = fma(_5141, 0.5, 0.5);
    float _5151 = exp2(_5145);
    float _5153 = fma(_5149, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5155 = fma(_5149, _5153, -0.212114393711090087890625);
    float _5157 = sqrt(_5147);
    float _5159 = fma(_5149, _5155, 1.570728778839111328125);
    float _5161 = -_5129;
    float _5163 = fma(_5151, _5143, _5161);
    float _5165 = fma(_5163, 0.5, 0.5);
    float _5167 = _5157 * 0.636619746685028076171875;
    float _5169 = -_5159;
    float _5171 = fma(_5167, _5169, 1.0);
    float2 _13279 = float2(_5171, _5165);
    float3 _5175 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13279, float2(0.0), isnan(_13279)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13279, float2(0.0), isnan(_13279)), level(0.0)).xyz;
    float _5177 = _5175.x;
    float _5179 = _5175.y;
    float _5181 = _5175.z;
    float _5183 = abs(_4340);
    float _5185 = log2(_5183);
    float _5187 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5189 = _5125 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5191 = -_4248;
    float _5193 = _5191 + 1.0;
    float _5195 = fma(_4714, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5187);
    bool _5197 = _4340 <= 8000.0;
    bool _5199 = isnan(_4340);
    bool _5201 = _5197 || _5199;
    bool _5203 = isnan(8000.0);
    bool _5205 = _5201 || _5203;
    float _5207 = float(_5205);
    float _5209 = exp2(_5189);
    float _5211 = _5185 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5213 = exp2(_5211);
    float _5215 = -_5209;
    float _5217 = _5215 + 1.0;
    float _5219 = fma(_5213, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5221 = precise::clamp(_5219, 0.0, 1.0);
    float _5223 = fma(_5221, -2.0, 3.0);
    float _5225 = _5221 * _5221;
    float _5227 = fma(_4634, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5195);
    float _5229 = _5225 * _5223;
    float _5231 = fma(_4740, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5227);
    float _5233 = -_5229;
    float _5235 = _5233 + 1.0;
    out.gl_Position.x = _4790;
    out.gl_Position.y = _4772;
    out.gl_Position.z = _5231;
    out.gl_Position.w = _4752;
    float _5237 = fma(_5235, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5229);
    float _5239 = _5231 + _4752;
    float _5241 = _5207 * _5237;
    float _5243 = _5207;
    if (!_4746)
    {
        _5243 = 1.0;
    }
    float _5245 = _5243;
    float _5247 = _5239 * 0.5;
    float _5249 = _5245;
    if (_4746)
    {
        bool _5251 = _4846 >= _4814;
        bool _5253 = isnan(_4846);
        bool _5255 = _5251 || _5253;
        bool _5257 = isnan(_4814);
        bool _5259 = _5255 || _5257;
        float _5261 = float(_5259);
        _5249 = _5261;
    }
    float _5263 = _5249;
    float _5265 = _5241 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5267 = _5217 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _5269 = _5099 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5271 = isnan(_5099);
    bool _5273 = _5269 || _5271;
    bool _5275 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5277 = _5273 || _5275;
    out.m_88.z = _5247;
    out.m_88.w = _4752;
    float _5279 = _5193 * _5265;
    float _5281 = precise::clamp(_5279, 0.0, 1.0);
    float _5283 = _5263 * _4935;
    float _5285 = _5267 * _4848;
    float _5287 = -_5267;
    float _5289 = _5287 + 1.0;
    float _5291 = -_5281;
    float _5293 = fma(_5291, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5295 = _4859 * _5285;
    float _5297 = _4859 * _5289;
    float _5299 = -_5283;
    float _5301 = fma(_5299, _5293, 1.0);
    float _5303 = precise::clamp(_5301, 0.0, 1.0);
    float _5305 = _5267;
    float _5307 = _5289;
    float _5309 = _5295;
    if (!_5277)
    {
        _5305 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5311 = _5305;
    float _5313 = _5303 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5315 = _5311;
    float _5317 = _5311;
    if (!_5277)
    {
        _5307 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5319 = _5307;
    out.m_90.x = _5313;
    float _5321 = _5181 * _5285;
    float _5323 = fma(_5177, _5295, _4853);
    float _5325 = fma(_5179, _5295, _4855);
    float _5327 = _5319;
    float _5329 = _5319;
    if (!_5277)
    {
        _5309 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5331 = _5309;
    float _5333 = fma(_4859, _5321, _4857);
    out.m_92.x = _5323;
    out.m_92.y = _5325;
    out.m_92.z = _5333;
    out.m_92.w = _5297;
    bool _5335 = !_5277;
    float _5337 = _5331;
    float _5339 = _5331;
    if (!_5335)
    {
        bool _5341 = _5099 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5343 = isnan(_5099);
        bool _5345 = _5341 || _5343;
        bool _5347 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5349 = _5345 || _5347;
        if (!_5349)
        {
            float _5351 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5353 = _5099 + _5351;
            float _5355 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5357 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5355;
            float _5359 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5361 = _5359 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5363 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5365 = _5363 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5367 = 1.0 / _5357;
            float _5369 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5371 = _5369 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5373 = _5353 * _5367;
            float _5375 = precise::clamp(_5373, 0.0, 1.0);
            float _5377 = fma(_5375, _5361, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5379 = fma(_5375, _5365, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5381 = fma(_5375, _5371, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _5317 = _5379;
            _5339 = _5377;
            _5329 = _5381;
            _5383 = true;
        }
        else
        {
            bool _5385 = _5099 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5387 = isnan(_5099);
            bool _5389 = _5385 || _5387;
            bool _5391 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5393 = _5389 || _5391;
            if (!_5393)
            {
                _5337 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5395 = _5337;
            _5339 = _5395;
            if (!_5393)
            {
                _5315 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5397 = _5315;
            _5317 = _5397;
            if (!_5393)
            {
                _5327 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5399 = _5327;
            bool _5401 = !_5393;
            _5329 = _5399;
            if (!_5401)
            {
                bool _5403 = _5099 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5405 = isnan(_5099);
                bool _5407 = _5403 || _5405;
                bool _5409 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5411 = _5407 || _5409;
                if (!_5411)
                {
                    float _5413 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5415 = _5099 + _5413;
                    float _5417 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5419 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5417;
                    float _5421 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5423 = _5421 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5425 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5427 = _5425 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5429 = 1.0 / _5419;
                    float _5431 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5433 = _5431 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5435 = _5415 * _5429;
                    float _5437 = precise::clamp(_5435, 0.0, 1.0);
                    float _5439 = fma(_5437, _5423, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5441 = fma(_5437, _5427, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5443 = fma(_5437, _5433, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _5317 = _5441;
                    _5339 = _5439;
                    _5329 = _5443;
                    _5383 = true;
                }
                else
                {
                    _5317 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5339 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5329 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5383 = false;
    float _5445 = _5317;
    float _5447 = _5339;
    float _5449 = _5329;
    float _5451 = _5445 * 0.586610972881317138671875;
    bool _5453 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_94.x = 0.0;
    float _5455 = fma(_5447, 0.298911988735198974609375, _5451);
    float _5457 = fma(_5449, 0.114477999508380889892578125, _5455);
    float _5459 = -_5457;
    float _5461 = _5459 + _5447;
    float _5463 = -_5457;
    float _5465 = _5463 + _5445;
    float _5467 = -_5457;
    float _5469 = _5467 + _5449;
    float _5471 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5473 = fma(_5461, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5457);
    float _5475 = fma(_5465, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5457);
    float _5477 = fma(_5469, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5457);
    out.m_61.x = _5471;
    out.m_96.x = _5473;
    out.m_96.y = _5475;
    out.m_96.z = _5477;
    if (!_5453)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5479 = -_4558;
    float _5481 = _5479 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5483 = -_4560;
    float _5485 = _5483 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5487 = -_4564;
    float _5489 = _5487 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5491 = _5481 * _5481;
    float _5493 = fma(_5485, _5485, _5491);
    float _5495 = fma(_5489, _5489, _5493);
    float _5497 = sqrt(_5495);
    float _5499 = rsqrt(_5495);
    float _5501 = -_5497;
    float _5503 = _5501 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5505 = _5503 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5507 = precise::clamp(_5505, 0.0, 1.0);
    float _5509 = _5485 * _5499;
    float _5511 = _5481 * _5499;
    float _5513 = abs(_5507);
    float _5515 = log2(_5513);
    float _5517 = _5489 * _5499;
    float _5519 = _5509 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5521 = _4146 * _5511;
    float _5523 = -_5511;
    float _5525 = -_5519;
    float _5527 = fma(_5523, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5525);
    float _5529 = fma(_4150, _5509, _5521);
    float _5531 = -_5517;
    float _5533 = fma(_5531, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5527);
    float _5535 = fma(_4152, _5517, _5529);
    float _5537 = precise::clamp(_5535, 0.0, 1.0);
    float _5539 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5541 = _5533 + _5539;
    float _5543 = _5515 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5545 = _5541 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5547 = precise::clamp(_5545, 0.0, 1.0);
    float _5549 = exp2(_5543);
    float _5551 = _5549 * _5547;
    float _5553 = _5537 * _5551;
    float _5555 = _5553 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5557 = _5553 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5559 = _5553 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _5555;
    out.m_94.y = _5557;
    out.m_94.z = _5559;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

