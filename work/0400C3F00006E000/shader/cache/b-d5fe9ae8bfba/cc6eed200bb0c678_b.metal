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
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_78 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_82 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_88 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_92 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_68 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4407 = false;
    bool _3028 = false;
    bool _651 = false;
    bool _495 = false;
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
        float _4692 = as_type<float>(_131);
        out.gl_Position.z = _4692;
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
    if (_145)
    {
        float _151 = float(_115);
        _125 = _151;
    }
    float _153 = _125;
    bool _155 = _149 >= _153;
    bool _157 = !_145;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_61.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _133 = as_type<int>(_165);
    }
    int _167 = _133;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4761 = as_type<float>(_167);
        out.gl_Position.z = _4761;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_68.w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = in.m_63.x;
    float _187 = in.m_63.y;
    float _189 = in.m_63.z;
    float _191 = in.m_58.x;
    float _193 = in.m_58.y;
    float _195 = in.m_58.z;
    float _197 = 0.0;
    float _199 = _171;
    if (!_183)
    {
        float _201 = _171 * _171;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    float _207 = _205;
    if (!_183)
    {
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    int _213 = as_type<int>(_169) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_169) & 2;
    bool _219 = _217 != 0;
    int _221 = int(_215);
    int _223 = _219 ? 2 : 0;
    int _225 = _221 | _223;
    int _227 = _183 ? 4 : 0;
    int _229 = _225 | _227;
    int _231 = false ? 8 : 0;
    int _233 = _229 | _231;
    int _235 = false ? 16 : 0;
    int _237 = _233 | _235;
    int _239 = false ? 32 : 0;
    int _241 = _237 | _239;
    int _243 = false ? 64 : 0;
    int _245 = _241 | _243;
    int _247 = _245 & 4;
    bool _249 = !_215;
    float _251 = _249 ? (-0.5) : 0.5;
    bool _253 = !_219;
    float _255 = _253 ? (-0.5) : 0.5;
    bool _257 = !_183;
    float _259 = _211;
    float _261 = as_type<float>(_247);
    if (!_257)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = _171 * _265;
        float _275 = 1.0 / _269;
        float _277 = _271 * 0.693147182464599609375;
        float _279 = exp2(_273);
        float _281 = 1.0 / _277;
        float _283 = _279 + (-1.0);
        float _285 = -_283;
        float _287 = fma(_285, _281, _171);
        float _289 = _287 * _275;
        float _291 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _259 = _291;
        _261 = _281;
    }
    float _293 = _259;
    float _295 = _261;
    bool _297 = !_183;
    float _299 = _295;
    float _301 = _293;
    if (!_297)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _309 = _307 + 1.0;
        float _311 = 1.0 / _309;
        float _313 = _171 * _305;
        float _315 = exp2(_313);
        float _317 = -_315;
        float _319 = _317 + 1.0;
        float _321 = _319 * _311;
        _199 = _321;
        _299 = _309;
    }
    float _323 = _199;
    float _325 = _299;
    float _327 = 0.0;
    float _329 = _325;
    if (!_183)
    {
        float _331 = _149 * _149;
        float _333 = _331 * 0.5;
        _327 = _333;
    }
    float _335 = _327;
    float _337 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _341 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_183)
    {
        _329 = _149;
    }
    float _343 = _329;
    float _345 = fma(_323, _185, _337);
    float _347 = fma(_323, _187, _339);
    float _349 = _343;
    if (!_183)
    {
        float _351 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _301 = _351;
    }
    float _353 = _301;
    bool _355 = !_183;
    float _357 = _353;
    if (!_355)
    {
        float _359 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _361 = log2(_359);
        float _363 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _365 = _363 + 1.0;
        float _367 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _369 = _149 * _361;
        float _371 = 1.0 / _365;
        float _373 = _367 * 0.693147182464599609375;
        float _375 = exp2(_369);
        float _377 = 1.0 / _373;
        float _379 = _375 + (-1.0);
        float _381 = -_379;
        float _383 = fma(_381, _377, _149);
        float _385 = _383 * _371;
        float _387 = _385 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _357 = _387;
    }
    float _389 = _357;
    bool _391 = !_183;
    if (!_391)
    {
        float _393 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _395 = log2(_393);
        float _397 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _399 = _397 + 1.0;
        float _401 = 1.0 / _399;
        float _403 = _149 * _395;
        float _405 = exp2(_403);
        float _407 = -_405;
        float _409 = _407 + 1.0;
        float _411 = _409 * _401;
        _349 = _411;
    }
    float _413 = _349;
    float _415 = _389 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _417 = _389 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _421 = _389 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _423 = fma(_413, _187, _415);
    float _425 = fma(_347, _173, _193);
    float _427 = fma(_413, _185, _417);
    float _429 = fma(_323, _189, _341);
    float _431 = -_423;
    float _433 = _347 + _431;
    float _435 = fma(_413, _189, _421);
    float _437 = -_427;
    float _439 = _345 + _437;
    float _441 = fma(_345, _173, _191);
    float _443 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _445 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _447 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _449 = -_435;
    float _451 = _429 + _449;
    float _453 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[4].x, _443);
    float _455 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[5].x, _445);
    float _457 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[6].x, _447);
    float _459 = fma(_429, _173, _195);
    float _461 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].z, _453);
    float _463 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].z, _455);
    float _465 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].z, _457);
    bool _467 = !_419;
    float _469 = _463;
    float _471 = _463;
    float _473 = _461;
    float _475 = _465;
    float _493;
    if (!_467)
    {
        float _477 = in.m_70.x;
        float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _481 = _477 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _485 = _483 * _479;
        float _487 = floor(_485);
        float _489 = -_487;
        float _491 = _485 + _489;
        _493 = _491;
        _495 = true;
    }
    else
    {
        float _497 = float(_115);
        float _499 = 1.0 / _497;
        float _501 = _149 * _499;
        _493 = _501;
    }
    _495 = false;
    float _503 = _493;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _507 = _503 + _505;
    bool _509 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _511 = isnan(_503);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _523 = _503 + _521;
    bool _525 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _527 = isnan(_503);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _545 = -_519;
    float _547 = _545 + 1.0;
    float _549 = 1.0 / _543;
    bool _551 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _553 = isnan(_503);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = _535 * _547;
    float _565 = -_535;
    float _567 = _565 + 1.0;
    bool _569 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _571 = 1.0 / _539;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _573;
    float _577 = _523 * _549;
    float _579 = _561 * _567;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _585 = -_561;
    float _587 = _585 + 1.0;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _593 = fma(_583, _577, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _595 = _507 * _571;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _597;
    float _601 = in.m_68.x;
    float _603 = in.m_68.y;
    float _605 = fma(_591, _577, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _607 = fma(_575, _595, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _609 = fma(_599, _595, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _611 = _607 * _579;
    float _613 = _609 * _579;
    float _615 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[143].x, _613);
    float _617 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[143].y, _611);
    float _619 = fma(_593, _563, _615);
    float _621 = fma(_605, _563, _617);
    float _623 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[145].x, _619);
    float _625 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[145].y, _621);
    float _627 = _623 * _601;
    float _629 = _625 * _603;
    bool _631 = !_569;
    float _649;
    if (!_631)
    {
        float _633 = in.m_70.x;
        float _635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _637 = _633 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _639 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _641 = _639 * _635;
        float _643 = floor(_641);
        float _645 = -_643;
        float _647 = _641 + _645;
        _649 = _647;
        _651 = true;
    }
    else
    {
        float _653 = float(_115);
        float _655 = 1.0 / _653;
        float _657 = _149 * _655;
        _649 = _657;
    }
    _651 = false;
    float _659 = _649;
    float _661 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _663 = int(_661);
    float _665 = _629 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _667 = float(_115);
    float _669 = _627 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _673 = _671 != 0;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _677 = _659 + _675;
    float _679 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _681 = int(_679);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _687 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _689 = int(_687);
    float _691 = float(_663);
    float _693 = 0.0;
    if (_673)
    {
        float _695 = in.m_70.x;
        _693 = _695;
    }
    float _697 = _693;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _697;
    if (!_673)
    {
        float _705 = in.m_70.y;
        _703 = _705;
    }
    float _707 = _703;
    float _709 = 1.0 / _691;
    float _711 = float(uint(_681));
    int _713 = ~_681;
    int _715 = _713 + 1;
    bool _717 = _681 == 0;
    int _719 = _681 + (-1);
    float _721 = 1.0 / _711;
    float _723 = float(_689);
    float _725 = _149 * _709;
    float _727 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _729 = int(_727);
    int _731 = ~_681;
    int _733 = _731 + 1;
    int _735 = as_type<int>(_721) + (-2);
    float _737 = trunc(_725);
    int _739 = int(_737);
    float _741 = 1.0 / _723;
    float _743 = float(uint(_729));
    int _745 = ~_729;
    int _747 = _745 + 1;
    float _749 = float(uint(_739));
    float _751 = 1.0 / _743;
    float _753 = float(_739);
    float _755 = as_type<float>(_735) * _749;
    float _757 = _149 * _741;
    float _759 = trunc(_755);
    float _761 = precise::max(_759, 0.0);
    uint _764 = uint(_761);
    float _766 = trunc(_757);
    int _768 = int(_766);
    float _770 = _755;
    float _772 = as_type<float>(_681);
    if (_673)
    {
        _770 = 1.0;
    }
    float _774 = _770;
    float _776 = _774;
    if (!_673)
    {
        _776 = 7.345489978790283203125;
    }
    float _778 = _776;
    int _780 = _733 * int(_764);
    int _782 = _780 + _739;
    float _784 = 1.0 / _667;
    float _786 = float(uint(_782));
    float _788 = in.m_70.x;
    float _790 = in.m_70.y;
    float _792 = in.m_70.z;
    float _794 = in.m_70.w;
    float _796 = float(uint(_768));
    float _798 = 1.0 / _685;
    float _800 = as_type<float>(_735) * _786;
    int _802 = as_type<int>(_751) + (-2);
    float _804 = as_type<float>(_802) * _796;
    float _806 = trunc(_800);
    float _808 = precise::max(_806, 0.0);
    uint _810 = uint(_808);
    float _812 = trunc(_804);
    float _814 = precise::max(_812, 0.0);
    uint _816 = uint(_814);
    float _818 = _790 * 2.0;
    int _820 = int(_764) + int(_810);
    float _822 = _778 * _788;
    float _824 = float(_681);
    float _826 = 1.0 / _701;
    float _828 = _778;
    if (_673)
    {
        _828 = 1.0;
    }
    float _830 = _828;
    int _832 = _715 * _820;
    int _834 = _832 + _739;
    bool _836 = _753 >= _824;
    bool _838 = isnan(_753);
    bool _840 = _836 || _838;
    bool _842 = isnan(_824);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = _830;
    if (!_673)
    {
        _848 = 1.2345600128173828125;
    }
    float _850 = _848;
    int _852 = _747 * int(_816);
    int _854 = _852 + _768;
    bool _856 = uint(_834) >= uint(_681);
    float _858 = floor(_822);
    float _860 = _707 * _850;
    bool _862 = !_856;
    int _864 = _862 ? 0 : (-1);
    float _866 = float(uint(_854));
    int _868 = ~_820;
    int _870 = _868 + _864;
    int _872 = _870 + 1;
    float _874 = trunc(_846);
    int _876 = int(_874);
    float _878 = as_type<float>(_802) * _866;
    int _880 = _681 * _872;
    int _882 = _880 + _739;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _886 = _884 != 0;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _890 = _888 != 0;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _894 = _892 != 0;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _898 = _896 != 0;
    float _900 = floor(_860);
    bool _902 = !_717;
    int _904 = _902 ? _882 : (-1);
    float _906 = -_858;
    float _908 = _822 + _906;
    float _910 = float(_729);
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _914 = _912 != 0;
    float _916 = _908 * _824;
    float _918 = trunc(_878);
    float _920 = precise::max(_918, 0.0);
    uint _922 = uint(_920);
    int _924 = ~_876;
    int _926 = _924 + 1;
    int _928 = _926 + 1;
    int _930 = _904 * _928;
    float _932 = -_900;
    float _934 = _860 + _932;
    float _936 = trunc(_916);
    int _938 = int(_936);
    int _940 = _876 * _719;
    int _942 = _940 + _930;
    float _944 = _149 * _784;
    bool _946 = !_890;
    int _948 = _946 ? 0 : 1;
    float _950 = _944 * _824;
    int _952 = int(_816) + int(_922);
    float _954 = _944 * _910;
    int _956 = ~_729;
    int _958 = _956 + 1;
    float _960 = _934 * _910;
    float _962 = float(_768);
    float _964 = trunc(_950);
    int _966 = int(_964);
    int _968 = abs(_948);
    int _970 = _958 * _952;
    int _972 = _970 + _768;
    bool _974 = _962 >= _910;
    bool _976 = isnan(_962);
    bool _978 = _974 || _976;
    bool _980 = isnan(_910);
    bool _982 = _978 || _980;
    float _984 = float(_982);
    bool _986 = !_914;
    int _988 = _986 ? 0 : 1;
    int _990 = _942 * _968;
    bool _992 = uint(_972) >= uint(_729);
    float _994 = trunc(_954);
    int _996 = int(_994);
    bool _998 = !_886;
    int _1000 = _998 ? 0 : 1;
    int _1002 = abs(_988);
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1006 = _1004 != 0;
    int _1008 = abs(_1000);
    float _1010 = trunc(_984);
    int _1012 = int(_1010);
    bool _1014 = !_992;
    int _1016 = _1014 ? 0 : (-1);
    int _1018 = _966 * _1008;
    int _1020 = _1018 + _990;
    bool _1022 = !_894;
    int _1024 = _1022 ? 0 : 1;
    bool _1026 = !_1006;
    int _1028 = _1026 ? 0 : 1;
    int _1030 = _938 * _1002;
    int _1032 = _1030 + _739;
    int _1034 = ~_952;
    int _1036 = _1034 + _1016;
    int _1038 = _1036 + 1;
    float _1040 = floor(_818);
    int _1042 = abs(_1024);
    int _1044 = abs(_1028);
    int _1046 = _729 * _1038;
    int _1048 = _1046 + _768;
    bool _1050 = !_898;
    int _1052 = _1050 ? 0 : 1;
    int _1054 = _1032 * _1042;
    int _1056 = _1054 + _1020;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1060 = _1058 != 0;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1064 = _1062 != 0;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1068 = _1066 != 0;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1072 = _1070 != 0;
    float _1074 = trunc(_960);
    int _1076 = int(_1074);
    bool _1078 = _729 == 0;
    int _1080 = abs(_1052);
    int _1082 = ~_1012;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    bool _1088 = !_1078;
    int _1090 = _1088 ? _1048 : (-1);
    int _1092 = _729 + (-1);
    int _1094 = _1090 * _1086;
    bool _1096 = !_1064;
    int _1098 = _1096 ? 0 : 1;
    int _1100 = _938 * _1044;
    int _1102 = _1100 + _1056;
    bool _1104 = !_1060;
    int _1106 = _1104 ? 0 : 1;
    int _1108 = _1012 * _1092;
    int _1110 = _1108 + _1094;
    bool _1112 = !_1068;
    int _1114 = _1112 ? 0 : 1;
    int _1116 = _1076 * _1080;
    int _1118 = _1116 + _768;
    float _1120 = float(uint(_1102));
    int _1122 = abs(_1098);
    int _1124 = abs(_1106);
    float _1126 = as_type<float>(_735) * _1120;
    bool _1128 = !_1072;
    int _1130 = _1128 ? 0 : 1;
    int _1132 = _1110 * _1122;
    int _1134 = abs(_1114);
    float _1136 = trunc(_1126);
    float _1138 = precise::max(_1136, 0.0);
    uint _1140 = uint(_1138);
    int _1142 = abs(_1130);
    int _1144 = _996 * _1124;
    int _1146 = _1144 + _1132;
    float _1148 = float(uint(_1032));
    int _1150 = _1118 * _1134;
    int _1152 = _1150 + _1146;
    int _1154 = ~_681;
    int _1156 = _1154 + 1;
    int _1158 = ~_729;
    int _1160 = _1158 + 1;
    int _1162 = _1076 * _1142;
    int _1164 = _1162 + _1152;
    float _1166 = as_type<float>(_735) * _1148;
    float _1168 = float(uint(_1118));
    int _1170 = _1156 * int(_1140);
    int _1172 = _1170 + _1102;
    float _1174 = float(uint(_1164));
    float _1176 = trunc(_1166);
    float _1178 = precise::max(_1176, 0.0);
    uint _1180 = uint(_1178);
    int _1182 = ~_681;
    int _1184 = _1182 + 1;
    float _1186 = as_type<float>(_802) * _1174;
    float _1188 = float(uint(_1172));
    bool _1190 = _681 == 0;
    float _1192 = trunc(_1186);
    float _1194 = precise::max(_1192, 0.0);
    uint _1196 = uint(_1194);
    float _1198 = as_type<float>(_735) * _1188;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1202 = _1200 != 0;
    float _1204 = trunc(_1198);
    float _1206 = precise::max(_1204, 0.0);
    uint _1208 = uint(_1206);
    int _1210 = _1160 * int(_1196);
    int _1212 = _1210 + _1164;
    int _1214 = ~_681;
    int _1216 = _1214 + 1;
    float _1218 = as_type<float>(_802) * _1168;
    int _1220 = _1184 * int(_1180);
    int _1222 = _1220 + _1032;
    float _1224 = float(uint(_1212));
    int _1226 = int(_1140) + int(_1208);
    float _1228 = as_type<float>(_802) * _1224;
    float _1230 = trunc(_1218);
    float _1232 = precise::max(_1230, 0.0);
    uint _1234 = uint(_1232);
    int _1236 = _1216 * _1226;
    int _1238 = _1236 + _1102;
    float _1240 = float(uint(_1222));
    int _1242 = ~_729;
    int _1244 = _1242 + 1;
    bool _1246 = uint(_1238) >= uint(_681);
    float _1248 = trunc(_1228);
    float _1250 = precise::max(_1248, 0.0);
    uint _1252 = uint(_1250);
    float _1254 = as_type<float>(_735) * _1240;
    bool _1256 = !_1246;
    int _1258 = _1256 ? 0 : (-1);
    bool _1260 = _794 > 0.5;
    int _1262 = ~_1226;
    int _1264 = _1262 + _1258;
    int _1266 = _1264 + 1;
    int _1268 = _1244 * int(_1234);
    int _1270 = _1268 + _1118;
    float _1272 = trunc(_1254);
    float _1274 = precise::max(_1272, 0.0);
    uint _1276 = uint(_1274);
    int _1278 = _681 * _1266;
    int _1280 = _1278 + _1102;
    int _1282 = ~_729;
    int _1284 = _1282 + 1;
    float _1286 = float(uint(_1270));
    int _1288 = int(_1196) + int(_1252);
    float _1290 = as_type<float>(_802) * _1286;
    bool _1292 = !_1190;
    int _1294 = _1292 ? _1280 : (-1);
    float _1296 = -_255;
    int _1298 = _1260 ? as_type<int>(_1296) : as_type<int>(_255);
    int _1300 = _1284 * _1288;
    int _1302 = _1300 + _1164;
    int _1304 = _1294 & 3;
    bool _1306 = _1304 != 0;
    float _1308 = trunc(_1290);
    float _1310 = precise::max(_1308, 0.0);
    uint _1312 = uint(_1310);
    int _1314 = _1294 & 3;
    bool _1316 = _1314 != 0;
    bool _1318 = uint(_1304) >= 2u;
    int _1320 = _1316 ? 0 : 1;
    bool _1322 = uint(_1302) >= uint(_729);
    int _1324 = _1318 ? 0 : 1;
    bool _1326 = uint(_1304) > 1u;
    bool _1328 = !_1322;
    int _1330 = _1328 ? 0 : (-1);
    bool _1332 = _1304 != 3;
    int _1334 = int(_1180) + int(_1276);
    int _1336 = ~_681;
    int _1338 = _1336 + 1;
    int _1340 = ~_1288;
    int _1342 = _1340 + _1330;
    int _1344 = _1342 + 1;
    int _1346 = ~_1320;
    int _1348 = _1346 + 1;
    int _1350 = _1348 + 1;
    int _1352 = _1338 * _1334;
    int _1354 = _1352 + _1032;
    int _1356 = ~_1324;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    int _1362 = _729 * _1344;
    int _1364 = _1362 + _1164;
    int _1366 = _1350;
    int _1368 = _1360;
    int _1370 = _1354;
    float _1372 = as_type<float>(_1032);
    if (!_1326)
    {
        int _1374 = ~_1320;
        int _1376 = _1374 + 1;
        _1366 = _1376;
    }
    int _1378 = _1366;
    float _1380 = _788 * 2.0;
    bool _1382 = uint(_1354) >= uint(_681);
    if (_1332)
    {
        int _1384 = ~_1324;
        int _1386 = _1384 + 1;
        _1368 = _1386;
    }
    int _1388 = _1368;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1392 = _1390 != 0;
    float _1394 = floor(_1380);
    bool _1396 = !_1078;
    int _1398 = _1396 ? _1364 : (-1);
    bool _1400 = !_1382;
    int _1402 = _1400 ? 0 : (-1);
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1406 = _1404 != 0;
    bool _1408 = !_1392;
    int _1410 = _1408 ? 0 : 1;
    int _1412 = _1398 & 3;
    bool _1414 = _1412 != 0;
    int _1416 = _1398 & 3;
    bool _1418 = _1416 != 0;
    bool _1420 = !_1406;
    int _1422 = _1420 ? 0 : 1;
    bool _1424 = uint(_1412) >= 2u;
    int _1426 = int(_1234) + int(_1312);
    float _1428 = _1418 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1430 = uint(_1412) > 1u;
    int _1432 = _1424 ? 0 : 1;
    bool _1434 = _1412 != 3;
    int _1436 = ~_729;
    int _1438 = _1436 + 1;
    int _1440 = ~as_type<int>(_1428);
    int _1442 = _1440 + 1;
    int _1444 = _1442 + 1;
    int _1446 = _1444;
    float _1448 = _1428;
    float _1450 = as_type<float>(_1426);
    if (_1202)
    {
        _1370 = 0;
    }
    int _1452 = _1370;
    int _1454 = _1438 * _1426;
    int _1456 = _1454 + _1118;
    int _1458 = ~_1432;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    int _1464 = _1452;
    int _1466 = _1462;
    if (!_1430)
    {
        int _1468 = ~as_type<int>(_1428);
        int _1470 = _1468 + 1;
        _1446 = _1470;
    }
    int _1472 = _1446;
    if (!_1202)
    {
        _1464 = 1;
    }
    int _1474 = _1464;
    bool _1476 = uint(_1456) >= uint(_729);
    if (_1434)
    {
        int _1478 = ~_1432;
        int _1480 = _1478 + 1;
        _1466 = _1480;
    }
    int _1482 = _1466;
    bool _1484 = _1394 >= 0.0;
    bool _1486 = isnan(_1394);
    bool _1488 = _1484 || _1486;
    bool _1490 = isnan(0.0);
    bool _1492 = _1488 || _1490;
    bool _1494 = _1474 != 1;
    bool _1496 = !_1476;
    int _1498 = _1496 ? 0 : (-1);
    int _1500 = _1492 ? 0 : 1;
    bool _1502 = _1394 > 0.0;
    int _1504 = ~_1334;
    int _1506 = _1504 + _1402;
    int _1508 = _1506 + 1;
    float _1510 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _251);
    int _1512 = ~_1426;
    int _1514 = _1512 + _1498;
    int _1516 = _1514 + 1;
    int _1518 = ~_1500;
    int _1520 = _1518 + 1;
    int _1522 = _1520 + 1;
    int _1524 = _681 * _1508;
    int _1526 = _1524 + _1032;
    int _1528 = _1522;
    if (!_1494)
    {
        _1372 = _790;
    }
    float _1530 = _1372;
    int _1532 = _729 * _1516;
    int _1534 = _1532 + _1118;
    float _1536 = _1530;
    if (!_1494)
    {
        _1448 = _790;
    }
    float _1538 = _1448;
    float _1540 = _669 * _1510;
    float _1542 = _1538;
    if (!_1494)
    {
        _772 = _792;
    }
    float _1544 = _772;
    float _1546 = _1544;
    if (!_1494)
    {
        _1450 = _792;
    }
    float _1548 = _1450;
    float _1550 = _1548;
    if (_1494)
    {
        _1536 = _788;
    }
    float _1552 = _1536;
    if (_1494)
    {
        _1542 = _788;
    }
    float _1554 = _1542;
    if (_1494)
    {
        _1546 = _790;
    }
    float _1556 = _1546;
    if (_1494)
    {
        _1550 = _790;
    }
    float _1558 = _1550;
    bool _1560 = !_1190;
    int _1562 = _1560 ? _1526 : (-1);
    float _1564 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1566 = !_1078;
    int _1568 = _1566 ? _1534 : (-1);
    int _1570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1572 = _1570 != 0;
    int _1574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1576 = _1574 != 0;
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1580 = _1578 != 0;
    float _1582 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _255);
    if (!_1502)
    {
        int _1584 = ~_1500;
        int _1586 = _1584 + 1;
        _1528 = _1586;
    }
    int _1588 = _1528;
    bool _1590 = !_1414;
    int _1592 = _1590 ? 0 : 1;
    float _1594 = _788 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1596 = _1412 != 3;
    float _1598 = _425 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1600 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1602 = _1600 != 0;
    float _1604 = _425 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1606 = _425 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1608 = !_1306;
    int _1610 = _1608 ? 0 : 1;
    float _1612 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1604);
    bool _1614 = _1304 != 3;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1618 = _665 * _1582;
    float _1620 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1598);
    float _1622 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1606);
    float _1624 = _792 * 2.0;
    float _1626 = -_1616;
    float _1628 = fma(_1594, 2.0, _1626);
    float _1630 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1612);
    float _1632 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1620);
    float _1634 = floor(_1624);
    float _1636 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1622);
    float _1638 = _790 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1640 = _1630 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1644 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1646 = log2(_1644);
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1652 = fma(_1638, -2.0, _1642);
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1656 = _1650 * _798;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1660 = _1634 >= 0.0;
    bool _1662 = isnan(_1634);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan(0.0);
    bool _1668 = _1664 || _1666;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1672;
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1678 = _1668 ? 0 : 1;
    float _1680 = _1654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1682 = _1634 > 0.0;
    float _1684 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1686 = _149 * _1646;
    float _1688 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1690 = _1674 * _826;
    float _1692 = _788 + _790;
    float _1694 = _792 + _790;
    int _1696 = ~_1678;
    int _1698 = _1696 + 1;
    int _1700 = _1698 + 1;
    float _1702 = exp2(_1686);
    out.m_72.x = _1680;
    out.m_72.y = _1684;
    out.m_72.z = _1688;
    out.m_72.w = _1676;
    float _1704 = _1692 + (-1.0);
    float _1706 = _1694 + (-1.0);
    bool _1708 = !_1572;
    int _1710 = _1708 ? 0 : 1;
    float _1712 = fma(_1690, _677, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1714 = _1700;
    if (!_1682)
    {
        int _1716 = ~_1678;
        int _1718 = _1716 + 1;
        _1714 = _1718;
    }
    int _1720 = _1714;
    float _1722 = _1636 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1724 = abs(_1710);
    float _1726 = _1632 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1728 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1730 = isnan(0.0);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1736 = _1732 || _1734;
    bool _1738 = !_1614;
    int _1740 = _1738 ? 0 : (-1);
    bool _1742 = _1040 >= 0.0;
    bool _1744 = isnan(_1040);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan(0.0);
    bool _1750 = _1746 || _1748;
    float _1752 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1754 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1756 = isnan(_659);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1762 = _1758 || _1760;
    float _1764 = float(_1762);
    float _1766 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1768 = -_1702;
    float _1770 = _1768 + 1.0;
    bool _1772 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1774 = isnan(_659);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1780 = _1776 || _1778;
    float _1782 = float(_1780);
    float _1784 = -_1764;
    float _1786 = _1784 + 1.0;
    bool _1788 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1790 = isnan(_659);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1796 = _1792 || _1794;
    float _1798 = float(_1796);
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1802 = 1.0 + _1800;
    float _1804 = _1736 ? _1770 : 0.0;
    float _1806 = _1782 * _1786;
    float _1808 = -_1782;
    float _1810 = _1808 + 1.0;
    bool _1812 = _1040 > 0.0;
    float _1814 = in.m_74.x;
    float _1816 = in.m_74.y;
    float _1818 = in.m_74.z;
    float _1820 = 1.0 / _1802;
    float _1822 = _1798 * _1810;
    float _1824 = -_1798;
    float _1826 = _1824 + 1.0;
    float _1828 = float(_1720);
    float _1830 = _1712 * _1822;
    float _1832 = float(_1724);
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1836 = _659 + _1834;
    bool _1838 = !_1576;
    int _1840 = _1838 ? 0 : 1;
    float _1842 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1830);
    int _1844 = _1750 ? 0 : 1;
    float _1846 = _1832 * _1828;
    float _1848 = fma(_1656, _1836, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1850 = abs(_1840);
    float _1852 = _1846 * (-2.0);
    float _1854 = _1804 * _1820;
    float _1856 = float(_1588);
    float _1858 = _788 + (-0.5);
    float _1860 = float(_1850);
    int _1862 = ~_1844;
    int _1864 = _1862 + 1;
    int _1866 = _1864 + 1;
    float _1868 = fma(_1852, _1814, _1814);
    float _1870 = _1860 * _1856;
    int _1872 = _1866;
    if (!_1812)
    {
        int _1874 = ~_1844;
        int _1876 = _1874 + 1;
        _1872 = _1876;
    }
    int _1878 = _1872;
    float _1880 = fma(_1752, _1852, _1752);
    bool _1882 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1884 = isnan(1.0);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1890 = _1886 || _1888;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1894 = _1870 * (-2.0);
    float _1896 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1868);
    bool _1898 = !_1890;
    float _1900 = _1898 ? _149 : _1854;
    float _1902 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1892);
    bool _1904 = !_1580;
    int _1906 = _1904 ? 0 : 1;
    float _1908 = fma(_1894, _1816, _1816);
    bool _1910 = _790 > 0.5;
    float _1912 = _790 + (-0.5);
    float _1914 = fma(_1900, _1880, _1896);
    int _1916 = abs(_1906);
    float _1918 = fma(_1912, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1908);
    float _1920 = float(_1878);
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1924 = float(_1916);
    float _1926 = fma(_1766, _1894, _1766);
    bool _1928 = _788 > 0.5;
    float _1930 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1922);
    float _1932 = _792 + _788;
    float _1934 = _1924 * _1920;
    float _1936 = fma(_1900, _1926, _1918);
    float _1938 = _1932 + (-1.0);
    float _1940 = _1934 * (-2.0);
    float _1942 = _1936 * 0.15915493667125701904296875;
    float _1944 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1946 = fma(_1848, _1806, _1842);
    float _1948 = fma(_1940, _1818, _1818);
    float _1950 = _792 + (-0.5);
    float _1952 = fma(_1944, _1940, _1944);
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1956 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1948);
    int _1958 = _1294 >> 31;
    float _1960 = _1914 * 0.15915493667125701904296875;
    float _1962 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1954);
    float _1964 = fma(_1900, _1952, _1956);
    int _1966 = _1958 & 3;
    float _1968 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1970 = _1398 >> 31;
    float _1972 = _1942 * 6.283185482025146484375;
    float _1974 = sin(_1972);
    int _1976 = _1294 + _1966;
    float _1978 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1968);
    int _1980 = _1970 & 3;
    float _1982 = _1964 * 0.15915493667125701904296875;
    float _1984 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1986 = _1398 + _1980;
    float _1988 = _1942 * 6.283185482025146484375;
    float _1990 = cos(_1988);
    float _1992 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1946);
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1996 = abs(_1472);
    float _1998 = -_1994;
    float _2000 = fma(_1984, 2.0, _1998);
    int _2002 = abs(_1388);
    float _2004 = _1960 * 6.283185482025146484375;
    float _2006 = sin(_2004);
    int _2008 = _1976 >> 2;
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2012 = !_1596;
    int _2014 = _2012 ? 0 : (-1);
    int _2016 = _2008 << 4;
    int _2018 = _2016 + 368;
    float _2020 = fma(_1564, -2.0, _2010);
    int _2022 = abs(_2014);
    float _2024 = _1960 * 6.283185482025146484375;
    float _2026 = cos(_2024);
    int _2028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2030 = _2028 != 0;
    int _2032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2034 = _2032 != 0;
    float _2036 = _1982 * 6.283185482025146484375;
    float _2038 = cos(_2036);
    int _2040 = _1986 >> 2;
    float _2042 = _2006 * _1974;
    uint _2044 = uint(int(uint(_2018) >> uint(2)));
    uint _2046 = uint(int(uint(int(_2044)) >> uint(2)));
    int _2048 = int(_2044) & 3;
    float _2050 = (*spvDescriptorSet0.vp_c9)._m0[int(_2046)][_2048];
    int _2052 = int(_2044) + 1;
    uint _2054 = uint(int(uint(_2052) >> uint(2)));
    int _2056 = _2052 & 3;
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[int(_2054)][_2056];
    float _2060 = _2006 * _1990;
    int _2062 = _2040 << 4;
    int _2064 = _2062 + 512;
    float _2066 = _1982 * 6.283185482025146484375;
    float _2068 = sin(_2066);
    float _2070 = _2026 * _1990;
    uint _2072 = uint(int(uint(_2064) >> uint(2)));
    uint _2074 = uint(int(uint(int(_2072)) >> uint(2)));
    int _2076 = int(_2072) & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    int _2080 = int(_2072) + 1;
    uint _2082 = uint(int(uint(_2080) >> uint(2)));
    int _2084 = _2080 & 3;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[int(_2082)][_2084];
    float _2088 = _2006 * _2038;
    float _2090 = _2026 * _1974;
    float _2092 = _1990 * _2038;
    float _2094 = _2026 * _2038;
    float _2096 = _1974 * _2038;
    float _2098 = _2088 * _1618;
    int _2100 = _2064 + 8;
    uint _2102 = uint(int(uint(_2100) >> uint(2)));
    uint _2104 = uint(int(uint(int(_2102)) >> uint(2)));
    int _2106 = int(_2102) & 3;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[int(_2104)][_2106];
    int _2110 = int(_2102) + 1;
    uint _2112 = uint(int(uint(_2110) >> uint(2)));
    int _2114 = _2110 & 3;
    float _2116 = (*spvDescriptorSet0.vp_c9)._m0[int(_2112)][_2114];
    float _2118 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2120 = -_2090;
    float _2122 = fma(_2068, _2060, _2120);
    float _2124 = fma(_2068, _2070, _2042);
    float _2126 = -_2060;
    float _2128 = fma(_2068, _2090, _2126);
    float _2130 = fma(_2068, _2042, _2070);
    float _2132 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2134 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2136 = _2018 + 8;
    uint _2138 = uint(int(uint(_2136) >> uint(2)));
    uint _2140 = uint(int(uint(int(_2138)) >> uint(2)));
    int _2142 = int(_2138) & 3;
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[int(_2140)][_2142];
    int _2146 = int(_2138) + 1;
    uint _2148 = uint(int(uint(_2146) >> uint(2)));
    int _2150 = _2146 & 3;
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[int(_2148)][_2150];
    float _2154 = -_1618;
    float _2156 = _2068 * _2154;
    float _2158 = _2094 * _1618;
    float _2160 = -_2068;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2118);
    float _2164 = -_2068;
    float _2166 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2132);
    float _2168 = -_2068;
    float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2134);
    float _2172 = fma(_2092, _1540, _2156);
    float _2174 = fma(_2124, _1540, _2158);
    float _2176 = fma(_2122, _1540, _2098);
    float _2178 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2162);
    float _2180 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2166);
    int _2182 = abs(_1378);
    float _2184 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2186 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2188 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2190 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2184);
    float _2192 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2186);
    int _2194 = abs(_1610);
    float _2196 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2188);
    int _2198 = ~_2182;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    float _2204 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2170);
    int _2206 = ~_1996;
    int _2208 = _2206 + 1;
    int _2210 = _2208 + 1;
    float _2212 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2214 = abs(_1592);
    int _2216 = _2202 * as_type<int>(_2058);
    int _2218 = ~_2194;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    int _2224 = _2210 * as_type<int>(_2086);
    int _2226 = abs(_1482);
    int _2228 = _2222 * as_type<int>(_2050);
    int _2230 = _2228 + _2216;
    int _2232 = ~_2214;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    float _2238 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2240 = int(_2238);
    int _2242 = abs(_1740);
    int _2244 = _2236 * as_type<int>(_2078);
    int _2246 = _2244 + _2224;
    int _2248 = ~_2002;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = ~_2226;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    int _2260 = _2252 * as_type<int>(_2144);
    int _2262 = _2260 + _2230;
    int _2264 = _2258 * as_type<int>(_2108);
    int _2266 = _2264 + _2246;
    float _2268 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2270 = int(_2268);
    int _2272 = ~_2242;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    int _2278 = ~_2022;
    int _2280 = _2278 + 1;
    int _2282 = _2280 + 1;
    int _2284 = abs(_1410);
    int _2286 = _2276 * as_type<int>(_2152);
    int _2288 = _2286 + _2262;
    float _2290 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _2292 = _2282 * as_type<int>(_2116);
    int _2294 = _2292 + _2266;
    int _2296 = ~_2284;
    int _2298 = _2296 + 1;
    int _2300 = _2298 + 1;
    float _2302 = fma(_2128, _2290, _2174);
    float _2304 = float(uint(_2240));
    float _2306 = fma(_2096, _2290, _2172);
    int _2308 = _2288 * _2300;
    float _2310 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2312 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2314 = abs(_1422);
    float _2316 = fma(_2130, _2290, _2176);
    float _2318 = 1.0 / _2304;
    float _2320 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2310);
    float _2322 = float(uint(_2270));
    float _2324 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2312);
    int _2326 = ~_2314;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    float _2332 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2320);
    int _2334 = abs(_2270);
    float _2336 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2324);
    float _2338 = 1.0 / _2322;
    float _2340 = _2332 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2342 = _2294 * _2330;
    float _2344 = _2336 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _2346 = _1562 * _2284;
    int _2348 = _2346 + _2308;
    int _2350 = abs(_2240);
    float _2352 = _1640 + _2340;
    float _2354 = _1722 + _2344;
    float _2356 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2358 = float(uint(_2350));
    float _2360 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2362 = as_type<int>(_2318) + (-2);
    float _2364 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2356);
    float _2366 = float(uint(_2348));
    int _2368 = _1568 * _2314;
    int _2370 = _2368 + _2342;
    float _2372 = float(uint(_2334));
    float _2374 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2360);
    float _2376 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2212);
    float _2378 = as_type<float>(_2362) * _2366;
    float _2380 = 1.0 / _2358;
    float _2382 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2364);
    int _2384 = as_type<int>(_2338) + (-2);
    float _2386 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2374);
    float _2388 = float(uint(_2370));
    float _2390 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2376);
    float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2394 = _2352 + _2392;
    float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2398 = _2354 + _2396;
    float _2400 = 1.0 / _2372;
    float _2402 = as_type<float>(_2384) * _2388;
    int _2404 = abs(_2348);
    float _2406 = _2394 * _2394;
    float _2408 = _2398 * _2398;
    int _2410 = ~_2240;
    int _2412 = _2410 + 1;
    float _2414 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2416 = trunc(_2378);
    float _2418 = precise::max(_2416, 0.0);
    uint _2420 = uint(_2418);
    int _2422 = abs(_2370);
    float _2424 = _2406 + _2408;
    int _2426 = as_type<int>(_2380) + (-2);
    float _2428 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2414);
    float _2430 = float(uint(_2404));
    float _2432 = float(uint(_2422));
    float _2434 = trunc(_2402);
    float _2436 = precise::max(_2434, 0.0);
    uint _2438 = uint(_2436);
    int _2440 = as_type<int>(_2400) + (-2);
    float _2442 = as_type<float>(_2426) * _2430;
    int _2444 = ~_2270;
    int _2446 = _2444 + 1;
    float _2448 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2428);
    int _2450 = ~_2350;
    int _2452 = _2450 + 1;
    float _2454 = as_type<float>(_2440) * _2432;
    float _2456 = -_251;
    int _2458 = _1928 ? as_type<int>(_2456) : as_type<int>(_251);
    float _2460 = sqrt(_2424);
    int _2462 = _2412 * int(_2420);
    int _2464 = _2462 + _2348;
    float _2466 = _2448 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _2468 = _792 > 0.5;
    float _2470 = float(uint(_2464));
    float _2472 = _1726 + _2466;
    float _2474 = trunc(_2442);
    float _2476 = precise::max(_2474, 0.0);
    uint _2478 = uint(_2476);
    int _2480 = _2446 * int(_2438);
    int _2482 = _2480 + _2370;
    float _2484 = as_type<float>(_2362) * _2470;
    int _2486 = ~_2334;
    int _2488 = _2486 + 1;
    float _2490 = float(uint(_2482));
    float _2492 = trunc(_2454);
    float _2494 = precise::max(_2492, 0.0);
    uint _2496 = uint(_2494);
    bool _2498 = _2460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2500 = as_type<float>(_2384) * _2490;
    float _2502 = trunc(_2484);
    float _2504 = precise::max(_2502, 0.0);
    uint _2506 = uint(_2504);
    int _2508 = _2452 * int(_2478);
    int _2510 = _2508 + _2404;
    float _2512 = float(uint(_2510));
    int _2514 = _2488 * int(_2496);
    int _2516 = _2514 + _2422;
    float _2518 = float(uint(_2516));
    bool _2520 = !_2498;
    float _2522 = _2472;
    float _2524 = _2406;
    float _2526 = _2408;
    float _2528 = _2352;
    float _2530 = _2354;
    if (!_2520)
    {
        float _2532 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2536 = _2460 + _2534;
        float _2538 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2540 = rsqrt(_2424);
        float _2542 = _2536 * _2532;
        float _2544 = _2542 * 0.15915493667125701904296875;
        float _2546 = _2544 * 6.283185482025146484375;
        float _2548 = sin(_2546);
        float _2550 = _2544 * 6.283185482025146484375;
        float _2552 = cos(_2550);
        float _2554 = fma(_2548, _2538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2556 = _2540 * _2554;
        float _2558 = _2552 + (-1.0);
        float _2560 = fma(_2394, _2556, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2562 = fma(_2398, _2556, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2564 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2568 = _2560 + _2566;
        float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2572 = _2562 + _2570;
        float _2574 = fma(_2472, _2552, _2564);
        float _2576 = _2568 * _2568;
        float _2578 = _2572 * _2572;
        _2522 = _2574;
        _2524 = _2576;
        _2526 = _2578;
        _2528 = _2560;
        _2530 = _2562;
    }
    float _2580 = _2522;
    float _2582 = _2524;
    float _2584 = _2526;
    float _2586 = _2528;
    float _2588 = _2530;
    float _2590 = trunc(_2500);
    float _2592 = precise::max(_2590, 0.0);
    uint _2594 = uint(_2592);
    float _2596 = as_type<float>(_2440) * _2518;
    float _2598 = as_type<float>(_2426) * _2512;
    float _2600 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2196);
    bool _2602 = !_2030;
    float _2604 = _2602 ? _255 : as_type<float>(_1298);
    float _2606 = _255 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2608 = -_255;
    int _2610 = _1910 ? as_type<int>(_2608) : as_type<int>(_255);
    float _2612 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2190);
    int _2614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2616 = _2614 != 0;
    float _2618 = trunc(_2596);
    float _2620 = precise::max(_2618, 0.0);
    uint _2622 = uint(_2620);
    float _2624 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2192);
    float _2626 = -_251;
    int _2628 = _2468 ? as_type<int>(_2626) : as_type<int>(_251);
    float _2630 = _251 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2632 = !_2616;
    float _2634 = _2632 ? _255 : as_type<float>(_2610);
    float _2636 = _2606 * _2180;
    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2640 = _2580 + _2638;
    bool _2642 = !_2034;
    float _2644 = _2642 ? _251 : as_type<float>(_2628);
    float _2646 = trunc(_2598);
    float _2648 = precise::max(_2646, 0.0);
    uint _2650 = uint(_2648);
    float _2652 = _2606 * _2178;
    float _2654 = fma(_2630, _2624, _2636);
    float _2656 = _2606 * _2204;
    float _2658 = fma(_2640, _2640, _2582);
    int _2660 = int(_2420) + int(_2506);
    float _2662 = -_149;
    float _2664 = fma(_2662, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1628);
    int _2666 = int(_2438) + int(_2594);
    float _2668 = _2658 + _2584;
    int _2670 = ~_2240;
    int _2672 = _2670 + 1;
    float _2674 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1930);
    int _2676 = ~_2270;
    int _2678 = _2676 + 1;
    float _2680 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1962);
    bool _2682 = !_1602;
    float _2684 = _2682 ? _251 : as_type<float>(_2458);
    float _2686 = fma(_2630, _2612, _2652);
    float _2688 = fma(_2630, _2600, _2656);
    int _2690 = ~_2334;
    int _2692 = _2690 + 1;
    int _2694 = _2672 * _2660;
    int _2696 = _2694 + _2348;
    int _2698 = int(_2496) + int(_2622);
    int _2700 = _2678 * _2666;
    int _2702 = _2700 + _2370;
    int _2704 = int(_2478) + int(_2650);
    float _2706 = -_2674;
    float _2708 = _2706 + 1.0;
    int _2710 = ~_2350;
    int _2712 = _2710 + 1;
    float _2714 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1902);
    float _2716 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1978);
    bool _2718 = uint(_2696) >= uint(_2240);
    int _2720 = _2712 * _2704;
    int _2722 = _2720 + _2404;
    bool _2724 = uint(_2702) >= uint(_2270);
    int _2726 = _2692 * _2698;
    int _2728 = _2726 + _2422;
    bool _2730 = !_2718;
    int _2732 = _2730 ? 0 : (-1);
    float _2734 = sqrt(_2668);
    bool _2736 = !_2724;
    int _2738 = _2736 ? 0 : (-1);
    float _2740 = -_2680;
    float _2742 = _2740 + 1.0;
    bool _2744 = uint(_2722) >= uint(_2350);
    out.m_76.x = _2612;
    out.m_76.y = _2624;
    out.m_76.z = _2600;
    int _2746 = ~_2660;
    int _2748 = _2746 + _2732;
    int _2750 = _2748 + 1;
    int _2752 = ~_2666;
    int _2754 = _2752 + _2738;
    int _2756 = _2754 + 1;
    float _2758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2760 = uint(_2728) >= uint(_2334);
    int _2762 = _2240 * _2750;
    int _2764 = _2762 + _2348;
    int _2766 = _2370 ^ _2270;
    int _2768 = _2270 * _2756;
    int _2770 = _2768 + _2370;
    bool _2772 = _2240 == 0;
    bool _2774 = _2240 == 0;
    int _2776 = _2348 ^ _2240;
    float _2778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2780 = !_2760;
    int _2782 = _2780 ? 0 : (-1);
    uint _2784 = uint(int(uint(_2766) >> uint(31)));
    bool _2786 = !_2744;
    int _2788 = _2786 ? 0 : (-1);
    int _2790 = ~_2782;
    int _2792 = _2698 + _2790;
    int _2794 = _2792 + 1;
    int _2796 = ~int(_2784);
    int _2798 = _2796 + 1;
    bool _2800 = _2270 == 0;
    bool _2802 = _2270 == 0;
    uint _2804 = uint(int(uint(_2776) >> uint(31)));
    bool _2806 = !_2772;
    int _2808 = _2806 ? _2764 : (-1);
    int _2810 = ~_2788;
    int _2812 = _2704 + _2810;
    int _2814 = _2812 + 1;
    float _2816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2818 = _2794 ^ _2798;
    int _2820 = ~int(_2804);
    int _2822 = _2820 + 1;
    float _2824 = _2758 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2826 = float(_2808);
    int _2828 = ~_2798;
    int _2830 = _2828 + _2818;
    int _2832 = _2830 + 1;
    float _2834 = fma(_2606, _2606, 1.0);
    int _2836 = _2814 ^ _2822;
    float _2838 = fma(_2824, _2826, _2664);
    float _2840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2842 = _2778 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2844 = ~_2822;
    int _2846 = _2844 + _2836;
    int _2848 = _2846 + 1;
    float _2850 = -_149;
    float _2852 = fma(_2850, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2000);
    bool _2854 = !_2800;
    int _2856 = _2854 ? _2770 : (-1);
    float _2858 = _2684 + 0.5;
    bool _2860 = !_2774;
    int _2862 = _2860 ? _2848 : (-1);
    float _2864 = _2816 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2866 = rsqrt(_2834);
    float _2868 = float(_2856);
    float _2870 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1652);
    float _2872 = float(_2862);
    float _2874 = fma(_2824, _2858, _2838);
    bool _2876 = !_2802;
    int _2878 = _2876 ? _2832 : (-1);
    float _2880 = fma(_2864, _2868, _2852);
    float _2882 = _2644 + 0.5;
    float _2884 = -_2870;
    float _2886 = fma(_2842, _2872, _2884);
    float _2888 = float(_2878);
    float _2890 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2020);
    float _2892 = _2840 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2894 = fma(_2864, _2882, _2880);
    float _2896 = _2634 + (-0.5);
    bool _2898 = _2734 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2900 = isnan(_2734);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2906 = _2902 || _2904;
    float _2908 = -_2890;
    float _2910 = fma(_2892, _2888, _2908);
    float _2912 = _2606 * _2866;
    float _2914 = -_2842;
    float _2916 = fma(_2914, _2896, _2886);
    float _2918 = _2604 + (-0.5);
    float _2920 = -_2390;
    float _2922 = _2912 * _2920;
    float _2924 = -_2386;
    float _2926 = _2912 * _2924;
    float _2928 = -_2382;
    float _2930 = _2912 * _2928;
    float _2932 = -_2892;
    float _2934 = fma(_2932, _2918, _2910);
    float _2936 = fma(_2866, _2204, _2922);
    float _2938 = fma(_2866, _2178, _2926);
    float _2940 = fma(_2866, _2180, _2930);
    float _2942 = _2382 + _2654;
    float _2944 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2946 = -_2708;
    float _2948 = fma(_2684, _2946, _2874);
    float _2950 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2952 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2954 = -_2714;
    float _2956 = _2954 + 1.0;
    float _2958 = -_2716;
    float _2960 = _2958 + 1.0;
    float _2962 = _2386 + _2686;
    float _2964 = _1992 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2966 = _2950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2968 = _2944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2970 = _2952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2972 = -_2742;
    float _2974 = fma(_2644, _2972, _2894);
    float _2976 = fma(_2634, _2956, _2916);
    float _2978 = fma(_2604, _2960, _2934);
    float _2980 = _2390 + _2688;
    out.m_78.x = _2966;
    out.m_78.y = _2968;
    out.m_78.z = _2970;
    out.m_78.w = _2964;
    float _2982 = _2716;
    float _2984 = _2978;
    float _2986 = _2974;
    float _2988 = _2894;
    float _2990 = _2930;
    float _2992 = _2644;
    if (!_2906)
    {
        _2982 = 1.0;
    }
    float _2994 = _2982;
    out.m_80.x = _2938;
    out.m_80.y = _2940;
    out.m_80.z = _2936;
    out.m_82.x = _2948;
    out.m_82.y = _2976;
    out.m_82.z = _2974;
    out.m_82.w = _2978;
    out.m_84.x = _2962;
    out.m_84.y = _2942;
    out.m_84.z = _2980;
    bool _2996 = !_2906;
    float _2998 = _2994;
    if (!_2996)
    {
        bool _3000 = _2734 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3002 = isnan(_2734);
        bool _3004 = _3000 || _3002;
        bool _3006 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3008 = _3004 || _3006;
        if (!_3008)
        {
            float _3010 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3012 = _2734 + _3010;
            float _3014 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3016 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3014;
            float _3018 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3020 = _3018 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3022 = 1.0 / _3016;
            float _3024 = _3012 * _3022;
            float _3026 = fma(_3024, _3020, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2998 = _3026;
            _3028 = true;
        }
        else
        {
            bool _3030 = _2734 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3032 = isnan(_2734);
            bool _3034 = _3030 || _3032;
            bool _3036 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3038 = _3034 || _3036;
            if (!_3038)
            {
                float _3040 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3042 = _2734 + _3040;
                float _3044 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3046 = _3044 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3048 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3050 = _3048 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3052 = 1.0 / _3046;
                float _3054 = _3042 * _3052;
                float _3056 = fma(_3054, _3050, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2998 = _3056;
                _3028 = true;
            }
            else
            {
                _2998 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3028 = false;
    float _3058 = _2998;
    float _3060 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3062 = _2580 + _3060;
    float _3064 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3066 = _2586 + _3064;
    float _3068 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3070 = _2588 + _3068;
    float _3072 = fma(_3062, _3058, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3074 = fma(_3066, _3058, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3076 = fma(_3070, _3058, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3078 = -_1726;
    float _3080 = _3078 + _3072;
    float _3082 = -_1640;
    float _3084 = _3082 + _3074;
    float _3086 = -_1722;
    float _3088 = _3086 + _3076;
    float _3090 = _3080 * _3080;
    float _3092 = fma(_3084, _3084, _3090);
    float _3094 = fma(_3088, _3088, _3092);
    float _3096 = sqrt(_3094);
    bool _3098 = _3096 > 0.0;
    bool _3100 = !_3098;
    float _3102 = _3096;
    float _3104 = _3072;
    float _3106 = _3074;
    float _3108 = _3076;
    if (!_3100)
    {
        bool _3110 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3112 = _2966;
        if (_3110)
        {
            float _3114 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3112 = _3114;
        }
        float _3116 = _3112;
        if (_3110)
        {
            float _3118 = _461 * _3116;
            _2984 = _3118;
        }
        float _3120 = _2984;
        float _3122 = _3120;
        if (_3110)
        {
            float _3124 = _463 * _3116;
            _2986 = _3124;
        }
        float _3126 = _2986;
        float _3128 = _3126;
        if (_3110)
        {
            float _3130 = _465 * _3116;
            _3102 = _3130;
        }
        float _3132 = _3102;
        float _3134 = _3132;
        if (!_3110)
        {
            bool _3136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _3138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _3140 = _3136 || _3138;
            bool _3142 = isnan(1.0);
            bool _3144 = _3140 || _3142;
            float _3146 = _149 + 1.0;
            float _3148 = _3146;
            if (!_3144)
            {
                float _3150 = _3146 * _3146;
                float _3152 = _3150 * 0.5;
                _469 = _3152;
            }
            float _3154 = _469;
            float _3156 = _3154;
            if (!_3144)
            {
                float _3158 = _3154 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3156 = _3158;
            }
            float _3160 = _3156;
            bool _3162 = !_3144;
            float _3164 = _3160;
            if (!_3162)
            {
                float _3166 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3168 = log2(_3166);
                float _3170 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3172 = _3170 + 1.0;
                float _3174 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3176 = _3168 * _3146;
                float _3178 = 1.0 / _3172;
                float _3180 = _3174 * 0.693147182464599609375;
                float _3182 = exp2(_3176);
                float _3184 = 1.0 / _3180;
                float _3186 = _3182 + (-1.0);
                float _3188 = -_3186;
                float _3190 = fma(_3188, _3184, _3146);
                float _3192 = _3190 * _3178;
                float _3194 = _3192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3164 = _3194;
            }
            float _3196 = _3164;
            float _3198 = _3196 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3200 = _3196 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3202 = !_3144;
            if (!_3202)
            {
                float _3204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3206 = log2(_3204);
                float _3208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3210 = _3208 + 1.0;
                float _3212 = 1.0 / _3210;
                float _3214 = _3206 * _3146;
                float _3216 = exp2(_3214);
                float _3218 = -_3216;
                float _3220 = _3218 + 1.0;
                float _3222 = _3220 * _3212;
                _3148 = _3222;
            }
            float _3224 = _3148;
            float _3226 = fma(_3224, _187, _3200);
            float _3228 = _3196 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3230 = fma(_3224, _185, _3198);
            float _3232 = -_423;
            float _3234 = _3232 + _3226;
            float _3236 = fma(_3224, _189, _3228);
            float _3238 = -_427;
            float _3240 = _3238 + _3230;
            float _3242 = _3234 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3244 = _3234 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3246 = _3234 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3248 = -_435;
            float _3250 = _3248 + _3236;
            float _3252 = fma(_3240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3242);
            float _3254 = fma(_3240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3244);
            float _3256 = fma(_3240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3246);
            float _3258 = fma(_3250, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3252);
            float _3260 = fma(_3250, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3254);
            float _3262 = fma(_3250, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3256);
            _471 = _3260;
            _473 = _3258;
            _475 = _3262;
            _3122 = _3258;
            _3128 = _3260;
            _3134 = _3262;
        }
        float _3264 = _471;
        float _3266 = _473;
        float _3268 = _475;
        float _3270 = _3122;
        float _3272 = _3128;
        float _3274 = _3134;
        float _3276 = _3264 * _3264;
        float _3278 = rsqrt(_3094);
        float _3280 = fma(_3266, _3266, _3276);
        float _3282 = fma(_3268, _3268, _3280);
        float _3284 = sqrt(_3282);
        float _3286 = _3080 * _3278;
        float _3288 = _3084 * _3278;
        float _3290 = _3088 * _3278;
        bool _3292 = _3284 > 0.0;
        bool _3294 = !_3292;
        if (!_3294)
        {
            float _3296 = rsqrt(_3282);
            float _3298 = _3296 * _3264;
            float _3300 = _3296 * _3266;
            float _3302 = _3296 * _3268;
            float _3304 = _3286 * _3298;
            float _3306 = fma(_3288, _3300, _3304);
            float _3308 = fma(_3290, _3302, _3306);
            float _3310 = _3308 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3312 = fma(_3270, _3310, _3074);
            float _3314 = fma(_3272, _3310, _3072);
            float _3316 = fma(_3274, _3310, _3076);
            _3104 = _3314;
            _3106 = _3312;
            _3108 = _3316;
        }
    }
    float _3318 = _3104;
    float _3320 = _3106;
    float _3322 = _3108;
    float _3324 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3326 = _3318 + _3324;
    float _3328 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3330 = _3320 + _3328;
    float _3332 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3334 = _3322 + _3332;
    float _3336 = _1726 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3338 = _3326 * _3326;
    float _3340 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3336);
    float _3342 = fma(_3330, _3330, _3338);
    float _3344 = fma(_3334, _3334, _3342);
    float _3346 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3340);
    float _3348 = _1726 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3350 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3352 = rsqrt(_3344);
    float _3354 = _3346 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3356 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3348);
    float _3358 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3356);
    float _3360 = 1.0 / _3354;
    float _3362 = _3358 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3364 = _3362 + _3354;
    float _3366 = _3352 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3368 = floor(_3350);
    float _3370 = _3330 * _3366;
    float _3372 = _3334 * _3366;
    float _3374 = _3370 * _3370;
    float _3376 = _3372 * _3372;
    float _3378 = _3364 * _3360;
    float _3380 = _3378 * 0.5;
    float _3382 = sqrt(_3344);
    float _3384 = _3374 + _3376;
    float _3386 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3388 = fma(_3380, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3386);
    float _3390 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _3392 = -_3368;
    float _3394 = _3350 + _3392;
    float _3396 = sqrt(_3384);
    float _3398 = _1726 + _3390;
    float _3400 = _3398 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3402 = _3398 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3404 = 1.0 / _3388;
    float _3406 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3400);
    float _3408 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3402);
    float _3410 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3406);
    float _3412 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3408);
    bool _3414 = _3396 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3418 = _3396 + _3416;
    float _3420 = _3410 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3422 = _3412 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _3424 = trunc(_3420);
    int _3426 = int(_3424);
    float _3428 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3430 = _3404 * _3428;
    float _3432 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _3434 = _3430 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3436 = _3094;
    int _3438 = 2;
    float _3440 = _3418;
    float _3442 = _3384;
    float _3444 = _3372;
    float _3446 = _3368;
    float _3448 = _3370;
    if (_3414)
    {
        float _3450 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3436 = _3450;
    }
    float _3452 = _3436;
    bool _3454 = _3430 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3456 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3458 = trunc(_3422);
    int _3460 = int(_3458);
    int _3462 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3464 = _3426 + _3462;
    int _3466 = _3464 + 1;
    float _3468 = _3456;
    if (!_3434)
    {
        _3438 = 1;
    }
    int _3470 = _3438;
    int _3472 = _3470;
    if (_3414)
    {
        float _3474 = _3418 * _3452;
        _3440 = _3474;
    }
    float _3476 = _3440;
    if (_3414)
    {
        float _3478 = rsqrt(_3384);
        _3442 = _3478;
    }
    float _3480 = _3442;
    float _3482 = _3480;
    if (_3414)
    {
        float _3484 = _3476 * 0.15915493667125701904296875;
        _2988 = _3484;
    }
    float _3486 = _2988;
    bool _3488 = !_3434;
    int _3490 = _3488 ? 0 : 1;
    int _3492 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3494 = _3460 + _3492;
    int _3496 = _3494 + 1;
    float _3498 = _3396;
    if (_3414)
    {
        float _3500 = _3486 * 6.283185482025146484375;
        float _3502 = sin(_3500);
        _3498 = _3502;
    }
    float _3504 = _3498;
    if (!_3454)
    {
        _3472 = _3490;
    }
    int _3506 = _3472;
    float _3508 = precise::max(0.0, _3456);
    int _3510 = _3506 << 6;
    bool _3512 = _3466 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _3514 = -_3366;
    float _3516 = -_3508;
    float _3518 = fma(_3326, _3514, _3516);
    int _3520 = _3510 + 48;
    uint _3522 = uint(int(uint(_3520) >> uint(2)));
    uint _3524 = uint(int(uint(int(_3522)) >> uint(2)));
    int _3526 = int(_3522) & 3;
    float _3528 = (*spvDescriptorSet0.vp_c15)._m0[int(_3524)][_3526];
    int _3530 = int(_3522) + 1;
    uint _3532 = uint(int(uint(_3530) >> uint(2)));
    int _3534 = _3530 & 3;
    float _3536 = (*spvDescriptorSet0.vp_c15)._m0[int(_3532)][_3534];
    int _3538 = _3466 | _3496;
    float _3540 = _3486;
    if (_3414)
    {
        float _3542 = _3486 * 6.283185482025146484375;
        float _3544 = cos(_3542);
        _3540 = _3544;
    }
    float _3546 = _3540;
    if (_3414)
    {
        float _3548 = _3518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3468 = _3548;
    }
    float _3550 = _3468;
    float _3552 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _3554 = _3538 < 0;
    bool _3556 = _3554 || _3512;
    float _3558 = _3550;
    if (_3414)
    {
        float _3560 = fma(_3504, _3550, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3558 = _3560;
    }
    float _3562 = _3558;
    int _3564 = _3510 + 64;
    uint _3566 = uint(int(uint(_3564) >> uint(2)));
    uint _3568 = uint(int(uint(int(_3566)) >> uint(2)));
    int _3570 = int(_3566) & 3;
    float _3572 = (*spvDescriptorSet0.vp_c15)._m0[int(_3568)][_3570];
    int _3574 = int(_3566) + 1;
    uint _3576 = uint(int(uint(_3574) >> uint(2)));
    int _3578 = _3574 & 3;
    float _3580 = (*spvDescriptorSet0.vp_c15)._m0[int(_3576)][_3578];
    bool _3582 = _3496 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3584 = _3582 || _3556;
    float _3586 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3552);
    if (_3414)
    {
        float _3588 = _3480 * _3562;
        _2990 = _3588;
    }
    float _3590 = _2990;
    if (!_3414)
    {
        _3482 = _3518;
    }
    float _3592 = _3482;
    float _3594 = floor(_3432);
    float _3596 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3586);
    float _3598 = _3592;
    if (_3414)
    {
        float _3600 = _3372 * _3590;
        _3444 = _3600;
    }
    float _3602 = _3444;
    int _3604 = _3510 + 96;
    uint _3606 = uint(int(uint(_3604) >> uint(2)));
    uint _3608 = uint(int(uint(int(_3606)) >> uint(2)));
    int _3610 = int(_3606) & 3;
    float _3612 = (*spvDescriptorSet0.vp_c15)._m0[int(_3608)][_3610];
    int _3614 = int(_3606) + 1;
    uint _3616 = uint(int(uint(_3614) >> uint(2)));
    int _3618 = _3614 & 3;
    float _3620 = (*spvDescriptorSet0.vp_c15)._m0[int(_3616)][_3618];
    float _3622 = _3546;
    if (_3414)
    {
        float _3624 = _3546 + (-1.0);
        _3446 = _3624;
    }
    float _3626 = _3446;
    float _3628 = _3626;
    if (_3414)
    {
        float _3630 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2992 = _3630;
    }
    float _3632 = _2992;
    if (!_3414)
    {
        _3628 = _3370;
    }
    float _3634 = _3628;
    int _3636 = _3510 + 104;
    uint _3638 = uint(int(uint(_3636) >> uint(2)));
    uint _3640 = uint(int(uint(int(_3638)) >> uint(2)));
    int _3642 = int(_3638) & 3;
    float _3644 = (*spvDescriptorSet0.vp_c15)._m0[int(_3640)][_3642];
    int _3646 = int(_3638) + 1;
    uint _3648 = uint(int(uint(_3646) >> uint(2)));
    int _3650 = _3646 & 3;
    float _3652 = (*spvDescriptorSet0.vp_c15)._m0[int(_3648)][_3650];
    float _3654 = _2916;
    float _3656 = _3634;
    if (!_3584)
    {
        float _3658 = floor(_3422);
        _3654 = _3658;
    }
    float _3660 = _3654;
    if (_3414)
    {
        float _3662 = _3370 * _3590;
        _3656 = _3662;
    }
    float _3664 = _3656;
    if (!_3414)
    {
        _3448 = _3374;
    }
    float _3666 = _3448;
    float _3668 = _3596 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3670 = _3666;
    if (_3414)
    {
        float _3672 = fma(_3518, _3546, _3632);
        _3598 = _3672;
    }
    float _3674 = _3598;
    if (_3414)
    {
        float _3676 = _3664 * _3664;
        _3670 = _3676;
    }
    float _3678 = _3670;
    if (!_3414)
    {
        _3622 = _3376;
    }
    float _3680 = _3622;
    int _3682 = _3510 + 80;
    uint _3684 = uint(int(uint(_3682) >> uint(2)));
    uint _3686 = uint(int(uint(int(_3684)) >> uint(2)));
    int _3688 = int(_3684) & 3;
    float _3690 = (*spvDescriptorSet0.vp_c15)._m0[int(_3686)][_3688];
    int _3692 = int(_3684) + 1;
    uint _3694 = uint(int(uint(_3692) >> uint(2)));
    int _3696 = _3692 & 3;
    float _3698 = (*spvDescriptorSet0.vp_c15)._m0[int(_3694)][_3696];
    float _3700 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3702 = _3668 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3704 = _3680;
    int _3706 = as_type<int>(_3700);
    if (_3414)
    {
        float _3708 = _3602 * _3602;
        _3704 = _3708;
    }
    float _3710 = _3704;
    float _3712 = fma(_3674, _3674, _3678);
    float _3714 = -_3594;
    float _3716 = _3432 + _3714;
    float _3718 = -_3702;
    float _3720 = fma(_3718, _3700, 1.0);
    float _3722 = _3720;
    if (!_3584)
    {
        int _3724 = _3496 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3726 = _3724 + _3466;
        _3706 = _3726;
    }
    int _3728 = _3706;
    int _3730 = _3510 + 56;
    uint _3732 = uint(int(uint(_3730) >> uint(2)));
    uint _3734 = uint(int(uint(int(_3732)) >> uint(2)));
    int _3736 = int(_3732) & 3;
    float _3738 = (*spvDescriptorSet0.vp_c15)._m0[int(_3734)][_3736];
    int _3740 = int(_3732) + 1;
    uint _3742 = uint(int(uint(_3740) >> uint(2)));
    int _3744 = _3740 & 3;
    float _3746 = (*spvDescriptorSet0.vp_c15)._m0[int(_3742)][_3744];
    float _3748 = _3712 + _3710;
    float _3750 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3752 = fma(_3382, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3750);
    float _3754 = precise::clamp(_3752, 0.0, 1.0);
    int _3756 = _3510 + 72;
    uint _3758 = uint(int(uint(_3756) >> uint(2)));
    uint _3760 = uint(int(uint(int(_3758)) >> uint(2)));
    int _3762 = int(_3758) & 3;
    float _3764 = (*spvDescriptorSet0.vp_c15)._m0[int(_3760)][_3762];
    int _3766 = int(_3758) + 1;
    uint _3768 = uint(int(uint(_3766) >> uint(2)));
    int _3770 = _3766 & 3;
    float _3772 = (*spvDescriptorSet0.vp_c15)._m0[int(_3768)][_3770];
    float _3774 = _3398 * _3536;
    float _3776 = fma(_1640, _3528, _3774);
    int _3778 = as_type<int>(_3774);
    if (!_3584)
    {
        int _3780 = _3728 << 2;
        _3778 = _3780;
    }
    int _3782 = _3778;
    int _3784 = _3510 + 88;
    uint _3786 = uint(int(uint(_3784) >> uint(2)));
    uint _3788 = uint(int(uint(int(_3786)) >> uint(2)));
    int _3790 = int(_3786) & 3;
    float _3792 = (*spvDescriptorSet0.vp_c15)._m0[int(_3788)][_3790];
    int _3794 = int(_3786) + 1;
    uint _3796 = uint(int(uint(_3794) >> uint(2)));
    int _3798 = _3794 & 3;
    float _3800 = (*spvDescriptorSet0.vp_c15)._m0[int(_3796)][_3798];
    float _3802 = _3398 * _3580;
    float _3804 = _3580;
    int _3806 = _3782;
    if (!_3584)
    {
        float _3808 = -_3660;
        float _3810 = _3422 + _3808;
        _3804 = _3810;
    }
    float _3812 = _3804;
    if (!_3584)
    {
        int _3814 = 12 & _3782;
        _3806 = _3814;
    }
    int _3816 = _3806;
    float _3818 = rsqrt(_3748);
    float _3820 = fma(_1640, _3572, _3802);
    float _3822 = _3398 * _3620;
    float _3824 = fma(_1640, _3612, _3822);
    float _3826 = -_3754;
    float _3828 = _3826 + 1.0;
    float _3830 = fma(_1722, _3644, _3824);
    float _3832 = abs(_3828);
    float _3834 = log2(_3832);
    float _3836 = _3830 + _3652;
    float _3838 = _3818 * _3664;
    float _3840 = _3818 * _3674;
    float _3842 = _3818 * _3602;
    float _3844 = _3398 * _3698;
    int _3846 = as_type<int>(_3698);
    int _3848 = _3816;
    if (!_3584)
    {
        uint _3850 = uint(int(uint(_3728) >> uint(2)));
        _3846 = int(_3850);
    }
    int _3852 = _3846;
    float _3854 = _3838 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3856 = 1.0 / _3836;
    float _3858 = fma(_1640, _3690, _3844);
    if (!_3584)
    {
        int _3860 = _3852 << 4;
        int _3862 = _3860 + _3816;
        _3848 = _3862;
    }
    int _3864 = _3848;
    float _3866 = -_3854;
    float _3868 = fma(_3840, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3866);
    float _3870 = fma(_1722, _3738, _3776);
    float _3872 = _3854;
    if (!_3584)
    {
        int _3874 = _3864 + 400;
        uint _3876 = uint(int(uint(_3874) >> uint(2)));
        uint _3878 = uint(int(uint(int(_3876)) >> uint(2)));
        int _3880 = int(_3876) & 3;
        float _3882 = (*spvDescriptorSet0.vp_c15)._m0[int(_3878)][_3880];
        _3872 = _3882;
    }
    float _3884 = _3872;
    float _3886 = _3870 + _3746;
    float _3888 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3890 = fma(_1722, _3764, _3820);
    float _3892 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3888);
    float _3894 = -_3842;
    float _3896 = fma(_3894, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3868);
    float _3898 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3900 = _3890 + _3772;
    float _3902 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3904 = _3834 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3906 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3898);
    float _3908 = fma(_1722, _3792, _3858);
    float _3910 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3902);
    float _3912 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3892);
    float _3914 = _3886 * _3856;
    float _3916 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3906);
    float _3918 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3910);
    float _3920 = _3912 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3922 = exp2(_3904);
    bool _3924 = _3914 >= 0.0;
    float _3926 = _3918 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3928 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3930 = fma(_3896, -0.5, 0.5);
    bool _3932 = _3914 <= 1.0;
    bool _3934 = _3932 && _3924;
    float _3936 = fma(_3896, 0.5, 0.5);
    float _3938 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3928);
    float _3940 = _3900 * _3856;
    float _3942 = _3916 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3944 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3938);
    float _3946 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3948 = _3940 >= 0.0;
    bool _3950 = _3948 && _3934;
    float _3952 = fma(_3936, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3954 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3944);
    float _3956 = sqrt(_3930);
    bool _3958 = _3940 <= 1.0;
    bool _3960 = _3958 && _3950;
    float _3962 = fma(_3936, _3952, -0.212114393711090087890625);
    float _3964 = _3908 + _3800;
    float _3966 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3968 = _3840 + 1.0;
    float _3970 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3946);
    float _3972 = fma(_3936, _3962, 1.570728778839111328125);
    float _3974 = 1.0 / _3954;
    float _3976 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3966);
    float _3978 = -_3840;
    float _3980 = fma(_3922, _3968, _3978);
    float _3982 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3970);
    float _3984 = _3964 * _3856;
    float _3986 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3976);
    float _3988 = _3936;
    float _3990 = _3954;
    if (_3960)
    {
        float _3992 = float(_3506);
        _3988 = _3992;
    }
    float _3994 = _3988;
    float _3996 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3982);
    float _3998 = log2(_3720);
    float _4000 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3986);
    float _4002 = _3956 * 0.636619746685028076171875;
    float2 _10564 = float2(_3394, _3716);
    float _4004 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10564, float2(0.0), isnan(_10564)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10564, float2(0.0), isnan(_10564)), level(0.0)).x;
    float _4006 = fma(_3980, 0.5, 0.5);
    float _4008 = -_3972;
    float _4010 = fma(_4002, _4008, 1.0);
    float _4012 = _3904;
    if (!_3584)
    {
        float _4014 = floor(_3420);
        _4012 = _4014;
    }
    float _4016 = _4012;
    float _4018 = _3996 * _3974;
    float _4020 = _4000 * _3974;
    float _4022 = fma(_4018, 0.5, 0.5);
    float _4024 = fma(_4020, -0.5, 0.5);
    float _4026 = _3970;
    if (_3960)
    {
        float _4028 = rint(_3994);
        float _4030 = precise::max(_4028, 0.0);
        uint _4032 = uint(_4030);
        uint _4034 = clamp(_4032, 0u, 65535u);
        _4026 = as_type<float>(_4034);
    }
    float _4036 = _4026;
    float _4038 = _3998 * 0.693147182464599609375;
    float _4040 = _4038 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4042 = _3884;
    if (!_3584)
    {
        float _4044 = rint(_3884);
        float _4046 = precise::max(_4044, 0.0);
        uint _4048 = uint(_4046);
        uint _4050 = clamp(_4048, 0u, 65535u);
        _4042 = as_type<float>(_4050);
    }
    float _4052 = _4042;
    if (!_3584)
    {
        float _4054 = -_4016;
        float _4056 = _3420 + _4054;
        _3722 = _4056;
    }
    float _4058 = _3722;
    float _4060 = _3922;
    if (_3960)
    {
        float3 _10656 = float3(_3914, _3940, float(as_type<int>(_4036)));
        float3 _10660 = select(_10656, float3(0.0), isnan(_10656));
        float _4062 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _10660.xy, uint(rint(_10660.z)), _3984, level(0.0));
        _4060 = _4062;
    }
    float _4064 = _4060;
    float3 _10670 = float3(_4022, _4024, _4040);
    float _4066 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10670, float3(0.0), isnan(_10670)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10670, float3(0.0), isnan(_10670)), level(0.0)).x;
    float3 _10679 = float3(_4022, _4024, _4040);
    float4 _4069 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10679, float3(0.0), isnan(_10679)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10679, float3(0.0), isnan(_10679)), level(0.0)).xyzw;
    float _4071 = _4069.x;
    float _4073 = _4069.y;
    float _4075 = _4069.z;
    float _4077 = _4069.w;
    float2 _10695 = float2(_4010, _4006);
    float3 _4081 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10695, float2(0.0), isnan(_10695)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10695, float2(0.0), isnan(_10695)), level(0.0)).xyz;
    float _4083 = _4081.x;
    float _4085 = _4081.y;
    float _4087 = _4081.z;
    float _4089 = _3812;
    if (!_3584)
    {
        float3 _10716 = float3(_4058, _3812, float(as_type<int>(_4052)));
        float3 _10718 = select(_10716, float3(0.0), isnan(_10716));
        float _4091 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _10718.xy, uint(rint(_10718.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _10718.xy, uint(rint(_10718.z)), level(0.0)).x;
        _4089 = _4091;
    }
    float _4093 = _4089;
    float _4095 = abs(_3430);
    float _4097 = log2(_4095);
    float _4099 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4101 = _3834 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4103 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4099);
    float _4105 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4103);
    float _4107 = exp2(_4101);
    bool _4109 = _3430 <= 8000.0;
    bool _4111 = isnan(_3430);
    bool _4113 = _4109 || _4111;
    bool _4115 = isnan(8000.0);
    bool _4117 = _4113 || _4115;
    float _4119 = float(_4117);
    float _4121 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4105);
    float _4123 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3996;
    out.gl_Position.y = _4000;
    out.gl_Position.z = _4121;
    out.gl_Position.w = _3954;
    float _4125 = exp2(_4123);
    float _4127 = _3996;
    if (_3584)
    {
        _4127 = 1.0;
    }
    float _4129 = _4127;
    float _4131 = fma(_4125, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4133 = precise::clamp(_4131, 0.0, 1.0);
    float _4135 = fma(_4133, -2.0, 3.0);
    float _4137 = _4133 * _4133;
    float _4139 = _4137 * _4135;
    float _4141 = _4121 + _3954;
    float _4143 = _4141 * 0.5;
    float _4145 = -_4139;
    float _4147 = _4145 + 1.0;
    out.m_86.z = _4143;
    out.m_86.w = _3954;
    float _4149 = fma(_4147, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4139);
    float _4151 = -_4107;
    float _4153 = _4151 + 1.0;
    float _4155 = _4119 * _4149;
    float _4157 = _4153 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4159 = _4155 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4161 = _4155;
    float _4163 = _4129;
    if (!_3960)
    {
        _4161 = 1.0;
    }
    float _4165 = _4161;
    float _4167 = -_4004;
    float _4169 = _4167 + 1.0;
    float _4171 = _4169 * _4159;
    float _4173 = precise::clamp(_4171, 0.0, 1.0);
    float _4175 = _4165;
    float _4177 = _4173;
    if (_3960)
    {
        bool _4179 = _4064 >= _3984;
        bool _4181 = isnan(_4064);
        bool _4183 = _4179 || _4181;
        bool _4185 = isnan(_3984);
        bool _4187 = _4183 || _4185;
        float _4189 = float(_4187);
        _4175 = _4189;
    }
    float _4191 = _4175;
    if (!_3584)
    {
        int _4193 = _3728 << 4;
        int _4195 = _4193 + 2048;
        uint _4197 = uint(int(uint(_4195) >> uint(2)));
        uint _4199 = uint(int(uint(int(_4197)) >> uint(2)));
        int _4201 = int(_4197) & 3;
        float _4203 = (*spvDescriptorSet0.vp_c15)._m0[int(_4199)][_4201];
        int _4205 = int(_4197) + 1;
        uint _4207 = uint(int(uint(_4205) >> uint(2)));
        int _4209 = _4205 & 3;
        float _4211 = (*spvDescriptorSet0.vp_c15)._m0[int(_4207)][_4209];
        int _4213 = _4195 + 8;
        uint _4215 = uint(int(uint(_4213) >> uint(2)));
        uint _4217 = uint(int(uint(int(_4215)) >> uint(2)));
        int _4219 = int(_4215) & 3;
        float _4221 = (*spvDescriptorSet0.vp_c15)._m0[int(_4217)][_4219];
        int _4223 = int(_4215) + 1;
        uint _4225 = uint(int(uint(_4223) >> uint(2)));
        int _4227 = _4223 & 3;
        float _4229 = (*spvDescriptorSet0.vp_c15)._m0[int(_4225)][_4227];
        float _4231 = _3398 * _4211;
        float _4233 = fma(_1640, _4203, _4231);
        float _4235 = fma(_1722, _4221, _4233);
        float _4237 = _4235 + _4229;
        float _4239 = precise::clamp(_4237, 0.0, 1.0);
        float _4241 = -_4239;
        float _4243 = _4241 + _4093;
        float _4245 = fma(_4243, 500.0, 1.5);
        float _4247 = exp2(_4245);
        float _4249 = 0.0 + _4247;
        float _4251 = precise::clamp(_4249, 0.0, 1.0);
        _4163 = _4251;
        _3990 = _4229;
    }
    float _4253 = _4163;
    float _4255 = _3990;
    float _4257 = _4157 * _4066;
    float _4259 = _4191 * _4253;
    float _4261 = -_4173;
    float _4263 = fma(_4261, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4265 = -_4157;
    float _4267 = _4265 + 1.0;
    float _4269 = _4077 * _4257;
    float _4271 = _4087 * _4257;
    float _4273 = -_4259;
    float _4275 = fma(_4273, _4263, 1.0);
    float _4277 = precise::clamp(_4275, 0.0, 1.0);
    out.m_88.x = _3320;
    out.m_88.y = _3318;
    out.m_88.z = _3322;
    float _4279 = fma(_4083, _4269, _4071);
    float _4281 = fma(_4085, _4269, _4073);
    float _4283 = _4077 * _4267;
    float _4285 = _4277 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4287 = fma(_4077, _4271, _4075);
    bool _4289 = _3382 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4291 = isnan(_3382);
    bool _4293 = _4289 || _4291;
    bool _4295 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4297 = _4293 || _4295;
    out.m_90.x = _4285;
    out.m_92.x = _4279;
    out.m_92.y = _4281;
    out.m_92.z = _4287;
    out.m_92.w = _4283;
    float _4299 = _4263;
    float _4301 = _4255;
    float _4303 = _4267;
    float _4305 = _4269;
    float _4307 = _4277;
    if (!_4297)
    {
        _4299 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4309 = _4299;
    float _4311 = _4309;
    float _4313 = _4309;
    if (!_4297)
    {
        _4177 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4315 = _4177;
    float _4317 = _4315;
    float _4319 = _4315;
    if (!_4297)
    {
        _4301 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4321 = _4301;
    float _4323 = _4321;
    float _4325 = _4321;
    if (!_4297)
    {
        _4303 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4327 = _4303;
    float _4329 = _4327;
    float _4331 = _4327;
    if (!_4297)
    {
        _4305 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4333 = _4305;
    float _4335 = _4333;
    float _4337 = _4333;
    if (!_4297)
    {
        _4307 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4339 = _4307;
    bool _4341 = !_4297;
    float _4343 = _4339;
    float _4345 = _4339;
    if (!_4341)
    {
        bool _4347 = _3382 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4349 = isnan(_3382);
        bool _4351 = _4347 || _4349;
        bool _4353 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4355 = _4351 || _4353;
        if (!_4355)
        {
            float _4357 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4359 = _3382 + _4357;
            float _4361 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4363 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4361;
            float _4365 = 1.0 / _4363;
            float _4367 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4369 = _4367 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4371 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4373 = _4371 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4375 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4377 = _4375 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4379 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4381 = _4379 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4383 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4385 = _4383 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4387 = _4359 * _4365;
            float _4389 = precise::clamp(_4387, 0.0, 1.0);
            float _4391 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4393 = _4391 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4395 = fma(_4389, _4369, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4397 = fma(_4389, _4393, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4399 = fma(_4389, _4373, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4401 = fma(_4389, _4377, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4403 = fma(_4389, _4381, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4405 = fma(_4389, _4385, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4319 = _4397;
            _4337 = _4403;
            _4313 = _4395;
            _4331 = _4401;
            _4325 = _4399;
            _4345 = _4405;
            _4407 = true;
        }
        else
        {
            bool _4409 = _3382 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4411 = isnan(_3382);
            bool _4413 = _4409 || _4411;
            bool _4415 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4417 = _4413 || _4415;
            if (!_4417)
            {
                _4311 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4419 = _4311;
            _4313 = _4419;
            if (!_4417)
            {
                _4317 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4421 = _4317;
            _4319 = _4421;
            if (!_4417)
            {
                _4323 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4423 = _4323;
            _4325 = _4423;
            if (!_4417)
            {
                _4329 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4425 = _4329;
            _4331 = _4425;
            if (!_4417)
            {
                _4335 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4427 = _4335;
            _4337 = _4427;
            if (!_4417)
            {
                _4343 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4429 = _4343;
            bool _4431 = !_4417;
            _4345 = _4429;
            if (!_4431)
            {
                bool _4433 = _3382 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4435 = isnan(_3382);
                bool _4437 = _4433 || _4435;
                bool _4439 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4441 = _4437 || _4439;
                if (!_4441)
                {
                    float _4443 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4445 = _3382 + _4443;
                    float _4447 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4449 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4447;
                    float _4451 = 1.0 / _4449;
                    float _4453 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4455 = _4453 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4457 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4459 = _4457 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4461 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4463 = _4461 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4465 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4467 = _4465 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4469 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4471 = _4469 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4473 = _4445 * _4451;
                    float _4475 = precise::clamp(_4473, 0.0, 1.0);
                    float _4477 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4479 = _4477 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4481 = fma(_4475, _4455, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4483 = fma(_4475, _4479, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4485 = fma(_4475, _4459, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4487 = fma(_4475, _4463, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4489 = fma(_4475, _4467, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4491 = fma(_4475, _4471, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4319 = _4483;
                    _4337 = _4489;
                    _4313 = _4481;
                    _4331 = _4487;
                    _4325 = _4485;
                    _4345 = _4491;
                    _4407 = true;
                }
                else
                {
                    _4319 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4337 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4313 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4331 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4325 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4345 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4407 = false;
    float _4493 = _4319;
    float _4495 = _4337;
    float _4497 = _4313;
    float _4499 = _4331;
    float _4501 = _4325;
    float _4503 = _4345;
    float _4505 = fma(_2942, -0.5, 0.5);
    float _4507 = precise::clamp(_4505, 0.0, 1.0);
    float _4509 = -_4493;
    float _4511 = _4509 + _4495;
    float _4513 = -_4497;
    float _4515 = _4513 + _4499;
    float _4517 = -_4501;
    float _4519 = _4517 + _4503;
    bool _4521 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4523 = fma(_4507, _4511, _4493);
    float _4525 = fma(_4507, _4515, _4497);
    float _4527 = fma(_4507, _4519, _4501);
    float _4529 = _4523 * 0.586610972881317138671875;
    out.m_94.x = 0.0;
    float _4531 = fma(_4525, 0.298911988735198974609375, _4529);
    float _4533 = fma(_4527, 0.114477999508380889892578125, _4531);
    float _4535 = -_4533;
    float _4537 = _4525 + _4535;
    float _4539 = -_4533;
    float _4541 = _4523 + _4539;
    float _4543 = -_4533;
    float _4545 = _4527 + _4543;
    float _4547 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4549 = fma(_4537, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4533);
    float _4551 = fma(_4541, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4533);
    float _4553 = fma(_4545, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4533);
    out.m_61.x = _4547;
    out.m_96.x = _4549;
    out.m_96.y = _4551;
    out.m_96.z = _4553;
    if (!_4521)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4555 = -_3318;
    float _4557 = _4555 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4559 = -_3320;
    float _4561 = _4559 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4563 = -_3322;
    float _4565 = _4563 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4567 = _4557 * _4557;
    float _4569 = fma(_4561, _4561, _4567);
    float _4571 = fma(_4565, _4565, _4569);
    float _4573 = sqrt(_4571);
    float _4575 = rsqrt(_4571);
    float _4577 = -_4573;
    float _4579 = _4577 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4581 = _4579 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4583 = precise::clamp(_4581, 0.0, 1.0);
    float _4585 = _4561 * _4575;
    float _4587 = _4557 * _4575;
    float _4589 = abs(_4583);
    float _4591 = log2(_4589);
    float _4593 = _4565 * _4575;
    float _4595 = _4585 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4597 = _2942 * _4587;
    float _4599 = -_4587;
    float _4601 = -_4595;
    float _4603 = fma(_4599, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4601);
    float _4605 = fma(_2962, _4585, _4597);
    float _4607 = -_4593;
    float _4609 = fma(_4607, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4603);
    float _4611 = fma(_2980, _4593, _4605);
    float _4613 = precise::clamp(_4611, 0.0, 1.0);
    float _4615 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4617 = _4609 + _4615;
    float _4619 = _4591 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4621 = _4617 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4623 = precise::clamp(_4621, 0.0, 1.0);
    float _4625 = exp2(_4619);
    float _4627 = _4625 * _4623;
    float _4629 = _4613 * _4627;
    float _4631 = _4629 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4633 = _4629 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4635 = _4629 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _4631;
    out.m_94.y = _4633;
    out.m_94.z = _4635;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4407 = false;
    bool _3028 = false;
    bool _651 = false;
    bool _495 = false;
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
        float _4692 = as_type<float>(_131);
        out.gl_Position.z = _4692;
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
    if (_145)
    {
        float _151 = float(_115);
        _125 = _151;
    }
    float _153 = _125;
    bool _155 = _149 >= _153;
    bool _157 = !_145;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_61.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _133 = as_type<int>(_165);
    }
    int _167 = _133;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4761 = as_type<float>(_167);
        out.gl_Position.z = _4761;
    }
    if (_159)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_68.w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = in.m_63.x;
    float _187 = in.m_63.y;
    float _189 = in.m_63.z;
    float _191 = in.m_58.x;
    float _193 = in.m_58.y;
    float _195 = in.m_58.z;
    float _197 = 0.0;
    float _199 = _171;
    if (!_183)
    {
        float _201 = _171 * _171;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    float _207 = _205;
    if (!_183)
    {
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    int _213 = as_type<int>(_169) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_169) & 2;
    bool _219 = _217 != 0;
    int _221 = int(_215);
    int _223 = _219 ? 2 : 0;
    int _225 = _221 | _223;
    int _227 = _183 ? 4 : 0;
    int _229 = _225 | _227;
    int _231 = false ? 8 : 0;
    int _233 = _229 | _231;
    int _235 = false ? 16 : 0;
    int _237 = _233 | _235;
    int _239 = false ? 32 : 0;
    int _241 = _237 | _239;
    int _243 = false ? 64 : 0;
    int _245 = _241 | _243;
    int _247 = _245 & 4;
    bool _249 = !_215;
    float _251 = _249 ? (-0.5) : 0.5;
    bool _253 = !_219;
    float _255 = _253 ? (-0.5) : 0.5;
    bool _257 = !_183;
    float _259 = _211;
    float _261 = as_type<float>(_247);
    if (!_257)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = _171 * _265;
        float _275 = 1.0 / _269;
        float _277 = _271 * 0.693147182464599609375;
        float _279 = exp2(_273);
        float _281 = 1.0 / _277;
        float _283 = _279 + (-1.0);
        float _285 = -_283;
        float _287 = fma(_285, _281, _171);
        float _289 = _287 * _275;
        float _291 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _259 = _291;
        _261 = _281;
    }
    float _293 = _259;
    float _295 = _261;
    bool _297 = !_183;
    float _299 = _295;
    float _301 = _293;
    if (!_297)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _309 = _307 + 1.0;
        float _311 = 1.0 / _309;
        float _313 = _171 * _305;
        float _315 = exp2(_313);
        float _317 = -_315;
        float _319 = _317 + 1.0;
        float _321 = _319 * _311;
        _199 = _321;
        _299 = _309;
    }
    float _323 = _199;
    float _325 = _299;
    float _327 = 0.0;
    float _329 = _325;
    if (!_183)
    {
        float _331 = _149 * _149;
        float _333 = _331 * 0.5;
        _327 = _333;
    }
    float _335 = _327;
    float _337 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _341 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_183)
    {
        _329 = _149;
    }
    float _343 = _329;
    float _345 = fma(_323, _185, _337);
    float _347 = fma(_323, _187, _339);
    float _349 = _343;
    if (!_183)
    {
        float _351 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _301 = _351;
    }
    float _353 = _301;
    bool _355 = !_183;
    float _357 = _353;
    if (!_355)
    {
        float _359 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _361 = log2(_359);
        float _363 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _365 = _363 + 1.0;
        float _367 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _369 = _149 * _361;
        float _371 = 1.0 / _365;
        float _373 = _367 * 0.693147182464599609375;
        float _375 = exp2(_369);
        float _377 = 1.0 / _373;
        float _379 = _375 + (-1.0);
        float _381 = -_379;
        float _383 = fma(_381, _377, _149);
        float _385 = _383 * _371;
        float _387 = _385 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _357 = _387;
    }
    float _389 = _357;
    bool _391 = !_183;
    if (!_391)
    {
        float _393 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _395 = log2(_393);
        float _397 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _399 = _397 + 1.0;
        float _401 = 1.0 / _399;
        float _403 = _149 * _395;
        float _405 = exp2(_403);
        float _407 = -_405;
        float _409 = _407 + 1.0;
        float _411 = _409 * _401;
        _349 = _411;
    }
    float _413 = _349;
    float _415 = _389 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _417 = _389 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _421 = _389 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _423 = fma(_413, _187, _415);
    float _425 = fma(_347, _173, _193);
    float _427 = fma(_413, _185, _417);
    float _429 = fma(_323, _189, _341);
    float _431 = -_423;
    float _433 = _347 + _431;
    float _435 = fma(_413, _189, _421);
    float _437 = -_427;
    float _439 = _345 + _437;
    float _441 = fma(_345, _173, _191);
    float _443 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _445 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _447 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _449 = -_435;
    float _451 = _429 + _449;
    float _453 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[4].x, _443);
    float _455 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[5].x, _445);
    float _457 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[6].x, _447);
    float _459 = fma(_429, _173, _195);
    float _461 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].z, _453);
    float _463 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].z, _455);
    float _465 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].z, _457);
    bool _467 = !_419;
    float _469 = _463;
    float _471 = _463;
    float _473 = _461;
    float _475 = _465;
    float _493;
    if (!_467)
    {
        float _477 = in.m_70.x;
        float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _481 = _477 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _485 = _483 * _479;
        float _487 = floor(_485);
        float _489 = -_487;
        float _491 = _485 + _489;
        _493 = _491;
        _495 = true;
    }
    else
    {
        float _497 = float(_115);
        float _499 = 1.0 / _497;
        float _501 = _149 * _499;
        _493 = _501;
    }
    _495 = false;
    float _503 = _493;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _507 = _503 + _505;
    bool _509 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _511 = isnan(_503);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _523 = _503 + _521;
    bool _525 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _527 = isnan(_503);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _545 = -_519;
    float _547 = _545 + 1.0;
    float _549 = 1.0 / _543;
    bool _551 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _553 = isnan(_503);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = _535 * _547;
    float _565 = -_535;
    float _567 = _565 + 1.0;
    bool _569 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _571 = 1.0 / _539;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _573;
    float _577 = _523 * _549;
    float _579 = _561 * _567;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _585 = -_561;
    float _587 = _585 + 1.0;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _593 = fma(_583, _577, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _595 = _507 * _571;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _597;
    float _601 = in.m_68.x;
    float _603 = in.m_68.y;
    float _605 = fma(_591, _577, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _607 = fma(_575, _595, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _609 = fma(_599, _595, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _611 = _607 * _579;
    float _613 = _609 * _579;
    float _615 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[143].x, _613);
    float _617 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[143].y, _611);
    float _619 = fma(_593, _563, _615);
    float _621 = fma(_605, _563, _617);
    float _623 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[145].x, _619);
    float _625 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[145].y, _621);
    float _627 = _623 * _601;
    float _629 = _625 * _603;
    bool _631 = !_569;
    float _649;
    if (!_631)
    {
        float _633 = in.m_70.x;
        float _635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _637 = _633 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _639 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _641 = _639 * _635;
        float _643 = floor(_641);
        float _645 = -_643;
        float _647 = _641 + _645;
        _649 = _647;
        _651 = true;
    }
    else
    {
        float _653 = float(_115);
        float _655 = 1.0 / _653;
        float _657 = _149 * _655;
        _649 = _657;
    }
    _651 = false;
    float _659 = _649;
    float _661 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _663 = int(_661);
    float _665 = _629 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _667 = float(_115);
    float _669 = _627 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _673 = _671 != 0;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _677 = _659 + _675;
    float _679 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _681 = int(_679);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _687 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _689 = int(_687);
    float _691 = float(_663);
    float _693 = 0.0;
    if (_673)
    {
        float _695 = in.m_70.x;
        _693 = _695;
    }
    float _697 = _693;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _697;
    if (!_673)
    {
        float _705 = in.m_70.y;
        _703 = _705;
    }
    float _707 = _703;
    float _709 = 1.0 / _691;
    float _711 = float(uint(_681));
    int _713 = ~_681;
    int _715 = _713 + 1;
    bool _717 = _681 == 0;
    int _719 = _681 + (-1);
    float _721 = 1.0 / _711;
    float _723 = float(_689);
    float _725 = _149 * _709;
    float _727 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _729 = int(_727);
    int _731 = ~_681;
    int _733 = _731 + 1;
    int _735 = as_type<int>(_721) + (-2);
    float _737 = trunc(_725);
    int _739 = int(_737);
    float _741 = 1.0 / _723;
    float _743 = float(uint(_729));
    int _745 = ~_729;
    int _747 = _745 + 1;
    float _749 = float(uint(_739));
    float _751 = 1.0 / _743;
    float _753 = float(_739);
    float _755 = as_type<float>(_735) * _749;
    float _757 = _149 * _741;
    float _759 = trunc(_755);
    float _761 = precise::max(_759, 0.0);
    uint _764 = uint(_761);
    float _766 = trunc(_757);
    int _768 = int(_766);
    float _770 = _755;
    float _772 = as_type<float>(_681);
    if (_673)
    {
        _770 = 1.0;
    }
    float _774 = _770;
    float _776 = _774;
    if (!_673)
    {
        _776 = 7.345489978790283203125;
    }
    float _778 = _776;
    int _780 = _733 * int(_764);
    int _782 = _780 + _739;
    float _784 = 1.0 / _667;
    float _786 = float(uint(_782));
    float _788 = in.m_70.x;
    float _790 = in.m_70.y;
    float _792 = in.m_70.z;
    float _794 = in.m_70.w;
    float _796 = float(uint(_768));
    float _798 = 1.0 / _685;
    float _800 = as_type<float>(_735) * _786;
    int _802 = as_type<int>(_751) + (-2);
    float _804 = as_type<float>(_802) * _796;
    float _806 = trunc(_800);
    float _808 = precise::max(_806, 0.0);
    uint _810 = uint(_808);
    float _812 = trunc(_804);
    float _814 = precise::max(_812, 0.0);
    uint _816 = uint(_814);
    float _818 = _790 * 2.0;
    int _820 = int(_764) + int(_810);
    float _822 = _778 * _788;
    float _824 = float(_681);
    float _826 = 1.0 / _701;
    float _828 = _778;
    if (_673)
    {
        _828 = 1.0;
    }
    float _830 = _828;
    int _832 = _715 * _820;
    int _834 = _832 + _739;
    bool _836 = _753 >= _824;
    bool _838 = isnan(_753);
    bool _840 = _836 || _838;
    bool _842 = isnan(_824);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = _830;
    if (!_673)
    {
        _848 = 1.2345600128173828125;
    }
    float _850 = _848;
    int _852 = _747 * int(_816);
    int _854 = _852 + _768;
    bool _856 = uint(_834) >= uint(_681);
    float _858 = floor(_822);
    float _860 = _707 * _850;
    bool _862 = !_856;
    int _864 = _862 ? 0 : (-1);
    float _866 = float(uint(_854));
    int _868 = ~_820;
    int _870 = _868 + _864;
    int _872 = _870 + 1;
    float _874 = trunc(_846);
    int _876 = int(_874);
    float _878 = as_type<float>(_802) * _866;
    int _880 = _681 * _872;
    int _882 = _880 + _739;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _886 = _884 != 0;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _890 = _888 != 0;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _894 = _892 != 0;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _898 = _896 != 0;
    float _900 = floor(_860);
    bool _902 = !_717;
    int _904 = _902 ? _882 : (-1);
    float _906 = -_858;
    float _908 = _822 + _906;
    float _910 = float(_729);
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _914 = _912 != 0;
    float _916 = _908 * _824;
    float _918 = trunc(_878);
    float _920 = precise::max(_918, 0.0);
    uint _922 = uint(_920);
    int _924 = ~_876;
    int _926 = _924 + 1;
    int _928 = _926 + 1;
    int _930 = _904 * _928;
    float _932 = -_900;
    float _934 = _860 + _932;
    float _936 = trunc(_916);
    int _938 = int(_936);
    int _940 = _876 * _719;
    int _942 = _940 + _930;
    float _944 = _149 * _784;
    bool _946 = !_890;
    int _948 = _946 ? 0 : 1;
    float _950 = _944 * _824;
    int _952 = int(_816) + int(_922);
    float _954 = _944 * _910;
    int _956 = ~_729;
    int _958 = _956 + 1;
    float _960 = _934 * _910;
    float _962 = float(_768);
    float _964 = trunc(_950);
    int _966 = int(_964);
    int _968 = abs(_948);
    int _970 = _958 * _952;
    int _972 = _970 + _768;
    bool _974 = _962 >= _910;
    bool _976 = isnan(_962);
    bool _978 = _974 || _976;
    bool _980 = isnan(_910);
    bool _982 = _978 || _980;
    float _984 = float(_982);
    bool _986 = !_914;
    int _988 = _986 ? 0 : 1;
    int _990 = _942 * _968;
    bool _992 = uint(_972) >= uint(_729);
    float _994 = trunc(_954);
    int _996 = int(_994);
    bool _998 = !_886;
    int _1000 = _998 ? 0 : 1;
    int _1002 = abs(_988);
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1006 = _1004 != 0;
    int _1008 = abs(_1000);
    float _1010 = trunc(_984);
    int _1012 = int(_1010);
    bool _1014 = !_992;
    int _1016 = _1014 ? 0 : (-1);
    int _1018 = _966 * _1008;
    int _1020 = _1018 + _990;
    bool _1022 = !_894;
    int _1024 = _1022 ? 0 : 1;
    bool _1026 = !_1006;
    int _1028 = _1026 ? 0 : 1;
    int _1030 = _938 * _1002;
    int _1032 = _1030 + _739;
    int _1034 = ~_952;
    int _1036 = _1034 + _1016;
    int _1038 = _1036 + 1;
    float _1040 = floor(_818);
    int _1042 = abs(_1024);
    int _1044 = abs(_1028);
    int _1046 = _729 * _1038;
    int _1048 = _1046 + _768;
    bool _1050 = !_898;
    int _1052 = _1050 ? 0 : 1;
    int _1054 = _1032 * _1042;
    int _1056 = _1054 + _1020;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1060 = _1058 != 0;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1064 = _1062 != 0;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1068 = _1066 != 0;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1072 = _1070 != 0;
    float _1074 = trunc(_960);
    int _1076 = int(_1074);
    bool _1078 = _729 == 0;
    int _1080 = abs(_1052);
    int _1082 = ~_1012;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    bool _1088 = !_1078;
    int _1090 = _1088 ? _1048 : (-1);
    int _1092 = _729 + (-1);
    int _1094 = _1090 * _1086;
    bool _1096 = !_1064;
    int _1098 = _1096 ? 0 : 1;
    int _1100 = _938 * _1044;
    int _1102 = _1100 + _1056;
    bool _1104 = !_1060;
    int _1106 = _1104 ? 0 : 1;
    int _1108 = _1012 * _1092;
    int _1110 = _1108 + _1094;
    bool _1112 = !_1068;
    int _1114 = _1112 ? 0 : 1;
    int _1116 = _1076 * _1080;
    int _1118 = _1116 + _768;
    float _1120 = float(uint(_1102));
    int _1122 = abs(_1098);
    int _1124 = abs(_1106);
    float _1126 = as_type<float>(_735) * _1120;
    bool _1128 = !_1072;
    int _1130 = _1128 ? 0 : 1;
    int _1132 = _1110 * _1122;
    int _1134 = abs(_1114);
    float _1136 = trunc(_1126);
    float _1138 = precise::max(_1136, 0.0);
    uint _1140 = uint(_1138);
    int _1142 = abs(_1130);
    int _1144 = _996 * _1124;
    int _1146 = _1144 + _1132;
    float _1148 = float(uint(_1032));
    int _1150 = _1118 * _1134;
    int _1152 = _1150 + _1146;
    int _1154 = ~_681;
    int _1156 = _1154 + 1;
    int _1158 = ~_729;
    int _1160 = _1158 + 1;
    int _1162 = _1076 * _1142;
    int _1164 = _1162 + _1152;
    float _1166 = as_type<float>(_735) * _1148;
    float _1168 = float(uint(_1118));
    int _1170 = _1156 * int(_1140);
    int _1172 = _1170 + _1102;
    float _1174 = float(uint(_1164));
    float _1176 = trunc(_1166);
    float _1178 = precise::max(_1176, 0.0);
    uint _1180 = uint(_1178);
    int _1182 = ~_681;
    int _1184 = _1182 + 1;
    float _1186 = as_type<float>(_802) * _1174;
    float _1188 = float(uint(_1172));
    bool _1190 = _681 == 0;
    float _1192 = trunc(_1186);
    float _1194 = precise::max(_1192, 0.0);
    uint _1196 = uint(_1194);
    float _1198 = as_type<float>(_735) * _1188;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1202 = _1200 != 0;
    float _1204 = trunc(_1198);
    float _1206 = precise::max(_1204, 0.0);
    uint _1208 = uint(_1206);
    int _1210 = _1160 * int(_1196);
    int _1212 = _1210 + _1164;
    int _1214 = ~_681;
    int _1216 = _1214 + 1;
    float _1218 = as_type<float>(_802) * _1168;
    int _1220 = _1184 * int(_1180);
    int _1222 = _1220 + _1032;
    float _1224 = float(uint(_1212));
    int _1226 = int(_1140) + int(_1208);
    float _1228 = as_type<float>(_802) * _1224;
    float _1230 = trunc(_1218);
    float _1232 = precise::max(_1230, 0.0);
    uint _1234 = uint(_1232);
    int _1236 = _1216 * _1226;
    int _1238 = _1236 + _1102;
    float _1240 = float(uint(_1222));
    int _1242 = ~_729;
    int _1244 = _1242 + 1;
    bool _1246 = uint(_1238) >= uint(_681);
    float _1248 = trunc(_1228);
    float _1250 = precise::max(_1248, 0.0);
    uint _1252 = uint(_1250);
    float _1254 = as_type<float>(_735) * _1240;
    bool _1256 = !_1246;
    int _1258 = _1256 ? 0 : (-1);
    bool _1260 = _794 > 0.5;
    int _1262 = ~_1226;
    int _1264 = _1262 + _1258;
    int _1266 = _1264 + 1;
    int _1268 = _1244 * int(_1234);
    int _1270 = _1268 + _1118;
    float _1272 = trunc(_1254);
    float _1274 = precise::max(_1272, 0.0);
    uint _1276 = uint(_1274);
    int _1278 = _681 * _1266;
    int _1280 = _1278 + _1102;
    int _1282 = ~_729;
    int _1284 = _1282 + 1;
    float _1286 = float(uint(_1270));
    int _1288 = int(_1196) + int(_1252);
    float _1290 = as_type<float>(_802) * _1286;
    bool _1292 = !_1190;
    int _1294 = _1292 ? _1280 : (-1);
    float _1296 = -_255;
    int _1298 = _1260 ? as_type<int>(_1296) : as_type<int>(_255);
    int _1300 = _1284 * _1288;
    int _1302 = _1300 + _1164;
    int _1304 = _1294 & 3;
    bool _1306 = _1304 != 0;
    float _1308 = trunc(_1290);
    float _1310 = precise::max(_1308, 0.0);
    uint _1312 = uint(_1310);
    int _1314 = _1294 & 3;
    bool _1316 = _1314 != 0;
    bool _1318 = uint(_1304) >= 2u;
    int _1320 = _1316 ? 0 : 1;
    bool _1322 = uint(_1302) >= uint(_729);
    int _1324 = _1318 ? 0 : 1;
    bool _1326 = uint(_1304) > 1u;
    bool _1328 = !_1322;
    int _1330 = _1328 ? 0 : (-1);
    bool _1332 = _1304 != 3;
    int _1334 = int(_1180) + int(_1276);
    int _1336 = ~_681;
    int _1338 = _1336 + 1;
    int _1340 = ~_1288;
    int _1342 = _1340 + _1330;
    int _1344 = _1342 + 1;
    int _1346 = ~_1320;
    int _1348 = _1346 + 1;
    int _1350 = _1348 + 1;
    int _1352 = _1338 * _1334;
    int _1354 = _1352 + _1032;
    int _1356 = ~_1324;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    int _1362 = _729 * _1344;
    int _1364 = _1362 + _1164;
    int _1366 = _1350;
    int _1368 = _1360;
    int _1370 = _1354;
    float _1372 = as_type<float>(_1032);
    if (!_1326)
    {
        int _1374 = ~_1320;
        int _1376 = _1374 + 1;
        _1366 = _1376;
    }
    int _1378 = _1366;
    float _1380 = _788 * 2.0;
    bool _1382 = uint(_1354) >= uint(_681);
    if (_1332)
    {
        int _1384 = ~_1324;
        int _1386 = _1384 + 1;
        _1368 = _1386;
    }
    int _1388 = _1368;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1392 = _1390 != 0;
    float _1394 = floor(_1380);
    bool _1396 = !_1078;
    int _1398 = _1396 ? _1364 : (-1);
    bool _1400 = !_1382;
    int _1402 = _1400 ? 0 : (-1);
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1406 = _1404 != 0;
    bool _1408 = !_1392;
    int _1410 = _1408 ? 0 : 1;
    int _1412 = _1398 & 3;
    bool _1414 = _1412 != 0;
    int _1416 = _1398 & 3;
    bool _1418 = _1416 != 0;
    bool _1420 = !_1406;
    int _1422 = _1420 ? 0 : 1;
    bool _1424 = uint(_1412) >= 2u;
    int _1426 = int(_1234) + int(_1312);
    float _1428 = _1418 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1430 = uint(_1412) > 1u;
    int _1432 = _1424 ? 0 : 1;
    bool _1434 = _1412 != 3;
    int _1436 = ~_729;
    int _1438 = _1436 + 1;
    int _1440 = ~as_type<int>(_1428);
    int _1442 = _1440 + 1;
    int _1444 = _1442 + 1;
    int _1446 = _1444;
    float _1448 = _1428;
    float _1450 = as_type<float>(_1426);
    if (_1202)
    {
        _1370 = 0;
    }
    int _1452 = _1370;
    int _1454 = _1438 * _1426;
    int _1456 = _1454 + _1118;
    int _1458 = ~_1432;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    int _1464 = _1452;
    int _1466 = _1462;
    if (!_1430)
    {
        int _1468 = ~as_type<int>(_1428);
        int _1470 = _1468 + 1;
        _1446 = _1470;
    }
    int _1472 = _1446;
    if (!_1202)
    {
        _1464 = 1;
    }
    int _1474 = _1464;
    bool _1476 = uint(_1456) >= uint(_729);
    if (_1434)
    {
        int _1478 = ~_1432;
        int _1480 = _1478 + 1;
        _1466 = _1480;
    }
    int _1482 = _1466;
    bool _1484 = _1394 >= 0.0;
    bool _1486 = isnan(_1394);
    bool _1488 = _1484 || _1486;
    bool _1490 = isnan(0.0);
    bool _1492 = _1488 || _1490;
    bool _1494 = _1474 != 1;
    bool _1496 = !_1476;
    int _1498 = _1496 ? 0 : (-1);
    int _1500 = _1492 ? 0 : 1;
    bool _1502 = _1394 > 0.0;
    int _1504 = ~_1334;
    int _1506 = _1504 + _1402;
    int _1508 = _1506 + 1;
    float _1510 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _251);
    int _1512 = ~_1426;
    int _1514 = _1512 + _1498;
    int _1516 = _1514 + 1;
    int _1518 = ~_1500;
    int _1520 = _1518 + 1;
    int _1522 = _1520 + 1;
    int _1524 = _681 * _1508;
    int _1526 = _1524 + _1032;
    int _1528 = _1522;
    if (!_1494)
    {
        _1372 = _790;
    }
    float _1530 = _1372;
    int _1532 = _729 * _1516;
    int _1534 = _1532 + _1118;
    float _1536 = _1530;
    if (!_1494)
    {
        _1448 = _790;
    }
    float _1538 = _1448;
    float _1540 = _669 * _1510;
    float _1542 = _1538;
    if (!_1494)
    {
        _772 = _792;
    }
    float _1544 = _772;
    float _1546 = _1544;
    if (!_1494)
    {
        _1450 = _792;
    }
    float _1548 = _1450;
    float _1550 = _1548;
    if (_1494)
    {
        _1536 = _788;
    }
    float _1552 = _1536;
    if (_1494)
    {
        _1542 = _788;
    }
    float _1554 = _1542;
    if (_1494)
    {
        _1546 = _790;
    }
    float _1556 = _1546;
    if (_1494)
    {
        _1550 = _790;
    }
    float _1558 = _1550;
    bool _1560 = !_1190;
    int _1562 = _1560 ? _1526 : (-1);
    float _1564 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1566 = !_1078;
    int _1568 = _1566 ? _1534 : (-1);
    int _1570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1572 = _1570 != 0;
    int _1574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1576 = _1574 != 0;
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1580 = _1578 != 0;
    float _1582 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _255);
    if (!_1502)
    {
        int _1584 = ~_1500;
        int _1586 = _1584 + 1;
        _1528 = _1586;
    }
    int _1588 = _1528;
    bool _1590 = !_1414;
    int _1592 = _1590 ? 0 : 1;
    float _1594 = _788 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1596 = _1412 != 3;
    float _1598 = _425 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1600 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1602 = _1600 != 0;
    float _1604 = _425 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1606 = _425 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1608 = !_1306;
    int _1610 = _1608 ? 0 : 1;
    float _1612 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1604);
    bool _1614 = _1304 != 3;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1618 = _665 * _1582;
    float _1620 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1598);
    float _1622 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1606);
    float _1624 = _792 * 2.0;
    float _1626 = -_1616;
    float _1628 = fma(_1594, 2.0, _1626);
    float _1630 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1612);
    float _1632 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1620);
    float _1634 = floor(_1624);
    float _1636 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1622);
    float _1638 = _790 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1640 = _1630 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1644 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1646 = log2(_1644);
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1652 = fma(_1638, -2.0, _1642);
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1656 = _1650 * _798;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1660 = _1634 >= 0.0;
    bool _1662 = isnan(_1634);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan(0.0);
    bool _1668 = _1664 || _1666;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1672;
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1678 = _1668 ? 0 : 1;
    float _1680 = _1654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1682 = _1634 > 0.0;
    float _1684 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1686 = _149 * _1646;
    float _1688 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1690 = _1674 * _826;
    float _1692 = _788 + _790;
    float _1694 = _792 + _790;
    int _1696 = ~_1678;
    int _1698 = _1696 + 1;
    int _1700 = _1698 + 1;
    float _1702 = exp2(_1686);
    out.m_72.x = _1680;
    out.m_72.y = _1684;
    out.m_72.z = _1688;
    out.m_72.w = _1676;
    float _1704 = _1692 + (-1.0);
    float _1706 = _1694 + (-1.0);
    bool _1708 = !_1572;
    int _1710 = _1708 ? 0 : 1;
    float _1712 = fma(_1690, _677, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1714 = _1700;
    if (!_1682)
    {
        int _1716 = ~_1678;
        int _1718 = _1716 + 1;
        _1714 = _1718;
    }
    int _1720 = _1714;
    float _1722 = _1636 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1724 = abs(_1710);
    float _1726 = _1632 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1728 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1730 = isnan(0.0);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1736 = _1732 || _1734;
    bool _1738 = !_1614;
    int _1740 = _1738 ? 0 : (-1);
    bool _1742 = _1040 >= 0.0;
    bool _1744 = isnan(_1040);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan(0.0);
    bool _1750 = _1746 || _1748;
    float _1752 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1754 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1756 = isnan(_659);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1762 = _1758 || _1760;
    float _1764 = float(_1762);
    float _1766 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1768 = -_1702;
    float _1770 = _1768 + 1.0;
    bool _1772 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1774 = isnan(_659);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1780 = _1776 || _1778;
    float _1782 = float(_1780);
    float _1784 = -_1764;
    float _1786 = _1784 + 1.0;
    bool _1788 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1790 = isnan(_659);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1796 = _1792 || _1794;
    float _1798 = float(_1796);
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1802 = 1.0 + _1800;
    float _1804 = _1736 ? _1770 : 0.0;
    float _1806 = _1782 * _1786;
    float _1808 = -_1782;
    float _1810 = _1808 + 1.0;
    bool _1812 = _1040 > 0.0;
    float _1814 = in.m_74.x;
    float _1816 = in.m_74.y;
    float _1818 = in.m_74.z;
    float _1820 = 1.0 / _1802;
    float _1822 = _1798 * _1810;
    float _1824 = -_1798;
    float _1826 = _1824 + 1.0;
    float _1828 = float(_1720);
    float _1830 = _1712 * _1822;
    float _1832 = float(_1724);
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1836 = _659 + _1834;
    bool _1838 = !_1576;
    int _1840 = _1838 ? 0 : 1;
    float _1842 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1830);
    int _1844 = _1750 ? 0 : 1;
    float _1846 = _1832 * _1828;
    float _1848 = fma(_1656, _1836, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1850 = abs(_1840);
    float _1852 = _1846 * (-2.0);
    float _1854 = _1804 * _1820;
    float _1856 = float(_1588);
    float _1858 = _788 + (-0.5);
    float _1860 = float(_1850);
    int _1862 = ~_1844;
    int _1864 = _1862 + 1;
    int _1866 = _1864 + 1;
    float _1868 = fma(_1852, _1814, _1814);
    float _1870 = _1860 * _1856;
    int _1872 = _1866;
    if (!_1812)
    {
        int _1874 = ~_1844;
        int _1876 = _1874 + 1;
        _1872 = _1876;
    }
    int _1878 = _1872;
    float _1880 = fma(_1752, _1852, _1752);
    bool _1882 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1884 = isnan(1.0);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1890 = _1886 || _1888;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1894 = _1870 * (-2.0);
    float _1896 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1868);
    bool _1898 = !_1890;
    float _1900 = _1898 ? _149 : _1854;
    float _1902 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1892);
    bool _1904 = !_1580;
    int _1906 = _1904 ? 0 : 1;
    float _1908 = fma(_1894, _1816, _1816);
    bool _1910 = _790 > 0.5;
    float _1912 = _790 + (-0.5);
    float _1914 = fma(_1900, _1880, _1896);
    int _1916 = abs(_1906);
    float _1918 = fma(_1912, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1908);
    float _1920 = float(_1878);
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1924 = float(_1916);
    float _1926 = fma(_1766, _1894, _1766);
    bool _1928 = _788 > 0.5;
    float _1930 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1922);
    float _1932 = _792 + _788;
    float _1934 = _1924 * _1920;
    float _1936 = fma(_1900, _1926, _1918);
    float _1938 = _1932 + (-1.0);
    float _1940 = _1934 * (-2.0);
    float _1942 = _1936 * 0.15915493667125701904296875;
    float _1944 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1946 = fma(_1848, _1806, _1842);
    float _1948 = fma(_1940, _1818, _1818);
    float _1950 = _792 + (-0.5);
    float _1952 = fma(_1944, _1940, _1944);
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1956 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1948);
    int _1958 = _1294 >> 31;
    float _1960 = _1914 * 0.15915493667125701904296875;
    float _1962 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1954);
    float _1964 = fma(_1900, _1952, _1956);
    int _1966 = _1958 & 3;
    float _1968 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1970 = _1398 >> 31;
    float _1972 = _1942 * 6.283185482025146484375;
    float _1974 = sin(_1972);
    int _1976 = _1294 + _1966;
    float _1978 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1968);
    int _1980 = _1970 & 3;
    float _1982 = _1964 * 0.15915493667125701904296875;
    float _1984 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1986 = _1398 + _1980;
    float _1988 = _1942 * 6.283185482025146484375;
    float _1990 = cos(_1988);
    float _1992 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1946);
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1996 = abs(_1472);
    float _1998 = -_1994;
    float _2000 = fma(_1984, 2.0, _1998);
    int _2002 = abs(_1388);
    float _2004 = _1960 * 6.283185482025146484375;
    float _2006 = sin(_2004);
    int _2008 = _1976 >> 2;
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2012 = !_1596;
    int _2014 = _2012 ? 0 : (-1);
    int _2016 = _2008 << 4;
    int _2018 = _2016 + 368;
    float _2020 = fma(_1564, -2.0, _2010);
    int _2022 = abs(_2014);
    float _2024 = _1960 * 6.283185482025146484375;
    float _2026 = cos(_2024);
    int _2028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2030 = _2028 != 0;
    int _2032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2034 = _2032 != 0;
    float _2036 = _1982 * 6.283185482025146484375;
    float _2038 = cos(_2036);
    int _2040 = _1986 >> 2;
    float _2042 = _2006 * _1974;
    uint _2044 = uint(int(uint(_2018) >> uint(2)));
    uint _2046 = uint(int(uint(int(_2044)) >> uint(2)));
    int _2048 = int(_2044) & 3;
    float _2050 = (*spvDescriptorSet0.vp_c9)._m0[int(_2046)][_2048];
    int _2052 = int(_2044) + 1;
    uint _2054 = uint(int(uint(_2052) >> uint(2)));
    int _2056 = _2052 & 3;
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[int(_2054)][_2056];
    float _2060 = _2006 * _1990;
    int _2062 = _2040 << 4;
    int _2064 = _2062 + 512;
    float _2066 = _1982 * 6.283185482025146484375;
    float _2068 = sin(_2066);
    float _2070 = _2026 * _1990;
    uint _2072 = uint(int(uint(_2064) >> uint(2)));
    uint _2074 = uint(int(uint(int(_2072)) >> uint(2)));
    int _2076 = int(_2072) & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    int _2080 = int(_2072) + 1;
    uint _2082 = uint(int(uint(_2080) >> uint(2)));
    int _2084 = _2080 & 3;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[int(_2082)][_2084];
    float _2088 = _2006 * _2038;
    float _2090 = _2026 * _1974;
    float _2092 = _1990 * _2038;
    float _2094 = _2026 * _2038;
    float _2096 = _1974 * _2038;
    float _2098 = _2088 * _1618;
    int _2100 = _2064 + 8;
    uint _2102 = uint(int(uint(_2100) >> uint(2)));
    uint _2104 = uint(int(uint(int(_2102)) >> uint(2)));
    int _2106 = int(_2102) & 3;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[int(_2104)][_2106];
    int _2110 = int(_2102) + 1;
    uint _2112 = uint(int(uint(_2110) >> uint(2)));
    int _2114 = _2110 & 3;
    float _2116 = (*spvDescriptorSet0.vp_c9)._m0[int(_2112)][_2114];
    float _2118 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2120 = -_2090;
    float _2122 = fma(_2068, _2060, _2120);
    float _2124 = fma(_2068, _2070, _2042);
    float _2126 = -_2060;
    float _2128 = fma(_2068, _2090, _2126);
    float _2130 = fma(_2068, _2042, _2070);
    float _2132 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2134 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2136 = _2018 + 8;
    uint _2138 = uint(int(uint(_2136) >> uint(2)));
    uint _2140 = uint(int(uint(int(_2138)) >> uint(2)));
    int _2142 = int(_2138) & 3;
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[int(_2140)][_2142];
    int _2146 = int(_2138) + 1;
    uint _2148 = uint(int(uint(_2146) >> uint(2)));
    int _2150 = _2146 & 3;
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[int(_2148)][_2150];
    float _2154 = -_1618;
    float _2156 = _2068 * _2154;
    float _2158 = _2094 * _1618;
    float _2160 = -_2068;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2118);
    float _2164 = -_2068;
    float _2166 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2132);
    float _2168 = -_2068;
    float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2134);
    float _2172 = fma(_2092, _1540, _2156);
    float _2174 = fma(_2124, _1540, _2158);
    float _2176 = fma(_2122, _1540, _2098);
    float _2178 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2162);
    float _2180 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2166);
    int _2182 = abs(_1378);
    float _2184 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2186 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2188 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2190 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2184);
    float _2192 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2186);
    int _2194 = abs(_1610);
    float _2196 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2188);
    int _2198 = ~_2182;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    float _2204 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2170);
    int _2206 = ~_1996;
    int _2208 = _2206 + 1;
    int _2210 = _2208 + 1;
    float _2212 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2214 = abs(_1592);
    int _2216 = _2202 * as_type<int>(_2058);
    int _2218 = ~_2194;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    int _2224 = _2210 * as_type<int>(_2086);
    int _2226 = abs(_1482);
    int _2228 = _2222 * as_type<int>(_2050);
    int _2230 = _2228 + _2216;
    int _2232 = ~_2214;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    float _2238 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2240 = int(_2238);
    int _2242 = abs(_1740);
    int _2244 = _2236 * as_type<int>(_2078);
    int _2246 = _2244 + _2224;
    int _2248 = ~_2002;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = ~_2226;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    int _2260 = _2252 * as_type<int>(_2144);
    int _2262 = _2260 + _2230;
    int _2264 = _2258 * as_type<int>(_2108);
    int _2266 = _2264 + _2246;
    float _2268 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2270 = int(_2268);
    int _2272 = ~_2242;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    int _2278 = ~_2022;
    int _2280 = _2278 + 1;
    int _2282 = _2280 + 1;
    int _2284 = abs(_1410);
    int _2286 = _2276 * as_type<int>(_2152);
    int _2288 = _2286 + _2262;
    float _2290 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _2292 = _2282 * as_type<int>(_2116);
    int _2294 = _2292 + _2266;
    int _2296 = ~_2284;
    int _2298 = _2296 + 1;
    int _2300 = _2298 + 1;
    float _2302 = fma(_2128, _2290, _2174);
    float _2304 = float(uint(_2240));
    float _2306 = fma(_2096, _2290, _2172);
    int _2308 = _2288 * _2300;
    float _2310 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2312 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2314 = abs(_1422);
    float _2316 = fma(_2130, _2290, _2176);
    float _2318 = 1.0 / _2304;
    float _2320 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2310);
    float _2322 = float(uint(_2270));
    float _2324 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2312);
    int _2326 = ~_2314;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    float _2332 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2320);
    int _2334 = abs(_2270);
    float _2336 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2324);
    float _2338 = 1.0 / _2322;
    float _2340 = _2332 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2342 = _2294 * _2330;
    float _2344 = _2336 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _2346 = _1562 * _2284;
    int _2348 = _2346 + _2308;
    int _2350 = abs(_2240);
    float _2352 = _1640 + _2340;
    float _2354 = _1722 + _2344;
    float _2356 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2358 = float(uint(_2350));
    float _2360 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2362 = as_type<int>(_2318) + (-2);
    float _2364 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2356);
    float _2366 = float(uint(_2348));
    int _2368 = _1568 * _2314;
    int _2370 = _2368 + _2342;
    float _2372 = float(uint(_2334));
    float _2374 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2360);
    float _2376 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2212);
    float _2378 = as_type<float>(_2362) * _2366;
    float _2380 = 1.0 / _2358;
    float _2382 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2364);
    int _2384 = as_type<int>(_2338) + (-2);
    float _2386 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2374);
    float _2388 = float(uint(_2370));
    float _2390 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2376);
    float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2394 = _2352 + _2392;
    float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2398 = _2354 + _2396;
    float _2400 = 1.0 / _2372;
    float _2402 = as_type<float>(_2384) * _2388;
    int _2404 = abs(_2348);
    float _2406 = _2394 * _2394;
    float _2408 = _2398 * _2398;
    int _2410 = ~_2240;
    int _2412 = _2410 + 1;
    float _2414 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2416 = trunc(_2378);
    float _2418 = precise::max(_2416, 0.0);
    uint _2420 = uint(_2418);
    int _2422 = abs(_2370);
    float _2424 = _2406 + _2408;
    int _2426 = as_type<int>(_2380) + (-2);
    float _2428 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2414);
    float _2430 = float(uint(_2404));
    float _2432 = float(uint(_2422));
    float _2434 = trunc(_2402);
    float _2436 = precise::max(_2434, 0.0);
    uint _2438 = uint(_2436);
    int _2440 = as_type<int>(_2400) + (-2);
    float _2442 = as_type<float>(_2426) * _2430;
    int _2444 = ~_2270;
    int _2446 = _2444 + 1;
    float _2448 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2428);
    int _2450 = ~_2350;
    int _2452 = _2450 + 1;
    float _2454 = as_type<float>(_2440) * _2432;
    float _2456 = -_251;
    int _2458 = _1928 ? as_type<int>(_2456) : as_type<int>(_251);
    float _2460 = sqrt(_2424);
    int _2462 = _2412 * int(_2420);
    int _2464 = _2462 + _2348;
    float _2466 = _2448 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _2468 = _792 > 0.5;
    float _2470 = float(uint(_2464));
    float _2472 = _1726 + _2466;
    float _2474 = trunc(_2442);
    float _2476 = precise::max(_2474, 0.0);
    uint _2478 = uint(_2476);
    int _2480 = _2446 * int(_2438);
    int _2482 = _2480 + _2370;
    float _2484 = as_type<float>(_2362) * _2470;
    int _2486 = ~_2334;
    int _2488 = _2486 + 1;
    float _2490 = float(uint(_2482));
    float _2492 = trunc(_2454);
    float _2494 = precise::max(_2492, 0.0);
    uint _2496 = uint(_2494);
    bool _2498 = _2460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2500 = as_type<float>(_2384) * _2490;
    float _2502 = trunc(_2484);
    float _2504 = precise::max(_2502, 0.0);
    uint _2506 = uint(_2504);
    int _2508 = _2452 * int(_2478);
    int _2510 = _2508 + _2404;
    float _2512 = float(uint(_2510));
    int _2514 = _2488 * int(_2496);
    int _2516 = _2514 + _2422;
    float _2518 = float(uint(_2516));
    bool _2520 = !_2498;
    float _2522 = _2472;
    float _2524 = _2406;
    float _2526 = _2408;
    float _2528 = _2352;
    float _2530 = _2354;
    if (!_2520)
    {
        float _2532 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2536 = _2460 + _2534;
        float _2538 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2540 = rsqrt(_2424);
        float _2542 = _2536 * _2532;
        float _2544 = _2542 * 0.15915493667125701904296875;
        float _2546 = _2544 * 6.283185482025146484375;
        float _2548 = sin(_2546);
        float _2550 = _2544 * 6.283185482025146484375;
        float _2552 = cos(_2550);
        float _2554 = fma(_2548, _2538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2556 = _2540 * _2554;
        float _2558 = _2552 + (-1.0);
        float _2560 = fma(_2394, _2556, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2562 = fma(_2398, _2556, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2564 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2568 = _2560 + _2566;
        float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2572 = _2562 + _2570;
        float _2574 = fma(_2472, _2552, _2564);
        float _2576 = _2568 * _2568;
        float _2578 = _2572 * _2572;
        _2522 = _2574;
        _2524 = _2576;
        _2526 = _2578;
        _2528 = _2560;
        _2530 = _2562;
    }
    float _2580 = _2522;
    float _2582 = _2524;
    float _2584 = _2526;
    float _2586 = _2528;
    float _2588 = _2530;
    float _2590 = trunc(_2500);
    float _2592 = precise::max(_2590, 0.0);
    uint _2594 = uint(_2592);
    float _2596 = as_type<float>(_2440) * _2518;
    float _2598 = as_type<float>(_2426) * _2512;
    float _2600 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2196);
    bool _2602 = !_2030;
    float _2604 = _2602 ? _255 : as_type<float>(_1298);
    float _2606 = _255 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2608 = -_255;
    int _2610 = _1910 ? as_type<int>(_2608) : as_type<int>(_255);
    float _2612 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2190);
    int _2614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2616 = _2614 != 0;
    float _2618 = trunc(_2596);
    float _2620 = precise::max(_2618, 0.0);
    uint _2622 = uint(_2620);
    float _2624 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2192);
    float _2626 = -_251;
    int _2628 = _2468 ? as_type<int>(_2626) : as_type<int>(_251);
    float _2630 = _251 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2632 = !_2616;
    float _2634 = _2632 ? _255 : as_type<float>(_2610);
    float _2636 = _2606 * _2180;
    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2640 = _2580 + _2638;
    bool _2642 = !_2034;
    float _2644 = _2642 ? _251 : as_type<float>(_2628);
    float _2646 = trunc(_2598);
    float _2648 = precise::max(_2646, 0.0);
    uint _2650 = uint(_2648);
    float _2652 = _2606 * _2178;
    float _2654 = fma(_2630, _2624, _2636);
    float _2656 = _2606 * _2204;
    float _2658 = fma(_2640, _2640, _2582);
    int _2660 = int(_2420) + int(_2506);
    float _2662 = -_149;
    float _2664 = fma(_2662, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1628);
    int _2666 = int(_2438) + int(_2594);
    float _2668 = _2658 + _2584;
    int _2670 = ~_2240;
    int _2672 = _2670 + 1;
    float _2674 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1930);
    int _2676 = ~_2270;
    int _2678 = _2676 + 1;
    float _2680 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1962);
    bool _2682 = !_1602;
    float _2684 = _2682 ? _251 : as_type<float>(_2458);
    float _2686 = fma(_2630, _2612, _2652);
    float _2688 = fma(_2630, _2600, _2656);
    int _2690 = ~_2334;
    int _2692 = _2690 + 1;
    int _2694 = _2672 * _2660;
    int _2696 = _2694 + _2348;
    int _2698 = int(_2496) + int(_2622);
    int _2700 = _2678 * _2666;
    int _2702 = _2700 + _2370;
    int _2704 = int(_2478) + int(_2650);
    float _2706 = -_2674;
    float _2708 = _2706 + 1.0;
    int _2710 = ~_2350;
    int _2712 = _2710 + 1;
    float _2714 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1902);
    float _2716 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1978);
    bool _2718 = uint(_2696) >= uint(_2240);
    int _2720 = _2712 * _2704;
    int _2722 = _2720 + _2404;
    bool _2724 = uint(_2702) >= uint(_2270);
    int _2726 = _2692 * _2698;
    int _2728 = _2726 + _2422;
    bool _2730 = !_2718;
    int _2732 = _2730 ? 0 : (-1);
    float _2734 = sqrt(_2668);
    bool _2736 = !_2724;
    int _2738 = _2736 ? 0 : (-1);
    float _2740 = -_2680;
    float _2742 = _2740 + 1.0;
    bool _2744 = uint(_2722) >= uint(_2350);
    out.m_76.x = _2612;
    out.m_76.y = _2624;
    out.m_76.z = _2600;
    int _2746 = ~_2660;
    int _2748 = _2746 + _2732;
    int _2750 = _2748 + 1;
    int _2752 = ~_2666;
    int _2754 = _2752 + _2738;
    int _2756 = _2754 + 1;
    float _2758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2760 = uint(_2728) >= uint(_2334);
    int _2762 = _2240 * _2750;
    int _2764 = _2762 + _2348;
    int _2766 = _2370 ^ _2270;
    int _2768 = _2270 * _2756;
    int _2770 = _2768 + _2370;
    bool _2772 = _2240 == 0;
    bool _2774 = _2240 == 0;
    int _2776 = _2348 ^ _2240;
    float _2778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2780 = !_2760;
    int _2782 = _2780 ? 0 : (-1);
    uint _2784 = uint(int(uint(_2766) >> uint(31)));
    bool _2786 = !_2744;
    int _2788 = _2786 ? 0 : (-1);
    int _2790 = ~_2782;
    int _2792 = _2698 + _2790;
    int _2794 = _2792 + 1;
    int _2796 = ~int(_2784);
    int _2798 = _2796 + 1;
    bool _2800 = _2270 == 0;
    bool _2802 = _2270 == 0;
    uint _2804 = uint(int(uint(_2776) >> uint(31)));
    bool _2806 = !_2772;
    int _2808 = _2806 ? _2764 : (-1);
    int _2810 = ~_2788;
    int _2812 = _2704 + _2810;
    int _2814 = _2812 + 1;
    float _2816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2818 = _2794 ^ _2798;
    int _2820 = ~int(_2804);
    int _2822 = _2820 + 1;
    float _2824 = _2758 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2826 = float(_2808);
    int _2828 = ~_2798;
    int _2830 = _2828 + _2818;
    int _2832 = _2830 + 1;
    float _2834 = fma(_2606, _2606, 1.0);
    int _2836 = _2814 ^ _2822;
    float _2838 = fma(_2824, _2826, _2664);
    float _2840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2842 = _2778 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2844 = ~_2822;
    int _2846 = _2844 + _2836;
    int _2848 = _2846 + 1;
    float _2850 = -_149;
    float _2852 = fma(_2850, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2000);
    bool _2854 = !_2800;
    int _2856 = _2854 ? _2770 : (-1);
    float _2858 = _2684 + 0.5;
    bool _2860 = !_2774;
    int _2862 = _2860 ? _2848 : (-1);
    float _2864 = _2816 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2866 = rsqrt(_2834);
    float _2868 = float(_2856);
    float _2870 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1652);
    float _2872 = float(_2862);
    float _2874 = fma(_2824, _2858, _2838);
    bool _2876 = !_2802;
    int _2878 = _2876 ? _2832 : (-1);
    float _2880 = fma(_2864, _2868, _2852);
    float _2882 = _2644 + 0.5;
    float _2884 = -_2870;
    float _2886 = fma(_2842, _2872, _2884);
    float _2888 = float(_2878);
    float _2890 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2020);
    float _2892 = _2840 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2894 = fma(_2864, _2882, _2880);
    float _2896 = _2634 + (-0.5);
    bool _2898 = _2734 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2900 = isnan(_2734);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2906 = _2902 || _2904;
    float _2908 = -_2890;
    float _2910 = fma(_2892, _2888, _2908);
    float _2912 = _2606 * _2866;
    float _2914 = -_2842;
    float _2916 = fma(_2914, _2896, _2886);
    float _2918 = _2604 + (-0.5);
    float _2920 = -_2390;
    float _2922 = _2912 * _2920;
    float _2924 = -_2386;
    float _2926 = _2912 * _2924;
    float _2928 = -_2382;
    float _2930 = _2912 * _2928;
    float _2932 = -_2892;
    float _2934 = fma(_2932, _2918, _2910);
    float _2936 = fma(_2866, _2204, _2922);
    float _2938 = fma(_2866, _2178, _2926);
    float _2940 = fma(_2866, _2180, _2930);
    float _2942 = _2382 + _2654;
    float _2944 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2946 = -_2708;
    float _2948 = fma(_2684, _2946, _2874);
    float _2950 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2952 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2954 = -_2714;
    float _2956 = _2954 + 1.0;
    float _2958 = -_2716;
    float _2960 = _2958 + 1.0;
    float _2962 = _2386 + _2686;
    float _2964 = _1992 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2966 = _2950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2968 = _2944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2970 = _2952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2972 = -_2742;
    float _2974 = fma(_2644, _2972, _2894);
    float _2976 = fma(_2634, _2956, _2916);
    float _2978 = fma(_2604, _2960, _2934);
    float _2980 = _2390 + _2688;
    out.m_78.x = _2966;
    out.m_78.y = _2968;
    out.m_78.z = _2970;
    out.m_78.w = _2964;
    float _2982 = _2716;
    float _2984 = _2978;
    float _2986 = _2974;
    float _2988 = _2894;
    float _2990 = _2930;
    float _2992 = _2644;
    if (!_2906)
    {
        _2982 = 1.0;
    }
    float _2994 = _2982;
    out.m_80.x = _2938;
    out.m_80.y = _2940;
    out.m_80.z = _2936;
    out.m_82.x = _2948;
    out.m_82.y = _2976;
    out.m_82.z = _2974;
    out.m_82.w = _2978;
    out.m_84.x = _2962;
    out.m_84.y = _2942;
    out.m_84.z = _2980;
    bool _2996 = !_2906;
    float _2998 = _2994;
    if (!_2996)
    {
        bool _3000 = _2734 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3002 = isnan(_2734);
        bool _3004 = _3000 || _3002;
        bool _3006 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3008 = _3004 || _3006;
        if (!_3008)
        {
            float _3010 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3012 = _2734 + _3010;
            float _3014 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3016 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3014;
            float _3018 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3020 = _3018 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3022 = 1.0 / _3016;
            float _3024 = _3012 * _3022;
            float _3026 = fma(_3024, _3020, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2998 = _3026;
            _3028 = true;
        }
        else
        {
            bool _3030 = _2734 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3032 = isnan(_2734);
            bool _3034 = _3030 || _3032;
            bool _3036 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3038 = _3034 || _3036;
            if (!_3038)
            {
                float _3040 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3042 = _2734 + _3040;
                float _3044 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3046 = _3044 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3048 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3050 = _3048 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3052 = 1.0 / _3046;
                float _3054 = _3042 * _3052;
                float _3056 = fma(_3054, _3050, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2998 = _3056;
                _3028 = true;
            }
            else
            {
                _2998 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3028 = false;
    float _3058 = _2998;
    float _3060 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3062 = _2580 + _3060;
    float _3064 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3066 = _2586 + _3064;
    float _3068 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3070 = _2588 + _3068;
    float _3072 = fma(_3062, _3058, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3074 = fma(_3066, _3058, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3076 = fma(_3070, _3058, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3078 = -_1726;
    float _3080 = _3078 + _3072;
    float _3082 = -_1640;
    float _3084 = _3082 + _3074;
    float _3086 = -_1722;
    float _3088 = _3086 + _3076;
    float _3090 = _3080 * _3080;
    float _3092 = fma(_3084, _3084, _3090);
    float _3094 = fma(_3088, _3088, _3092);
    float _3096 = sqrt(_3094);
    bool _3098 = _3096 > 0.0;
    bool _3100 = !_3098;
    float _3102 = _3096;
    float _3104 = _3072;
    float _3106 = _3074;
    float _3108 = _3076;
    if (!_3100)
    {
        bool _3110 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3112 = _2966;
        if (_3110)
        {
            float _3114 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3112 = _3114;
        }
        float _3116 = _3112;
        if (_3110)
        {
            float _3118 = _461 * _3116;
            _2984 = _3118;
        }
        float _3120 = _2984;
        float _3122 = _3120;
        if (_3110)
        {
            float _3124 = _463 * _3116;
            _2986 = _3124;
        }
        float _3126 = _2986;
        float _3128 = _3126;
        if (_3110)
        {
            float _3130 = _465 * _3116;
            _3102 = _3130;
        }
        float _3132 = _3102;
        float _3134 = _3132;
        if (!_3110)
        {
            bool _3136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _3138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _3140 = _3136 || _3138;
            bool _3142 = isnan(1.0);
            bool _3144 = _3140 || _3142;
            float _3146 = _149 + 1.0;
            float _3148 = _3146;
            if (!_3144)
            {
                float _3150 = _3146 * _3146;
                float _3152 = _3150 * 0.5;
                _469 = _3152;
            }
            float _3154 = _469;
            float _3156 = _3154;
            if (!_3144)
            {
                float _3158 = _3154 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3156 = _3158;
            }
            float _3160 = _3156;
            bool _3162 = !_3144;
            float _3164 = _3160;
            if (!_3162)
            {
                float _3166 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3168 = log2(_3166);
                float _3170 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3172 = _3170 + 1.0;
                float _3174 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3176 = _3168 * _3146;
                float _3178 = 1.0 / _3172;
                float _3180 = _3174 * 0.693147182464599609375;
                float _3182 = exp2(_3176);
                float _3184 = 1.0 / _3180;
                float _3186 = _3182 + (-1.0);
                float _3188 = -_3186;
                float _3190 = fma(_3188, _3184, _3146);
                float _3192 = _3190 * _3178;
                float _3194 = _3192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3164 = _3194;
            }
            float _3196 = _3164;
            float _3198 = _3196 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3200 = _3196 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3202 = !_3144;
            if (!_3202)
            {
                float _3204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3206 = log2(_3204);
                float _3208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3210 = _3208 + 1.0;
                float _3212 = 1.0 / _3210;
                float _3214 = _3206 * _3146;
                float _3216 = exp2(_3214);
                float _3218 = -_3216;
                float _3220 = _3218 + 1.0;
                float _3222 = _3220 * _3212;
                _3148 = _3222;
            }
            float _3224 = _3148;
            float _3226 = fma(_3224, _187, _3200);
            float _3228 = _3196 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3230 = fma(_3224, _185, _3198);
            float _3232 = -_423;
            float _3234 = _3232 + _3226;
            float _3236 = fma(_3224, _189, _3228);
            float _3238 = -_427;
            float _3240 = _3238 + _3230;
            float _3242 = _3234 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3244 = _3234 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3246 = _3234 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3248 = -_435;
            float _3250 = _3248 + _3236;
            float _3252 = fma(_3240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3242);
            float _3254 = fma(_3240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3244);
            float _3256 = fma(_3240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3246);
            float _3258 = fma(_3250, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3252);
            float _3260 = fma(_3250, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3254);
            float _3262 = fma(_3250, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3256);
            _471 = _3260;
            _473 = _3258;
            _475 = _3262;
            _3122 = _3258;
            _3128 = _3260;
            _3134 = _3262;
        }
        float _3264 = _471;
        float _3266 = _473;
        float _3268 = _475;
        float _3270 = _3122;
        float _3272 = _3128;
        float _3274 = _3134;
        float _3276 = _3264 * _3264;
        float _3278 = rsqrt(_3094);
        float _3280 = fma(_3266, _3266, _3276);
        float _3282 = fma(_3268, _3268, _3280);
        float _3284 = sqrt(_3282);
        float _3286 = _3080 * _3278;
        float _3288 = _3084 * _3278;
        float _3290 = _3088 * _3278;
        bool _3292 = _3284 > 0.0;
        bool _3294 = !_3292;
        if (!_3294)
        {
            float _3296 = rsqrt(_3282);
            float _3298 = _3296 * _3264;
            float _3300 = _3296 * _3266;
            float _3302 = _3296 * _3268;
            float _3304 = _3286 * _3298;
            float _3306 = fma(_3288, _3300, _3304);
            float _3308 = fma(_3290, _3302, _3306);
            float _3310 = _3308 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3312 = fma(_3270, _3310, _3074);
            float _3314 = fma(_3272, _3310, _3072);
            float _3316 = fma(_3274, _3310, _3076);
            _3104 = _3314;
            _3106 = _3312;
            _3108 = _3316;
        }
    }
    float _3318 = _3104;
    float _3320 = _3106;
    float _3322 = _3108;
    float _3324 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3326 = _3318 + _3324;
    float _3328 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3330 = _3320 + _3328;
    float _3332 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3334 = _3322 + _3332;
    float _3336 = _1726 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3338 = _3326 * _3326;
    float _3340 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3336);
    float _3342 = fma(_3330, _3330, _3338);
    float _3344 = fma(_3334, _3334, _3342);
    float _3346 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3340);
    float _3348 = _1726 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3350 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3352 = rsqrt(_3344);
    float _3354 = _3346 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3356 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3348);
    float _3358 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3356);
    float _3360 = 1.0 / _3354;
    float _3362 = _3358 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3364 = _3362 + _3354;
    float _3366 = _3352 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3368 = floor(_3350);
    float _3370 = _3330 * _3366;
    float _3372 = _3334 * _3366;
    float _3374 = _3370 * _3370;
    float _3376 = _3372 * _3372;
    float _3378 = _3364 * _3360;
    float _3380 = _3378 * 0.5;
    float _3382 = sqrt(_3344);
    float _3384 = _3374 + _3376;
    float _3386 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3388 = fma(_3380, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3386);
    float _3390 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _3392 = -_3368;
    float _3394 = _3350 + _3392;
    float _3396 = sqrt(_3384);
    float _3398 = _1726 + _3390;
    float _3400 = _3398 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3402 = _3398 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3404 = 1.0 / _3388;
    float _3406 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3400);
    float _3408 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3402);
    float _3410 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3406);
    float _3412 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3408);
    bool _3414 = _3396 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3418 = _3396 + _3416;
    float _3420 = _3410 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3422 = _3412 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _3424 = trunc(_3420);
    int _3426 = int(_3424);
    float _3428 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3430 = _3404 * _3428;
    float _3432 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _3434 = _3430 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3436 = _3094;
    int _3438 = 2;
    float _3440 = _3418;
    float _3442 = _3384;
    float _3444 = _3372;
    float _3446 = _3368;
    float _3448 = _3370;
    if (_3414)
    {
        float _3450 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3436 = _3450;
    }
    float _3452 = _3436;
    bool _3454 = _3430 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3456 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3458 = trunc(_3422);
    int _3460 = int(_3458);
    int _3462 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3464 = _3426 + _3462;
    int _3466 = _3464 + 1;
    float _3468 = _3456;
    if (!_3434)
    {
        _3438 = 1;
    }
    int _3470 = _3438;
    int _3472 = _3470;
    if (_3414)
    {
        float _3474 = _3418 * _3452;
        _3440 = _3474;
    }
    float _3476 = _3440;
    if (_3414)
    {
        float _3478 = rsqrt(_3384);
        _3442 = _3478;
    }
    float _3480 = _3442;
    float _3482 = _3480;
    if (_3414)
    {
        float _3484 = _3476 * 0.15915493667125701904296875;
        _2988 = _3484;
    }
    float _3486 = _2988;
    bool _3488 = !_3434;
    int _3490 = _3488 ? 0 : 1;
    int _3492 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3494 = _3460 + _3492;
    int _3496 = _3494 + 1;
    float _3498 = _3396;
    if (_3414)
    {
        float _3500 = _3486 * 6.283185482025146484375;
        float _3502 = sin(_3500);
        _3498 = _3502;
    }
    float _3504 = _3498;
    if (!_3454)
    {
        _3472 = _3490;
    }
    int _3506 = _3472;
    float _3508 = precise::max(0.0, _3456);
    int _3510 = _3506 << 6;
    bool _3512 = _3466 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _3514 = -_3366;
    float _3516 = -_3508;
    float _3518 = fma(_3326, _3514, _3516);
    int _3520 = _3510 + 48;
    uint _3522 = uint(int(uint(_3520) >> uint(2)));
    uint _3524 = uint(int(uint(int(_3522)) >> uint(2)));
    int _3526 = int(_3522) & 3;
    float _3528 = (*spvDescriptorSet0.vp_c15)._m0[int(_3524)][_3526];
    int _3530 = int(_3522) + 1;
    uint _3532 = uint(int(uint(_3530) >> uint(2)));
    int _3534 = _3530 & 3;
    float _3536 = (*spvDescriptorSet0.vp_c15)._m0[int(_3532)][_3534];
    int _3538 = _3466 | _3496;
    float _3540 = _3486;
    if (_3414)
    {
        float _3542 = _3486 * 6.283185482025146484375;
        float _3544 = cos(_3542);
        _3540 = _3544;
    }
    float _3546 = _3540;
    if (_3414)
    {
        float _3548 = _3518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3468 = _3548;
    }
    float _3550 = _3468;
    float _3552 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _3554 = _3538 < 0;
    bool _3556 = _3554 || _3512;
    float _3558 = _3550;
    if (_3414)
    {
        float _3560 = fma(_3504, _3550, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3558 = _3560;
    }
    float _3562 = _3558;
    int _3564 = _3510 + 64;
    uint _3566 = uint(int(uint(_3564) >> uint(2)));
    uint _3568 = uint(int(uint(int(_3566)) >> uint(2)));
    int _3570 = int(_3566) & 3;
    float _3572 = (*spvDescriptorSet0.vp_c15)._m0[int(_3568)][_3570];
    int _3574 = int(_3566) + 1;
    uint _3576 = uint(int(uint(_3574) >> uint(2)));
    int _3578 = _3574 & 3;
    float _3580 = (*spvDescriptorSet0.vp_c15)._m0[int(_3576)][_3578];
    bool _3582 = _3496 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3584 = _3582 || _3556;
    float _3586 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3552);
    if (_3414)
    {
        float _3588 = _3480 * _3562;
        _2990 = _3588;
    }
    float _3590 = _2990;
    if (!_3414)
    {
        _3482 = _3518;
    }
    float _3592 = _3482;
    float _3594 = floor(_3432);
    float _3596 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3586);
    float _3598 = _3592;
    if (_3414)
    {
        float _3600 = _3372 * _3590;
        _3444 = _3600;
    }
    float _3602 = _3444;
    int _3604 = _3510 + 96;
    uint _3606 = uint(int(uint(_3604) >> uint(2)));
    uint _3608 = uint(int(uint(int(_3606)) >> uint(2)));
    int _3610 = int(_3606) & 3;
    float _3612 = (*spvDescriptorSet0.vp_c15)._m0[int(_3608)][_3610];
    int _3614 = int(_3606) + 1;
    uint _3616 = uint(int(uint(_3614) >> uint(2)));
    int _3618 = _3614 & 3;
    float _3620 = (*spvDescriptorSet0.vp_c15)._m0[int(_3616)][_3618];
    float _3622 = _3546;
    if (_3414)
    {
        float _3624 = _3546 + (-1.0);
        _3446 = _3624;
    }
    float _3626 = _3446;
    float _3628 = _3626;
    if (_3414)
    {
        float _3630 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2992 = _3630;
    }
    float _3632 = _2992;
    if (!_3414)
    {
        _3628 = _3370;
    }
    float _3634 = _3628;
    int _3636 = _3510 + 104;
    uint _3638 = uint(int(uint(_3636) >> uint(2)));
    uint _3640 = uint(int(uint(int(_3638)) >> uint(2)));
    int _3642 = int(_3638) & 3;
    float _3644 = (*spvDescriptorSet0.vp_c15)._m0[int(_3640)][_3642];
    int _3646 = int(_3638) + 1;
    uint _3648 = uint(int(uint(_3646) >> uint(2)));
    int _3650 = _3646 & 3;
    float _3652 = (*spvDescriptorSet0.vp_c15)._m0[int(_3648)][_3650];
    float _3654 = _2916;
    float _3656 = _3634;
    if (!_3584)
    {
        float _3658 = floor(_3422);
        _3654 = _3658;
    }
    float _3660 = _3654;
    if (_3414)
    {
        float _3662 = _3370 * _3590;
        _3656 = _3662;
    }
    float _3664 = _3656;
    if (!_3414)
    {
        _3448 = _3374;
    }
    float _3666 = _3448;
    float _3668 = _3596 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3670 = _3666;
    if (_3414)
    {
        float _3672 = fma(_3518, _3546, _3632);
        _3598 = _3672;
    }
    float _3674 = _3598;
    if (_3414)
    {
        float _3676 = _3664 * _3664;
        _3670 = _3676;
    }
    float _3678 = _3670;
    if (!_3414)
    {
        _3622 = _3376;
    }
    float _3680 = _3622;
    int _3682 = _3510 + 80;
    uint _3684 = uint(int(uint(_3682) >> uint(2)));
    uint _3686 = uint(int(uint(int(_3684)) >> uint(2)));
    int _3688 = int(_3684) & 3;
    float _3690 = (*spvDescriptorSet0.vp_c15)._m0[int(_3686)][_3688];
    int _3692 = int(_3684) + 1;
    uint _3694 = uint(int(uint(_3692) >> uint(2)));
    int _3696 = _3692 & 3;
    float _3698 = (*spvDescriptorSet0.vp_c15)._m0[int(_3694)][_3696];
    float _3700 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3702 = _3668 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3704 = _3680;
    int _3706 = as_type<int>(_3700);
    if (_3414)
    {
        float _3708 = _3602 * _3602;
        _3704 = _3708;
    }
    float _3710 = _3704;
    float _3712 = fma(_3674, _3674, _3678);
    float _3714 = -_3594;
    float _3716 = _3432 + _3714;
    float _3718 = -_3702;
    float _3720 = fma(_3718, _3700, 1.0);
    float _3722 = _3720;
    if (!_3584)
    {
        int _3724 = _3496 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3726 = _3724 + _3466;
        _3706 = _3726;
    }
    int _3728 = _3706;
    int _3730 = _3510 + 56;
    uint _3732 = uint(int(uint(_3730) >> uint(2)));
    uint _3734 = uint(int(uint(int(_3732)) >> uint(2)));
    int _3736 = int(_3732) & 3;
    float _3738 = (*spvDescriptorSet0.vp_c15)._m0[int(_3734)][_3736];
    int _3740 = int(_3732) + 1;
    uint _3742 = uint(int(uint(_3740) >> uint(2)));
    int _3744 = _3740 & 3;
    float _3746 = (*spvDescriptorSet0.vp_c15)._m0[int(_3742)][_3744];
    float _3748 = _3712 + _3710;
    float _3750 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3752 = fma(_3382, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3750);
    float _3754 = precise::clamp(_3752, 0.0, 1.0);
    int _3756 = _3510 + 72;
    uint _3758 = uint(int(uint(_3756) >> uint(2)));
    uint _3760 = uint(int(uint(int(_3758)) >> uint(2)));
    int _3762 = int(_3758) & 3;
    float _3764 = (*spvDescriptorSet0.vp_c15)._m0[int(_3760)][_3762];
    int _3766 = int(_3758) + 1;
    uint _3768 = uint(int(uint(_3766) >> uint(2)));
    int _3770 = _3766 & 3;
    float _3772 = (*spvDescriptorSet0.vp_c15)._m0[int(_3768)][_3770];
    float _3774 = _3398 * _3536;
    float _3776 = fma(_1640, _3528, _3774);
    int _3778 = as_type<int>(_3774);
    if (!_3584)
    {
        int _3780 = _3728 << 2;
        _3778 = _3780;
    }
    int _3782 = _3778;
    int _3784 = _3510 + 88;
    uint _3786 = uint(int(uint(_3784) >> uint(2)));
    uint _3788 = uint(int(uint(int(_3786)) >> uint(2)));
    int _3790 = int(_3786) & 3;
    float _3792 = (*spvDescriptorSet0.vp_c15)._m0[int(_3788)][_3790];
    int _3794 = int(_3786) + 1;
    uint _3796 = uint(int(uint(_3794) >> uint(2)));
    int _3798 = _3794 & 3;
    float _3800 = (*spvDescriptorSet0.vp_c15)._m0[int(_3796)][_3798];
    float _3802 = _3398 * _3580;
    float _3804 = _3580;
    int _3806 = _3782;
    if (!_3584)
    {
        float _3808 = -_3660;
        float _3810 = _3422 + _3808;
        _3804 = _3810;
    }
    float _3812 = _3804;
    if (!_3584)
    {
        int _3814 = 12 & _3782;
        _3806 = _3814;
    }
    int _3816 = _3806;
    float _3818 = rsqrt(_3748);
    float _3820 = fma(_1640, _3572, _3802);
    float _3822 = _3398 * _3620;
    float _3824 = fma(_1640, _3612, _3822);
    float _3826 = -_3754;
    float _3828 = _3826 + 1.0;
    float _3830 = fma(_1722, _3644, _3824);
    float _3832 = abs(_3828);
    float _3834 = log2(_3832);
    float _3836 = _3830 + _3652;
    float _3838 = _3818 * _3664;
    float _3840 = _3818 * _3674;
    float _3842 = _3818 * _3602;
    float _3844 = _3398 * _3698;
    int _3846 = as_type<int>(_3698);
    int _3848 = _3816;
    if (!_3584)
    {
        uint _3850 = uint(int(uint(_3728) >> uint(2)));
        _3846 = int(_3850);
    }
    int _3852 = _3846;
    float _3854 = _3838 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3856 = 1.0 / _3836;
    float _3858 = fma(_1640, _3690, _3844);
    if (!_3584)
    {
        int _3860 = _3852 << 4;
        int _3862 = _3860 + _3816;
        _3848 = _3862;
    }
    int _3864 = _3848;
    float _3866 = -_3854;
    float _3868 = fma(_3840, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3866);
    float _3870 = fma(_1722, _3738, _3776);
    float _3872 = _3854;
    if (!_3584)
    {
        int _3874 = _3864 + 400;
        uint _3876 = uint(int(uint(_3874) >> uint(2)));
        uint _3878 = uint(int(uint(int(_3876)) >> uint(2)));
        int _3880 = int(_3876) & 3;
        float _3882 = (*spvDescriptorSet0.vp_c15)._m0[int(_3878)][_3880];
        _3872 = _3882;
    }
    float _3884 = _3872;
    float _3886 = _3870 + _3746;
    float _3888 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3890 = fma(_1722, _3764, _3820);
    float _3892 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3888);
    float _3894 = -_3842;
    float _3896 = fma(_3894, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3868);
    float _3898 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3900 = _3890 + _3772;
    float _3902 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3904 = _3834 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3906 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3898);
    float _3908 = fma(_1722, _3792, _3858);
    float _3910 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3902);
    float _3912 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3892);
    float _3914 = _3886 * _3856;
    float _3916 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3906);
    float _3918 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3910);
    float _3920 = _3912 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3922 = exp2(_3904);
    bool _3924 = _3914 >= 0.0;
    float _3926 = _3918 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3928 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3930 = fma(_3896, -0.5, 0.5);
    bool _3932 = _3914 <= 1.0;
    bool _3934 = _3932 && _3924;
    float _3936 = fma(_3896, 0.5, 0.5);
    float _3938 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3928);
    float _3940 = _3900 * _3856;
    float _3942 = _3916 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3944 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3938);
    float _3946 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3948 = _3940 >= 0.0;
    bool _3950 = _3948 && _3934;
    float _3952 = fma(_3936, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3954 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3944);
    float _3956 = sqrt(_3930);
    bool _3958 = _3940 <= 1.0;
    bool _3960 = _3958 && _3950;
    float _3962 = fma(_3936, _3952, -0.212114393711090087890625);
    float _3964 = _3908 + _3800;
    float _3966 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3968 = _3840 + 1.0;
    float _3970 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3946);
    float _3972 = fma(_3936, _3962, 1.570728778839111328125);
    float _3974 = 1.0 / _3954;
    float _3976 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3966);
    float _3978 = -_3840;
    float _3980 = fma(_3922, _3968, _3978);
    float _3982 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3970);
    float _3984 = _3964 * _3856;
    float _3986 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3976);
    float _3988 = _3936;
    float _3990 = _3954;
    if (_3960)
    {
        float _3992 = float(_3506);
        _3988 = _3992;
    }
    float _3994 = _3988;
    float _3996 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3982);
    float _3998 = log2(_3720);
    float _4000 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3986);
    float _4002 = _3956 * 0.636619746685028076171875;
    float2 _10564 = float2(_3394, _3716);
    float _4004 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10564, float2(0.0), isnan(_10564)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10564, float2(0.0), isnan(_10564)), level(0.0)).x;
    float _4006 = fma(_3980, 0.5, 0.5);
    float _4008 = -_3972;
    float _4010 = fma(_4002, _4008, 1.0);
    float _4012 = _3904;
    if (!_3584)
    {
        float _4014 = floor(_3420);
        _4012 = _4014;
    }
    float _4016 = _4012;
    float _4018 = _3996 * _3974;
    float _4020 = _4000 * _3974;
    float _4022 = fma(_4018, 0.5, 0.5);
    float _4024 = fma(_4020, -0.5, 0.5);
    float _4026 = _3970;
    if (_3960)
    {
        float _4028 = rint(_3994);
        float _4030 = precise::max(_4028, 0.0);
        uint _4032 = uint(_4030);
        uint _4034 = clamp(_4032, 0u, 65535u);
        _4026 = as_type<float>(_4034);
    }
    float _4036 = _4026;
    float _4038 = _3998 * 0.693147182464599609375;
    float _4040 = _4038 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4042 = _3884;
    if (!_3584)
    {
        float _4044 = rint(_3884);
        float _4046 = precise::max(_4044, 0.0);
        uint _4048 = uint(_4046);
        uint _4050 = clamp(_4048, 0u, 65535u);
        _4042 = as_type<float>(_4050);
    }
    float _4052 = _4042;
    if (!_3584)
    {
        float _4054 = -_4016;
        float _4056 = _3420 + _4054;
        _3722 = _4056;
    }
    float _4058 = _3722;
    float _4060 = _3922;
    if (_3960)
    {
        float3 _10656 = float3(_3914, _3940, float(as_type<int>(_4036)));
        float3 _10660 = select(_10656, float3(0.0), isnan(_10656));
        float _4062 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _10660.xy, uint(rint(_10660.z)), _3984, level(0.0));
        _4060 = _4062;
    }
    float _4064 = _4060;
    float3 _10670 = float3(_4022, _4024, _4040);
    float _4066 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10670, float3(0.0), isnan(_10670)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10670, float3(0.0), isnan(_10670)), level(0.0)).x;
    float3 _10679 = float3(_4022, _4024, _4040);
    float4 _4069 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10679, float3(0.0), isnan(_10679)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10679, float3(0.0), isnan(_10679)), level(0.0)).xyzw;
    float _4071 = _4069.x;
    float _4073 = _4069.y;
    float _4075 = _4069.z;
    float _4077 = _4069.w;
    float2 _10695 = float2(_4010, _4006);
    float3 _4081 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10695, float2(0.0), isnan(_10695)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10695, float2(0.0), isnan(_10695)), level(0.0)).xyz;
    float _4083 = _4081.x;
    float _4085 = _4081.y;
    float _4087 = _4081.z;
    float _4089 = _3812;
    if (!_3584)
    {
        float3 _10716 = float3(_4058, _3812, float(as_type<int>(_4052)));
        float3 _10718 = select(_10716, float3(0.0), isnan(_10716));
        float _4091 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _10718.xy, uint(rint(_10718.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _10718.xy, uint(rint(_10718.z)), level(0.0)).x;
        _4089 = _4091;
    }
    float _4093 = _4089;
    float _4095 = abs(_3430);
    float _4097 = log2(_4095);
    float _4099 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4101 = _3834 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4103 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4099);
    float _4105 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4103);
    float _4107 = exp2(_4101);
    bool _4109 = _3430 <= 8000.0;
    bool _4111 = isnan(_3430);
    bool _4113 = _4109 || _4111;
    bool _4115 = isnan(8000.0);
    bool _4117 = _4113 || _4115;
    float _4119 = float(_4117);
    float _4121 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4105);
    float _4123 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3996;
    out.gl_Position.y = _4000;
    out.gl_Position.z = _4121;
    out.gl_Position.w = _3954;
    float _4125 = exp2(_4123);
    float _4127 = _3996;
    if (_3584)
    {
        _4127 = 1.0;
    }
    float _4129 = _4127;
    float _4131 = fma(_4125, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4133 = precise::clamp(_4131, 0.0, 1.0);
    float _4135 = fma(_4133, -2.0, 3.0);
    float _4137 = _4133 * _4133;
    float _4139 = _4137 * _4135;
    float _4141 = _4121 + _3954;
    float _4143 = _4141 * 0.5;
    float _4145 = -_4139;
    float _4147 = _4145 + 1.0;
    out.m_86.z = _4143;
    out.m_86.w = _3954;
    float _4149 = fma(_4147, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4139);
    float _4151 = -_4107;
    float _4153 = _4151 + 1.0;
    float _4155 = _4119 * _4149;
    float _4157 = _4153 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4159 = _4155 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4161 = _4155;
    float _4163 = _4129;
    if (!_3960)
    {
        _4161 = 1.0;
    }
    float _4165 = _4161;
    float _4167 = -_4004;
    float _4169 = _4167 + 1.0;
    float _4171 = _4169 * _4159;
    float _4173 = precise::clamp(_4171, 0.0, 1.0);
    float _4175 = _4165;
    float _4177 = _4173;
    if (_3960)
    {
        bool _4179 = _4064 >= _3984;
        bool _4181 = isnan(_4064);
        bool _4183 = _4179 || _4181;
        bool _4185 = isnan(_3984);
        bool _4187 = _4183 || _4185;
        float _4189 = float(_4187);
        _4175 = _4189;
    }
    float _4191 = _4175;
    if (!_3584)
    {
        int _4193 = _3728 << 4;
        int _4195 = _4193 + 2048;
        uint _4197 = uint(int(uint(_4195) >> uint(2)));
        uint _4199 = uint(int(uint(int(_4197)) >> uint(2)));
        int _4201 = int(_4197) & 3;
        float _4203 = (*spvDescriptorSet0.vp_c15)._m0[int(_4199)][_4201];
        int _4205 = int(_4197) + 1;
        uint _4207 = uint(int(uint(_4205) >> uint(2)));
        int _4209 = _4205 & 3;
        float _4211 = (*spvDescriptorSet0.vp_c15)._m0[int(_4207)][_4209];
        int _4213 = _4195 + 8;
        uint _4215 = uint(int(uint(_4213) >> uint(2)));
        uint _4217 = uint(int(uint(int(_4215)) >> uint(2)));
        int _4219 = int(_4215) & 3;
        float _4221 = (*spvDescriptorSet0.vp_c15)._m0[int(_4217)][_4219];
        int _4223 = int(_4215) + 1;
        uint _4225 = uint(int(uint(_4223) >> uint(2)));
        int _4227 = _4223 & 3;
        float _4229 = (*spvDescriptorSet0.vp_c15)._m0[int(_4225)][_4227];
        float _4231 = _3398 * _4211;
        float _4233 = fma(_1640, _4203, _4231);
        float _4235 = fma(_1722, _4221, _4233);
        float _4237 = _4235 + _4229;
        float _4239 = precise::clamp(_4237, 0.0, 1.0);
        float _4241 = -_4239;
        float _4243 = _4241 + _4093;
        float _4245 = fma(_4243, 500.0, 1.5);
        float _4247 = exp2(_4245);
        float _4249 = 0.0 + _4247;
        float _4251 = precise::clamp(_4249, 0.0, 1.0);
        _4163 = _4251;
        _3990 = _4229;
    }
    float _4253 = _4163;
    float _4255 = _3990;
    float _4257 = _4157 * _4066;
    float _4259 = _4191 * _4253;
    float _4261 = -_4173;
    float _4263 = fma(_4261, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4265 = -_4157;
    float _4267 = _4265 + 1.0;
    float _4269 = _4077 * _4257;
    float _4271 = _4087 * _4257;
    float _4273 = -_4259;
    float _4275 = fma(_4273, _4263, 1.0);
    float _4277 = precise::clamp(_4275, 0.0, 1.0);
    out.m_88.x = _3320;
    out.m_88.y = _3318;
    out.m_88.z = _3322;
    float _4279 = fma(_4083, _4269, _4071);
    float _4281 = fma(_4085, _4269, _4073);
    float _4283 = _4077 * _4267;
    float _4285 = _4277 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4287 = fma(_4077, _4271, _4075);
    bool _4289 = _3382 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4291 = isnan(_3382);
    bool _4293 = _4289 || _4291;
    bool _4295 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4297 = _4293 || _4295;
    out.m_90.x = _4285;
    out.m_92.x = _4279;
    out.m_92.y = _4281;
    out.m_92.z = _4287;
    out.m_92.w = _4283;
    float _4299 = _4263;
    float _4301 = _4255;
    float _4303 = _4267;
    float _4305 = _4269;
    float _4307 = _4277;
    if (!_4297)
    {
        _4299 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4309 = _4299;
    float _4311 = _4309;
    float _4313 = _4309;
    if (!_4297)
    {
        _4177 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4315 = _4177;
    float _4317 = _4315;
    float _4319 = _4315;
    if (!_4297)
    {
        _4301 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4321 = _4301;
    float _4323 = _4321;
    float _4325 = _4321;
    if (!_4297)
    {
        _4303 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4327 = _4303;
    float _4329 = _4327;
    float _4331 = _4327;
    if (!_4297)
    {
        _4305 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4333 = _4305;
    float _4335 = _4333;
    float _4337 = _4333;
    if (!_4297)
    {
        _4307 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4339 = _4307;
    bool _4341 = !_4297;
    float _4343 = _4339;
    float _4345 = _4339;
    if (!_4341)
    {
        bool _4347 = _3382 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4349 = isnan(_3382);
        bool _4351 = _4347 || _4349;
        bool _4353 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4355 = _4351 || _4353;
        if (!_4355)
        {
            float _4357 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4359 = _3382 + _4357;
            float _4361 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4363 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4361;
            float _4365 = 1.0 / _4363;
            float _4367 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4369 = _4367 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4371 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4373 = _4371 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4375 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4377 = _4375 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4379 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4381 = _4379 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4383 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4385 = _4383 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4387 = _4359 * _4365;
            float _4389 = precise::clamp(_4387, 0.0, 1.0);
            float _4391 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4393 = _4391 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4395 = fma(_4389, _4369, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4397 = fma(_4389, _4393, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4399 = fma(_4389, _4373, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4401 = fma(_4389, _4377, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4403 = fma(_4389, _4381, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4405 = fma(_4389, _4385, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4319 = _4397;
            _4337 = _4403;
            _4313 = _4395;
            _4331 = _4401;
            _4325 = _4399;
            _4345 = _4405;
            _4407 = true;
        }
        else
        {
            bool _4409 = _3382 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4411 = isnan(_3382);
            bool _4413 = _4409 || _4411;
            bool _4415 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4417 = _4413 || _4415;
            if (!_4417)
            {
                _4311 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4419 = _4311;
            _4313 = _4419;
            if (!_4417)
            {
                _4317 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4421 = _4317;
            _4319 = _4421;
            if (!_4417)
            {
                _4323 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4423 = _4323;
            _4325 = _4423;
            if (!_4417)
            {
                _4329 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4425 = _4329;
            _4331 = _4425;
            if (!_4417)
            {
                _4335 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4427 = _4335;
            _4337 = _4427;
            if (!_4417)
            {
                _4343 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4429 = _4343;
            bool _4431 = !_4417;
            _4345 = _4429;
            if (!_4431)
            {
                bool _4433 = _3382 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4435 = isnan(_3382);
                bool _4437 = _4433 || _4435;
                bool _4439 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4441 = _4437 || _4439;
                if (!_4441)
                {
                    float _4443 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4445 = _3382 + _4443;
                    float _4447 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4449 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4447;
                    float _4451 = 1.0 / _4449;
                    float _4453 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4455 = _4453 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4457 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4459 = _4457 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4461 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4463 = _4461 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4465 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4467 = _4465 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4469 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4471 = _4469 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4473 = _4445 * _4451;
                    float _4475 = precise::clamp(_4473, 0.0, 1.0);
                    float _4477 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4479 = _4477 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4481 = fma(_4475, _4455, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4483 = fma(_4475, _4479, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4485 = fma(_4475, _4459, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4487 = fma(_4475, _4463, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4489 = fma(_4475, _4467, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4491 = fma(_4475, _4471, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4319 = _4483;
                    _4337 = _4489;
                    _4313 = _4481;
                    _4331 = _4487;
                    _4325 = _4485;
                    _4345 = _4491;
                    _4407 = true;
                }
                else
                {
                    _4319 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4337 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4313 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4331 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4325 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4345 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4407 = false;
    float _4493 = _4319;
    float _4495 = _4337;
    float _4497 = _4313;
    float _4499 = _4331;
    float _4501 = _4325;
    float _4503 = _4345;
    float _4505 = fma(_2942, -0.5, 0.5);
    float _4507 = precise::clamp(_4505, 0.0, 1.0);
    float _4509 = -_4493;
    float _4511 = _4509 + _4495;
    float _4513 = -_4497;
    float _4515 = _4513 + _4499;
    float _4517 = -_4501;
    float _4519 = _4517 + _4503;
    bool _4521 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4523 = fma(_4507, _4511, _4493);
    float _4525 = fma(_4507, _4515, _4497);
    float _4527 = fma(_4507, _4519, _4501);
    float _4529 = _4523 * 0.586610972881317138671875;
    out.m_94.x = 0.0;
    float _4531 = fma(_4525, 0.298911988735198974609375, _4529);
    float _4533 = fma(_4527, 0.114477999508380889892578125, _4531);
    float _4535 = -_4533;
    float _4537 = _4525 + _4535;
    float _4539 = -_4533;
    float _4541 = _4523 + _4539;
    float _4543 = -_4533;
    float _4545 = _4527 + _4543;
    float _4547 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4549 = fma(_4537, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4533);
    float _4551 = fma(_4541, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4533);
    float _4553 = fma(_4545, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4533);
    out.m_61.x = _4547;
    out.m_96.x = _4549;
    out.m_96.y = _4551;
    out.m_96.z = _4553;
    if (!_4521)
    {
        return out;
    }
    float _4555 = -_3318;
    float _4557 = _4555 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4559 = -_3320;
    float _4561 = _4559 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4563 = -_3322;
    float _4565 = _4563 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4567 = _4557 * _4557;
    float _4569 = fma(_4561, _4561, _4567);
    float _4571 = fma(_4565, _4565, _4569);
    float _4573 = sqrt(_4571);
    float _4575 = rsqrt(_4571);
    float _4577 = -_4573;
    float _4579 = _4577 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4581 = _4579 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4583 = precise::clamp(_4581, 0.0, 1.0);
    float _4585 = _4561 * _4575;
    float _4587 = _4557 * _4575;
    float _4589 = abs(_4583);
    float _4591 = log2(_4589);
    float _4593 = _4565 * _4575;
    float _4595 = _4585 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4597 = _2942 * _4587;
    float _4599 = -_4587;
    float _4601 = -_4595;
    float _4603 = fma(_4599, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4601);
    float _4605 = fma(_2962, _4585, _4597);
    float _4607 = -_4593;
    float _4609 = fma(_4607, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4603);
    float _4611 = fma(_2980, _4593, _4605);
    float _4613 = precise::clamp(_4611, 0.0, 1.0);
    float _4615 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4617 = _4609 + _4615;
    float _4619 = _4591 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4621 = _4617 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4623 = precise::clamp(_4621, 0.0, 1.0);
    float _4625 = exp2(_4619);
    float _4627 = _4625 * _4623;
    float _4629 = _4613 * _4627;
    float _4631 = _4629 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4633 = _4629 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4635 = _4629 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _4631;
    out.m_94.y = _4633;
    out.m_94.z = _4635;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4407 = false;
    bool _3028 = false;
    bool _651 = false;
    bool _495 = false;
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
        float _4692 = as_type<float>(_131);
        out.gl_Position.z = _4692;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_63.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_145)
    {
        float _151 = float(_115);
        _125 = _151;
    }
    float _153 = _125;
    bool _155 = _149 >= _153;
    bool _157 = !_145;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_61.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _133 = as_type<int>(_165);
    }
    int _167 = _133;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4761 = as_type<float>(_167);
        out.gl_Position.z = _4761;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_68.w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = in.m_63.x;
    float _187 = in.m_63.y;
    float _189 = in.m_63.z;
    float _191 = in.m_58.x;
    float _193 = in.m_58.y;
    float _195 = in.m_58.z;
    float _197 = 0.0;
    float _199 = _171;
    if (!_183)
    {
        float _201 = _171 * _171;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    float _207 = _205;
    if (!_183)
    {
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    int _213 = as_type<int>(_169) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_169) & 2;
    bool _219 = _217 != 0;
    int _221 = int(_215);
    int _223 = _219 ? 2 : 0;
    int _225 = _221 | _223;
    int _227 = _183 ? 4 : 0;
    int _229 = _225 | _227;
    int _231 = false ? 8 : 0;
    int _233 = _229 | _231;
    int _235 = false ? 16 : 0;
    int _237 = _233 | _235;
    int _239 = false ? 32 : 0;
    int _241 = _237 | _239;
    int _243 = false ? 64 : 0;
    int _245 = _241 | _243;
    int _247 = _245 & 4;
    bool _249 = !_215;
    float _251 = _249 ? (-0.5) : 0.5;
    bool _253 = !_219;
    float _255 = _253 ? (-0.5) : 0.5;
    bool _257 = !_183;
    float _259 = _211;
    float _261 = as_type<float>(_247);
    if (!_257)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = _171 * _265;
        float _275 = 1.0 / _269;
        float _277 = _271 * 0.693147182464599609375;
        float _279 = exp2(_273);
        float _281 = 1.0 / _277;
        float _283 = _279 + (-1.0);
        float _285 = -_283;
        float _287 = fma(_285, _281, _171);
        float _289 = _287 * _275;
        float _291 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _259 = _291;
        _261 = _281;
    }
    float _293 = _259;
    float _295 = _261;
    bool _297 = !_183;
    float _299 = _295;
    float _301 = _293;
    if (!_297)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _309 = _307 + 1.0;
        float _311 = 1.0 / _309;
        float _313 = _171 * _305;
        float _315 = exp2(_313);
        float _317 = -_315;
        float _319 = _317 + 1.0;
        float _321 = _319 * _311;
        _199 = _321;
        _299 = _309;
    }
    float _323 = _199;
    float _325 = _299;
    float _327 = 0.0;
    float _329 = _325;
    if (!_183)
    {
        float _331 = _149 * _149;
        float _333 = _331 * 0.5;
        _327 = _333;
    }
    float _335 = _327;
    float _337 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _341 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_183)
    {
        _329 = _149;
    }
    float _343 = _329;
    float _345 = fma(_323, _185, _337);
    float _347 = fma(_323, _187, _339);
    float _349 = _343;
    if (!_183)
    {
        float _351 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _301 = _351;
    }
    float _353 = _301;
    bool _355 = !_183;
    float _357 = _353;
    if (!_355)
    {
        float _359 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _361 = log2(_359);
        float _363 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _365 = _363 + 1.0;
        float _367 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _369 = _149 * _361;
        float _371 = 1.0 / _365;
        float _373 = _367 * 0.693147182464599609375;
        float _375 = exp2(_369);
        float _377 = 1.0 / _373;
        float _379 = _375 + (-1.0);
        float _381 = -_379;
        float _383 = fma(_381, _377, _149);
        float _385 = _383 * _371;
        float _387 = _385 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _357 = _387;
    }
    float _389 = _357;
    bool _391 = !_183;
    if (!_391)
    {
        float _393 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _395 = log2(_393);
        float _397 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _399 = _397 + 1.0;
        float _401 = 1.0 / _399;
        float _403 = _149 * _395;
        float _405 = exp2(_403);
        float _407 = -_405;
        float _409 = _407 + 1.0;
        float _411 = _409 * _401;
        _349 = _411;
    }
    float _413 = _349;
    float _415 = _389 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _417 = _389 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _421 = _389 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _423 = fma(_413, _187, _415);
    float _425 = fma(_347, _173, _193);
    float _427 = fma(_413, _185, _417);
    float _429 = fma(_323, _189, _341);
    float _431 = -_423;
    float _433 = _347 + _431;
    float _435 = fma(_413, _189, _421);
    float _437 = -_427;
    float _439 = _345 + _437;
    float _441 = fma(_345, _173, _191);
    float _443 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _445 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _447 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _449 = -_435;
    float _451 = _429 + _449;
    float _453 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[4].x, _443);
    float _455 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[5].x, _445);
    float _457 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[6].x, _447);
    float _459 = fma(_429, _173, _195);
    float _461 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].z, _453);
    float _463 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].z, _455);
    float _465 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].z, _457);
    bool _467 = !_419;
    float _469 = _463;
    float _471 = _463;
    float _473 = _461;
    float _475 = _465;
    float _493;
    if (!_467)
    {
        float _477 = in.m_70.x;
        float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _481 = _477 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _485 = _483 * _479;
        float _487 = floor(_485);
        float _489 = -_487;
        float _491 = _485 + _489;
        _493 = _491;
        _495 = true;
    }
    else
    {
        float _497 = float(_115);
        float _499 = 1.0 / _497;
        float _501 = _149 * _499;
        _493 = _501;
    }
    _495 = false;
    float _503 = _493;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _507 = _503 + _505;
    bool _509 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _511 = isnan(_503);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _523 = _503 + _521;
    bool _525 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _527 = isnan(_503);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _545 = -_519;
    float _547 = _545 + 1.0;
    float _549 = 1.0 / _543;
    bool _551 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _553 = isnan(_503);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = _535 * _547;
    float _565 = -_535;
    float _567 = _565 + 1.0;
    bool _569 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _571 = 1.0 / _539;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _573;
    float _577 = _523 * _549;
    float _579 = _561 * _567;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _585 = -_561;
    float _587 = _585 + 1.0;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _593 = fma(_583, _577, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _595 = _507 * _571;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _597;
    float _601 = in.m_68.x;
    float _603 = in.m_68.y;
    float _605 = fma(_591, _577, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _607 = fma(_575, _595, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _609 = fma(_599, _595, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _611 = _607 * _579;
    float _613 = _609 * _579;
    float _615 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[143].x, _613);
    float _617 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[143].y, _611);
    float _619 = fma(_593, _563, _615);
    float _621 = fma(_605, _563, _617);
    float _623 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[145].x, _619);
    float _625 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[145].y, _621);
    float _627 = _623 * _601;
    float _629 = _625 * _603;
    bool _631 = !_569;
    float _649;
    if (!_631)
    {
        float _633 = in.m_70.x;
        float _635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _637 = _633 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _639 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _641 = _639 * _635;
        float _643 = floor(_641);
        float _645 = -_643;
        float _647 = _641 + _645;
        _649 = _647;
        _651 = true;
    }
    else
    {
        float _653 = float(_115);
        float _655 = 1.0 / _653;
        float _657 = _149 * _655;
        _649 = _657;
    }
    _651 = false;
    float _659 = _649;
    float _661 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _663 = int(_661);
    float _665 = _629 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _667 = float(_115);
    float _669 = _627 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _673 = _671 != 0;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _677 = _659 + _675;
    float _679 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _681 = int(_679);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _687 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _689 = int(_687);
    float _691 = float(_663);
    float _693 = 0.0;
    if (_673)
    {
        float _695 = in.m_70.x;
        _693 = _695;
    }
    float _697 = _693;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _697;
    if (!_673)
    {
        float _705 = in.m_70.y;
        _703 = _705;
    }
    float _707 = _703;
    float _709 = 1.0 / _691;
    float _711 = float(uint(_681));
    int _713 = ~_681;
    int _715 = _713 + 1;
    bool _717 = _681 == 0;
    int _719 = _681 + (-1);
    float _721 = 1.0 / _711;
    float _723 = float(_689);
    float _725 = _149 * _709;
    float _727 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _729 = int(_727);
    int _731 = ~_681;
    int _733 = _731 + 1;
    int _735 = as_type<int>(_721) + (-2);
    float _737 = trunc(_725);
    int _739 = int(_737);
    float _741 = 1.0 / _723;
    float _743 = float(uint(_729));
    int _745 = ~_729;
    int _747 = _745 + 1;
    float _749 = float(uint(_739));
    float _751 = 1.0 / _743;
    float _753 = float(_739);
    float _755 = as_type<float>(_735) * _749;
    float _757 = _149 * _741;
    float _759 = trunc(_755);
    float _761 = precise::max(_759, 0.0);
    uint _764 = uint(_761);
    float _766 = trunc(_757);
    int _768 = int(_766);
    float _770 = _755;
    float _772 = as_type<float>(_681);
    if (_673)
    {
        _770 = 1.0;
    }
    float _774 = _770;
    float _776 = _774;
    if (!_673)
    {
        _776 = 7.345489978790283203125;
    }
    float _778 = _776;
    int _780 = _733 * int(_764);
    int _782 = _780 + _739;
    float _784 = 1.0 / _667;
    float _786 = float(uint(_782));
    float _788 = in.m_70.x;
    float _790 = in.m_70.y;
    float _792 = in.m_70.z;
    float _794 = in.m_70.w;
    float _796 = float(uint(_768));
    float _798 = 1.0 / _685;
    float _800 = as_type<float>(_735) * _786;
    int _802 = as_type<int>(_751) + (-2);
    float _804 = as_type<float>(_802) * _796;
    float _806 = trunc(_800);
    float _808 = precise::max(_806, 0.0);
    uint _810 = uint(_808);
    float _812 = trunc(_804);
    float _814 = precise::max(_812, 0.0);
    uint _816 = uint(_814);
    float _818 = _790 * 2.0;
    int _820 = int(_764) + int(_810);
    float _822 = _778 * _788;
    float _824 = float(_681);
    float _826 = 1.0 / _701;
    float _828 = _778;
    if (_673)
    {
        _828 = 1.0;
    }
    float _830 = _828;
    int _832 = _715 * _820;
    int _834 = _832 + _739;
    bool _836 = _753 >= _824;
    bool _838 = isnan(_753);
    bool _840 = _836 || _838;
    bool _842 = isnan(_824);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = _830;
    if (!_673)
    {
        _848 = 1.2345600128173828125;
    }
    float _850 = _848;
    int _852 = _747 * int(_816);
    int _854 = _852 + _768;
    bool _856 = uint(_834) >= uint(_681);
    float _858 = floor(_822);
    float _860 = _707 * _850;
    bool _862 = !_856;
    int _864 = _862 ? 0 : (-1);
    float _866 = float(uint(_854));
    int _868 = ~_820;
    int _870 = _868 + _864;
    int _872 = _870 + 1;
    float _874 = trunc(_846);
    int _876 = int(_874);
    float _878 = as_type<float>(_802) * _866;
    int _880 = _681 * _872;
    int _882 = _880 + _739;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _886 = _884 != 0;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _890 = _888 != 0;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _894 = _892 != 0;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _898 = _896 != 0;
    float _900 = floor(_860);
    bool _902 = !_717;
    int _904 = _902 ? _882 : (-1);
    float _906 = -_858;
    float _908 = _822 + _906;
    float _910 = float(_729);
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _914 = _912 != 0;
    float _916 = _908 * _824;
    float _918 = trunc(_878);
    float _920 = precise::max(_918, 0.0);
    uint _922 = uint(_920);
    int _924 = ~_876;
    int _926 = _924 + 1;
    int _928 = _926 + 1;
    int _930 = _904 * _928;
    float _932 = -_900;
    float _934 = _860 + _932;
    float _936 = trunc(_916);
    int _938 = int(_936);
    int _940 = _876 * _719;
    int _942 = _940 + _930;
    float _944 = _149 * _784;
    bool _946 = !_890;
    int _948 = _946 ? 0 : 1;
    float _950 = _944 * _824;
    int _952 = int(_816) + int(_922);
    float _954 = _944 * _910;
    int _956 = ~_729;
    int _958 = _956 + 1;
    float _960 = _934 * _910;
    float _962 = float(_768);
    float _964 = trunc(_950);
    int _966 = int(_964);
    int _968 = abs(_948);
    int _970 = _958 * _952;
    int _972 = _970 + _768;
    bool _974 = _962 >= _910;
    bool _976 = isnan(_962);
    bool _978 = _974 || _976;
    bool _980 = isnan(_910);
    bool _982 = _978 || _980;
    float _984 = float(_982);
    bool _986 = !_914;
    int _988 = _986 ? 0 : 1;
    int _990 = _942 * _968;
    bool _992 = uint(_972) >= uint(_729);
    float _994 = trunc(_954);
    int _996 = int(_994);
    bool _998 = !_886;
    int _1000 = _998 ? 0 : 1;
    int _1002 = abs(_988);
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1006 = _1004 != 0;
    int _1008 = abs(_1000);
    float _1010 = trunc(_984);
    int _1012 = int(_1010);
    bool _1014 = !_992;
    int _1016 = _1014 ? 0 : (-1);
    int _1018 = _966 * _1008;
    int _1020 = _1018 + _990;
    bool _1022 = !_894;
    int _1024 = _1022 ? 0 : 1;
    bool _1026 = !_1006;
    int _1028 = _1026 ? 0 : 1;
    int _1030 = _938 * _1002;
    int _1032 = _1030 + _739;
    int _1034 = ~_952;
    int _1036 = _1034 + _1016;
    int _1038 = _1036 + 1;
    float _1040 = floor(_818);
    int _1042 = abs(_1024);
    int _1044 = abs(_1028);
    int _1046 = _729 * _1038;
    int _1048 = _1046 + _768;
    bool _1050 = !_898;
    int _1052 = _1050 ? 0 : 1;
    int _1054 = _1032 * _1042;
    int _1056 = _1054 + _1020;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1060 = _1058 != 0;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1064 = _1062 != 0;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1068 = _1066 != 0;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1072 = _1070 != 0;
    float _1074 = trunc(_960);
    int _1076 = int(_1074);
    bool _1078 = _729 == 0;
    int _1080 = abs(_1052);
    int _1082 = ~_1012;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    bool _1088 = !_1078;
    int _1090 = _1088 ? _1048 : (-1);
    int _1092 = _729 + (-1);
    int _1094 = _1090 * _1086;
    bool _1096 = !_1064;
    int _1098 = _1096 ? 0 : 1;
    int _1100 = _938 * _1044;
    int _1102 = _1100 + _1056;
    bool _1104 = !_1060;
    int _1106 = _1104 ? 0 : 1;
    int _1108 = _1012 * _1092;
    int _1110 = _1108 + _1094;
    bool _1112 = !_1068;
    int _1114 = _1112 ? 0 : 1;
    int _1116 = _1076 * _1080;
    int _1118 = _1116 + _768;
    float _1120 = float(uint(_1102));
    int _1122 = abs(_1098);
    int _1124 = abs(_1106);
    float _1126 = as_type<float>(_735) * _1120;
    bool _1128 = !_1072;
    int _1130 = _1128 ? 0 : 1;
    int _1132 = _1110 * _1122;
    int _1134 = abs(_1114);
    float _1136 = trunc(_1126);
    float _1138 = precise::max(_1136, 0.0);
    uint _1140 = uint(_1138);
    int _1142 = abs(_1130);
    int _1144 = _996 * _1124;
    int _1146 = _1144 + _1132;
    float _1148 = float(uint(_1032));
    int _1150 = _1118 * _1134;
    int _1152 = _1150 + _1146;
    int _1154 = ~_681;
    int _1156 = _1154 + 1;
    int _1158 = ~_729;
    int _1160 = _1158 + 1;
    int _1162 = _1076 * _1142;
    int _1164 = _1162 + _1152;
    float _1166 = as_type<float>(_735) * _1148;
    float _1168 = float(uint(_1118));
    int _1170 = _1156 * int(_1140);
    int _1172 = _1170 + _1102;
    float _1174 = float(uint(_1164));
    float _1176 = trunc(_1166);
    float _1178 = precise::max(_1176, 0.0);
    uint _1180 = uint(_1178);
    int _1182 = ~_681;
    int _1184 = _1182 + 1;
    float _1186 = as_type<float>(_802) * _1174;
    float _1188 = float(uint(_1172));
    bool _1190 = _681 == 0;
    float _1192 = trunc(_1186);
    float _1194 = precise::max(_1192, 0.0);
    uint _1196 = uint(_1194);
    float _1198 = as_type<float>(_735) * _1188;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1202 = _1200 != 0;
    float _1204 = trunc(_1198);
    float _1206 = precise::max(_1204, 0.0);
    uint _1208 = uint(_1206);
    int _1210 = _1160 * int(_1196);
    int _1212 = _1210 + _1164;
    int _1214 = ~_681;
    int _1216 = _1214 + 1;
    float _1218 = as_type<float>(_802) * _1168;
    int _1220 = _1184 * int(_1180);
    int _1222 = _1220 + _1032;
    float _1224 = float(uint(_1212));
    int _1226 = int(_1140) + int(_1208);
    float _1228 = as_type<float>(_802) * _1224;
    float _1230 = trunc(_1218);
    float _1232 = precise::max(_1230, 0.0);
    uint _1234 = uint(_1232);
    int _1236 = _1216 * _1226;
    int _1238 = _1236 + _1102;
    float _1240 = float(uint(_1222));
    int _1242 = ~_729;
    int _1244 = _1242 + 1;
    bool _1246 = uint(_1238) >= uint(_681);
    float _1248 = trunc(_1228);
    float _1250 = precise::max(_1248, 0.0);
    uint _1252 = uint(_1250);
    float _1254 = as_type<float>(_735) * _1240;
    bool _1256 = !_1246;
    int _1258 = _1256 ? 0 : (-1);
    bool _1260 = _794 > 0.5;
    int _1262 = ~_1226;
    int _1264 = _1262 + _1258;
    int _1266 = _1264 + 1;
    int _1268 = _1244 * int(_1234);
    int _1270 = _1268 + _1118;
    float _1272 = trunc(_1254);
    float _1274 = precise::max(_1272, 0.0);
    uint _1276 = uint(_1274);
    int _1278 = _681 * _1266;
    int _1280 = _1278 + _1102;
    int _1282 = ~_729;
    int _1284 = _1282 + 1;
    float _1286 = float(uint(_1270));
    int _1288 = int(_1196) + int(_1252);
    float _1290 = as_type<float>(_802) * _1286;
    bool _1292 = !_1190;
    int _1294 = _1292 ? _1280 : (-1);
    float _1296 = -_255;
    int _1298 = _1260 ? as_type<int>(_1296) : as_type<int>(_255);
    int _1300 = _1284 * _1288;
    int _1302 = _1300 + _1164;
    int _1304 = _1294 & 3;
    bool _1306 = _1304 != 0;
    float _1308 = trunc(_1290);
    float _1310 = precise::max(_1308, 0.0);
    uint _1312 = uint(_1310);
    int _1314 = _1294 & 3;
    bool _1316 = _1314 != 0;
    bool _1318 = uint(_1304) >= 2u;
    int _1320 = _1316 ? 0 : 1;
    bool _1322 = uint(_1302) >= uint(_729);
    int _1324 = _1318 ? 0 : 1;
    bool _1326 = uint(_1304) > 1u;
    bool _1328 = !_1322;
    int _1330 = _1328 ? 0 : (-1);
    bool _1332 = _1304 != 3;
    int _1334 = int(_1180) + int(_1276);
    int _1336 = ~_681;
    int _1338 = _1336 + 1;
    int _1340 = ~_1288;
    int _1342 = _1340 + _1330;
    int _1344 = _1342 + 1;
    int _1346 = ~_1320;
    int _1348 = _1346 + 1;
    int _1350 = _1348 + 1;
    int _1352 = _1338 * _1334;
    int _1354 = _1352 + _1032;
    int _1356 = ~_1324;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    int _1362 = _729 * _1344;
    int _1364 = _1362 + _1164;
    int _1366 = _1350;
    int _1368 = _1360;
    int _1370 = _1354;
    float _1372 = as_type<float>(_1032);
    if (!_1326)
    {
        int _1374 = ~_1320;
        int _1376 = _1374 + 1;
        _1366 = _1376;
    }
    int _1378 = _1366;
    float _1380 = _788 * 2.0;
    bool _1382 = uint(_1354) >= uint(_681);
    if (_1332)
    {
        int _1384 = ~_1324;
        int _1386 = _1384 + 1;
        _1368 = _1386;
    }
    int _1388 = _1368;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1392 = _1390 != 0;
    float _1394 = floor(_1380);
    bool _1396 = !_1078;
    int _1398 = _1396 ? _1364 : (-1);
    bool _1400 = !_1382;
    int _1402 = _1400 ? 0 : (-1);
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1406 = _1404 != 0;
    bool _1408 = !_1392;
    int _1410 = _1408 ? 0 : 1;
    int _1412 = _1398 & 3;
    bool _1414 = _1412 != 0;
    int _1416 = _1398 & 3;
    bool _1418 = _1416 != 0;
    bool _1420 = !_1406;
    int _1422 = _1420 ? 0 : 1;
    bool _1424 = uint(_1412) >= 2u;
    int _1426 = int(_1234) + int(_1312);
    float _1428 = _1418 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1430 = uint(_1412) > 1u;
    int _1432 = _1424 ? 0 : 1;
    bool _1434 = _1412 != 3;
    int _1436 = ~_729;
    int _1438 = _1436 + 1;
    int _1440 = ~as_type<int>(_1428);
    int _1442 = _1440 + 1;
    int _1444 = _1442 + 1;
    int _1446 = _1444;
    float _1448 = _1428;
    float _1450 = as_type<float>(_1426);
    if (_1202)
    {
        _1370 = 0;
    }
    int _1452 = _1370;
    int _1454 = _1438 * _1426;
    int _1456 = _1454 + _1118;
    int _1458 = ~_1432;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    int _1464 = _1452;
    int _1466 = _1462;
    if (!_1430)
    {
        int _1468 = ~as_type<int>(_1428);
        int _1470 = _1468 + 1;
        _1446 = _1470;
    }
    int _1472 = _1446;
    if (!_1202)
    {
        _1464 = 1;
    }
    int _1474 = _1464;
    bool _1476 = uint(_1456) >= uint(_729);
    if (_1434)
    {
        int _1478 = ~_1432;
        int _1480 = _1478 + 1;
        _1466 = _1480;
    }
    int _1482 = _1466;
    bool _1484 = _1394 >= 0.0;
    bool _1486 = isnan(_1394);
    bool _1488 = _1484 || _1486;
    bool _1490 = isnan(0.0);
    bool _1492 = _1488 || _1490;
    bool _1494 = _1474 != 1;
    bool _1496 = !_1476;
    int _1498 = _1496 ? 0 : (-1);
    int _1500 = _1492 ? 0 : 1;
    bool _1502 = _1394 > 0.0;
    int _1504 = ~_1334;
    int _1506 = _1504 + _1402;
    int _1508 = _1506 + 1;
    float _1510 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _251);
    int _1512 = ~_1426;
    int _1514 = _1512 + _1498;
    int _1516 = _1514 + 1;
    int _1518 = ~_1500;
    int _1520 = _1518 + 1;
    int _1522 = _1520 + 1;
    int _1524 = _681 * _1508;
    int _1526 = _1524 + _1032;
    int _1528 = _1522;
    if (!_1494)
    {
        _1372 = _790;
    }
    float _1530 = _1372;
    int _1532 = _729 * _1516;
    int _1534 = _1532 + _1118;
    float _1536 = _1530;
    if (!_1494)
    {
        _1448 = _790;
    }
    float _1538 = _1448;
    float _1540 = _669 * _1510;
    float _1542 = _1538;
    if (!_1494)
    {
        _772 = _792;
    }
    float _1544 = _772;
    float _1546 = _1544;
    if (!_1494)
    {
        _1450 = _792;
    }
    float _1548 = _1450;
    float _1550 = _1548;
    if (_1494)
    {
        _1536 = _788;
    }
    float _1552 = _1536;
    if (_1494)
    {
        _1542 = _788;
    }
    float _1554 = _1542;
    if (_1494)
    {
        _1546 = _790;
    }
    float _1556 = _1546;
    if (_1494)
    {
        _1550 = _790;
    }
    float _1558 = _1550;
    bool _1560 = !_1190;
    int _1562 = _1560 ? _1526 : (-1);
    float _1564 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1566 = !_1078;
    int _1568 = _1566 ? _1534 : (-1);
    int _1570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1572 = _1570 != 0;
    int _1574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1576 = _1574 != 0;
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1580 = _1578 != 0;
    float _1582 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _255);
    if (!_1502)
    {
        int _1584 = ~_1500;
        int _1586 = _1584 + 1;
        _1528 = _1586;
    }
    int _1588 = _1528;
    bool _1590 = !_1414;
    int _1592 = _1590 ? 0 : 1;
    float _1594 = _788 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1596 = _1412 != 3;
    float _1598 = _425 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1600 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1602 = _1600 != 0;
    float _1604 = _425 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1606 = _425 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1608 = !_1306;
    int _1610 = _1608 ? 0 : 1;
    float _1612 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1604);
    bool _1614 = _1304 != 3;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1618 = _665 * _1582;
    float _1620 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1598);
    float _1622 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1606);
    float _1624 = _792 * 2.0;
    float _1626 = -_1616;
    float _1628 = fma(_1594, 2.0, _1626);
    float _1630 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1612);
    float _1632 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1620);
    float _1634 = floor(_1624);
    float _1636 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1622);
    float _1638 = _790 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1640 = _1630 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1644 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1646 = log2(_1644);
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1652 = fma(_1638, -2.0, _1642);
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1656 = _1650 * _798;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1660 = _1634 >= 0.0;
    bool _1662 = isnan(_1634);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan(0.0);
    bool _1668 = _1664 || _1666;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1672;
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1678 = _1668 ? 0 : 1;
    float _1680 = _1654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1682 = _1634 > 0.0;
    float _1684 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1686 = _149 * _1646;
    float _1688 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1690 = _1674 * _826;
    float _1692 = _788 + _790;
    float _1694 = _792 + _790;
    int _1696 = ~_1678;
    int _1698 = _1696 + 1;
    int _1700 = _1698 + 1;
    float _1702 = exp2(_1686);
    out.m_72.x = _1680;
    out.m_72.y = _1684;
    out.m_72.z = _1688;
    out.m_72.w = _1676;
    float _1704 = _1692 + (-1.0);
    float _1706 = _1694 + (-1.0);
    bool _1708 = !_1572;
    int _1710 = _1708 ? 0 : 1;
    float _1712 = fma(_1690, _677, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1714 = _1700;
    if (!_1682)
    {
        int _1716 = ~_1678;
        int _1718 = _1716 + 1;
        _1714 = _1718;
    }
    int _1720 = _1714;
    float _1722 = _1636 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1724 = abs(_1710);
    float _1726 = _1632 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1728 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1730 = isnan(0.0);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1736 = _1732 || _1734;
    bool _1738 = !_1614;
    int _1740 = _1738 ? 0 : (-1);
    bool _1742 = _1040 >= 0.0;
    bool _1744 = isnan(_1040);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan(0.0);
    bool _1750 = _1746 || _1748;
    float _1752 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1754 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1756 = isnan(_659);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1762 = _1758 || _1760;
    float _1764 = float(_1762);
    float _1766 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1768 = -_1702;
    float _1770 = _1768 + 1.0;
    bool _1772 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1774 = isnan(_659);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1780 = _1776 || _1778;
    float _1782 = float(_1780);
    float _1784 = -_1764;
    float _1786 = _1784 + 1.0;
    bool _1788 = _659 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1790 = isnan(_659);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1796 = _1792 || _1794;
    float _1798 = float(_1796);
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1802 = 1.0 + _1800;
    float _1804 = _1736 ? _1770 : 0.0;
    float _1806 = _1782 * _1786;
    float _1808 = -_1782;
    float _1810 = _1808 + 1.0;
    bool _1812 = _1040 > 0.0;
    float _1814 = in.m_74.x;
    float _1816 = in.m_74.y;
    float _1818 = in.m_74.z;
    float _1820 = 1.0 / _1802;
    float _1822 = _1798 * _1810;
    float _1824 = -_1798;
    float _1826 = _1824 + 1.0;
    float _1828 = float(_1720);
    float _1830 = _1712 * _1822;
    float _1832 = float(_1724);
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1836 = _659 + _1834;
    bool _1838 = !_1576;
    int _1840 = _1838 ? 0 : 1;
    float _1842 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1830);
    int _1844 = _1750 ? 0 : 1;
    float _1846 = _1832 * _1828;
    float _1848 = fma(_1656, _1836, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1850 = abs(_1840);
    float _1852 = _1846 * (-2.0);
    float _1854 = _1804 * _1820;
    float _1856 = float(_1588);
    float _1858 = _788 + (-0.5);
    float _1860 = float(_1850);
    int _1862 = ~_1844;
    int _1864 = _1862 + 1;
    int _1866 = _1864 + 1;
    float _1868 = fma(_1852, _1814, _1814);
    float _1870 = _1860 * _1856;
    int _1872 = _1866;
    if (!_1812)
    {
        int _1874 = ~_1844;
        int _1876 = _1874 + 1;
        _1872 = _1876;
    }
    int _1878 = _1872;
    float _1880 = fma(_1752, _1852, _1752);
    bool _1882 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1884 = isnan(1.0);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1890 = _1886 || _1888;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1894 = _1870 * (-2.0);
    float _1896 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1868);
    bool _1898 = !_1890;
    float _1900 = _1898 ? _149 : _1854;
    float _1902 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1892);
    bool _1904 = !_1580;
    int _1906 = _1904 ? 0 : 1;
    float _1908 = fma(_1894, _1816, _1816);
    bool _1910 = _790 > 0.5;
    float _1912 = _790 + (-0.5);
    float _1914 = fma(_1900, _1880, _1896);
    int _1916 = abs(_1906);
    float _1918 = fma(_1912, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1908);
    float _1920 = float(_1878);
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1924 = float(_1916);
    float _1926 = fma(_1766, _1894, _1766);
    bool _1928 = _788 > 0.5;
    float _1930 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1922);
    float _1932 = _792 + _788;
    float _1934 = _1924 * _1920;
    float _1936 = fma(_1900, _1926, _1918);
    float _1938 = _1932 + (-1.0);
    float _1940 = _1934 * (-2.0);
    float _1942 = _1936 * 0.15915493667125701904296875;
    float _1944 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1946 = fma(_1848, _1806, _1842);
    float _1948 = fma(_1940, _1818, _1818);
    float _1950 = _792 + (-0.5);
    float _1952 = fma(_1944, _1940, _1944);
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1956 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1948);
    int _1958 = _1294 >> 31;
    float _1960 = _1914 * 0.15915493667125701904296875;
    float _1962 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1954);
    float _1964 = fma(_1900, _1952, _1956);
    int _1966 = _1958 & 3;
    float _1968 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1970 = _1398 >> 31;
    float _1972 = _1942 * 6.283185482025146484375;
    float _1974 = sin(_1972);
    int _1976 = _1294 + _1966;
    float _1978 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1968);
    int _1980 = _1970 & 3;
    float _1982 = _1964 * 0.15915493667125701904296875;
    float _1984 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1986 = _1398 + _1980;
    float _1988 = _1942 * 6.283185482025146484375;
    float _1990 = cos(_1988);
    float _1992 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1946);
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1996 = abs(_1472);
    float _1998 = -_1994;
    float _2000 = fma(_1984, 2.0, _1998);
    int _2002 = abs(_1388);
    float _2004 = _1960 * 6.283185482025146484375;
    float _2006 = sin(_2004);
    int _2008 = _1976 >> 2;
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2012 = !_1596;
    int _2014 = _2012 ? 0 : (-1);
    int _2016 = _2008 << 4;
    int _2018 = _2016 + 368;
    float _2020 = fma(_1564, -2.0, _2010);
    int _2022 = abs(_2014);
    float _2024 = _1960 * 6.283185482025146484375;
    float _2026 = cos(_2024);
    int _2028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2030 = _2028 != 0;
    int _2032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2034 = _2032 != 0;
    float _2036 = _1982 * 6.283185482025146484375;
    float _2038 = cos(_2036);
    int _2040 = _1986 >> 2;
    float _2042 = _2006 * _1974;
    uint _2044 = uint(int(uint(_2018) >> uint(2)));
    uint _2046 = uint(int(uint(int(_2044)) >> uint(2)));
    int _2048 = int(_2044) & 3;
    float _2050 = (*spvDescriptorSet0.vp_c9)._m0[int(_2046)][_2048];
    int _2052 = int(_2044) + 1;
    uint _2054 = uint(int(uint(_2052) >> uint(2)));
    int _2056 = _2052 & 3;
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[int(_2054)][_2056];
    float _2060 = _2006 * _1990;
    int _2062 = _2040 << 4;
    int _2064 = _2062 + 512;
    float _2066 = _1982 * 6.283185482025146484375;
    float _2068 = sin(_2066);
    float _2070 = _2026 * _1990;
    uint _2072 = uint(int(uint(_2064) >> uint(2)));
    uint _2074 = uint(int(uint(int(_2072)) >> uint(2)));
    int _2076 = int(_2072) & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    int _2080 = int(_2072) + 1;
    uint _2082 = uint(int(uint(_2080) >> uint(2)));
    int _2084 = _2080 & 3;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[int(_2082)][_2084];
    float _2088 = _2006 * _2038;
    float _2090 = _2026 * _1974;
    float _2092 = _1990 * _2038;
    float _2094 = _2026 * _2038;
    float _2096 = _1974 * _2038;
    float _2098 = _2088 * _1618;
    int _2100 = _2064 + 8;
    uint _2102 = uint(int(uint(_2100) >> uint(2)));
    uint _2104 = uint(int(uint(int(_2102)) >> uint(2)));
    int _2106 = int(_2102) & 3;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[int(_2104)][_2106];
    int _2110 = int(_2102) + 1;
    uint _2112 = uint(int(uint(_2110) >> uint(2)));
    int _2114 = _2110 & 3;
    float _2116 = (*spvDescriptorSet0.vp_c9)._m0[int(_2112)][_2114];
    float _2118 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2120 = -_2090;
    float _2122 = fma(_2068, _2060, _2120);
    float _2124 = fma(_2068, _2070, _2042);
    float _2126 = -_2060;
    float _2128 = fma(_2068, _2090, _2126);
    float _2130 = fma(_2068, _2042, _2070);
    float _2132 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2134 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2136 = _2018 + 8;
    uint _2138 = uint(int(uint(_2136) >> uint(2)));
    uint _2140 = uint(int(uint(int(_2138)) >> uint(2)));
    int _2142 = int(_2138) & 3;
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[int(_2140)][_2142];
    int _2146 = int(_2138) + 1;
    uint _2148 = uint(int(uint(_2146) >> uint(2)));
    int _2150 = _2146 & 3;
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[int(_2148)][_2150];
    float _2154 = -_1618;
    float _2156 = _2068 * _2154;
    float _2158 = _2094 * _1618;
    float _2160 = -_2068;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2118);
    float _2164 = -_2068;
    float _2166 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2132);
    float _2168 = -_2068;
    float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2134);
    float _2172 = fma(_2092, _1540, _2156);
    float _2174 = fma(_2124, _1540, _2158);
    float _2176 = fma(_2122, _1540, _2098);
    float _2178 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2162);
    float _2180 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2166);
    int _2182 = abs(_1378);
    float _2184 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2186 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2188 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2190 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2184);
    float _2192 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2186);
    int _2194 = abs(_1610);
    float _2196 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2188);
    int _2198 = ~_2182;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    float _2204 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2170);
    int _2206 = ~_1996;
    int _2208 = _2206 + 1;
    int _2210 = _2208 + 1;
    float _2212 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2214 = abs(_1592);
    int _2216 = _2202 * as_type<int>(_2058);
    int _2218 = ~_2194;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    int _2224 = _2210 * as_type<int>(_2086);
    int _2226 = abs(_1482);
    int _2228 = _2222 * as_type<int>(_2050);
    int _2230 = _2228 + _2216;
    int _2232 = ~_2214;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    float _2238 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2240 = int(_2238);
    int _2242 = abs(_1740);
    int _2244 = _2236 * as_type<int>(_2078);
    int _2246 = _2244 + _2224;
    int _2248 = ~_2002;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = ~_2226;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    int _2260 = _2252 * as_type<int>(_2144);
    int _2262 = _2260 + _2230;
    int _2264 = _2258 * as_type<int>(_2108);
    int _2266 = _2264 + _2246;
    float _2268 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2270 = int(_2268);
    int _2272 = ~_2242;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    int _2278 = ~_2022;
    int _2280 = _2278 + 1;
    int _2282 = _2280 + 1;
    int _2284 = abs(_1410);
    int _2286 = _2276 * as_type<int>(_2152);
    int _2288 = _2286 + _2262;
    float _2290 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _2292 = _2282 * as_type<int>(_2116);
    int _2294 = _2292 + _2266;
    int _2296 = ~_2284;
    int _2298 = _2296 + 1;
    int _2300 = _2298 + 1;
    float _2302 = fma(_2128, _2290, _2174);
    float _2304 = float(uint(_2240));
    float _2306 = fma(_2096, _2290, _2172);
    int _2308 = _2288 * _2300;
    float _2310 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2312 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2314 = abs(_1422);
    float _2316 = fma(_2130, _2290, _2176);
    float _2318 = 1.0 / _2304;
    float _2320 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2310);
    float _2322 = float(uint(_2270));
    float _2324 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2312);
    int _2326 = ~_2314;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    float _2332 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2320);
    int _2334 = abs(_2270);
    float _2336 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2324);
    float _2338 = 1.0 / _2322;
    float _2340 = _2332 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2342 = _2294 * _2330;
    float _2344 = _2336 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _2346 = _1562 * _2284;
    int _2348 = _2346 + _2308;
    int _2350 = abs(_2240);
    float _2352 = _1640 + _2340;
    float _2354 = _1722 + _2344;
    float _2356 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2358 = float(uint(_2350));
    float _2360 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2362 = as_type<int>(_2318) + (-2);
    float _2364 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2356);
    float _2366 = float(uint(_2348));
    int _2368 = _1568 * _2314;
    int _2370 = _2368 + _2342;
    float _2372 = float(uint(_2334));
    float _2374 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2360);
    float _2376 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2212);
    float _2378 = as_type<float>(_2362) * _2366;
    float _2380 = 1.0 / _2358;
    float _2382 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2364);
    int _2384 = as_type<int>(_2338) + (-2);
    float _2386 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2374);
    float _2388 = float(uint(_2370));
    float _2390 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2376);
    float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2394 = _2352 + _2392;
    float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2398 = _2354 + _2396;
    float _2400 = 1.0 / _2372;
    float _2402 = as_type<float>(_2384) * _2388;
    int _2404 = abs(_2348);
    float _2406 = _2394 * _2394;
    float _2408 = _2398 * _2398;
    int _2410 = ~_2240;
    int _2412 = _2410 + 1;
    float _2414 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2416 = trunc(_2378);
    float _2418 = precise::max(_2416, 0.0);
    uint _2420 = uint(_2418);
    int _2422 = abs(_2370);
    float _2424 = _2406 + _2408;
    int _2426 = as_type<int>(_2380) + (-2);
    float _2428 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2414);
    float _2430 = float(uint(_2404));
    float _2432 = float(uint(_2422));
    float _2434 = trunc(_2402);
    float _2436 = precise::max(_2434, 0.0);
    uint _2438 = uint(_2436);
    int _2440 = as_type<int>(_2400) + (-2);
    float _2442 = as_type<float>(_2426) * _2430;
    int _2444 = ~_2270;
    int _2446 = _2444 + 1;
    float _2448 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2428);
    int _2450 = ~_2350;
    int _2452 = _2450 + 1;
    float _2454 = as_type<float>(_2440) * _2432;
    float _2456 = -_251;
    int _2458 = _1928 ? as_type<int>(_2456) : as_type<int>(_251);
    float _2460 = sqrt(_2424);
    int _2462 = _2412 * int(_2420);
    int _2464 = _2462 + _2348;
    float _2466 = _2448 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _2468 = _792 > 0.5;
    float _2470 = float(uint(_2464));
    float _2472 = _1726 + _2466;
    float _2474 = trunc(_2442);
    float _2476 = precise::max(_2474, 0.0);
    uint _2478 = uint(_2476);
    int _2480 = _2446 * int(_2438);
    int _2482 = _2480 + _2370;
    float _2484 = as_type<float>(_2362) * _2470;
    int _2486 = ~_2334;
    int _2488 = _2486 + 1;
    float _2490 = float(uint(_2482));
    float _2492 = trunc(_2454);
    float _2494 = precise::max(_2492, 0.0);
    uint _2496 = uint(_2494);
    bool _2498 = _2460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2500 = as_type<float>(_2384) * _2490;
    float _2502 = trunc(_2484);
    float _2504 = precise::max(_2502, 0.0);
    uint _2506 = uint(_2504);
    int _2508 = _2452 * int(_2478);
    int _2510 = _2508 + _2404;
    float _2512 = float(uint(_2510));
    int _2514 = _2488 * int(_2496);
    int _2516 = _2514 + _2422;
    float _2518 = float(uint(_2516));
    bool _2520 = !_2498;
    float _2522 = _2472;
    float _2524 = _2406;
    float _2526 = _2408;
    float _2528 = _2352;
    float _2530 = _2354;
    if (!_2520)
    {
        float _2532 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2536 = _2460 + _2534;
        float _2538 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2540 = rsqrt(_2424);
        float _2542 = _2536 * _2532;
        float _2544 = _2542 * 0.15915493667125701904296875;
        float _2546 = _2544 * 6.283185482025146484375;
        float _2548 = sin(_2546);
        float _2550 = _2544 * 6.283185482025146484375;
        float _2552 = cos(_2550);
        float _2554 = fma(_2548, _2538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2556 = _2540 * _2554;
        float _2558 = _2552 + (-1.0);
        float _2560 = fma(_2394, _2556, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2562 = fma(_2398, _2556, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2564 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2568 = _2560 + _2566;
        float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2572 = _2562 + _2570;
        float _2574 = fma(_2472, _2552, _2564);
        float _2576 = _2568 * _2568;
        float _2578 = _2572 * _2572;
        _2522 = _2574;
        _2524 = _2576;
        _2526 = _2578;
        _2528 = _2560;
        _2530 = _2562;
    }
    float _2580 = _2522;
    float _2582 = _2524;
    float _2584 = _2526;
    float _2586 = _2528;
    float _2588 = _2530;
    float _2590 = trunc(_2500);
    float _2592 = precise::max(_2590, 0.0);
    uint _2594 = uint(_2592);
    float _2596 = as_type<float>(_2440) * _2518;
    float _2598 = as_type<float>(_2426) * _2512;
    float _2600 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2196);
    bool _2602 = !_2030;
    float _2604 = _2602 ? _255 : as_type<float>(_1298);
    float _2606 = _255 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2608 = -_255;
    int _2610 = _1910 ? as_type<int>(_2608) : as_type<int>(_255);
    float _2612 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2190);
    int _2614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2616 = _2614 != 0;
    float _2618 = trunc(_2596);
    float _2620 = precise::max(_2618, 0.0);
    uint _2622 = uint(_2620);
    float _2624 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2192);
    float _2626 = -_251;
    int _2628 = _2468 ? as_type<int>(_2626) : as_type<int>(_251);
    float _2630 = _251 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2632 = !_2616;
    float _2634 = _2632 ? _255 : as_type<float>(_2610);
    float _2636 = _2606 * _2180;
    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2640 = _2580 + _2638;
    bool _2642 = !_2034;
    float _2644 = _2642 ? _251 : as_type<float>(_2628);
    float _2646 = trunc(_2598);
    float _2648 = precise::max(_2646, 0.0);
    uint _2650 = uint(_2648);
    float _2652 = _2606 * _2178;
    float _2654 = fma(_2630, _2624, _2636);
    float _2656 = _2606 * _2204;
    float _2658 = fma(_2640, _2640, _2582);
    int _2660 = int(_2420) + int(_2506);
    float _2662 = -_149;
    float _2664 = fma(_2662, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1628);
    int _2666 = int(_2438) + int(_2594);
    float _2668 = _2658 + _2584;
    int _2670 = ~_2240;
    int _2672 = _2670 + 1;
    float _2674 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1930);
    int _2676 = ~_2270;
    int _2678 = _2676 + 1;
    float _2680 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1962);
    bool _2682 = !_1602;
    float _2684 = _2682 ? _251 : as_type<float>(_2458);
    float _2686 = fma(_2630, _2612, _2652);
    float _2688 = fma(_2630, _2600, _2656);
    int _2690 = ~_2334;
    int _2692 = _2690 + 1;
    int _2694 = _2672 * _2660;
    int _2696 = _2694 + _2348;
    int _2698 = int(_2496) + int(_2622);
    int _2700 = _2678 * _2666;
    int _2702 = _2700 + _2370;
    int _2704 = int(_2478) + int(_2650);
    float _2706 = -_2674;
    float _2708 = _2706 + 1.0;
    int _2710 = ~_2350;
    int _2712 = _2710 + 1;
    float _2714 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1902);
    float _2716 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1978);
    bool _2718 = uint(_2696) >= uint(_2240);
    int _2720 = _2712 * _2704;
    int _2722 = _2720 + _2404;
    bool _2724 = uint(_2702) >= uint(_2270);
    int _2726 = _2692 * _2698;
    int _2728 = _2726 + _2422;
    bool _2730 = !_2718;
    int _2732 = _2730 ? 0 : (-1);
    float _2734 = sqrt(_2668);
    bool _2736 = !_2724;
    int _2738 = _2736 ? 0 : (-1);
    float _2740 = -_2680;
    float _2742 = _2740 + 1.0;
    bool _2744 = uint(_2722) >= uint(_2350);
    out.m_76.x = _2612;
    out.m_76.y = _2624;
    out.m_76.z = _2600;
    int _2746 = ~_2660;
    int _2748 = _2746 + _2732;
    int _2750 = _2748 + 1;
    int _2752 = ~_2666;
    int _2754 = _2752 + _2738;
    int _2756 = _2754 + 1;
    float _2758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2760 = uint(_2728) >= uint(_2334);
    int _2762 = _2240 * _2750;
    int _2764 = _2762 + _2348;
    int _2766 = _2370 ^ _2270;
    int _2768 = _2270 * _2756;
    int _2770 = _2768 + _2370;
    bool _2772 = _2240 == 0;
    bool _2774 = _2240 == 0;
    int _2776 = _2348 ^ _2240;
    float _2778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2780 = !_2760;
    int _2782 = _2780 ? 0 : (-1);
    uint _2784 = uint(int(uint(_2766) >> uint(31)));
    bool _2786 = !_2744;
    int _2788 = _2786 ? 0 : (-1);
    int _2790 = ~_2782;
    int _2792 = _2698 + _2790;
    int _2794 = _2792 + 1;
    int _2796 = ~int(_2784);
    int _2798 = _2796 + 1;
    bool _2800 = _2270 == 0;
    bool _2802 = _2270 == 0;
    uint _2804 = uint(int(uint(_2776) >> uint(31)));
    bool _2806 = !_2772;
    int _2808 = _2806 ? _2764 : (-1);
    int _2810 = ~_2788;
    int _2812 = _2704 + _2810;
    int _2814 = _2812 + 1;
    float _2816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2818 = _2794 ^ _2798;
    int _2820 = ~int(_2804);
    int _2822 = _2820 + 1;
    float _2824 = _2758 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2826 = float(_2808);
    int _2828 = ~_2798;
    int _2830 = _2828 + _2818;
    int _2832 = _2830 + 1;
    float _2834 = fma(_2606, _2606, 1.0);
    int _2836 = _2814 ^ _2822;
    float _2838 = fma(_2824, _2826, _2664);
    float _2840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2842 = _2778 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2844 = ~_2822;
    int _2846 = _2844 + _2836;
    int _2848 = _2846 + 1;
    float _2850 = -_149;
    float _2852 = fma(_2850, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2000);
    bool _2854 = !_2800;
    int _2856 = _2854 ? _2770 : (-1);
    float _2858 = _2684 + 0.5;
    bool _2860 = !_2774;
    int _2862 = _2860 ? _2848 : (-1);
    float _2864 = _2816 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2866 = rsqrt(_2834);
    float _2868 = float(_2856);
    float _2870 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1652);
    float _2872 = float(_2862);
    float _2874 = fma(_2824, _2858, _2838);
    bool _2876 = !_2802;
    int _2878 = _2876 ? _2832 : (-1);
    float _2880 = fma(_2864, _2868, _2852);
    float _2882 = _2644 + 0.5;
    float _2884 = -_2870;
    float _2886 = fma(_2842, _2872, _2884);
    float _2888 = float(_2878);
    float _2890 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2020);
    float _2892 = _2840 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2894 = fma(_2864, _2882, _2880);
    float _2896 = _2634 + (-0.5);
    bool _2898 = _2734 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2900 = isnan(_2734);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2906 = _2902 || _2904;
    float _2908 = -_2890;
    float _2910 = fma(_2892, _2888, _2908);
    float _2912 = _2606 * _2866;
    float _2914 = -_2842;
    float _2916 = fma(_2914, _2896, _2886);
    float _2918 = _2604 + (-0.5);
    float _2920 = -_2390;
    float _2922 = _2912 * _2920;
    float _2924 = -_2386;
    float _2926 = _2912 * _2924;
    float _2928 = -_2382;
    float _2930 = _2912 * _2928;
    float _2932 = -_2892;
    float _2934 = fma(_2932, _2918, _2910);
    float _2936 = fma(_2866, _2204, _2922);
    float _2938 = fma(_2866, _2178, _2926);
    float _2940 = fma(_2866, _2180, _2930);
    float _2942 = _2382 + _2654;
    float _2944 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2946 = -_2708;
    float _2948 = fma(_2684, _2946, _2874);
    float _2950 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2952 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2954 = -_2714;
    float _2956 = _2954 + 1.0;
    float _2958 = -_2716;
    float _2960 = _2958 + 1.0;
    float _2962 = _2386 + _2686;
    float _2964 = _1992 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2966 = _2950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2968 = _2944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2970 = _2952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2972 = -_2742;
    float _2974 = fma(_2644, _2972, _2894);
    float _2976 = fma(_2634, _2956, _2916);
    float _2978 = fma(_2604, _2960, _2934);
    float _2980 = _2390 + _2688;
    out.m_78.x = _2966;
    out.m_78.y = _2968;
    out.m_78.z = _2970;
    out.m_78.w = _2964;
    float _2982 = _2716;
    float _2984 = _2978;
    float _2986 = _2974;
    float _2988 = _2894;
    float _2990 = _2930;
    float _2992 = _2644;
    if (!_2906)
    {
        _2982 = 1.0;
    }
    float _2994 = _2982;
    out.m_80.x = _2938;
    out.m_80.y = _2940;
    out.m_80.z = _2936;
    out.m_82.x = _2948;
    out.m_82.y = _2976;
    out.m_82.z = _2974;
    out.m_82.w = _2978;
    out.m_84.x = _2962;
    out.m_84.y = _2942;
    out.m_84.z = _2980;
    bool _2996 = !_2906;
    float _2998 = _2994;
    if (!_2996)
    {
        bool _3000 = _2734 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3002 = isnan(_2734);
        bool _3004 = _3000 || _3002;
        bool _3006 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3008 = _3004 || _3006;
        if (!_3008)
        {
            float _3010 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3012 = _2734 + _3010;
            float _3014 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3016 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3014;
            float _3018 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3020 = _3018 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3022 = 1.0 / _3016;
            float _3024 = _3012 * _3022;
            float _3026 = fma(_3024, _3020, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2998 = _3026;
            _3028 = true;
        }
        else
        {
            bool _3030 = _2734 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3032 = isnan(_2734);
            bool _3034 = _3030 || _3032;
            bool _3036 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3038 = _3034 || _3036;
            if (!_3038)
            {
                float _3040 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3042 = _2734 + _3040;
                float _3044 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3046 = _3044 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3048 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3050 = _3048 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3052 = 1.0 / _3046;
                float _3054 = _3042 * _3052;
                float _3056 = fma(_3054, _3050, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2998 = _3056;
                _3028 = true;
            }
            else
            {
                _2998 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3028 = false;
    float _3058 = _2998;
    float _3060 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3062 = _2580 + _3060;
    float _3064 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3066 = _2586 + _3064;
    float _3068 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3070 = _2588 + _3068;
    float _3072 = fma(_3062, _3058, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3074 = fma(_3066, _3058, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3076 = fma(_3070, _3058, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3078 = -_1726;
    float _3080 = _3078 + _3072;
    float _3082 = -_1640;
    float _3084 = _3082 + _3074;
    float _3086 = -_1722;
    float _3088 = _3086 + _3076;
    float _3090 = _3080 * _3080;
    float _3092 = fma(_3084, _3084, _3090);
    float _3094 = fma(_3088, _3088, _3092);
    float _3096 = sqrt(_3094);
    bool _3098 = _3096 > 0.0;
    bool _3100 = !_3098;
    float _3102 = _3096;
    float _3104 = _3072;
    float _3106 = _3074;
    float _3108 = _3076;
    if (!_3100)
    {
        bool _3110 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3112 = _2966;
        if (_3110)
        {
            float _3114 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3112 = _3114;
        }
        float _3116 = _3112;
        if (_3110)
        {
            float _3118 = _461 * _3116;
            _2984 = _3118;
        }
        float _3120 = _2984;
        float _3122 = _3120;
        if (_3110)
        {
            float _3124 = _463 * _3116;
            _2986 = _3124;
        }
        float _3126 = _2986;
        float _3128 = _3126;
        if (_3110)
        {
            float _3130 = _465 * _3116;
            _3102 = _3130;
        }
        float _3132 = _3102;
        float _3134 = _3132;
        if (!_3110)
        {
            bool _3136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _3138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _3140 = _3136 || _3138;
            bool _3142 = isnan(1.0);
            bool _3144 = _3140 || _3142;
            float _3146 = _149 + 1.0;
            float _3148 = _3146;
            if (!_3144)
            {
                float _3150 = _3146 * _3146;
                float _3152 = _3150 * 0.5;
                _469 = _3152;
            }
            float _3154 = _469;
            float _3156 = _3154;
            if (!_3144)
            {
                float _3158 = _3154 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3156 = _3158;
            }
            float _3160 = _3156;
            bool _3162 = !_3144;
            float _3164 = _3160;
            if (!_3162)
            {
                float _3166 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3168 = log2(_3166);
                float _3170 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3172 = _3170 + 1.0;
                float _3174 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3176 = _3168 * _3146;
                float _3178 = 1.0 / _3172;
                float _3180 = _3174 * 0.693147182464599609375;
                float _3182 = exp2(_3176);
                float _3184 = 1.0 / _3180;
                float _3186 = _3182 + (-1.0);
                float _3188 = -_3186;
                float _3190 = fma(_3188, _3184, _3146);
                float _3192 = _3190 * _3178;
                float _3194 = _3192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3164 = _3194;
            }
            float _3196 = _3164;
            float _3198 = _3196 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3200 = _3196 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3202 = !_3144;
            if (!_3202)
            {
                float _3204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3206 = log2(_3204);
                float _3208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3210 = _3208 + 1.0;
                float _3212 = 1.0 / _3210;
                float _3214 = _3206 * _3146;
                float _3216 = exp2(_3214);
                float _3218 = -_3216;
                float _3220 = _3218 + 1.0;
                float _3222 = _3220 * _3212;
                _3148 = _3222;
            }
            float _3224 = _3148;
            float _3226 = fma(_3224, _187, _3200);
            float _3228 = _3196 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3230 = fma(_3224, _185, _3198);
            float _3232 = -_423;
            float _3234 = _3232 + _3226;
            float _3236 = fma(_3224, _189, _3228);
            float _3238 = -_427;
            float _3240 = _3238 + _3230;
            float _3242 = _3234 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3244 = _3234 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3246 = _3234 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3248 = -_435;
            float _3250 = _3248 + _3236;
            float _3252 = fma(_3240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3242);
            float _3254 = fma(_3240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3244);
            float _3256 = fma(_3240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3246);
            float _3258 = fma(_3250, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3252);
            float _3260 = fma(_3250, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3254);
            float _3262 = fma(_3250, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3256);
            _471 = _3260;
            _473 = _3258;
            _475 = _3262;
            _3122 = _3258;
            _3128 = _3260;
            _3134 = _3262;
        }
        float _3264 = _471;
        float _3266 = _473;
        float _3268 = _475;
        float _3270 = _3122;
        float _3272 = _3128;
        float _3274 = _3134;
        float _3276 = _3264 * _3264;
        float _3278 = rsqrt(_3094);
        float _3280 = fma(_3266, _3266, _3276);
        float _3282 = fma(_3268, _3268, _3280);
        float _3284 = sqrt(_3282);
        float _3286 = _3080 * _3278;
        float _3288 = _3084 * _3278;
        float _3290 = _3088 * _3278;
        bool _3292 = _3284 > 0.0;
        bool _3294 = !_3292;
        if (!_3294)
        {
            float _3296 = rsqrt(_3282);
            float _3298 = _3296 * _3264;
            float _3300 = _3296 * _3266;
            float _3302 = _3296 * _3268;
            float _3304 = _3286 * _3298;
            float _3306 = fma(_3288, _3300, _3304);
            float _3308 = fma(_3290, _3302, _3306);
            float _3310 = _3308 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3312 = fma(_3270, _3310, _3074);
            float _3314 = fma(_3272, _3310, _3072);
            float _3316 = fma(_3274, _3310, _3076);
            _3104 = _3314;
            _3106 = _3312;
            _3108 = _3316;
        }
    }
    float _3318 = _3104;
    float _3320 = _3106;
    float _3322 = _3108;
    float _3324 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3326 = _3318 + _3324;
    float _3328 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3330 = _3320 + _3328;
    float _3332 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3334 = _3322 + _3332;
    float _3336 = _1726 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3338 = _3326 * _3326;
    float _3340 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3336);
    float _3342 = fma(_3330, _3330, _3338);
    float _3344 = fma(_3334, _3334, _3342);
    float _3346 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3340);
    float _3348 = _1726 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3350 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3352 = rsqrt(_3344);
    float _3354 = _3346 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3356 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3348);
    float _3358 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3356);
    float _3360 = 1.0 / _3354;
    float _3362 = _3358 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3364 = _3362 + _3354;
    float _3366 = _3352 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3368 = floor(_3350);
    float _3370 = _3330 * _3366;
    float _3372 = _3334 * _3366;
    float _3374 = _3370 * _3370;
    float _3376 = _3372 * _3372;
    float _3378 = _3364 * _3360;
    float _3380 = _3378 * 0.5;
    float _3382 = sqrt(_3344);
    float _3384 = _3374 + _3376;
    float _3386 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3388 = fma(_3380, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3386);
    float _3390 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _3392 = -_3368;
    float _3394 = _3350 + _3392;
    float _3396 = sqrt(_3384);
    float _3398 = _1726 + _3390;
    float _3400 = _3398 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3402 = _3398 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3404 = 1.0 / _3388;
    float _3406 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3400);
    float _3408 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3402);
    float _3410 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3406);
    float _3412 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3408);
    bool _3414 = _3396 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3418 = _3396 + _3416;
    float _3420 = _3410 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3422 = _3412 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _3424 = trunc(_3420);
    int _3426 = int(_3424);
    float _3428 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3430 = _3404 * _3428;
    float _3432 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _3434 = _3430 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3436 = _3094;
    int _3438 = 2;
    float _3440 = _3418;
    float _3442 = _3384;
    float _3444 = _3372;
    float _3446 = _3368;
    float _3448 = _3370;
    if (_3414)
    {
        float _3450 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3436 = _3450;
    }
    float _3452 = _3436;
    bool _3454 = _3430 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3456 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3458 = trunc(_3422);
    int _3460 = int(_3458);
    int _3462 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3464 = _3426 + _3462;
    int _3466 = _3464 + 1;
    float _3468 = _3456;
    if (!_3434)
    {
        _3438 = 1;
    }
    int _3470 = _3438;
    int _3472 = _3470;
    if (_3414)
    {
        float _3474 = _3418 * _3452;
        _3440 = _3474;
    }
    float _3476 = _3440;
    if (_3414)
    {
        float _3478 = rsqrt(_3384);
        _3442 = _3478;
    }
    float _3480 = _3442;
    float _3482 = _3480;
    if (_3414)
    {
        float _3484 = _3476 * 0.15915493667125701904296875;
        _2988 = _3484;
    }
    float _3486 = _2988;
    bool _3488 = !_3434;
    int _3490 = _3488 ? 0 : 1;
    int _3492 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3494 = _3460 + _3492;
    int _3496 = _3494 + 1;
    float _3498 = _3396;
    if (_3414)
    {
        float _3500 = _3486 * 6.283185482025146484375;
        float _3502 = sin(_3500);
        _3498 = _3502;
    }
    float _3504 = _3498;
    if (!_3454)
    {
        _3472 = _3490;
    }
    int _3506 = _3472;
    float _3508 = precise::max(0.0, _3456);
    int _3510 = _3506 << 6;
    bool _3512 = _3466 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _3514 = -_3366;
    float _3516 = -_3508;
    float _3518 = fma(_3326, _3514, _3516);
    int _3520 = _3510 + 48;
    uint _3522 = uint(int(uint(_3520) >> uint(2)));
    uint _3524 = uint(int(uint(int(_3522)) >> uint(2)));
    int _3526 = int(_3522) & 3;
    float _3528 = (*spvDescriptorSet0.vp_c15)._m0[int(_3524)][_3526];
    int _3530 = int(_3522) + 1;
    uint _3532 = uint(int(uint(_3530) >> uint(2)));
    int _3534 = _3530 & 3;
    float _3536 = (*spvDescriptorSet0.vp_c15)._m0[int(_3532)][_3534];
    int _3538 = _3466 | _3496;
    float _3540 = _3486;
    if (_3414)
    {
        float _3542 = _3486 * 6.283185482025146484375;
        float _3544 = cos(_3542);
        _3540 = _3544;
    }
    float _3546 = _3540;
    if (_3414)
    {
        float _3548 = _3518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3468 = _3548;
    }
    float _3550 = _3468;
    float _3552 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _3554 = _3538 < 0;
    bool _3556 = _3554 || _3512;
    float _3558 = _3550;
    if (_3414)
    {
        float _3560 = fma(_3504, _3550, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3558 = _3560;
    }
    float _3562 = _3558;
    int _3564 = _3510 + 64;
    uint _3566 = uint(int(uint(_3564) >> uint(2)));
    uint _3568 = uint(int(uint(int(_3566)) >> uint(2)));
    int _3570 = int(_3566) & 3;
    float _3572 = (*spvDescriptorSet0.vp_c15)._m0[int(_3568)][_3570];
    int _3574 = int(_3566) + 1;
    uint _3576 = uint(int(uint(_3574) >> uint(2)));
    int _3578 = _3574 & 3;
    float _3580 = (*spvDescriptorSet0.vp_c15)._m0[int(_3576)][_3578];
    bool _3582 = _3496 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3584 = _3582 || _3556;
    float _3586 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3552);
    if (_3414)
    {
        float _3588 = _3480 * _3562;
        _2990 = _3588;
    }
    float _3590 = _2990;
    if (!_3414)
    {
        _3482 = _3518;
    }
    float _3592 = _3482;
    float _3594 = floor(_3432);
    float _3596 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3586);
    float _3598 = _3592;
    if (_3414)
    {
        float _3600 = _3372 * _3590;
        _3444 = _3600;
    }
    float _3602 = _3444;
    int _3604 = _3510 + 96;
    uint _3606 = uint(int(uint(_3604) >> uint(2)));
    uint _3608 = uint(int(uint(int(_3606)) >> uint(2)));
    int _3610 = int(_3606) & 3;
    float _3612 = (*spvDescriptorSet0.vp_c15)._m0[int(_3608)][_3610];
    int _3614 = int(_3606) + 1;
    uint _3616 = uint(int(uint(_3614) >> uint(2)));
    int _3618 = _3614 & 3;
    float _3620 = (*spvDescriptorSet0.vp_c15)._m0[int(_3616)][_3618];
    float _3622 = _3546;
    if (_3414)
    {
        float _3624 = _3546 + (-1.0);
        _3446 = _3624;
    }
    float _3626 = _3446;
    float _3628 = _3626;
    if (_3414)
    {
        float _3630 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2992 = _3630;
    }
    float _3632 = _2992;
    if (!_3414)
    {
        _3628 = _3370;
    }
    float _3634 = _3628;
    int _3636 = _3510 + 104;
    uint _3638 = uint(int(uint(_3636) >> uint(2)));
    uint _3640 = uint(int(uint(int(_3638)) >> uint(2)));
    int _3642 = int(_3638) & 3;
    float _3644 = (*spvDescriptorSet0.vp_c15)._m0[int(_3640)][_3642];
    int _3646 = int(_3638) + 1;
    uint _3648 = uint(int(uint(_3646) >> uint(2)));
    int _3650 = _3646 & 3;
    float _3652 = (*spvDescriptorSet0.vp_c15)._m0[int(_3648)][_3650];
    float _3654 = _2916;
    float _3656 = _3634;
    if (!_3584)
    {
        float _3658 = floor(_3422);
        _3654 = _3658;
    }
    float _3660 = _3654;
    if (_3414)
    {
        float _3662 = _3370 * _3590;
        _3656 = _3662;
    }
    float _3664 = _3656;
    if (!_3414)
    {
        _3448 = _3374;
    }
    float _3666 = _3448;
    float _3668 = _3596 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3670 = _3666;
    if (_3414)
    {
        float _3672 = fma(_3518, _3546, _3632);
        _3598 = _3672;
    }
    float _3674 = _3598;
    if (_3414)
    {
        float _3676 = _3664 * _3664;
        _3670 = _3676;
    }
    float _3678 = _3670;
    if (!_3414)
    {
        _3622 = _3376;
    }
    float _3680 = _3622;
    int _3682 = _3510 + 80;
    uint _3684 = uint(int(uint(_3682) >> uint(2)));
    uint _3686 = uint(int(uint(int(_3684)) >> uint(2)));
    int _3688 = int(_3684) & 3;
    float _3690 = (*spvDescriptorSet0.vp_c15)._m0[int(_3686)][_3688];
    int _3692 = int(_3684) + 1;
    uint _3694 = uint(int(uint(_3692) >> uint(2)));
    int _3696 = _3692 & 3;
    float _3698 = (*spvDescriptorSet0.vp_c15)._m0[int(_3694)][_3696];
    float _3700 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3702 = _3668 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3704 = _3680;
    int _3706 = as_type<int>(_3700);
    if (_3414)
    {
        float _3708 = _3602 * _3602;
        _3704 = _3708;
    }
    float _3710 = _3704;
    float _3712 = fma(_3674, _3674, _3678);
    float _3714 = -_3594;
    float _3716 = _3432 + _3714;
    float _3718 = -_3702;
    float _3720 = fma(_3718, _3700, 1.0);
    float _3722 = _3720;
    if (!_3584)
    {
        int _3724 = _3496 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3726 = _3724 + _3466;
        _3706 = _3726;
    }
    int _3728 = _3706;
    int _3730 = _3510 + 56;
    uint _3732 = uint(int(uint(_3730) >> uint(2)));
    uint _3734 = uint(int(uint(int(_3732)) >> uint(2)));
    int _3736 = int(_3732) & 3;
    float _3738 = (*spvDescriptorSet0.vp_c15)._m0[int(_3734)][_3736];
    int _3740 = int(_3732) + 1;
    uint _3742 = uint(int(uint(_3740) >> uint(2)));
    int _3744 = _3740 & 3;
    float _3746 = (*spvDescriptorSet0.vp_c15)._m0[int(_3742)][_3744];
    float _3748 = _3712 + _3710;
    float _3750 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3752 = fma(_3382, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3750);
    float _3754 = precise::clamp(_3752, 0.0, 1.0);
    int _3756 = _3510 + 72;
    uint _3758 = uint(int(uint(_3756) >> uint(2)));
    uint _3760 = uint(int(uint(int(_3758)) >> uint(2)));
    int _3762 = int(_3758) & 3;
    float _3764 = (*spvDescriptorSet0.vp_c15)._m0[int(_3760)][_3762];
    int _3766 = int(_3758) + 1;
    uint _3768 = uint(int(uint(_3766) >> uint(2)));
    int _3770 = _3766 & 3;
    float _3772 = (*spvDescriptorSet0.vp_c15)._m0[int(_3768)][_3770];
    float _3774 = _3398 * _3536;
    float _3776 = fma(_1640, _3528, _3774);
    int _3778 = as_type<int>(_3774);
    if (!_3584)
    {
        int _3780 = _3728 << 2;
        _3778 = _3780;
    }
    int _3782 = _3778;
    int _3784 = _3510 + 88;
    uint _3786 = uint(int(uint(_3784) >> uint(2)));
    uint _3788 = uint(int(uint(int(_3786)) >> uint(2)));
    int _3790 = int(_3786) & 3;
    float _3792 = (*spvDescriptorSet0.vp_c15)._m0[int(_3788)][_3790];
    int _3794 = int(_3786) + 1;
    uint _3796 = uint(int(uint(_3794) >> uint(2)));
    int _3798 = _3794 & 3;
    float _3800 = (*spvDescriptorSet0.vp_c15)._m0[int(_3796)][_3798];
    float _3802 = _3398 * _3580;
    float _3804 = _3580;
    int _3806 = _3782;
    if (!_3584)
    {
        float _3808 = -_3660;
        float _3810 = _3422 + _3808;
        _3804 = _3810;
    }
    float _3812 = _3804;
    if (!_3584)
    {
        int _3814 = 12 & _3782;
        _3806 = _3814;
    }
    int _3816 = _3806;
    float _3818 = rsqrt(_3748);
    float _3820 = fma(_1640, _3572, _3802);
    float _3822 = _3398 * _3620;
    float _3824 = fma(_1640, _3612, _3822);
    float _3826 = -_3754;
    float _3828 = _3826 + 1.0;
    float _3830 = fma(_1722, _3644, _3824);
    float _3832 = abs(_3828);
    float _3834 = log2(_3832);
    float _3836 = _3830 + _3652;
    float _3838 = _3818 * _3664;
    float _3840 = _3818 * _3674;
    float _3842 = _3818 * _3602;
    float _3844 = _3398 * _3698;
    int _3846 = as_type<int>(_3698);
    int _3848 = _3816;
    if (!_3584)
    {
        uint _3850 = uint(int(uint(_3728) >> uint(2)));
        _3846 = int(_3850);
    }
    int _3852 = _3846;
    float _3854 = _3838 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3856 = 1.0 / _3836;
    float _3858 = fma(_1640, _3690, _3844);
    if (!_3584)
    {
        int _3860 = _3852 << 4;
        int _3862 = _3860 + _3816;
        _3848 = _3862;
    }
    int _3864 = _3848;
    float _3866 = -_3854;
    float _3868 = fma(_3840, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3866);
    float _3870 = fma(_1722, _3738, _3776);
    float _3872 = _3854;
    if (!_3584)
    {
        int _3874 = _3864 + 400;
        uint _3876 = uint(int(uint(_3874) >> uint(2)));
        uint _3878 = uint(int(uint(int(_3876)) >> uint(2)));
        int _3880 = int(_3876) & 3;
        float _3882 = (*spvDescriptorSet0.vp_c15)._m0[int(_3878)][_3880];
        _3872 = _3882;
    }
    float _3884 = _3872;
    float _3886 = _3870 + _3746;
    float _3888 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3890 = fma(_1722, _3764, _3820);
    float _3892 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3888);
    float _3894 = -_3842;
    float _3896 = fma(_3894, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3868);
    float _3898 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3900 = _3890 + _3772;
    float _3902 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3904 = _3834 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3906 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3898);
    float _3908 = fma(_1722, _3792, _3858);
    float _3910 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3902);
    float _3912 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3892);
    float _3914 = _3886 * _3856;
    float _3916 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3906);
    float _3918 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3910);
    float _3920 = _3912 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3922 = exp2(_3904);
    bool _3924 = _3914 >= 0.0;
    float _3926 = _3918 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3928 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3930 = fma(_3896, -0.5, 0.5);
    bool _3932 = _3914 <= 1.0;
    bool _3934 = _3932 && _3924;
    float _3936 = fma(_3896, 0.5, 0.5);
    float _3938 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3928);
    float _3940 = _3900 * _3856;
    float _3942 = _3916 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3944 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3938);
    float _3946 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3948 = _3940 >= 0.0;
    bool _3950 = _3948 && _3934;
    float _3952 = fma(_3936, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3954 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3944);
    float _3956 = sqrt(_3930);
    bool _3958 = _3940 <= 1.0;
    bool _3960 = _3958 && _3950;
    float _3962 = fma(_3936, _3952, -0.212114393711090087890625);
    float _3964 = _3908 + _3800;
    float _3966 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3968 = _3840 + 1.0;
    float _3970 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3946);
    float _3972 = fma(_3936, _3962, 1.570728778839111328125);
    float _3974 = 1.0 / _3954;
    float _3976 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3966);
    float _3978 = -_3840;
    float _3980 = fma(_3922, _3968, _3978);
    float _3982 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3970);
    float _3984 = _3964 * _3856;
    float _3986 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3976);
    float _3988 = _3936;
    float _3990 = _3954;
    if (_3960)
    {
        float _3992 = float(_3506);
        _3988 = _3992;
    }
    float _3994 = _3988;
    float _3996 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3982);
    float _3998 = log2(_3720);
    float _4000 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3986);
    float _4002 = _3956 * 0.636619746685028076171875;
    float2 _10564 = float2(_3394, _3716);
    float _4004 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10564, float2(0.0), isnan(_10564)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10564, float2(0.0), isnan(_10564)), level(0.0)).x;
    float _4006 = fma(_3980, 0.5, 0.5);
    float _4008 = -_3972;
    float _4010 = fma(_4002, _4008, 1.0);
    float _4012 = _3904;
    if (!_3584)
    {
        float _4014 = floor(_3420);
        _4012 = _4014;
    }
    float _4016 = _4012;
    float _4018 = _3996 * _3974;
    float _4020 = _4000 * _3974;
    float _4022 = fma(_4018, 0.5, 0.5);
    float _4024 = fma(_4020, -0.5, 0.5);
    float _4026 = _3970;
    if (_3960)
    {
        float _4028 = rint(_3994);
        float _4030 = precise::max(_4028, 0.0);
        uint _4032 = uint(_4030);
        uint _4034 = clamp(_4032, 0u, 65535u);
        _4026 = as_type<float>(_4034);
    }
    float _4036 = _4026;
    float _4038 = _3998 * 0.693147182464599609375;
    float _4040 = _4038 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4042 = _3884;
    if (!_3584)
    {
        float _4044 = rint(_3884);
        float _4046 = precise::max(_4044, 0.0);
        uint _4048 = uint(_4046);
        uint _4050 = clamp(_4048, 0u, 65535u);
        _4042 = as_type<float>(_4050);
    }
    float _4052 = _4042;
    if (!_3584)
    {
        float _4054 = -_4016;
        float _4056 = _3420 + _4054;
        _3722 = _4056;
    }
    float _4058 = _3722;
    float _4060 = _3922;
    if (_3960)
    {
        float3 _10656 = float3(_3914, _3940, float(as_type<int>(_4036)));
        float3 _10660 = select(_10656, float3(0.0), isnan(_10656));
        float _4062 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _10660.xy, uint(rint(_10660.z)), _3984, level(0.0));
        _4060 = _4062;
    }
    float _4064 = _4060;
    float3 _10670 = float3(_4022, _4024, _4040);
    float _4066 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10670, float3(0.0), isnan(_10670)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10670, float3(0.0), isnan(_10670)), level(0.0)).x;
    float3 _10679 = float3(_4022, _4024, _4040);
    float4 _4069 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10679, float3(0.0), isnan(_10679)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10679, float3(0.0), isnan(_10679)), level(0.0)).xyzw;
    float _4071 = _4069.x;
    float _4073 = _4069.y;
    float _4075 = _4069.z;
    float _4077 = _4069.w;
    float2 _10695 = float2(_4010, _4006);
    float3 _4081 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10695, float2(0.0), isnan(_10695)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10695, float2(0.0), isnan(_10695)), level(0.0)).xyz;
    float _4083 = _4081.x;
    float _4085 = _4081.y;
    float _4087 = _4081.z;
    float _4089 = _3812;
    if (!_3584)
    {
        float3 _10716 = float3(_4058, _3812, float(as_type<int>(_4052)));
        float3 _10718 = select(_10716, float3(0.0), isnan(_10716));
        float _4091 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _10718.xy, uint(rint(_10718.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _10718.xy, uint(rint(_10718.z)), level(0.0)).x;
        _4089 = _4091;
    }
    float _4093 = _4089;
    float _4095 = abs(_3430);
    float _4097 = log2(_4095);
    float _4099 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4101 = _3834 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4103 = fma(_3926, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4099);
    float _4105 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4103);
    float _4107 = exp2(_4101);
    bool _4109 = _3430 <= 8000.0;
    bool _4111 = isnan(_3430);
    bool _4113 = _4109 || _4111;
    bool _4115 = isnan(8000.0);
    bool _4117 = _4113 || _4115;
    float _4119 = float(_4117);
    float _4121 = fma(_3942, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4105);
    float _4123 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3996;
    out.gl_Position.y = _4000;
    out.gl_Position.z = _4121;
    out.gl_Position.w = _3954;
    float _4125 = exp2(_4123);
    float _4127 = _3996;
    if (_3584)
    {
        _4127 = 1.0;
    }
    float _4129 = _4127;
    float _4131 = fma(_4125, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4133 = precise::clamp(_4131, 0.0, 1.0);
    float _4135 = fma(_4133, -2.0, 3.0);
    float _4137 = _4133 * _4133;
    float _4139 = _4137 * _4135;
    float _4141 = _4121 + _3954;
    float _4143 = _4141 * 0.5;
    float _4145 = -_4139;
    float _4147 = _4145 + 1.0;
    out.m_86.z = _4143;
    out.m_86.w = _3954;
    float _4149 = fma(_4147, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4139);
    float _4151 = -_4107;
    float _4153 = _4151 + 1.0;
    float _4155 = _4119 * _4149;
    float _4157 = _4153 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4159 = _4155 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4161 = _4155;
    float _4163 = _4129;
    if (!_3960)
    {
        _4161 = 1.0;
    }
    float _4165 = _4161;
    float _4167 = -_4004;
    float _4169 = _4167 + 1.0;
    float _4171 = _4169 * _4159;
    float _4173 = precise::clamp(_4171, 0.0, 1.0);
    float _4175 = _4165;
    float _4177 = _4173;
    if (_3960)
    {
        bool _4179 = _4064 >= _3984;
        bool _4181 = isnan(_4064);
        bool _4183 = _4179 || _4181;
        bool _4185 = isnan(_3984);
        bool _4187 = _4183 || _4185;
        float _4189 = float(_4187);
        _4175 = _4189;
    }
    float _4191 = _4175;
    if (!_3584)
    {
        int _4193 = _3728 << 4;
        int _4195 = _4193 + 2048;
        uint _4197 = uint(int(uint(_4195) >> uint(2)));
        uint _4199 = uint(int(uint(int(_4197)) >> uint(2)));
        int _4201 = int(_4197) & 3;
        float _4203 = (*spvDescriptorSet0.vp_c15)._m0[int(_4199)][_4201];
        int _4205 = int(_4197) + 1;
        uint _4207 = uint(int(uint(_4205) >> uint(2)));
        int _4209 = _4205 & 3;
        float _4211 = (*spvDescriptorSet0.vp_c15)._m0[int(_4207)][_4209];
        int _4213 = _4195 + 8;
        uint _4215 = uint(int(uint(_4213) >> uint(2)));
        uint _4217 = uint(int(uint(int(_4215)) >> uint(2)));
        int _4219 = int(_4215) & 3;
        float _4221 = (*spvDescriptorSet0.vp_c15)._m0[int(_4217)][_4219];
        int _4223 = int(_4215) + 1;
        uint _4225 = uint(int(uint(_4223) >> uint(2)));
        int _4227 = _4223 & 3;
        float _4229 = (*spvDescriptorSet0.vp_c15)._m0[int(_4225)][_4227];
        float _4231 = _3398 * _4211;
        float _4233 = fma(_1640, _4203, _4231);
        float _4235 = fma(_1722, _4221, _4233);
        float _4237 = _4235 + _4229;
        float _4239 = precise::clamp(_4237, 0.0, 1.0);
        float _4241 = -_4239;
        float _4243 = _4241 + _4093;
        float _4245 = fma(_4243, 500.0, 1.5);
        float _4247 = exp2(_4245);
        float _4249 = 0.0 + _4247;
        float _4251 = precise::clamp(_4249, 0.0, 1.0);
        _4163 = _4251;
        _3990 = _4229;
    }
    float _4253 = _4163;
    float _4255 = _3990;
    float _4257 = _4157 * _4066;
    float _4259 = _4191 * _4253;
    float _4261 = -_4173;
    float _4263 = fma(_4261, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4265 = -_4157;
    float _4267 = _4265 + 1.0;
    float _4269 = _4077 * _4257;
    float _4271 = _4087 * _4257;
    float _4273 = -_4259;
    float _4275 = fma(_4273, _4263, 1.0);
    float _4277 = precise::clamp(_4275, 0.0, 1.0);
    out.m_88.x = _3320;
    out.m_88.y = _3318;
    out.m_88.z = _3322;
    float _4279 = fma(_4083, _4269, _4071);
    float _4281 = fma(_4085, _4269, _4073);
    float _4283 = _4077 * _4267;
    float _4285 = _4277 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4287 = fma(_4077, _4271, _4075);
    bool _4289 = _3382 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4291 = isnan(_3382);
    bool _4293 = _4289 || _4291;
    bool _4295 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4297 = _4293 || _4295;
    out.m_90.x = _4285;
    out.m_92.x = _4279;
    out.m_92.y = _4281;
    out.m_92.z = _4287;
    out.m_92.w = _4283;
    float _4299 = _4263;
    float _4301 = _4255;
    float _4303 = _4267;
    float _4305 = _4269;
    float _4307 = _4277;
    if (!_4297)
    {
        _4299 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4309 = _4299;
    float _4311 = _4309;
    float _4313 = _4309;
    if (!_4297)
    {
        _4177 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4315 = _4177;
    float _4317 = _4315;
    float _4319 = _4315;
    if (!_4297)
    {
        _4301 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4321 = _4301;
    float _4323 = _4321;
    float _4325 = _4321;
    if (!_4297)
    {
        _4303 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4327 = _4303;
    float _4329 = _4327;
    float _4331 = _4327;
    if (!_4297)
    {
        _4305 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4333 = _4305;
    float _4335 = _4333;
    float _4337 = _4333;
    if (!_4297)
    {
        _4307 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4339 = _4307;
    bool _4341 = !_4297;
    float _4343 = _4339;
    float _4345 = _4339;
    if (!_4341)
    {
        bool _4347 = _3382 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4349 = isnan(_3382);
        bool _4351 = _4347 || _4349;
        bool _4353 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4355 = _4351 || _4353;
        if (!_4355)
        {
            float _4357 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4359 = _3382 + _4357;
            float _4361 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4363 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4361;
            float _4365 = 1.0 / _4363;
            float _4367 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4369 = _4367 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4371 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4373 = _4371 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4375 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4377 = _4375 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4379 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4381 = _4379 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4383 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4385 = _4383 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4387 = _4359 * _4365;
            float _4389 = precise::clamp(_4387, 0.0, 1.0);
            float _4391 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4393 = _4391 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4395 = fma(_4389, _4369, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4397 = fma(_4389, _4393, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4399 = fma(_4389, _4373, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4401 = fma(_4389, _4377, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4403 = fma(_4389, _4381, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4405 = fma(_4389, _4385, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4319 = _4397;
            _4337 = _4403;
            _4313 = _4395;
            _4331 = _4401;
            _4325 = _4399;
            _4345 = _4405;
            _4407 = true;
        }
        else
        {
            bool _4409 = _3382 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4411 = isnan(_3382);
            bool _4413 = _4409 || _4411;
            bool _4415 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4417 = _4413 || _4415;
            if (!_4417)
            {
                _4311 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4419 = _4311;
            _4313 = _4419;
            if (!_4417)
            {
                _4317 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4421 = _4317;
            _4319 = _4421;
            if (!_4417)
            {
                _4323 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4423 = _4323;
            _4325 = _4423;
            if (!_4417)
            {
                _4329 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4425 = _4329;
            _4331 = _4425;
            if (!_4417)
            {
                _4335 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4427 = _4335;
            _4337 = _4427;
            if (!_4417)
            {
                _4343 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4429 = _4343;
            bool _4431 = !_4417;
            _4345 = _4429;
            if (!_4431)
            {
                bool _4433 = _3382 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4435 = isnan(_3382);
                bool _4437 = _4433 || _4435;
                bool _4439 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4441 = _4437 || _4439;
                if (!_4441)
                {
                    float _4443 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4445 = _3382 + _4443;
                    float _4447 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4449 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4447;
                    float _4451 = 1.0 / _4449;
                    float _4453 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4455 = _4453 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4457 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4459 = _4457 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4461 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4463 = _4461 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4465 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4467 = _4465 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4469 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4471 = _4469 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4473 = _4445 * _4451;
                    float _4475 = precise::clamp(_4473, 0.0, 1.0);
                    float _4477 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4479 = _4477 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4481 = fma(_4475, _4455, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4483 = fma(_4475, _4479, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4485 = fma(_4475, _4459, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4487 = fma(_4475, _4463, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4489 = fma(_4475, _4467, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4491 = fma(_4475, _4471, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4319 = _4483;
                    _4337 = _4489;
                    _4313 = _4481;
                    _4331 = _4487;
                    _4325 = _4485;
                    _4345 = _4491;
                    _4407 = true;
                }
                else
                {
                    _4319 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4337 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4313 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4331 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4325 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4345 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4407 = false;
    float _4493 = _4319;
    float _4495 = _4337;
    float _4497 = _4313;
    float _4499 = _4331;
    float _4501 = _4325;
    float _4503 = _4345;
    float _4505 = fma(_2942, -0.5, 0.5);
    float _4507 = precise::clamp(_4505, 0.0, 1.0);
    float _4509 = -_4493;
    float _4511 = _4509 + _4495;
    float _4513 = -_4497;
    float _4515 = _4513 + _4499;
    float _4517 = -_4501;
    float _4519 = _4517 + _4503;
    bool _4521 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4523 = fma(_4507, _4511, _4493);
    float _4525 = fma(_4507, _4515, _4497);
    float _4527 = fma(_4507, _4519, _4501);
    float _4529 = _4523 * 0.586610972881317138671875;
    out.m_94.x = 0.0;
    float _4531 = fma(_4525, 0.298911988735198974609375, _4529);
    float _4533 = fma(_4527, 0.114477999508380889892578125, _4531);
    float _4535 = -_4533;
    float _4537 = _4525 + _4535;
    float _4539 = -_4533;
    float _4541 = _4523 + _4539;
    float _4543 = -_4533;
    float _4545 = _4527 + _4543;
    float _4547 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4549 = fma(_4537, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4533);
    float _4551 = fma(_4541, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4533);
    float _4553 = fma(_4545, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4533);
    out.m_61.x = _4547;
    out.m_96.x = _4549;
    out.m_96.y = _4551;
    out.m_96.z = _4553;
    if (!_4521)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4555 = -_3318;
    float _4557 = _4555 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4559 = -_3320;
    float _4561 = _4559 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4563 = -_3322;
    float _4565 = _4563 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4567 = _4557 * _4557;
    float _4569 = fma(_4561, _4561, _4567);
    float _4571 = fma(_4565, _4565, _4569);
    float _4573 = sqrt(_4571);
    float _4575 = rsqrt(_4571);
    float _4577 = -_4573;
    float _4579 = _4577 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4581 = _4579 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4583 = precise::clamp(_4581, 0.0, 1.0);
    float _4585 = _4561 * _4575;
    float _4587 = _4557 * _4575;
    float _4589 = abs(_4583);
    float _4591 = log2(_4589);
    float _4593 = _4565 * _4575;
    float _4595 = _4585 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4597 = _2942 * _4587;
    float _4599 = -_4587;
    float _4601 = -_4595;
    float _4603 = fma(_4599, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4601);
    float _4605 = fma(_2962, _4585, _4597);
    float _4607 = -_4593;
    float _4609 = fma(_4607, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4603);
    float _4611 = fma(_2980, _4593, _4605);
    float _4613 = precise::clamp(_4611, 0.0, 1.0);
    float _4615 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4617 = _4609 + _4615;
    float _4619 = _4591 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4621 = _4617 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4623 = precise::clamp(_4621, 0.0, 1.0);
    float _4625 = exp2(_4619);
    float _4627 = _4625 * _4623;
    float _4629 = _4613 * _4627;
    float _4631 = _4629 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4633 = _4629 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4635 = _4629 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _4631;
    out.m_94.y = _4633;
    out.m_94.z = _4635;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

